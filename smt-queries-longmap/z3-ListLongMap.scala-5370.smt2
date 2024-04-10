; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71820 () Bool)

(assert start!71820)

(declare-fun bm!36622 () Bool)

(declare-datatypes ((array!46730 0))(
  ( (array!46731 (arr!22399 (Array (_ BitVec 32) (_ BitVec 64))) (size!22820 (_ BitVec 32))) )
))
(declare-fun lt!379430 () array!46730)

(declare-fun call!36626 () (_ BitVec 32))

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46730 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!36622 (= call!36626 (arrayCountValidKeys!0 lt!379430 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun res!567663 () Bool)

(declare-fun e!465737 () Bool)

(assert (=> start!71820 (=> (not res!567663) (not e!465737))))

(declare-fun a!4227 () array!46730)

(assert (=> start!71820 (= res!567663 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22820 a!4227))))))

(assert (=> start!71820 e!465737))

(assert (=> start!71820 true))

(declare-fun array_inv!17846 (array!46730) Bool)

(assert (=> start!71820 (array_inv!17846 a!4227)))

(declare-fun b!834747 () Bool)

(declare-fun res!567664 () Bool)

(declare-fun e!465740 () Bool)

(assert (=> b!834747 (=> (not res!567664) (not e!465740))))

(assert (=> b!834747 (= res!567664 (= (arrayCountValidKeys!0 lt!379430 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390))))))

(declare-fun b!834748 () Bool)

(declare-datatypes ((Unit!28691 0))(
  ( (Unit!28692) )
))
(declare-fun e!465739 () Unit!28691)

(declare-fun lt!379429 () Unit!28691)

(assert (=> b!834748 (= e!465739 lt!379429)))

(declare-fun lt!379431 () Unit!28691)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46730 (_ BitVec 32) (_ BitVec 32)) Unit!28691)

(assert (=> b!834748 (= lt!379431 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36625 () (_ BitVec 32))

(declare-fun lt!379427 () (_ BitVec 32))

(assert (=> b!834748 (= call!36625 lt!379427)))

(assert (=> b!834748 (= lt!379429 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!379430 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun lt!379434 () (_ BitVec 32))

(assert (=> b!834748 (= call!36626 lt!379434)))

(declare-fun b!834749 () Bool)

(assert (=> b!834749 (= e!465740 (not true))))

(assert (=> b!834749 (= (arrayCountValidKeys!0 lt!379430 (bvadd #b00000000000000000000000000000001 i!1466) (size!22820 a!4227)) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (size!22820 a!4227)))))

(declare-fun k0!2968 () (_ BitVec 64))

(declare-fun lt!379432 () Unit!28691)

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!46730 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!28691)

(assert (=> b!834749 (= lt!379432 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4227 i!1466 k0!2968 (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!834750 () Bool)

(declare-fun res!567668 () Bool)

(assert (=> b!834750 (=> (not res!567668) (not e!465737))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!834750 (= res!567668 (validKeyInArray!0 k0!2968))))

(declare-fun b!834751 () Bool)

(declare-fun res!567665 () Bool)

(assert (=> b!834751 (=> (not res!567665) (not e!465737))))

(assert (=> b!834751 (= res!567665 (and (bvslt (size!22820 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22820 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!834752 () Bool)

(declare-fun e!465738 () Bool)

(assert (=> b!834752 (= e!465737 e!465738)))

(declare-fun res!567667 () Bool)

(assert (=> b!834752 (=> (not res!567667) (not e!465738))))

(assert (=> b!834752 (= res!567667 (and (= lt!379434 lt!379427) (not (= to!390 (size!22820 a!4227)))))))

(assert (=> b!834752 (= lt!379427 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834752 (= lt!379434 (arrayCountValidKeys!0 lt!379430 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834752 (= lt!379430 (array!46731 (store (arr!22399 a!4227) i!1466 k0!2968) (size!22820 a!4227)))))

(declare-fun b!834753 () Bool)

(declare-fun res!567662 () Bool)

(assert (=> b!834753 (=> (not res!567662) (not e!465737))))

(assert (=> b!834753 (= res!567662 (not (validKeyInArray!0 (select (arr!22399 a!4227) i!1466))))))

(declare-fun b!834754 () Bool)

(declare-fun lt!379435 () Unit!28691)

(assert (=> b!834754 (= e!465739 lt!379435)))

(declare-fun lt!379433 () Unit!28691)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46730 (_ BitVec 32) (_ BitVec 32)) Unit!28691)

(assert (=> b!834754 (= lt!379433 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834754 (= call!36625 (bvadd #b00000000000000000000000000000001 lt!379427))))

(assert (=> b!834754 (= lt!379435 (lemmaValidKeyIncreasesNumOfKeys!0 lt!379430 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834754 (= call!36626 (bvadd #b00000000000000000000000000000001 lt!379434))))

(declare-fun b!834755 () Bool)

(assert (=> b!834755 (= e!465738 e!465740)))

(declare-fun res!567666 () Bool)

(assert (=> b!834755 (=> (not res!567666) (not e!465740))))

(assert (=> b!834755 (= res!567666 (and (bvsge (bvadd #b00000000000000000000000000000001 to!390) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!390) (size!22820 a!4227)) (bvsgt (bvadd #b00000000000000000000000000000001 to!390) i!1466)))))

(declare-fun lt!379428 () Unit!28691)

(assert (=> b!834755 (= lt!379428 e!465739)))

(declare-fun c!90938 () Bool)

(assert (=> b!834755 (= c!90938 (validKeyInArray!0 (select (arr!22399 a!4227) to!390)))))

(declare-fun bm!36623 () Bool)

(assert (=> bm!36623 (= call!36625 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(assert (= (and start!71820 res!567663) b!834753))

(assert (= (and b!834753 res!567662) b!834750))

(assert (= (and b!834750 res!567668) b!834751))

(assert (= (and b!834751 res!567665) b!834752))

(assert (= (and b!834752 res!567667) b!834755))

(assert (= (and b!834755 c!90938) b!834754))

(assert (= (and b!834755 (not c!90938)) b!834748))

(assert (= (or b!834754 b!834748) bm!36622))

(assert (= (or b!834754 b!834748) bm!36623))

(assert (= (and b!834755 res!567666) b!834747))

(assert (= (and b!834747 res!567664) b!834749))

(declare-fun m!779825 () Bool)

(assert (=> b!834754 m!779825))

(declare-fun m!779827 () Bool)

(assert (=> b!834754 m!779827))

(declare-fun m!779829 () Bool)

(assert (=> bm!36623 m!779829))

(declare-fun m!779831 () Bool)

(assert (=> b!834749 m!779831))

(declare-fun m!779833 () Bool)

(assert (=> b!834749 m!779833))

(declare-fun m!779835 () Bool)

(assert (=> b!834749 m!779835))

(declare-fun m!779837 () Bool)

(assert (=> bm!36622 m!779837))

(declare-fun m!779839 () Bool)

(assert (=> b!834752 m!779839))

(declare-fun m!779841 () Bool)

(assert (=> b!834752 m!779841))

(declare-fun m!779843 () Bool)

(assert (=> b!834752 m!779843))

(declare-fun m!779845 () Bool)

(assert (=> start!71820 m!779845))

(declare-fun m!779847 () Bool)

(assert (=> b!834748 m!779847))

(declare-fun m!779849 () Bool)

(assert (=> b!834748 m!779849))

(assert (=> b!834747 m!779837))

(assert (=> b!834747 m!779829))

(declare-fun m!779851 () Bool)

(assert (=> b!834755 m!779851))

(assert (=> b!834755 m!779851))

(declare-fun m!779853 () Bool)

(assert (=> b!834755 m!779853))

(declare-fun m!779855 () Bool)

(assert (=> b!834753 m!779855))

(assert (=> b!834753 m!779855))

(declare-fun m!779857 () Bool)

(assert (=> b!834753 m!779857))

(declare-fun m!779859 () Bool)

(assert (=> b!834750 m!779859))

(check-sat (not b!834753) (not bm!36623) (not b!834750) (not b!834747) (not b!834755) (not b!834752) (not b!834748) (not bm!36622) (not b!834754) (not start!71820) (not b!834749))
(check-sat)
