; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114012 () Bool)

(assert start!114012)

(declare-fun b!1352899 () Bool)

(declare-fun res!898162 () Bool)

(declare-fun e!768957 () Bool)

(assert (=> b!1352899 (=> (not res!898162) (not e!768957))))

(declare-datatypes ((List!31586 0))(
  ( (Nil!31583) (Cons!31582 (h!32791 (_ BitVec 64)) (t!46244 List!31586)) )
))
(declare-fun acc!759 () List!31586)

(declare-datatypes ((array!92194 0))(
  ( (array!92195 (arr!44545 (Array (_ BitVec 32) (_ BitVec 64))) (size!45095 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92194)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92194 (_ BitVec 32) List!31586) Bool)

(assert (=> b!1352899 (= res!898162 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1352900 () Bool)

(declare-fun res!898165 () Bool)

(declare-fun e!768958 () Bool)

(assert (=> b!1352900 (=> (not res!898165) (not e!768958))))

(declare-fun noDuplicate!2152 (List!31586) Bool)

(assert (=> b!1352900 (= res!898165 (noDuplicate!2152 acc!759))))

(declare-fun b!1352901 () Bool)

(declare-fun res!898171 () Bool)

(assert (=> b!1352901 (=> (not res!898171) (not e!768958))))

(assert (=> b!1352901 (= res!898171 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1352902 () Bool)

(declare-fun res!898168 () Bool)

(assert (=> b!1352902 (=> (not res!898168) (not e!768958))))

(declare-fun contains!9295 (List!31586 (_ BitVec 64)) Bool)

(assert (=> b!1352902 (= res!898168 (not (contains!9295 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1352903 () Bool)

(assert (=> b!1352903 (= e!768958 e!768957)))

(declare-fun res!898163 () Bool)

(assert (=> b!1352903 (=> (not res!898163) (not e!768957))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1352903 (= res!898163 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!44376 0))(
  ( (Unit!44377) )
))
(declare-fun lt!597691 () Unit!44376)

(declare-fun e!768956 () Unit!44376)

(assert (=> b!1352903 (= lt!597691 e!768956)))

(declare-fun c!126809 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1352903 (= c!126809 (validKeyInArray!0 (select (arr!44545 a!3742) from!3120)))))

(declare-fun b!1352904 () Bool)

(declare-fun res!898170 () Bool)

(assert (=> b!1352904 (=> (not res!898170) (not e!768958))))

(assert (=> b!1352904 (= res!898170 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45095 a!3742)))))

(declare-fun b!1352905 () Bool)

(declare-fun lt!597692 () Unit!44376)

(assert (=> b!1352905 (= e!768956 lt!597692)))

(declare-fun lt!597693 () Unit!44376)

(declare-fun lemmaListSubSeqRefl!0 (List!31586) Unit!44376)

(assert (=> b!1352905 (= lt!597693 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!715 (List!31586 List!31586) Bool)

(assert (=> b!1352905 (subseq!715 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92194 List!31586 List!31586 (_ BitVec 32)) Unit!44376)

(declare-fun $colon$colon!730 (List!31586 (_ BitVec 64)) List!31586)

(assert (=> b!1352905 (= lt!597692 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!730 acc!759 (select (arr!44545 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1352905 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1352906 () Bool)

(declare-fun res!898169 () Bool)

(assert (=> b!1352906 (=> (not res!898169) (not e!768958))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1352906 (= res!898169 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1352907 () Bool)

(declare-fun res!898164 () Bool)

(assert (=> b!1352907 (=> (not res!898164) (not e!768958))))

(assert (=> b!1352907 (= res!898164 (not (contains!9295 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!898167 () Bool)

(assert (=> start!114012 (=> (not res!898167) (not e!768958))))

(assert (=> start!114012 (= res!898167 (and (bvslt (size!45095 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45095 a!3742))))))

(assert (=> start!114012 e!768958))

(assert (=> start!114012 true))

(declare-fun array_inv!33573 (array!92194) Bool)

(assert (=> start!114012 (array_inv!33573 a!3742)))

(declare-fun b!1352908 () Bool)

(declare-fun res!898166 () Bool)

(assert (=> b!1352908 (=> (not res!898166) (not e!768958))))

(assert (=> b!1352908 (= res!898166 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31583))))

(declare-fun b!1352909 () Bool)

(declare-fun res!898161 () Bool)

(assert (=> b!1352909 (=> (not res!898161) (not e!768958))))

(assert (=> b!1352909 (= res!898161 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45095 a!3742))))))

(declare-fun b!1352910 () Bool)

(declare-fun Unit!44378 () Unit!44376)

(assert (=> b!1352910 (= e!768956 Unit!44378)))

(declare-fun b!1352911 () Bool)

(assert (=> b!1352911 (= e!768957 (not true))))

(assert (=> b!1352911 (arrayNoDuplicates!0 (array!92195 (store (arr!44545 a!3742) i!1404 l!3587) (size!45095 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun lt!597694 () Unit!44376)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92194 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31586) Unit!44376)

(assert (=> b!1352911 (= lt!597694 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(assert (= (and start!114012 res!898167) b!1352900))

(assert (= (and b!1352900 res!898165) b!1352902))

(assert (= (and b!1352902 res!898168) b!1352907))

(assert (= (and b!1352907 res!898164) b!1352908))

(assert (= (and b!1352908 res!898166) b!1352901))

(assert (= (and b!1352901 res!898171) b!1352909))

(assert (= (and b!1352909 res!898161) b!1352906))

(assert (= (and b!1352906 res!898169) b!1352904))

(assert (= (and b!1352904 res!898170) b!1352903))

(assert (= (and b!1352903 c!126809) b!1352905))

(assert (= (and b!1352903 (not c!126809)) b!1352910))

(assert (= (and b!1352903 res!898163) b!1352899))

(assert (= (and b!1352899 res!898162) b!1352911))

(declare-fun m!1239627 () Bool)

(assert (=> b!1352899 m!1239627))

(declare-fun m!1239629 () Bool)

(assert (=> b!1352906 m!1239629))

(declare-fun m!1239631 () Bool)

(assert (=> b!1352900 m!1239631))

(declare-fun m!1239633 () Bool)

(assert (=> b!1352905 m!1239633))

(declare-fun m!1239635 () Bool)

(assert (=> b!1352905 m!1239635))

(declare-fun m!1239637 () Bool)

(assert (=> b!1352905 m!1239637))

(declare-fun m!1239639 () Bool)

(assert (=> b!1352905 m!1239639))

(assert (=> b!1352905 m!1239627))

(assert (=> b!1352905 m!1239635))

(assert (=> b!1352905 m!1239637))

(declare-fun m!1239641 () Bool)

(assert (=> b!1352905 m!1239641))

(declare-fun m!1239643 () Bool)

(assert (=> b!1352901 m!1239643))

(declare-fun m!1239645 () Bool)

(assert (=> b!1352911 m!1239645))

(declare-fun m!1239647 () Bool)

(assert (=> b!1352911 m!1239647))

(declare-fun m!1239649 () Bool)

(assert (=> b!1352911 m!1239649))

(declare-fun m!1239651 () Bool)

(assert (=> b!1352902 m!1239651))

(declare-fun m!1239653 () Bool)

(assert (=> b!1352908 m!1239653))

(declare-fun m!1239655 () Bool)

(assert (=> start!114012 m!1239655))

(assert (=> b!1352903 m!1239635))

(assert (=> b!1352903 m!1239635))

(declare-fun m!1239657 () Bool)

(assert (=> b!1352903 m!1239657))

(declare-fun m!1239659 () Bool)

(assert (=> b!1352907 m!1239659))

(push 1)

(assert (not b!1352905))

