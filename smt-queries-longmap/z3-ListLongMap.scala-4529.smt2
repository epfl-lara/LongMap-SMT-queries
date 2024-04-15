; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62630 () Bool)

(assert start!62630)

(declare-fun b!706893 () Bool)

(declare-fun res!470875 () Bool)

(declare-fun e!397882 () Bool)

(assert (=> b!706893 (=> (not res!470875) (not e!397882))))

(declare-fun from!2969 () (_ BitVec 32))

(declare-datatypes ((array!40320 0))(
  ( (array!40321 (arr!19316 (Array (_ BitVec 32) (_ BitVec 64))) (size!19698 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40320)

(assert (=> b!706893 (= res!470875 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19698 a!3591)))))

(declare-fun b!706894 () Bool)

(declare-fun res!470865 () Bool)

(assert (=> b!706894 (=> (not res!470865) (not e!397882))))

(declare-datatypes ((List!13396 0))(
  ( (Nil!13393) (Cons!13392 (h!14437 (_ BitVec 64)) (t!19669 List!13396)) )
))
(declare-fun acc!652 () List!13396)

(declare-fun contains!3918 (List!13396 (_ BitVec 64)) Bool)

(assert (=> b!706894 (= res!470865 (not (contains!3918 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706895 () Bool)

(declare-fun res!470876 () Bool)

(assert (=> b!706895 (=> (not res!470876) (not e!397882))))

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!706895 (= res!470876 (validKeyInArray!0 k0!2824))))

(declare-fun b!706896 () Bool)

(declare-fun res!470878 () Bool)

(assert (=> b!706896 (=> (not res!470878) (not e!397882))))

(declare-fun newAcc!49 () List!13396)

(assert (=> b!706896 (= res!470878 (contains!3918 newAcc!49 k0!2824))))

(declare-fun b!706897 () Bool)

(declare-fun res!470868 () Bool)

(assert (=> b!706897 (=> (not res!470868) (not e!397882))))

(assert (=> b!706897 (= res!470868 (not (contains!3918 acc!652 k0!2824)))))

(declare-fun b!706898 () Bool)

(declare-fun res!470866 () Bool)

(assert (=> b!706898 (=> (not res!470866) (not e!397882))))

(declare-fun subseq!380 (List!13396 List!13396) Bool)

(assert (=> b!706898 (= res!470866 (subseq!380 acc!652 newAcc!49))))

(declare-fun b!706899 () Bool)

(declare-fun res!470867 () Bool)

(assert (=> b!706899 (=> (not res!470867) (not e!397882))))

(assert (=> b!706899 (= res!470867 (not (contains!3918 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706900 () Bool)

(assert (=> b!706900 (= e!397882 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!706901 () Bool)

(declare-fun res!470873 () Bool)

(assert (=> b!706901 (=> (not res!470873) (not e!397882))))

(assert (=> b!706901 (= res!470873 (not (contains!3918 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706902 () Bool)

(declare-fun res!470874 () Bool)

(assert (=> b!706902 (=> (not res!470874) (not e!397882))))

(declare-fun -!345 (List!13396 (_ BitVec 64)) List!13396)

(assert (=> b!706902 (= res!470874 (= (-!345 newAcc!49 k0!2824) acc!652))))

(declare-fun res!470872 () Bool)

(assert (=> start!62630 (=> (not res!470872) (not e!397882))))

(assert (=> start!62630 (= res!470872 (and (bvslt (size!19698 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19698 a!3591))))))

(assert (=> start!62630 e!397882))

(assert (=> start!62630 true))

(declare-fun array_inv!15199 (array!40320) Bool)

(assert (=> start!62630 (array_inv!15199 a!3591)))

(declare-fun b!706903 () Bool)

(declare-fun res!470870 () Bool)

(assert (=> b!706903 (=> (not res!470870) (not e!397882))))

(declare-fun noDuplicate!1187 (List!13396) Bool)

(assert (=> b!706903 (= res!470870 (noDuplicate!1187 newAcc!49))))

(declare-fun b!706904 () Bool)

(declare-fun res!470871 () Bool)

(assert (=> b!706904 (=> (not res!470871) (not e!397882))))

(declare-fun arrayNoDuplicates!0 (array!40320 (_ BitVec 32) List!13396) Bool)

(assert (=> b!706904 (= res!470871 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!706905 () Bool)

(declare-fun res!470877 () Bool)

(assert (=> b!706905 (=> (not res!470877) (not e!397882))))

(assert (=> b!706905 (= res!470877 (validKeyInArray!0 (select (arr!19316 a!3591) from!2969)))))

(declare-fun b!706906 () Bool)

(declare-fun res!470864 () Bool)

(assert (=> b!706906 (=> (not res!470864) (not e!397882))))

(declare-fun arrayContainsKey!0 (array!40320 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!706906 (= res!470864 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!706907 () Bool)

(declare-fun res!470869 () Bool)

(assert (=> b!706907 (=> (not res!470869) (not e!397882))))

(assert (=> b!706907 (= res!470869 (not (contains!3918 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706908 () Bool)

(declare-fun res!470863 () Bool)

(assert (=> b!706908 (=> (not res!470863) (not e!397882))))

(assert (=> b!706908 (= res!470863 (noDuplicate!1187 acc!652))))

(assert (= (and start!62630 res!470872) b!706908))

(assert (= (and b!706908 res!470863) b!706903))

(assert (= (and b!706903 res!470870) b!706894))

(assert (= (and b!706894 res!470865) b!706901))

(assert (= (and b!706901 res!470873) b!706906))

(assert (= (and b!706906 res!470864) b!706897))

(assert (= (and b!706897 res!470868) b!706895))

(assert (= (and b!706895 res!470876) b!706904))

(assert (= (and b!706904 res!470871) b!706898))

(assert (= (and b!706898 res!470866) b!706896))

(assert (= (and b!706896 res!470878) b!706902))

(assert (= (and b!706902 res!470874) b!706907))

(assert (= (and b!706907 res!470869) b!706899))

(assert (= (and b!706899 res!470867) b!706893))

(assert (= (and b!706893 res!470875) b!706905))

(assert (= (and b!706905 res!470877) b!706900))

(declare-fun m!664071 () Bool)

(assert (=> b!706906 m!664071))

(declare-fun m!664073 () Bool)

(assert (=> b!706898 m!664073))

(declare-fun m!664075 () Bool)

(assert (=> b!706896 m!664075))

(declare-fun m!664077 () Bool)

(assert (=> b!706899 m!664077))

(declare-fun m!664079 () Bool)

(assert (=> b!706904 m!664079))

(declare-fun m!664081 () Bool)

(assert (=> b!706897 m!664081))

(declare-fun m!664083 () Bool)

(assert (=> b!706895 m!664083))

(declare-fun m!664085 () Bool)

(assert (=> b!706894 m!664085))

(declare-fun m!664087 () Bool)

(assert (=> b!706903 m!664087))

(declare-fun m!664089 () Bool)

(assert (=> b!706905 m!664089))

(assert (=> b!706905 m!664089))

(declare-fun m!664091 () Bool)

(assert (=> b!706905 m!664091))

(declare-fun m!664093 () Bool)

(assert (=> b!706902 m!664093))

(declare-fun m!664095 () Bool)

(assert (=> start!62630 m!664095))

(declare-fun m!664097 () Bool)

(assert (=> b!706901 m!664097))

(declare-fun m!664099 () Bool)

(assert (=> b!706908 m!664099))

(declare-fun m!664101 () Bool)

(assert (=> b!706907 m!664101))

(check-sat (not b!706905) (not b!706899) (not b!706908) (not b!706895) (not b!706907) (not b!706894) (not b!706896) (not b!706902) (not b!706901) (not b!706906) (not b!706897) (not start!62630) (not b!706903) (not b!706898) (not b!706904))
(check-sat)
