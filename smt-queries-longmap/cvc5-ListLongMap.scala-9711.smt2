; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114878 () Bool)

(assert start!114878)

(declare-fun b!1361755 () Bool)

(declare-datatypes ((Unit!44883 0))(
  ( (Unit!44884) )
))
(declare-fun e!772542 () Unit!44883)

(declare-fun Unit!44885 () Unit!44883)

(assert (=> b!1361755 (= e!772542 Unit!44885)))

(declare-fun b!1361756 () Bool)

(declare-fun res!905846 () Bool)

(declare-fun e!772545 () Bool)

(assert (=> b!1361756 (=> (not res!905846) (not e!772545))))

(declare-datatypes ((array!92613 0))(
  ( (array!92614 (arr!44741 (Array (_ BitVec 32) (_ BitVec 64))) (size!45291 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92613)

(declare-fun from!3120 () (_ BitVec 32))

(declare-datatypes ((List!31782 0))(
  ( (Nil!31779) (Cons!31778 (h!32987 (_ BitVec 64)) (t!46467 List!31782)) )
))
(declare-fun acc!759 () List!31782)

(declare-fun arrayNoDuplicates!0 (array!92613 (_ BitVec 32) List!31782) Bool)

(assert (=> b!1361756 (= res!905846 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1361757 () Bool)

(declare-fun res!905853 () Bool)

(assert (=> b!1361757 (=> (not res!905853) (not e!772545))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1361757 (= res!905853 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45291 a!3742))))))

(declare-fun b!1361758 () Bool)

(declare-fun res!905845 () Bool)

(assert (=> b!1361758 (=> (not res!905845) (not e!772545))))

(declare-fun contains!9491 (List!31782 (_ BitVec 64)) Bool)

(assert (=> b!1361758 (= res!905845 (not (contains!9491 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1361759 () Bool)

(declare-fun res!905844 () Bool)

(assert (=> b!1361759 (=> (not res!905844) (not e!772545))))

(assert (=> b!1361759 (= res!905844 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31779))))

(declare-fun b!1361760 () Bool)

(declare-fun res!905852 () Bool)

(assert (=> b!1361760 (=> (not res!905852) (not e!772545))))

(assert (=> b!1361760 (= res!905852 (not (contains!9491 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1361761 () Bool)

(declare-fun res!905851 () Bool)

(declare-fun e!772543 () Bool)

(assert (=> b!1361761 (=> (not res!905851) (not e!772543))))

(declare-fun lt!600271 () List!31782)

(assert (=> b!1361761 (= res!905851 (not (contains!9491 lt!600271 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1361762 () Bool)

(declare-fun lt!600270 () Unit!44883)

(assert (=> b!1361762 (= e!772542 lt!600270)))

(declare-fun lt!600268 () Unit!44883)

(declare-fun lemmaListSubSeqRefl!0 (List!31782) Unit!44883)

(assert (=> b!1361762 (= lt!600268 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!893 (List!31782 List!31782) Bool)

(assert (=> b!1361762 (subseq!893 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92613 List!31782 List!31782 (_ BitVec 32)) Unit!44883)

(declare-fun $colon$colon!896 (List!31782 (_ BitVec 64)) List!31782)

(assert (=> b!1361762 (= lt!600270 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!896 acc!759 (select (arr!44741 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1361762 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun res!905842 () Bool)

(assert (=> start!114878 (=> (not res!905842) (not e!772545))))

(assert (=> start!114878 (= res!905842 (and (bvslt (size!45291 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45291 a!3742))))))

(assert (=> start!114878 e!772545))

(assert (=> start!114878 true))

(declare-fun array_inv!33769 (array!92613) Bool)

(assert (=> start!114878 (array_inv!33769 a!3742)))

(declare-fun b!1361763 () Bool)

(declare-fun e!772546 () Bool)

(assert (=> b!1361763 (= e!772545 e!772546)))

(declare-fun res!905841 () Bool)

(assert (=> b!1361763 (=> (not res!905841) (not e!772546))))

(declare-fun lt!600267 () Bool)

(assert (=> b!1361763 (= res!905841 (and (not (= from!3120 i!1404)) lt!600267))))

(declare-fun lt!600266 () Unit!44883)

(assert (=> b!1361763 (= lt!600266 e!772542)))

(declare-fun c!127397 () Bool)

(assert (=> b!1361763 (= c!127397 lt!600267)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1361763 (= lt!600267 (validKeyInArray!0 (select (arr!44741 a!3742) from!3120)))))

(declare-fun b!1361764 () Bool)

(declare-fun res!905847 () Bool)

(assert (=> b!1361764 (=> (not res!905847) (not e!772545))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1361764 (= res!905847 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1361765 () Bool)

(declare-fun res!905848 () Bool)

(assert (=> b!1361765 (=> (not res!905848) (not e!772543))))

(assert (=> b!1361765 (= res!905848 (not (contains!9491 lt!600271 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1361766 () Bool)

(declare-fun res!905854 () Bool)

(assert (=> b!1361766 (=> (not res!905854) (not e!772543))))

(declare-fun noDuplicate!2348 (List!31782) Bool)

(assert (=> b!1361766 (= res!905854 (noDuplicate!2348 lt!600271))))

(declare-fun b!1361767 () Bool)

(declare-fun res!905843 () Bool)

(assert (=> b!1361767 (=> (not res!905843) (not e!772545))))

(assert (=> b!1361767 (= res!905843 (noDuplicate!2348 acc!759))))

(declare-fun b!1361768 () Bool)

(declare-fun res!905849 () Bool)

(assert (=> b!1361768 (=> (not res!905849) (not e!772545))))

(assert (=> b!1361768 (= res!905849 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45291 a!3742)))))

(declare-fun b!1361769 () Bool)

(assert (=> b!1361769 (= e!772546 e!772543)))

(declare-fun res!905850 () Bool)

(assert (=> b!1361769 (=> (not res!905850) (not e!772543))))

(assert (=> b!1361769 (= res!905850 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(assert (=> b!1361769 (= lt!600271 ($colon$colon!896 acc!759 (select (arr!44741 a!3742) from!3120)))))

(declare-fun b!1361770 () Bool)

(assert (=> b!1361770 (= e!772543 false)))

(declare-fun lt!600269 () Bool)

(assert (=> b!1361770 (= lt!600269 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!600271))))

(assert (= (and start!114878 res!905842) b!1361767))

(assert (= (and b!1361767 res!905843) b!1361760))

(assert (= (and b!1361760 res!905852) b!1361758))

(assert (= (and b!1361758 res!905845) b!1361759))

(assert (= (and b!1361759 res!905844) b!1361756))

(assert (= (and b!1361756 res!905846) b!1361757))

(assert (= (and b!1361757 res!905853) b!1361764))

(assert (= (and b!1361764 res!905847) b!1361768))

(assert (= (and b!1361768 res!905849) b!1361763))

(assert (= (and b!1361763 c!127397) b!1361762))

(assert (= (and b!1361763 (not c!127397)) b!1361755))

(assert (= (and b!1361763 res!905841) b!1361769))

(assert (= (and b!1361769 res!905850) b!1361766))

(assert (= (and b!1361766 res!905854) b!1361765))

(assert (= (and b!1361765 res!905848) b!1361761))

(assert (= (and b!1361761 res!905851) b!1361770))

(declare-fun m!1246813 () Bool)

(assert (=> b!1361756 m!1246813))

(declare-fun m!1246815 () Bool)

(assert (=> b!1361761 m!1246815))

(declare-fun m!1246817 () Bool)

(assert (=> b!1361767 m!1246817))

(declare-fun m!1246819 () Bool)

(assert (=> b!1361769 m!1246819))

(assert (=> b!1361769 m!1246819))

(declare-fun m!1246821 () Bool)

(assert (=> b!1361769 m!1246821))

(declare-fun m!1246823 () Bool)

(assert (=> b!1361764 m!1246823))

(declare-fun m!1246825 () Bool)

(assert (=> b!1361759 m!1246825))

(declare-fun m!1246827 () Bool)

(assert (=> b!1361765 m!1246827))

(declare-fun m!1246829 () Bool)

(assert (=> b!1361762 m!1246829))

(assert (=> b!1361762 m!1246819))

(assert (=> b!1361762 m!1246821))

(declare-fun m!1246831 () Bool)

(assert (=> b!1361762 m!1246831))

(declare-fun m!1246833 () Bool)

(assert (=> b!1361762 m!1246833))

(assert (=> b!1361762 m!1246819))

(assert (=> b!1361762 m!1246821))

(declare-fun m!1246835 () Bool)

(assert (=> b!1361762 m!1246835))

(declare-fun m!1246837 () Bool)

(assert (=> b!1361760 m!1246837))

(assert (=> b!1361763 m!1246819))

(assert (=> b!1361763 m!1246819))

(declare-fun m!1246839 () Bool)

(assert (=> b!1361763 m!1246839))

(declare-fun m!1246841 () Bool)

(assert (=> start!114878 m!1246841))

(declare-fun m!1246843 () Bool)

(assert (=> b!1361770 m!1246843))

(declare-fun m!1246845 () Bool)

(assert (=> b!1361758 m!1246845))

(declare-fun m!1246847 () Bool)

(assert (=> b!1361766 m!1246847))

(push 1)

