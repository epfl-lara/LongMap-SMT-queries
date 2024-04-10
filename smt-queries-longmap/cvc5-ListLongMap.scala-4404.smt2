; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60644 () Bool)

(assert start!60644)

(declare-fun b!681061 () Bool)

(declare-fun e!388002 () Bool)

(declare-fun e!387998 () Bool)

(assert (=> b!681061 (= e!388002 e!387998)))

(declare-fun res!447259 () Bool)

(assert (=> b!681061 (=> res!447259 e!387998)))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!681061 (= res!447259 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-datatypes ((array!39511 0))(
  ( (array!39512 (arr!18942 (Array (_ BitVec 32) (_ BitVec 64))) (size!19306 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39511)

(declare-datatypes ((List!12983 0))(
  ( (Nil!12980) (Cons!12979 (h!14024 (_ BitVec 64)) (t!19217 List!12983)) )
))
(declare-fun lt!313206 () List!12983)

(declare-fun acc!681 () List!12983)

(declare-fun $colon$colon!311 (List!12983 (_ BitVec 64)) List!12983)

(assert (=> b!681061 (= lt!313206 ($colon$colon!311 acc!681 (select (arr!18942 a!3626) from!3004)))))

(declare-fun subseq!146 (List!12983 List!12983) Bool)

(assert (=> b!681061 (subseq!146 acc!681 acc!681)))

(declare-datatypes ((Unit!23886 0))(
  ( (Unit!23887) )
))
(declare-fun lt!313209 () Unit!23886)

(declare-fun lemmaListSubSeqRefl!0 (List!12983) Unit!23886)

(assert (=> b!681061 (= lt!313209 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!681062 () Bool)

(declare-fun e!387999 () Bool)

(assert (=> b!681062 (= e!387999 (not e!388002))))

(declare-fun res!447244 () Bool)

(assert (=> b!681062 (=> res!447244 e!388002)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!681062 (= res!447244 (not (validKeyInArray!0 (select (arr!18942 a!3626) from!3004))))))

(declare-fun lt!313208 () Unit!23886)

(declare-fun e!388004 () Unit!23886)

(assert (=> b!681062 (= lt!313208 e!388004)))

(declare-fun c!77276 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39511 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!681062 (= c!77276 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!681062 (arrayContainsKey!0 (array!39512 (store (arr!18942 a!3626) i!1382 k!2843) (size!19306 a!3626)) k!2843 from!3004)))

(declare-fun b!681063 () Bool)

(declare-fun res!447254 () Bool)

(assert (=> b!681063 (=> res!447254 e!387998)))

(declare-fun contains!3560 (List!12983 (_ BitVec 64)) Bool)

(assert (=> b!681063 (= res!447254 (contains!3560 lt!313206 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!681064 () Bool)

(declare-fun res!447250 () Bool)

(assert (=> b!681064 (=> (not res!447250) (not e!387999))))

(assert (=> b!681064 (= res!447250 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!681065 () Bool)

(declare-fun res!447253 () Bool)

(assert (=> b!681065 (=> (not res!447253) (not e!387999))))

(assert (=> b!681065 (= res!447253 (not (contains!3560 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!681066 () Bool)

(declare-fun res!447249 () Bool)

(assert (=> b!681066 (=> (not res!447249) (not e!387999))))

(assert (=> b!681066 (= res!447249 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19306 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!681067 () Bool)

(declare-fun res!447252 () Bool)

(assert (=> b!681067 (=> res!447252 e!387998)))

(declare-fun noDuplicate!807 (List!12983) Bool)

(assert (=> b!681067 (= res!447252 (not (noDuplicate!807 lt!313206)))))

(declare-fun b!681068 () Bool)

(declare-fun res!447260 () Bool)

(assert (=> b!681068 (=> (not res!447260) (not e!387999))))

(assert (=> b!681068 (= res!447260 (validKeyInArray!0 k!2843))))

(declare-fun b!681069 () Bool)

(assert (=> b!681069 (= e!387998 true)))

(declare-fun lt!313207 () Bool)

(assert (=> b!681069 (= lt!313207 (contains!3560 lt!313206 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!681071 () Bool)

(declare-fun res!447248 () Bool)

(assert (=> b!681071 (=> (not res!447248) (not e!387999))))

(declare-fun arrayNoDuplicates!0 (array!39511 (_ BitVec 32) List!12983) Bool)

(assert (=> b!681071 (= res!447248 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12980))))

(declare-fun b!681072 () Bool)

(declare-fun e!388000 () Bool)

(assert (=> b!681072 (= e!388000 (not (contains!3560 acc!681 k!2843)))))

(declare-fun b!681073 () Bool)

(declare-fun e!388005 () Bool)

(assert (=> b!681073 (= e!388005 (contains!3560 acc!681 k!2843))))

(declare-fun b!681074 () Bool)

(declare-fun res!447251 () Bool)

(assert (=> b!681074 (=> (not res!447251) (not e!387999))))

(assert (=> b!681074 (= res!447251 (noDuplicate!807 acc!681))))

(declare-fun b!681075 () Bool)

(declare-fun res!447258 () Bool)

(assert (=> b!681075 (=> (not res!447258) (not e!387999))))

(assert (=> b!681075 (= res!447258 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19306 a!3626))))))

(declare-fun b!681076 () Bool)

(declare-fun res!447243 () Bool)

(assert (=> b!681076 (=> (not res!447243) (not e!387999))))

(declare-fun e!388003 () Bool)

(assert (=> b!681076 (= res!447243 e!388003)))

(declare-fun res!447255 () Bool)

(assert (=> b!681076 (=> res!447255 e!388003)))

(assert (=> b!681076 (= res!447255 e!388005)))

(declare-fun res!447256 () Bool)

(assert (=> b!681076 (=> (not res!447256) (not e!388005))))

(assert (=> b!681076 (= res!447256 (bvsgt from!3004 i!1382))))

(declare-fun b!681077 () Bool)

(declare-fun res!447245 () Bool)

(assert (=> b!681077 (=> (not res!447245) (not e!387999))))

(assert (=> b!681077 (= res!447245 (not (contains!3560 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!681078 () Bool)

(assert (=> b!681078 (= e!388003 e!388000)))

(declare-fun res!447257 () Bool)

(assert (=> b!681078 (=> (not res!447257) (not e!388000))))

(assert (=> b!681078 (= res!447257 (bvsle from!3004 i!1382))))

(declare-fun b!681079 () Bool)

(declare-fun res!447246 () Bool)

(assert (=> b!681079 (=> (not res!447246) (not e!387999))))

(assert (=> b!681079 (= res!447246 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!681080 () Bool)

(declare-fun Unit!23888 () Unit!23886)

(assert (=> b!681080 (= e!388004 Unit!23888)))

(declare-fun lt!313210 () Unit!23886)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39511 (_ BitVec 64) (_ BitVec 32)) Unit!23886)

(assert (=> b!681080 (= lt!313210 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!681080 false))

(declare-fun b!681070 () Bool)

(declare-fun Unit!23889 () Unit!23886)

(assert (=> b!681070 (= e!388004 Unit!23889)))

(declare-fun res!447247 () Bool)

(assert (=> start!60644 (=> (not res!447247) (not e!387999))))

(assert (=> start!60644 (= res!447247 (and (bvslt (size!19306 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19306 a!3626))))))

(assert (=> start!60644 e!387999))

(assert (=> start!60644 true))

(declare-fun array_inv!14738 (array!39511) Bool)

(assert (=> start!60644 (array_inv!14738 a!3626)))

(assert (= (and start!60644 res!447247) b!681074))

(assert (= (and b!681074 res!447251) b!681065))

(assert (= (and b!681065 res!447253) b!681077))

(assert (= (and b!681077 res!447245) b!681076))

(assert (= (and b!681076 res!447256) b!681073))

(assert (= (and b!681076 (not res!447255)) b!681078))

(assert (= (and b!681078 res!447257) b!681072))

(assert (= (and b!681076 res!447243) b!681071))

(assert (= (and b!681071 res!447248) b!681079))

(assert (= (and b!681079 res!447246) b!681075))

(assert (= (and b!681075 res!447258) b!681068))

(assert (= (and b!681068 res!447260) b!681064))

(assert (= (and b!681064 res!447250) b!681066))

(assert (= (and b!681066 res!447249) b!681062))

(assert (= (and b!681062 c!77276) b!681080))

(assert (= (and b!681062 (not c!77276)) b!681070))

(assert (= (and b!681062 (not res!447244)) b!681061))

(assert (= (and b!681061 (not res!447259)) b!681067))

(assert (= (and b!681067 (not res!447252)) b!681063))

(assert (= (and b!681063 (not res!447254)) b!681069))

(declare-fun m!646007 () Bool)

(assert (=> b!681072 m!646007))

(declare-fun m!646009 () Bool)

(assert (=> b!681080 m!646009))

(declare-fun m!646011 () Bool)

(assert (=> b!681071 m!646011))

(declare-fun m!646013 () Bool)

(assert (=> b!681074 m!646013))

(declare-fun m!646015 () Bool)

(assert (=> b!681063 m!646015))

(declare-fun m!646017 () Bool)

(assert (=> b!681079 m!646017))

(declare-fun m!646019 () Bool)

(assert (=> b!681067 m!646019))

(declare-fun m!646021 () Bool)

(assert (=> b!681077 m!646021))

(declare-fun m!646023 () Bool)

(assert (=> b!681069 m!646023))

(declare-fun m!646025 () Bool)

(assert (=> b!681062 m!646025))

(declare-fun m!646027 () Bool)

(assert (=> b!681062 m!646027))

(declare-fun m!646029 () Bool)

(assert (=> b!681062 m!646029))

(assert (=> b!681062 m!646025))

(declare-fun m!646031 () Bool)

(assert (=> b!681062 m!646031))

(declare-fun m!646033 () Bool)

(assert (=> b!681062 m!646033))

(assert (=> b!681061 m!646025))

(assert (=> b!681061 m!646025))

(declare-fun m!646035 () Bool)

(assert (=> b!681061 m!646035))

(declare-fun m!646037 () Bool)

(assert (=> b!681061 m!646037))

(declare-fun m!646039 () Bool)

(assert (=> b!681061 m!646039))

(declare-fun m!646041 () Bool)

(assert (=> b!681064 m!646041))

(declare-fun m!646043 () Bool)

(assert (=> b!681068 m!646043))

(declare-fun m!646045 () Bool)

(assert (=> b!681065 m!646045))

(assert (=> b!681073 m!646007))

(declare-fun m!646047 () Bool)

(assert (=> start!60644 m!646047))

(push 1)

