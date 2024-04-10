; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114156 () Bool)

(assert start!114156)

(declare-fun b!1356014 () Bool)

(declare-fun res!900848 () Bool)

(declare-fun e!769937 () Bool)

(assert (=> b!1356014 (=> (not res!900848) (not e!769937))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1356014 (= res!900848 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1356015 () Bool)

(declare-fun res!900849 () Bool)

(assert (=> b!1356015 (=> (not res!900849) (not e!769937))))

(declare-datatypes ((List!31658 0))(
  ( (Nil!31655) (Cons!31654 (h!32863 (_ BitVec 64)) (t!46316 List!31658)) )
))
(declare-fun acc!759 () List!31658)

(declare-fun contains!9367 (List!31658 (_ BitVec 64)) Bool)

(assert (=> b!1356015 (= res!900849 (not (contains!9367 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!900847 () Bool)

(assert (=> start!114156 (=> (not res!900847) (not e!769937))))

(declare-datatypes ((array!92338 0))(
  ( (array!92339 (arr!44617 (Array (_ BitVec 32) (_ BitVec 64))) (size!45167 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92338)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114156 (= res!900847 (and (bvslt (size!45167 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45167 a!3742))))))

(assert (=> start!114156 e!769937))

(assert (=> start!114156 true))

(declare-fun array_inv!33645 (array!92338) Bool)

(assert (=> start!114156 (array_inv!33645 a!3742)))

(declare-fun b!1356016 () Bool)

(declare-fun res!900844 () Bool)

(assert (=> b!1356016 (=> (not res!900844) (not e!769937))))

(declare-fun arrayNoDuplicates!0 (array!92338 (_ BitVec 32) List!31658) Bool)

(assert (=> b!1356016 (= res!900844 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1356017 () Bool)

(declare-fun e!769938 () Bool)

(assert (=> b!1356017 (= e!769938 false)))

(declare-fun lt!598873 () Bool)

(assert (=> b!1356017 (= lt!598873 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1356018 () Bool)

(declare-datatypes ((Unit!44592 0))(
  ( (Unit!44593) )
))
(declare-fun e!769939 () Unit!44592)

(declare-fun lt!598870 () Unit!44592)

(assert (=> b!1356018 (= e!769939 lt!598870)))

(declare-fun lt!598871 () Unit!44592)

(declare-fun lemmaListSubSeqRefl!0 (List!31658) Unit!44592)

(assert (=> b!1356018 (= lt!598871 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!787 (List!31658 List!31658) Bool)

(assert (=> b!1356018 (subseq!787 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92338 List!31658 List!31658 (_ BitVec 32)) Unit!44592)

(declare-fun $colon$colon!802 (List!31658 (_ BitVec 64)) List!31658)

(assert (=> b!1356018 (= lt!598870 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!802 acc!759 (select (arr!44617 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1356018 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1356019 () Bool)

(declare-fun Unit!44594 () Unit!44592)

(assert (=> b!1356019 (= e!769939 Unit!44594)))

(declare-fun b!1356020 () Bool)

(declare-fun res!900853 () Bool)

(assert (=> b!1356020 (=> (not res!900853) (not e!769937))))

(assert (=> b!1356020 (= res!900853 (not (contains!9367 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356021 () Bool)

(assert (=> b!1356021 (= e!769937 e!769938)))

(declare-fun res!900851 () Bool)

(assert (=> b!1356021 (=> (not res!900851) (not e!769938))))

(declare-fun lt!598872 () Bool)

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1356021 (= res!900851 (and (not (= from!3120 i!1404)) (not lt!598872) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!598869 () Unit!44592)

(assert (=> b!1356021 (= lt!598869 e!769939)))

(declare-fun c!127025 () Bool)

(assert (=> b!1356021 (= c!127025 lt!598872)))

(assert (=> b!1356021 (= lt!598872 (validKeyInArray!0 (select (arr!44617 a!3742) from!3120)))))

(declare-fun b!1356022 () Bool)

(declare-fun res!900846 () Bool)

(assert (=> b!1356022 (=> (not res!900846) (not e!769937))))

(assert (=> b!1356022 (= res!900846 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31655))))

(declare-fun b!1356023 () Bool)

(declare-fun res!900845 () Bool)

(assert (=> b!1356023 (=> (not res!900845) (not e!769937))))

(declare-fun noDuplicate!2224 (List!31658) Bool)

(assert (=> b!1356023 (= res!900845 (noDuplicate!2224 acc!759))))

(declare-fun b!1356024 () Bool)

(declare-fun res!900850 () Bool)

(assert (=> b!1356024 (=> (not res!900850) (not e!769937))))

(assert (=> b!1356024 (= res!900850 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45167 a!3742)))))

(declare-fun b!1356025 () Bool)

(declare-fun res!900852 () Bool)

(assert (=> b!1356025 (=> (not res!900852) (not e!769937))))

(assert (=> b!1356025 (= res!900852 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45167 a!3742))))))

(assert (= (and start!114156 res!900847) b!1356023))

(assert (= (and b!1356023 res!900845) b!1356015))

(assert (= (and b!1356015 res!900849) b!1356020))

(assert (= (and b!1356020 res!900853) b!1356022))

(assert (= (and b!1356022 res!900846) b!1356016))

(assert (= (and b!1356016 res!900844) b!1356025))

(assert (= (and b!1356025 res!900852) b!1356014))

(assert (= (and b!1356014 res!900848) b!1356024))

(assert (= (and b!1356024 res!900850) b!1356021))

(assert (= (and b!1356021 c!127025) b!1356018))

(assert (= (and b!1356021 (not c!127025)) b!1356019))

(assert (= (and b!1356021 res!900851) b!1356017))

(declare-fun m!1242069 () Bool)

(assert (=> b!1356022 m!1242069))

(declare-fun m!1242071 () Bool)

(assert (=> b!1356017 m!1242071))

(declare-fun m!1242073 () Bool)

(assert (=> b!1356015 m!1242073))

(declare-fun m!1242075 () Bool)

(assert (=> b!1356021 m!1242075))

(assert (=> b!1356021 m!1242075))

(declare-fun m!1242077 () Bool)

(assert (=> b!1356021 m!1242077))

(declare-fun m!1242079 () Bool)

(assert (=> b!1356018 m!1242079))

(assert (=> b!1356018 m!1242075))

(declare-fun m!1242081 () Bool)

(assert (=> b!1356018 m!1242081))

(declare-fun m!1242083 () Bool)

(assert (=> b!1356018 m!1242083))

(assert (=> b!1356018 m!1242071))

(assert (=> b!1356018 m!1242075))

(assert (=> b!1356018 m!1242081))

(declare-fun m!1242085 () Bool)

(assert (=> b!1356018 m!1242085))

(declare-fun m!1242087 () Bool)

(assert (=> b!1356023 m!1242087))

(declare-fun m!1242089 () Bool)

(assert (=> b!1356020 m!1242089))

(declare-fun m!1242091 () Bool)

(assert (=> b!1356016 m!1242091))

(declare-fun m!1242093 () Bool)

(assert (=> b!1356014 m!1242093))

(declare-fun m!1242095 () Bool)

(assert (=> start!114156 m!1242095))

(push 1)

(assert (not b!1356020))

