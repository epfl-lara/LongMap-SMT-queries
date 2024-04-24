; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60486 () Bool)

(assert start!60486)

(declare-fun b!679263 () Bool)

(declare-fun res!445537 () Bool)

(declare-fun e!387042 () Bool)

(assert (=> b!679263 (=> (not res!445537) (not e!387042))))

(declare-datatypes ((List!12855 0))(
  ( (Nil!12852) (Cons!12851 (h!13899 (_ BitVec 64)) (t!19075 List!12855)) )
))
(declare-fun acc!681 () List!12855)

(declare-fun noDuplicate!781 (List!12855) Bool)

(assert (=> b!679263 (= res!445537 (noDuplicate!781 acc!681))))

(declare-fun b!679264 () Bool)

(declare-fun res!445536 () Bool)

(assert (=> b!679264 (=> (not res!445536) (not e!387042))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!679264 (= res!445536 (validKeyInArray!0 k0!2843))))

(declare-fun b!679265 () Bool)

(declare-fun e!387043 () Bool)

(declare-fun contains!3507 (List!12855 (_ BitVec 64)) Bool)

(assert (=> b!679265 (= e!387043 (not (contains!3507 acc!681 k0!2843)))))

(declare-fun b!679266 () Bool)

(assert (=> b!679266 (= e!387042 (not true))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((array!39438 0))(
  ( (array!39439 (arr!18907 (Array (_ BitVec 32) (_ BitVec 64))) (size!19271 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39438)

(declare-fun arrayContainsKey!0 (array!39438 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!679266 (arrayContainsKey!0 (array!39439 (store (arr!18907 a!3626) i!1382 k0!2843) (size!19271 a!3626)) k0!2843 from!3004)))

(declare-fun b!679268 () Bool)

(declare-fun e!387045 () Bool)

(assert (=> b!679268 (= e!387045 (contains!3507 acc!681 k0!2843))))

(declare-fun b!679269 () Bool)

(declare-fun res!445538 () Bool)

(assert (=> b!679269 (=> (not res!445538) (not e!387042))))

(declare-fun arrayNoDuplicates!0 (array!39438 (_ BitVec 32) List!12855) Bool)

(assert (=> b!679269 (= res!445538 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!679270 () Bool)

(declare-fun res!445542 () Bool)

(assert (=> b!679270 (=> (not res!445542) (not e!387042))))

(assert (=> b!679270 (= res!445542 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19271 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!679271 () Bool)

(declare-fun res!445549 () Bool)

(assert (=> b!679271 (=> (not res!445549) (not e!387042))))

(assert (=> b!679271 (= res!445549 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!679272 () Bool)

(declare-fun res!445545 () Bool)

(assert (=> b!679272 (=> (not res!445545) (not e!387042))))

(declare-fun e!387044 () Bool)

(assert (=> b!679272 (= res!445545 e!387044)))

(declare-fun res!445546 () Bool)

(assert (=> b!679272 (=> res!445546 e!387044)))

(assert (=> b!679272 (= res!445546 e!387045)))

(declare-fun res!445539 () Bool)

(assert (=> b!679272 (=> (not res!445539) (not e!387045))))

(assert (=> b!679272 (= res!445539 (bvsgt from!3004 i!1382))))

(declare-fun b!679273 () Bool)

(declare-fun res!445540 () Bool)

(assert (=> b!679273 (=> (not res!445540) (not e!387042))))

(assert (=> b!679273 (= res!445540 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12852))))

(declare-fun b!679274 () Bool)

(declare-fun res!445548 () Bool)

(assert (=> b!679274 (=> (not res!445548) (not e!387042))))

(assert (=> b!679274 (= res!445548 (not (contains!3507 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!679275 () Bool)

(assert (=> b!679275 (= e!387044 e!387043)))

(declare-fun res!445543 () Bool)

(assert (=> b!679275 (=> (not res!445543) (not e!387043))))

(assert (=> b!679275 (= res!445543 (bvsle from!3004 i!1382))))

(declare-fun b!679276 () Bool)

(declare-fun res!445541 () Bool)

(assert (=> b!679276 (=> (not res!445541) (not e!387042))))

(assert (=> b!679276 (= res!445541 (not (contains!3507 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!679267 () Bool)

(declare-fun res!445547 () Bool)

(assert (=> b!679267 (=> (not res!445547) (not e!387042))))

(assert (=> b!679267 (= res!445547 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19271 a!3626))))))

(declare-fun res!445544 () Bool)

(assert (=> start!60486 (=> (not res!445544) (not e!387042))))

(assert (=> start!60486 (= res!445544 (and (bvslt (size!19271 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19271 a!3626))))))

(assert (=> start!60486 e!387042))

(assert (=> start!60486 true))

(declare-fun array_inv!14766 (array!39438) Bool)

(assert (=> start!60486 (array_inv!14766 a!3626)))

(assert (= (and start!60486 res!445544) b!679263))

(assert (= (and b!679263 res!445537) b!679274))

(assert (= (and b!679274 res!445548) b!679276))

(assert (= (and b!679276 res!445541) b!679272))

(assert (= (and b!679272 res!445539) b!679268))

(assert (= (and b!679272 (not res!445546)) b!679275))

(assert (= (and b!679275 res!445543) b!679265))

(assert (= (and b!679272 res!445545) b!679273))

(assert (= (and b!679273 res!445540) b!679269))

(assert (= (and b!679269 res!445538) b!679267))

(assert (= (and b!679267 res!445547) b!679264))

(assert (= (and b!679264 res!445536) b!679271))

(assert (= (and b!679271 res!445549) b!679270))

(assert (= (and b!679270 res!445542) b!679266))

(declare-fun m!645277 () Bool)

(assert (=> start!60486 m!645277))

(declare-fun m!645279 () Bool)

(assert (=> b!679266 m!645279))

(declare-fun m!645281 () Bool)

(assert (=> b!679266 m!645281))

(declare-fun m!645283 () Bool)

(assert (=> b!679273 m!645283))

(declare-fun m!645285 () Bool)

(assert (=> b!679263 m!645285))

(declare-fun m!645287 () Bool)

(assert (=> b!679264 m!645287))

(declare-fun m!645289 () Bool)

(assert (=> b!679274 m!645289))

(declare-fun m!645291 () Bool)

(assert (=> b!679265 m!645291))

(assert (=> b!679268 m!645291))

(declare-fun m!645293 () Bool)

(assert (=> b!679271 m!645293))

(declare-fun m!645295 () Bool)

(assert (=> b!679269 m!645295))

(declare-fun m!645297 () Bool)

(assert (=> b!679276 m!645297))

(check-sat (not b!679266) (not b!679271) (not b!679269) (not b!679265) (not b!679274) (not b!679263) (not b!679264) (not b!679276) (not b!679273) (not b!679268) (not start!60486))
(check-sat)
