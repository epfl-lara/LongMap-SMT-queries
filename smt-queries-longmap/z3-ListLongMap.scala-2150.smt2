; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36194 () Bool)

(assert start!36194)

(declare-fun b!362827 () Bool)

(declare-fun res!202119 () Bool)

(declare-fun e!222199 () Bool)

(assert (=> b!362827 (=> (not res!202119) (not e!222199))))

(declare-datatypes ((array!20510 0))(
  ( (array!20511 (arr!9737 (Array (_ BitVec 32) (_ BitVec 64))) (size!10089 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20510)

(assert (=> b!362827 (= res!202119 (bvslt (size!10089 a!4337) #b01111111111111111111111111111111))))

(declare-fun b!362828 () Bool)

(declare-fun res!202116 () Bool)

(assert (=> b!362828 (=> (not res!202116) (not e!222199))))

(declare-fun k0!2980 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362828 (= res!202116 (validKeyInArray!0 k0!2980))))

(declare-fun res!202118 () Bool)

(assert (=> start!36194 (=> (not res!202118) (not e!222199))))

(declare-fun i!1478 () (_ BitVec 32))

(assert (=> start!36194 (= res!202118 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10089 a!4337))))))

(assert (=> start!36194 e!222199))

(assert (=> start!36194 true))

(declare-fun array_inv!7179 (array!20510) Bool)

(assert (=> start!36194 (array_inv!7179 a!4337)))

(declare-fun b!362829 () Bool)

(declare-fun e!222200 () Bool)

(assert (=> b!362829 (= e!222200 true)))

(declare-fun lt!167142 () (_ BitVec 32))

(declare-fun lt!167137 () array!20510)

(declare-fun lt!167138 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20510 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362829 (= (bvadd lt!167142 lt!167138) (arrayCountValidKeys!0 lt!167137 #b00000000000000000000000000000000 (size!10089 a!4337)))))

(declare-datatypes ((Unit!11174 0))(
  ( (Unit!11175) )
))
(declare-fun lt!167141 () Unit!11174)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20510 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11174)

(assert (=> b!362829 (= lt!167141 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!167137 #b00000000000000000000000000000000 (size!10089 a!4337) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!362830 () Bool)

(assert (=> b!362830 (= e!222199 (not e!222200))))

(declare-fun res!202120 () Bool)

(assert (=> b!362830 (=> res!202120 e!222200)))

(assert (=> b!362830 (= res!202120 (or (bvslt (size!10089 a!4337) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!1478) #b00000000000000000000000000000000)))))

(declare-fun lt!167140 () (_ BitVec 32))

(declare-fun lt!167143 () (_ BitVec 32))

(assert (=> b!362830 (= (bvadd lt!167140 lt!167143) (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (size!10089 a!4337)))))

(declare-fun lt!167139 () Unit!11174)

(assert (=> b!362830 (= lt!167139 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4337 #b00000000000000000000000000000000 (size!10089 a!4337) (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!362830 (= lt!167138 lt!167143)))

(assert (=> b!362830 (= lt!167143 (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (size!10089 a!4337)))))

(assert (=> b!362830 (= lt!167138 (arrayCountValidKeys!0 lt!167137 (bvadd #b00000000000000000000000000000001 i!1478) (size!10089 a!4337)))))

(declare-fun lt!167144 () Unit!11174)

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!20510 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11174)

(assert (=> b!362830 (= lt!167144 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4337 i!1478 k0!2980 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!362830 (= lt!167142 (bvadd #b00000000000000000000000000000001 lt!167140))))

(assert (=> b!362830 (= lt!167142 (arrayCountValidKeys!0 lt!167137 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!362830 (= lt!167140 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!362830 (= lt!167137 (array!20511 (store (arr!9737 a!4337) i!1478 k0!2980) (size!10089 a!4337)))))

(declare-fun lt!167136 () Unit!11174)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20510 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11174)

(assert (=> b!362830 (= lt!167136 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k0!2980 i!1478))))

(declare-fun b!362831 () Bool)

(declare-fun res!202117 () Bool)

(assert (=> b!362831 (=> (not res!202117) (not e!222199))))

(assert (=> b!362831 (= res!202117 (not (validKeyInArray!0 (select (arr!9737 a!4337) i!1478))))))

(assert (= (and start!36194 res!202118) b!362831))

(assert (= (and b!362831 res!202117) b!362828))

(assert (= (and b!362828 res!202116) b!362827))

(assert (= (and b!362827 res!202119) b!362830))

(assert (= (and b!362830 (not res!202120)) b!362829))

(declare-fun m!359573 () Bool)

(assert (=> b!362831 m!359573))

(assert (=> b!362831 m!359573))

(declare-fun m!359575 () Bool)

(assert (=> b!362831 m!359575))

(declare-fun m!359577 () Bool)

(assert (=> start!36194 m!359577))

(declare-fun m!359579 () Bool)

(assert (=> b!362829 m!359579))

(declare-fun m!359581 () Bool)

(assert (=> b!362829 m!359581))

(declare-fun m!359583 () Bool)

(assert (=> b!362828 m!359583))

(declare-fun m!359585 () Bool)

(assert (=> b!362830 m!359585))

(declare-fun m!359587 () Bool)

(assert (=> b!362830 m!359587))

(declare-fun m!359589 () Bool)

(assert (=> b!362830 m!359589))

(declare-fun m!359591 () Bool)

(assert (=> b!362830 m!359591))

(declare-fun m!359593 () Bool)

(assert (=> b!362830 m!359593))

(declare-fun m!359595 () Bool)

(assert (=> b!362830 m!359595))

(declare-fun m!359597 () Bool)

(assert (=> b!362830 m!359597))

(declare-fun m!359599 () Bool)

(assert (=> b!362830 m!359599))

(declare-fun m!359601 () Bool)

(assert (=> b!362830 m!359601))

(check-sat (not start!36194) (not b!362828) (not b!362830) (not b!362829) (not b!362831))
