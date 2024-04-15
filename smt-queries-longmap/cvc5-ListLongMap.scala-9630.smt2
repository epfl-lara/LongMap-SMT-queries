; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113922 () Bool)

(assert start!113922)

(declare-fun b!1351081 () Bool)

(declare-fun res!896583 () Bool)

(declare-fun e!768420 () Bool)

(assert (=> b!1351081 (=> (not res!896583) (not e!768420))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1351081 (= res!896583 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1351082 () Bool)

(declare-fun res!896590 () Bool)

(assert (=> b!1351082 (=> (not res!896590) (not e!768420))))

(declare-datatypes ((List!31594 0))(
  ( (Nil!31591) (Cons!31590 (h!32799 (_ BitVec 64)) (t!46244 List!31594)) )
))
(declare-fun acc!759 () List!31594)

(declare-datatypes ((array!92053 0))(
  ( (array!92054 (arr!44475 (Array (_ BitVec 32) (_ BitVec 64))) (size!45027 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92053)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92053 (_ BitVec 32) List!31594) Bool)

(assert (=> b!1351082 (= res!896590 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1351083 () Bool)

(declare-fun res!896593 () Bool)

(assert (=> b!1351083 (=> (not res!896593) (not e!768420))))

(assert (=> b!1351083 (= res!896593 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31591))))

(declare-fun b!1351084 () Bool)

(declare-fun res!896594 () Bool)

(assert (=> b!1351084 (=> (not res!896594) (not e!768420))))

(assert (=> b!1351084 (= res!896594 (validKeyInArray!0 (select (arr!44475 a!3742) from!3120)))))

(declare-fun res!896584 () Bool)

(assert (=> start!113922 (=> (not res!896584) (not e!768420))))

(assert (=> start!113922 (= res!896584 (and (bvslt (size!45027 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45027 a!3742))))))

(assert (=> start!113922 e!768420))

(assert (=> start!113922 true))

(declare-fun array_inv!33708 (array!92053) Bool)

(assert (=> start!113922 (array_inv!33708 a!3742)))

(declare-fun b!1351085 () Bool)

(declare-fun res!896592 () Bool)

(assert (=> b!1351085 (=> (not res!896592) (not e!768420))))

(declare-fun contains!9214 (List!31594 (_ BitVec 64)) Bool)

(assert (=> b!1351085 (= res!896592 (not (contains!9214 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1351086 () Bool)

(declare-fun res!896585 () Bool)

(assert (=> b!1351086 (=> (not res!896585) (not e!768420))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1351086 (= res!896585 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45027 a!3742))))))

(declare-fun b!1351087 () Bool)

(declare-fun res!896581 () Bool)

(declare-fun e!768419 () Bool)

(assert (=> b!1351087 (=> res!896581 e!768419)))

(declare-fun lt!596966 () List!31594)

(assert (=> b!1351087 (= res!896581 (contains!9214 lt!596966 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1351088 () Bool)

(declare-fun res!896582 () Bool)

(assert (=> b!1351088 (=> res!896582 e!768419)))

(assert (=> b!1351088 (= res!896582 (contains!9214 lt!596966 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1351089 () Bool)

(declare-fun res!896591 () Bool)

(assert (=> b!1351089 (=> (not res!896591) (not e!768420))))

(assert (=> b!1351089 (= res!896591 (not (contains!9214 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1351090 () Bool)

(declare-fun res!896580 () Bool)

(assert (=> b!1351090 (=> (not res!896580) (not e!768420))))

(assert (=> b!1351090 (= res!896580 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45027 a!3742)))))

(declare-fun b!1351091 () Bool)

(assert (=> b!1351091 (= e!768420 (not e!768419))))

(declare-fun res!896586 () Bool)

(assert (=> b!1351091 (=> res!896586 e!768419)))

(assert (=> b!1351091 (= res!896586 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!687 (List!31594 (_ BitVec 64)) List!31594)

(assert (=> b!1351091 (= lt!596966 ($colon$colon!687 acc!759 (select (arr!44475 a!3742) from!3120)))))

(declare-fun subseq!670 (List!31594 List!31594) Bool)

(assert (=> b!1351091 (subseq!670 acc!759 acc!759)))

(declare-datatypes ((Unit!44095 0))(
  ( (Unit!44096) )
))
(declare-fun lt!596968 () Unit!44095)

(declare-fun lemmaListSubSeqRefl!0 (List!31594) Unit!44095)

(assert (=> b!1351091 (= lt!596968 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun b!1351092 () Bool)

(declare-fun res!896588 () Bool)

(assert (=> b!1351092 (=> res!896588 e!768419)))

(declare-fun noDuplicate!2129 (List!31594) Bool)

(assert (=> b!1351092 (= res!896588 (not (noDuplicate!2129 lt!596966)))))

(declare-fun b!1351093 () Bool)

(declare-fun res!896589 () Bool)

(assert (=> b!1351093 (=> res!896589 e!768419)))

(assert (=> b!1351093 (= res!896589 (not (subseq!670 acc!759 lt!596966)))))

(declare-fun b!1351094 () Bool)

(assert (=> b!1351094 (= e!768419 true)))

(declare-fun lt!596965 () Bool)

(assert (=> b!1351094 (= lt!596965 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!596966))))

(declare-fun lt!596967 () Unit!44095)

(declare-fun noDuplicateSubseq!121 (List!31594 List!31594) Unit!44095)

(assert (=> b!1351094 (= lt!596967 (noDuplicateSubseq!121 acc!759 lt!596966))))

(declare-fun b!1351095 () Bool)

(declare-fun res!896587 () Bool)

(assert (=> b!1351095 (=> (not res!896587) (not e!768420))))

(assert (=> b!1351095 (= res!896587 (noDuplicate!2129 acc!759))))

(assert (= (and start!113922 res!896584) b!1351095))

(assert (= (and b!1351095 res!896587) b!1351085))

(assert (= (and b!1351085 res!896592) b!1351089))

(assert (= (and b!1351089 res!896591) b!1351083))

(assert (= (and b!1351083 res!896593) b!1351082))

(assert (= (and b!1351082 res!896590) b!1351086))

(assert (= (and b!1351086 res!896585) b!1351081))

(assert (= (and b!1351081 res!896583) b!1351090))

(assert (= (and b!1351090 res!896580) b!1351084))

(assert (= (and b!1351084 res!896594) b!1351091))

(assert (= (and b!1351091 (not res!896586)) b!1351092))

(assert (= (and b!1351092 (not res!896588)) b!1351087))

(assert (= (and b!1351087 (not res!896581)) b!1351088))

(assert (= (and b!1351088 (not res!896582)) b!1351093))

(assert (= (and b!1351093 (not res!896589)) b!1351094))

(declare-fun m!1237717 () Bool)

(assert (=> start!113922 m!1237717))

(declare-fun m!1237719 () Bool)

(assert (=> b!1351089 m!1237719))

(declare-fun m!1237721 () Bool)

(assert (=> b!1351082 m!1237721))

(declare-fun m!1237723 () Bool)

(assert (=> b!1351088 m!1237723))

(declare-fun m!1237725 () Bool)

(assert (=> b!1351081 m!1237725))

(declare-fun m!1237727 () Bool)

(assert (=> b!1351095 m!1237727))

(declare-fun m!1237729 () Bool)

(assert (=> b!1351084 m!1237729))

(assert (=> b!1351084 m!1237729))

(declare-fun m!1237731 () Bool)

(assert (=> b!1351084 m!1237731))

(assert (=> b!1351091 m!1237729))

(assert (=> b!1351091 m!1237729))

(declare-fun m!1237733 () Bool)

(assert (=> b!1351091 m!1237733))

(declare-fun m!1237735 () Bool)

(assert (=> b!1351091 m!1237735))

(declare-fun m!1237737 () Bool)

(assert (=> b!1351091 m!1237737))

(declare-fun m!1237739 () Bool)

(assert (=> b!1351083 m!1237739))

(declare-fun m!1237741 () Bool)

(assert (=> b!1351092 m!1237741))

(declare-fun m!1237743 () Bool)

(assert (=> b!1351087 m!1237743))

(declare-fun m!1237745 () Bool)

(assert (=> b!1351085 m!1237745))

(declare-fun m!1237747 () Bool)

(assert (=> b!1351094 m!1237747))

(declare-fun m!1237749 () Bool)

(assert (=> b!1351094 m!1237749))

(declare-fun m!1237751 () Bool)

(assert (=> b!1351093 m!1237751))

(push 1)

(assert (not b!1351089))

(assert (not b!1351091))

(assert (not b!1351082))

(assert (not b!1351094))

(assert (not b!1351092))

(assert (not b!1351085))

(assert (not b!1351081))

(assert (not b!1351093))

(assert (not b!1351088))

(assert (not b!1351087))

(assert (not start!113922))

(assert (not b!1351095))

(assert (not b!1351083))

(assert (not b!1351084))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

