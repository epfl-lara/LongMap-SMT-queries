; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114978 () Bool)

(assert start!114978)

(declare-fun b!1362837 () Bool)

(declare-fun res!906760 () Bool)

(declare-fun e!772991 () Bool)

(assert (=> b!1362837 (=> (not res!906760) (not e!772991))))

(declare-fun i!1404 () (_ BitVec 32))

(declare-datatypes ((array!92656 0))(
  ( (array!92657 (arr!44761 (Array (_ BitVec 32) (_ BitVec 64))) (size!45311 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92656)

(assert (=> b!1362837 (= res!906760 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45311 a!3742))))))

(declare-fun b!1362838 () Bool)

(declare-datatypes ((Unit!44943 0))(
  ( (Unit!44944) )
))
(declare-fun e!772992 () Unit!44943)

(declare-fun Unit!44945 () Unit!44943)

(assert (=> b!1362838 (= e!772992 Unit!44945)))

(declare-fun b!1362839 () Bool)

(declare-fun res!906763 () Bool)

(assert (=> b!1362839 (=> (not res!906763) (not e!772991))))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> b!1362839 (= res!906763 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45311 a!3742)))))

(declare-fun b!1362840 () Bool)

(declare-fun res!906756 () Bool)

(assert (=> b!1362840 (=> (not res!906756) (not e!772991))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1362840 (= res!906756 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1362841 () Bool)

(declare-fun lt!600602 () Unit!44943)

(assert (=> b!1362841 (= e!772992 lt!600602)))

(declare-fun lt!600603 () Unit!44943)

(declare-datatypes ((List!31802 0))(
  ( (Nil!31799) (Cons!31798 (h!33007 (_ BitVec 64)) (t!46490 List!31802)) )
))
(declare-fun acc!759 () List!31802)

(declare-fun lemmaListSubSeqRefl!0 (List!31802) Unit!44943)

(assert (=> b!1362841 (= lt!600603 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!913 (List!31802 List!31802) Bool)

(assert (=> b!1362841 (subseq!913 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92656 List!31802 List!31802 (_ BitVec 32)) Unit!44943)

(declare-fun $colon$colon!916 (List!31802 (_ BitVec 64)) List!31802)

(assert (=> b!1362841 (= lt!600602 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!916 acc!759 (select (arr!44761 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92656 (_ BitVec 32) List!31802) Bool)

(assert (=> b!1362841 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1362842 () Bool)

(declare-fun res!906759 () Bool)

(assert (=> b!1362842 (=> (not res!906759) (not e!772991))))

(declare-fun contains!9511 (List!31802 (_ BitVec 64)) Bool)

(assert (=> b!1362842 (= res!906759 (not (contains!9511 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1362844 () Bool)

(declare-fun res!906762 () Bool)

(assert (=> b!1362844 (=> (not res!906762) (not e!772991))))

(assert (=> b!1362844 (= res!906762 (not (contains!9511 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1362845 () Bool)

(declare-fun res!906761 () Bool)

(assert (=> b!1362845 (=> (not res!906761) (not e!772991))))

(assert (=> b!1362845 (= res!906761 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1362846 () Bool)

(declare-fun res!906758 () Bool)

(assert (=> b!1362846 (=> (not res!906758) (not e!772991))))

(declare-fun noDuplicate!2368 (List!31802) Bool)

(assert (=> b!1362846 (= res!906758 (noDuplicate!2368 acc!759))))

(declare-fun b!1362847 () Bool)

(declare-fun res!906757 () Bool)

(assert (=> b!1362847 (=> (not res!906757) (not e!772991))))

(assert (=> b!1362847 (= res!906757 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31799))))

(declare-fun res!906755 () Bool)

(assert (=> start!114978 (=> (not res!906755) (not e!772991))))

(assert (=> start!114978 (= res!906755 (and (bvslt (size!45311 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45311 a!3742))))))

(assert (=> start!114978 e!772991))

(assert (=> start!114978 true))

(declare-fun array_inv!33789 (array!92656) Bool)

(assert (=> start!114978 (array_inv!33789 a!3742)))

(declare-fun b!1362843 () Bool)

(assert (=> b!1362843 (= e!772991 false)))

(declare-fun lt!600604 () Unit!44943)

(assert (=> b!1362843 (= lt!600604 e!772992)))

(declare-fun c!127481 () Bool)

(assert (=> b!1362843 (= c!127481 (validKeyInArray!0 (select (arr!44761 a!3742) from!3120)))))

(assert (= (and start!114978 res!906755) b!1362846))

(assert (= (and b!1362846 res!906758) b!1362842))

(assert (= (and b!1362842 res!906759) b!1362844))

(assert (= (and b!1362844 res!906762) b!1362847))

(assert (= (and b!1362847 res!906757) b!1362845))

(assert (= (and b!1362845 res!906761) b!1362837))

(assert (= (and b!1362837 res!906760) b!1362840))

(assert (= (and b!1362840 res!906756) b!1362839))

(assert (= (and b!1362839 res!906763) b!1362843))

(assert (= (and b!1362843 c!127481) b!1362841))

(assert (= (and b!1362843 (not c!127481)) b!1362838))

(declare-fun m!1247751 () Bool)

(assert (=> b!1362840 m!1247751))

(declare-fun m!1247753 () Bool)

(assert (=> b!1362846 m!1247753))

(declare-fun m!1247755 () Bool)

(assert (=> b!1362843 m!1247755))

(assert (=> b!1362843 m!1247755))

(declare-fun m!1247757 () Bool)

(assert (=> b!1362843 m!1247757))

(declare-fun m!1247759 () Bool)

(assert (=> b!1362847 m!1247759))

(declare-fun m!1247761 () Bool)

(assert (=> start!114978 m!1247761))

(declare-fun m!1247763 () Bool)

(assert (=> b!1362842 m!1247763))

(declare-fun m!1247765 () Bool)

(assert (=> b!1362841 m!1247765))

(assert (=> b!1362841 m!1247755))

(declare-fun m!1247767 () Bool)

(assert (=> b!1362841 m!1247767))

(declare-fun m!1247769 () Bool)

(assert (=> b!1362841 m!1247769))

(declare-fun m!1247771 () Bool)

(assert (=> b!1362841 m!1247771))

(assert (=> b!1362841 m!1247755))

(assert (=> b!1362841 m!1247767))

(declare-fun m!1247773 () Bool)

(assert (=> b!1362841 m!1247773))

(declare-fun m!1247775 () Bool)

(assert (=> b!1362844 m!1247775))

(declare-fun m!1247777 () Bool)

(assert (=> b!1362845 m!1247777))

(push 1)

(assert (not b!1362844))

(assert (not b!1362842))

(assert (not start!114978))

(assert (not b!1362846))

(assert (not b!1362845))

(assert (not b!1362840))

(assert (not b!1362847))

(assert (not b!1362843))

(assert (not b!1362841))

(check-sat)

(pop 1)

