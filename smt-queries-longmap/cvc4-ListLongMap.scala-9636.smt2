; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113958 () Bool)

(assert start!113958)

(declare-fun b!1351910 () Bool)

(declare-fun res!897343 () Bool)

(declare-fun e!768631 () Bool)

(assert (=> b!1351910 (=> (not res!897343) (not e!768631))))

(declare-datatypes ((List!31559 0))(
  ( (Nil!31556) (Cons!31555 (h!32764 (_ BitVec 64)) (t!46217 List!31559)) )
))
(declare-fun acc!759 () List!31559)

(declare-datatypes ((array!92140 0))(
  ( (array!92141 (arr!44518 (Array (_ BitVec 32) (_ BitVec 64))) (size!45068 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92140)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92140 (_ BitVec 32) List!31559) Bool)

(assert (=> b!1351910 (= res!897343 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1351911 () Bool)

(declare-fun res!897338 () Bool)

(assert (=> b!1351911 (=> (not res!897338) (not e!768631))))

(declare-fun contains!9268 (List!31559 (_ BitVec 64)) Bool)

(assert (=> b!1351911 (= res!897338 (not (contains!9268 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1351912 () Bool)

(declare-fun res!897337 () Bool)

(assert (=> b!1351912 (=> (not res!897337) (not e!768631))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1351912 (= res!897337 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1351913 () Bool)

(declare-datatypes ((Unit!44295 0))(
  ( (Unit!44296) )
))
(declare-fun e!768634 () Unit!44295)

(declare-fun lt!597367 () Unit!44295)

(assert (=> b!1351913 (= e!768634 lt!597367)))

(declare-fun lt!597370 () Unit!44295)

(declare-fun lemmaListSubSeqRefl!0 (List!31559) Unit!44295)

(assert (=> b!1351913 (= lt!597370 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!688 (List!31559 List!31559) Bool)

(assert (=> b!1351913 (subseq!688 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92140 List!31559 List!31559 (_ BitVec 32)) Unit!44295)

(declare-fun $colon$colon!703 (List!31559 (_ BitVec 64)) List!31559)

(assert (=> b!1351913 (= lt!597367 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!703 acc!759 (select (arr!44518 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1351913 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1351914 () Bool)

(declare-fun e!768633 () Bool)

(assert (=> b!1351914 (= e!768631 e!768633)))

(declare-fun res!897341 () Bool)

(assert (=> b!1351914 (=> (not res!897341) (not e!768633))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1351914 (= res!897341 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!597368 () Unit!44295)

(assert (=> b!1351914 (= lt!597368 e!768634)))

(declare-fun c!126728 () Bool)

(assert (=> b!1351914 (= c!126728 (validKeyInArray!0 (select (arr!44518 a!3742) from!3120)))))

(declare-fun b!1351915 () Bool)

(declare-fun res!897342 () Bool)

(assert (=> b!1351915 (=> (not res!897342) (not e!768631))))

(assert (=> b!1351915 (= res!897342 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45068 a!3742)))))

(declare-fun b!1351916 () Bool)

(assert (=> b!1351916 (= e!768633 false)))

(declare-fun lt!597369 () Bool)

(assert (=> b!1351916 (= lt!597369 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun res!897335 () Bool)

(assert (=> start!113958 (=> (not res!897335) (not e!768631))))

(assert (=> start!113958 (= res!897335 (and (bvslt (size!45068 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45068 a!3742))))))

(assert (=> start!113958 e!768631))

(assert (=> start!113958 true))

(declare-fun array_inv!33546 (array!92140) Bool)

(assert (=> start!113958 (array_inv!33546 a!3742)))

(declare-fun b!1351917 () Bool)

(declare-fun res!897334 () Bool)

(assert (=> b!1351917 (=> (not res!897334) (not e!768631))))

(assert (=> b!1351917 (= res!897334 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31556))))

(declare-fun b!1351918 () Bool)

(declare-fun res!897340 () Bool)

(assert (=> b!1351918 (=> (not res!897340) (not e!768631))))

(assert (=> b!1351918 (= res!897340 (not (contains!9268 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1351919 () Bool)

(declare-fun Unit!44297 () Unit!44295)

(assert (=> b!1351919 (= e!768634 Unit!44297)))

(declare-fun b!1351920 () Bool)

(declare-fun res!897339 () Bool)

(assert (=> b!1351920 (=> (not res!897339) (not e!768631))))

(declare-fun noDuplicate!2125 (List!31559) Bool)

(assert (=> b!1351920 (= res!897339 (noDuplicate!2125 acc!759))))

(declare-fun b!1351921 () Bool)

(declare-fun res!897336 () Bool)

(assert (=> b!1351921 (=> (not res!897336) (not e!768631))))

(assert (=> b!1351921 (= res!897336 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45068 a!3742))))))

(assert (= (and start!113958 res!897335) b!1351920))

(assert (= (and b!1351920 res!897339) b!1351911))

(assert (= (and b!1351911 res!897338) b!1351918))

(assert (= (and b!1351918 res!897340) b!1351917))

(assert (= (and b!1351917 res!897334) b!1351910))

(assert (= (and b!1351910 res!897343) b!1351921))

(assert (= (and b!1351921 res!897336) b!1351912))

(assert (= (and b!1351912 res!897337) b!1351915))

(assert (= (and b!1351915 res!897342) b!1351914))

(assert (= (and b!1351914 c!126728) b!1351913))

(assert (= (and b!1351914 (not c!126728)) b!1351919))

(assert (= (and b!1351914 res!897341) b!1351916))

(declare-fun m!1238841 () Bool)

(assert (=> start!113958 m!1238841))

(declare-fun m!1238843 () Bool)

(assert (=> b!1351916 m!1238843))

(declare-fun m!1238845 () Bool)

(assert (=> b!1351910 m!1238845))

(declare-fun m!1238847 () Bool)

(assert (=> b!1351911 m!1238847))

(declare-fun m!1238849 () Bool)

(assert (=> b!1351913 m!1238849))

(declare-fun m!1238851 () Bool)

(assert (=> b!1351913 m!1238851))

(declare-fun m!1238853 () Bool)

(assert (=> b!1351913 m!1238853))

(declare-fun m!1238855 () Bool)

(assert (=> b!1351913 m!1238855))

(assert (=> b!1351913 m!1238843))

(assert (=> b!1351913 m!1238851))

(assert (=> b!1351913 m!1238853))

(declare-fun m!1238857 () Bool)

(assert (=> b!1351913 m!1238857))

(declare-fun m!1238859 () Bool)

(assert (=> b!1351918 m!1238859))

(declare-fun m!1238861 () Bool)

(assert (=> b!1351912 m!1238861))

(declare-fun m!1238863 () Bool)

(assert (=> b!1351920 m!1238863))

(declare-fun m!1238865 () Bool)

(assert (=> b!1351917 m!1238865))

(assert (=> b!1351914 m!1238851))

(assert (=> b!1351914 m!1238851))

(declare-fun m!1238867 () Bool)

(assert (=> b!1351914 m!1238867))

(push 1)

(assert (not b!1351912))

(assert (not b!1351910))

