; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115072 () Bool)

(assert start!115072)

(declare-fun b!1363687 () Bool)

(declare-fun e!773341 () Bool)

(declare-fun e!773343 () Bool)

(assert (=> b!1363687 (= e!773341 e!773343)))

(declare-fun res!907458 () Bool)

(assert (=> b!1363687 (=> (not res!907458) (not e!773343))))

(declare-fun lt!600865 () Bool)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1363687 (= res!907458 (and (not (= from!3120 i!1404)) (not lt!600865) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!45003 0))(
  ( (Unit!45004) )
))
(declare-fun lt!600862 () Unit!45003)

(declare-fun e!773342 () Unit!45003)

(assert (=> b!1363687 (= lt!600862 e!773342)))

(declare-fun c!127556 () Bool)

(assert (=> b!1363687 (= c!127556 lt!600865)))

(declare-datatypes ((array!92699 0))(
  ( (array!92700 (arr!44781 (Array (_ BitVec 32) (_ BitVec 64))) (size!45331 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92699)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1363687 (= lt!600865 (validKeyInArray!0 (select (arr!44781 a!3742) from!3120)))))

(declare-fun b!1363688 () Bool)

(declare-fun res!907461 () Bool)

(assert (=> b!1363688 (=> (not res!907461) (not e!773341))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1363688 (= res!907461 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1363689 () Bool)

(assert (=> b!1363689 (= e!773343 (bvsge (bvsub (size!45331 a!3742) (bvadd #b00000000000000000000000000000001 from!3120)) (bvsub (size!45331 a!3742) from!3120)))))

(declare-fun b!1363690 () Bool)

(declare-fun res!907457 () Bool)

(assert (=> b!1363690 (=> (not res!907457) (not e!773341))))

(declare-datatypes ((List!31822 0))(
  ( (Nil!31819) (Cons!31818 (h!33027 (_ BitVec 64)) (t!46513 List!31822)) )
))
(declare-fun acc!759 () List!31822)

(declare-fun arrayNoDuplicates!0 (array!92699 (_ BitVec 32) List!31822) Bool)

(assert (=> b!1363690 (= res!907457 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1363691 () Bool)

(declare-fun res!907455 () Bool)

(assert (=> b!1363691 (=> (not res!907455) (not e!773341))))

(declare-fun contains!9531 (List!31822 (_ BitVec 64)) Bool)

(assert (=> b!1363691 (= res!907455 (not (contains!9531 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1363692 () Bool)

(declare-fun res!907465 () Bool)

(assert (=> b!1363692 (=> (not res!907465) (not e!773341))))

(declare-fun noDuplicate!2388 (List!31822) Bool)

(assert (=> b!1363692 (= res!907465 (noDuplicate!2388 acc!759))))

(declare-fun b!1363693 () Bool)

(declare-fun res!907463 () Bool)

(assert (=> b!1363693 (=> (not res!907463) (not e!773343))))

(assert (=> b!1363693 (= res!907463 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1363694 () Bool)

(declare-fun res!907459 () Bool)

(assert (=> b!1363694 (=> (not res!907459) (not e!773341))))

(assert (=> b!1363694 (= res!907459 (not (contains!9531 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1363695 () Bool)

(declare-fun res!907456 () Bool)

(assert (=> b!1363695 (=> (not res!907456) (not e!773341))))

(assert (=> b!1363695 (= res!907456 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31819))))

(declare-fun b!1363696 () Bool)

(declare-fun res!907462 () Bool)

(assert (=> b!1363696 (=> (not res!907462) (not e!773341))))

(assert (=> b!1363696 (= res!907462 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45331 a!3742))))))

(declare-fun res!907460 () Bool)

(assert (=> start!115072 (=> (not res!907460) (not e!773341))))

(assert (=> start!115072 (= res!907460 (and (bvslt (size!45331 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45331 a!3742))))))

(assert (=> start!115072 e!773341))

(assert (=> start!115072 true))

(declare-fun array_inv!33809 (array!92699) Bool)

(assert (=> start!115072 (array_inv!33809 a!3742)))

(declare-fun b!1363697 () Bool)

(declare-fun res!907464 () Bool)

(assert (=> b!1363697 (=> (not res!907464) (not e!773341))))

(assert (=> b!1363697 (= res!907464 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45331 a!3742)))))

(declare-fun b!1363698 () Bool)

(declare-fun Unit!45005 () Unit!45003)

(assert (=> b!1363698 (= e!773342 Unit!45005)))

(declare-fun b!1363699 () Bool)

(declare-fun lt!600864 () Unit!45003)

(assert (=> b!1363699 (= e!773342 lt!600864)))

(declare-fun lt!600863 () Unit!45003)

(declare-fun lemmaListSubSeqRefl!0 (List!31822) Unit!45003)

(assert (=> b!1363699 (= lt!600863 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!933 (List!31822 List!31822) Bool)

(assert (=> b!1363699 (subseq!933 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92699 List!31822 List!31822 (_ BitVec 32)) Unit!45003)

(declare-fun $colon$colon!936 (List!31822 (_ BitVec 64)) List!31822)

(assert (=> b!1363699 (= lt!600864 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!936 acc!759 (select (arr!44781 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1363699 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(assert (= (and start!115072 res!907460) b!1363692))

(assert (= (and b!1363692 res!907465) b!1363694))

(assert (= (and b!1363694 res!907459) b!1363691))

(assert (= (and b!1363691 res!907455) b!1363695))

(assert (= (and b!1363695 res!907456) b!1363690))

(assert (= (and b!1363690 res!907457) b!1363696))

(assert (= (and b!1363696 res!907462) b!1363688))

(assert (= (and b!1363688 res!907461) b!1363697))

(assert (= (and b!1363697 res!907464) b!1363687))

(assert (= (and b!1363687 c!127556) b!1363699))

(assert (= (and b!1363687 (not c!127556)) b!1363698))

(assert (= (and b!1363687 res!907458) b!1363693))

(assert (= (and b!1363693 res!907463) b!1363689))

(declare-fun m!1248437 () Bool)

(assert (=> b!1363695 m!1248437))

(declare-fun m!1248439 () Bool)

(assert (=> b!1363687 m!1248439))

(assert (=> b!1363687 m!1248439))

(declare-fun m!1248441 () Bool)

(assert (=> b!1363687 m!1248441))

(declare-fun m!1248443 () Bool)

(assert (=> start!115072 m!1248443))

(declare-fun m!1248445 () Bool)

(assert (=> b!1363690 m!1248445))

(declare-fun m!1248447 () Bool)

(assert (=> b!1363694 m!1248447))

(declare-fun m!1248449 () Bool)

(assert (=> b!1363692 m!1248449))

(declare-fun m!1248451 () Bool)

(assert (=> b!1363688 m!1248451))

(declare-fun m!1248453 () Bool)

(assert (=> b!1363693 m!1248453))

(declare-fun m!1248455 () Bool)

(assert (=> b!1363699 m!1248455))

(assert (=> b!1363699 m!1248439))

(declare-fun m!1248457 () Bool)

(assert (=> b!1363699 m!1248457))

(declare-fun m!1248459 () Bool)

(assert (=> b!1363699 m!1248459))

(assert (=> b!1363699 m!1248453))

(assert (=> b!1363699 m!1248439))

(assert (=> b!1363699 m!1248457))

(declare-fun m!1248461 () Bool)

(assert (=> b!1363699 m!1248461))

(declare-fun m!1248463 () Bool)

(assert (=> b!1363691 m!1248463))

(check-sat (not b!1363693) (not b!1363690) (not b!1363694) (not b!1363692) (not b!1363688) (not start!115072) (not b!1363699) (not b!1363691) (not b!1363695) (not b!1363687))
(check-sat)
