; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71904 () Bool)

(assert start!71904)

(declare-fun b!835529 () Bool)

(declare-fun e!466103 () Bool)

(declare-fun e!466104 () Bool)

(assert (=> b!835529 (= e!466103 e!466104)))

(declare-fun res!568406 () Bool)

(assert (=> b!835529 (=> (not res!568406) (not e!466104))))

(declare-datatypes ((array!46814 0))(
  ( (array!46815 (arr!22441 (Array (_ BitVec 32) (_ BitVec 64))) (size!22862 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46814)

(declare-fun lt!379758 () (_ BitVec 32))

(declare-fun lt!379759 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!835529 (= res!568406 (and (= lt!379759 lt!379758) (not (= to!390 (size!22862 a!4227)))))))

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46814 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!835529 (= lt!379758 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun k0!2968 () (_ BitVec 64))

(assert (=> b!835529 (= lt!379759 (arrayCountValidKeys!0 (array!46815 (store (arr!22441 a!4227) i!1466 k0!2968) (size!22862 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun b!835530 () Bool)

(declare-fun e!466101 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!835530 (= e!466101 (not (validKeyInArray!0 (select (store (arr!22441 a!4227) i!1466 k0!2968) to!390))))))

(declare-fun b!835531 () Bool)

(declare-fun res!568401 () Bool)

(assert (=> b!835531 (=> (not res!568401) (not e!466103))))

(assert (=> b!835531 (= res!568401 (and (bvslt (size!22862 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22862 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!835532 () Bool)

(declare-fun res!568400 () Bool)

(assert (=> b!835532 (=> (not res!568400) (not e!466104))))

(assert (=> b!835532 (= res!568400 (not (validKeyInArray!0 (select (arr!22441 a!4227) to!390))))))

(declare-fun res!568403 () Bool)

(assert (=> start!71904 (=> (not res!568403) (not e!466103))))

(assert (=> start!71904 (= res!568403 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22862 a!4227))))))

(assert (=> start!71904 e!466103))

(assert (=> start!71904 true))

(declare-fun array_inv!17888 (array!46814) Bool)

(assert (=> start!71904 (array_inv!17888 a!4227)))

(declare-fun b!835533 () Bool)

(assert (=> b!835533 (= e!466104 (not e!466101))))

(declare-fun res!568404 () Bool)

(assert (=> b!835533 (=> (not res!568404) (not e!466101))))

(assert (=> b!835533 (= res!568404 (and (bvsge (bvadd #b00000000000000000000000000000001 i!1466) #b00000000000000000000000000000000) (bvslt to!390 (size!22862 a!4227))))))

(assert (=> b!835533 (= (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)) lt!379758)))

(declare-datatypes ((Unit!28727 0))(
  ( (Unit!28728) )
))
(declare-fun lt!379757 () Unit!28727)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46814 (_ BitVec 32) (_ BitVec 32)) Unit!28727)

(assert (=> b!835533 (= lt!379757 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun b!835534 () Bool)

(declare-fun res!568405 () Bool)

(assert (=> b!835534 (=> (not res!568405) (not e!466103))))

(assert (=> b!835534 (= res!568405 (validKeyInArray!0 k0!2968))))

(declare-fun b!835535 () Bool)

(declare-fun res!568402 () Bool)

(assert (=> b!835535 (=> (not res!568402) (not e!466103))))

(assert (=> b!835535 (= res!568402 (not (validKeyInArray!0 (select (arr!22441 a!4227) i!1466))))))

(assert (= (and start!71904 res!568403) b!835535))

(assert (= (and b!835535 res!568402) b!835534))

(assert (= (and b!835534 res!568405) b!835531))

(assert (= (and b!835531 res!568401) b!835529))

(assert (= (and b!835529 res!568406) b!835532))

(assert (= (and b!835532 res!568400) b!835533))

(assert (= (and b!835533 res!568404) b!835530))

(declare-fun m!780713 () Bool)

(assert (=> b!835535 m!780713))

(assert (=> b!835535 m!780713))

(declare-fun m!780715 () Bool)

(assert (=> b!835535 m!780715))

(declare-fun m!780717 () Bool)

(assert (=> b!835530 m!780717))

(declare-fun m!780719 () Bool)

(assert (=> b!835530 m!780719))

(assert (=> b!835530 m!780719))

(declare-fun m!780721 () Bool)

(assert (=> b!835530 m!780721))

(declare-fun m!780723 () Bool)

(assert (=> b!835533 m!780723))

(declare-fun m!780725 () Bool)

(assert (=> b!835533 m!780725))

(declare-fun m!780727 () Bool)

(assert (=> b!835529 m!780727))

(assert (=> b!835529 m!780717))

(declare-fun m!780729 () Bool)

(assert (=> b!835529 m!780729))

(declare-fun m!780731 () Bool)

(assert (=> start!71904 m!780731))

(declare-fun m!780733 () Bool)

(assert (=> b!835534 m!780733))

(declare-fun m!780735 () Bool)

(assert (=> b!835532 m!780735))

(assert (=> b!835532 m!780735))

(declare-fun m!780737 () Bool)

(assert (=> b!835532 m!780737))

(check-sat (not b!835535) (not b!835534) (not start!71904) (not b!835532) (not b!835533) (not b!835530) (not b!835529))
(check-sat)
