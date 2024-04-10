; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60646 () Bool)

(assert start!60646)

(declare-fun b!681121 () Bool)

(declare-datatypes ((Unit!23890 0))(
  ( (Unit!23891) )
))
(declare-fun e!388028 () Unit!23890)

(declare-fun Unit!23892 () Unit!23890)

(assert (=> b!681121 (= e!388028 Unit!23892)))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun lt!313224 () Unit!23890)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-datatypes ((array!39513 0))(
  ( (array!39514 (arr!18943 (Array (_ BitVec 32) (_ BitVec 64))) (size!19307 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39513)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39513 (_ BitVec 64) (_ BitVec 32)) Unit!23890)

(assert (=> b!681121 (= lt!313224 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!681121 false))

(declare-fun b!681122 () Bool)

(declare-fun res!447312 () Bool)

(declare-fun e!388023 () Bool)

(assert (=> b!681122 (=> (not res!447312) (not e!388023))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!681122 (= res!447312 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19307 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!681123 () Bool)

(declare-fun res!447310 () Bool)

(assert (=> b!681123 (=> (not res!447310) (not e!388023))))

(declare-datatypes ((List!12984 0))(
  ( (Nil!12981) (Cons!12980 (h!14025 (_ BitVec 64)) (t!19218 List!12984)) )
))
(declare-fun acc!681 () List!12984)

(declare-fun contains!3561 (List!12984 (_ BitVec 64)) Bool)

(assert (=> b!681123 (= res!447310 (not (contains!3561 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!681124 () Bool)

(declare-fun res!447298 () Bool)

(assert (=> b!681124 (=> (not res!447298) (not e!388023))))

(declare-fun arrayNoDuplicates!0 (array!39513 (_ BitVec 32) List!12984) Bool)

(assert (=> b!681124 (= res!447298 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12981))))

(declare-fun b!681126 () Bool)

(declare-fun e!388029 () Bool)

(assert (=> b!681126 (= e!388023 (not e!388029))))

(declare-fun res!447311 () Bool)

(assert (=> b!681126 (=> res!447311 e!388029)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!681126 (= res!447311 (not (validKeyInArray!0 (select (arr!18943 a!3626) from!3004))))))

(declare-fun lt!313221 () Unit!23890)

(assert (=> b!681126 (= lt!313221 e!388028)))

(declare-fun c!77279 () Bool)

(declare-fun arrayContainsKey!0 (array!39513 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!681126 (= c!77279 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!681126 (arrayContainsKey!0 (array!39514 (store (arr!18943 a!3626) i!1382 k0!2843) (size!19307 a!3626)) k0!2843 from!3004)))

(declare-fun b!681127 () Bool)

(declare-fun e!388027 () Bool)

(assert (=> b!681127 (= e!388029 e!388027)))

(declare-fun res!447307 () Bool)

(assert (=> b!681127 (=> res!447307 e!388027)))

(assert (=> b!681127 (= res!447307 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun lt!313222 () List!12984)

(declare-fun $colon$colon!312 (List!12984 (_ BitVec 64)) List!12984)

(assert (=> b!681127 (= lt!313222 ($colon$colon!312 acc!681 (select (arr!18943 a!3626) from!3004)))))

(declare-fun subseq!147 (List!12984 List!12984) Bool)

(assert (=> b!681127 (subseq!147 acc!681 acc!681)))

(declare-fun lt!313225 () Unit!23890)

(declare-fun lemmaListSubSeqRefl!0 (List!12984) Unit!23890)

(assert (=> b!681127 (= lt!313225 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!681128 () Bool)

(declare-fun e!388025 () Bool)

(declare-fun e!388026 () Bool)

(assert (=> b!681128 (= e!388025 e!388026)))

(declare-fun res!447308 () Bool)

(assert (=> b!681128 (=> (not res!447308) (not e!388026))))

(assert (=> b!681128 (= res!447308 (bvsle from!3004 i!1382))))

(declare-fun b!681129 () Bool)

(assert (=> b!681129 (= e!388027 true)))

(declare-fun lt!313223 () Bool)

(assert (=> b!681129 (= lt!313223 (contains!3561 lt!313222 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!681130 () Bool)

(declare-fun res!447314 () Bool)

(assert (=> b!681130 (=> (not res!447314) (not e!388023))))

(declare-fun noDuplicate!808 (List!12984) Bool)

(assert (=> b!681130 (= res!447314 (noDuplicate!808 acc!681))))

(declare-fun b!681131 () Bool)

(declare-fun res!447306 () Bool)

(assert (=> b!681131 (=> (not res!447306) (not e!388023))))

(assert (=> b!681131 (= res!447306 (not (contains!3561 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!681132 () Bool)

(declare-fun e!388024 () Bool)

(assert (=> b!681132 (= e!388024 (contains!3561 acc!681 k0!2843))))

(declare-fun b!681133 () Bool)

(declare-fun res!447299 () Bool)

(assert (=> b!681133 (=> (not res!447299) (not e!388023))))

(assert (=> b!681133 (= res!447299 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!681134 () Bool)

(declare-fun res!447303 () Bool)

(assert (=> b!681134 (=> res!447303 e!388027)))

(assert (=> b!681134 (= res!447303 (not (noDuplicate!808 lt!313222)))))

(declare-fun b!681135 () Bool)

(declare-fun Unit!23893 () Unit!23890)

(assert (=> b!681135 (= e!388028 Unit!23893)))

(declare-fun b!681136 () Bool)

(declare-fun res!447313 () Bool)

(assert (=> b!681136 (=> (not res!447313) (not e!388023))))

(assert (=> b!681136 (= res!447313 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19307 a!3626))))))

(declare-fun b!681125 () Bool)

(declare-fun res!447304 () Bool)

(assert (=> b!681125 (=> (not res!447304) (not e!388023))))

(assert (=> b!681125 (= res!447304 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun res!447305 () Bool)

(assert (=> start!60646 (=> (not res!447305) (not e!388023))))

(assert (=> start!60646 (= res!447305 (and (bvslt (size!19307 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19307 a!3626))))))

(assert (=> start!60646 e!388023))

(assert (=> start!60646 true))

(declare-fun array_inv!14739 (array!39513) Bool)

(assert (=> start!60646 (array_inv!14739 a!3626)))

(declare-fun b!681137 () Bool)

(declare-fun res!447297 () Bool)

(assert (=> b!681137 (=> (not res!447297) (not e!388023))))

(assert (=> b!681137 (= res!447297 e!388025)))

(declare-fun res!447309 () Bool)

(assert (=> b!681137 (=> res!447309 e!388025)))

(assert (=> b!681137 (= res!447309 e!388024)))

(declare-fun res!447302 () Bool)

(assert (=> b!681137 (=> (not res!447302) (not e!388024))))

(assert (=> b!681137 (= res!447302 (bvsgt from!3004 i!1382))))

(declare-fun b!681138 () Bool)

(assert (=> b!681138 (= e!388026 (not (contains!3561 acc!681 k0!2843)))))

(declare-fun b!681139 () Bool)

(declare-fun res!447300 () Bool)

(assert (=> b!681139 (=> (not res!447300) (not e!388023))))

(assert (=> b!681139 (= res!447300 (validKeyInArray!0 k0!2843))))

(declare-fun b!681140 () Bool)

(declare-fun res!447301 () Bool)

(assert (=> b!681140 (=> res!447301 e!388027)))

(assert (=> b!681140 (= res!447301 (contains!3561 lt!313222 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!60646 res!447305) b!681130))

(assert (= (and b!681130 res!447314) b!681131))

(assert (= (and b!681131 res!447306) b!681123))

(assert (= (and b!681123 res!447310) b!681137))

(assert (= (and b!681137 res!447302) b!681132))

(assert (= (and b!681137 (not res!447309)) b!681128))

(assert (= (and b!681128 res!447308) b!681138))

(assert (= (and b!681137 res!447297) b!681124))

(assert (= (and b!681124 res!447298) b!681133))

(assert (= (and b!681133 res!447299) b!681136))

(assert (= (and b!681136 res!447313) b!681139))

(assert (= (and b!681139 res!447300) b!681125))

(assert (= (and b!681125 res!447304) b!681122))

(assert (= (and b!681122 res!447312) b!681126))

(assert (= (and b!681126 c!77279) b!681121))

(assert (= (and b!681126 (not c!77279)) b!681135))

(assert (= (and b!681126 (not res!447311)) b!681127))

(assert (= (and b!681127 (not res!447307)) b!681134))

(assert (= (and b!681134 (not res!447303)) b!681140))

(assert (= (and b!681140 (not res!447301)) b!681129))

(declare-fun m!646049 () Bool)

(assert (=> b!681121 m!646049))

(declare-fun m!646051 () Bool)

(assert (=> b!681124 m!646051))

(declare-fun m!646053 () Bool)

(assert (=> b!681133 m!646053))

(declare-fun m!646055 () Bool)

(assert (=> b!681130 m!646055))

(declare-fun m!646057 () Bool)

(assert (=> b!681129 m!646057))

(declare-fun m!646059 () Bool)

(assert (=> b!681127 m!646059))

(assert (=> b!681127 m!646059))

(declare-fun m!646061 () Bool)

(assert (=> b!681127 m!646061))

(declare-fun m!646063 () Bool)

(assert (=> b!681127 m!646063))

(declare-fun m!646065 () Bool)

(assert (=> b!681127 m!646065))

(declare-fun m!646067 () Bool)

(assert (=> b!681140 m!646067))

(declare-fun m!646069 () Bool)

(assert (=> b!681132 m!646069))

(declare-fun m!646071 () Bool)

(assert (=> b!681123 m!646071))

(declare-fun m!646073 () Bool)

(assert (=> b!681131 m!646073))

(assert (=> b!681138 m!646069))

(declare-fun m!646075 () Bool)

(assert (=> b!681125 m!646075))

(declare-fun m!646077 () Bool)

(assert (=> b!681139 m!646077))

(declare-fun m!646079 () Bool)

(assert (=> start!60646 m!646079))

(assert (=> b!681126 m!646059))

(declare-fun m!646081 () Bool)

(assert (=> b!681126 m!646081))

(declare-fun m!646083 () Bool)

(assert (=> b!681126 m!646083))

(assert (=> b!681126 m!646059))

(declare-fun m!646085 () Bool)

(assert (=> b!681126 m!646085))

(declare-fun m!646087 () Bool)

(assert (=> b!681126 m!646087))

(declare-fun m!646089 () Bool)

(assert (=> b!681134 m!646089))

(check-sat (not b!681126) (not b!681130) (not b!681121) (not b!681139) (not b!681129) (not b!681132) (not b!681133) (not b!681127) (not start!60646) (not b!681140) (not b!681134) (not b!681131) (not b!681123) (not b!681138) (not b!681125) (not b!681124))
(check-sat)
