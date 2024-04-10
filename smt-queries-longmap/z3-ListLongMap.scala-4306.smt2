; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59866 () Bool)

(assert start!59866)

(declare-fun b!662042 () Bool)

(declare-fun res!430088 () Bool)

(declare-fun e!380163 () Bool)

(assert (=> b!662042 (=> res!430088 e!380163)))

(declare-datatypes ((List!12690 0))(
  ( (Nil!12687) (Cons!12686 (h!13731 (_ BitVec 64)) (t!18918 List!12690)) )
))
(declare-fun acc!681 () List!12690)

(declare-fun lt!308906 () List!12690)

(declare-fun subseq!6 (List!12690 List!12690) Bool)

(assert (=> b!662042 (= res!430088 (not (subseq!6 acc!681 lt!308906)))))

(declare-fun b!662043 () Bool)

(declare-fun e!380161 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3267 (List!12690 (_ BitVec 64)) Bool)

(assert (=> b!662043 (= e!380161 (contains!3267 acc!681 k0!2843))))

(declare-fun b!662044 () Bool)

(declare-fun res!430081 () Bool)

(assert (=> b!662044 (=> res!430081 e!380163)))

(assert (=> b!662044 (= res!430081 (contains!3267 lt!308906 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!662045 () Bool)

(declare-datatypes ((Unit!22990 0))(
  ( (Unit!22991) )
))
(declare-fun e!380164 () Unit!22990)

(declare-fun Unit!22992 () Unit!22990)

(assert (=> b!662045 (= e!380164 Unit!22992)))

(declare-fun lt!308904 () Unit!22990)

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((array!38913 0))(
  ( (array!38914 (arr!18649 (Array (_ BitVec 32) (_ BitVec 64))) (size!19013 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38913)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38913 (_ BitVec 64) (_ BitVec 32)) Unit!22990)

(assert (=> b!662045 (= lt!308904 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!662045 false))

(declare-fun res!430096 () Bool)

(declare-fun e!380165 () Bool)

(assert (=> start!59866 (=> (not res!430096) (not e!380165))))

(assert (=> start!59866 (= res!430096 (and (bvslt (size!19013 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19013 a!3626))))))

(assert (=> start!59866 e!380165))

(assert (=> start!59866 true))

(declare-fun array_inv!14445 (array!38913) Bool)

(assert (=> start!59866 (array_inv!14445 a!3626)))

(declare-fun b!662046 () Bool)

(declare-fun Unit!22993 () Unit!22990)

(assert (=> b!662046 (= e!380164 Unit!22993)))

(declare-fun b!662047 () Bool)

(declare-fun res!430079 () Bool)

(assert (=> b!662047 (=> (not res!430079) (not e!380165))))

(declare-fun noDuplicate!514 (List!12690) Bool)

(assert (=> b!662047 (= res!430079 (noDuplicate!514 acc!681))))

(declare-fun b!662048 () Bool)

(declare-fun e!380162 () Bool)

(declare-fun e!380159 () Bool)

(assert (=> b!662048 (= e!380162 e!380159)))

(declare-fun res!430089 () Bool)

(assert (=> b!662048 (=> (not res!430089) (not e!380159))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!662048 (= res!430089 (bvsle from!3004 i!1382))))

(declare-fun b!662049 () Bool)

(declare-fun res!430078 () Bool)

(assert (=> b!662049 (=> (not res!430078) (not e!380165))))

(declare-fun arrayContainsKey!0 (array!38913 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!662049 (= res!430078 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!662050 () Bool)

(declare-fun res!430093 () Bool)

(assert (=> b!662050 (=> (not res!430093) (not e!380165))))

(declare-fun arrayNoDuplicates!0 (array!38913 (_ BitVec 32) List!12690) Bool)

(assert (=> b!662050 (= res!430093 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!662051 () Bool)

(assert (=> b!662051 (= e!380159 (not (contains!3267 acc!681 k0!2843)))))

(declare-fun b!662052 () Bool)

(declare-fun res!430092 () Bool)

(assert (=> b!662052 (=> (not res!430092) (not e!380165))))

(assert (=> b!662052 (= res!430092 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12687))))

(declare-fun b!662053 () Bool)

(declare-fun res!430091 () Bool)

(assert (=> b!662053 (=> (not res!430091) (not e!380165))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!662053 (= res!430091 (validKeyInArray!0 k0!2843))))

(declare-fun b!662054 () Bool)

(declare-fun res!430085 () Bool)

(assert (=> b!662054 (=> (not res!430085) (not e!380165))))

(assert (=> b!662054 (= res!430085 e!380162)))

(declare-fun res!430090 () Bool)

(assert (=> b!662054 (=> res!430090 e!380162)))

(assert (=> b!662054 (= res!430090 e!380161)))

(declare-fun res!430082 () Bool)

(assert (=> b!662054 (=> (not res!430082) (not e!380161))))

(assert (=> b!662054 (= res!430082 (bvsgt from!3004 i!1382))))

(declare-fun b!662055 () Bool)

(declare-fun res!430087 () Bool)

(assert (=> b!662055 (=> res!430087 e!380163)))

(assert (=> b!662055 (= res!430087 (contains!3267 lt!308906 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!662056 () Bool)

(declare-fun res!430084 () Bool)

(assert (=> b!662056 (=> (not res!430084) (not e!380165))))

(assert (=> b!662056 (= res!430084 (not (contains!3267 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!662057 () Bool)

(assert (=> b!662057 (= e!380163 true)))

(declare-fun lt!308905 () Bool)

(assert (=> b!662057 (= lt!308905 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!308906))))

(declare-fun lt!308903 () Unit!22990)

(declare-fun noDuplicateSubseq!6 (List!12690 List!12690) Unit!22990)

(assert (=> b!662057 (= lt!308903 (noDuplicateSubseq!6 acc!681 lt!308906))))

(declare-fun b!662058 () Bool)

(declare-fun e!380166 () Bool)

(assert (=> b!662058 (= e!380166 e!380163)))

(declare-fun res!430080 () Bool)

(assert (=> b!662058 (=> res!430080 e!380163)))

(assert (=> b!662058 (= res!430080 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!138 (List!12690 (_ BitVec 64)) List!12690)

(assert (=> b!662058 (= lt!308906 ($colon$colon!138 acc!681 (select (arr!18649 a!3626) from!3004)))))

(assert (=> b!662058 (subseq!6 acc!681 acc!681)))

(declare-fun lt!308908 () Unit!22990)

(declare-fun lemmaListSubSeqRefl!0 (List!12690) Unit!22990)

(assert (=> b!662058 (= lt!308908 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!662059 () Bool)

(declare-fun res!430097 () Bool)

(assert (=> b!662059 (=> (not res!430097) (not e!380165))))

(assert (=> b!662059 (= res!430097 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19013 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!662060 () Bool)

(declare-fun res!430083 () Bool)

(assert (=> b!662060 (=> (not res!430083) (not e!380165))))

(assert (=> b!662060 (= res!430083 (not (contains!3267 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!662061 () Bool)

(declare-fun res!430095 () Bool)

(assert (=> b!662061 (=> (not res!430095) (not e!380165))))

(assert (=> b!662061 (= res!430095 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19013 a!3626))))))

(declare-fun b!662062 () Bool)

(assert (=> b!662062 (= e!380165 (not e!380166))))

(declare-fun res!430086 () Bool)

(assert (=> b!662062 (=> res!430086 e!380166)))

(assert (=> b!662062 (= res!430086 (not (validKeyInArray!0 (select (arr!18649 a!3626) from!3004))))))

(declare-fun lt!308907 () Unit!22990)

(assert (=> b!662062 (= lt!308907 e!380164)))

(declare-fun c!76349 () Bool)

(assert (=> b!662062 (= c!76349 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!662062 (arrayContainsKey!0 (array!38914 (store (arr!18649 a!3626) i!1382 k0!2843) (size!19013 a!3626)) k0!2843 from!3004)))

(declare-fun b!662063 () Bool)

(declare-fun res!430094 () Bool)

(assert (=> b!662063 (=> res!430094 e!380163)))

(assert (=> b!662063 (= res!430094 (not (noDuplicate!514 lt!308906)))))

(assert (= (and start!59866 res!430096) b!662047))

(assert (= (and b!662047 res!430079) b!662060))

(assert (= (and b!662060 res!430083) b!662056))

(assert (= (and b!662056 res!430084) b!662054))

(assert (= (and b!662054 res!430082) b!662043))

(assert (= (and b!662054 (not res!430090)) b!662048))

(assert (= (and b!662048 res!430089) b!662051))

(assert (= (and b!662054 res!430085) b!662052))

(assert (= (and b!662052 res!430092) b!662050))

(assert (= (and b!662050 res!430093) b!662061))

(assert (= (and b!662061 res!430095) b!662053))

(assert (= (and b!662053 res!430091) b!662049))

(assert (= (and b!662049 res!430078) b!662059))

(assert (= (and b!662059 res!430097) b!662062))

(assert (= (and b!662062 c!76349) b!662045))

(assert (= (and b!662062 (not c!76349)) b!662046))

(assert (= (and b!662062 (not res!430086)) b!662058))

(assert (= (and b!662058 (not res!430080)) b!662063))

(assert (= (and b!662063 (not res!430094)) b!662055))

(assert (= (and b!662055 (not res!430087)) b!662044))

(assert (= (and b!662044 (not res!430081)) b!662042))

(assert (= (and b!662042 (not res!430088)) b!662057))

(declare-fun m!633989 () Bool)

(assert (=> b!662044 m!633989))

(declare-fun m!633991 () Bool)

(assert (=> b!662063 m!633991))

(declare-fun m!633993 () Bool)

(assert (=> b!662062 m!633993))

(declare-fun m!633995 () Bool)

(assert (=> b!662062 m!633995))

(declare-fun m!633997 () Bool)

(assert (=> b!662062 m!633997))

(assert (=> b!662062 m!633993))

(declare-fun m!633999 () Bool)

(assert (=> b!662062 m!633999))

(declare-fun m!634001 () Bool)

(assert (=> b!662062 m!634001))

(assert (=> b!662058 m!633993))

(assert (=> b!662058 m!633993))

(declare-fun m!634003 () Bool)

(assert (=> b!662058 m!634003))

(declare-fun m!634005 () Bool)

(assert (=> b!662058 m!634005))

(declare-fun m!634007 () Bool)

(assert (=> b!662058 m!634007))

(declare-fun m!634009 () Bool)

(assert (=> b!662050 m!634009))

(declare-fun m!634011 () Bool)

(assert (=> start!59866 m!634011))

(declare-fun m!634013 () Bool)

(assert (=> b!662042 m!634013))

(declare-fun m!634015 () Bool)

(assert (=> b!662055 m!634015))

(declare-fun m!634017 () Bool)

(assert (=> b!662053 m!634017))

(declare-fun m!634019 () Bool)

(assert (=> b!662045 m!634019))

(declare-fun m!634021 () Bool)

(assert (=> b!662049 m!634021))

(declare-fun m!634023 () Bool)

(assert (=> b!662057 m!634023))

(declare-fun m!634025 () Bool)

(assert (=> b!662057 m!634025))

(declare-fun m!634027 () Bool)

(assert (=> b!662047 m!634027))

(declare-fun m!634029 () Bool)

(assert (=> b!662060 m!634029))

(declare-fun m!634031 () Bool)

(assert (=> b!662056 m!634031))

(declare-fun m!634033 () Bool)

(assert (=> b!662052 m!634033))

(declare-fun m!634035 () Bool)

(assert (=> b!662043 m!634035))

(assert (=> b!662051 m!634035))

(check-sat (not b!662050) (not b!662052) (not b!662045) (not b!662063) (not b!662060) (not b!662057) (not start!59866) (not b!662047) (not b!662062) (not b!662058) (not b!662043) (not b!662055) (not b!662042) (not b!662049) (not b!662056) (not b!662051) (not b!662044) (not b!662053))
(check-sat)
