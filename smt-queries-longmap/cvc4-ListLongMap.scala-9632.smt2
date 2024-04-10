; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113934 () Bool)

(assert start!113934)

(declare-fun b!1351421 () Bool)

(declare-fun res!896879 () Bool)

(declare-fun e!768507 () Bool)

(assert (=> b!1351421 (=> (not res!896879) (not e!768507))))

(declare-datatypes ((array!92116 0))(
  ( (array!92117 (arr!44506 (Array (_ BitVec 32) (_ BitVec 64))) (size!45056 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92116)

(declare-datatypes ((List!31547 0))(
  ( (Nil!31544) (Cons!31543 (h!32752 (_ BitVec 64)) (t!46205 List!31547)) )
))
(declare-fun arrayNoDuplicates!0 (array!92116 (_ BitVec 32) List!31547) Bool)

(assert (=> b!1351421 (= res!896879 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31544))))

(declare-fun b!1351422 () Bool)

(declare-fun res!896892 () Bool)

(assert (=> b!1351422 (=> (not res!896892) (not e!768507))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1351422 (= res!896892 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1351423 () Bool)

(declare-fun res!896889 () Bool)

(declare-fun e!768508 () Bool)

(assert (=> b!1351423 (=> res!896889 e!768508)))

(declare-fun lt!597225 () List!31547)

(declare-fun contains!9256 (List!31547 (_ BitVec 64)) Bool)

(assert (=> b!1351423 (= res!896889 (contains!9256 lt!597225 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1351424 () Bool)

(declare-fun res!896885 () Bool)

(assert (=> b!1351424 (=> (not res!896885) (not e!768507))))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> b!1351424 (= res!896885 (validKeyInArray!0 (select (arr!44506 a!3742) from!3120)))))

(declare-fun b!1351425 () Bool)

(declare-fun res!896886 () Bool)

(assert (=> b!1351425 (=> (not res!896886) (not e!768507))))

(declare-fun acc!759 () List!31547)

(assert (=> b!1351425 (= res!896886 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1351426 () Bool)

(declare-fun res!896887 () Bool)

(assert (=> b!1351426 (=> (not res!896887) (not e!768507))))

(declare-fun noDuplicate!2113 (List!31547) Bool)

(assert (=> b!1351426 (= res!896887 (noDuplicate!2113 acc!759))))

(declare-fun res!896890 () Bool)

(assert (=> start!113934 (=> (not res!896890) (not e!768507))))

(assert (=> start!113934 (= res!896890 (and (bvslt (size!45056 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45056 a!3742))))))

(assert (=> start!113934 e!768507))

(assert (=> start!113934 true))

(declare-fun array_inv!33534 (array!92116) Bool)

(assert (=> start!113934 (array_inv!33534 a!3742)))

(declare-fun b!1351427 () Bool)

(assert (=> b!1351427 (= e!768507 (not e!768508))))

(declare-fun res!896888 () Bool)

(assert (=> b!1351427 (=> res!896888 e!768508)))

(assert (=> b!1351427 (= res!896888 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!691 (List!31547 (_ BitVec 64)) List!31547)

(assert (=> b!1351427 (= lt!597225 ($colon$colon!691 acc!759 (select (arr!44506 a!3742) from!3120)))))

(declare-fun subseq!676 (List!31547 List!31547) Bool)

(assert (=> b!1351427 (subseq!676 acc!759 acc!759)))

(declare-datatypes ((Unit!44266 0))(
  ( (Unit!44267) )
))
(declare-fun lt!597224 () Unit!44266)

(declare-fun lemmaListSubSeqRefl!0 (List!31547) Unit!44266)

(assert (=> b!1351427 (= lt!597224 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun b!1351428 () Bool)

(declare-fun res!896891 () Bool)

(assert (=> b!1351428 (=> (not res!896891) (not e!768507))))

(assert (=> b!1351428 (= res!896891 (not (contains!9256 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1351429 () Bool)

(declare-fun res!896893 () Bool)

(assert (=> b!1351429 (=> (not res!896893) (not e!768507))))

(assert (=> b!1351429 (= res!896893 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45056 a!3742)))))

(declare-fun b!1351430 () Bool)

(assert (=> b!1351430 (= e!768508 true)))

(declare-fun lt!597223 () Bool)

(assert (=> b!1351430 (= lt!597223 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!597225))))

(declare-fun lt!597226 () Unit!44266)

(declare-fun noDuplicateSubseq!127 (List!31547 List!31547) Unit!44266)

(assert (=> b!1351430 (= lt!597226 (noDuplicateSubseq!127 acc!759 lt!597225))))

(declare-fun b!1351431 () Bool)

(declare-fun res!896881 () Bool)

(assert (=> b!1351431 (=> res!896881 e!768508)))

(assert (=> b!1351431 (= res!896881 (contains!9256 lt!597225 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1351432 () Bool)

(declare-fun res!896880 () Bool)

(assert (=> b!1351432 (=> (not res!896880) (not e!768507))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1351432 (= res!896880 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45056 a!3742))))))

(declare-fun b!1351433 () Bool)

(declare-fun res!896883 () Bool)

(assert (=> b!1351433 (=> res!896883 e!768508)))

(assert (=> b!1351433 (= res!896883 (not (noDuplicate!2113 lt!597225)))))

(declare-fun b!1351434 () Bool)

(declare-fun res!896884 () Bool)

(assert (=> b!1351434 (=> res!896884 e!768508)))

(assert (=> b!1351434 (= res!896884 (not (subseq!676 acc!759 lt!597225)))))

(declare-fun b!1351435 () Bool)

(declare-fun res!896882 () Bool)

(assert (=> b!1351435 (=> (not res!896882) (not e!768507))))

(assert (=> b!1351435 (= res!896882 (not (contains!9256 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!113934 res!896890) b!1351426))

(assert (= (and b!1351426 res!896887) b!1351435))

(assert (= (and b!1351435 res!896882) b!1351428))

(assert (= (and b!1351428 res!896891) b!1351421))

(assert (= (and b!1351421 res!896879) b!1351425))

(assert (= (and b!1351425 res!896886) b!1351432))

(assert (= (and b!1351432 res!896880) b!1351422))

(assert (= (and b!1351422 res!896892) b!1351429))

(assert (= (and b!1351429 res!896893) b!1351424))

(assert (= (and b!1351424 res!896885) b!1351427))

(assert (= (and b!1351427 (not res!896888)) b!1351433))

(assert (= (and b!1351433 (not res!896883)) b!1351431))

(assert (= (and b!1351431 (not res!896881)) b!1351423))

(assert (= (and b!1351423 (not res!896889)) b!1351434))

(assert (= (and b!1351434 (not res!896884)) b!1351430))

(declare-fun m!1238449 () Bool)

(assert (=> b!1351421 m!1238449))

(declare-fun m!1238451 () Bool)

(assert (=> b!1351430 m!1238451))

(declare-fun m!1238453 () Bool)

(assert (=> b!1351430 m!1238453))

(declare-fun m!1238455 () Bool)

(assert (=> b!1351431 m!1238455))

(declare-fun m!1238457 () Bool)

(assert (=> b!1351427 m!1238457))

(assert (=> b!1351427 m!1238457))

(declare-fun m!1238459 () Bool)

(assert (=> b!1351427 m!1238459))

(declare-fun m!1238461 () Bool)

(assert (=> b!1351427 m!1238461))

(declare-fun m!1238463 () Bool)

(assert (=> b!1351427 m!1238463))

(assert (=> b!1351424 m!1238457))

(assert (=> b!1351424 m!1238457))

(declare-fun m!1238465 () Bool)

(assert (=> b!1351424 m!1238465))

(declare-fun m!1238467 () Bool)

(assert (=> start!113934 m!1238467))

(declare-fun m!1238469 () Bool)

(assert (=> b!1351425 m!1238469))

(declare-fun m!1238471 () Bool)

(assert (=> b!1351434 m!1238471))

(declare-fun m!1238473 () Bool)

(assert (=> b!1351433 m!1238473))

(declare-fun m!1238475 () Bool)

(assert (=> b!1351428 m!1238475))

(declare-fun m!1238477 () Bool)

(assert (=> b!1351423 m!1238477))

(declare-fun m!1238479 () Bool)

(assert (=> b!1351422 m!1238479))

(declare-fun m!1238481 () Bool)

(assert (=> b!1351435 m!1238481))

(declare-fun m!1238483 () Bool)

(assert (=> b!1351426 m!1238483))

(push 1)

(assert (not b!1351430))

(assert (not b!1351433))

(assert (not b!1351422))

(assert (not b!1351427))

(assert (not b!1351425))

(assert (not b!1351423))

(assert (not b!1351421))

(assert (not b!1351434))

(assert (not b!1351431))

(assert (not b!1351426))

(assert (not b!1351424))

(assert (not start!113934))

(assert (not b!1351435))

(assert (not b!1351428))

(check-sat)

(pop 1)

(push 1)

(check-sat)

