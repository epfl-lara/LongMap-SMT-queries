; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36340 () Bool)

(assert start!36340)

(declare-fun b!363674 () Bool)

(declare-fun res!202885 () Bool)

(declare-fun e!222664 () Bool)

(assert (=> b!363674 (=> (not res!202885) (not e!222664))))

(declare-datatypes ((array!20615 0))(
  ( (array!20616 (arr!9786 (Array (_ BitVec 32) (_ BitVec 64))) (size!10138 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20615)

(declare-fun i!1472 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363674 (= res!202885 (not (validKeyInArray!0 (select (arr!9786 a!4289) i!1472))))))

(declare-fun b!363675 () Bool)

(declare-fun e!222665 () Bool)

(assert (=> b!363675 (= e!222664 e!222665)))

(declare-fun res!202883 () Bool)

(assert (=> b!363675 (=> (not res!202883) (not e!222665))))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun lt!167876 () (_ BitVec 32))

(declare-fun lt!167872 () (_ BitVec 32))

(assert (=> b!363675 (= res!202883 (and (= lt!167876 (bvadd #b00000000000000000000000000000001 lt!167872)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(declare-fun lt!167873 () array!20615)

(declare-fun arrayCountValidKeys!0 (array!20615 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363675 (= lt!167876 (arrayCountValidKeys!0 lt!167873 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!363675 (= lt!167872 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun k0!2974 () (_ BitVec 64))

(assert (=> b!363675 (= lt!167873 (array!20616 (store (arr!9786 a!4289) i!1472 k0!2974) (size!10138 a!4289)))))

(declare-fun b!363676 () Bool)

(assert (=> b!363676 (= e!222665 (not true))))

(assert (=> b!363676 (= (bvadd (arrayCountValidKeys!0 lt!167873 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!167876) (arrayCountValidKeys!0 lt!167873 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-datatypes ((Unit!11251 0))(
  ( (Unit!11252) )
))
(declare-fun lt!167875 () Unit!11251)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20615 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11251)

(assert (=> b!363676 (= lt!167875 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!167873 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(assert (=> b!363676 (= (bvadd (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650) lt!167872) (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!167874 () Unit!11251)

(assert (=> b!363676 (= lt!167874 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun b!363677 () Bool)

(declare-fun res!202884 () Bool)

(assert (=> b!363677 (=> (not res!202884) (not e!222664))))

(assert (=> b!363677 (= res!202884 (validKeyInArray!0 k0!2974))))

(declare-fun b!363678 () Bool)

(declare-fun res!202882 () Bool)

(assert (=> b!363678 (=> (not res!202882) (not e!222664))))

(assert (=> b!363678 (= res!202882 (and (bvslt (size!10138 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10138 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun res!202881 () Bool)

(assert (=> start!36340 (=> (not res!202881) (not e!222664))))

(assert (=> start!36340 (= res!202881 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10138 a!4289))))))

(assert (=> start!36340 e!222664))

(assert (=> start!36340 true))

(declare-fun array_inv!7258 (array!20615) Bool)

(assert (=> start!36340 (array_inv!7258 a!4289)))

(assert (= (and start!36340 res!202881) b!363674))

(assert (= (and b!363674 res!202885) b!363677))

(assert (= (and b!363677 res!202884) b!363678))

(assert (= (and b!363678 res!202882) b!363675))

(assert (= (and b!363675 res!202883) b!363676))

(declare-fun m!361117 () Bool)

(assert (=> start!36340 m!361117))

(declare-fun m!361119 () Bool)

(assert (=> b!363677 m!361119))

(declare-fun m!361121 () Bool)

(assert (=> b!363676 m!361121))

(declare-fun m!361123 () Bool)

(assert (=> b!363676 m!361123))

(declare-fun m!361125 () Bool)

(assert (=> b!363676 m!361125))

(declare-fun m!361127 () Bool)

(assert (=> b!363676 m!361127))

(declare-fun m!361129 () Bool)

(assert (=> b!363676 m!361129))

(declare-fun m!361131 () Bool)

(assert (=> b!363676 m!361131))

(declare-fun m!361133 () Bool)

(assert (=> b!363675 m!361133))

(declare-fun m!361135 () Bool)

(assert (=> b!363675 m!361135))

(declare-fun m!361137 () Bool)

(assert (=> b!363675 m!361137))

(declare-fun m!361139 () Bool)

(assert (=> b!363674 m!361139))

(assert (=> b!363674 m!361139))

(declare-fun m!361141 () Bool)

(assert (=> b!363674 m!361141))

(check-sat (not b!363675) (not start!36340) (not b!363676) (not b!363677) (not b!363674))
(check-sat)
