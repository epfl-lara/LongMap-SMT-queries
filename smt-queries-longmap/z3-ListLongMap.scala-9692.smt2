; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114490 () Bool)

(assert start!114490)

(declare-fun b!1358784 () Bool)

(declare-fun res!903374 () Bool)

(declare-fun e!771114 () Bool)

(assert (=> b!1358784 (=> (not res!903374) (not e!771114))))

(declare-datatypes ((List!31726 0))(
  ( (Nil!31723) (Cons!31722 (h!32931 (_ BitVec 64)) (t!46396 List!31726)) )
))
(declare-fun acc!759 () List!31726)

(declare-datatypes ((array!92486 0))(
  ( (array!92487 (arr!44685 (Array (_ BitVec 32) (_ BitVec 64))) (size!45235 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92486)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92486 (_ BitVec 32) List!31726) Bool)

(assert (=> b!1358784 (= res!903374 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1358785 () Bool)

(declare-fun res!903375 () Bool)

(assert (=> b!1358785 (=> (not res!903375) (not e!771114))))

(assert (=> b!1358785 (= res!903375 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45235 a!3742)))))

(declare-fun b!1358786 () Bool)

(assert (=> b!1358786 (= e!771114 false)))

(declare-datatypes ((Unit!44715 0))(
  ( (Unit!44716) )
))
(declare-fun lt!599434 () Unit!44715)

(declare-fun e!771115 () Unit!44715)

(assert (=> b!1358786 (= lt!599434 e!771115)))

(declare-fun c!127145 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1358786 (= c!127145 (validKeyInArray!0 (select (arr!44685 a!3742) from!3120)))))

(declare-fun res!903377 () Bool)

(assert (=> start!114490 (=> (not res!903377) (not e!771114))))

(assert (=> start!114490 (= res!903377 (and (bvslt (size!45235 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45235 a!3742))))))

(assert (=> start!114490 e!771114))

(assert (=> start!114490 true))

(declare-fun array_inv!33713 (array!92486) Bool)

(assert (=> start!114490 (array_inv!33713 a!3742)))

(declare-fun b!1358787 () Bool)

(declare-fun res!903376 () Bool)

(assert (=> b!1358787 (=> (not res!903376) (not e!771114))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1358787 (= res!903376 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1358788 () Bool)

(declare-fun Unit!44717 () Unit!44715)

(assert (=> b!1358788 (= e!771115 Unit!44717)))

(declare-fun b!1358789 () Bool)

(declare-fun res!903378 () Bool)

(assert (=> b!1358789 (=> (not res!903378) (not e!771114))))

(assert (=> b!1358789 (= res!903378 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31723))))

(declare-fun b!1358790 () Bool)

(declare-fun res!903380 () Bool)

(assert (=> b!1358790 (=> (not res!903380) (not e!771114))))

(declare-fun noDuplicate!2292 (List!31726) Bool)

(assert (=> b!1358790 (= res!903380 (noDuplicate!2292 acc!759))))

(declare-fun b!1358791 () Bool)

(declare-fun res!903382 () Bool)

(assert (=> b!1358791 (=> (not res!903382) (not e!771114))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1358791 (= res!903382 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45235 a!3742))))))

(declare-fun b!1358792 () Bool)

(declare-fun lt!599433 () Unit!44715)

(assert (=> b!1358792 (= e!771115 lt!599433)))

(declare-fun lt!599432 () Unit!44715)

(declare-fun lemmaListSubSeqRefl!0 (List!31726) Unit!44715)

(assert (=> b!1358792 (= lt!599432 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!837 (List!31726 List!31726) Bool)

(assert (=> b!1358792 (subseq!837 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92486 List!31726 List!31726 (_ BitVec 32)) Unit!44715)

(declare-fun $colon$colon!840 (List!31726 (_ BitVec 64)) List!31726)

(assert (=> b!1358792 (= lt!599433 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!840 acc!759 (select (arr!44685 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1358792 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1358793 () Bool)

(declare-fun res!903381 () Bool)

(assert (=> b!1358793 (=> (not res!903381) (not e!771114))))

(declare-fun contains!9435 (List!31726 (_ BitVec 64)) Bool)

(assert (=> b!1358793 (= res!903381 (not (contains!9435 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1358794 () Bool)

(declare-fun res!903379 () Bool)

(assert (=> b!1358794 (=> (not res!903379) (not e!771114))))

(assert (=> b!1358794 (= res!903379 (not (contains!9435 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!114490 res!903377) b!1358790))

(assert (= (and b!1358790 res!903380) b!1358793))

(assert (= (and b!1358793 res!903381) b!1358794))

(assert (= (and b!1358794 res!903379) b!1358789))

(assert (= (and b!1358789 res!903378) b!1358784))

(assert (= (and b!1358784 res!903374) b!1358791))

(assert (= (and b!1358791 res!903382) b!1358787))

(assert (= (and b!1358787 res!903376) b!1358785))

(assert (= (and b!1358785 res!903375) b!1358786))

(assert (= (and b!1358786 c!127145) b!1358792))

(assert (= (and b!1358786 (not c!127145)) b!1358788))

(declare-fun m!1244315 () Bool)

(assert (=> b!1358787 m!1244315))

(declare-fun m!1244317 () Bool)

(assert (=> b!1358794 m!1244317))

(declare-fun m!1244319 () Bool)

(assert (=> b!1358784 m!1244319))

(declare-fun m!1244321 () Bool)

(assert (=> b!1358790 m!1244321))

(declare-fun m!1244323 () Bool)

(assert (=> b!1358793 m!1244323))

(declare-fun m!1244325 () Bool)

(assert (=> b!1358786 m!1244325))

(assert (=> b!1358786 m!1244325))

(declare-fun m!1244327 () Bool)

(assert (=> b!1358786 m!1244327))

(declare-fun m!1244329 () Bool)

(assert (=> b!1358792 m!1244329))

(assert (=> b!1358792 m!1244325))

(declare-fun m!1244331 () Bool)

(assert (=> b!1358792 m!1244331))

(declare-fun m!1244333 () Bool)

(assert (=> b!1358792 m!1244333))

(declare-fun m!1244335 () Bool)

(assert (=> b!1358792 m!1244335))

(assert (=> b!1358792 m!1244325))

(assert (=> b!1358792 m!1244331))

(declare-fun m!1244337 () Bool)

(assert (=> b!1358792 m!1244337))

(declare-fun m!1244339 () Bool)

(assert (=> b!1358789 m!1244339))

(declare-fun m!1244341 () Bool)

(assert (=> start!114490 m!1244341))

(check-sat (not b!1358794) (not b!1358787) (not b!1358789) (not b!1358786) (not start!114490) (not b!1358784) (not b!1358793) (not b!1358790) (not b!1358792))
