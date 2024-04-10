; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62616 () Bool)

(assert start!62616)

(declare-fun b!706667 () Bool)

(declare-fun res!470488 () Bool)

(declare-fun e!397986 () Bool)

(assert (=> b!706667 (=> (not res!470488) (not e!397986))))

(declare-datatypes ((List!13345 0))(
  ( (Nil!13342) (Cons!13341 (h!14386 (_ BitVec 64)) (t!19627 List!13345)) )
))
(declare-fun newAcc!49 () List!13345)

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun contains!3922 (List!13345 (_ BitVec 64)) Bool)

(assert (=> b!706667 (= res!470488 (contains!3922 newAcc!49 k!2824))))

(declare-fun b!706668 () Bool)

(declare-fun res!470478 () Bool)

(assert (=> b!706668 (=> (not res!470478) (not e!397986))))

(declare-datatypes ((array!40295 0))(
  ( (array!40296 (arr!19304 (Array (_ BitVec 32) (_ BitVec 64))) (size!19689 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40295)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun acc!652 () List!13345)

(declare-fun arrayNoDuplicates!0 (array!40295 (_ BitVec 32) List!13345) Bool)

(assert (=> b!706668 (= res!470478 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!706669 () Bool)

(declare-fun res!470487 () Bool)

(assert (=> b!706669 (=> (not res!470487) (not e!397986))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!706669 (= res!470487 (validKeyInArray!0 k!2824))))

(declare-fun b!706670 () Bool)

(declare-fun res!470485 () Bool)

(assert (=> b!706670 (=> (not res!470485) (not e!397986))))

(assert (=> b!706670 (= res!470485 (not (contains!3922 acc!652 k!2824)))))

(declare-fun b!706671 () Bool)

(assert (=> b!706671 (= e!397986 (bvslt (bvsub (size!19689 a!3591) from!2969) #b00000000000000000000000000000000))))

(declare-fun b!706672 () Bool)

(declare-fun res!470479 () Bool)

(assert (=> b!706672 (=> (not res!470479) (not e!397986))))

(declare-fun -!332 (List!13345 (_ BitVec 64)) List!13345)

(assert (=> b!706672 (= res!470479 (= (-!332 newAcc!49 k!2824) acc!652))))

(declare-fun b!706673 () Bool)

(declare-fun res!470483 () Bool)

(assert (=> b!706673 (=> (not res!470483) (not e!397986))))

(assert (=> b!706673 (= res!470483 (not (contains!3922 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706674 () Bool)

(declare-fun res!470489 () Bool)

(assert (=> b!706674 (=> (not res!470489) (not e!397986))))

(declare-fun noDuplicate!1169 (List!13345) Bool)

(assert (=> b!706674 (= res!470489 (noDuplicate!1169 acc!652))))

(declare-fun b!706675 () Bool)

(declare-fun res!470482 () Bool)

(assert (=> b!706675 (=> (not res!470482) (not e!397986))))

(declare-fun arrayContainsKey!0 (array!40295 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!706675 (= res!470482 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!706676 () Bool)

(declare-fun res!470490 () Bool)

(assert (=> b!706676 (=> (not res!470490) (not e!397986))))

(assert (=> b!706676 (= res!470490 (noDuplicate!1169 newAcc!49))))

(declare-fun b!706677 () Bool)

(declare-fun res!470480 () Bool)

(assert (=> b!706677 (=> (not res!470480) (not e!397986))))

(assert (=> b!706677 (= res!470480 (not (contains!3922 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706679 () Bool)

(declare-fun res!470484 () Bool)

(assert (=> b!706679 (=> (not res!470484) (not e!397986))))

(assert (=> b!706679 (= res!470484 (not (contains!3922 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706680 () Bool)

(declare-fun res!470481 () Bool)

(assert (=> b!706680 (=> (not res!470481) (not e!397986))))

(assert (=> b!706680 (= res!470481 (not (contains!3922 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!470477 () Bool)

(assert (=> start!62616 (=> (not res!470477) (not e!397986))))

(assert (=> start!62616 (= res!470477 (and (bvslt (size!19689 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19689 a!3591))))))

(assert (=> start!62616 e!397986))

(assert (=> start!62616 true))

(declare-fun array_inv!15100 (array!40295) Bool)

(assert (=> start!62616 (array_inv!15100 a!3591)))

(declare-fun b!706678 () Bool)

(declare-fun res!470486 () Bool)

(assert (=> b!706678 (=> (not res!470486) (not e!397986))))

(declare-fun subseq!367 (List!13345 List!13345) Bool)

(assert (=> b!706678 (= res!470486 (subseq!367 acc!652 newAcc!49))))

(assert (= (and start!62616 res!470477) b!706674))

(assert (= (and b!706674 res!470489) b!706676))

(assert (= (and b!706676 res!470490) b!706677))

(assert (= (and b!706677 res!470480) b!706680))

(assert (= (and b!706680 res!470481) b!706675))

(assert (= (and b!706675 res!470482) b!706670))

(assert (= (and b!706670 res!470485) b!706669))

(assert (= (and b!706669 res!470487) b!706668))

(assert (= (and b!706668 res!470478) b!706678))

(assert (= (and b!706678 res!470486) b!706667))

(assert (= (and b!706667 res!470488) b!706672))

(assert (= (and b!706672 res!470479) b!706679))

(assert (= (and b!706679 res!470484) b!706673))

(assert (= (and b!706673 res!470483) b!706671))

(declare-fun m!664467 () Bool)

(assert (=> b!706679 m!664467))

(declare-fun m!664469 () Bool)

(assert (=> b!706672 m!664469))

(declare-fun m!664471 () Bool)

(assert (=> b!706673 m!664471))

(declare-fun m!664473 () Bool)

(assert (=> b!706676 m!664473))

(declare-fun m!664475 () Bool)

(assert (=> b!706680 m!664475))

(declare-fun m!664477 () Bool)

(assert (=> start!62616 m!664477))

(declare-fun m!664479 () Bool)

(assert (=> b!706674 m!664479))

(declare-fun m!664481 () Bool)

(assert (=> b!706669 m!664481))

(declare-fun m!664483 () Bool)

(assert (=> b!706675 m!664483))

(declare-fun m!664485 () Bool)

(assert (=> b!706678 m!664485))

(declare-fun m!664487 () Bool)

(assert (=> b!706677 m!664487))

(declare-fun m!664489 () Bool)

(assert (=> b!706668 m!664489))

(declare-fun m!664491 () Bool)

(assert (=> b!706667 m!664491))

(declare-fun m!664493 () Bool)

(assert (=> b!706670 m!664493))

(push 1)

(assert (not b!706675))

(assert (not start!62616))

(assert (not b!706672))

(assert (not b!706668))

(assert (not b!706669))

(assert (not b!706678))

(assert (not b!706679))

(assert (not b!706673))

(assert (not b!706674))

(assert (not b!706670))

(assert (not b!706676))

(assert (not b!706677))

(assert (not b!706680))

(assert (not b!706667))

(check-sat)

(pop 1)

(push 1)

(check-sat)

