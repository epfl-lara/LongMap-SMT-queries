; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115058 () Bool)

(assert start!115058)

(declare-fun b!1363360 () Bool)

(declare-fun res!907216 () Bool)

(declare-fun e!773226 () Bool)

(assert (=> b!1363360 (=> (not res!907216) (not e!773226))))

(declare-datatypes ((array!92634 0))(
  ( (array!92635 (arr!44749 (Array (_ BitVec 32) (_ BitVec 64))) (size!45301 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92634)

(declare-datatypes ((List!31868 0))(
  ( (Nil!31865) (Cons!31864 (h!33073 (_ BitVec 64)) (t!46551 List!31868)) )
))
(declare-fun arrayNoDuplicates!0 (array!92634 (_ BitVec 32) List!31868) Bool)

(assert (=> b!1363360 (= res!907216 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31865))))

(declare-fun b!1363361 () Bool)

(declare-fun res!907220 () Bool)

(assert (=> b!1363361 (=> (not res!907220) (not e!773226))))

(declare-fun acc!759 () List!31868)

(declare-fun contains!9488 (List!31868 (_ BitVec 64)) Bool)

(assert (=> b!1363361 (= res!907220 (not (contains!9488 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1363363 () Bool)

(declare-fun e!773225 () Bool)

(assert (=> b!1363363 (= e!773226 e!773225)))

(declare-fun res!907219 () Bool)

(assert (=> b!1363363 (=> (not res!907219) (not e!773225))))

(declare-fun lt!600579 () Bool)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1363363 (= res!907219 (and (not (= from!3120 i!1404)) (not lt!600579) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!44823 0))(
  ( (Unit!44824) )
))
(declare-fun lt!600577 () Unit!44823)

(declare-fun e!773224 () Unit!44823)

(assert (=> b!1363363 (= lt!600577 e!773224)))

(declare-fun c!127517 () Bool)

(assert (=> b!1363363 (= c!127517 lt!600579)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1363363 (= lt!600579 (validKeyInArray!0 (select (arr!44749 a!3742) from!3120)))))

(declare-fun b!1363364 () Bool)

(declare-fun res!907212 () Bool)

(assert (=> b!1363364 (=> (not res!907212) (not e!773226))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1363364 (= res!907212 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1363365 () Bool)

(declare-fun res!907214 () Bool)

(assert (=> b!1363365 (=> (not res!907214) (not e!773226))))

(assert (=> b!1363365 (= res!907214 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45301 a!3742))))))

(declare-fun b!1363366 () Bool)

(declare-fun lt!600578 () Unit!44823)

(assert (=> b!1363366 (= e!773224 lt!600578)))

(declare-fun lt!600580 () Unit!44823)

(declare-fun lemmaListSubSeqRefl!0 (List!31868) Unit!44823)

(assert (=> b!1363366 (= lt!600580 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!926 (List!31868 List!31868) Bool)

(assert (=> b!1363366 (subseq!926 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92634 List!31868 List!31868 (_ BitVec 32)) Unit!44823)

(declare-fun $colon$colon!931 (List!31868 (_ BitVec 64)) List!31868)

(assert (=> b!1363366 (= lt!600578 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!931 acc!759 (select (arr!44749 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1363366 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1363367 () Bool)

(assert (=> b!1363367 (= e!773225 false)))

(declare-fun lt!600576 () Bool)

(assert (=> b!1363367 (= lt!600576 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1363368 () Bool)

(declare-fun res!907211 () Bool)

(assert (=> b!1363368 (=> (not res!907211) (not e!773226))))

(assert (=> b!1363368 (= res!907211 (not (contains!9488 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1363369 () Bool)

(declare-fun res!907218 () Bool)

(assert (=> b!1363369 (=> (not res!907218) (not e!773226))))

(assert (=> b!1363369 (= res!907218 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1363362 () Bool)

(declare-fun res!907217 () Bool)

(assert (=> b!1363362 (=> (not res!907217) (not e!773226))))

(declare-fun noDuplicate!2403 (List!31868) Bool)

(assert (=> b!1363362 (= res!907217 (noDuplicate!2403 acc!759))))

(declare-fun res!907215 () Bool)

(assert (=> start!115058 (=> (not res!907215) (not e!773226))))

(assert (=> start!115058 (= res!907215 (and (bvslt (size!45301 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45301 a!3742))))))

(assert (=> start!115058 e!773226))

(assert (=> start!115058 true))

(declare-fun array_inv!33982 (array!92634) Bool)

(assert (=> start!115058 (array_inv!33982 a!3742)))

(declare-fun b!1363370 () Bool)

(declare-fun Unit!44825 () Unit!44823)

(assert (=> b!1363370 (= e!773224 Unit!44825)))

(declare-fun b!1363371 () Bool)

(declare-fun res!907213 () Bool)

(assert (=> b!1363371 (=> (not res!907213) (not e!773226))))

(assert (=> b!1363371 (= res!907213 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45301 a!3742)))))

(assert (= (and start!115058 res!907215) b!1363362))

(assert (= (and b!1363362 res!907217) b!1363368))

(assert (= (and b!1363368 res!907211) b!1363361))

(assert (= (and b!1363361 res!907220) b!1363360))

(assert (= (and b!1363360 res!907216) b!1363369))

(assert (= (and b!1363369 res!907218) b!1363365))

(assert (= (and b!1363365 res!907214) b!1363364))

(assert (= (and b!1363364 res!907212) b!1363371))

(assert (= (and b!1363371 res!907213) b!1363363))

(assert (= (and b!1363363 c!127517) b!1363366))

(assert (= (and b!1363363 (not c!127517)) b!1363370))

(assert (= (and b!1363363 res!907219) b!1363367))

(declare-fun m!1247725 () Bool)

(assert (=> b!1363361 m!1247725))

(declare-fun m!1247727 () Bool)

(assert (=> b!1363368 m!1247727))

(declare-fun m!1247729 () Bool)

(assert (=> b!1363360 m!1247729))

(declare-fun m!1247731 () Bool)

(assert (=> b!1363362 m!1247731))

(declare-fun m!1247733 () Bool)

(assert (=> b!1363366 m!1247733))

(declare-fun m!1247735 () Bool)

(assert (=> b!1363366 m!1247735))

(declare-fun m!1247737 () Bool)

(assert (=> b!1363366 m!1247737))

(declare-fun m!1247739 () Bool)

(assert (=> b!1363366 m!1247739))

(declare-fun m!1247741 () Bool)

(assert (=> b!1363366 m!1247741))

(assert (=> b!1363366 m!1247735))

(assert (=> b!1363366 m!1247737))

(declare-fun m!1247743 () Bool)

(assert (=> b!1363366 m!1247743))

(assert (=> b!1363363 m!1247735))

(assert (=> b!1363363 m!1247735))

(declare-fun m!1247745 () Bool)

(assert (=> b!1363363 m!1247745))

(declare-fun m!1247747 () Bool)

(assert (=> b!1363369 m!1247747))

(declare-fun m!1247749 () Bool)

(assert (=> start!115058 m!1247749))

(declare-fun m!1247751 () Bool)

(assert (=> b!1363364 m!1247751))

(assert (=> b!1363367 m!1247741))

(check-sat (not b!1363360) (not b!1363364) (not b!1363368) (not start!115058) (not b!1363361) (not b!1363366) (not b!1363362) (not b!1363367) (not b!1363363) (not b!1363369))
(check-sat)
