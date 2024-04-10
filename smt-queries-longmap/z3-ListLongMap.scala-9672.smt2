; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114172 () Bool)

(assert start!114172)

(declare-fun b!1356325 () Bool)

(declare-fun res!901111 () Bool)

(declare-fun e!770035 () Bool)

(assert (=> b!1356325 (=> (not res!901111) (not e!770035))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-datatypes ((array!92354 0))(
  ( (array!92355 (arr!44625 (Array (_ BitVec 32) (_ BitVec 64))) (size!45175 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92354)

(assert (=> b!1356325 (= res!901111 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45175 a!3742)))))

(declare-fun b!1356326 () Bool)

(declare-fun e!770034 () Bool)

(assert (=> b!1356326 (= e!770034 (not true))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-datatypes ((List!31666 0))(
  ( (Nil!31663) (Cons!31662 (h!32871 (_ BitVec 64)) (t!46324 List!31666)) )
))
(declare-fun acc!759 () List!31666)

(declare-fun i!1404 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92354 (_ BitVec 32) List!31666) Bool)

(assert (=> b!1356326 (arrayNoDuplicates!0 (array!92355 (store (arr!44625 a!3742) i!1404 l!3587) (size!45175 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-datatypes ((Unit!44616 0))(
  ( (Unit!44617) )
))
(declare-fun lt!598992 () Unit!44616)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92354 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31666) Unit!44616)

(assert (=> b!1356326 (= lt!598992 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1356327 () Bool)

(declare-fun res!901113 () Bool)

(assert (=> b!1356327 (=> (not res!901113) (not e!770035))))

(assert (=> b!1356327 (= res!901113 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31663))))

(declare-fun b!1356328 () Bool)

(declare-fun res!901115 () Bool)

(assert (=> b!1356328 (=> (not res!901115) (not e!770035))))

(assert (=> b!1356328 (= res!901115 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1356329 () Bool)

(declare-fun res!901117 () Bool)

(assert (=> b!1356329 (=> (not res!901117) (not e!770035))))

(declare-fun contains!9375 (List!31666 (_ BitVec 64)) Bool)

(assert (=> b!1356329 (= res!901117 (not (contains!9375 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356330 () Bool)

(declare-fun res!901109 () Bool)

(assert (=> b!1356330 (=> (not res!901109) (not e!770035))))

(declare-fun noDuplicate!2232 (List!31666) Bool)

(assert (=> b!1356330 (= res!901109 (noDuplicate!2232 acc!759))))

(declare-fun b!1356331 () Bool)

(declare-fun res!901107 () Bool)

(assert (=> b!1356331 (=> (not res!901107) (not e!770035))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1356331 (= res!901107 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1356332 () Bool)

(declare-fun res!901108 () Bool)

(assert (=> b!1356332 (=> (not res!901108) (not e!770035))))

(assert (=> b!1356332 (= res!901108 (not (contains!9375 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!901110 () Bool)

(assert (=> start!114172 (=> (not res!901110) (not e!770035))))

(assert (=> start!114172 (= res!901110 (and (bvslt (size!45175 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45175 a!3742))))))

(assert (=> start!114172 e!770035))

(assert (=> start!114172 true))

(declare-fun array_inv!33653 (array!92354) Bool)

(assert (=> start!114172 (array_inv!33653 a!3742)))

(declare-fun b!1356333 () Bool)

(declare-fun e!770032 () Unit!44616)

(declare-fun Unit!44618 () Unit!44616)

(assert (=> b!1356333 (= e!770032 Unit!44618)))

(declare-fun b!1356334 () Bool)

(declare-fun res!901112 () Bool)

(assert (=> b!1356334 (=> (not res!901112) (not e!770035))))

(assert (=> b!1356334 (= res!901112 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45175 a!3742))))))

(declare-fun b!1356335 () Bool)

(declare-fun res!901114 () Bool)

(assert (=> b!1356335 (=> (not res!901114) (not e!770034))))

(assert (=> b!1356335 (= res!901114 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1356336 () Bool)

(assert (=> b!1356336 (= e!770035 e!770034)))

(declare-fun res!901116 () Bool)

(assert (=> b!1356336 (=> (not res!901116) (not e!770034))))

(declare-fun lt!598993 () Bool)

(assert (=> b!1356336 (= res!901116 (and (not (= from!3120 i!1404)) (not lt!598993) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!598991 () Unit!44616)

(assert (=> b!1356336 (= lt!598991 e!770032)))

(declare-fun c!127049 () Bool)

(assert (=> b!1356336 (= c!127049 lt!598993)))

(assert (=> b!1356336 (= lt!598993 (validKeyInArray!0 (select (arr!44625 a!3742) from!3120)))))

(declare-fun b!1356337 () Bool)

(declare-fun lt!598990 () Unit!44616)

(assert (=> b!1356337 (= e!770032 lt!598990)))

(declare-fun lt!598989 () Unit!44616)

(declare-fun lemmaListSubSeqRefl!0 (List!31666) Unit!44616)

(assert (=> b!1356337 (= lt!598989 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!795 (List!31666 List!31666) Bool)

(assert (=> b!1356337 (subseq!795 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92354 List!31666 List!31666 (_ BitVec 32)) Unit!44616)

(declare-fun $colon$colon!810 (List!31666 (_ BitVec 64)) List!31666)

(assert (=> b!1356337 (= lt!598990 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!810 acc!759 (select (arr!44625 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1356337 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(assert (= (and start!114172 res!901110) b!1356330))

(assert (= (and b!1356330 res!901109) b!1356332))

(assert (= (and b!1356332 res!901108) b!1356329))

(assert (= (and b!1356329 res!901117) b!1356327))

(assert (= (and b!1356327 res!901113) b!1356328))

(assert (= (and b!1356328 res!901115) b!1356334))

(assert (= (and b!1356334 res!901112) b!1356331))

(assert (= (and b!1356331 res!901107) b!1356325))

(assert (= (and b!1356325 res!901111) b!1356336))

(assert (= (and b!1356336 c!127049) b!1356337))

(assert (= (and b!1356336 (not c!127049)) b!1356333))

(assert (= (and b!1356336 res!901116) b!1356335))

(assert (= (and b!1356335 res!901114) b!1356326))

(declare-fun m!1242335 () Bool)

(assert (=> b!1356331 m!1242335))

(declare-fun m!1242337 () Bool)

(assert (=> b!1356329 m!1242337))

(declare-fun m!1242339 () Bool)

(assert (=> b!1356332 m!1242339))

(declare-fun m!1242341 () Bool)

(assert (=> b!1356326 m!1242341))

(declare-fun m!1242343 () Bool)

(assert (=> b!1356326 m!1242343))

(declare-fun m!1242345 () Bool)

(assert (=> b!1356326 m!1242345))

(declare-fun m!1242347 () Bool)

(assert (=> b!1356327 m!1242347))

(declare-fun m!1242349 () Bool)

(assert (=> b!1356337 m!1242349))

(declare-fun m!1242351 () Bool)

(assert (=> b!1356337 m!1242351))

(declare-fun m!1242353 () Bool)

(assert (=> b!1356337 m!1242353))

(declare-fun m!1242355 () Bool)

(assert (=> b!1356337 m!1242355))

(declare-fun m!1242357 () Bool)

(assert (=> b!1356337 m!1242357))

(assert (=> b!1356337 m!1242351))

(assert (=> b!1356337 m!1242353))

(declare-fun m!1242359 () Bool)

(assert (=> b!1356337 m!1242359))

(declare-fun m!1242361 () Bool)

(assert (=> b!1356330 m!1242361))

(assert (=> b!1356335 m!1242357))

(declare-fun m!1242363 () Bool)

(assert (=> b!1356328 m!1242363))

(assert (=> b!1356336 m!1242351))

(assert (=> b!1356336 m!1242351))

(declare-fun m!1242365 () Bool)

(assert (=> b!1356336 m!1242365))

(declare-fun m!1242367 () Bool)

(assert (=> start!114172 m!1242367))

(check-sat (not b!1356336) (not b!1356331) (not b!1356326) (not b!1356329) (not b!1356337) (not start!114172) (not b!1356332) (not b!1356328) (not b!1356335) (not b!1356327) (not b!1356330))
(check-sat)
