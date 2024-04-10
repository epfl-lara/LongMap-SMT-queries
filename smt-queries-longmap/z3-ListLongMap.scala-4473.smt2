; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62224 () Bool)

(assert start!62224)

(declare-fun b!697302 () Bool)

(declare-fun res!461231 () Bool)

(declare-fun e!396394 () Bool)

(assert (=> b!697302 (=> (not res!461231) (not e!396394))))

(declare-datatypes ((array!39981 0))(
  ( (array!39982 (arr!19150 (Array (_ BitVec 32) (_ BitVec 64))) (size!19535 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39981)

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((List!13191 0))(
  ( (Nil!13188) (Cons!13187 (h!14232 (_ BitVec 64)) (t!19473 List!13191)) )
))
(declare-fun acc!681 () List!13191)

(declare-fun arrayNoDuplicates!0 (array!39981 (_ BitVec 32) List!13191) Bool)

(assert (=> b!697302 (= res!461231 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!697303 () Bool)

(declare-fun res!461233 () Bool)

(assert (=> b!697303 (=> (not res!461233) (not e!396394))))

(assert (=> b!697303 (= res!461233 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun res!461226 () Bool)

(assert (=> start!62224 (=> (not res!461226) (not e!396394))))

(assert (=> start!62224 (= res!461226 (and (bvslt (size!19535 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19535 a!3626))))))

(assert (=> start!62224 e!396394))

(assert (=> start!62224 true))

(declare-fun array_inv!14946 (array!39981) Bool)

(assert (=> start!62224 (array_inv!14946 a!3626)))

(declare-fun b!697304 () Bool)

(declare-fun res!461225 () Bool)

(assert (=> b!697304 (=> (not res!461225) (not e!396394))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39981 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!697304 (= res!461225 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!697305 () Bool)

(declare-fun res!461234 () Bool)

(assert (=> b!697305 (=> (not res!461234) (not e!396394))))

(declare-fun contains!3768 (List!13191 (_ BitVec 64)) Bool)

(assert (=> b!697305 (= res!461234 (not (contains!3768 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!697306 () Bool)

(declare-fun res!461222 () Bool)

(assert (=> b!697306 (=> (not res!461222) (not e!396394))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!697306 (= res!461222 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19535 a!3626))))))

(declare-fun b!697307 () Bool)

(declare-fun res!461237 () Bool)

(assert (=> b!697307 (=> (not res!461237) (not e!396394))))

(declare-fun noDuplicate!1015 (List!13191) Bool)

(assert (=> b!697307 (= res!461237 (noDuplicate!1015 acc!681))))

(declare-fun b!697308 () Bool)

(declare-fun res!461221 () Bool)

(assert (=> b!697308 (=> (not res!461221) (not e!396394))))

(declare-fun e!396399 () Bool)

(assert (=> b!697308 (= res!461221 e!396399)))

(declare-fun res!461240 () Bool)

(assert (=> b!697308 (=> res!461240 e!396399)))

(declare-fun e!396395 () Bool)

(assert (=> b!697308 (= res!461240 e!396395)))

(declare-fun res!461227 () Bool)

(assert (=> b!697308 (=> (not res!461227) (not e!396395))))

(assert (=> b!697308 (= res!461227 (bvsgt from!3004 i!1382))))

(declare-fun b!697309 () Bool)

(declare-fun res!461220 () Bool)

(assert (=> b!697309 (=> (not res!461220) (not e!396394))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!697309 (= res!461220 (not (validKeyInArray!0 (select (arr!19150 a!3626) from!3004))))))

(declare-fun b!697310 () Bool)

(declare-fun res!461236 () Bool)

(assert (=> b!697310 (=> (not res!461236) (not e!396394))))

(assert (=> b!697310 (= res!461236 (validKeyInArray!0 k0!2843))))

(declare-fun b!697311 () Bool)

(declare-fun e!396393 () Bool)

(assert (=> b!697311 (= e!396393 (not (contains!3768 acc!681 k0!2843)))))

(declare-fun b!697312 () Bool)

(declare-fun e!396392 () Bool)

(declare-fun e!396397 () Bool)

(assert (=> b!697312 (= e!396392 e!396397)))

(declare-fun res!461235 () Bool)

(assert (=> b!697312 (=> (not res!461235) (not e!396397))))

(assert (=> b!697312 (= res!461235 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!697313 () Bool)

(declare-fun res!461230 () Bool)

(assert (=> b!697313 (=> (not res!461230) (not e!396394))))

(assert (=> b!697313 (= res!461230 (not (contains!3768 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!697314 () Bool)

(declare-fun res!461223 () Bool)

(assert (=> b!697314 (=> (not res!461223) (not e!396394))))

(assert (=> b!697314 (= res!461223 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13188))))

(declare-fun b!697315 () Bool)

(declare-fun res!461229 () Bool)

(assert (=> b!697315 (=> (not res!461229) (not e!396394))))

(assert (=> b!697315 (= res!461229 e!396392)))

(declare-fun res!461238 () Bool)

(assert (=> b!697315 (=> res!461238 e!396392)))

(declare-fun e!396398 () Bool)

(assert (=> b!697315 (= res!461238 e!396398)))

(declare-fun res!461232 () Bool)

(assert (=> b!697315 (=> (not res!461232) (not e!396398))))

(assert (=> b!697315 (= res!461232 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!697316 () Bool)

(assert (=> b!697316 (= e!396397 (not (contains!3768 acc!681 k0!2843)))))

(declare-fun b!697317 () Bool)

(declare-fun res!461224 () Bool)

(assert (=> b!697317 (=> (not res!461224) (not e!396394))))

(assert (=> b!697317 (= res!461224 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19535 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!697318 () Bool)

(assert (=> b!697318 (= e!396394 (not true))))

(assert (=> b!697318 (arrayNoDuplicates!0 (array!39982 (store (arr!19150 a!3626) i!1382 k0!2843) (size!19535 a!3626)) (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-datatypes ((Unit!24572 0))(
  ( (Unit!24573) )
))
(declare-fun lt!317143 () Unit!24572)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39981 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!13191) Unit!24572)

(assert (=> b!697318 (= lt!317143 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k0!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!697319 () Bool)

(assert (=> b!697319 (= e!396399 e!396393)))

(declare-fun res!461239 () Bool)

(assert (=> b!697319 (=> (not res!461239) (not e!396393))))

(assert (=> b!697319 (= res!461239 (bvsle from!3004 i!1382))))

(declare-fun b!697320 () Bool)

(assert (=> b!697320 (= e!396395 (contains!3768 acc!681 k0!2843))))

(declare-fun b!697321 () Bool)

(declare-fun res!461228 () Bool)

(assert (=> b!697321 (=> (not res!461228) (not e!396394))))

(assert (=> b!697321 (= res!461228 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!697322 () Bool)

(assert (=> b!697322 (= e!396398 (contains!3768 acc!681 k0!2843))))

(assert (= (and start!62224 res!461226) b!697307))

(assert (= (and b!697307 res!461237) b!697313))

(assert (= (and b!697313 res!461230) b!697305))

(assert (= (and b!697305 res!461234) b!697308))

(assert (= (and b!697308 res!461227) b!697320))

(assert (= (and b!697308 (not res!461240)) b!697319))

(assert (= (and b!697319 res!461239) b!697311))

(assert (= (and b!697308 res!461221) b!697314))

(assert (= (and b!697314 res!461223) b!697302))

(assert (= (and b!697302 res!461231) b!697306))

(assert (= (and b!697306 res!461222) b!697310))

(assert (= (and b!697310 res!461236) b!697304))

(assert (= (and b!697304 res!461225) b!697317))

(assert (= (and b!697317 res!461224) b!697309))

(assert (= (and b!697309 res!461220) b!697303))

(assert (= (and b!697303 res!461233) b!697315))

(assert (= (and b!697315 res!461232) b!697322))

(assert (= (and b!697315 (not res!461238)) b!697312))

(assert (= (and b!697312 res!461235) b!697316))

(assert (= (and b!697315 res!461229) b!697321))

(assert (= (and b!697321 res!461228) b!697318))

(declare-fun m!657785 () Bool)

(assert (=> b!697321 m!657785))

(declare-fun m!657787 () Bool)

(assert (=> b!697320 m!657787))

(declare-fun m!657789 () Bool)

(assert (=> b!697302 m!657789))

(assert (=> b!697316 m!657787))

(declare-fun m!657791 () Bool)

(assert (=> start!62224 m!657791))

(declare-fun m!657793 () Bool)

(assert (=> b!697314 m!657793))

(declare-fun m!657795 () Bool)

(assert (=> b!697318 m!657795))

(declare-fun m!657797 () Bool)

(assert (=> b!697318 m!657797))

(declare-fun m!657799 () Bool)

(assert (=> b!697318 m!657799))

(declare-fun m!657801 () Bool)

(assert (=> b!697310 m!657801))

(declare-fun m!657803 () Bool)

(assert (=> b!697307 m!657803))

(assert (=> b!697322 m!657787))

(assert (=> b!697311 m!657787))

(declare-fun m!657805 () Bool)

(assert (=> b!697309 m!657805))

(assert (=> b!697309 m!657805))

(declare-fun m!657807 () Bool)

(assert (=> b!697309 m!657807))

(declare-fun m!657809 () Bool)

(assert (=> b!697305 m!657809))

(declare-fun m!657811 () Bool)

(assert (=> b!697304 m!657811))

(declare-fun m!657813 () Bool)

(assert (=> b!697313 m!657813))

(check-sat (not b!697305) (not b!697318) (not b!697311) (not b!697313) (not b!697320) (not b!697310) (not b!697316) (not start!62224) (not b!697321) (not b!697307) (not b!697309) (not b!697302) (not b!697304) (not b!697322) (not b!697314))
(check-sat)
