; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114446 () Bool)

(assert start!114446)

(declare-fun b!1358197 () Bool)

(declare-fun res!902177 () Bool)

(declare-fun e!771052 () Bool)

(assert (=> b!1358197 (=> (not res!902177) (not e!771052))))

(declare-datatypes ((List!31731 0))(
  ( (Nil!31728) (Cons!31727 (h!32945 (_ BitVec 64)) (t!46381 List!31731)) )
))
(declare-fun acc!759 () List!31731)

(declare-fun contains!9443 (List!31731 (_ BitVec 64)) Bool)

(assert (=> b!1358197 (= res!902177 (not (contains!9443 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1358198 () Bool)

(declare-fun res!902176 () Bool)

(assert (=> b!1358198 (=> (not res!902176) (not e!771052))))

(declare-datatypes ((array!92519 0))(
  ( (array!92520 (arr!44703 (Array (_ BitVec 32) (_ BitVec 64))) (size!45254 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92519)

(declare-fun arrayNoDuplicates!0 (array!92519 (_ BitVec 32) List!31731) Bool)

(assert (=> b!1358198 (= res!902176 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31728))))

(declare-fun b!1358199 () Bool)

(declare-fun res!902173 () Bool)

(assert (=> b!1358199 (=> (not res!902173) (not e!771052))))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> b!1358199 (= res!902173 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun res!902172 () Bool)

(assert (=> start!114446 (=> (not res!902172) (not e!771052))))

(assert (=> start!114446 (= res!902172 (and (bvslt (size!45254 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45254 a!3742))))))

(assert (=> start!114446 e!771052))

(assert (=> start!114446 true))

(declare-fun array_inv!33984 (array!92519) Bool)

(assert (=> start!114446 (array_inv!33984 a!3742)))

(declare-fun b!1358200 () Bool)

(declare-fun res!902178 () Bool)

(assert (=> b!1358200 (=> (not res!902178) (not e!771052))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1358200 (= res!902178 (validKeyInArray!0 (select (arr!44703 a!3742) from!3120)))))

(declare-fun b!1358201 () Bool)

(declare-fun res!902174 () Bool)

(assert (=> b!1358201 (=> (not res!902174) (not e!771052))))

(declare-fun noDuplicate!2274 (List!31731) Bool)

(assert (=> b!1358201 (= res!902174 (noDuplicate!2274 acc!759))))

(declare-fun b!1358202 () Bool)

(assert (=> b!1358202 (= e!771052 (not true))))

(declare-fun subseq!802 (List!31731 List!31731) Bool)

(assert (=> b!1358202 (subseq!802 acc!759 acc!759)))

(declare-datatypes ((Unit!44574 0))(
  ( (Unit!44575) )
))
(declare-fun lt!599574 () Unit!44574)

(declare-fun lemmaListSubSeqRefl!0 (List!31731) Unit!44574)

(assert (=> b!1358202 (= lt!599574 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun b!1358203 () Bool)

(declare-fun res!902181 () Bool)

(assert (=> b!1358203 (=> (not res!902181) (not e!771052))))

(assert (=> b!1358203 (= res!902181 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45254 a!3742)))))

(declare-fun b!1358204 () Bool)

(declare-fun res!902175 () Bool)

(assert (=> b!1358204 (=> (not res!902175) (not e!771052))))

(assert (=> b!1358204 (= res!902175 (not (contains!9443 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1358205 () Bool)

(declare-fun res!902179 () Bool)

(assert (=> b!1358205 (=> (not res!902179) (not e!771052))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1358205 (= res!902179 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1358206 () Bool)

(declare-fun res!902180 () Bool)

(assert (=> b!1358206 (=> (not res!902180) (not e!771052))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1358206 (= res!902180 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45254 a!3742))))))

(assert (= (and start!114446 res!902172) b!1358201))

(assert (= (and b!1358201 res!902174) b!1358204))

(assert (= (and b!1358204 res!902175) b!1358197))

(assert (= (and b!1358197 res!902177) b!1358198))

(assert (= (and b!1358198 res!902176) b!1358199))

(assert (= (and b!1358199 res!902173) b!1358206))

(assert (= (and b!1358206 res!902180) b!1358205))

(assert (= (and b!1358205 res!902179) b!1358203))

(assert (= (and b!1358203 res!902181) b!1358200))

(assert (= (and b!1358200 res!902178) b!1358202))

(declare-fun m!1244373 () Bool)

(assert (=> b!1358197 m!1244373))

(declare-fun m!1244375 () Bool)

(assert (=> b!1358200 m!1244375))

(assert (=> b!1358200 m!1244375))

(declare-fun m!1244377 () Bool)

(assert (=> b!1358200 m!1244377))

(declare-fun m!1244379 () Bool)

(assert (=> b!1358201 m!1244379))

(declare-fun m!1244381 () Bool)

(assert (=> start!114446 m!1244381))

(declare-fun m!1244383 () Bool)

(assert (=> b!1358205 m!1244383))

(declare-fun m!1244385 () Bool)

(assert (=> b!1358199 m!1244385))

(declare-fun m!1244387 () Bool)

(assert (=> b!1358202 m!1244387))

(declare-fun m!1244389 () Bool)

(assert (=> b!1358202 m!1244389))

(declare-fun m!1244391 () Bool)

(assert (=> b!1358204 m!1244391))

(declare-fun m!1244393 () Bool)

(assert (=> b!1358198 m!1244393))

(push 1)

(assert (not b!1358205))

(assert (not start!114446))

(assert (not b!1358201))

(assert (not b!1358197))

(assert (not b!1358204))

(assert (not b!1358198))

(assert (not b!1358199))

(assert (not b!1358202))

(assert (not b!1358200))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

