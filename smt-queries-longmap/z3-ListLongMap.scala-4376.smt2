; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60272 () Bool)

(assert start!60272)

(declare-fun b!676058 () Bool)

(declare-fun res!442647 () Bool)

(declare-fun e!385562 () Bool)

(assert (=> b!676058 (=> (not res!442647) (not e!385562))))

(declare-fun e!385568 () Bool)

(assert (=> b!676058 (= res!442647 e!385568)))

(declare-fun res!442662 () Bool)

(assert (=> b!676058 (=> res!442662 e!385568)))

(declare-fun e!385566 () Bool)

(assert (=> b!676058 (= res!442662 e!385566)))

(declare-fun res!442651 () Bool)

(assert (=> b!676058 (=> (not res!442651) (not e!385566))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!676058 (= res!442651 (bvsgt from!3004 i!1382))))

(declare-fun b!676059 () Bool)

(declare-fun res!442659 () Bool)

(assert (=> b!676059 (=> (not res!442659) (not e!385562))))

(declare-datatypes ((array!39330 0))(
  ( (array!39331 (arr!18857 (Array (_ BitVec 32) (_ BitVec 64))) (size!19222 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39330)

(assert (=> b!676059 (= res!442659 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19222 a!3626))))))

(declare-fun b!676060 () Bool)

(declare-fun res!442648 () Bool)

(assert (=> b!676060 (=> (not res!442648) (not e!385562))))

(declare-datatypes ((List!12937 0))(
  ( (Nil!12934) (Cons!12933 (h!13978 (_ BitVec 64)) (t!19156 List!12937)) )
))
(declare-fun acc!681 () List!12937)

(declare-fun arrayNoDuplicates!0 (array!39330 (_ BitVec 32) List!12937) Bool)

(assert (=> b!676060 (= res!442648 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!676061 () Bool)

(declare-fun res!442650 () Bool)

(assert (=> b!676061 (=> (not res!442650) (not e!385562))))

(assert (=> b!676061 (= res!442650 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19222 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!676062 () Bool)

(declare-fun res!442645 () Bool)

(assert (=> b!676062 (=> (not res!442645) (not e!385562))))

(declare-fun e!385563 () Bool)

(assert (=> b!676062 (= res!442645 e!385563)))

(declare-fun res!442649 () Bool)

(assert (=> b!676062 (=> res!442649 e!385563)))

(declare-fun e!385567 () Bool)

(assert (=> b!676062 (= res!442649 e!385567)))

(declare-fun res!442658 () Bool)

(assert (=> b!676062 (=> (not res!442658) (not e!385567))))

(assert (=> b!676062 (= res!442658 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!676063 () Bool)

(declare-fun e!385561 () Bool)

(assert (=> b!676063 (= e!385568 e!385561)))

(declare-fun res!442657 () Bool)

(assert (=> b!676063 (=> (not res!442657) (not e!385561))))

(assert (=> b!676063 (= res!442657 (bvsle from!3004 i!1382))))

(declare-fun b!676064 () Bool)

(declare-fun res!442656 () Bool)

(assert (=> b!676064 (=> (not res!442656) (not e!385562))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!676064 (= res!442656 (not (validKeyInArray!0 (select (arr!18857 a!3626) from!3004))))))

(declare-fun b!676065 () Bool)

(declare-fun e!385565 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3459 (List!12937 (_ BitVec 64)) Bool)

(assert (=> b!676065 (= e!385565 (not (contains!3459 acc!681 k0!2843)))))

(declare-fun res!442654 () Bool)

(assert (=> start!60272 (=> (not res!442654) (not e!385562))))

(assert (=> start!60272 (= res!442654 (and (bvslt (size!19222 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19222 a!3626))))))

(assert (=> start!60272 e!385562))

(assert (=> start!60272 true))

(declare-fun array_inv!14740 (array!39330) Bool)

(assert (=> start!60272 (array_inv!14740 a!3626)))

(declare-fun b!676066 () Bool)

(assert (=> b!676066 (= e!385567 (contains!3459 acc!681 k0!2843))))

(declare-fun b!676067 () Bool)

(assert (=> b!676067 (= e!385562 false)))

(declare-fun lt!312516 () Bool)

(assert (=> b!676067 (= lt!312516 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!676068 () Bool)

(declare-fun res!442653 () Bool)

(assert (=> b!676068 (=> (not res!442653) (not e!385562))))

(assert (=> b!676068 (= res!442653 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!676069 () Bool)

(declare-fun res!442644 () Bool)

(assert (=> b!676069 (=> (not res!442644) (not e!385562))))

(assert (=> b!676069 (= res!442644 (not (contains!3459 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!676070 () Bool)

(declare-fun res!442655 () Bool)

(assert (=> b!676070 (=> (not res!442655) (not e!385562))))

(assert (=> b!676070 (= res!442655 (not (contains!3459 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!676071 () Bool)

(assert (=> b!676071 (= e!385563 e!385565)))

(declare-fun res!442661 () Bool)

(assert (=> b!676071 (=> (not res!442661) (not e!385565))))

(assert (=> b!676071 (= res!442661 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!676072 () Bool)

(declare-fun res!442660 () Bool)

(assert (=> b!676072 (=> (not res!442660) (not e!385562))))

(declare-fun arrayContainsKey!0 (array!39330 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!676072 (= res!442660 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!676073 () Bool)

(assert (=> b!676073 (= e!385566 (contains!3459 acc!681 k0!2843))))

(declare-fun b!676074 () Bool)

(declare-fun res!442646 () Bool)

(assert (=> b!676074 (=> (not res!442646) (not e!385562))))

(declare-fun noDuplicate!728 (List!12937) Bool)

(assert (=> b!676074 (= res!442646 (noDuplicate!728 acc!681))))

(declare-fun b!676075 () Bool)

(declare-fun res!442663 () Bool)

(assert (=> b!676075 (=> (not res!442663) (not e!385562))))

(assert (=> b!676075 (= res!442663 (validKeyInArray!0 k0!2843))))

(declare-fun b!676076 () Bool)

(declare-fun res!442652 () Bool)

(assert (=> b!676076 (=> (not res!442652) (not e!385562))))

(assert (=> b!676076 (= res!442652 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12934))))

(declare-fun b!676077 () Bool)

(assert (=> b!676077 (= e!385561 (not (contains!3459 acc!681 k0!2843)))))

(assert (= (and start!60272 res!442654) b!676074))

(assert (= (and b!676074 res!442646) b!676070))

(assert (= (and b!676070 res!442655) b!676069))

(assert (= (and b!676069 res!442644) b!676058))

(assert (= (and b!676058 res!442651) b!676073))

(assert (= (and b!676058 (not res!442662)) b!676063))

(assert (= (and b!676063 res!442657) b!676077))

(assert (= (and b!676058 res!442647) b!676076))

(assert (= (and b!676076 res!442652) b!676060))

(assert (= (and b!676060 res!442648) b!676059))

(assert (= (and b!676059 res!442659) b!676075))

(assert (= (and b!676075 res!442663) b!676072))

(assert (= (and b!676072 res!442660) b!676061))

(assert (= (and b!676061 res!442650) b!676064))

(assert (= (and b!676064 res!442656) b!676068))

(assert (= (and b!676068 res!442653) b!676062))

(assert (= (and b!676062 res!442658) b!676066))

(assert (= (and b!676062 (not res!442649)) b!676071))

(assert (= (and b!676071 res!442661) b!676065))

(assert (= (and b!676062 res!442645) b!676067))

(declare-fun m!642477 () Bool)

(assert (=> b!676067 m!642477))

(declare-fun m!642479 () Bool)

(assert (=> b!676060 m!642479))

(declare-fun m!642481 () Bool)

(assert (=> b!676070 m!642481))

(declare-fun m!642483 () Bool)

(assert (=> b!676065 m!642483))

(assert (=> b!676073 m!642483))

(declare-fun m!642485 () Bool)

(assert (=> b!676076 m!642485))

(assert (=> b!676077 m!642483))

(declare-fun m!642487 () Bool)

(assert (=> b!676074 m!642487))

(declare-fun m!642489 () Bool)

(assert (=> b!676064 m!642489))

(assert (=> b!676064 m!642489))

(declare-fun m!642491 () Bool)

(assert (=> b!676064 m!642491))

(declare-fun m!642493 () Bool)

(assert (=> start!60272 m!642493))

(declare-fun m!642495 () Bool)

(assert (=> b!676069 m!642495))

(assert (=> b!676066 m!642483))

(declare-fun m!642497 () Bool)

(assert (=> b!676075 m!642497))

(declare-fun m!642499 () Bool)

(assert (=> b!676072 m!642499))

(check-sat (not b!676065) (not b!676074) (not b!676077) (not b!676066) (not start!60272) (not b!676075) (not b!676070) (not b!676073) (not b!676064) (not b!676069) (not b!676060) (not b!676072) (not b!676067) (not b!676076))
(check-sat)
