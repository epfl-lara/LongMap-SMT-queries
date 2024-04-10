; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104160 () Bool)

(assert start!104160)

(declare-fun b!1245172 () Bool)

(declare-fun e!705952 () Bool)

(declare-fun e!705954 () Bool)

(assert (=> b!1245172 (= e!705952 e!705954)))

(declare-fun res!830677 () Bool)

(assert (=> b!1245172 (=> res!830677 e!705954)))

(declare-datatypes ((List!27454 0))(
  ( (Nil!27451) (Cons!27450 (h!28659 (_ BitVec 64)) (t!40923 List!27454)) )
))
(declare-fun contains!7441 (List!27454 (_ BitVec 64)) Bool)

(assert (=> b!1245172 (= res!830677 (contains!7441 Nil!27451 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1245173 () Bool)

(declare-fun res!830675 () Bool)

(assert (=> b!1245173 (=> (not res!830675) (not e!705952))))

(declare-fun noDuplicate!2020 (List!27454) Bool)

(assert (=> b!1245173 (= res!830675 (noDuplicate!2020 Nil!27451))))

(declare-fun res!830674 () Bool)

(assert (=> start!104160 (=> (not res!830674) (not e!705952))))

(declare-datatypes ((array!80130 0))(
  ( (array!80131 (arr!38651 (Array (_ BitVec 32) (_ BitVec 64))) (size!39187 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80130)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104160 (= res!830674 (and (bvslt (size!39187 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39187 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39187 a!3892))))))

(assert (=> start!104160 e!705952))

(declare-fun array_inv!29499 (array!80130) Bool)

(assert (=> start!104160 (array_inv!29499 a!3892)))

(assert (=> start!104160 true))

(declare-fun b!1245174 () Bool)

(declare-fun res!830676 () Bool)

(assert (=> b!1245174 (=> (not res!830676) (not e!705952))))

(declare-fun arrayNoDuplicates!0 (array!80130 (_ BitVec 32) List!27454) Bool)

(assert (=> b!1245174 (= res!830676 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27451))))

(declare-fun b!1245175 () Bool)

(declare-fun res!830673 () Bool)

(assert (=> b!1245175 (=> (not res!830673) (not e!705952))))

(assert (=> b!1245175 (= res!830673 (and (= from!3270 newFrom!287) (bvsge newFrom!287 #b00000000000000000000000000000000)))))

(declare-fun b!1245176 () Bool)

(assert (=> b!1245176 (= e!705954 (contains!7441 Nil!27451 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!104160 res!830674) b!1245174))

(assert (= (and b!1245174 res!830676) b!1245175))

(assert (= (and b!1245175 res!830673) b!1245173))

(assert (= (and b!1245173 res!830675) b!1245172))

(assert (= (and b!1245172 (not res!830677)) b!1245176))

(declare-fun m!1147281 () Bool)

(assert (=> b!1245172 m!1147281))

(declare-fun m!1147283 () Bool)

(assert (=> b!1245173 m!1147283))

(declare-fun m!1147285 () Bool)

(assert (=> start!104160 m!1147285))

(declare-fun m!1147287 () Bool)

(assert (=> b!1245174 m!1147287))

(declare-fun m!1147289 () Bool)

(assert (=> b!1245176 m!1147289))

(push 1)

(assert (not b!1245174))

(assert (not b!1245172))

(assert (not b!1245176))

(assert (not start!104160))

(assert (not b!1245173))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!137313 () Bool)

(declare-fun lt!562871 () Bool)

(declare-fun content!617 (List!27454) (Set (_ BitVec 64)))

(assert (=> d!137313 (= lt!562871 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!617 Nil!27451)))))

(declare-fun e!705986 () Bool)

(assert (=> d!137313 (= lt!562871 e!705986)))

(declare-fun res!830718 () Bool)

(assert (=> d!137313 (=> (not res!830718) (not e!705986))))

(assert (=> d!137313 (= res!830718 (is-Cons!27450 Nil!27451))))

(assert (=> d!137313 (= (contains!7441 Nil!27451 #b1000000000000000000000000000000000000000000000000000000000000000) lt!562871)))

(declare-fun b!1245221 () Bool)

(declare-fun e!705985 () Bool)

(assert (=> b!1245221 (= e!705986 e!705985)))

(declare-fun res!830719 () Bool)

(assert (=> b!1245221 (=> res!830719 e!705985)))

(assert (=> b!1245221 (= res!830719 (= (h!28659 Nil!27451) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1245222 () Bool)

(assert (=> b!1245222 (= e!705985 (contains!7441 (t!40923 Nil!27451) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137313 res!830718) b!1245221))

(assert (= (and b!1245221 (not res!830719)) b!1245222))

(declare-fun m!1147311 () Bool)

(assert (=> d!137313 m!1147311))

(declare-fun m!1147313 () Bool)

(assert (=> d!137313 m!1147313))

(declare-fun m!1147315 () Bool)

(assert (=> b!1245222 m!1147315))

(assert (=> b!1245176 d!137313))

(declare-fun d!137315 () Bool)

(declare-fun lt!562872 () Bool)

(assert (=> d!137315 (= lt!562872 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!617 Nil!27451)))))

(declare-fun e!705988 () Bool)

(assert (=> d!137315 (= lt!562872 e!705988)))

(declare-fun res!830720 () Bool)

(assert (=> d!137315 (=> (not res!830720) (not e!705988))))

(assert (=> d!137315 (= res!830720 (is-Cons!27450 Nil!27451))))

(assert (=> d!137315 (= (contains!7441 Nil!27451 #b0000000000000000000000000000000000000000000000000000000000000000) lt!562872)))

(declare-fun b!1245223 () Bool)

(declare-fun e!705987 () Bool)

(assert (=> b!1245223 (= e!705988 e!705987)))

(declare-fun res!830721 () Bool)

(assert (=> b!1245223 (=> res!830721 e!705987)))

(assert (=> b!1245223 (= res!830721 (= (h!28659 Nil!27451) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1245224 () Bool)

(assert (=> b!1245224 (= e!705987 (contains!7441 (t!40923 Nil!27451) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137315 res!830720) b!1245223))

(assert (= (and b!1245223 (not res!830721)) b!1245224))

(assert (=> d!137315 m!1147311))

(declare-fun m!1147317 () Bool)

(assert (=> d!137315 m!1147317))

(declare-fun m!1147319 () Bool)

(assert (=> b!1245224 m!1147319))

(assert (=> b!1245172 d!137315))

(declare-fun d!137317 () Bool)

(declare-fun res!830729 () Bool)

(declare-fun e!705997 () Bool)

(assert (=> d!137317 (=> res!830729 e!705997)))

(assert (=> d!137317 (= res!830729 (is-Nil!27451 Nil!27451))))

(assert (=> d!137317 (= (noDuplicate!2020 Nil!27451) e!705997)))

(declare-fun b!1245234 () Bool)

(declare-fun e!705998 () Bool)

(assert (=> b!1245234 (= e!705997 e!705998)))

(declare-fun res!830730 () Bool)

(assert (=> b!1245234 (=> (not res!830730) (not e!705998))))

(assert (=> b!1245234 (= res!830730 (not (contains!7441 (t!40923 Nil!27451) (h!28659 Nil!27451))))))

(declare-fun b!1245235 () Bool)

(assert (=> b!1245235 (= e!705998 (noDuplicate!2020 (t!40923 Nil!27451)))))

(assert (= (and d!137317 (not res!830729)) b!1245234))

(assert (= (and b!1245234 res!830730) b!1245235))

(declare-fun m!1147325 () Bool)

(assert (=> b!1245234 m!1147325))

(declare-fun m!1147327 () Bool)

(assert (=> b!1245235 m!1147327))

(assert (=> b!1245173 d!137317))

(declare-fun b!1245268 () Bool)

(declare-fun e!706028 () Bool)

(declare-fun e!706027 () Bool)

(assert (=> b!1245268 (= e!706028 e!706027)))

(declare-fun c!121941 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1245268 (= c!121941 (validKeyInArray!0 (select (arr!38651 a!3892) from!3270)))))

(declare-fun b!1245269 () Bool)

(declare-fun e!706030 () Bool)

(assert (=> b!1245269 (= e!706030 e!706028)))

(declare-fun res!830757 () Bool)

(assert (=> b!1245269 (=> (not res!830757) (not e!706028))))

(declare-fun e!706029 () Bool)

(assert (=> b!1245269 (= res!830757 (not e!706029))))

(declare-fun res!830755 () Bool)

(assert (=> b!1245269 (=> (not res!830755) (not e!706029))))

(assert (=> b!1245269 (= res!830755 (validKeyInArray!0 (select (arr!38651 a!3892) from!3270)))))

(declare-fun b!1245270 () Bool)

(declare-fun call!61473 () Bool)

(assert (=> b!1245270 (= e!706027 call!61473)))

(declare-fun bm!61470 () Bool)

(assert (=> bm!61470 (= call!61473 (arrayNoDuplicates!0 a!3892 (bvadd from!3270 #b00000000000000000000000000000001) (ite c!121941 (Cons!27450 (select (arr!38651 a!3892) from!3270) Nil!27451) Nil!27451)))))

(declare-fun b!1245271 () Bool)

(assert (=> b!1245271 (= e!706027 call!61473)))

(declare-fun d!137321 () Bool)

(declare-fun res!830756 () Bool)

(assert (=> d!137321 (=> res!830756 e!706030)))

(assert (=> d!137321 (= res!830756 (bvsge from!3270 (size!39187 a!3892)))))

(assert (=> d!137321 (= (arrayNoDuplicates!0 a!3892 from!3270 Nil!27451) e!706030)))

(declare-fun b!1245272 () Bool)

(assert (=> b!1245272 (= e!706029 (contains!7441 Nil!27451 (select (arr!38651 a!3892) from!3270)))))

(assert (= (and d!137321 (not res!830756)) b!1245269))

(assert (= (and b!1245269 res!830755) b!1245272))

(assert (= (and b!1245269 res!830757) b!1245268))

(assert (= (and b!1245268 c!121941) b!1245270))

(assert (= (and b!1245268 (not c!121941)) b!1245271))

(assert (= (or b!1245270 b!1245271) bm!61470))

(declare-fun m!1147343 () Bool)

(assert (=> b!1245268 m!1147343))

(assert (=> b!1245268 m!1147343))

(declare-fun m!1147345 () Bool)

(assert (=> b!1245268 m!1147345))

(assert (=> b!1245269 m!1147343))

(assert (=> b!1245269 m!1147343))

(assert (=> b!1245269 m!1147345))

(assert (=> bm!61470 m!1147343))

(declare-fun m!1147347 () Bool)

(assert (=> bm!61470 m!1147347))

(assert (=> b!1245272 m!1147343))

(assert (=> b!1245272 m!1147343))

(declare-fun m!1147349 () Bool)

(assert (=> b!1245272 m!1147349))

(assert (=> b!1245174 d!137321))

(declare-fun d!137331 () Bool)

(assert (=> d!137331 (= (array_inv!29499 a!3892) (bvsge (size!39187 a!3892) #b00000000000000000000000000000000))))

(assert (=> start!104160 d!137331))

(push 1)

