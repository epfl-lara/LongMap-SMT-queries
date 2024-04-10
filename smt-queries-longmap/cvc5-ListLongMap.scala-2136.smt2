; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36108 () Bool)

(assert start!36108)

(declare-fun b!362254 () Bool)

(declare-fun res!201543 () Bool)

(declare-fun e!221882 () Bool)

(assert (=> b!362254 (=> (not res!201543) (not e!221882))))

(declare-datatypes ((array!20424 0))(
  ( (array!20425 (arr!9694 (Array (_ BitVec 32) (_ BitVec 64))) (size!10046 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20424)

(declare-fun i!1478 () (_ BitVec 32))

(assert (=> b!362254 (= res!201543 (and (bvslt (size!10046 a!4337) #b01111111111111111111111111111111) (bvsle i!1478 (size!10046 a!4337))))))

(declare-fun b!362253 () Bool)

(declare-fun res!201541 () Bool)

(assert (=> b!362253 (=> (not res!201541) (not e!221882))))

(declare-fun k!2980 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362253 (= res!201541 (validKeyInArray!0 k!2980))))

(declare-fun res!201544 () Bool)

(assert (=> start!36108 (=> (not res!201544) (not e!221882))))

(assert (=> start!36108 (= res!201544 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10046 a!4337))))))

(assert (=> start!36108 e!221882))

(assert (=> start!36108 true))

(declare-fun array_inv!7136 (array!20424) Bool)

(assert (=> start!36108 (array_inv!7136 a!4337)))

(declare-fun b!362252 () Bool)

(declare-fun res!201542 () Bool)

(assert (=> b!362252 (=> (not res!201542) (not e!221882))))

(assert (=> b!362252 (= res!201542 (not (validKeyInArray!0 (select (arr!9694 a!4337) i!1478))))))

(declare-fun b!362255 () Bool)

(assert (=> b!362255 (= e!221882 false)))

(declare-fun lt!166636 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20424 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362255 (= lt!166636 (arrayCountValidKeys!0 (array!20425 (store (arr!9694 a!4337) i!1478 k!2980) (size!10046 a!4337)) i!1478 (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!166637 () (_ BitVec 32))

(assert (=> b!362255 (= lt!166637 (arrayCountValidKeys!0 a!4337 i!1478 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (= (and start!36108 res!201544) b!362252))

(assert (= (and b!362252 res!201542) b!362253))

(assert (= (and b!362253 res!201541) b!362254))

(assert (= (and b!362254 res!201543) b!362255))

(declare-fun m!358757 () Bool)

(assert (=> b!362253 m!358757))

(declare-fun m!358759 () Bool)

(assert (=> start!36108 m!358759))

(declare-fun m!358761 () Bool)

(assert (=> b!362252 m!358761))

(assert (=> b!362252 m!358761))

(declare-fun m!358763 () Bool)

(assert (=> b!362252 m!358763))

(declare-fun m!358765 () Bool)

(assert (=> b!362255 m!358765))

(declare-fun m!358767 () Bool)

(assert (=> b!362255 m!358767))

(declare-fun m!358769 () Bool)

(assert (=> b!362255 m!358769))

(push 1)

(assert (not b!362253))

(assert (not b!362252))

(assert (not start!36108))

(assert (not b!362255))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

