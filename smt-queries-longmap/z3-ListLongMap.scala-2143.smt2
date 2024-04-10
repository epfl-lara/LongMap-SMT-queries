; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36152 () Bool)

(assert start!36152)

(declare-fun b!362530 () Bool)

(declare-fun res!201820 () Bool)

(declare-fun e!222030 () Bool)

(assert (=> b!362530 (=> (not res!201820) (not e!222030))))

(declare-datatypes ((array!20468 0))(
  ( (array!20469 (arr!9716 (Array (_ BitVec 32) (_ BitVec 64))) (size!10068 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20468)

(declare-fun i!1478 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362530 (= res!201820 (not (validKeyInArray!0 (select (arr!9716 a!4337) i!1478))))))

(declare-fun b!362531 () Bool)

(declare-fun e!222029 () Bool)

(assert (=> b!362531 (= e!222030 (not e!222029))))

(declare-fun res!201821 () Bool)

(assert (=> b!362531 (=> res!201821 e!222029)))

(assert (=> b!362531 (= res!201821 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1478) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1478) i!1478)))))

(declare-fun lt!166797 () array!20468)

(declare-fun arrayCountValidKeys!0 (array!20468 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362531 (= (arrayCountValidKeys!0 lt!166797 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478))))))

(declare-fun k0!2980 () (_ BitVec 64))

(assert (=> b!362531 (= lt!166797 (array!20469 (store (arr!9716 a!4337) i!1478 k0!2980) (size!10068 a!4337)))))

(declare-datatypes ((Unit!11132 0))(
  ( (Unit!11133) )
))
(declare-fun lt!166798 () Unit!11132)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20468 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11132)

(assert (=> b!362531 (= lt!166798 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k0!2980 i!1478))))

(declare-fun b!362532 () Bool)

(declare-fun res!201823 () Bool)

(assert (=> b!362532 (=> (not res!201823) (not e!222030))))

(assert (=> b!362532 (= res!201823 (bvslt (size!10068 a!4337) #b01111111111111111111111111111111))))

(declare-fun b!362533 () Bool)

(declare-fun res!201822 () Bool)

(assert (=> b!362533 (=> (not res!201822) (not e!222030))))

(assert (=> b!362533 (= res!201822 (validKeyInArray!0 k0!2980))))

(declare-fun res!201819 () Bool)

(assert (=> start!36152 (=> (not res!201819) (not e!222030))))

(assert (=> start!36152 (= res!201819 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10068 a!4337))))))

(assert (=> start!36152 e!222030))

(assert (=> start!36152 true))

(declare-fun array_inv!7158 (array!20468) Bool)

(assert (=> start!36152 (array_inv!7158 a!4337)))

(declare-fun b!362534 () Bool)

(assert (=> b!362534 (= e!222029 true)))

(declare-fun lt!166799 () (_ BitVec 32))

(assert (=> b!362534 (= lt!166799 (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!166796 () (_ BitVec 32))

(assert (=> b!362534 (= lt!166796 (arrayCountValidKeys!0 lt!166797 (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (= (and start!36152 res!201819) b!362530))

(assert (= (and b!362530 res!201820) b!362533))

(assert (= (and b!362533 res!201822) b!362532))

(assert (= (and b!362532 res!201823) b!362531))

(assert (= (and b!362531 (not res!201821)) b!362534))

(declare-fun m!359089 () Bool)

(assert (=> b!362534 m!359089))

(declare-fun m!359091 () Bool)

(assert (=> b!362534 m!359091))

(declare-fun m!359093 () Bool)

(assert (=> b!362533 m!359093))

(declare-fun m!359095 () Bool)

(assert (=> b!362530 m!359095))

(assert (=> b!362530 m!359095))

(declare-fun m!359097 () Bool)

(assert (=> b!362530 m!359097))

(declare-fun m!359099 () Bool)

(assert (=> b!362531 m!359099))

(declare-fun m!359101 () Bool)

(assert (=> b!362531 m!359101))

(declare-fun m!359103 () Bool)

(assert (=> b!362531 m!359103))

(declare-fun m!359105 () Bool)

(assert (=> b!362531 m!359105))

(declare-fun m!359107 () Bool)

(assert (=> start!36152 m!359107))

(check-sat (not b!362534) (not b!362530) (not b!362533) (not start!36152) (not b!362531))
