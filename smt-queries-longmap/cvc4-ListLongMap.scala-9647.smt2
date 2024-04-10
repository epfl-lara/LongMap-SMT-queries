; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114024 () Bool)

(assert start!114024)

(declare-fun b!1353133 () Bool)

(declare-fun res!898365 () Bool)

(declare-fun e!769027 () Bool)

(assert (=> b!1353133 (=> (not res!898365) (not e!769027))))

(declare-datatypes ((array!92206 0))(
  ( (array!92207 (arr!44551 (Array (_ BitVec 32) (_ BitVec 64))) (size!45101 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92206)

(declare-datatypes ((List!31592 0))(
  ( (Nil!31589) (Cons!31588 (h!32797 (_ BitVec 64)) (t!46250 List!31592)) )
))
(declare-fun arrayNoDuplicates!0 (array!92206 (_ BitVec 32) List!31592) Bool)

(assert (=> b!1353133 (= res!898365 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31589))))

(declare-fun b!1353134 () Bool)

(declare-fun res!898368 () Bool)

(assert (=> b!1353134 (=> (not res!898368) (not e!769027))))

(declare-fun acc!759 () List!31592)

(declare-fun contains!9301 (List!31592 (_ BitVec 64)) Bool)

(assert (=> b!1353134 (= res!898368 (not (contains!9301 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353135 () Bool)

(declare-fun res!898359 () Bool)

(assert (=> b!1353135 (=> (not res!898359) (not e!769027))))

(declare-fun noDuplicate!2158 (List!31592) Bool)

(assert (=> b!1353135 (= res!898359 (noDuplicate!2158 acc!759))))

(declare-fun b!1353136 () Bool)

(declare-fun e!769028 () Bool)

(assert (=> b!1353136 (= e!769027 e!769028)))

(declare-fun res!898360 () Bool)

(assert (=> b!1353136 (=> (not res!898360) (not e!769028))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1353136 (= res!898360 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!44394 0))(
  ( (Unit!44395) )
))
(declare-fun lt!597763 () Unit!44394)

(declare-fun e!769030 () Unit!44394)

(assert (=> b!1353136 (= lt!597763 e!769030)))

(declare-fun c!126827 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1353136 (= c!126827 (validKeyInArray!0 (select (arr!44551 a!3742) from!3120)))))

(declare-fun b!1353137 () Bool)

(declare-fun lt!597764 () Unit!44394)

(assert (=> b!1353137 (= e!769030 lt!597764)))

(declare-fun lt!597765 () Unit!44394)

(declare-fun lemmaListSubSeqRefl!0 (List!31592) Unit!44394)

(assert (=> b!1353137 (= lt!597765 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!721 (List!31592 List!31592) Bool)

(assert (=> b!1353137 (subseq!721 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92206 List!31592 List!31592 (_ BitVec 32)) Unit!44394)

(declare-fun $colon$colon!736 (List!31592 (_ BitVec 64)) List!31592)

(assert (=> b!1353137 (= lt!597764 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!736 acc!759 (select (arr!44551 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1353137 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1353138 () Bool)

(declare-fun res!898369 () Bool)

(assert (=> b!1353138 (=> (not res!898369) (not e!769027))))

(assert (=> b!1353138 (= res!898369 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1353139 () Bool)

(declare-fun res!898363 () Bool)

(assert (=> b!1353139 (=> (not res!898363) (not e!769027))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1353139 (= res!898363 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1353140 () Bool)

(declare-fun res!898366 () Bool)

(assert (=> b!1353140 (=> (not res!898366) (not e!769027))))

(assert (=> b!1353140 (= res!898366 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45101 a!3742))))))

(declare-fun b!1353141 () Bool)

(assert (=> b!1353141 (= e!769028 (not true))))

(assert (=> b!1353141 (arrayNoDuplicates!0 (array!92207 (store (arr!44551 a!3742) i!1404 l!3587) (size!45101 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun lt!597766 () Unit!44394)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92206 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31592) Unit!44394)

(assert (=> b!1353141 (= lt!597766 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1353142 () Bool)

(declare-fun Unit!44396 () Unit!44394)

(assert (=> b!1353142 (= e!769030 Unit!44396)))

(declare-fun b!1353143 () Bool)

(declare-fun res!898362 () Bool)

(assert (=> b!1353143 (=> (not res!898362) (not e!769027))))

(assert (=> b!1353143 (= res!898362 (not (contains!9301 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!898364 () Bool)

(assert (=> start!114024 (=> (not res!898364) (not e!769027))))

(assert (=> start!114024 (= res!898364 (and (bvslt (size!45101 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45101 a!3742))))))

(assert (=> start!114024 e!769027))

(assert (=> start!114024 true))

(declare-fun array_inv!33579 (array!92206) Bool)

(assert (=> start!114024 (array_inv!33579 a!3742)))

(declare-fun b!1353144 () Bool)

(declare-fun res!898367 () Bool)

(assert (=> b!1353144 (=> (not res!898367) (not e!769027))))

(assert (=> b!1353144 (= res!898367 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45101 a!3742)))))

(declare-fun b!1353145 () Bool)

(declare-fun res!898361 () Bool)

(assert (=> b!1353145 (=> (not res!898361) (not e!769028))))

(assert (=> b!1353145 (= res!898361 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(assert (= (and start!114024 res!898364) b!1353135))

(assert (= (and b!1353135 res!898359) b!1353143))

(assert (= (and b!1353143 res!898362) b!1353134))

(assert (= (and b!1353134 res!898368) b!1353133))

(assert (= (and b!1353133 res!898365) b!1353138))

(assert (= (and b!1353138 res!898369) b!1353140))

(assert (= (and b!1353140 res!898366) b!1353139))

(assert (= (and b!1353139 res!898363) b!1353144))

(assert (= (and b!1353144 res!898367) b!1353136))

(assert (= (and b!1353136 c!126827) b!1353137))

(assert (= (and b!1353136 (not c!126827)) b!1353142))

(assert (= (and b!1353136 res!898360) b!1353145))

(assert (= (and b!1353145 res!898361) b!1353141))

(declare-fun m!1239831 () Bool)

(assert (=> start!114024 m!1239831))

(declare-fun m!1239833 () Bool)

(assert (=> b!1353143 m!1239833))

(declare-fun m!1239835 () Bool)

(assert (=> b!1353139 m!1239835))

(declare-fun m!1239837 () Bool)

(assert (=> b!1353134 m!1239837))

(declare-fun m!1239839 () Bool)

(assert (=> b!1353136 m!1239839))

(assert (=> b!1353136 m!1239839))

(declare-fun m!1239841 () Bool)

(assert (=> b!1353136 m!1239841))

(declare-fun m!1239843 () Bool)

(assert (=> b!1353141 m!1239843))

(declare-fun m!1239845 () Bool)

(assert (=> b!1353141 m!1239845))

(declare-fun m!1239847 () Bool)

(assert (=> b!1353141 m!1239847))

(declare-fun m!1239849 () Bool)

(assert (=> b!1353145 m!1239849))

(declare-fun m!1239851 () Bool)

(assert (=> b!1353135 m!1239851))

(declare-fun m!1239853 () Bool)

(assert (=> b!1353138 m!1239853))

(declare-fun m!1239855 () Bool)

(assert (=> b!1353133 m!1239855))

(declare-fun m!1239857 () Bool)

(assert (=> b!1353137 m!1239857))

(assert (=> b!1353137 m!1239839))

(declare-fun m!1239859 () Bool)

(assert (=> b!1353137 m!1239859))

(declare-fun m!1239861 () Bool)

(assert (=> b!1353137 m!1239861))

(assert (=> b!1353137 m!1239849))

(assert (=> b!1353137 m!1239839))

(assert (=> b!1353137 m!1239859))

(declare-fun m!1239863 () Bool)

(assert (=> b!1353137 m!1239863))

(push 1)

(assert (not b!1353145))

