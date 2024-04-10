; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36130 () Bool)

(assert start!36130)

(declare-fun b!362387 () Bool)

(declare-fun e!221949 () Bool)

(assert (=> b!362387 (= e!221949 false)))

(declare-fun i!1478 () (_ BitVec 32))

(declare-fun lt!166703 () (_ BitVec 32))

(declare-fun k!2980 () (_ BitVec 64))

(declare-datatypes ((array!20446 0))(
  ( (array!20447 (arr!9705 (Array (_ BitVec 32) (_ BitVec 64))) (size!10057 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20446)

(declare-fun arrayCountValidKeys!0 (array!20446 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362387 (= lt!166703 (arrayCountValidKeys!0 (array!20447 (store (arr!9705 a!4337) i!1478 k!2980) (size!10057 a!4337)) i!1478 (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!166702 () (_ BitVec 32))

(assert (=> b!362387 (= lt!166702 (arrayCountValidKeys!0 a!4337 i!1478 (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!362385 () Bool)

(declare-fun res!201676 () Bool)

(assert (=> b!362385 (=> (not res!201676) (not e!221949))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362385 (= res!201676 (validKeyInArray!0 k!2980))))

(declare-fun res!201673 () Bool)

(assert (=> start!36130 (=> (not res!201673) (not e!221949))))

(assert (=> start!36130 (= res!201673 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10057 a!4337))))))

(assert (=> start!36130 e!221949))

(assert (=> start!36130 true))

(declare-fun array_inv!7147 (array!20446) Bool)

(assert (=> start!36130 (array_inv!7147 a!4337)))

(declare-fun b!362386 () Bool)

(declare-fun res!201675 () Bool)

(assert (=> b!362386 (=> (not res!201675) (not e!221949))))

(assert (=> b!362386 (= res!201675 (and (bvslt (size!10057 a!4337) #b01111111111111111111111111111111) (bvsle i!1478 (size!10057 a!4337))))))

(declare-fun b!362384 () Bool)

(declare-fun res!201674 () Bool)

(assert (=> b!362384 (=> (not res!201674) (not e!221949))))

(assert (=> b!362384 (= res!201674 (not (validKeyInArray!0 (select (arr!9705 a!4337) i!1478))))))

(assert (= (and start!36130 res!201673) b!362384))

(assert (= (and b!362384 res!201674) b!362385))

(assert (= (and b!362385 res!201676) b!362386))

(assert (= (and b!362386 res!201675) b!362387))

(declare-fun m!358911 () Bool)

(assert (=> b!362387 m!358911))

(declare-fun m!358913 () Bool)

(assert (=> b!362387 m!358913))

(declare-fun m!358915 () Bool)

(assert (=> b!362387 m!358915))

(declare-fun m!358917 () Bool)

(assert (=> b!362385 m!358917))

(declare-fun m!358919 () Bool)

(assert (=> start!36130 m!358919))

(declare-fun m!358921 () Bool)

(assert (=> b!362384 m!358921))

(assert (=> b!362384 m!358921))

(declare-fun m!358923 () Bool)

(assert (=> b!362384 m!358923))

(push 1)

(assert (not start!36130))

(assert (not b!362387))

(assert (not b!362385))

(assert (not b!362384))

(check-sat)

