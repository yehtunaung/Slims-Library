<?php
return [
    /**
     * SLiMS by default use Google ReCaptcha v2
     * 
     * make yours captcha library and provide it inside
     * providers.
     */
    'default' => 'ReCaptcha',

    // Captcha sections
    'sections' => [
        'librarian' => ['active' => false],
        'memberarea' => ['active' => false],
        'forgot' => ['active' => true],
    ],

    // Captcha providers
    'providers' => [
        'ReCaptcha' => [
            'varify_url' => 'https://www.google.com/recaptcha/api/siteverify',
            /**
             * This is SLiMS public and private key only
             * work on localhost. If your SLiMS was online you can register
             * your app and get your key from https://www.google.com/recaptcha/admin/create
             */
            'publickey' => '6LdCzFAUAAAAAKV0pEX3h3523MZA5ATRZf2GpgQC',
            'privatekey' => '6LdCzFAUAAAAABb8kVMaf97GiQFP9lfX56BPhhGs',

            /**
             * Recapcha library class, if you have your
             * ReCaptcha library, feel free to change it with yours.
             */
            'class' => \SLiMS\Captcha\Providers\ReCaptcha::class
        ]// Add another providers here
    ]
];