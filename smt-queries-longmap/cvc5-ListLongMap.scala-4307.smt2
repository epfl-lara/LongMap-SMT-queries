; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59870 () Bool)

(assert start!59870)

(declare-fun b!662174 () Bool)

(declare-datatypes ((Unit!22998 0))(
  ( (Unit!22999) )
))
(declare-fun e!380211 () Unit!22998)

(declare-fun Unit!23000 () Unit!22998)

(assert (=> b!662174 (= e!380211 Unit!23000)))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun lt!308942 () Unit!22998)

(declare-fun k!2843 () (_ BitVec 64))

(declare-datatypes ((array!38917 0))(
  ( (array!38918 (arr!18651 (Array (_ BitVec 32) (_ BitVec 64))) (size!19015 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38917)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38917 (_ BitVec 64) (_ BitVec 32)) Unit!22998)

(assert (=> b!662174 (= lt!308942 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!662174 false))

(declare-fun b!662175 () Bool)

(declare-fun res!430209 () Bool)

(declare-fun e!380213 () Bool)

(assert (=> b!662175 (=> res!430209 e!380213)))

(declare-datatypes ((List!12692 0))(
  ( (Nil!12689) (Cons!12688 (h!13733 (_ BitVec 64)) (t!18920 List!12692)) )
))
(declare-fun lt!308940 () List!12692)

(declare-fun contains!3269 (List!12692 (_ BitVec 64)) Bool)

(assert (=> b!662175 (= res!430209 (contains!3269 lt!308940 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!662176 () Bool)

(declare-fun res!430202 () Bool)

(declare-fun e!380208 () Bool)

(assert (=> b!662176 (=> (not res!430202) (not e!380208))))

(declare-fun acc!681 () List!12692)

(declare-fun noDuplicate!516 (List!12692) Bool)

(assert (=> b!662176 (= res!430202 (noDuplicate!516 acc!681))))

(declare-fun b!662177 () Bool)

(declare-fun e!380207 () Bool)

(assert (=> b!662177 (= e!380208 (not e!380207))))

(declare-fun res!430211 () Bool)

(assert (=> b!662177 (=> res!430211 e!380207)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!662177 (= res!430211 (not (validKeyInArray!0 (select (arr!18651 a!3626) from!3004))))))

(declare-fun lt!308941 () Unit!22998)

(assert (=> b!662177 (= lt!308941 e!380211)))

(declare-fun c!76355 () Bool)

(declare-fun arrayContainsKey!0 (array!38917 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!662177 (= c!76355 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!662177 (arrayContainsKey!0 (array!38918 (store (arr!18651 a!3626) i!1382 k!2843) (size!19015 a!3626)) k!2843 from!3004)))

(declare-fun b!662178 () Bool)

(declare-fun res!430215 () Bool)

(assert (=> b!662178 (=> (not res!430215) (not e!380208))))

(assert (=> b!662178 (= res!430215 (validKeyInArray!0 k!2843))))

(declare-fun b!662179 () Bool)

(declare-fun res!430208 () Bool)

(assert (=> b!662179 (=> (not res!430208) (not e!380208))))

(assert (=> b!662179 (= res!430208 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!662180 () Bool)

(declare-fun res!430214 () Bool)

(assert (=> b!662180 (=> (not res!430214) (not e!380208))))

(declare-fun arrayNoDuplicates!0 (array!38917 (_ BitVec 32) List!12692) Bool)

(assert (=> b!662180 (= res!430214 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!662181 () Bool)

(declare-fun res!430200 () Bool)

(assert (=> b!662181 (=> (not res!430200) (not e!380208))))

(assert (=> b!662181 (= res!430200 (not (contains!3269 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!662182 () Bool)

(declare-fun e!380210 () Bool)

(assert (=> b!662182 (= e!380210 (contains!3269 acc!681 k!2843))))

(declare-fun res!430198 () Bool)

(assert (=> start!59870 (=> (not res!430198) (not e!380208))))

(assert (=> start!59870 (= res!430198 (and (bvslt (size!19015 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19015 a!3626))))))

(assert (=> start!59870 e!380208))

(assert (=> start!59870 true))

(declare-fun array_inv!14447 (array!38917) Bool)

(assert (=> start!59870 (array_inv!14447 a!3626)))

(declare-fun b!662183 () Bool)

(declare-fun res!430217 () Bool)

(assert (=> b!662183 (=> res!430217 e!380213)))

(assert (=> b!662183 (= res!430217 (contains!3269 lt!308940 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!662184 () Bool)

(declare-fun res!430199 () Bool)

(assert (=> b!662184 (=> res!430199 e!380213)))

(declare-fun subseq!8 (List!12692 List!12692) Bool)

(assert (=> b!662184 (= res!430199 (not (subseq!8 acc!681 lt!308940)))))

(declare-fun b!662185 () Bool)

(declare-fun e!380209 () Bool)

(declare-fun e!380212 () Bool)

(assert (=> b!662185 (= e!380209 e!380212)))

(declare-fun res!430206 () Bool)

(assert (=> b!662185 (=> (not res!430206) (not e!380212))))

(assert (=> b!662185 (= res!430206 (bvsle from!3004 i!1382))))

(declare-fun b!662186 () Bool)

(declare-fun res!430216 () Bool)

(assert (=> b!662186 (=> (not res!430216) (not e!380208))))

(assert (=> b!662186 (= res!430216 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12689))))

(declare-fun b!662187 () Bool)

(declare-fun res!430201 () Bool)

(assert (=> b!662187 (=> (not res!430201) (not e!380208))))

(assert (=> b!662187 (= res!430201 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19015 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!662188 () Bool)

(assert (=> b!662188 (= e!380207 e!380213)))

(declare-fun res!430213 () Bool)

(assert (=> b!662188 (=> res!430213 e!380213)))

(assert (=> b!662188 (= res!430213 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!140 (List!12692 (_ BitVec 64)) List!12692)

(assert (=> b!662188 (= lt!308940 ($colon$colon!140 acc!681 (select (arr!18651 a!3626) from!3004)))))

(assert (=> b!662188 (subseq!8 acc!681 acc!681)))

(declare-fun lt!308939 () Unit!22998)

(declare-fun lemmaListSubSeqRefl!0 (List!12692) Unit!22998)

(assert (=> b!662188 (= lt!308939 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!662189 () Bool)

(declare-fun res!430203 () Bool)

(assert (=> b!662189 (=> (not res!430203) (not e!380208))))

(assert (=> b!662189 (= res!430203 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19015 a!3626))))))

(declare-fun b!662190 () Bool)

(declare-fun res!430204 () Bool)

(assert (=> b!662190 (=> (not res!430204) (not e!380208))))

(assert (=> b!662190 (= res!430204 e!380209)))

(declare-fun res!430207 () Bool)

(assert (=> b!662190 (=> res!430207 e!380209)))

(assert (=> b!662190 (= res!430207 e!380210)))

(declare-fun res!430205 () Bool)

(assert (=> b!662190 (=> (not res!430205) (not e!380210))))

(assert (=> b!662190 (= res!430205 (bvsgt from!3004 i!1382))))

(declare-fun b!662191 () Bool)

(declare-fun Unit!23001 () Unit!22998)

(assert (=> b!662191 (= e!380211 Unit!23001)))

(declare-fun b!662192 () Bool)

(assert (=> b!662192 (= e!380213 true)))

(declare-fun lt!308943 () Bool)

(assert (=> b!662192 (= lt!308943 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!308940))))

(declare-fun lt!308944 () Unit!22998)

(declare-fun noDuplicateSubseq!8 (List!12692 List!12692) Unit!22998)

(assert (=> b!662192 (= lt!308944 (noDuplicateSubseq!8 acc!681 lt!308940))))

(declare-fun b!662193 () Bool)

(declare-fun res!430210 () Bool)

(assert (=> b!662193 (=> res!430210 e!380213)))

(assert (=> b!662193 (= res!430210 (not (noDuplicate!516 lt!308940)))))

(declare-fun b!662194 () Bool)

(assert (=> b!662194 (= e!380212 (not (contains!3269 acc!681 k!2843)))))

(declare-fun b!662195 () Bool)

(declare-fun res!430212 () Bool)

(assert (=> b!662195 (=> (not res!430212) (not e!380208))))

(assert (=> b!662195 (= res!430212 (not (contains!3269 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!59870 res!430198) b!662176))

(assert (= (and b!662176 res!430202) b!662195))

(assert (= (and b!662195 res!430212) b!662181))

(assert (= (and b!662181 res!430200) b!662190))

(assert (= (and b!662190 res!430205) b!662182))

(assert (= (and b!662190 (not res!430207)) b!662185))

(assert (= (and b!662185 res!430206) b!662194))

(assert (= (and b!662190 res!430204) b!662186))

(assert (= (and b!662186 res!430216) b!662180))

(assert (= (and b!662180 res!430214) b!662189))

(assert (= (and b!662189 res!430203) b!662178))

(assert (= (and b!662178 res!430215) b!662179))

(assert (= (and b!662179 res!430208) b!662187))

(assert (= (and b!662187 res!430201) b!662177))

(assert (= (and b!662177 c!76355) b!662174))

(assert (= (and b!662177 (not c!76355)) b!662191))

(assert (= (and b!662177 (not res!430211)) b!662188))

(assert (= (and b!662188 (not res!430213)) b!662193))

(assert (= (and b!662193 (not res!430210)) b!662175))

(assert (= (and b!662175 (not res!430209)) b!662183))

(assert (= (and b!662183 (not res!430217)) b!662184))

(assert (= (and b!662184 (not res!430199)) b!662192))

(declare-fun m!634085 () Bool)

(assert (=> b!662181 m!634085))

(declare-fun m!634087 () Bool)

(assert (=> b!662175 m!634087))

(declare-fun m!634089 () Bool)

(assert (=> b!662180 m!634089))

(declare-fun m!634091 () Bool)

(assert (=> b!662192 m!634091))

(declare-fun m!634093 () Bool)

(assert (=> b!662192 m!634093))

(declare-fun m!634095 () Bool)

(assert (=> b!662188 m!634095))

(assert (=> b!662188 m!634095))

(declare-fun m!634097 () Bool)

(assert (=> b!662188 m!634097))

(declare-fun m!634099 () Bool)

(assert (=> b!662188 m!634099))

(declare-fun m!634101 () Bool)

(assert (=> b!662188 m!634101))

(declare-fun m!634103 () Bool)

(assert (=> b!662194 m!634103))

(assert (=> b!662177 m!634095))

(declare-fun m!634105 () Bool)

(assert (=> b!662177 m!634105))

(declare-fun m!634107 () Bool)

(assert (=> b!662177 m!634107))

(assert (=> b!662177 m!634095))

(declare-fun m!634109 () Bool)

(assert (=> b!662177 m!634109))

(declare-fun m!634111 () Bool)

(assert (=> b!662177 m!634111))

(declare-fun m!634113 () Bool)

(assert (=> b!662176 m!634113))

(declare-fun m!634115 () Bool)

(assert (=> b!662195 m!634115))

(declare-fun m!634117 () Bool)

(assert (=> b!662193 m!634117))

(declare-fun m!634119 () Bool)

(assert (=> b!662179 m!634119))

(declare-fun m!634121 () Bool)

(assert (=> b!662183 m!634121))

(declare-fun m!634123 () Bool)

(assert (=> b!662174 m!634123))

(declare-fun m!634125 () Bool)

(assert (=> b!662178 m!634125))

(declare-fun m!634127 () Bool)

(assert (=> start!59870 m!634127))

(declare-fun m!634129 () Bool)

(assert (=> b!662184 m!634129))

(declare-fun m!634131 () Bool)

(assert (=> b!662186 m!634131))

(assert (=> b!662182 m!634103))

(push 1)

