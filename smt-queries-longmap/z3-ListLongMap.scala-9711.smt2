; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114880 () Bool)

(assert start!114880)

(declare-fun b!1361803 () Bool)

(declare-datatypes ((Unit!44886 0))(
  ( (Unit!44887) )
))
(declare-fun e!772559 () Unit!44886)

(declare-fun Unit!44888 () Unit!44886)

(assert (=> b!1361803 (= e!772559 Unit!44888)))

(declare-fun b!1361804 () Bool)

(declare-fun e!772557 () Bool)

(declare-fun e!772558 () Bool)

(assert (=> b!1361804 (= e!772557 e!772558)))

(declare-fun res!905892 () Bool)

(assert (=> b!1361804 (=> (not res!905892) (not e!772558))))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> b!1361804 (= res!905892 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-datatypes ((List!31783 0))(
  ( (Nil!31780) (Cons!31779 (h!32988 (_ BitVec 64)) (t!46468 List!31783)) )
))
(declare-fun acc!759 () List!31783)

(declare-fun lt!600289 () List!31783)

(declare-datatypes ((array!92615 0))(
  ( (array!92616 (arr!44742 (Array (_ BitVec 32) (_ BitVec 64))) (size!45292 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92615)

(declare-fun $colon$colon!897 (List!31783 (_ BitVec 64)) List!31783)

(assert (=> b!1361804 (= lt!600289 ($colon$colon!897 acc!759 (select (arr!44742 a!3742) from!3120)))))

(declare-fun b!1361805 () Bool)

(declare-fun res!905883 () Bool)

(declare-fun e!772560 () Bool)

(assert (=> b!1361805 (=> (not res!905883) (not e!772560))))

(declare-fun arrayNoDuplicates!0 (array!92615 (_ BitVec 32) List!31783) Bool)

(assert (=> b!1361805 (= res!905883 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31780))))

(declare-fun b!1361807 () Bool)

(declare-fun res!905889 () Bool)

(assert (=> b!1361807 (=> (not res!905889) (not e!772558))))

(declare-fun contains!9492 (List!31783 (_ BitVec 64)) Bool)

(assert (=> b!1361807 (= res!905889 (not (contains!9492 lt!600289 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1361808 () Bool)

(assert (=> b!1361808 (= e!772560 e!772557)))

(declare-fun res!905884 () Bool)

(assert (=> b!1361808 (=> (not res!905884) (not e!772557))))

(declare-fun lt!600284 () Bool)

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1361808 (= res!905884 (and (not (= from!3120 i!1404)) lt!600284))))

(declare-fun lt!600288 () Unit!44886)

(assert (=> b!1361808 (= lt!600288 e!772559)))

(declare-fun c!127400 () Bool)

(assert (=> b!1361808 (= c!127400 lt!600284)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1361808 (= lt!600284 (validKeyInArray!0 (select (arr!44742 a!3742) from!3120)))))

(declare-fun b!1361809 () Bool)

(declare-fun res!905895 () Bool)

(assert (=> b!1361809 (=> (not res!905895) (not e!772560))))

(assert (=> b!1361809 (= res!905895 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1361810 () Bool)

(declare-fun res!905885 () Bool)

(assert (=> b!1361810 (=> (not res!905885) (not e!772560))))

(declare-fun noDuplicate!2349 (List!31783) Bool)

(assert (=> b!1361810 (= res!905885 (noDuplicate!2349 acc!759))))

(declare-fun b!1361811 () Bool)

(declare-fun res!905888 () Bool)

(assert (=> b!1361811 (=> (not res!905888) (not e!772560))))

(assert (=> b!1361811 (= res!905888 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45292 a!3742)))))

(declare-fun b!1361812 () Bool)

(declare-fun res!905886 () Bool)

(assert (=> b!1361812 (=> (not res!905886) (not e!772560))))

(assert (=> b!1361812 (= res!905886 (not (contains!9492 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!905896 () Bool)

(assert (=> start!114880 (=> (not res!905896) (not e!772560))))

(assert (=> start!114880 (= res!905896 (and (bvslt (size!45292 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45292 a!3742))))))

(assert (=> start!114880 e!772560))

(assert (=> start!114880 true))

(declare-fun array_inv!33770 (array!92615) Bool)

(assert (=> start!114880 (array_inv!33770 a!3742)))

(declare-fun b!1361806 () Bool)

(declare-fun lt!600287 () Unit!44886)

(assert (=> b!1361806 (= e!772559 lt!600287)))

(declare-fun lt!600286 () Unit!44886)

(declare-fun lemmaListSubSeqRefl!0 (List!31783) Unit!44886)

(assert (=> b!1361806 (= lt!600286 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!894 (List!31783 List!31783) Bool)

(assert (=> b!1361806 (subseq!894 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92615 List!31783 List!31783 (_ BitVec 32)) Unit!44886)

(assert (=> b!1361806 (= lt!600287 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!897 acc!759 (select (arr!44742 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1361806 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1361813 () Bool)

(declare-fun res!905887 () Bool)

(assert (=> b!1361813 (=> (not res!905887) (not e!772560))))

(assert (=> b!1361813 (= res!905887 (not (contains!9492 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1361814 () Bool)

(declare-fun res!905891 () Bool)

(assert (=> b!1361814 (=> (not res!905891) (not e!772558))))

(assert (=> b!1361814 (= res!905891 (noDuplicate!2349 lt!600289))))

(declare-fun b!1361815 () Bool)

(declare-fun res!905894 () Bool)

(assert (=> b!1361815 (=> (not res!905894) (not e!772558))))

(assert (=> b!1361815 (= res!905894 (not (contains!9492 lt!600289 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1361816 () Bool)

(declare-fun res!905890 () Bool)

(assert (=> b!1361816 (=> (not res!905890) (not e!772560))))

(assert (=> b!1361816 (= res!905890 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45292 a!3742))))))

(declare-fun b!1361817 () Bool)

(declare-fun res!905893 () Bool)

(assert (=> b!1361817 (=> (not res!905893) (not e!772560))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1361817 (= res!905893 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1361818 () Bool)

(assert (=> b!1361818 (= e!772558 false)))

(declare-fun lt!600285 () Bool)

(assert (=> b!1361818 (= lt!600285 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!600289))))

(assert (= (and start!114880 res!905896) b!1361810))

(assert (= (and b!1361810 res!905885) b!1361812))

(assert (= (and b!1361812 res!905886) b!1361813))

(assert (= (and b!1361813 res!905887) b!1361805))

(assert (= (and b!1361805 res!905883) b!1361809))

(assert (= (and b!1361809 res!905895) b!1361816))

(assert (= (and b!1361816 res!905890) b!1361817))

(assert (= (and b!1361817 res!905893) b!1361811))

(assert (= (and b!1361811 res!905888) b!1361808))

(assert (= (and b!1361808 c!127400) b!1361806))

(assert (= (and b!1361808 (not c!127400)) b!1361803))

(assert (= (and b!1361808 res!905884) b!1361804))

(assert (= (and b!1361804 res!905892) b!1361814))

(assert (= (and b!1361814 res!905891) b!1361815))

(assert (= (and b!1361815 res!905894) b!1361807))

(assert (= (and b!1361807 res!905889) b!1361818))

(declare-fun m!1246849 () Bool)

(assert (=> b!1361814 m!1246849))

(declare-fun m!1246851 () Bool)

(assert (=> b!1361807 m!1246851))

(declare-fun m!1246853 () Bool)

(assert (=> start!114880 m!1246853))

(declare-fun m!1246855 () Bool)

(assert (=> b!1361815 m!1246855))

(declare-fun m!1246857 () Bool)

(assert (=> b!1361808 m!1246857))

(assert (=> b!1361808 m!1246857))

(declare-fun m!1246859 () Bool)

(assert (=> b!1361808 m!1246859))

(declare-fun m!1246861 () Bool)

(assert (=> b!1361817 m!1246861))

(declare-fun m!1246863 () Bool)

(assert (=> b!1361813 m!1246863))

(declare-fun m!1246865 () Bool)

(assert (=> b!1361805 m!1246865))

(declare-fun m!1246867 () Bool)

(assert (=> b!1361809 m!1246867))

(declare-fun m!1246869 () Bool)

(assert (=> b!1361812 m!1246869))

(declare-fun m!1246871 () Bool)

(assert (=> b!1361818 m!1246871))

(assert (=> b!1361804 m!1246857))

(assert (=> b!1361804 m!1246857))

(declare-fun m!1246873 () Bool)

(assert (=> b!1361804 m!1246873))

(declare-fun m!1246875 () Bool)

(assert (=> b!1361810 m!1246875))

(declare-fun m!1246877 () Bool)

(assert (=> b!1361806 m!1246877))

(assert (=> b!1361806 m!1246857))

(assert (=> b!1361806 m!1246873))

(declare-fun m!1246879 () Bool)

(assert (=> b!1361806 m!1246879))

(declare-fun m!1246881 () Bool)

(assert (=> b!1361806 m!1246881))

(assert (=> b!1361806 m!1246857))

(assert (=> b!1361806 m!1246873))

(declare-fun m!1246883 () Bool)

(assert (=> b!1361806 m!1246883))

(check-sat (not start!114880) (not b!1361809) (not b!1361812) (not b!1361815) (not b!1361807) (not b!1361814) (not b!1361817) (not b!1361813) (not b!1361818) (not b!1361810) (not b!1361804) (not b!1361805) (not b!1361808) (not b!1361806))
(check-sat)
