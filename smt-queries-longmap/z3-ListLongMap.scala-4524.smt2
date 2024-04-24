; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62668 () Bool)

(assert start!62668)

(declare-fun res!470487 () Bool)

(declare-fun e!398091 () Bool)

(assert (=> start!62668 (=> (not res!470487) (not e!398091))))

(declare-datatypes ((array!40287 0))(
  ( (array!40288 (arr!19297 (Array (_ BitVec 32) (_ BitVec 64))) (size!19680 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40287)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!62668 (= res!470487 (and (bvslt (size!19680 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19680 a!3591))))))

(assert (=> start!62668 e!398091))

(assert (=> start!62668 true))

(declare-fun array_inv!15156 (array!40287) Bool)

(assert (=> start!62668 (array_inv!15156 a!3591)))

(declare-fun b!706776 () Bool)

(declare-fun res!470488 () Bool)

(assert (=> b!706776 (=> (not res!470488) (not e!398091))))

(declare-datatypes ((List!13245 0))(
  ( (Nil!13242) (Cons!13241 (h!14289 (_ BitVec 64)) (t!19519 List!13245)) )
))
(declare-fun acc!652 () List!13245)

(declare-fun newAcc!49 () List!13245)

(declare-fun subseq!365 (List!13245 List!13245) Bool)

(assert (=> b!706776 (= res!470488 (subseq!365 acc!652 newAcc!49))))

(declare-fun b!706777 () Bool)

(declare-fun res!470493 () Bool)

(assert (=> b!706777 (=> (not res!470493) (not e!398091))))

(declare-fun contains!3897 (List!13245 (_ BitVec 64)) Bool)

(assert (=> b!706777 (= res!470493 (not (contains!3897 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706778 () Bool)

(declare-fun res!470499 () Bool)

(assert (=> b!706778 (=> (not res!470499) (not e!398091))))

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!706778 (= res!470499 (validKeyInArray!0 k0!2824))))

(declare-fun b!706779 () Bool)

(declare-fun res!470494 () Bool)

(assert (=> b!706779 (=> (not res!470494) (not e!398091))))

(assert (=> b!706779 (= res!470494 (not (contains!3897 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706780 () Bool)

(assert (=> b!706780 (= e!398091 (bvslt (bvsub (size!19680 a!3591) from!2969) #b00000000000000000000000000000000))))

(declare-fun b!706781 () Bool)

(declare-fun res!470500 () Bool)

(assert (=> b!706781 (=> (not res!470500) (not e!398091))))

(assert (=> b!706781 (= res!470500 (not (contains!3897 acc!652 k0!2824)))))

(declare-fun b!706782 () Bool)

(declare-fun res!470498 () Bool)

(assert (=> b!706782 (=> (not res!470498) (not e!398091))))

(assert (=> b!706782 (= res!470498 (not (contains!3897 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706783 () Bool)

(declare-fun res!470492 () Bool)

(assert (=> b!706783 (=> (not res!470492) (not e!398091))))

(declare-fun arrayNoDuplicates!0 (array!40287 (_ BitVec 32) List!13245) Bool)

(assert (=> b!706783 (= res!470492 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!706784 () Bool)

(declare-fun res!470495 () Bool)

(assert (=> b!706784 (=> (not res!470495) (not e!398091))))

(declare-fun -!329 (List!13245 (_ BitVec 64)) List!13245)

(assert (=> b!706784 (= res!470495 (= (-!329 newAcc!49 k0!2824) acc!652))))

(declare-fun b!706785 () Bool)

(declare-fun res!470489 () Bool)

(assert (=> b!706785 (=> (not res!470489) (not e!398091))))

(assert (=> b!706785 (= res!470489 (not (contains!3897 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706786 () Bool)

(declare-fun res!470497 () Bool)

(assert (=> b!706786 (=> (not res!470497) (not e!398091))))

(declare-fun noDuplicate!1171 (List!13245) Bool)

(assert (=> b!706786 (= res!470497 (noDuplicate!1171 acc!652))))

(declare-fun b!706787 () Bool)

(declare-fun res!470491 () Bool)

(assert (=> b!706787 (=> (not res!470491) (not e!398091))))

(assert (=> b!706787 (= res!470491 (noDuplicate!1171 newAcc!49))))

(declare-fun b!706788 () Bool)

(declare-fun res!470496 () Bool)

(assert (=> b!706788 (=> (not res!470496) (not e!398091))))

(declare-fun arrayContainsKey!0 (array!40287 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!706788 (= res!470496 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!706789 () Bool)

(declare-fun res!470490 () Bool)

(assert (=> b!706789 (=> (not res!470490) (not e!398091))))

(assert (=> b!706789 (= res!470490 (contains!3897 newAcc!49 k0!2824))))

(assert (= (and start!62668 res!470487) b!706786))

(assert (= (and b!706786 res!470497) b!706787))

(assert (= (and b!706787 res!470491) b!706777))

(assert (= (and b!706777 res!470493) b!706779))

(assert (= (and b!706779 res!470494) b!706788))

(assert (= (and b!706788 res!470496) b!706781))

(assert (= (and b!706781 res!470500) b!706778))

(assert (= (and b!706778 res!470499) b!706783))

(assert (= (and b!706783 res!470492) b!706776))

(assert (= (and b!706776 res!470488) b!706789))

(assert (= (and b!706789 res!470490) b!706784))

(assert (= (and b!706784 res!470495) b!706782))

(assert (= (and b!706782 res!470498) b!706785))

(assert (= (and b!706785 res!470489) b!706780))

(declare-fun m!665067 () Bool)

(assert (=> b!706787 m!665067))

(declare-fun m!665069 () Bool)

(assert (=> b!706789 m!665069))

(declare-fun m!665071 () Bool)

(assert (=> b!706783 m!665071))

(declare-fun m!665073 () Bool)

(assert (=> b!706784 m!665073))

(declare-fun m!665075 () Bool)

(assert (=> b!706779 m!665075))

(declare-fun m!665077 () Bool)

(assert (=> b!706781 m!665077))

(declare-fun m!665079 () Bool)

(assert (=> b!706788 m!665079))

(declare-fun m!665081 () Bool)

(assert (=> b!706785 m!665081))

(declare-fun m!665083 () Bool)

(assert (=> b!706786 m!665083))

(declare-fun m!665085 () Bool)

(assert (=> start!62668 m!665085))

(declare-fun m!665087 () Bool)

(assert (=> b!706778 m!665087))

(declare-fun m!665089 () Bool)

(assert (=> b!706782 m!665089))

(declare-fun m!665091 () Bool)

(assert (=> b!706777 m!665091))

(declare-fun m!665093 () Bool)

(assert (=> b!706776 m!665093))

(check-sat (not b!706781) (not b!706785) (not b!706776) (not start!62668) (not b!706784) (not b!706782) (not b!706778) (not b!706786) (not b!706789) (not b!706777) (not b!706788) (not b!706779) (not b!706783) (not b!706787))
(check-sat)
