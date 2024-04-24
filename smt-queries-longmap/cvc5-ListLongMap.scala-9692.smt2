; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114716 () Bool)

(assert start!114716)

(declare-fun b!1360116 () Bool)

(declare-fun res!903921 () Bool)

(declare-fun e!771967 () Bool)

(assert (=> b!1360116 (=> (not res!903921) (not e!771967))))

(declare-datatypes ((List!31767 0))(
  ( (Nil!31764) (Cons!31763 (h!32981 (_ BitVec 64)) (t!46429 List!31767)) )
))
(declare-fun acc!759 () List!31767)

(declare-datatypes ((array!92603 0))(
  ( (array!92604 (arr!44739 (Array (_ BitVec 32) (_ BitVec 64))) (size!45290 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92603)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92603 (_ BitVec 32) List!31767) Bool)

(assert (=> b!1360116 (= res!903921 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1360117 () Bool)

(declare-fun res!903926 () Bool)

(assert (=> b!1360117 (=> (not res!903926) (not e!771967))))

(assert (=> b!1360117 (= res!903926 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45290 a!3742)))))

(declare-fun b!1360118 () Bool)

(assert (=> b!1360118 (= e!771967 false)))

(declare-datatypes ((Unit!44657 0))(
  ( (Unit!44658) )
))
(declare-fun lt!599918 () Unit!44657)

(declare-fun e!771965 () Unit!44657)

(assert (=> b!1360118 (= lt!599918 e!771965)))

(declare-fun c!127546 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1360118 (= c!127546 (validKeyInArray!0 (select (arr!44739 a!3742) from!3120)))))

(declare-fun b!1360119 () Bool)

(declare-fun res!903925 () Bool)

(assert (=> b!1360119 (=> (not res!903925) (not e!771967))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1360119 (= res!903925 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45290 a!3742))))))

(declare-fun b!1360120 () Bool)

(declare-fun res!903922 () Bool)

(assert (=> b!1360120 (=> (not res!903922) (not e!771967))))

(declare-fun contains!9479 (List!31767 (_ BitVec 64)) Bool)

(assert (=> b!1360120 (= res!903922 (not (contains!9479 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1360121 () Bool)

(declare-fun res!903923 () Bool)

(assert (=> b!1360121 (=> (not res!903923) (not e!771967))))

(assert (=> b!1360121 (= res!903923 (not (contains!9479 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1360122 () Bool)

(declare-fun res!903919 () Bool)

(assert (=> b!1360122 (=> (not res!903919) (not e!771967))))

(assert (=> b!1360122 (= res!903919 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31764))))

(declare-fun b!1360123 () Bool)

(declare-fun res!903927 () Bool)

(assert (=> b!1360123 (=> (not res!903927) (not e!771967))))

(declare-fun noDuplicate!2310 (List!31767) Bool)

(assert (=> b!1360123 (= res!903927 (noDuplicate!2310 acc!759))))

(declare-fun b!1360124 () Bool)

(declare-fun res!903920 () Bool)

(assert (=> b!1360124 (=> (not res!903920) (not e!771967))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1360124 (= res!903920 (not (validKeyInArray!0 l!3587)))))

(declare-fun res!903924 () Bool)

(assert (=> start!114716 (=> (not res!903924) (not e!771967))))

(assert (=> start!114716 (= res!903924 (and (bvslt (size!45290 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45290 a!3742))))))

(assert (=> start!114716 e!771967))

(assert (=> start!114716 true))

(declare-fun array_inv!34020 (array!92603) Bool)

(assert (=> start!114716 (array_inv!34020 a!3742)))

(declare-fun b!1360125 () Bool)

(declare-fun lt!599919 () Unit!44657)

(assert (=> b!1360125 (= e!771965 lt!599919)))

(declare-fun lt!599917 () Unit!44657)

(declare-fun lemmaListSubSeqRefl!0 (List!31767) Unit!44657)

(assert (=> b!1360125 (= lt!599917 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!838 (List!31767 List!31767) Bool)

(assert (=> b!1360125 (subseq!838 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92603 List!31767 List!31767 (_ BitVec 32)) Unit!44657)

(declare-fun $colon$colon!840 (List!31767 (_ BitVec 64)) List!31767)

(assert (=> b!1360125 (= lt!599919 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!840 acc!759 (select (arr!44739 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1360125 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1360126 () Bool)

(declare-fun Unit!44659 () Unit!44657)

(assert (=> b!1360126 (= e!771965 Unit!44659)))

(assert (= (and start!114716 res!903924) b!1360123))

(assert (= (and b!1360123 res!903927) b!1360121))

(assert (= (and b!1360121 res!903923) b!1360120))

(assert (= (and b!1360120 res!903922) b!1360122))

(assert (= (and b!1360122 res!903919) b!1360116))

(assert (= (and b!1360116 res!903921) b!1360119))

(assert (= (and b!1360119 res!903925) b!1360124))

(assert (= (and b!1360124 res!903920) b!1360117))

(assert (= (and b!1360117 res!903926) b!1360118))

(assert (= (and b!1360118 c!127546) b!1360125))

(assert (= (and b!1360118 (not c!127546)) b!1360126))

(declare-fun m!1245939 () Bool)

(assert (=> b!1360124 m!1245939))

(declare-fun m!1245941 () Bool)

(assert (=> b!1360125 m!1245941))

(declare-fun m!1245943 () Bool)

(assert (=> b!1360125 m!1245943))

(declare-fun m!1245945 () Bool)

(assert (=> b!1360125 m!1245945))

(declare-fun m!1245947 () Bool)

(assert (=> b!1360125 m!1245947))

(declare-fun m!1245949 () Bool)

(assert (=> b!1360125 m!1245949))

(assert (=> b!1360125 m!1245943))

(assert (=> b!1360125 m!1245945))

(declare-fun m!1245951 () Bool)

(assert (=> b!1360125 m!1245951))

(declare-fun m!1245953 () Bool)

(assert (=> b!1360116 m!1245953))

(assert (=> b!1360118 m!1245943))

(assert (=> b!1360118 m!1245943))

(declare-fun m!1245955 () Bool)

(assert (=> b!1360118 m!1245955))

(declare-fun m!1245957 () Bool)

(assert (=> start!114716 m!1245957))

(declare-fun m!1245959 () Bool)

(assert (=> b!1360120 m!1245959))

(declare-fun m!1245961 () Bool)

(assert (=> b!1360122 m!1245961))

(declare-fun m!1245963 () Bool)

(assert (=> b!1360123 m!1245963))

(declare-fun m!1245965 () Bool)

(assert (=> b!1360121 m!1245965))

(push 1)

(assert (not b!1360116))

(assert (not b!1360125))

(assert (not b!1360122))

(assert (not b!1360123))

(assert (not start!114716))

(assert (not b!1360124))

(assert (not b!1360118))

(assert (not b!1360120))

(assert (not b!1360121))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

