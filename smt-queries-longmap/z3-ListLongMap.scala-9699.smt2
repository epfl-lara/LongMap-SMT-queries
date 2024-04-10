; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114586 () Bool)

(assert start!114586)

(declare-fun b!1359685 () Bool)

(declare-datatypes ((Unit!44778 0))(
  ( (Unit!44779) )
))
(declare-fun e!771483 () Unit!44778)

(declare-fun lt!599675 () Unit!44778)

(assert (=> b!1359685 (= e!771483 lt!599675)))

(declare-fun lt!599676 () Unit!44778)

(declare-datatypes ((List!31747 0))(
  ( (Nil!31744) (Cons!31743 (h!32952 (_ BitVec 64)) (t!46420 List!31747)) )
))
(declare-fun acc!759 () List!31747)

(declare-fun lemmaListSubSeqRefl!0 (List!31747) Unit!44778)

(assert (=> b!1359685 (= lt!599676 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!858 (List!31747 List!31747) Bool)

(assert (=> b!1359685 (subseq!858 acc!759 acc!759)))

(declare-datatypes ((array!92531 0))(
  ( (array!92532 (arr!44706 (Array (_ BitVec 32) (_ BitVec 64))) (size!45256 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92531)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92531 List!31747 List!31747 (_ BitVec 32)) Unit!44778)

(declare-fun $colon$colon!861 (List!31747 (_ BitVec 64)) List!31747)

(assert (=> b!1359685 (= lt!599675 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!861 acc!759 (select (arr!44706 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92531 (_ BitVec 32) List!31747) Bool)

(assert (=> b!1359685 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1359686 () Bool)

(declare-fun res!904128 () Bool)

(declare-fun e!771484 () Bool)

(assert (=> b!1359686 (=> (not res!904128) (not e!771484))))

(declare-fun contains!9456 (List!31747 (_ BitVec 64)) Bool)

(assert (=> b!1359686 (= res!904128 (not (contains!9456 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!904120 () Bool)

(assert (=> start!114586 (=> (not res!904120) (not e!771484))))

(assert (=> start!114586 (= res!904120 (and (bvslt (size!45256 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45256 a!3742))))))

(assert (=> start!114586 e!771484))

(assert (=> start!114586 true))

(declare-fun array_inv!33734 (array!92531) Bool)

(assert (=> start!114586 (array_inv!33734 a!3742)))

(declare-fun b!1359687 () Bool)

(declare-fun res!904126 () Bool)

(assert (=> b!1359687 (=> (not res!904126) (not e!771484))))

(assert (=> b!1359687 (= res!904126 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31744))))

(declare-fun b!1359688 () Bool)

(declare-fun e!771481 () Bool)

(assert (=> b!1359688 (= e!771484 e!771481)))

(declare-fun res!904127 () Bool)

(assert (=> b!1359688 (=> (not res!904127) (not e!771481))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1359688 (= res!904127 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!599677 () Unit!44778)

(assert (=> b!1359688 (= lt!599677 e!771483)))

(declare-fun c!127223 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1359688 (= c!127223 (validKeyInArray!0 (select (arr!44706 a!3742) from!3120)))))

(declare-fun b!1359689 () Bool)

(assert (=> b!1359689 (= e!771481 (not true))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1359689 (arrayNoDuplicates!0 (array!92532 (store (arr!44706 a!3742) i!1404 l!3587) (size!45256 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun lt!599674 () Unit!44778)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92531 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31747) Unit!44778)

(assert (=> b!1359689 (= lt!599674 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1359690 () Bool)

(declare-fun res!904125 () Bool)

(assert (=> b!1359690 (=> (not res!904125) (not e!771484))))

(declare-fun noDuplicate!2313 (List!31747) Bool)

(assert (=> b!1359690 (= res!904125 (noDuplicate!2313 acc!759))))

(declare-fun b!1359691 () Bool)

(declare-fun res!904119 () Bool)

(assert (=> b!1359691 (=> (not res!904119) (not e!771484))))

(assert (=> b!1359691 (= res!904119 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1359692 () Bool)

(declare-fun res!904123 () Bool)

(assert (=> b!1359692 (=> (not res!904123) (not e!771484))))

(assert (=> b!1359692 (= res!904123 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45256 a!3742))))))

(declare-fun b!1359693 () Bool)

(declare-fun res!904124 () Bool)

(assert (=> b!1359693 (=> (not res!904124) (not e!771481))))

(assert (=> b!1359693 (= res!904124 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1359694 () Bool)

(declare-fun res!904122 () Bool)

(assert (=> b!1359694 (=> (not res!904122) (not e!771484))))

(assert (=> b!1359694 (= res!904122 (not (contains!9456 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1359695 () Bool)

(declare-fun res!904129 () Bool)

(assert (=> b!1359695 (=> (not res!904129) (not e!771484))))

(assert (=> b!1359695 (= res!904129 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1359696 () Bool)

(declare-fun res!904121 () Bool)

(assert (=> b!1359696 (=> (not res!904121) (not e!771484))))

(assert (=> b!1359696 (= res!904121 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45256 a!3742)))))

(declare-fun b!1359697 () Bool)

(declare-fun Unit!44780 () Unit!44778)

(assert (=> b!1359697 (= e!771483 Unit!44780)))

(assert (= (and start!114586 res!904120) b!1359690))

(assert (= (and b!1359690 res!904125) b!1359686))

(assert (= (and b!1359686 res!904128) b!1359694))

(assert (= (and b!1359694 res!904122) b!1359687))

(assert (= (and b!1359687 res!904126) b!1359695))

(assert (= (and b!1359695 res!904129) b!1359692))

(assert (= (and b!1359692 res!904123) b!1359691))

(assert (= (and b!1359691 res!904119) b!1359696))

(assert (= (and b!1359696 res!904121) b!1359688))

(assert (= (and b!1359688 c!127223) b!1359685))

(assert (= (and b!1359688 (not c!127223)) b!1359697))

(assert (= (and b!1359688 res!904127) b!1359693))

(assert (= (and b!1359693 res!904124) b!1359689))

(declare-fun m!1245035 () Bool)

(assert (=> b!1359685 m!1245035))

(declare-fun m!1245037 () Bool)

(assert (=> b!1359685 m!1245037))

(declare-fun m!1245039 () Bool)

(assert (=> b!1359685 m!1245039))

(declare-fun m!1245041 () Bool)

(assert (=> b!1359685 m!1245041))

(declare-fun m!1245043 () Bool)

(assert (=> b!1359685 m!1245043))

(assert (=> b!1359685 m!1245037))

(assert (=> b!1359685 m!1245039))

(declare-fun m!1245045 () Bool)

(assert (=> b!1359685 m!1245045))

(declare-fun m!1245047 () Bool)

(assert (=> start!114586 m!1245047))

(declare-fun m!1245049 () Bool)

(assert (=> b!1359687 m!1245049))

(declare-fun m!1245051 () Bool)

(assert (=> b!1359694 m!1245051))

(declare-fun m!1245053 () Bool)

(assert (=> b!1359691 m!1245053))

(declare-fun m!1245055 () Bool)

(assert (=> b!1359689 m!1245055))

(declare-fun m!1245057 () Bool)

(assert (=> b!1359689 m!1245057))

(declare-fun m!1245059 () Bool)

(assert (=> b!1359689 m!1245059))

(declare-fun m!1245061 () Bool)

(assert (=> b!1359695 m!1245061))

(declare-fun m!1245063 () Bool)

(assert (=> b!1359690 m!1245063))

(declare-fun m!1245065 () Bool)

(assert (=> b!1359686 m!1245065))

(assert (=> b!1359688 m!1245037))

(assert (=> b!1359688 m!1245037))

(declare-fun m!1245067 () Bool)

(assert (=> b!1359688 m!1245067))

(assert (=> b!1359693 m!1245043))

(check-sat (not start!114586) (not b!1359694) (not b!1359690) (not b!1359695) (not b!1359693) (not b!1359685) (not b!1359689) (not b!1359687) (not b!1359686) (not b!1359688) (not b!1359691))
(check-sat)
