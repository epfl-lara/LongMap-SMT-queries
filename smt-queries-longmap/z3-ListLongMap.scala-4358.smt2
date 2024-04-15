; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60164 () Bool)

(assert start!60164)

(declare-fun b!672200 () Bool)

(declare-fun res!438988 () Bool)

(declare-fun e!383979 () Bool)

(assert (=> b!672200 (=> (not res!438988) (not e!383979))))

(declare-datatypes ((List!12883 0))(
  ( (Nil!12880) (Cons!12879 (h!13924 (_ BitVec 64)) (t!19102 List!12883)) )
))
(declare-fun acc!681 () List!12883)

(declare-fun contains!3405 (List!12883 (_ BitVec 64)) Bool)

(assert (=> b!672200 (= res!438988 (not (contains!3405 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!672201 () Bool)

(declare-fun e!383984 () Bool)

(declare-fun lt!312066 () List!12883)

(declare-fun k0!2843 () (_ BitVec 64))

(assert (=> b!672201 (= e!383984 (not (contains!3405 lt!312066 k0!2843)))))

(declare-fun b!672202 () Bool)

(declare-fun e!383982 () Bool)

(declare-fun e!383978 () Bool)

(assert (=> b!672202 (= e!383982 e!383978)))

(declare-fun res!438995 () Bool)

(assert (=> b!672202 (=> (not res!438995) (not e!383978))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!672202 (= res!438995 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-datatypes ((array!39222 0))(
  ( (array!39223 (arr!18803 (Array (_ BitVec 32) (_ BitVec 64))) (size!19168 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39222)

(declare-fun $colon$colon!271 (List!12883 (_ BitVec 64)) List!12883)

(assert (=> b!672202 (= lt!312066 ($colon$colon!271 acc!681 (select (arr!18803 a!3626) from!3004)))))

(declare-fun b!672203 () Bool)

(declare-fun res!438983 () Bool)

(assert (=> b!672203 (=> (not res!438983) (not e!383978))))

(declare-fun noDuplicate!674 (List!12883) Bool)

(assert (=> b!672203 (= res!438983 (noDuplicate!674 lt!312066))))

(declare-fun b!672204 () Bool)

(declare-fun res!438997 () Bool)

(assert (=> b!672204 (=> (not res!438997) (not e!383979))))

(declare-fun arrayNoDuplicates!0 (array!39222 (_ BitVec 32) List!12883) Bool)

(assert (=> b!672204 (= res!438997 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12880))))

(declare-fun b!672205 () Bool)

(declare-fun res!438993 () Bool)

(assert (=> b!672205 (=> (not res!438993) (not e!383979))))

(assert (=> b!672205 (= res!438993 (not (contains!3405 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!672206 () Bool)

(declare-fun res!438999 () Bool)

(assert (=> b!672206 (=> (not res!438999) (not e!383979))))

(assert (=> b!672206 (= res!438999 (noDuplicate!674 acc!681))))

(declare-fun b!672207 () Bool)

(declare-fun res!438998 () Bool)

(assert (=> b!672207 (=> (not res!438998) (not e!383978))))

(declare-fun e!383980 () Bool)

(assert (=> b!672207 (= res!438998 e!383980)))

(declare-fun res!438986 () Bool)

(assert (=> b!672207 (=> res!438986 e!383980)))

(declare-fun e!383976 () Bool)

(assert (=> b!672207 (= res!438986 e!383976)))

(declare-fun res!439002 () Bool)

(assert (=> b!672207 (=> (not res!439002) (not e!383976))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!672207 (= res!439002 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!672208 () Bool)

(declare-fun res!438980 () Bool)

(assert (=> b!672208 (=> (not res!438980) (not e!383979))))

(declare-fun arrayContainsKey!0 (array!39222 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!672208 (= res!438980 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!672209 () Bool)

(assert (=> b!672209 (= e!383979 e!383982)))

(declare-fun res!438982 () Bool)

(assert (=> b!672209 (=> (not res!438982) (not e!383982))))

(assert (=> b!672209 (= res!438982 (not (= (select (arr!18803 a!3626) from!3004) k0!2843)))))

(declare-datatypes ((Unit!23606 0))(
  ( (Unit!23607) )
))
(declare-fun lt!312065 () Unit!23606)

(declare-fun e!383981 () Unit!23606)

(assert (=> b!672209 (= lt!312065 e!383981)))

(declare-fun c!76977 () Bool)

(assert (=> b!672209 (= c!76977 (= (select (arr!18803 a!3626) from!3004) k0!2843))))

(declare-fun b!672210 () Bool)

(declare-fun res!438992 () Bool)

(assert (=> b!672210 (=> (not res!438992) (not e!383979))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!672210 (= res!438992 (validKeyInArray!0 (select (arr!18803 a!3626) from!3004)))))

(declare-fun b!672211 () Bool)

(declare-fun res!438990 () Bool)

(assert (=> b!672211 (=> (not res!438990) (not e!383978))))

(assert (=> b!672211 (= res!438990 (not (contains!3405 lt!312066 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!672212 () Bool)

(declare-fun res!438989 () Bool)

(assert (=> b!672212 (=> (not res!438989) (not e!383979))))

(assert (=> b!672212 (= res!438989 (validKeyInArray!0 k0!2843))))

(declare-fun b!672213 () Bool)

(declare-fun Unit!23608 () Unit!23606)

(assert (=> b!672213 (= e!383981 Unit!23608)))

(declare-fun b!672214 () Bool)

(assert (=> b!672214 (= e!383976 (contains!3405 lt!312066 k0!2843))))

(declare-fun b!672215 () Bool)

(declare-fun Unit!23609 () Unit!23606)

(assert (=> b!672215 (= e!383981 Unit!23609)))

(assert (=> b!672215 (arrayContainsKey!0 a!3626 k0!2843 from!3004)))

(declare-fun lt!312064 () Unit!23606)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39222 (_ BitVec 64) (_ BitVec 32)) Unit!23606)

(assert (=> b!672215 (= lt!312064 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!672215 false))

(declare-fun b!672216 () Bool)

(declare-fun e!383977 () Bool)

(declare-fun e!383983 () Bool)

(assert (=> b!672216 (= e!383977 e!383983)))

(declare-fun res!439000 () Bool)

(assert (=> b!672216 (=> (not res!439000) (not e!383983))))

(assert (=> b!672216 (= res!439000 (bvsle from!3004 i!1382))))

(declare-fun b!672217 () Bool)

(assert (=> b!672217 (= e!383983 (not (contains!3405 acc!681 k0!2843)))))

(declare-fun b!672218 () Bool)

(assert (=> b!672218 (= e!383980 e!383984)))

(declare-fun res!438984 () Bool)

(assert (=> b!672218 (=> (not res!438984) (not e!383984))))

(assert (=> b!672218 (= res!438984 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!672219 () Bool)

(declare-fun res!438987 () Bool)

(assert (=> b!672219 (=> (not res!438987) (not e!383978))))

(assert (=> b!672219 (= res!438987 (not (contains!3405 lt!312066 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!672220 () Bool)

(declare-fun res!439001 () Bool)

(assert (=> b!672220 (=> (not res!439001) (not e!383979))))

(assert (=> b!672220 (= res!439001 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!672221 () Bool)

(declare-fun res!438996 () Bool)

(assert (=> b!672221 (=> (not res!438996) (not e!383979))))

(assert (=> b!672221 (= res!438996 e!383977)))

(declare-fun res!438991 () Bool)

(assert (=> b!672221 (=> res!438991 e!383977)))

(declare-fun e!383975 () Bool)

(assert (=> b!672221 (= res!438991 e!383975)))

(declare-fun res!438994 () Bool)

(assert (=> b!672221 (=> (not res!438994) (not e!383975))))

(assert (=> b!672221 (= res!438994 (bvsgt from!3004 i!1382))))

(declare-fun b!672222 () Bool)

(declare-fun res!438985 () Bool)

(assert (=> b!672222 (=> (not res!438985) (not e!383979))))

(assert (=> b!672222 (= res!438985 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19168 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!672223 () Bool)

(assert (=> b!672223 (= e!383978 false)))

(declare-fun lt!312063 () Bool)

(assert (=> b!672223 (= lt!312063 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!312066))))

(declare-fun res!438981 () Bool)

(assert (=> start!60164 (=> (not res!438981) (not e!383979))))

(assert (=> start!60164 (= res!438981 (and (bvslt (size!19168 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19168 a!3626))))))

(assert (=> start!60164 e!383979))

(assert (=> start!60164 true))

(declare-fun array_inv!14686 (array!39222) Bool)

(assert (=> start!60164 (array_inv!14686 a!3626)))

(declare-fun b!672224 () Bool)

(declare-fun res!439003 () Bool)

(assert (=> b!672224 (=> (not res!439003) (not e!383979))))

(assert (=> b!672224 (= res!439003 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19168 a!3626))))))

(declare-fun b!672225 () Bool)

(assert (=> b!672225 (= e!383975 (contains!3405 acc!681 k0!2843))))

(assert (= (and start!60164 res!438981) b!672206))

(assert (= (and b!672206 res!438999) b!672200))

(assert (= (and b!672200 res!438988) b!672205))

(assert (= (and b!672205 res!438993) b!672221))

(assert (= (and b!672221 res!438994) b!672225))

(assert (= (and b!672221 (not res!438991)) b!672216))

(assert (= (and b!672216 res!439000) b!672217))

(assert (= (and b!672221 res!438996) b!672204))

(assert (= (and b!672204 res!438997) b!672220))

(assert (= (and b!672220 res!439001) b!672224))

(assert (= (and b!672224 res!439003) b!672212))

(assert (= (and b!672212 res!438989) b!672208))

(assert (= (and b!672208 res!438980) b!672222))

(assert (= (and b!672222 res!438985) b!672210))

(assert (= (and b!672210 res!438992) b!672209))

(assert (= (and b!672209 c!76977) b!672215))

(assert (= (and b!672209 (not c!76977)) b!672213))

(assert (= (and b!672209 res!438982) b!672202))

(assert (= (and b!672202 res!438995) b!672203))

(assert (= (and b!672203 res!438983) b!672211))

(assert (= (and b!672211 res!438990) b!672219))

(assert (= (and b!672219 res!438987) b!672207))

(assert (= (and b!672207 res!439002) b!672214))

(assert (= (and b!672207 (not res!438986)) b!672218))

(assert (= (and b!672218 res!438984) b!672201))

(assert (= (and b!672207 res!438998) b!672223))

(declare-fun m!640647 () Bool)

(assert (=> b!672204 m!640647))

(declare-fun m!640649 () Bool)

(assert (=> b!672219 m!640649))

(declare-fun m!640651 () Bool)

(assert (=> b!672212 m!640651))

(declare-fun m!640653 () Bool)

(assert (=> b!672209 m!640653))

(declare-fun m!640655 () Bool)

(assert (=> b!672208 m!640655))

(declare-fun m!640657 () Bool)

(assert (=> b!672220 m!640657))

(declare-fun m!640659 () Bool)

(assert (=> b!672214 m!640659))

(declare-fun m!640661 () Bool)

(assert (=> b!672225 m!640661))

(assert (=> b!672210 m!640653))

(assert (=> b!672210 m!640653))

(declare-fun m!640663 () Bool)

(assert (=> b!672210 m!640663))

(declare-fun m!640665 () Bool)

(assert (=> b!672215 m!640665))

(declare-fun m!640667 () Bool)

(assert (=> b!672215 m!640667))

(declare-fun m!640669 () Bool)

(assert (=> b!672200 m!640669))

(declare-fun m!640671 () Bool)

(assert (=> b!672211 m!640671))

(declare-fun m!640673 () Bool)

(assert (=> b!672223 m!640673))

(declare-fun m!640675 () Bool)

(assert (=> start!60164 m!640675))

(declare-fun m!640677 () Bool)

(assert (=> b!672206 m!640677))

(assert (=> b!672201 m!640659))

(assert (=> b!672202 m!640653))

(assert (=> b!672202 m!640653))

(declare-fun m!640679 () Bool)

(assert (=> b!672202 m!640679))

(assert (=> b!672217 m!640661))

(declare-fun m!640681 () Bool)

(assert (=> b!672205 m!640681))

(declare-fun m!640683 () Bool)

(assert (=> b!672203 m!640683))

(check-sat (not b!672206) (not b!672208) (not b!672212) (not b!672217) (not b!672225) (not b!672205) (not b!672214) (not b!672201) (not b!672219) (not b!672202) (not b!672215) (not b!672204) (not b!672223) (not b!672211) (not b!672203) (not start!60164) (not b!672220) (not b!672210) (not b!672200))
(check-sat)
