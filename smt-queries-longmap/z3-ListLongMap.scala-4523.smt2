; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62662 () Bool)

(assert start!62662)

(declare-fun b!706657 () Bool)

(declare-fun res!470377 () Bool)

(declare-fun e!398073 () Bool)

(assert (=> b!706657 (=> (not res!470377) (not e!398073))))

(declare-datatypes ((List!13242 0))(
  ( (Nil!13239) (Cons!13238 (h!14286 (_ BitVec 64)) (t!19516 List!13242)) )
))
(declare-fun newAcc!49 () List!13242)

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun acc!652 () List!13242)

(declare-fun -!326 (List!13242 (_ BitVec 64)) List!13242)

(assert (=> b!706657 (= res!470377 (= (-!326 newAcc!49 k0!2824) acc!652))))

(declare-fun b!706658 () Bool)

(declare-fun res!470376 () Bool)

(assert (=> b!706658 (=> (not res!470376) (not e!398073))))

(declare-fun contains!3894 (List!13242 (_ BitVec 64)) Bool)

(assert (=> b!706658 (= res!470376 (not (contains!3894 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706659 () Bool)

(declare-fun res!470378 () Bool)

(assert (=> b!706659 (=> (not res!470378) (not e!398073))))

(declare-fun subseq!362 (List!13242 List!13242) Bool)

(assert (=> b!706659 (= res!470378 (subseq!362 acc!652 newAcc!49))))

(declare-fun b!706660 () Bool)

(declare-fun res!470369 () Bool)

(assert (=> b!706660 (=> (not res!470369) (not e!398073))))

(declare-fun noDuplicate!1168 (List!13242) Bool)

(assert (=> b!706660 (= res!470369 (noDuplicate!1168 acc!652))))

(declare-fun b!706661 () Bool)

(declare-fun res!470374 () Bool)

(assert (=> b!706661 (=> (not res!470374) (not e!398073))))

(assert (=> b!706661 (= res!470374 (noDuplicate!1168 newAcc!49))))

(declare-fun b!706662 () Bool)

(declare-fun res!470370 () Bool)

(assert (=> b!706662 (=> (not res!470370) (not e!398073))))

(assert (=> b!706662 (= res!470370 (not (contains!3894 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706663 () Bool)

(assert (=> b!706663 (= e!398073 false)))

(declare-fun lt!318051 () Bool)

(assert (=> b!706663 (= lt!318051 (contains!3894 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!706664 () Bool)

(declare-fun res!470380 () Bool)

(assert (=> b!706664 (=> (not res!470380) (not e!398073))))

(declare-datatypes ((array!40281 0))(
  ( (array!40282 (arr!19294 (Array (_ BitVec 32) (_ BitVec 64))) (size!19677 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40281)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!40281 (_ BitVec 32) List!13242) Bool)

(assert (=> b!706664 (= res!470380 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!706666 () Bool)

(declare-fun res!470379 () Bool)

(assert (=> b!706666 (=> (not res!470379) (not e!398073))))

(assert (=> b!706666 (= res!470379 (not (contains!3894 acc!652 k0!2824)))))

(declare-fun b!706667 () Bool)

(declare-fun res!470373 () Bool)

(assert (=> b!706667 (=> (not res!470373) (not e!398073))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!706667 (= res!470373 (validKeyInArray!0 k0!2824))))

(declare-fun b!706668 () Bool)

(declare-fun res!470372 () Bool)

(assert (=> b!706668 (=> (not res!470372) (not e!398073))))

(declare-fun arrayContainsKey!0 (array!40281 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!706668 (= res!470372 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!706669 () Bool)

(declare-fun res!470375 () Bool)

(assert (=> b!706669 (=> (not res!470375) (not e!398073))))

(assert (=> b!706669 (= res!470375 (not (contains!3894 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706665 () Bool)

(declare-fun res!470371 () Bool)

(assert (=> b!706665 (=> (not res!470371) (not e!398073))))

(assert (=> b!706665 (= res!470371 (contains!3894 newAcc!49 k0!2824))))

(declare-fun res!470368 () Bool)

(assert (=> start!62662 (=> (not res!470368) (not e!398073))))

(assert (=> start!62662 (= res!470368 (and (bvslt (size!19677 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19677 a!3591))))))

(assert (=> start!62662 e!398073))

(assert (=> start!62662 true))

(declare-fun array_inv!15153 (array!40281) Bool)

(assert (=> start!62662 (array_inv!15153 a!3591)))

(assert (= (and start!62662 res!470368) b!706660))

(assert (= (and b!706660 res!470369) b!706661))

(assert (= (and b!706661 res!470374) b!706658))

(assert (= (and b!706658 res!470376) b!706669))

(assert (= (and b!706669 res!470375) b!706668))

(assert (= (and b!706668 res!470372) b!706666))

(assert (= (and b!706666 res!470379) b!706667))

(assert (= (and b!706667 res!470373) b!706664))

(assert (= (and b!706664 res!470380) b!706659))

(assert (= (and b!706659 res!470378) b!706665))

(assert (= (and b!706665 res!470371) b!706657))

(assert (= (and b!706657 res!470377) b!706662))

(assert (= (and b!706662 res!470370) b!706663))

(declare-fun m!664983 () Bool)

(assert (=> b!706657 m!664983))

(declare-fun m!664985 () Bool)

(assert (=> b!706666 m!664985))

(declare-fun m!664987 () Bool)

(assert (=> b!706661 m!664987))

(declare-fun m!664989 () Bool)

(assert (=> b!706669 m!664989))

(declare-fun m!664991 () Bool)

(assert (=> b!706665 m!664991))

(declare-fun m!664993 () Bool)

(assert (=> b!706660 m!664993))

(declare-fun m!664995 () Bool)

(assert (=> b!706663 m!664995))

(declare-fun m!664997 () Bool)

(assert (=> b!706668 m!664997))

(declare-fun m!664999 () Bool)

(assert (=> b!706664 m!664999))

(declare-fun m!665001 () Bool)

(assert (=> b!706659 m!665001))

(declare-fun m!665003 () Bool)

(assert (=> b!706658 m!665003))

(declare-fun m!665005 () Bool)

(assert (=> b!706667 m!665005))

(declare-fun m!665007 () Bool)

(assert (=> b!706662 m!665007))

(declare-fun m!665009 () Bool)

(assert (=> start!62662 m!665009))

(check-sat (not b!706658) (not b!706666) (not b!706661) (not start!62662) (not b!706669) (not b!706664) (not b!706660) (not b!706659) (not b!706665) (not b!706668) (not b!706662) (not b!706657) (not b!706663) (not b!706667))
(check-sat)
