; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61554 () Bool)

(assert start!61554)

(declare-fun b!688193 () Bool)

(declare-fun e!392006 () Bool)

(declare-datatypes ((List!13060 0))(
  ( (Nil!13057) (Cons!13056 (h!14101 (_ BitVec 64)) (t!19324 List!13060)) )
))
(declare-fun lt!315673 () List!13060)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3637 (List!13060 (_ BitVec 64)) Bool)

(assert (=> b!688193 (= e!392006 (contains!3637 lt!315673 k!2843))))

(declare-fun b!688194 () Bool)

(declare-fun e!392003 () Bool)

(declare-fun acc!681 () List!13060)

(assert (=> b!688194 (= e!392003 (contains!3637 acc!681 k!2843))))

(declare-fun b!688195 () Bool)

(declare-fun res!452947 () Bool)

(declare-fun e!392000 () Bool)

(assert (=> b!688195 (=> (not res!452947) (not e!392000))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39695 0))(
  ( (array!39696 (arr!19019 (Array (_ BitVec 32) (_ BitVec 64))) (size!19401 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39695)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!688195 (= res!452947 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19401 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!688196 () Bool)

(declare-fun e!392005 () Bool)

(declare-fun e!392009 () Bool)

(assert (=> b!688196 (= e!392005 e!392009)))

(declare-fun res!452957 () Bool)

(assert (=> b!688196 (=> (not res!452957) (not e!392009))))

(assert (=> b!688196 (= res!452957 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!688197 () Bool)

(declare-fun res!452938 () Bool)

(declare-fun e!392002 () Bool)

(assert (=> b!688197 (=> res!452938 e!392002)))

(assert (=> b!688197 (= res!452938 (contains!3637 lt!315673 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!688198 () Bool)

(declare-fun res!452954 () Bool)

(assert (=> b!688198 (=> (not res!452954) (not e!392000))))

(declare-fun noDuplicate!884 (List!13060) Bool)

(assert (=> b!688198 (= res!452954 (noDuplicate!884 acc!681))))

(declare-fun b!688199 () Bool)

(declare-datatypes ((Unit!24262 0))(
  ( (Unit!24263) )
))
(declare-fun e!392004 () Unit!24262)

(declare-fun Unit!24264 () Unit!24262)

(assert (=> b!688199 (= e!392004 Unit!24264)))

(declare-fun b!688200 () Bool)

(declare-fun res!452949 () Bool)

(assert (=> b!688200 (=> (not res!452949) (not e!392000))))

(assert (=> b!688200 (= res!452949 (not (contains!3637 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!688201 () Bool)

(declare-fun res!452941 () Bool)

(assert (=> b!688201 (=> (not res!452941) (not e!392000))))

(assert (=> b!688201 (= res!452941 (not (contains!3637 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!688202 () Bool)

(declare-fun res!452956 () Bool)

(assert (=> b!688202 (=> (not res!452956) (not e!392000))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!688202 (= res!452956 (validKeyInArray!0 k!2843))))

(declare-fun b!688203 () Bool)

(declare-fun res!452948 () Bool)

(assert (=> b!688203 (=> (not res!452948) (not e!392000))))

(declare-fun arrayNoDuplicates!0 (array!39695 (_ BitVec 32) List!13060) Bool)

(assert (=> b!688203 (= res!452948 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13057))))

(declare-fun b!688204 () Bool)

(assert (=> b!688204 (= e!392009 (not (contains!3637 lt!315673 k!2843)))))

(declare-fun b!688205 () Bool)

(declare-fun e!392008 () Bool)

(assert (=> b!688205 (= e!392008 (not (contains!3637 acc!681 k!2843)))))

(declare-fun b!688206 () Bool)

(declare-fun e!392010 () Unit!24262)

(declare-fun Unit!24265 () Unit!24262)

(assert (=> b!688206 (= e!392010 Unit!24265)))

(declare-fun b!688207 () Bool)

(declare-fun lt!315671 () Unit!24262)

(assert (=> b!688207 (= e!392010 lt!315671)))

(declare-fun lt!315677 () Unit!24262)

(declare-fun lemmaListSubSeqRefl!0 (List!13060) Unit!24262)

(assert (=> b!688207 (= lt!315677 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!223 (List!13060 List!13060) Bool)

(assert (=> b!688207 (subseq!223 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39695 List!13060 List!13060 (_ BitVec 32)) Unit!24262)

(declare-fun $colon$colon!388 (List!13060 (_ BitVec 64)) List!13060)

(assert (=> b!688207 (= lt!315671 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!388 acc!681 (select (arr!19019 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!688207 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!688208 () Bool)

(declare-fun res!452951 () Bool)

(assert (=> b!688208 (=> (not res!452951) (not e!392000))))

(assert (=> b!688208 (= res!452951 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19401 a!3626))))))

(declare-fun b!688209 () Bool)

(declare-fun res!452953 () Bool)

(assert (=> b!688209 (=> res!452953 e!392002)))

(assert (=> b!688209 (= res!452953 (not (noDuplicate!884 lt!315673)))))

(declare-fun b!688210 () Bool)

(declare-fun e!392007 () Bool)

(assert (=> b!688210 (= e!392007 e!392008)))

(declare-fun res!452955 () Bool)

(assert (=> b!688210 (=> (not res!452955) (not e!392008))))

(assert (=> b!688210 (= res!452955 (bvsle from!3004 i!1382))))

(declare-fun b!688211 () Bool)

(assert (=> b!688211 (= e!392002 true)))

(declare-fun lt!315679 () Bool)

(assert (=> b!688211 (= lt!315679 e!392005)))

(declare-fun res!452940 () Bool)

(assert (=> b!688211 (=> res!452940 e!392005)))

(assert (=> b!688211 (= res!452940 e!392006)))

(declare-fun res!452939 () Bool)

(assert (=> b!688211 (=> (not res!452939) (not e!392006))))

(assert (=> b!688211 (= res!452939 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!688212 () Bool)

(declare-fun res!452950 () Bool)

(assert (=> b!688212 (=> res!452950 e!392002)))

(assert (=> b!688212 (= res!452950 (contains!3637 lt!315673 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!688213 () Bool)

(declare-fun res!452943 () Bool)

(assert (=> b!688213 (=> (not res!452943) (not e!392000))))

(assert (=> b!688213 (= res!452943 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!688214 () Bool)

(declare-fun Unit!24266 () Unit!24262)

(assert (=> b!688214 (= e!392004 Unit!24266)))

(declare-fun lt!315678 () Unit!24262)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39695 (_ BitVec 64) (_ BitVec 32)) Unit!24262)

(assert (=> b!688214 (= lt!315678 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!688214 false))

(declare-fun b!688215 () Bool)

(declare-fun res!452937 () Bool)

(assert (=> b!688215 (=> (not res!452937) (not e!392000))))

(declare-fun arrayContainsKey!0 (array!39695 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!688215 (= res!452937 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun res!452945 () Bool)

(assert (=> start!61554 (=> (not res!452945) (not e!392000))))

(assert (=> start!61554 (= res!452945 (and (bvslt (size!19401 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19401 a!3626))))))

(assert (=> start!61554 e!392000))

(assert (=> start!61554 true))

(declare-fun array_inv!14815 (array!39695) Bool)

(assert (=> start!61554 (array_inv!14815 a!3626)))

(declare-fun b!688216 () Bool)

(assert (=> b!688216 (= e!392000 (not e!392002))))

(declare-fun res!452944 () Bool)

(assert (=> b!688216 (=> res!452944 e!392002)))

(assert (=> b!688216 (= res!452944 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (=> b!688216 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!315673)))

(declare-fun lt!315670 () Unit!24262)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39695 (_ BitVec 64) (_ BitVec 32) List!13060 List!13060) Unit!24262)

(assert (=> b!688216 (= lt!315670 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!315673))))

(declare-fun -!188 (List!13060 (_ BitVec 64)) List!13060)

(assert (=> b!688216 (= (-!188 lt!315673 k!2843) acc!681)))

(assert (=> b!688216 (= lt!315673 ($colon$colon!388 acc!681 k!2843))))

(declare-fun lt!315675 () Unit!24262)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13060) Unit!24262)

(assert (=> b!688216 (= lt!315675 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(assert (=> b!688216 (subseq!223 acc!681 acc!681)))

(declare-fun lt!315676 () Unit!24262)

(assert (=> b!688216 (= lt!315676 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!688216 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!315674 () Unit!24262)

(assert (=> b!688216 (= lt!315674 e!392010)))

(declare-fun c!77995 () Bool)

(assert (=> b!688216 (= c!77995 (validKeyInArray!0 (select (arr!19019 a!3626) from!3004)))))

(declare-fun lt!315672 () Unit!24262)

(assert (=> b!688216 (= lt!315672 e!392004)))

(declare-fun c!77996 () Bool)

(assert (=> b!688216 (= c!77996 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!688216 (arrayContainsKey!0 (array!39696 (store (arr!19019 a!3626) i!1382 k!2843) (size!19401 a!3626)) k!2843 from!3004)))

(declare-fun b!688217 () Bool)

(declare-fun res!452942 () Bool)

(assert (=> b!688217 (=> (not res!452942) (not e!392000))))

(assert (=> b!688217 (= res!452942 e!392007)))

(declare-fun res!452952 () Bool)

(assert (=> b!688217 (=> res!452952 e!392007)))

(assert (=> b!688217 (= res!452952 e!392003)))

(declare-fun res!452946 () Bool)

(assert (=> b!688217 (=> (not res!452946) (not e!392003))))

(assert (=> b!688217 (= res!452946 (bvsgt from!3004 i!1382))))

(assert (= (and start!61554 res!452945) b!688198))

(assert (= (and b!688198 res!452954) b!688200))

(assert (= (and b!688200 res!452949) b!688201))

(assert (= (and b!688201 res!452941) b!688217))

(assert (= (and b!688217 res!452946) b!688194))

(assert (= (and b!688217 (not res!452952)) b!688210))

(assert (= (and b!688210 res!452955) b!688205))

(assert (= (and b!688217 res!452942) b!688203))

(assert (= (and b!688203 res!452948) b!688213))

(assert (= (and b!688213 res!452943) b!688208))

(assert (= (and b!688208 res!452951) b!688202))

(assert (= (and b!688202 res!452956) b!688215))

(assert (= (and b!688215 res!452937) b!688195))

(assert (= (and b!688195 res!452947) b!688216))

(assert (= (and b!688216 c!77996) b!688214))

(assert (= (and b!688216 (not c!77996)) b!688199))

(assert (= (and b!688216 c!77995) b!688207))

(assert (= (and b!688216 (not c!77995)) b!688206))

(assert (= (and b!688216 (not res!452944)) b!688209))

(assert (= (and b!688209 (not res!452953)) b!688212))

(assert (= (and b!688212 (not res!452950)) b!688197))

(assert (= (and b!688197 (not res!452938)) b!688211))

(assert (= (and b!688211 res!452939) b!688193))

(assert (= (and b!688211 (not res!452940)) b!688196))

(assert (= (and b!688196 res!452957) b!688204))

(declare-fun m!652141 () Bool)

(assert (=> b!688200 m!652141))

(declare-fun m!652143 () Bool)

(assert (=> b!688203 m!652143))

(declare-fun m!652145 () Bool)

(assert (=> b!688215 m!652145))

(declare-fun m!652147 () Bool)

(assert (=> b!688209 m!652147))

(declare-fun m!652149 () Bool)

(assert (=> b!688204 m!652149))

(declare-fun m!652151 () Bool)

(assert (=> b!688202 m!652151))

(declare-fun m!652153 () Bool)

(assert (=> start!61554 m!652153))

(declare-fun m!652155 () Bool)

(assert (=> b!688198 m!652155))

(assert (=> b!688193 m!652149))

(declare-fun m!652157 () Bool)

(assert (=> b!688216 m!652157))

(declare-fun m!652159 () Bool)

(assert (=> b!688216 m!652159))

(declare-fun m!652161 () Bool)

(assert (=> b!688216 m!652161))

(declare-fun m!652163 () Bool)

(assert (=> b!688216 m!652163))

(declare-fun m!652165 () Bool)

(assert (=> b!688216 m!652165))

(declare-fun m!652167 () Bool)

(assert (=> b!688216 m!652167))

(declare-fun m!652169 () Bool)

(assert (=> b!688216 m!652169))

(declare-fun m!652171 () Bool)

(assert (=> b!688216 m!652171))

(assert (=> b!688216 m!652159))

(declare-fun m!652173 () Bool)

(assert (=> b!688216 m!652173))

(declare-fun m!652175 () Bool)

(assert (=> b!688216 m!652175))

(declare-fun m!652177 () Bool)

(assert (=> b!688216 m!652177))

(declare-fun m!652179 () Bool)

(assert (=> b!688216 m!652179))

(declare-fun m!652181 () Bool)

(assert (=> b!688216 m!652181))

(declare-fun m!652183 () Bool)

(assert (=> b!688194 m!652183))

(declare-fun m!652185 () Bool)

(assert (=> b!688197 m!652185))

(assert (=> b!688207 m!652157))

(assert (=> b!688207 m!652159))

(declare-fun m!652187 () Bool)

(assert (=> b!688207 m!652187))

(declare-fun m!652189 () Bool)

(assert (=> b!688207 m!652189))

(assert (=> b!688207 m!652159))

(assert (=> b!688207 m!652187))

(assert (=> b!688207 m!652169))

(assert (=> b!688207 m!652181))

(assert (=> b!688205 m!652183))

(declare-fun m!652191 () Bool)

(assert (=> b!688212 m!652191))

(declare-fun m!652193 () Bool)

(assert (=> b!688213 m!652193))

(declare-fun m!652195 () Bool)

(assert (=> b!688214 m!652195))

(declare-fun m!652197 () Bool)

(assert (=> b!688201 m!652197))

(push 1)

(assert (not b!688205))

(assert (not b!688194))

(assert (not b!688201))

(assert (not b!688209))

(assert (not b!688197))

(assert (not b!688198))

(assert (not b!688215))

(assert (not b!688200))

(assert (not b!688212))

(assert (not b!688207))

(assert (not b!688203))

(assert (not b!688202))

(assert (not b!688204))

(assert (not b!688214))

(assert (not b!688216))

(assert (not b!688193))

(assert (not start!61554))

(assert (not b!688213))

(check-sat)

