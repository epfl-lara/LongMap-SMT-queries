; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113990 () Bool)

(assert start!113990)

(declare-fun b!1352416 () Bool)

(declare-fun res!897794 () Bool)

(declare-fun e!768791 () Bool)

(assert (=> b!1352416 (=> (not res!897794) (not e!768791))))

(declare-fun i!1404 () (_ BitVec 32))

(declare-datatypes ((array!92121 0))(
  ( (array!92122 (arr!44509 (Array (_ BitVec 32) (_ BitVec 64))) (size!45061 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92121)

(assert (=> b!1352416 (= res!897794 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45061 a!3742))))))

(declare-fun b!1352417 () Bool)

(declare-fun res!897792 () Bool)

(assert (=> b!1352417 (=> (not res!897792) (not e!768791))))

(declare-datatypes ((List!31628 0))(
  ( (Nil!31625) (Cons!31624 (h!32833 (_ BitVec 64)) (t!46278 List!31628)) )
))
(declare-fun acc!759 () List!31628)

(declare-fun contains!9248 (List!31628 (_ BitVec 64)) Bool)

(assert (=> b!1352417 (= res!897792 (not (contains!9248 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1352418 () Bool)

(declare-fun res!897791 () Bool)

(assert (=> b!1352418 (=> (not res!897791) (not e!768791))))

(assert (=> b!1352418 (= res!897791 (not (contains!9248 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1352419 () Bool)

(declare-fun res!897785 () Bool)

(assert (=> b!1352419 (=> (not res!897785) (not e!768791))))

(declare-fun arrayNoDuplicates!0 (array!92121 (_ BitVec 32) List!31628) Bool)

(assert (=> b!1352419 (= res!897785 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31625))))

(declare-fun b!1352420 () Bool)

(declare-fun res!897790 () Bool)

(assert (=> b!1352420 (=> (not res!897790) (not e!768791))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1352420 (= res!897790 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1352421 () Bool)

(declare-datatypes ((Unit!44184 0))(
  ( (Unit!44185) )
))
(declare-fun e!768793 () Unit!44184)

(declare-fun Unit!44186 () Unit!44184)

(assert (=> b!1352421 (= e!768793 Unit!44186)))

(declare-fun b!1352422 () Bool)

(declare-fun res!897789 () Bool)

(assert (=> b!1352422 (=> (not res!897789) (not e!768791))))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> b!1352422 (= res!897789 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1352423 () Bool)

(declare-fun lt!597376 () Unit!44184)

(assert (=> b!1352423 (= e!768793 lt!597376)))

(declare-fun lt!597374 () Unit!44184)

(declare-fun lemmaListSubSeqRefl!0 (List!31628) Unit!44184)

(assert (=> b!1352423 (= lt!597374 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!704 (List!31628 List!31628) Bool)

(assert (=> b!1352423 (subseq!704 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92121 List!31628 List!31628 (_ BitVec 32)) Unit!44184)

(declare-fun $colon$colon!721 (List!31628 (_ BitVec 64)) List!31628)

(assert (=> b!1352423 (= lt!597376 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!721 acc!759 (select (arr!44509 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1352423 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1352424 () Bool)

(declare-fun res!897788 () Bool)

(assert (=> b!1352424 (=> (not res!897788) (not e!768791))))

(assert (=> b!1352424 (= res!897788 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45061 a!3742)))))

(declare-fun b!1352426 () Bool)

(declare-fun e!768790 () Bool)

(assert (=> b!1352426 (= e!768791 e!768790)))

(declare-fun res!897787 () Bool)

(assert (=> b!1352426 (=> (not res!897787) (not e!768790))))

(assert (=> b!1352426 (= res!897787 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!597375 () Unit!44184)

(assert (=> b!1352426 (= lt!597375 e!768793)))

(declare-fun c!126758 () Bool)

(assert (=> b!1352426 (= c!126758 (validKeyInArray!0 (select (arr!44509 a!3742) from!3120)))))

(declare-fun b!1352427 () Bool)

(declare-fun res!897786 () Bool)

(assert (=> b!1352427 (=> (not res!897786) (not e!768791))))

(declare-fun noDuplicate!2163 (List!31628) Bool)

(assert (=> b!1352427 (= res!897786 (noDuplicate!2163 acc!759))))

(declare-fun res!897793 () Bool)

(assert (=> start!113990 (=> (not res!897793) (not e!768791))))

(assert (=> start!113990 (= res!897793 (and (bvslt (size!45061 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45061 a!3742))))))

(assert (=> start!113990 e!768791))

(assert (=> start!113990 true))

(declare-fun array_inv!33742 (array!92121) Bool)

(assert (=> start!113990 (array_inv!33742 a!3742)))

(declare-fun b!1352425 () Bool)

(assert (=> b!1352425 (= e!768790 false)))

(declare-fun lt!597373 () Bool)

(assert (=> b!1352425 (= lt!597373 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(assert (= (and start!113990 res!897793) b!1352427))

(assert (= (and b!1352427 res!897786) b!1352418))

(assert (= (and b!1352418 res!897791) b!1352417))

(assert (= (and b!1352417 res!897792) b!1352419))

(assert (= (and b!1352419 res!897785) b!1352422))

(assert (= (and b!1352422 res!897789) b!1352416))

(assert (= (and b!1352416 res!897794) b!1352420))

(assert (= (and b!1352420 res!897790) b!1352424))

(assert (= (and b!1352424 res!897788) b!1352426))

(assert (= (and b!1352426 c!126758) b!1352423))

(assert (= (and b!1352426 (not c!126758)) b!1352421))

(assert (= (and b!1352426 res!897787) b!1352425))

(declare-fun m!1238773 () Bool)

(assert (=> b!1352418 m!1238773))

(declare-fun m!1238775 () Bool)

(assert (=> start!113990 m!1238775))

(declare-fun m!1238777 () Bool)

(assert (=> b!1352426 m!1238777))

(assert (=> b!1352426 m!1238777))

(declare-fun m!1238779 () Bool)

(assert (=> b!1352426 m!1238779))

(declare-fun m!1238781 () Bool)

(assert (=> b!1352417 m!1238781))

(declare-fun m!1238783 () Bool)

(assert (=> b!1352425 m!1238783))

(declare-fun m!1238785 () Bool)

(assert (=> b!1352419 m!1238785))

(declare-fun m!1238787 () Bool)

(assert (=> b!1352423 m!1238787))

(assert (=> b!1352423 m!1238777))

(declare-fun m!1238789 () Bool)

(assert (=> b!1352423 m!1238789))

(declare-fun m!1238791 () Bool)

(assert (=> b!1352423 m!1238791))

(assert (=> b!1352423 m!1238783))

(assert (=> b!1352423 m!1238777))

(assert (=> b!1352423 m!1238789))

(declare-fun m!1238793 () Bool)

(assert (=> b!1352423 m!1238793))

(declare-fun m!1238795 () Bool)

(assert (=> b!1352420 m!1238795))

(declare-fun m!1238797 () Bool)

(assert (=> b!1352427 m!1238797))

(declare-fun m!1238799 () Bool)

(assert (=> b!1352422 m!1238799))

(check-sat (not b!1352417) (not b!1352418) (not b!1352425) (not b!1352426) (not start!113990) (not b!1352422) (not b!1352419) (not b!1352423) (not b!1352420) (not b!1352427))
(check-sat)
