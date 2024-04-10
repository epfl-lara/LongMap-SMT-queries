; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115060 () Bool)

(assert start!115060)

(declare-fun b!1363466 () Bool)

(declare-fun e!773269 () Bool)

(declare-fun e!773270 () Bool)

(assert (=> b!1363466 (= e!773269 e!773270)))

(declare-fun res!907271 () Bool)

(assert (=> b!1363466 (=> (not res!907271) (not e!773270))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lt!600781 () Bool)

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1363466 (= res!907271 (and (not (= from!3120 i!1404)) (not lt!600781) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!44985 0))(
  ( (Unit!44986) )
))
(declare-fun lt!600779 () Unit!44985)

(declare-fun e!773271 () Unit!44985)

(assert (=> b!1363466 (= lt!600779 e!773271)))

(declare-fun c!127538 () Bool)

(assert (=> b!1363466 (= c!127538 lt!600781)))

(declare-datatypes ((array!92687 0))(
  ( (array!92688 (arr!44775 (Array (_ BitVec 32) (_ BitVec 64))) (size!45325 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92687)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1363466 (= lt!600781 (validKeyInArray!0 (select (arr!44775 a!3742) from!3120)))))

(declare-fun b!1363467 () Bool)

(declare-fun res!907277 () Bool)

(assert (=> b!1363467 (=> (not res!907277) (not e!773269))))

(declare-datatypes ((List!31816 0))(
  ( (Nil!31813) (Cons!31812 (h!33021 (_ BitVec 64)) (t!46507 List!31816)) )
))
(declare-fun acc!759 () List!31816)

(declare-fun contains!9525 (List!31816 (_ BitVec 64)) Bool)

(assert (=> b!1363467 (= res!907277 (not (contains!9525 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1363468 () Bool)

(assert (=> b!1363468 (= e!773270 false)))

(declare-fun lt!600778 () Bool)

(declare-fun arrayNoDuplicates!0 (array!92687 (_ BitVec 32) List!31816) Bool)

(assert (=> b!1363468 (= lt!600778 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1363469 () Bool)

(declare-fun res!907278 () Bool)

(assert (=> b!1363469 (=> (not res!907278) (not e!773269))))

(assert (=> b!1363469 (= res!907278 (not (contains!9525 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!907279 () Bool)

(assert (=> start!115060 (=> (not res!907279) (not e!773269))))

(assert (=> start!115060 (= res!907279 (and (bvslt (size!45325 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45325 a!3742))))))

(assert (=> start!115060 e!773269))

(assert (=> start!115060 true))

(declare-fun array_inv!33803 (array!92687) Bool)

(assert (=> start!115060 (array_inv!33803 a!3742)))

(declare-fun b!1363470 () Bool)

(declare-fun res!907276 () Bool)

(assert (=> b!1363470 (=> (not res!907276) (not e!773269))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1363470 (= res!907276 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1363471 () Bool)

(declare-fun Unit!44987 () Unit!44985)

(assert (=> b!1363471 (= e!773271 Unit!44987)))

(declare-fun b!1363472 () Bool)

(declare-fun res!907275 () Bool)

(assert (=> b!1363472 (=> (not res!907275) (not e!773269))))

(declare-fun noDuplicate!2382 (List!31816) Bool)

(assert (=> b!1363472 (= res!907275 (noDuplicate!2382 acc!759))))

(declare-fun b!1363473 () Bool)

(declare-fun lt!600780 () Unit!44985)

(assert (=> b!1363473 (= e!773271 lt!600780)))

(declare-fun lt!600777 () Unit!44985)

(declare-fun lemmaListSubSeqRefl!0 (List!31816) Unit!44985)

(assert (=> b!1363473 (= lt!600777 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!927 (List!31816 List!31816) Bool)

(assert (=> b!1363473 (subseq!927 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92687 List!31816 List!31816 (_ BitVec 32)) Unit!44985)

(declare-fun $colon$colon!930 (List!31816 (_ BitVec 64)) List!31816)

(assert (=> b!1363473 (= lt!600780 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!930 acc!759 (select (arr!44775 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1363473 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1363474 () Bool)

(declare-fun res!907270 () Bool)

(assert (=> b!1363474 (=> (not res!907270) (not e!773269))))

(assert (=> b!1363474 (= res!907270 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45325 a!3742))))))

(declare-fun b!1363475 () Bool)

(declare-fun res!907273 () Bool)

(assert (=> b!1363475 (=> (not res!907273) (not e!773269))))

(assert (=> b!1363475 (= res!907273 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45325 a!3742)))))

(declare-fun b!1363476 () Bool)

(declare-fun res!907272 () Bool)

(assert (=> b!1363476 (=> (not res!907272) (not e!773269))))

(assert (=> b!1363476 (= res!907272 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31813))))

(declare-fun b!1363477 () Bool)

(declare-fun res!907274 () Bool)

(assert (=> b!1363477 (=> (not res!907274) (not e!773269))))

(assert (=> b!1363477 (= res!907274 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(assert (= (and start!115060 res!907279) b!1363472))

(assert (= (and b!1363472 res!907275) b!1363467))

(assert (= (and b!1363467 res!907277) b!1363469))

(assert (= (and b!1363469 res!907278) b!1363476))

(assert (= (and b!1363476 res!907272) b!1363477))

(assert (= (and b!1363477 res!907274) b!1363474))

(assert (= (and b!1363474 res!907270) b!1363470))

(assert (= (and b!1363470 res!907276) b!1363475))

(assert (= (and b!1363475 res!907273) b!1363466))

(assert (= (and b!1363466 c!127538) b!1363473))

(assert (= (and b!1363466 (not c!127538)) b!1363471))

(assert (= (and b!1363466 res!907271) b!1363468))

(declare-fun m!1248269 () Bool)

(assert (=> b!1363472 m!1248269))

(declare-fun m!1248271 () Bool)

(assert (=> b!1363469 m!1248271))

(declare-fun m!1248273 () Bool)

(assert (=> b!1363477 m!1248273))

(declare-fun m!1248275 () Bool)

(assert (=> b!1363473 m!1248275))

(declare-fun m!1248277 () Bool)

(assert (=> b!1363473 m!1248277))

(declare-fun m!1248279 () Bool)

(assert (=> b!1363473 m!1248279))

(declare-fun m!1248281 () Bool)

(assert (=> b!1363473 m!1248281))

(declare-fun m!1248283 () Bool)

(assert (=> b!1363473 m!1248283))

(assert (=> b!1363473 m!1248277))

(assert (=> b!1363473 m!1248279))

(declare-fun m!1248285 () Bool)

(assert (=> b!1363473 m!1248285))

(declare-fun m!1248287 () Bool)

(assert (=> start!115060 m!1248287))

(declare-fun m!1248289 () Bool)

(assert (=> b!1363467 m!1248289))

(declare-fun m!1248291 () Bool)

(assert (=> b!1363470 m!1248291))

(assert (=> b!1363468 m!1248283))

(assert (=> b!1363466 m!1248277))

(assert (=> b!1363466 m!1248277))

(declare-fun m!1248293 () Bool)

(assert (=> b!1363466 m!1248293))

(declare-fun m!1248295 () Bool)

(assert (=> b!1363476 m!1248295))

(check-sat (not b!1363476) (not b!1363477) (not b!1363473) (not b!1363467) (not b!1363469) (not b!1363468) (not b!1363472) (not start!115060) (not b!1363466) (not b!1363470))
(check-sat)
