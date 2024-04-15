; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116752 () Bool)

(assert start!116752)

(declare-fun b!1376008 () Bool)

(declare-datatypes ((Unit!45438 0))(
  ( (Unit!45439) )
))
(declare-fun e!779529 () Unit!45438)

(declare-fun lt!604929 () Unit!45438)

(assert (=> b!1376008 (= e!779529 lt!604929)))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93375 0))(
  ( (array!93376 (arr!45091 (Array (_ BitVec 32) (_ BitVec 64))) (size!45643 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93375)

(declare-fun lt!604928 () Unit!45438)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93375 (_ BitVec 32) (_ BitVec 32)) Unit!45438)

(assert (=> b!1376008 (= lt!604928 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65804 () (_ BitVec 32))

(declare-fun lt!604925 () (_ BitVec 32))

(assert (=> b!1376008 (= call!65804 lt!604925)))

(declare-fun lt!604930 () array!93375)

(assert (=> b!1376008 (= lt!604929 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!604930 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65805 () (_ BitVec 32))

(declare-fun lt!604927 () (_ BitVec 32))

(assert (=> b!1376008 (= call!65805 lt!604927)))

(declare-fun b!1376009 () Bool)

(declare-fun res!918962 () Bool)

(declare-fun e!779527 () Bool)

(assert (=> b!1376009 (=> (not res!918962) (not e!779527))))

(declare-fun k0!2947 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376009 (= res!918962 (not (validKeyInArray!0 k0!2947)))))

(declare-fun b!1376010 () Bool)

(declare-fun lt!604926 () Unit!45438)

(assert (=> b!1376010 (= e!779529 lt!604926)))

(declare-fun lt!604931 () Unit!45438)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93375 (_ BitVec 32) (_ BitVec 32)) Unit!45438)

(assert (=> b!1376010 (= lt!604931 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376010 (= call!65804 (bvadd #b00000000000000000000000000000001 lt!604925))))

(assert (=> b!1376010 (= lt!604926 (lemmaValidKeyIncreasesNumOfKeys!0 lt!604930 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376010 (= call!65805 (bvadd #b00000000000000000000000000000001 lt!604927))))

(declare-fun b!1376011 () Bool)

(declare-fun res!918961 () Bool)

(assert (=> b!1376011 (=> (not res!918961) (not e!779527))))

(assert (=> b!1376011 (= res!918961 (and (bvslt (size!45643 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45643 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1376012 () Bool)

(declare-fun res!918963 () Bool)

(assert (=> b!1376012 (=> (not res!918963) (not e!779527))))

(assert (=> b!1376012 (= res!918963 (validKeyInArray!0 (select (arr!45091 a!4032) i!1445)))))

(declare-fun res!918960 () Bool)

(assert (=> start!116752 (=> (not res!918960) (not e!779527))))

(assert (=> start!116752 (= res!918960 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45643 a!4032))))))

(assert (=> start!116752 e!779527))

(assert (=> start!116752 true))

(declare-fun array_inv!34324 (array!93375) Bool)

(assert (=> start!116752 (array_inv!34324 a!4032)))

(declare-fun bm!65801 () Bool)

(declare-fun arrayCountValidKeys!0 (array!93375 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!65801 (= call!65804 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1376013 () Bool)

(declare-fun e!779526 () Bool)

(declare-fun e!779530 () Bool)

(assert (=> b!1376013 (= e!779526 e!779530)))

(declare-fun res!918959 () Bool)

(assert (=> b!1376013 (=> (not res!918959) (not e!779530))))

(assert (=> b!1376013 (= res!918959 (and (bvsge (bvadd #b00000000000000000000000000000001 to!206) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!206) (size!45643 a!4032)) (bvsgt (bvadd #b00000000000000000000000000000001 to!206) i!1445)))))

(declare-fun lt!604923 () Unit!45438)

(assert (=> b!1376013 (= lt!604923 e!779529)))

(declare-fun c!127967 () Bool)

(assert (=> b!1376013 (= c!127967 (validKeyInArray!0 (select (arr!45091 a!4032) to!206)))))

(declare-fun b!1376014 () Bool)

(declare-fun res!918964 () Bool)

(assert (=> b!1376014 (=> (not res!918964) (not e!779530))))

(assert (=> b!1376014 (= res!918964 (= (arrayCountValidKeys!0 lt!604930 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206))))))

(declare-fun bm!65802 () Bool)

(assert (=> bm!65802 (= call!65805 (arrayCountValidKeys!0 lt!604930 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1376015 () Bool)

(assert (=> b!1376015 (= e!779530 (not (bvsge (bvadd #b00000000000000000000000000000001 i!1445) #b00000000000000000000000000000000)))))

(assert (=> b!1376015 (= (arrayCountValidKeys!0 lt!604930 (bvadd #b00000000000000000000000000000001 i!1445) (size!45643 a!4032)) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (size!45643 a!4032)))))

(declare-fun lt!604924 () Unit!45438)

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93375 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45438)

(assert (=> b!1376015 (= lt!604924 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4032 i!1445 k0!2947 (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1376016 () Bool)

(assert (=> b!1376016 (= e!779527 e!779526)))

(declare-fun res!918965 () Bool)

(assert (=> b!1376016 (=> (not res!918965) (not e!779526))))

(assert (=> b!1376016 (= res!918965 (and (= lt!604927 lt!604925) (not (= to!206 (size!45643 a!4032)))))))

(assert (=> b!1376016 (= lt!604925 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376016 (= lt!604927 (arrayCountValidKeys!0 lt!604930 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376016 (= lt!604930 (array!93376 (store (arr!45091 a!4032) i!1445 k0!2947) (size!45643 a!4032)))))

(assert (= (and start!116752 res!918960) b!1376012))

(assert (= (and b!1376012 res!918963) b!1376009))

(assert (= (and b!1376009 res!918962) b!1376011))

(assert (= (and b!1376011 res!918961) b!1376016))

(assert (= (and b!1376016 res!918965) b!1376013))

(assert (= (and b!1376013 c!127967) b!1376010))

(assert (= (and b!1376013 (not c!127967)) b!1376008))

(assert (= (or b!1376010 b!1376008) bm!65802))

(assert (= (or b!1376010 b!1376008) bm!65801))

(assert (= (and b!1376013 res!918959) b!1376014))

(assert (= (and b!1376014 res!918964) b!1376015))

(declare-fun m!1259573 () Bool)

(assert (=> start!116752 m!1259573))

(declare-fun m!1259575 () Bool)

(assert (=> bm!65801 m!1259575))

(declare-fun m!1259577 () Bool)

(assert (=> b!1376013 m!1259577))

(assert (=> b!1376013 m!1259577))

(declare-fun m!1259579 () Bool)

(assert (=> b!1376013 m!1259579))

(declare-fun m!1259581 () Bool)

(assert (=> bm!65802 m!1259581))

(declare-fun m!1259583 () Bool)

(assert (=> b!1376012 m!1259583))

(assert (=> b!1376012 m!1259583))

(declare-fun m!1259585 () Bool)

(assert (=> b!1376012 m!1259585))

(assert (=> b!1376014 m!1259581))

(assert (=> b!1376014 m!1259575))

(declare-fun m!1259587 () Bool)

(assert (=> b!1376016 m!1259587))

(declare-fun m!1259589 () Bool)

(assert (=> b!1376016 m!1259589))

(declare-fun m!1259591 () Bool)

(assert (=> b!1376016 m!1259591))

(declare-fun m!1259593 () Bool)

(assert (=> b!1376010 m!1259593))

(declare-fun m!1259595 () Bool)

(assert (=> b!1376010 m!1259595))

(declare-fun m!1259597 () Bool)

(assert (=> b!1376015 m!1259597))

(declare-fun m!1259599 () Bool)

(assert (=> b!1376015 m!1259599))

(declare-fun m!1259601 () Bool)

(assert (=> b!1376015 m!1259601))

(declare-fun m!1259603 () Bool)

(assert (=> b!1376009 m!1259603))

(declare-fun m!1259605 () Bool)

(assert (=> b!1376008 m!1259605))

(declare-fun m!1259607 () Bool)

(assert (=> b!1376008 m!1259607))

(check-sat (not b!1376009) (not b!1376012) (not b!1376015) (not bm!65802) (not b!1376008) (not bm!65801) (not b!1376010) (not b!1376013) (not start!116752) (not b!1376016) (not b!1376014))
(check-sat)
