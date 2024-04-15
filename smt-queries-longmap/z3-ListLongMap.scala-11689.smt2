; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136708 () Bool)

(assert start!136708)

(declare-fun res!1078335 () Bool)

(declare-fun e!880253 () Bool)

(assert (=> start!136708 (=> (not res!1078335) (not e!880253))))

(declare-fun mask!907 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136708 (= res!1078335 (validMask!0 mask!907))))

(assert (=> start!136708 e!880253))

(assert (=> start!136708 true))

(declare-fun x!457 () (_ BitVec 32))

(declare-fun ee!11 () (_ BitVec 32))

(declare-fun b!1578212 () Bool)

(assert (=> b!1578212 (= e!880253 (and (bvsge mask!907 #b00000000000000000000000000000000) (bvsge ee!11 #b00000000000000000000000000000000) (bvslt ee!11 (bvadd #b00000000000000000000000000000001 mask!907)) (bvsle x!457 #b01111111111111111111111111111110) (bvsge x!457 #b00000000000000000000000000000000) (let ((bdg!57051 (bvand (bvsub (bvadd ee!11 (bvmul #b00000000000000000000000000000010 x!457 (bvadd #b00000000000000000000000000000001 x!457))) #b00000000000000000000000000000011) mask!907))) (or (bvslt bdg!57051 #b00000000000000000000000000000000) (bvsge bdg!57051 (bvadd #b00000000000000000000000000000001 mask!907))))))))

(assert (= (and start!136708 res!1078335) b!1578212))

(declare-fun m!1449735 () Bool)

(assert (=> start!136708 m!1449735))

(check-sat (not start!136708))
(check-sat)
