; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116868 () Bool)

(assert start!116868)

(declare-fun b!1377133 () Bool)

(declare-fun e!780079 () Bool)

(declare-fun e!780082 () Bool)

(assert (=> b!1377133 (= e!780079 e!780082)))

(declare-fun res!919929 () Bool)

(assert (=> b!1377133 (=> (not res!919929) (not e!780082))))

(declare-fun lt!605746 () (_ BitVec 32))

(declare-fun to!206 () (_ BitVec 32))

(declare-datatypes ((array!93537 0))(
  ( (array!93538 (arr!45172 (Array (_ BitVec 32) (_ BitVec 64))) (size!45722 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93537)

(declare-fun lt!605745 () (_ BitVec 32))

(assert (=> b!1377133 (= res!919929 (and (= lt!605746 lt!605745) (not (= to!206 (size!45722 a!4032)))))))

(declare-fun i!1445 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93537 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1377133 (= lt!605745 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun lt!605752 () array!93537)

(assert (=> b!1377133 (= lt!605746 (arrayCountValidKeys!0 lt!605752 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k!2947 () (_ BitVec 64))

(assert (=> b!1377133 (= lt!605752 (array!93538 (store (arr!45172 a!4032) i!1445 k!2947) (size!45722 a!4032)))))

(declare-fun bm!65938 () Bool)

(declare-fun call!65941 () (_ BitVec 32))

(assert (=> bm!65938 (= call!65941 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1377134 () Bool)

(declare-fun res!919931 () Bool)

(assert (=> b!1377134 (=> (not res!919931) (not e!780079))))

(assert (=> b!1377134 (= res!919931 (and (bvslt (size!45722 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45722 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1377135 () Bool)

(declare-datatypes ((Unit!45661 0))(
  ( (Unit!45662) )
))
(declare-fun e!780080 () Unit!45661)

(declare-fun lt!605748 () Unit!45661)

(assert (=> b!1377135 (= e!780080 lt!605748)))

(declare-fun lt!605750 () Unit!45661)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93537 (_ BitVec 32) (_ BitVec 32)) Unit!45661)

(assert (=> b!1377135 (= lt!605750 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377135 (= call!65941 lt!605745)))

(assert (=> b!1377135 (= lt!605748 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!605752 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65942 () (_ BitVec 32))

(assert (=> b!1377135 (= call!65942 lt!605746)))

(declare-fun res!919933 () Bool)

(assert (=> start!116868 (=> (not res!919933) (not e!780079))))

(assert (=> start!116868 (= res!919933 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45722 a!4032))))))

(assert (=> start!116868 e!780079))

(assert (=> start!116868 true))

(declare-fun array_inv!34200 (array!93537) Bool)

(assert (=> start!116868 (array_inv!34200 a!4032)))

(declare-fun b!1377136 () Bool)

(assert (=> b!1377136 (= e!780082 (or (bvslt (bvadd #b00000000000000000000000000000001 to!206) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 to!206) (size!45722 a!4032)) (bvsle (bvadd #b00000000000000000000000000000001 to!206) i!1445)))))

(declare-fun lt!605747 () Unit!45661)

(assert (=> b!1377136 (= lt!605747 e!780080)))

(declare-fun c!128042 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377136 (= c!128042 (validKeyInArray!0 (select (arr!45172 a!4032) to!206)))))

(declare-fun bm!65939 () Bool)

(assert (=> bm!65939 (= call!65942 (arrayCountValidKeys!0 lt!605752 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1377137 () Bool)

(declare-fun res!919930 () Bool)

(assert (=> b!1377137 (=> (not res!919930) (not e!780079))))

(assert (=> b!1377137 (= res!919930 (not (validKeyInArray!0 k!2947)))))

(declare-fun b!1377138 () Bool)

(declare-fun res!919932 () Bool)

(assert (=> b!1377138 (=> (not res!919932) (not e!780079))))

(assert (=> b!1377138 (= res!919932 (validKeyInArray!0 (select (arr!45172 a!4032) i!1445)))))

(declare-fun b!1377139 () Bool)

(declare-fun lt!605751 () Unit!45661)

(assert (=> b!1377139 (= e!780080 lt!605751)))

(declare-fun lt!605749 () Unit!45661)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93537 (_ BitVec 32) (_ BitVec 32)) Unit!45661)

(assert (=> b!1377139 (= lt!605749 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377139 (= call!65941 (bvadd #b00000000000000000000000000000001 lt!605745))))

(assert (=> b!1377139 (= lt!605751 (lemmaValidKeyIncreasesNumOfKeys!0 lt!605752 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377139 (= call!65942 (bvadd #b00000000000000000000000000000001 lt!605746))))

(assert (= (and start!116868 res!919933) b!1377138))

(assert (= (and b!1377138 res!919932) b!1377137))

(assert (= (and b!1377137 res!919930) b!1377134))

(assert (= (and b!1377134 res!919931) b!1377133))

(assert (= (and b!1377133 res!919929) b!1377136))

(assert (= (and b!1377136 c!128042) b!1377139))

(assert (= (and b!1377136 (not c!128042)) b!1377135))

(assert (= (or b!1377139 b!1377135) bm!65939))

(assert (= (or b!1377139 b!1377135) bm!65938))

(declare-fun m!1261351 () Bool)

(assert (=> b!1377136 m!1261351))

(assert (=> b!1377136 m!1261351))

(declare-fun m!1261353 () Bool)

(assert (=> b!1377136 m!1261353))

(declare-fun m!1261355 () Bool)

(assert (=> bm!65938 m!1261355))

(declare-fun m!1261357 () Bool)

(assert (=> start!116868 m!1261357))

(declare-fun m!1261359 () Bool)

(assert (=> b!1377139 m!1261359))

(declare-fun m!1261361 () Bool)

(assert (=> b!1377139 m!1261361))

(declare-fun m!1261363 () Bool)

(assert (=> b!1377137 m!1261363))

(declare-fun m!1261365 () Bool)

(assert (=> bm!65939 m!1261365))

(declare-fun m!1261367 () Bool)

(assert (=> b!1377138 m!1261367))

(assert (=> b!1377138 m!1261367))

(declare-fun m!1261369 () Bool)

(assert (=> b!1377138 m!1261369))

(declare-fun m!1261371 () Bool)

(assert (=> b!1377135 m!1261371))

(declare-fun m!1261373 () Bool)

(assert (=> b!1377135 m!1261373))

(declare-fun m!1261375 () Bool)

(assert (=> b!1377133 m!1261375))

(declare-fun m!1261377 () Bool)

(assert (=> b!1377133 m!1261377))

(declare-fun m!1261379 () Bool)

(assert (=> b!1377133 m!1261379))

(push 1)

(assert (not b!1377135))

(assert (not start!116868))

(assert (not b!1377139))

(assert (not bm!65938))

(assert (not b!1377137))

(assert (not bm!65939))

(assert (not b!1377133))

(assert (not b!1377136))

(assert (not b!1377138))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

