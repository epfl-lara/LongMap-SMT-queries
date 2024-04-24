; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60094 () Bool)

(assert start!60094)

(declare-fun b!668152 () Bool)

(declare-fun e!382382 () Bool)

(declare-datatypes ((List!12677 0))(
  ( (Nil!12674) (Cons!12673 (h!13721 (_ BitVec 64)) (t!18897 List!12677)) )
))
(declare-fun lt!311120 () List!12677)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3329 (List!12677 (_ BitVec 64)) Bool)

(assert (=> b!668152 (= e!382382 (contains!3329 lt!311120 k!2843))))

(declare-fun b!668153 () Bool)

(declare-fun e!382377 () Bool)

(assert (=> b!668153 (= e!382377 (not (contains!3329 lt!311120 k!2843)))))

(declare-fun b!668154 () Bool)

(declare-fun e!382376 () Bool)

(assert (=> b!668154 (= e!382376 e!382377)))

(declare-fun res!435174 () Bool)

(assert (=> b!668154 (=> (not res!435174) (not e!382377))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!668154 (= res!435174 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!668155 () Bool)

(declare-fun e!382381 () Bool)

(assert (=> b!668155 (= e!382381 true)))

(declare-fun lt!311122 () Bool)

(assert (=> b!668155 (= lt!311122 e!382376)))

(declare-fun res!435173 () Bool)

(assert (=> b!668155 (=> res!435173 e!382376)))

(assert (=> b!668155 (= res!435173 e!382382)))

(declare-fun res!435190 () Bool)

(assert (=> b!668155 (=> (not res!435190) (not e!382382))))

(assert (=> b!668155 (= res!435190 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!668156 () Bool)

(declare-fun res!435184 () Bool)

(assert (=> b!668156 (=> res!435184 e!382381)))

(declare-fun noDuplicate!603 (List!12677) Bool)

(assert (=> b!668156 (= res!435184 (not (noDuplicate!603 lt!311120)))))

(declare-fun res!435187 () Bool)

(declare-fun e!382375 () Bool)

(assert (=> start!60094 (=> (not res!435187) (not e!382375))))

(declare-datatypes ((array!39079 0))(
  ( (array!39080 (arr!18729 (Array (_ BitVec 32) (_ BitVec 64))) (size!19093 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39079)

(assert (=> start!60094 (= res!435187 (and (bvslt (size!19093 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19093 a!3626))))))

(assert (=> start!60094 e!382375))

(assert (=> start!60094 true))

(declare-fun array_inv!14588 (array!39079) Bool)

(assert (=> start!60094 (array_inv!14588 a!3626)))

(declare-fun b!668157 () Bool)

(declare-fun res!435176 () Bool)

(assert (=> b!668157 (=> (not res!435176) (not e!382375))))

(declare-fun acc!681 () List!12677)

(declare-fun arrayNoDuplicates!0 (array!39079 (_ BitVec 32) List!12677) Bool)

(assert (=> b!668157 (= res!435176 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!668158 () Bool)

(declare-datatypes ((Unit!23374 0))(
  ( (Unit!23375) )
))
(declare-fun e!382378 () Unit!23374)

(declare-fun Unit!23376 () Unit!23374)

(assert (=> b!668158 (= e!382378 Unit!23376)))

(declare-fun b!668159 () Bool)

(declare-fun res!435192 () Bool)

(assert (=> b!668159 (=> (not res!435192) (not e!382375))))

(assert (=> b!668159 (= res!435192 (noDuplicate!603 acc!681))))

(declare-fun b!668160 () Bool)

(declare-fun e!382383 () Bool)

(assert (=> b!668160 (= e!382383 (contains!3329 acc!681 k!2843))))

(declare-fun b!668161 () Bool)

(declare-fun res!435185 () Bool)

(assert (=> b!668161 (=> (not res!435185) (not e!382375))))

(declare-fun arrayContainsKey!0 (array!39079 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!668161 (= res!435185 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!668162 () Bool)

(declare-fun res!435179 () Bool)

(assert (=> b!668162 (=> res!435179 e!382381)))

(assert (=> b!668162 (= res!435179 (contains!3329 lt!311120 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!668163 () Bool)

(declare-fun res!435188 () Bool)

(assert (=> b!668163 (=> (not res!435188) (not e!382375))))

(assert (=> b!668163 (= res!435188 (not (contains!3329 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!668164 () Bool)

(declare-fun Unit!23377 () Unit!23374)

(assert (=> b!668164 (= e!382378 Unit!23377)))

(declare-fun lt!311123 () Unit!23374)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39079 (_ BitVec 64) (_ BitVec 32)) Unit!23374)

(assert (=> b!668164 (= lt!311123 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!668164 false))

(declare-fun b!668165 () Bool)

(declare-fun e!382374 () Bool)

(declare-fun e!382373 () Bool)

(assert (=> b!668165 (= e!382374 e!382373)))

(declare-fun res!435183 () Bool)

(assert (=> b!668165 (=> (not res!435183) (not e!382373))))

(assert (=> b!668165 (= res!435183 (bvsle from!3004 i!1382))))

(declare-fun b!668166 () Bool)

(declare-fun res!435182 () Bool)

(assert (=> b!668166 (=> res!435182 e!382381)))

(assert (=> b!668166 (= res!435182 (contains!3329 lt!311120 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!668167 () Bool)

(declare-fun e!382380 () Unit!23374)

(declare-fun lt!311119 () Unit!23374)

(assert (=> b!668167 (= e!382380 lt!311119)))

(declare-fun lt!311124 () Unit!23374)

(declare-fun lemmaListSubSeqRefl!0 (List!12677) Unit!23374)

(assert (=> b!668167 (= lt!311124 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!91 (List!12677 List!12677) Bool)

(assert (=> b!668167 (subseq!91 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39079 List!12677 List!12677 (_ BitVec 32)) Unit!23374)

(declare-fun $colon$colon!220 (List!12677 (_ BitVec 64)) List!12677)

(assert (=> b!668167 (= lt!311119 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!220 acc!681 (select (arr!18729 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!668167 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!668168 () Bool)

(declare-fun res!435175 () Bool)

(assert (=> b!668168 (=> (not res!435175) (not e!382375))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!668168 (= res!435175 (validKeyInArray!0 k!2843))))

(declare-fun b!668169 () Bool)

(declare-fun res!435189 () Bool)

(assert (=> b!668169 (=> (not res!435189) (not e!382375))))

(assert (=> b!668169 (= res!435189 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19093 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!668170 () Bool)

(assert (=> b!668170 (= e!382375 (not e!382381))))

(declare-fun res!435181 () Bool)

(assert (=> b!668170 (=> res!435181 e!382381)))

(assert (=> b!668170 (= res!435181 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (=> b!668170 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!311120)))

(declare-fun lt!311117 () Unit!23374)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39079 (_ BitVec 64) (_ BitVec 32) List!12677 List!12677) Unit!23374)

(assert (=> b!668170 (= lt!311117 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!311120))))

(declare-fun -!88 (List!12677 (_ BitVec 64)) List!12677)

(assert (=> b!668170 (= (-!88 lt!311120 k!2843) acc!681)))

(assert (=> b!668170 (= lt!311120 ($colon$colon!220 acc!681 k!2843))))

(declare-fun lt!311116 () Unit!23374)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12677) Unit!23374)

(assert (=> b!668170 (= lt!311116 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(assert (=> b!668170 (subseq!91 acc!681 acc!681)))

(declare-fun lt!311121 () Unit!23374)

(assert (=> b!668170 (= lt!311121 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!668170 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!311118 () Unit!23374)

(assert (=> b!668170 (= lt!311118 e!382380)))

(declare-fun c!76859 () Bool)

(assert (=> b!668170 (= c!76859 (validKeyInArray!0 (select (arr!18729 a!3626) from!3004)))))

(declare-fun lt!311125 () Unit!23374)

(assert (=> b!668170 (= lt!311125 e!382378)))

(declare-fun c!76858 () Bool)

(assert (=> b!668170 (= c!76858 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!668170 (arrayContainsKey!0 (array!39080 (store (arr!18729 a!3626) i!1382 k!2843) (size!19093 a!3626)) k!2843 from!3004)))

(declare-fun b!668171 () Bool)

(declare-fun Unit!23378 () Unit!23374)

(assert (=> b!668171 (= e!382380 Unit!23378)))

(declare-fun b!668172 () Bool)

(declare-fun res!435178 () Bool)

(assert (=> b!668172 (=> (not res!435178) (not e!382375))))

(assert (=> b!668172 (= res!435178 e!382374)))

(declare-fun res!435177 () Bool)

(assert (=> b!668172 (=> res!435177 e!382374)))

(assert (=> b!668172 (= res!435177 e!382383)))

(declare-fun res!435186 () Bool)

(assert (=> b!668172 (=> (not res!435186) (not e!382383))))

(assert (=> b!668172 (= res!435186 (bvsgt from!3004 i!1382))))

(declare-fun b!668173 () Bool)

(declare-fun res!435180 () Bool)

(assert (=> b!668173 (=> (not res!435180) (not e!382375))))

(assert (=> b!668173 (= res!435180 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19093 a!3626))))))

(declare-fun b!668174 () Bool)

(assert (=> b!668174 (= e!382373 (not (contains!3329 acc!681 k!2843)))))

(declare-fun b!668175 () Bool)

(declare-fun res!435193 () Bool)

(assert (=> b!668175 (=> (not res!435193) (not e!382375))))

(assert (=> b!668175 (= res!435193 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12674))))

(declare-fun b!668176 () Bool)

(declare-fun res!435191 () Bool)

(assert (=> b!668176 (=> (not res!435191) (not e!382375))))

(assert (=> b!668176 (= res!435191 (not (contains!3329 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!60094 res!435187) b!668159))

(assert (= (and b!668159 res!435192) b!668176))

(assert (= (and b!668176 res!435191) b!668163))

(assert (= (and b!668163 res!435188) b!668172))

(assert (= (and b!668172 res!435186) b!668160))

(assert (= (and b!668172 (not res!435177)) b!668165))

(assert (= (and b!668165 res!435183) b!668174))

(assert (= (and b!668172 res!435178) b!668175))

(assert (= (and b!668175 res!435193) b!668157))

(assert (= (and b!668157 res!435176) b!668173))

(assert (= (and b!668173 res!435180) b!668168))

(assert (= (and b!668168 res!435175) b!668161))

(assert (= (and b!668161 res!435185) b!668169))

(assert (= (and b!668169 res!435189) b!668170))

(assert (= (and b!668170 c!76858) b!668164))

(assert (= (and b!668170 (not c!76858)) b!668158))

(assert (= (and b!668170 c!76859) b!668167))

(assert (= (and b!668170 (not c!76859)) b!668171))

(assert (= (and b!668170 (not res!435181)) b!668156))

(assert (= (and b!668156 (not res!435184)) b!668162))

(assert (= (and b!668162 (not res!435179)) b!668166))

(assert (= (and b!668166 (not res!435182)) b!668155))

(assert (= (and b!668155 res!435190) b!668152))

(assert (= (and b!668155 (not res!435173)) b!668154))

(assert (= (and b!668154 res!435174) b!668153))

(declare-fun m!639063 () Bool)

(assert (=> b!668175 m!639063))

(declare-fun m!639065 () Bool)

(assert (=> b!668163 m!639065))

(declare-fun m!639067 () Bool)

(assert (=> b!668170 m!639067))

(declare-fun m!639069 () Bool)

(assert (=> b!668170 m!639069))

(declare-fun m!639071 () Bool)

(assert (=> b!668170 m!639071))

(declare-fun m!639073 () Bool)

(assert (=> b!668170 m!639073))

(declare-fun m!639075 () Bool)

(assert (=> b!668170 m!639075))

(declare-fun m!639077 () Bool)

(assert (=> b!668170 m!639077))

(declare-fun m!639079 () Bool)

(assert (=> b!668170 m!639079))

(declare-fun m!639081 () Bool)

(assert (=> b!668170 m!639081))

(assert (=> b!668170 m!639071))

(declare-fun m!639083 () Bool)

(assert (=> b!668170 m!639083))

(declare-fun m!639085 () Bool)

(assert (=> b!668170 m!639085))

(declare-fun m!639087 () Bool)

(assert (=> b!668170 m!639087))

(declare-fun m!639089 () Bool)

(assert (=> b!668170 m!639089))

(declare-fun m!639091 () Bool)

(assert (=> b!668170 m!639091))

(declare-fun m!639093 () Bool)

(assert (=> b!668156 m!639093))

(declare-fun m!639095 () Bool)

(assert (=> b!668157 m!639095))

(declare-fun m!639097 () Bool)

(assert (=> b!668160 m!639097))

(declare-fun m!639099 () Bool)

(assert (=> b!668162 m!639099))

(declare-fun m!639101 () Bool)

(assert (=> start!60094 m!639101))

(declare-fun m!639103 () Bool)

(assert (=> b!668161 m!639103))

(declare-fun m!639105 () Bool)

(assert (=> b!668168 m!639105))

(declare-fun m!639107 () Bool)

(assert (=> b!668176 m!639107))

(assert (=> b!668174 m!639097))

(declare-fun m!639109 () Bool)

(assert (=> b!668153 m!639109))

(declare-fun m!639111 () Bool)

(assert (=> b!668166 m!639111))

(declare-fun m!639113 () Bool)

(assert (=> b!668164 m!639113))

(assert (=> b!668167 m!639069))

(assert (=> b!668167 m!639071))

(declare-fun m!639115 () Bool)

(assert (=> b!668167 m!639115))

(declare-fun m!639117 () Bool)

(assert (=> b!668167 m!639117))

(assert (=> b!668167 m!639071))

(assert (=> b!668167 m!639115))

(assert (=> b!668167 m!639087))

(assert (=> b!668167 m!639091))

(declare-fun m!639119 () Bool)

(assert (=> b!668159 m!639119))

(assert (=> b!668152 m!639109))

(push 1)

(assert (not b!668167))

(assert (not b!668160))

(assert (not b!668164))

(assert (not b!668175))

(assert (not b!668176))

(assert (not b!668157))

(assert (not b!668159))

(assert (not b!668161))

(assert (not b!668162))

(assert (not b!668163))

(assert (not b!668156))

(assert (not b!668170))

(assert (not start!60094))

(assert (not b!668174))

(assert (not b!668168))

(assert (not b!668153))

(assert (not b!668152))

(assert (not b!668166))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

