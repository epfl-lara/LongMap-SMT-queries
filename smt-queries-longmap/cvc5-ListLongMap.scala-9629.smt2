; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113916 () Bool)

(assert start!113916)

(declare-fun b!1350946 () Bool)

(declare-fun res!896445 () Bool)

(declare-fun e!768393 () Bool)

(assert (=> b!1350946 (=> (not res!896445) (not e!768393))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1350946 (= res!896445 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1350947 () Bool)

(declare-fun res!896448 () Bool)

(assert (=> b!1350947 (=> (not res!896448) (not e!768393))))

(declare-datatypes ((List!31591 0))(
  ( (Nil!31588) (Cons!31587 (h!32796 (_ BitVec 64)) (t!46241 List!31591)) )
))
(declare-fun acc!759 () List!31591)

(declare-fun noDuplicate!2126 (List!31591) Bool)

(assert (=> b!1350947 (= res!896448 (noDuplicate!2126 acc!759))))

(declare-fun b!1350948 () Bool)

(declare-fun e!768394 () Bool)

(assert (=> b!1350948 (= e!768394 true)))

(declare-fun lt!596929 () List!31591)

(declare-fun lt!596932 () Bool)

(declare-datatypes ((array!92047 0))(
  ( (array!92048 (arr!44472 (Array (_ BitVec 32) (_ BitVec 64))) (size!45024 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92047)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92047 (_ BitVec 32) List!31591) Bool)

(assert (=> b!1350948 (= lt!596932 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!596929))))

(declare-datatypes ((Unit!44089 0))(
  ( (Unit!44090) )
))
(declare-fun lt!596930 () Unit!44089)

(declare-fun noDuplicateSubseq!118 (List!31591 List!31591) Unit!44089)

(assert (=> b!1350948 (= lt!596930 (noDuplicateSubseq!118 acc!759 lt!596929))))

(declare-fun b!1350949 () Bool)

(declare-fun res!896458 () Bool)

(assert (=> b!1350949 (=> res!896458 e!768394)))

(declare-fun contains!9211 (List!31591 (_ BitVec 64)) Bool)

(assert (=> b!1350949 (= res!896458 (contains!9211 lt!596929 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1350950 () Bool)

(assert (=> b!1350950 (= e!768393 (not e!768394))))

(declare-fun res!896450 () Bool)

(assert (=> b!1350950 (=> res!896450 e!768394)))

(assert (=> b!1350950 (= res!896450 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!684 (List!31591 (_ BitVec 64)) List!31591)

(assert (=> b!1350950 (= lt!596929 ($colon$colon!684 acc!759 (select (arr!44472 a!3742) from!3120)))))

(declare-fun subseq!667 (List!31591 List!31591) Bool)

(assert (=> b!1350950 (subseq!667 acc!759 acc!759)))

(declare-fun lt!596931 () Unit!44089)

(declare-fun lemmaListSubSeqRefl!0 (List!31591) Unit!44089)

(assert (=> b!1350950 (= lt!596931 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun b!1350951 () Bool)

(declare-fun res!896455 () Bool)

(assert (=> b!1350951 (=> (not res!896455) (not e!768393))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1350951 (= res!896455 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45024 a!3742))))))

(declare-fun b!1350952 () Bool)

(declare-fun res!896449 () Bool)

(assert (=> b!1350952 (=> res!896449 e!768394)))

(assert (=> b!1350952 (= res!896449 (contains!9211 lt!596929 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1350953 () Bool)

(declare-fun res!896446 () Bool)

(assert (=> b!1350953 (=> (not res!896446) (not e!768393))))

(assert (=> b!1350953 (= res!896446 (not (contains!9211 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1350954 () Bool)

(declare-fun res!896451 () Bool)

(assert (=> b!1350954 (=> (not res!896451) (not e!768393))))

(assert (=> b!1350954 (= res!896451 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun res!896454 () Bool)

(assert (=> start!113916 (=> (not res!896454) (not e!768393))))

(assert (=> start!113916 (= res!896454 (and (bvslt (size!45024 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45024 a!3742))))))

(assert (=> start!113916 e!768393))

(assert (=> start!113916 true))

(declare-fun array_inv!33705 (array!92047) Bool)

(assert (=> start!113916 (array_inv!33705 a!3742)))

(declare-fun b!1350955 () Bool)

(declare-fun res!896452 () Bool)

(assert (=> b!1350955 (=> res!896452 e!768394)))

(assert (=> b!1350955 (= res!896452 (not (noDuplicate!2126 lt!596929)))))

(declare-fun b!1350956 () Bool)

(declare-fun res!896453 () Bool)

(assert (=> b!1350956 (=> res!896453 e!768394)))

(assert (=> b!1350956 (= res!896453 (not (subseq!667 acc!759 lt!596929)))))

(declare-fun b!1350957 () Bool)

(declare-fun res!896456 () Bool)

(assert (=> b!1350957 (=> (not res!896456) (not e!768393))))

(assert (=> b!1350957 (= res!896456 (not (contains!9211 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1350958 () Bool)

(declare-fun res!896447 () Bool)

(assert (=> b!1350958 (=> (not res!896447) (not e!768393))))

(assert (=> b!1350958 (= res!896447 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45024 a!3742)))))

(declare-fun b!1350959 () Bool)

(declare-fun res!896459 () Bool)

(assert (=> b!1350959 (=> (not res!896459) (not e!768393))))

(assert (=> b!1350959 (= res!896459 (validKeyInArray!0 (select (arr!44472 a!3742) from!3120)))))

(declare-fun b!1350960 () Bool)

(declare-fun res!896457 () Bool)

(assert (=> b!1350960 (=> (not res!896457) (not e!768393))))

(assert (=> b!1350960 (= res!896457 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31588))))

(assert (= (and start!113916 res!896454) b!1350947))

(assert (= (and b!1350947 res!896448) b!1350957))

(assert (= (and b!1350957 res!896456) b!1350953))

(assert (= (and b!1350953 res!896446) b!1350960))

(assert (= (and b!1350960 res!896457) b!1350954))

(assert (= (and b!1350954 res!896451) b!1350951))

(assert (= (and b!1350951 res!896455) b!1350946))

(assert (= (and b!1350946 res!896445) b!1350958))

(assert (= (and b!1350958 res!896447) b!1350959))

(assert (= (and b!1350959 res!896459) b!1350950))

(assert (= (and b!1350950 (not res!896450)) b!1350955))

(assert (= (and b!1350955 (not res!896452)) b!1350952))

(assert (= (and b!1350952 (not res!896449)) b!1350949))

(assert (= (and b!1350949 (not res!896458)) b!1350956))

(assert (= (and b!1350956 (not res!896453)) b!1350948))

(declare-fun m!1237609 () Bool)

(assert (=> b!1350960 m!1237609))

(declare-fun m!1237611 () Bool)

(assert (=> b!1350948 m!1237611))

(declare-fun m!1237613 () Bool)

(assert (=> b!1350948 m!1237613))

(declare-fun m!1237615 () Bool)

(assert (=> b!1350950 m!1237615))

(assert (=> b!1350950 m!1237615))

(declare-fun m!1237617 () Bool)

(assert (=> b!1350950 m!1237617))

(declare-fun m!1237619 () Bool)

(assert (=> b!1350950 m!1237619))

(declare-fun m!1237621 () Bool)

(assert (=> b!1350950 m!1237621))

(declare-fun m!1237623 () Bool)

(assert (=> b!1350947 m!1237623))

(declare-fun m!1237625 () Bool)

(assert (=> b!1350949 m!1237625))

(declare-fun m!1237627 () Bool)

(assert (=> b!1350946 m!1237627))

(declare-fun m!1237629 () Bool)

(assert (=> b!1350952 m!1237629))

(declare-fun m!1237631 () Bool)

(assert (=> b!1350954 m!1237631))

(declare-fun m!1237633 () Bool)

(assert (=> b!1350955 m!1237633))

(declare-fun m!1237635 () Bool)

(assert (=> b!1350956 m!1237635))

(declare-fun m!1237637 () Bool)

(assert (=> b!1350953 m!1237637))

(declare-fun m!1237639 () Bool)

(assert (=> b!1350957 m!1237639))

(assert (=> b!1350959 m!1237615))

(assert (=> b!1350959 m!1237615))

(declare-fun m!1237641 () Bool)

(assert (=> b!1350959 m!1237641))

(declare-fun m!1237643 () Bool)

(assert (=> start!113916 m!1237643))

(push 1)

(assert (not b!1350955))

(assert (not b!1350957))

(assert (not b!1350949))

(assert (not b!1350954))

(assert (not b!1350947))

(assert (not b!1350959))

(assert (not b!1350952))

(assert (not b!1350956))

(assert (not b!1350946))

(assert (not b!1350953))

(assert (not b!1350960))

(assert (not b!1350950))

(assert (not b!1350948))

(assert (not start!113916))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

