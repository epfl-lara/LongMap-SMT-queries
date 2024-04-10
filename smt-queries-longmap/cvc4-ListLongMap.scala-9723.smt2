; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115068 () Bool)

(assert start!115068)

(declare-fun b!1363610 () Bool)

(declare-fun res!907398 () Bool)

(declare-fun e!773320 () Bool)

(assert (=> b!1363610 (=> (not res!907398) (not e!773320))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1363610 (= res!907398 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1363611 () Bool)

(declare-datatypes ((Unit!44997 0))(
  ( (Unit!44998) )
))
(declare-fun e!773319 () Unit!44997)

(declare-fun lt!600839 () Unit!44997)

(assert (=> b!1363611 (= e!773319 lt!600839)))

(declare-fun lt!600838 () Unit!44997)

(declare-datatypes ((List!31820 0))(
  ( (Nil!31817) (Cons!31816 (h!33025 (_ BitVec 64)) (t!46511 List!31820)) )
))
(declare-fun acc!759 () List!31820)

(declare-fun lemmaListSubSeqRefl!0 (List!31820) Unit!44997)

(assert (=> b!1363611 (= lt!600838 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!931 (List!31820 List!31820) Bool)

(assert (=> b!1363611 (subseq!931 acc!759 acc!759)))

(declare-datatypes ((array!92695 0))(
  ( (array!92696 (arr!44779 (Array (_ BitVec 32) (_ BitVec 64))) (size!45329 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92695)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92695 List!31820 List!31820 (_ BitVec 32)) Unit!44997)

(declare-fun $colon$colon!934 (List!31820 (_ BitVec 64)) List!31820)

(assert (=> b!1363611 (= lt!600839 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!934 acc!759 (select (arr!44779 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92695 (_ BitVec 32) List!31820) Bool)

(assert (=> b!1363611 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun res!907395 () Bool)

(assert (=> start!115068 (=> (not res!907395) (not e!773320))))

(assert (=> start!115068 (= res!907395 (and (bvslt (size!45329 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45329 a!3742))))))

(assert (=> start!115068 e!773320))

(assert (=> start!115068 true))

(declare-fun array_inv!33807 (array!92695) Bool)

(assert (=> start!115068 (array_inv!33807 a!3742)))

(declare-fun b!1363612 () Bool)

(declare-fun res!907390 () Bool)

(assert (=> b!1363612 (=> (not res!907390) (not e!773320))))

(declare-fun noDuplicate!2386 (List!31820) Bool)

(assert (=> b!1363612 (= res!907390 (noDuplicate!2386 acc!759))))

(declare-fun b!1363613 () Bool)

(declare-fun e!773318 () Bool)

(assert (=> b!1363613 (= e!773318 false)))

(declare-fun lt!600840 () Bool)

(assert (=> b!1363613 (= lt!600840 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1363614 () Bool)

(declare-fun res!907397 () Bool)

(assert (=> b!1363614 (=> (not res!907397) (not e!773320))))

(declare-fun contains!9529 (List!31820 (_ BitVec 64)) Bool)

(assert (=> b!1363614 (= res!907397 (not (contains!9529 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1363615 () Bool)

(declare-fun res!907393 () Bool)

(assert (=> b!1363615 (=> (not res!907393) (not e!773320))))

(assert (=> b!1363615 (= res!907393 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31817))))

(declare-fun b!1363616 () Bool)

(declare-fun Unit!44999 () Unit!44997)

(assert (=> b!1363616 (= e!773319 Unit!44999)))

(declare-fun b!1363617 () Bool)

(declare-fun res!907394 () Bool)

(assert (=> b!1363617 (=> (not res!907394) (not e!773320))))

(assert (=> b!1363617 (= res!907394 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1363618 () Bool)

(assert (=> b!1363618 (= e!773320 e!773318)))

(declare-fun res!907392 () Bool)

(assert (=> b!1363618 (=> (not res!907392) (not e!773318))))

(declare-fun lt!600837 () Bool)

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1363618 (= res!907392 (and (not (= from!3120 i!1404)) (not lt!600837) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!600841 () Unit!44997)

(assert (=> b!1363618 (= lt!600841 e!773319)))

(declare-fun c!127550 () Bool)

(assert (=> b!1363618 (= c!127550 lt!600837)))

(assert (=> b!1363618 (= lt!600837 (validKeyInArray!0 (select (arr!44779 a!3742) from!3120)))))

(declare-fun b!1363619 () Bool)

(declare-fun res!907396 () Bool)

(assert (=> b!1363619 (=> (not res!907396) (not e!773320))))

(assert (=> b!1363619 (= res!907396 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45329 a!3742)))))

(declare-fun b!1363620 () Bool)

(declare-fun res!907399 () Bool)

(assert (=> b!1363620 (=> (not res!907399) (not e!773320))))

(assert (=> b!1363620 (= res!907399 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45329 a!3742))))))

(declare-fun b!1363621 () Bool)

(declare-fun res!907391 () Bool)

(assert (=> b!1363621 (=> (not res!907391) (not e!773320))))

(assert (=> b!1363621 (= res!907391 (not (contains!9529 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115068 res!907395) b!1363612))

(assert (= (and b!1363612 res!907390) b!1363621))

(assert (= (and b!1363621 res!907391) b!1363614))

(assert (= (and b!1363614 res!907397) b!1363615))

(assert (= (and b!1363615 res!907393) b!1363617))

(assert (= (and b!1363617 res!907394) b!1363620))

(assert (= (and b!1363620 res!907399) b!1363610))

(assert (= (and b!1363610 res!907398) b!1363619))

(assert (= (and b!1363619 res!907396) b!1363618))

(assert (= (and b!1363618 c!127550) b!1363611))

(assert (= (and b!1363618 (not c!127550)) b!1363616))

(assert (= (and b!1363618 res!907392) b!1363613))

(declare-fun m!1248381 () Bool)

(assert (=> b!1363610 m!1248381))

(declare-fun m!1248383 () Bool)

(assert (=> b!1363617 m!1248383))

(declare-fun m!1248385 () Bool)

(assert (=> b!1363612 m!1248385))

(declare-fun m!1248387 () Bool)

(assert (=> b!1363613 m!1248387))

(declare-fun m!1248389 () Bool)

(assert (=> b!1363615 m!1248389))

(declare-fun m!1248391 () Bool)

(assert (=> b!1363621 m!1248391))

(declare-fun m!1248393 () Bool)

(assert (=> b!1363618 m!1248393))

(assert (=> b!1363618 m!1248393))

(declare-fun m!1248395 () Bool)

(assert (=> b!1363618 m!1248395))

(declare-fun m!1248397 () Bool)

(assert (=> start!115068 m!1248397))

(declare-fun m!1248399 () Bool)

(assert (=> b!1363611 m!1248399))

(assert (=> b!1363611 m!1248393))

(declare-fun m!1248401 () Bool)

(assert (=> b!1363611 m!1248401))

(declare-fun m!1248403 () Bool)

(assert (=> b!1363611 m!1248403))

(assert (=> b!1363611 m!1248387))

(assert (=> b!1363611 m!1248393))

(assert (=> b!1363611 m!1248401))

(declare-fun m!1248405 () Bool)

(assert (=> b!1363611 m!1248405))

(declare-fun m!1248407 () Bool)

(assert (=> b!1363614 m!1248407))

(push 1)

(assert (not b!1363621))

(assert (not b!1363618))

(assert (not b!1363617))

(assert (not b!1363614))

(assert (not b!1363612))

(assert (not b!1363615))

(assert (not 