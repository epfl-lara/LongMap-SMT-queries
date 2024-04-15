; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102676 () Bool)

(assert start!102676)

(declare-fun res!822368 () Bool)

(declare-fun e!699983 () Bool)

(assert (=> start!102676 (=> (not res!822368) (not e!699983))))

(declare-datatypes ((array!79489 0))(
  ( (array!79490 (arr!38354 (Array (_ BitVec 32) (_ BitVec 64))) (size!38892 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79489)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> start!102676 (= res!822368 (and (bvslt (size!38892 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38892 a!3835))))))

(assert (=> start!102676 e!699983))

(declare-fun array_inv!29337 (array!79489) Bool)

(assert (=> start!102676 (array_inv!29337 a!3835)))

(assert (=> start!102676 true))

(declare-fun b!1234150 () Bool)

(declare-fun res!822366 () Bool)

(assert (=> b!1234150 (=> (not res!822366) (not e!699983))))

(declare-datatypes ((List!27228 0))(
  ( (Nil!27225) (Cons!27224 (h!28433 (_ BitVec 64)) (t!40682 List!27228)) )
))
(declare-fun acc!846 () List!27228)

(declare-fun noDuplicate!1843 (List!27228) Bool)

(assert (=> b!1234150 (= res!822366 (noDuplicate!1843 acc!846))))

(declare-fun b!1234151 () Bool)

(declare-fun res!822367 () Bool)

(assert (=> b!1234151 (=> (not res!822367) (not e!699983))))

(declare-fun contains!7200 (List!27228 (_ BitVec 64)) Bool)

(assert (=> b!1234151 (= res!822367 (not (contains!7200 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1234152 () Bool)

(assert (=> b!1234152 (= e!699983 false)))

(declare-fun lt!559634 () Bool)

(assert (=> b!1234152 (= lt!559634 (contains!7200 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!102676 res!822368) b!1234150))

(assert (= (and b!1234150 res!822366) b!1234151))

(assert (= (and b!1234151 res!822367) b!1234152))

(declare-fun m!1137729 () Bool)

(assert (=> start!102676 m!1137729))

(declare-fun m!1137731 () Bool)

(assert (=> b!1234150 m!1137731))

(declare-fun m!1137733 () Bool)

(assert (=> b!1234151 m!1137733))

(declare-fun m!1137735 () Bool)

(assert (=> b!1234152 m!1137735))

(check-sat (not b!1234152) (not b!1234151) (not start!102676) (not b!1234150))
(check-sat)
