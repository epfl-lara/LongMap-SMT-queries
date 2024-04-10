; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71818 () Bool)

(assert start!71818)

(declare-fun b!834720 () Bool)

(declare-fun e!465724 () Bool)

(assert (=> b!834720 (= e!465724 (not true))))

(declare-datatypes ((array!46728 0))(
  ( (array!46729 (arr!22398 (Array (_ BitVec 32) (_ BitVec 64))) (size!22819 (_ BitVec 32))) )
))
(declare-fun lt!379406 () array!46728)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun a!4227 () array!46728)

(declare-fun arrayCountValidKeys!0 (array!46728 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!834720 (= (arrayCountValidKeys!0 lt!379406 (bvadd #b00000000000000000000000000000001 i!1466) (size!22819 a!4227)) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (size!22819 a!4227)))))

(declare-datatypes ((Unit!28689 0))(
  ( (Unit!28690) )
))
(declare-fun lt!379408 () Unit!28689)

(declare-fun k!2968 () (_ BitVec 64))

(declare-fun to!390 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!46728 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!28689)

(assert (=> b!834720 (= lt!379408 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4227 i!1466 k!2968 (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!834721 () Bool)

(declare-fun e!465725 () Unit!28689)

(declare-fun lt!379405 () Unit!28689)

(assert (=> b!834721 (= e!465725 lt!379405)))

(declare-fun lt!379402 () Unit!28689)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46728 (_ BitVec 32) (_ BitVec 32)) Unit!28689)

(assert (=> b!834721 (= lt!379402 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36620 () (_ BitVec 32))

(declare-fun lt!379404 () (_ BitVec 32))

(assert (=> b!834721 (= call!36620 (bvadd #b00000000000000000000000000000001 lt!379404))))

(assert (=> b!834721 (= lt!379405 (lemmaValidKeyIncreasesNumOfKeys!0 lt!379406 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36619 () (_ BitVec 32))

(declare-fun lt!379403 () (_ BitVec 32))

(assert (=> b!834721 (= call!36619 (bvadd #b00000000000000000000000000000001 lt!379403))))

(declare-fun b!834722 () Bool)

(declare-fun e!465726 () Bool)

(declare-fun e!465723 () Bool)

(assert (=> b!834722 (= e!465726 e!465723)))

(declare-fun res!567644 () Bool)

(assert (=> b!834722 (=> (not res!567644) (not e!465723))))

(assert (=> b!834722 (= res!567644 (and (= lt!379403 lt!379404) (not (= to!390 (size!22819 a!4227)))))))

(assert (=> b!834722 (= lt!379404 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834722 (= lt!379403 (arrayCountValidKeys!0 lt!379406 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834722 (= lt!379406 (array!46729 (store (arr!22398 a!4227) i!1466 k!2968) (size!22819 a!4227)))))

(declare-fun b!834723 () Bool)

(declare-fun res!567642 () Bool)

(assert (=> b!834723 (=> (not res!567642) (not e!465726))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!834723 (= res!567642 (not (validKeyInArray!0 (select (arr!22398 a!4227) i!1466))))))

(declare-fun b!834724 () Bool)

(declare-fun res!567643 () Bool)

(assert (=> b!834724 (=> (not res!567643) (not e!465726))))

(assert (=> b!834724 (= res!567643 (validKeyInArray!0 k!2968))))

(declare-fun b!834726 () Bool)

(declare-fun res!567641 () Bool)

(assert (=> b!834726 (=> (not res!567641) (not e!465724))))

(assert (=> b!834726 (= res!567641 (= (arrayCountValidKeys!0 lt!379406 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390))))))

(declare-fun b!834727 () Bool)

(declare-fun res!567646 () Bool)

(assert (=> b!834727 (=> (not res!567646) (not e!465726))))

(assert (=> b!834727 (= res!567646 (and (bvslt (size!22819 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22819 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun bm!36616 () Bool)

(assert (=> bm!36616 (= call!36620 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun bm!36617 () Bool)

(assert (=> bm!36617 (= call!36619 (arrayCountValidKeys!0 lt!379406 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!834728 () Bool)

(assert (=> b!834728 (= e!465723 e!465724)))

(declare-fun res!567645 () Bool)

(assert (=> b!834728 (=> (not res!567645) (not e!465724))))

(assert (=> b!834728 (= res!567645 (and (bvsge (bvadd #b00000000000000000000000000000001 to!390) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!390) (size!22819 a!4227)) (bvsgt (bvadd #b00000000000000000000000000000001 to!390) i!1466)))))

(declare-fun lt!379400 () Unit!28689)

(assert (=> b!834728 (= lt!379400 e!465725)))

(declare-fun c!90935 () Bool)

(assert (=> b!834728 (= c!90935 (validKeyInArray!0 (select (arr!22398 a!4227) to!390)))))

(declare-fun b!834725 () Bool)

(declare-fun lt!379401 () Unit!28689)

(assert (=> b!834725 (= e!465725 lt!379401)))

(declare-fun lt!379407 () Unit!28689)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46728 (_ BitVec 32) (_ BitVec 32)) Unit!28689)

(assert (=> b!834725 (= lt!379407 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834725 (= call!36620 lt!379404)))

(assert (=> b!834725 (= lt!379401 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!379406 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834725 (= call!36619 lt!379403)))

(declare-fun res!567647 () Bool)

(assert (=> start!71818 (=> (not res!567647) (not e!465726))))

(assert (=> start!71818 (= res!567647 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22819 a!4227))))))

(assert (=> start!71818 e!465726))

(assert (=> start!71818 true))

(declare-fun array_inv!17845 (array!46728) Bool)

(assert (=> start!71818 (array_inv!17845 a!4227)))

(assert (= (and start!71818 res!567647) b!834723))

(assert (= (and b!834723 res!567642) b!834724))

(assert (= (and b!834724 res!567643) b!834727))

(assert (= (and b!834727 res!567646) b!834722))

(assert (= (and b!834722 res!567644) b!834728))

(assert (= (and b!834728 c!90935) b!834721))

(assert (= (and b!834728 (not c!90935)) b!834725))

(assert (= (or b!834721 b!834725) bm!36616))

(assert (= (or b!834721 b!834725) bm!36617))

(assert (= (and b!834728 res!567645) b!834726))

(assert (= (and b!834726 res!567641) b!834720))

(declare-fun m!779789 () Bool)

(assert (=> b!834724 m!779789))

(declare-fun m!779791 () Bool)

(assert (=> b!834722 m!779791))

(declare-fun m!779793 () Bool)

(assert (=> b!834722 m!779793))

(declare-fun m!779795 () Bool)

(assert (=> b!834722 m!779795))

(declare-fun m!779797 () Bool)

(assert (=> b!834728 m!779797))

(assert (=> b!834728 m!779797))

(declare-fun m!779799 () Bool)

(assert (=> b!834728 m!779799))

(declare-fun m!779801 () Bool)

(assert (=> bm!36617 m!779801))

(assert (=> b!834726 m!779801))

(declare-fun m!779803 () Bool)

(assert (=> b!834726 m!779803))

(declare-fun m!779805 () Bool)

(assert (=> b!834725 m!779805))

(declare-fun m!779807 () Bool)

(assert (=> b!834725 m!779807))

(declare-fun m!779809 () Bool)

(assert (=> b!834723 m!779809))

(assert (=> b!834723 m!779809))

(declare-fun m!779811 () Bool)

(assert (=> b!834723 m!779811))

(declare-fun m!779813 () Bool)

(assert (=> start!71818 m!779813))

(assert (=> bm!36616 m!779803))

(declare-fun m!779815 () Bool)

(assert (=> b!834721 m!779815))

(declare-fun m!779817 () Bool)

(assert (=> b!834721 m!779817))

(declare-fun m!779819 () Bool)

(assert (=> b!834720 m!779819))

(declare-fun m!779821 () Bool)

(assert (=> b!834720 m!779821))

(declare-fun m!779823 () Bool)

(assert (=> b!834720 m!779823))

(push 1)

(assert (not bm!36617))

(assert (not b!834723))

(assert (not b!834720))

(assert (not b!834728))

(assert (not b!834724))

(assert (not b!834721))

(assert (not start!71818))

(assert (not b!834726))

(assert (not b!834725))

(assert (not bm!36616))

(assert (not b!834722))

(check-sat)

