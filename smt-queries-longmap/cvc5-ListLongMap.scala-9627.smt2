; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114128 () Bool)

(assert start!114128)

(declare-fun b!1352045 () Bool)

(declare-fun res!896731 () Bool)

(declare-fun e!769216 () Bool)

(assert (=> b!1352045 (=> (not res!896731) (not e!769216))))

(declare-datatypes ((array!92201 0))(
  ( (array!92202 (arr!44544 (Array (_ BitVec 32) (_ BitVec 64))) (size!45095 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92201)

(declare-datatypes ((List!31572 0))(
  ( (Nil!31569) (Cons!31568 (h!32786 (_ BitVec 64)) (t!46222 List!31572)) )
))
(declare-fun arrayNoDuplicates!0 (array!92201 (_ BitVec 32) List!31572) Bool)

(assert (=> b!1352045 (= res!896731 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31569))))

(declare-fun b!1352046 () Bool)

(declare-fun res!896729 () Bool)

(declare-fun e!769214 () Bool)

(assert (=> b!1352046 (=> res!896729 e!769214)))

(declare-fun lt!597520 () List!31572)

(declare-fun contains!9284 (List!31572 (_ BitVec 64)) Bool)

(assert (=> b!1352046 (= res!896729 (contains!9284 lt!597520 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1352047 () Bool)

(declare-fun res!896728 () Bool)

(assert (=> b!1352047 (=> (not res!896728) (not e!769216))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1352047 (= res!896728 (validKeyInArray!0 (select (arr!44544 a!3742) from!3120)))))

(declare-fun b!1352048 () Bool)

(declare-fun res!896735 () Bool)

(assert (=> b!1352048 (=> res!896735 e!769214)))

(declare-fun noDuplicate!2115 (List!31572) Bool)

(assert (=> b!1352048 (= res!896735 (not (noDuplicate!2115 lt!597520)))))

(declare-fun b!1352049 () Bool)

(declare-fun res!896736 () Bool)

(assert (=> b!1352049 (=> (not res!896736) (not e!769216))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1352049 (= res!896736 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45095 a!3742))))))

(declare-fun b!1352050 () Bool)

(declare-fun res!896730 () Bool)

(assert (=> b!1352050 (=> res!896730 e!769214)))

(declare-fun acc!759 () List!31572)

(declare-fun subseq!661 (List!31572 List!31572) Bool)

(assert (=> b!1352050 (= res!896730 (not (subseq!661 acc!759 lt!597520)))))

(declare-fun b!1352051 () Bool)

(declare-fun res!896723 () Bool)

(assert (=> b!1352051 (=> (not res!896723) (not e!769216))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1352051 (= res!896723 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1352052 () Bool)

(declare-fun res!896733 () Bool)

(assert (=> b!1352052 (=> (not res!896733) (not e!769216))))

(assert (=> b!1352052 (= res!896733 (noDuplicate!2115 acc!759))))

(declare-fun b!1352053 () Bool)

(declare-fun res!896722 () Bool)

(assert (=> b!1352053 (=> (not res!896722) (not e!769216))))

(assert (=> b!1352053 (= res!896722 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45095 a!3742)))))

(declare-fun res!896727 () Bool)

(assert (=> start!114128 (=> (not res!896727) (not e!769216))))

(assert (=> start!114128 (= res!896727 (and (bvslt (size!45095 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45095 a!3742))))))

(assert (=> start!114128 e!769216))

(assert (=> start!114128 true))

(declare-fun array_inv!33825 (array!92201) Bool)

(assert (=> start!114128 (array_inv!33825 a!3742)))

(declare-fun b!1352054 () Bool)

(declare-fun res!896734 () Bool)

(assert (=> b!1352054 (=> (not res!896734) (not e!769216))))

(assert (=> b!1352054 (= res!896734 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1352055 () Bool)

(declare-fun res!896726 () Bool)

(assert (=> b!1352055 (=> (not res!896726) (not e!769216))))

(assert (=> b!1352055 (= res!896726 (not (contains!9284 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1352056 () Bool)

(assert (=> b!1352056 (= e!769214 true)))

(declare-fun lt!597521 () Bool)

(assert (=> b!1352056 (= lt!597521 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!597520))))

(declare-datatypes ((Unit!44175 0))(
  ( (Unit!44176) )
))
(declare-fun lt!597519 () Unit!44175)

(declare-fun noDuplicateSubseq!112 (List!31572 List!31572) Unit!44175)

(assert (=> b!1352056 (= lt!597519 (noDuplicateSubseq!112 acc!759 lt!597520))))

(declare-fun b!1352057 () Bool)

(assert (=> b!1352057 (= e!769216 (not e!769214))))

(declare-fun res!896724 () Bool)

(assert (=> b!1352057 (=> res!896724 e!769214)))

(assert (=> b!1352057 (= res!896724 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!675 (List!31572 (_ BitVec 64)) List!31572)

(assert (=> b!1352057 (= lt!597520 ($colon$colon!675 acc!759 (select (arr!44544 a!3742) from!3120)))))

(assert (=> b!1352057 (subseq!661 acc!759 acc!759)))

(declare-fun lt!597522 () Unit!44175)

(declare-fun lemmaListSubSeqRefl!0 (List!31572) Unit!44175)

(assert (=> b!1352057 (= lt!597522 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun b!1352058 () Bool)

(declare-fun res!896725 () Bool)

(assert (=> b!1352058 (=> (not res!896725) (not e!769216))))

(assert (=> b!1352058 (= res!896725 (not (contains!9284 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1352059 () Bool)

(declare-fun res!896732 () Bool)

(assert (=> b!1352059 (=> res!896732 e!769214)))

(assert (=> b!1352059 (= res!896732 (contains!9284 lt!597520 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!114128 res!896727) b!1352052))

(assert (= (and b!1352052 res!896733) b!1352058))

(assert (= (and b!1352058 res!896725) b!1352055))

(assert (= (and b!1352055 res!896726) b!1352045))

(assert (= (and b!1352045 res!896731) b!1352054))

(assert (= (and b!1352054 res!896734) b!1352049))

(assert (= (and b!1352049 res!896736) b!1352051))

(assert (= (and b!1352051 res!896723) b!1352053))

(assert (= (and b!1352053 res!896722) b!1352047))

(assert (= (and b!1352047 res!896728) b!1352057))

(assert (= (and b!1352057 (not res!896724)) b!1352048))

(assert (= (and b!1352048 (not res!896735)) b!1352046))

(assert (= (and b!1352046 (not res!896729)) b!1352059))

(assert (= (and b!1352059 (not res!896732)) b!1352050))

(assert (= (and b!1352050 (not res!896730)) b!1352056))

(declare-fun m!1239505 () Bool)

(assert (=> b!1352045 m!1239505))

(declare-fun m!1239507 () Bool)

(assert (=> b!1352055 m!1239507))

(declare-fun m!1239509 () Bool)

(assert (=> b!1352047 m!1239509))

(assert (=> b!1352047 m!1239509))

(declare-fun m!1239511 () Bool)

(assert (=> b!1352047 m!1239511))

(declare-fun m!1239513 () Bool)

(assert (=> b!1352051 m!1239513))

(assert (=> b!1352057 m!1239509))

(assert (=> b!1352057 m!1239509))

(declare-fun m!1239515 () Bool)

(assert (=> b!1352057 m!1239515))

(declare-fun m!1239517 () Bool)

(assert (=> b!1352057 m!1239517))

(declare-fun m!1239519 () Bool)

(assert (=> b!1352057 m!1239519))

(declare-fun m!1239521 () Bool)

(assert (=> b!1352056 m!1239521))

(declare-fun m!1239523 () Bool)

(assert (=> b!1352056 m!1239523))

(declare-fun m!1239525 () Bool)

(assert (=> b!1352048 m!1239525))

(declare-fun m!1239527 () Bool)

(assert (=> b!1352046 m!1239527))

(declare-fun m!1239529 () Bool)

(assert (=> b!1352059 m!1239529))

(declare-fun m!1239531 () Bool)

(assert (=> start!114128 m!1239531))

(declare-fun m!1239533 () Bool)

(assert (=> b!1352052 m!1239533))

(declare-fun m!1239535 () Bool)

(assert (=> b!1352054 m!1239535))

(declare-fun m!1239537 () Bool)

(assert (=> b!1352050 m!1239537))

(declare-fun m!1239539 () Bool)

(assert (=> b!1352058 m!1239539))

(push 1)

(assert (not b!1352058))

(assert (not b!1352059))

(assert (not b!1352051))

(assert (not b!1352052))

(assert (not b!1352045))

(assert (not b!1352047))

(assert (not b!1352055))

(assert (not b!1352050))

(assert (not b!1352048))

(assert (not b!1352056))

(assert (not b!1352046))

(assert (not b!1352057))

(assert (not start!114128))

(assert (not b!1352054))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

