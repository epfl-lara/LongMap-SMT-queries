; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136742 () Bool)

(assert start!136742)

(declare-fun res!1078464 () Bool)

(declare-fun e!880451 () Bool)

(assert (=> start!136742 (=> (not res!1078464) (not e!880451))))

(declare-fun mask!907 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136742 (= res!1078464 (validMask!0 mask!907))))

(assert (=> start!136742 e!880451))

(assert (=> start!136742 true))

(declare-fun x!457 () (_ BitVec 32))

(declare-fun ee!11 () (_ BitVec 32))

(declare-fun b!1578525 () Bool)

(assert (=> b!1578525 (= e!880451 (and (bvsge mask!907 #b00000000000000000000000000000000) (bvsge ee!11 #b00000000000000000000000000000000) (bvslt ee!11 (bvadd #b00000000000000000000000000000001 mask!907)) (bvsle x!457 #b01111111111111111111111111111110) (bvsge x!457 #b00000000000000000000000000000000) (let ((bdg!57051 (bvand (bvsub (bvadd ee!11 (bvmul #b00000000000000000000000000000010 x!457 (bvadd #b00000000000000000000000000000001 x!457))) #b00000000000000000000000000000011) mask!907))) (or (bvslt bdg!57051 #b00000000000000000000000000000000) (bvsge bdg!57051 (bvadd #b00000000000000000000000000000001 mask!907))))))))

(assert (= (and start!136742 res!1078464) b!1578525))

(declare-fun m!1450615 () Bool)

(assert (=> start!136742 m!1450615))

(push 1)

(assert (not start!136742))

(check-sat)

(pop 1)

(push 1)

(check-sat)

