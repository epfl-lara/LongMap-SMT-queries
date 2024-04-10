; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116292 () Bool)

(assert start!116292)

(declare-fun b!1372900 () Bool)

(declare-fun res!916168 () Bool)

(declare-fun e!777723 () Bool)

(assert (=> b!1372900 (=> (not res!916168) (not e!777723))))

(declare-datatypes ((List!32033 0))(
  ( (Nil!32030) (Cons!32029 (h!33238 (_ BitVec 64)) (t!46727 List!32033)) )
))
(declare-fun acc!866 () List!32033)

(declare-fun noDuplicate!2572 (List!32033) Bool)

(assert (=> b!1372900 (= res!916168 (noDuplicate!2572 acc!866))))

(declare-fun b!1372901 () Bool)

(declare-fun res!916170 () Bool)

(assert (=> b!1372901 (=> (not res!916170) (not e!777723))))

(declare-fun newAcc!98 () List!32033)

(declare-fun contains!9715 (List!32033 (_ BitVec 64)) Bool)

(assert (=> b!1372901 (= res!916170 (not (contains!9715 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372902 () Bool)

(declare-fun res!916169 () Bool)

(assert (=> b!1372902 (=> (not res!916169) (not e!777723))))

(assert (=> b!1372902 (= res!916169 (not (contains!9715 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372903 () Bool)

(declare-fun res!916173 () Bool)

(assert (=> b!1372903 (=> (not res!916173) (not e!777723))))

(assert (=> b!1372903 (= res!916173 (not (contains!9715 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!916172 () Bool)

(assert (=> start!116292 (=> (not res!916172) (not e!777723))))

(declare-datatypes ((array!93109 0))(
  ( (array!93110 (arr!44965 (Array (_ BitVec 32) (_ BitVec 64))) (size!45515 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93109)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!116292 (= res!916172 (and (bvslt (size!45515 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45515 a!3861))))))

(assert (=> start!116292 e!777723))

(declare-fun array_inv!33993 (array!93109) Bool)

(assert (=> start!116292 (array_inv!33993 a!3861)))

(assert (=> start!116292 true))

(declare-fun b!1372904 () Bool)

(declare-fun res!916174 () Bool)

(assert (=> b!1372904 (=> (not res!916174) (not e!777723))))

(assert (=> b!1372904 (= res!916174 (not (contains!9715 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372905 () Bool)

(declare-fun res!916171 () Bool)

(assert (=> b!1372905 (=> (not res!916171) (not e!777723))))

(declare-fun subseq!1117 (List!32033 List!32033) Bool)

(assert (=> b!1372905 (= res!916171 (subseq!1117 newAcc!98 acc!866))))

(declare-fun b!1372906 () Bool)

(assert (=> b!1372906 (= e!777723 false)))

(declare-fun lt!602971 () Bool)

(declare-fun arrayNoDuplicates!0 (array!93109 (_ BitVec 32) List!32033) Bool)

(assert (=> b!1372906 (= lt!602971 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45367 0))(
  ( (Unit!45368) )
))
(declare-fun lt!602970 () Unit!45367)

(declare-fun noDuplicateSubseq!304 (List!32033 List!32033) Unit!45367)

(assert (=> b!1372906 (= lt!602970 (noDuplicateSubseq!304 newAcc!98 acc!866))))

(assert (= (and start!116292 res!916172) b!1372900))

(assert (= (and b!1372900 res!916168) b!1372904))

(assert (= (and b!1372904 res!916174) b!1372902))

(assert (= (and b!1372902 res!916169) b!1372903))

(assert (= (and b!1372903 res!916173) b!1372901))

(assert (= (and b!1372901 res!916170) b!1372905))

(assert (= (and b!1372905 res!916171) b!1372906))

(declare-fun m!1256269 () Bool)

(assert (=> b!1372903 m!1256269))

(declare-fun m!1256271 () Bool)

(assert (=> b!1372904 m!1256271))

(declare-fun m!1256273 () Bool)

(assert (=> b!1372905 m!1256273))

(declare-fun m!1256275 () Bool)

(assert (=> start!116292 m!1256275))

(declare-fun m!1256277 () Bool)

(assert (=> b!1372902 m!1256277))

(declare-fun m!1256279 () Bool)

(assert (=> b!1372900 m!1256279))

(declare-fun m!1256281 () Bool)

(assert (=> b!1372901 m!1256281))

(declare-fun m!1256283 () Bool)

(assert (=> b!1372906 m!1256283))

(declare-fun m!1256285 () Bool)

(assert (=> b!1372906 m!1256285))

(push 1)

(assert (not b!1372904))

(assert (not b!1372902))

(assert (not b!1372901))

(assert (not b!1372906))

(assert (not b!1372903))

(assert (not b!1372900))

(assert (not start!116292))

(assert (not b!1372905))

(check-sat)

