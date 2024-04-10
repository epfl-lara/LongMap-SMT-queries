; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114074 () Bool)

(assert start!114074)

(declare-fun b!1354330 () Bool)

(declare-fun res!899418 () Bool)

(declare-fun e!769401 () Bool)

(assert (=> b!1354330 (=> (not res!899418) (not e!769401))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1354330 (= res!899418 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1354331 () Bool)

(declare-fun e!769402 () Bool)

(declare-fun e!769405 () Bool)

(assert (=> b!1354331 (= e!769402 e!769405)))

(declare-fun res!899411 () Bool)

(assert (=> b!1354331 (=> (not res!899411) (not e!769405))))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> b!1354331 (= res!899411 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-datatypes ((List!31617 0))(
  ( (Nil!31614) (Cons!31613 (h!32822 (_ BitVec 64)) (t!46275 List!31617)) )
))
(declare-fun acc!759 () List!31617)

(declare-fun lt!598216 () List!31617)

(declare-datatypes ((array!92256 0))(
  ( (array!92257 (arr!44576 (Array (_ BitVec 32) (_ BitVec 64))) (size!45126 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92256)

(declare-fun $colon$colon!761 (List!31617 (_ BitVec 64)) List!31617)

(assert (=> b!1354331 (= lt!598216 ($colon$colon!761 acc!759 (select (arr!44576 a!3742) from!3120)))))

(declare-fun b!1354332 () Bool)

(declare-fun res!899417 () Bool)

(assert (=> b!1354332 (=> (not res!899417) (not e!769401))))

(assert (=> b!1354332 (= res!899417 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45126 a!3742)))))

(declare-fun b!1354333 () Bool)

(declare-fun res!899413 () Bool)

(assert (=> b!1354333 (=> (not res!899413) (not e!769405))))

(declare-fun contains!9326 (List!31617 (_ BitVec 64)) Bool)

(assert (=> b!1354333 (= res!899413 (not (contains!9326 lt!598216 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!899414 () Bool)

(assert (=> start!114074 (=> (not res!899414) (not e!769401))))

(assert (=> start!114074 (= res!899414 (and (bvslt (size!45126 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45126 a!3742))))))

(assert (=> start!114074 e!769401))

(assert (=> start!114074 true))

(declare-fun array_inv!33604 (array!92256) Bool)

(assert (=> start!114074 (array_inv!33604 a!3742)))

(declare-fun b!1354334 () Bool)

(declare-fun res!899419 () Bool)

(assert (=> b!1354334 (=> (not res!899419) (not e!769401))))

(assert (=> b!1354334 (= res!899419 (not (contains!9326 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354335 () Bool)

(declare-fun res!899415 () Bool)

(assert (=> b!1354335 (=> (not res!899415) (not e!769405))))

(declare-fun noDuplicate!2183 (List!31617) Bool)

(assert (=> b!1354335 (= res!899415 (noDuplicate!2183 lt!598216))))

(declare-fun b!1354336 () Bool)

(declare-fun res!899410 () Bool)

(assert (=> b!1354336 (=> (not res!899410) (not e!769401))))

(declare-fun arrayNoDuplicates!0 (array!92256 (_ BitVec 32) List!31617) Bool)

(assert (=> b!1354336 (= res!899410 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1354337 () Bool)

(declare-fun res!899408 () Bool)

(assert (=> b!1354337 (=> (not res!899408) (not e!769401))))

(assert (=> b!1354337 (= res!899408 (not (contains!9326 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354338 () Bool)

(declare-fun res!899406 () Bool)

(assert (=> b!1354338 (=> (not res!899406) (not e!769405))))

(assert (=> b!1354338 (= res!899406 (not (contains!9326 lt!598216 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354339 () Bool)

(declare-datatypes ((Unit!44469 0))(
  ( (Unit!44470) )
))
(declare-fun e!769403 () Unit!44469)

(declare-fun lt!598211 () Unit!44469)

(assert (=> b!1354339 (= e!769403 lt!598211)))

(declare-fun lt!598215 () Unit!44469)

(declare-fun lemmaListSubSeqRefl!0 (List!31617) Unit!44469)

(assert (=> b!1354339 (= lt!598215 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!746 (List!31617 List!31617) Bool)

(assert (=> b!1354339 (subseq!746 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92256 List!31617 List!31617 (_ BitVec 32)) Unit!44469)

(assert (=> b!1354339 (= lt!598211 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!761 acc!759 (select (arr!44576 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1354339 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1354340 () Bool)

(declare-fun Unit!44471 () Unit!44469)

(assert (=> b!1354340 (= e!769403 Unit!44471)))

(declare-fun b!1354341 () Bool)

(declare-fun res!899407 () Bool)

(assert (=> b!1354341 (=> (not res!899407) (not e!769401))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1354341 (= res!899407 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45126 a!3742))))))

(declare-fun b!1354342 () Bool)

(assert (=> b!1354342 (= e!769405 false)))

(declare-fun lt!598212 () Bool)

(assert (=> b!1354342 (= lt!598212 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!598216))))

(declare-fun b!1354343 () Bool)

(declare-fun res!899409 () Bool)

(assert (=> b!1354343 (=> (not res!899409) (not e!769401))))

(assert (=> b!1354343 (= res!899409 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31614))))

(declare-fun b!1354344 () Bool)

(declare-fun res!899416 () Bool)

(assert (=> b!1354344 (=> (not res!899416) (not e!769401))))

(assert (=> b!1354344 (= res!899416 (noDuplicate!2183 acc!759))))

(declare-fun b!1354345 () Bool)

(assert (=> b!1354345 (= e!769401 e!769402)))

(declare-fun res!899412 () Bool)

(assert (=> b!1354345 (=> (not res!899412) (not e!769402))))

(declare-fun lt!598213 () Bool)

(assert (=> b!1354345 (= res!899412 (and (not (= from!3120 i!1404)) lt!598213))))

(declare-fun lt!598214 () Unit!44469)

(assert (=> b!1354345 (= lt!598214 e!769403)))

(declare-fun c!126902 () Bool)

(assert (=> b!1354345 (= c!126902 lt!598213)))

(assert (=> b!1354345 (= lt!598213 (validKeyInArray!0 (select (arr!44576 a!3742) from!3120)))))

(assert (= (and start!114074 res!899414) b!1354344))

(assert (= (and b!1354344 res!899416) b!1354337))

(assert (= (and b!1354337 res!899408) b!1354334))

(assert (= (and b!1354334 res!899419) b!1354343))

(assert (= (and b!1354343 res!899409) b!1354336))

(assert (= (and b!1354336 res!899410) b!1354341))

(assert (= (and b!1354341 res!899407) b!1354330))

(assert (= (and b!1354330 res!899418) b!1354332))

(assert (= (and b!1354332 res!899417) b!1354345))

(assert (= (and b!1354345 c!126902) b!1354339))

(assert (= (and b!1354345 (not c!126902)) b!1354340))

(assert (= (and b!1354345 res!899412) b!1354331))

(assert (= (and b!1354331 res!899411) b!1354335))

(assert (= (and b!1354335 res!899415) b!1354338))

(assert (= (and b!1354338 res!899406) b!1354333))

(assert (= (and b!1354333 res!899413) b!1354342))

(declare-fun m!1240729 () Bool)

(assert (=> b!1354336 m!1240729))

(declare-fun m!1240731 () Bool)

(assert (=> b!1354337 m!1240731))

(declare-fun m!1240733 () Bool)

(assert (=> start!114074 m!1240733))

(declare-fun m!1240735 () Bool)

(assert (=> b!1354333 m!1240735))

(declare-fun m!1240737 () Bool)

(assert (=> b!1354345 m!1240737))

(assert (=> b!1354345 m!1240737))

(declare-fun m!1240739 () Bool)

(assert (=> b!1354345 m!1240739))

(declare-fun m!1240741 () Bool)

(assert (=> b!1354330 m!1240741))

(declare-fun m!1240743 () Bool)

(assert (=> b!1354343 m!1240743))

(declare-fun m!1240745 () Bool)

(assert (=> b!1354339 m!1240745))

(assert (=> b!1354339 m!1240737))

(declare-fun m!1240747 () Bool)

(assert (=> b!1354339 m!1240747))

(declare-fun m!1240749 () Bool)

(assert (=> b!1354339 m!1240749))

(declare-fun m!1240751 () Bool)

(assert (=> b!1354339 m!1240751))

(assert (=> b!1354339 m!1240737))

(assert (=> b!1354339 m!1240747))

(declare-fun m!1240753 () Bool)

(assert (=> b!1354339 m!1240753))

(assert (=> b!1354331 m!1240737))

(assert (=> b!1354331 m!1240737))

(assert (=> b!1354331 m!1240747))

(declare-fun m!1240755 () Bool)

(assert (=> b!1354338 m!1240755))

(declare-fun m!1240757 () Bool)

(assert (=> b!1354344 m!1240757))

(declare-fun m!1240759 () Bool)

(assert (=> b!1354342 m!1240759))

(declare-fun m!1240761 () Bool)

(assert (=> b!1354334 m!1240761))

(declare-fun m!1240763 () Bool)

(assert (=> b!1354335 m!1240763))

(push 1)

