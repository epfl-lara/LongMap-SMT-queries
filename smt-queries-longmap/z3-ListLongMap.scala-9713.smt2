; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115114 () Bool)

(assert start!115114)

(declare-fun b!1363353 () Bool)

(declare-fun res!906629 () Bool)

(declare-fun e!773475 () Bool)

(assert (=> b!1363353 (=> (not res!906629) (not e!773475))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-datatypes ((array!92740 0))(
  ( (array!92741 (arr!44800 (Array (_ BitVec 32) (_ BitVec 64))) (size!45351 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92740)

(assert (=> b!1363353 (= res!906629 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45351 a!3742)))))

(declare-fun b!1363354 () Bool)

(declare-datatypes ((Unit!44840 0))(
  ( (Unit!44841) )
))
(declare-fun e!773476 () Unit!44840)

(declare-fun Unit!44842 () Unit!44840)

(assert (=> b!1363354 (= e!773476 Unit!44842)))

(declare-fun b!1363355 () Bool)

(declare-fun e!773478 () Bool)

(assert (=> b!1363355 (= e!773475 e!773478)))

(declare-fun res!906623 () Bool)

(assert (=> b!1363355 (=> (not res!906623) (not e!773478))))

(declare-fun lt!600845 () Bool)

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1363355 (= res!906623 (and (not (= from!3120 i!1404)) lt!600845))))

(declare-fun lt!600846 () Unit!44840)

(assert (=> b!1363355 (= lt!600846 e!773476)))

(declare-fun c!127813 () Bool)

(assert (=> b!1363355 (= c!127813 lt!600845)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1363355 (= lt!600845 (validKeyInArray!0 (select (arr!44800 a!3742) from!3120)))))

(declare-fun b!1363356 () Bool)

(declare-fun e!773477 () Bool)

(assert (=> b!1363356 (= e!773477 (not true))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-datatypes ((List!31828 0))(
  ( (Nil!31825) (Cons!31824 (h!33042 (_ BitVec 64)) (t!46505 List!31828)) )
))
(declare-fun lt!600843 () List!31828)

(declare-fun arrayNoDuplicates!0 (array!92740 (_ BitVec 32) List!31828) Bool)

(assert (=> b!1363356 (arrayNoDuplicates!0 (array!92741 (store (arr!44800 a!3742) i!1404 l!3587) (size!45351 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) lt!600843)))

(declare-fun lt!600841 () Unit!44840)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92740 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31828) Unit!44840)

(assert (=> b!1363356 (= lt!600841 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) lt!600843))))

(declare-fun b!1363357 () Bool)

(declare-fun res!906625 () Bool)

(assert (=> b!1363357 (=> (not res!906625) (not e!773477))))

(declare-fun noDuplicate!2371 (List!31828) Bool)

(assert (=> b!1363357 (= res!906625 (noDuplicate!2371 lt!600843))))

(declare-fun b!1363358 () Bool)

(declare-fun res!906627 () Bool)

(assert (=> b!1363358 (=> (not res!906627) (not e!773475))))

(declare-fun acc!759 () List!31828)

(assert (=> b!1363358 (= res!906627 (noDuplicate!2371 acc!759))))

(declare-fun b!1363360 () Bool)

(declare-fun res!906628 () Bool)

(assert (=> b!1363360 (=> (not res!906628) (not e!773475))))

(declare-fun contains!9540 (List!31828 (_ BitVec 64)) Bool)

(assert (=> b!1363360 (= res!906628 (not (contains!9540 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1363361 () Bool)

(declare-fun res!906624 () Bool)

(assert (=> b!1363361 (=> (not res!906624) (not e!773475))))

(assert (=> b!1363361 (= res!906624 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31825))))

(declare-fun b!1363362 () Bool)

(declare-fun res!906632 () Bool)

(assert (=> b!1363362 (=> (not res!906632) (not e!773477))))

(assert (=> b!1363362 (= res!906632 (not (contains!9540 lt!600843 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1363363 () Bool)

(declare-fun res!906633 () Bool)

(assert (=> b!1363363 (=> (not res!906633) (not e!773477))))

(assert (=> b!1363363 (= res!906633 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!600843))))

(declare-fun b!1363364 () Bool)

(declare-fun res!906635 () Bool)

(assert (=> b!1363364 (=> (not res!906635) (not e!773477))))

(assert (=> b!1363364 (= res!906635 (not (contains!9540 lt!600843 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1363365 () Bool)

(declare-fun res!906631 () Bool)

(assert (=> b!1363365 (=> (not res!906631) (not e!773475))))

(assert (=> b!1363365 (= res!906631 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45351 a!3742))))))

(declare-fun res!906634 () Bool)

(assert (=> start!115114 (=> (not res!906634) (not e!773475))))

(assert (=> start!115114 (= res!906634 (and (bvslt (size!45351 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45351 a!3742))))))

(assert (=> start!115114 e!773475))

(assert (=> start!115114 true))

(declare-fun array_inv!34081 (array!92740) Bool)

(assert (=> start!115114 (array_inv!34081 a!3742)))

(declare-fun b!1363359 () Bool)

(assert (=> b!1363359 (= e!773478 e!773477)))

(declare-fun res!906622 () Bool)

(assert (=> b!1363359 (=> (not res!906622) (not e!773477))))

(assert (=> b!1363359 (= res!906622 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!901 (List!31828 (_ BitVec 64)) List!31828)

(assert (=> b!1363359 (= lt!600843 ($colon$colon!901 acc!759 (select (arr!44800 a!3742) from!3120)))))

(declare-fun b!1363366 () Bool)

(declare-fun lt!600842 () Unit!44840)

(assert (=> b!1363366 (= e!773476 lt!600842)))

(declare-fun lt!600844 () Unit!44840)

(declare-fun lemmaListSubSeqRefl!0 (List!31828) Unit!44840)

(assert (=> b!1363366 (= lt!600844 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!899 (List!31828 List!31828) Bool)

(assert (=> b!1363366 (subseq!899 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92740 List!31828 List!31828 (_ BitVec 32)) Unit!44840)

(assert (=> b!1363366 (= lt!600842 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!901 acc!759 (select (arr!44800 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1363366 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1363367 () Bool)

(declare-fun res!906636 () Bool)

(assert (=> b!1363367 (=> (not res!906636) (not e!773475))))

(assert (=> b!1363367 (= res!906636 (not (contains!9540 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1363368 () Bool)

(declare-fun res!906630 () Bool)

(assert (=> b!1363368 (=> (not res!906630) (not e!773475))))

(assert (=> b!1363368 (= res!906630 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1363369 () Bool)

(declare-fun res!906626 () Bool)

(assert (=> b!1363369 (=> (not res!906626) (not e!773475))))

(assert (=> b!1363369 (= res!906626 (not (validKeyInArray!0 l!3587)))))

(assert (= (and start!115114 res!906634) b!1363358))

(assert (= (and b!1363358 res!906627) b!1363367))

(assert (= (and b!1363367 res!906636) b!1363360))

(assert (= (and b!1363360 res!906628) b!1363361))

(assert (= (and b!1363361 res!906624) b!1363368))

(assert (= (and b!1363368 res!906630) b!1363365))

(assert (= (and b!1363365 res!906631) b!1363369))

(assert (= (and b!1363369 res!906626) b!1363353))

(assert (= (and b!1363353 res!906629) b!1363355))

(assert (= (and b!1363355 c!127813) b!1363366))

(assert (= (and b!1363355 (not c!127813)) b!1363354))

(assert (= (and b!1363355 res!906623) b!1363359))

(assert (= (and b!1363359 res!906622) b!1363357))

(assert (= (and b!1363357 res!906625) b!1363364))

(assert (= (and b!1363364 res!906635) b!1363362))

(assert (= (and b!1363362 res!906632) b!1363363))

(assert (= (and b!1363363 res!906633) b!1363356))

(declare-fun m!1248625 () Bool)

(assert (=> start!115114 m!1248625))

(declare-fun m!1248627 () Bool)

(assert (=> b!1363355 m!1248627))

(assert (=> b!1363355 m!1248627))

(declare-fun m!1248629 () Bool)

(assert (=> b!1363355 m!1248629))

(declare-fun m!1248631 () Bool)

(assert (=> b!1363357 m!1248631))

(declare-fun m!1248633 () Bool)

(assert (=> b!1363360 m!1248633))

(declare-fun m!1248635 () Bool)

(assert (=> b!1363368 m!1248635))

(declare-fun m!1248637 () Bool)

(assert (=> b!1363366 m!1248637))

(assert (=> b!1363366 m!1248627))

(declare-fun m!1248639 () Bool)

(assert (=> b!1363366 m!1248639))

(declare-fun m!1248641 () Bool)

(assert (=> b!1363366 m!1248641))

(declare-fun m!1248643 () Bool)

(assert (=> b!1363366 m!1248643))

(assert (=> b!1363366 m!1248627))

(assert (=> b!1363366 m!1248639))

(declare-fun m!1248645 () Bool)

(assert (=> b!1363366 m!1248645))

(declare-fun m!1248647 () Bool)

(assert (=> b!1363362 m!1248647))

(declare-fun m!1248649 () Bool)

(assert (=> b!1363364 m!1248649))

(declare-fun m!1248651 () Bool)

(assert (=> b!1363361 m!1248651))

(declare-fun m!1248653 () Bool)

(assert (=> b!1363356 m!1248653))

(declare-fun m!1248655 () Bool)

(assert (=> b!1363356 m!1248655))

(declare-fun m!1248657 () Bool)

(assert (=> b!1363356 m!1248657))

(declare-fun m!1248659 () Bool)

(assert (=> b!1363367 m!1248659))

(assert (=> b!1363359 m!1248627))

(assert (=> b!1363359 m!1248627))

(assert (=> b!1363359 m!1248639))

(declare-fun m!1248661 () Bool)

(assert (=> b!1363363 m!1248661))

(declare-fun m!1248663 () Bool)

(assert (=> b!1363369 m!1248663))

(declare-fun m!1248665 () Bool)

(assert (=> b!1363358 m!1248665))

(check-sat (not b!1363357) (not b!1363364) (not start!115114) (not b!1363367) (not b!1363368) (not b!1363355) (not b!1363358) (not b!1363359) (not b!1363362) (not b!1363363) (not b!1363360) (not b!1363366) (not b!1363361) (not b!1363356) (not b!1363369))
(check-sat)
