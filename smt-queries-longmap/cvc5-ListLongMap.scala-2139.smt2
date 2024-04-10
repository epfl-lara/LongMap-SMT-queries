; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36126 () Bool)

(assert start!36126)

(declare-fun b!362362 () Bool)

(declare-fun res!201649 () Bool)

(declare-fun e!221937 () Bool)

(assert (=> b!362362 (=> (not res!201649) (not e!221937))))

(declare-datatypes ((array!20442 0))(
  ( (array!20443 (arr!9703 (Array (_ BitVec 32) (_ BitVec 64))) (size!10055 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20442)

(declare-fun i!1478 () (_ BitVec 32))

(assert (=> b!362362 (= res!201649 (and (bvslt (size!10055 a!4337) #b01111111111111111111111111111111) (bvsle i!1478 (size!10055 a!4337))))))

(declare-fun b!362360 () Bool)

(declare-fun res!201650 () Bool)

(assert (=> b!362360 (=> (not res!201650) (not e!221937))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362360 (= res!201650 (not (validKeyInArray!0 (select (arr!9703 a!4337) i!1478))))))

(declare-fun res!201651 () Bool)

(assert (=> start!36126 (=> (not res!201651) (not e!221937))))

(assert (=> start!36126 (= res!201651 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10055 a!4337))))))

(assert (=> start!36126 e!221937))

(assert (=> start!36126 true))

(declare-fun array_inv!7145 (array!20442) Bool)

(assert (=> start!36126 (array_inv!7145 a!4337)))

(declare-fun b!362361 () Bool)

(declare-fun res!201652 () Bool)

(assert (=> b!362361 (=> (not res!201652) (not e!221937))))

(declare-fun k!2980 () (_ BitVec 64))

(assert (=> b!362361 (= res!201652 (validKeyInArray!0 k!2980))))

(declare-fun b!362363 () Bool)

(assert (=> b!362363 (= e!221937 false)))

(declare-fun lt!166691 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20442 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362363 (= lt!166691 (arrayCountValidKeys!0 (array!20443 (store (arr!9703 a!4337) i!1478 k!2980) (size!10055 a!4337)) i!1478 (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!166690 () (_ BitVec 32))

(assert (=> b!362363 (= lt!166690 (arrayCountValidKeys!0 a!4337 i!1478 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (= (and start!36126 res!201651) b!362360))

(assert (= (and b!362360 res!201650) b!362361))

(assert (= (and b!362361 res!201652) b!362362))

(assert (= (and b!362362 res!201649) b!362363))

(declare-fun m!358883 () Bool)

(assert (=> b!362360 m!358883))

(assert (=> b!362360 m!358883))

(declare-fun m!358885 () Bool)

(assert (=> b!362360 m!358885))

(declare-fun m!358887 () Bool)

(assert (=> start!36126 m!358887))

(declare-fun m!358889 () Bool)

(assert (=> b!362361 m!358889))

(declare-fun m!358891 () Bool)

(assert (=> b!362363 m!358891))

(declare-fun m!358893 () Bool)

(assert (=> b!362363 m!358893))

(declare-fun m!358895 () Bool)

(assert (=> b!362363 m!358895))

(push 1)

(assert (not b!362361))

(assert (not b!362360))

(assert (not start!36126))

(assert (not b!362363))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

