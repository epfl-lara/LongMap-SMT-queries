; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114968 () Bool)

(assert start!114968)

(declare-fun b!1362602 () Bool)

(declare-fun res!906599 () Bool)

(declare-fun e!772915 () Bool)

(assert (=> b!1362602 (=> (not res!906599) (not e!772915))))

(declare-datatypes ((List!31850 0))(
  ( (Nil!31847) (Cons!31846 (h!33055 (_ BitVec 64)) (t!46530 List!31850)) )
))
(declare-fun acc!759 () List!31850)

(declare-datatypes ((array!92595 0))(
  ( (array!92596 (arr!44731 (Array (_ BitVec 32) (_ BitVec 64))) (size!45283 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92595)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92595 (_ BitVec 32) List!31850) Bool)

(assert (=> b!1362602 (= res!906599 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun res!906596 () Bool)

(assert (=> start!114968 (=> (not res!906596) (not e!772915))))

(assert (=> start!114968 (= res!906596 (and (bvslt (size!45283 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45283 a!3742))))))

(assert (=> start!114968 e!772915))

(assert (=> start!114968 true))

(declare-fun array_inv!33964 (array!92595) Bool)

(assert (=> start!114968 (array_inv!33964 a!3742)))

(declare-fun b!1362603 () Bool)

(declare-datatypes ((Unit!44769 0))(
  ( (Unit!44770) )
))
(declare-fun e!772914 () Unit!44769)

(declare-fun lt!600366 () Unit!44769)

(assert (=> b!1362603 (= e!772914 lt!600366)))

(declare-fun lt!600365 () Unit!44769)

(declare-fun lemmaListSubSeqRefl!0 (List!31850) Unit!44769)

(assert (=> b!1362603 (= lt!600365 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!908 (List!31850 List!31850) Bool)

(assert (=> b!1362603 (subseq!908 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92595 List!31850 List!31850 (_ BitVec 32)) Unit!44769)

(declare-fun $colon$colon!913 (List!31850 (_ BitVec 64)) List!31850)

(assert (=> b!1362603 (= lt!600366 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!913 acc!759 (select (arr!44731 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1362603 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun lt!600364 () Bool)

(declare-fun i!1404 () (_ BitVec 32))

(declare-fun b!1362604 () Bool)

(assert (=> b!1362604 (= e!772915 (and (not (= from!3120 i!1404)) (not lt!600364) (bvslt (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!600367 () Unit!44769)

(assert (=> b!1362604 (= lt!600367 e!772914)))

(declare-fun c!127448 () Bool)

(assert (=> b!1362604 (= c!127448 lt!600364)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1362604 (= lt!600364 (validKeyInArray!0 (select (arr!44731 a!3742) from!3120)))))

(declare-fun b!1362605 () Bool)

(declare-fun res!906593 () Bool)

(assert (=> b!1362605 (=> (not res!906593) (not e!772915))))

(assert (=> b!1362605 (= res!906593 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45283 a!3742)))))

(declare-fun b!1362606 () Bool)

(declare-fun Unit!44771 () Unit!44769)

(assert (=> b!1362606 (= e!772914 Unit!44771)))

(declare-fun b!1362607 () Bool)

(declare-fun res!906595 () Bool)

(assert (=> b!1362607 (=> (not res!906595) (not e!772915))))

(declare-fun contains!9470 (List!31850 (_ BitVec 64)) Bool)

(assert (=> b!1362607 (= res!906595 (not (contains!9470 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1362608 () Bool)

(declare-fun res!906591 () Bool)

(assert (=> b!1362608 (=> (not res!906591) (not e!772915))))

(assert (=> b!1362608 (= res!906591 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31847))))

(declare-fun b!1362609 () Bool)

(declare-fun res!906594 () Bool)

(assert (=> b!1362609 (=> (not res!906594) (not e!772915))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1362609 (= res!906594 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1362610 () Bool)

(declare-fun res!906597 () Bool)

(assert (=> b!1362610 (=> (not res!906597) (not e!772915))))

(declare-fun noDuplicate!2385 (List!31850) Bool)

(assert (=> b!1362610 (= res!906597 (noDuplicate!2385 acc!759))))

(declare-fun b!1362611 () Bool)

(declare-fun res!906592 () Bool)

(assert (=> b!1362611 (=> (not res!906592) (not e!772915))))

(assert (=> b!1362611 (= res!906592 (not (contains!9470 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1362612 () Bool)

(declare-fun res!906598 () Bool)

(assert (=> b!1362612 (=> (not res!906598) (not e!772915))))

(assert (=> b!1362612 (= res!906598 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45283 a!3742))))))

(assert (= (and start!114968 res!906596) b!1362610))

(assert (= (and b!1362610 res!906597) b!1362611))

(assert (= (and b!1362611 res!906592) b!1362607))

(assert (= (and b!1362607 res!906595) b!1362608))

(assert (= (and b!1362608 res!906591) b!1362602))

(assert (= (and b!1362602 res!906599) b!1362612))

(assert (= (and b!1362612 res!906598) b!1362609))

(assert (= (and b!1362609 res!906594) b!1362605))

(assert (= (and b!1362605 res!906593) b!1362604))

(assert (= (and b!1362604 c!127448) b!1362603))

(assert (= (and b!1362604 (not c!127448)) b!1362606))

(declare-fun m!1247095 () Bool)

(assert (=> b!1362609 m!1247095))

(declare-fun m!1247097 () Bool)

(assert (=> b!1362608 m!1247097))

(declare-fun m!1247099 () Bool)

(assert (=> b!1362607 m!1247099))

(declare-fun m!1247101 () Bool)

(assert (=> start!114968 m!1247101))

(declare-fun m!1247103 () Bool)

(assert (=> b!1362603 m!1247103))

(declare-fun m!1247105 () Bool)

(assert (=> b!1362603 m!1247105))

(declare-fun m!1247107 () Bool)

(assert (=> b!1362603 m!1247107))

(declare-fun m!1247109 () Bool)

(assert (=> b!1362603 m!1247109))

(declare-fun m!1247111 () Bool)

(assert (=> b!1362603 m!1247111))

(assert (=> b!1362603 m!1247105))

(assert (=> b!1362603 m!1247107))

(declare-fun m!1247113 () Bool)

(assert (=> b!1362603 m!1247113))

(declare-fun m!1247115 () Bool)

(assert (=> b!1362610 m!1247115))

(declare-fun m!1247117 () Bool)

(assert (=> b!1362611 m!1247117))

(declare-fun m!1247119 () Bool)

(assert (=> b!1362602 m!1247119))

(assert (=> b!1362604 m!1247105))

(assert (=> b!1362604 m!1247105))

(declare-fun m!1247121 () Bool)

(assert (=> b!1362604 m!1247121))

(check-sat (not b!1362603) (not b!1362611) (not b!1362604) (not b!1362608) (not b!1362609) (not start!114968) (not b!1362610) (not b!1362602) (not b!1362607))
(check-sat)
