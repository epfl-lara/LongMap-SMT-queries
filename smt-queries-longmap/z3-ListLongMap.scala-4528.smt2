; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62624 () Bool)

(assert start!62624)

(declare-fun b!706770 () Bool)

(declare-fun res!470749 () Bool)

(declare-fun e!397865 () Bool)

(assert (=> b!706770 (=> (not res!470749) (not e!397865))))

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun from!2969 () (_ BitVec 32))

(declare-datatypes ((array!40314 0))(
  ( (array!40315 (arr!19313 (Array (_ BitVec 32) (_ BitVec 64))) (size!19695 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40314)

(declare-fun arrayContainsKey!0 (array!40314 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!706770 (= res!470749 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!706771 () Bool)

(declare-fun res!470748 () Bool)

(assert (=> b!706771 (=> (not res!470748) (not e!397865))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!706771 (= res!470748 (validKeyInArray!0 k0!2824))))

(declare-fun b!706772 () Bool)

(assert (=> b!706772 (= e!397865 false)))

(declare-fun lt!317736 () Bool)

(declare-datatypes ((List!13393 0))(
  ( (Nil!13390) (Cons!13389 (h!14434 (_ BitVec 64)) (t!19666 List!13393)) )
))
(declare-fun newAcc!49 () List!13393)

(declare-fun contains!3915 (List!13393 (_ BitVec 64)) Bool)

(assert (=> b!706772 (= lt!317736 (contains!3915 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!706773 () Bool)

(declare-fun res!470745 () Bool)

(assert (=> b!706773 (=> (not res!470745) (not e!397865))))

(assert (=> b!706773 (= res!470745 (not (contains!3915 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706774 () Bool)

(declare-fun res!470742 () Bool)

(assert (=> b!706774 (=> (not res!470742) (not e!397865))))

(declare-fun acc!652 () List!13393)

(declare-fun -!342 (List!13393 (_ BitVec 64)) List!13393)

(assert (=> b!706774 (= res!470742 (= (-!342 newAcc!49 k0!2824) acc!652))))

(declare-fun res!470741 () Bool)

(assert (=> start!62624 (=> (not res!470741) (not e!397865))))

(assert (=> start!62624 (= res!470741 (and (bvslt (size!19695 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19695 a!3591))))))

(assert (=> start!62624 e!397865))

(assert (=> start!62624 true))

(declare-fun array_inv!15196 (array!40314) Bool)

(assert (=> start!62624 (array_inv!15196 a!3591)))

(declare-fun b!706775 () Bool)

(declare-fun res!470752 () Bool)

(assert (=> b!706775 (=> (not res!470752) (not e!397865))))

(assert (=> b!706775 (= res!470752 (not (contains!3915 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706776 () Bool)

(declare-fun res!470743 () Bool)

(assert (=> b!706776 (=> (not res!470743) (not e!397865))))

(declare-fun noDuplicate!1184 (List!13393) Bool)

(assert (=> b!706776 (= res!470743 (noDuplicate!1184 acc!652))))

(declare-fun b!706777 () Bool)

(declare-fun res!470750 () Bool)

(assert (=> b!706777 (=> (not res!470750) (not e!397865))))

(assert (=> b!706777 (= res!470750 (not (contains!3915 acc!652 k0!2824)))))

(declare-fun b!706778 () Bool)

(declare-fun res!470747 () Bool)

(assert (=> b!706778 (=> (not res!470747) (not e!397865))))

(assert (=> b!706778 (= res!470747 (contains!3915 newAcc!49 k0!2824))))

(declare-fun b!706779 () Bool)

(declare-fun res!470751 () Bool)

(assert (=> b!706779 (=> (not res!470751) (not e!397865))))

(assert (=> b!706779 (= res!470751 (not (contains!3915 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706780 () Bool)

(declare-fun res!470744 () Bool)

(assert (=> b!706780 (=> (not res!470744) (not e!397865))))

(declare-fun subseq!377 (List!13393 List!13393) Bool)

(assert (=> b!706780 (= res!470744 (subseq!377 acc!652 newAcc!49))))

(declare-fun b!706781 () Bool)

(declare-fun res!470746 () Bool)

(assert (=> b!706781 (=> (not res!470746) (not e!397865))))

(assert (=> b!706781 (= res!470746 (noDuplicate!1184 newAcc!49))))

(declare-fun b!706782 () Bool)

(declare-fun res!470740 () Bool)

(assert (=> b!706782 (=> (not res!470740) (not e!397865))))

(declare-fun arrayNoDuplicates!0 (array!40314 (_ BitVec 32) List!13393) Bool)

(assert (=> b!706782 (= res!470740 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(assert (= (and start!62624 res!470741) b!706776))

(assert (= (and b!706776 res!470743) b!706781))

(assert (= (and b!706781 res!470746) b!706779))

(assert (= (and b!706779 res!470751) b!706775))

(assert (= (and b!706775 res!470752) b!706770))

(assert (= (and b!706770 res!470749) b!706777))

(assert (= (and b!706777 res!470750) b!706771))

(assert (= (and b!706771 res!470748) b!706782))

(assert (= (and b!706782 res!470740) b!706780))

(assert (= (and b!706780 res!470744) b!706778))

(assert (= (and b!706778 res!470747) b!706774))

(assert (= (and b!706774 res!470742) b!706773))

(assert (= (and b!706773 res!470745) b!706772))

(declare-fun m!663987 () Bool)

(assert (=> b!706780 m!663987))

(declare-fun m!663989 () Bool)

(assert (=> b!706776 m!663989))

(declare-fun m!663991 () Bool)

(assert (=> b!706782 m!663991))

(declare-fun m!663993 () Bool)

(assert (=> b!706777 m!663993))

(declare-fun m!663995 () Bool)

(assert (=> b!706775 m!663995))

(declare-fun m!663997 () Bool)

(assert (=> b!706774 m!663997))

(declare-fun m!663999 () Bool)

(assert (=> b!706770 m!663999))

(declare-fun m!664001 () Bool)

(assert (=> b!706779 m!664001))

(declare-fun m!664003 () Bool)

(assert (=> b!706778 m!664003))

(declare-fun m!664005 () Bool)

(assert (=> b!706781 m!664005))

(declare-fun m!664007 () Bool)

(assert (=> b!706773 m!664007))

(declare-fun m!664009 () Bool)

(assert (=> start!62624 m!664009))

(declare-fun m!664011 () Bool)

(assert (=> b!706771 m!664011))

(declare-fun m!664013 () Bool)

(assert (=> b!706772 m!664013))

(check-sat (not b!706770) (not b!706775) (not b!706781) (not b!706774) (not b!706782) (not b!706779) (not start!62624) (not b!706773) (not b!706780) (not b!706776) (not b!706771) (not b!706777) (not b!706772) (not b!706778))
(check-sat)
