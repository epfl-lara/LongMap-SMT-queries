; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59856 () Bool)

(assert start!59856)

(declare-fun b!660851 () Bool)

(declare-fun res!428810 () Bool)

(declare-fun e!379750 () Bool)

(assert (=> b!660851 (=> (not res!428810) (not e!379750))))

(declare-datatypes ((List!12558 0))(
  ( (Nil!12555) (Cons!12554 (h!13602 (_ BitVec 64)) (t!18778 List!12558)) )
))
(declare-fun acc!681 () List!12558)

(declare-fun noDuplicate!484 (List!12558) Bool)

(assert (=> b!660851 (= res!428810 (noDuplicate!484 acc!681))))

(declare-fun b!660852 () Bool)

(assert (=> b!660852 (= e!379750 false)))

(declare-datatypes ((array!38841 0))(
  ( (array!38842 (arr!18610 (Array (_ BitVec 32) (_ BitVec 64))) (size!18974 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38841)

(declare-fun lt!308896 () Bool)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!38841 (_ BitVec 32) List!12558) Bool)

(assert (=> b!660852 (= lt!308896 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!660853 () Bool)

(declare-fun res!428807 () Bool)

(assert (=> b!660853 (=> (not res!428807) (not e!379750))))

(declare-fun contains!3210 (List!12558 (_ BitVec 64)) Bool)

(assert (=> b!660853 (= res!428807 (not (contains!3210 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!428804 () Bool)

(assert (=> start!59856 (=> (not res!428804) (not e!379750))))

(assert (=> start!59856 (= res!428804 (and (bvslt (size!18974 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18974 a!3626))))))

(assert (=> start!59856 e!379750))

(assert (=> start!59856 true))

(declare-fun array_inv!14469 (array!38841) Bool)

(assert (=> start!59856 (array_inv!14469 a!3626)))

(declare-fun b!660854 () Bool)

(declare-fun res!428809 () Bool)

(assert (=> b!660854 (=> (not res!428809) (not e!379750))))

(assert (=> b!660854 (= res!428809 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12555))))

(declare-fun b!660855 () Bool)

(declare-fun e!379752 () Bool)

(declare-fun e!379749 () Bool)

(assert (=> b!660855 (= e!379752 e!379749)))

(declare-fun res!428806 () Bool)

(assert (=> b!660855 (=> (not res!428806) (not e!379749))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!660855 (= res!428806 (bvsle from!3004 i!1382))))

(declare-fun b!660856 () Bool)

(declare-fun e!379751 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(assert (=> b!660856 (= e!379751 (contains!3210 acc!681 k0!2843))))

(declare-fun b!660857 () Bool)

(declare-fun res!428805 () Bool)

(assert (=> b!660857 (=> (not res!428805) (not e!379750))))

(assert (=> b!660857 (= res!428805 (not (contains!3210 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660858 () Bool)

(assert (=> b!660858 (= e!379749 (not (contains!3210 acc!681 k0!2843)))))

(declare-fun b!660859 () Bool)

(declare-fun res!428808 () Bool)

(assert (=> b!660859 (=> (not res!428808) (not e!379750))))

(assert (=> b!660859 (= res!428808 e!379752)))

(declare-fun res!428812 () Bool)

(assert (=> b!660859 (=> res!428812 e!379752)))

(assert (=> b!660859 (= res!428812 e!379751)))

(declare-fun res!428811 () Bool)

(assert (=> b!660859 (=> (not res!428811) (not e!379751))))

(assert (=> b!660859 (= res!428811 (bvsgt from!3004 i!1382))))

(assert (= (and start!59856 res!428804) b!660851))

(assert (= (and b!660851 res!428810) b!660853))

(assert (= (and b!660853 res!428807) b!660857))

(assert (= (and b!660857 res!428805) b!660859))

(assert (= (and b!660859 res!428811) b!660856))

(assert (= (and b!660859 (not res!428812)) b!660855))

(assert (= (and b!660855 res!428806) b!660858))

(assert (= (and b!660859 res!428808) b!660854))

(assert (= (and b!660854 res!428809) b!660852))

(declare-fun m!633907 () Bool)

(assert (=> b!660853 m!633907))

(declare-fun m!633909 () Bool)

(assert (=> start!59856 m!633909))

(declare-fun m!633911 () Bool)

(assert (=> b!660852 m!633911))

(declare-fun m!633913 () Bool)

(assert (=> b!660854 m!633913))

(declare-fun m!633915 () Bool)

(assert (=> b!660851 m!633915))

(declare-fun m!633917 () Bool)

(assert (=> b!660856 m!633917))

(declare-fun m!633919 () Bool)

(assert (=> b!660857 m!633919))

(assert (=> b!660858 m!633917))

(check-sat (not start!59856) (not b!660851) (not b!660852) (not b!660853) (not b!660856) (not b!660857) (not b!660858) (not b!660854))
(check-sat)
