; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115220 () Bool)

(assert start!115220)

(declare-fun b!1364433 () Bool)

(declare-datatypes ((Unit!44909 0))(
  ( (Unit!44910) )
))
(declare-fun e!773915 () Unit!44909)

(declare-fun lt!601160 () Unit!44909)

(assert (=> b!1364433 (= e!773915 lt!601160)))

(declare-fun lt!601159 () Unit!44909)

(declare-datatypes ((List!31851 0))(
  ( (Nil!31848) (Cons!31847 (h!33065 (_ BitVec 64)) (t!46531 List!31851)) )
))
(declare-fun acc!759 () List!31851)

(declare-fun lemmaListSubSeqRefl!0 (List!31851) Unit!44909)

(assert (=> b!1364433 (= lt!601159 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!922 (List!31851 List!31851) Bool)

(assert (=> b!1364433 (subseq!922 acc!759 acc!759)))

(declare-datatypes ((array!92789 0))(
  ( (array!92790 (arr!44823 (Array (_ BitVec 32) (_ BitVec 64))) (size!45374 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92789)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92789 List!31851 List!31851 (_ BitVec 32)) Unit!44909)

(declare-fun $colon$colon!924 (List!31851 (_ BitVec 64)) List!31851)

(assert (=> b!1364433 (= lt!601160 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!924 acc!759 (select (arr!44823 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92789 (_ BitVec 32) List!31851) Bool)

(assert (=> b!1364433 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1364434 () Bool)

(declare-fun res!907519 () Bool)

(declare-fun e!773917 () Bool)

(assert (=> b!1364434 (=> (not res!907519) (not e!773917))))

(declare-fun contains!9563 (List!31851 (_ BitVec 64)) Bool)

(assert (=> b!1364434 (= res!907519 (not (contains!9563 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1364435 () Bool)

(declare-fun res!907517 () Bool)

(assert (=> b!1364435 (=> (not res!907517) (not e!773917))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1364435 (= res!907517 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1364436 () Bool)

(declare-fun res!907518 () Bool)

(assert (=> b!1364436 (=> (not res!907518) (not e!773917))))

(declare-fun noDuplicate!2394 (List!31851) Bool)

(assert (=> b!1364436 (= res!907518 (noDuplicate!2394 acc!759))))

(declare-fun res!907516 () Bool)

(assert (=> start!115220 (=> (not res!907516) (not e!773917))))

(assert (=> start!115220 (= res!907516 (and (bvslt (size!45374 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45374 a!3742))))))

(assert (=> start!115220 e!773917))

(assert (=> start!115220 true))

(declare-fun array_inv!34104 (array!92789) Bool)

(assert (=> start!115220 (array_inv!34104 a!3742)))

(declare-fun b!1364437 () Bool)

(assert (=> b!1364437 (= e!773917 false)))

(declare-fun lt!601161 () Unit!44909)

(assert (=> b!1364437 (= lt!601161 e!773915)))

(declare-fun c!127906 () Bool)

(assert (=> b!1364437 (= c!127906 (validKeyInArray!0 (select (arr!44823 a!3742) from!3120)))))

(declare-fun b!1364438 () Bool)

(declare-fun res!907521 () Bool)

(assert (=> b!1364438 (=> (not res!907521) (not e!773917))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1364438 (= res!907521 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45374 a!3742))))))

(declare-fun b!1364439 () Bool)

(declare-fun res!907520 () Bool)

(assert (=> b!1364439 (=> (not res!907520) (not e!773917))))

(assert (=> b!1364439 (= res!907520 (not (contains!9563 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1364440 () Bool)

(declare-fun res!907523 () Bool)

(assert (=> b!1364440 (=> (not res!907523) (not e!773917))))

(assert (=> b!1364440 (= res!907523 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45374 a!3742)))))

(declare-fun b!1364441 () Bool)

(declare-fun Unit!44911 () Unit!44909)

(assert (=> b!1364441 (= e!773915 Unit!44911)))

(declare-fun b!1364442 () Bool)

(declare-fun res!907522 () Bool)

(assert (=> b!1364442 (=> (not res!907522) (not e!773917))))

(assert (=> b!1364442 (= res!907522 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31848))))

(declare-fun b!1364443 () Bool)

(declare-fun res!907524 () Bool)

(assert (=> b!1364443 (=> (not res!907524) (not e!773917))))

(assert (=> b!1364443 (= res!907524 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(assert (= (and start!115220 res!907516) b!1364436))

(assert (= (and b!1364436 res!907518) b!1364439))

(assert (= (and b!1364439 res!907520) b!1364434))

(assert (= (and b!1364434 res!907519) b!1364442))

(assert (= (and b!1364442 res!907522) b!1364443))

(assert (= (and b!1364443 res!907524) b!1364438))

(assert (= (and b!1364438 res!907521) b!1364435))

(assert (= (and b!1364435 res!907517) b!1364440))

(assert (= (and b!1364440 res!907523) b!1364437))

(assert (= (and b!1364437 c!127906) b!1364433))

(assert (= (and b!1364437 (not c!127906)) b!1364441))

(declare-fun m!1249599 () Bool)

(assert (=> start!115220 m!1249599))

(declare-fun m!1249601 () Bool)

(assert (=> b!1364434 m!1249601))

(declare-fun m!1249603 () Bool)

(assert (=> b!1364436 m!1249603))

(declare-fun m!1249605 () Bool)

(assert (=> b!1364443 m!1249605))

(declare-fun m!1249607 () Bool)

(assert (=> b!1364437 m!1249607))

(assert (=> b!1364437 m!1249607))

(declare-fun m!1249609 () Bool)

(assert (=> b!1364437 m!1249609))

(declare-fun m!1249611 () Bool)

(assert (=> b!1364433 m!1249611))

(assert (=> b!1364433 m!1249607))

(declare-fun m!1249613 () Bool)

(assert (=> b!1364433 m!1249613))

(declare-fun m!1249615 () Bool)

(assert (=> b!1364433 m!1249615))

(declare-fun m!1249617 () Bool)

(assert (=> b!1364433 m!1249617))

(assert (=> b!1364433 m!1249607))

(assert (=> b!1364433 m!1249613))

(declare-fun m!1249619 () Bool)

(assert (=> b!1364433 m!1249619))

(declare-fun m!1249621 () Bool)

(assert (=> b!1364435 m!1249621))

(declare-fun m!1249623 () Bool)

(assert (=> b!1364439 m!1249623))

(declare-fun m!1249625 () Bool)

(assert (=> b!1364442 m!1249625))

(push 1)

(assert (not b!1364439))

(assert (not b!1364435))

(assert (not b!1364434))

(assert (not b!1364437))

(assert (not b!1364442))

(assert (not start!115220))

(assert (not b!1364443))

(assert (not b!1364436))

(assert (not b!1364433))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

