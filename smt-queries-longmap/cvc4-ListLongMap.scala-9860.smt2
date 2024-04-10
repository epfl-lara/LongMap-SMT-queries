; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116850 () Bool)

(assert start!116850)

(declare-fun res!919796 () Bool)

(declare-fun e!779973 () Bool)

(assert (=> start!116850 (=> (not res!919796) (not e!779973))))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93519 0))(
  ( (array!93520 (arr!45163 (Array (_ BitVec 32) (_ BitVec 64))) (size!45713 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93519)

(assert (=> start!116850 (= res!919796 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45713 a!4032))))))

(assert (=> start!116850 e!779973))

(assert (=> start!116850 true))

(declare-fun array_inv!34191 (array!93519) Bool)

(assert (=> start!116850 (array_inv!34191 a!4032)))

(declare-fun b!1376944 () Bool)

(declare-datatypes ((Unit!45643 0))(
  ( (Unit!45644) )
))
(declare-fun e!779972 () Unit!45643)

(declare-fun lt!605535 () Unit!45643)

(assert (=> b!1376944 (= e!779972 lt!605535)))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun lt!605529 () Unit!45643)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93519 (_ BitVec 32) (_ BitVec 32)) Unit!45643)

(assert (=> b!1376944 (= lt!605529 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65888 () (_ BitVec 32))

(declare-fun lt!605536 () (_ BitVec 32))

(assert (=> b!1376944 (= call!65888 lt!605536)))

(declare-fun lt!605533 () array!93519)

(assert (=> b!1376944 (= lt!605535 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!605533 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65887 () (_ BitVec 32))

(declare-fun lt!605530 () (_ BitVec 32))

(assert (=> b!1376944 (= call!65887 lt!605530)))

(declare-fun b!1376945 () Bool)

(declare-fun e!779974 () Bool)

(assert (=> b!1376945 (= e!779973 e!779974)))

(declare-fun res!919797 () Bool)

(assert (=> b!1376945 (=> (not res!919797) (not e!779974))))

(assert (=> b!1376945 (= res!919797 (and (= lt!605530 lt!605536) (not (= to!206 (size!45713 a!4032)))))))

(declare-fun arrayCountValidKeys!0 (array!93519 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1376945 (= lt!605536 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376945 (= lt!605530 (arrayCountValidKeys!0 lt!605533 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k!2947 () (_ BitVec 64))

(assert (=> b!1376945 (= lt!605533 (array!93520 (store (arr!45163 a!4032) i!1445 k!2947) (size!45713 a!4032)))))

(declare-fun bm!65884 () Bool)

(assert (=> bm!65884 (= call!65887 (arrayCountValidKeys!0 lt!605533 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1376946 () Bool)

(declare-fun lt!605532 () Unit!45643)

(assert (=> b!1376946 (= e!779972 lt!605532)))

(declare-fun lt!605534 () Unit!45643)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93519 (_ BitVec 32) (_ BitVec 32)) Unit!45643)

(assert (=> b!1376946 (= lt!605534 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376946 (= call!65888 (bvadd #b00000000000000000000000000000001 lt!605536))))

(assert (=> b!1376946 (= lt!605532 (lemmaValidKeyIncreasesNumOfKeys!0 lt!605533 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376946 (= call!65887 (bvadd #b00000000000000000000000000000001 lt!605530))))

(declare-fun b!1376947 () Bool)

(declare-fun res!919798 () Bool)

(assert (=> b!1376947 (=> (not res!919798) (not e!779973))))

(assert (=> b!1376947 (= res!919798 (and (bvslt (size!45713 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45713 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1376948 () Bool)

(declare-fun res!919794 () Bool)

(assert (=> b!1376948 (=> (not res!919794) (not e!779973))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376948 (= res!919794 (validKeyInArray!0 (select (arr!45163 a!4032) i!1445)))))

(declare-fun b!1376949 () Bool)

(declare-fun res!919795 () Bool)

(assert (=> b!1376949 (=> (not res!919795) (not e!779973))))

(assert (=> b!1376949 (= res!919795 (not (validKeyInArray!0 k!2947)))))

(declare-fun bm!65885 () Bool)

(assert (=> bm!65885 (= call!65888 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1376950 () Bool)

(assert (=> b!1376950 (= e!779974 false)))

(declare-fun lt!605531 () Unit!45643)

(assert (=> b!1376950 (= lt!605531 e!779972)))

(declare-fun c!128015 () Bool)

(assert (=> b!1376950 (= c!128015 (validKeyInArray!0 (select (arr!45163 a!4032) to!206)))))

(assert (= (and start!116850 res!919796) b!1376948))

(assert (= (and b!1376948 res!919794) b!1376949))

(assert (= (and b!1376949 res!919795) b!1376947))

(assert (= (and b!1376947 res!919798) b!1376945))

(assert (= (and b!1376945 res!919797) b!1376950))

(assert (= (and b!1376950 c!128015) b!1376946))

(assert (= (and b!1376950 (not c!128015)) b!1376944))

(assert (= (or b!1376946 b!1376944) bm!65884))

(assert (= (or b!1376946 b!1376944) bm!65885))

(declare-fun m!1261081 () Bool)

(assert (=> b!1376946 m!1261081))

(declare-fun m!1261083 () Bool)

(assert (=> b!1376946 m!1261083))

(declare-fun m!1261085 () Bool)

(assert (=> b!1376944 m!1261085))

(declare-fun m!1261087 () Bool)

(assert (=> b!1376944 m!1261087))

(declare-fun m!1261089 () Bool)

(assert (=> bm!65884 m!1261089))

(declare-fun m!1261091 () Bool)

(assert (=> start!116850 m!1261091))

(declare-fun m!1261093 () Bool)

(assert (=> b!1376949 m!1261093))

(declare-fun m!1261095 () Bool)

(assert (=> b!1376948 m!1261095))

(assert (=> b!1376948 m!1261095))

(declare-fun m!1261097 () Bool)

(assert (=> b!1376948 m!1261097))

(declare-fun m!1261099 () Bool)

(assert (=> b!1376945 m!1261099))

(declare-fun m!1261101 () Bool)

(assert (=> b!1376945 m!1261101))

(declare-fun m!1261103 () Bool)

(assert (=> b!1376945 m!1261103))

(declare-fun m!1261105 () Bool)

(assert (=> bm!65885 m!1261105))

(declare-fun m!1261107 () Bool)

(assert (=> b!1376950 m!1261107))

(assert (=> b!1376950 m!1261107))

(declare-fun m!1261109 () Bool)

(assert (=> b!1376950 m!1261109))

(push 1)

