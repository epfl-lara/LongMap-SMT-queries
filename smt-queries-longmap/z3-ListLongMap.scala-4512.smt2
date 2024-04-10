; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62542 () Bool)

(assert start!62542)

(declare-fun b!704836 () Bool)

(declare-fun res!468659 () Bool)

(declare-fun e!397764 () Bool)

(assert (=> b!704836 (=> (not res!468659) (not e!397764))))

(declare-datatypes ((List!13308 0))(
  ( (Nil!13305) (Cons!13304 (h!14349 (_ BitVec 64)) (t!19590 List!13308)) )
))
(declare-fun newAcc!49 () List!13308)

(declare-fun contains!3885 (List!13308 (_ BitVec 64)) Bool)

(assert (=> b!704836 (= res!468659 (not (contains!3885 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704837 () Bool)

(declare-fun res!468653 () Bool)

(assert (=> b!704837 (=> (not res!468653) (not e!397764))))

(declare-fun acc!652 () List!13308)

(assert (=> b!704837 (= res!468653 (not (contains!3885 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704838 () Bool)

(declare-fun res!468660 () Bool)

(assert (=> b!704838 (=> (not res!468660) (not e!397764))))

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> b!704838 (= res!468660 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!704839 () Bool)

(declare-fun res!468649 () Bool)

(assert (=> b!704839 (=> (not res!468649) (not e!397764))))

(assert (=> b!704839 (= res!468649 (not (contains!3885 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704840 () Bool)

(declare-fun res!468661 () Bool)

(assert (=> b!704840 (=> (not res!468661) (not e!397764))))

(declare-datatypes ((array!40221 0))(
  ( (array!40222 (arr!19267 (Array (_ BitVec 32) (_ BitVec 64))) (size!19652 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40221)

(declare-fun arrayNoDuplicates!0 (array!40221 (_ BitVec 32) List!13308) Bool)

(assert (=> b!704840 (= res!468661 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!704841 () Bool)

(declare-fun res!468656 () Bool)

(assert (=> b!704841 (=> (not res!468656) (not e!397764))))

(declare-fun noDuplicate!1132 (List!13308) Bool)

(assert (=> b!704841 (= res!468656 (noDuplicate!1132 acc!652))))

(declare-fun b!704842 () Bool)

(declare-fun res!468648 () Bool)

(assert (=> b!704842 (=> (not res!468648) (not e!397764))))

(assert (=> b!704842 (= res!468648 (noDuplicate!1132 newAcc!49))))

(declare-fun b!704843 () Bool)

(declare-fun res!468662 () Bool)

(assert (=> b!704843 (=> (not res!468662) (not e!397764))))

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40221 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!704843 (= res!468662 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!704844 () Bool)

(declare-fun res!468651 () Bool)

(assert (=> b!704844 (=> (not res!468651) (not e!397764))))

(assert (=> b!704844 (= res!468651 (not (contains!3885 acc!652 k0!2824)))))

(declare-fun res!468657 () Bool)

(assert (=> start!62542 (=> (not res!468657) (not e!397764))))

(assert (=> start!62542 (= res!468657 (and (bvslt (size!19652 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19652 a!3591))))))

(assert (=> start!62542 e!397764))

(assert (=> start!62542 true))

(declare-fun array_inv!15063 (array!40221) Bool)

(assert (=> start!62542 (array_inv!15063 a!3591)))

(declare-fun b!704845 () Bool)

(declare-fun res!468655 () Bool)

(assert (=> b!704845 (=> (not res!468655) (not e!397764))))

(declare-fun -!295 (List!13308 (_ BitVec 64)) List!13308)

(assert (=> b!704845 (= res!468655 (= (-!295 newAcc!49 k0!2824) acc!652))))

(declare-fun b!704846 () Bool)

(declare-fun res!468647 () Bool)

(assert (=> b!704846 (=> (not res!468647) (not e!397764))))

(assert (=> b!704846 (= res!468647 (contains!3885 newAcc!49 k0!2824))))

(declare-fun b!704847 () Bool)

(declare-fun res!468650 () Bool)

(assert (=> b!704847 (=> (not res!468650) (not e!397764))))

(assert (=> b!704847 (= res!468650 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19652 a!3591)))))

(declare-fun b!704848 () Bool)

(declare-fun res!468646 () Bool)

(assert (=> b!704848 (=> (not res!468646) (not e!397764))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!704848 (= res!468646 (not (validKeyInArray!0 (select (arr!19267 a!3591) from!2969))))))

(declare-fun b!704849 () Bool)

(declare-fun res!468652 () Bool)

(assert (=> b!704849 (=> (not res!468652) (not e!397764))))

(assert (=> b!704849 (= res!468652 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!704850 () Bool)

(declare-fun res!468663 () Bool)

(assert (=> b!704850 (=> (not res!468663) (not e!397764))))

(declare-fun subseq!330 (List!13308 List!13308) Bool)

(assert (=> b!704850 (= res!468663 (subseq!330 acc!652 newAcc!49))))

(declare-fun b!704851 () Bool)

(declare-fun res!468654 () Bool)

(assert (=> b!704851 (=> (not res!468654) (not e!397764))))

(assert (=> b!704851 (= res!468654 (validKeyInArray!0 k0!2824))))

(declare-fun b!704852 () Bool)

(assert (=> b!704852 (= e!397764 false)))

(declare-fun lt!317865 () Bool)

(assert (=> b!704852 (= lt!317865 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!704853 () Bool)

(declare-fun res!468658 () Bool)

(assert (=> b!704853 (=> (not res!468658) (not e!397764))))

(assert (=> b!704853 (= res!468658 (not (contains!3885 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!62542 res!468657) b!704841))

(assert (= (and b!704841 res!468656) b!704842))

(assert (= (and b!704842 res!468648) b!704853))

(assert (= (and b!704853 res!468658) b!704837))

(assert (= (and b!704837 res!468653) b!704843))

(assert (= (and b!704843 res!468662) b!704844))

(assert (= (and b!704844 res!468651) b!704851))

(assert (= (and b!704851 res!468654) b!704840))

(assert (= (and b!704840 res!468661) b!704850))

(assert (= (and b!704850 res!468663) b!704846))

(assert (= (and b!704846 res!468647) b!704845))

(assert (= (and b!704845 res!468655) b!704836))

(assert (= (and b!704836 res!468659) b!704839))

(assert (= (and b!704839 res!468649) b!704847))

(assert (= (and b!704847 res!468650) b!704848))

(assert (= (and b!704848 res!468646) b!704838))

(assert (= (and b!704838 res!468660) b!704849))

(assert (= (and b!704849 res!468652) b!704852))

(declare-fun m!663199 () Bool)

(assert (=> b!704836 m!663199))

(declare-fun m!663201 () Bool)

(assert (=> b!704837 m!663201))

(declare-fun m!663203 () Bool)

(assert (=> b!704845 m!663203))

(declare-fun m!663205 () Bool)

(assert (=> b!704849 m!663205))

(declare-fun m!663207 () Bool)

(assert (=> b!704842 m!663207))

(declare-fun m!663209 () Bool)

(assert (=> b!704853 m!663209))

(declare-fun m!663211 () Bool)

(assert (=> b!704850 m!663211))

(declare-fun m!663213 () Bool)

(assert (=> b!704840 m!663213))

(declare-fun m!663215 () Bool)

(assert (=> b!704851 m!663215))

(declare-fun m!663217 () Bool)

(assert (=> b!704844 m!663217))

(declare-fun m!663219 () Bool)

(assert (=> start!62542 m!663219))

(declare-fun m!663221 () Bool)

(assert (=> b!704852 m!663221))

(declare-fun m!663223 () Bool)

(assert (=> b!704839 m!663223))

(declare-fun m!663225 () Bool)

(assert (=> b!704848 m!663225))

(assert (=> b!704848 m!663225))

(declare-fun m!663227 () Bool)

(assert (=> b!704848 m!663227))

(declare-fun m!663229 () Bool)

(assert (=> b!704843 m!663229))

(declare-fun m!663231 () Bool)

(assert (=> b!704841 m!663231))

(declare-fun m!663233 () Bool)

(assert (=> b!704846 m!663233))

(check-sat (not b!704849) (not b!704841) (not b!704844) (not b!704842) (not b!704852) (not b!704845) (not b!704843) (not start!62542) (not b!704848) (not b!704846) (not b!704850) (not b!704840) (not b!704839) (not b!704853) (not b!704851) (not b!704836) (not b!704837))
(check-sat)
