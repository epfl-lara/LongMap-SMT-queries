; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72092 () Bool)

(assert start!72092)

(declare-fun b!836658 () Bool)

(declare-fun e!466813 () Bool)

(declare-fun e!466816 () Bool)

(assert (=> b!836658 (= e!466813 e!466816)))

(declare-fun res!568920 () Bool)

(assert (=> b!836658 (=> (not res!568920) (not e!466816))))

(declare-datatypes ((array!46839 0))(
  ( (array!46840 (arr!22449 (Array (_ BitVec 32) (_ BitVec 64))) (size!22869 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46839)

(declare-fun lt!380359 () (_ BitVec 32))

(declare-fun lt!380360 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!836658 (= res!568920 (and (= lt!380359 lt!380360) (not (= to!390 (size!22869 a!4227)))))))

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46839 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!836658 (= lt!380360 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun lt!380363 () array!46839)

(assert (=> b!836658 (= lt!380359 (arrayCountValidKeys!0 lt!380363 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun k0!2968 () (_ BitVec 64))

(assert (=> b!836658 (= lt!380363 (array!46840 (store (arr!22449 a!4227) i!1466 k0!2968) (size!22869 a!4227)))))

(declare-fun bm!36769 () Bool)

(declare-fun call!36772 () (_ BitVec 32))

(assert (=> bm!36769 (= call!36772 (arrayCountValidKeys!0 lt!380363 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!836659 () Bool)

(declare-datatypes ((Unit!28762 0))(
  ( (Unit!28763) )
))
(declare-fun e!466815 () Unit!28762)

(declare-fun lt!380365 () Unit!28762)

(assert (=> b!836659 (= e!466815 lt!380365)))

(declare-fun lt!380364 () Unit!28762)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46839 (_ BitVec 32) (_ BitVec 32)) Unit!28762)

(assert (=> b!836659 (= lt!380364 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36773 () (_ BitVec 32))

(assert (=> b!836659 (= call!36773 lt!380360)))

(assert (=> b!836659 (= lt!380365 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!380363 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!836659 (= call!36772 lt!380359)))

(declare-fun b!836660 () Bool)

(declare-fun res!568919 () Bool)

(assert (=> b!836660 (=> (not res!568919) (not e!466813))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!836660 (= res!568919 (not (validKeyInArray!0 (select (arr!22449 a!4227) i!1466))))))

(declare-fun b!836661 () Bool)

(declare-fun lt!380366 () Unit!28762)

(assert (=> b!836661 (= e!466815 lt!380366)))

(declare-fun lt!380361 () Unit!28762)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46839 (_ BitVec 32) (_ BitVec 32)) Unit!28762)

(assert (=> b!836661 (= lt!380361 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!836661 (= call!36773 (bvadd #b00000000000000000000000000000001 lt!380360))))

(assert (=> b!836661 (= lt!380366 (lemmaValidKeyIncreasesNumOfKeys!0 lt!380363 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!836661 (= call!36772 (bvadd #b00000000000000000000000000000001 lt!380359))))

(declare-fun b!836662 () Bool)

(assert (=> b!836662 (= e!466816 (or (bvslt (bvadd #b00000000000000000000000000000001 to!390) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 to!390) (size!22869 a!4227)) (bvsle (bvadd #b00000000000000000000000000000001 to!390) i!1466)))))

(declare-fun lt!380362 () Unit!28762)

(assert (=> b!836662 (= lt!380362 e!466815)))

(declare-fun c!91268 () Bool)

(assert (=> b!836662 (= c!91268 (validKeyInArray!0 (select (arr!22449 a!4227) to!390)))))

(declare-fun bm!36770 () Bool)

(assert (=> bm!36770 (= call!36773 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun res!568923 () Bool)

(assert (=> start!72092 (=> (not res!568923) (not e!466813))))

(assert (=> start!72092 (= res!568923 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22869 a!4227))))))

(assert (=> start!72092 e!466813))

(assert (=> start!72092 true))

(declare-fun array_inv!17935 (array!46839) Bool)

(assert (=> start!72092 (array_inv!17935 a!4227)))

(declare-fun b!836663 () Bool)

(declare-fun res!568922 () Bool)

(assert (=> b!836663 (=> (not res!568922) (not e!466813))))

(assert (=> b!836663 (= res!568922 (validKeyInArray!0 k0!2968))))

(declare-fun b!836664 () Bool)

(declare-fun res!568921 () Bool)

(assert (=> b!836664 (=> (not res!568921) (not e!466813))))

(assert (=> b!836664 (= res!568921 (and (bvslt (size!22869 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22869 a!4227)) (bvsgt to!390 i!1466)))))

(assert (= (and start!72092 res!568923) b!836660))

(assert (= (and b!836660 res!568919) b!836663))

(assert (= (and b!836663 res!568922) b!836664))

(assert (= (and b!836664 res!568921) b!836658))

(assert (= (and b!836658 res!568920) b!836662))

(assert (= (and b!836662 c!91268) b!836661))

(assert (= (and b!836662 (not c!91268)) b!836659))

(assert (= (or b!836661 b!836659) bm!36769))

(assert (= (or b!836661 b!836659) bm!36770))

(declare-fun m!782329 () Bool)

(assert (=> bm!36769 m!782329))

(declare-fun m!782331 () Bool)

(assert (=> bm!36770 m!782331))

(declare-fun m!782333 () Bool)

(assert (=> b!836661 m!782333))

(declare-fun m!782335 () Bool)

(assert (=> b!836661 m!782335))

(declare-fun m!782337 () Bool)

(assert (=> b!836659 m!782337))

(declare-fun m!782339 () Bool)

(assert (=> b!836659 m!782339))

(declare-fun m!782341 () Bool)

(assert (=> b!836660 m!782341))

(assert (=> b!836660 m!782341))

(declare-fun m!782343 () Bool)

(assert (=> b!836660 m!782343))

(declare-fun m!782345 () Bool)

(assert (=> start!72092 m!782345))

(declare-fun m!782347 () Bool)

(assert (=> b!836662 m!782347))

(assert (=> b!836662 m!782347))

(declare-fun m!782349 () Bool)

(assert (=> b!836662 m!782349))

(declare-fun m!782351 () Bool)

(assert (=> b!836663 m!782351))

(declare-fun m!782353 () Bool)

(assert (=> b!836658 m!782353))

(declare-fun m!782355 () Bool)

(assert (=> b!836658 m!782355))

(declare-fun m!782357 () Bool)

(assert (=> b!836658 m!782357))

(check-sat (not b!836658) (not b!836662) (not bm!36770) (not bm!36769) (not b!836660) (not start!72092) (not b!836663) (not b!836661) (not b!836659))
(check-sat)
