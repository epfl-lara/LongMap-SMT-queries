; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101830 () Bool)

(assert start!101830)

(declare-fun b!1226430 () Bool)

(declare-fun res!815130 () Bool)

(declare-fun e!696509 () Bool)

(assert (=> b!1226430 (=> (not res!815130) (not e!696509))))

(declare-fun k0!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1226430 (= res!815130 (validKeyInArray!0 k0!2913))))

(declare-fun res!815128 () Bool)

(assert (=> start!101830 (=> (not res!815128) (not e!696509))))

(declare-datatypes ((array!79096 0))(
  ( (array!79097 (arr!38174 (Array (_ BitVec 32) (_ BitVec 64))) (size!38712 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79096)

(assert (=> start!101830 (= res!815128 (bvslt (size!38712 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!101830 e!696509))

(declare-fun array_inv!29157 (array!79096) Bool)

(assert (=> start!101830 (array_inv!29157 a!3806)))

(assert (=> start!101830 true))

(declare-fun b!1226431 () Bool)

(declare-fun res!815131 () Bool)

(assert (=> b!1226431 (=> (not res!815131) (not e!696509))))

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!79096 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1226431 (= res!815131 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1226432 () Bool)

(declare-fun res!815129 () Bool)

(assert (=> b!1226432 (=> (not res!815129) (not e!696509))))

(assert (=> b!1226432 (= res!815129 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38712 a!3806)) (bvslt from!3184 (size!38712 a!3806))))))

(declare-fun b!1226433 () Bool)

(declare-fun res!815126 () Bool)

(assert (=> b!1226433 (=> (not res!815126) (not e!696509))))

(declare-datatypes ((List!27048 0))(
  ( (Nil!27045) (Cons!27044 (h!28253 (_ BitVec 64)) (t!40502 List!27048)) )
))
(declare-fun acc!823 () List!27048)

(declare-fun contains!7020 (List!27048 (_ BitVec 64)) Bool)

(assert (=> b!1226433 (= res!815126 (not (contains!7020 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1226434 () Bool)

(declare-fun res!815132 () Bool)

(assert (=> b!1226434 (=> (not res!815132) (not e!696509))))

(assert (=> b!1226434 (= res!815132 (not (contains!7020 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1226435 () Bool)

(assert (=> b!1226435 (= e!696509 (bvsgt from!3184 (size!38712 a!3806)))))

(declare-fun b!1226436 () Bool)

(declare-fun res!815127 () Bool)

(assert (=> b!1226436 (=> (not res!815127) (not e!696509))))

(declare-fun noDuplicate!1663 (List!27048) Bool)

(assert (=> b!1226436 (= res!815127 (noDuplicate!1663 acc!823))))

(assert (= (and start!101830 res!815128) b!1226430))

(assert (= (and b!1226430 res!815130) b!1226432))

(assert (= (and b!1226432 res!815129) b!1226436))

(assert (= (and b!1226436 res!815127) b!1226433))

(assert (= (and b!1226433 res!815126) b!1226434))

(assert (= (and b!1226434 res!815132) b!1226431))

(assert (= (and b!1226431 res!815131) b!1226435))

(declare-fun m!1131039 () Bool)

(assert (=> b!1226434 m!1131039))

(declare-fun m!1131041 () Bool)

(assert (=> b!1226433 m!1131041))

(declare-fun m!1131043 () Bool)

(assert (=> start!101830 m!1131043))

(declare-fun m!1131045 () Bool)

(assert (=> b!1226436 m!1131045))

(declare-fun m!1131047 () Bool)

(assert (=> b!1226431 m!1131047))

(declare-fun m!1131049 () Bool)

(assert (=> b!1226430 m!1131049))

(check-sat (not b!1226431) (not b!1226434) (not b!1226436) (not b!1226430) (not b!1226433) (not start!101830))
(check-sat)
