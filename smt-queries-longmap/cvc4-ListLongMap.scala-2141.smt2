; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36126 () Bool)

(assert start!36126)

(declare-fun b!362173 () Bool)

(declare-fun res!201605 () Bool)

(declare-fun e!221804 () Bool)

(assert (=> b!362173 (=> (not res!201605) (not e!221804))))

(declare-datatypes ((array!20438 0))(
  ( (array!20439 (arr!9701 (Array (_ BitVec 32) (_ BitVec 64))) (size!10054 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20438)

(declare-fun i!1478 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362173 (= res!201605 (not (validKeyInArray!0 (select (arr!9701 a!4337) i!1478))))))

(declare-fun res!201606 () Bool)

(assert (=> start!36126 (=> (not res!201606) (not e!221804))))

(assert (=> start!36126 (= res!201606 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10054 a!4337))))))

(assert (=> start!36126 e!221804))

(assert (=> start!36126 true))

(declare-fun array_inv!7150 (array!20438) Bool)

(assert (=> start!36126 (array_inv!7150 a!4337)))

(declare-fun b!362174 () Bool)

(declare-fun res!201607 () Bool)

(assert (=> b!362174 (=> (not res!201607) (not e!221804))))

(declare-fun k!2980 () (_ BitVec 64))

(assert (=> b!362174 (= res!201607 (validKeyInArray!0 k!2980))))

(declare-fun b!362176 () Bool)

(assert (=> b!362176 (= e!221804 false)))

(declare-fun lt!166498 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20438 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362176 (= lt!166498 (arrayCountValidKeys!0 (array!20439 (store (arr!9701 a!4337) i!1478 k!2980) (size!10054 a!4337)) i!1478 (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!166499 () (_ BitVec 32))

(assert (=> b!362176 (= lt!166499 (arrayCountValidKeys!0 a!4337 i!1478 (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!362175 () Bool)

(declare-fun res!201604 () Bool)

(assert (=> b!362175 (=> (not res!201604) (not e!221804))))

(assert (=> b!362175 (= res!201604 (and (bvslt (size!10054 a!4337) #b01111111111111111111111111111111) (bvsle i!1478 (size!10054 a!4337))))))

(assert (= (and start!36126 res!201606) b!362173))

(assert (= (and b!362173 res!201605) b!362174))

(assert (= (and b!362174 res!201607) b!362175))

(assert (= (and b!362175 res!201604) b!362176))

(declare-fun m!358257 () Bool)

(assert (=> b!362173 m!358257))

(assert (=> b!362173 m!358257))

(declare-fun m!358259 () Bool)

(assert (=> b!362173 m!358259))

(declare-fun m!358261 () Bool)

(assert (=> start!36126 m!358261))

(declare-fun m!358263 () Bool)

(assert (=> b!362174 m!358263))

(declare-fun m!358265 () Bool)

(assert (=> b!362176 m!358265))

(declare-fun m!358267 () Bool)

(assert (=> b!362176 m!358267))

(declare-fun m!358269 () Bool)

(assert (=> b!362176 m!358269))

(push 1)

(assert (not b!362176))

(assert (not start!36126))

(assert (not b!362173))

(assert (not b!362174))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

