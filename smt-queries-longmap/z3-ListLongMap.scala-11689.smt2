; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136744 () Bool)

(assert start!136744)

(declare-fun res!1078467 () Bool)

(declare-fun e!880454 () Bool)

(assert (=> start!136744 (=> (not res!1078467) (not e!880454))))

(declare-fun mask!907 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136744 (= res!1078467 (validMask!0 mask!907))))

(assert (=> start!136744 e!880454))

(assert (=> start!136744 true))

(declare-fun x!457 () (_ BitVec 32))

(declare-fun ee!11 () (_ BitVec 32))

(declare-fun b!1578528 () Bool)

(assert (=> b!1578528 (= e!880454 (and (bvsge mask!907 #b00000000000000000000000000000000) (bvsge ee!11 #b00000000000000000000000000000000) (bvslt ee!11 (bvadd #b00000000000000000000000000000001 mask!907)) (bvsle x!457 #b01111111111111111111111111111110) (bvsge x!457 #b00000000000000000000000000000000) (let ((bdg!57051 (bvand (bvsub (bvadd ee!11 (bvmul #b00000000000000000000000000000010 x!457 (bvadd #b00000000000000000000000000000001 x!457))) #b00000000000000000000000000000011) mask!907))) (or (bvslt bdg!57051 #b00000000000000000000000000000000) (bvsge bdg!57051 (bvadd #b00000000000000000000000000000001 mask!907))))))))

(assert (= (and start!136744 res!1078467) b!1578528))

(declare-fun m!1450617 () Bool)

(assert (=> start!136744 m!1450617))

(check-sat (not start!136744))
(check-sat)
