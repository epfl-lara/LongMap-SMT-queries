; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114164 () Bool)

(assert start!114164)

(declare-fun b!1356169 () Bool)

(declare-fun e!769985 () Bool)

(declare-fun e!769986 () Bool)

(assert (=> b!1356169 (= e!769985 e!769986)))

(declare-fun res!900984 () Bool)

(assert (=> b!1356169 (=> (not res!900984) (not e!769986))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun i!1404 () (_ BitVec 32))

(declare-fun lt!598930 () Bool)

(assert (=> b!1356169 (= res!900984 (and (not (= from!3120 i!1404)) (not lt!598930) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!44604 0))(
  ( (Unit!44605) )
))
(declare-fun lt!598932 () Unit!44604)

(declare-fun e!769987 () Unit!44604)

(assert (=> b!1356169 (= lt!598932 e!769987)))

(declare-fun c!127037 () Bool)

(assert (=> b!1356169 (= c!127037 lt!598930)))

(declare-datatypes ((array!92346 0))(
  ( (array!92347 (arr!44621 (Array (_ BitVec 32) (_ BitVec 64))) (size!45171 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92346)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1356169 (= lt!598930 (validKeyInArray!0 (select (arr!44621 a!3742) from!3120)))))

(declare-fun b!1356170 () Bool)

(declare-fun res!900985 () Bool)

(assert (=> b!1356170 (=> (not res!900985) (not e!769985))))

(assert (=> b!1356170 (= res!900985 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45171 a!3742)))))

(declare-fun res!900978 () Bool)

(assert (=> start!114164 (=> (not res!900978) (not e!769985))))

(assert (=> start!114164 (= res!900978 (and (bvslt (size!45171 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45171 a!3742))))))

(assert (=> start!114164 e!769985))

(assert (=> start!114164 true))

(declare-fun array_inv!33649 (array!92346) Bool)

(assert (=> start!114164 (array_inv!33649 a!3742)))

(declare-fun b!1356171 () Bool)

(declare-fun lt!598933 () Unit!44604)

(assert (=> b!1356171 (= e!769987 lt!598933)))

(declare-fun lt!598929 () Unit!44604)

(declare-datatypes ((List!31662 0))(
  ( (Nil!31659) (Cons!31658 (h!32867 (_ BitVec 64)) (t!46320 List!31662)) )
))
(declare-fun acc!759 () List!31662)

(declare-fun lemmaListSubSeqRefl!0 (List!31662) Unit!44604)

(assert (=> b!1356171 (= lt!598929 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!791 (List!31662 List!31662) Bool)

(assert (=> b!1356171 (subseq!791 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92346 List!31662 List!31662 (_ BitVec 32)) Unit!44604)

(declare-fun $colon$colon!806 (List!31662 (_ BitVec 64)) List!31662)

(assert (=> b!1356171 (= lt!598933 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!806 acc!759 (select (arr!44621 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92346 (_ BitVec 32) List!31662) Bool)

(assert (=> b!1356171 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1356172 () Bool)

(declare-fun res!900981 () Bool)

(assert (=> b!1356172 (=> (not res!900981) (not e!769985))))

(assert (=> b!1356172 (= res!900981 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31659))))

(declare-fun b!1356173 () Bool)

(assert (=> b!1356173 (= e!769986 (not true))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1356173 (arrayNoDuplicates!0 (array!92347 (store (arr!44621 a!3742) i!1404 l!3587) (size!45171 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun lt!598931 () Unit!44604)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92346 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31662) Unit!44604)

(assert (=> b!1356173 (= lt!598931 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1356174 () Bool)

(declare-fun res!900975 () Bool)

(assert (=> b!1356174 (=> (not res!900975) (not e!769985))))

(declare-fun contains!9371 (List!31662 (_ BitVec 64)) Bool)

(assert (=> b!1356174 (= res!900975 (not (contains!9371 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356175 () Bool)

(declare-fun res!900980 () Bool)

(assert (=> b!1356175 (=> (not res!900980) (not e!769985))))

(assert (=> b!1356175 (= res!900980 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45171 a!3742))))))

(declare-fun b!1356176 () Bool)

(declare-fun Unit!44606 () Unit!44604)

(assert (=> b!1356176 (= e!769987 Unit!44606)))

(declare-fun b!1356177 () Bool)

(declare-fun res!900983 () Bool)

(assert (=> b!1356177 (=> (not res!900983) (not e!769985))))

(assert (=> b!1356177 (= res!900983 (not (contains!9371 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356178 () Bool)

(declare-fun res!900982 () Bool)

(assert (=> b!1356178 (=> (not res!900982) (not e!769985))))

(declare-fun noDuplicate!2228 (List!31662) Bool)

(assert (=> b!1356178 (= res!900982 (noDuplicate!2228 acc!759))))

(declare-fun b!1356179 () Bool)

(declare-fun res!900979 () Bool)

(assert (=> b!1356179 (=> (not res!900979) (not e!769986))))

(assert (=> b!1356179 (= res!900979 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1356180 () Bool)

(declare-fun res!900977 () Bool)

(assert (=> b!1356180 (=> (not res!900977) (not e!769985))))

(assert (=> b!1356180 (= res!900977 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1356181 () Bool)

(declare-fun res!900976 () Bool)

(assert (=> b!1356181 (=> (not res!900976) (not e!769985))))

(assert (=> b!1356181 (= res!900976 (not (validKeyInArray!0 l!3587)))))

(assert (= (and start!114164 res!900978) b!1356178))

(assert (= (and b!1356178 res!900982) b!1356174))

(assert (= (and b!1356174 res!900975) b!1356177))

(assert (= (and b!1356177 res!900983) b!1356172))

(assert (= (and b!1356172 res!900981) b!1356180))

(assert (= (and b!1356180 res!900977) b!1356175))

(assert (= (and b!1356175 res!900980) b!1356181))

(assert (= (and b!1356181 res!900976) b!1356170))

(assert (= (and b!1356170 res!900985) b!1356169))

(assert (= (and b!1356169 c!127037) b!1356171))

(assert (= (and b!1356169 (not c!127037)) b!1356176))

(assert (= (and b!1356169 res!900984) b!1356179))

(assert (= (and b!1356179 res!900979) b!1356173))

(declare-fun m!1242199 () Bool)

(assert (=> b!1356172 m!1242199))

(declare-fun m!1242201 () Bool)

(assert (=> b!1356173 m!1242201))

(declare-fun m!1242203 () Bool)

(assert (=> b!1356173 m!1242203))

(declare-fun m!1242205 () Bool)

(assert (=> b!1356173 m!1242205))

(declare-fun m!1242207 () Bool)

(assert (=> b!1356181 m!1242207))

(declare-fun m!1242209 () Bool)

(assert (=> b!1356179 m!1242209))

(declare-fun m!1242211 () Bool)

(assert (=> b!1356180 m!1242211))

(declare-fun m!1242213 () Bool)

(assert (=> start!114164 m!1242213))

(declare-fun m!1242215 () Bool)

(assert (=> b!1356178 m!1242215))

(declare-fun m!1242217 () Bool)

(assert (=> b!1356169 m!1242217))

(assert (=> b!1356169 m!1242217))

(declare-fun m!1242219 () Bool)

(assert (=> b!1356169 m!1242219))

(declare-fun m!1242221 () Bool)

(assert (=> b!1356177 m!1242221))

(declare-fun m!1242223 () Bool)

(assert (=> b!1356171 m!1242223))

(assert (=> b!1356171 m!1242217))

(declare-fun m!1242225 () Bool)

(assert (=> b!1356171 m!1242225))

(declare-fun m!1242227 () Bool)

(assert (=> b!1356171 m!1242227))

(assert (=> b!1356171 m!1242209))

(assert (=> b!1356171 m!1242217))

(assert (=> b!1356171 m!1242225))

(declare-fun m!1242229 () Bool)

(assert (=> b!1356171 m!1242229))

(declare-fun m!1242231 () Bool)

(assert (=> b!1356174 m!1242231))

(push 1)

