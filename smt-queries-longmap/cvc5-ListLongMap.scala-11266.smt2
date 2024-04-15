; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131392 () Bool)

(assert start!131392)

(declare-fun b!1540494 () Bool)

(declare-fun res!1057223 () Bool)

(declare-fun e!856746 () Bool)

(assert (=> b!1540494 (=> (not res!1057223) (not e!856746))))

(declare-fun newFrom!293 () (_ BitVec 32))

(declare-datatypes ((array!102293 0))(
  ( (array!102294 (arr!49356 (Array (_ BitVec 32) (_ BitVec 64))) (size!49908 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102293)

(declare-fun from!3298 () (_ BitVec 32))

(assert (=> b!1540494 (= res!1057223 (and (bvslt from!3298 newFrom!293) (bvsge (bvadd #b00000000000000000000000000000001 from!3298) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3298) (size!49908 a!3920))))))

(declare-fun b!1540492 () Bool)

(declare-fun res!1057222 () Bool)

(assert (=> b!1540492 (=> (not res!1057222) (not e!856746))))

(declare-fun mask!4052 () (_ BitVec 32))

(assert (=> b!1540492 (= res!1057222 (and (= (size!49908 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49908 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49908 a!3920))))))

(declare-fun b!1540495 () Bool)

(assert (=> b!1540495 (= e!856746 false)))

(declare-fun lt!665229 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102293 (_ BitVec 32)) Bool)

(assert (=> b!1540495 (= lt!665229 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 from!3298) a!3920 mask!4052))))

(declare-fun res!1057225 () Bool)

(assert (=> start!131392 (=> (not res!1057225) (not e!856746))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131392 (= res!1057225 (validMask!0 mask!4052))))

(assert (=> start!131392 e!856746))

(assert (=> start!131392 true))

(declare-fun array_inv!38589 (array!102293) Bool)

(assert (=> start!131392 (array_inv!38589 a!3920)))

(declare-fun b!1540493 () Bool)

(declare-fun res!1057224 () Bool)

(assert (=> b!1540493 (=> (not res!1057224) (not e!856746))))

(assert (=> b!1540493 (= res!1057224 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(assert (= (and start!131392 res!1057225) b!1540492))

(assert (= (and b!1540492 res!1057222) b!1540493))

(assert (= (and b!1540493 res!1057224) b!1540494))

(assert (= (and b!1540494 res!1057223) b!1540495))

(declare-fun m!1422015 () Bool)

(assert (=> b!1540495 m!1422015))

(declare-fun m!1422017 () Bool)

(assert (=> start!131392 m!1422017))

(declare-fun m!1422019 () Bool)

(assert (=> start!131392 m!1422019))

(declare-fun m!1422021 () Bool)

(assert (=> b!1540493 m!1422021))

(push 1)

(assert (not b!1540495))

(assert (not start!131392))

(assert (not b!1540493))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

