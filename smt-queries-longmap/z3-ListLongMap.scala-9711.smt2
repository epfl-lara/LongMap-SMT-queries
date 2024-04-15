; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114878 () Bool)

(assert start!114878)

(declare-fun res!905814 () Bool)

(declare-fun e!772509 () Bool)

(assert (=> start!114878 (=> (not res!905814) (not e!772509))))

(declare-datatypes ((array!92562 0))(
  ( (array!92563 (arr!44716 (Array (_ BitVec 32) (_ BitVec 64))) (size!45268 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92562)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114878 (= res!905814 (and (bvslt (size!45268 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45268 a!3742))))))

(assert (=> start!114878 e!772509))

(assert (=> start!114878 true))

(declare-fun array_inv!33949 (array!92562) Bool)

(assert (=> start!114878 (array_inv!33949 a!3742)))

(declare-fun b!1361685 () Bool)

(declare-fun res!905816 () Bool)

(assert (=> b!1361685 (=> (not res!905816) (not e!772509))))

(declare-datatypes ((List!31835 0))(
  ( (Nil!31832) (Cons!31831 (h!33040 (_ BitVec 64)) (t!46512 List!31835)) )
))
(declare-fun arrayNoDuplicates!0 (array!92562 (_ BitVec 32) List!31835) Bool)

(assert (=> b!1361685 (= res!905816 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31832))))

(declare-fun b!1361686 () Bool)

(declare-fun res!905823 () Bool)

(declare-fun e!772512 () Bool)

(assert (=> b!1361686 (=> (not res!905823) (not e!772512))))

(declare-fun lt!600082 () List!31835)

(declare-fun contains!9455 (List!31835 (_ BitVec 64)) Bool)

(assert (=> b!1361686 (= res!905823 (not (contains!9455 lt!600082 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1361687 () Bool)

(declare-datatypes ((Unit!44724 0))(
  ( (Unit!44725) )
))
(declare-fun e!772510 () Unit!44724)

(declare-fun Unit!44726 () Unit!44724)

(assert (=> b!1361687 (= e!772510 Unit!44726)))

(declare-fun b!1361688 () Bool)

(declare-fun e!772513 () Bool)

(assert (=> b!1361688 (= e!772513 e!772512)))

(declare-fun res!905822 () Bool)

(assert (=> b!1361688 (=> (not res!905822) (not e!772512))))

(assert (=> b!1361688 (= res!905822 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun acc!759 () List!31835)

(declare-fun $colon$colon!898 (List!31835 (_ BitVec 64)) List!31835)

(assert (=> b!1361688 (= lt!600082 ($colon$colon!898 acc!759 (select (arr!44716 a!3742) from!3120)))))

(declare-fun b!1361689 () Bool)

(declare-fun res!905820 () Bool)

(assert (=> b!1361689 (=> (not res!905820) (not e!772509))))

(assert (=> b!1361689 (= res!905820 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1361690 () Bool)

(declare-fun res!905819 () Bool)

(assert (=> b!1361690 (=> (not res!905819) (not e!772509))))

(assert (=> b!1361690 (= res!905819 (not (contains!9455 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1361691 () Bool)

(declare-fun lt!600085 () Unit!44724)

(assert (=> b!1361691 (= e!772510 lt!600085)))

(declare-fun lt!600083 () Unit!44724)

(declare-fun lemmaListSubSeqRefl!0 (List!31835) Unit!44724)

(assert (=> b!1361691 (= lt!600083 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!893 (List!31835 List!31835) Bool)

(assert (=> b!1361691 (subseq!893 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92562 List!31835 List!31835 (_ BitVec 32)) Unit!44724)

(assert (=> b!1361691 (= lt!600085 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!898 acc!759 (select (arr!44716 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1361691 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1361692 () Bool)

(declare-fun res!905818 () Bool)

(assert (=> b!1361692 (=> (not res!905818) (not e!772509))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1361692 (= res!905818 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1361693 () Bool)

(assert (=> b!1361693 (= e!772509 e!772513)))

(declare-fun res!905817 () Bool)

(assert (=> b!1361693 (=> (not res!905817) (not e!772513))))

(declare-fun i!1404 () (_ BitVec 32))

(declare-fun lt!600084 () Bool)

(assert (=> b!1361693 (= res!905817 (and (not (= from!3120 i!1404)) lt!600084))))

(declare-fun lt!600081 () Unit!44724)

(assert (=> b!1361693 (= lt!600081 e!772510)))

(declare-fun c!127379 () Bool)

(assert (=> b!1361693 (= c!127379 lt!600084)))

(assert (=> b!1361693 (= lt!600084 (validKeyInArray!0 (select (arr!44716 a!3742) from!3120)))))

(declare-fun b!1361694 () Bool)

(assert (=> b!1361694 (= e!772512 false)))

(declare-fun lt!600080 () Bool)

(assert (=> b!1361694 (= lt!600080 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!600082))))

(declare-fun b!1361695 () Bool)

(declare-fun res!905815 () Bool)

(assert (=> b!1361695 (=> (not res!905815) (not e!772509))))

(assert (=> b!1361695 (= res!905815 (not (contains!9455 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1361696 () Bool)

(declare-fun res!905812 () Bool)

(assert (=> b!1361696 (=> (not res!905812) (not e!772509))))

(assert (=> b!1361696 (= res!905812 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45268 a!3742)))))

(declare-fun b!1361697 () Bool)

(declare-fun res!905825 () Bool)

(assert (=> b!1361697 (=> (not res!905825) (not e!772512))))

(declare-fun noDuplicate!2370 (List!31835) Bool)

(assert (=> b!1361697 (= res!905825 (noDuplicate!2370 lt!600082))))

(declare-fun b!1361698 () Bool)

(declare-fun res!905821 () Bool)

(assert (=> b!1361698 (=> (not res!905821) (not e!772509))))

(assert (=> b!1361698 (= res!905821 (noDuplicate!2370 acc!759))))

(declare-fun b!1361699 () Bool)

(declare-fun res!905824 () Bool)

(assert (=> b!1361699 (=> (not res!905824) (not e!772509))))

(assert (=> b!1361699 (= res!905824 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45268 a!3742))))))

(declare-fun b!1361700 () Bool)

(declare-fun res!905813 () Bool)

(assert (=> b!1361700 (=> (not res!905813) (not e!772512))))

(assert (=> b!1361700 (= res!905813 (not (contains!9455 lt!600082 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!114878 res!905814) b!1361698))

(assert (= (and b!1361698 res!905821) b!1361690))

(assert (= (and b!1361690 res!905819) b!1361695))

(assert (= (and b!1361695 res!905815) b!1361685))

(assert (= (and b!1361685 res!905816) b!1361689))

(assert (= (and b!1361689 res!905820) b!1361699))

(assert (= (and b!1361699 res!905824) b!1361692))

(assert (= (and b!1361692 res!905818) b!1361696))

(assert (= (and b!1361696 res!905812) b!1361693))

(assert (= (and b!1361693 c!127379) b!1361691))

(assert (= (and b!1361693 (not c!127379)) b!1361687))

(assert (= (and b!1361693 res!905817) b!1361688))

(assert (= (and b!1361688 res!905822) b!1361697))

(assert (= (and b!1361697 res!905825) b!1361700))

(assert (= (and b!1361700 res!905813) b!1361686))

(assert (= (and b!1361686 res!905823) b!1361694))

(declare-fun m!1246297 () Bool)

(assert (=> b!1361692 m!1246297))

(declare-fun m!1246299 () Bool)

(assert (=> b!1361698 m!1246299))

(declare-fun m!1246301 () Bool)

(assert (=> start!114878 m!1246301))

(declare-fun m!1246303 () Bool)

(assert (=> b!1361697 m!1246303))

(declare-fun m!1246305 () Bool)

(assert (=> b!1361700 m!1246305))

(declare-fun m!1246307 () Bool)

(assert (=> b!1361690 m!1246307))

(declare-fun m!1246309 () Bool)

(assert (=> b!1361685 m!1246309))

(declare-fun m!1246311 () Bool)

(assert (=> b!1361693 m!1246311))

(assert (=> b!1361693 m!1246311))

(declare-fun m!1246313 () Bool)

(assert (=> b!1361693 m!1246313))

(declare-fun m!1246315 () Bool)

(assert (=> b!1361691 m!1246315))

(assert (=> b!1361691 m!1246311))

(declare-fun m!1246317 () Bool)

(assert (=> b!1361691 m!1246317))

(declare-fun m!1246319 () Bool)

(assert (=> b!1361691 m!1246319))

(declare-fun m!1246321 () Bool)

(assert (=> b!1361691 m!1246321))

(assert (=> b!1361691 m!1246311))

(assert (=> b!1361691 m!1246317))

(declare-fun m!1246323 () Bool)

(assert (=> b!1361691 m!1246323))

(declare-fun m!1246325 () Bool)

(assert (=> b!1361686 m!1246325))

(declare-fun m!1246327 () Bool)

(assert (=> b!1361694 m!1246327))

(assert (=> b!1361688 m!1246311))

(assert (=> b!1361688 m!1246311))

(assert (=> b!1361688 m!1246317))

(declare-fun m!1246329 () Bool)

(assert (=> b!1361689 m!1246329))

(declare-fun m!1246331 () Bool)

(assert (=> b!1361695 m!1246331))

(check-sat (not start!114878) (not b!1361692) (not b!1361695) (not b!1361694) (not b!1361689) (not b!1361691) (not b!1361686) (not b!1361697) (not b!1361688) (not b!1361690) (not b!1361693) (not b!1361700) (not b!1361698) (not b!1361685))
(check-sat)
