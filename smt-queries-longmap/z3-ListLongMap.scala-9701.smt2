; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114658 () Bool)

(assert start!114658)

(declare-fun b!1360101 () Bool)

(declare-fun res!904458 () Bool)

(declare-fun e!771721 () Bool)

(assert (=> b!1360101 (=> (not res!904458) (not e!771721))))

(declare-fun i!1404 () (_ BitVec 32))

(declare-datatypes ((array!92546 0))(
  ( (array!92547 (arr!44712 (Array (_ BitVec 32) (_ BitVec 64))) (size!45262 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92546)

(assert (=> b!1360101 (= res!904458 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45262 a!3742))))))

(declare-fun b!1360102 () Bool)

(declare-fun res!904461 () Bool)

(assert (=> b!1360102 (=> (not res!904461) (not e!771721))))

(declare-datatypes ((List!31753 0))(
  ( (Nil!31750) (Cons!31749 (h!32958 (_ BitVec 64)) (t!46429 List!31753)) )
))
(declare-fun acc!759 () List!31753)

(declare-fun contains!9462 (List!31753 (_ BitVec 64)) Bool)

(assert (=> b!1360102 (= res!904461 (not (contains!9462 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1360103 () Bool)

(declare-fun res!904460 () Bool)

(assert (=> b!1360103 (=> (not res!904460) (not e!771721))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92546 (_ BitVec 32) List!31753) Bool)

(assert (=> b!1360103 (= res!904460 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1360104 () Bool)

(declare-fun res!904459 () Bool)

(assert (=> b!1360104 (=> (not res!904459) (not e!771721))))

(assert (=> b!1360104 (= res!904459 (not (contains!9462 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1360105 () Bool)

(declare-datatypes ((Unit!44796 0))(
  ( (Unit!44797) )
))
(declare-fun e!771720 () Unit!44796)

(declare-fun Unit!44798 () Unit!44796)

(assert (=> b!1360105 (= e!771720 Unit!44798)))

(declare-fun b!1360106 () Bool)

(declare-fun lt!599790 () Unit!44796)

(assert (=> b!1360106 (= e!771720 lt!599790)))

(declare-fun lt!599789 () Unit!44796)

(declare-fun lemmaListSubSeqRefl!0 (List!31753) Unit!44796)

(assert (=> b!1360106 (= lt!599789 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!864 (List!31753 List!31753) Bool)

(assert (=> b!1360106 (subseq!864 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92546 List!31753 List!31753 (_ BitVec 32)) Unit!44796)

(declare-fun $colon$colon!867 (List!31753 (_ BitVec 64)) List!31753)

(assert (=> b!1360106 (= lt!599790 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!867 acc!759 (select (arr!44712 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1360106 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1360107 () Bool)

(declare-fun res!904463 () Bool)

(assert (=> b!1360107 (=> (not res!904463) (not e!771721))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1360107 (= res!904463 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1360108 () Bool)

(declare-fun res!904462 () Bool)

(assert (=> b!1360108 (=> (not res!904462) (not e!771721))))

(assert (=> b!1360108 (= res!904462 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31750))))

(declare-fun b!1360109 () Bool)

(assert (=> b!1360109 (= e!771721 false)))

(declare-fun lt!599791 () Unit!44796)

(assert (=> b!1360109 (= lt!599791 e!771720)))

(declare-fun c!127262 () Bool)

(assert (=> b!1360109 (= c!127262 (validKeyInArray!0 (select (arr!44712 a!3742) from!3120)))))

(declare-fun b!1360110 () Bool)

(declare-fun res!904465 () Bool)

(assert (=> b!1360110 (=> (not res!904465) (not e!771721))))

(assert (=> b!1360110 (= res!904465 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45262 a!3742)))))

(declare-fun res!904464 () Bool)

(assert (=> start!114658 (=> (not res!904464) (not e!771721))))

(assert (=> start!114658 (= res!904464 (and (bvslt (size!45262 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45262 a!3742))))))

(assert (=> start!114658 e!771721))

(assert (=> start!114658 true))

(declare-fun array_inv!33740 (array!92546) Bool)

(assert (=> start!114658 (array_inv!33740 a!3742)))

(declare-fun b!1360111 () Bool)

(declare-fun res!904457 () Bool)

(assert (=> b!1360111 (=> (not res!904457) (not e!771721))))

(declare-fun noDuplicate!2319 (List!31753) Bool)

(assert (=> b!1360111 (= res!904457 (noDuplicate!2319 acc!759))))

(assert (= (and start!114658 res!904464) b!1360111))

(assert (= (and b!1360111 res!904457) b!1360102))

(assert (= (and b!1360102 res!904461) b!1360104))

(assert (= (and b!1360104 res!904459) b!1360108))

(assert (= (and b!1360108 res!904462) b!1360103))

(assert (= (and b!1360103 res!904460) b!1360101))

(assert (= (and b!1360101 res!904458) b!1360107))

(assert (= (and b!1360107 res!904463) b!1360110))

(assert (= (and b!1360110 res!904465) b!1360109))

(assert (= (and b!1360109 c!127262) b!1360106))

(assert (= (and b!1360109 (not c!127262)) b!1360105))

(declare-fun m!1245425 () Bool)

(assert (=> start!114658 m!1245425))

(declare-fun m!1245427 () Bool)

(assert (=> b!1360107 m!1245427))

(declare-fun m!1245429 () Bool)

(assert (=> b!1360102 m!1245429))

(declare-fun m!1245431 () Bool)

(assert (=> b!1360108 m!1245431))

(declare-fun m!1245433 () Bool)

(assert (=> b!1360106 m!1245433))

(declare-fun m!1245435 () Bool)

(assert (=> b!1360106 m!1245435))

(declare-fun m!1245437 () Bool)

(assert (=> b!1360106 m!1245437))

(declare-fun m!1245439 () Bool)

(assert (=> b!1360106 m!1245439))

(declare-fun m!1245441 () Bool)

(assert (=> b!1360106 m!1245441))

(assert (=> b!1360106 m!1245435))

(assert (=> b!1360106 m!1245437))

(declare-fun m!1245443 () Bool)

(assert (=> b!1360106 m!1245443))

(declare-fun m!1245445 () Bool)

(assert (=> b!1360103 m!1245445))

(declare-fun m!1245447 () Bool)

(assert (=> b!1360104 m!1245447))

(declare-fun m!1245449 () Bool)

(assert (=> b!1360111 m!1245449))

(assert (=> b!1360109 m!1245435))

(assert (=> b!1360109 m!1245435))

(declare-fun m!1245451 () Bool)

(assert (=> b!1360109 m!1245451))

(check-sat (not b!1360107) (not b!1360109) (not b!1360102) (not b!1360106) (not b!1360103) (not b!1360111) (not start!114658) (not b!1360104) (not b!1360108))
