; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71810 () Bool)

(assert start!71810)

(declare-fun bm!36626 () Bool)

(declare-fun call!36629 () (_ BitVec 32))

(declare-datatypes ((array!46709 0))(
  ( (array!46710 (arr!22389 (Array (_ BitVec 32) (_ BitVec 64))) (size!22810 (_ BitVec 32))) )
))
(declare-fun lt!379323 () array!46709)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46709 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!36626 (= call!36629 (arrayCountValidKeys!0 lt!379323 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!834640 () Bool)

(declare-fun e!465665 () Bool)

(declare-fun e!465666 () Bool)

(assert (=> b!834640 (= e!465665 e!465666)))

(declare-fun res!567662 () Bool)

(assert (=> b!834640 (=> (not res!567662) (not e!465666))))

(declare-fun a!4227 () array!46709)

(declare-fun lt!379331 () (_ BitVec 32))

(declare-fun lt!379326 () (_ BitVec 32))

(assert (=> b!834640 (= res!567662 (and (= lt!379331 lt!379326) (not (= to!390 (size!22810 a!4227)))))))

(assert (=> b!834640 (= lt!379326 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834640 (= lt!379331 (arrayCountValidKeys!0 lt!379323 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun k0!2968 () (_ BitVec 64))

(assert (=> b!834640 (= lt!379323 (array!46710 (store (arr!22389 a!4227) i!1466 k0!2968) (size!22810 a!4227)))))

(declare-fun b!834641 () Bool)

(declare-datatypes ((Unit!28649 0))(
  ( (Unit!28650) )
))
(declare-fun e!465668 () Unit!28649)

(declare-fun lt!379328 () Unit!28649)

(assert (=> b!834641 (= e!465668 lt!379328)))

(declare-fun lt!379325 () Unit!28649)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46709 (_ BitVec 32) (_ BitVec 32)) Unit!28649)

(assert (=> b!834641 (= lt!379325 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36630 () (_ BitVec 32))

(assert (=> b!834641 (= call!36630 (bvadd #b00000000000000000000000000000001 lt!379326))))

(assert (=> b!834641 (= lt!379328 (lemmaValidKeyIncreasesNumOfKeys!0 lt!379323 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834641 (= call!36629 (bvadd #b00000000000000000000000000000001 lt!379331))))

(declare-fun b!834642 () Bool)

(declare-fun e!465667 () Bool)

(assert (=> b!834642 (= e!465667 (not true))))

(assert (=> b!834642 (= (arrayCountValidKeys!0 lt!379323 (bvadd #b00000000000000000000000000000001 i!1466) (size!22810 a!4227)) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (size!22810 a!4227)))))

(declare-fun lt!379330 () Unit!28649)

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!46709 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!28649)

(assert (=> b!834642 (= lt!379330 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4227 i!1466 k0!2968 (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!834643 () Bool)

(declare-fun res!567661 () Bool)

(assert (=> b!834643 (=> (not res!567661) (not e!465665))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!834643 (= res!567661 (validKeyInArray!0 k0!2968))))

(declare-fun res!567667 () Bool)

(assert (=> start!71810 (=> (not res!567667) (not e!465665))))

(assert (=> start!71810 (= res!567667 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22810 a!4227))))))

(assert (=> start!71810 e!465665))

(assert (=> start!71810 true))

(declare-fun array_inv!17901 (array!46709) Bool)

(assert (=> start!71810 (array_inv!17901 a!4227)))

(declare-fun b!834644 () Bool)

(declare-fun res!567666 () Bool)

(assert (=> b!834644 (=> (not res!567666) (not e!465665))))

(assert (=> b!834644 (= res!567666 (not (validKeyInArray!0 (select (arr!22389 a!4227) i!1466))))))

(declare-fun b!834645 () Bool)

(assert (=> b!834645 (= e!465666 e!465667)))

(declare-fun res!567664 () Bool)

(assert (=> b!834645 (=> (not res!567664) (not e!465667))))

(assert (=> b!834645 (= res!567664 (and (bvsge (bvadd #b00000000000000000000000000000001 to!390) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!390) (size!22810 a!4227)) (bvsgt (bvadd #b00000000000000000000000000000001 to!390) i!1466)))))

(declare-fun lt!379324 () Unit!28649)

(assert (=> b!834645 (= lt!379324 e!465668)))

(declare-fun c!90885 () Bool)

(assert (=> b!834645 (= c!90885 (validKeyInArray!0 (select (arr!22389 a!4227) to!390)))))

(declare-fun bm!36627 () Bool)

(assert (=> bm!36627 (= call!36630 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!834646 () Bool)

(declare-fun res!567665 () Bool)

(assert (=> b!834646 (=> (not res!567665) (not e!465667))))

(assert (=> b!834646 (= res!567665 (= (arrayCountValidKeys!0 lt!379323 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390))))))

(declare-fun b!834647 () Bool)

(declare-fun lt!379327 () Unit!28649)

(assert (=> b!834647 (= e!465668 lt!379327)))

(declare-fun lt!379329 () Unit!28649)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46709 (_ BitVec 32) (_ BitVec 32)) Unit!28649)

(assert (=> b!834647 (= lt!379329 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834647 (= call!36630 lt!379326)))

(assert (=> b!834647 (= lt!379327 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!379323 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834647 (= call!36629 lt!379331)))

(declare-fun b!834648 () Bool)

(declare-fun res!567663 () Bool)

(assert (=> b!834648 (=> (not res!567663) (not e!465665))))

(assert (=> b!834648 (= res!567663 (and (bvslt (size!22810 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22810 a!4227)) (bvsgt to!390 i!1466)))))

(assert (= (and start!71810 res!567667) b!834644))

(assert (= (and b!834644 res!567666) b!834643))

(assert (= (and b!834643 res!567661) b!834648))

(assert (= (and b!834648 res!567663) b!834640))

(assert (= (and b!834640 res!567662) b!834645))

(assert (= (and b!834645 c!90885) b!834641))

(assert (= (and b!834645 (not c!90885)) b!834647))

(assert (= (or b!834641 b!834647) bm!36626))

(assert (= (or b!834641 b!834647) bm!36627))

(assert (= (and b!834645 res!567664) b!834646))

(assert (= (and b!834646 res!567665) b!834642))

(declare-fun m!779253 () Bool)

(assert (=> b!834643 m!779253))

(declare-fun m!779255 () Bool)

(assert (=> bm!36626 m!779255))

(declare-fun m!779257 () Bool)

(assert (=> b!834645 m!779257))

(assert (=> b!834645 m!779257))

(declare-fun m!779259 () Bool)

(assert (=> b!834645 m!779259))

(declare-fun m!779261 () Bool)

(assert (=> b!834640 m!779261))

(declare-fun m!779263 () Bool)

(assert (=> b!834640 m!779263))

(declare-fun m!779265 () Bool)

(assert (=> b!834640 m!779265))

(declare-fun m!779267 () Bool)

(assert (=> bm!36627 m!779267))

(declare-fun m!779269 () Bool)

(assert (=> start!71810 m!779269))

(declare-fun m!779271 () Bool)

(assert (=> b!834641 m!779271))

(declare-fun m!779273 () Bool)

(assert (=> b!834641 m!779273))

(declare-fun m!779275 () Bool)

(assert (=> b!834647 m!779275))

(declare-fun m!779277 () Bool)

(assert (=> b!834647 m!779277))

(declare-fun m!779279 () Bool)

(assert (=> b!834644 m!779279))

(assert (=> b!834644 m!779279))

(declare-fun m!779281 () Bool)

(assert (=> b!834644 m!779281))

(declare-fun m!779283 () Bool)

(assert (=> b!834642 m!779283))

(declare-fun m!779285 () Bool)

(assert (=> b!834642 m!779285))

(declare-fun m!779287 () Bool)

(assert (=> b!834642 m!779287))

(assert (=> b!834646 m!779255))

(assert (=> b!834646 m!779267))

(check-sat (not b!834643) (not start!71810) (not b!834640) (not b!834641) (not b!834642) (not b!834644) (not b!834645) (not bm!36626) (not bm!36627) (not b!834646) (not b!834647))
(check-sat)
