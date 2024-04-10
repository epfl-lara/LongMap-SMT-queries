; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114676 () Bool)

(assert start!114676)

(declare-fun b!1360398 () Bool)

(declare-datatypes ((Unit!44823 0))(
  ( (Unit!44824) )
))
(declare-fun e!771802 () Unit!44823)

(declare-fun lt!599876 () Unit!44823)

(assert (=> b!1360398 (= e!771802 lt!599876)))

(declare-fun lt!599878 () Unit!44823)

(declare-datatypes ((List!31762 0))(
  ( (Nil!31759) (Cons!31758 (h!32967 (_ BitVec 64)) (t!46438 List!31762)) )
))
(declare-fun acc!759 () List!31762)

(declare-fun lemmaListSubSeqRefl!0 (List!31762) Unit!44823)

(assert (=> b!1360398 (= lt!599878 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!873 (List!31762 List!31762) Bool)

(assert (=> b!1360398 (subseq!873 acc!759 acc!759)))

(declare-datatypes ((array!92564 0))(
  ( (array!92565 (arr!44721 (Array (_ BitVec 32) (_ BitVec 64))) (size!45271 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92564)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92564 List!31762 List!31762 (_ BitVec 32)) Unit!44823)

(declare-fun $colon$colon!876 (List!31762 (_ BitVec 64)) List!31762)

(assert (=> b!1360398 (= lt!599876 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!876 acc!759 (select (arr!44721 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92564 (_ BitVec 32) List!31762) Bool)

(assert (=> b!1360398 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun lt!599877 () Bool)

(declare-fun b!1360399 () Bool)

(declare-fun e!771800 () Bool)

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1360399 (= e!771800 (and (not (= from!3120 i!1404)) lt!599877 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!599875 () Unit!44823)

(assert (=> b!1360399 (= lt!599875 e!771802)))

(declare-fun c!127289 () Bool)

(assert (=> b!1360399 (= c!127289 lt!599877)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1360399 (= lt!599877 (validKeyInArray!0 (select (arr!44721 a!3742) from!3120)))))

(declare-fun res!904708 () Bool)

(assert (=> start!114676 (=> (not res!904708) (not e!771800))))

(assert (=> start!114676 (= res!904708 (and (bvslt (size!45271 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45271 a!3742))))))

(assert (=> start!114676 e!771800))

(assert (=> start!114676 true))

(declare-fun array_inv!33749 (array!92564) Bool)

(assert (=> start!114676 (array_inv!33749 a!3742)))

(declare-fun b!1360400 () Bool)

(declare-fun res!904705 () Bool)

(assert (=> b!1360400 (=> (not res!904705) (not e!771800))))

(assert (=> b!1360400 (= res!904705 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31759))))

(declare-fun b!1360401 () Bool)

(declare-fun res!904701 () Bool)

(assert (=> b!1360401 (=> (not res!904701) (not e!771800))))

(declare-fun contains!9471 (List!31762 (_ BitVec 64)) Bool)

(assert (=> b!1360401 (= res!904701 (not (contains!9471 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1360402 () Bool)

(declare-fun Unit!44825 () Unit!44823)

(assert (=> b!1360402 (= e!771802 Unit!44825)))

(declare-fun b!1360403 () Bool)

(declare-fun res!904707 () Bool)

(assert (=> b!1360403 (=> (not res!904707) (not e!771800))))

(assert (=> b!1360403 (= res!904707 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1360404 () Bool)

(declare-fun res!904704 () Bool)

(assert (=> b!1360404 (=> (not res!904704) (not e!771800))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1360404 (= res!904704 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1360405 () Bool)

(declare-fun res!904702 () Bool)

(assert (=> b!1360405 (=> (not res!904702) (not e!771800))))

(assert (=> b!1360405 (= res!904702 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45271 a!3742)))))

(declare-fun b!1360406 () Bool)

(declare-fun res!904700 () Bool)

(assert (=> b!1360406 (=> (not res!904700) (not e!771800))))

(assert (=> b!1360406 (= res!904700 (not (contains!9471 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1360407 () Bool)

(declare-fun res!904706 () Bool)

(assert (=> b!1360407 (=> (not res!904706) (not e!771800))))

(declare-fun noDuplicate!2328 (List!31762) Bool)

(assert (=> b!1360407 (= res!904706 (noDuplicate!2328 acc!759))))

(declare-fun b!1360408 () Bool)

(declare-fun res!904703 () Bool)

(assert (=> b!1360408 (=> (not res!904703) (not e!771800))))

(assert (=> b!1360408 (= res!904703 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45271 a!3742))))))

(assert (= (and start!114676 res!904708) b!1360407))

(assert (= (and b!1360407 res!904706) b!1360406))

(assert (= (and b!1360406 res!904700) b!1360401))

(assert (= (and b!1360401 res!904701) b!1360400))

(assert (= (and b!1360400 res!904705) b!1360403))

(assert (= (and b!1360403 res!904707) b!1360408))

(assert (= (and b!1360408 res!904703) b!1360404))

(assert (= (and b!1360404 res!904704) b!1360405))

(assert (= (and b!1360405 res!904702) b!1360399))

(assert (= (and b!1360399 c!127289) b!1360398))

(assert (= (and b!1360399 (not c!127289)) b!1360402))

(declare-fun m!1245677 () Bool)

(assert (=> b!1360399 m!1245677))

(assert (=> b!1360399 m!1245677))

(declare-fun m!1245679 () Bool)

(assert (=> b!1360399 m!1245679))

(declare-fun m!1245681 () Bool)

(assert (=> b!1360398 m!1245681))

(assert (=> b!1360398 m!1245677))

(declare-fun m!1245683 () Bool)

(assert (=> b!1360398 m!1245683))

(declare-fun m!1245685 () Bool)

(assert (=> b!1360398 m!1245685))

(declare-fun m!1245687 () Bool)

(assert (=> b!1360398 m!1245687))

(assert (=> b!1360398 m!1245677))

(assert (=> b!1360398 m!1245683))

(declare-fun m!1245689 () Bool)

(assert (=> b!1360398 m!1245689))

(declare-fun m!1245691 () Bool)

(assert (=> b!1360400 m!1245691))

(declare-fun m!1245693 () Bool)

(assert (=> b!1360404 m!1245693))

(declare-fun m!1245695 () Bool)

(assert (=> b!1360403 m!1245695))

(declare-fun m!1245697 () Bool)

(assert (=> b!1360401 m!1245697))

(declare-fun m!1245699 () Bool)

(assert (=> b!1360407 m!1245699))

(declare-fun m!1245701 () Bool)

(assert (=> start!114676 m!1245701))

(declare-fun m!1245703 () Bool)

(assert (=> b!1360406 m!1245703))

(check-sat (not start!114676) (not b!1360403) (not b!1360407) (not b!1360398) (not b!1360399) (not b!1360400) (not b!1360406) (not b!1360401) (not b!1360404))
(check-sat)
