; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71826 () Bool)

(assert start!71826)

(declare-fun b!834828 () Bool)

(declare-fun res!567725 () Bool)

(declare-fun e!465785 () Bool)

(assert (=> b!834828 (=> (not res!567725) (not e!465785))))

(declare-datatypes ((array!46736 0))(
  ( (array!46737 (arr!22402 (Array (_ BitVec 32) (_ BitVec 64))) (size!22823 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46736)

(declare-fun lt!379516 () array!46736)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46736 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!834828 (= res!567725 (= (arrayCountValidKeys!0 lt!379516 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390))))))

(declare-fun bm!36640 () Bool)

(declare-fun call!36643 () (_ BitVec 32))

(assert (=> bm!36640 (= call!36643 (arrayCountValidKeys!0 lt!379516 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!834829 () Bool)

(declare-fun res!567729 () Bool)

(declare-fun e!465786 () Bool)

(assert (=> b!834829 (=> (not res!567729) (not e!465786))))

(assert (=> b!834829 (= res!567729 (and (bvslt (size!22823 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22823 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!834830 () Bool)

(declare-fun res!567727 () Bool)

(assert (=> b!834830 (=> (not res!567727) (not e!465786))))

(declare-fun k0!2968 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!834830 (= res!567727 (validKeyInArray!0 k0!2968))))

(declare-fun b!834831 () Bool)

(declare-fun e!465783 () Bool)

(assert (=> b!834831 (= e!465786 e!465783)))

(declare-fun res!567731 () Bool)

(assert (=> b!834831 (=> (not res!567731) (not e!465783))))

(declare-fun lt!379515 () (_ BitVec 32))

(declare-fun lt!379510 () (_ BitVec 32))

(assert (=> b!834831 (= res!567731 (and (= lt!379515 lt!379510) (not (= to!390 (size!22823 a!4227)))))))

(assert (=> b!834831 (= lt!379510 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834831 (= lt!379515 (arrayCountValidKeys!0 lt!379516 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834831 (= lt!379516 (array!46737 (store (arr!22402 a!4227) i!1466 k0!2968) (size!22823 a!4227)))))

(declare-fun res!567726 () Bool)

(assert (=> start!71826 (=> (not res!567726) (not e!465786))))

(assert (=> start!71826 (= res!567726 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22823 a!4227))))))

(assert (=> start!71826 e!465786))

(assert (=> start!71826 true))

(declare-fun array_inv!17849 (array!46736) Bool)

(assert (=> start!71826 (array_inv!17849 a!4227)))

(declare-fun bm!36641 () Bool)

(declare-fun call!36644 () (_ BitVec 32))

(assert (=> bm!36641 (= call!36644 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!834832 () Bool)

(assert (=> b!834832 (= e!465783 e!465785)))

(declare-fun res!567728 () Bool)

(assert (=> b!834832 (=> (not res!567728) (not e!465785))))

(assert (=> b!834832 (= res!567728 (and (bvsge (bvadd #b00000000000000000000000000000001 to!390) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!390) (size!22823 a!4227)) (bvsgt (bvadd #b00000000000000000000000000000001 to!390) i!1466)))))

(declare-datatypes ((Unit!28697 0))(
  ( (Unit!28698) )
))
(declare-fun lt!379514 () Unit!28697)

(declare-fun e!465782 () Unit!28697)

(assert (=> b!834832 (= lt!379514 e!465782)))

(declare-fun c!90947 () Bool)

(assert (=> b!834832 (= c!90947 (validKeyInArray!0 (select (arr!22402 a!4227) to!390)))))

(declare-fun b!834833 () Bool)

(declare-fun res!567730 () Bool)

(assert (=> b!834833 (=> (not res!567730) (not e!465786))))

(assert (=> b!834833 (= res!567730 (not (validKeyInArray!0 (select (arr!22402 a!4227) i!1466))))))

(declare-fun b!834834 () Bool)

(declare-fun lt!379511 () Unit!28697)

(assert (=> b!834834 (= e!465782 lt!379511)))

(declare-fun lt!379509 () Unit!28697)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46736 (_ BitVec 32) (_ BitVec 32)) Unit!28697)

(assert (=> b!834834 (= lt!379509 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834834 (= call!36644 lt!379510)))

(assert (=> b!834834 (= lt!379511 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!379516 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834834 (= call!36643 lt!379515)))

(declare-fun b!834835 () Bool)

(declare-fun lt!379512 () Unit!28697)

(assert (=> b!834835 (= e!465782 lt!379512)))

(declare-fun lt!379508 () Unit!28697)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46736 (_ BitVec 32) (_ BitVec 32)) Unit!28697)

(assert (=> b!834835 (= lt!379508 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834835 (= call!36644 (bvadd #b00000000000000000000000000000001 lt!379510))))

(assert (=> b!834835 (= lt!379512 (lemmaValidKeyIncreasesNumOfKeys!0 lt!379516 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834835 (= call!36643 (bvadd #b00000000000000000000000000000001 lt!379515))))

(declare-fun b!834836 () Bool)

(assert (=> b!834836 (= e!465785 (not (bvsge (bvadd #b00000000000000000000000000000001 i!1466) #b00000000000000000000000000000000)))))

(assert (=> b!834836 (= (arrayCountValidKeys!0 lt!379516 (bvadd #b00000000000000000000000000000001 i!1466) (size!22823 a!4227)) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (size!22823 a!4227)))))

(declare-fun lt!379513 () Unit!28697)

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!46736 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!28697)

(assert (=> b!834836 (= lt!379513 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4227 i!1466 k0!2968 (bvadd #b00000000000000000000000000000001 to!390)))))

(assert (= (and start!71826 res!567726) b!834833))

(assert (= (and b!834833 res!567730) b!834830))

(assert (= (and b!834830 res!567727) b!834829))

(assert (= (and b!834829 res!567729) b!834831))

(assert (= (and b!834831 res!567731) b!834832))

(assert (= (and b!834832 c!90947) b!834835))

(assert (= (and b!834832 (not c!90947)) b!834834))

(assert (= (or b!834835 b!834834) bm!36641))

(assert (= (or b!834835 b!834834) bm!36640))

(assert (= (and b!834832 res!567728) b!834828))

(assert (= (and b!834828 res!567725) b!834836))

(declare-fun m!779933 () Bool)

(assert (=> b!834828 m!779933))

(declare-fun m!779935 () Bool)

(assert (=> b!834828 m!779935))

(declare-fun m!779937 () Bool)

(assert (=> b!834833 m!779937))

(assert (=> b!834833 m!779937))

(declare-fun m!779939 () Bool)

(assert (=> b!834833 m!779939))

(declare-fun m!779941 () Bool)

(assert (=> b!834831 m!779941))

(declare-fun m!779943 () Bool)

(assert (=> b!834831 m!779943))

(declare-fun m!779945 () Bool)

(assert (=> b!834831 m!779945))

(assert (=> bm!36640 m!779933))

(declare-fun m!779947 () Bool)

(assert (=> b!834830 m!779947))

(declare-fun m!779949 () Bool)

(assert (=> b!834836 m!779949))

(declare-fun m!779951 () Bool)

(assert (=> b!834836 m!779951))

(declare-fun m!779953 () Bool)

(assert (=> b!834836 m!779953))

(declare-fun m!779955 () Bool)

(assert (=> b!834835 m!779955))

(declare-fun m!779957 () Bool)

(assert (=> b!834835 m!779957))

(assert (=> bm!36641 m!779935))

(declare-fun m!779959 () Bool)

(assert (=> b!834834 m!779959))

(declare-fun m!779961 () Bool)

(assert (=> b!834834 m!779961))

(declare-fun m!779963 () Bool)

(assert (=> start!71826 m!779963))

(declare-fun m!779965 () Bool)

(assert (=> b!834832 m!779965))

(assert (=> b!834832 m!779965))

(declare-fun m!779967 () Bool)

(assert (=> b!834832 m!779967))

(check-sat (not b!834833) (not bm!36641) (not b!834831) (not b!834830) (not start!71826) (not bm!36640) (not b!834832) (not b!834834) (not b!834835) (not b!834836) (not b!834828))
(check-sat)
