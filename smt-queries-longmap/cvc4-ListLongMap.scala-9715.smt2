; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114966 () Bool)

(assert start!114966)

(declare-fun b!1362639 () Bool)

(declare-fun res!906595 () Bool)

(declare-fun e!772939 () Bool)

(assert (=> b!1362639 (=> (not res!906595) (not e!772939))))

(declare-datatypes ((List!31796 0))(
  ( (Nil!31793) (Cons!31792 (h!33001 (_ BitVec 64)) (t!46484 List!31796)) )
))
(declare-fun acc!759 () List!31796)

(declare-fun noDuplicate!2362 (List!31796) Bool)

(assert (=> b!1362639 (= res!906595 (noDuplicate!2362 acc!759))))

(declare-fun b!1362640 () Bool)

(declare-fun res!906596 () Bool)

(assert (=> b!1362640 (=> (not res!906596) (not e!772939))))

(declare-fun contains!9505 (List!31796 (_ BitVec 64)) Bool)

(assert (=> b!1362640 (= res!906596 (not (contains!9505 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1362641 () Bool)

(declare-fun res!906593 () Bool)

(assert (=> b!1362641 (=> (not res!906593) (not e!772939))))

(declare-datatypes ((array!92644 0))(
  ( (array!92645 (arr!44755 (Array (_ BitVec 32) (_ BitVec 64))) (size!45305 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92644)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92644 (_ BitVec 32) List!31796) Bool)

(assert (=> b!1362641 (= res!906593 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1362642 () Bool)

(declare-fun res!906601 () Bool)

(assert (=> b!1362642 (=> (not res!906601) (not e!772939))))

(assert (=> b!1362642 (= res!906601 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31793))))

(declare-fun b!1362643 () Bool)

(declare-fun res!906597 () Bool)

(assert (=> b!1362643 (=> (not res!906597) (not e!772939))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1362643 (= res!906597 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45305 a!3742))))))

(declare-fun b!1362644 () Bool)

(declare-fun res!906600 () Bool)

(assert (=> b!1362644 (=> (not res!906600) (not e!772939))))

(assert (=> b!1362644 (= res!906600 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45305 a!3742)))))

(declare-fun res!906594 () Bool)

(assert (=> start!114966 (=> (not res!906594) (not e!772939))))

(assert (=> start!114966 (= res!906594 (and (bvslt (size!45305 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45305 a!3742))))))

(assert (=> start!114966 e!772939))

(assert (=> start!114966 true))

(declare-fun array_inv!33783 (array!92644) Bool)

(assert (=> start!114966 (array_inv!33783 a!3742)))

(declare-fun b!1362645 () Bool)

(declare-datatypes ((Unit!44925 0))(
  ( (Unit!44926) )
))
(declare-fun e!772938 () Unit!44925)

(declare-fun lt!600541 () Unit!44925)

(assert (=> b!1362645 (= e!772938 lt!600541)))

(declare-fun lt!600539 () Unit!44925)

(declare-fun lemmaListSubSeqRefl!0 (List!31796) Unit!44925)

(assert (=> b!1362645 (= lt!600539 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!907 (List!31796 List!31796) Bool)

(assert (=> b!1362645 (subseq!907 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92644 List!31796 List!31796 (_ BitVec 32)) Unit!44925)

(declare-fun $colon$colon!910 (List!31796 (_ BitVec 64)) List!31796)

(assert (=> b!1362645 (= lt!600541 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!910 acc!759 (select (arr!44755 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1362645 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1362646 () Bool)

(assert (=> b!1362646 (= e!772939 false)))

(declare-fun lt!600540 () Unit!44925)

(assert (=> b!1362646 (= lt!600540 e!772938)))

(declare-fun c!127463 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1362646 (= c!127463 (validKeyInArray!0 (select (arr!44755 a!3742) from!3120)))))

(declare-fun b!1362647 () Bool)

(declare-fun res!906599 () Bool)

(assert (=> b!1362647 (=> (not res!906599) (not e!772939))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1362647 (= res!906599 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1362648 () Bool)

(declare-fun res!906598 () Bool)

(assert (=> b!1362648 (=> (not res!906598) (not e!772939))))

(assert (=> b!1362648 (= res!906598 (not (contains!9505 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1362649 () Bool)

(declare-fun Unit!44927 () Unit!44925)

(assert (=> b!1362649 (= e!772938 Unit!44927)))

(assert (= (and start!114966 res!906594) b!1362639))

(assert (= (and b!1362639 res!906595) b!1362640))

(assert (= (and b!1362640 res!906596) b!1362648))

(assert (= (and b!1362648 res!906598) b!1362642))

(assert (= (and b!1362642 res!906601) b!1362641))

(assert (= (and b!1362641 res!906593) b!1362643))

(assert (= (and b!1362643 res!906597) b!1362647))

(assert (= (and b!1362647 res!906599) b!1362644))

(assert (= (and b!1362644 res!906600) b!1362646))

(assert (= (and b!1362646 c!127463) b!1362645))

(assert (= (and b!1362646 (not c!127463)) b!1362649))

(declare-fun m!1247583 () Bool)

(assert (=> b!1362645 m!1247583))

(declare-fun m!1247585 () Bool)

(assert (=> b!1362645 m!1247585))

(declare-fun m!1247587 () Bool)

(assert (=> b!1362645 m!1247587))

(declare-fun m!1247589 () Bool)

(assert (=> b!1362645 m!1247589))

(declare-fun m!1247591 () Bool)

(assert (=> b!1362645 m!1247591))

(assert (=> b!1362645 m!1247585))

(assert (=> b!1362645 m!1247587))

(declare-fun m!1247593 () Bool)

(assert (=> b!1362645 m!1247593))

(declare-fun m!1247595 () Bool)

(assert (=> b!1362647 m!1247595))

(declare-fun m!1247597 () Bool)

(assert (=> b!1362640 m!1247597))

(declare-fun m!1247599 () Bool)

(assert (=> b!1362641 m!1247599))

(declare-fun m!1247601 () Bool)

(assert (=> start!114966 m!1247601))

(assert (=> b!1362646 m!1247585))

(assert (=> b!1362646 m!1247585))

(declare-fun m!1247603 () Bool)

(assert (=> b!1362646 m!1247603))

(declare-fun m!1247605 () Bool)

(assert (=> b!1362648 m!1247605))

(declare-fun m!1247607 () Bool)

(assert (=> b!1362642 m!1247607))

(declare-fun m!1247609 () Bool)

(assert (=> b!1362639 m!1247609))

(push 1)

(assert (not start!114966))

(assert (not b!1362639))

(assert (not b!1362648))

(assert (not b!1362645))

(assert (not b!1362642))

(assert (not b!1362647))

(assert (not b!1362646))

(assert (not b!1362640))

(assert (not b!1362641))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

