; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59798 () Bool)

(assert start!59798)

(declare-fun b!660493 () Bool)

(declare-fun e!379507 () Bool)

(declare-datatypes ((List!12700 0))(
  ( (Nil!12697) (Cons!12696 (h!13741 (_ BitVec 64)) (t!18919 List!12700)) )
))
(declare-fun acc!681 () List!12700)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3222 (List!12700 (_ BitVec 64)) Bool)

(assert (=> b!660493 (= e!379507 (contains!3222 acc!681 k0!2843))))

(declare-fun b!660494 () Bool)

(declare-fun e!379511 () Bool)

(declare-fun e!379509 () Bool)

(assert (=> b!660494 (= e!379511 e!379509)))

(declare-fun res!428725 () Bool)

(assert (=> b!660494 (=> (not res!428725) (not e!379509))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!660494 (= res!428725 (bvsle from!3004 i!1382))))

(declare-fun b!660495 () Bool)

(declare-fun res!428720 () Bool)

(declare-fun e!379510 () Bool)

(assert (=> b!660495 (=> (not res!428720) (not e!379510))))

(assert (=> b!660495 (= res!428720 e!379511)))

(declare-fun res!428724 () Bool)

(assert (=> b!660495 (=> res!428724 e!379511)))

(assert (=> b!660495 (= res!428724 e!379507)))

(declare-fun res!428719 () Bool)

(assert (=> b!660495 (=> (not res!428719) (not e!379507))))

(assert (=> b!660495 (= res!428719 (bvsgt from!3004 i!1382))))

(declare-fun b!660496 () Bool)

(declare-fun res!428718 () Bool)

(assert (=> b!660496 (=> (not res!428718) (not e!379510))))

(assert (=> b!660496 (= res!428718 (not (contains!3222 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660497 () Bool)

(declare-fun res!428721 () Bool)

(assert (=> b!660497 (=> (not res!428721) (not e!379510))))

(assert (=> b!660497 (= res!428721 (not (contains!3222 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660498 () Bool)

(assert (=> b!660498 (= e!379509 (not (contains!3222 acc!681 k0!2843)))))

(declare-fun b!660500 () Bool)

(assert (=> b!660500 (= e!379510 false)))

(declare-datatypes ((array!38856 0))(
  ( (array!38857 (arr!18620 (Array (_ BitVec 32) (_ BitVec 64))) (size!18985 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38856)

(declare-fun lt!308556 () Bool)

(declare-fun arrayNoDuplicates!0 (array!38856 (_ BitVec 32) List!12700) Bool)

(assert (=> b!660500 (= lt!308556 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!660501 () Bool)

(declare-fun res!428717 () Bool)

(assert (=> b!660501 (=> (not res!428717) (not e!379510))))

(assert (=> b!660501 (= res!428717 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12697))))

(declare-fun res!428723 () Bool)

(assert (=> start!59798 (=> (not res!428723) (not e!379510))))

(assert (=> start!59798 (= res!428723 (and (bvslt (size!18985 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18985 a!3626))))))

(assert (=> start!59798 e!379510))

(assert (=> start!59798 true))

(declare-fun array_inv!14503 (array!38856) Bool)

(assert (=> start!59798 (array_inv!14503 a!3626)))

(declare-fun b!660499 () Bool)

(declare-fun res!428722 () Bool)

(assert (=> b!660499 (=> (not res!428722) (not e!379510))))

(declare-fun noDuplicate!491 (List!12700) Bool)

(assert (=> b!660499 (= res!428722 (noDuplicate!491 acc!681))))

(assert (= (and start!59798 res!428723) b!660499))

(assert (= (and b!660499 res!428722) b!660497))

(assert (= (and b!660497 res!428721) b!660496))

(assert (= (and b!660496 res!428718) b!660495))

(assert (= (and b!660495 res!428719) b!660493))

(assert (= (and b!660495 (not res!428724)) b!660494))

(assert (= (and b!660494 res!428725) b!660498))

(assert (= (and b!660495 res!428720) b!660501))

(assert (= (and b!660501 res!428717) b!660500))

(declare-fun m!632511 () Bool)

(assert (=> start!59798 m!632511))

(declare-fun m!632513 () Bool)

(assert (=> b!660496 m!632513))

(declare-fun m!632515 () Bool)

(assert (=> b!660500 m!632515))

(declare-fun m!632517 () Bool)

(assert (=> b!660497 m!632517))

(declare-fun m!632519 () Bool)

(assert (=> b!660498 m!632519))

(declare-fun m!632521 () Bool)

(assert (=> b!660499 m!632521))

(assert (=> b!660493 m!632519))

(declare-fun m!632523 () Bool)

(assert (=> b!660501 m!632523))

(check-sat (not b!660501) (not b!660499) (not b!660497) (not b!660493) (not start!59798) (not b!660500) (not b!660498) (not b!660496))
(check-sat)
