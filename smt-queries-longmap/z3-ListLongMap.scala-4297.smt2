; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59812 () Bool)

(assert start!59812)

(declare-fun b!660816 () Bool)

(declare-fun e!379715 () Bool)

(assert (=> b!660816 (= e!379715 false)))

(declare-fun lt!308815 () Bool)

(declare-datatypes ((array!38859 0))(
  ( (array!38860 (arr!18622 (Array (_ BitVec 32) (_ BitVec 64))) (size!18986 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38859)

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((List!12663 0))(
  ( (Nil!12660) (Cons!12659 (h!13704 (_ BitVec 64)) (t!18891 List!12663)) )
))
(declare-fun acc!681 () List!12663)

(declare-fun arrayNoDuplicates!0 (array!38859 (_ BitVec 32) List!12663) Bool)

(assert (=> b!660816 (= lt!308815 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!660817 () Bool)

(declare-fun res!428880 () Bool)

(assert (=> b!660817 (=> (not res!428880) (not e!379715))))

(declare-fun contains!3240 (List!12663 (_ BitVec 64)) Bool)

(assert (=> b!660817 (= res!428880 (not (contains!3240 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660818 () Bool)

(declare-fun e!379714 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(assert (=> b!660818 (= e!379714 (not (contains!3240 acc!681 k0!2843)))))

(declare-fun b!660819 () Bool)

(declare-fun res!428885 () Bool)

(assert (=> b!660819 (=> (not res!428885) (not e!379715))))

(declare-fun noDuplicate!487 (List!12663) Bool)

(assert (=> b!660819 (= res!428885 (noDuplicate!487 acc!681))))

(declare-fun b!660820 () Bool)

(declare-fun res!428881 () Bool)

(assert (=> b!660820 (=> (not res!428881) (not e!379715))))

(assert (=> b!660820 (= res!428881 (not (contains!3240 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660821 () Bool)

(declare-fun e!379716 () Bool)

(assert (=> b!660821 (= e!379716 (contains!3240 acc!681 k0!2843))))

(declare-fun b!660822 () Bool)

(declare-fun res!428887 () Bool)

(assert (=> b!660822 (=> (not res!428887) (not e!379715))))

(declare-fun e!379713 () Bool)

(assert (=> b!660822 (= res!428887 e!379713)))

(declare-fun res!428883 () Bool)

(assert (=> b!660822 (=> res!428883 e!379713)))

(assert (=> b!660822 (= res!428883 e!379716)))

(declare-fun res!428882 () Bool)

(assert (=> b!660822 (=> (not res!428882) (not e!379716))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!660822 (= res!428882 (bvsgt from!3004 i!1382))))

(declare-fun res!428888 () Bool)

(assert (=> start!59812 (=> (not res!428888) (not e!379715))))

(assert (=> start!59812 (= res!428888 (and (bvslt (size!18986 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18986 a!3626))))))

(assert (=> start!59812 e!379715))

(assert (=> start!59812 true))

(declare-fun array_inv!14418 (array!38859) Bool)

(assert (=> start!59812 (array_inv!14418 a!3626)))

(declare-fun b!660823 () Bool)

(declare-fun res!428886 () Bool)

(assert (=> b!660823 (=> (not res!428886) (not e!379715))))

(assert (=> b!660823 (= res!428886 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12660))))

(declare-fun b!660824 () Bool)

(assert (=> b!660824 (= e!379713 e!379714)))

(declare-fun res!428884 () Bool)

(assert (=> b!660824 (=> (not res!428884) (not e!379714))))

(assert (=> b!660824 (= res!428884 (bvsle from!3004 i!1382))))

(assert (= (and start!59812 res!428888) b!660819))

(assert (= (and b!660819 res!428885) b!660820))

(assert (= (and b!660820 res!428881) b!660817))

(assert (= (and b!660817 res!428880) b!660822))

(assert (= (and b!660822 res!428882) b!660821))

(assert (= (and b!660822 (not res!428883)) b!660824))

(assert (= (and b!660824 res!428884) b!660818))

(assert (= (and b!660822 res!428887) b!660823))

(assert (= (and b!660823 res!428886) b!660816))

(declare-fun m!633307 () Bool)

(assert (=> b!660820 m!633307))

(declare-fun m!633309 () Bool)

(assert (=> b!660816 m!633309))

(declare-fun m!633311 () Bool)

(assert (=> b!660819 m!633311))

(declare-fun m!633313 () Bool)

(assert (=> b!660817 m!633313))

(declare-fun m!633315 () Bool)

(assert (=> b!660823 m!633315))

(declare-fun m!633317 () Bool)

(assert (=> b!660821 m!633317))

(declare-fun m!633319 () Bool)

(assert (=> start!59812 m!633319))

(assert (=> b!660818 m!633317))

(check-sat (not b!660821) (not b!660816) (not b!660820) (not b!660818) (not b!660817) (not b!660819) (not start!59812) (not b!660823))
(check-sat)
