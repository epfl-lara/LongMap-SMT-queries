; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60702 () Bool)

(assert start!60702)

(declare-fun b!681285 () Bool)

(declare-fun e!388139 () Bool)

(declare-fun e!388141 () Bool)

(assert (=> b!681285 (= e!388139 e!388141)))

(declare-fun res!447369 () Bool)

(assert (=> b!681285 (=> res!447369 e!388141)))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!681285 (= res!447369 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-datatypes ((List!12885 0))(
  ( (Nil!12882) (Cons!12881 (h!13929 (_ BitVec 64)) (t!19111 List!12885)) )
))
(declare-fun lt!313309 () List!12885)

(declare-datatypes ((array!39507 0))(
  ( (array!39508 (arr!18937 (Array (_ BitVec 32) (_ BitVec 64))) (size!19301 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39507)

(declare-fun acc!681 () List!12885)

(declare-fun $colon$colon!308 (List!12885 (_ BitVec 64)) List!12885)

(assert (=> b!681285 (= lt!313309 ($colon$colon!308 acc!681 (select (arr!18937 a!3626) from!3004)))))

(declare-fun subseq!146 (List!12885 List!12885) Bool)

(assert (=> b!681285 (subseq!146 acc!681 acc!681)))

(declare-datatypes ((Unit!23865 0))(
  ( (Unit!23866) )
))
(declare-fun lt!313310 () Unit!23865)

(declare-fun lemmaListSubSeqRefl!0 (List!12885) Unit!23865)

(assert (=> b!681285 (= lt!313310 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!681286 () Bool)

(declare-fun res!447363 () Bool)

(declare-fun e!388146 () Bool)

(assert (=> b!681286 (=> (not res!447363) (not e!388146))))

(declare-fun noDuplicate!811 (List!12885) Bool)

(assert (=> b!681286 (= res!447363 (noDuplicate!811 acc!681))))

(declare-fun b!681287 () Bool)

(declare-fun res!447356 () Bool)

(assert (=> b!681287 (=> (not res!447356) (not e!388146))))

(declare-fun contains!3537 (List!12885 (_ BitVec 64)) Bool)

(assert (=> b!681287 (= res!447356 (not (contains!3537 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!681288 () Bool)

(declare-fun e!388144 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(assert (=> b!681288 (= e!388144 (not (contains!3537 acc!681 k0!2843)))))

(declare-fun b!681289 () Bool)

(declare-fun e!388143 () Bool)

(assert (=> b!681289 (= e!388143 (contains!3537 acc!681 k0!2843))))

(declare-fun b!681290 () Bool)

(declare-fun res!447361 () Bool)

(assert (=> b!681290 (=> (not res!447361) (not e!388146))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!681290 (= res!447361 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19301 a!3626))))))

(declare-fun b!681291 () Bool)

(declare-fun res!447368 () Bool)

(assert (=> b!681291 (=> (not res!447368) (not e!388146))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!681291 (= res!447368 (validKeyInArray!0 k0!2843))))

(declare-fun b!681292 () Bool)

(declare-fun res!447367 () Bool)

(assert (=> b!681292 (=> (not res!447367) (not e!388146))))

(declare-fun arrayNoDuplicates!0 (array!39507 (_ BitVec 32) List!12885) Bool)

(assert (=> b!681292 (= res!447367 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!681293 () Bool)

(declare-fun res!447373 () Bool)

(assert (=> b!681293 (=> res!447373 e!388141)))

(assert (=> b!681293 (= res!447373 (not (noDuplicate!811 lt!313309)))))

(declare-fun b!681294 () Bool)

(declare-fun res!447370 () Bool)

(assert (=> b!681294 (=> res!447370 e!388141)))

(assert (=> b!681294 (= res!447370 (contains!3537 lt!313309 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!681295 () Bool)

(declare-fun e!388145 () Unit!23865)

(declare-fun Unit!23867 () Unit!23865)

(assert (=> b!681295 (= e!388145 Unit!23867)))

(declare-fun b!681296 () Bool)

(declare-fun res!447371 () Bool)

(assert (=> b!681296 (=> (not res!447371) (not e!388146))))

(assert (=> b!681296 (= res!447371 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12882))))

(declare-fun res!447359 () Bool)

(assert (=> start!60702 (=> (not res!447359) (not e!388146))))

(assert (=> start!60702 (= res!447359 (and (bvslt (size!19301 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19301 a!3626))))))

(assert (=> start!60702 e!388146))

(assert (=> start!60702 true))

(declare-fun array_inv!14796 (array!39507) Bool)

(assert (=> start!60702 (array_inv!14796 a!3626)))

(declare-fun b!681297 () Bool)

(assert (=> b!681297 (= e!388146 (not e!388139))))

(declare-fun res!447362 () Bool)

(assert (=> b!681297 (=> res!447362 e!388139)))

(assert (=> b!681297 (= res!447362 (not (validKeyInArray!0 (select (arr!18937 a!3626) from!3004))))))

(declare-fun lt!313312 () Unit!23865)

(assert (=> b!681297 (= lt!313312 e!388145)))

(declare-fun c!77333 () Bool)

(declare-fun arrayContainsKey!0 (array!39507 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!681297 (= c!77333 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!681297 (arrayContainsKey!0 (array!39508 (store (arr!18937 a!3626) i!1382 k0!2843) (size!19301 a!3626)) k0!2843 from!3004)))

(declare-fun b!681298 () Bool)

(declare-fun res!447360 () Bool)

(assert (=> b!681298 (=> (not res!447360) (not e!388146))))

(assert (=> b!681298 (= res!447360 (not (contains!3537 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!681299 () Bool)

(declare-fun res!447358 () Bool)

(assert (=> b!681299 (=> (not res!447358) (not e!388146))))

(assert (=> b!681299 (= res!447358 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!681300 () Bool)

(assert (=> b!681300 (= e!388141 true)))

(declare-fun lt!313311 () Bool)

(assert (=> b!681300 (= lt!313311 (contains!3537 lt!313309 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!681301 () Bool)

(declare-fun res!447372 () Bool)

(assert (=> b!681301 (=> (not res!447372) (not e!388146))))

(declare-fun e!388142 () Bool)

(assert (=> b!681301 (= res!447372 e!388142)))

(declare-fun res!447357 () Bool)

(assert (=> b!681301 (=> res!447357 e!388142)))

(assert (=> b!681301 (= res!447357 e!388143)))

(declare-fun res!447366 () Bool)

(assert (=> b!681301 (=> (not res!447366) (not e!388143))))

(assert (=> b!681301 (= res!447366 (bvsgt from!3004 i!1382))))

(declare-fun b!681302 () Bool)

(declare-fun res!447365 () Bool)

(assert (=> b!681302 (=> (not res!447365) (not e!388146))))

(assert (=> b!681302 (= res!447365 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19301 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!681303 () Bool)

(declare-fun Unit!23868 () Unit!23865)

(assert (=> b!681303 (= e!388145 Unit!23868)))

(declare-fun lt!313308 () Unit!23865)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39507 (_ BitVec 64) (_ BitVec 32)) Unit!23865)

(assert (=> b!681303 (= lt!313308 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!681303 false))

(declare-fun b!681304 () Bool)

(assert (=> b!681304 (= e!388142 e!388144)))

(declare-fun res!447364 () Bool)

(assert (=> b!681304 (=> (not res!447364) (not e!388144))))

(assert (=> b!681304 (= res!447364 (bvsle from!3004 i!1382))))

(assert (= (and start!60702 res!447359) b!681286))

(assert (= (and b!681286 res!447363) b!681287))

(assert (= (and b!681287 res!447356) b!681298))

(assert (= (and b!681298 res!447360) b!681301))

(assert (= (and b!681301 res!447366) b!681289))

(assert (= (and b!681301 (not res!447357)) b!681304))

(assert (= (and b!681304 res!447364) b!681288))

(assert (= (and b!681301 res!447372) b!681296))

(assert (= (and b!681296 res!447371) b!681292))

(assert (= (and b!681292 res!447367) b!681290))

(assert (= (and b!681290 res!447361) b!681291))

(assert (= (and b!681291 res!447368) b!681299))

(assert (= (and b!681299 res!447358) b!681302))

(assert (= (and b!681302 res!447365) b!681297))

(assert (= (and b!681297 c!77333) b!681303))

(assert (= (and b!681297 (not c!77333)) b!681295))

(assert (= (and b!681297 (not res!447362)) b!681285))

(assert (= (and b!681285 (not res!447369)) b!681293))

(assert (= (and b!681293 (not res!447373)) b!681294))

(assert (= (and b!681294 (not res!447370)) b!681300))

(declare-fun m!646705 () Bool)

(assert (=> b!681285 m!646705))

(assert (=> b!681285 m!646705))

(declare-fun m!646707 () Bool)

(assert (=> b!681285 m!646707))

(declare-fun m!646709 () Bool)

(assert (=> b!681285 m!646709))

(declare-fun m!646711 () Bool)

(assert (=> b!681285 m!646711))

(declare-fun m!646713 () Bool)

(assert (=> start!60702 m!646713))

(declare-fun m!646715 () Bool)

(assert (=> b!681286 m!646715))

(declare-fun m!646717 () Bool)

(assert (=> b!681298 m!646717))

(assert (=> b!681297 m!646705))

(declare-fun m!646719 () Bool)

(assert (=> b!681297 m!646719))

(declare-fun m!646721 () Bool)

(assert (=> b!681297 m!646721))

(assert (=> b!681297 m!646705))

(declare-fun m!646723 () Bool)

(assert (=> b!681297 m!646723))

(declare-fun m!646725 () Bool)

(assert (=> b!681297 m!646725))

(declare-fun m!646727 () Bool)

(assert (=> b!681300 m!646727))

(declare-fun m!646729 () Bool)

(assert (=> b!681299 m!646729))

(declare-fun m!646731 () Bool)

(assert (=> b!681294 m!646731))

(declare-fun m!646733 () Bool)

(assert (=> b!681288 m!646733))

(assert (=> b!681289 m!646733))

(declare-fun m!646735 () Bool)

(assert (=> b!681287 m!646735))

(declare-fun m!646737 () Bool)

(assert (=> b!681291 m!646737))

(declare-fun m!646739 () Bool)

(assert (=> b!681303 m!646739))

(declare-fun m!646741 () Bool)

(assert (=> b!681293 m!646741))

(declare-fun m!646743 () Bool)

(assert (=> b!681296 m!646743))

(declare-fun m!646745 () Bool)

(assert (=> b!681292 m!646745))

(check-sat (not b!681293) (not b!681297) (not b!681303) (not b!681294) (not b!681285) (not b!681296) (not b!681288) (not b!681291) (not b!681300) (not b!681289) (not b!681286) (not b!681299) (not start!60702) (not b!681287) (not b!681292) (not b!681298))
(check-sat)
