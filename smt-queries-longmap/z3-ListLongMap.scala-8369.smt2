; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102054 () Bool)

(assert start!102054)

(declare-fun b!1227680 () Bool)

(declare-fun res!815549 () Bool)

(declare-fun e!697354 () Bool)

(assert (=> b!1227680 (=> (not res!815549) (not e!697354))))

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((array!79193 0))(
  ( (array!79194 (arr!38216 (Array (_ BitVec 32) (_ BitVec 64))) (size!38753 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79193)

(assert (=> b!1227680 (= res!815549 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38753 a!3806)) (bvslt from!3184 (size!38753 a!3806))))))

(declare-fun b!1227681 () Bool)

(declare-fun res!815548 () Bool)

(assert (=> b!1227681 (=> (not res!815548) (not e!697354))))

(declare-datatypes ((List!27002 0))(
  ( (Nil!26999) (Cons!26998 (h!28216 (_ BitVec 64)) (t!40457 List!27002)) )
))
(declare-fun acc!823 () List!27002)

(declare-fun contains!7073 (List!27002 (_ BitVec 64)) Bool)

(assert (=> b!1227681 (= res!815548 (not (contains!7073 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1227682 () Bool)

(assert (=> b!1227682 (= e!697354 (bvslt (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000))))

(declare-fun b!1227683 () Bool)

(declare-fun res!815550 () Bool)

(assert (=> b!1227683 (=> (not res!815550) (not e!697354))))

(declare-fun k0!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1227683 (= res!815550 (validKeyInArray!0 k0!2913))))

(declare-fun res!815552 () Bool)

(assert (=> start!102054 (=> (not res!815552) (not e!697354))))

(assert (=> start!102054 (= res!815552 (bvslt (size!38753 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102054 e!697354))

(declare-fun array_inv!29154 (array!79193) Bool)

(assert (=> start!102054 (array_inv!29154 a!3806)))

(assert (=> start!102054 true))

(declare-fun b!1227684 () Bool)

(declare-fun res!815551 () Bool)

(assert (=> b!1227684 (=> (not res!815551) (not e!697354))))

(assert (=> b!1227684 (= res!815551 (not (contains!7073 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1227685 () Bool)

(declare-fun res!815547 () Bool)

(assert (=> b!1227685 (=> (not res!815547) (not e!697354))))

(declare-fun noDuplicate!1654 (List!27002) Bool)

(assert (=> b!1227685 (= res!815547 (noDuplicate!1654 acc!823))))

(assert (= (and start!102054 res!815552) b!1227683))

(assert (= (and b!1227683 res!815550) b!1227680))

(assert (= (and b!1227680 res!815549) b!1227685))

(assert (= (and b!1227685 res!815547) b!1227681))

(assert (= (and b!1227681 res!815548) b!1227684))

(assert (= (and b!1227684 res!815551) b!1227682))

(declare-fun m!1133103 () Bool)

(assert (=> b!1227685 m!1133103))

(declare-fun m!1133105 () Bool)

(assert (=> b!1227684 m!1133105))

(declare-fun m!1133107 () Bool)

(assert (=> b!1227683 m!1133107))

(declare-fun m!1133109 () Bool)

(assert (=> start!102054 m!1133109))

(declare-fun m!1133111 () Bool)

(assert (=> b!1227681 m!1133111))

(check-sat (not b!1227683) (not b!1227685) (not b!1227684) (not start!102054) (not b!1227681))
(check-sat)
