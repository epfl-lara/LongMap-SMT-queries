; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114584 () Bool)

(assert start!114584)

(declare-fun b!1359576 () Bool)

(declare-fun res!904064 () Bool)

(declare-fun e!771439 () Bool)

(assert (=> b!1359576 (=> (not res!904064) (not e!771439))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1359576 (= res!904064 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1359577 () Bool)

(declare-fun res!904059 () Bool)

(assert (=> b!1359577 (=> (not res!904059) (not e!771439))))

(declare-datatypes ((array!92478 0))(
  ( (array!92479 (arr!44680 (Array (_ BitVec 32) (_ BitVec 64))) (size!45232 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92478)

(declare-datatypes ((List!31799 0))(
  ( (Nil!31796) (Cons!31795 (h!33004 (_ BitVec 64)) (t!46464 List!31799)) )
))
(declare-fun arrayNoDuplicates!0 (array!92478 (_ BitVec 32) List!31799) Bool)

(assert (=> b!1359577 (= res!904059 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31796))))

(declare-fun b!1359578 () Bool)

(declare-datatypes ((Unit!44616 0))(
  ( (Unit!44617) )
))
(declare-fun e!771437 () Unit!44616)

(declare-fun Unit!44618 () Unit!44616)

(assert (=> b!1359578 (= e!771437 Unit!44618)))

(declare-fun b!1359579 () Bool)

(declare-fun res!904065 () Bool)

(assert (=> b!1359579 (=> (not res!904065) (not e!771439))))

(declare-fun acc!759 () List!31799)

(declare-fun noDuplicate!2334 (List!31799) Bool)

(assert (=> b!1359579 (= res!904065 (noDuplicate!2334 acc!759))))

(declare-fun b!1359580 () Bool)

(declare-fun res!904057 () Bool)

(assert (=> b!1359580 (=> (not res!904057) (not e!771439))))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> b!1359580 (= res!904057 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45232 a!3742)))))

(declare-fun b!1359581 () Bool)

(declare-fun res!904063 () Bool)

(assert (=> b!1359581 (=> (not res!904063) (not e!771439))))

(assert (=> b!1359581 (= res!904063 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1359582 () Bool)

(declare-fun e!771436 () Bool)

(assert (=> b!1359582 (= e!771436 (not true))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1359582 (arrayNoDuplicates!0 (array!92479 (store (arr!44680 a!3742) i!1404 l!3587) (size!45232 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun lt!599479 () Unit!44616)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92478 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31799) Unit!44616)

(assert (=> b!1359582 (= lt!599479 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1359584 () Bool)

(declare-fun res!904067 () Bool)

(assert (=> b!1359584 (=> (not res!904067) (not e!771439))))

(assert (=> b!1359584 (= res!904067 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45232 a!3742))))))

(declare-fun b!1359585 () Bool)

(declare-fun res!904066 () Bool)

(assert (=> b!1359585 (=> (not res!904066) (not e!771439))))

(declare-fun contains!9419 (List!31799 (_ BitVec 64)) Bool)

(assert (=> b!1359585 (= res!904066 (not (contains!9419 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1359586 () Bool)

(declare-fun res!904058 () Bool)

(assert (=> b!1359586 (=> (not res!904058) (not e!771439))))

(assert (=> b!1359586 (= res!904058 (not (contains!9419 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1359587 () Bool)

(declare-fun lt!599477 () Unit!44616)

(assert (=> b!1359587 (= e!771437 lt!599477)))

(declare-fun lt!599476 () Unit!44616)

(declare-fun lemmaListSubSeqRefl!0 (List!31799) Unit!44616)

(assert (=> b!1359587 (= lt!599476 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!857 (List!31799 List!31799) Bool)

(assert (=> b!1359587 (subseq!857 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92478 List!31799 List!31799 (_ BitVec 32)) Unit!44616)

(declare-fun $colon$colon!862 (List!31799 (_ BitVec 64)) List!31799)

(assert (=> b!1359587 (= lt!599477 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!862 acc!759 (select (arr!44680 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1359587 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1359588 () Bool)

(assert (=> b!1359588 (= e!771439 e!771436)))

(declare-fun res!904060 () Bool)

(assert (=> b!1359588 (=> (not res!904060) (not e!771436))))

(assert (=> b!1359588 (= res!904060 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!599478 () Unit!44616)

(assert (=> b!1359588 (= lt!599478 e!771437)))

(declare-fun c!127202 () Bool)

(assert (=> b!1359588 (= c!127202 (validKeyInArray!0 (select (arr!44680 a!3742) from!3120)))))

(declare-fun res!904061 () Bool)

(assert (=> start!114584 (=> (not res!904061) (not e!771439))))

(assert (=> start!114584 (= res!904061 (and (bvslt (size!45232 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45232 a!3742))))))

(assert (=> start!114584 e!771439))

(assert (=> start!114584 true))

(declare-fun array_inv!33913 (array!92478) Bool)

(assert (=> start!114584 (array_inv!33913 a!3742)))

(declare-fun b!1359583 () Bool)

(declare-fun res!904062 () Bool)

(assert (=> b!1359583 (=> (not res!904062) (not e!771436))))

(assert (=> b!1359583 (= res!904062 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(assert (= (and start!114584 res!904061) b!1359579))

(assert (= (and b!1359579 res!904065) b!1359585))

(assert (= (and b!1359585 res!904066) b!1359586))

(assert (= (and b!1359586 res!904058) b!1359577))

(assert (= (and b!1359577 res!904059) b!1359581))

(assert (= (and b!1359581 res!904063) b!1359584))

(assert (= (and b!1359584 res!904067) b!1359576))

(assert (= (and b!1359576 res!904064) b!1359580))

(assert (= (and b!1359580 res!904057) b!1359588))

(assert (= (and b!1359588 c!127202) b!1359587))

(assert (= (and b!1359588 (not c!127202)) b!1359578))

(assert (= (and b!1359588 res!904060) b!1359583))

(assert (= (and b!1359583 res!904062) b!1359582))

(declare-fun m!1244485 () Bool)

(assert (=> start!114584 m!1244485))

(declare-fun m!1244487 () Bool)

(assert (=> b!1359588 m!1244487))

(assert (=> b!1359588 m!1244487))

(declare-fun m!1244489 () Bool)

(assert (=> b!1359588 m!1244489))

(declare-fun m!1244491 () Bool)

(assert (=> b!1359576 m!1244491))

(declare-fun m!1244493 () Bool)

(assert (=> b!1359585 m!1244493))

(declare-fun m!1244495 () Bool)

(assert (=> b!1359577 m!1244495))

(declare-fun m!1244497 () Bool)

(assert (=> b!1359587 m!1244497))

(assert (=> b!1359587 m!1244487))

(declare-fun m!1244499 () Bool)

(assert (=> b!1359587 m!1244499))

(declare-fun m!1244501 () Bool)

(assert (=> b!1359587 m!1244501))

(declare-fun m!1244503 () Bool)

(assert (=> b!1359587 m!1244503))

(assert (=> b!1359587 m!1244487))

(assert (=> b!1359587 m!1244499))

(declare-fun m!1244505 () Bool)

(assert (=> b!1359587 m!1244505))

(declare-fun m!1244507 () Bool)

(assert (=> b!1359579 m!1244507))

(declare-fun m!1244509 () Bool)

(assert (=> b!1359582 m!1244509))

(declare-fun m!1244511 () Bool)

(assert (=> b!1359582 m!1244511))

(declare-fun m!1244513 () Bool)

(assert (=> b!1359582 m!1244513))

(declare-fun m!1244515 () Bool)

(assert (=> b!1359581 m!1244515))

(declare-fun m!1244517 () Bool)

(assert (=> b!1359586 m!1244517))

(assert (=> b!1359583 m!1244503))

(check-sat (not b!1359588) (not b!1359577) (not b!1359586) (not b!1359582) (not b!1359576) (not b!1359585) (not b!1359583) (not b!1359581) (not start!114584) (not b!1359587) (not b!1359579))
(check-sat)
