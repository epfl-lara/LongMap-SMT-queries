; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114352 () Bool)

(assert start!114352)

(declare-fun b!1357759 () Bool)

(declare-fun res!902467 () Bool)

(declare-fun e!770619 () Bool)

(assert (=> b!1357759 (=> (not res!902467) (not e!770619))))

(declare-datatypes ((array!92444 0))(
  ( (array!92445 (arr!44667 (Array (_ BitVec 32) (_ BitVec 64))) (size!45217 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92444)

(declare-datatypes ((List!31708 0))(
  ( (Nil!31705) (Cons!31704 (h!32913 (_ BitVec 64)) (t!46372 List!31708)) )
))
(declare-fun arrayNoDuplicates!0 (array!92444 (_ BitVec 32) List!31708) Bool)

(assert (=> b!1357759 (= res!902467 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31705))))

(declare-fun b!1357760 () Bool)

(declare-fun res!902479 () Bool)

(assert (=> b!1357760 (=> (not res!902479) (not e!770619))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1357760 (= res!902479 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45217 a!3742))))))

(declare-fun b!1357761 () Bool)

(declare-fun res!902475 () Bool)

(assert (=> b!1357761 (=> (not res!902475) (not e!770619))))

(declare-fun acc!759 () List!31708)

(declare-fun noDuplicate!2274 (List!31708) Bool)

(assert (=> b!1357761 (= res!902475 (noDuplicate!2274 acc!759))))

(declare-fun b!1357762 () Bool)

(declare-fun res!902469 () Bool)

(declare-fun e!770618 () Bool)

(assert (=> b!1357762 (=> res!902469 e!770618)))

(declare-fun lt!599216 () List!31708)

(assert (=> b!1357762 (= res!902469 (not (noDuplicate!2274 lt!599216)))))

(declare-fun b!1357763 () Bool)

(assert (=> b!1357763 (= e!770619 (not e!770618))))

(declare-fun res!902474 () Bool)

(assert (=> b!1357763 (=> res!902474 e!770618)))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> b!1357763 (= res!902474 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!822 (List!31708 (_ BitVec 64)) List!31708)

(assert (=> b!1357763 (= lt!599216 ($colon$colon!822 acc!759 (select (arr!44667 a!3742) from!3120)))))

(declare-fun subseq!819 (List!31708 List!31708) Bool)

(assert (=> b!1357763 (subseq!819 acc!759 acc!759)))

(declare-datatypes ((Unit!44669 0))(
  ( (Unit!44670) )
))
(declare-fun lt!599218 () Unit!44669)

(declare-fun lemmaListSubSeqRefl!0 (List!31708) Unit!44669)

(assert (=> b!1357763 (= lt!599218 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun b!1357764 () Bool)

(declare-fun res!902473 () Bool)

(assert (=> b!1357764 (=> res!902473 e!770618)))

(declare-fun contains!9417 (List!31708 (_ BitVec 64)) Bool)

(assert (=> b!1357764 (= res!902473 (contains!9417 lt!599216 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1357765 () Bool)

(assert (=> b!1357765 (= e!770618 true)))

(declare-fun lt!599217 () Bool)

(assert (=> b!1357765 (= lt!599217 (contains!9417 lt!599216 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!902478 () Bool)

(assert (=> start!114352 (=> (not res!902478) (not e!770619))))

(assert (=> start!114352 (= res!902478 (and (bvslt (size!45217 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45217 a!3742))))))

(assert (=> start!114352 e!770619))

(assert (=> start!114352 true))

(declare-fun array_inv!33695 (array!92444) Bool)

(assert (=> start!114352 (array_inv!33695 a!3742)))

(declare-fun b!1357766 () Bool)

(declare-fun res!902472 () Bool)

(assert (=> b!1357766 (=> (not res!902472) (not e!770619))))

(assert (=> b!1357766 (= res!902472 (not (contains!9417 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1357767 () Bool)

(declare-fun res!902476 () Bool)

(assert (=> b!1357767 (=> (not res!902476) (not e!770619))))

(assert (=> b!1357767 (= res!902476 (not (contains!9417 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1357768 () Bool)

(declare-fun res!902470 () Bool)

(assert (=> b!1357768 (=> (not res!902470) (not e!770619))))

(assert (=> b!1357768 (= res!902470 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45217 a!3742)))))

(declare-fun b!1357769 () Bool)

(declare-fun res!902477 () Bool)

(assert (=> b!1357769 (=> (not res!902477) (not e!770619))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1357769 (= res!902477 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1357770 () Bool)

(declare-fun res!902471 () Bool)

(assert (=> b!1357770 (=> (not res!902471) (not e!770619))))

(assert (=> b!1357770 (= res!902471 (validKeyInArray!0 (select (arr!44667 a!3742) from!3120)))))

(declare-fun b!1357771 () Bool)

(declare-fun res!902468 () Bool)

(assert (=> b!1357771 (=> (not res!902468) (not e!770619))))

(assert (=> b!1357771 (= res!902468 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(assert (= (and start!114352 res!902478) b!1357761))

(assert (= (and b!1357761 res!902475) b!1357766))

(assert (= (and b!1357766 res!902472) b!1357767))

(assert (= (and b!1357767 res!902476) b!1357759))

(assert (= (and b!1357759 res!902467) b!1357771))

(assert (= (and b!1357771 res!902468) b!1357760))

(assert (= (and b!1357760 res!902479) b!1357769))

(assert (= (and b!1357769 res!902477) b!1357768))

(assert (= (and b!1357768 res!902470) b!1357770))

(assert (= (and b!1357770 res!902471) b!1357763))

(assert (= (and b!1357763 (not res!902474)) b!1357762))

(assert (= (and b!1357762 (not res!902469)) b!1357764))

(assert (= (and b!1357764 (not res!902473)) b!1357765))

(declare-fun m!1243441 () Bool)

(assert (=> b!1357765 m!1243441))

(declare-fun m!1243443 () Bool)

(assert (=> b!1357770 m!1243443))

(assert (=> b!1357770 m!1243443))

(declare-fun m!1243445 () Bool)

(assert (=> b!1357770 m!1243445))

(declare-fun m!1243447 () Bool)

(assert (=> b!1357767 m!1243447))

(declare-fun m!1243449 () Bool)

(assert (=> b!1357764 m!1243449))

(declare-fun m!1243451 () Bool)

(assert (=> b!1357771 m!1243451))

(declare-fun m!1243453 () Bool)

(assert (=> start!114352 m!1243453))

(declare-fun m!1243455 () Bool)

(assert (=> b!1357759 m!1243455))

(declare-fun m!1243457 () Bool)

(assert (=> b!1357761 m!1243457))

(assert (=> b!1357763 m!1243443))

(assert (=> b!1357763 m!1243443))

(declare-fun m!1243459 () Bool)

(assert (=> b!1357763 m!1243459))

(declare-fun m!1243461 () Bool)

(assert (=> b!1357763 m!1243461))

(declare-fun m!1243463 () Bool)

(assert (=> b!1357763 m!1243463))

(declare-fun m!1243465 () Bool)

(assert (=> b!1357762 m!1243465))

(declare-fun m!1243467 () Bool)

(assert (=> b!1357769 m!1243467))

(declare-fun m!1243469 () Bool)

(assert (=> b!1357766 m!1243469))

(check-sat (not b!1357765) (not b!1357770) (not b!1357759) (not b!1357764) (not b!1357766) (not b!1357771) (not b!1357761) (not b!1357767) (not start!114352) (not b!1357762) (not b!1357769) (not b!1357763))
(check-sat)
