; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116870 () Bool)

(assert start!116870)

(declare-datatypes ((array!93539 0))(
  ( (array!93540 (arr!45173 (Array (_ BitVec 32) (_ BitVec 64))) (size!45723 (_ BitVec 32))) )
))
(declare-fun lt!605772 () array!93539)

(declare-fun to!206 () (_ BitVec 32))

(declare-fun i!1445 () (_ BitVec 32))

(declare-fun bm!65944 () Bool)

(declare-fun call!65948 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93539 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!65944 (= call!65948 (arrayCountValidKeys!0 lt!605772 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1377156 () Bool)

(declare-fun res!919947 () Bool)

(declare-fun e!780095 () Bool)

(assert (=> b!1377156 (=> (not res!919947) (not e!780095))))

(declare-fun a!4032 () array!93539)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377156 (= res!919947 (validKeyInArray!0 (select (arr!45173 a!4032) i!1445)))))

(declare-fun b!1377157 () Bool)

(declare-fun res!919949 () Bool)

(assert (=> b!1377157 (=> (not res!919949) (not e!780095))))

(assert (=> b!1377157 (= res!919949 (and (bvslt (size!45723 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45723 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun call!65947 () (_ BitVec 32))

(declare-fun bm!65945 () Bool)

(assert (=> bm!65945 (= call!65947 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun e!780093 () Bool)

(declare-fun b!1377158 () Bool)

(assert (=> b!1377158 (= e!780093 (not (= (arrayCountValidKeys!0 lt!605772 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))))

(declare-fun b!1377159 () Bool)

(declare-datatypes ((Unit!45663 0))(
  ( (Unit!45664) )
))
(declare-fun e!780096 () Unit!45663)

(declare-fun lt!605770 () Unit!45663)

(assert (=> b!1377159 (= e!780096 lt!605770)))

(declare-fun lt!605776 () Unit!45663)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93539 (_ BitVec 32) (_ BitVec 32)) Unit!45663)

(assert (=> b!1377159 (= lt!605776 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun lt!605775 () (_ BitVec 32))

(assert (=> b!1377159 (= call!65947 (bvadd #b00000000000000000000000000000001 lt!605775))))

(assert (=> b!1377159 (= lt!605770 (lemmaValidKeyIncreasesNumOfKeys!0 lt!605772 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun lt!605769 () (_ BitVec 32))

(assert (=> b!1377159 (= call!65948 (bvadd #b00000000000000000000000000000001 lt!605769))))

(declare-fun res!919948 () Bool)

(assert (=> start!116870 (=> (not res!919948) (not e!780095))))

(assert (=> start!116870 (= res!919948 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45723 a!4032))))))

(assert (=> start!116870 e!780095))

(assert (=> start!116870 true))

(declare-fun array_inv!34201 (array!93539) Bool)

(assert (=> start!116870 (array_inv!34201 a!4032)))

(declare-fun b!1377160 () Bool)

(declare-fun e!780094 () Bool)

(assert (=> b!1377160 (= e!780094 e!780093)))

(declare-fun res!919951 () Bool)

(assert (=> b!1377160 (=> (not res!919951) (not e!780093))))

(assert (=> b!1377160 (= res!919951 (and (bvsge (bvadd #b00000000000000000000000000000001 to!206) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!206) (size!45723 a!4032)) (bvsgt (bvadd #b00000000000000000000000000000001 to!206) i!1445)))))

(declare-fun lt!605771 () Unit!45663)

(assert (=> b!1377160 (= lt!605771 e!780096)))

(declare-fun c!128045 () Bool)

(assert (=> b!1377160 (= c!128045 (validKeyInArray!0 (select (arr!45173 a!4032) to!206)))))

(declare-fun b!1377161 () Bool)

(declare-fun lt!605774 () Unit!45663)

(assert (=> b!1377161 (= e!780096 lt!605774)))

(declare-fun lt!605773 () Unit!45663)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93539 (_ BitVec 32) (_ BitVec 32)) Unit!45663)

(assert (=> b!1377161 (= lt!605773 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377161 (= call!65947 lt!605775)))

(assert (=> b!1377161 (= lt!605774 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!605772 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377161 (= call!65948 lt!605769)))

(declare-fun b!1377162 () Bool)

(declare-fun res!919950 () Bool)

(assert (=> b!1377162 (=> (not res!919950) (not e!780095))))

(declare-fun k!2947 () (_ BitVec 64))

(assert (=> b!1377162 (= res!919950 (not (validKeyInArray!0 k!2947)))))

(declare-fun b!1377163 () Bool)

(assert (=> b!1377163 (= e!780095 e!780094)))

(declare-fun res!919946 () Bool)

(assert (=> b!1377163 (=> (not res!919946) (not e!780094))))

(assert (=> b!1377163 (= res!919946 (and (= lt!605769 lt!605775) (not (= to!206 (size!45723 a!4032)))))))

(assert (=> b!1377163 (= lt!605775 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377163 (= lt!605769 (arrayCountValidKeys!0 lt!605772 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377163 (= lt!605772 (array!93540 (store (arr!45173 a!4032) i!1445 k!2947) (size!45723 a!4032)))))

(assert (= (and start!116870 res!919948) b!1377156))

(assert (= (and b!1377156 res!919947) b!1377162))

(assert (= (and b!1377162 res!919950) b!1377157))

(assert (= (and b!1377157 res!919949) b!1377163))

(assert (= (and b!1377163 res!919946) b!1377160))

(assert (= (and b!1377160 c!128045) b!1377159))

(assert (= (and b!1377160 (not c!128045)) b!1377161))

(assert (= (or b!1377159 b!1377161) bm!65945))

(assert (= (or b!1377159 b!1377161) bm!65944))

(assert (= (and b!1377160 res!919951) b!1377158))

(declare-fun m!1261381 () Bool)

(assert (=> b!1377158 m!1261381))

(declare-fun m!1261383 () Bool)

(assert (=> b!1377158 m!1261383))

(declare-fun m!1261385 () Bool)

(assert (=> b!1377159 m!1261385))

(declare-fun m!1261387 () Bool)

(assert (=> b!1377159 m!1261387))

(assert (=> bm!65945 m!1261383))

(assert (=> bm!65944 m!1261381))

(declare-fun m!1261389 () Bool)

(assert (=> b!1377162 m!1261389))

(declare-fun m!1261391 () Bool)

(assert (=> start!116870 m!1261391))

(declare-fun m!1261393 () Bool)

(assert (=> b!1377160 m!1261393))

(assert (=> b!1377160 m!1261393))

(declare-fun m!1261395 () Bool)

(assert (=> b!1377160 m!1261395))

(declare-fun m!1261397 () Bool)

(assert (=> b!1377156 m!1261397))

(assert (=> b!1377156 m!1261397))

(declare-fun m!1261399 () Bool)

(assert (=> b!1377156 m!1261399))

(declare-fun m!1261401 () Bool)

(assert (=> b!1377161 m!1261401))

(declare-fun m!1261403 () Bool)

(assert (=> b!1377161 m!1261403))

(declare-fun m!1261405 () Bool)

(assert (=> b!1377163 m!1261405))

(declare-fun m!1261407 () Bool)

(assert (=> b!1377163 m!1261407))

(declare-fun m!1261409 () Bool)

(assert (=> b!1377163 m!1261409))

(push 1)

(assert (not b!1377163))

(assert (not start!116870))

(assert (not b!1377161))

(assert (not b!1377159))

(assert (not b!1377160))

(assert (not b!1377156))

(assert (not bm!65944))

(assert (not b!1377162))

(assert (not bm!65945))

(assert (not b!1377158))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

