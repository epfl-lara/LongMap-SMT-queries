; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116746 () Bool)

(assert start!116746)

(declare-fun b!1375927 () Bool)

(declare-fun e!779485 () Bool)

(assert (=> b!1375927 (= e!779485 (not true))))

(declare-datatypes ((array!93369 0))(
  ( (array!93370 (arr!45088 (Array (_ BitVec 32) (_ BitVec 64))) (size!45640 (_ BitVec 32))) )
))
(declare-fun lt!604849 () array!93369)

(declare-fun i!1445 () (_ BitVec 32))

(declare-fun a!4032 () array!93369)

(declare-fun arrayCountValidKeys!0 (array!93369 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1375927 (= (arrayCountValidKeys!0 lt!604849 (bvadd #b00000000000000000000000000000001 i!1445) (size!45640 a!4032)) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (size!45640 a!4032)))))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun k0!2947 () (_ BitVec 64))

(declare-datatypes ((Unit!45432 0))(
  ( (Unit!45433) )
))
(declare-fun lt!604848 () Unit!45432)

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93369 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45432)

(assert (=> b!1375927 (= lt!604848 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4032 i!1445 k0!2947 (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1375928 () Bool)

(declare-fun e!779483 () Unit!45432)

(declare-fun lt!604846 () Unit!45432)

(assert (=> b!1375928 (= e!779483 lt!604846)))

(declare-fun lt!604847 () Unit!45432)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93369 (_ BitVec 32) (_ BitVec 32)) Unit!45432)

(assert (=> b!1375928 (= lt!604847 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65786 () (_ BitVec 32))

(declare-fun lt!604845 () (_ BitVec 32))

(assert (=> b!1375928 (= call!65786 lt!604845)))

(assert (=> b!1375928 (= lt!604846 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!604849 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65787 () (_ BitVec 32))

(declare-fun lt!604844 () (_ BitVec 32))

(assert (=> b!1375928 (= call!65787 lt!604844)))

(declare-fun b!1375929 () Bool)

(declare-fun res!918897 () Bool)

(declare-fun e!779484 () Bool)

(assert (=> b!1375929 (=> (not res!918897) (not e!779484))))

(assert (=> b!1375929 (= res!918897 (and (bvslt (size!45640 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45640 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun bm!65783 () Bool)

(assert (=> bm!65783 (= call!65787 (arrayCountValidKeys!0 lt!604849 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1375931 () Bool)

(declare-fun res!918900 () Bool)

(assert (=> b!1375931 (=> (not res!918900) (not e!779484))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375931 (= res!918900 (not (validKeyInArray!0 k0!2947)))))

(declare-fun bm!65784 () Bool)

(assert (=> bm!65784 (= call!65786 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1375932 () Bool)

(declare-fun e!779482 () Bool)

(assert (=> b!1375932 (= e!779484 e!779482)))

(declare-fun res!918902 () Bool)

(assert (=> b!1375932 (=> (not res!918902) (not e!779482))))

(assert (=> b!1375932 (= res!918902 (and (= lt!604844 lt!604845) (not (= to!206 (size!45640 a!4032)))))))

(assert (=> b!1375932 (= lt!604845 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375932 (= lt!604844 (arrayCountValidKeys!0 lt!604849 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375932 (= lt!604849 (array!93370 (store (arr!45088 a!4032) i!1445 k0!2947) (size!45640 a!4032)))))

(declare-fun b!1375933 () Bool)

(declare-fun res!918901 () Bool)

(assert (=> b!1375933 (=> (not res!918901) (not e!779484))))

(assert (=> b!1375933 (= res!918901 (validKeyInArray!0 (select (arr!45088 a!4032) i!1445)))))

(declare-fun b!1375930 () Bool)

(declare-fun lt!604850 () Unit!45432)

(assert (=> b!1375930 (= e!779483 lt!604850)))

(declare-fun lt!604842 () Unit!45432)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93369 (_ BitVec 32) (_ BitVec 32)) Unit!45432)

(assert (=> b!1375930 (= lt!604842 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375930 (= call!65786 (bvadd #b00000000000000000000000000000001 lt!604845))))

(assert (=> b!1375930 (= lt!604850 (lemmaValidKeyIncreasesNumOfKeys!0 lt!604849 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375930 (= call!65787 (bvadd #b00000000000000000000000000000001 lt!604844))))

(declare-fun res!918899 () Bool)

(assert (=> start!116746 (=> (not res!918899) (not e!779484))))

(assert (=> start!116746 (= res!918899 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45640 a!4032))))))

(assert (=> start!116746 e!779484))

(assert (=> start!116746 true))

(declare-fun array_inv!34321 (array!93369) Bool)

(assert (=> start!116746 (array_inv!34321 a!4032)))

(declare-fun b!1375934 () Bool)

(assert (=> b!1375934 (= e!779482 e!779485)))

(declare-fun res!918896 () Bool)

(assert (=> b!1375934 (=> (not res!918896) (not e!779485))))

(assert (=> b!1375934 (= res!918896 (and (bvsge (bvadd #b00000000000000000000000000000001 to!206) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!206) (size!45640 a!4032)) (bvsgt (bvadd #b00000000000000000000000000000001 to!206) i!1445)))))

(declare-fun lt!604843 () Unit!45432)

(assert (=> b!1375934 (= lt!604843 e!779483)))

(declare-fun c!127958 () Bool)

(assert (=> b!1375934 (= c!127958 (validKeyInArray!0 (select (arr!45088 a!4032) to!206)))))

(declare-fun b!1375935 () Bool)

(declare-fun res!918898 () Bool)

(assert (=> b!1375935 (=> (not res!918898) (not e!779485))))

(assert (=> b!1375935 (= res!918898 (= (arrayCountValidKeys!0 lt!604849 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206))))))

(assert (= (and start!116746 res!918899) b!1375933))

(assert (= (and b!1375933 res!918901) b!1375931))

(assert (= (and b!1375931 res!918900) b!1375929))

(assert (= (and b!1375929 res!918897) b!1375932))

(assert (= (and b!1375932 res!918902) b!1375934))

(assert (= (and b!1375934 c!127958) b!1375930))

(assert (= (and b!1375934 (not c!127958)) b!1375928))

(assert (= (or b!1375930 b!1375928) bm!65784))

(assert (= (or b!1375930 b!1375928) bm!65783))

(assert (= (and b!1375934 res!918896) b!1375935))

(assert (= (and b!1375935 res!918898) b!1375927))

(declare-fun m!1259465 () Bool)

(assert (=> b!1375935 m!1259465))

(declare-fun m!1259467 () Bool)

(assert (=> b!1375935 m!1259467))

(declare-fun m!1259469 () Bool)

(assert (=> b!1375930 m!1259469))

(declare-fun m!1259471 () Bool)

(assert (=> b!1375930 m!1259471))

(declare-fun m!1259473 () Bool)

(assert (=> start!116746 m!1259473))

(declare-fun m!1259475 () Bool)

(assert (=> b!1375932 m!1259475))

(declare-fun m!1259477 () Bool)

(assert (=> b!1375932 m!1259477))

(declare-fun m!1259479 () Bool)

(assert (=> b!1375932 m!1259479))

(declare-fun m!1259481 () Bool)

(assert (=> b!1375927 m!1259481))

(declare-fun m!1259483 () Bool)

(assert (=> b!1375927 m!1259483))

(declare-fun m!1259485 () Bool)

(assert (=> b!1375927 m!1259485))

(declare-fun m!1259487 () Bool)

(assert (=> b!1375934 m!1259487))

(assert (=> b!1375934 m!1259487))

(declare-fun m!1259489 () Bool)

(assert (=> b!1375934 m!1259489))

(declare-fun m!1259491 () Bool)

(assert (=> b!1375928 m!1259491))

(declare-fun m!1259493 () Bool)

(assert (=> b!1375928 m!1259493))

(assert (=> bm!65784 m!1259467))

(declare-fun m!1259495 () Bool)

(assert (=> b!1375933 m!1259495))

(assert (=> b!1375933 m!1259495))

(declare-fun m!1259497 () Bool)

(assert (=> b!1375933 m!1259497))

(assert (=> bm!65783 m!1259465))

(declare-fun m!1259499 () Bool)

(assert (=> b!1375931 m!1259499))

(check-sat (not b!1375932) (not b!1375931) (not b!1375930) (not b!1375934) (not bm!65783) (not b!1375933) (not bm!65784) (not start!116746) (not b!1375935) (not b!1375928) (not b!1375927))
(check-sat)
