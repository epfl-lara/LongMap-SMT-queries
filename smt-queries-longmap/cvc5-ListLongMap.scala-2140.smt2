; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36132 () Bool)

(assert start!36132)

(declare-fun b!362399 () Bool)

(declare-fun e!221954 () Bool)

(assert (=> b!362399 (= e!221954 false)))

(declare-fun i!1478 () (_ BitVec 32))

(declare-fun lt!166708 () (_ BitVec 32))

(declare-fun k!2980 () (_ BitVec 64))

(declare-datatypes ((array!20448 0))(
  ( (array!20449 (arr!9706 (Array (_ BitVec 32) (_ BitVec 64))) (size!10058 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20448)

(declare-fun arrayCountValidKeys!0 (array!20448 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362399 (= lt!166708 (arrayCountValidKeys!0 (array!20449 (store (arr!9706 a!4337) i!1478 k!2980) (size!10058 a!4337)) i!1478 (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!166709 () (_ BitVec 32))

(assert (=> b!362399 (= lt!166709 (arrayCountValidKeys!0 a!4337 i!1478 (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!362397 () Bool)

(declare-fun res!201687 () Bool)

(assert (=> b!362397 (=> (not res!201687) (not e!221954))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362397 (= res!201687 (validKeyInArray!0 k!2980))))

(declare-fun b!362398 () Bool)

(declare-fun res!201685 () Bool)

(assert (=> b!362398 (=> (not res!201685) (not e!221954))))

(assert (=> b!362398 (= res!201685 (and (bvslt (size!10058 a!4337) #b01111111111111111111111111111111) (bvsle i!1478 (size!10058 a!4337))))))

(declare-fun b!362396 () Bool)

(declare-fun res!201686 () Bool)

(assert (=> b!362396 (=> (not res!201686) (not e!221954))))

(assert (=> b!362396 (= res!201686 (not (validKeyInArray!0 (select (arr!9706 a!4337) i!1478))))))

(declare-fun res!201688 () Bool)

(assert (=> start!36132 (=> (not res!201688) (not e!221954))))

(assert (=> start!36132 (= res!201688 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10058 a!4337))))))

(assert (=> start!36132 e!221954))

(assert (=> start!36132 true))

(declare-fun array_inv!7148 (array!20448) Bool)

(assert (=> start!36132 (array_inv!7148 a!4337)))

(assert (= (and start!36132 res!201688) b!362396))

(assert (= (and b!362396 res!201686) b!362397))

(assert (= (and b!362397 res!201687) b!362398))

(assert (= (and b!362398 res!201685) b!362399))

(declare-fun m!358925 () Bool)

(assert (=> b!362399 m!358925))

(declare-fun m!358927 () Bool)

(assert (=> b!362399 m!358927))

(declare-fun m!358929 () Bool)

(assert (=> b!362399 m!358929))

(declare-fun m!358931 () Bool)

(assert (=> b!362397 m!358931))

(declare-fun m!358933 () Bool)

(assert (=> b!362396 m!358933))

(assert (=> b!362396 m!358933))

(declare-fun m!358935 () Bool)

(assert (=> b!362396 m!358935))

(declare-fun m!358937 () Bool)

(assert (=> start!36132 m!358937))

(push 1)

(assert (not start!36132))

(assert (not b!362399))

(assert (not b!362397))

(assert (not b!362396))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

