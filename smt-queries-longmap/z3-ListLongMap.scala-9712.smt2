; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114884 () Bool)

(assert start!114884)

(declare-fun b!1361831 () Bool)

(declare-fun res!905950 () Bool)

(declare-fun e!772558 () Bool)

(assert (=> b!1361831 (=> (not res!905950) (not e!772558))))

(declare-datatypes ((List!31838 0))(
  ( (Nil!31835) (Cons!31834 (h!33043 (_ BitVec 64)) (t!46515 List!31838)) )
))
(declare-fun acc!759 () List!31838)

(declare-fun contains!9458 (List!31838 (_ BitVec 64)) Bool)

(assert (=> b!1361831 (= res!905950 (not (contains!9458 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1361832 () Bool)

(declare-datatypes ((Unit!44733 0))(
  ( (Unit!44734) )
))
(declare-fun e!772557 () Unit!44733)

(declare-fun Unit!44735 () Unit!44733)

(assert (=> b!1361832 (= e!772557 Unit!44735)))

(declare-fun b!1361833 () Bool)

(declare-fun res!905954 () Bool)

(declare-fun e!772556 () Bool)

(assert (=> b!1361833 (=> (not res!905954) (not e!772556))))

(declare-fun lt!600132 () List!31838)

(declare-fun noDuplicate!2373 (List!31838) Bool)

(assert (=> b!1361833 (= res!905954 (noDuplicate!2373 lt!600132))))

(declare-fun b!1361834 () Bool)

(declare-fun res!905953 () Bool)

(assert (=> b!1361834 (=> (not res!905953) (not e!772558))))

(assert (=> b!1361834 (= res!905953 (not (contains!9458 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1361835 () Bool)

(declare-fun e!772554 () Bool)

(assert (=> b!1361835 (= e!772554 e!772556)))

(declare-fun res!905948 () Bool)

(assert (=> b!1361835 (=> (not res!905948) (not e!772556))))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> b!1361835 (= res!905948 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-datatypes ((array!92568 0))(
  ( (array!92569 (arr!44719 (Array (_ BitVec 32) (_ BitVec 64))) (size!45271 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92568)

(declare-fun $colon$colon!901 (List!31838 (_ BitVec 64)) List!31838)

(assert (=> b!1361835 (= lt!600132 ($colon$colon!901 acc!759 (select (arr!44719 a!3742) from!3120)))))

(declare-fun b!1361836 () Bool)

(assert (=> b!1361836 (= e!772556 (bvsge (bvsub (size!45271 a!3742) (bvadd #b00000000000000000000000000000001 from!3120)) (bvsub (size!45271 a!3742) from!3120)))))

(declare-fun b!1361837 () Bool)

(declare-fun res!905944 () Bool)

(assert (=> b!1361837 (=> (not res!905944) (not e!772558))))

(declare-fun arrayNoDuplicates!0 (array!92568 (_ BitVec 32) List!31838) Bool)

(assert (=> b!1361837 (= res!905944 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31835))))

(declare-fun b!1361838 () Bool)

(declare-fun res!905947 () Bool)

(assert (=> b!1361838 (=> (not res!905947) (not e!772556))))

(assert (=> b!1361838 (= res!905947 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!600132))))

(declare-fun b!1361839 () Bool)

(declare-fun res!905952 () Bool)

(assert (=> b!1361839 (=> (not res!905952) (not e!772558))))

(assert (=> b!1361839 (= res!905952 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45271 a!3742)))))

(declare-fun b!1361840 () Bool)

(declare-fun res!905946 () Bool)

(assert (=> b!1361840 (=> (not res!905946) (not e!772558))))

(assert (=> b!1361840 (= res!905946 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1361841 () Bool)

(assert (=> b!1361841 (= e!772558 e!772554)))

(declare-fun res!905940 () Bool)

(assert (=> b!1361841 (=> (not res!905940) (not e!772554))))

(declare-fun lt!600136 () Bool)

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1361841 (= res!905940 (and (not (= from!3120 i!1404)) lt!600136))))

(declare-fun lt!600135 () Unit!44733)

(assert (=> b!1361841 (= lt!600135 e!772557)))

(declare-fun c!127388 () Bool)

(assert (=> b!1361841 (= c!127388 lt!600136)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1361841 (= lt!600136 (validKeyInArray!0 (select (arr!44719 a!3742) from!3120)))))

(declare-fun res!905949 () Bool)

(assert (=> start!114884 (=> (not res!905949) (not e!772558))))

(assert (=> start!114884 (= res!905949 (and (bvslt (size!45271 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45271 a!3742))))))

(assert (=> start!114884 e!772558))

(assert (=> start!114884 true))

(declare-fun array_inv!33952 (array!92568) Bool)

(assert (=> start!114884 (array_inv!33952 a!3742)))

(declare-fun b!1361842 () Bool)

(declare-fun res!905942 () Bool)

(assert (=> b!1361842 (=> (not res!905942) (not e!772556))))

(assert (=> b!1361842 (= res!905942 (not (contains!9458 lt!600132 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1361843 () Bool)

(declare-fun lt!600134 () Unit!44733)

(assert (=> b!1361843 (= e!772557 lt!600134)))

(declare-fun lt!600133 () Unit!44733)

(declare-fun lemmaListSubSeqRefl!0 (List!31838) Unit!44733)

(assert (=> b!1361843 (= lt!600133 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!896 (List!31838 List!31838) Bool)

(assert (=> b!1361843 (subseq!896 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92568 List!31838 List!31838 (_ BitVec 32)) Unit!44733)

(assert (=> b!1361843 (= lt!600134 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!901 acc!759 (select (arr!44719 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1361843 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1361844 () Bool)

(declare-fun res!905943 () Bool)

(assert (=> b!1361844 (=> (not res!905943) (not e!772558))))

(assert (=> b!1361844 (= res!905943 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45271 a!3742))))))

(declare-fun b!1361845 () Bool)

(declare-fun res!905941 () Bool)

(assert (=> b!1361845 (=> (not res!905941) (not e!772558))))

(assert (=> b!1361845 (= res!905941 (noDuplicate!2373 acc!759))))

(declare-fun b!1361846 () Bool)

(declare-fun res!905951 () Bool)

(assert (=> b!1361846 (=> (not res!905951) (not e!772558))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1361846 (= res!905951 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1361847 () Bool)

(declare-fun res!905945 () Bool)

(assert (=> b!1361847 (=> (not res!905945) (not e!772556))))

(assert (=> b!1361847 (= res!905945 (not (contains!9458 lt!600132 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!114884 res!905949) b!1361845))

(assert (= (and b!1361845 res!905941) b!1361834))

(assert (= (and b!1361834 res!905953) b!1361831))

(assert (= (and b!1361831 res!905950) b!1361837))

(assert (= (and b!1361837 res!905944) b!1361840))

(assert (= (and b!1361840 res!905946) b!1361844))

(assert (= (and b!1361844 res!905943) b!1361846))

(assert (= (and b!1361846 res!905951) b!1361839))

(assert (= (and b!1361839 res!905952) b!1361841))

(assert (= (and b!1361841 c!127388) b!1361843))

(assert (= (and b!1361841 (not c!127388)) b!1361832))

(assert (= (and b!1361841 res!905940) b!1361835))

(assert (= (and b!1361835 res!905948) b!1361833))

(assert (= (and b!1361833 res!905954) b!1361842))

(assert (= (and b!1361842 res!905942) b!1361847))

(assert (= (and b!1361847 res!905945) b!1361838))

(assert (= (and b!1361838 res!905947) b!1361836))

(declare-fun m!1246405 () Bool)

(assert (=> b!1361834 m!1246405))

(declare-fun m!1246407 () Bool)

(assert (=> b!1361842 m!1246407))

(declare-fun m!1246409 () Bool)

(assert (=> b!1361835 m!1246409))

(assert (=> b!1361835 m!1246409))

(declare-fun m!1246411 () Bool)

(assert (=> b!1361835 m!1246411))

(declare-fun m!1246413 () Bool)

(assert (=> b!1361843 m!1246413))

(assert (=> b!1361843 m!1246409))

(assert (=> b!1361843 m!1246411))

(declare-fun m!1246415 () Bool)

(assert (=> b!1361843 m!1246415))

(declare-fun m!1246417 () Bool)

(assert (=> b!1361843 m!1246417))

(assert (=> b!1361843 m!1246409))

(assert (=> b!1361843 m!1246411))

(declare-fun m!1246419 () Bool)

(assert (=> b!1361843 m!1246419))

(declare-fun m!1246421 () Bool)

(assert (=> b!1361845 m!1246421))

(declare-fun m!1246423 () Bool)

(assert (=> b!1361833 m!1246423))

(declare-fun m!1246425 () Bool)

(assert (=> b!1361837 m!1246425))

(declare-fun m!1246427 () Bool)

(assert (=> b!1361831 m!1246427))

(declare-fun m!1246429 () Bool)

(assert (=> b!1361840 m!1246429))

(declare-fun m!1246431 () Bool)

(assert (=> start!114884 m!1246431))

(declare-fun m!1246433 () Bool)

(assert (=> b!1361838 m!1246433))

(declare-fun m!1246435 () Bool)

(assert (=> b!1361846 m!1246435))

(assert (=> b!1361841 m!1246409))

(assert (=> b!1361841 m!1246409))

(declare-fun m!1246437 () Bool)

(assert (=> b!1361841 m!1246437))

(declare-fun m!1246439 () Bool)

(assert (=> b!1361847 m!1246439))

(check-sat (not b!1361831) (not b!1361842) (not b!1361845) (not b!1361847) (not b!1361834) (not b!1361838) (not start!114884) (not b!1361841) (not b!1361835) (not b!1361833) (not b!1361840) (not b!1361846) (not b!1361843) (not b!1361837))
(check-sat)
