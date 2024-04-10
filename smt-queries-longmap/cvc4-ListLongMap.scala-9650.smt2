; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114042 () Bool)

(assert start!114042)

(declare-fun b!1353562 () Bool)

(declare-fun res!898741 () Bool)

(declare-fun e!769164 () Bool)

(assert (=> b!1353562 (=> (not res!898741) (not e!769164))))

(declare-datatypes ((List!31601 0))(
  ( (Nil!31598) (Cons!31597 (h!32806 (_ BitVec 64)) (t!46259 List!31601)) )
))
(declare-fun lt!597924 () List!31601)

(declare-fun contains!9310 (List!31601 (_ BitVec 64)) Bool)

(assert (=> b!1353562 (= res!898741 (not (contains!9310 lt!597924 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353563 () Bool)

(declare-fun e!769162 () Bool)

(declare-fun e!769165 () Bool)

(assert (=> b!1353563 (= e!769162 e!769165)))

(declare-fun res!898744 () Bool)

(assert (=> b!1353563 (=> (not res!898744) (not e!769165))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lt!597928 () Bool)

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1353563 (= res!898744 (and (not (= from!3120 i!1404)) lt!597928))))

(declare-datatypes ((Unit!44421 0))(
  ( (Unit!44422) )
))
(declare-fun lt!597925 () Unit!44421)

(declare-fun e!769163 () Unit!44421)

(assert (=> b!1353563 (= lt!597925 e!769163)))

(declare-fun c!126854 () Bool)

(assert (=> b!1353563 (= c!126854 lt!597928)))

(declare-datatypes ((array!92224 0))(
  ( (array!92225 (arr!44560 (Array (_ BitVec 32) (_ BitVec 64))) (size!45110 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92224)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1353563 (= lt!597928 (validKeyInArray!0 (select (arr!44560 a!3742) from!3120)))))

(declare-fun b!1353564 () Bool)

(assert (=> b!1353564 (= e!769164 false)))

(declare-fun lt!597923 () Bool)

(declare-fun arrayNoDuplicates!0 (array!92224 (_ BitVec 32) List!31601) Bool)

(assert (=> b!1353564 (= lt!597923 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!597924))))

(declare-fun b!1353565 () Bool)

(declare-fun res!898743 () Bool)

(assert (=> b!1353565 (=> (not res!898743) (not e!769162))))

(assert (=> b!1353565 (= res!898743 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31598))))

(declare-fun b!1353566 () Bool)

(declare-fun res!898742 () Bool)

(assert (=> b!1353566 (=> (not res!898742) (not e!769162))))

(declare-fun acc!759 () List!31601)

(declare-fun noDuplicate!2167 (List!31601) Bool)

(assert (=> b!1353566 (= res!898742 (noDuplicate!2167 acc!759))))

(declare-fun b!1353567 () Bool)

(declare-fun res!898735 () Bool)

(assert (=> b!1353567 (=> (not res!898735) (not e!769162))))

(assert (=> b!1353567 (= res!898735 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45110 a!3742)))))

(declare-fun b!1353568 () Bool)

(assert (=> b!1353568 (= e!769165 e!769164)))

(declare-fun res!898737 () Bool)

(assert (=> b!1353568 (=> (not res!898737) (not e!769164))))

(assert (=> b!1353568 (= res!898737 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!745 (List!31601 (_ BitVec 64)) List!31601)

(assert (=> b!1353568 (= lt!597924 ($colon$colon!745 acc!759 (select (arr!44560 a!3742) from!3120)))))

(declare-fun b!1353569 () Bool)

(declare-fun res!898745 () Bool)

(assert (=> b!1353569 (=> (not res!898745) (not e!769162))))

(assert (=> b!1353569 (= res!898745 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45110 a!3742))))))

(declare-fun b!1353570 () Bool)

(declare-fun res!898739 () Bool)

(assert (=> b!1353570 (=> (not res!898739) (not e!769162))))

(assert (=> b!1353570 (= res!898739 (not (contains!9310 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353571 () Bool)

(declare-fun res!898747 () Bool)

(assert (=> b!1353571 (=> (not res!898747) (not e!769162))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1353571 (= res!898747 (not (validKeyInArray!0 l!3587)))))

(declare-fun res!898746 () Bool)

(assert (=> start!114042 (=> (not res!898746) (not e!769162))))

(assert (=> start!114042 (= res!898746 (and (bvslt (size!45110 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45110 a!3742))))))

(assert (=> start!114042 e!769162))

(assert (=> start!114042 true))

(declare-fun array_inv!33588 (array!92224) Bool)

(assert (=> start!114042 (array_inv!33588 a!3742)))

(declare-fun b!1353572 () Bool)

(declare-fun res!898736 () Bool)

(assert (=> b!1353572 (=> (not res!898736) (not e!769162))))

(assert (=> b!1353572 (= res!898736 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1353573 () Bool)

(declare-fun res!898740 () Bool)

(assert (=> b!1353573 (=> (not res!898740) (not e!769164))))

(assert (=> b!1353573 (= res!898740 (not (contains!9310 lt!597924 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353574 () Bool)

(declare-fun lt!597927 () Unit!44421)

(assert (=> b!1353574 (= e!769163 lt!597927)))

(declare-fun lt!597926 () Unit!44421)

(declare-fun lemmaListSubSeqRefl!0 (List!31601) Unit!44421)

(assert (=> b!1353574 (= lt!597926 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!730 (List!31601 List!31601) Bool)

(assert (=> b!1353574 (subseq!730 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92224 List!31601 List!31601 (_ BitVec 32)) Unit!44421)

(assert (=> b!1353574 (= lt!597927 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!745 acc!759 (select (arr!44560 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1353574 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1353575 () Bool)

(declare-fun res!898734 () Bool)

(assert (=> b!1353575 (=> (not res!898734) (not e!769162))))

(assert (=> b!1353575 (= res!898734 (not (contains!9310 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353576 () Bool)

(declare-fun res!898738 () Bool)

(assert (=> b!1353576 (=> (not res!898738) (not e!769164))))

(assert (=> b!1353576 (= res!898738 (noDuplicate!2167 lt!597924))))

(declare-fun b!1353577 () Bool)

(declare-fun Unit!44423 () Unit!44421)

(assert (=> b!1353577 (= e!769163 Unit!44423)))

(assert (= (and start!114042 res!898746) b!1353566))

(assert (= (and b!1353566 res!898742) b!1353570))

(assert (= (and b!1353570 res!898739) b!1353575))

(assert (= (and b!1353575 res!898734) b!1353565))

(assert (= (and b!1353565 res!898743) b!1353572))

(assert (= (and b!1353572 res!898736) b!1353569))

(assert (= (and b!1353569 res!898745) b!1353571))

(assert (= (and b!1353571 res!898747) b!1353567))

(assert (= (and b!1353567 res!898735) b!1353563))

(assert (= (and b!1353563 c!126854) b!1353574))

(assert (= (and b!1353563 (not c!126854)) b!1353577))

(assert (= (and b!1353563 res!898744) b!1353568))

(assert (= (and b!1353568 res!898737) b!1353576))

(assert (= (and b!1353576 res!898738) b!1353562))

(assert (= (and b!1353562 res!898741) b!1353573))

(assert (= (and b!1353573 res!898740) b!1353564))

(declare-fun m!1240153 () Bool)

(assert (=> b!1353565 m!1240153))

(declare-fun m!1240155 () Bool)

(assert (=> b!1353566 m!1240155))

(declare-fun m!1240157 () Bool)

(assert (=> b!1353576 m!1240157))

(declare-fun m!1240159 () Bool)

(assert (=> b!1353568 m!1240159))

(assert (=> b!1353568 m!1240159))

(declare-fun m!1240161 () Bool)

(assert (=> b!1353568 m!1240161))

(declare-fun m!1240163 () Bool)

(assert (=> b!1353574 m!1240163))

(assert (=> b!1353574 m!1240159))

(assert (=> b!1353574 m!1240161))

(declare-fun m!1240165 () Bool)

(assert (=> b!1353574 m!1240165))

(declare-fun m!1240167 () Bool)

(assert (=> b!1353574 m!1240167))

(assert (=> b!1353574 m!1240159))

(assert (=> b!1353574 m!1240161))

(declare-fun m!1240169 () Bool)

(assert (=> b!1353574 m!1240169))

(declare-fun m!1240171 () Bool)

(assert (=> b!1353564 m!1240171))

(declare-fun m!1240173 () Bool)

(assert (=> b!1353573 m!1240173))

(declare-fun m!1240175 () Bool)

(assert (=> b!1353575 m!1240175))

(declare-fun m!1240177 () Bool)

(assert (=> start!114042 m!1240177))

(declare-fun m!1240179 () Bool)

(assert (=> b!1353572 m!1240179))

(assert (=> b!1353563 m!1240159))

(assert (=> b!1353563 m!1240159))

(declare-fun m!1240181 () Bool)

(assert (=> b!1353563 m!1240181))

(declare-fun m!1240183 () Bool)

(assert (=> b!1353571 m!1240183))

(declare-fun m!1240185 () Bool)

(assert (=> b!1353562 m!1240185))

(declare-fun m!1240187 () Bool)

(assert (=> b!1353570 m!1240187))

(push 1)

