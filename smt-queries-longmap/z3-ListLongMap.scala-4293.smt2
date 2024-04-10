; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59788 () Bool)

(assert start!59788)

(declare-fun b!660480 () Bool)

(declare-fun res!428544 () Bool)

(declare-fun e!379533 () Bool)

(assert (=> b!660480 (=> (not res!428544) (not e!379533))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!660480 (= res!428544 (validKeyInArray!0 k0!2843))))

(declare-fun b!660481 () Bool)

(declare-fun e!379534 () Bool)

(declare-datatypes ((List!12651 0))(
  ( (Nil!12648) (Cons!12647 (h!13692 (_ BitVec 64)) (t!18879 List!12651)) )
))
(declare-fun acc!681 () List!12651)

(declare-fun contains!3228 (List!12651 (_ BitVec 64)) Bool)

(assert (=> b!660481 (= e!379534 (not (contains!3228 acc!681 k0!2843)))))

(declare-fun b!660482 () Bool)

(declare-fun res!428553 () Bool)

(assert (=> b!660482 (=> (not res!428553) (not e!379533))))

(assert (=> b!660482 (= res!428553 (not (contains!3228 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660484 () Bool)

(declare-fun res!428547 () Bool)

(assert (=> b!660484 (=> (not res!428547) (not e!379533))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!38835 0))(
  ( (array!38836 (arr!18610 (Array (_ BitVec 32) (_ BitVec 64))) (size!18974 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38835)

(assert (=> b!660484 (= res!428547 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!18974 a!3626))))))

(declare-fun b!660485 () Bool)

(declare-fun e!379536 () Bool)

(assert (=> b!660485 (= e!379536 e!379534)))

(declare-fun res!428548 () Bool)

(assert (=> b!660485 (=> (not res!428548) (not e!379534))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!660485 (= res!428548 (bvsle from!3004 i!1382))))

(declare-fun b!660486 () Bool)

(declare-fun res!428554 () Bool)

(assert (=> b!660486 (=> (not res!428554) (not e!379533))))

(declare-fun arrayNoDuplicates!0 (array!38835 (_ BitVec 32) List!12651) Bool)

(assert (=> b!660486 (= res!428554 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!660487 () Bool)

(assert (=> b!660487 (= e!379533 (bvsge #b00000000000000000000000000000000 (size!18974 a!3626)))))

(declare-fun b!660488 () Bool)

(declare-fun res!428551 () Bool)

(assert (=> b!660488 (=> (not res!428551) (not e!379533))))

(assert (=> b!660488 (= res!428551 e!379536)))

(declare-fun res!428552 () Bool)

(assert (=> b!660488 (=> res!428552 e!379536)))

(declare-fun e!379532 () Bool)

(assert (=> b!660488 (= res!428552 e!379532)))

(declare-fun res!428550 () Bool)

(assert (=> b!660488 (=> (not res!428550) (not e!379532))))

(assert (=> b!660488 (= res!428550 (bvsgt from!3004 i!1382))))

(declare-fun b!660489 () Bool)

(declare-fun res!428546 () Bool)

(assert (=> b!660489 (=> (not res!428546) (not e!379533))))

(assert (=> b!660489 (= res!428546 (not (contains!3228 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660490 () Bool)

(declare-fun res!428545 () Bool)

(assert (=> b!660490 (=> (not res!428545) (not e!379533))))

(assert (=> b!660490 (= res!428545 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12648))))

(declare-fun b!660491 () Bool)

(assert (=> b!660491 (= e!379532 (contains!3228 acc!681 k0!2843))))

(declare-fun b!660483 () Bool)

(declare-fun res!428549 () Bool)

(assert (=> b!660483 (=> (not res!428549) (not e!379533))))

(declare-fun noDuplicate!475 (List!12651) Bool)

(assert (=> b!660483 (= res!428549 (noDuplicate!475 acc!681))))

(declare-fun res!428555 () Bool)

(assert (=> start!59788 (=> (not res!428555) (not e!379533))))

(assert (=> start!59788 (= res!428555 (and (bvslt (size!18974 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18974 a!3626))))))

(assert (=> start!59788 e!379533))

(assert (=> start!59788 true))

(declare-fun array_inv!14406 (array!38835) Bool)

(assert (=> start!59788 (array_inv!14406 a!3626)))

(assert (= (and start!59788 res!428555) b!660483))

(assert (= (and b!660483 res!428549) b!660482))

(assert (= (and b!660482 res!428553) b!660489))

(assert (= (and b!660489 res!428546) b!660488))

(assert (= (and b!660488 res!428550) b!660491))

(assert (= (and b!660488 (not res!428552)) b!660485))

(assert (= (and b!660485 res!428548) b!660481))

(assert (= (and b!660488 res!428551) b!660490))

(assert (= (and b!660490 res!428545) b!660486))

(assert (= (and b!660486 res!428554) b!660484))

(assert (= (and b!660484 res!428547) b!660480))

(assert (= (and b!660480 res!428544) b!660487))

(declare-fun m!633135 () Bool)

(assert (=> start!59788 m!633135))

(declare-fun m!633137 () Bool)

(assert (=> b!660491 m!633137))

(declare-fun m!633139 () Bool)

(assert (=> b!660486 m!633139))

(declare-fun m!633141 () Bool)

(assert (=> b!660483 m!633141))

(declare-fun m!633143 () Bool)

(assert (=> b!660490 m!633143))

(assert (=> b!660481 m!633137))

(declare-fun m!633145 () Bool)

(assert (=> b!660482 m!633145))

(declare-fun m!633147 () Bool)

(assert (=> b!660489 m!633147))

(declare-fun m!633149 () Bool)

(assert (=> b!660480 m!633149))

(check-sat (not b!660481) (not b!660491) (not b!660482) (not b!660486) (not b!660489) (not b!660480) (not start!59788) (not b!660483) (not b!660490))
(check-sat)
