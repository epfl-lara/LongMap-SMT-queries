; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60774 () Bool)

(assert start!60774)

(declare-fun b!681862 () Bool)

(declare-fun e!388479 () Bool)

(declare-fun e!388481 () Bool)

(assert (=> b!681862 (= e!388479 (not e!388481))))

(declare-fun res!447890 () Bool)

(assert (=> b!681862 (=> res!447890 e!388481)))

(declare-datatypes ((array!39522 0))(
  ( (array!39523 (arr!18943 (Array (_ BitVec 32) (_ BitVec 64))) (size!19307 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39522)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!681862 (= res!447890 (not (validKeyInArray!0 (select (arr!18943 a!3626) from!3004))))))

(declare-datatypes ((Unit!23889 0))(
  ( (Unit!23890) )
))
(declare-fun lt!313432 () Unit!23889)

(declare-fun e!388482 () Unit!23889)

(assert (=> b!681862 (= lt!313432 e!388482)))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun c!77363 () Bool)

(declare-fun arrayContainsKey!0 (array!39522 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!681862 (= c!77363 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!681862 (arrayContainsKey!0 (array!39523 (store (arr!18943 a!3626) i!1382 k0!2843) (size!19307 a!3626)) k0!2843 from!3004)))

(declare-fun b!681863 () Bool)

(declare-fun res!447875 () Bool)

(assert (=> b!681863 (=> (not res!447875) (not e!388479))))

(declare-datatypes ((List!12891 0))(
  ( (Nil!12888) (Cons!12887 (h!13935 (_ BitVec 64)) (t!19120 List!12891)) )
))
(declare-fun acc!681 () List!12891)

(declare-fun contains!3543 (List!12891 (_ BitVec 64)) Bool)

(assert (=> b!681863 (= res!447875 (not (contains!3543 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!681864 () Bool)

(declare-fun res!447877 () Bool)

(assert (=> b!681864 (=> (not res!447877) (not e!388479))))

(declare-fun arrayNoDuplicates!0 (array!39522 (_ BitVec 32) List!12891) Bool)

(assert (=> b!681864 (= res!447877 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12888))))

(declare-fun res!447880 () Bool)

(assert (=> start!60774 (=> (not res!447880) (not e!388479))))

(assert (=> start!60774 (= res!447880 (and (bvslt (size!19307 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19307 a!3626))))))

(assert (=> start!60774 e!388479))

(assert (=> start!60774 true))

(declare-fun array_inv!14802 (array!39522) Bool)

(assert (=> start!60774 (array_inv!14802 a!3626)))

(declare-fun b!681865 () Bool)

(declare-fun res!447874 () Bool)

(assert (=> b!681865 (=> (not res!447874) (not e!388479))))

(declare-fun noDuplicate!817 (List!12891) Bool)

(assert (=> b!681865 (= res!447874 (noDuplicate!817 acc!681))))

(declare-fun b!681866 () Bool)

(declare-fun res!447873 () Bool)

(declare-fun e!388476 () Bool)

(assert (=> b!681866 (=> res!447873 e!388476)))

(declare-fun lt!313431 () List!12891)

(assert (=> b!681866 (= res!447873 (contains!3543 lt!313431 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!681867 () Bool)

(declare-fun res!447879 () Bool)

(assert (=> b!681867 (=> (not res!447879) (not e!388479))))

(declare-fun e!388478 () Bool)

(assert (=> b!681867 (= res!447879 e!388478)))

(declare-fun res!447886 () Bool)

(assert (=> b!681867 (=> res!447886 e!388478)))

(declare-fun e!388480 () Bool)

(assert (=> b!681867 (= res!447886 e!388480)))

(declare-fun res!447878 () Bool)

(assert (=> b!681867 (=> (not res!447878) (not e!388480))))

(assert (=> b!681867 (= res!447878 (bvsgt from!3004 i!1382))))

(declare-fun b!681868 () Bool)

(declare-fun e!388477 () Bool)

(assert (=> b!681868 (= e!388477 (not (contains!3543 acc!681 k0!2843)))))

(declare-fun b!681869 () Bool)

(declare-fun res!447884 () Bool)

(assert (=> b!681869 (=> res!447884 e!388476)))

(assert (=> b!681869 (= res!447884 (contains!3543 lt!313431 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!681870 () Bool)

(declare-fun Unit!23891 () Unit!23889)

(assert (=> b!681870 (= e!388482 Unit!23891)))

(declare-fun lt!313430 () Unit!23889)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39522 (_ BitVec 64) (_ BitVec 32)) Unit!23889)

(assert (=> b!681870 (= lt!313430 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!681870 false))

(declare-fun b!681871 () Bool)

(declare-fun res!447892 () Bool)

(assert (=> b!681871 (=> (not res!447892) (not e!388479))))

(assert (=> b!681871 (= res!447892 (not (contains!3543 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!681872 () Bool)

(assert (=> b!681872 (= e!388478 e!388477)))

(declare-fun res!447891 () Bool)

(assert (=> b!681872 (=> (not res!447891) (not e!388477))))

(assert (=> b!681872 (= res!447891 (bvsle from!3004 i!1382))))

(declare-fun b!681873 () Bool)

(declare-fun res!447876 () Bool)

(assert (=> b!681873 (=> (not res!447876) (not e!388479))))

(assert (=> b!681873 (= res!447876 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!681874 () Bool)

(declare-fun Unit!23892 () Unit!23889)

(assert (=> b!681874 (= e!388482 Unit!23892)))

(declare-fun b!681875 () Bool)

(declare-fun res!447881 () Bool)

(assert (=> b!681875 (=> (not res!447881) (not e!388479))))

(assert (=> b!681875 (= res!447881 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!681876 () Bool)

(assert (=> b!681876 (= e!388480 (contains!3543 acc!681 k0!2843))))

(declare-fun b!681877 () Bool)

(declare-fun res!447885 () Bool)

(assert (=> b!681877 (=> res!447885 e!388476)))

(assert (=> b!681877 (= res!447885 (not (noDuplicate!817 lt!313431)))))

(declare-fun b!681878 () Bool)

(declare-fun res!447887 () Bool)

(assert (=> b!681878 (=> res!447887 e!388476)))

(declare-fun subseq!152 (List!12891 List!12891) Bool)

(assert (=> b!681878 (= res!447887 (not (subseq!152 acc!681 lt!313431)))))

(declare-fun b!681879 () Bool)

(declare-fun res!447888 () Bool)

(assert (=> b!681879 (=> (not res!447888) (not e!388479))))

(assert (=> b!681879 (= res!447888 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19307 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!681880 () Bool)

(assert (=> b!681880 (= e!388481 e!388476)))

(declare-fun res!447882 () Bool)

(assert (=> b!681880 (=> res!447882 e!388476)))

(assert (=> b!681880 (= res!447882 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!314 (List!12891 (_ BitVec 64)) List!12891)

(assert (=> b!681880 (= lt!313431 ($colon$colon!314 acc!681 (select (arr!18943 a!3626) from!3004)))))

(assert (=> b!681880 (subseq!152 acc!681 acc!681)))

(declare-fun lt!313429 () Unit!23889)

(declare-fun lemmaListSubSeqRefl!0 (List!12891) Unit!23889)

(assert (=> b!681880 (= lt!313429 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!681881 () Bool)

(declare-fun res!447889 () Bool)

(assert (=> b!681881 (=> (not res!447889) (not e!388479))))

(assert (=> b!681881 (= res!447889 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19307 a!3626))))))

(declare-fun b!681882 () Bool)

(assert (=> b!681882 (= e!388476 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!313431))))

(declare-fun lt!313428 () Unit!23889)

(declare-fun noDuplicateSubseq!26 (List!12891 List!12891) Unit!23889)

(assert (=> b!681882 (= lt!313428 (noDuplicateSubseq!26 acc!681 lt!313431))))

(declare-fun b!681883 () Bool)

(declare-fun res!447883 () Bool)

(assert (=> b!681883 (=> (not res!447883) (not e!388479))))

(assert (=> b!681883 (= res!447883 (validKeyInArray!0 k0!2843))))

(assert (= (and start!60774 res!447880) b!681865))

(assert (= (and b!681865 res!447874) b!681863))

(assert (= (and b!681863 res!447875) b!681871))

(assert (= (and b!681871 res!447892) b!681867))

(assert (= (and b!681867 res!447878) b!681876))

(assert (= (and b!681867 (not res!447886)) b!681872))

(assert (= (and b!681872 res!447891) b!681868))

(assert (= (and b!681867 res!447879) b!681864))

(assert (= (and b!681864 res!447877) b!681873))

(assert (= (and b!681873 res!447876) b!681881))

(assert (= (and b!681881 res!447889) b!681883))

(assert (= (and b!681883 res!447883) b!681875))

(assert (= (and b!681875 res!447881) b!681879))

(assert (= (and b!681879 res!447888) b!681862))

(assert (= (and b!681862 c!77363) b!681870))

(assert (= (and b!681862 (not c!77363)) b!681874))

(assert (= (and b!681862 (not res!447890)) b!681880))

(assert (= (and b!681880 (not res!447882)) b!681877))

(assert (= (and b!681877 (not res!447885)) b!681866))

(assert (= (and b!681866 (not res!447873)) b!681869))

(assert (= (and b!681869 (not res!447884)) b!681878))

(assert (= (and b!681878 (not res!447887)) b!681882))

(declare-fun m!647161 () Bool)

(assert (=> b!681870 m!647161))

(declare-fun m!647163 () Bool)

(assert (=> b!681873 m!647163))

(declare-fun m!647165 () Bool)

(assert (=> b!681869 m!647165))

(declare-fun m!647167 () Bool)

(assert (=> b!681877 m!647167))

(declare-fun m!647169 () Bool)

(assert (=> b!681875 m!647169))

(declare-fun m!647171 () Bool)

(assert (=> b!681880 m!647171))

(assert (=> b!681880 m!647171))

(declare-fun m!647173 () Bool)

(assert (=> b!681880 m!647173))

(declare-fun m!647175 () Bool)

(assert (=> b!681880 m!647175))

(declare-fun m!647177 () Bool)

(assert (=> b!681880 m!647177))

(declare-fun m!647179 () Bool)

(assert (=> b!681878 m!647179))

(declare-fun m!647181 () Bool)

(assert (=> b!681865 m!647181))

(declare-fun m!647183 () Bool)

(assert (=> b!681866 m!647183))

(declare-fun m!647185 () Bool)

(assert (=> b!681863 m!647185))

(declare-fun m!647187 () Bool)

(assert (=> b!681876 m!647187))

(declare-fun m!647189 () Bool)

(assert (=> b!681882 m!647189))

(declare-fun m!647191 () Bool)

(assert (=> b!681882 m!647191))

(declare-fun m!647193 () Bool)

(assert (=> b!681883 m!647193))

(assert (=> b!681868 m!647187))

(declare-fun m!647195 () Bool)

(assert (=> b!681864 m!647195))

(declare-fun m!647197 () Bool)

(assert (=> b!681871 m!647197))

(declare-fun m!647199 () Bool)

(assert (=> start!60774 m!647199))

(assert (=> b!681862 m!647171))

(declare-fun m!647201 () Bool)

(assert (=> b!681862 m!647201))

(declare-fun m!647203 () Bool)

(assert (=> b!681862 m!647203))

(assert (=> b!681862 m!647171))

(declare-fun m!647205 () Bool)

(assert (=> b!681862 m!647205))

(declare-fun m!647207 () Bool)

(assert (=> b!681862 m!647207))

(check-sat (not b!681883) (not b!681869) (not b!681862) (not b!681866) (not b!681875) (not b!681868) (not start!60774) (not b!681873) (not b!681876) (not b!681871) (not b!681882) (not b!681865) (not b!681870) (not b!681878) (not b!681863) (not b!681864) (not b!681880) (not b!681877))
(check-sat)
(get-model)

(declare-fun d!94039 () Bool)

(declare-fun lt!313465 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!276 (List!12891) (InoxSet (_ BitVec 64)))

(assert (=> d!94039 (= lt!313465 (select (content!276 acc!681) k0!2843))))

(declare-fun e!388536 () Bool)

(assert (=> d!94039 (= lt!313465 e!388536)))

(declare-fun res!448017 () Bool)

(assert (=> d!94039 (=> (not res!448017) (not e!388536))))

(get-info :version)

(assert (=> d!94039 (= res!448017 ((_ is Cons!12887) acc!681))))

(assert (=> d!94039 (= (contains!3543 acc!681 k0!2843) lt!313465)))

(declare-fun b!682020 () Bool)

(declare-fun e!388535 () Bool)

(assert (=> b!682020 (= e!388536 e!388535)))

(declare-fun res!448018 () Bool)

(assert (=> b!682020 (=> res!448018 e!388535)))

(assert (=> b!682020 (= res!448018 (= (h!13935 acc!681) k0!2843))))

(declare-fun b!682021 () Bool)

(assert (=> b!682021 (= e!388535 (contains!3543 (t!19120 acc!681) k0!2843))))

(assert (= (and d!94039 res!448017) b!682020))

(assert (= (and b!682020 (not res!448018)) b!682021))

(declare-fun m!647305 () Bool)

(assert (=> d!94039 m!647305))

(declare-fun m!647307 () Bool)

(assert (=> d!94039 m!647307))

(declare-fun m!647309 () Bool)

(assert (=> b!682021 m!647309))

(assert (=> b!681868 d!94039))

(declare-fun d!94041 () Bool)

(declare-fun lt!313466 () Bool)

(assert (=> d!94041 (= lt!313466 (select (content!276 lt!313431) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!388538 () Bool)

(assert (=> d!94041 (= lt!313466 e!388538)))

(declare-fun res!448019 () Bool)

(assert (=> d!94041 (=> (not res!448019) (not e!388538))))

(assert (=> d!94041 (= res!448019 ((_ is Cons!12887) lt!313431))))

(assert (=> d!94041 (= (contains!3543 lt!313431 #b1000000000000000000000000000000000000000000000000000000000000000) lt!313466)))

(declare-fun b!682022 () Bool)

(declare-fun e!388537 () Bool)

(assert (=> b!682022 (= e!388538 e!388537)))

(declare-fun res!448020 () Bool)

(assert (=> b!682022 (=> res!448020 e!388537)))

(assert (=> b!682022 (= res!448020 (= (h!13935 lt!313431) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!682023 () Bool)

(assert (=> b!682023 (= e!388537 (contains!3543 (t!19120 lt!313431) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!94041 res!448019) b!682022))

(assert (= (and b!682022 (not res!448020)) b!682023))

(declare-fun m!647311 () Bool)

(assert (=> d!94041 m!647311))

(declare-fun m!647313 () Bool)

(assert (=> d!94041 m!647313))

(declare-fun m!647315 () Bool)

(assert (=> b!682023 m!647315))

(assert (=> b!681869 d!94041))

(declare-fun d!94043 () Bool)

(assert (=> d!94043 (= ($colon$colon!314 acc!681 (select (arr!18943 a!3626) from!3004)) (Cons!12887 (select (arr!18943 a!3626) from!3004) acc!681))))

(assert (=> b!681880 d!94043))

(declare-fun d!94045 () Bool)

(declare-fun res!448039 () Bool)

(declare-fun e!388558 () Bool)

(assert (=> d!94045 (=> res!448039 e!388558)))

(assert (=> d!94045 (= res!448039 ((_ is Nil!12888) acc!681))))

(assert (=> d!94045 (= (subseq!152 acc!681 acc!681) e!388558)))

(declare-fun b!682043 () Bool)

(declare-fun e!388557 () Bool)

(declare-fun e!388559 () Bool)

(assert (=> b!682043 (= e!388557 e!388559)))

(declare-fun res!448040 () Bool)

(assert (=> b!682043 (=> res!448040 e!388559)))

(declare-fun e!388560 () Bool)

(assert (=> b!682043 (= res!448040 e!388560)))

(declare-fun res!448042 () Bool)

(assert (=> b!682043 (=> (not res!448042) (not e!388560))))

(assert (=> b!682043 (= res!448042 (= (h!13935 acc!681) (h!13935 acc!681)))))

(declare-fun b!682042 () Bool)

(assert (=> b!682042 (= e!388558 e!388557)))

(declare-fun res!448041 () Bool)

(assert (=> b!682042 (=> (not res!448041) (not e!388557))))

(assert (=> b!682042 (= res!448041 ((_ is Cons!12887) acc!681))))

(declare-fun b!682045 () Bool)

(assert (=> b!682045 (= e!388559 (subseq!152 acc!681 (t!19120 acc!681)))))

(declare-fun b!682044 () Bool)

(assert (=> b!682044 (= e!388560 (subseq!152 (t!19120 acc!681) (t!19120 acc!681)))))

(assert (= (and d!94045 (not res!448039)) b!682042))

(assert (= (and b!682042 res!448041) b!682043))

(assert (= (and b!682043 res!448042) b!682044))

(assert (= (and b!682043 (not res!448040)) b!682045))

(declare-fun m!647327 () Bool)

(assert (=> b!682045 m!647327))

(declare-fun m!647329 () Bool)

(assert (=> b!682044 m!647329))

(assert (=> b!681880 d!94045))

(declare-fun d!94055 () Bool)

(assert (=> d!94055 (subseq!152 acc!681 acc!681)))

(declare-fun lt!313473 () Unit!23889)

(declare-fun choose!36 (List!12891) Unit!23889)

(assert (=> d!94055 (= lt!313473 (choose!36 acc!681))))

(assert (=> d!94055 (= (lemmaListSubSeqRefl!0 acc!681) lt!313473)))

(declare-fun bs!20027 () Bool)

(assert (= bs!20027 d!94055))

(assert (=> bs!20027 m!647175))

(declare-fun m!647337 () Bool)

(assert (=> bs!20027 m!647337))

(assert (=> b!681880 d!94055))

(declare-fun d!94059 () Bool)

(assert (=> d!94059 (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))

(declare-fun lt!313476 () Unit!23889)

(declare-fun choose!13 (array!39522 (_ BitVec 64) (_ BitVec 32)) Unit!23889)

(assert (=> d!94059 (= lt!313476 (choose!13 a!3626 k0!2843 from!3004))))

(assert (=> d!94059 (bvsge from!3004 #b00000000000000000000000000000000)))

(assert (=> d!94059 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004) lt!313476)))

(declare-fun bs!20028 () Bool)

(assert (= bs!20028 d!94059))

(assert (=> bs!20028 m!647169))

(declare-fun m!647339 () Bool)

(assert (=> bs!20028 m!647339))

(assert (=> b!681870 d!94059))

(declare-fun d!94061 () Bool)

(declare-fun lt!313477 () Bool)

(assert (=> d!94061 (= lt!313477 (select (content!276 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!388574 () Bool)

(assert (=> d!94061 (= lt!313477 e!388574)))

(declare-fun res!448055 () Bool)

(assert (=> d!94061 (=> (not res!448055) (not e!388574))))

(assert (=> d!94061 (= res!448055 ((_ is Cons!12887) acc!681))))

(assert (=> d!94061 (= (contains!3543 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!313477)))

(declare-fun b!682058 () Bool)

(declare-fun e!388573 () Bool)

(assert (=> b!682058 (= e!388574 e!388573)))

(declare-fun res!448056 () Bool)

(assert (=> b!682058 (=> res!448056 e!388573)))

(assert (=> b!682058 (= res!448056 (= (h!13935 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!682059 () Bool)

(assert (=> b!682059 (= e!388573 (contains!3543 (t!19120 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!94061 res!448055) b!682058))

(assert (= (and b!682058 (not res!448056)) b!682059))

(assert (=> d!94061 m!647305))

(declare-fun m!647341 () Bool)

(assert (=> d!94061 m!647341))

(declare-fun m!647343 () Bool)

(assert (=> b!682059 m!647343))

(assert (=> b!681871 d!94061))

(declare-fun b!682100 () Bool)

(declare-fun e!388611 () Bool)

(assert (=> b!682100 (= e!388611 (contains!3543 lt!313431 (select (arr!18943 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!682101 () Bool)

(declare-fun e!388610 () Bool)

(declare-fun e!388609 () Bool)

(assert (=> b!682101 (= e!388610 e!388609)))

(declare-fun c!77376 () Bool)

(assert (=> b!682101 (= c!77376 (validKeyInArray!0 (select (arr!18943 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!682102 () Bool)

(declare-fun call!33988 () Bool)

(assert (=> b!682102 (= e!388609 call!33988)))

(declare-fun b!682103 () Bool)

(declare-fun e!388612 () Bool)

(assert (=> b!682103 (= e!388612 e!388610)))

(declare-fun res!448085 () Bool)

(assert (=> b!682103 (=> (not res!448085) (not e!388610))))

(assert (=> b!682103 (= res!448085 (not e!388611))))

(declare-fun res!448087 () Bool)

(assert (=> b!682103 (=> (not res!448087) (not e!388611))))

(assert (=> b!682103 (= res!448087 (validKeyInArray!0 (select (arr!18943 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!682104 () Bool)

(assert (=> b!682104 (= e!388609 call!33988)))

(declare-fun bm!33985 () Bool)

(assert (=> bm!33985 (= call!33988 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!77376 (Cons!12887 (select (arr!18943 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) lt!313431) lt!313431)))))

(declare-fun d!94063 () Bool)

(declare-fun res!448086 () Bool)

(assert (=> d!94063 (=> res!448086 e!388612)))

(assert (=> d!94063 (= res!448086 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19307 a!3626)))))

(assert (=> d!94063 (= (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!313431) e!388612)))

(assert (= (and d!94063 (not res!448086)) b!682103))

(assert (= (and b!682103 res!448087) b!682100))

(assert (= (and b!682103 res!448085) b!682101))

(assert (= (and b!682101 c!77376) b!682104))

(assert (= (and b!682101 (not c!77376)) b!682102))

(assert (= (or b!682104 b!682102) bm!33985))

(declare-fun m!647371 () Bool)

(assert (=> b!682100 m!647371))

(assert (=> b!682100 m!647371))

(declare-fun m!647373 () Bool)

(assert (=> b!682100 m!647373))

(assert (=> b!682101 m!647371))

(assert (=> b!682101 m!647371))

(declare-fun m!647375 () Bool)

(assert (=> b!682101 m!647375))

(assert (=> b!682103 m!647371))

(assert (=> b!682103 m!647371))

(assert (=> b!682103 m!647375))

(assert (=> bm!33985 m!647371))

(declare-fun m!647381 () Bool)

(assert (=> bm!33985 m!647381))

(assert (=> b!681882 d!94063))

(declare-fun d!94081 () Bool)

(assert (=> d!94081 (noDuplicate!817 acc!681)))

(declare-fun lt!313490 () Unit!23889)

(declare-fun choose!1391 (List!12891 List!12891) Unit!23889)

(assert (=> d!94081 (= lt!313490 (choose!1391 acc!681 lt!313431))))

(declare-fun e!388635 () Bool)

(assert (=> d!94081 e!388635))

(declare-fun res!448110 () Bool)

(assert (=> d!94081 (=> (not res!448110) (not e!388635))))

(assert (=> d!94081 (= res!448110 (subseq!152 acc!681 lt!313431))))

(assert (=> d!94081 (= (noDuplicateSubseq!26 acc!681 lt!313431) lt!313490)))

(declare-fun b!682127 () Bool)

(assert (=> b!682127 (= e!388635 (noDuplicate!817 lt!313431))))

(assert (= (and d!94081 res!448110) b!682127))

(assert (=> d!94081 m!647181))

(declare-fun m!647407 () Bool)

(assert (=> d!94081 m!647407))

(assert (=> d!94081 m!647179))

(assert (=> b!682127 m!647167))

(assert (=> b!681882 d!94081))

(declare-fun d!94101 () Bool)

(assert (=> d!94101 (= (validKeyInArray!0 k0!2843) (and (not (= k0!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!681883 d!94101))

(declare-fun d!94103 () Bool)

(assert (=> d!94103 (= (validKeyInArray!0 (select (arr!18943 a!3626) from!3004)) (and (not (= (select (arr!18943 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18943 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!681862 d!94103))

(declare-fun d!94105 () Bool)

(declare-fun res!448131 () Bool)

(declare-fun e!388656 () Bool)

(assert (=> d!94105 (=> res!448131 e!388656)))

(assert (=> d!94105 (= res!448131 (= (select (arr!18943 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) k0!2843))))

(assert (=> d!94105 (= (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)) e!388656)))

(declare-fun b!682148 () Bool)

(declare-fun e!388657 () Bool)

(assert (=> b!682148 (= e!388656 e!388657)))

(declare-fun res!448132 () Bool)

(assert (=> b!682148 (=> (not res!448132) (not e!388657))))

(assert (=> b!682148 (= res!448132 (bvslt (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (size!19307 a!3626)))))

(declare-fun b!682149 () Bool)

(assert (=> b!682149 (= e!388657 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!94105 (not res!448131)) b!682148))

(assert (= (and b!682148 res!448132) b!682149))

(assert (=> d!94105 m!647371))

(declare-fun m!647425 () Bool)

(assert (=> b!682149 m!647425))

(assert (=> b!681862 d!94105))

(declare-fun d!94117 () Bool)

(declare-fun res!448133 () Bool)

(declare-fun e!388658 () Bool)

(assert (=> d!94117 (=> res!448133 e!388658)))

(assert (=> d!94117 (= res!448133 (= (select (arr!18943 (array!39523 (store (arr!18943 a!3626) i!1382 k0!2843) (size!19307 a!3626))) from!3004) k0!2843))))

(assert (=> d!94117 (= (arrayContainsKey!0 (array!39523 (store (arr!18943 a!3626) i!1382 k0!2843) (size!19307 a!3626)) k0!2843 from!3004) e!388658)))

(declare-fun b!682150 () Bool)

(declare-fun e!388659 () Bool)

(assert (=> b!682150 (= e!388658 e!388659)))

(declare-fun res!448134 () Bool)

(assert (=> b!682150 (=> (not res!448134) (not e!388659))))

(assert (=> b!682150 (= res!448134 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19307 (array!39523 (store (arr!18943 a!3626) i!1382 k0!2843) (size!19307 a!3626)))))))

(declare-fun b!682151 () Bool)

(assert (=> b!682151 (= e!388659 (arrayContainsKey!0 (array!39523 (store (arr!18943 a!3626) i!1382 k0!2843) (size!19307 a!3626)) k0!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!94117 (not res!448133)) b!682150))

(assert (= (and b!682150 res!448134) b!682151))

(declare-fun m!647427 () Bool)

(assert (=> d!94117 m!647427))

(declare-fun m!647429 () Bool)

(assert (=> b!682151 m!647429))

(assert (=> b!681862 d!94117))

(declare-fun b!682152 () Bool)

(declare-fun e!388662 () Bool)

(assert (=> b!682152 (= e!388662 (contains!3543 acc!681 (select (arr!18943 a!3626) from!3004)))))

(declare-fun b!682153 () Bool)

(declare-fun e!388661 () Bool)

(declare-fun e!388660 () Bool)

(assert (=> b!682153 (= e!388661 e!388660)))

(declare-fun c!77377 () Bool)

(assert (=> b!682153 (= c!77377 (validKeyInArray!0 (select (arr!18943 a!3626) from!3004)))))

(declare-fun b!682154 () Bool)

(declare-fun call!33989 () Bool)

(assert (=> b!682154 (= e!388660 call!33989)))

(declare-fun b!682155 () Bool)

(declare-fun e!388663 () Bool)

(assert (=> b!682155 (= e!388663 e!388661)))

(declare-fun res!448135 () Bool)

(assert (=> b!682155 (=> (not res!448135) (not e!388661))))

(assert (=> b!682155 (= res!448135 (not e!388662))))

(declare-fun res!448137 () Bool)

(assert (=> b!682155 (=> (not res!448137) (not e!388662))))

(assert (=> b!682155 (= res!448137 (validKeyInArray!0 (select (arr!18943 a!3626) from!3004)))))

(declare-fun b!682156 () Bool)

(assert (=> b!682156 (= e!388660 call!33989)))

(declare-fun bm!33986 () Bool)

(assert (=> bm!33986 (= call!33989 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!77377 (Cons!12887 (select (arr!18943 a!3626) from!3004) acc!681) acc!681)))))

(declare-fun d!94119 () Bool)

(declare-fun res!448136 () Bool)

(assert (=> d!94119 (=> res!448136 e!388663)))

(assert (=> d!94119 (= res!448136 (bvsge from!3004 (size!19307 a!3626)))))

(assert (=> d!94119 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!388663)))

(assert (= (and d!94119 (not res!448136)) b!682155))

(assert (= (and b!682155 res!448137) b!682152))

(assert (= (and b!682155 res!448135) b!682153))

(assert (= (and b!682153 c!77377) b!682156))

(assert (= (and b!682153 (not c!77377)) b!682154))

(assert (= (or b!682156 b!682154) bm!33986))

(assert (=> b!682152 m!647171))

(assert (=> b!682152 m!647171))

(declare-fun m!647431 () Bool)

(assert (=> b!682152 m!647431))

(assert (=> b!682153 m!647171))

(assert (=> b!682153 m!647171))

(assert (=> b!682153 m!647205))

(assert (=> b!682155 m!647171))

(assert (=> b!682155 m!647171))

(assert (=> b!682155 m!647205))

(assert (=> bm!33986 m!647171))

(declare-fun m!647433 () Bool)

(assert (=> bm!33986 m!647433))

(assert (=> b!681873 d!94119))

(declare-fun d!94121 () Bool)

(declare-fun lt!313491 () Bool)

(assert (=> d!94121 (= lt!313491 (select (content!276 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!388673 () Bool)

(assert (=> d!94121 (= lt!313491 e!388673)))

(declare-fun res!448146 () Bool)

(assert (=> d!94121 (=> (not res!448146) (not e!388673))))

(assert (=> d!94121 (= res!448146 ((_ is Cons!12887) acc!681))))

(assert (=> d!94121 (= (contains!3543 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!313491)))

(declare-fun b!682165 () Bool)

(declare-fun e!388672 () Bool)

(assert (=> b!682165 (= e!388673 e!388672)))

(declare-fun res!448147 () Bool)

(assert (=> b!682165 (=> res!448147 e!388672)))

(assert (=> b!682165 (= res!448147 (= (h!13935 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!682166 () Bool)

(assert (=> b!682166 (= e!388672 (contains!3543 (t!19120 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!94121 res!448146) b!682165))

(assert (= (and b!682165 (not res!448147)) b!682166))

(assert (=> d!94121 m!647305))

(declare-fun m!647435 () Bool)

(assert (=> d!94121 m!647435))

(declare-fun m!647437 () Bool)

(assert (=> b!682166 m!647437))

(assert (=> b!681863 d!94121))

(declare-fun b!682167 () Bool)

(declare-fun e!388676 () Bool)

(assert (=> b!682167 (= e!388676 (contains!3543 Nil!12888 (select (arr!18943 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!682168 () Bool)

(declare-fun e!388675 () Bool)

(declare-fun e!388674 () Bool)

(assert (=> b!682168 (= e!388675 e!388674)))

(declare-fun c!77378 () Bool)

(assert (=> b!682168 (= c!77378 (validKeyInArray!0 (select (arr!18943 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!682169 () Bool)

(declare-fun call!33990 () Bool)

(assert (=> b!682169 (= e!388674 call!33990)))

(declare-fun b!682170 () Bool)

(declare-fun e!388677 () Bool)

(assert (=> b!682170 (= e!388677 e!388675)))

(declare-fun res!448148 () Bool)

(assert (=> b!682170 (=> (not res!448148) (not e!388675))))

(assert (=> b!682170 (= res!448148 (not e!388676))))

(declare-fun res!448150 () Bool)

(assert (=> b!682170 (=> (not res!448150) (not e!388676))))

(assert (=> b!682170 (= res!448150 (validKeyInArray!0 (select (arr!18943 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!682171 () Bool)

(assert (=> b!682171 (= e!388674 call!33990)))

(declare-fun bm!33987 () Bool)

(assert (=> bm!33987 (= call!33990 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!77378 (Cons!12887 (select (arr!18943 a!3626) #b00000000000000000000000000000000) Nil!12888) Nil!12888)))))

(declare-fun d!94123 () Bool)

(declare-fun res!448149 () Bool)

(assert (=> d!94123 (=> res!448149 e!388677)))

(assert (=> d!94123 (= res!448149 (bvsge #b00000000000000000000000000000000 (size!19307 a!3626)))))

(assert (=> d!94123 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12888) e!388677)))

(assert (= (and d!94123 (not res!448149)) b!682170))

(assert (= (and b!682170 res!448150) b!682167))

(assert (= (and b!682170 res!448148) b!682168))

(assert (= (and b!682168 c!77378) b!682171))

(assert (= (and b!682168 (not c!77378)) b!682169))

(assert (= (or b!682171 b!682169) bm!33987))

(declare-fun m!647439 () Bool)

(assert (=> b!682167 m!647439))

(assert (=> b!682167 m!647439))

(declare-fun m!647441 () Bool)

(assert (=> b!682167 m!647441))

(assert (=> b!682168 m!647439))

(assert (=> b!682168 m!647439))

(declare-fun m!647443 () Bool)

(assert (=> b!682168 m!647443))

(assert (=> b!682170 m!647439))

(assert (=> b!682170 m!647439))

(assert (=> b!682170 m!647443))

(assert (=> bm!33987 m!647439))

(declare-fun m!647445 () Bool)

(assert (=> bm!33987 m!647445))

(assert (=> b!681864 d!94123))

(declare-fun d!94125 () Bool)

(declare-fun res!448158 () Bool)

(declare-fun e!388686 () Bool)

(assert (=> d!94125 (=> res!448158 e!388686)))

(assert (=> d!94125 (= res!448158 (= (select (arr!18943 a!3626) #b00000000000000000000000000000000) k0!2843))))

(assert (=> d!94125 (= (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000) e!388686)))

(declare-fun b!682182 () Bool)

(declare-fun e!388688 () Bool)

(assert (=> b!682182 (= e!388686 e!388688)))

(declare-fun res!448161 () Bool)

(assert (=> b!682182 (=> (not res!448161) (not e!388688))))

(assert (=> b!682182 (= res!448161 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19307 a!3626)))))

(declare-fun b!682183 () Bool)

(assert (=> b!682183 (= e!388688 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!94125 (not res!448158)) b!682182))

(assert (= (and b!682182 res!448161) b!682183))

(assert (=> d!94125 m!647439))

(declare-fun m!647447 () Bool)

(assert (=> b!682183 m!647447))

(assert (=> b!681875 d!94125))

(declare-fun d!94127 () Bool)

(assert (=> d!94127 (= (array_inv!14802 a!3626) (bvsge (size!19307 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!60774 d!94127))

(declare-fun d!94133 () Bool)

(declare-fun res!448175 () Bool)

(declare-fun e!388706 () Bool)

(assert (=> d!94133 (=> res!448175 e!388706)))

(assert (=> d!94133 (= res!448175 ((_ is Nil!12888) acc!681))))

(assert (=> d!94133 (= (noDuplicate!817 acc!681) e!388706)))

(declare-fun b!682204 () Bool)

(declare-fun e!388707 () Bool)

(assert (=> b!682204 (= e!388706 e!388707)))

(declare-fun res!448176 () Bool)

(assert (=> b!682204 (=> (not res!448176) (not e!388707))))

(assert (=> b!682204 (= res!448176 (not (contains!3543 (t!19120 acc!681) (h!13935 acc!681))))))

(declare-fun b!682205 () Bool)

(assert (=> b!682205 (= e!388707 (noDuplicate!817 (t!19120 acc!681)))))

(assert (= (and d!94133 (not res!448175)) b!682204))

(assert (= (and b!682204 res!448176) b!682205))

(declare-fun m!647463 () Bool)

(assert (=> b!682204 m!647463))

(declare-fun m!647465 () Bool)

(assert (=> b!682205 m!647465))

(assert (=> b!681865 d!94133))

(assert (=> b!681876 d!94039))

(declare-fun d!94139 () Bool)

(declare-fun lt!313496 () Bool)

(assert (=> d!94139 (= lt!313496 (select (content!276 lt!313431) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!388709 () Bool)

(assert (=> d!94139 (= lt!313496 e!388709)))

(declare-fun res!448177 () Bool)

(assert (=> d!94139 (=> (not res!448177) (not e!388709))))

(assert (=> d!94139 (= res!448177 ((_ is Cons!12887) lt!313431))))

(assert (=> d!94139 (= (contains!3543 lt!313431 #b0000000000000000000000000000000000000000000000000000000000000000) lt!313496)))

(declare-fun b!682206 () Bool)

(declare-fun e!388708 () Bool)

(assert (=> b!682206 (= e!388709 e!388708)))

(declare-fun res!448178 () Bool)

(assert (=> b!682206 (=> res!448178 e!388708)))

(assert (=> b!682206 (= res!448178 (= (h!13935 lt!313431) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!682207 () Bool)

(assert (=> b!682207 (= e!388708 (contains!3543 (t!19120 lt!313431) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!94139 res!448177) b!682206))

(assert (= (and b!682206 (not res!448178)) b!682207))

(assert (=> d!94139 m!647311))

(declare-fun m!647473 () Bool)

(assert (=> d!94139 m!647473))

(declare-fun m!647475 () Bool)

(assert (=> b!682207 m!647475))

(assert (=> b!681866 d!94139))

(declare-fun d!94141 () Bool)

(declare-fun res!448179 () Bool)

(declare-fun e!388710 () Bool)

(assert (=> d!94141 (=> res!448179 e!388710)))

(assert (=> d!94141 (= res!448179 ((_ is Nil!12888) lt!313431))))

(assert (=> d!94141 (= (noDuplicate!817 lt!313431) e!388710)))

(declare-fun b!682208 () Bool)

(declare-fun e!388711 () Bool)

(assert (=> b!682208 (= e!388710 e!388711)))

(declare-fun res!448180 () Bool)

(assert (=> b!682208 (=> (not res!448180) (not e!388711))))

(assert (=> b!682208 (= res!448180 (not (contains!3543 (t!19120 lt!313431) (h!13935 lt!313431))))))

(declare-fun b!682209 () Bool)

(assert (=> b!682209 (= e!388711 (noDuplicate!817 (t!19120 lt!313431)))))

(assert (= (and d!94141 (not res!448179)) b!682208))

(assert (= (and b!682208 res!448180) b!682209))

(declare-fun m!647477 () Bool)

(assert (=> b!682208 m!647477))

(declare-fun m!647479 () Bool)

(assert (=> b!682209 m!647479))

(assert (=> b!681877 d!94141))

(declare-fun d!94145 () Bool)

(declare-fun res!448181 () Bool)

(declare-fun e!388713 () Bool)

(assert (=> d!94145 (=> res!448181 e!388713)))

(assert (=> d!94145 (= res!448181 ((_ is Nil!12888) acc!681))))

(assert (=> d!94145 (= (subseq!152 acc!681 lt!313431) e!388713)))

(declare-fun b!682211 () Bool)

(declare-fun e!388712 () Bool)

(declare-fun e!388714 () Bool)

(assert (=> b!682211 (= e!388712 e!388714)))

(declare-fun res!448182 () Bool)

(assert (=> b!682211 (=> res!448182 e!388714)))

(declare-fun e!388715 () Bool)

(assert (=> b!682211 (= res!448182 e!388715)))

(declare-fun res!448184 () Bool)

(assert (=> b!682211 (=> (not res!448184) (not e!388715))))

(assert (=> b!682211 (= res!448184 (= (h!13935 acc!681) (h!13935 lt!313431)))))

(declare-fun b!682210 () Bool)

(assert (=> b!682210 (= e!388713 e!388712)))

(declare-fun res!448183 () Bool)

(assert (=> b!682210 (=> (not res!448183) (not e!388712))))

(assert (=> b!682210 (= res!448183 ((_ is Cons!12887) lt!313431))))

(declare-fun b!682213 () Bool)

(assert (=> b!682213 (= e!388714 (subseq!152 acc!681 (t!19120 lt!313431)))))

(declare-fun b!682212 () Bool)

(assert (=> b!682212 (= e!388715 (subseq!152 (t!19120 acc!681) (t!19120 lt!313431)))))

(assert (= (and d!94145 (not res!448181)) b!682210))

(assert (= (and b!682210 res!448183) b!682211))

(assert (= (and b!682211 res!448184) b!682212))

(assert (= (and b!682211 (not res!448182)) b!682213))

(declare-fun m!647481 () Bool)

(assert (=> b!682213 m!647481))

(declare-fun m!647483 () Bool)

(assert (=> b!682212 m!647483))

(assert (=> b!681878 d!94145))

(check-sat (not d!94039) (not b!682127) (not b!682059) (not b!682021) (not b!682205) (not b!682151) (not b!682170) (not b!682023) (not d!94061) (not d!94081) (not b!682152) (not bm!33986) (not b!682155) (not b!682045) (not b!682100) (not d!94139) (not b!682153) (not b!682168) (not d!94041) (not d!94059) (not bm!33987) (not b!682213) (not b!682103) (not b!682044) (not bm!33985) (not b!682209) (not b!682166) (not b!682183) (not b!682208) (not d!94121) (not b!682167) (not d!94055) (not b!682101) (not b!682212) (not b!682204) (not b!682149) (not b!682207))
(check-sat)
