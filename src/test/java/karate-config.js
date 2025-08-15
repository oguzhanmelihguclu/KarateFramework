function fn() {
    var env = karate.env; // get java system property 'karate.env'
    karate.log('karate.env system property was:', env);
    if (!env) {
        env = 'dev'; // a custom 'intelligent' default
    }
    var config = { // base config JSON
        petBaseUrl: 'https://petstore.swagger.io/v2/',
        anotherUrlBase: 'https://another-host.com/v1/',
        restfulBaseUrl: 'https://restful-booker.herokuapp.com/',
        fuelBaseUrl : 'https://api.collectapi.com/' ,
        pharmacyBaseUrl : 'https://api.collectapi.com/',
        goldStockMarketBaseUrl: 'https://api.collectapi.com/',
        collectApiToken: karate.properties['collectapi.token'] || '23Pd8e4hQE0VQ5WOxUafC9:16WI1uZWrZV5Z3nOgkAbMg'
    };
    if (env == 'stage') {
        // over-ride only those that need to be
        config.baseUrl = 'https://stage-host/v1/auth';

    } else if (env == 'e2e') {
        config.baseUrl = 'https://e2e-host/v1/auth';
    }
    // don't waste time waiting for a connection or if servers don't respond within 5 seconds
    karate.configure('connectTimeout', 5000);   // maksimum 5 saniye bekler çalışmazsa hata verir.
    karate.configure('readTimeout', 5000);      // maksimum 5 saniye bekler çalışmazsa hata verir.
    return config;
}
