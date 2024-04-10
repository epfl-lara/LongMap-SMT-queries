; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114094 () Bool)

(assert start!114094)

(declare-fun b!1354833 () Bool)

(declare-fun e!769553 () Bool)

(assert (=> b!1354833 (= e!769553 (not true))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun i!1404 () (_ BitVec 32))

(declare-datatypes ((List!31627 0))(
  ( (Nil!31624) (Cons!31623 (h!32832 (_ BitVec 64)) (t!46285 List!31627)) )
))
(declare-fun lt!598392 () List!31627)

(declare-datatypes ((array!92276 0))(
  ( (array!92277 (arr!44586 (Array (_ BitVec 32) (_ BitVec 64))) (size!45136 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92276)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92276 (_ BitVec 32) List!31627) Bool)

(assert (=> b!1354833 (arrayNoDuplicates!0 (array!92277 (store (arr!44586 a!3742) i!1404 l!3587) (size!45136 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) lt!598392)))

(declare-datatypes ((Unit!44499 0))(
  ( (Unit!44500) )
))
(declare-fun lt!598395 () Unit!44499)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92276 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31627) Unit!44499)

(assert (=> b!1354833 (= lt!598395 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) lt!598392))))

(declare-fun b!1354834 () Bool)

(declare-fun e!769552 () Unit!44499)

(declare-fun Unit!44501 () Unit!44499)

(assert (=> b!1354834 (= e!769552 Unit!44501)))

(declare-fun b!1354835 () Bool)

(declare-fun res!899858 () Bool)

(assert (=> b!1354835 (=> (not res!899858) (not e!769553))))

(declare-fun contains!9336 (List!31627 (_ BitVec 64)) Bool)

(assert (=> b!1354835 (= res!899858 (not (contains!9336 lt!598392 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354836 () Bool)

(declare-fun res!899854 () Bool)

(declare-fun e!769554 () Bool)

(assert (=> b!1354836 (=> (not res!899854) (not e!769554))))

(declare-fun acc!759 () List!31627)

(assert (=> b!1354836 (= res!899854 (not (contains!9336 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354837 () Bool)

(declare-fun res!899855 () Bool)

(assert (=> b!1354837 (=> (not res!899855) (not e!769554))))

(assert (=> b!1354837 (= res!899855 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31624))))

(declare-fun b!1354838 () Bool)

(declare-fun res!899861 () Bool)

(assert (=> b!1354838 (=> (not res!899861) (not e!769554))))

(assert (=> b!1354838 (= res!899861 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45136 a!3742)))))

(declare-fun b!1354839 () Bool)

(declare-fun res!899856 () Bool)

(assert (=> b!1354839 (=> (not res!899856) (not e!769554))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1354839 (= res!899856 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1354840 () Bool)

(declare-fun res!899860 () Bool)

(assert (=> b!1354840 (=> (not res!899860) (not e!769554))))

(declare-fun noDuplicate!2193 (List!31627) Bool)

(assert (=> b!1354840 (= res!899860 (noDuplicate!2193 acc!759))))

(declare-fun b!1354841 () Bool)

(declare-fun res!899853 () Bool)

(assert (=> b!1354841 (=> (not res!899853) (not e!769554))))

(assert (=> b!1354841 (= res!899853 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1354842 () Bool)

(declare-fun res!899851 () Bool)

(assert (=> b!1354842 (=> (not res!899851) (not e!769553))))

(assert (=> b!1354842 (= res!899851 (not (contains!9336 lt!598392 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354843 () Bool)

(declare-fun res!899863 () Bool)

(assert (=> b!1354843 (=> (not res!899863) (not e!769554))))

(assert (=> b!1354843 (= res!899863 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45136 a!3742))))))

(declare-fun b!1354845 () Bool)

(declare-fun lt!598394 () Unit!44499)

(assert (=> b!1354845 (= e!769552 lt!598394)))

(declare-fun lt!598393 () Unit!44499)

(declare-fun lemmaListSubSeqRefl!0 (List!31627) Unit!44499)

(assert (=> b!1354845 (= lt!598393 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!756 (List!31627 List!31627) Bool)

(assert (=> b!1354845 (subseq!756 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92276 List!31627 List!31627 (_ BitVec 32)) Unit!44499)

(declare-fun $colon$colon!771 (List!31627 (_ BitVec 64)) List!31627)

(assert (=> b!1354845 (= lt!598394 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!771 acc!759 (select (arr!44586 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1354845 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1354846 () Bool)

(declare-fun e!769551 () Bool)

(assert (=> b!1354846 (= e!769554 e!769551)))

(declare-fun res!899849 () Bool)

(assert (=> b!1354846 (=> (not res!899849) (not e!769551))))

(declare-fun lt!598391 () Bool)

(assert (=> b!1354846 (= res!899849 (and (not (= from!3120 i!1404)) lt!598391))))

(declare-fun lt!598396 () Unit!44499)

(assert (=> b!1354846 (= lt!598396 e!769552)))

(declare-fun c!126932 () Bool)

(assert (=> b!1354846 (= c!126932 lt!598391)))

(assert (=> b!1354846 (= lt!598391 (validKeyInArray!0 (select (arr!44586 a!3742) from!3120)))))

(declare-fun b!1354847 () Bool)

(declare-fun res!899850 () Bool)

(assert (=> b!1354847 (=> (not res!899850) (not e!769553))))

(assert (=> b!1354847 (= res!899850 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!598392))))

(declare-fun b!1354848 () Bool)

(assert (=> b!1354848 (= e!769551 e!769553)))

(declare-fun res!899852 () Bool)

(assert (=> b!1354848 (=> (not res!899852) (not e!769553))))

(assert (=> b!1354848 (= res!899852 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(assert (=> b!1354848 (= lt!598392 ($colon$colon!771 acc!759 (select (arr!44586 a!3742) from!3120)))))

(declare-fun b!1354849 () Bool)

(declare-fun res!899862 () Bool)

(assert (=> b!1354849 (=> (not res!899862) (not e!769554))))

(assert (=> b!1354849 (= res!899862 (not (contains!9336 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354844 () Bool)

(declare-fun res!899859 () Bool)

(assert (=> b!1354844 (=> (not res!899859) (not e!769553))))

(assert (=> b!1354844 (= res!899859 (noDuplicate!2193 lt!598392))))

(declare-fun res!899857 () Bool)

(assert (=> start!114094 (=> (not res!899857) (not e!769554))))

(assert (=> start!114094 (= res!899857 (and (bvslt (size!45136 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45136 a!3742))))))

(assert (=> start!114094 e!769554))

(assert (=> start!114094 true))

(declare-fun array_inv!33614 (array!92276) Bool)

(assert (=> start!114094 (array_inv!33614 a!3742)))

(assert (= (and start!114094 res!899857) b!1354840))

(assert (= (and b!1354840 res!899860) b!1354849))

(assert (= (and b!1354849 res!899862) b!1354836))

(assert (= (and b!1354836 res!899854) b!1354837))

(assert (= (and b!1354837 res!899855) b!1354841))

(assert (= (and b!1354841 res!899853) b!1354843))

(assert (= (and b!1354843 res!899863) b!1354839))

(assert (= (and b!1354839 res!899856) b!1354838))

(assert (= (and b!1354838 res!899861) b!1354846))

(assert (= (and b!1354846 c!126932) b!1354845))

(assert (= (and b!1354846 (not c!126932)) b!1354834))

(assert (= (and b!1354846 res!899849) b!1354848))

(assert (= (and b!1354848 res!899852) b!1354844))

(assert (= (and b!1354844 res!899859) b!1354842))

(assert (= (and b!1354842 res!899851) b!1354835))

(assert (= (and b!1354835 res!899858) b!1354847))

(assert (= (and b!1354847 res!899850) b!1354833))

(declare-fun m!1241131 () Bool)

(assert (=> start!114094 m!1241131))

(declare-fun m!1241133 () Bool)

(assert (=> b!1354842 m!1241133))

(declare-fun m!1241135 () Bool)

(assert (=> b!1354844 m!1241135))

(declare-fun m!1241137 () Bool)

(assert (=> b!1354835 m!1241137))

(declare-fun m!1241139 () Bool)

(assert (=> b!1354847 m!1241139))

(declare-fun m!1241141 () Bool)

(assert (=> b!1354833 m!1241141))

(declare-fun m!1241143 () Bool)

(assert (=> b!1354833 m!1241143))

(declare-fun m!1241145 () Bool)

(assert (=> b!1354833 m!1241145))

(declare-fun m!1241147 () Bool)

(assert (=> b!1354839 m!1241147))

(declare-fun m!1241149 () Bool)

(assert (=> b!1354841 m!1241149))

(declare-fun m!1241151 () Bool)

(assert (=> b!1354848 m!1241151))

(assert (=> b!1354848 m!1241151))

(declare-fun m!1241153 () Bool)

(assert (=> b!1354848 m!1241153))

(assert (=> b!1354846 m!1241151))

(assert (=> b!1354846 m!1241151))

(declare-fun m!1241155 () Bool)

(assert (=> b!1354846 m!1241155))

(declare-fun m!1241157 () Bool)

(assert (=> b!1354840 m!1241157))

(declare-fun m!1241159 () Bool)

(assert (=> b!1354849 m!1241159))

(declare-fun m!1241161 () Bool)

(assert (=> b!1354836 m!1241161))

(declare-fun m!1241163 () Bool)

(assert (=> b!1354845 m!1241163))

(assert (=> b!1354845 m!1241151))

(assert (=> b!1354845 m!1241153))

(declare-fun m!1241165 () Bool)

(assert (=> b!1354845 m!1241165))

(declare-fun m!1241167 () Bool)

(assert (=> b!1354845 m!1241167))

(assert (=> b!1354845 m!1241151))

(assert (=> b!1354845 m!1241153))

(declare-fun m!1241169 () Bool)

(assert (=> b!1354845 m!1241169))

(declare-fun m!1241171 () Bool)

(assert (=> b!1354837 m!1241171))

(check-sat (not b!1354835) (not b!1354842) (not b!1354844) (not b!1354849) (not b!1354847) (not b!1354833) (not b!1354839) (not b!1354845) (not b!1354837) (not b!1354846) (not b!1354841) (not b!1354836) (not b!1354848) (not start!114094) (not b!1354840))
(check-sat)
