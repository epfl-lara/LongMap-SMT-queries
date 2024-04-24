; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102920 () Bool)

(assert start!102920)

(declare-fun res!822949 () Bool)

(declare-fun e!700892 () Bool)

(assert (=> start!102920 (=> (not res!822949) (not e!700892))))

(declare-datatypes ((array!79608 0))(
  ( (array!79609 (arr!38407 (Array (_ BitVec 32) (_ BitVec 64))) (size!38944 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79608)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> start!102920 (= res!822949 (and (bvslt (size!38944 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38944 a!3835))))))

(assert (=> start!102920 e!700892))

(declare-fun array_inv!29345 (array!79608) Bool)

(assert (=> start!102920 (array_inv!29345 a!3835)))

(assert (=> start!102920 true))

(declare-fun b!1235560 () Bool)

(declare-fun res!822951 () Bool)

(assert (=> b!1235560 (=> (not res!822951) (not e!700892))))

(declare-datatypes ((List!27193 0))(
  ( (Nil!27190) (Cons!27189 (h!28407 (_ BitVec 64)) (t!40648 List!27193)) )
))
(declare-fun acc!846 () List!27193)

(declare-fun noDuplicate!1845 (List!27193) Bool)

(assert (=> b!1235560 (= res!822951 (noDuplicate!1845 acc!846))))

(declare-fun b!1235561 () Bool)

(declare-fun res!822950 () Bool)

(assert (=> b!1235561 (=> (not res!822950) (not e!700892))))

(declare-fun contains!7264 (List!27193 (_ BitVec 64)) Bool)

(assert (=> b!1235561 (= res!822950 (not (contains!7264 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235562 () Bool)

(assert (=> b!1235562 (= e!700892 false)))

(declare-fun lt!560300 () Bool)

(assert (=> b!1235562 (= lt!560300 (contains!7264 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!102920 res!822949) b!1235560))

(assert (= (and b!1235560 res!822951) b!1235561))

(assert (= (and b!1235561 res!822950) b!1235562))

(declare-fun m!1139889 () Bool)

(assert (=> start!102920 m!1139889))

(declare-fun m!1139891 () Bool)

(assert (=> b!1235560 m!1139891))

(declare-fun m!1139893 () Bool)

(assert (=> b!1235561 m!1139893))

(declare-fun m!1139895 () Bool)

(assert (=> b!1235562 m!1139895))

(push 1)

(assert (not b!1235560))

(assert (not b!1235561))

(assert (not start!102920))

(assert (not b!1235562))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

