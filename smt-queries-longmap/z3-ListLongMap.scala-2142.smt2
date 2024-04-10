; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36146 () Bool)

(assert start!36146)

(declare-fun b!362485 () Bool)

(declare-fun e!222003 () Bool)

(declare-fun e!222001 () Bool)

(assert (=> b!362485 (= e!222003 (not e!222001))))

(declare-fun res!201776 () Bool)

(assert (=> b!362485 (=> res!201776 e!222001)))

(declare-fun i!1478 () (_ BitVec 32))

(assert (=> b!362485 (= res!201776 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1478) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1478) i!1478)))))

(declare-datatypes ((array!20462 0))(
  ( (array!20463 (arr!9713 (Array (_ BitVec 32) (_ BitVec 64))) (size!10065 (_ BitVec 32))) )
))
(declare-fun lt!166760 () array!20462)

(declare-fun a!4337 () array!20462)

(declare-fun arrayCountValidKeys!0 (array!20462 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362485 (= (arrayCountValidKeys!0 lt!166760 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478))))))

(declare-fun k0!2980 () (_ BitVec 64))

(assert (=> b!362485 (= lt!166760 (array!20463 (store (arr!9713 a!4337) i!1478 k0!2980) (size!10065 a!4337)))))

(declare-datatypes ((Unit!11126 0))(
  ( (Unit!11127) )
))
(declare-fun lt!166763 () Unit!11126)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20462 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11126)

(assert (=> b!362485 (= lt!166763 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k0!2980 i!1478))))

(declare-fun b!362486 () Bool)

(declare-fun res!201775 () Bool)

(assert (=> b!362486 (=> (not res!201775) (not e!222003))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362486 (= res!201775 (validKeyInArray!0 k0!2980))))

(declare-fun b!362487 () Bool)

(assert (=> b!362487 (= e!222001 true)))

(declare-fun lt!166762 () (_ BitVec 32))

(assert (=> b!362487 (= lt!166762 (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!166761 () (_ BitVec 32))

(assert (=> b!362487 (= lt!166761 (arrayCountValidKeys!0 lt!166760 (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun res!201774 () Bool)

(assert (=> start!36146 (=> (not res!201774) (not e!222003))))

(assert (=> start!36146 (= res!201774 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10065 a!4337))))))

(assert (=> start!36146 e!222003))

(assert (=> start!36146 true))

(declare-fun array_inv!7155 (array!20462) Bool)

(assert (=> start!36146 (array_inv!7155 a!4337)))

(declare-fun b!362488 () Bool)

(declare-fun res!201778 () Bool)

(assert (=> b!362488 (=> (not res!201778) (not e!222003))))

(assert (=> b!362488 (= res!201778 (not (validKeyInArray!0 (select (arr!9713 a!4337) i!1478))))))

(declare-fun b!362489 () Bool)

(declare-fun res!201777 () Bool)

(assert (=> b!362489 (=> (not res!201777) (not e!222003))))

(assert (=> b!362489 (= res!201777 (bvslt (size!10065 a!4337) #b01111111111111111111111111111111))))

(assert (= (and start!36146 res!201774) b!362488))

(assert (= (and b!362488 res!201778) b!362486))

(assert (= (and b!362486 res!201775) b!362489))

(assert (= (and b!362489 res!201777) b!362485))

(assert (= (and b!362485 (not res!201776)) b!362487))

(declare-fun m!359029 () Bool)

(assert (=> b!362487 m!359029))

(declare-fun m!359031 () Bool)

(assert (=> b!362487 m!359031))

(declare-fun m!359033 () Bool)

(assert (=> start!36146 m!359033))

(declare-fun m!359035 () Bool)

(assert (=> b!362486 m!359035))

(declare-fun m!359037 () Bool)

(assert (=> b!362485 m!359037))

(declare-fun m!359039 () Bool)

(assert (=> b!362485 m!359039))

(declare-fun m!359041 () Bool)

(assert (=> b!362485 m!359041))

(declare-fun m!359043 () Bool)

(assert (=> b!362485 m!359043))

(declare-fun m!359045 () Bool)

(assert (=> b!362488 m!359045))

(assert (=> b!362488 m!359045))

(declare-fun m!359047 () Bool)

(assert (=> b!362488 m!359047))

(check-sat (not start!36146) (not b!362488) (not b!362485) (not b!362486) (not b!362487))
