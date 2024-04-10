; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71832 () Bool)

(assert start!71832)

(declare-fun b!834909 () Bool)

(declare-fun res!567793 () Bool)

(declare-fun e!465828 () Bool)

(assert (=> b!834909 (=> (not res!567793) (not e!465828))))

(declare-fun k0!2968 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!834909 (= res!567793 (validKeyInArray!0 k0!2968))))

(declare-datatypes ((array!46742 0))(
  ( (array!46743 (arr!22405 (Array (_ BitVec 32) (_ BitVec 64))) (size!22826 (_ BitVec 32))) )
))
(declare-fun lt!379596 () array!46742)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(declare-fun bm!36658 () Bool)

(declare-fun a!4227 () array!46742)

(declare-fun c!90956 () Bool)

(declare-fun call!36661 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46742 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!36658 (= call!36661 (arrayCountValidKeys!0 (ite c!90956 a!4227 lt!379596) (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun call!36662 () (_ BitVec 32))

(declare-fun bm!36659 () Bool)

(assert (=> bm!36659 (= call!36662 (arrayCountValidKeys!0 (ite c!90956 lt!379596 a!4227) (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!834910 () Bool)

(declare-fun res!567789 () Bool)

(assert (=> b!834910 (=> (not res!567789) (not e!465828))))

(assert (=> b!834910 (= res!567789 (not (validKeyInArray!0 (select (arr!22405 a!4227) i!1466))))))

(declare-fun b!834911 () Bool)

(declare-fun e!465831 () Bool)

(declare-fun e!465830 () Bool)

(assert (=> b!834911 (= e!465831 e!465830)))

(declare-fun res!567790 () Bool)

(assert (=> b!834911 (=> (not res!567790) (not e!465830))))

(assert (=> b!834911 (= res!567790 (and (bvsge (bvadd #b00000000000000000000000000000001 to!390) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!390) (size!22826 a!4227)) (bvsgt (bvadd #b00000000000000000000000000000001 to!390) i!1466)))))

(declare-datatypes ((Unit!28703 0))(
  ( (Unit!28704) )
))
(declare-fun lt!379594 () Unit!28703)

(declare-fun e!465827 () Unit!28703)

(assert (=> b!834911 (= lt!379594 e!465827)))

(assert (=> b!834911 (= c!90956 (validKeyInArray!0 (select (arr!22405 a!4227) to!390)))))

(declare-fun b!834912 () Bool)

(assert (=> b!834912 (= e!465830 (not true))))

(assert (=> b!834912 (= (arrayCountValidKeys!0 lt!379596 (bvadd #b00000000000000000000000000000001 i!1466) (size!22826 a!4227)) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (size!22826 a!4227)))))

(declare-fun lt!379591 () Unit!28703)

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!46742 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!28703)

(assert (=> b!834912 (= lt!379591 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4227 i!1466 k0!2968 (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!834913 () Bool)

(declare-fun res!567791 () Bool)

(assert (=> b!834913 (=> (not res!567791) (not e!465828))))

(assert (=> b!834913 (= res!567791 (and (bvslt (size!22826 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22826 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!834914 () Bool)

(declare-fun lt!379592 () Unit!28703)

(assert (=> b!834914 (= e!465827 lt!379592)))

(declare-fun lt!379589 () Unit!28703)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46742 (_ BitVec 32) (_ BitVec 32)) Unit!28703)

(assert (=> b!834914 (= lt!379589 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun lt!379595 () (_ BitVec 32))

(assert (=> b!834914 (= call!36661 (bvadd #b00000000000000000000000000000001 lt!379595))))

(assert (=> b!834914 (= lt!379592 (lemmaValidKeyIncreasesNumOfKeys!0 lt!379596 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun lt!379590 () (_ BitVec 32))

(assert (=> b!834914 (= call!36662 (bvadd #b00000000000000000000000000000001 lt!379590))))

(declare-fun b!834915 () Bool)

(declare-fun lt!379593 () Unit!28703)

(assert (=> b!834915 (= e!465827 lt!379593)))

(declare-fun lt!379597 () Unit!28703)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46742 (_ BitVec 32) (_ BitVec 32)) Unit!28703)

(assert (=> b!834915 (= lt!379597 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834915 (= call!36662 lt!379595)))

(assert (=> b!834915 (= lt!379593 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!379596 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834915 (= call!36661 lt!379590)))

(declare-fun b!834916 () Bool)

(assert (=> b!834916 (= e!465828 e!465831)))

(declare-fun res!567794 () Bool)

(assert (=> b!834916 (=> (not res!567794) (not e!465831))))

(assert (=> b!834916 (= res!567794 (and (= lt!379590 lt!379595) (not (= to!390 (size!22826 a!4227)))))))

(assert (=> b!834916 (= lt!379595 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834916 (= lt!379590 (arrayCountValidKeys!0 lt!379596 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!834916 (= lt!379596 (array!46743 (store (arr!22405 a!4227) i!1466 k0!2968) (size!22826 a!4227)))))

(declare-fun res!567788 () Bool)

(assert (=> start!71832 (=> (not res!567788) (not e!465828))))

(assert (=> start!71832 (= res!567788 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22826 a!4227))))))

(assert (=> start!71832 e!465828))

(assert (=> start!71832 true))

(declare-fun array_inv!17852 (array!46742) Bool)

(assert (=> start!71832 (array_inv!17852 a!4227)))

(declare-fun b!834917 () Bool)

(declare-fun res!567792 () Bool)

(assert (=> b!834917 (=> (not res!567792) (not e!465830))))

(assert (=> b!834917 (= res!567792 (= (arrayCountValidKeys!0 lt!379596 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390))))))

(assert (= (and start!71832 res!567788) b!834910))

(assert (= (and b!834910 res!567789) b!834909))

(assert (= (and b!834909 res!567793) b!834913))

(assert (= (and b!834913 res!567791) b!834916))

(assert (= (and b!834916 res!567794) b!834911))

(assert (= (and b!834911 c!90956) b!834914))

(assert (= (and b!834911 (not c!90956)) b!834915))

(assert (= (or b!834914 b!834915) bm!36659))

(assert (= (or b!834914 b!834915) bm!36658))

(assert (= (and b!834911 res!567790) b!834917))

(assert (= (and b!834917 res!567792) b!834912))

(declare-fun m!780041 () Bool)

(assert (=> b!834909 m!780041))

(declare-fun m!780043 () Bool)

(assert (=> b!834916 m!780043))

(declare-fun m!780045 () Bool)

(assert (=> b!834916 m!780045))

(declare-fun m!780047 () Bool)

(assert (=> b!834916 m!780047))

(declare-fun m!780049 () Bool)

(assert (=> bm!36659 m!780049))

(declare-fun m!780051 () Bool)

(assert (=> b!834915 m!780051))

(declare-fun m!780053 () Bool)

(assert (=> b!834915 m!780053))

(declare-fun m!780055 () Bool)

(assert (=> b!834914 m!780055))

(declare-fun m!780057 () Bool)

(assert (=> b!834914 m!780057))

(declare-fun m!780059 () Bool)

(assert (=> start!71832 m!780059))

(declare-fun m!780061 () Bool)

(assert (=> b!834917 m!780061))

(declare-fun m!780063 () Bool)

(assert (=> b!834917 m!780063))

(declare-fun m!780065 () Bool)

(assert (=> bm!36658 m!780065))

(declare-fun m!780067 () Bool)

(assert (=> b!834910 m!780067))

(assert (=> b!834910 m!780067))

(declare-fun m!780069 () Bool)

(assert (=> b!834910 m!780069))

(declare-fun m!780071 () Bool)

(assert (=> b!834911 m!780071))

(assert (=> b!834911 m!780071))

(declare-fun m!780073 () Bool)

(assert (=> b!834911 m!780073))

(declare-fun m!780075 () Bool)

(assert (=> b!834912 m!780075))

(declare-fun m!780077 () Bool)

(assert (=> b!834912 m!780077))

(declare-fun m!780079 () Bool)

(assert (=> b!834912 m!780079))

(check-sat (not bm!36658) (not b!834915) (not b!834917) (not bm!36659) (not b!834914) (not start!71832) (not b!834909) (not b!834911) (not b!834910) (not b!834912) (not b!834916))
(check-sat)
