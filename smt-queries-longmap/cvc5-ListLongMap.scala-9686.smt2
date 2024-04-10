; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114350 () Bool)

(assert start!114350)

(declare-fun b!1357720 () Bool)

(declare-fun res!902432 () Bool)

(declare-fun e!770611 () Bool)

(assert (=> b!1357720 (=> (not res!902432) (not e!770611))))

(declare-fun i!1404 () (_ BitVec 32))

(declare-datatypes ((array!92442 0))(
  ( (array!92443 (arr!44666 (Array (_ BitVec 32) (_ BitVec 64))) (size!45216 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92442)

(assert (=> b!1357720 (= res!902432 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45216 a!3742))))))

(declare-fun b!1357721 () Bool)

(declare-fun e!770610 () Bool)

(assert (=> b!1357721 (= e!770610 true)))

(declare-fun lt!599209 () Bool)

(declare-datatypes ((List!31707 0))(
  ( (Nil!31704) (Cons!31703 (h!32912 (_ BitVec 64)) (t!46371 List!31707)) )
))
(declare-fun lt!599208 () List!31707)

(declare-fun contains!9416 (List!31707 (_ BitVec 64)) Bool)

(assert (=> b!1357721 (= lt!599209 (contains!9416 lt!599208 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1357722 () Bool)

(declare-fun res!902437 () Bool)

(assert (=> b!1357722 (=> res!902437 e!770610)))

(declare-fun noDuplicate!2273 (List!31707) Bool)

(assert (=> b!1357722 (= res!902437 (not (noDuplicate!2273 lt!599208)))))

(declare-fun b!1357723 () Bool)

(declare-fun res!902431 () Bool)

(assert (=> b!1357723 (=> (not res!902431) (not e!770611))))

(declare-fun acc!759 () List!31707)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92442 (_ BitVec 32) List!31707) Bool)

(assert (=> b!1357723 (= res!902431 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1357724 () Bool)

(declare-fun res!902438 () Bool)

(assert (=> b!1357724 (=> (not res!902438) (not e!770611))))

(assert (=> b!1357724 (= res!902438 (not (contains!9416 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1357725 () Bool)

(declare-fun res!902436 () Bool)

(assert (=> b!1357725 (=> (not res!902436) (not e!770611))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1357725 (= res!902436 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1357726 () Bool)

(declare-fun res!902440 () Bool)

(assert (=> b!1357726 (=> (not res!902440) (not e!770611))))

(assert (=> b!1357726 (= res!902440 (noDuplicate!2273 acc!759))))

(declare-fun b!1357727 () Bool)

(declare-fun res!902430 () Bool)

(assert (=> b!1357727 (=> (not res!902430) (not e!770611))))

(assert (=> b!1357727 (= res!902430 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31704))))

(declare-fun b!1357728 () Bool)

(declare-fun res!902429 () Bool)

(assert (=> b!1357728 (=> res!902429 e!770610)))

(assert (=> b!1357728 (= res!902429 (contains!9416 lt!599208 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!902433 () Bool)

(assert (=> start!114350 (=> (not res!902433) (not e!770611))))

(assert (=> start!114350 (= res!902433 (and (bvslt (size!45216 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45216 a!3742))))))

(assert (=> start!114350 e!770611))

(assert (=> start!114350 true))

(declare-fun array_inv!33694 (array!92442) Bool)

(assert (=> start!114350 (array_inv!33694 a!3742)))

(declare-fun b!1357729 () Bool)

(declare-fun res!902428 () Bool)

(assert (=> b!1357729 (=> (not res!902428) (not e!770611))))

(assert (=> b!1357729 (= res!902428 (not (contains!9416 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1357730 () Bool)

(assert (=> b!1357730 (= e!770611 (not e!770610))))

(declare-fun res!902435 () Bool)

(assert (=> b!1357730 (=> res!902435 e!770610)))

(assert (=> b!1357730 (= res!902435 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!821 (List!31707 (_ BitVec 64)) List!31707)

(assert (=> b!1357730 (= lt!599208 ($colon$colon!821 acc!759 (select (arr!44666 a!3742) from!3120)))))

(declare-fun subseq!818 (List!31707 List!31707) Bool)

(assert (=> b!1357730 (subseq!818 acc!759 acc!759)))

(declare-datatypes ((Unit!44667 0))(
  ( (Unit!44668) )
))
(declare-fun lt!599207 () Unit!44667)

(declare-fun lemmaListSubSeqRefl!0 (List!31707) Unit!44667)

(assert (=> b!1357730 (= lt!599207 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun b!1357731 () Bool)

(declare-fun res!902439 () Bool)

(assert (=> b!1357731 (=> (not res!902439) (not e!770611))))

(assert (=> b!1357731 (= res!902439 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45216 a!3742)))))

(declare-fun b!1357732 () Bool)

(declare-fun res!902434 () Bool)

(assert (=> b!1357732 (=> (not res!902434) (not e!770611))))

(assert (=> b!1357732 (= res!902434 (validKeyInArray!0 (select (arr!44666 a!3742) from!3120)))))

(assert (= (and start!114350 res!902433) b!1357726))

(assert (= (and b!1357726 res!902440) b!1357729))

(assert (= (and b!1357729 res!902428) b!1357724))

(assert (= (and b!1357724 res!902438) b!1357727))

(assert (= (and b!1357727 res!902430) b!1357723))

(assert (= (and b!1357723 res!902431) b!1357720))

(assert (= (and b!1357720 res!902432) b!1357725))

(assert (= (and b!1357725 res!902436) b!1357731))

(assert (= (and b!1357731 res!902439) b!1357732))

(assert (= (and b!1357732 res!902434) b!1357730))

(assert (= (and b!1357730 (not res!902435)) b!1357722))

(assert (= (and b!1357722 (not res!902437)) b!1357728))

(assert (= (and b!1357728 (not res!902429)) b!1357721))

(declare-fun m!1243411 () Bool)

(assert (=> b!1357730 m!1243411))

(assert (=> b!1357730 m!1243411))

(declare-fun m!1243413 () Bool)

(assert (=> b!1357730 m!1243413))

(declare-fun m!1243415 () Bool)

(assert (=> b!1357730 m!1243415))

(declare-fun m!1243417 () Bool)

(assert (=> b!1357730 m!1243417))

(declare-fun m!1243419 () Bool)

(assert (=> b!1357726 m!1243419))

(declare-fun m!1243421 () Bool)

(assert (=> b!1357724 m!1243421))

(declare-fun m!1243423 () Bool)

(assert (=> b!1357728 m!1243423))

(declare-fun m!1243425 () Bool)

(assert (=> b!1357725 m!1243425))

(declare-fun m!1243427 () Bool)

(assert (=> b!1357729 m!1243427))

(declare-fun m!1243429 () Bool)

(assert (=> b!1357721 m!1243429))

(declare-fun m!1243431 () Bool)

(assert (=> b!1357723 m!1243431))

(declare-fun m!1243433 () Bool)

(assert (=> start!114350 m!1243433))

(declare-fun m!1243435 () Bool)

(assert (=> b!1357727 m!1243435))

(assert (=> b!1357732 m!1243411))

(assert (=> b!1357732 m!1243411))

(declare-fun m!1243437 () Bool)

(assert (=> b!1357732 m!1243437))

(declare-fun m!1243439 () Bool)

(assert (=> b!1357722 m!1243439))

(push 1)

(assert (not b!1357730))

(assert (not b!1357723))

(assert (not b!1357722))

(assert (not b!1357729))

(assert (not b!1357732))

(assert (not b!1357726))

(assert (not b!1357725))

(assert (not start!114350))

(assert (not b!1357727))

(assert (not b!1357728))

(assert (not b!1357721))

(assert (not b!1357724))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

