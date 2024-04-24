; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61650 () Bool)

(assert start!61650)

(declare-fun b!689862 () Bool)

(declare-fun res!454275 () Bool)

(declare-fun e!392777 () Bool)

(assert (=> b!689862 (=> res!454275 e!392777)))

(declare-datatypes ((List!12981 0))(
  ( (Nil!12978) (Cons!12977 (h!14025 (_ BitVec 64)) (t!19237 List!12981)) )
))
(declare-fun lt!316345 () List!12981)

(declare-fun noDuplicate!907 (List!12981) Bool)

(assert (=> b!689862 (= res!454275 (not (noDuplicate!907 lt!316345)))))

(declare-fun b!689863 () Bool)

(declare-fun res!454285 () Bool)

(declare-fun e!392776 () Bool)

(assert (=> b!689863 (=> (not res!454285) (not e!392776))))

(declare-fun acc!681 () List!12981)

(declare-fun contains!3633 (List!12981 (_ BitVec 64)) Bool)

(assert (=> b!689863 (= res!454285 (not (contains!3633 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!689864 () Bool)

(declare-fun res!454268 () Bool)

(assert (=> b!689864 (=> (not res!454268) (not e!392776))))

(declare-datatypes ((array!39729 0))(
  ( (array!39730 (arr!19033 (Array (_ BitVec 32) (_ BitVec 64))) (size!19413 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39729)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!39729 (_ BitVec 32) List!12981) Bool)

(assert (=> b!689864 (= res!454268 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!689866 () Bool)

(declare-fun e!392772 () Bool)

(declare-fun e!392774 () Bool)

(assert (=> b!689866 (= e!392772 e!392774)))

(declare-fun res!454274 () Bool)

(assert (=> b!689866 (=> res!454274 e!392774)))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!689866 (= res!454274 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!689867 () Bool)

(declare-datatypes ((Unit!24336 0))(
  ( (Unit!24337) )
))
(declare-fun e!392773 () Unit!24336)

(declare-fun Unit!24338 () Unit!24336)

(assert (=> b!689867 (= e!392773 Unit!24338)))

(declare-fun b!689868 () Bool)

(declare-fun e!392769 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(assert (=> b!689868 (= e!392769 (not (contains!3633 acc!681 k0!2843)))))

(declare-fun b!689869 () Bool)

(declare-fun res!454280 () Bool)

(assert (=> b!689869 (=> (not res!454280) (not e!392776))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!689869 (= res!454280 (validKeyInArray!0 k0!2843))))

(declare-fun b!689870 () Bool)

(declare-fun lt!316351 () Unit!24336)

(assert (=> b!689870 (= e!392773 lt!316351)))

(declare-fun lt!316347 () Unit!24336)

(declare-fun lemmaListSubSeqRefl!0 (List!12981) Unit!24336)

(assert (=> b!689870 (= lt!316347 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!242 (List!12981 List!12981) Bool)

(assert (=> b!689870 (subseq!242 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39729 List!12981 List!12981 (_ BitVec 32)) Unit!24336)

(declare-fun $colon$colon!404 (List!12981 (_ BitVec 64)) List!12981)

(assert (=> b!689870 (= lt!316351 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!404 acc!681 (select (arr!19033 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!689870 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!689871 () Bool)

(declare-fun res!454283 () Bool)

(assert (=> b!689871 (=> res!454283 e!392777)))

(assert (=> b!689871 (= res!454283 (contains!3633 lt!316345 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!689872 () Bool)

(declare-fun res!454281 () Bool)

(assert (=> b!689872 (=> (not res!454281) (not e!392776))))

(assert (=> b!689872 (= res!454281 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12978))))

(declare-fun b!689873 () Bool)

(declare-fun e!392770 () Bool)

(assert (=> b!689873 (= e!392770 (contains!3633 acc!681 k0!2843))))

(declare-fun lt!316350 () array!39729)

(declare-fun b!689874 () Bool)

(assert (=> b!689874 (= e!392777 (arrayNoDuplicates!0 lt!316350 from!3004 acc!681))))

(assert (=> b!689874 (arrayNoDuplicates!0 lt!316350 (bvadd #b00000000000000000000000000000001 from!3004) lt!316345)))

(declare-fun lt!316344 () Unit!24336)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39729 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12981) Unit!24336)

(assert (=> b!689874 (= lt!316344 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k0!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) lt!316345))))

(declare-fun res!454277 () Bool)

(assert (=> start!61650 (=> (not res!454277) (not e!392776))))

(assert (=> start!61650 (= res!454277 (and (bvslt (size!19413 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19413 a!3626))))))

(assert (=> start!61650 e!392776))

(assert (=> start!61650 true))

(declare-fun array_inv!14892 (array!39729) Bool)

(assert (=> start!61650 (array_inv!14892 a!3626)))

(declare-fun b!689865 () Bool)

(declare-fun res!454271 () Bool)

(assert (=> b!689865 (=> (not res!454271) (not e!392776))))

(declare-fun arrayContainsKey!0 (array!39729 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!689865 (= res!454271 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!689875 () Bool)

(declare-fun e!392778 () Bool)

(assert (=> b!689875 (= e!392778 e!392769)))

(declare-fun res!454276 () Bool)

(assert (=> b!689875 (=> (not res!454276) (not e!392769))))

(assert (=> b!689875 (= res!454276 (bvsle from!3004 i!1382))))

(declare-fun b!689876 () Bool)

(declare-fun res!454273 () Bool)

(assert (=> b!689876 (=> res!454273 e!392777)))

(assert (=> b!689876 (= res!454273 (contains!3633 lt!316345 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!689877 () Bool)

(declare-fun res!454284 () Bool)

(assert (=> b!689877 (=> res!454284 e!392777)))

(assert (=> b!689877 (= res!454284 e!392772)))

(declare-fun res!454279 () Bool)

(assert (=> b!689877 (=> (not res!454279) (not e!392772))))

(declare-fun e!392771 () Bool)

(assert (=> b!689877 (= res!454279 e!392771)))

(declare-fun res!454288 () Bool)

(assert (=> b!689877 (=> res!454288 e!392771)))

(assert (=> b!689877 (= res!454288 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!689878 () Bool)

(declare-fun res!454267 () Bool)

(assert (=> b!689878 (=> (not res!454267) (not e!392776))))

(assert (=> b!689878 (= res!454267 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19413 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!689879 () Bool)

(declare-fun e!392768 () Unit!24336)

(declare-fun Unit!24339 () Unit!24336)

(assert (=> b!689879 (= e!392768 Unit!24339)))

(declare-fun lt!316346 () Unit!24336)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39729 (_ BitVec 64) (_ BitVec 32)) Unit!24336)

(assert (=> b!689879 (= lt!316346 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!689879 false))

(declare-fun b!689880 () Bool)

(declare-fun res!454270 () Bool)

(assert (=> b!689880 (=> (not res!454270) (not e!392776))))

(assert (=> b!689880 (= res!454270 e!392778)))

(declare-fun res!454287 () Bool)

(assert (=> b!689880 (=> res!454287 e!392778)))

(assert (=> b!689880 (= res!454287 e!392770)))

(declare-fun res!454282 () Bool)

(assert (=> b!689880 (=> (not res!454282) (not e!392770))))

(assert (=> b!689880 (= res!454282 (bvsgt from!3004 i!1382))))

(declare-fun b!689881 () Bool)

(declare-fun res!454286 () Bool)

(assert (=> b!689881 (=> (not res!454286) (not e!392776))))

(assert (=> b!689881 (= res!454286 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19413 a!3626))))))

(declare-fun b!689882 () Bool)

(assert (=> b!689882 (= e!392771 (not (contains!3633 lt!316345 k0!2843)))))

(declare-fun b!689883 () Bool)

(declare-fun res!454269 () Bool)

(assert (=> b!689883 (=> (not res!454269) (not e!392776))))

(assert (=> b!689883 (= res!454269 (not (contains!3633 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!689884 () Bool)

(declare-fun Unit!24340 () Unit!24336)

(assert (=> b!689884 (= e!392768 Unit!24340)))

(declare-fun b!689885 () Bool)

(assert (=> b!689885 (= e!392776 (not e!392777))))

(declare-fun res!454278 () Bool)

(assert (=> b!689885 (=> res!454278 e!392777)))

(assert (=> b!689885 (= res!454278 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (=> b!689885 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!316345)))

(declare-fun lt!316349 () Unit!24336)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39729 (_ BitVec 64) (_ BitVec 32) List!12981 List!12981) Unit!24336)

(assert (=> b!689885 (= lt!316349 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!316345))))

(declare-fun -!206 (List!12981 (_ BitVec 64)) List!12981)

(assert (=> b!689885 (= (-!206 lt!316345 k0!2843) acc!681)))

(assert (=> b!689885 (= lt!316345 ($colon$colon!404 acc!681 k0!2843))))

(declare-fun lt!316352 () Unit!24336)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12981) Unit!24336)

(assert (=> b!689885 (= lt!316352 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(assert (=> b!689885 (subseq!242 acc!681 acc!681)))

(declare-fun lt!316353 () Unit!24336)

(assert (=> b!689885 (= lt!316353 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!689885 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!316354 () Unit!24336)

(assert (=> b!689885 (= lt!316354 e!392773)))

(declare-fun c!78166 () Bool)

(assert (=> b!689885 (= c!78166 (validKeyInArray!0 (select (arr!19033 a!3626) from!3004)))))

(declare-fun lt!316348 () Unit!24336)

(assert (=> b!689885 (= lt!316348 e!392768)))

(declare-fun c!78167 () Bool)

(assert (=> b!689885 (= c!78167 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!689885 (arrayContainsKey!0 lt!316350 k0!2843 from!3004)))

(assert (=> b!689885 (= lt!316350 (array!39730 (store (arr!19033 a!3626) i!1382 k0!2843) (size!19413 a!3626)))))

(declare-fun b!689886 () Bool)

(assert (=> b!689886 (= e!392774 (contains!3633 lt!316345 k0!2843))))

(declare-fun b!689887 () Bool)

(declare-fun res!454272 () Bool)

(assert (=> b!689887 (=> (not res!454272) (not e!392776))))

(assert (=> b!689887 (= res!454272 (noDuplicate!907 acc!681))))

(assert (= (and start!61650 res!454277) b!689887))

(assert (= (and b!689887 res!454272) b!689883))

(assert (= (and b!689883 res!454269) b!689863))

(assert (= (and b!689863 res!454285) b!689880))

(assert (= (and b!689880 res!454282) b!689873))

(assert (= (and b!689880 (not res!454287)) b!689875))

(assert (= (and b!689875 res!454276) b!689868))

(assert (= (and b!689880 res!454270) b!689872))

(assert (= (and b!689872 res!454281) b!689864))

(assert (= (and b!689864 res!454268) b!689881))

(assert (= (and b!689881 res!454286) b!689869))

(assert (= (and b!689869 res!454280) b!689865))

(assert (= (and b!689865 res!454271) b!689878))

(assert (= (and b!689878 res!454267) b!689885))

(assert (= (and b!689885 c!78167) b!689879))

(assert (= (and b!689885 (not c!78167)) b!689884))

(assert (= (and b!689885 c!78166) b!689870))

(assert (= (and b!689885 (not c!78166)) b!689867))

(assert (= (and b!689885 (not res!454278)) b!689862))

(assert (= (and b!689862 (not res!454275)) b!689876))

(assert (= (and b!689876 (not res!454273)) b!689871))

(assert (= (and b!689871 (not res!454283)) b!689877))

(assert (= (and b!689877 (not res!454288)) b!689882))

(assert (= (and b!689877 res!454279) b!689866))

(assert (= (and b!689866 (not res!454274)) b!689886))

(assert (= (and b!689877 (not res!454284)) b!689874))

(declare-fun m!653953 () Bool)

(assert (=> b!689871 m!653953))

(declare-fun m!653955 () Bool)

(assert (=> b!689864 m!653955))

(declare-fun m!653957 () Bool)

(assert (=> b!689872 m!653957))

(declare-fun m!653959 () Bool)

(assert (=> b!689870 m!653959))

(declare-fun m!653961 () Bool)

(assert (=> b!689870 m!653961))

(declare-fun m!653963 () Bool)

(assert (=> b!689870 m!653963))

(declare-fun m!653965 () Bool)

(assert (=> b!689870 m!653965))

(assert (=> b!689870 m!653961))

(assert (=> b!689870 m!653963))

(declare-fun m!653967 () Bool)

(assert (=> b!689870 m!653967))

(declare-fun m!653969 () Bool)

(assert (=> b!689870 m!653969))

(declare-fun m!653971 () Bool)

(assert (=> start!61650 m!653971))

(declare-fun m!653973 () Bool)

(assert (=> b!689863 m!653973))

(declare-fun m!653975 () Bool)

(assert (=> b!689865 m!653975))

(declare-fun m!653977 () Bool)

(assert (=> b!689885 m!653977))

(assert (=> b!689885 m!653959))

(declare-fun m!653979 () Bool)

(assert (=> b!689885 m!653979))

(assert (=> b!689885 m!653961))

(declare-fun m!653981 () Bool)

(assert (=> b!689885 m!653981))

(declare-fun m!653983 () Bool)

(assert (=> b!689885 m!653983))

(declare-fun m!653985 () Bool)

(assert (=> b!689885 m!653985))

(assert (=> b!689885 m!653967))

(declare-fun m!653987 () Bool)

(assert (=> b!689885 m!653987))

(declare-fun m!653989 () Bool)

(assert (=> b!689885 m!653989))

(assert (=> b!689885 m!653961))

(declare-fun m!653991 () Bool)

(assert (=> b!689885 m!653991))

(assert (=> b!689885 m!653969))

(declare-fun m!653993 () Bool)

(assert (=> b!689885 m!653993))

(declare-fun m!653995 () Bool)

(assert (=> b!689883 m!653995))

(declare-fun m!653997 () Bool)

(assert (=> b!689876 m!653997))

(declare-fun m!653999 () Bool)

(assert (=> b!689886 m!653999))

(declare-fun m!654001 () Bool)

(assert (=> b!689879 m!654001))

(declare-fun m!654003 () Bool)

(assert (=> b!689874 m!654003))

(declare-fun m!654005 () Bool)

(assert (=> b!689874 m!654005))

(declare-fun m!654007 () Bool)

(assert (=> b!689874 m!654007))

(declare-fun m!654009 () Bool)

(assert (=> b!689873 m!654009))

(assert (=> b!689868 m!654009))

(declare-fun m!654011 () Bool)

(assert (=> b!689887 m!654011))

(declare-fun m!654013 () Bool)

(assert (=> b!689862 m!654013))

(assert (=> b!689882 m!653999))

(declare-fun m!654015 () Bool)

(assert (=> b!689869 m!654015))

(check-sat (not b!689887) (not b!689879) (not b!689871) (not b!689870) (not b!689863) (not b!689883) (not b!689865) (not b!689869) (not start!61650) (not b!689862) (not b!689886) (not b!689864) (not b!689868) (not b!689882) (not b!689885) (not b!689873) (not b!689876) (not b!689874) (not b!689872))
(check-sat)
(get-model)

(declare-fun d!95371 () Bool)

(assert (=> d!95371 (= ($colon$colon!404 acc!681 (select (arr!19033 a!3626) from!3004)) (Cons!12977 (select (arr!19033 a!3626) from!3004) acc!681))))

(assert (=> b!689870 d!95371))

(declare-fun d!95373 () Bool)

(declare-fun res!454430 () Bool)

(declare-fun e!392853 () Bool)

(assert (=> d!95373 (=> res!454430 e!392853)))

(get-info :version)

(assert (=> d!95373 (= res!454430 ((_ is Nil!12978) acc!681))))

(assert (=> d!95373 (= (subseq!242 acc!681 acc!681) e!392853)))

(declare-fun b!690055 () Bool)

(declare-fun e!392854 () Bool)

(assert (=> b!690055 (= e!392854 (subseq!242 acc!681 (t!19237 acc!681)))))

(declare-fun b!690052 () Bool)

(declare-fun e!392856 () Bool)

(assert (=> b!690052 (= e!392853 e!392856)))

(declare-fun res!454432 () Bool)

(assert (=> b!690052 (=> (not res!454432) (not e!392856))))

(assert (=> b!690052 (= res!454432 ((_ is Cons!12977) acc!681))))

(declare-fun b!690054 () Bool)

(declare-fun e!392855 () Bool)

(assert (=> b!690054 (= e!392855 (subseq!242 (t!19237 acc!681) (t!19237 acc!681)))))

(declare-fun b!690053 () Bool)

(assert (=> b!690053 (= e!392856 e!392854)))

(declare-fun res!454429 () Bool)

(assert (=> b!690053 (=> res!454429 e!392854)))

(assert (=> b!690053 (= res!454429 e!392855)))

(declare-fun res!454431 () Bool)

(assert (=> b!690053 (=> (not res!454431) (not e!392855))))

(assert (=> b!690053 (= res!454431 (= (h!14025 acc!681) (h!14025 acc!681)))))

(assert (= (and d!95373 (not res!454430)) b!690052))

(assert (= (and b!690052 res!454432) b!690053))

(assert (= (and b!690053 res!454431) b!690054))

(assert (= (and b!690053 (not res!454429)) b!690055))

(declare-fun m!654145 () Bool)

(assert (=> b!690055 m!654145))

(declare-fun m!654147 () Bool)

(assert (=> b!690054 m!654147))

(assert (=> b!689870 d!95373))

(declare-fun d!95375 () Bool)

(assert (=> d!95375 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!316423 () Unit!24336)

(declare-fun choose!80 (array!39729 List!12981 List!12981 (_ BitVec 32)) Unit!24336)

(assert (=> d!95375 (= lt!316423 (choose!80 a!3626 ($colon$colon!404 acc!681 (select (arr!19033 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> d!95375 (bvslt (size!19413 a!3626) #b01111111111111111111111111111111)))

(assert (=> d!95375 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!404 acc!681 (select (arr!19033 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)) lt!316423)))

(declare-fun bs!20225 () Bool)

(assert (= bs!20225 d!95375))

(assert (=> bs!20225 m!653959))

(assert (=> bs!20225 m!653963))

(declare-fun m!654149 () Bool)

(assert (=> bs!20225 m!654149))

(assert (=> b!689870 d!95375))

(declare-fun d!95377 () Bool)

(assert (=> d!95377 (subseq!242 acc!681 acc!681)))

(declare-fun lt!316426 () Unit!24336)

(declare-fun choose!36 (List!12981) Unit!24336)

(assert (=> d!95377 (= lt!316426 (choose!36 acc!681))))

(assert (=> d!95377 (= (lemmaListSubSeqRefl!0 acc!681) lt!316426)))

(declare-fun bs!20226 () Bool)

(assert (= bs!20226 d!95377))

(assert (=> bs!20226 m!653969))

(declare-fun m!654151 () Bool)

(assert (=> bs!20226 m!654151))

(assert (=> b!689870 d!95377))

(declare-fun b!690078 () Bool)

(declare-fun e!392879 () Bool)

(declare-fun call!34191 () Bool)

(assert (=> b!690078 (= e!392879 call!34191)))

(declare-fun b!690079 () Bool)

(assert (=> b!690079 (= e!392879 call!34191)))

(declare-fun b!690080 () Bool)

(declare-fun e!392877 () Bool)

(assert (=> b!690080 (= e!392877 e!392879)))

(declare-fun c!78182 () Bool)

(assert (=> b!690080 (= c!78182 (validKeyInArray!0 (select (arr!19033 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun d!95379 () Bool)

(declare-fun res!454453 () Bool)

(declare-fun e!392878 () Bool)

(assert (=> d!95379 (=> res!454453 e!392878)))

(assert (=> d!95379 (= res!454453 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19413 a!3626)))))

(assert (=> d!95379 (= (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681) e!392878)))

(declare-fun bm!34188 () Bool)

(assert (=> bm!34188 (= call!34191 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!78182 (Cons!12977 (select (arr!19033 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) acc!681) acc!681)))))

(declare-fun b!690081 () Bool)

(assert (=> b!690081 (= e!392878 e!392877)))

(declare-fun res!454452 () Bool)

(assert (=> b!690081 (=> (not res!454452) (not e!392877))))

(declare-fun e!392880 () Bool)

(assert (=> b!690081 (= res!454452 (not e!392880))))

(declare-fun res!454451 () Bool)

(assert (=> b!690081 (=> (not res!454451) (not e!392880))))

(assert (=> b!690081 (= res!454451 (validKeyInArray!0 (select (arr!19033 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!690082 () Bool)

(assert (=> b!690082 (= e!392880 (contains!3633 acc!681 (select (arr!19033 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(assert (= (and d!95379 (not res!454453)) b!690081))

(assert (= (and b!690081 res!454451) b!690082))

(assert (= (and b!690081 res!454452) b!690080))

(assert (= (and b!690080 c!78182) b!690079))

(assert (= (and b!690080 (not c!78182)) b!690078))

(assert (= (or b!690079 b!690078) bm!34188))

(declare-fun m!654165 () Bool)

(assert (=> b!690080 m!654165))

(assert (=> b!690080 m!654165))

(declare-fun m!654167 () Bool)

(assert (=> b!690080 m!654167))

(assert (=> bm!34188 m!654165))

(declare-fun m!654169 () Bool)

(assert (=> bm!34188 m!654169))

(assert (=> b!690081 m!654165))

(assert (=> b!690081 m!654165))

(assert (=> b!690081 m!654167))

(assert (=> b!690082 m!654165))

(assert (=> b!690082 m!654165))

(declare-fun m!654171 () Bool)

(assert (=> b!690082 m!654171))

(assert (=> b!689870 d!95379))

(declare-fun d!95395 () Bool)

(declare-fun lt!316438 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!305 (List!12981) (InoxSet (_ BitVec 64)))

(assert (=> d!95395 (= lt!316438 (select (content!305 acc!681) k0!2843))))

(declare-fun e!392899 () Bool)

(assert (=> d!95395 (= lt!316438 e!392899)))

(declare-fun res!454473 () Bool)

(assert (=> d!95395 (=> (not res!454473) (not e!392899))))

(assert (=> d!95395 (= res!454473 ((_ is Cons!12977) acc!681))))

(assert (=> d!95395 (= (contains!3633 acc!681 k0!2843) lt!316438)))

(declare-fun b!690099 () Bool)

(declare-fun e!392897 () Bool)

(assert (=> b!690099 (= e!392899 e!392897)))

(declare-fun res!454470 () Bool)

(assert (=> b!690099 (=> res!454470 e!392897)))

(assert (=> b!690099 (= res!454470 (= (h!14025 acc!681) k0!2843))))

(declare-fun b!690100 () Bool)

(assert (=> b!690100 (= e!392897 (contains!3633 (t!19237 acc!681) k0!2843))))

(assert (= (and d!95395 res!454473) b!690099))

(assert (= (and b!690099 (not res!454470)) b!690100))

(declare-fun m!654183 () Bool)

(assert (=> d!95395 m!654183))

(declare-fun m!654185 () Bool)

(assert (=> d!95395 m!654185))

(declare-fun m!654187 () Bool)

(assert (=> b!690100 m!654187))

(assert (=> b!689868 d!95395))

(declare-fun d!95401 () Bool)

(assert (=> d!95401 (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))

(declare-fun lt!316442 () Unit!24336)

(declare-fun choose!13 (array!39729 (_ BitVec 64) (_ BitVec 32)) Unit!24336)

(assert (=> d!95401 (= lt!316442 (choose!13 a!3626 k0!2843 from!3004))))

(assert (=> d!95401 (bvsge from!3004 #b00000000000000000000000000000000)))

(assert (=> d!95401 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004) lt!316442)))

(declare-fun bs!20228 () Bool)

(assert (= bs!20228 d!95401))

(assert (=> bs!20228 m!653975))

(declare-fun m!654203 () Bool)

(assert (=> bs!20228 m!654203))

(assert (=> b!689879 d!95401))

(declare-fun d!95409 () Bool)

(assert (=> d!95409 (= (validKeyInArray!0 k0!2843) (and (not (= k0!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!689869 d!95409))

(declare-fun d!95411 () Bool)

(declare-fun lt!316443 () Bool)

(assert (=> d!95411 (= lt!316443 (select (content!305 lt!316345) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!392918 () Bool)

(assert (=> d!95411 (= lt!316443 e!392918)))

(declare-fun res!454489 () Bool)

(assert (=> d!95411 (=> (not res!454489) (not e!392918))))

(assert (=> d!95411 (= res!454489 ((_ is Cons!12977) lt!316345))))

(assert (=> d!95411 (= (contains!3633 lt!316345 #b0000000000000000000000000000000000000000000000000000000000000000) lt!316443)))

(declare-fun b!690121 () Bool)

(declare-fun e!392917 () Bool)

(assert (=> b!690121 (= e!392918 e!392917)))

(declare-fun res!454488 () Bool)

(assert (=> b!690121 (=> res!454488 e!392917)))

(assert (=> b!690121 (= res!454488 (= (h!14025 lt!316345) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!690122 () Bool)

(assert (=> b!690122 (= e!392917 (contains!3633 (t!19237 lt!316345) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95411 res!454489) b!690121))

(assert (= (and b!690121 (not res!454488)) b!690122))

(declare-fun m!654205 () Bool)

(assert (=> d!95411 m!654205))

(declare-fun m!654207 () Bool)

(assert (=> d!95411 m!654207))

(declare-fun m!654209 () Bool)

(assert (=> b!690122 m!654209))

(assert (=> b!689876 d!95411))

(declare-fun d!95413 () Bool)

(declare-fun res!454501 () Bool)

(declare-fun e!392931 () Bool)

(assert (=> d!95413 (=> res!454501 e!392931)))

(assert (=> d!95413 (= res!454501 ((_ is Nil!12978) acc!681))))

(assert (=> d!95413 (= (noDuplicate!907 acc!681) e!392931)))

(declare-fun b!690136 () Bool)

(declare-fun e!392932 () Bool)

(assert (=> b!690136 (= e!392931 e!392932)))

(declare-fun res!454502 () Bool)

(assert (=> b!690136 (=> (not res!454502) (not e!392932))))

(assert (=> b!690136 (= res!454502 (not (contains!3633 (t!19237 acc!681) (h!14025 acc!681))))))

(declare-fun b!690137 () Bool)

(assert (=> b!690137 (= e!392932 (noDuplicate!907 (t!19237 acc!681)))))

(assert (= (and d!95413 (not res!454501)) b!690136))

(assert (= (and b!690136 res!454502) b!690137))

(declare-fun m!654225 () Bool)

(assert (=> b!690136 m!654225))

(declare-fun m!654227 () Bool)

(assert (=> b!690137 m!654227))

(assert (=> b!689887 d!95413))

(declare-fun b!690138 () Bool)

(declare-fun e!392935 () Bool)

(declare-fun call!34195 () Bool)

(assert (=> b!690138 (= e!392935 call!34195)))

(declare-fun b!690139 () Bool)

(assert (=> b!690139 (= e!392935 call!34195)))

(declare-fun b!690140 () Bool)

(declare-fun e!392933 () Bool)

(assert (=> b!690140 (= e!392933 e!392935)))

(declare-fun c!78186 () Bool)

(assert (=> b!690140 (= c!78186 (validKeyInArray!0 (select (arr!19033 a!3626) from!3004)))))

(declare-fun d!95423 () Bool)

(declare-fun res!454505 () Bool)

(declare-fun e!392934 () Bool)

(assert (=> d!95423 (=> res!454505 e!392934)))

(assert (=> d!95423 (= res!454505 (bvsge from!3004 (size!19413 a!3626)))))

(assert (=> d!95423 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!392934)))

(declare-fun bm!34192 () Bool)

(assert (=> bm!34192 (= call!34195 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!78186 (Cons!12977 (select (arr!19033 a!3626) from!3004) acc!681) acc!681)))))

(declare-fun b!690141 () Bool)

(assert (=> b!690141 (= e!392934 e!392933)))

(declare-fun res!454504 () Bool)

(assert (=> b!690141 (=> (not res!454504) (not e!392933))))

(declare-fun e!392936 () Bool)

(assert (=> b!690141 (= res!454504 (not e!392936))))

(declare-fun res!454503 () Bool)

(assert (=> b!690141 (=> (not res!454503) (not e!392936))))

(assert (=> b!690141 (= res!454503 (validKeyInArray!0 (select (arr!19033 a!3626) from!3004)))))

(declare-fun b!690142 () Bool)

(assert (=> b!690142 (= e!392936 (contains!3633 acc!681 (select (arr!19033 a!3626) from!3004)))))

(assert (= (and d!95423 (not res!454505)) b!690141))

(assert (= (and b!690141 res!454503) b!690142))

(assert (= (and b!690141 res!454504) b!690140))

(assert (= (and b!690140 c!78186) b!690139))

(assert (= (and b!690140 (not c!78186)) b!690138))

(assert (= (or b!690139 b!690138) bm!34192))

(assert (=> b!690140 m!653961))

(assert (=> b!690140 m!653961))

(assert (=> b!690140 m!653991))

(assert (=> bm!34192 m!653961))

(declare-fun m!654229 () Bool)

(assert (=> bm!34192 m!654229))

(assert (=> b!690141 m!653961))

(assert (=> b!690141 m!653961))

(assert (=> b!690141 m!653991))

(assert (=> b!690142 m!653961))

(assert (=> b!690142 m!653961))

(declare-fun m!654231 () Bool)

(assert (=> b!690142 m!654231))

(assert (=> b!689864 d!95423))

(declare-fun d!95425 () Bool)

(declare-fun lt!316448 () Bool)

(assert (=> d!95425 (= lt!316448 (select (content!305 lt!316345) k0!2843))))

(declare-fun e!392940 () Bool)

(assert (=> d!95425 (= lt!316448 e!392940)))

(declare-fun res!454509 () Bool)

(assert (=> d!95425 (=> (not res!454509) (not e!392940))))

(assert (=> d!95425 (= res!454509 ((_ is Cons!12977) lt!316345))))

(assert (=> d!95425 (= (contains!3633 lt!316345 k0!2843) lt!316448)))

(declare-fun b!690145 () Bool)

(declare-fun e!392939 () Bool)

(assert (=> b!690145 (= e!392940 e!392939)))

(declare-fun res!454508 () Bool)

(assert (=> b!690145 (=> res!454508 e!392939)))

(assert (=> b!690145 (= res!454508 (= (h!14025 lt!316345) k0!2843))))

(declare-fun b!690146 () Bool)

(assert (=> b!690146 (= e!392939 (contains!3633 (t!19237 lt!316345) k0!2843))))

(assert (= (and d!95425 res!454509) b!690145))

(assert (= (and b!690145 (not res!454508)) b!690146))

(assert (=> d!95425 m!654205))

(declare-fun m!654233 () Bool)

(assert (=> d!95425 m!654233))

(declare-fun m!654235 () Bool)

(assert (=> b!690146 m!654235))

(assert (=> b!689886 d!95425))

(declare-fun d!95427 () Bool)

(declare-fun res!454524 () Bool)

(declare-fun e!392957 () Bool)

(assert (=> d!95427 (=> res!454524 e!392957)))

(assert (=> d!95427 (= res!454524 (= (select (arr!19033 a!3626) #b00000000000000000000000000000000) k0!2843))))

(assert (=> d!95427 (= (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000) e!392957)))

(declare-fun b!690165 () Bool)

(declare-fun e!392958 () Bool)

(assert (=> b!690165 (= e!392957 e!392958)))

(declare-fun res!454525 () Bool)

(assert (=> b!690165 (=> (not res!454525) (not e!392958))))

(assert (=> b!690165 (= res!454525 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19413 a!3626)))))

(declare-fun b!690166 () Bool)

(assert (=> b!690166 (= e!392958 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!95427 (not res!454524)) b!690165))

(assert (= (and b!690165 res!454525) b!690166))

(declare-fun m!654241 () Bool)

(assert (=> d!95427 m!654241))

(declare-fun m!654243 () Bool)

(assert (=> b!690166 m!654243))

(assert (=> b!689865 d!95427))

(declare-fun d!95431 () Bool)

(declare-fun lt!316449 () Bool)

(assert (=> d!95431 (= lt!316449 (select (content!305 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!392960 () Bool)

(assert (=> d!95431 (= lt!316449 e!392960)))

(declare-fun res!454527 () Bool)

(assert (=> d!95431 (=> (not res!454527) (not e!392960))))

(assert (=> d!95431 (= res!454527 ((_ is Cons!12977) acc!681))))

(assert (=> d!95431 (= (contains!3633 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!316449)))

(declare-fun b!690167 () Bool)

(declare-fun e!392959 () Bool)

(assert (=> b!690167 (= e!392960 e!392959)))

(declare-fun res!454526 () Bool)

(assert (=> b!690167 (=> res!454526 e!392959)))

(assert (=> b!690167 (= res!454526 (= (h!14025 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!690168 () Bool)

(assert (=> b!690168 (= e!392959 (contains!3633 (t!19237 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95431 res!454527) b!690167))

(assert (= (and b!690167 (not res!454526)) b!690168))

(assert (=> d!95431 m!654183))

(declare-fun m!654245 () Bool)

(assert (=> d!95431 m!654245))

(declare-fun m!654247 () Bool)

(assert (=> b!690168 m!654247))

(assert (=> b!689863 d!95431))

(declare-fun d!95433 () Bool)

(assert (=> d!95433 (= (array_inv!14892 a!3626) (bvsge (size!19413 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!61650 d!95433))

(declare-fun b!690182 () Bool)

(declare-fun e!392975 () Bool)

(declare-fun call!34199 () Bool)

(assert (=> b!690182 (= e!392975 call!34199)))

(declare-fun b!690183 () Bool)

(assert (=> b!690183 (= e!392975 call!34199)))

(declare-fun b!690184 () Bool)

(declare-fun e!392973 () Bool)

(assert (=> b!690184 (= e!392973 e!392975)))

(declare-fun c!78190 () Bool)

(assert (=> b!690184 (= c!78190 (validKeyInArray!0 (select (arr!19033 lt!316350) from!3004)))))

(declare-fun d!95435 () Bool)

(declare-fun res!454541 () Bool)

(declare-fun e!392974 () Bool)

(assert (=> d!95435 (=> res!454541 e!392974)))

(assert (=> d!95435 (= res!454541 (bvsge from!3004 (size!19413 lt!316350)))))

(assert (=> d!95435 (= (arrayNoDuplicates!0 lt!316350 from!3004 acc!681) e!392974)))

(declare-fun bm!34196 () Bool)

(assert (=> bm!34196 (= call!34199 (arrayNoDuplicates!0 lt!316350 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!78190 (Cons!12977 (select (arr!19033 lt!316350) from!3004) acc!681) acc!681)))))

(declare-fun b!690185 () Bool)

(assert (=> b!690185 (= e!392974 e!392973)))

(declare-fun res!454540 () Bool)

(assert (=> b!690185 (=> (not res!454540) (not e!392973))))

(declare-fun e!392976 () Bool)

(assert (=> b!690185 (= res!454540 (not e!392976))))

(declare-fun res!454539 () Bool)

(assert (=> b!690185 (=> (not res!454539) (not e!392976))))

(assert (=> b!690185 (= res!454539 (validKeyInArray!0 (select (arr!19033 lt!316350) from!3004)))))

(declare-fun b!690186 () Bool)

(assert (=> b!690186 (= e!392976 (contains!3633 acc!681 (select (arr!19033 lt!316350) from!3004)))))

(assert (= (and d!95435 (not res!454541)) b!690185))

(assert (= (and b!690185 res!454539) b!690186))

(assert (= (and b!690185 res!454540) b!690184))

(assert (= (and b!690184 c!78190) b!690183))

(assert (= (and b!690184 (not c!78190)) b!690182))

(assert (= (or b!690183 b!690182) bm!34196))

(declare-fun m!654255 () Bool)

(assert (=> b!690184 m!654255))

(assert (=> b!690184 m!654255))

(declare-fun m!654257 () Bool)

(assert (=> b!690184 m!654257))

(assert (=> bm!34196 m!654255))

(declare-fun m!654259 () Bool)

(assert (=> bm!34196 m!654259))

(assert (=> b!690185 m!654255))

(assert (=> b!690185 m!654255))

(assert (=> b!690185 m!654257))

(assert (=> b!690186 m!654255))

(assert (=> b!690186 m!654255))

(declare-fun m!654261 () Bool)

(assert (=> b!690186 m!654261))

(assert (=> b!689874 d!95435))

(declare-fun b!690189 () Bool)

(declare-fun e!392981 () Bool)

(declare-fun call!34200 () Bool)

(assert (=> b!690189 (= e!392981 call!34200)))

(declare-fun b!690190 () Bool)

(assert (=> b!690190 (= e!392981 call!34200)))

(declare-fun b!690191 () Bool)

(declare-fun e!392979 () Bool)

(assert (=> b!690191 (= e!392979 e!392981)))

(declare-fun c!78191 () Bool)

(assert (=> b!690191 (= c!78191 (validKeyInArray!0 (select (arr!19033 lt!316350) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun d!95439 () Bool)

(declare-fun res!454546 () Bool)

(declare-fun e!392980 () Bool)

(assert (=> d!95439 (=> res!454546 e!392980)))

(assert (=> d!95439 (= res!454546 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19413 lt!316350)))))

(assert (=> d!95439 (= (arrayNoDuplicates!0 lt!316350 (bvadd #b00000000000000000000000000000001 from!3004) lt!316345) e!392980)))

(declare-fun bm!34197 () Bool)

(assert (=> bm!34197 (= call!34200 (arrayNoDuplicates!0 lt!316350 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!78191 (Cons!12977 (select (arr!19033 lt!316350) (bvadd #b00000000000000000000000000000001 from!3004)) lt!316345) lt!316345)))))

(declare-fun b!690192 () Bool)

(assert (=> b!690192 (= e!392980 e!392979)))

(declare-fun res!454545 () Bool)

(assert (=> b!690192 (=> (not res!454545) (not e!392979))))

(declare-fun e!392982 () Bool)

(assert (=> b!690192 (= res!454545 (not e!392982))))

(declare-fun res!454544 () Bool)

(assert (=> b!690192 (=> (not res!454544) (not e!392982))))

(assert (=> b!690192 (= res!454544 (validKeyInArray!0 (select (arr!19033 lt!316350) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!690193 () Bool)

(assert (=> b!690193 (= e!392982 (contains!3633 lt!316345 (select (arr!19033 lt!316350) (bvadd #b00000000000000000000000000000001 from!3004))))))

(assert (= (and d!95439 (not res!454546)) b!690192))

(assert (= (and b!690192 res!454544) b!690193))

(assert (= (and b!690192 res!454545) b!690191))

(assert (= (and b!690191 c!78191) b!690190))

(assert (= (and b!690191 (not c!78191)) b!690189))

(assert (= (or b!690190 b!690189) bm!34197))

(declare-fun m!654267 () Bool)

(assert (=> b!690191 m!654267))

(assert (=> b!690191 m!654267))

(declare-fun m!654271 () Bool)

(assert (=> b!690191 m!654271))

(assert (=> bm!34197 m!654267))

(declare-fun m!654277 () Bool)

(assert (=> bm!34197 m!654277))

(assert (=> b!690192 m!654267))

(assert (=> b!690192 m!654267))

(assert (=> b!690192 m!654271))

(assert (=> b!690193 m!654267))

(assert (=> b!690193 m!654267))

(declare-fun m!654281 () Bool)

(assert (=> b!690193 m!654281))

(assert (=> b!689874 d!95439))

(declare-fun d!95445 () Bool)

(declare-fun e!393005 () Bool)

(assert (=> d!95445 e!393005))

(declare-fun res!454566 () Bool)

(assert (=> d!95445 (=> (not res!454566) (not e!393005))))

(assert (=> d!95445 (= res!454566 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19413 a!3626))))))

(declare-fun lt!316457 () Unit!24336)

(declare-fun choose!41 (array!39729 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12981) Unit!24336)

(assert (=> d!95445 (= lt!316457 (choose!41 a!3626 k0!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) lt!316345))))

(assert (=> d!95445 (bvslt (size!19413 a!3626) #b01111111111111111111111111111111)))

(assert (=> d!95445 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k0!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) lt!316345) lt!316457)))

(declare-fun b!690219 () Bool)

(assert (=> b!690219 (= e!393005 (arrayNoDuplicates!0 (array!39730 (store (arr!19033 a!3626) i!1382 k0!2843) (size!19413 a!3626)) (bvadd #b00000000000000000000000000000001 from!3004) lt!316345))))

(assert (= (and d!95445 res!454566) b!690219))

(declare-fun m!654309 () Bool)

(assert (=> d!95445 m!654309))

(assert (=> b!690219 m!653983))

(declare-fun m!654311 () Bool)

(assert (=> b!690219 m!654311))

(assert (=> b!689874 d!95445))

(declare-fun b!690258 () Bool)

(declare-fun e!393037 () List!12981)

(declare-fun call!34209 () List!12981)

(assert (=> b!690258 (= e!393037 call!34209)))

(declare-fun b!690259 () Bool)

(assert (=> b!690259 (= e!393037 (Cons!12977 (h!14025 lt!316345) call!34209))))

(declare-fun b!690260 () Bool)

(declare-fun e!393036 () List!12981)

(assert (=> b!690260 (= e!393036 e!393037)))

(declare-fun c!78206 () Bool)

(assert (=> b!690260 (= c!78206 (= k0!2843 (h!14025 lt!316345)))))

(declare-fun d!95459 () Bool)

(declare-fun e!393038 () Bool)

(assert (=> d!95459 e!393038))

(declare-fun res!454585 () Bool)

(assert (=> d!95459 (=> (not res!454585) (not e!393038))))

(declare-fun lt!316469 () List!12981)

(declare-fun size!19416 (List!12981) Int)

(assert (=> d!95459 (= res!454585 (<= (size!19416 lt!316469) (size!19416 lt!316345)))))

(assert (=> d!95459 (= lt!316469 e!393036)))

(declare-fun c!78205 () Bool)

(assert (=> d!95459 (= c!78205 ((_ is Cons!12977) lt!316345))))

(assert (=> d!95459 (= (-!206 lt!316345 k0!2843) lt!316469)))

(declare-fun b!690261 () Bool)

(assert (=> b!690261 (= e!393036 Nil!12978)))

(declare-fun b!690262 () Bool)

(assert (=> b!690262 (= e!393038 (= (content!305 lt!316469) ((_ map and) (content!305 lt!316345) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) k0!2843 true)))))))

(declare-fun bm!34206 () Bool)

(assert (=> bm!34206 (= call!34209 (-!206 (t!19237 lt!316345) k0!2843))))

(assert (= (and d!95459 c!78205) b!690260))

(assert (= (and d!95459 (not c!78205)) b!690261))

(assert (= (and b!690260 c!78206) b!690258))

(assert (= (and b!690260 (not c!78206)) b!690259))

(assert (= (or b!690258 b!690259) bm!34206))

(assert (= (and d!95459 res!454585) b!690262))

(declare-fun m!654331 () Bool)

(assert (=> d!95459 m!654331))

(declare-fun m!654333 () Bool)

(assert (=> d!95459 m!654333))

(declare-fun m!654335 () Bool)

(assert (=> b!690262 m!654335))

(assert (=> b!690262 m!654205))

(declare-fun m!654337 () Bool)

(assert (=> b!690262 m!654337))

(declare-fun m!654339 () Bool)

(assert (=> bm!34206 m!654339))

(assert (=> b!689885 d!95459))

(assert (=> b!689885 d!95373))

(declare-fun d!95469 () Bool)

(assert (=> d!95469 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!316345)))

(declare-fun lt!316474 () Unit!24336)

(declare-fun choose!66 (array!39729 (_ BitVec 64) (_ BitVec 32) List!12981 List!12981) Unit!24336)

(assert (=> d!95469 (= lt!316474 (choose!66 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!316345))))

(assert (=> d!95469 (bvslt (size!19413 a!3626) #b01111111111111111111111111111111)))

(assert (=> d!95469 (= (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!316345) lt!316474)))

(declare-fun bs!20232 () Bool)

(assert (= bs!20232 d!95469))

(assert (=> bs!20232 m!653985))

(declare-fun m!654349 () Bool)

(assert (=> bs!20232 m!654349))

(assert (=> b!689885 d!95469))

(declare-fun b!690269 () Bool)

(declare-fun e!393047 () Bool)

(declare-fun call!34210 () Bool)

(assert (=> b!690269 (= e!393047 call!34210)))

(declare-fun b!690270 () Bool)

(assert (=> b!690270 (= e!393047 call!34210)))

(declare-fun b!690271 () Bool)

(declare-fun e!393045 () Bool)

(assert (=> b!690271 (= e!393045 e!393047)))

(declare-fun c!78207 () Bool)

(assert (=> b!690271 (= c!78207 (validKeyInArray!0 (select (arr!19033 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun d!95477 () Bool)

(declare-fun res!454594 () Bool)

(declare-fun e!393046 () Bool)

(assert (=> d!95477 (=> res!454594 e!393046)))

(assert (=> d!95477 (= res!454594 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19413 a!3626)))))

(assert (=> d!95477 (= (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!316345) e!393046)))

(declare-fun bm!34207 () Bool)

(assert (=> bm!34207 (= call!34210 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!78207 (Cons!12977 (select (arr!19033 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) lt!316345) lt!316345)))))

(declare-fun b!690272 () Bool)

(assert (=> b!690272 (= e!393046 e!393045)))

(declare-fun res!454593 () Bool)

(assert (=> b!690272 (=> (not res!454593) (not e!393045))))

(declare-fun e!393048 () Bool)

(assert (=> b!690272 (= res!454593 (not e!393048))))

(declare-fun res!454592 () Bool)

(assert (=> b!690272 (=> (not res!454592) (not e!393048))))

(assert (=> b!690272 (= res!454592 (validKeyInArray!0 (select (arr!19033 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!690273 () Bool)

(assert (=> b!690273 (= e!393048 (contains!3633 lt!316345 (select (arr!19033 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(assert (= (and d!95477 (not res!454594)) b!690272))

(assert (= (and b!690272 res!454592) b!690273))

(assert (= (and b!690272 res!454593) b!690271))

(assert (= (and b!690271 c!78207) b!690270))

(assert (= (and b!690271 (not c!78207)) b!690269))

(assert (= (or b!690270 b!690269) bm!34207))

(assert (=> b!690271 m!654165))

(assert (=> b!690271 m!654165))

(assert (=> b!690271 m!654167))

(assert (=> bm!34207 m!654165))

(declare-fun m!654357 () Bool)

(assert (=> bm!34207 m!654357))

(assert (=> b!690272 m!654165))

(assert (=> b!690272 m!654165))

(assert (=> b!690272 m!654167))

(assert (=> b!690273 m!654165))

(assert (=> b!690273 m!654165))

(declare-fun m!654363 () Bool)

(assert (=> b!690273 m!654363))

(assert (=> b!689885 d!95477))

(declare-fun d!95483 () Bool)

(declare-fun res!454598 () Bool)

(declare-fun e!393053 () Bool)

(assert (=> d!95483 (=> res!454598 e!393053)))

(assert (=> d!95483 (= res!454598 (= (select (arr!19033 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) k0!2843))))

(assert (=> d!95483 (= (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)) e!393053)))

(declare-fun b!690279 () Bool)

(declare-fun e!393054 () Bool)

(assert (=> b!690279 (= e!393053 e!393054)))

(declare-fun res!454599 () Bool)

(assert (=> b!690279 (=> (not res!454599) (not e!393054))))

(assert (=> b!690279 (= res!454599 (bvslt (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (size!19413 a!3626)))))

(declare-fun b!690280 () Bool)

(assert (=> b!690280 (= e!393054 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!95483 (not res!454598)) b!690279))

(assert (= (and b!690279 res!454599) b!690280))

(assert (=> d!95483 m!654165))

(declare-fun m!654367 () Bool)

(assert (=> b!690280 m!654367))

(assert (=> b!689885 d!95483))

(declare-fun d!95487 () Bool)

(assert (=> d!95487 (= (-!206 ($colon$colon!404 acc!681 k0!2843) k0!2843) acc!681)))

(declare-fun lt!316483 () Unit!24336)

(declare-fun choose!16 ((_ BitVec 64) List!12981) Unit!24336)

(assert (=> d!95487 (= lt!316483 (choose!16 k0!2843 acc!681))))

(assert (=> d!95487 (not (contains!3633 acc!681 k0!2843))))

(assert (=> d!95487 (= (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681) lt!316483)))

(declare-fun bs!20235 () Bool)

(assert (= bs!20235 d!95487))

(assert (=> bs!20235 m!653989))

(assert (=> bs!20235 m!653989))

(declare-fun m!654383 () Bool)

(assert (=> bs!20235 m!654383))

(declare-fun m!654385 () Bool)

(assert (=> bs!20235 m!654385))

(assert (=> bs!20235 m!654009))

(assert (=> b!689885 d!95487))

(declare-fun d!95501 () Bool)

(declare-fun res!454610 () Bool)

(declare-fun e!393072 () Bool)

(assert (=> d!95501 (=> res!454610 e!393072)))

(assert (=> d!95501 (= res!454610 (= (select (arr!19033 lt!316350) from!3004) k0!2843))))

(assert (=> d!95501 (= (arrayContainsKey!0 lt!316350 k0!2843 from!3004) e!393072)))

(declare-fun b!690303 () Bool)

(declare-fun e!393073 () Bool)

(assert (=> b!690303 (= e!393072 e!393073)))

(declare-fun res!454611 () Bool)

(assert (=> b!690303 (=> (not res!454611) (not e!393073))))

(assert (=> b!690303 (= res!454611 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19413 lt!316350)))))

(declare-fun b!690304 () Bool)

(assert (=> b!690304 (= e!393073 (arrayContainsKey!0 lt!316350 k0!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!95501 (not res!454610)) b!690303))

(assert (= (and b!690303 res!454611) b!690304))

(assert (=> d!95501 m!654255))

(declare-fun m!654387 () Bool)

(assert (=> b!690304 m!654387))

(assert (=> b!689885 d!95501))

(assert (=> b!689885 d!95377))

(declare-fun d!95503 () Bool)

(assert (=> d!95503 (= (validKeyInArray!0 (select (arr!19033 a!3626) from!3004)) (and (not (= (select (arr!19033 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19033 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!689885 d!95503))

(declare-fun d!95505 () Bool)

(assert (=> d!95505 (= ($colon$colon!404 acc!681 k0!2843) (Cons!12977 k0!2843 acc!681))))

(assert (=> b!689885 d!95505))

(assert (=> b!689885 d!95379))

(declare-fun b!690305 () Bool)

(declare-fun e!393076 () Bool)

(declare-fun call!34216 () Bool)

(assert (=> b!690305 (= e!393076 call!34216)))

(declare-fun b!690306 () Bool)

(assert (=> b!690306 (= e!393076 call!34216)))

(declare-fun b!690307 () Bool)

(declare-fun e!393074 () Bool)

(assert (=> b!690307 (= e!393074 e!393076)))

(declare-fun c!78215 () Bool)

(assert (=> b!690307 (= c!78215 (validKeyInArray!0 (select (arr!19033 a!3626) #b00000000000000000000000000000000)))))

(declare-fun d!95507 () Bool)

(declare-fun res!454614 () Bool)

(declare-fun e!393075 () Bool)

(assert (=> d!95507 (=> res!454614 e!393075)))

(assert (=> d!95507 (= res!454614 (bvsge #b00000000000000000000000000000000 (size!19413 a!3626)))))

(assert (=> d!95507 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12978) e!393075)))

(declare-fun bm!34213 () Bool)

(assert (=> bm!34213 (= call!34216 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!78215 (Cons!12977 (select (arr!19033 a!3626) #b00000000000000000000000000000000) Nil!12978) Nil!12978)))))

(declare-fun b!690308 () Bool)

(assert (=> b!690308 (= e!393075 e!393074)))

(declare-fun res!454613 () Bool)

(assert (=> b!690308 (=> (not res!454613) (not e!393074))))

(declare-fun e!393077 () Bool)

(assert (=> b!690308 (= res!454613 (not e!393077))))

(declare-fun res!454612 () Bool)

(assert (=> b!690308 (=> (not res!454612) (not e!393077))))

(assert (=> b!690308 (= res!454612 (validKeyInArray!0 (select (arr!19033 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!690309 () Bool)

(assert (=> b!690309 (= e!393077 (contains!3633 Nil!12978 (select (arr!19033 a!3626) #b00000000000000000000000000000000)))))

(assert (= (and d!95507 (not res!454614)) b!690308))

(assert (= (and b!690308 res!454612) b!690309))

(assert (= (and b!690308 res!454613) b!690307))

(assert (= (and b!690307 c!78215) b!690306))

(assert (= (and b!690307 (not c!78215)) b!690305))

(assert (= (or b!690306 b!690305) bm!34213))

(assert (=> b!690307 m!654241))

(assert (=> b!690307 m!654241))

(declare-fun m!654395 () Bool)

(assert (=> b!690307 m!654395))

(assert (=> bm!34213 m!654241))

(declare-fun m!654397 () Bool)

(assert (=> bm!34213 m!654397))

(assert (=> b!690308 m!654241))

(assert (=> b!690308 m!654241))

(assert (=> b!690308 m!654395))

(assert (=> b!690309 m!654241))

(assert (=> b!690309 m!654241))

(declare-fun m!654403 () Bool)

(assert (=> b!690309 m!654403))

(assert (=> b!689872 d!95507))

(declare-fun d!95511 () Bool)

(declare-fun lt!316486 () Bool)

(assert (=> d!95511 (= lt!316486 (select (content!305 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!393085 () Bool)

(assert (=> d!95511 (= lt!316486 e!393085)))

(declare-fun res!454621 () Bool)

(assert (=> d!95511 (=> (not res!454621) (not e!393085))))

(assert (=> d!95511 (= res!454621 ((_ is Cons!12977) acc!681))))

(assert (=> d!95511 (= (contains!3633 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!316486)))

(declare-fun b!690317 () Bool)

(declare-fun e!393084 () Bool)

(assert (=> b!690317 (= e!393085 e!393084)))

(declare-fun res!454620 () Bool)

(assert (=> b!690317 (=> res!454620 e!393084)))

(assert (=> b!690317 (= res!454620 (= (h!14025 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!690318 () Bool)

(assert (=> b!690318 (= e!393084 (contains!3633 (t!19237 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95511 res!454621) b!690317))

(assert (= (and b!690317 (not res!454620)) b!690318))

(assert (=> d!95511 m!654183))

(declare-fun m!654409 () Bool)

(assert (=> d!95511 m!654409))

(declare-fun m!654411 () Bool)

(assert (=> b!690318 m!654411))

(assert (=> b!689883 d!95511))

(declare-fun d!95515 () Bool)

(declare-fun res!454622 () Bool)

(declare-fun e!393086 () Bool)

(assert (=> d!95515 (=> res!454622 e!393086)))

(assert (=> d!95515 (= res!454622 ((_ is Nil!12978) lt!316345))))

(assert (=> d!95515 (= (noDuplicate!907 lt!316345) e!393086)))

(declare-fun b!690319 () Bool)

(declare-fun e!393087 () Bool)

(assert (=> b!690319 (= e!393086 e!393087)))

(declare-fun res!454623 () Bool)

(assert (=> b!690319 (=> (not res!454623) (not e!393087))))

(assert (=> b!690319 (= res!454623 (not (contains!3633 (t!19237 lt!316345) (h!14025 lt!316345))))))

(declare-fun b!690320 () Bool)

(assert (=> b!690320 (= e!393087 (noDuplicate!907 (t!19237 lt!316345)))))

(assert (= (and d!95515 (not res!454622)) b!690319))

(assert (= (and b!690319 res!454623) b!690320))

(declare-fun m!654413 () Bool)

(assert (=> b!690319 m!654413))

(declare-fun m!654415 () Bool)

(assert (=> b!690320 m!654415))

(assert (=> b!689862 d!95515))

(assert (=> b!689873 d!95395))

(declare-fun d!95517 () Bool)

(declare-fun lt!316487 () Bool)

(assert (=> d!95517 (= lt!316487 (select (content!305 lt!316345) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!393089 () Bool)

(assert (=> d!95517 (= lt!316487 e!393089)))

(declare-fun res!454625 () Bool)

(assert (=> d!95517 (=> (not res!454625) (not e!393089))))

(assert (=> d!95517 (= res!454625 ((_ is Cons!12977) lt!316345))))

(assert (=> d!95517 (= (contains!3633 lt!316345 #b1000000000000000000000000000000000000000000000000000000000000000) lt!316487)))

(declare-fun b!690321 () Bool)

(declare-fun e!393088 () Bool)

(assert (=> b!690321 (= e!393089 e!393088)))

(declare-fun res!454624 () Bool)

(assert (=> b!690321 (=> res!454624 e!393088)))

(assert (=> b!690321 (= res!454624 (= (h!14025 lt!316345) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!690322 () Bool)

(assert (=> b!690322 (= e!393088 (contains!3633 (t!19237 lt!316345) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95517 res!454625) b!690321))

(assert (= (and b!690321 (not res!454624)) b!690322))

(assert (=> d!95517 m!654205))

(declare-fun m!654417 () Bool)

(assert (=> d!95517 m!654417))

(declare-fun m!654419 () Bool)

(assert (=> b!690322 m!654419))

(assert (=> b!689871 d!95517))

(assert (=> b!689882 d!95425))

(check-sat (not b!690320) (not b!690081) (not d!95445) (not b!690309) (not d!95411) (not b!690137) (not b!690184) (not d!95377) (not b!690082) (not d!95469) (not b!690186) (not d!95395) (not b!690319) (not b!690192) (not b!690219) (not b!690271) (not b!690146) (not b!690307) (not b!690185) (not b!690273) (not b!690272) (not d!95517) (not d!95511) (not bm!34206) (not b!690055) (not b!690054) (not b!690318) (not bm!34213) (not d!95459) (not b!690140) (not bm!34196) (not bm!34207) (not b!690122) (not d!95401) (not b!690168) (not b!690136) (not b!690080) (not b!690142) (not b!690141) (not b!690322) (not b!690304) (not d!95425) (not d!95487) (not bm!34192) (not d!95431) (not bm!34197) (not b!690100) (not b!690308) (not b!690191) (not b!690262) (not b!690166) (not bm!34188) (not d!95375) (not b!690193) (not b!690280))
(check-sat)
