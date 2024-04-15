; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114140 () Bool)

(assert start!114140)

(declare-fun b!1355656 () Bool)

(declare-fun res!900583 () Bool)

(declare-fun e!769808 () Bool)

(assert (=> b!1355656 (=> (not res!900583) (not e!769808))))

(declare-datatypes ((List!31703 0))(
  ( (Nil!31700) (Cons!31699 (h!32908 (_ BitVec 64)) (t!46353 List!31703)) )
))
(declare-fun acc!759 () List!31703)

(declare-datatypes ((array!92271 0))(
  ( (array!92272 (arr!44584 (Array (_ BitVec 32) (_ BitVec 64))) (size!45136 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92271)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92271 (_ BitVec 32) List!31703) Bool)

(assert (=> b!1355656 (= res!900583 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun res!900576 () Bool)

(assert (=> start!114140 (=> (not res!900576) (not e!769808))))

(assert (=> start!114140 (= res!900576 (and (bvslt (size!45136 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45136 a!3742))))))

(assert (=> start!114140 e!769808))

(assert (=> start!114140 true))

(declare-fun array_inv!33817 (array!92271) Bool)

(assert (=> start!114140 (array_inv!33817 a!3742)))

(declare-fun b!1355657 () Bool)

(declare-fun res!900577 () Bool)

(assert (=> b!1355657 (=> (not res!900577) (not e!769808))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1355657 (= res!900577 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1355658 () Bool)

(declare-datatypes ((Unit!44409 0))(
  ( (Unit!44410) )
))
(declare-fun e!769807 () Unit!44409)

(declare-fun lt!598565 () Unit!44409)

(assert (=> b!1355658 (= e!769807 lt!598565)))

(declare-fun lt!598566 () Unit!44409)

(declare-fun lemmaListSubSeqRefl!0 (List!31703) Unit!44409)

(assert (=> b!1355658 (= lt!598566 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!779 (List!31703 List!31703) Bool)

(assert (=> b!1355658 (subseq!779 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92271 List!31703 List!31703 (_ BitVec 32)) Unit!44409)

(declare-fun $colon$colon!796 (List!31703 (_ BitVec 64)) List!31703)

(assert (=> b!1355658 (= lt!598565 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!796 acc!759 (select (arr!44584 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1355658 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1355659 () Bool)

(declare-fun e!769810 () Bool)

(assert (=> b!1355659 (= e!769810 false)))

(declare-fun lt!598563 () Bool)

(assert (=> b!1355659 (= lt!598563 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1355660 () Bool)

(declare-fun res!900579 () Bool)

(assert (=> b!1355660 (=> (not res!900579) (not e!769808))))

(declare-fun contains!9323 (List!31703 (_ BitVec 64)) Bool)

(assert (=> b!1355660 (= res!900579 (not (contains!9323 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355661 () Bool)

(declare-fun res!900578 () Bool)

(assert (=> b!1355661 (=> (not res!900578) (not e!769808))))

(assert (=> b!1355661 (= res!900578 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31700))))

(declare-fun b!1355662 () Bool)

(declare-fun res!900582 () Bool)

(assert (=> b!1355662 (=> (not res!900582) (not e!769808))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1355662 (= res!900582 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45136 a!3742))))))

(declare-fun b!1355663 () Bool)

(declare-fun res!900575 () Bool)

(assert (=> b!1355663 (=> (not res!900575) (not e!769808))))

(assert (=> b!1355663 (= res!900575 (not (contains!9323 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355664 () Bool)

(assert (=> b!1355664 (= e!769808 e!769810)))

(declare-fun res!900584 () Bool)

(assert (=> b!1355664 (=> (not res!900584) (not e!769810))))

(declare-fun lt!598567 () Bool)

(assert (=> b!1355664 (= res!900584 (and (not (= from!3120 i!1404)) (not lt!598567) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!598564 () Unit!44409)

(assert (=> b!1355664 (= lt!598564 e!769807)))

(declare-fun c!126983 () Bool)

(assert (=> b!1355664 (= c!126983 lt!598567)))

(assert (=> b!1355664 (= lt!598567 (validKeyInArray!0 (select (arr!44584 a!3742) from!3120)))))

(declare-fun b!1355665 () Bool)

(declare-fun Unit!44411 () Unit!44409)

(assert (=> b!1355665 (= e!769807 Unit!44411)))

(declare-fun b!1355666 () Bool)

(declare-fun res!900580 () Bool)

(assert (=> b!1355666 (=> (not res!900580) (not e!769808))))

(declare-fun noDuplicate!2238 (List!31703) Bool)

(assert (=> b!1355666 (= res!900580 (noDuplicate!2238 acc!759))))

(declare-fun b!1355667 () Bool)

(declare-fun res!900581 () Bool)

(assert (=> b!1355667 (=> (not res!900581) (not e!769808))))

(assert (=> b!1355667 (= res!900581 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45136 a!3742)))))

(assert (= (and start!114140 res!900576) b!1355666))

(assert (= (and b!1355666 res!900580) b!1355663))

(assert (= (and b!1355663 res!900575) b!1355660))

(assert (= (and b!1355660 res!900579) b!1355661))

(assert (= (and b!1355661 res!900578) b!1355656))

(assert (= (and b!1355656 res!900583) b!1355662))

(assert (= (and b!1355662 res!900582) b!1355657))

(assert (= (and b!1355657 res!900577) b!1355667))

(assert (= (and b!1355667 res!900581) b!1355664))

(assert (= (and b!1355664 c!126983) b!1355658))

(assert (= (and b!1355664 (not c!126983)) b!1355665))

(assert (= (and b!1355664 res!900584) b!1355659))

(declare-fun m!1241329 () Bool)

(assert (=> b!1355663 m!1241329))

(declare-fun m!1241331 () Bool)

(assert (=> start!114140 m!1241331))

(declare-fun m!1241333 () Bool)

(assert (=> b!1355660 m!1241333))

(declare-fun m!1241335 () Bool)

(assert (=> b!1355657 m!1241335))

(declare-fun m!1241337 () Bool)

(assert (=> b!1355658 m!1241337))

(declare-fun m!1241339 () Bool)

(assert (=> b!1355658 m!1241339))

(declare-fun m!1241341 () Bool)

(assert (=> b!1355658 m!1241341))

(declare-fun m!1241343 () Bool)

(assert (=> b!1355658 m!1241343))

(declare-fun m!1241345 () Bool)

(assert (=> b!1355658 m!1241345))

(assert (=> b!1355658 m!1241339))

(assert (=> b!1355658 m!1241341))

(declare-fun m!1241347 () Bool)

(assert (=> b!1355658 m!1241347))

(declare-fun m!1241349 () Bool)

(assert (=> b!1355661 m!1241349))

(declare-fun m!1241351 () Bool)

(assert (=> b!1355666 m!1241351))

(assert (=> b!1355659 m!1241345))

(declare-fun m!1241353 () Bool)

(assert (=> b!1355656 m!1241353))

(assert (=> b!1355664 m!1241339))

(assert (=> b!1355664 m!1241339))

(declare-fun m!1241355 () Bool)

(assert (=> b!1355664 m!1241355))

(check-sat (not b!1355660) (not b!1355656) (not b!1355664) (not start!114140) (not b!1355666) (not b!1355663) (not b!1355658) (not b!1355657) (not b!1355659) (not b!1355661))
(check-sat)
