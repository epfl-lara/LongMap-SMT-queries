; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60366 () Bool)

(assert start!60366)

(declare-fun b!677300 () Bool)

(declare-fun e!386181 () Bool)

(declare-fun e!386183 () Bool)

(assert (=> b!677300 (= e!386181 e!386183)))

(declare-fun res!443623 () Bool)

(assert (=> b!677300 (=> (not res!443623) (not e!386183))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!677300 (= res!443623 (bvsle from!3004 i!1382))))

(declare-fun b!677301 () Bool)

(declare-fun res!443634 () Bool)

(declare-fun e!386182 () Bool)

(assert (=> b!677301 (=> (not res!443634) (not e!386182))))

(declare-datatypes ((array!39351 0))(
  ( (array!39352 (arr!18865 (Array (_ BitVec 32) (_ BitVec 64))) (size!19229 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39351)

(assert (=> b!677301 (= res!443634 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19229 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!677302 () Bool)

(declare-fun res!443619 () Bool)

(assert (=> b!677302 (=> (not res!443619) (not e!386182))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!677302 (= res!443619 (not (validKeyInArray!0 (select (arr!18865 a!3626) from!3004))))))

(declare-fun b!677303 () Bool)

(declare-fun res!443615 () Bool)

(assert (=> b!677303 (=> (not res!443615) (not e!386182))))

(declare-fun k0!2843 () (_ BitVec 64))

(assert (=> b!677303 (= res!443615 (validKeyInArray!0 k0!2843))))

(declare-fun b!677304 () Bool)

(declare-fun e!386184 () Bool)

(declare-datatypes ((List!12813 0))(
  ( (Nil!12810) (Cons!12809 (h!13857 (_ BitVec 64)) (t!19033 List!12813)) )
))
(declare-fun acc!681 () List!12813)

(declare-fun contains!3465 (List!12813 (_ BitVec 64)) Bool)

(assert (=> b!677304 (= e!386184 (contains!3465 acc!681 k0!2843))))

(declare-fun b!677305 () Bool)

(declare-fun res!443633 () Bool)

(assert (=> b!677305 (=> (not res!443633) (not e!386182))))

(assert (=> b!677305 (= res!443633 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19229 a!3626))))))

(declare-fun b!677306 () Bool)

(declare-fun res!443622 () Bool)

(assert (=> b!677306 (=> (not res!443622) (not e!386182))))

(assert (=> b!677306 (= res!443622 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!677307 () Bool)

(declare-fun res!443630 () Bool)

(assert (=> b!677307 (=> (not res!443630) (not e!386182))))

(declare-fun e!386185 () Bool)

(assert (=> b!677307 (= res!443630 e!386185)))

(declare-fun res!443632 () Bool)

(assert (=> b!677307 (=> res!443632 e!386185)))

(declare-fun e!386180 () Bool)

(assert (=> b!677307 (= res!443632 e!386180)))

(declare-fun res!443626 () Bool)

(assert (=> b!677307 (=> (not res!443626) (not e!386180))))

(assert (=> b!677307 (= res!443626 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!677308 () Bool)

(declare-fun res!443620 () Bool)

(assert (=> b!677308 (=> (not res!443620) (not e!386182))))

(assert (=> b!677308 (= res!443620 (not (contains!3465 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!677309 () Bool)

(declare-fun res!443629 () Bool)

(assert (=> b!677309 (=> (not res!443629) (not e!386182))))

(assert (=> b!677309 (= res!443629 e!386181)))

(declare-fun res!443616 () Bool)

(assert (=> b!677309 (=> res!443616 e!386181)))

(assert (=> b!677309 (= res!443616 e!386184)))

(declare-fun res!443624 () Bool)

(assert (=> b!677309 (=> (not res!443624) (not e!386184))))

(assert (=> b!677309 (= res!443624 (bvsgt from!3004 i!1382))))

(declare-fun b!677310 () Bool)

(assert (=> b!677310 (= e!386182 (not (bvsle from!3004 (size!19229 a!3626))))))

(declare-fun arrayNoDuplicates!0 (array!39351 (_ BitVec 32) List!12813) Bool)

(assert (=> b!677310 (arrayNoDuplicates!0 (array!39352 (store (arr!18865 a!3626) i!1382 k0!2843) (size!19229 a!3626)) (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-datatypes ((Unit!23739 0))(
  ( (Unit!23740) )
))
(declare-fun lt!312910 () Unit!23739)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39351 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12813) Unit!23739)

(assert (=> b!677310 (= lt!312910 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k0!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!677311 () Bool)

(declare-fun res!443621 () Bool)

(assert (=> b!677311 (=> (not res!443621) (not e!386182))))

(declare-fun noDuplicate!739 (List!12813) Bool)

(assert (=> b!677311 (= res!443621 (noDuplicate!739 acc!681))))

(declare-fun b!677312 () Bool)

(declare-fun res!443631 () Bool)

(assert (=> b!677312 (=> (not res!443631) (not e!386182))))

(assert (=> b!677312 (= res!443631 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!677313 () Bool)

(declare-fun e!386186 () Bool)

(assert (=> b!677313 (= e!386185 e!386186)))

(declare-fun res!443617 () Bool)

(assert (=> b!677313 (=> (not res!443617) (not e!386186))))

(assert (=> b!677313 (= res!443617 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!677314 () Bool)

(assert (=> b!677314 (= e!386186 (not (contains!3465 acc!681 k0!2843)))))

(declare-fun b!677315 () Bool)

(declare-fun res!443628 () Bool)

(assert (=> b!677315 (=> (not res!443628) (not e!386182))))

(assert (=> b!677315 (= res!443628 (not (contains!3465 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!677316 () Bool)

(declare-fun res!443635 () Bool)

(assert (=> b!677316 (=> (not res!443635) (not e!386182))))

(declare-fun arrayContainsKey!0 (array!39351 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!677316 (= res!443635 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun res!443625 () Bool)

(assert (=> start!60366 (=> (not res!443625) (not e!386182))))

(assert (=> start!60366 (= res!443625 (and (bvslt (size!19229 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19229 a!3626))))))

(assert (=> start!60366 e!386182))

(assert (=> start!60366 true))

(declare-fun array_inv!14724 (array!39351) Bool)

(assert (=> start!60366 (array_inv!14724 a!3626)))

(declare-fun b!677317 () Bool)

(assert (=> b!677317 (= e!386183 (not (contains!3465 acc!681 k0!2843)))))

(declare-fun b!677318 () Bool)

(declare-fun res!443618 () Bool)

(assert (=> b!677318 (=> (not res!443618) (not e!386182))))

(assert (=> b!677318 (= res!443618 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12810))))

(declare-fun b!677319 () Bool)

(declare-fun res!443627 () Bool)

(assert (=> b!677319 (=> (not res!443627) (not e!386182))))

(assert (=> b!677319 (= res!443627 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!677320 () Bool)

(assert (=> b!677320 (= e!386180 (contains!3465 acc!681 k0!2843))))

(assert (= (and start!60366 res!443625) b!677311))

(assert (= (and b!677311 res!443621) b!677315))

(assert (= (and b!677315 res!443628) b!677308))

(assert (= (and b!677308 res!443620) b!677309))

(assert (= (and b!677309 res!443624) b!677304))

(assert (= (and b!677309 (not res!443616)) b!677300))

(assert (= (and b!677300 res!443623) b!677317))

(assert (= (and b!677309 res!443629) b!677318))

(assert (= (and b!677318 res!443618) b!677312))

(assert (= (and b!677312 res!443631) b!677305))

(assert (= (and b!677305 res!443633) b!677303))

(assert (= (and b!677303 res!443615) b!677316))

(assert (= (and b!677316 res!443635) b!677301))

(assert (= (and b!677301 res!443634) b!677302))

(assert (= (and b!677302 res!443619) b!677306))

(assert (= (and b!677306 res!443622) b!677307))

(assert (= (and b!677307 res!443626) b!677320))

(assert (= (and b!677307 (not res!443632)) b!677313))

(assert (= (and b!677313 res!443617) b!677314))

(assert (= (and b!677307 res!443630) b!677319))

(assert (= (and b!677319 res!443627) b!677310))

(declare-fun m!644245 () Bool)

(assert (=> b!677304 m!644245))

(declare-fun m!644247 () Bool)

(assert (=> b!677310 m!644247))

(declare-fun m!644249 () Bool)

(assert (=> b!677310 m!644249))

(declare-fun m!644251 () Bool)

(assert (=> b!677310 m!644251))

(assert (=> b!677317 m!644245))

(assert (=> b!677314 m!644245))

(declare-fun m!644253 () Bool)

(assert (=> b!677303 m!644253))

(declare-fun m!644255 () Bool)

(assert (=> b!677312 m!644255))

(declare-fun m!644257 () Bool)

(assert (=> b!677318 m!644257))

(declare-fun m!644259 () Bool)

(assert (=> b!677308 m!644259))

(assert (=> b!677320 m!644245))

(declare-fun m!644261 () Bool)

(assert (=> b!677319 m!644261))

(declare-fun m!644263 () Bool)

(assert (=> b!677315 m!644263))

(declare-fun m!644265 () Bool)

(assert (=> b!677311 m!644265))

(declare-fun m!644267 () Bool)

(assert (=> b!677302 m!644267))

(assert (=> b!677302 m!644267))

(declare-fun m!644269 () Bool)

(assert (=> b!677302 m!644269))

(declare-fun m!644271 () Bool)

(assert (=> b!677316 m!644271))

(declare-fun m!644273 () Bool)

(assert (=> start!60366 m!644273))

(check-sat (not b!677302) (not b!677315) (not b!677317) (not b!677310) (not b!677319) (not b!677316) (not b!677320) (not b!677303) (not b!677304) (not b!677308) (not b!677311) (not b!677314) (not b!677312) (not b!677318) (not start!60366))
(check-sat)
