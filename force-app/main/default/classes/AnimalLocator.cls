public class AnimalLocator {
    public static string getAnimalNameById(Integer Id){
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/' + Id);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        String strResp = '';
        system.debug('*******response ' + response.getStatusCode());
        system.debug('*******response ' + response.getBody());
        if (response.getStatusCode() == 200){
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            Map<String, Object> animals = (Map<String, Object>) results.get('animal');
            System.debug('Recived the following animals: ' + animals);
            strResp = string.valueOf(animals.get('name'));
            System.debug('strResp > ' + strResp);
        }
        return strResp;
    }
}