; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115426 () Bool)

(assert start!115426)

(declare-fun b!1364950 () Bool)

(declare-fun res!908568 () Bool)

(declare-fun e!774081 () Bool)

(assert (=> b!1364950 (=> (not res!908568) (not e!774081))))

(declare-datatypes ((List!31928 0))(
  ( (Nil!31925) (Cons!31924 (h!33133 (_ BitVec 64)) (t!46614 List!31928)) )
))
(declare-fun acc!866 () List!31928)

(declare-fun contains!9521 (List!31928 (_ BitVec 64)) Bool)

(assert (=> b!1364950 (= res!908568 (not (contains!9521 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1364951 () Bool)

(declare-fun res!908573 () Bool)

(assert (=> b!1364951 (=> (not res!908573) (not e!774081))))

(declare-fun newAcc!98 () List!31928)

(assert (=> b!1364951 (= res!908573 (not (contains!9521 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1364952 () Bool)

(assert (=> b!1364952 (= e!774081 false)))

(declare-datatypes ((Unit!44892 0))(
  ( (Unit!44893) )
))
(declare-fun lt!600990 () Unit!44892)

(declare-fun noDuplicateSubseq!146 (List!31928 List!31928) Unit!44892)

(assert (=> b!1364952 (= lt!600990 (noDuplicateSubseq!146 newAcc!98 acc!866))))

(declare-fun res!908570 () Bool)

(assert (=> start!115426 (=> (not res!908570) (not e!774081))))

(declare-datatypes ((array!92706 0))(
  ( (array!92707 (arr!44782 (Array (_ BitVec 32) (_ BitVec 64))) (size!45334 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92706)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!115426 (= res!908570 (and (bvslt (size!45334 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45334 a!3861))))))

(assert (=> start!115426 e!774081))

(declare-fun array_inv!34015 (array!92706) Bool)

(assert (=> start!115426 (array_inv!34015 a!3861)))

(assert (=> start!115426 true))

(declare-fun b!1364953 () Bool)

(declare-fun res!908569 () Bool)

(assert (=> b!1364953 (=> (not res!908569) (not e!774081))))

(declare-fun noDuplicate!2436 (List!31928) Bool)

(assert (=> b!1364953 (= res!908569 (noDuplicate!2436 acc!866))))

(declare-fun b!1364954 () Bool)

(declare-fun res!908567 () Bool)

(assert (=> b!1364954 (=> (not res!908567) (not e!774081))))

(assert (=> b!1364954 (= res!908567 (not (contains!9521 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1364955 () Bool)

(declare-fun res!908572 () Bool)

(assert (=> b!1364955 (=> (not res!908572) (not e!774081))))

(assert (=> b!1364955 (= res!908572 (not (contains!9521 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1364956 () Bool)

(declare-fun res!908571 () Bool)

(assert (=> b!1364956 (=> (not res!908571) (not e!774081))))

(declare-fun subseq!959 (List!31928 List!31928) Bool)

(assert (=> b!1364956 (= res!908571 (subseq!959 newAcc!98 acc!866))))

(assert (= (and start!115426 res!908570) b!1364953))

(assert (= (and b!1364953 res!908569) b!1364950))

(assert (= (and b!1364950 res!908568) b!1364955))

(assert (= (and b!1364955 res!908572) b!1364954))

(assert (= (and b!1364954 res!908567) b!1364951))

(assert (= (and b!1364951 res!908573) b!1364956))

(assert (= (and b!1364956 res!908571) b!1364952))

(declare-fun m!1249167 () Bool)

(assert (=> b!1364953 m!1249167))

(declare-fun m!1249169 () Bool)

(assert (=> b!1364955 m!1249169))

(declare-fun m!1249171 () Bool)

(assert (=> b!1364954 m!1249171))

(declare-fun m!1249173 () Bool)

(assert (=> b!1364950 m!1249173))

(declare-fun m!1249175 () Bool)

(assert (=> b!1364951 m!1249175))

(declare-fun m!1249177 () Bool)

(assert (=> b!1364952 m!1249177))

(declare-fun m!1249179 () Bool)

(assert (=> b!1364956 m!1249179))

(declare-fun m!1249181 () Bool)

(assert (=> start!115426 m!1249181))

(check-sat (not b!1364956) (not b!1364955) (not start!115426) (not b!1364954) (not b!1364951) (not b!1364952) (not b!1364953) (not b!1364950))
(check-sat)
