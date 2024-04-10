; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116844 () Bool)

(assert start!116844)

(declare-fun b!1376881 () Bool)

(declare-datatypes ((Unit!45637 0))(
  ( (Unit!45638) )
))
(declare-fun e!779938 () Unit!45637)

(declare-fun lt!605464 () Unit!45637)

(assert (=> b!1376881 (= e!779938 lt!605464)))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93513 0))(
  ( (array!93514 (arr!45160 (Array (_ BitVec 32) (_ BitVec 64))) (size!45710 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93513)

(declare-fun lt!605461 () Unit!45637)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93513 (_ BitVec 32) (_ BitVec 32)) Unit!45637)

(assert (=> b!1376881 (= lt!605461 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65869 () (_ BitVec 32))

(declare-fun lt!605459 () (_ BitVec 32))

(assert (=> b!1376881 (= call!65869 (bvadd #b00000000000000000000000000000001 lt!605459))))

(declare-fun lt!605462 () array!93513)

(assert (=> b!1376881 (= lt!605464 (lemmaValidKeyIncreasesNumOfKeys!0 lt!605462 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65870 () (_ BitVec 32))

(declare-fun lt!605463 () (_ BitVec 32))

(assert (=> b!1376881 (= call!65870 (bvadd #b00000000000000000000000000000001 lt!605463))))

(declare-fun b!1376882 () Bool)

(declare-fun res!919751 () Bool)

(declare-fun e!779935 () Bool)

(assert (=> b!1376882 (=> (not res!919751) (not e!779935))))

(assert (=> b!1376882 (= res!919751 (and (bvslt (size!45710 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45710 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun res!919749 () Bool)

(assert (=> start!116844 (=> (not res!919749) (not e!779935))))

(assert (=> start!116844 (= res!919749 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45710 a!4032))))))

(assert (=> start!116844 e!779935))

(assert (=> start!116844 true))

(declare-fun array_inv!34188 (array!93513) Bool)

(assert (=> start!116844 (array_inv!34188 a!4032)))

(declare-fun b!1376883 () Bool)

(declare-fun e!779936 () Bool)

(assert (=> b!1376883 (= e!779936 false)))

(declare-fun lt!605458 () Unit!45637)

(assert (=> b!1376883 (= lt!605458 e!779938)))

(declare-fun c!128006 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376883 (= c!128006 (validKeyInArray!0 (select (arr!45160 a!4032) to!206)))))

(declare-fun b!1376884 () Bool)

(declare-fun res!919753 () Bool)

(assert (=> b!1376884 (=> (not res!919753) (not e!779935))))

(assert (=> b!1376884 (= res!919753 (validKeyInArray!0 (select (arr!45160 a!4032) i!1445)))))

(declare-fun b!1376885 () Bool)

(assert (=> b!1376885 (= e!779935 e!779936)))

(declare-fun res!919752 () Bool)

(assert (=> b!1376885 (=> (not res!919752) (not e!779936))))

(assert (=> b!1376885 (= res!919752 (and (= lt!605463 lt!605459) (not (= to!206 (size!45710 a!4032)))))))

(declare-fun arrayCountValidKeys!0 (array!93513 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1376885 (= lt!605459 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376885 (= lt!605463 (arrayCountValidKeys!0 lt!605462 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k!2947 () (_ BitVec 64))

(assert (=> b!1376885 (= lt!605462 (array!93514 (store (arr!45160 a!4032) i!1445 k!2947) (size!45710 a!4032)))))

(declare-fun b!1376886 () Bool)

(declare-fun lt!605460 () Unit!45637)

(assert (=> b!1376886 (= e!779938 lt!605460)))

(declare-fun lt!605457 () Unit!45637)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93513 (_ BitVec 32) (_ BitVec 32)) Unit!45637)

(assert (=> b!1376886 (= lt!605457 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376886 (= call!65870 lt!605459)))

(assert (=> b!1376886 (= lt!605460 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!605462 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376886 (= call!65869 lt!605463)))

(declare-fun bm!65866 () Bool)

(assert (=> bm!65866 (= call!65869 (arrayCountValidKeys!0 (ite c!128006 a!4032 lt!605462) (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun bm!65867 () Bool)

(assert (=> bm!65867 (= call!65870 (arrayCountValidKeys!0 (ite c!128006 lt!605462 a!4032) (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1376887 () Bool)

(declare-fun res!919750 () Bool)

(assert (=> b!1376887 (=> (not res!919750) (not e!779935))))

(assert (=> b!1376887 (= res!919750 (not (validKeyInArray!0 k!2947)))))

(assert (= (and start!116844 res!919749) b!1376884))

(assert (= (and b!1376884 res!919753) b!1376887))

(assert (= (and b!1376887 res!919750) b!1376882))

(assert (= (and b!1376882 res!919751) b!1376885))

(assert (= (and b!1376885 res!919752) b!1376883))

(assert (= (and b!1376883 c!128006) b!1376881))

(assert (= (and b!1376883 (not c!128006)) b!1376886))

(assert (= (or b!1376881 b!1376886) bm!65866))

(assert (= (or b!1376881 b!1376886) bm!65867))

(declare-fun m!1260991 () Bool)

(assert (=> bm!65867 m!1260991))

(declare-fun m!1260993 () Bool)

(assert (=> b!1376884 m!1260993))

(assert (=> b!1376884 m!1260993))

(declare-fun m!1260995 () Bool)

(assert (=> b!1376884 m!1260995))

(declare-fun m!1260997 () Bool)

(assert (=> b!1376887 m!1260997))

(declare-fun m!1260999 () Bool)

(assert (=> b!1376886 m!1260999))

(declare-fun m!1261001 () Bool)

(assert (=> b!1376886 m!1261001))

(declare-fun m!1261003 () Bool)

(assert (=> b!1376883 m!1261003))

(assert (=> b!1376883 m!1261003))

(declare-fun m!1261005 () Bool)

(assert (=> b!1376883 m!1261005))

(declare-fun m!1261007 () Bool)

(assert (=> b!1376881 m!1261007))

(declare-fun m!1261009 () Bool)

(assert (=> b!1376881 m!1261009))

(declare-fun m!1261011 () Bool)

(assert (=> b!1376885 m!1261011))

(declare-fun m!1261013 () Bool)

(assert (=> b!1376885 m!1261013))

(declare-fun m!1261015 () Bool)

(assert (=> b!1376885 m!1261015))

(declare-fun m!1261017 () Bool)

(assert (=> bm!65866 m!1261017))

(declare-fun m!1261019 () Bool)

(assert (=> start!116844 m!1261019))

(push 1)

(assert (not start!116844))

(assert (not bm!65866))

(assert (not bm!65867))

(assert (not b!1376885))

(assert (not b!1376887))

(assert (not b!1376881))

(assert (not b!1376883))

(assert (not b!1376884))

(assert (not b!1376886))

(check-sat)

