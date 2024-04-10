; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114664 () Bool)

(assert start!114664)

(declare-fun b!1360200 () Bool)

(declare-fun res!904540 () Bool)

(declare-fun e!771748 () Bool)

(assert (=> b!1360200 (=> (not res!904540) (not e!771748))))

(declare-datatypes ((List!31756 0))(
  ( (Nil!31753) (Cons!31752 (h!32961 (_ BitVec 64)) (t!46432 List!31756)) )
))
(declare-fun acc!759 () List!31756)

(declare-fun contains!9465 (List!31756 (_ BitVec 64)) Bool)

(assert (=> b!1360200 (= res!904540 (not (contains!9465 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1360201 () Bool)

(declare-fun res!904542 () Bool)

(assert (=> b!1360201 (=> (not res!904542) (not e!771748))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1360201 (= res!904542 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1360202 () Bool)

(declare-fun res!904538 () Bool)

(assert (=> b!1360202 (=> (not res!904538) (not e!771748))))

(declare-datatypes ((array!92552 0))(
  ( (array!92553 (arr!44715 (Array (_ BitVec 32) (_ BitVec 64))) (size!45265 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92552)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92552 (_ BitVec 32) List!31756) Bool)

(assert (=> b!1360202 (= res!904538 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1360203 () Bool)

(declare-datatypes ((Unit!44805 0))(
  ( (Unit!44806) )
))
(declare-fun e!771746 () Unit!44805)

(declare-fun Unit!44807 () Unit!44805)

(assert (=> b!1360203 (= e!771746 Unit!44807)))

(declare-fun b!1360204 () Bool)

(declare-fun res!904543 () Bool)

(assert (=> b!1360204 (=> (not res!904543) (not e!771748))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1360204 (= res!904543 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45265 a!3742))))))

(declare-fun b!1360205 () Bool)

(declare-fun res!904544 () Bool)

(assert (=> b!1360205 (=> (not res!904544) (not e!771748))))

(assert (=> b!1360205 (= res!904544 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31753))))

(declare-fun b!1360206 () Bool)

(declare-fun res!904545 () Bool)

(assert (=> b!1360206 (=> (not res!904545) (not e!771748))))

(assert (=> b!1360206 (= res!904545 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45265 a!3742)))))

(declare-fun b!1360207 () Bool)

(declare-fun lt!599817 () Unit!44805)

(assert (=> b!1360207 (= e!771746 lt!599817)))

(declare-fun lt!599818 () Unit!44805)

(declare-fun lemmaListSubSeqRefl!0 (List!31756) Unit!44805)

(assert (=> b!1360207 (= lt!599818 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!867 (List!31756 List!31756) Bool)

(assert (=> b!1360207 (subseq!867 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92552 List!31756 List!31756 (_ BitVec 32)) Unit!44805)

(declare-fun $colon$colon!870 (List!31756 (_ BitVec 64)) List!31756)

(assert (=> b!1360207 (= lt!599817 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!870 acc!759 (select (arr!44715 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1360207 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1360208 () Bool)

(declare-fun res!904539 () Bool)

(assert (=> b!1360208 (=> (not res!904539) (not e!771748))))

(declare-fun noDuplicate!2322 (List!31756) Bool)

(assert (=> b!1360208 (= res!904539 (noDuplicate!2322 acc!759))))

(declare-fun res!904546 () Bool)

(assert (=> start!114664 (=> (not res!904546) (not e!771748))))

(assert (=> start!114664 (= res!904546 (and (bvslt (size!45265 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45265 a!3742))))))

(assert (=> start!114664 e!771748))

(assert (=> start!114664 true))

(declare-fun array_inv!33743 (array!92552) Bool)

(assert (=> start!114664 (array_inv!33743 a!3742)))

(declare-fun b!1360209 () Bool)

(assert (=> b!1360209 (= e!771748 false)))

(declare-fun lt!599816 () Unit!44805)

(assert (=> b!1360209 (= lt!599816 e!771746)))

(declare-fun c!127271 () Bool)

(assert (=> b!1360209 (= c!127271 (validKeyInArray!0 (select (arr!44715 a!3742) from!3120)))))

(declare-fun b!1360210 () Bool)

(declare-fun res!904541 () Bool)

(assert (=> b!1360210 (=> (not res!904541) (not e!771748))))

(assert (=> b!1360210 (= res!904541 (not (contains!9465 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!114664 res!904546) b!1360208))

(assert (= (and b!1360208 res!904539) b!1360200))

(assert (= (and b!1360200 res!904540) b!1360210))

(assert (= (and b!1360210 res!904541) b!1360205))

(assert (= (and b!1360205 res!904544) b!1360202))

(assert (= (and b!1360202 res!904538) b!1360204))

(assert (= (and b!1360204 res!904543) b!1360201))

(assert (= (and b!1360201 res!904542) b!1360206))

(assert (= (and b!1360206 res!904545) b!1360209))

(assert (= (and b!1360209 c!127271) b!1360207))

(assert (= (and b!1360209 (not c!127271)) b!1360203))

(declare-fun m!1245509 () Bool)

(assert (=> b!1360209 m!1245509))

(assert (=> b!1360209 m!1245509))

(declare-fun m!1245511 () Bool)

(assert (=> b!1360209 m!1245511))

(declare-fun m!1245513 () Bool)

(assert (=> b!1360200 m!1245513))

(declare-fun m!1245515 () Bool)

(assert (=> b!1360207 m!1245515))

(assert (=> b!1360207 m!1245509))

(declare-fun m!1245517 () Bool)

(assert (=> b!1360207 m!1245517))

(declare-fun m!1245519 () Bool)

(assert (=> b!1360207 m!1245519))

(declare-fun m!1245521 () Bool)

(assert (=> b!1360207 m!1245521))

(assert (=> b!1360207 m!1245509))

(assert (=> b!1360207 m!1245517))

(declare-fun m!1245523 () Bool)

(assert (=> b!1360207 m!1245523))

(declare-fun m!1245525 () Bool)

(assert (=> b!1360205 m!1245525))

(declare-fun m!1245527 () Bool)

(assert (=> start!114664 m!1245527))

(declare-fun m!1245529 () Bool)

(assert (=> b!1360202 m!1245529))

(declare-fun m!1245531 () Bool)

(assert (=> b!1360210 m!1245531))

(declare-fun m!1245533 () Bool)

(assert (=> b!1360201 m!1245533))

(declare-fun m!1245535 () Bool)

(assert (=> b!1360208 m!1245535))

(check-sat (not b!1360201) (not start!114664) (not b!1360210) (not b!1360207) (not b!1360205) (not b!1360202) (not b!1360200) (not b!1360209) (not b!1360208))
