; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62630 () Bool)

(assert start!62630)

(declare-fun b!706941 () Bool)

(declare-fun res!470757 () Bool)

(declare-fun e!398028 () Bool)

(assert (=> b!706941 (=> (not res!470757) (not e!398028))))

(declare-datatypes ((List!13352 0))(
  ( (Nil!13349) (Cons!13348 (h!14393 (_ BitVec 64)) (t!19634 List!13352)) )
))
(declare-fun acc!652 () List!13352)

(declare-fun contains!3929 (List!13352 (_ BitVec 64)) Bool)

(assert (=> b!706941 (= res!470757 (not (contains!3929 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706942 () Bool)

(declare-fun res!470752 () Bool)

(assert (=> b!706942 (=> (not res!470752) (not e!398028))))

(declare-datatypes ((array!40309 0))(
  ( (array!40310 (arr!19311 (Array (_ BitVec 32) (_ BitVec 64))) (size!19696 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40309)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!40309 (_ BitVec 32) List!13352) Bool)

(assert (=> b!706942 (= res!470752 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!706943 () Bool)

(declare-fun res!470754 () Bool)

(assert (=> b!706943 (=> (not res!470754) (not e!398028))))

(declare-fun newAcc!49 () List!13352)

(declare-fun k!2824 () (_ BitVec 64))

(assert (=> b!706943 (= res!470754 (contains!3929 newAcc!49 k!2824))))

(declare-fun b!706944 () Bool)

(declare-fun res!470762 () Bool)

(assert (=> b!706944 (=> (not res!470762) (not e!398028))))

(declare-fun -!339 (List!13352 (_ BitVec 64)) List!13352)

(assert (=> b!706944 (= res!470762 (= (-!339 newAcc!49 k!2824) acc!652))))

(declare-fun b!706945 () Bool)

(assert (=> b!706945 (= e!398028 false)))

(declare-fun lt!317979 () Bool)

(assert (=> b!706945 (= lt!317979 (contains!3929 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!706946 () Bool)

(declare-fun res!470751 () Bool)

(assert (=> b!706946 (=> (not res!470751) (not e!398028))))

(declare-fun noDuplicate!1176 (List!13352) Bool)

(assert (=> b!706946 (= res!470751 (noDuplicate!1176 acc!652))))

(declare-fun b!706948 () Bool)

(declare-fun res!470759 () Bool)

(assert (=> b!706948 (=> (not res!470759) (not e!398028))))

(declare-fun arrayContainsKey!0 (array!40309 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!706948 (= res!470759 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!706949 () Bool)

(declare-fun res!470763 () Bool)

(assert (=> b!706949 (=> (not res!470763) (not e!398028))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!706949 (= res!470763 (validKeyInArray!0 k!2824))))

(declare-fun b!706950 () Bool)

(declare-fun res!470753 () Bool)

(assert (=> b!706950 (=> (not res!470753) (not e!398028))))

(assert (=> b!706950 (= res!470753 (noDuplicate!1176 newAcc!49))))

(declare-fun b!706951 () Bool)

(declare-fun res!470758 () Bool)

(assert (=> b!706951 (=> (not res!470758) (not e!398028))))

(declare-fun subseq!374 (List!13352 List!13352) Bool)

(assert (=> b!706951 (= res!470758 (subseq!374 acc!652 newAcc!49))))

(declare-fun b!706952 () Bool)

(declare-fun res!470760 () Bool)

(assert (=> b!706952 (=> (not res!470760) (not e!398028))))

(assert (=> b!706952 (= res!470760 (not (contains!3929 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706953 () Bool)

(declare-fun res!470755 () Bool)

(assert (=> b!706953 (=> (not res!470755) (not e!398028))))

(assert (=> b!706953 (= res!470755 (not (contains!3929 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706947 () Bool)

(declare-fun res!470761 () Bool)

(assert (=> b!706947 (=> (not res!470761) (not e!398028))))

(assert (=> b!706947 (= res!470761 (not (contains!3929 acc!652 k!2824)))))

(declare-fun res!470756 () Bool)

(assert (=> start!62630 (=> (not res!470756) (not e!398028))))

(assert (=> start!62630 (= res!470756 (and (bvslt (size!19696 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19696 a!3591))))))

(assert (=> start!62630 e!398028))

(assert (=> start!62630 true))

(declare-fun array_inv!15107 (array!40309) Bool)

(assert (=> start!62630 (array_inv!15107 a!3591)))

(assert (= (and start!62630 res!470756) b!706946))

(assert (= (and b!706946 res!470751) b!706950))

(assert (= (and b!706950 res!470753) b!706952))

(assert (= (and b!706952 res!470760) b!706941))

(assert (= (and b!706941 res!470757) b!706948))

(assert (= (and b!706948 res!470759) b!706947))

(assert (= (and b!706947 res!470761) b!706949))

(assert (= (and b!706949 res!470763) b!706942))

(assert (= (and b!706942 res!470752) b!706951))

(assert (= (and b!706951 res!470758) b!706943))

(assert (= (and b!706943 res!470754) b!706944))

(assert (= (and b!706944 res!470762) b!706953))

(assert (= (and b!706953 res!470755) b!706945))

(declare-fun m!664663 () Bool)

(assert (=> b!706950 m!664663))

(declare-fun m!664665 () Bool)

(assert (=> b!706943 m!664665))

(declare-fun m!664667 () Bool)

(assert (=> b!706946 m!664667))

(declare-fun m!664669 () Bool)

(assert (=> b!706949 m!664669))

(declare-fun m!664671 () Bool)

(assert (=> start!62630 m!664671))

(declare-fun m!664673 () Bool)

(assert (=> b!706952 m!664673))

(declare-fun m!664675 () Bool)

(assert (=> b!706951 m!664675))

(declare-fun m!664677 () Bool)

(assert (=> b!706948 m!664677))

(declare-fun m!664679 () Bool)

(assert (=> b!706944 m!664679))

(declare-fun m!664681 () Bool)

(assert (=> b!706941 m!664681))

(declare-fun m!664683 () Bool)

(assert (=> b!706945 m!664683))

(declare-fun m!664685 () Bool)

(assert (=> b!706953 m!664685))

(declare-fun m!664687 () Bool)

(assert (=> b!706942 m!664687))

(declare-fun m!664689 () Bool)

(assert (=> b!706947 m!664689))

(push 1)

(assert (not b!706944))

(assert (not start!62630))

(assert (not b!706942))

(assert (not b!706950))

(assert (not b!706941))

(assert (not b!706947))

(assert (not b!706943))

(assert (not b!706946))

(assert (not b!706952))

(assert (not b!706953))

(assert (not b!706949))

(assert (not b!706945))

(assert (not b!706948))

(assert (not b!706951))

(check-sat)

