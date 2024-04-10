; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101844 () Bool)

(assert start!101844)

(declare-fun b!1226613 () Bool)

(declare-fun e!696602 () Bool)

(assert (=> b!1226613 (= e!696602 false)))

(declare-fun lt!558834 () Bool)

(declare-datatypes ((List!26990 0))(
  ( (Nil!26987) (Cons!26986 (h!28195 (_ BitVec 64)) (t!40453 List!26990)) )
))
(declare-fun acc!823 () List!26990)

(declare-fun contains!7052 (List!26990 (_ BitVec 64)) Bool)

(assert (=> b!1226613 (= lt!558834 (contains!7052 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1226614 () Bool)

(declare-fun res!815262 () Bool)

(assert (=> b!1226614 (=> (not res!815262) (not e!696602))))

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((array!79183 0))(
  ( (array!79184 (arr!38217 (Array (_ BitVec 32) (_ BitVec 64))) (size!38753 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79183)

(assert (=> b!1226614 (= res!815262 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38753 a!3806)) (bvslt from!3184 (size!38753 a!3806))))))

(declare-fun res!815264 () Bool)

(assert (=> start!101844 (=> (not res!815264) (not e!696602))))

(assert (=> start!101844 (= res!815264 (bvslt (size!38753 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!101844 e!696602))

(declare-fun array_inv!29065 (array!79183) Bool)

(assert (=> start!101844 (array_inv!29065 a!3806)))

(assert (=> start!101844 true))

(declare-fun b!1226615 () Bool)

(declare-fun res!815261 () Bool)

(assert (=> b!1226615 (=> (not res!815261) (not e!696602))))

(declare-fun noDuplicate!1649 (List!26990) Bool)

(assert (=> b!1226615 (= res!815261 (noDuplicate!1649 acc!823))))

(declare-fun b!1226616 () Bool)

(declare-fun res!815263 () Bool)

(assert (=> b!1226616 (=> (not res!815263) (not e!696602))))

(assert (=> b!1226616 (= res!815263 (not (contains!7052 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1226617 () Bool)

(declare-fun res!815265 () Bool)

(assert (=> b!1226617 (=> (not res!815265) (not e!696602))))

(declare-fun k0!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1226617 (= res!815265 (validKeyInArray!0 k0!2913))))

(assert (= (and start!101844 res!815264) b!1226617))

(assert (= (and b!1226617 res!815265) b!1226614))

(assert (= (and b!1226614 res!815262) b!1226615))

(assert (= (and b!1226615 res!815261) b!1226616))

(assert (= (and b!1226616 res!815263) b!1226613))

(declare-fun m!1131649 () Bool)

(assert (=> b!1226617 m!1131649))

(declare-fun m!1131651 () Bool)

(assert (=> b!1226616 m!1131651))

(declare-fun m!1131653 () Bool)

(assert (=> b!1226613 m!1131653))

(declare-fun m!1131655 () Bool)

(assert (=> b!1226615 m!1131655))

(declare-fun m!1131657 () Bool)

(assert (=> start!101844 m!1131657))

(check-sat (not b!1226617) (not b!1226613) (not start!101844) (not b!1226616) (not b!1226615))
