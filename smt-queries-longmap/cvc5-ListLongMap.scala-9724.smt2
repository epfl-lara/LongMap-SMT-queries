; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115070 () Bool)

(assert start!115070)

(declare-fun res!907432 () Bool)

(declare-fun e!773329 () Bool)

(assert (=> start!115070 (=> (not res!907432) (not e!773329))))

(declare-datatypes ((array!92697 0))(
  ( (array!92698 (arr!44780 (Array (_ BitVec 32) (_ BitVec 64))) (size!45330 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92697)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!115070 (= res!907432 (and (bvslt (size!45330 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45330 a!3742))))))

(assert (=> start!115070 e!773329))

(assert (=> start!115070 true))

(declare-fun array_inv!33808 (array!92697) Bool)

(assert (=> start!115070 (array_inv!33808 a!3742)))

(declare-fun b!1363648 () Bool)

(declare-datatypes ((Unit!45000 0))(
  ( (Unit!45001) )
))
(declare-fun e!773330 () Unit!45000)

(declare-fun lt!600850 () Unit!45000)

(assert (=> b!1363648 (= e!773330 lt!600850)))

(declare-fun lt!600852 () Unit!45000)

(declare-datatypes ((List!31821 0))(
  ( (Nil!31818) (Cons!31817 (h!33026 (_ BitVec 64)) (t!46512 List!31821)) )
))
(declare-fun acc!759 () List!31821)

(declare-fun lemmaListSubSeqRefl!0 (List!31821) Unit!45000)

(assert (=> b!1363648 (= lt!600852 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!932 (List!31821 List!31821) Bool)

(assert (=> b!1363648 (subseq!932 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92697 List!31821 List!31821 (_ BitVec 32)) Unit!45000)

(declare-fun $colon$colon!935 (List!31821 (_ BitVec 64)) List!31821)

(assert (=> b!1363648 (= lt!600850 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!935 acc!759 (select (arr!44780 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92697 (_ BitVec 32) List!31821) Bool)

(assert (=> b!1363648 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1363649 () Bool)

(declare-fun res!907422 () Bool)

(assert (=> b!1363649 (=> (not res!907422) (not e!773329))))

(declare-fun contains!9530 (List!31821 (_ BitVec 64)) Bool)

(assert (=> b!1363649 (= res!907422 (not (contains!9530 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1363650 () Bool)

(declare-fun e!773331 () Bool)

(assert (=> b!1363650 (= e!773331 (bvsge (bvsub (size!45330 a!3742) (bvadd #b00000000000000000000000000000001 from!3120)) (bvsub (size!45330 a!3742) from!3120)))))

(declare-fun b!1363651 () Bool)

(declare-fun res!907431 () Bool)

(assert (=> b!1363651 (=> (not res!907431) (not e!773331))))

(assert (=> b!1363651 (= res!907431 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1363652 () Bool)

(declare-fun res!907425 () Bool)

(assert (=> b!1363652 (=> (not res!907425) (not e!773329))))

(assert (=> b!1363652 (= res!907425 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31818))))

(declare-fun b!1363653 () Bool)

(declare-fun res!907427 () Bool)

(assert (=> b!1363653 (=> (not res!907427) (not e!773329))))

(declare-fun noDuplicate!2387 (List!31821) Bool)

(assert (=> b!1363653 (= res!907427 (noDuplicate!2387 acc!759))))

(declare-fun b!1363654 () Bool)

(declare-fun Unit!45002 () Unit!45000)

(assert (=> b!1363654 (= e!773330 Unit!45002)))

(declare-fun b!1363655 () Bool)

(declare-fun res!907423 () Bool)

(assert (=> b!1363655 (=> (not res!907423) (not e!773329))))

(assert (=> b!1363655 (= res!907423 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1363656 () Bool)

(assert (=> b!1363656 (= e!773329 e!773331)))

(declare-fun res!907429 () Bool)

(assert (=> b!1363656 (=> (not res!907429) (not e!773331))))

(declare-fun lt!600853 () Bool)

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1363656 (= res!907429 (and (not (= from!3120 i!1404)) (not lt!600853) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!600851 () Unit!45000)

(assert (=> b!1363656 (= lt!600851 e!773330)))

(declare-fun c!127553 () Bool)

(assert (=> b!1363656 (= c!127553 lt!600853)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1363656 (= lt!600853 (validKeyInArray!0 (select (arr!44780 a!3742) from!3120)))))

(declare-fun b!1363657 () Bool)

(declare-fun res!907430 () Bool)

(assert (=> b!1363657 (=> (not res!907430) (not e!773329))))

(assert (=> b!1363657 (= res!907430 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45330 a!3742)))))

(declare-fun b!1363658 () Bool)

(declare-fun res!907424 () Bool)

(assert (=> b!1363658 (=> (not res!907424) (not e!773329))))

(assert (=> b!1363658 (= res!907424 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45330 a!3742))))))

(declare-fun b!1363659 () Bool)

(declare-fun res!907428 () Bool)

(assert (=> b!1363659 (=> (not res!907428) (not e!773329))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1363659 (= res!907428 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1363660 () Bool)

(declare-fun res!907426 () Bool)

(assert (=> b!1363660 (=> (not res!907426) (not e!773329))))

(assert (=> b!1363660 (= res!907426 (not (contains!9530 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115070 res!907432) b!1363653))

(assert (= (and b!1363653 res!907427) b!1363649))

(assert (= (and b!1363649 res!907422) b!1363660))

(assert (= (and b!1363660 res!907426) b!1363652))

(assert (= (and b!1363652 res!907425) b!1363655))

(assert (= (and b!1363655 res!907423) b!1363658))

(assert (= (and b!1363658 res!907424) b!1363659))

(assert (= (and b!1363659 res!907428) b!1363657))

(assert (= (and b!1363657 res!907430) b!1363656))

(assert (= (and b!1363656 c!127553) b!1363648))

(assert (= (and b!1363656 (not c!127553)) b!1363654))

(assert (= (and b!1363656 res!907429) b!1363651))

(assert (= (and b!1363651 res!907431) b!1363650))

(declare-fun m!1248409 () Bool)

(assert (=> b!1363655 m!1248409))

(declare-fun m!1248411 () Bool)

(assert (=> b!1363648 m!1248411))

(declare-fun m!1248413 () Bool)

(assert (=> b!1363648 m!1248413))

(declare-fun m!1248415 () Bool)

(assert (=> b!1363648 m!1248415))

(declare-fun m!1248417 () Bool)

(assert (=> b!1363648 m!1248417))

(declare-fun m!1248419 () Bool)

(assert (=> b!1363648 m!1248419))

(assert (=> b!1363648 m!1248413))

(assert (=> b!1363648 m!1248415))

(declare-fun m!1248421 () Bool)

(assert (=> b!1363648 m!1248421))

(declare-fun m!1248423 () Bool)

(assert (=> start!115070 m!1248423))

(declare-fun m!1248425 () Bool)

(assert (=> b!1363653 m!1248425))

(declare-fun m!1248427 () Bool)

(assert (=> b!1363660 m!1248427))

(assert (=> b!1363656 m!1248413))

(assert (=> b!1363656 m!1248413))

(declare-fun m!1248429 () Bool)

(assert (=> b!1363656 m!1248429))

(assert (=> b!1363651 m!1248419))

(declare-fun m!1248431 () Bool)

(assert (=> b!1363649 m!1248431))

(declare-fun m!1248433 () Bool)

(assert (=> b!1363659 m!1248433))

(declare-fun m!1248435 () Bool)

(assert (=> b!1363652 m!1248435))

(push 1)

(assert (not b!1363660))

(assert (not b!1363648))

(assert (not b!1363649))

(assert (not b!1363659))

(assert (not b!1363652))

(assert (not b!1363655))

(assert (not b!1363651))

(assert (not b!1363656))

(assert (not b!1363653))

(assert (not start!115070))

(check-sat)

(pop 1)

(push 1)

(check-sat)

