; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59928 () Bool)

(assert start!59928)

(declare-fun b!662398 () Bool)

(declare-fun res!430323 () Bool)

(declare-fun e!380350 () Bool)

(assert (=> b!662398 (=> res!430323 e!380350)))

(declare-datatypes ((List!12594 0))(
  ( (Nil!12591) (Cons!12590 (h!13638 (_ BitVec 64)) (t!18814 List!12594)) )
))
(declare-fun acc!681 () List!12594)

(declare-fun lt!309041 () List!12594)

(declare-fun subseq!8 (List!12594 List!12594) Bool)

(assert (=> b!662398 (= res!430323 (not (subseq!8 acc!681 lt!309041)))))

(declare-fun b!662399 () Bool)

(declare-fun res!430324 () Bool)

(declare-fun e!380351 () Bool)

(assert (=> b!662399 (=> (not res!430324) (not e!380351))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!38913 0))(
  ( (array!38914 (arr!18646 (Array (_ BitVec 32) (_ BitVec 64))) (size!19010 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38913)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!662399 (= res!430324 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19010 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!662400 () Bool)

(declare-fun res!430329 () Bool)

(assert (=> b!662400 (=> res!430329 e!380350)))

(declare-fun contains!3246 (List!12594 (_ BitVec 64)) Bool)

(assert (=> b!662400 (= res!430329 (contains!3246 lt!309041 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!662401 () Bool)

(declare-fun e!380352 () Bool)

(assert (=> b!662401 (= e!380352 e!380350)))

(declare-fun res!430314 () Bool)

(assert (=> b!662401 (=> res!430314 e!380350)))

(assert (=> b!662401 (= res!430314 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!137 (List!12594 (_ BitVec 64)) List!12594)

(assert (=> b!662401 (= lt!309041 ($colon$colon!137 acc!681 (select (arr!18646 a!3626) from!3004)))))

(assert (=> b!662401 (subseq!8 acc!681 acc!681)))

(declare-datatypes ((Unit!22977 0))(
  ( (Unit!22978) )
))
(declare-fun lt!309043 () Unit!22977)

(declare-fun lemmaListSubSeqRefl!0 (List!12594) Unit!22977)

(assert (=> b!662401 (= lt!309043 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!662402 () Bool)

(declare-fun res!430328 () Bool)

(assert (=> b!662402 (=> (not res!430328) (not e!380351))))

(declare-fun arrayNoDuplicates!0 (array!38913 (_ BitVec 32) List!12594) Bool)

(assert (=> b!662402 (= res!430328 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!662403 () Bool)

(declare-fun e!380353 () Unit!22977)

(declare-fun Unit!22979 () Unit!22977)

(assert (=> b!662403 (= e!380353 Unit!22979)))

(declare-fun b!662404 () Bool)

(declare-fun res!430316 () Bool)

(assert (=> b!662404 (=> (not res!430316) (not e!380351))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!662404 (= res!430316 (validKeyInArray!0 k0!2843))))

(declare-fun b!662405 () Bool)

(declare-fun res!430326 () Bool)

(assert (=> b!662405 (=> (not res!430326) (not e!380351))))

(declare-fun noDuplicate!520 (List!12594) Bool)

(assert (=> b!662405 (= res!430326 (noDuplicate!520 acc!681))))

(declare-fun b!662406 () Bool)

(assert (=> b!662406 (= e!380351 (not e!380352))))

(declare-fun res!430313 () Bool)

(assert (=> b!662406 (=> res!430313 e!380352)))

(assert (=> b!662406 (= res!430313 (not (validKeyInArray!0 (select (arr!18646 a!3626) from!3004))))))

(declare-fun lt!309044 () Unit!22977)

(assert (=> b!662406 (= lt!309044 e!380353)))

(declare-fun c!76412 () Bool)

(declare-fun arrayContainsKey!0 (array!38913 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!662406 (= c!76412 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!662406 (arrayContainsKey!0 (array!38914 (store (arr!18646 a!3626) i!1382 k0!2843) (size!19010 a!3626)) k0!2843 from!3004)))

(declare-fun b!662407 () Bool)

(declare-fun res!430311 () Bool)

(assert (=> b!662407 (=> res!430311 e!380350)))

(assert (=> b!662407 (= res!430311 (not (noDuplicate!520 lt!309041)))))

(declare-fun b!662408 () Bool)

(declare-fun Unit!22980 () Unit!22977)

(assert (=> b!662408 (= e!380353 Unit!22980)))

(declare-fun lt!309045 () Unit!22977)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38913 (_ BitVec 64) (_ BitVec 32)) Unit!22977)

(assert (=> b!662408 (= lt!309045 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!662408 false))

(declare-fun res!430327 () Bool)

(assert (=> start!59928 (=> (not res!430327) (not e!380351))))

(assert (=> start!59928 (= res!430327 (and (bvslt (size!19010 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19010 a!3626))))))

(assert (=> start!59928 e!380351))

(assert (=> start!59928 true))

(declare-fun array_inv!14505 (array!38913) Bool)

(assert (=> start!59928 (array_inv!14505 a!3626)))

(declare-fun b!662409 () Bool)

(declare-fun res!430325 () Bool)

(assert (=> b!662409 (=> (not res!430325) (not e!380351))))

(declare-fun e!380348 () Bool)

(assert (=> b!662409 (= res!430325 e!380348)))

(declare-fun res!430330 () Bool)

(assert (=> b!662409 (=> res!430330 e!380348)))

(declare-fun e!380349 () Bool)

(assert (=> b!662409 (= res!430330 e!380349)))

(declare-fun res!430319 () Bool)

(assert (=> b!662409 (=> (not res!430319) (not e!380349))))

(assert (=> b!662409 (= res!430319 (bvsgt from!3004 i!1382))))

(declare-fun b!662410 () Bool)

(declare-fun res!430317 () Bool)

(assert (=> b!662410 (=> (not res!430317) (not e!380351))))

(assert (=> b!662410 (= res!430317 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19010 a!3626))))))

(declare-fun b!662411 () Bool)

(declare-fun e!380354 () Bool)

(assert (=> b!662411 (= e!380348 e!380354)))

(declare-fun res!430322 () Bool)

(assert (=> b!662411 (=> (not res!430322) (not e!380354))))

(assert (=> b!662411 (= res!430322 (bvsle from!3004 i!1382))))

(declare-fun b!662412 () Bool)

(declare-fun res!430320 () Bool)

(assert (=> b!662412 (=> (not res!430320) (not e!380351))))

(assert (=> b!662412 (= res!430320 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!662413 () Bool)

(assert (=> b!662413 (= e!380349 (contains!3246 acc!681 k0!2843))))

(declare-fun b!662414 () Bool)

(declare-fun res!430312 () Bool)

(assert (=> b!662414 (=> (not res!430312) (not e!380351))))

(assert (=> b!662414 (= res!430312 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12591))))

(declare-fun b!662415 () Bool)

(declare-fun res!430318 () Bool)

(assert (=> b!662415 (=> (not res!430318) (not e!380351))))

(assert (=> b!662415 (= res!430318 (not (contains!3246 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!662416 () Bool)

(declare-fun res!430315 () Bool)

(assert (=> b!662416 (=> res!430315 e!380350)))

(assert (=> b!662416 (= res!430315 (contains!3246 lt!309041 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!662417 () Bool)

(declare-fun res!430321 () Bool)

(assert (=> b!662417 (=> (not res!430321) (not e!380351))))

(assert (=> b!662417 (= res!430321 (not (contains!3246 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!662418 () Bool)

(assert (=> b!662418 (= e!380354 (not (contains!3246 acc!681 k0!2843)))))

(declare-fun b!662419 () Bool)

(assert (=> b!662419 (= e!380350 true)))

(declare-fun lt!309042 () Bool)

(assert (=> b!662419 (= lt!309042 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!309041))))

(declare-fun lt!309046 () Unit!22977)

(declare-fun noDuplicateSubseq!8 (List!12594 List!12594) Unit!22977)

(assert (=> b!662419 (= lt!309046 (noDuplicateSubseq!8 acc!681 lt!309041))))

(assert (= (and start!59928 res!430327) b!662405))

(assert (= (and b!662405 res!430326) b!662417))

(assert (= (and b!662417 res!430321) b!662415))

(assert (= (and b!662415 res!430318) b!662409))

(assert (= (and b!662409 res!430319) b!662413))

(assert (= (and b!662409 (not res!430330)) b!662411))

(assert (= (and b!662411 res!430322) b!662418))

(assert (= (and b!662409 res!430325) b!662414))

(assert (= (and b!662414 res!430312) b!662402))

(assert (= (and b!662402 res!430328) b!662410))

(assert (= (and b!662410 res!430317) b!662404))

(assert (= (and b!662404 res!430316) b!662412))

(assert (= (and b!662412 res!430320) b!662399))

(assert (= (and b!662399 res!430324) b!662406))

(assert (= (and b!662406 c!76412) b!662408))

(assert (= (and b!662406 (not c!76412)) b!662403))

(assert (= (and b!662406 (not res!430313)) b!662401))

(assert (= (and b!662401 (not res!430314)) b!662407))

(assert (= (and b!662407 (not res!430311)) b!662400))

(assert (= (and b!662400 (not res!430329)) b!662416))

(assert (= (and b!662416 (not res!430315)) b!662398))

(assert (= (and b!662398 (not res!430323)) b!662419))

(declare-fun m!634783 () Bool)

(assert (=> b!662419 m!634783))

(declare-fun m!634785 () Bool)

(assert (=> b!662419 m!634785))

(declare-fun m!634787 () Bool)

(assert (=> b!662404 m!634787))

(declare-fun m!634789 () Bool)

(assert (=> b!662400 m!634789))

(declare-fun m!634791 () Bool)

(assert (=> b!662413 m!634791))

(declare-fun m!634793 () Bool)

(assert (=> start!59928 m!634793))

(declare-fun m!634795 () Bool)

(assert (=> b!662416 m!634795))

(declare-fun m!634797 () Bool)

(assert (=> b!662408 m!634797))

(declare-fun m!634799 () Bool)

(assert (=> b!662401 m!634799))

(assert (=> b!662401 m!634799))

(declare-fun m!634801 () Bool)

(assert (=> b!662401 m!634801))

(declare-fun m!634803 () Bool)

(assert (=> b!662401 m!634803))

(declare-fun m!634805 () Bool)

(assert (=> b!662401 m!634805))

(assert (=> b!662406 m!634799))

(declare-fun m!634807 () Bool)

(assert (=> b!662406 m!634807))

(declare-fun m!634809 () Bool)

(assert (=> b!662406 m!634809))

(assert (=> b!662406 m!634799))

(declare-fun m!634811 () Bool)

(assert (=> b!662406 m!634811))

(declare-fun m!634813 () Bool)

(assert (=> b!662406 m!634813))

(declare-fun m!634815 () Bool)

(assert (=> b!662412 m!634815))

(assert (=> b!662418 m!634791))

(declare-fun m!634817 () Bool)

(assert (=> b!662407 m!634817))

(declare-fun m!634819 () Bool)

(assert (=> b!662417 m!634819))

(declare-fun m!634821 () Bool)

(assert (=> b!662405 m!634821))

(declare-fun m!634823 () Bool)

(assert (=> b!662398 m!634823))

(declare-fun m!634825 () Bool)

(assert (=> b!662414 m!634825))

(declare-fun m!634827 () Bool)

(assert (=> b!662402 m!634827))

(declare-fun m!634829 () Bool)

(assert (=> b!662415 m!634829))

(check-sat (not b!662416) (not b!662407) (not b!662398) (not b!662408) (not b!662418) (not start!59928) (not b!662402) (not b!662419) (not b!662413) (not b!662415) (not b!662405) (not b!662417) (not b!662414) (not b!662404) (not b!662406) (not b!662412) (not b!662400) (not b!662401))
(check-sat)
