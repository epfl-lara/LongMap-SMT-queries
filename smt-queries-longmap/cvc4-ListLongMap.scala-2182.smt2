; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36414 () Bool)

(assert start!36414)

(declare-fun b!364251 () Bool)

(declare-fun res!203458 () Bool)

(declare-fun e!223001 () Bool)

(assert (=> b!364251 (=> (not res!203458) (not e!223001))))

(declare-datatypes ((array!20689 0))(
  ( (array!20690 (arr!9823 (Array (_ BitVec 32) (_ BitVec 64))) (size!10175 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20689)

(declare-fun i!1472 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364251 (= res!203458 (not (validKeyInArray!0 (select (arr!9823 a!4289) i!1472))))))

(declare-fun res!203459 () Bool)

(assert (=> start!36414 (=> (not res!203459) (not e!223001))))

(assert (=> start!36414 (= res!203459 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10175 a!4289))))))

(assert (=> start!36414 e!223001))

(assert (=> start!36414 true))

(declare-fun array_inv!7295 (array!20689) Bool)

(assert (=> start!36414 (array_inv!7295 a!4289)))

(declare-fun b!364252 () Bool)

(declare-fun res!203460 () Bool)

(assert (=> b!364252 (=> (not res!203460) (not e!223001))))

(declare-fun k!2974 () (_ BitVec 64))

(assert (=> b!364252 (= res!203460 (validKeyInArray!0 k!2974))))

(declare-fun b!364253 () Bool)

(declare-fun res!203461 () Bool)

(assert (=> b!364253 (=> (not res!203461) (not e!223001))))

(declare-fun from!3650 () (_ BitVec 32))

(assert (=> b!364253 (= res!203461 (and (bvslt (size!10175 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10175 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!364254 () Bool)

(assert (=> b!364254 (= e!223001 false)))

(declare-fun lt!168475 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20689 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364254 (= lt!168475 (arrayCountValidKeys!0 (array!20690 (store (arr!9823 a!4289) i!1472 k!2974) (size!10175 a!4289)) from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!168476 () (_ BitVec 32))

(assert (=> b!364254 (= lt!168476 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (= (and start!36414 res!203459) b!364251))

(assert (= (and b!364251 res!203458) b!364252))

(assert (= (and b!364252 res!203460) b!364253))

(assert (= (and b!364253 res!203461) b!364254))

(declare-fun m!362031 () Bool)

(assert (=> b!364251 m!362031))

(assert (=> b!364251 m!362031))

(declare-fun m!362033 () Bool)

(assert (=> b!364251 m!362033))

(declare-fun m!362035 () Bool)

(assert (=> start!36414 m!362035))

(declare-fun m!362037 () Bool)

(assert (=> b!364252 m!362037))

(declare-fun m!362039 () Bool)

(assert (=> b!364254 m!362039))

(declare-fun m!362041 () Bool)

(assert (=> b!364254 m!362041))

(declare-fun m!362043 () Bool)

(assert (=> b!364254 m!362043))

(push 1)

(assert (not b!364254))

(assert (not start!36414))

(assert (not b!364251))

(assert (not b!364252))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

