; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136746 () Bool)

(assert start!136746)

(declare-fun res!1078470 () Bool)

(declare-fun e!880457 () Bool)

(assert (=> start!136746 (=> (not res!1078470) (not e!880457))))

(declare-fun mask!907 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136746 (= res!1078470 (validMask!0 mask!907))))

(assert (=> start!136746 e!880457))

(assert (=> start!136746 true))

(declare-fun x!457 () (_ BitVec 32))

(declare-fun ee!11 () (_ BitVec 32))

(declare-fun b!1578531 () Bool)

(assert (=> b!1578531 (= e!880457 (and (bvsge mask!907 #b00000000000000000000000000000000) (bvsge ee!11 #b00000000000000000000000000000000) (bvslt ee!11 (bvadd #b00000000000000000000000000000001 mask!907)) (bvsle x!457 #b01111111111111111111111111111110) (bvsge x!457 #b00000000000000000000000000000000) (let ((bdg!57051 (bvand (bvsub (bvadd ee!11 (bvmul #b00000000000000000000000000000010 x!457 (bvadd #b00000000000000000000000000000001 x!457))) #b00000000000000000000000000000011) mask!907))) (or (bvslt bdg!57051 #b00000000000000000000000000000000) (bvsge bdg!57051 (bvadd #b00000000000000000000000000000001 mask!907))))))))

(assert (= (and start!136746 res!1078470) b!1578531))

(declare-fun m!1450619 () Bool)

(assert (=> start!136746 m!1450619))

(push 1)

(assert (not start!136746))

(check-sat)

(pop 1)

(push 1)

(check-sat)

