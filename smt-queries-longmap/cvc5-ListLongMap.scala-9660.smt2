; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114098 () Bool)

(assert start!114098)

(declare-fun b!1354935 () Bool)

(declare-fun e!769585 () Bool)

(declare-fun e!769583 () Bool)

(assert (=> b!1354935 (= e!769585 e!769583)))

(declare-fun res!899948 () Bool)

(assert (=> b!1354935 (=> (not res!899948) (not e!769583))))

(declare-fun lt!598427 () Bool)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1354935 (= res!899948 (and (not (= from!3120 i!1404)) lt!598427))))

(declare-datatypes ((Unit!44505 0))(
  ( (Unit!44506) )
))
(declare-fun lt!598432 () Unit!44505)

(declare-fun e!769581 () Unit!44505)

(assert (=> b!1354935 (= lt!598432 e!769581)))

(declare-fun c!126938 () Bool)

(assert (=> b!1354935 (= c!126938 lt!598427)))

(declare-datatypes ((array!92280 0))(
  ( (array!92281 (arr!44588 (Array (_ BitVec 32) (_ BitVec 64))) (size!45138 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92280)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1354935 (= lt!598427 (validKeyInArray!0 (select (arr!44588 a!3742) from!3120)))))

(declare-fun b!1354936 () Bool)

(declare-fun Unit!44507 () Unit!44505)

(assert (=> b!1354936 (= e!769581 Unit!44507)))

(declare-fun b!1354937 () Bool)

(declare-fun res!899949 () Bool)

(assert (=> b!1354937 (=> (not res!899949) (not e!769585))))

(assert (=> b!1354937 (= res!899949 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45138 a!3742))))))

(declare-fun b!1354938 () Bool)

(declare-fun res!899945 () Bool)

(assert (=> b!1354938 (=> (not res!899945) (not e!769585))))

(assert (=> b!1354938 (= res!899945 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45138 a!3742)))))

(declare-fun b!1354939 () Bool)

(declare-fun res!899939 () Bool)

(assert (=> b!1354939 (=> (not res!899939) (not e!769585))))

(declare-datatypes ((List!31629 0))(
  ( (Nil!31626) (Cons!31625 (h!32834 (_ BitVec 64)) (t!46287 List!31629)) )
))
(declare-fun arrayNoDuplicates!0 (array!92280 (_ BitVec 32) List!31629) Bool)

(assert (=> b!1354939 (= res!899939 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31626))))

(declare-fun b!1354940 () Bool)

(declare-fun res!899947 () Bool)

(assert (=> b!1354940 (=> (not res!899947) (not e!769585))))

(declare-fun acc!759 () List!31629)

(declare-fun contains!9338 (List!31629 (_ BitVec 64)) Bool)

(assert (=> b!1354940 (= res!899947 (not (contains!9338 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354942 () Bool)

(declare-fun res!899943 () Bool)

(declare-fun e!769584 () Bool)

(assert (=> b!1354942 (=> (not res!899943) (not e!769584))))

(declare-fun lt!598428 () List!31629)

(assert (=> b!1354942 (= res!899943 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!598428))))

(declare-fun b!1354943 () Bool)

(declare-fun res!899946 () Bool)

(assert (=> b!1354943 (=> (not res!899946) (not e!769584))))

(assert (=> b!1354943 (= res!899946 (not (contains!9338 lt!598428 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354944 () Bool)

(declare-fun res!899940 () Bool)

(assert (=> b!1354944 (=> (not res!899940) (not e!769584))))

(declare-fun noDuplicate!2195 (List!31629) Bool)

(assert (=> b!1354944 (= res!899940 (noDuplicate!2195 lt!598428))))

(declare-fun b!1354945 () Bool)

(declare-fun res!899952 () Bool)

(assert (=> b!1354945 (=> (not res!899952) (not e!769584))))

(assert (=> b!1354945 (= res!899952 (not (contains!9338 lt!598428 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354946 () Bool)

(declare-fun res!899942 () Bool)

(assert (=> b!1354946 (=> (not res!899942) (not e!769585))))

(assert (=> b!1354946 (= res!899942 (not (contains!9338 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354947 () Bool)

(assert (=> b!1354947 (= e!769584 (not true))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1354947 (arrayNoDuplicates!0 (array!92281 (store (arr!44588 a!3742) i!1404 l!3587) (size!45138 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) lt!598428)))

(declare-fun lt!598430 () Unit!44505)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92280 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31629) Unit!44505)

(assert (=> b!1354947 (= lt!598430 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) lt!598428))))

(declare-fun b!1354941 () Bool)

(declare-fun res!899941 () Bool)

(assert (=> b!1354941 (=> (not res!899941) (not e!769585))))

(assert (=> b!1354941 (= res!899941 (noDuplicate!2195 acc!759))))

(declare-fun res!899953 () Bool)

(assert (=> start!114098 (=> (not res!899953) (not e!769585))))

(assert (=> start!114098 (= res!899953 (and (bvslt (size!45138 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45138 a!3742))))))

(assert (=> start!114098 e!769585))

(assert (=> start!114098 true))

(declare-fun array_inv!33616 (array!92280) Bool)

(assert (=> start!114098 (array_inv!33616 a!3742)))

(declare-fun b!1354948 () Bool)

(declare-fun res!899944 () Bool)

(assert (=> b!1354948 (=> (not res!899944) (not e!769585))))

(assert (=> b!1354948 (= res!899944 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1354949 () Bool)

(declare-fun lt!598429 () Unit!44505)

(assert (=> b!1354949 (= e!769581 lt!598429)))

(declare-fun lt!598431 () Unit!44505)

(declare-fun lemmaListSubSeqRefl!0 (List!31629) Unit!44505)

(assert (=> b!1354949 (= lt!598431 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!758 (List!31629 List!31629) Bool)

(assert (=> b!1354949 (subseq!758 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92280 List!31629 List!31629 (_ BitVec 32)) Unit!44505)

(declare-fun $colon$colon!773 (List!31629 (_ BitVec 64)) List!31629)

(assert (=> b!1354949 (= lt!598429 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!773 acc!759 (select (arr!44588 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1354949 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1354950 () Bool)

(declare-fun res!899951 () Bool)

(assert (=> b!1354950 (=> (not res!899951) (not e!769585))))

(assert (=> b!1354950 (= res!899951 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1354951 () Bool)

(assert (=> b!1354951 (= e!769583 e!769584)))

(declare-fun res!899950 () Bool)

(assert (=> b!1354951 (=> (not res!899950) (not e!769584))))

(assert (=> b!1354951 (= res!899950 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(assert (=> b!1354951 (= lt!598428 ($colon$colon!773 acc!759 (select (arr!44588 a!3742) from!3120)))))

(assert (= (and start!114098 res!899953) b!1354941))

(assert (= (and b!1354941 res!899941) b!1354940))

(assert (= (and b!1354940 res!899947) b!1354946))

(assert (= (and b!1354946 res!899942) b!1354939))

(assert (= (and b!1354939 res!899939) b!1354948))

(assert (= (and b!1354948 res!899944) b!1354937))

(assert (= (and b!1354937 res!899949) b!1354950))

(assert (= (and b!1354950 res!899951) b!1354938))

(assert (= (and b!1354938 res!899945) b!1354935))

(assert (= (and b!1354935 c!126938) b!1354949))

(assert (= (and b!1354935 (not c!126938)) b!1354936))

(assert (= (and b!1354935 res!899948) b!1354951))

(assert (= (and b!1354951 res!899950) b!1354944))

(assert (= (and b!1354944 res!899940) b!1354945))

(assert (= (and b!1354945 res!899952) b!1354943))

(assert (= (and b!1354943 res!899946) b!1354942))

(assert (= (and b!1354942 res!899943) b!1354947))

(declare-fun m!1241215 () Bool)

(assert (=> b!1354943 m!1241215))

(declare-fun m!1241217 () Bool)

(assert (=> b!1354950 m!1241217))

(declare-fun m!1241219 () Bool)

(assert (=> b!1354948 m!1241219))

(declare-fun m!1241221 () Bool)

(assert (=> b!1354949 m!1241221))

(declare-fun m!1241223 () Bool)

(assert (=> b!1354949 m!1241223))

(declare-fun m!1241225 () Bool)

(assert (=> b!1354949 m!1241225))

(declare-fun m!1241227 () Bool)

(assert (=> b!1354949 m!1241227))

(declare-fun m!1241229 () Bool)

(assert (=> b!1354949 m!1241229))

(assert (=> b!1354949 m!1241223))

(assert (=> b!1354949 m!1241225))

(declare-fun m!1241231 () Bool)

(assert (=> b!1354949 m!1241231))

(declare-fun m!1241233 () Bool)

(assert (=> b!1354940 m!1241233))

(declare-fun m!1241235 () Bool)

(assert (=> b!1354945 m!1241235))

(declare-fun m!1241237 () Bool)

(assert (=> start!114098 m!1241237))

(declare-fun m!1241239 () Bool)

(assert (=> b!1354944 m!1241239))

(declare-fun m!1241241 () Bool)

(assert (=> b!1354947 m!1241241))

(declare-fun m!1241243 () Bool)

(assert (=> b!1354947 m!1241243))

(declare-fun m!1241245 () Bool)

(assert (=> b!1354947 m!1241245))

(declare-fun m!1241247 () Bool)

(assert (=> b!1354939 m!1241247))

(declare-fun m!1241249 () Bool)

(assert (=> b!1354946 m!1241249))

(declare-fun m!1241251 () Bool)

(assert (=> b!1354941 m!1241251))

(assert (=> b!1354935 m!1241223))

(assert (=> b!1354935 m!1241223))

(declare-fun m!1241253 () Bool)

(assert (=> b!1354935 m!1241253))

(declare-fun m!1241255 () Bool)

(assert (=> b!1354942 m!1241255))

(assert (=> b!1354951 m!1241223))

(assert (=> b!1354951 m!1241223))

(assert (=> b!1354951 m!1241225))

(push 1)

