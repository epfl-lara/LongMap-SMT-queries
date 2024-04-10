; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71824 () Bool)

(assert start!71824)

(declare-fun b!834801 () Bool)

(declare-datatypes ((Unit!28695 0))(
  ( (Unit!28696) )
))
(declare-fun e!465771 () Unit!28695)

(declare-fun lt!379482 () Unit!28695)

(assert (=> b!834801 (= e!465771 lt!379482)))

(declare-datatypes ((array!46734 0))(
  ( (array!46735 (arr!22401 (Array (_ BitVec 32) (_ BitVec 64))) (size!22822 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46734)

(declare-fun lt!379484 () Unit!28695)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46734 (_ BitVec 32) (_ BitVec 32)) Unit!28695)

(assert (=> b!834801 (= lt!379484 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36637 () (_ BitVec 32))

(declare-fun lt!379489 () (_ BitVec 32))

(assert (=> b!834801 (= call!36637 (bvadd #b00000000000000000000000000000001 lt!379489))))

(declare-fun lt!379487 () array!46734)

(assert (=> b!834801 (= lt!379482 (lemmaValidKeyIncreasesNumOfKeys!0 lt!379487 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36638 () (_ BitVec 32))

(declare-fun lt!379486 () (_ BitVec 32))

(assert (=> b!834801 (= call!36638 (bvadd #b00000000000000000000000000000001 lt!379486))))

(declare-fun b!834802 () Bool)

(declare-fun e!465767 () Bool)

(assert (=> b!834802 (= e!465767 (not (bvsge (bvadd #b00000000000000000000000000000001 i!1466) #b00000000000000000000000000000000)))))

(declare-fun arrayCountValidKeys!0 (array!46734 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!834802 (= (arrayCountValidKeys!0 lt!379487 (bvadd #b00000000000000000000000000000001 i!1466) (size!22822 a!4227)) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (size!22822 a!4227)))))

(declare-fun lt!379483 () Unit!28695)

(declare-fun k!2968 () (_ BitVec 64))

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!46734 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!28695)

(assert (=> b!834802 (= lt!379483 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4227 i!1466 k!2968 (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun bm!36634 () Bool)

(assert (=> bm!36634 (= call!36637 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!834803 () Bool)

(declare-fun e!465770 () Bool)

(assert (=> b!834803 (= e!465770 e!465767)))

(declare-fun res!567704 () Bool)

(assert (=> b!834803 (=> (not res!567704) (not e!465767))))

(assert (=> b!834803 (= res!567704 (and (bvsge (bvadd #b00000000000000000000000000000001 to!390) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!390) (size!22822 a!4227)) (bvsgt (bvadd #b00000000000000000000000000000001 to!390) i!1466)))))

(declare-fun lt!379485 () Unit!28695)

(assert (=> b!834803 (= lt!379485 e!465771)))

(declare-fun c!90944 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!834803 (= c!90944 (validKeyInArray!0 (select (arr!22401 a!4227) to!390)))))

(declare-fun b!834804 () Bool)

(declare-fun res!567709 () Bool)

(declare-fun e!465769 () Bool)

(assert (=> b!834804 (=> (not res!567709) (not e!465769))))

(assert (=> b!834804 (= res!567709 (validKeyInArray!0 k!2968))))

(declare-fun res!567710 () Bool)

(assert (=> start!71824 (=> (not res!567710) (not e!465769))))

(assert (=> start!71824 (= res!567710 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22822 a!4227))))))

(assert (=> start!71824 e!465769))

(assert (=> start!71824 true))

(declare-fun array_inv!17848 (array!46734) Bool)

(assert (=> start!71824 (array_inv!17848 a!4227)))

(declare-fun b!834805 () Bool)

(declare-fun res!567706 () Bool)

(assert (=> b!834805 (=> (not res!567706) (not e!465769))))

(assert (=> b!834805 (= res!567706 (and (bvslt (size!22822 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22822 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!834806 () Bool)

(declare-fun lt!379481 () Unit!28695)

(assert (=> b!834806 (= e!465771 lt!379481)))

(declare-fun lt!379488 () Unit!28695)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46734 (_ BitVec 32) (_ BitVec 32)) Unit!28695)

(assert (=> b!834806 (= lt!379488 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834806 (= call!36637 lt!379489)))

(assert (=> b!834806 (= lt!379481 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!379487 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834806 (= call!36638 lt!379486)))

(declare-fun b!834807 () Bool)

(assert (=> b!834807 (= e!465769 e!465770)))

(declare-fun res!567708 () Bool)

(assert (=> b!834807 (=> (not res!567708) (not e!465770))))

(assert (=> b!834807 (= res!567708 (and (= lt!379486 lt!379489) (not (= to!390 (size!22822 a!4227)))))))

(assert (=> b!834807 (= lt!379489 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834807 (= lt!379486 (arrayCountValidKeys!0 lt!379487 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834807 (= lt!379487 (array!46735 (store (arr!22401 a!4227) i!1466 k!2968) (size!22822 a!4227)))))

(declare-fun b!834808 () Bool)

(declare-fun res!567707 () Bool)

(assert (=> b!834808 (=> (not res!567707) (not e!465767))))

(assert (=> b!834808 (= res!567707 (= (arrayCountValidKeys!0 lt!379487 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390))))))

(declare-fun bm!36635 () Bool)

(assert (=> bm!36635 (= call!36638 (arrayCountValidKeys!0 lt!379487 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!834809 () Bool)

(declare-fun res!567705 () Bool)

(assert (=> b!834809 (=> (not res!567705) (not e!465769))))

(assert (=> b!834809 (= res!567705 (not (validKeyInArray!0 (select (arr!22401 a!4227) i!1466))))))

(assert (= (and start!71824 res!567710) b!834809))

(assert (= (and b!834809 res!567705) b!834804))

(assert (= (and b!834804 res!567709) b!834805))

(assert (= (and b!834805 res!567706) b!834807))

(assert (= (and b!834807 res!567708) b!834803))

(assert (= (and b!834803 c!90944) b!834801))

(assert (= (and b!834803 (not c!90944)) b!834806))

(assert (= (or b!834801 b!834806) bm!36635))

(assert (= (or b!834801 b!834806) bm!36634))

(assert (= (and b!834803 res!567704) b!834808))

(assert (= (and b!834808 res!567707) b!834802))

(declare-fun m!779897 () Bool)

(assert (=> start!71824 m!779897))

(declare-fun m!779899 () Bool)

(assert (=> b!834804 m!779899))

(declare-fun m!779901 () Bool)

(assert (=> bm!36635 m!779901))

(declare-fun m!779903 () Bool)

(assert (=> b!834807 m!779903))

(declare-fun m!779905 () Bool)

(assert (=> b!834807 m!779905))

(declare-fun m!779907 () Bool)

(assert (=> b!834807 m!779907))

(declare-fun m!779909 () Bool)

(assert (=> b!834803 m!779909))

(assert (=> b!834803 m!779909))

(declare-fun m!779911 () Bool)

(assert (=> b!834803 m!779911))

(declare-fun m!779913 () Bool)

(assert (=> b!834801 m!779913))

(declare-fun m!779915 () Bool)

(assert (=> b!834801 m!779915))

(declare-fun m!779917 () Bool)

(assert (=> b!834806 m!779917))

(declare-fun m!779919 () Bool)

(assert (=> b!834806 m!779919))

(declare-fun m!779921 () Bool)

(assert (=> bm!36634 m!779921))

(declare-fun m!779923 () Bool)

(assert (=> b!834802 m!779923))

(declare-fun m!779925 () Bool)

(assert (=> b!834802 m!779925))

(declare-fun m!779927 () Bool)

(assert (=> b!834802 m!779927))

(assert (=> b!834808 m!779901))

(assert (=> b!834808 m!779921))

(declare-fun m!779929 () Bool)

(assert (=> b!834809 m!779929))

(assert (=> b!834809 m!779929))

(declare-fun m!779931 () Bool)

(assert (=> b!834809 m!779931))

(push 1)

