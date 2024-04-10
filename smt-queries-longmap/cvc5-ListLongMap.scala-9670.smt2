; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114158 () Bool)

(assert start!114158)

(declare-fun b!1356052 () Bool)

(declare-datatypes ((Unit!44595 0))(
  ( (Unit!44596) )
))
(declare-fun e!769951 () Unit!44595)

(declare-fun lt!598884 () Unit!44595)

(assert (=> b!1356052 (= e!769951 lt!598884)))

(declare-fun lt!598887 () Unit!44595)

(declare-datatypes ((List!31659 0))(
  ( (Nil!31656) (Cons!31655 (h!32864 (_ BitVec 64)) (t!46317 List!31659)) )
))
(declare-fun acc!759 () List!31659)

(declare-fun lemmaListSubSeqRefl!0 (List!31659) Unit!44595)

(assert (=> b!1356052 (= lt!598887 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!788 (List!31659 List!31659) Bool)

(assert (=> b!1356052 (subseq!788 acc!759 acc!759)))

(declare-datatypes ((array!92340 0))(
  ( (array!92341 (arr!44618 (Array (_ BitVec 32) (_ BitVec 64))) (size!45168 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92340)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92340 List!31659 List!31659 (_ BitVec 32)) Unit!44595)

(declare-fun $colon$colon!803 (List!31659 (_ BitVec 64)) List!31659)

(assert (=> b!1356052 (= lt!598884 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!803 acc!759 (select (arr!44618 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92340 (_ BitVec 32) List!31659) Bool)

(assert (=> b!1356052 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1356053 () Bool)

(declare-fun res!900884 () Bool)

(declare-fun e!769948 () Bool)

(assert (=> b!1356053 (=> (not res!900884) (not e!769948))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1356053 (= res!900884 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45168 a!3742))))))

(declare-fun b!1356054 () Bool)

(declare-fun Unit!44597 () Unit!44595)

(assert (=> b!1356054 (= e!769951 Unit!44597)))

(declare-fun b!1356055 () Bool)

(declare-fun res!900876 () Bool)

(assert (=> b!1356055 (=> (not res!900876) (not e!769948))))

(assert (=> b!1356055 (= res!900876 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31656))))

(declare-fun b!1356056 () Bool)

(declare-fun res!900878 () Bool)

(assert (=> b!1356056 (=> (not res!900878) (not e!769948))))

(assert (=> b!1356056 (= res!900878 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1356057 () Bool)

(declare-fun e!769949 () Bool)

(assert (=> b!1356057 (= e!769949 (not (bvsle from!3120 (size!45168 a!3742))))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1356057 (arrayNoDuplicates!0 (array!92341 (store (arr!44618 a!3742) i!1404 l!3587) (size!45168 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun lt!598886 () Unit!44595)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92340 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31659) Unit!44595)

(assert (=> b!1356057 (= lt!598886 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1356058 () Bool)

(declare-fun res!900886 () Bool)

(assert (=> b!1356058 (=> (not res!900886) (not e!769948))))

(declare-fun contains!9368 (List!31659 (_ BitVec 64)) Bool)

(assert (=> b!1356058 (= res!900886 (not (contains!9368 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356059 () Bool)

(declare-fun res!900882 () Bool)

(assert (=> b!1356059 (=> (not res!900882) (not e!769948))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1356059 (= res!900882 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1356060 () Bool)

(assert (=> b!1356060 (= e!769948 e!769949)))

(declare-fun res!900879 () Bool)

(assert (=> b!1356060 (=> (not res!900879) (not e!769949))))

(declare-fun lt!598888 () Bool)

(assert (=> b!1356060 (= res!900879 (and (not (= from!3120 i!1404)) (not lt!598888) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!598885 () Unit!44595)

(assert (=> b!1356060 (= lt!598885 e!769951)))

(declare-fun c!127028 () Bool)

(assert (=> b!1356060 (= c!127028 lt!598888)))

(assert (=> b!1356060 (= lt!598888 (validKeyInArray!0 (select (arr!44618 a!3742) from!3120)))))

(declare-fun b!1356062 () Bool)

(declare-fun res!900877 () Bool)

(assert (=> b!1356062 (=> (not res!900877) (not e!769948))))

(assert (=> b!1356062 (= res!900877 (not (contains!9368 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356063 () Bool)

(declare-fun res!900881 () Bool)

(assert (=> b!1356063 (=> (not res!900881) (not e!769949))))

(assert (=> b!1356063 (= res!900881 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1356064 () Bool)

(declare-fun res!900883 () Bool)

(assert (=> b!1356064 (=> (not res!900883) (not e!769948))))

(declare-fun noDuplicate!2225 (List!31659) Bool)

(assert (=> b!1356064 (= res!900883 (noDuplicate!2225 acc!759))))

(declare-fun b!1356061 () Bool)

(declare-fun res!900880 () Bool)

(assert (=> b!1356061 (=> (not res!900880) (not e!769948))))

(assert (=> b!1356061 (= res!900880 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45168 a!3742)))))

(declare-fun res!900885 () Bool)

(assert (=> start!114158 (=> (not res!900885) (not e!769948))))

(assert (=> start!114158 (= res!900885 (and (bvslt (size!45168 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45168 a!3742))))))

(assert (=> start!114158 e!769948))

(assert (=> start!114158 true))

(declare-fun array_inv!33646 (array!92340) Bool)

(assert (=> start!114158 (array_inv!33646 a!3742)))

(assert (= (and start!114158 res!900885) b!1356064))

(assert (= (and b!1356064 res!900883) b!1356058))

(assert (= (and b!1356058 res!900886) b!1356062))

(assert (= (and b!1356062 res!900877) b!1356055))

(assert (= (and b!1356055 res!900876) b!1356056))

(assert (= (and b!1356056 res!900878) b!1356053))

(assert (= (and b!1356053 res!900884) b!1356059))

(assert (= (and b!1356059 res!900882) b!1356061))

(assert (= (and b!1356061 res!900880) b!1356060))

(assert (= (and b!1356060 c!127028) b!1356052))

(assert (= (and b!1356060 (not c!127028)) b!1356054))

(assert (= (and b!1356060 res!900879) b!1356063))

(assert (= (and b!1356063 res!900881) b!1356057))

(declare-fun m!1242097 () Bool)

(assert (=> b!1356063 m!1242097))

(declare-fun m!1242099 () Bool)

(assert (=> b!1356056 m!1242099))

(declare-fun m!1242101 () Bool)

(assert (=> b!1356062 m!1242101))

(declare-fun m!1242103 () Bool)

(assert (=> b!1356060 m!1242103))

(assert (=> b!1356060 m!1242103))

(declare-fun m!1242105 () Bool)

(assert (=> b!1356060 m!1242105))

(declare-fun m!1242107 () Bool)

(assert (=> b!1356059 m!1242107))

(declare-fun m!1242109 () Bool)

(assert (=> b!1356064 m!1242109))

(declare-fun m!1242111 () Bool)

(assert (=> start!114158 m!1242111))

(declare-fun m!1242113 () Bool)

(assert (=> b!1356052 m!1242113))

(assert (=> b!1356052 m!1242103))

(declare-fun m!1242115 () Bool)

(assert (=> b!1356052 m!1242115))

(declare-fun m!1242117 () Bool)

(assert (=> b!1356052 m!1242117))

(assert (=> b!1356052 m!1242097))

(assert (=> b!1356052 m!1242103))

(assert (=> b!1356052 m!1242115))

(declare-fun m!1242119 () Bool)

(assert (=> b!1356052 m!1242119))

(declare-fun m!1242121 () Bool)

(assert (=> b!1356057 m!1242121))

(declare-fun m!1242123 () Bool)

(assert (=> b!1356057 m!1242123))

(declare-fun m!1242125 () Bool)

(assert (=> b!1356057 m!1242125))

(declare-fun m!1242127 () Bool)

(assert (=> b!1356055 m!1242127))

(declare-fun m!1242129 () Bool)

(assert (=> b!1356058 m!1242129))

(push 1)

(assert (not b!1356056))

(assert (not start!114158))

(assert (not b!1356064))

(assert (not b!1356058))

(assert (not b!1356060))

(assert (not b!1356062))

(assert (not b!1356057))

(assert (not b!1356059))

(assert (not b!1356055))

(assert (not b!1356052))

(assert (not b!1356063))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

