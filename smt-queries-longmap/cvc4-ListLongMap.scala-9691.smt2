; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114486 () Bool)

(assert start!114486)

(declare-fun b!1358718 () Bool)

(declare-fun res!903327 () Bool)

(declare-fun e!771095 () Bool)

(assert (=> b!1358718 (=> (not res!903327) (not e!771095))))

(declare-datatypes ((array!92482 0))(
  ( (array!92483 (arr!44683 (Array (_ BitVec 32) (_ BitVec 64))) (size!45233 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92482)

(declare-datatypes ((List!31724 0))(
  ( (Nil!31721) (Cons!31720 (h!32929 (_ BitVec 64)) (t!46394 List!31724)) )
))
(declare-fun arrayNoDuplicates!0 (array!92482 (_ BitVec 32) List!31724) Bool)

(assert (=> b!1358718 (= res!903327 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31721))))

(declare-fun b!1358719 () Bool)

(declare-datatypes ((Unit!44709 0))(
  ( (Unit!44710) )
))
(declare-fun e!771097 () Unit!44709)

(declare-fun Unit!44711 () Unit!44709)

(assert (=> b!1358719 (= e!771097 Unit!44711)))

(declare-fun b!1358720 () Bool)

(declare-fun res!903324 () Bool)

(assert (=> b!1358720 (=> (not res!903324) (not e!771095))))

(declare-fun acc!759 () List!31724)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> b!1358720 (= res!903324 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1358721 () Bool)

(declare-fun res!903328 () Bool)

(assert (=> b!1358721 (=> (not res!903328) (not e!771095))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1358721 (= res!903328 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1358722 () Bool)

(declare-fun res!903325 () Bool)

(assert (=> b!1358722 (=> (not res!903325) (not e!771095))))

(declare-fun noDuplicate!2290 (List!31724) Bool)

(assert (=> b!1358722 (= res!903325 (noDuplicate!2290 acc!759))))

(declare-fun b!1358723 () Bool)

(declare-fun res!903321 () Bool)

(assert (=> b!1358723 (=> (not res!903321) (not e!771095))))

(declare-fun contains!9433 (List!31724 (_ BitVec 64)) Bool)

(assert (=> b!1358723 (= res!903321 (not (contains!9433 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1358724 () Bool)

(declare-fun lt!599415 () Unit!44709)

(assert (=> b!1358724 (= e!771097 lt!599415)))

(declare-fun lt!599416 () Unit!44709)

(declare-fun lemmaListSubSeqRefl!0 (List!31724) Unit!44709)

(assert (=> b!1358724 (= lt!599416 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!835 (List!31724 List!31724) Bool)

(assert (=> b!1358724 (subseq!835 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92482 List!31724 List!31724 (_ BitVec 32)) Unit!44709)

(declare-fun $colon$colon!838 (List!31724 (_ BitVec 64)) List!31724)

(assert (=> b!1358724 (= lt!599415 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!838 acc!759 (select (arr!44683 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1358724 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1358725 () Bool)

(declare-fun res!903326 () Bool)

(assert (=> b!1358725 (=> (not res!903326) (not e!771095))))

(assert (=> b!1358725 (= res!903326 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45233 a!3742)))))

(declare-fun b!1358726 () Bool)

(assert (=> b!1358726 (= e!771095 false)))

(declare-fun lt!599414 () Unit!44709)

(assert (=> b!1358726 (= lt!599414 e!771097)))

(declare-fun c!127139 () Bool)

(assert (=> b!1358726 (= c!127139 (validKeyInArray!0 (select (arr!44683 a!3742) from!3120)))))

(declare-fun res!903322 () Bool)

(assert (=> start!114486 (=> (not res!903322) (not e!771095))))

(assert (=> start!114486 (= res!903322 (and (bvslt (size!45233 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45233 a!3742))))))

(assert (=> start!114486 e!771095))

(assert (=> start!114486 true))

(declare-fun array_inv!33711 (array!92482) Bool)

(assert (=> start!114486 (array_inv!33711 a!3742)))

(declare-fun b!1358727 () Bool)

(declare-fun res!903323 () Bool)

(assert (=> b!1358727 (=> (not res!903323) (not e!771095))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1358727 (= res!903323 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45233 a!3742))))))

(declare-fun b!1358728 () Bool)

(declare-fun res!903320 () Bool)

(assert (=> b!1358728 (=> (not res!903320) (not e!771095))))

(assert (=> b!1358728 (= res!903320 (not (contains!9433 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!114486 res!903322) b!1358722))

(assert (= (and b!1358722 res!903325) b!1358723))

(assert (= (and b!1358723 res!903321) b!1358728))

(assert (= (and b!1358728 res!903320) b!1358718))

(assert (= (and b!1358718 res!903327) b!1358720))

(assert (= (and b!1358720 res!903324) b!1358727))

(assert (= (and b!1358727 res!903323) b!1358721))

(assert (= (and b!1358721 res!903328) b!1358725))

(assert (= (and b!1358725 res!903326) b!1358726))

(assert (= (and b!1358726 c!127139) b!1358724))

(assert (= (and b!1358726 (not c!127139)) b!1358719))

(declare-fun m!1244259 () Bool)

(assert (=> b!1358722 m!1244259))

(declare-fun m!1244261 () Bool)

(assert (=> b!1358726 m!1244261))

(assert (=> b!1358726 m!1244261))

(declare-fun m!1244263 () Bool)

(assert (=> b!1358726 m!1244263))

(declare-fun m!1244265 () Bool)

(assert (=> b!1358721 m!1244265))

(declare-fun m!1244267 () Bool)

(assert (=> start!114486 m!1244267))

(declare-fun m!1244269 () Bool)

(assert (=> b!1358723 m!1244269))

(declare-fun m!1244271 () Bool)

(assert (=> b!1358724 m!1244271))

(assert (=> b!1358724 m!1244261))

(declare-fun m!1244273 () Bool)

(assert (=> b!1358724 m!1244273))

(declare-fun m!1244275 () Bool)

(assert (=> b!1358724 m!1244275))

(declare-fun m!1244277 () Bool)

(assert (=> b!1358724 m!1244277))

(assert (=> b!1358724 m!1244261))

(assert (=> b!1358724 m!1244273))

(declare-fun m!1244279 () Bool)

(assert (=> b!1358724 m!1244279))

(declare-fun m!1244281 () Bool)

(assert (=> b!1358728 m!1244281))

(declare-fun m!1244283 () Bool)

(assert (=> b!1358718 m!1244283))

(declare-fun m!1244285 () Bool)

(assert (=> b!1358720 m!1244285))

(push 1)

(assert (not b!1358724))

(assert (not start!114486))

(assert (not b!1358718))

(assert (not b!1358726))

(assert (not b!1358721))

(assert (not b!1358728))

(assert (not b!1358723))

(assert (not b!1358722))

(assert (not b!1358720))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

