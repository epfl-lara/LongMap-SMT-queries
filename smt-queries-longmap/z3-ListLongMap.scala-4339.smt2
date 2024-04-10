; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60064 () Bool)

(assert start!60064)

(declare-fun b!668978 () Bool)

(declare-fun e!382704 () Bool)

(declare-fun e!382701 () Bool)

(assert (=> b!668978 (= e!382704 (not e!382701))))

(declare-fun res!435948 () Bool)

(assert (=> b!668978 (=> res!435948 e!382701)))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!668978 (= res!435948 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-datatypes ((array!39111 0))(
  ( (array!39112 (arr!18748 (Array (_ BitVec 32) (_ BitVec 64))) (size!19112 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39111)

(declare-datatypes ((List!12789 0))(
  ( (Nil!12786) (Cons!12785 (h!13830 (_ BitVec 64)) (t!19017 List!12789)) )
))
(declare-fun lt!311440 () List!12789)

(declare-fun arrayNoDuplicates!0 (array!39111 (_ BitVec 32) List!12789) Bool)

(assert (=> b!668978 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!311440)))

(declare-datatypes ((Unit!23465 0))(
  ( (Unit!23466) )
))
(declare-fun lt!311443 () Unit!23465)

(declare-fun acc!681 () List!12789)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39111 (_ BitVec 64) (_ BitVec 32) List!12789 List!12789) Unit!23465)

(assert (=> b!668978 (= lt!311443 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!311440))))

(declare-fun -!103 (List!12789 (_ BitVec 64)) List!12789)

(assert (=> b!668978 (= (-!103 lt!311440 k0!2843) acc!681)))

(declare-fun $colon$colon!237 (List!12789 (_ BitVec 64)) List!12789)

(assert (=> b!668978 (= lt!311440 ($colon$colon!237 acc!681 k0!2843))))

(declare-fun lt!311436 () Unit!23465)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12789) Unit!23465)

(assert (=> b!668978 (= lt!311436 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(declare-fun subseq!105 (List!12789 List!12789) Bool)

(assert (=> b!668978 (subseq!105 acc!681 acc!681)))

(declare-fun lt!311442 () Unit!23465)

(declare-fun lemmaListSubSeqRefl!0 (List!12789) Unit!23465)

(assert (=> b!668978 (= lt!311442 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!668978 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!311441 () Unit!23465)

(declare-fun e!382699 () Unit!23465)

(assert (=> b!668978 (= lt!311441 e!382699)))

(declare-fun c!76886 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!668978 (= c!76886 (validKeyInArray!0 (select (arr!18748 a!3626) from!3004)))))

(declare-fun lt!311438 () Unit!23465)

(declare-fun e!382702 () Unit!23465)

(assert (=> b!668978 (= lt!311438 e!382702)))

(declare-fun c!76885 () Bool)

(declare-fun arrayContainsKey!0 (array!39111 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!668978 (= c!76885 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!668978 (arrayContainsKey!0 (array!39112 (store (arr!18748 a!3626) i!1382 k0!2843) (size!19112 a!3626)) k0!2843 from!3004)))

(declare-fun b!668979 () Bool)

(declare-fun res!435956 () Bool)

(assert (=> b!668979 (=> (not res!435956) (not e!382704))))

(declare-fun e!382700 () Bool)

(assert (=> b!668979 (= res!435956 e!382700)))

(declare-fun res!435960 () Bool)

(assert (=> b!668979 (=> res!435960 e!382700)))

(declare-fun e!382698 () Bool)

(assert (=> b!668979 (= res!435960 e!382698)))

(declare-fun res!435962 () Bool)

(assert (=> b!668979 (=> (not res!435962) (not e!382698))))

(assert (=> b!668979 (= res!435962 (bvsgt from!3004 i!1382))))

(declare-fun b!668980 () Bool)

(declare-fun e!382703 () Bool)

(declare-fun contains!3366 (List!12789 (_ BitVec 64)) Bool)

(assert (=> b!668980 (= e!382703 (not (contains!3366 lt!311440 k0!2843)))))

(declare-fun b!668981 () Bool)

(declare-fun res!435945 () Bool)

(assert (=> b!668981 (=> res!435945 e!382701)))

(assert (=> b!668981 (= res!435945 (contains!3366 lt!311440 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!668982 () Bool)

(declare-fun res!435955 () Bool)

(assert (=> b!668982 (=> (not res!435955) (not e!382704))))

(assert (=> b!668982 (= res!435955 (not (contains!3366 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!668983 () Bool)

(declare-fun lt!311437 () Unit!23465)

(assert (=> b!668983 (= e!382699 lt!311437)))

(declare-fun lt!311435 () Unit!23465)

(assert (=> b!668983 (= lt!311435 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!668983 (subseq!105 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39111 List!12789 List!12789 (_ BitVec 32)) Unit!23465)

(assert (=> b!668983 (= lt!311437 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!237 acc!681 (select (arr!18748 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!668983 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!668984 () Bool)

(assert (=> b!668984 (= e!382701 true)))

(declare-fun lt!311439 () Bool)

(declare-fun e!382697 () Bool)

(assert (=> b!668984 (= lt!311439 e!382697)))

(declare-fun res!435954 () Bool)

(assert (=> b!668984 (=> res!435954 e!382697)))

(declare-fun e!382696 () Bool)

(assert (=> b!668984 (= res!435954 e!382696)))

(declare-fun res!435953 () Bool)

(assert (=> b!668984 (=> (not res!435953) (not e!382696))))

(assert (=> b!668984 (= res!435953 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!668985 () Bool)

(declare-fun res!435957 () Bool)

(assert (=> b!668985 (=> (not res!435957) (not e!382704))))

(assert (=> b!668985 (= res!435957 (validKeyInArray!0 k0!2843))))

(declare-fun b!668986 () Bool)

(declare-fun res!435949 () Bool)

(assert (=> b!668986 (=> (not res!435949) (not e!382704))))

(assert (=> b!668986 (= res!435949 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12786))))

(declare-fun b!668987 () Bool)

(declare-fun res!435959 () Bool)

(assert (=> b!668987 (=> (not res!435959) (not e!382704))))

(assert (=> b!668987 (= res!435959 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!668989 () Bool)

(assert (=> b!668989 (= e!382697 e!382703)))

(declare-fun res!435951 () Bool)

(assert (=> b!668989 (=> (not res!435951) (not e!382703))))

(assert (=> b!668989 (= res!435951 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!668990 () Bool)

(declare-fun res!435952 () Bool)

(assert (=> b!668990 (=> (not res!435952) (not e!382704))))

(assert (=> b!668990 (= res!435952 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19112 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!668991 () Bool)

(declare-fun res!435943 () Bool)

(assert (=> b!668991 (=> (not res!435943) (not e!382704))))

(assert (=> b!668991 (= res!435943 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!668992 () Bool)

(declare-fun res!435961 () Bool)

(assert (=> b!668992 (=> res!435961 e!382701)))

(assert (=> b!668992 (= res!435961 (contains!3366 lt!311440 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!668993 () Bool)

(declare-fun e!382694 () Bool)

(assert (=> b!668993 (= e!382700 e!382694)))

(declare-fun res!435947 () Bool)

(assert (=> b!668993 (=> (not res!435947) (not e!382694))))

(assert (=> b!668993 (= res!435947 (bvsle from!3004 i!1382))))

(declare-fun b!668994 () Bool)

(declare-fun Unit!23467 () Unit!23465)

(assert (=> b!668994 (= e!382699 Unit!23467)))

(declare-fun b!668995 () Bool)

(declare-fun res!435944 () Bool)

(assert (=> b!668995 (=> (not res!435944) (not e!382704))))

(assert (=> b!668995 (= res!435944 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19112 a!3626))))))

(declare-fun b!668996 () Bool)

(assert (=> b!668996 (= e!382698 (contains!3366 acc!681 k0!2843))))

(declare-fun b!668997 () Bool)

(assert (=> b!668997 (= e!382696 (contains!3366 lt!311440 k0!2843))))

(declare-fun b!668998 () Bool)

(declare-fun res!435958 () Bool)

(assert (=> b!668998 (=> (not res!435958) (not e!382704))))

(declare-fun noDuplicate!613 (List!12789) Bool)

(assert (=> b!668998 (= res!435958 (noDuplicate!613 acc!681))))

(declare-fun b!668999 () Bool)

(declare-fun res!435942 () Bool)

(assert (=> b!668999 (=> (not res!435942) (not e!382704))))

(assert (=> b!668999 (= res!435942 (not (contains!3366 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!669000 () Bool)

(declare-fun Unit!23468 () Unit!23465)

(assert (=> b!669000 (= e!382702 Unit!23468)))

(declare-fun lt!311434 () Unit!23465)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39111 (_ BitVec 64) (_ BitVec 32)) Unit!23465)

(assert (=> b!669000 (= lt!311434 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!669000 false))

(declare-fun b!669001 () Bool)

(declare-fun Unit!23469 () Unit!23465)

(assert (=> b!669001 (= e!382702 Unit!23469)))

(declare-fun b!669002 () Bool)

(assert (=> b!669002 (= e!382694 (not (contains!3366 acc!681 k0!2843)))))

(declare-fun res!435950 () Bool)

(assert (=> start!60064 (=> (not res!435950) (not e!382704))))

(assert (=> start!60064 (= res!435950 (and (bvslt (size!19112 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19112 a!3626))))))

(assert (=> start!60064 e!382704))

(assert (=> start!60064 true))

(declare-fun array_inv!14544 (array!39111) Bool)

(assert (=> start!60064 (array_inv!14544 a!3626)))

(declare-fun b!668988 () Bool)

(declare-fun res!435946 () Bool)

(assert (=> b!668988 (=> res!435946 e!382701)))

(assert (=> b!668988 (= res!435946 (not (noDuplicate!613 lt!311440)))))

(assert (= (and start!60064 res!435950) b!668998))

(assert (= (and b!668998 res!435958) b!668982))

(assert (= (and b!668982 res!435955) b!668999))

(assert (= (and b!668999 res!435942) b!668979))

(assert (= (and b!668979 res!435962) b!668996))

(assert (= (and b!668979 (not res!435960)) b!668993))

(assert (= (and b!668993 res!435947) b!669002))

(assert (= (and b!668979 res!435956) b!668986))

(assert (= (and b!668986 res!435949) b!668987))

(assert (= (and b!668987 res!435959) b!668995))

(assert (= (and b!668995 res!435944) b!668985))

(assert (= (and b!668985 res!435957) b!668991))

(assert (= (and b!668991 res!435943) b!668990))

(assert (= (and b!668990 res!435952) b!668978))

(assert (= (and b!668978 c!76885) b!669000))

(assert (= (and b!668978 (not c!76885)) b!669001))

(assert (= (and b!668978 c!76886) b!668983))

(assert (= (and b!668978 (not c!76886)) b!668994))

(assert (= (and b!668978 (not res!435948)) b!668988))

(assert (= (and b!668988 (not res!435946)) b!668981))

(assert (= (and b!668981 (not res!435945)) b!668992))

(assert (= (and b!668992 (not res!435961)) b!668984))

(assert (= (and b!668984 res!435953) b!668997))

(assert (= (and b!668984 (not res!435954)) b!668989))

(assert (= (and b!668989 res!435951) b!668980))

(declare-fun m!639177 () Bool)

(assert (=> b!668982 m!639177))

(declare-fun m!639179 () Bool)

(assert (=> b!668999 m!639179))

(declare-fun m!639181 () Bool)

(assert (=> b!668997 m!639181))

(declare-fun m!639183 () Bool)

(assert (=> b!668986 m!639183))

(declare-fun m!639185 () Bool)

(assert (=> b!668981 m!639185))

(declare-fun m!639187 () Bool)

(assert (=> b!668992 m!639187))

(declare-fun m!639189 () Bool)

(assert (=> b!668987 m!639189))

(declare-fun m!639191 () Bool)

(assert (=> b!668996 m!639191))

(assert (=> b!668980 m!639181))

(declare-fun m!639193 () Bool)

(assert (=> b!668983 m!639193))

(declare-fun m!639195 () Bool)

(assert (=> b!668983 m!639195))

(declare-fun m!639197 () Bool)

(assert (=> b!668983 m!639197))

(declare-fun m!639199 () Bool)

(assert (=> b!668983 m!639199))

(assert (=> b!668983 m!639195))

(assert (=> b!668983 m!639197))

(declare-fun m!639201 () Bool)

(assert (=> b!668983 m!639201))

(declare-fun m!639203 () Bool)

(assert (=> b!668983 m!639203))

(declare-fun m!639205 () Bool)

(assert (=> b!668998 m!639205))

(declare-fun m!639207 () Bool)

(assert (=> b!668985 m!639207))

(declare-fun m!639209 () Bool)

(assert (=> b!668978 m!639209))

(declare-fun m!639211 () Bool)

(assert (=> b!668978 m!639211))

(assert (=> b!668978 m!639193))

(assert (=> b!668978 m!639195))

(declare-fun m!639213 () Bool)

(assert (=> b!668978 m!639213))

(declare-fun m!639215 () Bool)

(assert (=> b!668978 m!639215))

(assert (=> b!668978 m!639201))

(declare-fun m!639217 () Bool)

(assert (=> b!668978 m!639217))

(assert (=> b!668978 m!639195))

(declare-fun m!639219 () Bool)

(assert (=> b!668978 m!639219))

(declare-fun m!639221 () Bool)

(assert (=> b!668978 m!639221))

(declare-fun m!639223 () Bool)

(assert (=> b!668978 m!639223))

(declare-fun m!639225 () Bool)

(assert (=> b!668978 m!639225))

(assert (=> b!668978 m!639203))

(assert (=> b!669002 m!639191))

(declare-fun m!639227 () Bool)

(assert (=> b!668988 m!639227))

(declare-fun m!639229 () Bool)

(assert (=> b!668991 m!639229))

(declare-fun m!639231 () Bool)

(assert (=> start!60064 m!639231))

(declare-fun m!639233 () Bool)

(assert (=> b!669000 m!639233))

(check-sat (not b!668987) (not b!668997) (not b!668986) (not b!668981) (not b!668998) (not b!668985) (not b!668991) (not b!668980) (not b!668983) (not b!668988) (not b!669000) (not b!668978) (not b!668999) (not start!60064) (not b!668992) (not b!668982) (not b!668996) (not b!669002))
(check-sat)
