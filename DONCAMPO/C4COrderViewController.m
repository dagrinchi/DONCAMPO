//
//  C4COrderViewController.m
//  DONCAMPO
//
//  Created by David Almeciga on 6/1/14.
//  Copyright (c) 2014 David Almeciga. All rights reserved.
//

#import "C4COrderViewController.h"

@interface C4COrderViewController ()

@end

@implementation C4COrderViewController

@synthesize nameTxt;
@synthesize phoneTxt;
@synthesize qtyTxt;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)AceptBtn:(id)sender {
    
    NSString *urlWithParameters = [NSString stringWithFormat:@"http://200.31.80.34/Bolsa_Mensajes/AgroNet/CGI/ReceiverSMSFormulario.php?to=85050&operador=%@&mensaje=%@&movil=%@&idmessage=11111111&concat=0", @"1", [NSString stringWithFormat:@"Bueeenas_DON_%@_Tu_pedido_%@_LIB_de_Sandia_Baby_Numero_4_se_guardo_exitosamente_por_favor_espere_a_ser_contactado_por_el_productor_Nos_vemos", nameTxt.text, qtyTxt.text], phoneTxt.text];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"GET"];
    [request setURL:[NSURL URLWithString:urlWithParameters]];
    
    NSError *error = [[NSError alloc] init];
    NSHTTPURLResponse *responseCode = nil;
    
    NSData *oResponseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&responseCode error:&error];
    
    NSString *titleMessage;
    NSString *message;
    
    if([responseCode statusCode] != 200){
        titleMessage = @"Error";
        message = @"Error %@ en conexión con proveedor SMS.", [responseCode statusCode];
        //NSLog(@"Error getting %@, HTTP status code %i", @"http://200.31.80.34/Bolsa_Mensajes/AgroNet/CGI/ReceiverSMSFormulario.php", [responseCode statusCode]);
    }
    
    titleMessage = @"Listo";
    message = @"Mensaje enviado con éxito!";

    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:titleMessage message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
