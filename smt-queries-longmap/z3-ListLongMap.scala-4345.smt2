; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60086 () Bool)

(assert start!60086)

(declare-fun res!436898 () Bool)

(declare-fun e!383073 () Bool)

(assert (=> start!60086 (=> (not res!436898) (not e!383073))))

(declare-datatypes ((array!39144 0))(
  ( (array!39145 (arr!18764 (Array (_ BitVec 32) (_ BitVec 64))) (size!19129 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39144)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!60086 (= res!436898 (and (bvslt (size!19129 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19129 a!3626))))))

(assert (=> start!60086 e!383073))

(assert (=> start!60086 true))

(declare-fun array_inv!14647 (array!39144) Bool)

(assert (=> start!60086 (array_inv!14647 a!3626)))

(declare-fun b!669977 () Bool)

(declare-fun res!436901 () Bool)

(declare-fun e!383066 () Bool)

(assert (=> b!669977 (=> res!436901 e!383066)))

(declare-datatypes ((List!12844 0))(
  ( (Nil!12841) (Cons!12840 (h!13885 (_ BitVec 64)) (t!19063 List!12844)) )
))
(declare-fun lt!311716 () List!12844)

(declare-fun contains!3366 (List!12844 (_ BitVec 64)) Bool)

(assert (=> b!669977 (= res!436901 (contains!3366 lt!311716 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!669978 () Bool)

(declare-fun res!436918 () Bool)

(assert (=> b!669978 (=> res!436918 e!383066)))

(declare-fun e!383069 () Bool)

(assert (=> b!669978 (= res!436918 e!383069)))

(declare-fun res!436909 () Bool)

(assert (=> b!669978 (=> (not res!436909) (not e!383069))))

(declare-fun e!383070 () Bool)

(assert (=> b!669978 (= res!436909 e!383070)))

(declare-fun res!436907 () Bool)

(assert (=> b!669978 (=> res!436907 e!383070)))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!669978 (= res!436907 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!669979 () Bool)

(assert (=> b!669979 (= e!383066 true)))

(declare-fun lt!311715 () array!39144)

(declare-fun arrayNoDuplicates!0 (array!39144 (_ BitVec 32) List!12844) Bool)

(assert (=> b!669979 (arrayNoDuplicates!0 lt!311715 (bvadd #b00000000000000000000000000000001 from!3004) lt!311716)))

(declare-datatypes ((Unit!23528 0))(
  ( (Unit!23529) )
))
(declare-fun lt!311710 () Unit!23528)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39144 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12844) Unit!23528)

(assert (=> b!669979 (= lt!311710 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k0!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) lt!311716))))

(declare-fun b!669980 () Bool)

(declare-fun res!436915 () Bool)

(assert (=> b!669980 (=> (not res!436915) (not e!383073))))

(assert (=> b!669980 (= res!436915 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19129 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!669981 () Bool)

(declare-fun e!383075 () Bool)

(declare-fun e!383065 () Bool)

(assert (=> b!669981 (= e!383075 e!383065)))

(declare-fun res!436912 () Bool)

(assert (=> b!669981 (=> (not res!436912) (not e!383065))))

(assert (=> b!669981 (= res!436912 (bvsle from!3004 i!1382))))

(declare-fun b!669982 () Bool)

(declare-fun res!436908 () Bool)

(assert (=> b!669982 (=> (not res!436908) (not e!383073))))

(assert (=> b!669982 (= res!436908 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19129 a!3626))))))

(declare-fun b!669983 () Bool)

(declare-fun res!436906 () Bool)

(assert (=> b!669983 (=> res!436906 e!383066)))

(declare-fun noDuplicate!635 (List!12844) Bool)

(assert (=> b!669983 (= res!436906 (not (noDuplicate!635 lt!311716)))))

(declare-fun b!669984 () Bool)

(declare-fun acc!681 () List!12844)

(assert (=> b!669984 (= e!383065 (not (contains!3366 acc!681 k0!2843)))))

(declare-fun b!669985 () Bool)

(declare-fun e!383072 () Unit!23528)

(declare-fun lt!311714 () Unit!23528)

(assert (=> b!669985 (= e!383072 lt!311714)))

(declare-fun lt!311718 () Unit!23528)

(declare-fun lemmaListSubSeqRefl!0 (List!12844) Unit!23528)

(assert (=> b!669985 (= lt!311718 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!122 (List!12844 List!12844) Bool)

(assert (=> b!669985 (subseq!122 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39144 List!12844 List!12844 (_ BitVec 32)) Unit!23528)

(declare-fun $colon$colon!253 (List!12844 (_ BitVec 64)) List!12844)

(assert (=> b!669985 (= lt!311714 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!253 acc!681 (select (arr!18764 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!669985 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!669986 () Bool)

(declare-fun res!436905 () Bool)

(assert (=> b!669986 (=> (not res!436905) (not e!383073))))

(assert (=> b!669986 (= res!436905 (noDuplicate!635 acc!681))))

(declare-fun b!669987 () Bool)

(declare-fun e!383067 () Bool)

(assert (=> b!669987 (= e!383069 e!383067)))

(declare-fun res!436903 () Bool)

(assert (=> b!669987 (=> res!436903 e!383067)))

(assert (=> b!669987 (= res!436903 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!669988 () Bool)

(declare-fun res!436902 () Bool)

(assert (=> b!669988 (=> (not res!436902) (not e!383073))))

(assert (=> b!669988 (= res!436902 (not (contains!3366 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!669989 () Bool)

(declare-fun res!436917 () Bool)

(assert (=> b!669989 (=> (not res!436917) (not e!383073))))

(assert (=> b!669989 (= res!436917 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!669990 () Bool)

(declare-fun e!383074 () Bool)

(assert (=> b!669990 (= e!383074 (contains!3366 acc!681 k0!2843))))

(declare-fun b!669991 () Bool)

(assert (=> b!669991 (= e!383073 (not e!383066))))

(declare-fun res!436899 () Bool)

(assert (=> b!669991 (=> res!436899 e!383066)))

(assert (=> b!669991 (= res!436899 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (=> b!669991 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!311716)))

(declare-fun lt!311708 () Unit!23528)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39144 (_ BitVec 64) (_ BitVec 32) List!12844 List!12844) Unit!23528)

(assert (=> b!669991 (= lt!311708 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!311716))))

(declare-fun -!120 (List!12844 (_ BitVec 64)) List!12844)

(assert (=> b!669991 (= (-!120 lt!311716 k0!2843) acc!681)))

(assert (=> b!669991 (= lt!311716 ($colon$colon!253 acc!681 k0!2843))))

(declare-fun lt!311713 () Unit!23528)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12844) Unit!23528)

(assert (=> b!669991 (= lt!311713 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(assert (=> b!669991 (subseq!122 acc!681 acc!681)))

(declare-fun lt!311717 () Unit!23528)

(assert (=> b!669991 (= lt!311717 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!669991 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!311712 () Unit!23528)

(assert (=> b!669991 (= lt!311712 e!383072)))

(declare-fun c!76908 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!669991 (= c!76908 (validKeyInArray!0 (select (arr!18764 a!3626) from!3004)))))

(declare-fun lt!311709 () Unit!23528)

(declare-fun e!383071 () Unit!23528)

(assert (=> b!669991 (= lt!311709 e!383071)))

(declare-fun c!76907 () Bool)

(declare-fun arrayContainsKey!0 (array!39144 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!669991 (= c!76907 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!669991 (arrayContainsKey!0 lt!311715 k0!2843 from!3004)))

(assert (=> b!669991 (= lt!311715 (array!39145 (store (arr!18764 a!3626) i!1382 k0!2843) (size!19129 a!3626)))))

(declare-fun b!669992 () Bool)

(declare-fun Unit!23530 () Unit!23528)

(assert (=> b!669992 (= e!383071 Unit!23530)))

(declare-fun b!669993 () Bool)

(declare-fun res!436900 () Bool)

(assert (=> b!669993 (=> res!436900 e!383066)))

(assert (=> b!669993 (= res!436900 (contains!3366 lt!311716 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!669994 () Bool)

(declare-fun Unit!23531 () Unit!23528)

(assert (=> b!669994 (= e!383072 Unit!23531)))

(declare-fun b!669995 () Bool)

(declare-fun res!436916 () Bool)

(assert (=> b!669995 (=> (not res!436916) (not e!383073))))

(assert (=> b!669995 (= res!436916 (validKeyInArray!0 k0!2843))))

(declare-fun b!669996 () Bool)

(assert (=> b!669996 (= e!383070 (not (contains!3366 lt!311716 k0!2843)))))

(declare-fun b!669997 () Bool)

(declare-fun res!436911 () Bool)

(assert (=> b!669997 (=> (not res!436911) (not e!383073))))

(assert (=> b!669997 (= res!436911 e!383075)))

(declare-fun res!436904 () Bool)

(assert (=> b!669997 (=> res!436904 e!383075)))

(assert (=> b!669997 (= res!436904 e!383074)))

(declare-fun res!436910 () Bool)

(assert (=> b!669997 (=> (not res!436910) (not e!383074))))

(assert (=> b!669997 (= res!436910 (bvsgt from!3004 i!1382))))

(declare-fun b!669998 () Bool)

(declare-fun res!436913 () Bool)

(assert (=> b!669998 (=> (not res!436913) (not e!383073))))

(assert (=> b!669998 (= res!436913 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12841))))

(declare-fun b!669999 () Bool)

(assert (=> b!669999 (= e!383067 (contains!3366 lt!311716 k0!2843))))

(declare-fun b!670000 () Bool)

(declare-fun res!436914 () Bool)

(assert (=> b!670000 (=> (not res!436914) (not e!383073))))

(assert (=> b!670000 (= res!436914 (not (contains!3366 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!670001 () Bool)

(declare-fun Unit!23532 () Unit!23528)

(assert (=> b!670001 (= e!383071 Unit!23532)))

(declare-fun lt!311711 () Unit!23528)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39144 (_ BitVec 64) (_ BitVec 32)) Unit!23528)

(assert (=> b!670001 (= lt!311711 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!670001 false))

(declare-fun b!670002 () Bool)

(declare-fun res!436897 () Bool)

(assert (=> b!670002 (=> (not res!436897) (not e!383073))))

(assert (=> b!670002 (= res!436897 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(assert (= (and start!60086 res!436898) b!669986))

(assert (= (and b!669986 res!436905) b!669988))

(assert (= (and b!669988 res!436902) b!670000))

(assert (= (and b!670000 res!436914) b!669997))

(assert (= (and b!669997 res!436910) b!669990))

(assert (= (and b!669997 (not res!436904)) b!669981))

(assert (= (and b!669981 res!436912) b!669984))

(assert (= (and b!669997 res!436911) b!669998))

(assert (= (and b!669998 res!436913) b!669989))

(assert (= (and b!669989 res!436917) b!669982))

(assert (= (and b!669982 res!436908) b!669995))

(assert (= (and b!669995 res!436916) b!670002))

(assert (= (and b!670002 res!436897) b!669980))

(assert (= (and b!669980 res!436915) b!669991))

(assert (= (and b!669991 c!76907) b!670001))

(assert (= (and b!669991 (not c!76907)) b!669992))

(assert (= (and b!669991 c!76908) b!669985))

(assert (= (and b!669991 (not c!76908)) b!669994))

(assert (= (and b!669991 (not res!436899)) b!669983))

(assert (= (and b!669983 (not res!436906)) b!669977))

(assert (= (and b!669977 (not res!436901)) b!669993))

(assert (= (and b!669993 (not res!436900)) b!669978))

(assert (= (and b!669978 (not res!436907)) b!669996))

(assert (= (and b!669978 res!436909) b!669987))

(assert (= (and b!669987 (not res!436903)) b!669999))

(assert (= (and b!669978 (not res!436918)) b!669979))

(declare-fun m!639405 () Bool)

(assert (=> b!669989 m!639405))

(declare-fun m!639407 () Bool)

(assert (=> b!669996 m!639407))

(declare-fun m!639409 () Bool)

(assert (=> b!669979 m!639409))

(declare-fun m!639411 () Bool)

(assert (=> b!669979 m!639411))

(assert (=> b!669999 m!639407))

(declare-fun m!639413 () Bool)

(assert (=> b!669977 m!639413))

(declare-fun m!639415 () Bool)

(assert (=> b!669983 m!639415))

(declare-fun m!639417 () Bool)

(assert (=> b!669990 m!639417))

(declare-fun m!639419 () Bool)

(assert (=> b!670002 m!639419))

(declare-fun m!639421 () Bool)

(assert (=> b!670001 m!639421))

(declare-fun m!639423 () Bool)

(assert (=> b!670000 m!639423))

(declare-fun m!639425 () Bool)

(assert (=> b!669986 m!639425))

(declare-fun m!639427 () Bool)

(assert (=> b!669993 m!639427))

(declare-fun m!639429 () Bool)

(assert (=> start!60086 m!639429))

(declare-fun m!639431 () Bool)

(assert (=> b!669998 m!639431))

(declare-fun m!639433 () Bool)

(assert (=> b!669988 m!639433))

(declare-fun m!639435 () Bool)

(assert (=> b!669995 m!639435))

(declare-fun m!639437 () Bool)

(assert (=> b!669985 m!639437))

(declare-fun m!639439 () Bool)

(assert (=> b!669985 m!639439))

(declare-fun m!639441 () Bool)

(assert (=> b!669985 m!639441))

(declare-fun m!639443 () Bool)

(assert (=> b!669985 m!639443))

(assert (=> b!669985 m!639439))

(assert (=> b!669985 m!639441))

(declare-fun m!639445 () Bool)

(assert (=> b!669985 m!639445))

(declare-fun m!639447 () Bool)

(assert (=> b!669985 m!639447))

(assert (=> b!669984 m!639417))

(declare-fun m!639449 () Bool)

(assert (=> b!669991 m!639449))

(assert (=> b!669991 m!639437))

(assert (=> b!669991 m!639439))

(declare-fun m!639451 () Bool)

(assert (=> b!669991 m!639451))

(declare-fun m!639453 () Bool)

(assert (=> b!669991 m!639453))

(declare-fun m!639455 () Bool)

(assert (=> b!669991 m!639455))

(assert (=> b!669991 m!639445))

(declare-fun m!639457 () Bool)

(assert (=> b!669991 m!639457))

(declare-fun m!639459 () Bool)

(assert (=> b!669991 m!639459))

(assert (=> b!669991 m!639439))

(declare-fun m!639461 () Bool)

(assert (=> b!669991 m!639461))

(assert (=> b!669991 m!639447))

(declare-fun m!639463 () Bool)

(assert (=> b!669991 m!639463))

(declare-fun m!639465 () Bool)

(assert (=> b!669991 m!639465))

(check-sat (not b!669977) (not start!60086) (not b!669989) (not b!669996) (not b!669984) (not b!670002) (not b!669983) (not b!669998) (not b!670001) (not b!669995) (not b!669990) (not b!669988) (not b!669986) (not b!669993) (not b!669991) (not b!669999) (not b!670000) (not b!669979) (not b!669985))
(check-sat)
