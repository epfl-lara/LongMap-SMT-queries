; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117104 () Bool)

(assert start!117104)

(declare-fun to!206 () (_ BitVec 32))

(declare-datatypes ((array!93659 0))(
  ( (array!93660 (arr!45228 (Array (_ BitVec 32) (_ BitVec 64))) (size!45779 (_ BitVec 32))) )
))
(declare-fun lt!606302 () array!93659)

(declare-fun call!66028 () (_ BitVec 32))

(declare-fun bm!66024 () Bool)

(declare-fun i!1445 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93659 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!66024 (= call!66028 (arrayCountValidKeys!0 lt!606302 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun res!920503 () Bool)

(declare-fun e!780975 () Bool)

(assert (=> start!117104 (=> (not res!920503) (not e!780975))))

(declare-fun a!4032 () array!93659)

(assert (=> start!117104 (= res!920503 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45779 a!4032))))))

(assert (=> start!117104 e!780975))

(assert (=> start!117104 true))

(declare-fun array_inv!34509 (array!93659) Bool)

(assert (=> start!117104 (array_inv!34509 a!4032)))

(declare-fun b!1378518 () Bool)

(declare-fun res!920506 () Bool)

(assert (=> b!1378518 (=> (not res!920506) (not e!780975))))

(assert (=> b!1378518 (= res!920506 (and (bvslt (size!45779 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45779 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1378519 () Bool)

(declare-datatypes ((Unit!45606 0))(
  ( (Unit!45607) )
))
(declare-fun e!780977 () Unit!45606)

(declare-fun lt!606299 () Unit!45606)

(assert (=> b!1378519 (= e!780977 lt!606299)))

(declare-fun lt!606306 () Unit!45606)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93659 (_ BitVec 32) (_ BitVec 32)) Unit!45606)

(assert (=> b!1378519 (= lt!606306 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!66027 () (_ BitVec 32))

(declare-fun lt!606305 () (_ BitVec 32))

(assert (=> b!1378519 (= call!66027 lt!606305)))

(assert (=> b!1378519 (= lt!606299 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!606302 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun lt!606304 () (_ BitVec 32))

(assert (=> b!1378519 (= call!66028 lt!606304)))

(declare-fun e!780976 () Bool)

(declare-fun b!1378520 () Bool)

(assert (=> b!1378520 (= e!780976 (not (= (arrayCountValidKeys!0 lt!606302 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))))

(declare-fun bm!66025 () Bool)

(assert (=> bm!66025 (= call!66027 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1378521 () Bool)

(declare-fun e!780979 () Bool)

(assert (=> b!1378521 (= e!780975 e!780979)))

(declare-fun res!920507 () Bool)

(assert (=> b!1378521 (=> (not res!920507) (not e!780979))))

(assert (=> b!1378521 (= res!920507 (and (= lt!606304 lt!606305) (not (= to!206 (size!45779 a!4032)))))))

(assert (=> b!1378521 (= lt!606305 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1378521 (= lt!606304 (arrayCountValidKeys!0 lt!606302 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k!2947 () (_ BitVec 64))

(assert (=> b!1378521 (= lt!606302 (array!93660 (store (arr!45228 a!4032) i!1445 k!2947) (size!45779 a!4032)))))

(declare-fun b!1378522 () Bool)

(declare-fun lt!606300 () Unit!45606)

(assert (=> b!1378522 (= e!780977 lt!606300)))

(declare-fun lt!606303 () Unit!45606)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93659 (_ BitVec 32) (_ BitVec 32)) Unit!45606)

(assert (=> b!1378522 (= lt!606303 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1378522 (= call!66027 (bvadd #b00000000000000000000000000000001 lt!606305))))

(assert (=> b!1378522 (= lt!606300 (lemmaValidKeyIncreasesNumOfKeys!0 lt!606302 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1378522 (= call!66028 (bvadd #b00000000000000000000000000000001 lt!606304))))

(declare-fun b!1378523 () Bool)

(declare-fun res!920504 () Bool)

(assert (=> b!1378523 (=> (not res!920504) (not e!780975))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378523 (= res!920504 (validKeyInArray!0 (select (arr!45228 a!4032) i!1445)))))

(declare-fun b!1378524 () Bool)

(assert (=> b!1378524 (= e!780979 e!780976)))

(declare-fun res!920505 () Bool)

(assert (=> b!1378524 (=> (not res!920505) (not e!780976))))

(assert (=> b!1378524 (= res!920505 (and (bvsge (bvadd #b00000000000000000000000000000001 to!206) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!206) (size!45779 a!4032)) (bvsgt (bvadd #b00000000000000000000000000000001 to!206) i!1445)))))

(declare-fun lt!606301 () Unit!45606)

(assert (=> b!1378524 (= lt!606301 e!780977)))

(declare-fun c!128455 () Bool)

(assert (=> b!1378524 (= c!128455 (validKeyInArray!0 (select (arr!45228 a!4032) to!206)))))

(declare-fun b!1378525 () Bool)

(declare-fun res!920508 () Bool)

(assert (=> b!1378525 (=> (not res!920508) (not e!780975))))

(assert (=> b!1378525 (= res!920508 (not (validKeyInArray!0 k!2947)))))

(assert (= (and start!117104 res!920503) b!1378523))

(assert (= (and b!1378523 res!920504) b!1378525))

(assert (= (and b!1378525 res!920508) b!1378518))

(assert (= (and b!1378518 res!920506) b!1378521))

(assert (= (and b!1378521 res!920507) b!1378524))

(assert (= (and b!1378524 c!128455) b!1378522))

(assert (= (and b!1378524 (not c!128455)) b!1378519))

(assert (= (or b!1378522 b!1378519) bm!66025))

(assert (= (or b!1378522 b!1378519) bm!66024))

(assert (= (and b!1378524 res!920505) b!1378520))

(declare-fun m!1263081 () Bool)

(assert (=> b!1378523 m!1263081))

(assert (=> b!1378523 m!1263081))

(declare-fun m!1263083 () Bool)

(assert (=> b!1378523 m!1263083))

(declare-fun m!1263085 () Bool)

(assert (=> b!1378521 m!1263085))

(declare-fun m!1263087 () Bool)

(assert (=> b!1378521 m!1263087))

(declare-fun m!1263089 () Bool)

(assert (=> b!1378521 m!1263089))

(declare-fun m!1263091 () Bool)

(assert (=> start!117104 m!1263091))

(declare-fun m!1263093 () Bool)

(assert (=> b!1378522 m!1263093))

(declare-fun m!1263095 () Bool)

(assert (=> b!1378522 m!1263095))

(declare-fun m!1263097 () Bool)

(assert (=> bm!66025 m!1263097))

(declare-fun m!1263099 () Bool)

(assert (=> bm!66024 m!1263099))

(declare-fun m!1263101 () Bool)

(assert (=> b!1378524 m!1263101))

(assert (=> b!1378524 m!1263101))

(declare-fun m!1263103 () Bool)

(assert (=> b!1378524 m!1263103))

(declare-fun m!1263105 () Bool)

(assert (=> b!1378519 m!1263105))

(declare-fun m!1263107 () Bool)

(assert (=> b!1378519 m!1263107))

(declare-fun m!1263109 () Bool)

(assert (=> b!1378525 m!1263109))

(assert (=> b!1378520 m!1263099))

(assert (=> b!1378520 m!1263097))

(push 1)

(assert (not b!1378519))

(assert (not b!1378525))

(assert (not b!1378523))

(assert (not b!1378524))

(assert (not b!1378522))

(assert (not bm!66025))

(assert (not bm!66024))

(assert (not b!1378521))

(assert (not start!117104))

(assert (not b!1378520))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

