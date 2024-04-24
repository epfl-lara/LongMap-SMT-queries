; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114340 () Bool)

(assert start!114340)

(declare-fun b!1356593 () Bool)

(declare-fun e!770540 () Bool)

(assert (=> b!1356593 (= e!770540 false)))

(declare-datatypes ((List!31678 0))(
  ( (Nil!31675) (Cons!31674 (h!32892 (_ BitVec 64)) (t!46328 List!31678)) )
))
(declare-fun acc!759 () List!31678)

(declare-fun lt!599048 () Bool)

(declare-datatypes ((array!92413 0))(
  ( (array!92414 (arr!44650 (Array (_ BitVec 32) (_ BitVec 64))) (size!45201 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92413)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92413 (_ BitVec 32) List!31678) Bool)

(assert (=> b!1356593 (= lt!599048 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1356594 () Bool)

(declare-fun res!900766 () Bool)

(declare-fun e!770541 () Bool)

(assert (=> b!1356594 (=> (not res!900766) (not e!770541))))

(assert (=> b!1356594 (= res!900766 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31675))))

(declare-fun b!1356595 () Bool)

(declare-fun res!900762 () Bool)

(assert (=> b!1356595 (=> (not res!900762) (not e!770541))))

(declare-fun contains!9390 (List!31678 (_ BitVec 64)) Bool)

(assert (=> b!1356595 (= res!900762 (not (contains!9390 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356596 () Bool)

(declare-fun res!900763 () Bool)

(assert (=> b!1356596 (=> (not res!900763) (not e!770541))))

(declare-fun noDuplicate!2221 (List!31678) Bool)

(assert (=> b!1356596 (= res!900763 (noDuplicate!2221 acc!759))))

(declare-fun b!1356597 () Bool)

(assert (=> b!1356597 (= e!770541 e!770540)))

(declare-fun res!900771 () Bool)

(assert (=> b!1356597 (=> (not res!900771) (not e!770540))))

(declare-fun i!1404 () (_ BitVec 32))

(declare-fun lt!599046 () Bool)

(assert (=> b!1356597 (= res!900771 (and (not (= from!3120 i!1404)) (not lt!599046) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!44471 0))(
  ( (Unit!44472) )
))
(declare-fun lt!599049 () Unit!44471)

(declare-fun e!770539 () Unit!44471)

(assert (=> b!1356597 (= lt!599049 e!770539)))

(declare-fun c!127363 () Bool)

(assert (=> b!1356597 (= c!127363 lt!599046)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1356597 (= lt!599046 (validKeyInArray!0 (select (arr!44650 a!3742) from!3120)))))

(declare-fun b!1356598 () Bool)

(declare-fun res!900769 () Bool)

(assert (=> b!1356598 (=> (not res!900769) (not e!770541))))

(assert (=> b!1356598 (= res!900769 (not (contains!9390 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356599 () Bool)

(declare-fun res!900764 () Bool)

(assert (=> b!1356599 (=> (not res!900764) (not e!770541))))

(assert (=> b!1356599 (= res!900764 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45201 a!3742))))))

(declare-fun b!1356600 () Bool)

(declare-fun lt!599047 () Unit!44471)

(assert (=> b!1356600 (= e!770539 lt!599047)))

(declare-fun lt!599045 () Unit!44471)

(declare-fun lemmaListSubSeqRefl!0 (List!31678) Unit!44471)

(assert (=> b!1356600 (= lt!599045 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!767 (List!31678 List!31678) Bool)

(assert (=> b!1356600 (subseq!767 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92413 List!31678 List!31678 (_ BitVec 32)) Unit!44471)

(declare-fun $colon$colon!781 (List!31678 (_ BitVec 64)) List!31678)

(assert (=> b!1356600 (= lt!599047 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!781 acc!759 (select (arr!44650 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1356600 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1356601 () Bool)

(declare-fun res!900770 () Bool)

(assert (=> b!1356601 (=> (not res!900770) (not e!770541))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1356601 (= res!900770 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1356603 () Bool)

(declare-fun Unit!44473 () Unit!44471)

(assert (=> b!1356603 (= e!770539 Unit!44473)))

(declare-fun b!1356604 () Bool)

(declare-fun res!900765 () Bool)

(assert (=> b!1356604 (=> (not res!900765) (not e!770541))))

(assert (=> b!1356604 (= res!900765 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1356602 () Bool)

(declare-fun res!900767 () Bool)

(assert (=> b!1356602 (=> (not res!900767) (not e!770541))))

(assert (=> b!1356602 (= res!900767 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45201 a!3742)))))

(declare-fun res!900768 () Bool)

(assert (=> start!114340 (=> (not res!900768) (not e!770541))))

(assert (=> start!114340 (= res!900768 (and (bvslt (size!45201 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45201 a!3742))))))

(assert (=> start!114340 e!770541))

(assert (=> start!114340 true))

(declare-fun array_inv!33931 (array!92413) Bool)

(assert (=> start!114340 (array_inv!33931 a!3742)))

(assert (= (and start!114340 res!900768) b!1356596))

(assert (= (and b!1356596 res!900763) b!1356595))

(assert (= (and b!1356595 res!900762) b!1356598))

(assert (= (and b!1356598 res!900769) b!1356594))

(assert (= (and b!1356594 res!900766) b!1356604))

(assert (= (and b!1356604 res!900765) b!1356599))

(assert (= (and b!1356599 res!900764) b!1356601))

(assert (= (and b!1356601 res!900770) b!1356602))

(assert (= (and b!1356602 res!900767) b!1356597))

(assert (= (and b!1356597 c!127363) b!1356600))

(assert (= (and b!1356597 (not c!127363)) b!1356603))

(assert (= (and b!1356597 res!900771) b!1356593))

(declare-fun m!1243105 () Bool)

(assert (=> b!1356601 m!1243105))

(declare-fun m!1243107 () Bool)

(assert (=> b!1356597 m!1243107))

(assert (=> b!1356597 m!1243107))

(declare-fun m!1243109 () Bool)

(assert (=> b!1356597 m!1243109))

(declare-fun m!1243111 () Bool)

(assert (=> b!1356604 m!1243111))

(declare-fun m!1243113 () Bool)

(assert (=> b!1356594 m!1243113))

(declare-fun m!1243115 () Bool)

(assert (=> b!1356595 m!1243115))

(declare-fun m!1243117 () Bool)

(assert (=> b!1356593 m!1243117))

(declare-fun m!1243119 () Bool)

(assert (=> b!1356598 m!1243119))

(declare-fun m!1243121 () Bool)

(assert (=> start!114340 m!1243121))

(declare-fun m!1243123 () Bool)

(assert (=> b!1356596 m!1243123))

(declare-fun m!1243125 () Bool)

(assert (=> b!1356600 m!1243125))

(assert (=> b!1356600 m!1243107))

(declare-fun m!1243127 () Bool)

(assert (=> b!1356600 m!1243127))

(declare-fun m!1243129 () Bool)

(assert (=> b!1356600 m!1243129))

(assert (=> b!1356600 m!1243117))

(assert (=> b!1356600 m!1243107))

(assert (=> b!1356600 m!1243127))

(declare-fun m!1243131 () Bool)

(assert (=> b!1356600 m!1243131))

(check-sat (not b!1356598) (not b!1356601) (not b!1356594) (not b!1356597) (not b!1356604) (not b!1356595) (not b!1356600) (not start!114340) (not b!1356596) (not b!1356593))
(check-sat)
