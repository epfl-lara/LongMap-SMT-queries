; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114218 () Bool)

(assert start!114218)

(declare-fun b!1356838 () Bool)

(declare-fun res!901596 () Bool)

(declare-fun e!770197 () Bool)

(assert (=> b!1356838 (=> (not res!901596) (not e!770197))))

(declare-fun i!1404 () (_ BitVec 32))

(declare-datatypes ((array!92400 0))(
  ( (array!92401 (arr!44648 (Array (_ BitVec 32) (_ BitVec 64))) (size!45198 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92400)

(assert (=> b!1356838 (= res!901596 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45198 a!3742))))))

(declare-fun b!1356839 () Bool)

(declare-fun res!901600 () Bool)

(assert (=> b!1356839 (=> (not res!901600) (not e!770197))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1356839 (= res!901600 (validKeyInArray!0 (select (arr!44648 a!3742) from!3120)))))

(declare-fun b!1356840 () Bool)

(declare-fun res!901601 () Bool)

(assert (=> b!1356840 (=> (not res!901601) (not e!770197))))

(declare-datatypes ((List!31689 0))(
  ( (Nil!31686) (Cons!31685 (h!32894 (_ BitVec 64)) (t!46347 List!31689)) )
))
(declare-fun acc!759 () List!31689)

(declare-fun arrayNoDuplicates!0 (array!92400 (_ BitVec 32) List!31689) Bool)

(assert (=> b!1356840 (= res!901601 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1356841 () Bool)

(declare-fun res!901595 () Bool)

(assert (=> b!1356841 (=> (not res!901595) (not e!770197))))

(declare-fun contains!9398 (List!31689 (_ BitVec 64)) Bool)

(assert (=> b!1356841 (= res!901595 (not (contains!9398 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356842 () Bool)

(declare-fun res!901594 () Bool)

(assert (=> b!1356842 (=> (not res!901594) (not e!770197))))

(assert (=> b!1356842 (= res!901594 (not (contains!9398 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356843 () Bool)

(assert (=> b!1356843 (= e!770197 (not true))))

(declare-fun subseq!800 (List!31689 List!31689) Bool)

(assert (=> b!1356843 (subseq!800 acc!759 acc!759)))

(declare-datatypes ((Unit!44631 0))(
  ( (Unit!44632) )
))
(declare-fun lt!599092 () Unit!44631)

(declare-fun lemmaListSubSeqRefl!0 (List!31689) Unit!44631)

(assert (=> b!1356843 (= lt!599092 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun b!1356844 () Bool)

(declare-fun res!901598 () Bool)

(assert (=> b!1356844 (=> (not res!901598) (not e!770197))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1356844 (= res!901598 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1356845 () Bool)

(declare-fun res!901597 () Bool)

(assert (=> b!1356845 (=> (not res!901597) (not e!770197))))

(assert (=> b!1356845 (= res!901597 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31686))))

(declare-fun res!901603 () Bool)

(assert (=> start!114218 (=> (not res!901603) (not e!770197))))

(assert (=> start!114218 (= res!901603 (and (bvslt (size!45198 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45198 a!3742))))))

(assert (=> start!114218 e!770197))

(assert (=> start!114218 true))

(declare-fun array_inv!33676 (array!92400) Bool)

(assert (=> start!114218 (array_inv!33676 a!3742)))

(declare-fun b!1356846 () Bool)

(declare-fun res!901602 () Bool)

(assert (=> b!1356846 (=> (not res!901602) (not e!770197))))

(declare-fun noDuplicate!2255 (List!31689) Bool)

(assert (=> b!1356846 (= res!901602 (noDuplicate!2255 acc!759))))

(declare-fun b!1356847 () Bool)

(declare-fun res!901599 () Bool)

(assert (=> b!1356847 (=> (not res!901599) (not e!770197))))

(assert (=> b!1356847 (= res!901599 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45198 a!3742)))))

(assert (= (and start!114218 res!901603) b!1356846))

(assert (= (and b!1356846 res!901602) b!1356842))

(assert (= (and b!1356842 res!901594) b!1356841))

(assert (= (and b!1356841 res!901595) b!1356845))

(assert (= (and b!1356845 res!901597) b!1356840))

(assert (= (and b!1356840 res!901601) b!1356838))

(assert (= (and b!1356838 res!901596) b!1356844))

(assert (= (and b!1356844 res!901598) b!1356847))

(assert (= (and b!1356847 res!901599) b!1356839))

(assert (= (and b!1356839 res!901600) b!1356843))

(declare-fun m!1242733 () Bool)

(assert (=> b!1356839 m!1242733))

(assert (=> b!1356839 m!1242733))

(declare-fun m!1242735 () Bool)

(assert (=> b!1356839 m!1242735))

(declare-fun m!1242737 () Bool)

(assert (=> b!1356846 m!1242737))

(declare-fun m!1242739 () Bool)

(assert (=> b!1356842 m!1242739))

(declare-fun m!1242741 () Bool)

(assert (=> b!1356845 m!1242741))

(declare-fun m!1242743 () Bool)

(assert (=> b!1356844 m!1242743))

(declare-fun m!1242745 () Bool)

(assert (=> b!1356843 m!1242745))

(declare-fun m!1242747 () Bool)

(assert (=> b!1356843 m!1242747))

(declare-fun m!1242749 () Bool)

(assert (=> start!114218 m!1242749))

(declare-fun m!1242751 () Bool)

(assert (=> b!1356841 m!1242751))

(declare-fun m!1242753 () Bool)

(assert (=> b!1356840 m!1242753))

(push 1)

(assert (not b!1356845))

(assert (not b!1356844))

(assert (not b!1356840))

(assert (not b!1356841))

(assert (not b!1356842))

(assert (not b!1356846))

(assert (not b!1356839))

(assert (not b!1356843))

(assert (not start!114218))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

