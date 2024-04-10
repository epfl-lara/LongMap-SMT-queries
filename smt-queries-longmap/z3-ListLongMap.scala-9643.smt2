; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113998 () Bool)

(assert start!113998)

(declare-fun b!1352630 () Bool)

(declare-fun res!897941 () Bool)

(declare-fun e!768874 () Bool)

(assert (=> b!1352630 (=> (not res!897941) (not e!768874))))

(declare-datatypes ((List!31579 0))(
  ( (Nil!31576) (Cons!31575 (h!32784 (_ BitVec 64)) (t!46237 List!31579)) )
))
(declare-fun acc!759 () List!31579)

(declare-fun contains!9288 (List!31579 (_ BitVec 64)) Bool)

(assert (=> b!1352630 (= res!897941 (not (contains!9288 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1352631 () Bool)

(declare-fun res!897942 () Bool)

(assert (=> b!1352631 (=> (not res!897942) (not e!768874))))

(declare-datatypes ((array!92180 0))(
  ( (array!92181 (arr!44538 (Array (_ BitVec 32) (_ BitVec 64))) (size!45088 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92180)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92180 (_ BitVec 32) List!31579) Bool)

(assert (=> b!1352631 (= res!897942 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1352632 () Bool)

(declare-fun res!897936 () Bool)

(assert (=> b!1352632 (=> (not res!897936) (not e!768874))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1352632 (= res!897936 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45088 a!3742))))))

(declare-fun b!1352633 () Bool)

(declare-fun res!897935 () Bool)

(assert (=> b!1352633 (=> (not res!897935) (not e!768874))))

(assert (=> b!1352633 (= res!897935 (not (contains!9288 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1352634 () Bool)

(declare-datatypes ((Unit!44355 0))(
  ( (Unit!44356) )
))
(declare-fun e!768872 () Unit!44355)

(declare-fun lt!597608 () Unit!44355)

(assert (=> b!1352634 (= e!768872 lt!597608)))

(declare-fun lt!597610 () Unit!44355)

(declare-fun lemmaListSubSeqRefl!0 (List!31579) Unit!44355)

(assert (=> b!1352634 (= lt!597610 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!708 (List!31579 List!31579) Bool)

(assert (=> b!1352634 (subseq!708 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92180 List!31579 List!31579 (_ BitVec 32)) Unit!44355)

(declare-fun $colon$colon!723 (List!31579 (_ BitVec 64)) List!31579)

(assert (=> b!1352634 (= lt!597608 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!723 acc!759 (select (arr!44538 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1352634 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1352635 () Bool)

(declare-fun res!897938 () Bool)

(assert (=> b!1352635 (=> (not res!897938) (not e!768874))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1352635 (= res!897938 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1352636 () Bool)

(declare-fun Unit!44357 () Unit!44355)

(assert (=> b!1352636 (= e!768872 Unit!44357)))

(declare-fun b!1352637 () Bool)

(declare-fun res!897937 () Bool)

(assert (=> b!1352637 (=> (not res!897937) (not e!768874))))

(assert (=> b!1352637 (= res!897937 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31576))))

(declare-fun b!1352638 () Bool)

(declare-fun res!897934 () Bool)

(assert (=> b!1352638 (=> (not res!897934) (not e!768874))))

(assert (=> b!1352638 (= res!897934 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45088 a!3742)))))

(declare-fun res!897940 () Bool)

(assert (=> start!113998 (=> (not res!897940) (not e!768874))))

(assert (=> start!113998 (= res!897940 (and (bvslt (size!45088 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45088 a!3742))))))

(assert (=> start!113998 e!768874))

(assert (=> start!113998 true))

(declare-fun array_inv!33566 (array!92180) Bool)

(assert (=> start!113998 (array_inv!33566 a!3742)))

(declare-fun b!1352639 () Bool)

(declare-fun e!768873 () Bool)

(assert (=> b!1352639 (= e!768874 e!768873)))

(declare-fun res!897943 () Bool)

(assert (=> b!1352639 (=> (not res!897943) (not e!768873))))

(assert (=> b!1352639 (= res!897943 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!597609 () Unit!44355)

(assert (=> b!1352639 (= lt!597609 e!768872)))

(declare-fun c!126788 () Bool)

(assert (=> b!1352639 (= c!126788 (validKeyInArray!0 (select (arr!44538 a!3742) from!3120)))))

(declare-fun b!1352640 () Bool)

(assert (=> b!1352640 (= e!768873 false)))

(declare-fun lt!597607 () Bool)

(assert (=> b!1352640 (= lt!597607 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1352641 () Bool)

(declare-fun res!897939 () Bool)

(assert (=> b!1352641 (=> (not res!897939) (not e!768874))))

(declare-fun noDuplicate!2145 (List!31579) Bool)

(assert (=> b!1352641 (= res!897939 (noDuplicate!2145 acc!759))))

(assert (= (and start!113998 res!897940) b!1352641))

(assert (= (and b!1352641 res!897939) b!1352630))

(assert (= (and b!1352630 res!897941) b!1352633))

(assert (= (and b!1352633 res!897935) b!1352637))

(assert (= (and b!1352637 res!897937) b!1352631))

(assert (= (and b!1352631 res!897942) b!1352632))

(assert (= (and b!1352632 res!897936) b!1352635))

(assert (= (and b!1352635 res!897938) b!1352638))

(assert (= (and b!1352638 res!897934) b!1352639))

(assert (= (and b!1352639 c!126788) b!1352634))

(assert (= (and b!1352639 (not c!126788)) b!1352636))

(assert (= (and b!1352639 res!897943) b!1352640))

(declare-fun m!1239401 () Bool)

(assert (=> b!1352633 m!1239401))

(declare-fun m!1239403 () Bool)

(assert (=> b!1352635 m!1239403))

(declare-fun m!1239405 () Bool)

(assert (=> b!1352641 m!1239405))

(declare-fun m!1239407 () Bool)

(assert (=> b!1352640 m!1239407))

(declare-fun m!1239409 () Bool)

(assert (=> start!113998 m!1239409))

(declare-fun m!1239411 () Bool)

(assert (=> b!1352631 m!1239411))

(declare-fun m!1239413 () Bool)

(assert (=> b!1352630 m!1239413))

(declare-fun m!1239415 () Bool)

(assert (=> b!1352634 m!1239415))

(declare-fun m!1239417 () Bool)

(assert (=> b!1352634 m!1239417))

(declare-fun m!1239419 () Bool)

(assert (=> b!1352634 m!1239419))

(declare-fun m!1239421 () Bool)

(assert (=> b!1352634 m!1239421))

(assert (=> b!1352634 m!1239407))

(assert (=> b!1352634 m!1239417))

(assert (=> b!1352634 m!1239419))

(declare-fun m!1239423 () Bool)

(assert (=> b!1352634 m!1239423))

(assert (=> b!1352639 m!1239417))

(assert (=> b!1352639 m!1239417))

(declare-fun m!1239425 () Bool)

(assert (=> b!1352639 m!1239425))

(declare-fun m!1239427 () Bool)

(assert (=> b!1352637 m!1239427))

(check-sat (not b!1352633) (not b!1352631) (not b!1352635) (not start!113998) (not b!1352641) (not b!1352630) (not b!1352639) (not b!1352634) (not b!1352640) (not b!1352637))
(check-sat)
