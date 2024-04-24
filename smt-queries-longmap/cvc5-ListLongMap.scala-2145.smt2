; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36152 () Bool)

(assert start!36152)

(declare-fun b!362586 () Bool)

(declare-fun e!222059 () Bool)

(assert (=> b!362586 (= e!222059 true)))

(declare-fun lt!166901 () (_ BitVec 32))

(declare-datatypes ((array!20463 0))(
  ( (array!20464 (arr!9713 (Array (_ BitVec 32) (_ BitVec 64))) (size!10065 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20463)

(declare-fun i!1478 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20463 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362586 (= lt!166901 (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!166902 () (_ BitVec 32))

(declare-fun lt!166900 () array!20463)

(assert (=> b!362586 (= lt!166902 (arrayCountValidKeys!0 lt!166900 (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!362587 () Bool)

(declare-fun res!201921 () Bool)

(declare-fun e!222061 () Bool)

(assert (=> b!362587 (=> (not res!201921) (not e!222061))))

(declare-fun k!2980 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362587 (= res!201921 (validKeyInArray!0 k!2980))))

(declare-fun b!362588 () Bool)

(declare-fun res!201924 () Bool)

(assert (=> b!362588 (=> (not res!201924) (not e!222061))))

(assert (=> b!362588 (= res!201924 (not (validKeyInArray!0 (select (arr!9713 a!4337) i!1478))))))

(declare-fun res!201925 () Bool)

(assert (=> start!36152 (=> (not res!201925) (not e!222061))))

(assert (=> start!36152 (= res!201925 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10065 a!4337))))))

(assert (=> start!36152 e!222061))

(assert (=> start!36152 true))

(declare-fun array_inv!7185 (array!20463) Bool)

(assert (=> start!36152 (array_inv!7185 a!4337)))

(declare-fun b!362589 () Bool)

(assert (=> b!362589 (= e!222061 (not e!222059))))

(declare-fun res!201922 () Bool)

(assert (=> b!362589 (=> res!201922 e!222059)))

(assert (=> b!362589 (= res!201922 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1478) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1478) i!1478)))))

(assert (=> b!362589 (= (arrayCountValidKeys!0 lt!166900 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478))))))

(assert (=> b!362589 (= lt!166900 (array!20464 (store (arr!9713 a!4337) i!1478 k!2980) (size!10065 a!4337)))))

(declare-datatypes ((Unit!11135 0))(
  ( (Unit!11136) )
))
(declare-fun lt!166899 () Unit!11135)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20463 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11135)

(assert (=> b!362589 (= lt!166899 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k!2980 i!1478))))

(declare-fun b!362590 () Bool)

(declare-fun res!201923 () Bool)

(assert (=> b!362590 (=> (not res!201923) (not e!222061))))

(assert (=> b!362590 (= res!201923 (bvslt (size!10065 a!4337) #b01111111111111111111111111111111))))

(assert (= (and start!36152 res!201925) b!362588))

(assert (= (and b!362588 res!201924) b!362587))

(assert (= (and b!362587 res!201921) b!362590))

(assert (= (and b!362590 res!201923) b!362589))

(assert (= (and b!362589 (not res!201922)) b!362586))

(declare-fun m!359459 () Bool)

(assert (=> start!36152 m!359459))

(declare-fun m!359461 () Bool)

(assert (=> b!362587 m!359461))

(declare-fun m!359463 () Bool)

(assert (=> b!362589 m!359463))

(declare-fun m!359465 () Bool)

(assert (=> b!362589 m!359465))

(declare-fun m!359467 () Bool)

(assert (=> b!362589 m!359467))

(declare-fun m!359469 () Bool)

(assert (=> b!362589 m!359469))

(declare-fun m!359471 () Bool)

(assert (=> b!362586 m!359471))

(declare-fun m!359473 () Bool)

(assert (=> b!362586 m!359473))

(declare-fun m!359475 () Bool)

(assert (=> b!362588 m!359475))

(assert (=> b!362588 m!359475))

(declare-fun m!359477 () Bool)

(assert (=> b!362588 m!359477))

(push 1)

(assert (not b!362588))

(assert (not b!362589))

(assert (not b!362586))

(assert (not b!362587))

(assert (not start!36152))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

