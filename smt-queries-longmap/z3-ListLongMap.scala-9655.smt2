; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114292 () Bool)

(assert start!114292)

(declare-fun b!1355485 () Bool)

(declare-fun res!899800 () Bool)

(declare-fun e!770200 () Bool)

(assert (=> b!1355485 (=> (not res!899800) (not e!770200))))

(declare-datatypes ((List!31654 0))(
  ( (Nil!31651) (Cons!31650 (h!32868 (_ BitVec 64)) (t!46304 List!31654)) )
))
(declare-fun acc!759 () List!31654)

(declare-fun contains!9366 (List!31654 (_ BitVec 64)) Bool)

(assert (=> b!1355485 (= res!899800 (not (contains!9366 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355486 () Bool)

(declare-fun res!899801 () Bool)

(declare-fun e!770202 () Bool)

(assert (=> b!1355486 (=> (not res!899801) (not e!770202))))

(declare-fun lt!598634 () List!31654)

(assert (=> b!1355486 (= res!899801 (not (contains!9366 lt!598634 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!899805 () Bool)

(assert (=> start!114292 (=> (not res!899805) (not e!770200))))

(declare-datatypes ((array!92365 0))(
  ( (array!92366 (arr!44626 (Array (_ BitVec 32) (_ BitVec 64))) (size!45177 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92365)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114292 (= res!899805 (and (bvslt (size!45177 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45177 a!3742))))))

(assert (=> start!114292 e!770200))

(assert (=> start!114292 true))

(declare-fun array_inv!33907 (array!92365) Bool)

(assert (=> start!114292 (array_inv!33907 a!3742)))

(declare-fun b!1355487 () Bool)

(declare-fun res!899799 () Bool)

(assert (=> b!1355487 (=> (not res!899799) (not e!770200))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1355487 (= res!899799 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1355488 () Bool)

(declare-fun e!770203 () Bool)

(assert (=> b!1355488 (= e!770203 e!770202)))

(declare-fun res!899804 () Bool)

(assert (=> b!1355488 (=> (not res!899804) (not e!770202))))

(assert (=> b!1355488 (= res!899804 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!757 (List!31654 (_ BitVec 64)) List!31654)

(assert (=> b!1355488 (= lt!598634 ($colon$colon!757 acc!759 (select (arr!44626 a!3742) from!3120)))))

(declare-fun b!1355489 () Bool)

(declare-fun res!899802 () Bool)

(assert (=> b!1355489 (=> (not res!899802) (not e!770200))))

(declare-fun noDuplicate!2197 (List!31654) Bool)

(assert (=> b!1355489 (= res!899802 (noDuplicate!2197 acc!759))))

(declare-fun b!1355490 () Bool)

(declare-fun res!899810 () Bool)

(assert (=> b!1355490 (=> (not res!899810) (not e!770200))))

(assert (=> b!1355490 (= res!899810 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45177 a!3742)))))

(declare-fun b!1355491 () Bool)

(declare-fun res!899809 () Bool)

(assert (=> b!1355491 (=> (not res!899809) (not e!770200))))

(declare-fun arrayNoDuplicates!0 (array!92365 (_ BitVec 32) List!31654) Bool)

(assert (=> b!1355491 (= res!899809 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31651))))

(declare-fun b!1355492 () Bool)

(declare-fun res!899806 () Bool)

(assert (=> b!1355492 (=> (not res!899806) (not e!770200))))

(assert (=> b!1355492 (= res!899806 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1355493 () Bool)

(declare-fun res!899811 () Bool)

(assert (=> b!1355493 (=> (not res!899811) (not e!770200))))

(assert (=> b!1355493 (= res!899811 (not (contains!9366 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355494 () Bool)

(declare-fun res!899808 () Bool)

(assert (=> b!1355494 (=> (not res!899808) (not e!770202))))

(assert (=> b!1355494 (= res!899808 (not (contains!9366 lt!598634 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355495 () Bool)

(declare-datatypes ((Unit!44399 0))(
  ( (Unit!44400) )
))
(declare-fun e!770199 () Unit!44399)

(declare-fun Unit!44401 () Unit!44399)

(assert (=> b!1355495 (= e!770199 Unit!44401)))

(declare-fun b!1355496 () Bool)

(declare-fun lt!598638 () Unit!44399)

(assert (=> b!1355496 (= e!770199 lt!598638)))

(declare-fun lt!598633 () Unit!44399)

(declare-fun lemmaListSubSeqRefl!0 (List!31654) Unit!44399)

(assert (=> b!1355496 (= lt!598633 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!743 (List!31654 List!31654) Bool)

(assert (=> b!1355496 (subseq!743 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92365 List!31654 List!31654 (_ BitVec 32)) Unit!44399)

(assert (=> b!1355496 (= lt!598638 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!757 acc!759 (select (arr!44626 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1355496 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1355497 () Bool)

(declare-fun res!899807 () Bool)

(assert (=> b!1355497 (=> (not res!899807) (not e!770200))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1355497 (= res!899807 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45177 a!3742))))))

(declare-fun b!1355498 () Bool)

(declare-fun res!899803 () Bool)

(assert (=> b!1355498 (=> (not res!899803) (not e!770202))))

(assert (=> b!1355498 (= res!899803 (noDuplicate!2197 lt!598634))))

(declare-fun b!1355499 () Bool)

(assert (=> b!1355499 (= e!770202 false)))

(declare-fun lt!598637 () Bool)

(assert (=> b!1355499 (= lt!598637 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!598634))))

(declare-fun b!1355500 () Bool)

(assert (=> b!1355500 (= e!770200 e!770203)))

(declare-fun res!899798 () Bool)

(assert (=> b!1355500 (=> (not res!899798) (not e!770203))))

(declare-fun lt!598635 () Bool)

(assert (=> b!1355500 (= res!899798 (and (not (= from!3120 i!1404)) lt!598635))))

(declare-fun lt!598636 () Unit!44399)

(assert (=> b!1355500 (= lt!598636 e!770199)))

(declare-fun c!127291 () Bool)

(assert (=> b!1355500 (= c!127291 lt!598635)))

(assert (=> b!1355500 (= lt!598635 (validKeyInArray!0 (select (arr!44626 a!3742) from!3120)))))

(assert (= (and start!114292 res!899805) b!1355489))

(assert (= (and b!1355489 res!899802) b!1355493))

(assert (= (and b!1355493 res!899811) b!1355485))

(assert (= (and b!1355485 res!899800) b!1355491))

(assert (= (and b!1355491 res!899809) b!1355492))

(assert (= (and b!1355492 res!899806) b!1355497))

(assert (= (and b!1355497 res!899807) b!1355487))

(assert (= (and b!1355487 res!899799) b!1355490))

(assert (= (and b!1355490 res!899810) b!1355500))

(assert (= (and b!1355500 c!127291) b!1355496))

(assert (= (and b!1355500 (not c!127291)) b!1355495))

(assert (= (and b!1355500 res!899798) b!1355488))

(assert (= (and b!1355488 res!899804) b!1355498))

(assert (= (and b!1355498 res!899803) b!1355494))

(assert (= (and b!1355494 res!899808) b!1355486))

(assert (= (and b!1355486 res!899801) b!1355499))

(declare-fun m!1242217 () Bool)

(assert (=> b!1355494 m!1242217))

(declare-fun m!1242219 () Bool)

(assert (=> b!1355485 m!1242219))

(declare-fun m!1242221 () Bool)

(assert (=> b!1355491 m!1242221))

(declare-fun m!1242223 () Bool)

(assert (=> b!1355489 m!1242223))

(declare-fun m!1242225 () Bool)

(assert (=> b!1355496 m!1242225))

(declare-fun m!1242227 () Bool)

(assert (=> b!1355496 m!1242227))

(declare-fun m!1242229 () Bool)

(assert (=> b!1355496 m!1242229))

(declare-fun m!1242231 () Bool)

(assert (=> b!1355496 m!1242231))

(declare-fun m!1242233 () Bool)

(assert (=> b!1355496 m!1242233))

(assert (=> b!1355496 m!1242227))

(assert (=> b!1355496 m!1242229))

(declare-fun m!1242235 () Bool)

(assert (=> b!1355496 m!1242235))

(declare-fun m!1242237 () Bool)

(assert (=> b!1355493 m!1242237))

(declare-fun m!1242239 () Bool)

(assert (=> b!1355498 m!1242239))

(assert (=> b!1355500 m!1242227))

(assert (=> b!1355500 m!1242227))

(declare-fun m!1242241 () Bool)

(assert (=> b!1355500 m!1242241))

(assert (=> b!1355488 m!1242227))

(assert (=> b!1355488 m!1242227))

(assert (=> b!1355488 m!1242229))

(declare-fun m!1242243 () Bool)

(assert (=> start!114292 m!1242243))

(declare-fun m!1242245 () Bool)

(assert (=> b!1355486 m!1242245))

(declare-fun m!1242247 () Bool)

(assert (=> b!1355499 m!1242247))

(declare-fun m!1242249 () Bool)

(assert (=> b!1355487 m!1242249))

(declare-fun m!1242251 () Bool)

(assert (=> b!1355492 m!1242251))

(check-sat (not b!1355492) (not b!1355494) (not b!1355499) (not b!1355500) (not b!1355488) (not b!1355493) (not start!114292) (not b!1355491) (not b!1355498) (not b!1355487) (not b!1355486) (not b!1355485) (not b!1355496) (not b!1355489))
(check-sat)
