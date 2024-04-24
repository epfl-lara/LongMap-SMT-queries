; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59826 () Bool)

(assert start!59826)

(declare-fun b!660435 () Bool)

(declare-fun e!379524 () Bool)

(declare-datatypes ((List!12543 0))(
  ( (Nil!12540) (Cons!12539 (h!13587 (_ BitVec 64)) (t!18763 List!12543)) )
))
(declare-fun acc!681 () List!12543)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3195 (List!12543 (_ BitVec 64)) Bool)

(assert (=> b!660435 (= e!379524 (contains!3195 acc!681 k0!2843))))

(declare-fun b!660436 () Bool)

(declare-fun e!379525 () Bool)

(declare-fun e!379523 () Bool)

(assert (=> b!660436 (= e!379525 e!379523)))

(declare-fun res!428395 () Bool)

(assert (=> b!660436 (=> (not res!428395) (not e!379523))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!660436 (= res!428395 (bvsle from!3004 i!1382))))

(declare-fun b!660437 () Bool)

(declare-fun res!428393 () Bool)

(declare-fun e!379527 () Bool)

(assert (=> b!660437 (=> (not res!428393) (not e!379527))))

(declare-fun noDuplicate!469 (List!12543) Bool)

(assert (=> b!660437 (= res!428393 (noDuplicate!469 acc!681))))

(declare-fun b!660438 () Bool)

(declare-fun res!428391 () Bool)

(assert (=> b!660438 (=> (not res!428391) (not e!379527))))

(assert (=> b!660438 (= res!428391 (not (contains!3195 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660439 () Bool)

(assert (=> b!660439 (= e!379523 (not (contains!3195 acc!681 k0!2843)))))

(declare-fun b!660440 () Bool)

(declare-fun res!428388 () Bool)

(assert (=> b!660440 (=> (not res!428388) (not e!379527))))

(assert (=> b!660440 (= res!428388 e!379525)))

(declare-fun res!428392 () Bool)

(assert (=> b!660440 (=> res!428392 e!379525)))

(assert (=> b!660440 (= res!428392 e!379524)))

(declare-fun res!428390 () Bool)

(assert (=> b!660440 (=> (not res!428390) (not e!379524))))

(assert (=> b!660440 (= res!428390 (bvsgt from!3004 i!1382))))

(declare-fun b!660441 () Bool)

(assert (=> b!660441 (= e!379527 false)))

(declare-fun lt!308860 () Bool)

(declare-datatypes ((array!38811 0))(
  ( (array!38812 (arr!18595 (Array (_ BitVec 32) (_ BitVec 64))) (size!18959 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38811)

(declare-fun arrayNoDuplicates!0 (array!38811 (_ BitVec 32) List!12543) Bool)

(assert (=> b!660441 (= lt!308860 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12540))))

(declare-fun res!428394 () Bool)

(assert (=> start!59826 (=> (not res!428394) (not e!379527))))

(assert (=> start!59826 (= res!428394 (and (bvslt (size!18959 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18959 a!3626))))))

(assert (=> start!59826 e!379527))

(assert (=> start!59826 true))

(declare-fun array_inv!14454 (array!38811) Bool)

(assert (=> start!59826 (array_inv!14454 a!3626)))

(declare-fun b!660442 () Bool)

(declare-fun res!428389 () Bool)

(assert (=> b!660442 (=> (not res!428389) (not e!379527))))

(assert (=> b!660442 (= res!428389 (not (contains!3195 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!59826 res!428394) b!660437))

(assert (= (and b!660437 res!428393) b!660438))

(assert (= (and b!660438 res!428391) b!660442))

(assert (= (and b!660442 res!428389) b!660440))

(assert (= (and b!660440 res!428390) b!660435))

(assert (= (and b!660440 (not res!428392)) b!660436))

(assert (= (and b!660436 res!428395) b!660439))

(assert (= (and b!660440 res!428388) b!660441))

(declare-fun m!633703 () Bool)

(assert (=> b!660437 m!633703))

(declare-fun m!633705 () Bool)

(assert (=> b!660441 m!633705))

(declare-fun m!633707 () Bool)

(assert (=> b!660435 m!633707))

(declare-fun m!633709 () Bool)

(assert (=> b!660442 m!633709))

(declare-fun m!633711 () Bool)

(assert (=> start!59826 m!633711))

(assert (=> b!660439 m!633707))

(declare-fun m!633713 () Bool)

(assert (=> b!660438 m!633713))

(check-sat (not b!660441) (not b!660438) (not start!59826) (not b!660435) (not b!660439) (not b!660437) (not b!660442))
(check-sat)
