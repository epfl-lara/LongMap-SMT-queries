; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62846 () Bool)

(assert start!62846)

(declare-fun b!708899 () Bool)

(declare-fun res!472503 () Bool)

(declare-fun e!398923 () Bool)

(assert (=> b!708899 (=> (not res!472503) (not e!398923))))

(declare-datatypes ((List!13375 0))(
  ( (Nil!13372) (Cons!13371 (h!14416 (_ BitVec 64)) (t!19666 List!13375)) )
))
(declare-fun newAcc!49 () List!13375)

(declare-fun contains!3952 (List!13375 (_ BitVec 64)) Bool)

(assert (=> b!708899 (= res!472503 (not (contains!3952 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!472502 () Bool)

(assert (=> start!62846 (=> (not res!472502) (not e!398923))))

(declare-datatypes ((array!40364 0))(
  ( (array!40365 (arr!19334 (Array (_ BitVec 32) (_ BitVec 64))) (size!19725 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40364)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!62846 (= res!472502 (and (bvslt (size!19725 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19725 a!3591))))))

(assert (=> start!62846 e!398923))

(assert (=> start!62846 true))

(declare-fun array_inv!15130 (array!40364) Bool)

(assert (=> start!62846 (array_inv!15130 a!3591)))

(declare-fun b!708900 () Bool)

(declare-fun res!472504 () Bool)

(declare-fun e!398922 () Bool)

(assert (=> b!708900 (=> (not res!472504) (not e!398922))))

(declare-fun noDuplicate!1199 (List!13375) Bool)

(declare-fun $colon$colon!508 (List!13375 (_ BitVec 64)) List!13375)

(assert (=> b!708900 (= res!472504 (noDuplicate!1199 ($colon$colon!508 newAcc!49 (select (arr!19334 a!3591) from!2969))))))

(declare-fun b!708901 () Bool)

(declare-fun res!472518 () Bool)

(assert (=> b!708901 (=> (not res!472518) (not e!398923))))

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun acc!652 () List!13375)

(declare-fun -!362 (List!13375 (_ BitVec 64)) List!13375)

(assert (=> b!708901 (= res!472518 (= (-!362 newAcc!49 k!2824) acc!652))))

(declare-fun b!708902 () Bool)

(declare-fun res!472513 () Bool)

(assert (=> b!708902 (=> (not res!472513) (not e!398923))))

(assert (=> b!708902 (= res!472513 (not (contains!3952 acc!652 k!2824)))))

(declare-fun b!708903 () Bool)

(declare-fun res!472512 () Bool)

(assert (=> b!708903 (=> (not res!472512) (not e!398922))))

(declare-fun lt!318158 () List!13375)

(assert (=> b!708903 (= res!472512 (not (contains!3952 lt!318158 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!708904 () Bool)

(declare-fun res!472507 () Bool)

(assert (=> b!708904 (=> (not res!472507) (not e!398923))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!708904 (= res!472507 (validKeyInArray!0 (select (arr!19334 a!3591) from!2969)))))

(declare-fun b!708905 () Bool)

(declare-fun res!472510 () Bool)

(assert (=> b!708905 (=> (not res!472510) (not e!398923))))

(declare-fun subseq!397 (List!13375 List!13375) Bool)

(assert (=> b!708905 (= res!472510 (subseq!397 acc!652 newAcc!49))))

(declare-fun b!708906 () Bool)

(declare-fun res!472517 () Bool)

(assert (=> b!708906 (=> (not res!472517) (not e!398922))))

(assert (=> b!708906 (= res!472517 (noDuplicate!1199 lt!318158))))

(declare-fun b!708907 () Bool)

(assert (=> b!708907 (= e!398923 e!398922)))

(declare-fun res!472506 () Bool)

(assert (=> b!708907 (=> (not res!472506) (not e!398922))))

(assert (=> b!708907 (= res!472506 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(assert (=> b!708907 (= lt!318158 ($colon$colon!508 acc!652 (select (arr!19334 a!3591) from!2969)))))

(declare-fun b!708908 () Bool)

(declare-fun res!472500 () Bool)

(assert (=> b!708908 (=> (not res!472500) (not e!398923))))

(declare-fun arrayContainsKey!0 (array!40364 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!708908 (= res!472500 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!708909 () Bool)

(declare-fun res!472499 () Bool)

(assert (=> b!708909 (=> (not res!472499) (not e!398923))))

(assert (=> b!708909 (= res!472499 (noDuplicate!1199 newAcc!49))))

(declare-fun b!708910 () Bool)

(declare-fun res!472516 () Bool)

(assert (=> b!708910 (=> (not res!472516) (not e!398923))))

(declare-fun arrayNoDuplicates!0 (array!40364 (_ BitVec 32) List!13375) Bool)

(assert (=> b!708910 (= res!472516 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!708911 () Bool)

(assert (=> b!708911 (= e!398922 (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969)))))

(declare-fun b!708912 () Bool)

(declare-fun res!472515 () Bool)

(assert (=> b!708912 (=> (not res!472515) (not e!398923))))

(assert (=> b!708912 (= res!472515 (not (contains!3952 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!708913 () Bool)

(declare-fun res!472511 () Bool)

(assert (=> b!708913 (=> (not res!472511) (not e!398923))))

(assert (=> b!708913 (= res!472511 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19725 a!3591)))))

(declare-fun b!708914 () Bool)

(declare-fun res!472519 () Bool)

(assert (=> b!708914 (=> (not res!472519) (not e!398922))))

(assert (=> b!708914 (= res!472519 (not (contains!3952 lt!318158 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!708915 () Bool)

(declare-fun res!472509 () Bool)

(assert (=> b!708915 (=> (not res!472509) (not e!398923))))

(assert (=> b!708915 (= res!472509 (not (contains!3952 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!708916 () Bool)

(declare-fun res!472505 () Bool)

(assert (=> b!708916 (=> (not res!472505) (not e!398923))))

(assert (=> b!708916 (= res!472505 (contains!3952 newAcc!49 k!2824))))

(declare-fun b!708917 () Bool)

(declare-fun res!472501 () Bool)

(assert (=> b!708917 (=> (not res!472501) (not e!398923))))

(assert (=> b!708917 (= res!472501 (validKeyInArray!0 k!2824))))

(declare-fun b!708918 () Bool)

(declare-fun res!472514 () Bool)

(assert (=> b!708918 (=> (not res!472514) (not e!398923))))

(assert (=> b!708918 (= res!472514 (not (contains!3952 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!708919 () Bool)

(declare-fun res!472508 () Bool)

(assert (=> b!708919 (=> (not res!472508) (not e!398923))))

(assert (=> b!708919 (= res!472508 (noDuplicate!1199 acc!652))))

(assert (= (and start!62846 res!472502) b!708919))

(assert (= (and b!708919 res!472508) b!708909))

(assert (= (and b!708909 res!472499) b!708915))

(assert (= (and b!708915 res!472509) b!708912))

(assert (= (and b!708912 res!472515) b!708908))

(assert (= (and b!708908 res!472500) b!708902))

(assert (= (and b!708902 res!472513) b!708917))

(assert (= (and b!708917 res!472501) b!708910))

(assert (= (and b!708910 res!472516) b!708905))

(assert (= (and b!708905 res!472510) b!708916))

(assert (= (and b!708916 res!472505) b!708901))

(assert (= (and b!708901 res!472518) b!708918))

(assert (= (and b!708918 res!472514) b!708899))

(assert (= (and b!708899 res!472503) b!708913))

(assert (= (and b!708913 res!472511) b!708904))

(assert (= (and b!708904 res!472507) b!708907))

(assert (= (and b!708907 res!472506) b!708906))

(assert (= (and b!708906 res!472517) b!708900))

(assert (= (and b!708900 res!472504) b!708903))

(assert (= (and b!708903 res!472512) b!708914))

(assert (= (and b!708914 res!472519) b!708911))

(declare-fun m!666261 () Bool)

(assert (=> b!708901 m!666261))

(declare-fun m!666263 () Bool)

(assert (=> b!708915 m!666263))

(declare-fun m!666265 () Bool)

(assert (=> b!708917 m!666265))

(declare-fun m!666267 () Bool)

(assert (=> b!708918 m!666267))

(declare-fun m!666269 () Bool)

(assert (=> b!708902 m!666269))

(declare-fun m!666271 () Bool)

(assert (=> b!708906 m!666271))

(declare-fun m!666273 () Bool)

(assert (=> b!708903 m!666273))

(declare-fun m!666275 () Bool)

(assert (=> b!708909 m!666275))

(declare-fun m!666277 () Bool)

(assert (=> b!708911 m!666277))

(declare-fun m!666279 () Bool)

(assert (=> b!708916 m!666279))

(declare-fun m!666281 () Bool)

(assert (=> start!62846 m!666281))

(declare-fun m!666283 () Bool)

(assert (=> b!708899 m!666283))

(declare-fun m!666285 () Bool)

(assert (=> b!708919 m!666285))

(declare-fun m!666287 () Bool)

(assert (=> b!708910 m!666287))

(declare-fun m!666289 () Bool)

(assert (=> b!708908 m!666289))

(declare-fun m!666291 () Bool)

(assert (=> b!708912 m!666291))

(declare-fun m!666293 () Bool)

(assert (=> b!708914 m!666293))

(declare-fun m!666295 () Bool)

(assert (=> b!708907 m!666295))

(assert (=> b!708907 m!666295))

(declare-fun m!666297 () Bool)

(assert (=> b!708907 m!666297))

(assert (=> b!708904 m!666295))

(assert (=> b!708904 m!666295))

(declare-fun m!666299 () Bool)

(assert (=> b!708904 m!666299))

(declare-fun m!666301 () Bool)

(assert (=> b!708905 m!666301))

(assert (=> b!708900 m!666295))

(assert (=> b!708900 m!666295))

(declare-fun m!666303 () Bool)

(assert (=> b!708900 m!666303))

(assert (=> b!708900 m!666303))

(declare-fun m!666305 () Bool)

(assert (=> b!708900 m!666305))

(push 1)

(assert (not b!708900))

(assert (not b!708907))

(assert (not start!62846))

(assert (not b!708919))

(assert (not b!708917))

(assert (not b!708914))

(assert (not b!708903))

(assert (not b!708910))

(assert (not b!708908))

(assert (not b!708918))

(assert (not b!708909))

(assert (not b!708906))

(assert (not b!708904))

(assert (not b!708902))

(assert (not b!708912))

(assert (not b!708901))

(assert (not b!708899))

(assert (not b!708915))

(assert (not b!708905))

(assert (not b!708911))

(assert (not b!708916))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!96949 () Bool)

(declare-fun lt!318161 () Bool)

(declare-fun content!341 (List!13375) (Set (_ BitVec 64)))

(assert (=> d!96949 (= lt!318161 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!341 acc!652)))))

(declare-fun e!398941 () Bool)

(assert (=> d!96949 (= lt!318161 e!398941)))

(declare-fun res!472533 () Bool)

(assert (=> d!96949 (=> (not res!472533) (not e!398941))))

(assert (=> d!96949 (= res!472533 (is-Cons!13371 acc!652))))

(assert (=> d!96949 (= (contains!3952 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318161)))

(declare-fun b!708939 () Bool)

(declare-fun e!398942 () Bool)

(assert (=> b!708939 (= e!398941 e!398942)))

(declare-fun res!472534 () Bool)

(assert (=> b!708939 (=> res!472534 e!398942)))

(assert (=> b!708939 (= res!472534 (= (h!14416 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!708940 () Bool)

(assert (=> b!708940 (= e!398942 (contains!3952 (t!19666 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96949 res!472533) b!708939))

(assert (= (and b!708939 (not res!472534)) b!708940))

(declare-fun m!666311 () Bool)

(assert (=> d!96949 m!666311))

(declare-fun m!666313 () Bool)

(assert (=> d!96949 m!666313))

(declare-fun m!666315 () Bool)

(assert (=> b!708940 m!666315))

(assert (=> b!708912 d!96949))

(declare-fun d!96955 () Bool)

(declare-fun lt!318162 () Bool)

(assert (=> d!96955 (= lt!318162 (member k!2824 (content!341 acc!652)))))

(declare-fun e!398943 () Bool)

(assert (=> d!96955 (= lt!318162 e!398943)))

(declare-fun res!472535 () Bool)

(assert (=> d!96955 (=> (not res!472535) (not e!398943))))

(assert (=> d!96955 (= res!472535 (is-Cons!13371 acc!652))))

(assert (=> d!96955 (= (contains!3952 acc!652 k!2824) lt!318162)))

(declare-fun b!708941 () Bool)

(declare-fun e!398944 () Bool)

(assert (=> b!708941 (= e!398943 e!398944)))

(declare-fun res!472536 () Bool)

(assert (=> b!708941 (=> res!472536 e!398944)))

(assert (=> b!708941 (= res!472536 (= (h!14416 acc!652) k!2824))))

(declare-fun b!708942 () Bool)

(assert (=> b!708942 (= e!398944 (contains!3952 (t!19666 acc!652) k!2824))))

(assert (= (and d!96955 res!472535) b!708941))

(assert (= (and b!708941 (not res!472536)) b!708942))

(assert (=> d!96955 m!666311))

(declare-fun m!666317 () Bool)

(assert (=> d!96955 m!666317))

(declare-fun m!666319 () Bool)

(assert (=> b!708942 m!666319))

(assert (=> b!708902 d!96955))

(declare-fun d!96957 () Bool)

(declare-fun lt!318163 () Bool)

(assert (=> d!96957 (= lt!318163 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!341 lt!318158)))))

(declare-fun e!398945 () Bool)

(assert (=> d!96957 (= lt!318163 e!398945)))

(declare-fun res!472537 () Bool)

(assert (=> d!96957 (=> (not res!472537) (not e!398945))))

(assert (=> d!96957 (= res!472537 (is-Cons!13371 lt!318158))))

(assert (=> d!96957 (= (contains!3952 lt!318158 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318163)))

(declare-fun b!708943 () Bool)

(declare-fun e!398946 () Bool)

(assert (=> b!708943 (= e!398945 e!398946)))

(declare-fun res!472538 () Bool)

(assert (=> b!708943 (=> res!472538 e!398946)))

(assert (=> b!708943 (= res!472538 (= (h!14416 lt!318158) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!708944 () Bool)

(assert (=> b!708944 (= e!398946 (contains!3952 (t!19666 lt!318158) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96957 res!472537) b!708943))

(assert (= (and b!708943 (not res!472538)) b!708944))

(declare-fun m!666321 () Bool)

(assert (=> d!96957 m!666321))

(declare-fun m!666323 () Bool)

(assert (=> d!96957 m!666323))

(declare-fun m!666325 () Bool)

(assert (=> b!708944 m!666325))

(assert (=> b!708903 d!96957))

(declare-fun d!96959 () Bool)

(declare-fun lt!318164 () Bool)

(assert (=> d!96959 (= lt!318164 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!341 lt!318158)))))

(declare-fun e!398947 () Bool)

(assert (=> d!96959 (= lt!318164 e!398947)))

(declare-fun res!472539 () Bool)

(assert (=> d!96959 (=> (not res!472539) (not e!398947))))

(assert (=> d!96959 (= res!472539 (is-Cons!13371 lt!318158))))

(assert (=> d!96959 (= (contains!3952 lt!318158 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318164)))

(declare-fun b!708945 () Bool)

(declare-fun e!398948 () Bool)

(assert (=> b!708945 (= e!398947 e!398948)))

(declare-fun res!472540 () Bool)

(assert (=> b!708945 (=> res!472540 e!398948)))

(assert (=> b!708945 (= res!472540 (= (h!14416 lt!318158) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!708946 () Bool)

(assert (=> b!708946 (= e!398948 (contains!3952 (t!19666 lt!318158) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96959 res!472539) b!708945))

(assert (= (and b!708945 (not res!472540)) b!708946))

(assert (=> d!96959 m!666321))

(declare-fun m!666327 () Bool)

(assert (=> d!96959 m!666327))

(declare-fun m!666329 () Bool)

(assert (=> b!708946 m!666329))

(assert (=> b!708914 d!96959))

(declare-fun d!96961 () Bool)

(declare-fun lt!318167 () Bool)

(assert (=> d!96961 (= lt!318167 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!341 acc!652)))))

(declare-fun e!398957 () Bool)

(assert (=> d!96961 (= lt!318167 e!398957)))

(declare-fun res!472549 () Bool)

(assert (=> d!96961 (=> (not res!472549) (not e!398957))))

(assert (=> d!96961 (= res!472549 (is-Cons!13371 acc!652))))

(assert (=> d!96961 (= (contains!3952 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318167)))

(declare-fun b!708955 () Bool)

(declare-fun e!398958 () Bool)

(assert (=> b!708955 (= e!398957 e!398958)))

(declare-fun res!472550 () Bool)

(assert (=> b!708955 (=> res!472550 e!398958)))

(assert (=> b!708955 (= res!472550 (= (h!14416 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!708956 () Bool)

(assert (=> b!708956 (= e!398958 (contains!3952 (t!19666 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96961 res!472549) b!708955))

(assert (= (and b!708955 (not res!472550)) b!708956))

(assert (=> d!96961 m!666311))

(declare-fun m!666331 () Bool)

(assert (=> d!96961 m!666331))

(declare-fun m!666333 () Bool)

(assert (=> b!708956 m!666333))

(assert (=> b!708915 d!96961))

(declare-fun d!96963 () Bool)

(assert (=> d!96963 (= (validKeyInArray!0 (select (arr!19334 a!3591) from!2969)) (and (not (= (select (arr!19334 a!3591) from!2969) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19334 a!3591) from!2969) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!708904 d!96963))

(declare-fun d!96967 () Bool)

(declare-fun res!472578 () Bool)

(declare-fun e!398983 () Bool)

(assert (=> d!96967 (=> res!472578 e!398983)))

(assert (=> d!96967 (= res!472578 (is-Nil!13372 acc!652))))

(assert (=> d!96967 (= (subseq!397 acc!652 newAcc!49) e!398983)))

(declare-fun b!708981 () Bool)

(declare-fun e!398986 () Bool)

(assert (=> b!708981 (= e!398983 e!398986)))

(declare-fun res!472577 () Bool)

(assert (=> b!708981 (=> (not res!472577) (not e!398986))))

(assert (=> b!708981 (= res!472577 (is-Cons!13371 newAcc!49))))

(declare-fun b!708983 () Bool)

(declare-fun e!398985 () Bool)

(assert (=> b!708983 (= e!398985 (subseq!397 (t!19666 acc!652) (t!19666 newAcc!49)))))

(declare-fun b!708982 () Bool)

(declare-fun e!398984 () Bool)

(assert (=> b!708982 (= e!398986 e!398984)))

(declare-fun res!472576 () Bool)

(assert (=> b!708982 (=> res!472576 e!398984)))

(assert (=> b!708982 (= res!472576 e!398985)))

(declare-fun res!472575 () Bool)

(assert (=> b!708982 (=> (not res!472575) (not e!398985))))

(assert (=> b!708982 (= res!472575 (= (h!14416 acc!652) (h!14416 newAcc!49)))))

(declare-fun b!708984 () Bool)

(assert (=> b!708984 (= e!398984 (subseq!397 acc!652 (t!19666 newAcc!49)))))

(assert (= (and d!96967 (not res!472578)) b!708981))

(assert (= (and b!708981 res!472577) b!708982))

(assert (= (and b!708982 res!472575) b!708983))

(assert (= (and b!708982 (not res!472576)) b!708984))

(declare-fun m!666367 () Bool)

(assert (=> b!708983 m!666367))

(declare-fun m!666369 () Bool)

(assert (=> b!708984 m!666369))

(assert (=> b!708905 d!96967))

(declare-fun d!96985 () Bool)

(declare-fun lt!318177 () Bool)

(assert (=> d!96985 (= lt!318177 (member k!2824 (content!341 newAcc!49)))))

(declare-fun e!398992 () Bool)

(assert (=> d!96985 (= lt!318177 e!398992)))

(declare-fun res!472579 () Bool)

(assert (=> d!96985 (=> (not res!472579) (not e!398992))))

(assert (=> d!96985 (= res!472579 (is-Cons!13371 newAcc!49))))

(assert (=> d!96985 (= (contains!3952 newAcc!49 k!2824) lt!318177)))

(declare-fun b!708993 () Bool)

(declare-fun e!398993 () Bool)

(assert (=> b!708993 (= e!398992 e!398993)))

(declare-fun res!472580 () Bool)

(assert (=> b!708993 (=> res!472580 e!398993)))

(assert (=> b!708993 (= res!472580 (= (h!14416 newAcc!49) k!2824))))

(declare-fun b!708994 () Bool)

(assert (=> b!708994 (= e!398993 (contains!3952 (t!19666 newAcc!49) k!2824))))

(assert (= (and d!96985 res!472579) b!708993))

(assert (= (and b!708993 (not res!472580)) b!708994))

(declare-fun m!666371 () Bool)

(assert (=> d!96985 m!666371))

(declare-fun m!666373 () Bool)

(assert (=> d!96985 m!666373))

(declare-fun m!666377 () Bool)

(assert (=> b!708994 m!666377))

(assert (=> b!708916 d!96985))

(declare-fun d!96989 () Bool)

(assert (=> d!96989 (= (validKeyInArray!0 k!2824) (and (not (= k!2824 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2824 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!708917 d!96989))

(declare-fun d!96993 () Bool)

(declare-fun res!472596 () Bool)

(declare-fun e!399011 () Bool)

(assert (=> d!96993 (=> res!472596 e!399011)))

(assert (=> d!96993 (= res!472596 (is-Nil!13372 lt!318158))))

(assert (=> d!96993 (= (noDuplicate!1199 lt!318158) e!399011)))

(declare-fun b!709014 () Bool)

(declare-fun e!399012 () Bool)

(assert (=> b!709014 (= e!399011 e!399012)))

(declare-fun res!472597 () Bool)

(assert (=> b!709014 (=> (not res!472597) (not e!399012))))

(assert (=> b!709014 (= res!472597 (not (contains!3952 (t!19666 lt!318158) (h!14416 lt!318158))))))

(declare-fun b!709015 () Bool)

(assert (=> b!709015 (= e!399012 (noDuplicate!1199 (t!19666 lt!318158)))))

(assert (= (and d!96993 (not res!472596)) b!709014))

(assert (= (and b!709014 res!472597) b!709015))

(declare-fun m!666397 () Bool)

(assert (=> b!709014 m!666397))

(declare-fun m!666399 () Bool)

(assert (=> b!709015 m!666399))

(assert (=> b!708906 d!96993))

(declare-fun d!96999 () Bool)

(assert (=> d!96999 (= ($colon$colon!508 acc!652 (select (arr!19334 a!3591) from!2969)) (Cons!13371 (select (arr!19334 a!3591) from!2969) acc!652))))

(assert (=> b!708907 d!96999))

(declare-fun d!97003 () Bool)

(declare-fun lt!318181 () Bool)

(assert (=> d!97003 (= lt!318181 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!341 newAcc!49)))))

(declare-fun e!399019 () Bool)

(assert (=> d!97003 (= lt!318181 e!399019)))

(declare-fun res!472604 () Bool)

(assert (=> d!97003 (=> (not res!472604) (not e!399019))))

(assert (=> d!97003 (= res!472604 (is-Cons!13371 newAcc!49))))

(assert (=> d!97003 (= (contains!3952 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318181)))

(declare-fun b!709022 () Bool)

(declare-fun e!399022 () Bool)

(assert (=> b!709022 (= e!399019 e!399022)))

(declare-fun res!472607 () Bool)

(assert (=> b!709022 (=> res!472607 e!399022)))

(assert (=> b!709022 (= res!472607 (= (h!14416 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!709023 () Bool)

(assert (=> b!709023 (= e!399022 (contains!3952 (t!19666 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97003 res!472604) b!709022))

(assert (= (and b!709022 (not res!472607)) b!709023))

(assert (=> d!97003 m!666371))

(declare-fun m!666409 () Bool)

(assert (=> d!97003 m!666409))

(declare-fun m!666411 () Bool)

(assert (=> b!709023 m!666411))

(assert (=> b!708918 d!97003))

(declare-fun d!97007 () Bool)

(declare-fun res!472612 () Bool)

(declare-fun e!399027 () Bool)

(assert (=> d!97007 (=> res!472612 e!399027)))

(assert (=> d!97007 (= res!472612 (is-Nil!13372 acc!652))))

(assert (=> d!97007 (= (noDuplicate!1199 acc!652) e!399027)))

(declare-fun b!709030 () Bool)

(declare-fun e!399028 () Bool)

(assert (=> b!709030 (= e!399027 e!399028)))

(declare-fun res!472613 () Bool)

(assert (=> b!709030 (=> (not res!472613) (not e!399028))))

(assert (=> b!709030 (= res!472613 (not (contains!3952 (t!19666 acc!652) (h!14416 acc!652))))))

(declare-fun b!709031 () Bool)

(assert (=> b!709031 (= e!399028 (noDuplicate!1199 (t!19666 acc!652)))))

(assert (= (and d!97007 (not res!472612)) b!709030))

(assert (= (and b!709030 res!472613) b!709031))

(declare-fun m!666413 () Bool)

(assert (=> b!709030 m!666413))

(declare-fun m!666415 () Bool)

(assert (=> b!709031 m!666415))

(assert (=> b!708919 d!97007))

(declare-fun d!97011 () Bool)

(declare-fun res!472636 () Bool)

(declare-fun e!399051 () Bool)

(assert (=> d!97011 (=> res!472636 e!399051)))

(assert (=> d!97011 (= res!472636 (= (select (arr!19334 a!3591) from!2969) k!2824))))

(assert (=> d!97011 (= (arrayContainsKey!0 a!3591 k!2824 from!2969) e!399051)))

(declare-fun b!709054 () Bool)

(declare-fun e!399052 () Bool)

(assert (=> b!709054 (= e!399051 e!399052)))

(declare-fun res!472637 () Bool)

(assert (=> b!709054 (=> (not res!472637) (not e!399052))))

(assert (=> b!709054 (= res!472637 (bvslt (bvadd from!2969 #b00000000000000000000000000000001) (size!19725 a!3591)))))

(declare-fun b!709055 () Bool)

(assert (=> b!709055 (= e!399052 (arrayContainsKey!0 a!3591 k!2824 (bvadd from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!97011 (not res!472636)) b!709054))

(assert (= (and b!709054 res!472637) b!709055))

(assert (=> d!97011 m!666295))

(declare-fun m!666437 () Bool)

(assert (=> b!709055 m!666437))

(assert (=> b!708908 d!97011))

(declare-fun d!97023 () Bool)

(declare-fun res!472644 () Bool)

(declare-fun e!399059 () Bool)

(assert (=> d!97023 (=> res!472644 e!399059)))

(assert (=> d!97023 (= res!472644 (is-Nil!13372 newAcc!49))))

(assert (=> d!97023 (= (noDuplicate!1199 newAcc!49) e!399059)))

(declare-fun b!709062 () Bool)

(declare-fun e!399060 () Bool)

(assert (=> b!709062 (= e!399059 e!399060)))

(declare-fun res!472645 () Bool)

(assert (=> b!709062 (=> (not res!472645) (not e!399060))))

(assert (=> b!709062 (= res!472645 (not (contains!3952 (t!19666 newAcc!49) (h!14416 newAcc!49))))))

(declare-fun b!709063 () Bool)

(assert (=> b!709063 (= e!399060 (noDuplicate!1199 (t!19666 newAcc!49)))))

(assert (= (and d!97023 (not res!472644)) b!709062))

(assert (= (and b!709062 res!472645) b!709063))

(declare-fun m!666445 () Bool)

(assert (=> b!709062 m!666445))

(declare-fun m!666447 () Bool)

(assert (=> b!709063 m!666447))

(assert (=> b!708909 d!97023))

(declare-fun d!97027 () Bool)

(assert (=> d!97027 (= (array_inv!15130 a!3591) (bvsge (size!19725 a!3591) #b00000000000000000000000000000000))))

(assert (=> start!62846 d!97027))

(declare-fun d!97033 () Bool)

(declare-fun lt!318186 () Bool)

(assert (=> d!97033 (= lt!318186 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!341 newAcc!49)))))

(declare-fun e!399065 () Bool)

(assert (=> d!97033 (= lt!318186 e!399065)))

(declare-fun res!472650 () Bool)

(assert (=> d!97033 (=> (not res!472650) (not e!399065))))

(assert (=> d!97033 (= res!472650 (is-Cons!13371 newAcc!49))))

(assert (=> d!97033 (= (contains!3952 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318186)))

(declare-fun b!709068 () Bool)

(declare-fun e!399066 () Bool)

(assert (=> b!709068 (= e!399065 e!399066)))

(declare-fun res!472651 () Bool)

(assert (=> b!709068 (=> res!472651 e!399066)))

(assert (=> b!709068 (= res!472651 (= (h!14416 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!709069 () Bool)

(assert (=> b!709069 (= e!399066 (contains!3952 (t!19666 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97033 res!472650) b!709068))

(assert (= (and b!709068 (not res!472651)) b!709069))

(assert (=> d!97033 m!666371))

(declare-fun m!666453 () Bool)

(assert (=> d!97033 m!666453))

(declare-fun m!666455 () Bool)

(assert (=> b!709069 m!666455))

(assert (=> b!708899 d!97033))

(declare-fun b!709123 () Bool)

(declare-fun e!399118 () Bool)

(declare-fun call!34428 () Bool)

(assert (=> b!709123 (= e!399118 call!34428)))

(declare-fun b!709124 () Bool)

(declare-fun e!399115 () Bool)

(assert (=> b!709124 (= e!399115 e!399118)))

(declare-fun c!78581 () Bool)

(assert (=> b!709124 (= c!78581 (validKeyInArray!0 (select (arr!19334 a!3591) from!2969)))))

(declare-fun d!97035 () Bool)

(declare-fun res!472697 () Bool)

(declare-fun e!399117 () Bool)

(assert (=> d!97035 (=> res!472697 e!399117)))

(assert (=> d!97035 (= res!472697 (bvsge from!2969 (size!19725 a!3591)))))

(assert (=> d!97035 (= (arrayNoDuplicates!0 a!3591 from!2969 acc!652) e!399117)))

(declare-fun b!709125 () Bool)

(assert (=> b!709125 (= e!399117 e!399115)))

(declare-fun res!472696 () Bool)

(assert (=> b!709125 (=> (not res!472696) (not e!399115))))

(declare-fun e!399116 () Bool)

(assert (=> b!709125 (= res!472696 (not e!399116))))

(declare-fun res!472695 () Bool)

(assert (=> b!709125 (=> (not res!472695) (not e!399116))))

(assert (=> b!709125 (= res!472695 (validKeyInArray!0 (select (arr!19334 a!3591) from!2969)))))

(declare-fun b!709126 () Bool)

(assert (=> b!709126 (= e!399118 call!34428)))

(declare-fun b!709127 () Bool)

(assert (=> b!709127 (= e!399116 (contains!3952 acc!652 (select (arr!19334 a!3591) from!2969)))))

(declare-fun bm!34425 () Bool)

(assert (=> bm!34425 (= call!34428 (arrayNoDuplicates!0 a!3591 (bvadd from!2969 #b00000000000000000000000000000001) (ite c!78581 (Cons!13371 (select (arr!19334 a!3591) from!2969) acc!652) acc!652)))))

(assert (= (and d!97035 (not res!472697)) b!709125))

(assert (= (and b!709125 res!472695) b!709127))

(assert (= (and b!709125 res!472696) b!709124))

(assert (= (and b!709124 c!78581) b!709126))

(assert (= (and b!709124 (not c!78581)) b!709123))

(assert (= (or b!709126 b!709123) bm!34425))

(assert (=> b!709124 m!666295))

(assert (=> b!709124 m!666295))

(assert (=> b!709124 m!666299))

(assert (=> b!709125 m!666295))

(assert (=> b!709125 m!666295))

(assert (=> b!709125 m!666299))

(assert (=> b!709127 m!666295))

(assert (=> b!709127 m!666295))

(declare-fun m!666507 () Bool)

(assert (=> b!709127 m!666507))

(assert (=> bm!34425 m!666295))

(declare-fun m!666509 () Bool)

(assert (=> bm!34425 m!666509))

(assert (=> b!708910 d!97035))

(declare-fun d!97069 () Bool)

(declare-fun res!472700 () Bool)

(declare-fun e!399126 () Bool)

(assert (=> d!97069 (=> res!472700 e!399126)))

(assert (=> d!97069 (= res!472700 (= (select (arr!19334 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) k!2824))))

(assert (=> d!97069 (= (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969)) e!399126)))

(declare-fun b!709138 () Bool)

(declare-fun e!399127 () Bool)

(assert (=> b!709138 (= e!399126 e!399127)))

(declare-fun res!472701 () Bool)

(assert (=> b!709138 (=> (not res!472701) (not e!399127))))

