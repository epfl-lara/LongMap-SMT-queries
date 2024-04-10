; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116750 () Bool)

(assert start!116750)

(declare-fun b!1375988 () Bool)

(declare-fun e!779511 () Bool)

(declare-fun e!779512 () Bool)

(assert (=> b!1375988 (= e!779511 e!779512)))

(declare-fun res!918923 () Bool)

(assert (=> b!1375988 (=> (not res!918923) (not e!779512))))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun lt!605028 () (_ BitVec 32))

(declare-fun lt!605026 () (_ BitVec 32))

(declare-datatypes ((array!93419 0))(
  ( (array!93420 (arr!45113 (Array (_ BitVec 32) (_ BitVec 64))) (size!45663 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93419)

(assert (=> b!1375988 (= res!918923 (and (= lt!605026 lt!605028) (not (= to!206 (size!45663 a!4032)))))))

(declare-fun i!1445 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93419 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1375988 (= lt!605028 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun lt!605030 () array!93419)

(assert (=> b!1375988 (= lt!605026 (arrayCountValidKeys!0 lt!605030 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k!2947 () (_ BitVec 64))

(assert (=> b!1375988 (= lt!605030 (array!93420 (store (arr!45113 a!4032) i!1445 k!2947) (size!45663 a!4032)))))

(declare-fun b!1375989 () Bool)

(declare-datatypes ((Unit!45591 0))(
  ( (Unit!45592) )
))
(declare-fun e!779510 () Unit!45591)

(declare-fun lt!605029 () Unit!45591)

(assert (=> b!1375989 (= e!779510 lt!605029)))

(declare-fun lt!605025 () Unit!45591)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93419 (_ BitVec 32) (_ BitVec 32)) Unit!45591)

(assert (=> b!1375989 (= lt!605025 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65803 () (_ BitVec 32))

(assert (=> b!1375989 (= call!65803 (bvadd #b00000000000000000000000000000001 lt!605028))))

(assert (=> b!1375989 (= lt!605029 (lemmaValidKeyIncreasesNumOfKeys!0 lt!605030 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65804 () (_ BitVec 32))

(assert (=> b!1375989 (= call!65804 (bvadd #b00000000000000000000000000000001 lt!605026))))

(declare-fun bm!65800 () Bool)

(assert (=> bm!65800 (= call!65803 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun bm!65801 () Bool)

(assert (=> bm!65801 (= call!65804 (arrayCountValidKeys!0 lt!605030 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1375990 () Bool)

(declare-fun res!918928 () Bool)

(assert (=> b!1375990 (=> (not res!918928) (not e!779511))))

(assert (=> b!1375990 (= res!918928 (and (bvslt (size!45663 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45663 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1375991 () Bool)

(declare-fun res!918922 () Bool)

(declare-fun e!779509 () Bool)

(assert (=> b!1375991 (=> (not res!918922) (not e!779509))))

(assert (=> b!1375991 (= res!918922 (= (arrayCountValidKeys!0 lt!605030 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206))))))

(declare-fun b!1375992 () Bool)

(declare-fun lt!605027 () Unit!45591)

(assert (=> b!1375992 (= e!779510 lt!605027)))

(declare-fun lt!605032 () Unit!45591)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93419 (_ BitVec 32) (_ BitVec 32)) Unit!45591)

(assert (=> b!1375992 (= lt!605032 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375992 (= call!65803 lt!605028)))

(assert (=> b!1375992 (= lt!605027 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!605030 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375992 (= call!65804 lt!605026)))

(declare-fun res!918927 () Bool)

(assert (=> start!116750 (=> (not res!918927) (not e!779511))))

(assert (=> start!116750 (= res!918927 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45663 a!4032))))))

(assert (=> start!116750 e!779511))

(assert (=> start!116750 true))

(declare-fun array_inv!34141 (array!93419) Bool)

(assert (=> start!116750 (array_inv!34141 a!4032)))

(declare-fun b!1375993 () Bool)

(assert (=> b!1375993 (= e!779512 e!779509)))

(declare-fun res!918926 () Bool)

(assert (=> b!1375993 (=> (not res!918926) (not e!779509))))

(assert (=> b!1375993 (= res!918926 (and (bvsge (bvadd #b00000000000000000000000000000001 to!206) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!206) (size!45663 a!4032)) (bvsgt (bvadd #b00000000000000000000000000000001 to!206) i!1445)))))

(declare-fun lt!605031 () Unit!45591)

(assert (=> b!1375993 (= lt!605031 e!779510)))

(declare-fun c!127973 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375993 (= c!127973 (validKeyInArray!0 (select (arr!45113 a!4032) to!206)))))

(declare-fun b!1375994 () Bool)

(declare-fun res!918924 () Bool)

(assert (=> b!1375994 (=> (not res!918924) (not e!779511))))

(assert (=> b!1375994 (= res!918924 (not (validKeyInArray!0 k!2947)))))

(declare-fun b!1375995 () Bool)

(declare-fun res!918925 () Bool)

(assert (=> b!1375995 (=> (not res!918925) (not e!779511))))

(assert (=> b!1375995 (= res!918925 (validKeyInArray!0 (select (arr!45113 a!4032) i!1445)))))

(declare-fun b!1375996 () Bool)

(assert (=> b!1375996 (= e!779509 (not true))))

(assert (=> b!1375996 (= (arrayCountValidKeys!0 lt!605030 (bvadd #b00000000000000000000000000000001 i!1445) (size!45663 a!4032)) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (size!45663 a!4032)))))

(declare-fun lt!605024 () Unit!45591)

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93419 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45591)

(assert (=> b!1375996 (= lt!605024 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4032 i!1445 k!2947 (bvadd #b00000000000000000000000000000001 to!206)))))

(assert (= (and start!116750 res!918927) b!1375995))

(assert (= (and b!1375995 res!918925) b!1375994))

(assert (= (and b!1375994 res!918924) b!1375990))

(assert (= (and b!1375990 res!918928) b!1375988))

(assert (= (and b!1375988 res!918923) b!1375993))

(assert (= (and b!1375993 c!127973) b!1375989))

(assert (= (and b!1375993 (not c!127973)) b!1375992))

(assert (= (or b!1375989 b!1375992) bm!65800))

(assert (= (or b!1375989 b!1375992) bm!65801))

(assert (= (and b!1375993 res!918926) b!1375991))

(assert (= (and b!1375991 res!918922) b!1375996))

(declare-fun m!1259959 () Bool)

(assert (=> b!1375995 m!1259959))

(assert (=> b!1375995 m!1259959))

(declare-fun m!1259961 () Bool)

(assert (=> b!1375995 m!1259961))

(declare-fun m!1259963 () Bool)

(assert (=> b!1375988 m!1259963))

(declare-fun m!1259965 () Bool)

(assert (=> b!1375988 m!1259965))

(declare-fun m!1259967 () Bool)

(assert (=> b!1375988 m!1259967))

(declare-fun m!1259969 () Bool)

(assert (=> b!1375991 m!1259969))

(declare-fun m!1259971 () Bool)

(assert (=> b!1375991 m!1259971))

(declare-fun m!1259973 () Bool)

(assert (=> b!1375993 m!1259973))

(assert (=> b!1375993 m!1259973))

(declare-fun m!1259975 () Bool)

(assert (=> b!1375993 m!1259975))

(declare-fun m!1259977 () Bool)

(assert (=> b!1375996 m!1259977))

(declare-fun m!1259979 () Bool)

(assert (=> b!1375996 m!1259979))

(declare-fun m!1259981 () Bool)

(assert (=> b!1375996 m!1259981))

(declare-fun m!1259983 () Bool)

(assert (=> b!1375989 m!1259983))

(declare-fun m!1259985 () Bool)

(assert (=> b!1375989 m!1259985))

(declare-fun m!1259987 () Bool)

(assert (=> b!1375992 m!1259987))

(declare-fun m!1259989 () Bool)

(assert (=> b!1375992 m!1259989))

(assert (=> bm!65800 m!1259971))

(declare-fun m!1259991 () Bool)

(assert (=> b!1375994 m!1259991))

(assert (=> bm!65801 m!1259969))

(declare-fun m!1259993 () Bool)

(assert (=> start!116750 m!1259993))

(push 1)

