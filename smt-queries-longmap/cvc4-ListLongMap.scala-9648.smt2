; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114030 () Bool)

(assert start!114030)

(declare-fun b!1353274 () Bool)

(declare-fun e!769071 () Bool)

(assert (=> b!1353274 (= e!769071 false)))

(declare-datatypes ((List!31595 0))(
  ( (Nil!31592) (Cons!31591 (h!32800 (_ BitVec 64)) (t!46253 List!31595)) )
))
(declare-fun lt!597819 () List!31595)

(declare-fun lt!597815 () Bool)

(declare-datatypes ((array!92212 0))(
  ( (array!92213 (arr!44554 (Array (_ BitVec 32) (_ BitVec 64))) (size!45104 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92212)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92212 (_ BitVec 32) List!31595) Bool)

(assert (=> b!1353274 (= lt!597815 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!597819))))

(declare-fun b!1353275 () Bool)

(declare-fun res!898489 () Bool)

(assert (=> b!1353275 (=> (not res!898489) (not e!769071))))

(declare-fun noDuplicate!2161 (List!31595) Bool)

(assert (=> b!1353275 (= res!898489 (noDuplicate!2161 lt!597819))))

(declare-fun b!1353276 () Bool)

(declare-fun res!898494 () Bool)

(assert (=> b!1353276 (=> (not res!898494) (not e!769071))))

(declare-fun contains!9304 (List!31595 (_ BitVec 64)) Bool)

(assert (=> b!1353276 (= res!898494 (not (contains!9304 lt!597819 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353277 () Bool)

(declare-fun res!898482 () Bool)

(declare-fun e!769072 () Bool)

(assert (=> b!1353277 (=> (not res!898482) (not e!769072))))

(assert (=> b!1353277 (= res!898482 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31592))))

(declare-fun b!1353278 () Bool)

(declare-datatypes ((Unit!44403 0))(
  ( (Unit!44404) )
))
(declare-fun e!769075 () Unit!44403)

(declare-fun lt!597818 () Unit!44403)

(assert (=> b!1353278 (= e!769075 lt!597818)))

(declare-fun lt!597817 () Unit!44403)

(declare-fun acc!759 () List!31595)

(declare-fun lemmaListSubSeqRefl!0 (List!31595) Unit!44403)

(assert (=> b!1353278 (= lt!597817 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!724 (List!31595 List!31595) Bool)

(assert (=> b!1353278 (subseq!724 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92212 List!31595 List!31595 (_ BitVec 32)) Unit!44403)

(declare-fun $colon$colon!739 (List!31595 (_ BitVec 64)) List!31595)

(assert (=> b!1353278 (= lt!597818 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!739 acc!759 (select (arr!44554 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1353278 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun res!898487 () Bool)

(assert (=> start!114030 (=> (not res!898487) (not e!769072))))

(assert (=> start!114030 (= res!898487 (and (bvslt (size!45104 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45104 a!3742))))))

(assert (=> start!114030 e!769072))

(assert (=> start!114030 true))

(declare-fun array_inv!33582 (array!92212) Bool)

(assert (=> start!114030 (array_inv!33582 a!3742)))

(declare-fun b!1353279 () Bool)

(declare-fun res!898492 () Bool)

(assert (=> b!1353279 (=> (not res!898492) (not e!769072))))

(assert (=> b!1353279 (= res!898492 (noDuplicate!2161 acc!759))))

(declare-fun b!1353280 () Bool)

(declare-fun res!898495 () Bool)

(assert (=> b!1353280 (=> (not res!898495) (not e!769071))))

(assert (=> b!1353280 (= res!898495 (not (contains!9304 lt!597819 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353281 () Bool)

(declare-fun res!898483 () Bool)

(assert (=> b!1353281 (=> (not res!898483) (not e!769072))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1353281 (= res!898483 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45104 a!3742))))))

(declare-fun b!1353282 () Bool)

(declare-fun res!898491 () Bool)

(assert (=> b!1353282 (=> (not res!898491) (not e!769072))))

(assert (=> b!1353282 (= res!898491 (not (contains!9304 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353283 () Bool)

(declare-fun res!898493 () Bool)

(assert (=> b!1353283 (=> (not res!898493) (not e!769072))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1353283 (= res!898493 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1353284 () Bool)

(declare-fun res!898485 () Bool)

(assert (=> b!1353284 (=> (not res!898485) (not e!769072))))

(assert (=> b!1353284 (= res!898485 (not (contains!9304 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353285 () Bool)

(declare-fun Unit!44405 () Unit!44403)

(assert (=> b!1353285 (= e!769075 Unit!44405)))

(declare-fun b!1353286 () Bool)

(declare-fun e!769073 () Bool)

(assert (=> b!1353286 (= e!769073 e!769071)))

(declare-fun res!898484 () Bool)

(assert (=> b!1353286 (=> (not res!898484) (not e!769071))))

(assert (=> b!1353286 (= res!898484 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(assert (=> b!1353286 (= lt!597819 ($colon$colon!739 acc!759 (select (arr!44554 a!3742) from!3120)))))

(declare-fun b!1353287 () Bool)

(declare-fun res!898488 () Bool)

(assert (=> b!1353287 (=> (not res!898488) (not e!769072))))

(assert (=> b!1353287 (= res!898488 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1353288 () Bool)

(declare-fun res!898490 () Bool)

(assert (=> b!1353288 (=> (not res!898490) (not e!769072))))

(assert (=> b!1353288 (= res!898490 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45104 a!3742)))))

(declare-fun b!1353289 () Bool)

(assert (=> b!1353289 (= e!769072 e!769073)))

(declare-fun res!898486 () Bool)

(assert (=> b!1353289 (=> (not res!898486) (not e!769073))))

(declare-fun lt!597820 () Bool)

(assert (=> b!1353289 (= res!898486 (and (not (= from!3120 i!1404)) lt!597820))))

(declare-fun lt!597816 () Unit!44403)

(assert (=> b!1353289 (= lt!597816 e!769075)))

(declare-fun c!126836 () Bool)

(assert (=> b!1353289 (= c!126836 lt!597820)))

(assert (=> b!1353289 (= lt!597820 (validKeyInArray!0 (select (arr!44554 a!3742) from!3120)))))

(assert (= (and start!114030 res!898487) b!1353279))

(assert (= (and b!1353279 res!898492) b!1353284))

(assert (= (and b!1353284 res!898485) b!1353282))

(assert (= (and b!1353282 res!898491) b!1353277))

(assert (= (and b!1353277 res!898482) b!1353287))

(assert (= (and b!1353287 res!898488) b!1353281))

(assert (= (and b!1353281 res!898483) b!1353283))

(assert (= (and b!1353283 res!898493) b!1353288))

(assert (= (and b!1353288 res!898490) b!1353289))

(assert (= (and b!1353289 c!126836) b!1353278))

(assert (= (and b!1353289 (not c!126836)) b!1353285))

(assert (= (and b!1353289 res!898486) b!1353286))

(assert (= (and b!1353286 res!898484) b!1353275))

(assert (= (and b!1353275 res!898489) b!1353280))

(assert (= (and b!1353280 res!898495) b!1353276))

(assert (= (and b!1353276 res!898494) b!1353274))

(declare-fun m!1239937 () Bool)

(assert (=> b!1353282 m!1239937))

(declare-fun m!1239939 () Bool)

(assert (=> b!1353274 m!1239939))

(declare-fun m!1239941 () Bool)

(assert (=> b!1353275 m!1239941))

(declare-fun m!1239943 () Bool)

(assert (=> b!1353276 m!1239943))

(declare-fun m!1239945 () Bool)

(assert (=> b!1353280 m!1239945))

(declare-fun m!1239947 () Bool)

(assert (=> b!1353289 m!1239947))

(assert (=> b!1353289 m!1239947))

(declare-fun m!1239949 () Bool)

(assert (=> b!1353289 m!1239949))

(declare-fun m!1239951 () Bool)

(assert (=> b!1353278 m!1239951))

(assert (=> b!1353278 m!1239947))

(declare-fun m!1239953 () Bool)

(assert (=> b!1353278 m!1239953))

(declare-fun m!1239955 () Bool)

(assert (=> b!1353278 m!1239955))

(declare-fun m!1239957 () Bool)

(assert (=> b!1353278 m!1239957))

(assert (=> b!1353278 m!1239947))

(assert (=> b!1353278 m!1239953))

(declare-fun m!1239959 () Bool)

(assert (=> b!1353278 m!1239959))

(declare-fun m!1239961 () Bool)

(assert (=> b!1353277 m!1239961))

(declare-fun m!1239963 () Bool)

(assert (=> b!1353287 m!1239963))

(declare-fun m!1239965 () Bool)

(assert (=> b!1353279 m!1239965))

(declare-fun m!1239967 () Bool)

(assert (=> b!1353283 m!1239967))

(assert (=> b!1353286 m!1239947))

(assert (=> b!1353286 m!1239947))

(assert (=> b!1353286 m!1239953))

(declare-fun m!1239969 () Bool)

(assert (=> start!114030 m!1239969))

(declare-fun m!1239971 () Bool)

(assert (=> b!1353284 m!1239971))

(push 1)

