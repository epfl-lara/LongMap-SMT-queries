; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102688 () Bool)

(assert start!102688)

(declare-fun res!822444 () Bool)

(declare-fun e!700047 () Bool)

(assert (=> start!102688 (=> (not res!822444) (not e!700047))))

(declare-datatypes ((array!79578 0))(
  ( (array!79579 (arr!38398 (Array (_ BitVec 32) (_ BitVec 64))) (size!38934 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79578)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> start!102688 (= res!822444 (and (bvslt (size!38934 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38934 a!3835))))))

(assert (=> start!102688 e!700047))

(declare-fun array_inv!29246 (array!79578) Bool)

(assert (=> start!102688 (array_inv!29246 a!3835)))

(assert (=> start!102688 true))

(declare-fun b!1234263 () Bool)

(declare-fun res!822443 () Bool)

(assert (=> b!1234263 (=> (not res!822443) (not e!700047))))

(declare-datatypes ((List!27171 0))(
  ( (Nil!27168) (Cons!27167 (h!28376 (_ BitVec 64)) (t!40634 List!27171)) )
))
(declare-fun acc!846 () List!27171)

(declare-fun noDuplicate!1830 (List!27171) Bool)

(assert (=> b!1234263 (= res!822443 (noDuplicate!1830 acc!846))))

(declare-fun b!1234264 () Bool)

(declare-fun res!822445 () Bool)

(assert (=> b!1234264 (=> (not res!822445) (not e!700047))))

(declare-fun contains!7233 (List!27171 (_ BitVec 64)) Bool)

(assert (=> b!1234264 (= res!822445 (not (contains!7233 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1234265 () Bool)

(assert (=> b!1234265 (= e!700047 false)))

(declare-fun lt!559823 () Bool)

(assert (=> b!1234265 (= lt!559823 (contains!7233 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!102688 res!822444) b!1234263))

(assert (= (and b!1234263 res!822443) b!1234264))

(assert (= (and b!1234264 res!822445) b!1234265))

(declare-fun m!1138265 () Bool)

(assert (=> start!102688 m!1138265))

(declare-fun m!1138267 () Bool)

(assert (=> b!1234263 m!1138267))

(declare-fun m!1138269 () Bool)

(assert (=> b!1234264 m!1138269))

(declare-fun m!1138271 () Bool)

(assert (=> b!1234265 m!1138271))

(push 1)

(assert (not b!1234263))

(assert (not b!1234264))

(assert (not b!1234265))

(assert (not start!102688))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

