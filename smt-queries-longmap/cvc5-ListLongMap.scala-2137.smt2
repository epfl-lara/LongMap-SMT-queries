; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36104 () Bool)

(assert start!36104)

(declare-fun b!362042 () Bool)

(declare-fun res!201472 () Bool)

(declare-fun e!221739 () Bool)

(assert (=> b!362042 (=> (not res!201472) (not e!221739))))

(declare-fun k!2980 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362042 (= res!201472 (validKeyInArray!0 k!2980))))

(declare-fun b!362041 () Bool)

(declare-fun res!201475 () Bool)

(assert (=> b!362041 (=> (not res!201475) (not e!221739))))

(declare-datatypes ((array!20416 0))(
  ( (array!20417 (arr!9690 (Array (_ BitVec 32) (_ BitVec 64))) (size!10043 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20416)

(declare-fun i!1478 () (_ BitVec 32))

(assert (=> b!362041 (= res!201475 (not (validKeyInArray!0 (select (arr!9690 a!4337) i!1478))))))

(declare-fun b!362043 () Bool)

(declare-fun res!201474 () Bool)

(assert (=> b!362043 (=> (not res!201474) (not e!221739))))

(assert (=> b!362043 (= res!201474 (and (bvslt (size!10043 a!4337) #b01111111111111111111111111111111) (bvsle i!1478 (size!10043 a!4337))))))

(declare-fun res!201473 () Bool)

(assert (=> start!36104 (=> (not res!201473) (not e!221739))))

(assert (=> start!36104 (= res!201473 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10043 a!4337))))))

(assert (=> start!36104 e!221739))

(assert (=> start!36104 true))

(declare-fun array_inv!7139 (array!20416) Bool)

(assert (=> start!36104 (array_inv!7139 a!4337)))

(declare-fun b!362044 () Bool)

(assert (=> b!362044 (= e!221739 false)))

(declare-fun lt!166432 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20416 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362044 (= lt!166432 (arrayCountValidKeys!0 (array!20417 (store (arr!9690 a!4337) i!1478 k!2980) (size!10043 a!4337)) i!1478 (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!166433 () (_ BitVec 32))

(assert (=> b!362044 (= lt!166433 (arrayCountValidKeys!0 a!4337 i!1478 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (= (and start!36104 res!201473) b!362041))

(assert (= (and b!362041 res!201475) b!362042))

(assert (= (and b!362042 res!201472) b!362043))

(assert (= (and b!362043 res!201474) b!362044))

(declare-fun m!358103 () Bool)

(assert (=> b!362042 m!358103))

(declare-fun m!358105 () Bool)

(assert (=> b!362041 m!358105))

(assert (=> b!362041 m!358105))

(declare-fun m!358107 () Bool)

(assert (=> b!362041 m!358107))

(declare-fun m!358109 () Bool)

(assert (=> start!36104 m!358109))

(declare-fun m!358111 () Bool)

(assert (=> b!362044 m!358111))

(declare-fun m!358113 () Bool)

(assert (=> b!362044 m!358113))

(declare-fun m!358115 () Bool)

(assert (=> b!362044 m!358115))

(push 1)

(assert (not b!362042))

(assert (not b!362044))

(assert (not start!36104))

(assert (not b!362041))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

