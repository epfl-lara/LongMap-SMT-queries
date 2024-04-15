; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114056 () Bool)

(assert start!114056)

(declare-fun b!1353828 () Bool)

(declare-fun res!899012 () Bool)

(declare-fun e!769235 () Bool)

(assert (=> b!1353828 (=> (not res!899012) (not e!769235))))

(declare-datatypes ((List!31661 0))(
  ( (Nil!31658) (Cons!31657 (h!32866 (_ BitVec 64)) (t!46311 List!31661)) )
))
(declare-fun acc!759 () List!31661)

(declare-fun contains!9281 (List!31661 (_ BitVec 64)) Bool)

(assert (=> b!1353828 (= res!899012 (not (contains!9281 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353829 () Bool)

(declare-datatypes ((Unit!44283 0))(
  ( (Unit!44284) )
))
(declare-fun e!769236 () Unit!44283)

(declare-fun Unit!44285 () Unit!44283)

(assert (=> b!1353829 (= e!769236 Unit!44285)))

(declare-fun b!1353830 () Bool)

(declare-fun res!899008 () Bool)

(assert (=> b!1353830 (=> (not res!899008) (not e!769235))))

(declare-fun noDuplicate!2196 (List!31661) Bool)

(assert (=> b!1353830 (= res!899008 (noDuplicate!2196 acc!759))))

(declare-fun res!899009 () Bool)

(assert (=> start!114056 (=> (not res!899009) (not e!769235))))

(declare-datatypes ((array!92187 0))(
  ( (array!92188 (arr!44542 (Array (_ BitVec 32) (_ BitVec 64))) (size!45094 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92187)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114056 (= res!899009 (and (bvslt (size!45094 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45094 a!3742))))))

(assert (=> start!114056 e!769235))

(assert (=> start!114056 true))

(declare-fun array_inv!33775 (array!92187) Bool)

(assert (=> start!114056 (array_inv!33775 a!3742)))

(declare-fun b!1353831 () Bool)

(declare-fun res!899004 () Bool)

(assert (=> b!1353831 (=> (not res!899004) (not e!769235))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1353831 (= res!899004 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1353832 () Bool)

(declare-fun res!899010 () Bool)

(declare-fun e!769237 () Bool)

(assert (=> b!1353832 (=> (not res!899010) (not e!769237))))

(declare-fun lt!597866 () List!31661)

(assert (=> b!1353832 (= res!899010 (not (contains!9281 lt!597866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353833 () Bool)

(declare-fun lt!597865 () Unit!44283)

(assert (=> b!1353833 (= e!769236 lt!597865)))

(declare-fun lt!597863 () Unit!44283)

(declare-fun lemmaListSubSeqRefl!0 (List!31661) Unit!44283)

(assert (=> b!1353833 (= lt!597863 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!737 (List!31661 List!31661) Bool)

(assert (=> b!1353833 (subseq!737 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92187 List!31661 List!31661 (_ BitVec 32)) Unit!44283)

(declare-fun $colon$colon!754 (List!31661 (_ BitVec 64)) List!31661)

(assert (=> b!1353833 (= lt!597865 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!754 acc!759 (select (arr!44542 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92187 (_ BitVec 32) List!31661) Bool)

(assert (=> b!1353833 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1353834 () Bool)

(declare-fun res!899007 () Bool)

(assert (=> b!1353834 (=> (not res!899007) (not e!769235))))

(assert (=> b!1353834 (= res!899007 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1353835 () Bool)

(declare-fun e!769233 () Bool)

(assert (=> b!1353835 (= e!769233 e!769237)))

(declare-fun res!899001 () Bool)

(assert (=> b!1353835 (=> (not res!899001) (not e!769237))))

(assert (=> b!1353835 (= res!899001 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(assert (=> b!1353835 (= lt!597866 ($colon$colon!754 acc!759 (select (arr!44542 a!3742) from!3120)))))

(declare-fun b!1353836 () Bool)

(declare-fun res!899011 () Bool)

(assert (=> b!1353836 (=> (not res!899011) (not e!769235))))

(assert (=> b!1353836 (= res!899011 (not (contains!9281 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353837 () Bool)

(declare-fun res!898999 () Bool)

(assert (=> b!1353837 (=> (not res!898999) (not e!769235))))

(assert (=> b!1353837 (= res!898999 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45094 a!3742)))))

(declare-fun b!1353838 () Bool)

(declare-fun res!899006 () Bool)

(assert (=> b!1353838 (=> (not res!899006) (not e!769235))))

(assert (=> b!1353838 (= res!899006 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31658))))

(declare-fun b!1353839 () Bool)

(declare-fun res!899003 () Bool)

(assert (=> b!1353839 (=> (not res!899003) (not e!769235))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1353839 (= res!899003 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45094 a!3742))))))

(declare-fun b!1353840 () Bool)

(assert (=> b!1353840 (= e!769237 false)))

(declare-fun lt!597868 () Bool)

(assert (=> b!1353840 (= lt!597868 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!597866))))

(declare-fun b!1353841 () Bool)

(assert (=> b!1353841 (= e!769235 e!769233)))

(declare-fun res!899005 () Bool)

(assert (=> b!1353841 (=> (not res!899005) (not e!769233))))

(declare-fun lt!597864 () Bool)

(assert (=> b!1353841 (= res!899005 (and (not (= from!3120 i!1404)) lt!597864))))

(declare-fun lt!597867 () Unit!44283)

(assert (=> b!1353841 (= lt!597867 e!769236)))

(declare-fun c!126857 () Bool)

(assert (=> b!1353841 (= c!126857 lt!597864)))

(assert (=> b!1353841 (= lt!597864 (validKeyInArray!0 (select (arr!44542 a!3742) from!3120)))))

(declare-fun b!1353842 () Bool)

(declare-fun res!899002 () Bool)

(assert (=> b!1353842 (=> (not res!899002) (not e!769237))))

(assert (=> b!1353842 (= res!899002 (not (contains!9281 lt!597866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353843 () Bool)

(declare-fun res!899000 () Bool)

(assert (=> b!1353843 (=> (not res!899000) (not e!769237))))

(assert (=> b!1353843 (= res!899000 (noDuplicate!2196 lt!597866))))

(assert (= (and start!114056 res!899009) b!1353830))

(assert (= (and b!1353830 res!899008) b!1353836))

(assert (= (and b!1353836 res!899011) b!1353828))

(assert (= (and b!1353828 res!899012) b!1353838))

(assert (= (and b!1353838 res!899006) b!1353834))

(assert (= (and b!1353834 res!899007) b!1353839))

(assert (= (and b!1353839 res!899003) b!1353831))

(assert (= (and b!1353831 res!899004) b!1353837))

(assert (= (and b!1353837 res!898999) b!1353841))

(assert (= (and b!1353841 c!126857) b!1353833))

(assert (= (and b!1353841 (not c!126857)) b!1353829))

(assert (= (and b!1353841 res!899005) b!1353835))

(assert (= (and b!1353835 res!899001) b!1353843))

(assert (= (and b!1353843 res!899000) b!1353842))

(assert (= (and b!1353842 res!899002) b!1353832))

(assert (= (and b!1353832 res!899010) b!1353840))

(declare-fun m!1239889 () Bool)

(assert (=> b!1353833 m!1239889))

(declare-fun m!1239891 () Bool)

(assert (=> b!1353833 m!1239891))

(declare-fun m!1239893 () Bool)

(assert (=> b!1353833 m!1239893))

(declare-fun m!1239895 () Bool)

(assert (=> b!1353833 m!1239895))

(declare-fun m!1239897 () Bool)

(assert (=> b!1353833 m!1239897))

(assert (=> b!1353833 m!1239891))

(assert (=> b!1353833 m!1239893))

(declare-fun m!1239899 () Bool)

(assert (=> b!1353833 m!1239899))

(declare-fun m!1239901 () Bool)

(assert (=> b!1353836 m!1239901))

(declare-fun m!1239903 () Bool)

(assert (=> b!1353831 m!1239903))

(declare-fun m!1239905 () Bool)

(assert (=> b!1353843 m!1239905))

(declare-fun m!1239907 () Bool)

(assert (=> b!1353834 m!1239907))

(assert (=> b!1353835 m!1239891))

(assert (=> b!1353835 m!1239891))

(assert (=> b!1353835 m!1239893))

(declare-fun m!1239909 () Bool)

(assert (=> b!1353828 m!1239909))

(declare-fun m!1239911 () Bool)

(assert (=> b!1353832 m!1239911))

(assert (=> b!1353841 m!1239891))

(assert (=> b!1353841 m!1239891))

(declare-fun m!1239913 () Bool)

(assert (=> b!1353841 m!1239913))

(declare-fun m!1239915 () Bool)

(assert (=> b!1353838 m!1239915))

(declare-fun m!1239917 () Bool)

(assert (=> start!114056 m!1239917))

(declare-fun m!1239919 () Bool)

(assert (=> b!1353842 m!1239919))

(declare-fun m!1239921 () Bool)

(assert (=> b!1353840 m!1239921))

(declare-fun m!1239923 () Bool)

(assert (=> b!1353830 m!1239923))

(check-sat (not b!1353843) (not start!114056) (not b!1353842) (not b!1353834) (not b!1353840) (not b!1353841) (not b!1353835) (not b!1353832) (not b!1353830) (not b!1353838) (not b!1353828) (not b!1353831) (not b!1353836) (not b!1353833))
(check-sat)
