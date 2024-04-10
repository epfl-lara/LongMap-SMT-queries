; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114574 () Bool)

(assert start!114574)

(declare-fun b!1359455 () Bool)

(declare-fun res!903930 () Bool)

(declare-fun e!771411 () Bool)

(assert (=> b!1359455 (=> (not res!903930) (not e!771411))))

(declare-fun i!1404 () (_ BitVec 32))

(declare-datatypes ((array!92519 0))(
  ( (array!92520 (arr!44700 (Array (_ BitVec 32) (_ BitVec 64))) (size!45250 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92519)

(assert (=> b!1359455 (= res!903930 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45250 a!3742))))))

(declare-fun res!903927 () Bool)

(assert (=> start!114574 (=> (not res!903927) (not e!771411))))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114574 (= res!903927 (and (bvslt (size!45250 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45250 a!3742))))))

(assert (=> start!114574 e!771411))

(assert (=> start!114574 true))

(declare-fun array_inv!33728 (array!92519) Bool)

(assert (=> start!114574 (array_inv!33728 a!3742)))

(declare-fun b!1359456 () Bool)

(declare-datatypes ((Unit!44760 0))(
  ( (Unit!44761) )
))
(declare-fun e!771412 () Unit!44760)

(declare-fun Unit!44762 () Unit!44760)

(assert (=> b!1359456 (= e!771412 Unit!44762)))

(declare-fun b!1359457 () Bool)

(declare-fun e!771410 () Bool)

(assert (=> b!1359457 (= e!771410 false)))

(declare-datatypes ((List!31741 0))(
  ( (Nil!31738) (Cons!31737 (h!32946 (_ BitVec 64)) (t!46414 List!31741)) )
))
(declare-fun acc!759 () List!31741)

(declare-fun lt!599612 () Bool)

(declare-fun arrayNoDuplicates!0 (array!92519 (_ BitVec 32) List!31741) Bool)

(assert (=> b!1359457 (= lt!599612 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1359458 () Bool)

(assert (=> b!1359458 (= e!771411 e!771410)))

(declare-fun res!903928 () Bool)

(assert (=> b!1359458 (=> (not res!903928) (not e!771410))))

(assert (=> b!1359458 (= res!903928 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!599614 () Unit!44760)

(assert (=> b!1359458 (= lt!599614 e!771412)))

(declare-fun c!127205 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1359458 (= c!127205 (validKeyInArray!0 (select (arr!44700 a!3742) from!3120)))))

(declare-fun b!1359459 () Bool)

(declare-fun lt!599613 () Unit!44760)

(assert (=> b!1359459 (= e!771412 lt!599613)))

(declare-fun lt!599611 () Unit!44760)

(declare-fun lemmaListSubSeqRefl!0 (List!31741) Unit!44760)

(assert (=> b!1359459 (= lt!599611 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!852 (List!31741 List!31741) Bool)

(assert (=> b!1359459 (subseq!852 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92519 List!31741 List!31741 (_ BitVec 32)) Unit!44760)

(declare-fun $colon$colon!855 (List!31741 (_ BitVec 64)) List!31741)

(assert (=> b!1359459 (= lt!599613 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!855 acc!759 (select (arr!44700 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1359459 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1359460 () Bool)

(declare-fun res!903926 () Bool)

(assert (=> b!1359460 (=> (not res!903926) (not e!771411))))

(assert (=> b!1359460 (= res!903926 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45250 a!3742)))))

(declare-fun b!1359461 () Bool)

(declare-fun res!903934 () Bool)

(assert (=> b!1359461 (=> (not res!903934) (not e!771411))))

(declare-fun contains!9450 (List!31741 (_ BitVec 64)) Bool)

(assert (=> b!1359461 (= res!903934 (not (contains!9450 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1359462 () Bool)

(declare-fun res!903932 () Bool)

(assert (=> b!1359462 (=> (not res!903932) (not e!771411))))

(assert (=> b!1359462 (= res!903932 (not (contains!9450 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1359463 () Bool)

(declare-fun res!903931 () Bool)

(assert (=> b!1359463 (=> (not res!903931) (not e!771411))))

(assert (=> b!1359463 (= res!903931 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31738))))

(declare-fun b!1359464 () Bool)

(declare-fun res!903925 () Bool)

(assert (=> b!1359464 (=> (not res!903925) (not e!771411))))

(declare-fun noDuplicate!2307 (List!31741) Bool)

(assert (=> b!1359464 (= res!903925 (noDuplicate!2307 acc!759))))

(declare-fun b!1359465 () Bool)

(declare-fun res!903929 () Bool)

(assert (=> b!1359465 (=> (not res!903929) (not e!771411))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1359465 (= res!903929 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1359466 () Bool)

(declare-fun res!903933 () Bool)

(assert (=> b!1359466 (=> (not res!903933) (not e!771411))))

(assert (=> b!1359466 (= res!903933 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(assert (= (and start!114574 res!903927) b!1359464))

(assert (= (and b!1359464 res!903925) b!1359461))

(assert (= (and b!1359461 res!903934) b!1359462))

(assert (= (and b!1359462 res!903932) b!1359463))

(assert (= (and b!1359463 res!903931) b!1359466))

(assert (= (and b!1359466 res!903933) b!1359455))

(assert (= (and b!1359455 res!903930) b!1359465))

(assert (= (and b!1359465 res!903929) b!1359460))

(assert (= (and b!1359460 res!903926) b!1359458))

(assert (= (and b!1359458 c!127205) b!1359459))

(assert (= (and b!1359458 (not c!127205)) b!1359456))

(assert (= (and b!1359458 res!903928) b!1359457))

(declare-fun m!1244861 () Bool)

(assert (=> b!1359457 m!1244861))

(declare-fun m!1244863 () Bool)

(assert (=> b!1359465 m!1244863))

(declare-fun m!1244865 () Bool)

(assert (=> b!1359458 m!1244865))

(assert (=> b!1359458 m!1244865))

(declare-fun m!1244867 () Bool)

(assert (=> b!1359458 m!1244867))

(declare-fun m!1244869 () Bool)

(assert (=> b!1359461 m!1244869))

(declare-fun m!1244871 () Bool)

(assert (=> b!1359466 m!1244871))

(declare-fun m!1244873 () Bool)

(assert (=> b!1359462 m!1244873))

(declare-fun m!1244875 () Bool)

(assert (=> b!1359463 m!1244875))

(declare-fun m!1244877 () Bool)

(assert (=> b!1359459 m!1244877))

(assert (=> b!1359459 m!1244865))

(declare-fun m!1244879 () Bool)

(assert (=> b!1359459 m!1244879))

(declare-fun m!1244881 () Bool)

(assert (=> b!1359459 m!1244881))

(assert (=> b!1359459 m!1244861))

(assert (=> b!1359459 m!1244865))

(assert (=> b!1359459 m!1244879))

(declare-fun m!1244883 () Bool)

(assert (=> b!1359459 m!1244883))

(declare-fun m!1244885 () Bool)

(assert (=> start!114574 m!1244885))

(declare-fun m!1244887 () Bool)

(assert (=> b!1359464 m!1244887))

(check-sat (not b!1359463) (not b!1359459) (not start!114574) (not b!1359466) (not b!1359461) (not b!1359458) (not b!1359465) (not b!1359462) (not b!1359457) (not b!1359464))
(check-sat)
