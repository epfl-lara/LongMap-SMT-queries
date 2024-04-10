; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116744 () Bool)

(assert start!116744)

(declare-fun to!206 () (_ BitVec 32))

(declare-datatypes ((array!93413 0))(
  ( (array!93414 (arr!45110 (Array (_ BitVec 32) (_ BitVec 64))) (size!45660 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93413)

(declare-fun call!65785 () (_ BitVec 32))

(declare-fun bm!65783 () Bool)

(declare-fun i!1445 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93413 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!65783 (= call!65785 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1375907 () Bool)

(declare-datatypes ((Unit!45585 0))(
  ( (Unit!45586) )
))
(declare-fun e!779465 () Unit!45585)

(declare-fun lt!604949 () Unit!45585)

(assert (=> b!1375907 (= e!779465 lt!604949)))

(declare-fun lt!604950 () Unit!45585)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93413 (_ BitVec 32) (_ BitVec 32)) Unit!45585)

(assert (=> b!1375907 (= lt!604950 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun lt!604947 () (_ BitVec 32))

(assert (=> b!1375907 (= call!65785 (bvadd #b00000000000000000000000000000001 lt!604947))))

(declare-fun lt!604943 () array!93413)

(assert (=> b!1375907 (= lt!604949 (lemmaValidKeyIncreasesNumOfKeys!0 lt!604943 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65786 () (_ BitVec 32))

(declare-fun lt!604944 () (_ BitVec 32))

(assert (=> b!1375907 (= call!65786 (bvadd #b00000000000000000000000000000001 lt!604944))))

(declare-fun b!1375908 () Bool)

(declare-fun e!779467 () Bool)

(declare-fun e!779466 () Bool)

(assert (=> b!1375908 (= e!779467 e!779466)))

(declare-fun res!918864 () Bool)

(assert (=> b!1375908 (=> (not res!918864) (not e!779466))))

(assert (=> b!1375908 (= res!918864 (and (bvsge (bvadd #b00000000000000000000000000000001 to!206) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!206) (size!45660 a!4032)) (bvsgt (bvadd #b00000000000000000000000000000001 to!206) i!1445)))))

(declare-fun lt!604945 () Unit!45585)

(assert (=> b!1375908 (= lt!604945 e!779465)))

(declare-fun c!127964 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375908 (= c!127964 (validKeyInArray!0 (select (arr!45110 a!4032) to!206)))))

(declare-fun b!1375909 () Bool)

(declare-fun e!779463 () Bool)

(assert (=> b!1375909 (= e!779463 e!779467)))

(declare-fun res!918865 () Bool)

(assert (=> b!1375909 (=> (not res!918865) (not e!779467))))

(assert (=> b!1375909 (= res!918865 (and (= lt!604944 lt!604947) (not (= to!206 (size!45660 a!4032)))))))

(assert (=> b!1375909 (= lt!604947 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375909 (= lt!604944 (arrayCountValidKeys!0 lt!604943 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k!2947 () (_ BitVec 64))

(assert (=> b!1375909 (= lt!604943 (array!93414 (store (arr!45110 a!4032) i!1445 k!2947) (size!45660 a!4032)))))

(declare-fun b!1375910 () Bool)

(declare-fun lt!604951 () Unit!45585)

(assert (=> b!1375910 (= e!779465 lt!604951)))

(declare-fun lt!604948 () Unit!45585)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93413 (_ BitVec 32) (_ BitVec 32)) Unit!45585)

(assert (=> b!1375910 (= lt!604948 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375910 (= call!65785 lt!604947)))

(assert (=> b!1375910 (= lt!604951 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!604943 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375910 (= call!65786 lt!604944)))

(declare-fun b!1375911 () Bool)

(declare-fun res!918860 () Bool)

(assert (=> b!1375911 (=> (not res!918860) (not e!779463))))

(assert (=> b!1375911 (= res!918860 (and (bvslt (size!45660 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45660 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1375912 () Bool)

(declare-fun res!918862 () Bool)

(assert (=> b!1375912 (=> (not res!918862) (not e!779463))))

(assert (=> b!1375912 (= res!918862 (validKeyInArray!0 (select (arr!45110 a!4032) i!1445)))))

(declare-fun b!1375913 () Bool)

(assert (=> b!1375913 (= e!779466 (not (bvsge (bvadd #b00000000000000000000000000000001 i!1445) #b00000000000000000000000000000000)))))

(assert (=> b!1375913 (= (arrayCountValidKeys!0 lt!604943 (bvadd #b00000000000000000000000000000001 i!1445) (size!45660 a!4032)) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (size!45660 a!4032)))))

(declare-fun lt!604946 () Unit!45585)

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93413 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45585)

(assert (=> b!1375913 (= lt!604946 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4032 i!1445 k!2947 (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun bm!65782 () Bool)

(assert (=> bm!65782 (= call!65786 (arrayCountValidKeys!0 lt!604943 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun res!918863 () Bool)

(assert (=> start!116744 (=> (not res!918863) (not e!779463))))

(assert (=> start!116744 (= res!918863 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45660 a!4032))))))

(assert (=> start!116744 e!779463))

(assert (=> start!116744 true))

(declare-fun array_inv!34138 (array!93413) Bool)

(assert (=> start!116744 (array_inv!34138 a!4032)))

(declare-fun b!1375914 () Bool)

(declare-fun res!918859 () Bool)

(assert (=> b!1375914 (=> (not res!918859) (not e!779466))))

(assert (=> b!1375914 (= res!918859 (= (arrayCountValidKeys!0 lt!604943 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206))))))

(declare-fun b!1375915 () Bool)

(declare-fun res!918861 () Bool)

(assert (=> b!1375915 (=> (not res!918861) (not e!779463))))

(assert (=> b!1375915 (= res!918861 (not (validKeyInArray!0 k!2947)))))

(assert (= (and start!116744 res!918863) b!1375912))

(assert (= (and b!1375912 res!918862) b!1375915))

(assert (= (and b!1375915 res!918861) b!1375911))

(assert (= (and b!1375911 res!918860) b!1375909))

(assert (= (and b!1375909 res!918865) b!1375908))

(assert (= (and b!1375908 c!127964) b!1375907))

(assert (= (and b!1375908 (not c!127964)) b!1375910))

(assert (= (or b!1375907 b!1375910) bm!65782))

(assert (= (or b!1375907 b!1375910) bm!65783))

(assert (= (and b!1375908 res!918864) b!1375914))

(assert (= (and b!1375914 res!918859) b!1375913))

(declare-fun m!1259851 () Bool)

(assert (=> b!1375914 m!1259851))

(declare-fun m!1259853 () Bool)

(assert (=> b!1375914 m!1259853))

(declare-fun m!1259855 () Bool)

(assert (=> b!1375909 m!1259855))

(declare-fun m!1259857 () Bool)

(assert (=> b!1375909 m!1259857))

(declare-fun m!1259859 () Bool)

(assert (=> b!1375909 m!1259859))

(declare-fun m!1259861 () Bool)

(assert (=> b!1375915 m!1259861))

(declare-fun m!1259863 () Bool)

(assert (=> b!1375907 m!1259863))

(declare-fun m!1259865 () Bool)

(assert (=> b!1375907 m!1259865))

(declare-fun m!1259867 () Bool)

(assert (=> b!1375912 m!1259867))

(assert (=> b!1375912 m!1259867))

(declare-fun m!1259869 () Bool)

(assert (=> b!1375912 m!1259869))

(assert (=> bm!65783 m!1259853))

(declare-fun m!1259871 () Bool)

(assert (=> b!1375908 m!1259871))

(assert (=> b!1375908 m!1259871))

(declare-fun m!1259873 () Bool)

(assert (=> b!1375908 m!1259873))

(declare-fun m!1259875 () Bool)

(assert (=> b!1375913 m!1259875))

(declare-fun m!1259877 () Bool)

(assert (=> b!1375913 m!1259877))

(declare-fun m!1259879 () Bool)

(assert (=> b!1375913 m!1259879))

(assert (=> bm!65782 m!1259851))

(declare-fun m!1259881 () Bool)

(assert (=> start!116744 m!1259881))

(declare-fun m!1259883 () Bool)

(assert (=> b!1375910 m!1259883))

(declare-fun m!1259885 () Bool)

(assert (=> b!1375910 m!1259885))

(push 1)

(assert (not b!1375910))

(assert (not b!1375908))

(assert (not b!1375914))

(assert (not start!116744))

(assert (not b!1375909))

(assert (not bm!65782))

(assert (not b!1375912))

(assert (not b!1375907))

(assert (not bm!65783))

(assert (not b!1375915))

(assert (not b!1375913))

(check-sat)

(pop 1)

(push 1)

(check-sat)

