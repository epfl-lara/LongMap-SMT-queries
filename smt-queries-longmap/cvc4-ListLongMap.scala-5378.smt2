; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71870 () Bool)

(assert start!71870)

(declare-fun b!835192 () Bool)

(declare-fun res!568063 () Bool)

(declare-fun e!465953 () Bool)

(assert (=> b!835192 (=> (not res!568063) (not e!465953))))

(declare-fun k!2968 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!835192 (= res!568063 (validKeyInArray!0 k!2968))))

(declare-fun b!835193 () Bool)

(declare-fun res!568065 () Bool)

(assert (=> b!835193 (=> (not res!568065) (not e!465953))))

(declare-datatypes ((array!46780 0))(
  ( (array!46781 (arr!22424 (Array (_ BitVec 32) (_ BitVec 64))) (size!22845 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46780)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46780 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!835193 (= res!568065 (= (arrayCountValidKeys!0 (array!46781 (store (arr!22424 a!4227) i!1466 k!2968) (size!22845 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390)))))

(declare-fun res!568066 () Bool)

(assert (=> start!71870 (=> (not res!568066) (not e!465953))))

(assert (=> start!71870 (= res!568066 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22845 a!4227))))))

(assert (=> start!71870 e!465953))

(assert (=> start!71870 true))

(declare-fun array_inv!17871 (array!46780) Bool)

(assert (=> start!71870 (array_inv!17871 a!4227)))

(declare-fun b!835194 () Bool)

(declare-fun res!568064 () Bool)

(assert (=> b!835194 (=> (not res!568064) (not e!465953))))

(assert (=> b!835194 (= res!568064 (not (validKeyInArray!0 (select (arr!22424 a!4227) i!1466))))))

(declare-fun b!835195 () Bool)

(declare-fun res!568067 () Bool)

(assert (=> b!835195 (=> (not res!568067) (not e!465953))))

(assert (=> b!835195 (= res!568067 (and (bvslt (size!22845 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22845 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!835196 () Bool)

(assert (=> b!835196 (= e!465953 (and (not (= to!390 (size!22845 a!4227))) (bvsge to!390 (size!22845 a!4227))))))

(assert (= (and start!71870 res!568066) b!835194))

(assert (= (and b!835194 res!568064) b!835192))

(assert (= (and b!835192 res!568063) b!835195))

(assert (= (and b!835195 res!568067) b!835193))

(assert (= (and b!835193 res!568065) b!835196))

(declare-fun m!780355 () Bool)

(assert (=> b!835192 m!780355))

(declare-fun m!780357 () Bool)

(assert (=> b!835193 m!780357))

(declare-fun m!780359 () Bool)

(assert (=> b!835193 m!780359))

(declare-fun m!780361 () Bool)

(assert (=> b!835193 m!780361))

(declare-fun m!780363 () Bool)

(assert (=> start!71870 m!780363))

(declare-fun m!780365 () Bool)

(assert (=> b!835194 m!780365))

(assert (=> b!835194 m!780365))

(declare-fun m!780367 () Bool)

(assert (=> b!835194 m!780367))

(push 1)

(assert (not b!835193))

(assert (not b!835194))

(assert (not b!835192))

(assert (not start!71870))

(check-sat)

(pop 1)

(push 1)

(check-sat)

