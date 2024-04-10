; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114684 () Bool)

(assert start!114684)

(declare-fun b!1360530 () Bool)

(declare-fun res!904813 () Bool)

(declare-fun e!771838 () Bool)

(assert (=> b!1360530 (=> (not res!904813) (not e!771838))))

(declare-fun i!1404 () (_ BitVec 32))

(declare-datatypes ((array!92572 0))(
  ( (array!92573 (arr!44725 (Array (_ BitVec 32) (_ BitVec 64))) (size!45275 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92572)

(assert (=> b!1360530 (= res!904813 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45275 a!3742))))))

(declare-fun b!1360532 () Bool)

(declare-fun res!904811 () Bool)

(assert (=> b!1360532 (=> (not res!904811) (not e!771838))))

(declare-datatypes ((List!31766 0))(
  ( (Nil!31763) (Cons!31762 (h!32971 (_ BitVec 64)) (t!46442 List!31766)) )
))
(declare-fun acc!759 () List!31766)

(declare-fun contains!9475 (List!31766 (_ BitVec 64)) Bool)

(assert (=> b!1360532 (= res!904811 (not (contains!9475 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1360533 () Bool)

(declare-fun res!904815 () Bool)

(assert (=> b!1360533 (=> (not res!904815) (not e!771838))))

(declare-fun arrayNoDuplicates!0 (array!92572 (_ BitVec 32) List!31766) Bool)

(assert (=> b!1360533 (= res!904815 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31763))))

(declare-fun b!1360534 () Bool)

(declare-datatypes ((Unit!44835 0))(
  ( (Unit!44836) )
))
(declare-fun e!771836 () Unit!44835)

(declare-fun Unit!44837 () Unit!44835)

(assert (=> b!1360534 (= e!771836 Unit!44837)))

(declare-fun b!1360535 () Bool)

(declare-fun res!904812 () Bool)

(assert (=> b!1360535 (=> (not res!904812) (not e!771838))))

(declare-fun noDuplicate!2332 (List!31766) Bool)

(assert (=> b!1360535 (= res!904812 (noDuplicate!2332 acc!759))))

(declare-fun b!1360536 () Bool)

(declare-fun lt!599916 () Unit!44835)

(assert (=> b!1360536 (= e!771836 lt!599916)))

(declare-fun lt!599917 () Unit!44835)

(declare-fun lemmaListSubSeqRefl!0 (List!31766) Unit!44835)

(assert (=> b!1360536 (= lt!599917 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!877 (List!31766 List!31766) Bool)

(assert (=> b!1360536 (subseq!877 acc!759 acc!759)))

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92572 List!31766 List!31766 (_ BitVec 32)) Unit!44835)

(declare-fun $colon$colon!880 (List!31766 (_ BitVec 64)) List!31766)

(assert (=> b!1360536 (= lt!599916 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!880 acc!759 (select (arr!44725 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1360536 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1360537 () Bool)

(declare-fun res!904810 () Bool)

(assert (=> b!1360537 (=> (not res!904810) (not e!771838))))

(assert (=> b!1360537 (= res!904810 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1360538 () Bool)

(declare-fun res!904814 () Bool)

(assert (=> b!1360538 (=> (not res!904814) (not e!771838))))

(assert (=> b!1360538 (= res!904814 (not (contains!9475 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!904816 () Bool)

(assert (=> start!114684 (=> (not res!904816) (not e!771838))))

(assert (=> start!114684 (= res!904816 (and (bvslt (size!45275 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45275 a!3742))))))

(assert (=> start!114684 e!771838))

(assert (=> start!114684 true))

(declare-fun array_inv!33753 (array!92572) Bool)

(assert (=> start!114684 (array_inv!33753 a!3742)))

(declare-fun b!1360531 () Bool)

(declare-fun res!904808 () Bool)

(assert (=> b!1360531 (=> (not res!904808) (not e!771838))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1360531 (= res!904808 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1360539 () Bool)

(assert (=> b!1360539 (= e!771838 false)))

(declare-fun lt!599915 () Unit!44835)

(assert (=> b!1360539 (= lt!599915 e!771836)))

(declare-fun c!127301 () Bool)

(assert (=> b!1360539 (= c!127301 (validKeyInArray!0 (select (arr!44725 a!3742) from!3120)))))

(declare-fun b!1360540 () Bool)

(declare-fun res!904809 () Bool)

(assert (=> b!1360540 (=> (not res!904809) (not e!771838))))

(assert (=> b!1360540 (= res!904809 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45275 a!3742)))))

(assert (= (and start!114684 res!904816) b!1360535))

(assert (= (and b!1360535 res!904812) b!1360538))

(assert (= (and b!1360538 res!904814) b!1360532))

(assert (= (and b!1360532 res!904811) b!1360533))

(assert (= (and b!1360533 res!904815) b!1360537))

(assert (= (and b!1360537 res!904810) b!1360530))

(assert (= (and b!1360530 res!904813) b!1360531))

(assert (= (and b!1360531 res!904808) b!1360540))

(assert (= (and b!1360540 res!904809) b!1360539))

(assert (= (and b!1360539 c!127301) b!1360536))

(assert (= (and b!1360539 (not c!127301)) b!1360534))

(declare-fun m!1245789 () Bool)

(assert (=> b!1360532 m!1245789))

(declare-fun m!1245791 () Bool)

(assert (=> b!1360538 m!1245791))

(declare-fun m!1245793 () Bool)

(assert (=> b!1360537 m!1245793))

(declare-fun m!1245795 () Bool)

(assert (=> b!1360539 m!1245795))

(assert (=> b!1360539 m!1245795))

(declare-fun m!1245797 () Bool)

(assert (=> b!1360539 m!1245797))

(declare-fun m!1245799 () Bool)

(assert (=> b!1360536 m!1245799))

(assert (=> b!1360536 m!1245795))

(declare-fun m!1245801 () Bool)

(assert (=> b!1360536 m!1245801))

(declare-fun m!1245803 () Bool)

(assert (=> b!1360536 m!1245803))

(declare-fun m!1245805 () Bool)

(assert (=> b!1360536 m!1245805))

(assert (=> b!1360536 m!1245795))

(assert (=> b!1360536 m!1245801))

(declare-fun m!1245807 () Bool)

(assert (=> b!1360536 m!1245807))

(declare-fun m!1245809 () Bool)

(assert (=> b!1360533 m!1245809))

(declare-fun m!1245811 () Bool)

(assert (=> b!1360531 m!1245811))

(declare-fun m!1245813 () Bool)

(assert (=> start!114684 m!1245813))

(declare-fun m!1245815 () Bool)

(assert (=> b!1360535 m!1245815))

(push 1)

(assert (not b!1360535))

(assert (not b!1360532))

(assert (not b!1360537))

(assert (not b!1360531))

(assert (not b!1360538))

(assert (not b!1360539))

(assert (not b!1360536))

(assert (not b!1360533))

(assert (not start!114684))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

