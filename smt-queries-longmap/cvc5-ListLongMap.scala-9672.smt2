; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114170 () Bool)

(assert start!114170)

(declare-fun b!1356286 () Bool)

(declare-fun res!901081 () Bool)

(declare-fun e!770020 () Bool)

(assert (=> b!1356286 (=> (not res!901081) (not e!770020))))

(declare-datatypes ((List!31665 0))(
  ( (Nil!31662) (Cons!31661 (h!32870 (_ BitVec 64)) (t!46323 List!31665)) )
))
(declare-fun acc!759 () List!31665)

(declare-fun contains!9374 (List!31665 (_ BitVec 64)) Bool)

(assert (=> b!1356286 (= res!901081 (not (contains!9374 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356287 () Bool)

(declare-fun res!901083 () Bool)

(declare-fun e!770022 () Bool)

(assert (=> b!1356287 (=> (not res!901083) (not e!770022))))

(declare-datatypes ((array!92352 0))(
  ( (array!92353 (arr!44624 (Array (_ BitVec 32) (_ BitVec 64))) (size!45174 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92352)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92352 (_ BitVec 32) List!31665) Bool)

(assert (=> b!1356287 (= res!901083 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1356288 () Bool)

(declare-datatypes ((Unit!44613 0))(
  ( (Unit!44614) )
))
(declare-fun e!770021 () Unit!44613)

(declare-fun Unit!44615 () Unit!44613)

(assert (=> b!1356288 (= e!770021 Unit!44615)))

(declare-fun b!1356289 () Bool)

(assert (=> b!1356289 (= e!770020 e!770022)))

(declare-fun res!901079 () Bool)

(assert (=> b!1356289 (=> (not res!901079) (not e!770022))))

(declare-fun i!1404 () (_ BitVec 32))

(declare-fun lt!598978 () Bool)

(assert (=> b!1356289 (= res!901079 (and (not (= from!3120 i!1404)) (not lt!598978) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!598976 () Unit!44613)

(assert (=> b!1356289 (= lt!598976 e!770021)))

(declare-fun c!127046 () Bool)

(assert (=> b!1356289 (= c!127046 lt!598978)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1356289 (= lt!598978 (validKeyInArray!0 (select (arr!44624 a!3742) from!3120)))))

(declare-fun b!1356290 () Bool)

(declare-fun res!901075 () Bool)

(assert (=> b!1356290 (=> (not res!901075) (not e!770020))))

(assert (=> b!1356290 (= res!901075 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31662))))

(declare-fun b!1356291 () Bool)

(declare-fun lt!598977 () Unit!44613)

(assert (=> b!1356291 (= e!770021 lt!598977)))

(declare-fun lt!598974 () Unit!44613)

(declare-fun lemmaListSubSeqRefl!0 (List!31665) Unit!44613)

(assert (=> b!1356291 (= lt!598974 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!794 (List!31665 List!31665) Bool)

(assert (=> b!1356291 (subseq!794 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92352 List!31665 List!31665 (_ BitVec 32)) Unit!44613)

(declare-fun $colon$colon!809 (List!31665 (_ BitVec 64)) List!31665)

(assert (=> b!1356291 (= lt!598977 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!809 acc!759 (select (arr!44624 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1356291 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1356292 () Bool)

(assert (=> b!1356292 (= e!770022 (not true))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1356292 (arrayNoDuplicates!0 (array!92353 (store (arr!44624 a!3742) i!1404 l!3587) (size!45174 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun lt!598975 () Unit!44613)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92352 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31665) Unit!44613)

(assert (=> b!1356292 (= lt!598975 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1356293 () Bool)

(declare-fun res!901074 () Bool)

(assert (=> b!1356293 (=> (not res!901074) (not e!770020))))

(assert (=> b!1356293 (= res!901074 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45174 a!3742)))))

(declare-fun b!1356294 () Bool)

(declare-fun res!901080 () Bool)

(assert (=> b!1356294 (=> (not res!901080) (not e!770020))))

(assert (=> b!1356294 (= res!901080 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1356295 () Bool)

(declare-fun res!901076 () Bool)

(assert (=> b!1356295 (=> (not res!901076) (not e!770020))))

(assert (=> b!1356295 (= res!901076 (not (contains!9374 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356296 () Bool)

(declare-fun res!901084 () Bool)

(assert (=> b!1356296 (=> (not res!901084) (not e!770020))))

(declare-fun noDuplicate!2231 (List!31665) Bool)

(assert (=> b!1356296 (= res!901084 (noDuplicate!2231 acc!759))))

(declare-fun res!901078 () Bool)

(assert (=> start!114170 (=> (not res!901078) (not e!770020))))

(assert (=> start!114170 (= res!901078 (and (bvslt (size!45174 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45174 a!3742))))))

(assert (=> start!114170 e!770020))

(assert (=> start!114170 true))

(declare-fun array_inv!33652 (array!92352) Bool)

(assert (=> start!114170 (array_inv!33652 a!3742)))

(declare-fun b!1356297 () Bool)

(declare-fun res!901077 () Bool)

(assert (=> b!1356297 (=> (not res!901077) (not e!770020))))

(assert (=> b!1356297 (= res!901077 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1356298 () Bool)

(declare-fun res!901082 () Bool)

(assert (=> b!1356298 (=> (not res!901082) (not e!770020))))

(assert (=> b!1356298 (= res!901082 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45174 a!3742))))))

(assert (= (and start!114170 res!901078) b!1356296))

(assert (= (and b!1356296 res!901084) b!1356295))

(assert (= (and b!1356295 res!901076) b!1356286))

(assert (= (and b!1356286 res!901081) b!1356290))

(assert (= (and b!1356290 res!901075) b!1356297))

(assert (= (and b!1356297 res!901077) b!1356298))

(assert (= (and b!1356298 res!901082) b!1356294))

(assert (= (and b!1356294 res!901080) b!1356293))

(assert (= (and b!1356293 res!901074) b!1356289))

(assert (= (and b!1356289 c!127046) b!1356291))

(assert (= (and b!1356289 (not c!127046)) b!1356288))

(assert (= (and b!1356289 res!901079) b!1356287))

(assert (= (and b!1356287 res!901083) b!1356292))

(declare-fun m!1242301 () Bool)

(assert (=> b!1356294 m!1242301))

(declare-fun m!1242303 () Bool)

(assert (=> b!1356292 m!1242303))

(declare-fun m!1242305 () Bool)

(assert (=> b!1356292 m!1242305))

(declare-fun m!1242307 () Bool)

(assert (=> b!1356292 m!1242307))

(declare-fun m!1242309 () Bool)

(assert (=> b!1356287 m!1242309))

(declare-fun m!1242311 () Bool)

(assert (=> b!1356295 m!1242311))

(declare-fun m!1242313 () Bool)

(assert (=> b!1356296 m!1242313))

(declare-fun m!1242315 () Bool)

(assert (=> start!114170 m!1242315))

(declare-fun m!1242317 () Bool)

(assert (=> b!1356289 m!1242317))

(assert (=> b!1356289 m!1242317))

(declare-fun m!1242319 () Bool)

(assert (=> b!1356289 m!1242319))

(declare-fun m!1242321 () Bool)

(assert (=> b!1356291 m!1242321))

(assert (=> b!1356291 m!1242317))

(declare-fun m!1242323 () Bool)

(assert (=> b!1356291 m!1242323))

(declare-fun m!1242325 () Bool)

(assert (=> b!1356291 m!1242325))

(assert (=> b!1356291 m!1242309))

(assert (=> b!1356291 m!1242317))

(assert (=> b!1356291 m!1242323))

(declare-fun m!1242327 () Bool)

(assert (=> b!1356291 m!1242327))

(declare-fun m!1242329 () Bool)

(assert (=> b!1356286 m!1242329))

(declare-fun m!1242331 () Bool)

(assert (=> b!1356290 m!1242331))

(declare-fun m!1242333 () Bool)

(assert (=> b!1356297 m!1242333))

(push 1)

