; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59896 () Bool)

(assert start!59896)

(declare-fun b!663032 () Bool)

(declare-fun res!430996 () Bool)

(declare-fun e!380520 () Bool)

(assert (=> b!663032 (=> (not res!430996) (not e!380520))))

(declare-datatypes ((array!38943 0))(
  ( (array!38944 (arr!18664 (Array (_ BitVec 32) (_ BitVec 64))) (size!19028 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38943)

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((List!12705 0))(
  ( (Nil!12702) (Cons!12701 (h!13746 (_ BitVec 64)) (t!18933 List!12705)) )
))
(declare-fun acc!681 () List!12705)

(declare-fun arrayNoDuplicates!0 (array!38943 (_ BitVec 32) List!12705) Bool)

(assert (=> b!663032 (= res!430996 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun res!430988 () Bool)

(assert (=> start!59896 (=> (not res!430988) (not e!380520))))

(assert (=> start!59896 (= res!430988 (and (bvslt (size!19028 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19028 a!3626))))))

(assert (=> start!59896 e!380520))

(assert (=> start!59896 true))

(declare-fun array_inv!14460 (array!38943) Bool)

(assert (=> start!59896 (array_inv!14460 a!3626)))

(declare-fun b!663033 () Bool)

(declare-datatypes ((Unit!23050 0))(
  ( (Unit!23051) )
))
(declare-fun e!380523 () Unit!23050)

(declare-fun Unit!23052 () Unit!23050)

(assert (=> b!663033 (= e!380523 Unit!23052)))

(declare-fun lt!309178 () Unit!23050)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38943 (_ BitVec 64) (_ BitVec 32)) Unit!23050)

(assert (=> b!663033 (= lt!309178 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!663033 false))

(declare-fun b!663034 () Bool)

(declare-fun res!430994 () Bool)

(assert (=> b!663034 (=> (not res!430994) (not e!380520))))

(declare-fun contains!3282 (List!12705 (_ BitVec 64)) Bool)

(assert (=> b!663034 (= res!430994 (not (contains!3282 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!663035 () Bool)

(declare-fun res!430990 () Bool)

(assert (=> b!663035 (=> (not res!430990) (not e!380520))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!663035 (= res!430990 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19028 a!3626))))))

(declare-fun b!663036 () Bool)

(declare-fun res!430979 () Bool)

(assert (=> b!663036 (=> (not res!430979) (not e!380520))))

(declare-fun arrayContainsKey!0 (array!38943 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!663036 (= res!430979 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!663037 () Bool)

(declare-fun res!430985 () Bool)

(assert (=> b!663037 (=> (not res!430985) (not e!380520))))

(assert (=> b!663037 (= res!430985 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12702))))

(declare-fun b!663038 () Bool)

(declare-fun res!430984 () Bool)

(declare-fun e!380525 () Bool)

(assert (=> b!663038 (=> res!430984 e!380525)))

(declare-fun lt!309175 () List!12705)

(assert (=> b!663038 (= res!430984 (contains!3282 lt!309175 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!663039 () Bool)

(declare-fun e!380519 () Bool)

(assert (=> b!663039 (= e!380519 (contains!3282 acc!681 k0!2843))))

(declare-fun b!663040 () Bool)

(declare-fun res!430978 () Bool)

(assert (=> b!663040 (=> (not res!430978) (not e!380520))))

(declare-fun noDuplicate!529 (List!12705) Bool)

(assert (=> b!663040 (= res!430978 (noDuplicate!529 acc!681))))

(declare-fun b!663041 () Bool)

(declare-fun e!380521 () Bool)

(assert (=> b!663041 (= e!380521 e!380525)))

(declare-fun res!430997 () Bool)

(assert (=> b!663041 (=> res!430997 e!380525)))

(assert (=> b!663041 (= res!430997 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!153 (List!12705 (_ BitVec 64)) List!12705)

(assert (=> b!663041 (= lt!309175 ($colon$colon!153 acc!681 (select (arr!18664 a!3626) from!3004)))))

(declare-fun subseq!21 (List!12705 List!12705) Bool)

(assert (=> b!663041 (subseq!21 acc!681 acc!681)))

(declare-fun lt!309173 () Unit!23050)

(declare-fun lemmaListSubSeqRefl!0 (List!12705) Unit!23050)

(assert (=> b!663041 (= lt!309173 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!663042 () Bool)

(declare-fun e!380526 () Bool)

(assert (=> b!663042 (= e!380526 (not (contains!3282 acc!681 k0!2843)))))

(declare-fun b!663043 () Bool)

(assert (=> b!663043 (= e!380525 true)))

(declare-fun lt!309176 () Bool)

(assert (=> b!663043 (= lt!309176 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!309175))))

(declare-fun lt!309177 () Unit!23050)

(declare-fun noDuplicateSubseq!21 (List!12705 List!12705) Unit!23050)

(assert (=> b!663043 (= lt!309177 (noDuplicateSubseq!21 acc!681 lt!309175))))

(declare-fun b!663044 () Bool)

(declare-fun res!430983 () Bool)

(assert (=> b!663044 (=> res!430983 e!380525)))

(assert (=> b!663044 (= res!430983 (not (subseq!21 acc!681 lt!309175)))))

(declare-fun b!663045 () Bool)

(assert (=> b!663045 (= e!380520 (not e!380521))))

(declare-fun res!430989 () Bool)

(assert (=> b!663045 (=> res!430989 e!380521)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!663045 (= res!430989 (not (validKeyInArray!0 (select (arr!18664 a!3626) from!3004))))))

(declare-fun lt!309174 () Unit!23050)

(assert (=> b!663045 (= lt!309174 e!380523)))

(declare-fun c!76394 () Bool)

(assert (=> b!663045 (= c!76394 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!663045 (arrayContainsKey!0 (array!38944 (store (arr!18664 a!3626) i!1382 k0!2843) (size!19028 a!3626)) k0!2843 from!3004)))

(declare-fun b!663046 () Bool)

(declare-fun Unit!23053 () Unit!23050)

(assert (=> b!663046 (= e!380523 Unit!23053)))

(declare-fun b!663047 () Bool)

(declare-fun res!430992 () Bool)

(assert (=> b!663047 (=> res!430992 e!380525)))

(assert (=> b!663047 (= res!430992 (contains!3282 lt!309175 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!663048 () Bool)

(declare-fun res!430991 () Bool)

(assert (=> b!663048 (=> (not res!430991) (not e!380520))))

(declare-fun e!380522 () Bool)

(assert (=> b!663048 (= res!430991 e!380522)))

(declare-fun res!430980 () Bool)

(assert (=> b!663048 (=> res!430980 e!380522)))

(assert (=> b!663048 (= res!430980 e!380519)))

(declare-fun res!430995 () Bool)

(assert (=> b!663048 (=> (not res!430995) (not e!380519))))

(assert (=> b!663048 (= res!430995 (bvsgt from!3004 i!1382))))

(declare-fun b!663049 () Bool)

(declare-fun res!430982 () Bool)

(assert (=> b!663049 (=> (not res!430982) (not e!380520))))

(assert (=> b!663049 (= res!430982 (not (contains!3282 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!663050 () Bool)

(assert (=> b!663050 (= e!380522 e!380526)))

(declare-fun res!430987 () Bool)

(assert (=> b!663050 (=> (not res!430987) (not e!380526))))

(assert (=> b!663050 (= res!430987 (bvsle from!3004 i!1382))))

(declare-fun b!663051 () Bool)

(declare-fun res!430993 () Bool)

(assert (=> b!663051 (=> (not res!430993) (not e!380520))))

(assert (=> b!663051 (= res!430993 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19028 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!663052 () Bool)

(declare-fun res!430986 () Bool)

(assert (=> b!663052 (=> (not res!430986) (not e!380520))))

(assert (=> b!663052 (= res!430986 (validKeyInArray!0 k0!2843))))

(declare-fun b!663053 () Bool)

(declare-fun res!430981 () Bool)

(assert (=> b!663053 (=> res!430981 e!380525)))

(assert (=> b!663053 (= res!430981 (not (noDuplicate!529 lt!309175)))))

(assert (= (and start!59896 res!430988) b!663040))

(assert (= (and b!663040 res!430978) b!663034))

(assert (= (and b!663034 res!430994) b!663049))

(assert (= (and b!663049 res!430982) b!663048))

(assert (= (and b!663048 res!430995) b!663039))

(assert (= (and b!663048 (not res!430980)) b!663050))

(assert (= (and b!663050 res!430987) b!663042))

(assert (= (and b!663048 res!430991) b!663037))

(assert (= (and b!663037 res!430985) b!663032))

(assert (= (and b!663032 res!430996) b!663035))

(assert (= (and b!663035 res!430990) b!663052))

(assert (= (and b!663052 res!430986) b!663036))

(assert (= (and b!663036 res!430979) b!663051))

(assert (= (and b!663051 res!430993) b!663045))

(assert (= (and b!663045 c!76394) b!663033))

(assert (= (and b!663045 (not c!76394)) b!663046))

(assert (= (and b!663045 (not res!430989)) b!663041))

(assert (= (and b!663041 (not res!430997)) b!663053))

(assert (= (and b!663053 (not res!430981)) b!663047))

(assert (= (and b!663047 (not res!430992)) b!663038))

(assert (= (and b!663038 (not res!430984)) b!663044))

(assert (= (and b!663044 (not res!430983)) b!663043))

(declare-fun m!634709 () Bool)

(assert (=> b!663037 m!634709))

(declare-fun m!634711 () Bool)

(assert (=> start!59896 m!634711))

(declare-fun m!634713 () Bool)

(assert (=> b!663038 m!634713))

(declare-fun m!634715 () Bool)

(assert (=> b!663047 m!634715))

(declare-fun m!634717 () Bool)

(assert (=> b!663053 m!634717))

(declare-fun m!634719 () Bool)

(assert (=> b!663043 m!634719))

(declare-fun m!634721 () Bool)

(assert (=> b!663043 m!634721))

(declare-fun m!634723 () Bool)

(assert (=> b!663033 m!634723))

(declare-fun m!634725 () Bool)

(assert (=> b!663041 m!634725))

(assert (=> b!663041 m!634725))

(declare-fun m!634727 () Bool)

(assert (=> b!663041 m!634727))

(declare-fun m!634729 () Bool)

(assert (=> b!663041 m!634729))

(declare-fun m!634731 () Bool)

(assert (=> b!663041 m!634731))

(declare-fun m!634733 () Bool)

(assert (=> b!663044 m!634733))

(declare-fun m!634735 () Bool)

(assert (=> b!663032 m!634735))

(declare-fun m!634737 () Bool)

(assert (=> b!663039 m!634737))

(declare-fun m!634739 () Bool)

(assert (=> b!663040 m!634739))

(assert (=> b!663045 m!634725))

(declare-fun m!634741 () Bool)

(assert (=> b!663045 m!634741))

(declare-fun m!634743 () Bool)

(assert (=> b!663045 m!634743))

(assert (=> b!663045 m!634725))

(declare-fun m!634745 () Bool)

(assert (=> b!663045 m!634745))

(declare-fun m!634747 () Bool)

(assert (=> b!663045 m!634747))

(declare-fun m!634749 () Bool)

(assert (=> b!663034 m!634749))

(declare-fun m!634751 () Bool)

(assert (=> b!663036 m!634751))

(declare-fun m!634753 () Bool)

(assert (=> b!663052 m!634753))

(declare-fun m!634755 () Bool)

(assert (=> b!663049 m!634755))

(assert (=> b!663042 m!634737))

(check-sat (not b!663043) (not b!663032) (not b!663052) (not b!663041) (not b!663045) (not b!663033) (not b!663034) (not b!663039) (not b!663047) (not b!663038) (not b!663053) (not b!663049) (not b!663044) (not b!663036) (not b!663042) (not start!59896) (not b!663037) (not b!663040))
(check-sat)
