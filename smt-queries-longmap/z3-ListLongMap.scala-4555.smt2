; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63562 () Bool)

(assert start!63562)

(declare-fun b!715451 () Bool)

(declare-fun res!478298 () Bool)

(declare-fun e!402008 () Bool)

(assert (=> b!715451 (=> (not res!478298) (not e!402008))))

(declare-datatypes ((List!13338 0))(
  ( (Nil!13335) (Cons!13334 (h!14382 (_ BitVec 64)) (t!19645 List!13338)) )
))
(declare-fun newAcc!49 () List!13338)

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun acc!652 () List!13338)

(declare-fun -!422 (List!13338 (_ BitVec 64)) List!13338)

(assert (=> b!715451 (= res!478298 (= (-!422 newAcc!49 k0!2824) acc!652))))

(declare-fun b!715452 () Bool)

(declare-fun res!478302 () Bool)

(assert (=> b!715452 (=> (not res!478302) (not e!402008))))

(declare-fun from!2969 () (_ BitVec 32))

(declare-datatypes ((array!40512 0))(
  ( (array!40513 (arr!19390 (Array (_ BitVec 32) (_ BitVec 64))) (size!19805 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40512)

(assert (=> b!715452 (= res!478302 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19805 a!3591)))))

(declare-fun b!715453 () Bool)

(declare-fun res!478315 () Bool)

(assert (=> b!715453 (=> (not res!478315) (not e!402008))))

(declare-fun contains!3990 (List!13338 (_ BitVec 64)) Bool)

(assert (=> b!715453 (= res!478315 (not (contains!3990 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715454 () Bool)

(declare-fun res!478311 () Bool)

(assert (=> b!715454 (=> (not res!478311) (not e!402008))))

(declare-fun arrayNoDuplicates!0 (array!40512 (_ BitVec 32) List!13338) Bool)

(assert (=> b!715454 (= res!478311 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!715455 () Bool)

(declare-fun res!478300 () Bool)

(assert (=> b!715455 (=> (not res!478300) (not e!402008))))

(declare-fun arrayContainsKey!0 (array!40512 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!715455 (= res!478300 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!715456 () Bool)

(declare-fun res!478312 () Bool)

(assert (=> b!715456 (=> (not res!478312) (not e!402008))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!715456 (= res!478312 (not (validKeyInArray!0 (select (arr!19390 a!3591) from!2969))))))

(declare-fun b!715457 () Bool)

(declare-fun res!478301 () Bool)

(assert (=> b!715457 (=> (not res!478301) (not e!402008))))

(assert (=> b!715457 (= res!478301 (not (contains!3990 acc!652 k0!2824)))))

(declare-fun b!715458 () Bool)

(declare-fun res!478306 () Bool)

(assert (=> b!715458 (=> (not res!478306) (not e!402008))))

(assert (=> b!715458 (= res!478306 (validKeyInArray!0 k0!2824))))

(declare-fun res!478308 () Bool)

(assert (=> start!63562 (=> (not res!478308) (not e!402008))))

(assert (=> start!63562 (= res!478308 (and (bvslt (size!19805 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19805 a!3591))))))

(assert (=> start!63562 e!402008))

(assert (=> start!63562 true))

(declare-fun array_inv!15249 (array!40512) Bool)

(assert (=> start!63562 (array_inv!15249 a!3591)))

(declare-fun b!715459 () Bool)

(declare-fun res!478310 () Bool)

(assert (=> b!715459 (=> (not res!478310) (not e!402008))))

(assert (=> b!715459 (= res!478310 (not (contains!3990 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715460 () Bool)

(assert (=> b!715460 (= e!402008 false)))

(declare-fun lt!318942 () Bool)

(assert (=> b!715460 (= lt!318942 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!715461 () Bool)

(declare-fun res!478309 () Bool)

(assert (=> b!715461 (=> (not res!478309) (not e!402008))))

(assert (=> b!715461 (= res!478309 (contains!3990 newAcc!49 k0!2824))))

(declare-fun b!715462 () Bool)

(declare-fun res!478313 () Bool)

(assert (=> b!715462 (=> (not res!478313) (not e!402008))))

(assert (=> b!715462 (= res!478313 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!715463 () Bool)

(declare-fun res!478314 () Bool)

(assert (=> b!715463 (=> (not res!478314) (not e!402008))))

(declare-fun noDuplicate!1264 (List!13338) Bool)

(assert (=> b!715463 (= res!478314 (noDuplicate!1264 newAcc!49))))

(declare-fun b!715464 () Bool)

(declare-fun res!478303 () Bool)

(assert (=> b!715464 (=> (not res!478303) (not e!402008))))

(assert (=> b!715464 (= res!478303 (noDuplicate!1264 acc!652))))

(declare-fun b!715465 () Bool)

(declare-fun res!478304 () Bool)

(assert (=> b!715465 (=> (not res!478304) (not e!402008))))

(assert (=> b!715465 (= res!478304 (not (contains!3990 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715466 () Bool)

(declare-fun res!478299 () Bool)

(assert (=> b!715466 (=> (not res!478299) (not e!402008))))

(assert (=> b!715466 (= res!478299 (not (contains!3990 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715467 () Bool)

(declare-fun res!478307 () Bool)

(assert (=> b!715467 (=> (not res!478307) (not e!402008))))

(assert (=> b!715467 (= res!478307 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!715468 () Bool)

(declare-fun res!478305 () Bool)

(assert (=> b!715468 (=> (not res!478305) (not e!402008))))

(declare-fun subseq!458 (List!13338 List!13338) Bool)

(assert (=> b!715468 (= res!478305 (subseq!458 acc!652 newAcc!49))))

(assert (= (and start!63562 res!478308) b!715464))

(assert (= (and b!715464 res!478303) b!715463))

(assert (= (and b!715463 res!478314) b!715466))

(assert (= (and b!715466 res!478299) b!715459))

(assert (= (and b!715459 res!478310) b!715455))

(assert (= (and b!715455 res!478300) b!715457))

(assert (= (and b!715457 res!478301) b!715458))

(assert (= (and b!715458 res!478306) b!715454))

(assert (= (and b!715454 res!478311) b!715468))

(assert (= (and b!715468 res!478305) b!715461))

(assert (= (and b!715461 res!478309) b!715451))

(assert (= (and b!715451 res!478298) b!715453))

(assert (= (and b!715453 res!478315) b!715465))

(assert (= (and b!715465 res!478304) b!715452))

(assert (= (and b!715452 res!478302) b!715456))

(assert (= (and b!715456 res!478312) b!715462))

(assert (= (and b!715462 res!478313) b!715467))

(assert (= (and b!715467 res!478307) b!715460))

(declare-fun m!672273 () Bool)

(assert (=> b!715468 m!672273))

(declare-fun m!672275 () Bool)

(assert (=> b!715464 m!672275))

(declare-fun m!672277 () Bool)

(assert (=> b!715463 m!672277))

(declare-fun m!672279 () Bool)

(assert (=> b!715458 m!672279))

(declare-fun m!672281 () Bool)

(assert (=> b!715460 m!672281))

(declare-fun m!672283 () Bool)

(assert (=> b!715457 m!672283))

(declare-fun m!672285 () Bool)

(assert (=> start!63562 m!672285))

(declare-fun m!672287 () Bool)

(assert (=> b!715466 m!672287))

(declare-fun m!672289 () Bool)

(assert (=> b!715456 m!672289))

(assert (=> b!715456 m!672289))

(declare-fun m!672291 () Bool)

(assert (=> b!715456 m!672291))

(declare-fun m!672293 () Bool)

(assert (=> b!715453 m!672293))

(declare-fun m!672295 () Bool)

(assert (=> b!715459 m!672295))

(declare-fun m!672297 () Bool)

(assert (=> b!715467 m!672297))

(declare-fun m!672299 () Bool)

(assert (=> b!715455 m!672299))

(declare-fun m!672301 () Bool)

(assert (=> b!715461 m!672301))

(declare-fun m!672303 () Bool)

(assert (=> b!715451 m!672303))

(declare-fun m!672305 () Bool)

(assert (=> b!715465 m!672305))

(declare-fun m!672307 () Bool)

(assert (=> b!715454 m!672307))

(check-sat (not b!715459) (not b!715454) (not b!715453) (not b!715467) (not b!715463) (not b!715455) (not b!715466) (not b!715456) (not b!715460) (not b!715465) (not start!63562) (not b!715464) (not b!715458) (not b!715451) (not b!715468) (not b!715461) (not b!715457))
(check-sat)
