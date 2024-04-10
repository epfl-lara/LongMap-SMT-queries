; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114230 () Bool)

(assert start!114230)

(declare-fun b!1357018 () Bool)

(declare-fun res!901781 () Bool)

(declare-fun e!770232 () Bool)

(assert (=> b!1357018 (=> (not res!901781) (not e!770232))))

(declare-datatypes ((array!92412 0))(
  ( (array!92413 (arr!44654 (Array (_ BitVec 32) (_ BitVec 64))) (size!45204 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92412)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1357018 (= res!901781 (validKeyInArray!0 (select (arr!44654 a!3742) from!3120)))))

(declare-fun b!1357019 () Bool)

(declare-fun res!901782 () Bool)

(assert (=> b!1357019 (=> (not res!901782) (not e!770232))))

(declare-datatypes ((List!31695 0))(
  ( (Nil!31692) (Cons!31691 (h!32900 (_ BitVec 64)) (t!46353 List!31695)) )
))
(declare-fun acc!759 () List!31695)

(declare-fun contains!9404 (List!31695 (_ BitVec 64)) Bool)

(assert (=> b!1357019 (= res!901782 (not (contains!9404 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1357020 () Bool)

(declare-fun res!901778 () Bool)

(assert (=> b!1357020 (=> (not res!901778) (not e!770232))))

(assert (=> b!1357020 (= res!901778 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45204 a!3742)))))

(declare-fun b!1357021 () Bool)

(declare-fun res!901779 () Bool)

(assert (=> b!1357021 (=> (not res!901779) (not e!770232))))

(declare-fun arrayNoDuplicates!0 (array!92412 (_ BitVec 32) List!31695) Bool)

(assert (=> b!1357021 (= res!901779 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31692))))

(declare-fun b!1357022 () Bool)

(assert (=> b!1357022 (= e!770232 (not (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun subseq!806 (List!31695 List!31695) Bool)

(assert (=> b!1357022 (subseq!806 acc!759 acc!759)))

(declare-datatypes ((Unit!44643 0))(
  ( (Unit!44644) )
))
(declare-fun lt!599110 () Unit!44643)

(declare-fun lemmaListSubSeqRefl!0 (List!31695) Unit!44643)

(assert (=> b!1357022 (= lt!599110 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun b!1357023 () Bool)

(declare-fun res!901775 () Bool)

(assert (=> b!1357023 (=> (not res!901775) (not e!770232))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1357023 (= res!901775 (not (validKeyInArray!0 l!3587)))))

(declare-fun res!901777 () Bool)

(assert (=> start!114230 (=> (not res!901777) (not e!770232))))

(assert (=> start!114230 (= res!901777 (and (bvslt (size!45204 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45204 a!3742))))))

(assert (=> start!114230 e!770232))

(assert (=> start!114230 true))

(declare-fun array_inv!33682 (array!92412) Bool)

(assert (=> start!114230 (array_inv!33682 a!3742)))

(declare-fun b!1357024 () Bool)

(declare-fun res!901776 () Bool)

(assert (=> b!1357024 (=> (not res!901776) (not e!770232))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1357024 (= res!901776 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45204 a!3742))))))

(declare-fun b!1357025 () Bool)

(declare-fun res!901774 () Bool)

(assert (=> b!1357025 (=> (not res!901774) (not e!770232))))

(declare-fun noDuplicate!2261 (List!31695) Bool)

(assert (=> b!1357025 (= res!901774 (noDuplicate!2261 acc!759))))

(declare-fun b!1357026 () Bool)

(declare-fun res!901783 () Bool)

(assert (=> b!1357026 (=> (not res!901783) (not e!770232))))

(assert (=> b!1357026 (= res!901783 (not (contains!9404 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1357027 () Bool)

(declare-fun res!901780 () Bool)

(assert (=> b!1357027 (=> (not res!901780) (not e!770232))))

(assert (=> b!1357027 (= res!901780 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(assert (= (and start!114230 res!901777) b!1357025))

(assert (= (and b!1357025 res!901774) b!1357019))

(assert (= (and b!1357019 res!901782) b!1357026))

(assert (= (and b!1357026 res!901783) b!1357021))

(assert (= (and b!1357021 res!901779) b!1357027))

(assert (= (and b!1357027 res!901780) b!1357024))

(assert (= (and b!1357024 res!901776) b!1357023))

(assert (= (and b!1357023 res!901775) b!1357020))

(assert (= (and b!1357020 res!901778) b!1357018))

(assert (= (and b!1357018 res!901781) b!1357022))

(declare-fun m!1242865 () Bool)

(assert (=> start!114230 m!1242865))

(declare-fun m!1242867 () Bool)

(assert (=> b!1357026 m!1242867))

(declare-fun m!1242869 () Bool)

(assert (=> b!1357018 m!1242869))

(assert (=> b!1357018 m!1242869))

(declare-fun m!1242871 () Bool)

(assert (=> b!1357018 m!1242871))

(declare-fun m!1242873 () Bool)

(assert (=> b!1357022 m!1242873))

(declare-fun m!1242875 () Bool)

(assert (=> b!1357022 m!1242875))

(declare-fun m!1242877 () Bool)

(assert (=> b!1357021 m!1242877))

(declare-fun m!1242879 () Bool)

(assert (=> b!1357019 m!1242879))

(declare-fun m!1242881 () Bool)

(assert (=> b!1357025 m!1242881))

(declare-fun m!1242883 () Bool)

(assert (=> b!1357027 m!1242883))

(declare-fun m!1242885 () Bool)

(assert (=> b!1357023 m!1242885))

(push 1)

