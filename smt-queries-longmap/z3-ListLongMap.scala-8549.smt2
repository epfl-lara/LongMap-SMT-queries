; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104576 () Bool)

(assert start!104576)

(declare-fun b!1247251 () Bool)

(declare-fun res!831871 () Bool)

(declare-fun e!707425 () Bool)

(assert (=> b!1247251 (=> (not res!831871) (not e!707425))))

(declare-datatypes ((List!27512 0))(
  ( (Nil!27509) (Cons!27508 (h!28726 (_ BitVec 64)) (t!40973 List!27512)) )
))
(declare-fun contains!7486 (List!27512 (_ BitVec 64)) Bool)

(assert (=> b!1247251 (= res!831871 (not (contains!7486 Nil!27509 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1247252 () Bool)

(declare-fun res!831875 () Bool)

(assert (=> b!1247252 (=> (not res!831875) (not e!707425))))

(declare-fun lt!563482 () List!27512)

(assert (=> b!1247252 (= res!831875 (not (contains!7486 lt!563482 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!831872 () Bool)

(declare-fun e!707424 () Bool)

(assert (=> start!104576 (=> (not res!831872) (not e!707424))))

(declare-datatypes ((array!80242 0))(
  ( (array!80243 (arr!38696 (Array (_ BitVec 32) (_ BitVec 64))) (size!39233 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80242)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104576 (= res!831872 (and (bvslt (size!39233 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39233 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39233 a!3892))))))

(assert (=> start!104576 e!707424))

(declare-fun array_inv!29634 (array!80242) Bool)

(assert (=> start!104576 (array_inv!29634 a!3892)))

(assert (=> start!104576 true))

(declare-fun b!1247253 () Bool)

(declare-fun res!831874 () Bool)

(assert (=> b!1247253 (=> (not res!831874) (not e!707424))))

(declare-fun arrayNoDuplicates!0 (array!80242 (_ BitVec 32) List!27512) Bool)

(assert (=> b!1247253 (= res!831874 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27509))))

(declare-fun b!1247254 () Bool)

(declare-fun res!831869 () Bool)

(assert (=> b!1247254 (=> (not res!831869) (not e!707424))))

(assert (=> b!1247254 (= res!831869 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39233 a!3892)) (not (= newFrom!287 (size!39233 a!3892)))))))

(declare-fun b!1247255 () Bool)

(assert (=> b!1247255 (= e!707424 e!707425)))

(declare-fun res!831878 () Bool)

(assert (=> b!1247255 (=> (not res!831878) (not e!707425))))

(assert (=> b!1247255 (= res!831878 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000))))

(assert (=> b!1247255 (= lt!563482 (Cons!27508 (select (arr!38696 a!3892) from!3270) Nil!27509))))

(declare-fun b!1247256 () Bool)

(declare-fun res!831876 () Bool)

(assert (=> b!1247256 (=> (not res!831876) (not e!707424))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1247256 (= res!831876 (validKeyInArray!0 (select (arr!38696 a!3892) from!3270)))))

(declare-fun b!1247257 () Bool)

(declare-fun subseq!653 (List!27512 List!27512) Bool)

(assert (=> b!1247257 (= e!707425 (not (subseq!653 Nil!27509 lt!563482)))))

(declare-fun b!1247258 () Bool)

(declare-fun res!831873 () Bool)

(assert (=> b!1247258 (=> (not res!831873) (not e!707425))))

(assert (=> b!1247258 (= res!831873 (not (contains!7486 lt!563482 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1247259 () Bool)

(declare-fun res!831870 () Bool)

(assert (=> b!1247259 (=> (not res!831870) (not e!707425))))

(assert (=> b!1247259 (= res!831870 (not (contains!7486 Nil!27509 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1247260 () Bool)

(declare-fun res!831877 () Bool)

(assert (=> b!1247260 (=> (not res!831877) (not e!707425))))

(declare-fun noDuplicate!2050 (List!27512) Bool)

(assert (=> b!1247260 (= res!831877 (noDuplicate!2050 lt!563482))))

(assert (= (and start!104576 res!831872) b!1247253))

(assert (= (and b!1247253 res!831874) b!1247254))

(assert (= (and b!1247254 res!831869) b!1247256))

(assert (= (and b!1247256 res!831876) b!1247255))

(assert (= (and b!1247255 res!831878) b!1247260))

(assert (= (and b!1247260 res!831877) b!1247258))

(assert (= (and b!1247258 res!831873) b!1247252))

(assert (= (and b!1247252 res!831875) b!1247259))

(assert (= (and b!1247259 res!831870) b!1247251))

(assert (= (and b!1247251 res!831871) b!1247257))

(declare-fun m!1149525 () Bool)

(assert (=> b!1247258 m!1149525))

(declare-fun m!1149527 () Bool)

(assert (=> b!1247252 m!1149527))

(declare-fun m!1149529 () Bool)

(assert (=> b!1247253 m!1149529))

(declare-fun m!1149531 () Bool)

(assert (=> b!1247251 m!1149531))

(declare-fun m!1149533 () Bool)

(assert (=> b!1247260 m!1149533))

(declare-fun m!1149535 () Bool)

(assert (=> b!1247259 m!1149535))

(declare-fun m!1149537 () Bool)

(assert (=> b!1247257 m!1149537))

(declare-fun m!1149539 () Bool)

(assert (=> b!1247255 m!1149539))

(assert (=> b!1247256 m!1149539))

(assert (=> b!1247256 m!1149539))

(declare-fun m!1149541 () Bool)

(assert (=> b!1247256 m!1149541))

(declare-fun m!1149543 () Bool)

(assert (=> start!104576 m!1149543))

(check-sat (not start!104576) (not b!1247252) (not b!1247251) (not b!1247258) (not b!1247259) (not b!1247256) (not b!1247260) (not b!1247253) (not b!1247257))
(check-sat)
(get-model)

(declare-fun d!137981 () Bool)

(assert (=> d!137981 (= (validKeyInArray!0 (select (arr!38696 a!3892) from!3270)) (and (not (= (select (arr!38696 a!3892) from!3270) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38696 a!3892) from!3270) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1247256 d!137981))

(declare-fun d!137983 () Bool)

(declare-fun lt!563491 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!627 (List!27512) (InoxSet (_ BitVec 64)))

(assert (=> d!137983 (= lt!563491 (select (content!627 Nil!27509) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!707449 () Bool)

(assert (=> d!137983 (= lt!563491 e!707449)))

(declare-fun res!831944 () Bool)

(assert (=> d!137983 (=> (not res!831944) (not e!707449))))

(get-info :version)

(assert (=> d!137983 (= res!831944 ((_ is Cons!27508) Nil!27509))))

(assert (=> d!137983 (= (contains!7486 Nil!27509 #b0000000000000000000000000000000000000000000000000000000000000000) lt!563491)))

(declare-fun b!1247325 () Bool)

(declare-fun e!707450 () Bool)

(assert (=> b!1247325 (= e!707449 e!707450)))

(declare-fun res!831943 () Bool)

(assert (=> b!1247325 (=> res!831943 e!707450)))

(assert (=> b!1247325 (= res!831943 (= (h!28726 Nil!27509) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1247326 () Bool)

(assert (=> b!1247326 (= e!707450 (contains!7486 (t!40973 Nil!27509) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137983 res!831944) b!1247325))

(assert (= (and b!1247325 (not res!831943)) b!1247326))

(declare-fun m!1149585 () Bool)

(assert (=> d!137983 m!1149585))

(declare-fun m!1149587 () Bool)

(assert (=> d!137983 m!1149587))

(declare-fun m!1149589 () Bool)

(assert (=> b!1247326 m!1149589))

(assert (=> b!1247259 d!137983))

(declare-fun d!137985 () Bool)

(declare-fun res!831949 () Bool)

(declare-fun e!707455 () Bool)

(assert (=> d!137985 (=> res!831949 e!707455)))

(assert (=> d!137985 (= res!831949 ((_ is Nil!27509) lt!563482))))

(assert (=> d!137985 (= (noDuplicate!2050 lt!563482) e!707455)))

(declare-fun b!1247331 () Bool)

(declare-fun e!707456 () Bool)

(assert (=> b!1247331 (= e!707455 e!707456)))

(declare-fun res!831950 () Bool)

(assert (=> b!1247331 (=> (not res!831950) (not e!707456))))

(assert (=> b!1247331 (= res!831950 (not (contains!7486 (t!40973 lt!563482) (h!28726 lt!563482))))))

(declare-fun b!1247332 () Bool)

(assert (=> b!1247332 (= e!707456 (noDuplicate!2050 (t!40973 lt!563482)))))

(assert (= (and d!137985 (not res!831949)) b!1247331))

(assert (= (and b!1247331 res!831950) b!1247332))

(declare-fun m!1149591 () Bool)

(assert (=> b!1247331 m!1149591))

(declare-fun m!1149593 () Bool)

(assert (=> b!1247332 m!1149593))

(assert (=> b!1247260 d!137985))

(declare-fun d!137987 () Bool)

(declare-fun lt!563492 () Bool)

(assert (=> d!137987 (= lt!563492 (select (content!627 lt!563482) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!707457 () Bool)

(assert (=> d!137987 (= lt!563492 e!707457)))

(declare-fun res!831952 () Bool)

(assert (=> d!137987 (=> (not res!831952) (not e!707457))))

(assert (=> d!137987 (= res!831952 ((_ is Cons!27508) lt!563482))))

(assert (=> d!137987 (= (contains!7486 lt!563482 #b0000000000000000000000000000000000000000000000000000000000000000) lt!563492)))

(declare-fun b!1247333 () Bool)

(declare-fun e!707458 () Bool)

(assert (=> b!1247333 (= e!707457 e!707458)))

(declare-fun res!831951 () Bool)

(assert (=> b!1247333 (=> res!831951 e!707458)))

(assert (=> b!1247333 (= res!831951 (= (h!28726 lt!563482) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1247334 () Bool)

(assert (=> b!1247334 (= e!707458 (contains!7486 (t!40973 lt!563482) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137987 res!831952) b!1247333))

(assert (= (and b!1247333 (not res!831951)) b!1247334))

(declare-fun m!1149595 () Bool)

(assert (=> d!137987 m!1149595))

(declare-fun m!1149597 () Bool)

(assert (=> d!137987 m!1149597))

(declare-fun m!1149599 () Bool)

(assert (=> b!1247334 m!1149599))

(assert (=> b!1247258 d!137987))

(declare-fun b!1247345 () Bool)

(declare-fun e!707470 () Bool)

(assert (=> b!1247345 (= e!707470 (contains!7486 Nil!27509 (select (arr!38696 a!3892) from!3270)))))

(declare-fun b!1247346 () Bool)

(declare-fun e!707467 () Bool)

(declare-fun call!61576 () Bool)

(assert (=> b!1247346 (= e!707467 call!61576)))

(declare-fun b!1247347 () Bool)

(declare-fun e!707469 () Bool)

(declare-fun e!707468 () Bool)

(assert (=> b!1247347 (= e!707469 e!707468)))

(declare-fun res!831960 () Bool)

(assert (=> b!1247347 (=> (not res!831960) (not e!707468))))

(assert (=> b!1247347 (= res!831960 (not e!707470))))

(declare-fun res!831961 () Bool)

(assert (=> b!1247347 (=> (not res!831961) (not e!707470))))

(assert (=> b!1247347 (= res!831961 (validKeyInArray!0 (select (arr!38696 a!3892) from!3270)))))

(declare-fun bm!61573 () Bool)

(declare-fun c!122385 () Bool)

(assert (=> bm!61573 (= call!61576 (arrayNoDuplicates!0 a!3892 (bvadd from!3270 #b00000000000000000000000000000001) (ite c!122385 (Cons!27508 (select (arr!38696 a!3892) from!3270) Nil!27509) Nil!27509)))))

(declare-fun d!137989 () Bool)

(declare-fun res!831959 () Bool)

(assert (=> d!137989 (=> res!831959 e!707469)))

(assert (=> d!137989 (= res!831959 (bvsge from!3270 (size!39233 a!3892)))))

(assert (=> d!137989 (= (arrayNoDuplicates!0 a!3892 from!3270 Nil!27509) e!707469)))

(declare-fun b!1247348 () Bool)

(assert (=> b!1247348 (= e!707467 call!61576)))

(declare-fun b!1247349 () Bool)

(assert (=> b!1247349 (= e!707468 e!707467)))

(assert (=> b!1247349 (= c!122385 (validKeyInArray!0 (select (arr!38696 a!3892) from!3270)))))

(assert (= (and d!137989 (not res!831959)) b!1247347))

(assert (= (and b!1247347 res!831961) b!1247345))

(assert (= (and b!1247347 res!831960) b!1247349))

(assert (= (and b!1247349 c!122385) b!1247348))

(assert (= (and b!1247349 (not c!122385)) b!1247346))

(assert (= (or b!1247348 b!1247346) bm!61573))

(assert (=> b!1247345 m!1149539))

(assert (=> b!1247345 m!1149539))

(declare-fun m!1149601 () Bool)

(assert (=> b!1247345 m!1149601))

(assert (=> b!1247347 m!1149539))

(assert (=> b!1247347 m!1149539))

(assert (=> b!1247347 m!1149541))

(assert (=> bm!61573 m!1149539))

(declare-fun m!1149603 () Bool)

(assert (=> bm!61573 m!1149603))

(assert (=> b!1247349 m!1149539))

(assert (=> b!1247349 m!1149539))

(assert (=> b!1247349 m!1149541))

(assert (=> b!1247253 d!137989))

(declare-fun d!137991 () Bool)

(declare-fun lt!563493 () Bool)

(assert (=> d!137991 (= lt!563493 (select (content!627 Nil!27509) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!707471 () Bool)

(assert (=> d!137991 (= lt!563493 e!707471)))

(declare-fun res!831963 () Bool)

(assert (=> d!137991 (=> (not res!831963) (not e!707471))))

(assert (=> d!137991 (= res!831963 ((_ is Cons!27508) Nil!27509))))

(assert (=> d!137991 (= (contains!7486 Nil!27509 #b1000000000000000000000000000000000000000000000000000000000000000) lt!563493)))

(declare-fun b!1247350 () Bool)

(declare-fun e!707472 () Bool)

(assert (=> b!1247350 (= e!707471 e!707472)))

(declare-fun res!831962 () Bool)

(assert (=> b!1247350 (=> res!831962 e!707472)))

(assert (=> b!1247350 (= res!831962 (= (h!28726 Nil!27509) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1247351 () Bool)

(assert (=> b!1247351 (= e!707472 (contains!7486 (t!40973 Nil!27509) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137991 res!831963) b!1247350))

(assert (= (and b!1247350 (not res!831962)) b!1247351))

(assert (=> d!137991 m!1149585))

(declare-fun m!1149605 () Bool)

(assert (=> d!137991 m!1149605))

(declare-fun m!1149607 () Bool)

(assert (=> b!1247351 m!1149607))

(assert (=> b!1247251 d!137991))

(declare-fun d!137993 () Bool)

(assert (=> d!137993 (= (array_inv!29634 a!3892) (bvsge (size!39233 a!3892) #b00000000000000000000000000000000))))

(assert (=> start!104576 d!137993))

(declare-fun d!137995 () Bool)

(declare-fun lt!563494 () Bool)

(assert (=> d!137995 (= lt!563494 (select (content!627 lt!563482) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!707473 () Bool)

(assert (=> d!137995 (= lt!563494 e!707473)))

(declare-fun res!831965 () Bool)

(assert (=> d!137995 (=> (not res!831965) (not e!707473))))

(assert (=> d!137995 (= res!831965 ((_ is Cons!27508) lt!563482))))

(assert (=> d!137995 (= (contains!7486 lt!563482 #b1000000000000000000000000000000000000000000000000000000000000000) lt!563494)))

(declare-fun b!1247352 () Bool)

(declare-fun e!707474 () Bool)

(assert (=> b!1247352 (= e!707473 e!707474)))

(declare-fun res!831964 () Bool)

(assert (=> b!1247352 (=> res!831964 e!707474)))

(assert (=> b!1247352 (= res!831964 (= (h!28726 lt!563482) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1247353 () Bool)

(assert (=> b!1247353 (= e!707474 (contains!7486 (t!40973 lt!563482) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137995 res!831965) b!1247352))

(assert (= (and b!1247352 (not res!831964)) b!1247353))

(assert (=> d!137995 m!1149595))

(declare-fun m!1149609 () Bool)

(assert (=> d!137995 m!1149609))

(declare-fun m!1149611 () Bool)

(assert (=> b!1247353 m!1149611))

(assert (=> b!1247252 d!137995))

(declare-fun d!137997 () Bool)

(declare-fun res!831975 () Bool)

(declare-fun e!707484 () Bool)

(assert (=> d!137997 (=> res!831975 e!707484)))

(assert (=> d!137997 (= res!831975 ((_ is Nil!27509) Nil!27509))))

(assert (=> d!137997 (= (subseq!653 Nil!27509 lt!563482) e!707484)))

(declare-fun b!1247362 () Bool)

(declare-fun e!707485 () Bool)

(assert (=> b!1247362 (= e!707484 e!707485)))

(declare-fun res!831976 () Bool)

(assert (=> b!1247362 (=> (not res!831976) (not e!707485))))

(assert (=> b!1247362 (= res!831976 ((_ is Cons!27508) lt!563482))))

(declare-fun b!1247364 () Bool)

(declare-fun e!707483 () Bool)

(assert (=> b!1247364 (= e!707483 (subseq!653 (t!40973 Nil!27509) (t!40973 lt!563482)))))

(declare-fun b!1247365 () Bool)

(declare-fun e!707486 () Bool)

(assert (=> b!1247365 (= e!707486 (subseq!653 Nil!27509 (t!40973 lt!563482)))))

(declare-fun b!1247363 () Bool)

(assert (=> b!1247363 (= e!707485 e!707486)))

(declare-fun res!831977 () Bool)

(assert (=> b!1247363 (=> res!831977 e!707486)))

(assert (=> b!1247363 (= res!831977 e!707483)))

(declare-fun res!831974 () Bool)

(assert (=> b!1247363 (=> (not res!831974) (not e!707483))))

(assert (=> b!1247363 (= res!831974 (= (h!28726 Nil!27509) (h!28726 lt!563482)))))

(assert (= (and d!137997 (not res!831975)) b!1247362))

(assert (= (and b!1247362 res!831976) b!1247363))

(assert (= (and b!1247363 res!831974) b!1247364))

(assert (= (and b!1247363 (not res!831977)) b!1247365))

(declare-fun m!1149613 () Bool)

(assert (=> b!1247364 m!1149613))

(declare-fun m!1149615 () Bool)

(assert (=> b!1247365 m!1149615))

(assert (=> b!1247257 d!137997))

(check-sat (not b!1247332) (not bm!61573) (not b!1247331) (not d!137983) (not b!1247347) (not b!1247353) (not d!137995) (not b!1247364) (not b!1247326) (not b!1247334) (not b!1247345) (not b!1247349) (not b!1247365) (not d!137991) (not d!137987) (not b!1247351))
(check-sat)
