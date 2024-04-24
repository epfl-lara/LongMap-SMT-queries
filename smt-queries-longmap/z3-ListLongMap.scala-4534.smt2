; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62902 () Bool)

(assert start!62902)

(declare-fun b!709034 () Bool)

(declare-fun res!472520 () Bool)

(declare-fun e!399078 () Bool)

(assert (=> b!709034 (=> (not res!472520) (not e!399078))))

(declare-datatypes ((array!40356 0))(
  ( (array!40357 (arr!19327 (Array (_ BitVec 32) (_ BitVec 64))) (size!19719 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40356)

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!40356 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!709034 (= res!472520 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!709035 () Bool)

(declare-fun e!399076 () Bool)

(assert (=> b!709035 (= e!399078 e!399076)))

(declare-fun res!472528 () Bool)

(assert (=> b!709035 (=> (not res!472528) (not e!399076))))

(assert (=> b!709035 (= res!472528 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-datatypes ((List!13275 0))(
  ( (Nil!13272) (Cons!13271 (h!14319 (_ BitVec 64)) (t!19558 List!13275)) )
))
(declare-fun lt!318267 () List!13275)

(declare-fun acc!652 () List!13275)

(declare-fun $colon$colon!503 (List!13275 (_ BitVec 64)) List!13275)

(assert (=> b!709035 (= lt!318267 ($colon$colon!503 acc!652 (select (arr!19327 a!3591) from!2969)))))

(declare-fun b!709036 () Bool)

(declare-fun res!472511 () Bool)

(assert (=> b!709036 (=> (not res!472511) (not e!399078))))

(declare-fun contains!3927 (List!13275 (_ BitVec 64)) Bool)

(assert (=> b!709036 (= res!472511 (not (contains!3927 acc!652 k0!2824)))))

(declare-fun b!709037 () Bool)

(declare-fun res!472522 () Bool)

(assert (=> b!709037 (=> (not res!472522) (not e!399078))))

(declare-fun arrayNoDuplicates!0 (array!40356 (_ BitVec 32) List!13275) Bool)

(assert (=> b!709037 (= res!472522 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!709038 () Bool)

(declare-fun res!472521 () Bool)

(assert (=> b!709038 (=> (not res!472521) (not e!399078))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!709038 (= res!472521 (validKeyInArray!0 (select (arr!19327 a!3591) from!2969)))))

(declare-fun b!709039 () Bool)

(declare-fun res!472519 () Bool)

(assert (=> b!709039 (=> (not res!472519) (not e!399076))))

(assert (=> b!709039 (= res!472519 (not (contains!3927 lt!318267 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!709040 () Bool)

(declare-fun res!472517 () Bool)

(assert (=> b!709040 (=> (not res!472517) (not e!399076))))

(assert (=> b!709040 (= res!472517 (not (contains!3927 lt!318267 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!472526 () Bool)

(assert (=> start!62902 (=> (not res!472526) (not e!399078))))

(assert (=> start!62902 (= res!472526 (and (bvslt (size!19719 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19719 a!3591))))))

(assert (=> start!62902 e!399078))

(assert (=> start!62902 true))

(declare-fun array_inv!15186 (array!40356) Bool)

(assert (=> start!62902 (array_inv!15186 a!3591)))

(declare-fun b!709041 () Bool)

(declare-fun res!472531 () Bool)

(assert (=> b!709041 (=> (not res!472531) (not e!399078))))

(declare-fun noDuplicate!1201 (List!13275) Bool)

(assert (=> b!709041 (= res!472531 (noDuplicate!1201 acc!652))))

(declare-fun b!709042 () Bool)

(declare-fun res!472515 () Bool)

(assert (=> b!709042 (=> (not res!472515) (not e!399076))))

(assert (=> b!709042 (= res!472515 (noDuplicate!1201 lt!318267))))

(declare-fun b!709043 () Bool)

(declare-fun res!472516 () Bool)

(assert (=> b!709043 (=> (not res!472516) (not e!399078))))

(declare-fun newAcc!49 () List!13275)

(declare-fun subseq!395 (List!13275 List!13275) Bool)

(assert (=> b!709043 (= res!472516 (subseq!395 acc!652 newAcc!49))))

(declare-fun b!709044 () Bool)

(declare-fun res!472518 () Bool)

(assert (=> b!709044 (=> (not res!472518) (not e!399078))))

(assert (=> b!709044 (= res!472518 (not (contains!3927 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!709045 () Bool)

(declare-fun res!472529 () Bool)

(assert (=> b!709045 (=> (not res!472529) (not e!399076))))

(assert (=> b!709045 (= res!472529 (noDuplicate!1201 ($colon$colon!503 newAcc!49 (select (arr!19327 a!3591) from!2969))))))

(declare-fun b!709046 () Bool)

(assert (=> b!709046 (= e!399076 (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969)))))

(declare-fun b!709047 () Bool)

(declare-fun res!472512 () Bool)

(assert (=> b!709047 (=> (not res!472512) (not e!399078))))

(assert (=> b!709047 (= res!472512 (validKeyInArray!0 k0!2824))))

(declare-fun b!709048 () Bool)

(declare-fun res!472527 () Bool)

(assert (=> b!709048 (=> (not res!472527) (not e!399078))))

(assert (=> b!709048 (= res!472527 (not (contains!3927 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!709049 () Bool)

(declare-fun res!472530 () Bool)

(assert (=> b!709049 (=> (not res!472530) (not e!399078))))

(assert (=> b!709049 (= res!472530 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19719 a!3591)))))

(declare-fun b!709050 () Bool)

(declare-fun res!472523 () Bool)

(assert (=> b!709050 (=> (not res!472523) (not e!399078))))

(declare-fun -!359 (List!13275 (_ BitVec 64)) List!13275)

(assert (=> b!709050 (= res!472523 (= (-!359 newAcc!49 k0!2824) acc!652))))

(declare-fun b!709051 () Bool)

(declare-fun res!472514 () Bool)

(assert (=> b!709051 (=> (not res!472514) (not e!399078))))

(assert (=> b!709051 (= res!472514 (noDuplicate!1201 newAcc!49))))

(declare-fun b!709052 () Bool)

(declare-fun res!472513 () Bool)

(assert (=> b!709052 (=> (not res!472513) (not e!399078))))

(assert (=> b!709052 (= res!472513 (not (contains!3927 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!709053 () Bool)

(declare-fun res!472525 () Bool)

(assert (=> b!709053 (=> (not res!472525) (not e!399078))))

(assert (=> b!709053 (= res!472525 (contains!3927 newAcc!49 k0!2824))))

(declare-fun b!709054 () Bool)

(declare-fun res!472524 () Bool)

(assert (=> b!709054 (=> (not res!472524) (not e!399078))))

(assert (=> b!709054 (= res!472524 (not (contains!3927 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!62902 res!472526) b!709041))

(assert (= (and b!709041 res!472531) b!709051))

(assert (= (and b!709051 res!472514) b!709054))

(assert (= (and b!709054 res!472524) b!709048))

(assert (= (and b!709048 res!472527) b!709034))

(assert (= (and b!709034 res!472520) b!709036))

(assert (= (and b!709036 res!472511) b!709047))

(assert (= (and b!709047 res!472512) b!709037))

(assert (= (and b!709037 res!472522) b!709043))

(assert (= (and b!709043 res!472516) b!709053))

(assert (= (and b!709053 res!472525) b!709050))

(assert (= (and b!709050 res!472523) b!709044))

(assert (= (and b!709044 res!472518) b!709052))

(assert (= (and b!709052 res!472513) b!709049))

(assert (= (and b!709049 res!472530) b!709038))

(assert (= (and b!709038 res!472521) b!709035))

(assert (= (and b!709035 res!472528) b!709042))

(assert (= (and b!709042 res!472515) b!709045))

(assert (= (and b!709045 res!472529) b!709040))

(assert (= (and b!709040 res!472517) b!709039))

(assert (= (and b!709039 res!472519) b!709046))

(declare-fun m!666927 () Bool)

(assert (=> b!709050 m!666927))

(declare-fun m!666929 () Bool)

(assert (=> b!709045 m!666929))

(assert (=> b!709045 m!666929))

(declare-fun m!666931 () Bool)

(assert (=> b!709045 m!666931))

(assert (=> b!709045 m!666931))

(declare-fun m!666933 () Bool)

(assert (=> b!709045 m!666933))

(declare-fun m!666935 () Bool)

(assert (=> b!709043 m!666935))

(declare-fun m!666937 () Bool)

(assert (=> b!709053 m!666937))

(declare-fun m!666939 () Bool)

(assert (=> b!709039 m!666939))

(assert (=> b!709035 m!666929))

(assert (=> b!709035 m!666929))

(declare-fun m!666941 () Bool)

(assert (=> b!709035 m!666941))

(declare-fun m!666943 () Bool)

(assert (=> b!709042 m!666943))

(declare-fun m!666945 () Bool)

(assert (=> b!709054 m!666945))

(declare-fun m!666947 () Bool)

(assert (=> b!709041 m!666947))

(declare-fun m!666949 () Bool)

(assert (=> b!709052 m!666949))

(declare-fun m!666951 () Bool)

(assert (=> b!709037 m!666951))

(declare-fun m!666953 () Bool)

(assert (=> b!709051 m!666953))

(assert (=> b!709038 m!666929))

(assert (=> b!709038 m!666929))

(declare-fun m!666955 () Bool)

(assert (=> b!709038 m!666955))

(declare-fun m!666957 () Bool)

(assert (=> b!709034 m!666957))

(declare-fun m!666959 () Bool)

(assert (=> b!709036 m!666959))

(declare-fun m!666961 () Bool)

(assert (=> b!709046 m!666961))

(declare-fun m!666963 () Bool)

(assert (=> start!62902 m!666963))

(declare-fun m!666965 () Bool)

(assert (=> b!709044 m!666965))

(declare-fun m!666967 () Bool)

(assert (=> b!709048 m!666967))

(declare-fun m!666969 () Bool)

(assert (=> b!709047 m!666969))

(declare-fun m!666971 () Bool)

(assert (=> b!709040 m!666971))

(check-sat (not b!709051) (not b!709042) (not b!709037) (not b!709035) (not b!709044) (not b!709040) (not b!709034) (not start!62902) (not b!709041) (not b!709036) (not b!709043) (not b!709046) (not b!709038) (not b!709050) (not b!709039) (not b!709052) (not b!709053) (not b!709045) (not b!709054) (not b!709047) (not b!709048))
(check-sat)
(get-model)

(declare-fun d!97095 () Bool)

(declare-fun res!472662 () Bool)

(declare-fun e!399101 () Bool)

(assert (=> d!97095 (=> res!472662 e!399101)))

(get-info :version)

(assert (=> d!97095 (= res!472662 ((_ is Nil!13272) newAcc!49))))

(assert (=> d!97095 (= (noDuplicate!1201 newAcc!49) e!399101)))

(declare-fun b!709185 () Bool)

(declare-fun e!399102 () Bool)

(assert (=> b!709185 (= e!399101 e!399102)))

(declare-fun res!472663 () Bool)

(assert (=> b!709185 (=> (not res!472663) (not e!399102))))

(assert (=> b!709185 (= res!472663 (not (contains!3927 (t!19558 newAcc!49) (h!14319 newAcc!49))))))

(declare-fun b!709186 () Bool)

(assert (=> b!709186 (= e!399102 (noDuplicate!1201 (t!19558 newAcc!49)))))

(assert (= (and d!97095 (not res!472662)) b!709185))

(assert (= (and b!709185 res!472663) b!709186))

(declare-fun m!667065 () Bool)

(assert (=> b!709185 m!667065))

(declare-fun m!667067 () Bool)

(assert (=> b!709186 m!667067))

(assert (=> b!709051 d!97095))

(declare-fun d!97097 () Bool)

(declare-fun lt!318276 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!341 (List!13275) (InoxSet (_ BitVec 64)))

(assert (=> d!97097 (= lt!318276 (select (content!341 lt!318267) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!399107 () Bool)

(assert (=> d!97097 (= lt!318276 e!399107)))

(declare-fun res!472669 () Bool)

(assert (=> d!97097 (=> (not res!472669) (not e!399107))))

(assert (=> d!97097 (= res!472669 ((_ is Cons!13271) lt!318267))))

(assert (=> d!97097 (= (contains!3927 lt!318267 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318276)))

(declare-fun b!709191 () Bool)

(declare-fun e!399108 () Bool)

(assert (=> b!709191 (= e!399107 e!399108)))

(declare-fun res!472668 () Bool)

(assert (=> b!709191 (=> res!472668 e!399108)))

(assert (=> b!709191 (= res!472668 (= (h!14319 lt!318267) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!709192 () Bool)

(assert (=> b!709192 (= e!399108 (contains!3927 (t!19558 lt!318267) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97097 res!472669) b!709191))

(assert (= (and b!709191 (not res!472668)) b!709192))

(declare-fun m!667069 () Bool)

(assert (=> d!97097 m!667069))

(declare-fun m!667071 () Bool)

(assert (=> d!97097 m!667071))

(declare-fun m!667073 () Bool)

(assert (=> b!709192 m!667073))

(assert (=> b!709040 d!97097))

(declare-fun d!97099 () Bool)

(declare-fun res!472670 () Bool)

(declare-fun e!399109 () Bool)

(assert (=> d!97099 (=> res!472670 e!399109)))

(assert (=> d!97099 (= res!472670 ((_ is Nil!13272) acc!652))))

(assert (=> d!97099 (= (noDuplicate!1201 acc!652) e!399109)))

(declare-fun b!709193 () Bool)

(declare-fun e!399110 () Bool)

(assert (=> b!709193 (= e!399109 e!399110)))

(declare-fun res!472671 () Bool)

(assert (=> b!709193 (=> (not res!472671) (not e!399110))))

(assert (=> b!709193 (= res!472671 (not (contains!3927 (t!19558 acc!652) (h!14319 acc!652))))))

(declare-fun b!709194 () Bool)

(assert (=> b!709194 (= e!399110 (noDuplicate!1201 (t!19558 acc!652)))))

(assert (= (and d!97099 (not res!472670)) b!709193))

(assert (= (and b!709193 res!472671) b!709194))

(declare-fun m!667075 () Bool)

(assert (=> b!709193 m!667075))

(declare-fun m!667077 () Bool)

(assert (=> b!709194 m!667077))

(assert (=> b!709041 d!97099))

(declare-fun d!97101 () Bool)

(declare-fun lt!318277 () Bool)

(assert (=> d!97101 (= lt!318277 (select (content!341 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!399111 () Bool)

(assert (=> d!97101 (= lt!318277 e!399111)))

(declare-fun res!472673 () Bool)

(assert (=> d!97101 (=> (not res!472673) (not e!399111))))

(assert (=> d!97101 (= res!472673 ((_ is Cons!13271) newAcc!49))))

(assert (=> d!97101 (= (contains!3927 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318277)))

(declare-fun b!709195 () Bool)

(declare-fun e!399112 () Bool)

(assert (=> b!709195 (= e!399111 e!399112)))

(declare-fun res!472672 () Bool)

(assert (=> b!709195 (=> res!472672 e!399112)))

(assert (=> b!709195 (= res!472672 (= (h!14319 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!709196 () Bool)

(assert (=> b!709196 (= e!399112 (contains!3927 (t!19558 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97101 res!472673) b!709195))

(assert (= (and b!709195 (not res!472672)) b!709196))

(declare-fun m!667079 () Bool)

(assert (=> d!97101 m!667079))

(declare-fun m!667081 () Bool)

(assert (=> d!97101 m!667081))

(declare-fun m!667083 () Bool)

(assert (=> b!709196 m!667083))

(assert (=> b!709052 d!97101))

(declare-fun d!97103 () Bool)

(declare-fun lt!318278 () Bool)

(assert (=> d!97103 (= lt!318278 (select (content!341 newAcc!49) k0!2824))))

(declare-fun e!399113 () Bool)

(assert (=> d!97103 (= lt!318278 e!399113)))

(declare-fun res!472675 () Bool)

(assert (=> d!97103 (=> (not res!472675) (not e!399113))))

(assert (=> d!97103 (= res!472675 ((_ is Cons!13271) newAcc!49))))

(assert (=> d!97103 (= (contains!3927 newAcc!49 k0!2824) lt!318278)))

(declare-fun b!709197 () Bool)

(declare-fun e!399114 () Bool)

(assert (=> b!709197 (= e!399113 e!399114)))

(declare-fun res!472674 () Bool)

(assert (=> b!709197 (=> res!472674 e!399114)))

(assert (=> b!709197 (= res!472674 (= (h!14319 newAcc!49) k0!2824))))

(declare-fun b!709198 () Bool)

(assert (=> b!709198 (= e!399114 (contains!3927 (t!19558 newAcc!49) k0!2824))))

(assert (= (and d!97103 res!472675) b!709197))

(assert (= (and b!709197 (not res!472674)) b!709198))

(assert (=> d!97103 m!667079))

(declare-fun m!667085 () Bool)

(assert (=> d!97103 m!667085))

(declare-fun m!667087 () Bool)

(assert (=> b!709198 m!667087))

(assert (=> b!709053 d!97103))

(declare-fun d!97105 () Bool)

(declare-fun res!472676 () Bool)

(declare-fun e!399115 () Bool)

(assert (=> d!97105 (=> res!472676 e!399115)))

(assert (=> d!97105 (= res!472676 ((_ is Nil!13272) lt!318267))))

(assert (=> d!97105 (= (noDuplicate!1201 lt!318267) e!399115)))

(declare-fun b!709199 () Bool)

(declare-fun e!399116 () Bool)

(assert (=> b!709199 (= e!399115 e!399116)))

(declare-fun res!472677 () Bool)

(assert (=> b!709199 (=> (not res!472677) (not e!399116))))

(assert (=> b!709199 (= res!472677 (not (contains!3927 (t!19558 lt!318267) (h!14319 lt!318267))))))

(declare-fun b!709200 () Bool)

(assert (=> b!709200 (= e!399116 (noDuplicate!1201 (t!19558 lt!318267)))))

(assert (= (and d!97105 (not res!472676)) b!709199))

(assert (= (and b!709199 res!472677) b!709200))

(declare-fun m!667089 () Bool)

(assert (=> b!709199 m!667089))

(declare-fun m!667091 () Bool)

(assert (=> b!709200 m!667091))

(assert (=> b!709042 d!97105))

(declare-fun b!709209 () Bool)

(declare-fun e!399125 () Bool)

(declare-fun e!399126 () Bool)

(assert (=> b!709209 (= e!399125 e!399126)))

(declare-fun res!472687 () Bool)

(assert (=> b!709209 (=> (not res!472687) (not e!399126))))

(assert (=> b!709209 (= res!472687 ((_ is Cons!13271) newAcc!49))))

(declare-fun d!97107 () Bool)

(declare-fun res!472688 () Bool)

(assert (=> d!97107 (=> res!472688 e!399125)))

(assert (=> d!97107 (= res!472688 ((_ is Nil!13272) acc!652))))

(assert (=> d!97107 (= (subseq!395 acc!652 newAcc!49) e!399125)))

(declare-fun b!709210 () Bool)

(declare-fun e!399128 () Bool)

(assert (=> b!709210 (= e!399126 e!399128)))

(declare-fun res!472686 () Bool)

(assert (=> b!709210 (=> res!472686 e!399128)))

(declare-fun e!399127 () Bool)

(assert (=> b!709210 (= res!472686 e!399127)))

(declare-fun res!472689 () Bool)

(assert (=> b!709210 (=> (not res!472689) (not e!399127))))

(assert (=> b!709210 (= res!472689 (= (h!14319 acc!652) (h!14319 newAcc!49)))))

(declare-fun b!709212 () Bool)

(assert (=> b!709212 (= e!399128 (subseq!395 acc!652 (t!19558 newAcc!49)))))

(declare-fun b!709211 () Bool)

(assert (=> b!709211 (= e!399127 (subseq!395 (t!19558 acc!652) (t!19558 newAcc!49)))))

(assert (= (and d!97107 (not res!472688)) b!709209))

(assert (= (and b!709209 res!472687) b!709210))

(assert (= (and b!709210 res!472689) b!709211))

(assert (= (and b!709210 (not res!472686)) b!709212))

(declare-fun m!667093 () Bool)

(assert (=> b!709212 m!667093))

(declare-fun m!667095 () Bool)

(assert (=> b!709211 m!667095))

(assert (=> b!709043 d!97107))

(declare-fun d!97109 () Bool)

(declare-fun lt!318279 () Bool)

(assert (=> d!97109 (= lt!318279 (select (content!341 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!399129 () Bool)

(assert (=> d!97109 (= lt!318279 e!399129)))

(declare-fun res!472691 () Bool)

(assert (=> d!97109 (=> (not res!472691) (not e!399129))))

(assert (=> d!97109 (= res!472691 ((_ is Cons!13271) acc!652))))

(assert (=> d!97109 (= (contains!3927 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318279)))

(declare-fun b!709213 () Bool)

(declare-fun e!399130 () Bool)

(assert (=> b!709213 (= e!399129 e!399130)))

(declare-fun res!472690 () Bool)

(assert (=> b!709213 (=> res!472690 e!399130)))

(assert (=> b!709213 (= res!472690 (= (h!14319 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!709214 () Bool)

(assert (=> b!709214 (= e!399130 (contains!3927 (t!19558 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97109 res!472691) b!709213))

(assert (= (and b!709213 (not res!472690)) b!709214))

(declare-fun m!667097 () Bool)

(assert (=> d!97109 m!667097))

(declare-fun m!667099 () Bool)

(assert (=> d!97109 m!667099))

(declare-fun m!667101 () Bool)

(assert (=> b!709214 m!667101))

(assert (=> b!709054 d!97109))

(declare-fun d!97111 () Bool)

(declare-fun lt!318280 () Bool)

(assert (=> d!97111 (= lt!318280 (select (content!341 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!399131 () Bool)

(assert (=> d!97111 (= lt!318280 e!399131)))

(declare-fun res!472693 () Bool)

(assert (=> d!97111 (=> (not res!472693) (not e!399131))))

(assert (=> d!97111 (= res!472693 ((_ is Cons!13271) newAcc!49))))

(assert (=> d!97111 (= (contains!3927 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318280)))

(declare-fun b!709215 () Bool)

(declare-fun e!399132 () Bool)

(assert (=> b!709215 (= e!399131 e!399132)))

(declare-fun res!472692 () Bool)

(assert (=> b!709215 (=> res!472692 e!399132)))

(assert (=> b!709215 (= res!472692 (= (h!14319 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!709216 () Bool)

(assert (=> b!709216 (= e!399132 (contains!3927 (t!19558 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97111 res!472693) b!709215))

(assert (= (and b!709215 (not res!472692)) b!709216))

(assert (=> d!97111 m!667079))

(declare-fun m!667103 () Bool)

(assert (=> d!97111 m!667103))

(declare-fun m!667105 () Bool)

(assert (=> b!709216 m!667105))

(assert (=> b!709044 d!97111))

(declare-fun d!97113 () Bool)

(assert (=> d!97113 (= (array_inv!15186 a!3591) (bvsge (size!19719 a!3591) #b00000000000000000000000000000000))))

(assert (=> start!62902 d!97113))

(declare-fun d!97119 () Bool)

(declare-fun res!472694 () Bool)

(declare-fun e!399133 () Bool)

(assert (=> d!97119 (=> res!472694 e!399133)))

(assert (=> d!97119 (= res!472694 ((_ is Nil!13272) ($colon$colon!503 newAcc!49 (select (arr!19327 a!3591) from!2969))))))

(assert (=> d!97119 (= (noDuplicate!1201 ($colon$colon!503 newAcc!49 (select (arr!19327 a!3591) from!2969))) e!399133)))

(declare-fun b!709217 () Bool)

(declare-fun e!399134 () Bool)

(assert (=> b!709217 (= e!399133 e!399134)))

(declare-fun res!472695 () Bool)

(assert (=> b!709217 (=> (not res!472695) (not e!399134))))

(assert (=> b!709217 (= res!472695 (not (contains!3927 (t!19558 ($colon$colon!503 newAcc!49 (select (arr!19327 a!3591) from!2969))) (h!14319 ($colon$colon!503 newAcc!49 (select (arr!19327 a!3591) from!2969))))))))

(declare-fun b!709218 () Bool)

(assert (=> b!709218 (= e!399134 (noDuplicate!1201 (t!19558 ($colon$colon!503 newAcc!49 (select (arr!19327 a!3591) from!2969)))))))

(assert (= (and d!97119 (not res!472694)) b!709217))

(assert (= (and b!709217 res!472695) b!709218))

(declare-fun m!667107 () Bool)

(assert (=> b!709217 m!667107))

(declare-fun m!667109 () Bool)

(assert (=> b!709218 m!667109))

(assert (=> b!709045 d!97119))

(declare-fun d!97121 () Bool)

(assert (=> d!97121 (= ($colon$colon!503 newAcc!49 (select (arr!19327 a!3591) from!2969)) (Cons!13271 (select (arr!19327 a!3591) from!2969) newAcc!49))))

(assert (=> b!709045 d!97121))

(declare-fun d!97123 () Bool)

(declare-fun res!472714 () Bool)

(declare-fun e!399153 () Bool)

(assert (=> d!97123 (=> res!472714 e!399153)))

(assert (=> d!97123 (= res!472714 (= (select (arr!19327 a!3591) from!2969) k0!2824))))

(assert (=> d!97123 (= (arrayContainsKey!0 a!3591 k0!2824 from!2969) e!399153)))

(declare-fun b!709237 () Bool)

(declare-fun e!399154 () Bool)

(assert (=> b!709237 (= e!399153 e!399154)))

(declare-fun res!472715 () Bool)

(assert (=> b!709237 (=> (not res!472715) (not e!399154))))

(assert (=> b!709237 (= res!472715 (bvslt (bvadd from!2969 #b00000000000000000000000000000001) (size!19719 a!3591)))))

(declare-fun b!709238 () Bool)

(assert (=> b!709238 (= e!399154 (arrayContainsKey!0 a!3591 k0!2824 (bvadd from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!97123 (not res!472714)) b!709237))

(assert (= (and b!709237 res!472715) b!709238))

(assert (=> d!97123 m!666929))

(declare-fun m!667117 () Bool)

(assert (=> b!709238 m!667117))

(assert (=> b!709034 d!97123))

(declare-fun d!97127 () Bool)

(assert (=> d!97127 (= ($colon$colon!503 acc!652 (select (arr!19327 a!3591) from!2969)) (Cons!13271 (select (arr!19327 a!3591) from!2969) acc!652))))

(assert (=> b!709035 d!97127))

(declare-fun d!97129 () Bool)

(declare-fun res!472722 () Bool)

(declare-fun e!399161 () Bool)

(assert (=> d!97129 (=> res!472722 e!399161)))

(assert (=> d!97129 (= res!472722 (= (select (arr!19327 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) k0!2824))))

(assert (=> d!97129 (= (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969)) e!399161)))

(declare-fun b!709245 () Bool)

(declare-fun e!399162 () Bool)

(assert (=> b!709245 (= e!399161 e!399162)))

(declare-fun res!472723 () Bool)

(assert (=> b!709245 (=> (not res!472723) (not e!399162))))

(assert (=> b!709245 (= res!472723 (bvslt (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001) (size!19719 a!3591)))))

(declare-fun b!709246 () Bool)

(assert (=> b!709246 (= e!399162 (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!97129 (not res!472722)) b!709245))

(assert (= (and b!709245 res!472723) b!709246))

(declare-fun m!667129 () Bool)

(assert (=> d!97129 m!667129))

(declare-fun m!667131 () Bool)

(assert (=> b!709246 m!667131))

(assert (=> b!709046 d!97129))

(declare-fun d!97135 () Bool)

(assert (=> d!97135 (= (validKeyInArray!0 k0!2824) (and (not (= k0!2824 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2824 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!709047 d!97135))

(declare-fun d!97139 () Bool)

(declare-fun lt!318285 () Bool)

(assert (=> d!97139 (= lt!318285 (select (content!341 acc!652) k0!2824))))

(declare-fun e!399163 () Bool)

(assert (=> d!97139 (= lt!318285 e!399163)))

(declare-fun res!472725 () Bool)

(assert (=> d!97139 (=> (not res!472725) (not e!399163))))

(assert (=> d!97139 (= res!472725 ((_ is Cons!13271) acc!652))))

(assert (=> d!97139 (= (contains!3927 acc!652 k0!2824) lt!318285)))

(declare-fun b!709247 () Bool)

(declare-fun e!399164 () Bool)

(assert (=> b!709247 (= e!399163 e!399164)))

(declare-fun res!472724 () Bool)

(assert (=> b!709247 (=> res!472724 e!399164)))

(assert (=> b!709247 (= res!472724 (= (h!14319 acc!652) k0!2824))))

(declare-fun b!709248 () Bool)

(assert (=> b!709248 (= e!399164 (contains!3927 (t!19558 acc!652) k0!2824))))

(assert (= (and d!97139 res!472725) b!709247))

(assert (= (and b!709247 (not res!472724)) b!709248))

(assert (=> d!97139 m!667097))

(declare-fun m!667133 () Bool)

(assert (=> d!97139 m!667133))

(declare-fun m!667135 () Bool)

(assert (=> b!709248 m!667135))

(assert (=> b!709036 d!97139))

(declare-fun call!34427 () Bool)

(declare-fun c!78636 () Bool)

(declare-fun bm!34424 () Bool)

(assert (=> bm!34424 (= call!34427 (arrayNoDuplicates!0 a!3591 (bvadd from!2969 #b00000000000000000000000000000001) (ite c!78636 (Cons!13271 (select (arr!19327 a!3591) from!2969) acc!652) acc!652)))))

(declare-fun b!709289 () Bool)

(declare-fun e!399203 () Bool)

(assert (=> b!709289 (= e!399203 call!34427)))

(declare-fun d!97141 () Bool)

(declare-fun res!472755 () Bool)

(declare-fun e!399202 () Bool)

(assert (=> d!97141 (=> res!472755 e!399202)))

(assert (=> d!97141 (= res!472755 (bvsge from!2969 (size!19719 a!3591)))))

(assert (=> d!97141 (= (arrayNoDuplicates!0 a!3591 from!2969 acc!652) e!399202)))

(declare-fun b!709290 () Bool)

(assert (=> b!709290 (= e!399203 call!34427)))

(declare-fun b!709291 () Bool)

(declare-fun e!399200 () Bool)

(assert (=> b!709291 (= e!399200 e!399203)))

(assert (=> b!709291 (= c!78636 (validKeyInArray!0 (select (arr!19327 a!3591) from!2969)))))

(declare-fun b!709292 () Bool)

(assert (=> b!709292 (= e!399202 e!399200)))

(declare-fun res!472754 () Bool)

(assert (=> b!709292 (=> (not res!472754) (not e!399200))))

(declare-fun e!399201 () Bool)

(assert (=> b!709292 (= res!472754 (not e!399201))))

(declare-fun res!472756 () Bool)

(assert (=> b!709292 (=> (not res!472756) (not e!399201))))

(assert (=> b!709292 (= res!472756 (validKeyInArray!0 (select (arr!19327 a!3591) from!2969)))))

(declare-fun b!709293 () Bool)

(assert (=> b!709293 (= e!399201 (contains!3927 acc!652 (select (arr!19327 a!3591) from!2969)))))

(assert (= (and d!97141 (not res!472755)) b!709292))

(assert (= (and b!709292 res!472756) b!709293))

(assert (= (and b!709292 res!472754) b!709291))

(assert (= (and b!709291 c!78636) b!709290))

(assert (= (and b!709291 (not c!78636)) b!709289))

(assert (= (or b!709290 b!709289) bm!34424))

(assert (=> bm!34424 m!666929))

(declare-fun m!667157 () Bool)

(assert (=> bm!34424 m!667157))

(assert (=> b!709291 m!666929))

(assert (=> b!709291 m!666929))

(assert (=> b!709291 m!666955))

(assert (=> b!709292 m!666929))

(assert (=> b!709292 m!666929))

(assert (=> b!709292 m!666955))

(assert (=> b!709293 m!666929))

(assert (=> b!709293 m!666929))

(declare-fun m!667159 () Bool)

(assert (=> b!709293 m!667159))

(assert (=> b!709037 d!97141))

(declare-fun d!97155 () Bool)

(declare-fun lt!318293 () Bool)

(assert (=> d!97155 (= lt!318293 (select (content!341 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!399210 () Bool)

(assert (=> d!97155 (= lt!318293 e!399210)))

(declare-fun res!472764 () Bool)

(assert (=> d!97155 (=> (not res!472764) (not e!399210))))

(assert (=> d!97155 (= res!472764 ((_ is Cons!13271) acc!652))))

(assert (=> d!97155 (= (contains!3927 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318293)))

(declare-fun b!709300 () Bool)

(declare-fun e!399211 () Bool)

(assert (=> b!709300 (= e!399210 e!399211)))

(declare-fun res!472763 () Bool)

(assert (=> b!709300 (=> res!472763 e!399211)))

(assert (=> b!709300 (= res!472763 (= (h!14319 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!709301 () Bool)

(assert (=> b!709301 (= e!399211 (contains!3927 (t!19558 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97155 res!472764) b!709300))

(assert (= (and b!709300 (not res!472763)) b!709301))

(assert (=> d!97155 m!667097))

(declare-fun m!667161 () Bool)

(assert (=> d!97155 m!667161))

(declare-fun m!667163 () Bool)

(assert (=> b!709301 m!667163))

(assert (=> b!709048 d!97155))

(declare-fun d!97157 () Bool)

(assert (=> d!97157 (= (validKeyInArray!0 (select (arr!19327 a!3591) from!2969)) (and (not (= (select (arr!19327 a!3591) from!2969) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19327 a!3591) from!2969) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!709038 d!97157))

(declare-fun d!97159 () Bool)

(declare-fun lt!318294 () Bool)

(assert (=> d!97159 (= lt!318294 (select (content!341 lt!318267) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!399212 () Bool)

(assert (=> d!97159 (= lt!318294 e!399212)))

(declare-fun res!472766 () Bool)

(assert (=> d!97159 (=> (not res!472766) (not e!399212))))

(assert (=> d!97159 (= res!472766 ((_ is Cons!13271) lt!318267))))

(assert (=> d!97159 (= (contains!3927 lt!318267 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318294)))

(declare-fun b!709302 () Bool)

(declare-fun e!399213 () Bool)

(assert (=> b!709302 (= e!399212 e!399213)))

(declare-fun res!472765 () Bool)

(assert (=> b!709302 (=> res!472765 e!399213)))

(assert (=> b!709302 (= res!472765 (= (h!14319 lt!318267) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!709303 () Bool)

(assert (=> b!709303 (= e!399213 (contains!3927 (t!19558 lt!318267) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97159 res!472766) b!709302))

(assert (= (and b!709302 (not res!472765)) b!709303))

(assert (=> d!97159 m!667069))

(declare-fun m!667165 () Bool)

(assert (=> d!97159 m!667165))

(declare-fun m!667167 () Bool)

(assert (=> b!709303 m!667167))

(assert (=> b!709039 d!97159))

(declare-fun d!97161 () Bool)

(declare-fun e!399247 () Bool)

(assert (=> d!97161 e!399247))

(declare-fun res!472788 () Bool)

(assert (=> d!97161 (=> (not res!472788) (not e!399247))))

(declare-fun lt!318304 () List!13275)

(declare-fun size!19724 (List!13275) Int)

(assert (=> d!97161 (= res!472788 (<= (size!19724 lt!318304) (size!19724 newAcc!49)))))

(declare-fun e!399248 () List!13275)

(assert (=> d!97161 (= lt!318304 e!399248)))

(declare-fun c!78648 () Bool)

(assert (=> d!97161 (= c!78648 ((_ is Cons!13271) newAcc!49))))

(assert (=> d!97161 (= (-!359 newAcc!49 k0!2824) lt!318304)))

(declare-fun bm!34430 () Bool)

(declare-fun call!34433 () List!13275)

(assert (=> bm!34430 (= call!34433 (-!359 (t!19558 newAcc!49) k0!2824))))

(declare-fun b!709345 () Bool)

(declare-fun e!399249 () List!13275)

(assert (=> b!709345 (= e!399248 e!399249)))

(declare-fun c!78647 () Bool)

(assert (=> b!709345 (= c!78647 (= k0!2824 (h!14319 newAcc!49)))))

(declare-fun b!709346 () Bool)

(assert (=> b!709346 (= e!399249 call!34433)))

(declare-fun b!709347 () Bool)

(assert (=> b!709347 (= e!399247 (= (content!341 lt!318304) ((_ map and) (content!341 newAcc!49) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) k0!2824 true)))))))

(declare-fun b!709348 () Bool)

(assert (=> b!709348 (= e!399248 Nil!13272)))

(declare-fun b!709349 () Bool)

(assert (=> b!709349 (= e!399249 (Cons!13271 (h!14319 newAcc!49) call!34433))))

(assert (= (and d!97161 c!78648) b!709345))

(assert (= (and d!97161 (not c!78648)) b!709348))

(assert (= (and b!709345 c!78647) b!709346))

(assert (= (and b!709345 (not c!78647)) b!709349))

(assert (= (or b!709346 b!709349) bm!34430))

(assert (= (and d!97161 res!472788) b!709347))

(declare-fun m!667207 () Bool)

(assert (=> d!97161 m!667207))

(declare-fun m!667211 () Bool)

(assert (=> d!97161 m!667211))

(declare-fun m!667217 () Bool)

(assert (=> bm!34430 m!667217))

(declare-fun m!667220 () Bool)

(assert (=> b!709347 m!667220))

(assert (=> b!709347 m!667079))

(declare-fun m!667227 () Bool)

(assert (=> b!709347 m!667227))

(assert (=> b!709050 d!97161))

(check-sat (not bm!34424) (not d!97101) (not d!97159) (not d!97139) (not b!709347) (not b!709238) (not b!709194) (not d!97161) (not b!709291) (not b!709293) (not b!709246) (not b!709301) (not b!709200) (not b!709199) (not b!709185) (not b!709198) (not b!709214) (not bm!34430) (not b!709186) (not b!709192) (not b!709303) (not b!709216) (not b!709292) (not b!709212) (not b!709193) (not d!97097) (not b!709211) (not d!97109) (not b!709217) (not d!97103) (not d!97155) (not b!709248) (not b!709196) (not d!97111) (not b!709218))
(check-sat)
