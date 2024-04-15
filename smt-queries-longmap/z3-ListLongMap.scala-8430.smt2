; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102664 () Bool)

(assert start!102664)

(declare-fun res!822308 () Bool)

(declare-fun e!699947 () Bool)

(assert (=> start!102664 (=> (not res!822308) (not e!699947))))

(declare-datatypes ((array!79477 0))(
  ( (array!79478 (arr!38348 (Array (_ BitVec 32) (_ BitVec 64))) (size!38886 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79477)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> start!102664 (= res!822308 (and (bvslt (size!38886 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38886 a!3835))))))

(assert (=> start!102664 e!699947))

(declare-fun array_inv!29331 (array!79477) Bool)

(assert (=> start!102664 (array_inv!29331 a!3835)))

(assert (=> start!102664 true))

(declare-fun b!1234090 () Bool)

(declare-fun res!822306 () Bool)

(assert (=> b!1234090 (=> (not res!822306) (not e!699947))))

(declare-datatypes ((List!27222 0))(
  ( (Nil!27219) (Cons!27218 (h!28427 (_ BitVec 64)) (t!40676 List!27222)) )
))
(declare-fun acc!846 () List!27222)

(declare-fun contains!7194 (List!27222 (_ BitVec 64)) Bool)

(assert (=> b!1234090 (= res!822306 (not (contains!7194 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1234092 () Bool)

(assert (=> b!1234092 (= e!699947 (bvsgt from!3213 (size!38886 a!3835)))))

(declare-fun b!1234089 () Bool)

(declare-fun res!822307 () Bool)

(assert (=> b!1234089 (=> (not res!822307) (not e!699947))))

(declare-fun noDuplicate!1837 (List!27222) Bool)

(assert (=> b!1234089 (= res!822307 (noDuplicate!1837 acc!846))))

(declare-fun b!1234091 () Bool)

(declare-fun res!822305 () Bool)

(assert (=> b!1234091 (=> (not res!822305) (not e!699947))))

(assert (=> b!1234091 (= res!822305 (not (contains!7194 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!102664 res!822308) b!1234089))

(assert (= (and b!1234089 res!822307) b!1234090))

(assert (= (and b!1234090 res!822306) b!1234091))

(assert (= (and b!1234091 res!822305) b!1234092))

(declare-fun m!1137681 () Bool)

(assert (=> start!102664 m!1137681))

(declare-fun m!1137683 () Bool)

(assert (=> b!1234090 m!1137683))

(declare-fun m!1137685 () Bool)

(assert (=> b!1234089 m!1137685))

(declare-fun m!1137687 () Bool)

(assert (=> b!1234091 m!1137687))

(check-sat (not b!1234090) (not b!1234091) (not start!102664) (not b!1234089))
(check-sat)
