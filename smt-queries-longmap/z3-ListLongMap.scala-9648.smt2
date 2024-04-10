; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114028 () Bool)

(assert start!114028)

(declare-fun res!898440 () Bool)

(declare-fun e!769060 () Bool)

(assert (=> start!114028 (=> (not res!898440) (not e!769060))))

(declare-datatypes ((array!92210 0))(
  ( (array!92211 (arr!44553 (Array (_ BitVec 32) (_ BitVec 64))) (size!45103 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92210)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114028 (= res!898440 (and (bvslt (size!45103 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45103 a!3742))))))

(assert (=> start!114028 e!769060))

(assert (=> start!114028 true))

(declare-fun array_inv!33581 (array!92210) Bool)

(assert (=> start!114028 (array_inv!33581 a!3742)))

(declare-fun b!1353226 () Bool)

(declare-fun res!898445 () Bool)

(declare-fun e!769056 () Bool)

(assert (=> b!1353226 (=> (not res!898445) (not e!769056))))

(declare-datatypes ((List!31594 0))(
  ( (Nil!31591) (Cons!31590 (h!32799 (_ BitVec 64)) (t!46252 List!31594)) )
))
(declare-fun lt!597800 () List!31594)

(declare-fun contains!9303 (List!31594 (_ BitVec 64)) Bool)

(assert (=> b!1353226 (= res!898445 (not (contains!9303 lt!597800 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353227 () Bool)

(declare-fun res!898447 () Bool)

(assert (=> b!1353227 (=> (not res!898447) (not e!769056))))

(declare-fun noDuplicate!2160 (List!31594) Bool)

(assert (=> b!1353227 (= res!898447 (noDuplicate!2160 lt!597800))))

(declare-fun b!1353228 () Bool)

(declare-fun res!898450 () Bool)

(assert (=> b!1353228 (=> (not res!898450) (not e!769060))))

(declare-fun arrayNoDuplicates!0 (array!92210 (_ BitVec 32) List!31594) Bool)

(assert (=> b!1353228 (= res!898450 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31591))))

(declare-fun b!1353229 () Bool)

(declare-fun res!898444 () Bool)

(assert (=> b!1353229 (=> (not res!898444) (not e!769060))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1353229 (= res!898444 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1353230 () Bool)

(declare-fun res!898451 () Bool)

(assert (=> b!1353230 (=> (not res!898451) (not e!769060))))

(declare-fun acc!759 () List!31594)

(assert (=> b!1353230 (= res!898451 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1353231 () Bool)

(declare-fun e!769058 () Bool)

(assert (=> b!1353231 (= e!769060 e!769058)))

(declare-fun res!898452 () Bool)

(assert (=> b!1353231 (=> (not res!898452) (not e!769058))))

(declare-fun i!1404 () (_ BitVec 32))

(declare-fun lt!597797 () Bool)

(assert (=> b!1353231 (= res!898452 (and (not (= from!3120 i!1404)) lt!597797))))

(declare-datatypes ((Unit!44400 0))(
  ( (Unit!44401) )
))
(declare-fun lt!597798 () Unit!44400)

(declare-fun e!769059 () Unit!44400)

(assert (=> b!1353231 (= lt!597798 e!769059)))

(declare-fun c!126833 () Bool)

(assert (=> b!1353231 (= c!126833 lt!597797)))

(assert (=> b!1353231 (= lt!597797 (validKeyInArray!0 (select (arr!44553 a!3742) from!3120)))))

(declare-fun b!1353232 () Bool)

(assert (=> b!1353232 (= e!769056 false)))

(declare-fun lt!597801 () Bool)

(assert (=> b!1353232 (= lt!597801 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!597800))))

(declare-fun b!1353233 () Bool)

(declare-fun Unit!44402 () Unit!44400)

(assert (=> b!1353233 (= e!769059 Unit!44402)))

(declare-fun b!1353234 () Bool)

(declare-fun lt!597802 () Unit!44400)

(assert (=> b!1353234 (= e!769059 lt!597802)))

(declare-fun lt!597799 () Unit!44400)

(declare-fun lemmaListSubSeqRefl!0 (List!31594) Unit!44400)

(assert (=> b!1353234 (= lt!597799 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!723 (List!31594 List!31594) Bool)

(assert (=> b!1353234 (subseq!723 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92210 List!31594 List!31594 (_ BitVec 32)) Unit!44400)

(declare-fun $colon$colon!738 (List!31594 (_ BitVec 64)) List!31594)

(assert (=> b!1353234 (= lt!597802 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!738 acc!759 (select (arr!44553 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1353234 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1353235 () Bool)

(declare-fun res!898453 () Bool)

(assert (=> b!1353235 (=> (not res!898453) (not e!769056))))

(assert (=> b!1353235 (= res!898453 (not (contains!9303 lt!597800 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353236 () Bool)

(assert (=> b!1353236 (= e!769058 e!769056)))

(declare-fun res!898441 () Bool)

(assert (=> b!1353236 (=> (not res!898441) (not e!769056))))

(assert (=> b!1353236 (= res!898441 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(assert (=> b!1353236 (= lt!597800 ($colon$colon!738 acc!759 (select (arr!44553 a!3742) from!3120)))))

(declare-fun b!1353237 () Bool)

(declare-fun res!898442 () Bool)

(assert (=> b!1353237 (=> (not res!898442) (not e!769060))))

(assert (=> b!1353237 (= res!898442 (not (contains!9303 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353238 () Bool)

(declare-fun res!898448 () Bool)

(assert (=> b!1353238 (=> (not res!898448) (not e!769060))))

(assert (=> b!1353238 (= res!898448 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45103 a!3742)))))

(declare-fun b!1353239 () Bool)

(declare-fun res!898443 () Bool)

(assert (=> b!1353239 (=> (not res!898443) (not e!769060))))

(assert (=> b!1353239 (= res!898443 (noDuplicate!2160 acc!759))))

(declare-fun b!1353240 () Bool)

(declare-fun res!898446 () Bool)

(assert (=> b!1353240 (=> (not res!898446) (not e!769060))))

(assert (=> b!1353240 (= res!898446 (not (contains!9303 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353241 () Bool)

(declare-fun res!898449 () Bool)

(assert (=> b!1353241 (=> (not res!898449) (not e!769060))))

(assert (=> b!1353241 (= res!898449 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45103 a!3742))))))

(assert (= (and start!114028 res!898440) b!1353239))

(assert (= (and b!1353239 res!898443) b!1353237))

(assert (= (and b!1353237 res!898442) b!1353240))

(assert (= (and b!1353240 res!898446) b!1353228))

(assert (= (and b!1353228 res!898450) b!1353230))

(assert (= (and b!1353230 res!898451) b!1353241))

(assert (= (and b!1353241 res!898449) b!1353229))

(assert (= (and b!1353229 res!898444) b!1353238))

(assert (= (and b!1353238 res!898448) b!1353231))

(assert (= (and b!1353231 c!126833) b!1353234))

(assert (= (and b!1353231 (not c!126833)) b!1353233))

(assert (= (and b!1353231 res!898452) b!1353236))

(assert (= (and b!1353236 res!898441) b!1353227))

(assert (= (and b!1353227 res!898447) b!1353226))

(assert (= (and b!1353226 res!898445) b!1353235))

(assert (= (and b!1353235 res!898453) b!1353232))

(declare-fun m!1239901 () Bool)

(assert (=> b!1353229 m!1239901))

(declare-fun m!1239903 () Bool)

(assert (=> b!1353237 m!1239903))

(declare-fun m!1239905 () Bool)

(assert (=> b!1353234 m!1239905))

(declare-fun m!1239907 () Bool)

(assert (=> b!1353234 m!1239907))

(declare-fun m!1239909 () Bool)

(assert (=> b!1353234 m!1239909))

(declare-fun m!1239911 () Bool)

(assert (=> b!1353234 m!1239911))

(declare-fun m!1239913 () Bool)

(assert (=> b!1353234 m!1239913))

(assert (=> b!1353234 m!1239907))

(assert (=> b!1353234 m!1239909))

(declare-fun m!1239915 () Bool)

(assert (=> b!1353234 m!1239915))

(declare-fun m!1239917 () Bool)

(assert (=> b!1353227 m!1239917))

(declare-fun m!1239919 () Bool)

(assert (=> b!1353228 m!1239919))

(declare-fun m!1239921 () Bool)

(assert (=> start!114028 m!1239921))

(declare-fun m!1239923 () Bool)

(assert (=> b!1353235 m!1239923))

(declare-fun m!1239925 () Bool)

(assert (=> b!1353232 m!1239925))

(declare-fun m!1239927 () Bool)

(assert (=> b!1353240 m!1239927))

(declare-fun m!1239929 () Bool)

(assert (=> b!1353239 m!1239929))

(declare-fun m!1239931 () Bool)

(assert (=> b!1353230 m!1239931))

(assert (=> b!1353231 m!1239907))

(assert (=> b!1353231 m!1239907))

(declare-fun m!1239933 () Bool)

(assert (=> b!1353231 m!1239933))

(assert (=> b!1353236 m!1239907))

(assert (=> b!1353236 m!1239907))

(assert (=> b!1353236 m!1239909))

(declare-fun m!1239935 () Bool)

(assert (=> b!1353226 m!1239935))

(check-sat (not b!1353227) (not b!1353229) (not b!1353236) (not b!1353239) (not b!1353230) (not b!1353234) (not b!1353240) (not start!114028) (not b!1353226) (not b!1353232) (not b!1353237) (not b!1353231) (not b!1353235) (not b!1353228))
(check-sat)
