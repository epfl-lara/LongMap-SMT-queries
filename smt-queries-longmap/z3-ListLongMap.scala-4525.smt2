; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62620 () Bool)

(assert start!62620)

(declare-fun b!706746 () Bool)

(declare-fun res!470556 () Bool)

(declare-fun e!397998 () Bool)

(assert (=> b!706746 (=> (not res!470556) (not e!397998))))

(declare-datatypes ((array!40299 0))(
  ( (array!40300 (arr!19306 (Array (_ BitVec 32) (_ BitVec 64))) (size!19691 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40299)

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!40299 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!706746 (= res!470556 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!706747 () Bool)

(declare-fun res!470564 () Bool)

(assert (=> b!706747 (=> (not res!470564) (not e!397998))))

(declare-datatypes ((List!13347 0))(
  ( (Nil!13344) (Cons!13343 (h!14388 (_ BitVec 64)) (t!19629 List!13347)) )
))
(declare-fun acc!652 () List!13347)

(declare-fun contains!3924 (List!13347 (_ BitVec 64)) Bool)

(assert (=> b!706747 (= res!470564 (not (contains!3924 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706748 () Bool)

(declare-fun res!470557 () Bool)

(assert (=> b!706748 (=> (not res!470557) (not e!397998))))

(declare-fun noDuplicate!1171 (List!13347) Bool)

(assert (=> b!706748 (= res!470557 (noDuplicate!1171 acc!652))))

(declare-fun b!706749 () Bool)

(declare-fun res!470560 () Bool)

(assert (=> b!706749 (=> (not res!470560) (not e!397998))))

(assert (=> b!706749 (= res!470560 (not (contains!3924 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706750 () Bool)

(declare-fun res!470568 () Bool)

(assert (=> b!706750 (=> (not res!470568) (not e!397998))))

(assert (=> b!706750 (= res!470568 (not (contains!3924 acc!652 k0!2824)))))

(declare-fun b!706751 () Bool)

(declare-fun res!470565 () Bool)

(assert (=> b!706751 (=> (not res!470565) (not e!397998))))

(declare-fun newAcc!49 () List!13347)

(assert (=> b!706751 (= res!470565 (not (contains!3924 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706752 () Bool)

(declare-fun res!470566 () Bool)

(assert (=> b!706752 (=> (not res!470566) (not e!397998))))

(assert (=> b!706752 (= res!470566 (contains!3924 newAcc!49 k0!2824))))

(declare-fun b!706753 () Bool)

(declare-fun res!470562 () Bool)

(assert (=> b!706753 (=> (not res!470562) (not e!397998))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!706753 (= res!470562 (validKeyInArray!0 k0!2824))))

(declare-fun res!470559 () Bool)

(assert (=> start!62620 (=> (not res!470559) (not e!397998))))

(assert (=> start!62620 (= res!470559 (and (bvslt (size!19691 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19691 a!3591))))))

(assert (=> start!62620 e!397998))

(assert (=> start!62620 true))

(declare-fun array_inv!15102 (array!40299) Bool)

(assert (=> start!62620 (array_inv!15102 a!3591)))

(declare-fun b!706754 () Bool)

(declare-fun res!470558 () Bool)

(assert (=> b!706754 (=> (not res!470558) (not e!397998))))

(declare-fun -!334 (List!13347 (_ BitVec 64)) List!13347)

(assert (=> b!706754 (= res!470558 (= (-!334 newAcc!49 k0!2824) acc!652))))

(declare-fun b!706755 () Bool)

(declare-fun res!470563 () Bool)

(assert (=> b!706755 (=> (not res!470563) (not e!397998))))

(declare-fun arrayNoDuplicates!0 (array!40299 (_ BitVec 32) List!13347) Bool)

(assert (=> b!706755 (= res!470563 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!706756 () Bool)

(assert (=> b!706756 (= e!397998 false)))

(declare-fun lt!317964 () Bool)

(assert (=> b!706756 (= lt!317964 (contains!3924 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!706757 () Bool)

(declare-fun res!470567 () Bool)

(assert (=> b!706757 (=> (not res!470567) (not e!397998))))

(declare-fun subseq!369 (List!13347 List!13347) Bool)

(assert (=> b!706757 (= res!470567 (subseq!369 acc!652 newAcc!49))))

(declare-fun b!706758 () Bool)

(declare-fun res!470561 () Bool)

(assert (=> b!706758 (=> (not res!470561) (not e!397998))))

(assert (=> b!706758 (= res!470561 (noDuplicate!1171 newAcc!49))))

(assert (= (and start!62620 res!470559) b!706748))

(assert (= (and b!706748 res!470557) b!706758))

(assert (= (and b!706758 res!470561) b!706749))

(assert (= (and b!706749 res!470560) b!706747))

(assert (= (and b!706747 res!470564) b!706746))

(assert (= (and b!706746 res!470556) b!706750))

(assert (= (and b!706750 res!470568) b!706753))

(assert (= (and b!706753 res!470562) b!706755))

(assert (= (and b!706755 res!470563) b!706757))

(assert (= (and b!706757 res!470567) b!706752))

(assert (= (and b!706752 res!470566) b!706754))

(assert (= (and b!706754 res!470558) b!706751))

(assert (= (and b!706751 res!470565) b!706756))

(declare-fun m!664523 () Bool)

(assert (=> b!706749 m!664523))

(declare-fun m!664525 () Bool)

(assert (=> b!706750 m!664525))

(declare-fun m!664527 () Bool)

(assert (=> b!706754 m!664527))

(declare-fun m!664529 () Bool)

(assert (=> b!706747 m!664529))

(declare-fun m!664531 () Bool)

(assert (=> b!706752 m!664531))

(declare-fun m!664533 () Bool)

(assert (=> b!706758 m!664533))

(declare-fun m!664535 () Bool)

(assert (=> b!706755 m!664535))

(declare-fun m!664537 () Bool)

(assert (=> b!706757 m!664537))

(declare-fun m!664539 () Bool)

(assert (=> start!62620 m!664539))

(declare-fun m!664541 () Bool)

(assert (=> b!706753 m!664541))

(declare-fun m!664543 () Bool)

(assert (=> b!706746 m!664543))

(declare-fun m!664545 () Bool)

(assert (=> b!706748 m!664545))

(declare-fun m!664547 () Bool)

(assert (=> b!706751 m!664547))

(declare-fun m!664549 () Bool)

(assert (=> b!706756 m!664549))

(check-sat (not b!706750) (not b!706754) (not b!706751) (not b!706747) (not b!706749) (not b!706757) (not b!706746) (not b!706756) (not b!706755) (not start!62620) (not b!706752) (not b!706748) (not b!706753) (not b!706758))
(check-sat)
