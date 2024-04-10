; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60096 () Bool)

(assert start!60096)

(declare-fun b!670195 () Bool)

(declare-fun res!436975 () Bool)

(declare-fun e!383230 () Bool)

(assert (=> b!670195 (=> (not res!436975) (not e!383230))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!670195 (= res!436975 (validKeyInArray!0 k!2843))))

(declare-fun b!670196 () Bool)

(declare-fun e!383222 () Bool)

(declare-datatypes ((List!12805 0))(
  ( (Nil!12802) (Cons!12801 (h!13846 (_ BitVec 64)) (t!19033 List!12805)) )
))
(declare-fun acc!681 () List!12805)

(declare-fun contains!3382 (List!12805 (_ BitVec 64)) Bool)

(assert (=> b!670196 (= e!383222 (not (contains!3382 acc!681 k!2843)))))

(declare-fun b!670197 () Bool)

(declare-fun res!436987 () Bool)

(assert (=> b!670197 (=> (not res!436987) (not e!383230))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39143 0))(
  ( (array!39144 (arr!18764 (Array (_ BitVec 32) (_ BitVec 64))) (size!19128 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39143)

(assert (=> b!670197 (= res!436987 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19128 a!3626))))))

(declare-fun b!670198 () Bool)

(declare-fun res!436972 () Bool)

(assert (=> b!670198 (=> (not res!436972) (not e!383230))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!670198 (= res!436972 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19128 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!670200 () Bool)

(declare-fun e!383227 () Bool)

(declare-fun lt!311941 () List!12805)

(assert (=> b!670200 (= e!383227 (contains!3382 lt!311941 k!2843))))

(declare-fun b!670201 () Bool)

(declare-datatypes ((Unit!23545 0))(
  ( (Unit!23546) )
))
(declare-fun e!383225 () Unit!23545)

(declare-fun lt!311936 () Unit!23545)

(assert (=> b!670201 (= e!383225 lt!311936)))

(declare-fun lt!311935 () Unit!23545)

(declare-fun lemmaListSubSeqRefl!0 (List!12805) Unit!23545)

(assert (=> b!670201 (= lt!311935 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!121 (List!12805 List!12805) Bool)

(assert (=> b!670201 (subseq!121 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39143 List!12805 List!12805 (_ BitVec 32)) Unit!23545)

(declare-fun $colon$colon!253 (List!12805 (_ BitVec 64)) List!12805)

(assert (=> b!670201 (= lt!311936 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!253 acc!681 (select (arr!18764 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun arrayNoDuplicates!0 (array!39143 (_ BitVec 32) List!12805) Bool)

(assert (=> b!670201 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!670202 () Bool)

(declare-fun res!436968 () Bool)

(assert (=> b!670202 (=> (not res!436968) (not e!383230))))

(declare-fun e!383232 () Bool)

(assert (=> b!670202 (= res!436968 e!383232)))

(declare-fun res!436979 () Bool)

(assert (=> b!670202 (=> res!436979 e!383232)))

(declare-fun e!383226 () Bool)

(assert (=> b!670202 (= res!436979 e!383226)))

(declare-fun res!436970 () Bool)

(assert (=> b!670202 (=> (not res!436970) (not e!383226))))

(assert (=> b!670202 (= res!436970 (bvsgt from!3004 i!1382))))

(declare-fun b!670203 () Bool)

(declare-fun e!383229 () Bool)

(assert (=> b!670203 (= e!383229 (not (contains!3382 lt!311941 k!2843)))))

(declare-fun b!670204 () Bool)

(assert (=> b!670204 (= e!383232 e!383222)))

(declare-fun res!436969 () Bool)

(assert (=> b!670204 (=> (not res!436969) (not e!383222))))

(assert (=> b!670204 (= res!436969 (bvsle from!3004 i!1382))))

(declare-fun b!670205 () Bool)

(declare-fun res!436986 () Bool)

(assert (=> b!670205 (=> (not res!436986) (not e!383230))))

(declare-fun noDuplicate!629 (List!12805) Bool)

(assert (=> b!670205 (= res!436986 (noDuplicate!629 acc!681))))

(declare-fun b!670206 () Bool)

(declare-fun res!436981 () Bool)

(assert (=> b!670206 (=> (not res!436981) (not e!383230))))

(declare-fun arrayContainsKey!0 (array!39143 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!670206 (= res!436981 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!670207 () Bool)

(declare-fun e!383224 () Unit!23545)

(declare-fun Unit!23547 () Unit!23545)

(assert (=> b!670207 (= e!383224 Unit!23547)))

(declare-fun lt!311933 () Unit!23545)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39143 (_ BitVec 64) (_ BitVec 32)) Unit!23545)

(assert (=> b!670207 (= lt!311933 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!670207 false))

(declare-fun b!670208 () Bool)

(declare-fun res!436982 () Bool)

(assert (=> b!670208 (=> (not res!436982) (not e!383230))))

(assert (=> b!670208 (= res!436982 (not (contains!3382 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!670209 () Bool)

(declare-fun res!436980 () Bool)

(declare-fun e!383228 () Bool)

(assert (=> b!670209 (=> res!436980 e!383228)))

(declare-fun e!383231 () Bool)

(assert (=> b!670209 (= res!436980 e!383231)))

(declare-fun res!436983 () Bool)

(assert (=> b!670209 (=> (not res!436983) (not e!383231))))

(assert (=> b!670209 (= res!436983 e!383229)))

(declare-fun res!436973 () Bool)

(assert (=> b!670209 (=> res!436973 e!383229)))

(assert (=> b!670209 (= res!436973 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!670210 () Bool)

(assert (=> b!670210 (= e!383231 e!383227)))

(declare-fun res!436988 () Bool)

(assert (=> b!670210 (=> res!436988 e!383227)))

(assert (=> b!670210 (= res!436988 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!670211 () Bool)

(declare-fun Unit!23548 () Unit!23545)

(assert (=> b!670211 (= e!383224 Unit!23548)))

(declare-fun b!670212 () Bool)

(assert (=> b!670212 (= e!383230 (not e!383228))))

(declare-fun res!436985 () Bool)

(assert (=> b!670212 (=> res!436985 e!383228)))

(assert (=> b!670212 (= res!436985 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (=> b!670212 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!311941)))

(declare-fun lt!311934 () Unit!23545)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39143 (_ BitVec 64) (_ BitVec 32) List!12805 List!12805) Unit!23545)

(assert (=> b!670212 (= lt!311934 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!311941))))

(declare-fun -!119 (List!12805 (_ BitVec 64)) List!12805)

(assert (=> b!670212 (= (-!119 lt!311941 k!2843) acc!681)))

(assert (=> b!670212 (= lt!311941 ($colon$colon!253 acc!681 k!2843))))

(declare-fun lt!311939 () Unit!23545)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12805) Unit!23545)

(assert (=> b!670212 (= lt!311939 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(assert (=> b!670212 (subseq!121 acc!681 acc!681)))

(declare-fun lt!311937 () Unit!23545)

(assert (=> b!670212 (= lt!311937 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!670212 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!311931 () Unit!23545)

(assert (=> b!670212 (= lt!311931 e!383225)))

(declare-fun c!76981 () Bool)

(assert (=> b!670212 (= c!76981 (validKeyInArray!0 (select (arr!18764 a!3626) from!3004)))))

(declare-fun lt!311932 () Unit!23545)

(assert (=> b!670212 (= lt!311932 e!383224)))

(declare-fun c!76982 () Bool)

(assert (=> b!670212 (= c!76982 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun lt!311940 () array!39143)

(assert (=> b!670212 (arrayContainsKey!0 lt!311940 k!2843 from!3004)))

(assert (=> b!670212 (= lt!311940 (array!39144 (store (arr!18764 a!3626) i!1382 k!2843) (size!19128 a!3626)))))

(declare-fun b!670213 () Bool)

(assert (=> b!670213 (= e!383228 true)))

(assert (=> b!670213 (arrayNoDuplicates!0 lt!311940 (bvadd #b00000000000000000000000000000001 from!3004) lt!311941)))

(declare-fun lt!311938 () Unit!23545)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39143 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12805) Unit!23545)

(assert (=> b!670213 (= lt!311938 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) lt!311941))))

(declare-fun b!670214 () Bool)

(declare-fun res!436974 () Bool)

(assert (=> b!670214 (=> (not res!436974) (not e!383230))))

(assert (=> b!670214 (= res!436974 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12802))))

(declare-fun b!670215 () Bool)

(assert (=> b!670215 (= e!383226 (contains!3382 acc!681 k!2843))))

(declare-fun b!670216 () Bool)

(declare-fun res!436971 () Bool)

(assert (=> b!670216 (=> res!436971 e!383228)))

(assert (=> b!670216 (= res!436971 (contains!3382 lt!311941 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!670199 () Bool)

(declare-fun res!436978 () Bool)

(assert (=> b!670199 (=> (not res!436978) (not e!383230))))

(assert (=> b!670199 (= res!436978 (not (contains!3382 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!436984 () Bool)

(assert (=> start!60096 (=> (not res!436984) (not e!383230))))

(assert (=> start!60096 (= res!436984 (and (bvslt (size!19128 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19128 a!3626))))))

(assert (=> start!60096 e!383230))

(assert (=> start!60096 true))

(declare-fun array_inv!14560 (array!39143) Bool)

(assert (=> start!60096 (array_inv!14560 a!3626)))

(declare-fun b!670217 () Bool)

(declare-fun res!436977 () Bool)

(assert (=> b!670217 (=> (not res!436977) (not e!383230))))

(assert (=> b!670217 (= res!436977 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!670218 () Bool)

(declare-fun Unit!23549 () Unit!23545)

(assert (=> b!670218 (= e!383225 Unit!23549)))

(declare-fun b!670219 () Bool)

(declare-fun res!436976 () Bool)

(assert (=> b!670219 (=> res!436976 e!383228)))

(assert (=> b!670219 (= res!436976 (contains!3382 lt!311941 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!670220 () Bool)

(declare-fun res!436967 () Bool)

(assert (=> b!670220 (=> res!436967 e!383228)))

(assert (=> b!670220 (= res!436967 (not (noDuplicate!629 lt!311941)))))

(assert (= (and start!60096 res!436984) b!670205))

(assert (= (and b!670205 res!436986) b!670208))

(assert (= (and b!670208 res!436982) b!670199))

(assert (= (and b!670199 res!436978) b!670202))

(assert (= (and b!670202 res!436970) b!670215))

(assert (= (and b!670202 (not res!436979)) b!670204))

(assert (= (and b!670204 res!436969) b!670196))

(assert (= (and b!670202 res!436968) b!670214))

(assert (= (and b!670214 res!436974) b!670217))

(assert (= (and b!670217 res!436977) b!670197))

(assert (= (and b!670197 res!436987) b!670195))

(assert (= (and b!670195 res!436975) b!670206))

(assert (= (and b!670206 res!436981) b!670198))

(assert (= (and b!670198 res!436972) b!670212))

(assert (= (and b!670212 c!76982) b!670207))

(assert (= (and b!670212 (not c!76982)) b!670211))

(assert (= (and b!670212 c!76981) b!670201))

(assert (= (and b!670212 (not c!76981)) b!670218))

(assert (= (and b!670212 (not res!436985)) b!670220))

(assert (= (and b!670220 (not res!436967)) b!670219))

(assert (= (and b!670219 (not res!436976)) b!670216))

(assert (= (and b!670216 (not res!436971)) b!670209))

(assert (= (and b!670209 (not res!436973)) b!670203))

(assert (= (and b!670209 res!436983) b!670210))

(assert (= (and b!670210 (not res!436988)) b!670200))

(assert (= (and b!670209 (not res!436980)) b!670213))

(declare-fun m!640125 () Bool)

(assert (=> b!670216 m!640125))

(declare-fun m!640127 () Bool)

(assert (=> b!670212 m!640127))

(declare-fun m!640129 () Bool)

(assert (=> b!670212 m!640129))

(declare-fun m!640131 () Bool)

(assert (=> b!670212 m!640131))

(declare-fun m!640133 () Bool)

(assert (=> b!670212 m!640133))

(declare-fun m!640135 () Bool)

(assert (=> b!670212 m!640135))

(declare-fun m!640137 () Bool)

(assert (=> b!670212 m!640137))

(declare-fun m!640139 () Bool)

(assert (=> b!670212 m!640139))

(declare-fun m!640141 () Bool)

(assert (=> b!670212 m!640141))

(declare-fun m!640143 () Bool)

(assert (=> b!670212 m!640143))

(declare-fun m!640145 () Bool)

(assert (=> b!670212 m!640145))

(declare-fun m!640147 () Bool)

(assert (=> b!670212 m!640147))

(declare-fun m!640149 () Bool)

(assert (=> b!670212 m!640149))

(assert (=> b!670212 m!640133))

(declare-fun m!640151 () Bool)

(assert (=> b!670212 m!640151))

(assert (=> b!670201 m!640131))

(assert (=> b!670201 m!640133))

(declare-fun m!640153 () Bool)

(assert (=> b!670201 m!640153))

(declare-fun m!640155 () Bool)

(assert (=> b!670201 m!640155))

(assert (=> b!670201 m!640133))

(assert (=> b!670201 m!640153))

(assert (=> b!670201 m!640141))

(assert (=> b!670201 m!640147))

(declare-fun m!640157 () Bool)

(assert (=> b!670205 m!640157))

(declare-fun m!640159 () Bool)

(assert (=> b!670196 m!640159))

(declare-fun m!640161 () Bool)

(assert (=> b!670219 m!640161))

(declare-fun m!640163 () Bool)

(assert (=> b!670200 m!640163))

(declare-fun m!640165 () Bool)

(assert (=> b!670213 m!640165))

(declare-fun m!640167 () Bool)

(assert (=> b!670213 m!640167))

(declare-fun m!640169 () Bool)

(assert (=> b!670206 m!640169))

(declare-fun m!640171 () Bool)

(assert (=> b!670220 m!640171))

(declare-fun m!640173 () Bool)

(assert (=> b!670208 m!640173))

(declare-fun m!640175 () Bool)

(assert (=> start!60096 m!640175))

(assert (=> b!670203 m!640163))

(declare-fun m!640177 () Bool)

(assert (=> b!670217 m!640177))

(assert (=> b!670215 m!640159))

(declare-fun m!640179 () Bool)

(assert (=> b!670207 m!640179))

(declare-fun m!640181 () Bool)

(assert (=> b!670199 m!640181))

(declare-fun m!640183 () Bool)

(assert (=> b!670195 m!640183))

(declare-fun m!640185 () Bool)

(assert (=> b!670214 m!640185))

(push 1)

(assert (not b!670219))

(assert (not b!670215))

(assert (not b!670200))

(assert (not b!670206))

(assert (not b!670220))

(assert (not b!670195))

