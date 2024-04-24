; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102910 () Bool)

(assert start!102910)

(declare-fun res!822905 () Bool)

(declare-fun e!700861 () Bool)

(assert (=> start!102910 (=> (not res!822905) (not e!700861))))

(declare-datatypes ((array!79598 0))(
  ( (array!79599 (arr!38402 (Array (_ BitVec 32) (_ BitVec 64))) (size!38939 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79598)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> start!102910 (= res!822905 (and (bvslt (size!38939 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38939 a!3835))))))

(assert (=> start!102910 e!700861))

(declare-fun array_inv!29340 (array!79598) Bool)

(assert (=> start!102910 (array_inv!29340 a!3835)))

(assert (=> start!102910 true))

(declare-fun b!1235515 () Bool)

(declare-fun res!822906 () Bool)

(assert (=> b!1235515 (=> (not res!822906) (not e!700861))))

(declare-datatypes ((List!27188 0))(
  ( (Nil!27185) (Cons!27184 (h!28402 (_ BitVec 64)) (t!40643 List!27188)) )
))
(declare-fun acc!846 () List!27188)

(declare-fun noDuplicate!1840 (List!27188) Bool)

(assert (=> b!1235515 (= res!822906 (noDuplicate!1840 acc!846))))

(declare-fun b!1235516 () Bool)

(declare-fun res!822904 () Bool)

(assert (=> b!1235516 (=> (not res!822904) (not e!700861))))

(declare-fun contains!7259 (List!27188 (_ BitVec 64)) Bool)

(assert (=> b!1235516 (= res!822904 (not (contains!7259 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235517 () Bool)

(assert (=> b!1235517 (= e!700861 false)))

(declare-fun lt!560285 () Bool)

(assert (=> b!1235517 (= lt!560285 (contains!7259 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!102910 res!822905) b!1235515))

(assert (= (and b!1235515 res!822906) b!1235516))

(assert (= (and b!1235516 res!822904) b!1235517))

(declare-fun m!1139849 () Bool)

(assert (=> start!102910 m!1139849))

(declare-fun m!1139851 () Bool)

(assert (=> b!1235515 m!1139851))

(declare-fun m!1139853 () Bool)

(assert (=> b!1235516 m!1139853))

(declare-fun m!1139855 () Bool)

(assert (=> b!1235517 m!1139855))

(check-sat (not b!1235515) (not b!1235516) (not start!102910) (not b!1235517))
(check-sat)
