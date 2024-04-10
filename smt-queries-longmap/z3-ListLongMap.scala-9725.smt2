; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115078 () Bool)

(assert start!115078)

(declare-fun b!1363804 () Bool)

(declare-fun res!907564 () Bool)

(declare-fun e!773378 () Bool)

(assert (=> b!1363804 (=> (not res!907564) (not e!773378))))

(declare-fun i!1404 () (_ BitVec 32))

(declare-datatypes ((array!92705 0))(
  ( (array!92706 (arr!44784 (Array (_ BitVec 32) (_ BitVec 64))) (size!45334 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92705)

(assert (=> b!1363804 (= res!907564 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45334 a!3742))))))

(declare-fun b!1363805 () Bool)

(declare-fun e!773380 () Bool)

(assert (=> b!1363805 (= e!773378 e!773380)))

(declare-fun res!907555 () Bool)

(assert (=> b!1363805 (=> (not res!907555) (not e!773380))))

(declare-fun lt!600905 () Bool)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> b!1363805 (= res!907555 (and (not (= from!3120 i!1404)) (not lt!600905) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!45012 0))(
  ( (Unit!45013) )
))
(declare-fun lt!600903 () Unit!45012)

(declare-fun e!773379 () Unit!45012)

(assert (=> b!1363805 (= lt!600903 e!773379)))

(declare-fun c!127565 () Bool)

(assert (=> b!1363805 (= c!127565 lt!600905)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1363805 (= lt!600905 (validKeyInArray!0 (select (arr!44784 a!3742) from!3120)))))

(declare-fun b!1363806 () Bool)

(declare-fun res!907558 () Bool)

(assert (=> b!1363806 (=> (not res!907558) (not e!773378))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1363806 (= res!907558 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1363807 () Bool)

(declare-fun Unit!45014 () Unit!45012)

(assert (=> b!1363807 (= e!773379 Unit!45014)))

(declare-fun b!1363809 () Bool)

(declare-fun res!907559 () Bool)

(assert (=> b!1363809 (=> (not res!907559) (not e!773378))))

(declare-datatypes ((List!31825 0))(
  ( (Nil!31822) (Cons!31821 (h!33030 (_ BitVec 64)) (t!46516 List!31825)) )
))
(declare-fun acc!759 () List!31825)

(declare-fun contains!9534 (List!31825 (_ BitVec 64)) Bool)

(assert (=> b!1363809 (= res!907559 (not (contains!9534 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1363810 () Bool)

(assert (=> b!1363810 (= e!773380 (not true))))

(declare-fun arrayNoDuplicates!0 (array!92705 (_ BitVec 32) List!31825) Bool)

(assert (=> b!1363810 (arrayNoDuplicates!0 (array!92706 (store (arr!44784 a!3742) i!1404 l!3587) (size!45334 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun lt!600904 () Unit!45012)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92705 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31825) Unit!45012)

(assert (=> b!1363810 (= lt!600904 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1363811 () Bool)

(declare-fun res!907554 () Bool)

(assert (=> b!1363811 (=> (not res!907554) (not e!773380))))

(assert (=> b!1363811 (= res!907554 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1363812 () Bool)

(declare-fun res!907560 () Bool)

(assert (=> b!1363812 (=> (not res!907560) (not e!773378))))

(assert (=> b!1363812 (= res!907560 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1363813 () Bool)

(declare-fun res!907561 () Bool)

(assert (=> b!1363813 (=> (not res!907561) (not e!773378))))

(assert (=> b!1363813 (= res!907561 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45334 a!3742)))))

(declare-fun b!1363814 () Bool)

(declare-fun res!907562 () Bool)

(assert (=> b!1363814 (=> (not res!907562) (not e!773378))))

(assert (=> b!1363814 (= res!907562 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31822))))

(declare-fun res!907556 () Bool)

(assert (=> start!115078 (=> (not res!907556) (not e!773378))))

(assert (=> start!115078 (= res!907556 (and (bvslt (size!45334 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45334 a!3742))))))

(assert (=> start!115078 e!773378))

(assert (=> start!115078 true))

(declare-fun array_inv!33812 (array!92705) Bool)

(assert (=> start!115078 (array_inv!33812 a!3742)))

(declare-fun b!1363808 () Bool)

(declare-fun res!907557 () Bool)

(assert (=> b!1363808 (=> (not res!907557) (not e!773378))))

(assert (=> b!1363808 (= res!907557 (not (contains!9534 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1363815 () Bool)

(declare-fun lt!600907 () Unit!45012)

(assert (=> b!1363815 (= e!773379 lt!600907)))

(declare-fun lt!600906 () Unit!45012)

(declare-fun lemmaListSubSeqRefl!0 (List!31825) Unit!45012)

(assert (=> b!1363815 (= lt!600906 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!936 (List!31825 List!31825) Bool)

(assert (=> b!1363815 (subseq!936 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92705 List!31825 List!31825 (_ BitVec 32)) Unit!45012)

(declare-fun $colon$colon!939 (List!31825 (_ BitVec 64)) List!31825)

(assert (=> b!1363815 (= lt!600907 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!939 acc!759 (select (arr!44784 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1363815 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1363816 () Bool)

(declare-fun res!907563 () Bool)

(assert (=> b!1363816 (=> (not res!907563) (not e!773378))))

(declare-fun noDuplicate!2391 (List!31825) Bool)

(assert (=> b!1363816 (= res!907563 (noDuplicate!2391 acc!759))))

(assert (= (and start!115078 res!907556) b!1363816))

(assert (= (and b!1363816 res!907563) b!1363809))

(assert (= (and b!1363809 res!907559) b!1363808))

(assert (= (and b!1363808 res!907557) b!1363814))

(assert (= (and b!1363814 res!907562) b!1363812))

(assert (= (and b!1363812 res!907560) b!1363804))

(assert (= (and b!1363804 res!907564) b!1363806))

(assert (= (and b!1363806 res!907558) b!1363813))

(assert (= (and b!1363813 res!907561) b!1363805))

(assert (= (and b!1363805 c!127565) b!1363815))

(assert (= (and b!1363805 (not c!127565)) b!1363807))

(assert (= (and b!1363805 res!907555) b!1363811))

(assert (= (and b!1363811 res!907554) b!1363810))

(declare-fun m!1248527 () Bool)

(assert (=> b!1363815 m!1248527))

(declare-fun m!1248529 () Bool)

(assert (=> b!1363815 m!1248529))

(declare-fun m!1248531 () Bool)

(assert (=> b!1363815 m!1248531))

(declare-fun m!1248533 () Bool)

(assert (=> b!1363815 m!1248533))

(declare-fun m!1248535 () Bool)

(assert (=> b!1363815 m!1248535))

(assert (=> b!1363815 m!1248529))

(assert (=> b!1363815 m!1248531))

(declare-fun m!1248537 () Bool)

(assert (=> b!1363815 m!1248537))

(declare-fun m!1248539 () Bool)

(assert (=> b!1363810 m!1248539))

(declare-fun m!1248541 () Bool)

(assert (=> b!1363810 m!1248541))

(declare-fun m!1248543 () Bool)

(assert (=> b!1363810 m!1248543))

(declare-fun m!1248545 () Bool)

(assert (=> b!1363808 m!1248545))

(declare-fun m!1248547 () Bool)

(assert (=> start!115078 m!1248547))

(declare-fun m!1248549 () Bool)

(assert (=> b!1363812 m!1248549))

(assert (=> b!1363811 m!1248535))

(declare-fun m!1248551 () Bool)

(assert (=> b!1363809 m!1248551))

(assert (=> b!1363805 m!1248529))

(assert (=> b!1363805 m!1248529))

(declare-fun m!1248553 () Bool)

(assert (=> b!1363805 m!1248553))

(declare-fun m!1248555 () Bool)

(assert (=> b!1363814 m!1248555))

(declare-fun m!1248557 () Bool)

(assert (=> b!1363816 m!1248557))

(declare-fun m!1248559 () Bool)

(assert (=> b!1363806 m!1248559))

(check-sat (not b!1363806) (not b!1363805) (not b!1363809) (not b!1363808) (not b!1363812) (not b!1363816) (not start!115078) (not b!1363810) (not b!1363814) (not b!1363815) (not b!1363811))
(check-sat)
