; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60540 () Bool)

(assert start!60540)

(declare-fun b!679807 () Bool)

(declare-fun e!387331 () Bool)

(declare-fun e!387330 () Bool)

(assert (=> b!679807 (= e!387331 e!387330)))

(declare-fun res!446053 () Bool)

(assert (=> b!679807 (=> (not res!446053) (not e!387330))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!679807 (= res!446053 (bvsle from!3004 i!1382))))

(declare-fun b!679808 () Bool)

(declare-datatypes ((List!12864 0))(
  ( (Nil!12861) (Cons!12860 (h!13908 (_ BitVec 64)) (t!19084 List!12864)) )
))
(declare-fun acc!681 () List!12864)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3516 (List!12864 (_ BitVec 64)) Bool)

(assert (=> b!679808 (= e!387330 (not (contains!3516 acc!681 k0!2843)))))

(declare-fun b!679809 () Bool)

(declare-fun res!446055 () Bool)

(declare-fun e!387333 () Bool)

(assert (=> b!679809 (=> (not res!446055) (not e!387333))))

(declare-datatypes ((array!39459 0))(
  ( (array!39460 (arr!18916 (Array (_ BitVec 32) (_ BitVec 64))) (size!19280 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39459)

(assert (=> b!679809 (= res!446055 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19280 a!3626))))))

(declare-fun b!679810 () Bool)

(declare-fun res!446061 () Bool)

(assert (=> b!679810 (=> (not res!446061) (not e!387333))))

(assert (=> b!679810 (= res!446061 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19280 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!679812 () Bool)

(declare-fun res!446058 () Bool)

(assert (=> b!679812 (=> (not res!446058) (not e!387333))))

(assert (=> b!679812 (= res!446058 (not (contains!3516 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!679813 () Bool)

(declare-fun res!446063 () Bool)

(assert (=> b!679813 (=> (not res!446063) (not e!387333))))

(declare-fun arrayContainsKey!0 (array!39459 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!679813 (= res!446063 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!679814 () Bool)

(declare-fun res!446052 () Bool)

(assert (=> b!679814 (=> (not res!446052) (not e!387333))))

(declare-fun arrayNoDuplicates!0 (array!39459 (_ BitVec 32) List!12864) Bool)

(assert (=> b!679814 (= res!446052 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12861))))

(declare-fun b!679815 () Bool)

(assert (=> b!679815 (= e!387333 (not true))))

(declare-datatypes ((Unit!23781 0))(
  ( (Unit!23782) )
))
(declare-fun lt!313042 () Unit!23781)

(declare-fun e!387332 () Unit!23781)

(assert (=> b!679815 (= lt!313042 e!387332)))

(declare-fun c!77246 () Bool)

(assert (=> b!679815 (= c!77246 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!679815 (arrayContainsKey!0 (array!39460 (store (arr!18916 a!3626) i!1382 k0!2843) (size!19280 a!3626)) k0!2843 from!3004)))

(declare-fun b!679816 () Bool)

(declare-fun Unit!23783 () Unit!23781)

(assert (=> b!679816 (= e!387332 Unit!23783)))

(declare-fun lt!313041 () Unit!23781)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39459 (_ BitVec 64) (_ BitVec 32)) Unit!23781)

(assert (=> b!679816 (= lt!313041 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!679816 false))

(declare-fun b!679817 () Bool)

(declare-fun res!446057 () Bool)

(assert (=> b!679817 (=> (not res!446057) (not e!387333))))

(declare-fun noDuplicate!790 (List!12864) Bool)

(assert (=> b!679817 (= res!446057 (noDuplicate!790 acc!681))))

(declare-fun b!679818 () Bool)

(declare-fun res!446054 () Bool)

(assert (=> b!679818 (=> (not res!446054) (not e!387333))))

(assert (=> b!679818 (= res!446054 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!679811 () Bool)

(declare-fun e!387328 () Bool)

(assert (=> b!679811 (= e!387328 (contains!3516 acc!681 k0!2843))))

(declare-fun res!446062 () Bool)

(assert (=> start!60540 (=> (not res!446062) (not e!387333))))

(assert (=> start!60540 (= res!446062 (and (bvslt (size!19280 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19280 a!3626))))))

(assert (=> start!60540 e!387333))

(assert (=> start!60540 true))

(declare-fun array_inv!14775 (array!39459) Bool)

(assert (=> start!60540 (array_inv!14775 a!3626)))

(declare-fun b!679819 () Bool)

(declare-fun res!446056 () Bool)

(assert (=> b!679819 (=> (not res!446056) (not e!387333))))

(assert (=> b!679819 (= res!446056 (not (contains!3516 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!679820 () Bool)

(declare-fun Unit!23784 () Unit!23781)

(assert (=> b!679820 (= e!387332 Unit!23784)))

(declare-fun b!679821 () Bool)

(declare-fun res!446059 () Bool)

(assert (=> b!679821 (=> (not res!446059) (not e!387333))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!679821 (= res!446059 (validKeyInArray!0 k0!2843))))

(declare-fun b!679822 () Bool)

(declare-fun res!446064 () Bool)

(assert (=> b!679822 (=> (not res!446064) (not e!387333))))

(assert (=> b!679822 (= res!446064 e!387331)))

(declare-fun res!446065 () Bool)

(assert (=> b!679822 (=> res!446065 e!387331)))

(assert (=> b!679822 (= res!446065 e!387328)))

(declare-fun res!446060 () Bool)

(assert (=> b!679822 (=> (not res!446060) (not e!387328))))

(assert (=> b!679822 (= res!446060 (bvsgt from!3004 i!1382))))

(assert (= (and start!60540 res!446062) b!679817))

(assert (= (and b!679817 res!446057) b!679819))

(assert (= (and b!679819 res!446056) b!679812))

(assert (= (and b!679812 res!446058) b!679822))

(assert (= (and b!679822 res!446060) b!679811))

(assert (= (and b!679822 (not res!446065)) b!679807))

(assert (= (and b!679807 res!446053) b!679808))

(assert (= (and b!679822 res!446064) b!679814))

(assert (= (and b!679814 res!446052) b!679818))

(assert (= (and b!679818 res!446054) b!679809))

(assert (= (and b!679809 res!446055) b!679821))

(assert (= (and b!679821 res!446059) b!679813))

(assert (= (and b!679813 res!446063) b!679810))

(assert (= (and b!679810 res!446061) b!679815))

(assert (= (and b!679815 c!77246) b!679816))

(assert (= (and b!679815 (not c!77246)) b!679820))

(declare-fun m!645637 () Bool)

(assert (=> start!60540 m!645637))

(declare-fun m!645639 () Bool)

(assert (=> b!679818 m!645639))

(declare-fun m!645641 () Bool)

(assert (=> b!679821 m!645641))

(declare-fun m!645643 () Bool)

(assert (=> b!679808 m!645643))

(declare-fun m!645645 () Bool)

(assert (=> b!679813 m!645645))

(declare-fun m!645647 () Bool)

(assert (=> b!679819 m!645647))

(declare-fun m!645649 () Bool)

(assert (=> b!679814 m!645649))

(declare-fun m!645651 () Bool)

(assert (=> b!679817 m!645651))

(declare-fun m!645653 () Bool)

(assert (=> b!679816 m!645653))

(declare-fun m!645655 () Bool)

(assert (=> b!679812 m!645655))

(assert (=> b!679811 m!645643))

(declare-fun m!645657 () Bool)

(assert (=> b!679815 m!645657))

(declare-fun m!645659 () Bool)

(assert (=> b!679815 m!645659))

(declare-fun m!645661 () Bool)

(assert (=> b!679815 m!645661))

(check-sat (not b!679818) (not b!679814) (not b!679812) (not b!679817) (not start!60540) (not b!679821) (not b!679819) (not b!679815) (not b!679813) (not b!679816) (not b!679811) (not b!679808))
(check-sat)
