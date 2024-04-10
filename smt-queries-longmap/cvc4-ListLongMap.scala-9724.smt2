; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115074 () Bool)

(assert start!115074)

(declare-fun b!1363726 () Bool)

(declare-fun res!907494 () Bool)

(declare-fun e!773353 () Bool)

(assert (=> b!1363726 (=> (not res!907494) (not e!773353))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-datatypes ((array!92701 0))(
  ( (array!92702 (arr!44782 (Array (_ BitVec 32) (_ BitVec 64))) (size!45332 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92701)

(assert (=> b!1363726 (= res!907494 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45332 a!3742)))))

(declare-fun b!1363727 () Bool)

(declare-fun res!907495 () Bool)

(assert (=> b!1363727 (=> (not res!907495) (not e!773353))))

(declare-datatypes ((List!31823 0))(
  ( (Nil!31820) (Cons!31819 (h!33028 (_ BitVec 64)) (t!46514 List!31823)) )
))
(declare-fun arrayNoDuplicates!0 (array!92701 (_ BitVec 32) List!31823) Bool)

(assert (=> b!1363727 (= res!907495 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31820))))

(declare-fun b!1363728 () Bool)

(declare-fun res!907491 () Bool)

(assert (=> b!1363728 (=> (not res!907491) (not e!773353))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1363728 (= res!907491 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45332 a!3742))))))

(declare-fun b!1363730 () Bool)

(declare-datatypes ((Unit!45006 0))(
  ( (Unit!45007) )
))
(declare-fun e!773354 () Unit!45006)

(declare-fun lt!600877 () Unit!45006)

(assert (=> b!1363730 (= e!773354 lt!600877)))

(declare-fun lt!600875 () Unit!45006)

(declare-fun acc!759 () List!31823)

(declare-fun lemmaListSubSeqRefl!0 (List!31823) Unit!45006)

(assert (=> b!1363730 (= lt!600875 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!934 (List!31823 List!31823) Bool)

(assert (=> b!1363730 (subseq!934 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92701 List!31823 List!31823 (_ BitVec 32)) Unit!45006)

(declare-fun $colon$colon!937 (List!31823 (_ BitVec 64)) List!31823)

(assert (=> b!1363730 (= lt!600877 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!937 acc!759 (select (arr!44782 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1363730 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1363731 () Bool)

(declare-fun e!773356 () Bool)

(assert (=> b!1363731 (= e!773353 e!773356)))

(declare-fun res!907488 () Bool)

(assert (=> b!1363731 (=> (not res!907488) (not e!773356))))

(declare-fun lt!600874 () Bool)

(assert (=> b!1363731 (= res!907488 (and (not (= from!3120 i!1404)) (not lt!600874) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!600876 () Unit!45006)

(assert (=> b!1363731 (= lt!600876 e!773354)))

(declare-fun c!127559 () Bool)

(assert (=> b!1363731 (= c!127559 lt!600874)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1363731 (= lt!600874 (validKeyInArray!0 (select (arr!44782 a!3742) from!3120)))))

(declare-fun b!1363732 () Bool)

(declare-fun res!907498 () Bool)

(assert (=> b!1363732 (=> (not res!907498) (not e!773353))))

(declare-fun contains!9532 (List!31823 (_ BitVec 64)) Bool)

(assert (=> b!1363732 (= res!907498 (not (contains!9532 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1363733 () Bool)

(declare-fun res!907497 () Bool)

(assert (=> b!1363733 (=> (not res!907497) (not e!773353))))

(assert (=> b!1363733 (= res!907497 (not (contains!9532 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1363734 () Bool)

(assert (=> b!1363734 (= e!773356 (bvsge (bvsub (size!45332 a!3742) (bvadd #b00000000000000000000000000000001 from!3120)) (bvsub (size!45332 a!3742) from!3120)))))

(declare-fun b!1363735 () Bool)

(declare-fun res!907493 () Bool)

(assert (=> b!1363735 (=> (not res!907493) (not e!773353))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1363735 (= res!907493 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1363736 () Bool)

(declare-fun res!907492 () Bool)

(assert (=> b!1363736 (=> (not res!907492) (not e!773356))))

(assert (=> b!1363736 (= res!907492 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun res!907490 () Bool)

(assert (=> start!115074 (=> (not res!907490) (not e!773353))))

(assert (=> start!115074 (= res!907490 (and (bvslt (size!45332 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45332 a!3742))))))

(assert (=> start!115074 e!773353))

(assert (=> start!115074 true))

(declare-fun array_inv!33810 (array!92701) Bool)

(assert (=> start!115074 (array_inv!33810 a!3742)))

(declare-fun b!1363729 () Bool)

(declare-fun res!907489 () Bool)

(assert (=> b!1363729 (=> (not res!907489) (not e!773353))))

(assert (=> b!1363729 (= res!907489 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1363737 () Bool)

(declare-fun res!907496 () Bool)

(assert (=> b!1363737 (=> (not res!907496) (not e!773353))))

(declare-fun noDuplicate!2389 (List!31823) Bool)

(assert (=> b!1363737 (= res!907496 (noDuplicate!2389 acc!759))))

(declare-fun b!1363738 () Bool)

(declare-fun Unit!45008 () Unit!45006)

(assert (=> b!1363738 (= e!773354 Unit!45008)))

(assert (= (and start!115074 res!907490) b!1363737))

(assert (= (and b!1363737 res!907496) b!1363733))

(assert (= (and b!1363733 res!907497) b!1363732))

(assert (= (and b!1363732 res!907498) b!1363727))

(assert (= (and b!1363727 res!907495) b!1363729))

(assert (= (and b!1363729 res!907489) b!1363728))

(assert (= (and b!1363728 res!907491) b!1363735))

(assert (= (and b!1363735 res!907493) b!1363726))

(assert (= (and b!1363726 res!907494) b!1363731))

(assert (= (and b!1363731 c!127559) b!1363730))

(assert (= (and b!1363731 (not c!127559)) b!1363738))

(assert (= (and b!1363731 res!907488) b!1363736))

(assert (= (and b!1363736 res!907492) b!1363734))

(declare-fun m!1248465 () Bool)

(assert (=> b!1363731 m!1248465))

(assert (=> b!1363731 m!1248465))

(declare-fun m!1248467 () Bool)

(assert (=> b!1363731 m!1248467))

(declare-fun m!1248469 () Bool)

(assert (=> b!1363727 m!1248469))

(declare-fun m!1248471 () Bool)

(assert (=> b!1363732 m!1248471))

(declare-fun m!1248473 () Bool)

(assert (=> b!1363736 m!1248473))

(declare-fun m!1248475 () Bool)

(assert (=> b!1363729 m!1248475))

(declare-fun m!1248477 () Bool)

(assert (=> b!1363730 m!1248477))

(assert (=> b!1363730 m!1248465))

(declare-fun m!1248479 () Bool)

(assert (=> b!1363730 m!1248479))

(declare-fun m!1248481 () Bool)

(assert (=> b!1363730 m!1248481))

(assert (=> b!1363730 m!1248473))

(assert (=> b!1363730 m!1248465))

(assert (=> b!1363730 m!1248479))

(declare-fun m!1248483 () Bool)

(assert (=> b!1363730 m!1248483))

(declare-fun m!1248485 () Bool)

(assert (=> start!115074 m!1248485))

(declare-fun m!1248487 () Bool)

(assert (=> b!1363735 m!1248487))

(declare-fun m!1248489 () Bool)

(assert (=> b!1363733 m!1248489))

(declare-fun m!1248491 () Bool)

(assert (=> b!1363737 m!1248491))

(push 1)

(assert (not start!115074))

(assert (not b!1363733))

(assert (not b!1363730))

(assert (not b!1363736))

(assert (not b!1363729))

(assert (not b!1363727))

(assert (not b!1363737))

(assert (not b!1363732))

(assert (not b!1363735))

(assert (not b!1363731))

(check-sat)

(pop 1)

(push 1)

(check-sat)

