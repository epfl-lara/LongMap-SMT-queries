; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114674 () Bool)

(assert start!114674)

(declare-fun b!1360365 () Bool)

(declare-datatypes ((Unit!44820 0))(
  ( (Unit!44821) )
))
(declare-fun e!771792 () Unit!44820)

(declare-fun Unit!44822 () Unit!44820)

(assert (=> b!1360365 (= e!771792 Unit!44822)))

(declare-fun b!1360366 () Bool)

(declare-fun res!904679 () Bool)

(declare-fun e!771791 () Bool)

(assert (=> b!1360366 (=> (not res!904679) (not e!771791))))

(declare-datatypes ((List!31761 0))(
  ( (Nil!31758) (Cons!31757 (h!32966 (_ BitVec 64)) (t!46437 List!31761)) )
))
(declare-fun acc!759 () List!31761)

(declare-fun contains!9470 (List!31761 (_ BitVec 64)) Bool)

(assert (=> b!1360366 (= res!904679 (not (contains!9470 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1360367 () Bool)

(declare-fun res!904678 () Bool)

(assert (=> b!1360367 (=> (not res!904678) (not e!771791))))

(declare-fun noDuplicate!2327 (List!31761) Bool)

(assert (=> b!1360367 (= res!904678 (noDuplicate!2327 acc!759))))

(declare-fun lt!599863 () Bool)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun b!1360368 () Bool)

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1360368 (= e!771791 (and (not (= from!3120 i!1404)) lt!599863 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!599866 () Unit!44820)

(assert (=> b!1360368 (= lt!599866 e!771792)))

(declare-fun c!127286 () Bool)

(assert (=> b!1360368 (= c!127286 lt!599863)))

(declare-datatypes ((array!92562 0))(
  ( (array!92563 (arr!44720 (Array (_ BitVec 32) (_ BitVec 64))) (size!45270 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92562)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1360368 (= lt!599863 (validKeyInArray!0 (select (arr!44720 a!3742) from!3120)))))

(declare-fun b!1360369 () Bool)

(declare-fun res!904676 () Bool)

(assert (=> b!1360369 (=> (not res!904676) (not e!771791))))

(assert (=> b!1360369 (= res!904676 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45270 a!3742))))))

(declare-fun b!1360370 () Bool)

(declare-fun lt!599865 () Unit!44820)

(assert (=> b!1360370 (= e!771792 lt!599865)))

(declare-fun lt!599864 () Unit!44820)

(declare-fun lemmaListSubSeqRefl!0 (List!31761) Unit!44820)

(assert (=> b!1360370 (= lt!599864 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!872 (List!31761 List!31761) Bool)

(assert (=> b!1360370 (subseq!872 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92562 List!31761 List!31761 (_ BitVec 32)) Unit!44820)

(declare-fun $colon$colon!875 (List!31761 (_ BitVec 64)) List!31761)

(assert (=> b!1360370 (= lt!599865 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!875 acc!759 (select (arr!44720 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92562 (_ BitVec 32) List!31761) Bool)

(assert (=> b!1360370 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1360371 () Bool)

(declare-fun res!904673 () Bool)

(assert (=> b!1360371 (=> (not res!904673) (not e!771791))))

(assert (=> b!1360371 (= res!904673 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1360372 () Bool)

(declare-fun res!904675 () Bool)

(assert (=> b!1360372 (=> (not res!904675) (not e!771791))))

(assert (=> b!1360372 (= res!904675 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45270 a!3742)))))

(declare-fun b!1360373 () Bool)

(declare-fun res!904681 () Bool)

(assert (=> b!1360373 (=> (not res!904681) (not e!771791))))

(assert (=> b!1360373 (= res!904681 (not (contains!9470 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!904680 () Bool)

(assert (=> start!114674 (=> (not res!904680) (not e!771791))))

(assert (=> start!114674 (= res!904680 (and (bvslt (size!45270 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45270 a!3742))))))

(assert (=> start!114674 e!771791))

(assert (=> start!114674 true))

(declare-fun array_inv!33748 (array!92562) Bool)

(assert (=> start!114674 (array_inv!33748 a!3742)))

(declare-fun b!1360374 () Bool)

(declare-fun res!904677 () Bool)

(assert (=> b!1360374 (=> (not res!904677) (not e!771791))))

(assert (=> b!1360374 (= res!904677 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31758))))

(declare-fun b!1360375 () Bool)

(declare-fun res!904674 () Bool)

(assert (=> b!1360375 (=> (not res!904674) (not e!771791))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1360375 (= res!904674 (not (validKeyInArray!0 l!3587)))))

(assert (= (and start!114674 res!904680) b!1360367))

(assert (= (and b!1360367 res!904678) b!1360373))

(assert (= (and b!1360373 res!904681) b!1360366))

(assert (= (and b!1360366 res!904679) b!1360374))

(assert (= (and b!1360374 res!904677) b!1360371))

(assert (= (and b!1360371 res!904673) b!1360369))

(assert (= (and b!1360369 res!904676) b!1360375))

(assert (= (and b!1360375 res!904674) b!1360372))

(assert (= (and b!1360372 res!904675) b!1360368))

(assert (= (and b!1360368 c!127286) b!1360370))

(assert (= (and b!1360368 (not c!127286)) b!1360365))

(declare-fun m!1245649 () Bool)

(assert (=> b!1360368 m!1245649))

(assert (=> b!1360368 m!1245649))

(declare-fun m!1245651 () Bool)

(assert (=> b!1360368 m!1245651))

(declare-fun m!1245653 () Bool)

(assert (=> b!1360366 m!1245653))

(declare-fun m!1245655 () Bool)

(assert (=> b!1360370 m!1245655))

(assert (=> b!1360370 m!1245649))

(declare-fun m!1245657 () Bool)

(assert (=> b!1360370 m!1245657))

(declare-fun m!1245659 () Bool)

(assert (=> b!1360370 m!1245659))

(declare-fun m!1245661 () Bool)

(assert (=> b!1360370 m!1245661))

(assert (=> b!1360370 m!1245649))

(assert (=> b!1360370 m!1245657))

(declare-fun m!1245663 () Bool)

(assert (=> b!1360370 m!1245663))

(declare-fun m!1245665 () Bool)

(assert (=> b!1360374 m!1245665))

(declare-fun m!1245667 () Bool)

(assert (=> b!1360371 m!1245667))

(declare-fun m!1245669 () Bool)

(assert (=> b!1360367 m!1245669))

(declare-fun m!1245671 () Bool)

(assert (=> start!114674 m!1245671))

(declare-fun m!1245673 () Bool)

(assert (=> b!1360373 m!1245673))

(declare-fun m!1245675 () Bool)

(assert (=> b!1360375 m!1245675))

(push 1)

