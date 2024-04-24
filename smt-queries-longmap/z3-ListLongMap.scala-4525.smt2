; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62674 () Bool)

(assert start!62674)

(declare-fun b!706900 () Bool)

(declare-fun res!470622 () Bool)

(declare-fun e!398108 () Bool)

(assert (=> b!706900 (=> (not res!470622) (not e!398108))))

(declare-datatypes ((List!13248 0))(
  ( (Nil!13245) (Cons!13244 (h!14292 (_ BitVec 64)) (t!19522 List!13248)) )
))
(declare-fun newAcc!49 () List!13248)

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun acc!652 () List!13248)

(declare-fun -!332 (List!13248 (_ BitVec 64)) List!13248)

(assert (=> b!706900 (= res!470622 (= (-!332 newAcc!49 k0!2824) acc!652))))

(declare-fun b!706901 () Bool)

(declare-fun res!470620 () Bool)

(assert (=> b!706901 (=> (not res!470620) (not e!398108))))

(declare-fun noDuplicate!1174 (List!13248) Bool)

(assert (=> b!706901 (= res!470620 (noDuplicate!1174 acc!652))))

(declare-fun res!470615 () Bool)

(assert (=> start!62674 (=> (not res!470615) (not e!398108))))

(declare-datatypes ((array!40293 0))(
  ( (array!40294 (arr!19300 (Array (_ BitVec 32) (_ BitVec 64))) (size!19683 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40293)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!62674 (= res!470615 (and (bvslt (size!19683 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19683 a!3591))))))

(assert (=> start!62674 e!398108))

(assert (=> start!62674 true))

(declare-fun array_inv!15159 (array!40293) Bool)

(assert (=> start!62674 (array_inv!15159 a!3591)))

(declare-fun b!706902 () Bool)

(declare-fun res!470613 () Bool)

(assert (=> b!706902 (=> (not res!470613) (not e!398108))))

(declare-fun contains!3900 (List!13248 (_ BitVec 64)) Bool)

(assert (=> b!706902 (= res!470613 (contains!3900 newAcc!49 k0!2824))))

(declare-fun b!706903 () Bool)

(declare-fun res!470611 () Bool)

(assert (=> b!706903 (=> (not res!470611) (not e!398108))))

(declare-fun arrayContainsKey!0 (array!40293 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!706903 (= res!470611 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!706904 () Bool)

(declare-fun res!470619 () Bool)

(assert (=> b!706904 (=> (not res!470619) (not e!398108))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!706904 (= res!470619 (validKeyInArray!0 k0!2824))))

(declare-fun b!706905 () Bool)

(declare-fun res!470614 () Bool)

(assert (=> b!706905 (=> (not res!470614) (not e!398108))))

(declare-fun arrayNoDuplicates!0 (array!40293 (_ BitVec 32) List!13248) Bool)

(assert (=> b!706905 (= res!470614 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!706906 () Bool)

(assert (=> b!706906 (= e!398108 false)))

(declare-fun lt!318060 () Bool)

(assert (=> b!706906 (= lt!318060 (contains!3900 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!706907 () Bool)

(declare-fun res!470612 () Bool)

(assert (=> b!706907 (=> (not res!470612) (not e!398108))))

(assert (=> b!706907 (= res!470612 (not (contains!3900 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706908 () Bool)

(declare-fun res!470623 () Bool)

(assert (=> b!706908 (=> (not res!470623) (not e!398108))))

(declare-fun subseq!368 (List!13248 List!13248) Bool)

(assert (=> b!706908 (= res!470623 (subseq!368 acc!652 newAcc!49))))

(declare-fun b!706909 () Bool)

(declare-fun res!470621 () Bool)

(assert (=> b!706909 (=> (not res!470621) (not e!398108))))

(assert (=> b!706909 (= res!470621 (not (contains!3900 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706910 () Bool)

(declare-fun res!470616 () Bool)

(assert (=> b!706910 (=> (not res!470616) (not e!398108))))

(assert (=> b!706910 (= res!470616 (not (contains!3900 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706911 () Bool)

(declare-fun res!470618 () Bool)

(assert (=> b!706911 (=> (not res!470618) (not e!398108))))

(assert (=> b!706911 (= res!470618 (not (contains!3900 acc!652 k0!2824)))))

(declare-fun b!706912 () Bool)

(declare-fun res!470617 () Bool)

(assert (=> b!706912 (=> (not res!470617) (not e!398108))))

(assert (=> b!706912 (= res!470617 (noDuplicate!1174 newAcc!49))))

(assert (= (and start!62674 res!470615) b!706901))

(assert (= (and b!706901 res!470620) b!706912))

(assert (= (and b!706912 res!470617) b!706907))

(assert (= (and b!706907 res!470612) b!706909))

(assert (= (and b!706909 res!470621) b!706903))

(assert (= (and b!706903 res!470611) b!706911))

(assert (= (and b!706911 res!470618) b!706904))

(assert (= (and b!706904 res!470619) b!706905))

(assert (= (and b!706905 res!470614) b!706908))

(assert (= (and b!706908 res!470623) b!706902))

(assert (= (and b!706902 res!470613) b!706900))

(assert (= (and b!706900 res!470622) b!706910))

(assert (= (and b!706910 res!470616) b!706906))

(declare-fun m!665151 () Bool)

(assert (=> b!706904 m!665151))

(declare-fun m!665153 () Bool)

(assert (=> b!706901 m!665153))

(declare-fun m!665155 () Bool)

(assert (=> b!706909 m!665155))

(declare-fun m!665157 () Bool)

(assert (=> start!62674 m!665157))

(declare-fun m!665159 () Bool)

(assert (=> b!706907 m!665159))

(declare-fun m!665161 () Bool)

(assert (=> b!706902 m!665161))

(declare-fun m!665163 () Bool)

(assert (=> b!706908 m!665163))

(declare-fun m!665165 () Bool)

(assert (=> b!706911 m!665165))

(declare-fun m!665167 () Bool)

(assert (=> b!706903 m!665167))

(declare-fun m!665169 () Bool)

(assert (=> b!706900 m!665169))

(declare-fun m!665171 () Bool)

(assert (=> b!706910 m!665171))

(declare-fun m!665173 () Bool)

(assert (=> b!706905 m!665173))

(declare-fun m!665175 () Bool)

(assert (=> b!706906 m!665175))

(declare-fun m!665177 () Bool)

(assert (=> b!706912 m!665177))

(check-sat (not b!706910) (not b!706901) (not b!706903) (not b!706905) (not b!706900) (not b!706902) (not b!706908) (not b!706909) (not b!706904) (not b!706907) (not b!706911) (not b!706906) (not b!706912) (not start!62674))
(check-sat)
