; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36320 () Bool)

(assert start!36320)

(declare-fun b!363504 () Bool)

(declare-fun e!222569 () Bool)

(declare-fun e!222571 () Bool)

(assert (=> b!363504 (= e!222569 (not e!222571))))

(declare-fun res!202666 () Bool)

(assert (=> b!363504 (=> res!202666 e!222571)))

(declare-datatypes ((array!20600 0))(
  ( (array!20601 (arr!9779 (Array (_ BitVec 32) (_ BitVec 64))) (size!10131 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20600)

(declare-fun i!1478 () (_ BitVec 32))

(assert (=> b!363504 (= res!202666 (or (bvslt (size!10131 a!4337) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!1478) #b00000000000000000000000000000000)))))

(declare-fun lt!167726 () (_ BitVec 32))

(declare-fun lt!167727 () (_ BitVec 32))

(declare-fun lt!167728 () (_ BitVec 32))

(assert (=> b!363504 (= (bvadd lt!167726 lt!167727) lt!167728)))

(declare-fun arrayCountValidKeys!0 (array!20600 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363504 (= lt!167728 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (size!10131 a!4337)))))

(declare-datatypes ((Unit!11246 0))(
  ( (Unit!11247) )
))
(declare-fun lt!167723 () Unit!11246)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20600 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11246)

(assert (=> b!363504 (= lt!167723 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4337 #b00000000000000000000000000000000 (size!10131 a!4337) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!167720 () (_ BitVec 32))

(assert (=> b!363504 (= lt!167720 lt!167727)))

(assert (=> b!363504 (= lt!167727 (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (size!10131 a!4337)))))

(declare-fun lt!167725 () array!20600)

(assert (=> b!363504 (= lt!167720 (arrayCountValidKeys!0 lt!167725 (bvadd #b00000000000000000000000000000001 i!1478) (size!10131 a!4337)))))

(declare-fun lt!167718 () Unit!11246)

(declare-fun k0!2980 () (_ BitVec 64))

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!20600 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11246)

(assert (=> b!363504 (= lt!167718 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4337 i!1478 k0!2980 (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!167722 () (_ BitVec 32))

(assert (=> b!363504 (= lt!167722 (bvadd #b00000000000000000000000000000001 lt!167726))))

(assert (=> b!363504 (= lt!167722 (arrayCountValidKeys!0 lt!167725 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!363504 (= lt!167726 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!363504 (= lt!167725 (array!20601 (store (arr!9779 a!4337) i!1478 k0!2980) (size!10131 a!4337)))))

(declare-fun lt!167719 () Unit!11246)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20600 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11246)

(assert (=> b!363504 (= lt!167719 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k0!2980 i!1478))))

(declare-fun b!363505 () Bool)

(declare-fun res!202668 () Bool)

(assert (=> b!363505 (=> (not res!202668) (not e!222569))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363505 (= res!202668 (validKeyInArray!0 k0!2980))))

(declare-fun res!202667 () Bool)

(assert (=> start!36320 (=> (not res!202667) (not e!222569))))

(assert (=> start!36320 (= res!202667 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10131 a!4337))))))

(assert (=> start!36320 e!222569))

(assert (=> start!36320 true))

(declare-fun array_inv!7221 (array!20600) Bool)

(assert (=> start!36320 (array_inv!7221 a!4337)))

(declare-fun b!363506 () Bool)

(declare-fun res!202665 () Bool)

(assert (=> b!363506 (=> (not res!202665) (not e!222569))))

(assert (=> b!363506 (= res!202665 (bvslt (size!10131 a!4337) #b01111111111111111111111111111111))))

(declare-fun b!363507 () Bool)

(declare-fun lt!167724 () (_ BitVec 32))

(assert (=> b!363507 (= e!222571 (= lt!167724 (bvadd #b00000000000000000000000000000001 lt!167728)))))

(assert (=> b!363507 (= (bvadd lt!167722 lt!167720) lt!167724)))

(assert (=> b!363507 (= lt!167724 (arrayCountValidKeys!0 lt!167725 #b00000000000000000000000000000000 (size!10131 a!4337)))))

(declare-fun lt!167721 () Unit!11246)

(assert (=> b!363507 (= lt!167721 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!167725 #b00000000000000000000000000000000 (size!10131 a!4337) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!363508 () Bool)

(declare-fun res!202669 () Bool)

(assert (=> b!363508 (=> (not res!202669) (not e!222569))))

(assert (=> b!363508 (= res!202669 (not (validKeyInArray!0 (select (arr!9779 a!4337) i!1478))))))

(assert (= (and start!36320 res!202667) b!363508))

(assert (= (and b!363508 res!202669) b!363505))

(assert (= (and b!363505 res!202668) b!363506))

(assert (= (and b!363506 res!202665) b!363504))

(assert (= (and b!363504 (not res!202666)) b!363507))

(declare-fun m!360599 () Bool)

(assert (=> b!363508 m!360599))

(assert (=> b!363508 m!360599))

(declare-fun m!360601 () Bool)

(assert (=> b!363508 m!360601))

(declare-fun m!360603 () Bool)

(assert (=> b!363507 m!360603))

(declare-fun m!360605 () Bool)

(assert (=> b!363507 m!360605))

(declare-fun m!360607 () Bool)

(assert (=> start!36320 m!360607))

(declare-fun m!360609 () Bool)

(assert (=> b!363504 m!360609))

(declare-fun m!360611 () Bool)

(assert (=> b!363504 m!360611))

(declare-fun m!360613 () Bool)

(assert (=> b!363504 m!360613))

(declare-fun m!360615 () Bool)

(assert (=> b!363504 m!360615))

(declare-fun m!360617 () Bool)

(assert (=> b!363504 m!360617))

(declare-fun m!360619 () Bool)

(assert (=> b!363504 m!360619))

(declare-fun m!360621 () Bool)

(assert (=> b!363504 m!360621))

(declare-fun m!360623 () Bool)

(assert (=> b!363504 m!360623))

(declare-fun m!360625 () Bool)

(assert (=> b!363504 m!360625))

(declare-fun m!360627 () Bool)

(assert (=> b!363505 m!360627))

(check-sat (not b!363508) (not b!363505) (not start!36320) (not b!363507) (not b!363504))
