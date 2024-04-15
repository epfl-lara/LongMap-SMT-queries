; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71930 () Bool)

(assert start!71930)

(declare-fun b!835819 () Bool)

(declare-datatypes ((Unit!28721 0))(
  ( (Unit!28722) )
))
(declare-fun e!466260 () Unit!28721)

(declare-fun lt!380066 () Unit!28721)

(assert (=> b!835819 (= e!466260 lt!380066)))

(declare-datatypes ((array!46829 0))(
  ( (array!46830 (arr!22449 (Array (_ BitVec 32) (_ BitVec 64))) (size!22870 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46829)

(declare-fun lt!380069 () Unit!28721)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46829 (_ BitVec 32) (_ BitVec 32)) Unit!28721)

(assert (=> b!835819 (= lt!380069 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36773 () (_ BitVec 32))

(declare-fun lt!380068 () (_ BitVec 32))

(assert (=> b!835819 (= call!36773 lt!380068)))

(declare-fun lt!380062 () array!46829)

(assert (=> b!835819 (= lt!380066 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!380062 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36774 () (_ BitVec 32))

(declare-fun lt!380065 () (_ BitVec 32))

(assert (=> b!835819 (= call!36774 lt!380065)))

(declare-fun bm!36770 () Bool)

(declare-fun arrayCountValidKeys!0 (array!46829 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!36770 (= call!36774 (arrayCountValidKeys!0 lt!380062 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!835821 () Bool)

(declare-fun e!466261 () Bool)

(assert (=> b!835821 (= e!466261 (not true))))

(assert (=> b!835821 (= (arrayCountValidKeys!0 lt!380062 (bvadd #b00000000000000000000000000000001 i!1466) (size!22870 a!4227)) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (size!22870 a!4227)))))

(declare-fun lt!380067 () Unit!28721)

(declare-fun k0!2968 () (_ BitVec 64))

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!46829 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!28721)

(assert (=> b!835821 (= lt!380067 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4227 i!1466 k0!2968 (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!835822 () Bool)

(declare-fun e!466262 () Bool)

(assert (=> b!835822 (= e!466262 e!466261)))

(declare-fun res!568702 () Bool)

(assert (=> b!835822 (=> (not res!568702) (not e!466261))))

(assert (=> b!835822 (= res!568702 (and (bvsge (bvadd #b00000000000000000000000000000001 to!390) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!390) (size!22870 a!4227)) (bvsgt (bvadd #b00000000000000000000000000000001 to!390) i!1466)))))

(declare-fun lt!380064 () Unit!28721)

(assert (=> b!835822 (= lt!380064 e!466260)))

(declare-fun c!90957 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!835822 (= c!90957 (validKeyInArray!0 (select (arr!22449 a!4227) to!390)))))

(declare-fun b!835823 () Bool)

(declare-fun res!568701 () Bool)

(assert (=> b!835823 (=> (not res!568701) (not e!466261))))

(assert (=> b!835823 (= res!568701 (= (arrayCountValidKeys!0 lt!380062 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390))))))

(declare-fun b!835824 () Bool)

(declare-fun e!466258 () Bool)

(assert (=> b!835824 (= e!466258 e!466262)))

(declare-fun res!568696 () Bool)

(assert (=> b!835824 (=> (not res!568696) (not e!466262))))

(assert (=> b!835824 (= res!568696 (and (= lt!380065 lt!380068) (not (= to!390 (size!22870 a!4227)))))))

(assert (=> b!835824 (= lt!380068 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835824 (= lt!380065 (arrayCountValidKeys!0 lt!380062 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835824 (= lt!380062 (array!46830 (store (arr!22449 a!4227) i!1466 k0!2968) (size!22870 a!4227)))))

(declare-fun bm!36771 () Bool)

(assert (=> bm!36771 (= call!36773 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!835825 () Bool)

(declare-fun res!568699 () Bool)

(assert (=> b!835825 (=> (not res!568699) (not e!466258))))

(assert (=> b!835825 (= res!568699 (and (bvslt (size!22870 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22870 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun res!568697 () Bool)

(assert (=> start!71930 (=> (not res!568697) (not e!466258))))

(assert (=> start!71930 (= res!568697 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22870 a!4227))))))

(assert (=> start!71930 e!466258))

(assert (=> start!71930 true))

(declare-fun array_inv!17961 (array!46829) Bool)

(assert (=> start!71930 (array_inv!17961 a!4227)))

(declare-fun b!835820 () Bool)

(declare-fun lt!380061 () Unit!28721)

(assert (=> b!835820 (= e!466260 lt!380061)))

(declare-fun lt!380063 () Unit!28721)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46829 (_ BitVec 32) (_ BitVec 32)) Unit!28721)

(assert (=> b!835820 (= lt!380063 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835820 (= call!36773 (bvadd #b00000000000000000000000000000001 lt!380068))))

(assert (=> b!835820 (= lt!380061 (lemmaValidKeyIncreasesNumOfKeys!0 lt!380062 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!835820 (= call!36774 (bvadd #b00000000000000000000000000000001 lt!380065))))

(declare-fun b!835826 () Bool)

(declare-fun res!568698 () Bool)

(assert (=> b!835826 (=> (not res!568698) (not e!466258))))

(assert (=> b!835826 (= res!568698 (validKeyInArray!0 k0!2968))))

(declare-fun b!835827 () Bool)

(declare-fun res!568700 () Bool)

(assert (=> b!835827 (=> (not res!568700) (not e!466258))))

(assert (=> b!835827 (= res!568700 (not (validKeyInArray!0 (select (arr!22449 a!4227) i!1466))))))

(assert (= (and start!71930 res!568697) b!835827))

(assert (= (and b!835827 res!568700) b!835826))

(assert (= (and b!835826 res!568698) b!835825))

(assert (= (and b!835825 res!568699) b!835824))

(assert (= (and b!835824 res!568696) b!835822))

(assert (= (and b!835822 c!90957) b!835820))

(assert (= (and b!835822 (not c!90957)) b!835819))

(assert (= (or b!835820 b!835819) bm!36770))

(assert (= (or b!835820 b!835819) bm!36771))

(assert (= (and b!835822 res!568702) b!835823))

(assert (= (and b!835823 res!568701) b!835821))

(declare-fun m!780665 () Bool)

(assert (=> b!835822 m!780665))

(assert (=> b!835822 m!780665))

(declare-fun m!780667 () Bool)

(assert (=> b!835822 m!780667))

(declare-fun m!780669 () Bool)

(assert (=> b!835827 m!780669))

(assert (=> b!835827 m!780669))

(declare-fun m!780671 () Bool)

(assert (=> b!835827 m!780671))

(declare-fun m!780673 () Bool)

(assert (=> b!835820 m!780673))

(declare-fun m!780675 () Bool)

(assert (=> b!835820 m!780675))

(declare-fun m!780677 () Bool)

(assert (=> bm!36770 m!780677))

(declare-fun m!780679 () Bool)

(assert (=> b!835821 m!780679))

(declare-fun m!780681 () Bool)

(assert (=> b!835821 m!780681))

(declare-fun m!780683 () Bool)

(assert (=> b!835821 m!780683))

(assert (=> b!835823 m!780677))

(declare-fun m!780685 () Bool)

(assert (=> b!835823 m!780685))

(declare-fun m!780687 () Bool)

(assert (=> b!835819 m!780687))

(declare-fun m!780689 () Bool)

(assert (=> b!835819 m!780689))

(declare-fun m!780691 () Bool)

(assert (=> b!835826 m!780691))

(declare-fun m!780693 () Bool)

(assert (=> start!71930 m!780693))

(assert (=> bm!36771 m!780685))

(declare-fun m!780695 () Bool)

(assert (=> b!835824 m!780695))

(declare-fun m!780697 () Bool)

(assert (=> b!835824 m!780697))

(declare-fun m!780699 () Bool)

(assert (=> b!835824 m!780699))

(check-sat (not b!835826) (not b!835821) (not b!835822) (not b!835823) (not start!71930) (not b!835824) (not bm!36770) (not b!835820) (not b!835819) (not bm!36771) (not b!835827))
(check-sat)
