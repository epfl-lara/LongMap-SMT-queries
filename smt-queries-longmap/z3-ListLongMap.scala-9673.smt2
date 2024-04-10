; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114178 () Bool)

(assert start!114178)

(declare-fun b!1356443 () Bool)

(declare-fun res!901214 () Bool)

(declare-fun e!770068 () Bool)

(assert (=> b!1356443 (=> (not res!901214) (not e!770068))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-datatypes ((array!92360 0))(
  ( (array!92361 (arr!44628 (Array (_ BitVec 32) (_ BitVec 64))) (size!45178 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92360)

(assert (=> b!1356443 (= res!901214 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45178 a!3742)))))

(declare-fun b!1356444 () Bool)

(declare-fun res!901208 () Bool)

(assert (=> b!1356444 (=> (not res!901208) (not e!770068))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1356444 (= res!901208 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1356445 () Bool)

(declare-fun res!901211 () Bool)

(assert (=> b!1356445 (=> (not res!901211) (not e!770068))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1356445 (= res!901211 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45178 a!3742))))))

(declare-fun b!1356446 () Bool)

(declare-fun e!770071 () Bool)

(assert (=> b!1356446 (= e!770068 e!770071)))

(declare-fun res!901209 () Bool)

(assert (=> b!1356446 (=> (not res!901209) (not e!770071))))

(declare-fun lt!599036 () Bool)

(assert (=> b!1356446 (= res!901209 (and (not (= from!3120 i!1404)) (not lt!599036) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!44625 0))(
  ( (Unit!44626) )
))
(declare-fun lt!599035 () Unit!44625)

(declare-fun e!770069 () Unit!44625)

(assert (=> b!1356446 (= lt!599035 e!770069)))

(declare-fun c!127058 () Bool)

(assert (=> b!1356446 (= c!127058 lt!599036)))

(assert (=> b!1356446 (= lt!599036 (validKeyInArray!0 (select (arr!44628 a!3742) from!3120)))))

(declare-fun b!1356447 () Bool)

(declare-fun lt!599037 () Unit!44625)

(assert (=> b!1356447 (= e!770069 lt!599037)))

(declare-fun lt!599038 () Unit!44625)

(declare-datatypes ((List!31669 0))(
  ( (Nil!31666) (Cons!31665 (h!32874 (_ BitVec 64)) (t!46327 List!31669)) )
))
(declare-fun acc!759 () List!31669)

(declare-fun lemmaListSubSeqRefl!0 (List!31669) Unit!44625)

(assert (=> b!1356447 (= lt!599038 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!798 (List!31669 List!31669) Bool)

(assert (=> b!1356447 (subseq!798 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92360 List!31669 List!31669 (_ BitVec 32)) Unit!44625)

(declare-fun $colon$colon!813 (List!31669 (_ BitVec 64)) List!31669)

(assert (=> b!1356447 (= lt!599037 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!813 acc!759 (select (arr!44628 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92360 (_ BitVec 32) List!31669) Bool)

(assert (=> b!1356447 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1356448 () Bool)

(assert (=> b!1356448 (= e!770071 (not true))))

(assert (=> b!1356448 (arrayNoDuplicates!0 (array!92361 (store (arr!44628 a!3742) i!1404 l!3587) (size!45178 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun lt!599034 () Unit!44625)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92360 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31669) Unit!44625)

(assert (=> b!1356448 (= lt!599034 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1356449 () Bool)

(declare-fun res!901206 () Bool)

(assert (=> b!1356449 (=> (not res!901206) (not e!770071))))

(assert (=> b!1356449 (= res!901206 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1356450 () Bool)

(declare-fun res!901210 () Bool)

(assert (=> b!1356450 (=> (not res!901210) (not e!770068))))

(declare-fun noDuplicate!2235 (List!31669) Bool)

(assert (=> b!1356450 (= res!901210 (noDuplicate!2235 acc!759))))

(declare-fun b!1356442 () Bool)

(declare-fun Unit!44627 () Unit!44625)

(assert (=> b!1356442 (= e!770069 Unit!44627)))

(declare-fun res!901215 () Bool)

(assert (=> start!114178 (=> (not res!901215) (not e!770068))))

(assert (=> start!114178 (= res!901215 (and (bvslt (size!45178 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45178 a!3742))))))

(assert (=> start!114178 e!770068))

(assert (=> start!114178 true))

(declare-fun array_inv!33656 (array!92360) Bool)

(assert (=> start!114178 (array_inv!33656 a!3742)))

(declare-fun b!1356451 () Bool)

(declare-fun res!901213 () Bool)

(assert (=> b!1356451 (=> (not res!901213) (not e!770068))))

(assert (=> b!1356451 (= res!901213 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31666))))

(declare-fun b!1356452 () Bool)

(declare-fun res!901207 () Bool)

(assert (=> b!1356452 (=> (not res!901207) (not e!770068))))

(declare-fun contains!9378 (List!31669 (_ BitVec 64)) Bool)

(assert (=> b!1356452 (= res!901207 (not (contains!9378 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356453 () Bool)

(declare-fun res!901212 () Bool)

(assert (=> b!1356453 (=> (not res!901212) (not e!770068))))

(assert (=> b!1356453 (= res!901212 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1356454 () Bool)

(declare-fun res!901216 () Bool)

(assert (=> b!1356454 (=> (not res!901216) (not e!770068))))

(assert (=> b!1356454 (= res!901216 (not (contains!9378 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!114178 res!901215) b!1356450))

(assert (= (and b!1356450 res!901210) b!1356454))

(assert (= (and b!1356454 res!901216) b!1356452))

(assert (= (and b!1356452 res!901207) b!1356451))

(assert (= (and b!1356451 res!901213) b!1356453))

(assert (= (and b!1356453 res!901212) b!1356445))

(assert (= (and b!1356445 res!901211) b!1356444))

(assert (= (and b!1356444 res!901208) b!1356443))

(assert (= (and b!1356443 res!901214) b!1356446))

(assert (= (and b!1356446 c!127058) b!1356447))

(assert (= (and b!1356446 (not c!127058)) b!1356442))

(assert (= (and b!1356446 res!901209) b!1356449))

(assert (= (and b!1356449 res!901206) b!1356448))

(declare-fun m!1242437 () Bool)

(assert (=> b!1356453 m!1242437))

(declare-fun m!1242439 () Bool)

(assert (=> b!1356452 m!1242439))

(declare-fun m!1242441 () Bool)

(assert (=> b!1356450 m!1242441))

(declare-fun m!1242443 () Bool)

(assert (=> b!1356451 m!1242443))

(declare-fun m!1242445 () Bool)

(assert (=> b!1356449 m!1242445))

(declare-fun m!1242447 () Bool)

(assert (=> b!1356447 m!1242447))

(declare-fun m!1242449 () Bool)

(assert (=> b!1356447 m!1242449))

(declare-fun m!1242451 () Bool)

(assert (=> b!1356447 m!1242451))

(declare-fun m!1242453 () Bool)

(assert (=> b!1356447 m!1242453))

(assert (=> b!1356447 m!1242445))

(assert (=> b!1356447 m!1242449))

(assert (=> b!1356447 m!1242451))

(declare-fun m!1242455 () Bool)

(assert (=> b!1356447 m!1242455))

(declare-fun m!1242457 () Bool)

(assert (=> start!114178 m!1242457))

(declare-fun m!1242459 () Bool)

(assert (=> b!1356448 m!1242459))

(declare-fun m!1242461 () Bool)

(assert (=> b!1356448 m!1242461))

(declare-fun m!1242463 () Bool)

(assert (=> b!1356448 m!1242463))

(assert (=> b!1356446 m!1242449))

(assert (=> b!1356446 m!1242449))

(declare-fun m!1242465 () Bool)

(assert (=> b!1356446 m!1242465))

(declare-fun m!1242467 () Bool)

(assert (=> b!1356444 m!1242467))

(declare-fun m!1242469 () Bool)

(assert (=> b!1356454 m!1242469))

(check-sat (not b!1356451) (not b!1356446) (not b!1356449) (not b!1356453) (not b!1356450) (not b!1356454) (not b!1356447) (not b!1356444) (not b!1356448) (not b!1356452) (not start!114178))
(check-sat)
