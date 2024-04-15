; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36414 () Bool)

(assert start!36414)

(declare-fun b!364032 () Bool)

(declare-fun e!222858 () Bool)

(assert (=> b!364032 (= e!222858 false)))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20690 0))(
  ( (array!20691 (arr!9824 (Array (_ BitVec 32) (_ BitVec 64))) (size!10177 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20690)

(declare-fun lt!168223 () (_ BitVec 32))

(declare-fun k!2974 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!20690 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364032 (= lt!168223 (arrayCountValidKeys!0 (array!20691 (store (arr!9824 a!4289) i!1472 k!2974) (size!10177 a!4289)) from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!168222 () (_ BitVec 32))

(assert (=> b!364032 (= lt!168222 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun b!364030 () Bool)

(declare-fun res!203334 () Bool)

(assert (=> b!364030 (=> (not res!203334) (not e!222858))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364030 (= res!203334 (validKeyInArray!0 k!2974))))

(declare-fun b!364029 () Bool)

(declare-fun res!203335 () Bool)

(assert (=> b!364029 (=> (not res!203335) (not e!222858))))

(assert (=> b!364029 (= res!203335 (not (validKeyInArray!0 (select (arr!9824 a!4289) i!1472))))))

(declare-fun res!203332 () Bool)

(assert (=> start!36414 (=> (not res!203332) (not e!222858))))

(assert (=> start!36414 (= res!203332 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10177 a!4289))))))

(assert (=> start!36414 e!222858))

(assert (=> start!36414 true))

(declare-fun array_inv!7273 (array!20690) Bool)

(assert (=> start!36414 (array_inv!7273 a!4289)))

(declare-fun b!364031 () Bool)

(declare-fun res!203333 () Bool)

(assert (=> b!364031 (=> (not res!203333) (not e!222858))))

(assert (=> b!364031 (= res!203333 (and (bvslt (size!10177 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10177 a!4289)) (bvsge i!1472 from!3650)))))

(assert (= (and start!36414 res!203332) b!364029))

(assert (= (and b!364029 res!203335) b!364030))

(assert (= (and b!364030 res!203334) b!364031))

(assert (= (and b!364031 res!203333) b!364032))

(declare-fun m!361077 () Bool)

(assert (=> b!364032 m!361077))

(declare-fun m!361079 () Bool)

(assert (=> b!364032 m!361079))

(declare-fun m!361081 () Bool)

(assert (=> b!364032 m!361081))

(declare-fun m!361083 () Bool)

(assert (=> b!364030 m!361083))

(declare-fun m!361085 () Bool)

(assert (=> b!364029 m!361085))

(assert (=> b!364029 m!361085))

(declare-fun m!361087 () Bool)

(assert (=> b!364029 m!361087))

(declare-fun m!361089 () Bool)

(assert (=> start!36414 m!361089))

(push 1)

(assert (not b!364029))

(assert (not b!364030))

(assert (not b!364032))

(assert (not start!36414))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

