; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59820 () Bool)

(assert start!59820)

(declare-fun b!660363 () Bool)

(declare-fun res!428322 () Bool)

(declare-fun e!379480 () Bool)

(assert (=> b!660363 (=> (not res!428322) (not e!379480))))

(declare-datatypes ((List!12540 0))(
  ( (Nil!12537) (Cons!12536 (h!13584 (_ BitVec 64)) (t!18760 List!12540)) )
))
(declare-fun acc!681 () List!12540)

(declare-fun contains!3192 (List!12540 (_ BitVec 64)) Bool)

(assert (=> b!660363 (= res!428322 (not (contains!3192 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660364 () Bool)

(declare-fun e!379482 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(assert (=> b!660364 (= e!379482 (contains!3192 acc!681 k0!2843))))

(declare-fun b!660365 () Bool)

(declare-fun res!428321 () Bool)

(assert (=> b!660365 (=> (not res!428321) (not e!379480))))

(declare-fun e!379481 () Bool)

(assert (=> b!660365 (= res!428321 e!379481)))

(declare-fun res!428320 () Bool)

(assert (=> b!660365 (=> res!428320 e!379481)))

(assert (=> b!660365 (= res!428320 e!379482)))

(declare-fun res!428323 () Bool)

(assert (=> b!660365 (=> (not res!428323) (not e!379482))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!660365 (= res!428323 (bvsgt from!3004 i!1382))))

(declare-fun b!660366 () Bool)

(declare-fun res!428318 () Bool)

(assert (=> b!660366 (=> (not res!428318) (not e!379480))))

(assert (=> b!660366 (= res!428318 (not (contains!3192 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660367 () Bool)

(declare-fun e!379478 () Bool)

(assert (=> b!660367 (= e!379481 e!379478)))

(declare-fun res!428319 () Bool)

(assert (=> b!660367 (=> (not res!428319) (not e!379478))))

(assert (=> b!660367 (= res!428319 (bvsle from!3004 i!1382))))

(declare-fun b!660368 () Bool)

(declare-fun res!428317 () Bool)

(assert (=> b!660368 (=> (not res!428317) (not e!379480))))

(declare-fun noDuplicate!466 (List!12540) Bool)

(assert (=> b!660368 (= res!428317 (noDuplicate!466 acc!681))))

(declare-fun res!428316 () Bool)

(assert (=> start!59820 (=> (not res!428316) (not e!379480))))

(declare-datatypes ((array!38805 0))(
  ( (array!38806 (arr!18592 (Array (_ BitVec 32) (_ BitVec 64))) (size!18956 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38805)

(assert (=> start!59820 (= res!428316 (and (bvslt (size!18956 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18956 a!3626))))))

(assert (=> start!59820 e!379480))

(assert (=> start!59820 true))

(declare-fun array_inv!14451 (array!38805) Bool)

(assert (=> start!59820 (array_inv!14451 a!3626)))

(declare-fun b!660369 () Bool)

(assert (=> b!660369 (= e!379478 (not (contains!3192 acc!681 k0!2843)))))

(declare-fun b!660370 () Bool)

(assert (=> b!660370 (= e!379480 false)))

(declare-fun lt!308851 () Bool)

(declare-fun arrayNoDuplicates!0 (array!38805 (_ BitVec 32) List!12540) Bool)

(assert (=> b!660370 (= lt!308851 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12537))))

(assert (= (and start!59820 res!428316) b!660368))

(assert (= (and b!660368 res!428317) b!660366))

(assert (= (and b!660366 res!428318) b!660363))

(assert (= (and b!660363 res!428322) b!660365))

(assert (= (and b!660365 res!428323) b!660364))

(assert (= (and b!660365 (not res!428320)) b!660367))

(assert (= (and b!660367 res!428319) b!660369))

(assert (= (and b!660365 res!428321) b!660370))

(declare-fun m!633667 () Bool)

(assert (=> b!660369 m!633667))

(assert (=> b!660364 m!633667))

(declare-fun m!633669 () Bool)

(assert (=> start!59820 m!633669))

(declare-fun m!633671 () Bool)

(assert (=> b!660368 m!633671))

(declare-fun m!633673 () Bool)

(assert (=> b!660363 m!633673))

(declare-fun m!633675 () Bool)

(assert (=> b!660370 m!633675))

(declare-fun m!633677 () Bool)

(assert (=> b!660366 m!633677))

(check-sat (not b!660363) (not start!59820) (not b!660369) (not b!660366) (not b!660370) (not b!660364) (not b!660368))
(check-sat)
