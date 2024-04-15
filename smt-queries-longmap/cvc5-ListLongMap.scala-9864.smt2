; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116870 () Bool)

(assert start!116870)

(declare-fun b!1377143 () Bool)

(declare-fun e!780099 () Bool)

(declare-fun e!780098 () Bool)

(assert (=> b!1377143 (= e!780099 e!780098)))

(declare-fun res!919958 () Bool)

(assert (=> b!1377143 (=> (not res!919958) (not e!780098))))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93493 0))(
  ( (array!93494 (arr!45150 (Array (_ BitVec 32) (_ BitVec 64))) (size!45702 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93493)

(assert (=> b!1377143 (= res!919958 (and (bvsge (bvadd #b00000000000000000000000000000001 to!206) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!206) (size!45702 a!4032)) (bvsgt (bvadd #b00000000000000000000000000000001 to!206) i!1445)))))

(declare-datatypes ((Unit!45508 0))(
  ( (Unit!45509) )
))
(declare-fun lt!605642 () Unit!45508)

(declare-fun e!780096 () Unit!45508)

(assert (=> b!1377143 (= lt!605642 e!780096)))

(declare-fun c!128036 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377143 (= c!128036 (validKeyInArray!0 (select (arr!45150 a!4032) to!206)))))

(declare-fun b!1377144 () Bool)

(declare-fun res!919957 () Bool)

(declare-fun e!780097 () Bool)

(assert (=> b!1377144 (=> (not res!919957) (not e!780097))))

(declare-fun k!2947 () (_ BitVec 64))

(assert (=> b!1377144 (= res!919957 (not (validKeyInArray!0 k!2947)))))

(declare-fun lt!605638 () array!93493)

(declare-fun b!1377145 () Bool)

(declare-fun arrayCountValidKeys!0 (array!93493 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1377145 (= e!780098 (not (= (arrayCountValidKeys!0 lt!605638 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))))

(declare-fun bm!65939 () Bool)

(declare-fun call!65943 () (_ BitVec 32))

(assert (=> bm!65939 (= call!65943 (arrayCountValidKeys!0 lt!605638 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1377146 () Bool)

(declare-fun lt!605639 () Unit!45508)

(assert (=> b!1377146 (= e!780096 lt!605639)))

(declare-fun lt!605636 () Unit!45508)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93493 (_ BitVec 32) (_ BitVec 32)) Unit!45508)

(assert (=> b!1377146 (= lt!605636 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65942 () (_ BitVec 32))

(declare-fun lt!605635 () (_ BitVec 32))

(assert (=> b!1377146 (= call!65942 lt!605635)))

(assert (=> b!1377146 (= lt!605639 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!605638 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun lt!605640 () (_ BitVec 32))

(assert (=> b!1377146 (= call!65943 lt!605640)))

(declare-fun res!919956 () Bool)

(assert (=> start!116870 (=> (not res!919956) (not e!780097))))

(assert (=> start!116870 (= res!919956 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45702 a!4032))))))

(assert (=> start!116870 e!780097))

(assert (=> start!116870 true))

(declare-fun array_inv!34383 (array!93493) Bool)

(assert (=> start!116870 (array_inv!34383 a!4032)))

(declare-fun b!1377147 () Bool)

(declare-fun res!919960 () Bool)

(assert (=> b!1377147 (=> (not res!919960) (not e!780097))))

(assert (=> b!1377147 (= res!919960 (and (bvslt (size!45702 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45702 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1377148 () Bool)

(declare-fun lt!605637 () Unit!45508)

(assert (=> b!1377148 (= e!780096 lt!605637)))

(declare-fun lt!605641 () Unit!45508)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93493 (_ BitVec 32) (_ BitVec 32)) Unit!45508)

(assert (=> b!1377148 (= lt!605641 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377148 (= call!65942 (bvadd #b00000000000000000000000000000001 lt!605635))))

(assert (=> b!1377148 (= lt!605637 (lemmaValidKeyIncreasesNumOfKeys!0 lt!605638 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377148 (= call!65943 (bvadd #b00000000000000000000000000000001 lt!605640))))

(declare-fun b!1377149 () Bool)

(assert (=> b!1377149 (= e!780097 e!780099)))

(declare-fun res!919961 () Bool)

(assert (=> b!1377149 (=> (not res!919961) (not e!780099))))

(assert (=> b!1377149 (= res!919961 (and (= lt!605640 lt!605635) (not (= to!206 (size!45702 a!4032)))))))

(assert (=> b!1377149 (= lt!605635 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377149 (= lt!605640 (arrayCountValidKeys!0 lt!605638 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377149 (= lt!605638 (array!93494 (store (arr!45150 a!4032) i!1445 k!2947) (size!45702 a!4032)))))

(declare-fun bm!65940 () Bool)

(assert (=> bm!65940 (= call!65942 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1377150 () Bool)

(declare-fun res!919959 () Bool)

(assert (=> b!1377150 (=> (not res!919959) (not e!780097))))

(assert (=> b!1377150 (= res!919959 (validKeyInArray!0 (select (arr!45150 a!4032) i!1445)))))

(assert (= (and start!116870 res!919956) b!1377150))

(assert (= (and b!1377150 res!919959) b!1377144))

(assert (= (and b!1377144 res!919957) b!1377147))

(assert (= (and b!1377147 res!919960) b!1377149))

(assert (= (and b!1377149 res!919961) b!1377143))

(assert (= (and b!1377143 c!128036) b!1377148))

(assert (= (and b!1377143 (not c!128036)) b!1377146))

(assert (= (or b!1377148 b!1377146) bm!65940))

(assert (= (or b!1377148 b!1377146) bm!65939))

(assert (= (and b!1377143 res!919958) b!1377145))

(declare-fun m!1260947 () Bool)

(assert (=> bm!65939 m!1260947))

(assert (=> b!1377145 m!1260947))

(declare-fun m!1260949 () Bool)

(assert (=> b!1377145 m!1260949))

(declare-fun m!1260951 () Bool)

(assert (=> b!1377146 m!1260951))

(declare-fun m!1260953 () Bool)

(assert (=> b!1377146 m!1260953))

(declare-fun m!1260955 () Bool)

(assert (=> b!1377149 m!1260955))

(declare-fun m!1260957 () Bool)

(assert (=> b!1377149 m!1260957))

(declare-fun m!1260959 () Bool)

(assert (=> b!1377149 m!1260959))

(declare-fun m!1260961 () Bool)

(assert (=> b!1377144 m!1260961))

(declare-fun m!1260963 () Bool)

(assert (=> start!116870 m!1260963))

(declare-fun m!1260965 () Bool)

(assert (=> b!1377150 m!1260965))

(assert (=> b!1377150 m!1260965))

(declare-fun m!1260967 () Bool)

(assert (=> b!1377150 m!1260967))

(declare-fun m!1260969 () Bool)

(assert (=> b!1377148 m!1260969))

(declare-fun m!1260971 () Bool)

(assert (=> b!1377148 m!1260971))

(declare-fun m!1260973 () Bool)

(assert (=> b!1377143 m!1260973))

(assert (=> b!1377143 m!1260973))

(declare-fun m!1260975 () Bool)

(assert (=> b!1377143 m!1260975))

(assert (=> bm!65940 m!1260949))

(push 1)

(assert (not b!1377148))

(assert (not bm!65940))

(assert (not b!1377146))

(assert (not b!1377145))

(assert (not b!1377150))

(assert (not bm!65939))

(assert (not b!1377144))

(assert (not b!1377143))

(assert (not start!116870))

(assert (not b!1377149))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

