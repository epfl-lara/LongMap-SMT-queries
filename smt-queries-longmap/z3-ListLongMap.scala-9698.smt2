; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114802 () Bool)

(assert start!114802)

(declare-fun b!1360828 () Bool)

(declare-fun res!904508 () Bool)

(declare-fun e!772277 () Bool)

(assert (=> b!1360828 (=> (not res!904508) (not e!772277))))

(declare-datatypes ((List!31783 0))(
  ( (Nil!31780) (Cons!31779 (h!32997 (_ BitVec 64)) (t!46448 List!31783)) )
))
(declare-fun acc!759 () List!31783)

(declare-fun contains!9495 (List!31783 (_ BitVec 64)) Bool)

(assert (=> b!1360828 (= res!904508 (not (contains!9495 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1360829 () Bool)

(declare-fun res!904515 () Bool)

(assert (=> b!1360829 (=> (not res!904515) (not e!772277))))

(declare-fun noDuplicate!2326 (List!31783) Bool)

(assert (=> b!1360829 (= res!904515 (noDuplicate!2326 acc!759))))

(declare-fun res!904514 () Bool)

(assert (=> start!114802 (=> (not res!904514) (not e!772277))))

(declare-datatypes ((array!92638 0))(
  ( (array!92639 (arr!44755 (Array (_ BitVec 32) (_ BitVec 64))) (size!45306 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92638)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114802 (= res!904514 (and (bvslt (size!45306 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45306 a!3742))))))

(assert (=> start!114802 e!772277))

(assert (=> start!114802 true))

(declare-fun array_inv!34036 (array!92638) Bool)

(assert (=> start!114802 (array_inv!34036 a!3742)))

(declare-fun b!1360830 () Bool)

(declare-fun res!904510 () Bool)

(assert (=> b!1360830 (=> (not res!904510) (not e!772277))))

(declare-fun arrayNoDuplicates!0 (array!92638 (_ BitVec 32) List!31783) Bool)

(assert (=> b!1360830 (= res!904510 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31780))))

(declare-fun b!1360831 () Bool)

(declare-fun e!772276 () Bool)

(assert (=> b!1360831 (= e!772277 e!772276)))

(declare-fun res!904505 () Bool)

(assert (=> b!1360831 (=> (not res!904505) (not e!772276))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1360831 (= res!904505 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!44705 0))(
  ( (Unit!44706) )
))
(declare-fun lt!600109 () Unit!44705)

(declare-fun e!772278 () Unit!44705)

(assert (=> b!1360831 (= lt!600109 e!772278)))

(declare-fun c!127609 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1360831 (= c!127609 (validKeyInArray!0 (select (arr!44755 a!3742) from!3120)))))

(declare-fun b!1360832 () Bool)

(declare-fun res!904509 () Bool)

(assert (=> b!1360832 (=> (not res!904509) (not e!772277))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1360832 (= res!904509 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1360833 () Bool)

(declare-fun res!904511 () Bool)

(assert (=> b!1360833 (=> (not res!904511) (not e!772277))))

(assert (=> b!1360833 (= res!904511 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1360834 () Bool)

(declare-fun Unit!44707 () Unit!44705)

(assert (=> b!1360834 (= e!772278 Unit!44707)))

(declare-fun b!1360835 () Bool)

(declare-fun res!904507 () Bool)

(assert (=> b!1360835 (=> (not res!904507) (not e!772277))))

(assert (=> b!1360835 (= res!904507 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45306 a!3742)))))

(declare-fun b!1360836 () Bool)

(assert (=> b!1360836 (= e!772276 (bvsge (bvsub (size!45306 a!3742) (bvadd #b00000000000000000000000000000001 from!3120)) (bvsub (size!45306 a!3742) from!3120)))))

(declare-fun b!1360837 () Bool)

(declare-fun lt!600110 () Unit!44705)

(assert (=> b!1360837 (= e!772278 lt!600110)))

(declare-fun lt!600111 () Unit!44705)

(declare-fun lemmaListSubSeqRefl!0 (List!31783) Unit!44705)

(assert (=> b!1360837 (= lt!600111 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!854 (List!31783 List!31783) Bool)

(assert (=> b!1360837 (subseq!854 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92638 List!31783 List!31783 (_ BitVec 32)) Unit!44705)

(declare-fun $colon$colon!856 (List!31783 (_ BitVec 64)) List!31783)

(assert (=> b!1360837 (= lt!600110 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!856 acc!759 (select (arr!44755 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1360837 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1360838 () Bool)

(declare-fun res!904506 () Bool)

(assert (=> b!1360838 (=> (not res!904506) (not e!772277))))

(assert (=> b!1360838 (= res!904506 (not (contains!9495 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1360839 () Bool)

(declare-fun res!904512 () Bool)

(assert (=> b!1360839 (=> (not res!904512) (not e!772276))))

(assert (=> b!1360839 (= res!904512 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1360840 () Bool)

(declare-fun res!904513 () Bool)

(assert (=> b!1360840 (=> (not res!904513) (not e!772277))))

(assert (=> b!1360840 (= res!904513 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45306 a!3742))))))

(assert (= (and start!114802 res!904514) b!1360829))

(assert (= (and b!1360829 res!904515) b!1360838))

(assert (= (and b!1360838 res!904506) b!1360828))

(assert (= (and b!1360828 res!904508) b!1360830))

(assert (= (and b!1360830 res!904510) b!1360833))

(assert (= (and b!1360833 res!904511) b!1360840))

(assert (= (and b!1360840 res!904513) b!1360832))

(assert (= (and b!1360832 res!904509) b!1360835))

(assert (= (and b!1360835 res!904507) b!1360831))

(assert (= (and b!1360831 c!127609) b!1360837))

(assert (= (and b!1360831 (not c!127609)) b!1360834))

(assert (= (and b!1360831 res!904505) b!1360839))

(assert (= (and b!1360839 res!904512) b!1360836))

(declare-fun m!1246513 () Bool)

(assert (=> b!1360838 m!1246513))

(declare-fun m!1246515 () Bool)

(assert (=> b!1360830 m!1246515))

(declare-fun m!1246517 () Bool)

(assert (=> b!1360831 m!1246517))

(assert (=> b!1360831 m!1246517))

(declare-fun m!1246519 () Bool)

(assert (=> b!1360831 m!1246519))

(declare-fun m!1246521 () Bool)

(assert (=> start!114802 m!1246521))

(declare-fun m!1246523 () Bool)

(assert (=> b!1360837 m!1246523))

(assert (=> b!1360837 m!1246517))

(declare-fun m!1246525 () Bool)

(assert (=> b!1360837 m!1246525))

(declare-fun m!1246527 () Bool)

(assert (=> b!1360837 m!1246527))

(declare-fun m!1246529 () Bool)

(assert (=> b!1360837 m!1246529))

(assert (=> b!1360837 m!1246517))

(assert (=> b!1360837 m!1246525))

(declare-fun m!1246531 () Bool)

(assert (=> b!1360837 m!1246531))

(declare-fun m!1246533 () Bool)

(assert (=> b!1360828 m!1246533))

(declare-fun m!1246535 () Bool)

(assert (=> b!1360833 m!1246535))

(declare-fun m!1246537 () Bool)

(assert (=> b!1360829 m!1246537))

(assert (=> b!1360839 m!1246529))

(declare-fun m!1246539 () Bool)

(assert (=> b!1360832 m!1246539))

(check-sat (not b!1360829) (not start!114802) (not b!1360831) (not b!1360830) (not b!1360837) (not b!1360828) (not b!1360839) (not b!1360838) (not b!1360833) (not b!1360832))
(check-sat)
