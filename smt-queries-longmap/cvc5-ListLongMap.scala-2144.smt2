; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36156 () Bool)

(assert start!36156)

(declare-fun b!362560 () Bool)

(declare-fun res!201851 () Bool)

(declare-fun e!222047 () Bool)

(assert (=> b!362560 (=> (not res!201851) (not e!222047))))

(declare-datatypes ((array!20472 0))(
  ( (array!20473 (arr!9718 (Array (_ BitVec 32) (_ BitVec 64))) (size!10070 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20472)

(assert (=> b!362560 (= res!201851 (bvslt (size!10070 a!4337) #b01111111111111111111111111111111))))

(declare-fun b!362561 () Bool)

(declare-fun res!201852 () Bool)

(assert (=> b!362561 (=> (not res!201852) (not e!222047))))

(declare-fun k!2980 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362561 (= res!201852 (validKeyInArray!0 k!2980))))

(declare-fun b!362562 () Bool)

(declare-fun e!222046 () Bool)

(assert (=> b!362562 (= e!222047 (not e!222046))))

(declare-fun res!201849 () Bool)

(assert (=> b!362562 (=> res!201849 e!222046)))

(declare-fun i!1478 () (_ BitVec 32))

(assert (=> b!362562 (= res!201849 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1478) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1478) i!1478)))))

(declare-fun lt!166822 () array!20472)

(declare-fun arrayCountValidKeys!0 (array!20472 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362562 (= (arrayCountValidKeys!0 lt!166822 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478))))))

(assert (=> b!362562 (= lt!166822 (array!20473 (store (arr!9718 a!4337) i!1478 k!2980) (size!10070 a!4337)))))

(declare-datatypes ((Unit!11136 0))(
  ( (Unit!11137) )
))
(declare-fun lt!166823 () Unit!11136)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20472 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11136)

(assert (=> b!362562 (= lt!166823 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k!2980 i!1478))))

(declare-fun b!362564 () Bool)

(declare-fun res!201850 () Bool)

(assert (=> b!362564 (=> (not res!201850) (not e!222047))))

(assert (=> b!362564 (= res!201850 (not (validKeyInArray!0 (select (arr!9718 a!4337) i!1478))))))

(declare-fun b!362563 () Bool)

(assert (=> b!362563 (= e!222046 true)))

(declare-fun lt!166820 () (_ BitVec 32))

(assert (=> b!362563 (= lt!166820 (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!166821 () (_ BitVec 32))

(assert (=> b!362563 (= lt!166821 (arrayCountValidKeys!0 lt!166822 (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun res!201853 () Bool)

(assert (=> start!36156 (=> (not res!201853) (not e!222047))))

(assert (=> start!36156 (= res!201853 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10070 a!4337))))))

(assert (=> start!36156 e!222047))

(assert (=> start!36156 true))

(declare-fun array_inv!7160 (array!20472) Bool)

(assert (=> start!36156 (array_inv!7160 a!4337)))

(assert (= (and start!36156 res!201853) b!362564))

(assert (= (and b!362564 res!201850) b!362561))

(assert (= (and b!362561 res!201852) b!362560))

(assert (= (and b!362560 res!201851) b!362562))

(assert (= (and b!362562 (not res!201849)) b!362563))

(declare-fun m!359129 () Bool)

(assert (=> b!362562 m!359129))

(declare-fun m!359131 () Bool)

(assert (=> b!362562 m!359131))

(declare-fun m!359133 () Bool)

(assert (=> b!362562 m!359133))

(declare-fun m!359135 () Bool)

(assert (=> b!362562 m!359135))

(declare-fun m!359137 () Bool)

(assert (=> start!36156 m!359137))

(declare-fun m!359139 () Bool)

(assert (=> b!362563 m!359139))

(declare-fun m!359141 () Bool)

(assert (=> b!362563 m!359141))

(declare-fun m!359143 () Bool)

(assert (=> b!362561 m!359143))

(declare-fun m!359145 () Bool)

(assert (=> b!362564 m!359145))

(assert (=> b!362564 m!359145))

(declare-fun m!359147 () Bool)

(assert (=> b!362564 m!359147))

(push 1)

(assert (not start!36156))

(assert (not b!362562))

(assert (not b!362561))

(assert (not b!362564))

(assert (not b!362563))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

