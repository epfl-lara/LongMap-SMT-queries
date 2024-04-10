; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60508 () Bool)

(assert start!60508)

(declare-fun b!680239 () Bool)

(declare-fun res!446521 () Bool)

(declare-fun e!387454 () Bool)

(assert (=> b!680239 (=> (not res!446521) (not e!387454))))

(declare-datatypes ((List!12975 0))(
  ( (Nil!12972) (Cons!12971 (h!14016 (_ BitVec 64)) (t!19203 List!12975)) )
))
(declare-fun acc!681 () List!12975)

(declare-fun contains!3552 (List!12975 (_ BitVec 64)) Bool)

(assert (=> b!680239 (= res!446521 (not (contains!3552 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!680240 () Bool)

(declare-fun e!387455 () Bool)

(declare-fun e!387456 () Bool)

(assert (=> b!680240 (= e!387455 e!387456)))

(declare-fun res!446523 () Bool)

(assert (=> b!680240 (=> (not res!446523) (not e!387456))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!680240 (= res!446523 (bvsle from!3004 i!1382))))

(declare-fun b!680241 () Bool)

(declare-fun res!446520 () Bool)

(assert (=> b!680241 (=> (not res!446520) (not e!387454))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!680241 (= res!446520 (validKeyInArray!0 k0!2843))))

(declare-fun res!446528 () Bool)

(assert (=> start!60508 (=> (not res!446528) (not e!387454))))

(declare-datatypes ((array!39489 0))(
  ( (array!39490 (arr!18934 (Array (_ BitVec 32) (_ BitVec 64))) (size!19298 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39489)

(assert (=> start!60508 (= res!446528 (and (bvslt (size!19298 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19298 a!3626))))))

(assert (=> start!60508 e!387454))

(assert (=> start!60508 true))

(declare-fun array_inv!14730 (array!39489) Bool)

(assert (=> start!60508 (array_inv!14730 a!3626)))

(declare-fun b!680242 () Bool)

(declare-fun res!446526 () Bool)

(assert (=> b!680242 (=> (not res!446526) (not e!387454))))

(assert (=> b!680242 (= res!446526 e!387455)))

(declare-fun res!446531 () Bool)

(assert (=> b!680242 (=> res!446531 e!387455)))

(declare-fun e!387459 () Bool)

(assert (=> b!680242 (= res!446531 e!387459)))

(declare-fun res!446518 () Bool)

(assert (=> b!680242 (=> (not res!446518) (not e!387459))))

(assert (=> b!680242 (= res!446518 (bvsgt from!3004 i!1382))))

(declare-fun b!680243 () Bool)

(declare-fun res!446522 () Bool)

(assert (=> b!680243 (=> (not res!446522) (not e!387454))))

(assert (=> b!680243 (= res!446522 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19298 a!3626))))))

(declare-fun b!680244 () Bool)

(declare-datatypes ((Unit!23854 0))(
  ( (Unit!23855) )
))
(declare-fun e!387453 () Unit!23854)

(declare-fun Unit!23856 () Unit!23854)

(assert (=> b!680244 (= e!387453 Unit!23856)))

(declare-fun lt!313050 () Unit!23854)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39489 (_ BitVec 64) (_ BitVec 32)) Unit!23854)

(assert (=> b!680244 (= lt!313050 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!680244 false))

(declare-fun b!680245 () Bool)

(declare-fun res!446525 () Bool)

(assert (=> b!680245 (=> (not res!446525) (not e!387454))))

(declare-fun arrayNoDuplicates!0 (array!39489 (_ BitVec 32) List!12975) Bool)

(assert (=> b!680245 (= res!446525 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12972))))

(declare-fun b!680246 () Bool)

(declare-fun res!446527 () Bool)

(assert (=> b!680246 (=> (not res!446527) (not e!387454))))

(declare-fun arrayContainsKey!0 (array!39489 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!680246 (= res!446527 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!680247 () Bool)

(declare-fun res!446519 () Bool)

(assert (=> b!680247 (=> (not res!446519) (not e!387454))))

(declare-fun noDuplicate!799 (List!12975) Bool)

(assert (=> b!680247 (= res!446519 (noDuplicate!799 acc!681))))

(declare-fun b!680248 () Bool)

(declare-fun res!446530 () Bool)

(assert (=> b!680248 (=> (not res!446530) (not e!387454))))

(assert (=> b!680248 (= res!446530 (not (contains!3552 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!680249 () Bool)

(declare-fun e!387458 () Bool)

(assert (=> b!680249 (= e!387454 (not e!387458))))

(declare-fun res!446529 () Bool)

(assert (=> b!680249 (=> res!446529 e!387458)))

(assert (=> b!680249 (= res!446529 (not (validKeyInArray!0 (select (arr!18934 a!3626) from!3004))))))

(declare-fun lt!313049 () Unit!23854)

(assert (=> b!680249 (= lt!313049 e!387453)))

(declare-fun c!77228 () Bool)

(assert (=> b!680249 (= c!77228 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!680249 (arrayContainsKey!0 (array!39490 (store (arr!18934 a!3626) i!1382 k0!2843) (size!19298 a!3626)) k0!2843 from!3004)))

(declare-fun b!680250 () Bool)

(declare-fun res!446517 () Bool)

(assert (=> b!680250 (=> (not res!446517) (not e!387454))))

(assert (=> b!680250 (= res!446517 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19298 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!680251 () Bool)

(declare-fun res!446524 () Bool)

(assert (=> b!680251 (=> (not res!446524) (not e!387454))))

(assert (=> b!680251 (= res!446524 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!680252 () Bool)

(declare-fun Unit!23857 () Unit!23854)

(assert (=> b!680252 (= e!387453 Unit!23857)))

(declare-fun b!680253 () Bool)

(assert (=> b!680253 (= e!387458 true)))

(declare-fun subseq!138 (List!12975 List!12975) Bool)

(assert (=> b!680253 (subseq!138 acc!681 acc!681)))

(declare-fun lt!313051 () Unit!23854)

(declare-fun lemmaListSubSeqRefl!0 (List!12975) Unit!23854)

(assert (=> b!680253 (= lt!313051 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!680254 () Bool)

(assert (=> b!680254 (= e!387459 (contains!3552 acc!681 k0!2843))))

(declare-fun b!680255 () Bool)

(assert (=> b!680255 (= e!387456 (not (contains!3552 acc!681 k0!2843)))))

(assert (= (and start!60508 res!446528) b!680247))

(assert (= (and b!680247 res!446519) b!680248))

(assert (= (and b!680248 res!446530) b!680239))

(assert (= (and b!680239 res!446521) b!680242))

(assert (= (and b!680242 res!446518) b!680254))

(assert (= (and b!680242 (not res!446531)) b!680240))

(assert (= (and b!680240 res!446523) b!680255))

(assert (= (and b!680242 res!446526) b!680245))

(assert (= (and b!680245 res!446525) b!680251))

(assert (= (and b!680251 res!446524) b!680243))

(assert (= (and b!680243 res!446522) b!680241))

(assert (= (and b!680241 res!446520) b!680246))

(assert (= (and b!680246 res!446527) b!680250))

(assert (= (and b!680250 res!446517) b!680249))

(assert (= (and b!680249 c!77228) b!680244))

(assert (= (and b!680249 (not c!77228)) b!680252))

(assert (= (and b!680249 (not res!446529)) b!680253))

(declare-fun m!645357 () Bool)

(assert (=> b!680253 m!645357))

(declare-fun m!645359 () Bool)

(assert (=> b!680253 m!645359))

(declare-fun m!645361 () Bool)

(assert (=> b!680255 m!645361))

(declare-fun m!645363 () Bool)

(assert (=> b!680244 m!645363))

(declare-fun m!645365 () Bool)

(assert (=> b!680248 m!645365))

(declare-fun m!645367 () Bool)

(assert (=> start!60508 m!645367))

(declare-fun m!645369 () Bool)

(assert (=> b!680246 m!645369))

(assert (=> b!680254 m!645361))

(declare-fun m!645371 () Bool)

(assert (=> b!680247 m!645371))

(declare-fun m!645373 () Bool)

(assert (=> b!680249 m!645373))

(declare-fun m!645375 () Bool)

(assert (=> b!680249 m!645375))

(declare-fun m!645377 () Bool)

(assert (=> b!680249 m!645377))

(assert (=> b!680249 m!645373))

(declare-fun m!645379 () Bool)

(assert (=> b!680249 m!645379))

(declare-fun m!645381 () Bool)

(assert (=> b!680249 m!645381))

(declare-fun m!645383 () Bool)

(assert (=> b!680251 m!645383))

(declare-fun m!645385 () Bool)

(assert (=> b!680239 m!645385))

(declare-fun m!645387 () Bool)

(assert (=> b!680241 m!645387))

(declare-fun m!645389 () Bool)

(assert (=> b!680245 m!645389))

(check-sat (not b!680239) (not b!680255) (not b!680254) (not b!680248) (not b!680244) (not b!680247) (not start!60508) (not b!680241) (not b!680246) (not b!680253) (not b!680251) (not b!680249) (not b!680245))
(check-sat)
