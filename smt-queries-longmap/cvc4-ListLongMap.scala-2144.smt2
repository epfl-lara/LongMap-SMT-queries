; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36160 () Bool)

(assert start!36160)

(declare-fun res!201882 () Bool)

(declare-fun e!222064 () Bool)

(assert (=> start!36160 (=> (not res!201882) (not e!222064))))

(declare-fun i!1478 () (_ BitVec 32))

(declare-datatypes ((array!20476 0))(
  ( (array!20477 (arr!9720 (Array (_ BitVec 32) (_ BitVec 64))) (size!10072 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20476)

(assert (=> start!36160 (= res!201882 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10072 a!4337))))))

(assert (=> start!36160 e!222064))

(assert (=> start!36160 true))

(declare-fun array_inv!7162 (array!20476) Bool)

(assert (=> start!36160 (array_inv!7162 a!4337)))

(declare-fun b!362590 () Bool)

(declare-fun res!201879 () Bool)

(assert (=> b!362590 (=> (not res!201879) (not e!222064))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362590 (= res!201879 (not (validKeyInArray!0 (select (arr!9720 a!4337) i!1478))))))

(declare-fun b!362591 () Bool)

(declare-fun res!201883 () Bool)

(assert (=> b!362591 (=> (not res!201883) (not e!222064))))

(assert (=> b!362591 (= res!201883 (bvslt (size!10072 a!4337) #b01111111111111111111111111111111))))

(declare-fun b!362592 () Bool)

(declare-fun e!222066 () Bool)

(assert (=> b!362592 (= e!222066 true)))

(declare-fun lt!166845 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20476 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362592 (= lt!166845 (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!166846 () (_ BitVec 32))

(declare-fun lt!166844 () array!20476)

(assert (=> b!362592 (= lt!166846 (arrayCountValidKeys!0 lt!166844 (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!362593 () Bool)

(assert (=> b!362593 (= e!222064 (not e!222066))))

(declare-fun res!201881 () Bool)

(assert (=> b!362593 (=> res!201881 e!222066)))

(assert (=> b!362593 (= res!201881 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1478) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1478) i!1478)))))

(assert (=> b!362593 (= (arrayCountValidKeys!0 lt!166844 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478))))))

(declare-fun k!2980 () (_ BitVec 64))

(assert (=> b!362593 (= lt!166844 (array!20477 (store (arr!9720 a!4337) i!1478 k!2980) (size!10072 a!4337)))))

(declare-datatypes ((Unit!11140 0))(
  ( (Unit!11141) )
))
(declare-fun lt!166847 () Unit!11140)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20476 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11140)

(assert (=> b!362593 (= lt!166847 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k!2980 i!1478))))

(declare-fun b!362594 () Bool)

(declare-fun res!201880 () Bool)

(assert (=> b!362594 (=> (not res!201880) (not e!222064))))

(assert (=> b!362594 (= res!201880 (validKeyInArray!0 k!2980))))

(assert (= (and start!36160 res!201882) b!362590))

(assert (= (and b!362590 res!201879) b!362594))

(assert (= (and b!362594 res!201880) b!362591))

(assert (= (and b!362591 res!201883) b!362593))

(assert (= (and b!362593 (not res!201881)) b!362592))

(declare-fun m!359169 () Bool)

(assert (=> start!36160 m!359169))

(declare-fun m!359171 () Bool)

(assert (=> b!362594 m!359171))

(declare-fun m!359173 () Bool)

(assert (=> b!362592 m!359173))

(declare-fun m!359175 () Bool)

(assert (=> b!362592 m!359175))

(declare-fun m!359177 () Bool)

(assert (=> b!362593 m!359177))

(declare-fun m!359179 () Bool)

(assert (=> b!362593 m!359179))

(declare-fun m!359181 () Bool)

(assert (=> b!362593 m!359181))

(declare-fun m!359183 () Bool)

(assert (=> b!362593 m!359183))

(declare-fun m!359185 () Bool)

(assert (=> b!362590 m!359185))

(assert (=> b!362590 m!359185))

(declare-fun m!359187 () Bool)

(assert (=> b!362590 m!359187))

(push 1)

(assert (not b!362590))

(assert (not b!362592))

(assert (not start!36160))

(assert (not b!362593))

(assert (not b!362594))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

