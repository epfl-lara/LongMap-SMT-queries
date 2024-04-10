; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114682 () Bool)

(assert start!114682)

(declare-fun b!1360497 () Bool)

(declare-fun res!904785 () Bool)

(declare-fun e!771829 () Bool)

(assert (=> b!1360497 (=> (not res!904785) (not e!771829))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-datatypes ((array!92570 0))(
  ( (array!92571 (arr!44724 (Array (_ BitVec 32) (_ BitVec 64))) (size!45274 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92570)

(assert (=> b!1360497 (= res!904785 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45274 a!3742)))))

(declare-fun b!1360498 () Bool)

(declare-fun res!904783 () Bool)

(assert (=> b!1360498 (=> (not res!904783) (not e!771829))))

(declare-datatypes ((List!31765 0))(
  ( (Nil!31762) (Cons!31761 (h!32970 (_ BitVec 64)) (t!46441 List!31765)) )
))
(declare-fun arrayNoDuplicates!0 (array!92570 (_ BitVec 32) List!31765) Bool)

(assert (=> b!1360498 (= res!904783 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31762))))

(declare-fun b!1360499 () Bool)

(declare-datatypes ((Unit!44832 0))(
  ( (Unit!44833) )
))
(declare-fun e!771827 () Unit!44832)

(declare-fun Unit!44834 () Unit!44832)

(assert (=> b!1360499 (= e!771827 Unit!44834)))

(declare-fun res!904782 () Bool)

(assert (=> start!114682 (=> (not res!904782) (not e!771829))))

(assert (=> start!114682 (= res!904782 (and (bvslt (size!45274 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45274 a!3742))))))

(assert (=> start!114682 e!771829))

(assert (=> start!114682 true))

(declare-fun array_inv!33752 (array!92570) Bool)

(assert (=> start!114682 (array_inv!33752 a!3742)))

(declare-fun b!1360500 () Bool)

(declare-fun res!904781 () Bool)

(assert (=> b!1360500 (=> (not res!904781) (not e!771829))))

(declare-fun acc!759 () List!31765)

(assert (=> b!1360500 (= res!904781 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1360501 () Bool)

(declare-fun res!904787 () Bool)

(assert (=> b!1360501 (=> (not res!904787) (not e!771829))))

(declare-fun contains!9474 (List!31765 (_ BitVec 64)) Bool)

(assert (=> b!1360501 (= res!904787 (not (contains!9474 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1360502 () Bool)

(declare-fun res!904788 () Bool)

(assert (=> b!1360502 (=> (not res!904788) (not e!771829))))

(assert (=> b!1360502 (= res!904788 (not (contains!9474 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1360503 () Bool)

(declare-fun res!904784 () Bool)

(assert (=> b!1360503 (=> (not res!904784) (not e!771829))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1360503 (= res!904784 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1360504 () Bool)

(declare-fun res!904786 () Bool)

(assert (=> b!1360504 (=> (not res!904786) (not e!771829))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1360504 (= res!904786 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45274 a!3742))))))

(declare-fun b!1360505 () Bool)

(assert (=> b!1360505 (= e!771829 false)))

(declare-fun lt!599908 () Unit!44832)

(assert (=> b!1360505 (= lt!599908 e!771827)))

(declare-fun c!127298 () Bool)

(assert (=> b!1360505 (= c!127298 (validKeyInArray!0 (select (arr!44724 a!3742) from!3120)))))

(declare-fun b!1360506 () Bool)

(declare-fun lt!599906 () Unit!44832)

(assert (=> b!1360506 (= e!771827 lt!599906)))

(declare-fun lt!599907 () Unit!44832)

(declare-fun lemmaListSubSeqRefl!0 (List!31765) Unit!44832)

(assert (=> b!1360506 (= lt!599907 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!876 (List!31765 List!31765) Bool)

(assert (=> b!1360506 (subseq!876 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92570 List!31765 List!31765 (_ BitVec 32)) Unit!44832)

(declare-fun $colon$colon!879 (List!31765 (_ BitVec 64)) List!31765)

(assert (=> b!1360506 (= lt!599906 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!879 acc!759 (select (arr!44724 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1360506 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1360507 () Bool)

(declare-fun res!904789 () Bool)

(assert (=> b!1360507 (=> (not res!904789) (not e!771829))))

(declare-fun noDuplicate!2331 (List!31765) Bool)

(assert (=> b!1360507 (= res!904789 (noDuplicate!2331 acc!759))))

(assert (= (and start!114682 res!904782) b!1360507))

(assert (= (and b!1360507 res!904789) b!1360501))

(assert (= (and b!1360501 res!904787) b!1360502))

(assert (= (and b!1360502 res!904788) b!1360498))

(assert (= (and b!1360498 res!904783) b!1360500))

(assert (= (and b!1360500 res!904781) b!1360504))

(assert (= (and b!1360504 res!904786) b!1360503))

(assert (= (and b!1360503 res!904784) b!1360497))

(assert (= (and b!1360497 res!904785) b!1360505))

(assert (= (and b!1360505 c!127298) b!1360506))

(assert (= (and b!1360505 (not c!127298)) b!1360499))

(declare-fun m!1245761 () Bool)

(assert (=> b!1360500 m!1245761))

(declare-fun m!1245763 () Bool)

(assert (=> start!114682 m!1245763))

(declare-fun m!1245765 () Bool)

(assert (=> b!1360502 m!1245765))

(declare-fun m!1245767 () Bool)

(assert (=> b!1360505 m!1245767))

(assert (=> b!1360505 m!1245767))

(declare-fun m!1245769 () Bool)

(assert (=> b!1360505 m!1245769))

(declare-fun m!1245771 () Bool)

(assert (=> b!1360506 m!1245771))

(assert (=> b!1360506 m!1245767))

(declare-fun m!1245773 () Bool)

(assert (=> b!1360506 m!1245773))

(declare-fun m!1245775 () Bool)

(assert (=> b!1360506 m!1245775))

(declare-fun m!1245777 () Bool)

(assert (=> b!1360506 m!1245777))

(assert (=> b!1360506 m!1245767))

(assert (=> b!1360506 m!1245773))

(declare-fun m!1245779 () Bool)

(assert (=> b!1360506 m!1245779))

(declare-fun m!1245781 () Bool)

(assert (=> b!1360507 m!1245781))

(declare-fun m!1245783 () Bool)

(assert (=> b!1360501 m!1245783))

(declare-fun m!1245785 () Bool)

(assert (=> b!1360498 m!1245785))

(declare-fun m!1245787 () Bool)

(assert (=> b!1360503 m!1245787))

(check-sat (not b!1360503) (not b!1360502) (not b!1360506) (not start!114682) (not b!1360498) (not b!1360501) (not b!1360507) (not b!1360500) (not b!1360505))
