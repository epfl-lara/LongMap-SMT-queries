; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114566 () Bool)

(assert start!114566)

(declare-fun b!1359311 () Bool)

(declare-fun res!903808 () Bool)

(declare-fun e!771363 () Bool)

(assert (=> b!1359311 (=> (not res!903808) (not e!771363))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-datatypes ((array!92511 0))(
  ( (array!92512 (arr!44696 (Array (_ BitVec 32) (_ BitVec 64))) (size!45246 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92511)

(assert (=> b!1359311 (= res!903808 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45246 a!3742)))))

(declare-fun b!1359312 () Bool)

(declare-fun res!903812 () Bool)

(assert (=> b!1359312 (=> (not res!903812) (not e!771363))))

(declare-datatypes ((List!31737 0))(
  ( (Nil!31734) (Cons!31733 (h!32942 (_ BitVec 64)) (t!46410 List!31737)) )
))
(declare-fun acc!759 () List!31737)

(declare-fun contains!9446 (List!31737 (_ BitVec 64)) Bool)

(assert (=> b!1359312 (= res!903812 (not (contains!9446 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1359313 () Bool)

(declare-datatypes ((Unit!44748 0))(
  ( (Unit!44749) )
))
(declare-fun e!771364 () Unit!44748)

(declare-fun Unit!44750 () Unit!44748)

(assert (=> b!1359313 (= e!771364 Unit!44750)))

(declare-fun b!1359314 () Bool)

(declare-fun res!903810 () Bool)

(assert (=> b!1359314 (=> (not res!903810) (not e!771363))))

(assert (=> b!1359314 (= res!903810 (not (contains!9446 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1359315 () Bool)

(declare-fun res!903807 () Bool)

(assert (=> b!1359315 (=> (not res!903807) (not e!771363))))

(declare-fun arrayNoDuplicates!0 (array!92511 (_ BitVec 32) List!31737) Bool)

(assert (=> b!1359315 (= res!903807 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31734))))

(declare-fun b!1359316 () Bool)

(declare-fun res!903814 () Bool)

(assert (=> b!1359316 (=> (not res!903814) (not e!771363))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1359316 (= res!903814 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45246 a!3742))))))

(declare-fun b!1359317 () Bool)

(declare-fun e!771361 () Bool)

(assert (=> b!1359317 (= e!771361 false)))

(declare-fun lt!599564 () Bool)

(assert (=> b!1359317 (= lt!599564 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun res!903813 () Bool)

(assert (=> start!114566 (=> (not res!903813) (not e!771363))))

(assert (=> start!114566 (= res!903813 (and (bvslt (size!45246 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45246 a!3742))))))

(assert (=> start!114566 e!771363))

(assert (=> start!114566 true))

(declare-fun array_inv!33724 (array!92511) Bool)

(assert (=> start!114566 (array_inv!33724 a!3742)))

(declare-fun b!1359318 () Bool)

(declare-fun res!903806 () Bool)

(assert (=> b!1359318 (=> (not res!903806) (not e!771363))))

(declare-fun noDuplicate!2303 (List!31737) Bool)

(assert (=> b!1359318 (= res!903806 (noDuplicate!2303 acc!759))))

(declare-fun b!1359319 () Bool)

(declare-fun res!903811 () Bool)

(assert (=> b!1359319 (=> (not res!903811) (not e!771363))))

(assert (=> b!1359319 (= res!903811 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1359320 () Bool)

(declare-fun lt!599565 () Unit!44748)

(assert (=> b!1359320 (= e!771364 lt!599565)))

(declare-fun lt!599566 () Unit!44748)

(declare-fun lemmaListSubSeqRefl!0 (List!31737) Unit!44748)

(assert (=> b!1359320 (= lt!599566 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!848 (List!31737 List!31737) Bool)

(assert (=> b!1359320 (subseq!848 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92511 List!31737 List!31737 (_ BitVec 32)) Unit!44748)

(declare-fun $colon$colon!851 (List!31737 (_ BitVec 64)) List!31737)

(assert (=> b!1359320 (= lt!599565 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!851 acc!759 (select (arr!44696 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1359320 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1359321 () Bool)

(assert (=> b!1359321 (= e!771363 e!771361)))

(declare-fun res!903809 () Bool)

(assert (=> b!1359321 (=> (not res!903809) (not e!771361))))

(assert (=> b!1359321 (= res!903809 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!599563 () Unit!44748)

(assert (=> b!1359321 (= lt!599563 e!771364)))

(declare-fun c!127193 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1359321 (= c!127193 (validKeyInArray!0 (select (arr!44696 a!3742) from!3120)))))

(declare-fun b!1359322 () Bool)

(declare-fun res!903805 () Bool)

(assert (=> b!1359322 (=> (not res!903805) (not e!771363))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1359322 (= res!903805 (not (validKeyInArray!0 l!3587)))))

(assert (= (and start!114566 res!903813) b!1359318))

(assert (= (and b!1359318 res!903806) b!1359312))

(assert (= (and b!1359312 res!903812) b!1359314))

(assert (= (and b!1359314 res!903810) b!1359315))

(assert (= (and b!1359315 res!903807) b!1359319))

(assert (= (and b!1359319 res!903811) b!1359316))

(assert (= (and b!1359316 res!903814) b!1359322))

(assert (= (and b!1359322 res!903805) b!1359311))

(assert (= (and b!1359311 res!903808) b!1359321))

(assert (= (and b!1359321 c!127193) b!1359320))

(assert (= (and b!1359321 (not c!127193)) b!1359313))

(assert (= (and b!1359321 res!903809) b!1359317))

(declare-fun m!1244749 () Bool)

(assert (=> start!114566 m!1244749))

(declare-fun m!1244751 () Bool)

(assert (=> b!1359321 m!1244751))

(assert (=> b!1359321 m!1244751))

(declare-fun m!1244753 () Bool)

(assert (=> b!1359321 m!1244753))

(declare-fun m!1244755 () Bool)

(assert (=> b!1359320 m!1244755))

(assert (=> b!1359320 m!1244751))

(declare-fun m!1244757 () Bool)

(assert (=> b!1359320 m!1244757))

(declare-fun m!1244759 () Bool)

(assert (=> b!1359320 m!1244759))

(declare-fun m!1244761 () Bool)

(assert (=> b!1359320 m!1244761))

(assert (=> b!1359320 m!1244751))

(assert (=> b!1359320 m!1244757))

(declare-fun m!1244763 () Bool)

(assert (=> b!1359320 m!1244763))

(declare-fun m!1244765 () Bool)

(assert (=> b!1359312 m!1244765))

(declare-fun m!1244767 () Bool)

(assert (=> b!1359322 m!1244767))

(assert (=> b!1359317 m!1244761))

(declare-fun m!1244769 () Bool)

(assert (=> b!1359314 m!1244769))

(declare-fun m!1244771 () Bool)

(assert (=> b!1359319 m!1244771))

(declare-fun m!1244773 () Bool)

(assert (=> b!1359315 m!1244773))

(declare-fun m!1244775 () Bool)

(assert (=> b!1359318 m!1244775))

(push 1)

