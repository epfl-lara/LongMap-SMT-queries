; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114808 () Bool)

(assert start!114808)

(declare-fun b!1360945 () Bool)

(declare-fun e!772314 () Bool)

(declare-fun e!772313 () Bool)

(assert (=> b!1360945 (= e!772314 e!772313)))

(declare-fun res!904607 () Bool)

(assert (=> b!1360945 (=> (not res!904607) (not e!772313))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1360945 (= res!904607 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!44714 0))(
  ( (Unit!44715) )
))
(declare-fun lt!600140 () Unit!44714)

(declare-fun e!772312 () Unit!44714)

(assert (=> b!1360945 (= lt!600140 e!772312)))

(declare-fun c!127618 () Bool)

(declare-datatypes ((array!92644 0))(
  ( (array!92645 (arr!44758 (Array (_ BitVec 32) (_ BitVec 64))) (size!45309 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92644)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1360945 (= c!127618 (validKeyInArray!0 (select (arr!44758 a!3742) from!3120)))))

(declare-fun b!1360946 () Bool)

(declare-fun res!904614 () Bool)

(assert (=> b!1360946 (=> (not res!904614) (not e!772313))))

(declare-datatypes ((List!31786 0))(
  ( (Nil!31783) (Cons!31782 (h!33000 (_ BitVec 64)) (t!46451 List!31786)) )
))
(declare-fun acc!759 () List!31786)

(declare-fun arrayNoDuplicates!0 (array!92644 (_ BitVec 32) List!31786) Bool)

(assert (=> b!1360946 (= res!904614 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1360947 () Bool)

(declare-fun res!904609 () Bool)

(assert (=> b!1360947 (=> (not res!904609) (not e!772314))))

(declare-fun noDuplicate!2329 (List!31786) Bool)

(assert (=> b!1360947 (= res!904609 (noDuplicate!2329 acc!759))))

(declare-fun b!1360948 () Bool)

(assert (=> b!1360948 (= e!772313 (not true))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1360948 (arrayNoDuplicates!0 (array!92645 (store (arr!44758 a!3742) i!1404 l!3587) (size!45309 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun lt!600139 () Unit!44714)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92644 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31786) Unit!44714)

(assert (=> b!1360948 (= lt!600139 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun res!904613 () Bool)

(assert (=> start!114808 (=> (not res!904613) (not e!772314))))

(assert (=> start!114808 (= res!904613 (and (bvslt (size!45309 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45309 a!3742))))))

(assert (=> start!114808 e!772314))

(assert (=> start!114808 true))

(declare-fun array_inv!34039 (array!92644) Bool)

(assert (=> start!114808 (array_inv!34039 a!3742)))

(declare-fun b!1360949 () Bool)

(declare-fun res!904610 () Bool)

(assert (=> b!1360949 (=> (not res!904610) (not e!772314))))

(assert (=> b!1360949 (= res!904610 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45309 a!3742))))))

(declare-fun b!1360950 () Bool)

(declare-fun res!904611 () Bool)

(assert (=> b!1360950 (=> (not res!904611) (not e!772314))))

(declare-fun contains!9498 (List!31786 (_ BitVec 64)) Bool)

(assert (=> b!1360950 (= res!904611 (not (contains!9498 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1360951 () Bool)

(declare-fun lt!600138 () Unit!44714)

(assert (=> b!1360951 (= e!772312 lt!600138)))

(declare-fun lt!600141 () Unit!44714)

(declare-fun lemmaListSubSeqRefl!0 (List!31786) Unit!44714)

(assert (=> b!1360951 (= lt!600141 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!857 (List!31786 List!31786) Bool)

(assert (=> b!1360951 (subseq!857 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92644 List!31786 List!31786 (_ BitVec 32)) Unit!44714)

(declare-fun $colon$colon!859 (List!31786 (_ BitVec 64)) List!31786)

(assert (=> b!1360951 (= lt!600138 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!859 acc!759 (select (arr!44758 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1360951 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1360952 () Bool)

(declare-fun res!904606 () Bool)

(assert (=> b!1360952 (=> (not res!904606) (not e!772314))))

(assert (=> b!1360952 (= res!904606 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1360953 () Bool)

(declare-fun res!904604 () Bool)

(assert (=> b!1360953 (=> (not res!904604) (not e!772314))))

(assert (=> b!1360953 (= res!904604 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1360954 () Bool)

(declare-fun res!904612 () Bool)

(assert (=> b!1360954 (=> (not res!904612) (not e!772314))))

(assert (=> b!1360954 (= res!904612 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45309 a!3742)))))

(declare-fun b!1360955 () Bool)

(declare-fun Unit!44716 () Unit!44714)

(assert (=> b!1360955 (= e!772312 Unit!44716)))

(declare-fun b!1360956 () Bool)

(declare-fun res!904605 () Bool)

(assert (=> b!1360956 (=> (not res!904605) (not e!772314))))

(assert (=> b!1360956 (= res!904605 (not (contains!9498 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1360957 () Bool)

(declare-fun res!904608 () Bool)

(assert (=> b!1360957 (=> (not res!904608) (not e!772314))))

(assert (=> b!1360957 (= res!904608 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31783))))

(assert (= (and start!114808 res!904613) b!1360947))

(assert (= (and b!1360947 res!904609) b!1360956))

(assert (= (and b!1360956 res!904605) b!1360950))

(assert (= (and b!1360950 res!904611) b!1360957))

(assert (= (and b!1360957 res!904608) b!1360953))

(assert (= (and b!1360953 res!904604) b!1360949))

(assert (= (and b!1360949 res!904610) b!1360952))

(assert (= (and b!1360952 res!904606) b!1360954))

(assert (= (and b!1360954 res!904612) b!1360945))

(assert (= (and b!1360945 c!127618) b!1360951))

(assert (= (and b!1360945 (not c!127618)) b!1360955))

(assert (= (and b!1360945 res!904607) b!1360946))

(assert (= (and b!1360946 res!904614) b!1360948))

(declare-fun m!1246597 () Bool)

(assert (=> b!1360953 m!1246597))

(declare-fun m!1246599 () Bool)

(assert (=> b!1360950 m!1246599))

(declare-fun m!1246601 () Bool)

(assert (=> start!114808 m!1246601))

(declare-fun m!1246603 () Bool)

(assert (=> b!1360951 m!1246603))

(declare-fun m!1246605 () Bool)

(assert (=> b!1360951 m!1246605))

(declare-fun m!1246607 () Bool)

(assert (=> b!1360951 m!1246607))

(declare-fun m!1246609 () Bool)

(assert (=> b!1360951 m!1246609))

(declare-fun m!1246611 () Bool)

(assert (=> b!1360951 m!1246611))

(assert (=> b!1360951 m!1246605))

(assert (=> b!1360951 m!1246607))

(declare-fun m!1246613 () Bool)

(assert (=> b!1360951 m!1246613))

(assert (=> b!1360946 m!1246611))

(declare-fun m!1246615 () Bool)

(assert (=> b!1360952 m!1246615))

(declare-fun m!1246617 () Bool)

(assert (=> b!1360947 m!1246617))

(declare-fun m!1246619 () Bool)

(assert (=> b!1360957 m!1246619))

(assert (=> b!1360945 m!1246605))

(assert (=> b!1360945 m!1246605))

(declare-fun m!1246621 () Bool)

(assert (=> b!1360945 m!1246621))

(declare-fun m!1246623 () Bool)

(assert (=> b!1360948 m!1246623))

(declare-fun m!1246625 () Bool)

(assert (=> b!1360948 m!1246625))

(declare-fun m!1246627 () Bool)

(assert (=> b!1360948 m!1246627))

(declare-fun m!1246629 () Bool)

(assert (=> b!1360956 m!1246629))

(check-sat (not b!1360952) (not start!114808) (not b!1360956) (not b!1360957) (not b!1360945) (not b!1360948) (not b!1360947) (not b!1360951) (not b!1360953) (not b!1360950) (not b!1360946))
(check-sat)
