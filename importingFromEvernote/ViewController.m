//
//  ViewController.m
//  importingFromEvernote
//
//  Created by Zulfat on 14.01.14.
//  Copyright (c) 2014 Zulfat. All rights reserved.
//

#import "ViewController.h"
#import "EvernoteSession.h"
#import "ENConstants.h"
#import "ViewController.h"
#import "EvernoteUserStore.h"
#import "NSDate+EDAMAdditions.h"
#import "EvernoteNoteStore.h"
#import "ENMLUtility.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)getData:(id)sender {
    NSString *EVERNOTE_HOST = BootstrapServerBaseURLStringSandbox;
    NSString *CONSUMER_KEY = @"zulfat";
    NSString *CONSUMER_SECRET = @"7397166b8cd0d936";
    
    [EvernoteSession setSharedSessionHost:EVERNOTE_HOST
                              consumerKey:CONSUMER_KEY
                           consumerSecret:CONSUMER_SECRET];
    EvernoteSession *session = [EvernoteSession sharedSession];
    NSLog(@"Session host: %@", [session host]);
    NSLog(@"Session key: %@", [session consumerKey]);
    NSLog(@"Session secret: %@", [session consumerSecret]);
    [[EvernoteSession sharedSession] handleDidBecomeActive];
    [session authenticateWithViewController:self completionHandler:^(NSError *error) {
        if (error || !session.isAuthenticated){
            if (error) {
                NSLog(@"Error authenticating with Evernote Cloud API: %@", error);
            }
            if (!session.isAuthenticated) {
                NSLog(@"Session not authenticated");
            }
        } else {
            // We're authenticated!
            EvernoteUserStore *userStore = [EvernoteUserStore userStore];
            [userStore getUserWithSuccess:^(EDAMUser *user) {
                // success
                NSLog(@"Authenticated as %@", [user username]);
            } failure:^(NSError *error) {
                // failure
                NSLog(@"Error getting user: %@", error);
            } ];
            EvernoteNoteStore* noteStore = [EvernoteNoteStore noteStore];// хранилище заметок
            [noteStore listNotebooksWithSuccess:^(NSArray *notebooks) {// получаем лист заметок
                EDAMNoteFilter* filter = [[EDAMNoteFilter alloc] init];
                for (EDAMNotebook* notebook in notebooks) {
                    [filter setNotebookGuid:[notebook guid]];
                    [noteStore findNotesWithFilter:filter offset:0 maxNotes:200 success:^(EDAMNoteList *list) {
                        NSMutableDictionary* SPnote = [[NSMutableDictionary alloc] init];
                        NSArray* notesArray = [list notes];
                        NSDictionary* attributesDictionary ;
                        NSDate *k ;
                        
                        
                        for (EDAMNote* note in notesArray) {
                          // заполнение SPnote
                        }
                    } failure:^(NSError *error) {
                        
                    }];
                }
            } failure:^(NSError *error) {
                
            }];
            
         
        }
    }];
        //[session logout];
}
@end
