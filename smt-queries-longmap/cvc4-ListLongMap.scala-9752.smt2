; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115548 () Bool)

(assert start!115548)

(declare-fun b!1366746 () Bool)

(declare-fun e!774649 () Bool)

(assert (=> b!1366746 (= e!774649 (not true))))

(declare-datatypes ((Unit!45115 0))(
  ( (Unit!45116) )
))
(declare-fun lt!601660 () Unit!45115)

(declare-datatypes ((List!31907 0))(
  ( (Nil!31904) (Cons!31903 (h!33112 (_ BitVec 64)) (t!46601 List!31907)) )
))
(declare-fun lt!601662 () List!31907)

(declare-fun lt!601659 () List!31907)

(declare-fun noDuplicateSubseq!178 (List!31907 List!31907) Unit!45115)

(assert (=> b!1366746 (= lt!601660 (noDuplicateSubseq!178 lt!601662 lt!601659))))

(declare-datatypes ((array!92824 0))(
  ( (array!92825 (arr!44839 (Array (_ BitVec 32) (_ BitVec 64))) (size!45389 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92824)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92824 (_ BitVec 32) List!31907) Bool)

(assert (=> b!1366746 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!601662)))

(declare-fun lt!601663 () Unit!45115)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92824 List!31907 List!31907 (_ BitVec 32)) Unit!45115)

(assert (=> b!1366746 (= lt!601663 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3861 lt!601659 lt!601662 (bvadd #b00000000000000000000000000000001 from!3239)))))

(declare-fun newAcc!98 () List!31907)

(assert (=> b!1366746 (= lt!601662 (Cons!31903 (select (arr!44839 a!3861) from!3239) newAcc!98))))

(declare-fun acc!866 () List!31907)

(assert (=> b!1366746 (= lt!601659 (Cons!31903 (select (arr!44839 a!3861) from!3239) acc!866))))

(declare-fun res!910299 () Bool)

(declare-fun e!774647 () Bool)

(assert (=> start!115548 (=> (not res!910299) (not e!774647))))

(assert (=> start!115548 (= res!910299 (and (bvslt (size!45389 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45389 a!3861))))))

(assert (=> start!115548 e!774647))

(declare-fun array_inv!33867 (array!92824) Bool)

(assert (=> start!115548 (array_inv!33867 a!3861)))

(assert (=> start!115548 true))

(declare-fun b!1366747 () Bool)

(declare-fun res!910306 () Bool)

(assert (=> b!1366747 (=> (not res!910306) (not e!774647))))

(declare-fun subseq!991 (List!31907 List!31907) Bool)

(assert (=> b!1366747 (= res!910306 (subseq!991 newAcc!98 acc!866))))

(declare-fun b!1366748 () Bool)

(assert (=> b!1366748 (= e!774647 e!774649)))

(declare-fun res!910298 () Bool)

(assert (=> b!1366748 (=> (not res!910298) (not e!774649))))

(assert (=> b!1366748 (= res!910298 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-fun lt!601661 () Unit!45115)

(assert (=> b!1366748 (= lt!601661 (noDuplicateSubseq!178 newAcc!98 acc!866))))

(declare-fun b!1366749 () Bool)

(declare-fun res!910302 () Bool)

(assert (=> b!1366749 (=> (not res!910302) (not e!774649))))

(declare-fun contains!9589 (List!31907 (_ BitVec 64)) Bool)

(assert (=> b!1366749 (= res!910302 (not (contains!9589 acc!866 (select (arr!44839 a!3861) from!3239))))))

(declare-fun b!1366750 () Bool)

(declare-fun res!910301 () Bool)

(assert (=> b!1366750 (=> (not res!910301) (not e!774647))))

(declare-fun noDuplicate!2446 (List!31907) Bool)

(assert (=> b!1366750 (= res!910301 (noDuplicate!2446 acc!866))))

(declare-fun b!1366751 () Bool)

(declare-fun res!910297 () Bool)

(assert (=> b!1366751 (=> (not res!910297) (not e!774647))))

(assert (=> b!1366751 (= res!910297 (not (contains!9589 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366752 () Bool)

(declare-fun res!910303 () Bool)

(assert (=> b!1366752 (=> (not res!910303) (not e!774649))))

(assert (=> b!1366752 (= res!910303 (bvslt from!3239 (size!45389 a!3861)))))

(declare-fun b!1366753 () Bool)

(declare-fun res!910305 () Bool)

(assert (=> b!1366753 (=> (not res!910305) (not e!774647))))

(assert (=> b!1366753 (= res!910305 (not (contains!9589 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366754 () Bool)

(declare-fun res!910304 () Bool)

(assert (=> b!1366754 (=> (not res!910304) (not e!774647))))

(assert (=> b!1366754 (= res!910304 (not (contains!9589 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366755 () Bool)

(declare-fun res!910300 () Bool)

(assert (=> b!1366755 (=> (not res!910300) (not e!774649))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1366755 (= res!910300 (validKeyInArray!0 (select (arr!44839 a!3861) from!3239)))))

(declare-fun b!1366756 () Bool)

(declare-fun res!910296 () Bool)

(assert (=> b!1366756 (=> (not res!910296) (not e!774647))))

(assert (=> b!1366756 (= res!910296 (not (contains!9589 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115548 res!910299) b!1366750))

(assert (= (and b!1366750 res!910301) b!1366756))

(assert (= (and b!1366756 res!910296) b!1366754))

(assert (= (and b!1366754 res!910304) b!1366751))

(assert (= (and b!1366751 res!910297) b!1366753))

(assert (= (and b!1366753 res!910305) b!1366747))

(assert (= (and b!1366747 res!910306) b!1366748))

(assert (= (and b!1366748 res!910298) b!1366752))

(assert (= (and b!1366752 res!910303) b!1366755))

(assert (= (and b!1366755 res!910300) b!1366749))

(assert (= (and b!1366749 res!910302) b!1366746))

(declare-fun m!1251025 () Bool)

(assert (=> b!1366755 m!1251025))

(assert (=> b!1366755 m!1251025))

(declare-fun m!1251027 () Bool)

(assert (=> b!1366755 m!1251027))

(declare-fun m!1251029 () Bool)

(assert (=> b!1366748 m!1251029))

(declare-fun m!1251031 () Bool)

(assert (=> b!1366748 m!1251031))

(declare-fun m!1251033 () Bool)

(assert (=> b!1366746 m!1251033))

(declare-fun m!1251035 () Bool)

(assert (=> b!1366746 m!1251035))

(declare-fun m!1251037 () Bool)

(assert (=> b!1366746 m!1251037))

(assert (=> b!1366746 m!1251025))

(declare-fun m!1251039 () Bool)

(assert (=> b!1366751 m!1251039))

(declare-fun m!1251041 () Bool)

(assert (=> b!1366753 m!1251041))

(declare-fun m!1251043 () Bool)

(assert (=> start!115548 m!1251043))

(declare-fun m!1251045 () Bool)

(assert (=> b!1366747 m!1251045))

(declare-fun m!1251047 () Bool)

(assert (=> b!1366750 m!1251047))

(declare-fun m!1251049 () Bool)

(assert (=> b!1366756 m!1251049))

(declare-fun m!1251051 () Bool)

(assert (=> b!1366754 m!1251051))

(assert (=> b!1366749 m!1251025))

(assert (=> b!1366749 m!1251025))

(declare-fun m!1251053 () Bool)

(assert (=> b!1366749 m!1251053))

(push 1)

(assert (not b!1366750))

