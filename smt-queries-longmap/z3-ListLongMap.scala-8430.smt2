; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102668 () Bool)

(assert start!102668)

(declare-fun b!1234170 () Bool)

(declare-fun res!822349 () Bool)

(declare-fun e!699986 () Bool)

(assert (=> b!1234170 (=> (not res!822349) (not e!699986))))

(declare-datatypes ((List!27161 0))(
  ( (Nil!27158) (Cons!27157 (h!28366 (_ BitVec 64)) (t!40624 List!27161)) )
))
(declare-fun acc!846 () List!27161)

(declare-fun contains!7223 (List!27161 (_ BitVec 64)) Bool)

(assert (=> b!1234170 (= res!822349 (not (contains!7223 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1234169 () Bool)

(declare-fun res!822352 () Bool)

(assert (=> b!1234169 (=> (not res!822352) (not e!699986))))

(declare-fun noDuplicate!1820 (List!27161) Bool)

(assert (=> b!1234169 (= res!822352 (noDuplicate!1820 acc!846))))

(declare-fun res!822351 () Bool)

(assert (=> start!102668 (=> (not res!822351) (not e!699986))))

(declare-datatypes ((array!79558 0))(
  ( (array!79559 (arr!38388 (Array (_ BitVec 32) (_ BitVec 64))) (size!38924 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79558)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> start!102668 (= res!822351 (and (bvslt (size!38924 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38924 a!3835))))))

(assert (=> start!102668 e!699986))

(declare-fun array_inv!29236 (array!79558) Bool)

(assert (=> start!102668 (array_inv!29236 a!3835)))

(assert (=> start!102668 true))

(declare-fun b!1234171 () Bool)

(declare-fun res!822350 () Bool)

(assert (=> b!1234171 (=> (not res!822350) (not e!699986))))

(assert (=> b!1234171 (= res!822350 (not (contains!7223 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1234172 () Bool)

(assert (=> b!1234172 (= e!699986 (bvsgt from!3213 (size!38924 a!3835)))))

(assert (= (and start!102668 res!822351) b!1234169))

(assert (= (and b!1234169 res!822352) b!1234170))

(assert (= (and b!1234170 res!822349) b!1234171))

(assert (= (and b!1234171 res!822350) b!1234172))

(declare-fun m!1138185 () Bool)

(assert (=> b!1234170 m!1138185))

(declare-fun m!1138187 () Bool)

(assert (=> b!1234169 m!1138187))

(declare-fun m!1138189 () Bool)

(assert (=> start!102668 m!1138189))

(declare-fun m!1138191 () Bool)

(assert (=> b!1234171 m!1138191))

(check-sat (not b!1234171) (not b!1234169) (not start!102668) (not b!1234170))
(check-sat)
