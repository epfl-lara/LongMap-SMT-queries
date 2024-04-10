; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114568 () Bool)

(assert start!114568)

(declare-fun b!1359347 () Bool)

(declare-fun e!771373 () Bool)

(declare-fun e!771374 () Bool)

(assert (=> b!1359347 (= e!771373 e!771374)))

(declare-fun res!903835 () Bool)

(assert (=> b!1359347 (=> (not res!903835) (not e!771374))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1359347 (= res!903835 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!44751 0))(
  ( (Unit!44752) )
))
(declare-fun lt!599576 () Unit!44751)

(declare-fun e!771375 () Unit!44751)

(assert (=> b!1359347 (= lt!599576 e!771375)))

(declare-fun c!127196 () Bool)

(declare-datatypes ((array!92513 0))(
  ( (array!92514 (arr!44697 (Array (_ BitVec 32) (_ BitVec 64))) (size!45247 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92513)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1359347 (= c!127196 (validKeyInArray!0 (select (arr!44697 a!3742) from!3120)))))

(declare-fun b!1359348 () Bool)

(declare-fun lt!599577 () Unit!44751)

(assert (=> b!1359348 (= e!771375 lt!599577)))

(declare-fun lt!599578 () Unit!44751)

(declare-datatypes ((List!31738 0))(
  ( (Nil!31735) (Cons!31734 (h!32943 (_ BitVec 64)) (t!46411 List!31738)) )
))
(declare-fun acc!759 () List!31738)

(declare-fun lemmaListSubSeqRefl!0 (List!31738) Unit!44751)

(assert (=> b!1359348 (= lt!599578 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!849 (List!31738 List!31738) Bool)

(assert (=> b!1359348 (subseq!849 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92513 List!31738 List!31738 (_ BitVec 32)) Unit!44751)

(declare-fun $colon$colon!852 (List!31738 (_ BitVec 64)) List!31738)

(assert (=> b!1359348 (= lt!599577 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!852 acc!759 (select (arr!44697 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92513 (_ BitVec 32) List!31738) Bool)

(assert (=> b!1359348 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1359349 () Bool)

(declare-fun res!903837 () Bool)

(assert (=> b!1359349 (=> (not res!903837) (not e!771373))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1359349 (= res!903837 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1359350 () Bool)

(declare-fun res!903838 () Bool)

(assert (=> b!1359350 (=> (not res!903838) (not e!771373))))

(declare-fun contains!9447 (List!31738 (_ BitVec 64)) Bool)

(assert (=> b!1359350 (= res!903838 (not (contains!9447 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1359351 () Bool)

(declare-fun res!903843 () Bool)

(assert (=> b!1359351 (=> (not res!903843) (not e!771373))))

(assert (=> b!1359351 (= res!903843 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45247 a!3742))))))

(declare-fun b!1359352 () Bool)

(declare-fun Unit!44753 () Unit!44751)

(assert (=> b!1359352 (= e!771375 Unit!44753)))

(declare-fun b!1359353 () Bool)

(assert (=> b!1359353 (= e!771374 false)))

(declare-fun lt!599575 () Bool)

(assert (=> b!1359353 (= lt!599575 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1359354 () Bool)

(declare-fun res!903842 () Bool)

(assert (=> b!1359354 (=> (not res!903842) (not e!771373))))

(assert (=> b!1359354 (= res!903842 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31735))))

(declare-fun b!1359356 () Bool)

(declare-fun res!903841 () Bool)

(assert (=> b!1359356 (=> (not res!903841) (not e!771373))))

(assert (=> b!1359356 (= res!903841 (not (contains!9447 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1359355 () Bool)

(declare-fun res!903839 () Bool)

(assert (=> b!1359355 (=> (not res!903839) (not e!771373))))

(assert (=> b!1359355 (= res!903839 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun res!903836 () Bool)

(assert (=> start!114568 (=> (not res!903836) (not e!771373))))

(assert (=> start!114568 (= res!903836 (and (bvslt (size!45247 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45247 a!3742))))))

(assert (=> start!114568 e!771373))

(assert (=> start!114568 true))

(declare-fun array_inv!33725 (array!92513) Bool)

(assert (=> start!114568 (array_inv!33725 a!3742)))

(declare-fun b!1359357 () Bool)

(declare-fun res!903840 () Bool)

(assert (=> b!1359357 (=> (not res!903840) (not e!771373))))

(declare-fun noDuplicate!2304 (List!31738) Bool)

(assert (=> b!1359357 (= res!903840 (noDuplicate!2304 acc!759))))

(declare-fun b!1359358 () Bool)

(declare-fun res!903844 () Bool)

(assert (=> b!1359358 (=> (not res!903844) (not e!771373))))

(assert (=> b!1359358 (= res!903844 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45247 a!3742)))))

(assert (= (and start!114568 res!903836) b!1359357))

(assert (= (and b!1359357 res!903840) b!1359350))

(assert (= (and b!1359350 res!903838) b!1359356))

(assert (= (and b!1359356 res!903841) b!1359354))

(assert (= (and b!1359354 res!903842) b!1359355))

(assert (= (and b!1359355 res!903839) b!1359351))

(assert (= (and b!1359351 res!903843) b!1359349))

(assert (= (and b!1359349 res!903837) b!1359358))

(assert (= (and b!1359358 res!903844) b!1359347))

(assert (= (and b!1359347 c!127196) b!1359348))

(assert (= (and b!1359347 (not c!127196)) b!1359352))

(assert (= (and b!1359347 res!903835) b!1359353))

(declare-fun m!1244777 () Bool)

(assert (=> b!1359347 m!1244777))

(assert (=> b!1359347 m!1244777))

(declare-fun m!1244779 () Bool)

(assert (=> b!1359347 m!1244779))

(declare-fun m!1244781 () Bool)

(assert (=> b!1359357 m!1244781))

(declare-fun m!1244783 () Bool)

(assert (=> b!1359355 m!1244783))

(declare-fun m!1244785 () Bool)

(assert (=> start!114568 m!1244785))

(declare-fun m!1244787 () Bool)

(assert (=> b!1359348 m!1244787))

(assert (=> b!1359348 m!1244777))

(declare-fun m!1244789 () Bool)

(assert (=> b!1359348 m!1244789))

(declare-fun m!1244791 () Bool)

(assert (=> b!1359348 m!1244791))

(declare-fun m!1244793 () Bool)

(assert (=> b!1359348 m!1244793))

(assert (=> b!1359348 m!1244777))

(assert (=> b!1359348 m!1244789))

(declare-fun m!1244795 () Bool)

(assert (=> b!1359348 m!1244795))

(declare-fun m!1244797 () Bool)

(assert (=> b!1359354 m!1244797))

(declare-fun m!1244799 () Bool)

(assert (=> b!1359350 m!1244799))

(assert (=> b!1359353 m!1244793))

(declare-fun m!1244801 () Bool)

(assert (=> b!1359356 m!1244801))

(declare-fun m!1244803 () Bool)

(assert (=> b!1359349 m!1244803))

(check-sat (not b!1359353) (not b!1359347) (not b!1359348) (not b!1359356) (not b!1359357) (not b!1359354) (not b!1359355) (not b!1359350) (not start!114568) (not b!1359349))
(check-sat)
