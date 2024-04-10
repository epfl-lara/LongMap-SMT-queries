; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62628 () Bool)

(assert start!62628)

(declare-fun res!470719 () Bool)

(declare-fun e!398023 () Bool)

(assert (=> start!62628 (=> (not res!470719) (not e!398023))))

(declare-datatypes ((array!40307 0))(
  ( (array!40308 (arr!19310 (Array (_ BitVec 32) (_ BitVec 64))) (size!19695 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40307)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!62628 (= res!470719 (and (bvslt (size!19695 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19695 a!3591))))))

(assert (=> start!62628 e!398023))

(assert (=> start!62628 true))

(declare-fun array_inv!15106 (array!40307) Bool)

(assert (=> start!62628 (array_inv!15106 a!3591)))

(declare-fun b!706902 () Bool)

(assert (=> b!706902 (= e!398023 false)))

(declare-fun lt!317976 () Bool)

(declare-datatypes ((List!13351 0))(
  ( (Nil!13348) (Cons!13347 (h!14392 (_ BitVec 64)) (t!19633 List!13351)) )
))
(declare-fun newAcc!49 () List!13351)

(declare-fun contains!3928 (List!13351 (_ BitVec 64)) Bool)

(assert (=> b!706902 (= lt!317976 (contains!3928 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!706903 () Bool)

(declare-fun res!470714 () Bool)

(assert (=> b!706903 (=> (not res!470714) (not e!398023))))

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!706903 (= res!470714 (validKeyInArray!0 k!2824))))

(declare-fun b!706904 () Bool)

(declare-fun res!470713 () Bool)

(assert (=> b!706904 (=> (not res!470713) (not e!398023))))

(declare-fun acc!652 () List!13351)

(declare-fun arrayNoDuplicates!0 (array!40307 (_ BitVec 32) List!13351) Bool)

(assert (=> b!706904 (= res!470713 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!706905 () Bool)

(declare-fun res!470722 () Bool)

(assert (=> b!706905 (=> (not res!470722) (not e!398023))))

(assert (=> b!706905 (= res!470722 (not (contains!3928 acc!652 k!2824)))))

(declare-fun b!706906 () Bool)

(declare-fun res!470720 () Bool)

(assert (=> b!706906 (=> (not res!470720) (not e!398023))))

(assert (=> b!706906 (= res!470720 (not (contains!3928 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706907 () Bool)

(declare-fun res!470715 () Bool)

(assert (=> b!706907 (=> (not res!470715) (not e!398023))))

(assert (=> b!706907 (= res!470715 (not (contains!3928 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706908 () Bool)

(declare-fun res!470717 () Bool)

(assert (=> b!706908 (=> (not res!470717) (not e!398023))))

(declare-fun noDuplicate!1175 (List!13351) Bool)

(assert (=> b!706908 (= res!470717 (noDuplicate!1175 acc!652))))

(declare-fun b!706909 () Bool)

(declare-fun res!470718 () Bool)

(assert (=> b!706909 (=> (not res!470718) (not e!398023))))

(declare-fun -!338 (List!13351 (_ BitVec 64)) List!13351)

(assert (=> b!706909 (= res!470718 (= (-!338 newAcc!49 k!2824) acc!652))))

(declare-fun b!706910 () Bool)

(declare-fun res!470712 () Bool)

(assert (=> b!706910 (=> (not res!470712) (not e!398023))))

(assert (=> b!706910 (= res!470712 (not (contains!3928 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706911 () Bool)

(declare-fun res!470724 () Bool)

(assert (=> b!706911 (=> (not res!470724) (not e!398023))))

(assert (=> b!706911 (= res!470724 (contains!3928 newAcc!49 k!2824))))

(declare-fun b!706912 () Bool)

(declare-fun res!470716 () Bool)

(assert (=> b!706912 (=> (not res!470716) (not e!398023))))

(declare-fun arrayContainsKey!0 (array!40307 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!706912 (= res!470716 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!706913 () Bool)

(declare-fun res!470723 () Bool)

(assert (=> b!706913 (=> (not res!470723) (not e!398023))))

(declare-fun subseq!373 (List!13351 List!13351) Bool)

(assert (=> b!706913 (= res!470723 (subseq!373 acc!652 newAcc!49))))

(declare-fun b!706914 () Bool)

(declare-fun res!470721 () Bool)

(assert (=> b!706914 (=> (not res!470721) (not e!398023))))

(assert (=> b!706914 (= res!470721 (noDuplicate!1175 newAcc!49))))

(assert (= (and start!62628 res!470719) b!706908))

(assert (= (and b!706908 res!470717) b!706914))

(assert (= (and b!706914 res!470721) b!706910))

(assert (= (and b!706910 res!470712) b!706907))

(assert (= (and b!706907 res!470715) b!706912))

(assert (= (and b!706912 res!470716) b!706905))

(assert (= (and b!706905 res!470722) b!706903))

(assert (= (and b!706903 res!470714) b!706904))

(assert (= (and b!706904 res!470713) b!706913))

(assert (= (and b!706913 res!470723) b!706911))

(assert (= (and b!706911 res!470724) b!706909))

(assert (= (and b!706909 res!470718) b!706906))

(assert (= (and b!706906 res!470720) b!706902))

(declare-fun m!664635 () Bool)

(assert (=> b!706914 m!664635))

(declare-fun m!664637 () Bool)

(assert (=> b!706910 m!664637))

(declare-fun m!664639 () Bool)

(assert (=> b!706902 m!664639))

(declare-fun m!664641 () Bool)

(assert (=> b!706903 m!664641))

(declare-fun m!664643 () Bool)

(assert (=> b!706909 m!664643))

(declare-fun m!664645 () Bool)

(assert (=> b!706911 m!664645))

(declare-fun m!664647 () Bool)

(assert (=> b!706908 m!664647))

(declare-fun m!664649 () Bool)

(assert (=> b!706906 m!664649))

(declare-fun m!664651 () Bool)

(assert (=> b!706912 m!664651))

(declare-fun m!664653 () Bool)

(assert (=> b!706913 m!664653))

(declare-fun m!664655 () Bool)

(assert (=> b!706907 m!664655))

(declare-fun m!664657 () Bool)

(assert (=> start!62628 m!664657))

(declare-fun m!664659 () Bool)

(assert (=> b!706905 m!664659))

(declare-fun m!664661 () Bool)

(assert (=> b!706904 m!664661))

(push 1)

(assert (not b!706914))

(assert (not b!706906))

(assert (not b!706909))

(assert (not b!706904))

(assert (not b!706905))

(assert (not b!706911))

(assert (not b!706913))

(assert (not b!706903))

(assert (not b!706907))

(assert (not b!706908))

(assert (not b!706902))

