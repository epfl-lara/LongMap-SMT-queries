; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36356 () Bool)

(assert start!36356)

(declare-fun b!363738 () Bool)

(declare-fun e!222706 () Bool)

(declare-fun e!222705 () Bool)

(assert (=> b!363738 (= e!222706 e!222705)))

(declare-fun res!202901 () Bool)

(assert (=> b!363738 (=> (not res!202901) (not e!222705))))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun lt!167870 () (_ BitVec 32))

(declare-fun lt!167872 () (_ BitVec 32))

(assert (=> b!363738 (= res!202901 (and (= lt!167872 (bvadd #b00000000000000000000000000000001 lt!167870)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20636 0))(
  ( (array!20637 (arr!9797 (Array (_ BitVec 32) (_ BitVec 64))) (size!10149 (_ BitVec 32))) )
))
(declare-fun lt!167868 () array!20636)

(declare-fun arrayCountValidKeys!0 (array!20636 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363738 (= lt!167872 (arrayCountValidKeys!0 lt!167868 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun a!4289 () array!20636)

(assert (=> b!363738 (= lt!167870 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun k0!2974 () (_ BitVec 64))

(assert (=> b!363738 (= lt!167868 (array!20637 (store (arr!9797 a!4289) i!1472 k0!2974) (size!10149 a!4289)))))

(declare-fun b!363739 () Bool)

(assert (=> b!363739 (= e!222705 (not true))))

(assert (=> b!363739 (= (bvadd (arrayCountValidKeys!0 lt!167868 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!167872) (arrayCountValidKeys!0 lt!167868 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-datatypes ((Unit!11264 0))(
  ( (Unit!11265) )
))
(declare-fun lt!167869 () Unit!11264)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20636 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11264)

(assert (=> b!363739 (= lt!167869 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!167868 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(assert (=> b!363739 (= (bvadd (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!167870) (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!167871 () Unit!11264)

(assert (=> b!363739 (= lt!167871 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun res!202899 () Bool)

(assert (=> start!36356 (=> (not res!202899) (not e!222706))))

(assert (=> start!36356 (= res!202899 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10149 a!4289))))))

(assert (=> start!36356 e!222706))

(assert (=> start!36356 true))

(declare-fun array_inv!7239 (array!20636) Bool)

(assert (=> start!36356 (array_inv!7239 a!4289)))

(declare-fun b!363740 () Bool)

(declare-fun res!202902 () Bool)

(assert (=> b!363740 (=> (not res!202902) (not e!222706))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363740 (= res!202902 (validKeyInArray!0 k0!2974))))

(declare-fun b!363741 () Bool)

(declare-fun res!202903 () Bool)

(assert (=> b!363741 (=> (not res!202903) (not e!222706))))

(assert (=> b!363741 (= res!202903 (not (validKeyInArray!0 (select (arr!9797 a!4289) i!1472))))))

(declare-fun b!363742 () Bool)

(declare-fun res!202900 () Bool)

(assert (=> b!363742 (=> (not res!202900) (not e!222706))))

(assert (=> b!363742 (= res!202900 (and (bvslt (size!10149 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10149 a!4289)) (bvsge i!1472 from!3650)))))

(assert (= (and start!36356 res!202899) b!363741))

(assert (= (and b!363741 res!202903) b!363740))

(assert (= (and b!363740 res!202902) b!363742))

(assert (= (and b!363742 res!202900) b!363738))

(assert (= (and b!363738 res!202901) b!363739))

(declare-fun m!360913 () Bool)

(assert (=> start!36356 m!360913))

(declare-fun m!360915 () Bool)

(assert (=> b!363739 m!360915))

(declare-fun m!360917 () Bool)

(assert (=> b!363739 m!360917))

(declare-fun m!360919 () Bool)

(assert (=> b!363739 m!360919))

(declare-fun m!360921 () Bool)

(assert (=> b!363739 m!360921))

(declare-fun m!360923 () Bool)

(assert (=> b!363739 m!360923))

(declare-fun m!360925 () Bool)

(assert (=> b!363739 m!360925))

(declare-fun m!360927 () Bool)

(assert (=> b!363741 m!360927))

(assert (=> b!363741 m!360927))

(declare-fun m!360929 () Bool)

(assert (=> b!363741 m!360929))

(declare-fun m!360931 () Bool)

(assert (=> b!363738 m!360931))

(declare-fun m!360933 () Bool)

(assert (=> b!363738 m!360933))

(declare-fun m!360935 () Bool)

(assert (=> b!363738 m!360935))

(declare-fun m!360937 () Bool)

(assert (=> b!363740 m!360937))

(check-sat (not b!363739) (not b!363738) (not start!36356) (not b!363741) (not b!363740))
