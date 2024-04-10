; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114162 () Bool)

(assert start!114162)

(declare-fun b!1356130 () Bool)

(declare-fun res!900949 () Bool)

(declare-fun e!769973 () Bool)

(assert (=> b!1356130 (=> (not res!900949) (not e!769973))))

(declare-datatypes ((List!31661 0))(
  ( (Nil!31658) (Cons!31657 (h!32866 (_ BitVec 64)) (t!46319 List!31661)) )
))
(declare-fun acc!759 () List!31661)

(declare-datatypes ((array!92344 0))(
  ( (array!92345 (arr!44620 (Array (_ BitVec 32) (_ BitVec 64))) (size!45170 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92344)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92344 (_ BitVec 32) List!31661) Bool)

(assert (=> b!1356130 (= res!900949 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1356131 () Bool)

(declare-fun e!769972 () Bool)

(assert (=> b!1356131 (= e!769972 (not (bvsle from!3120 (size!45170 a!3742))))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1356131 (arrayNoDuplicates!0 (array!92345 (store (arr!44620 a!3742) i!1404 l!3587) (size!45170 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-datatypes ((Unit!44601 0))(
  ( (Unit!44602) )
))
(declare-fun lt!598916 () Unit!44601)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92344 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31661) Unit!44601)

(assert (=> b!1356131 (= lt!598916 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1356132 () Bool)

(declare-fun res!900945 () Bool)

(assert (=> b!1356132 (=> (not res!900945) (not e!769973))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1356132 (= res!900945 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1356133 () Bool)

(declare-fun e!769975 () Unit!44601)

(declare-fun Unit!44603 () Unit!44601)

(assert (=> b!1356133 (= e!769975 Unit!44603)))

(declare-fun b!1356134 () Bool)

(declare-fun res!900944 () Bool)

(assert (=> b!1356134 (=> (not res!900944) (not e!769973))))

(declare-fun noDuplicate!2227 (List!31661) Bool)

(assert (=> b!1356134 (= res!900944 (noDuplicate!2227 acc!759))))

(declare-fun b!1356135 () Bool)

(declare-fun res!900942 () Bool)

(assert (=> b!1356135 (=> (not res!900942) (not e!769973))))

(assert (=> b!1356135 (= res!900942 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45170 a!3742)))))

(declare-fun res!900943 () Bool)

(assert (=> start!114162 (=> (not res!900943) (not e!769973))))

(assert (=> start!114162 (= res!900943 (and (bvslt (size!45170 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45170 a!3742))))))

(assert (=> start!114162 e!769973))

(assert (=> start!114162 true))

(declare-fun array_inv!33648 (array!92344) Bool)

(assert (=> start!114162 (array_inv!33648 a!3742)))

(declare-fun b!1356136 () Bool)

(declare-fun lt!598915 () Unit!44601)

(assert (=> b!1356136 (= e!769975 lt!598915)))

(declare-fun lt!598917 () Unit!44601)

(declare-fun lemmaListSubSeqRefl!0 (List!31661) Unit!44601)

(assert (=> b!1356136 (= lt!598917 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!790 (List!31661 List!31661) Bool)

(assert (=> b!1356136 (subseq!790 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92344 List!31661 List!31661 (_ BitVec 32)) Unit!44601)

(declare-fun $colon$colon!805 (List!31661 (_ BitVec 64)) List!31661)

(assert (=> b!1356136 (= lt!598915 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!805 acc!759 (select (arr!44620 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1356136 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1356137 () Bool)

(declare-fun res!900946 () Bool)

(assert (=> b!1356137 (=> (not res!900946) (not e!769973))))

(assert (=> b!1356137 (= res!900946 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45170 a!3742))))))

(declare-fun b!1356138 () Bool)

(declare-fun res!900950 () Bool)

(assert (=> b!1356138 (=> (not res!900950) (not e!769973))))

(declare-fun contains!9370 (List!31661 (_ BitVec 64)) Bool)

(assert (=> b!1356138 (= res!900950 (not (contains!9370 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356139 () Bool)

(declare-fun res!900951 () Bool)

(assert (=> b!1356139 (=> (not res!900951) (not e!769973))))

(assert (=> b!1356139 (= res!900951 (not (contains!9370 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356140 () Bool)

(declare-fun res!900952 () Bool)

(assert (=> b!1356140 (=> (not res!900952) (not e!769973))))

(assert (=> b!1356140 (= res!900952 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31658))))

(declare-fun b!1356141 () Bool)

(assert (=> b!1356141 (= e!769973 e!769972)))

(declare-fun res!900947 () Bool)

(assert (=> b!1356141 (=> (not res!900947) (not e!769972))))

(declare-fun lt!598918 () Bool)

(assert (=> b!1356141 (= res!900947 (and (not (= from!3120 i!1404)) (not lt!598918) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!598914 () Unit!44601)

(assert (=> b!1356141 (= lt!598914 e!769975)))

(declare-fun c!127034 () Bool)

(assert (=> b!1356141 (= c!127034 lt!598918)))

(assert (=> b!1356141 (= lt!598918 (validKeyInArray!0 (select (arr!44620 a!3742) from!3120)))))

(declare-fun b!1356142 () Bool)

(declare-fun res!900948 () Bool)

(assert (=> b!1356142 (=> (not res!900948) (not e!769972))))

(assert (=> b!1356142 (= res!900948 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(assert (= (and start!114162 res!900943) b!1356134))

(assert (= (and b!1356134 res!900944) b!1356139))

(assert (= (and b!1356139 res!900951) b!1356138))

(assert (= (and b!1356138 res!900950) b!1356140))

(assert (= (and b!1356140 res!900952) b!1356130))

(assert (= (and b!1356130 res!900949) b!1356137))

(assert (= (and b!1356137 res!900946) b!1356132))

(assert (= (and b!1356132 res!900945) b!1356135))

(assert (= (and b!1356135 res!900942) b!1356141))

(assert (= (and b!1356141 c!127034) b!1356136))

(assert (= (and b!1356141 (not c!127034)) b!1356133))

(assert (= (and b!1356141 res!900947) b!1356142))

(assert (= (and b!1356142 res!900948) b!1356131))

(declare-fun m!1242165 () Bool)

(assert (=> start!114162 m!1242165))

(declare-fun m!1242167 () Bool)

(assert (=> b!1356132 m!1242167))

(declare-fun m!1242169 () Bool)

(assert (=> b!1356141 m!1242169))

(assert (=> b!1356141 m!1242169))

(declare-fun m!1242171 () Bool)

(assert (=> b!1356141 m!1242171))

(declare-fun m!1242173 () Bool)

(assert (=> b!1356140 m!1242173))

(declare-fun m!1242175 () Bool)

(assert (=> b!1356134 m!1242175))

(declare-fun m!1242177 () Bool)

(assert (=> b!1356139 m!1242177))

(declare-fun m!1242179 () Bool)

(assert (=> b!1356142 m!1242179))

(declare-fun m!1242181 () Bool)

(assert (=> b!1356136 m!1242181))

(assert (=> b!1356136 m!1242169))

(declare-fun m!1242183 () Bool)

(assert (=> b!1356136 m!1242183))

(declare-fun m!1242185 () Bool)

(assert (=> b!1356136 m!1242185))

(assert (=> b!1356136 m!1242179))

(assert (=> b!1356136 m!1242169))

(assert (=> b!1356136 m!1242183))

(declare-fun m!1242187 () Bool)

(assert (=> b!1356136 m!1242187))

(declare-fun m!1242189 () Bool)

(assert (=> b!1356138 m!1242189))

(declare-fun m!1242191 () Bool)

(assert (=> b!1356130 m!1242191))

(declare-fun m!1242193 () Bool)

(assert (=> b!1356131 m!1242193))

(declare-fun m!1242195 () Bool)

(assert (=> b!1356131 m!1242195))

(declare-fun m!1242197 () Bool)

(assert (=> b!1356131 m!1242197))

(push 1)

(assert (not b!1356140))

(assert (not b!1356139))

(assert (not b!1356130))

(assert (not start!114162))

(assert (not b!1356141))

(assert (not b!1356131))

(assert (not b!1356138))

(assert (not b!1356134))

(assert (not b!1356132))

(assert (not b!1356136))

(assert (not b!1356142))

(check-sat)

(pop 1)

(push 1)

(check-sat)

