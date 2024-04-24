; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62434 () Bool)

(assert start!62434)

(declare-fun b!699055 () Bool)

(declare-fun e!397238 () Bool)

(declare-fun e!397237 () Bool)

(assert (=> b!699055 (= e!397238 e!397237)))

(declare-fun res!462777 () Bool)

(assert (=> b!699055 (=> (not res!462777) (not e!397237))))

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> b!699055 (= res!462777 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-datatypes ((List!13128 0))(
  ( (Nil!13125) (Cons!13124 (h!14172 (_ BitVec 64)) (t!19402 List!13128)) )
))
(declare-fun newAcc!49 () List!13128)

(declare-fun lt!317416 () List!13128)

(declare-datatypes ((array!40053 0))(
  ( (array!40054 (arr!19180 (Array (_ BitVec 32) (_ BitVec 64))) (size!19563 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40053)

(declare-fun $colon$colon!443 (List!13128 (_ BitVec 64)) List!13128)

(assert (=> b!699055 (= lt!317416 ($colon$colon!443 newAcc!49 (select (arr!19180 a!3591) from!2969)))))

(declare-fun acc!652 () List!13128)

(declare-fun lt!317417 () List!13128)

(assert (=> b!699055 (= lt!317417 ($colon$colon!443 acc!652 (select (arr!19180 a!3591) from!2969)))))

(declare-fun b!699056 () Bool)

(declare-fun res!462767 () Bool)

(assert (=> b!699056 (=> (not res!462767) (not e!397238))))

(declare-fun arrayNoDuplicates!0 (array!40053 (_ BitVec 32) List!13128) Bool)

(assert (=> b!699056 (= res!462767 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!699057 () Bool)

(declare-fun res!462776 () Bool)

(assert (=> b!699057 (=> (not res!462776) (not e!397238))))

(declare-fun contains!3780 (List!13128 (_ BitVec 64)) Bool)

(assert (=> b!699057 (= res!462776 (not (contains!3780 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!699058 () Bool)

(declare-fun res!462770 () Bool)

(assert (=> b!699058 (=> (not res!462770) (not e!397237))))

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40053 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!699058 (= res!462770 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!699059 () Bool)

(declare-fun res!462766 () Bool)

(assert (=> b!699059 (=> (not res!462766) (not e!397238))))

(declare-fun -!212 (List!13128 (_ BitVec 64)) List!13128)

(assert (=> b!699059 (= res!462766 (= (-!212 newAcc!49 k0!2824) acc!652))))

(declare-fun b!699060 () Bool)

(declare-fun res!462778 () Bool)

(assert (=> b!699060 (=> (not res!462778) (not e!397237))))

(assert (=> b!699060 (= res!462778 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!317417))))

(declare-fun b!699061 () Bool)

(declare-fun res!462769 () Bool)

(assert (=> b!699061 (=> (not res!462769) (not e!397238))))

(declare-fun subseq!248 (List!13128 List!13128) Bool)

(assert (=> b!699061 (= res!462769 (subseq!248 acc!652 newAcc!49))))

(declare-fun b!699062 () Bool)

(declare-fun res!462779 () Bool)

(assert (=> b!699062 (=> (not res!462779) (not e!397237))))

(assert (=> b!699062 (= res!462779 (contains!3780 lt!317416 k0!2824))))

(declare-fun b!699063 () Bool)

(declare-fun res!462787 () Bool)

(assert (=> b!699063 (=> (not res!462787) (not e!397237))))

(assert (=> b!699063 (= res!462787 (= (-!212 lt!317416 k0!2824) lt!317417))))

(declare-fun b!699064 () Bool)

(declare-fun res!462773 () Bool)

(assert (=> b!699064 (=> (not res!462773) (not e!397238))))

(assert (=> b!699064 (= res!462773 (not (contains!3780 acc!652 k0!2824)))))

(declare-fun b!699065 () Bool)

(declare-fun res!462791 () Bool)

(assert (=> b!699065 (=> (not res!462791) (not e!397238))))

(assert (=> b!699065 (= res!462791 (contains!3780 newAcc!49 k0!2824))))

(declare-fun b!699066 () Bool)

(declare-fun res!462772 () Bool)

(assert (=> b!699066 (=> (not res!462772) (not e!397238))))

(assert (=> b!699066 (= res!462772 (not (contains!3780 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!462785 () Bool)

(assert (=> start!62434 (=> (not res!462785) (not e!397238))))

(assert (=> start!62434 (= res!462785 (and (bvslt (size!19563 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19563 a!3591))))))

(assert (=> start!62434 e!397238))

(assert (=> start!62434 true))

(declare-fun array_inv!15039 (array!40053) Bool)

(assert (=> start!62434 (array_inv!15039 a!3591)))

(declare-fun b!699067 () Bool)

(declare-fun res!462789 () Bool)

(assert (=> b!699067 (=> (not res!462789) (not e!397237))))

(assert (=> b!699067 (= res!462789 (subseq!248 lt!317417 lt!317416))))

(declare-fun b!699068 () Bool)

(declare-fun res!462788 () Bool)

(assert (=> b!699068 (=> (not res!462788) (not e!397238))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!699068 (= res!462788 (validKeyInArray!0 (select (arr!19180 a!3591) from!2969)))))

(declare-fun b!699069 () Bool)

(declare-fun res!462774 () Bool)

(assert (=> b!699069 (=> (not res!462774) (not e!397237))))

(assert (=> b!699069 (= res!462774 (not (contains!3780 lt!317416 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!699070 () Bool)

(declare-fun res!462792 () Bool)

(assert (=> b!699070 (=> (not res!462792) (not e!397238))))

(assert (=> b!699070 (= res!462792 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!699071 () Bool)

(declare-fun res!462784 () Bool)

(assert (=> b!699071 (=> (not res!462784) (not e!397237))))

(declare-fun noDuplicate!1054 (List!13128) Bool)

(assert (=> b!699071 (= res!462784 (noDuplicate!1054 lt!317416))))

(declare-fun b!699072 () Bool)

(declare-fun res!462786 () Bool)

(assert (=> b!699072 (=> (not res!462786) (not e!397238))))

(assert (=> b!699072 (= res!462786 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19563 a!3591)))))

(declare-fun b!699073 () Bool)

(declare-fun res!462781 () Bool)

(assert (=> b!699073 (=> (not res!462781) (not e!397238))))

(assert (=> b!699073 (= res!462781 (validKeyInArray!0 k0!2824))))

(declare-fun b!699074 () Bool)

(declare-fun res!462768 () Bool)

(assert (=> b!699074 (=> (not res!462768) (not e!397237))))

(assert (=> b!699074 (= res!462768 (noDuplicate!1054 lt!317417))))

(declare-fun b!699075 () Bool)

(assert (=> b!699075 (= e!397237 false)))

(declare-fun lt!317418 () Bool)

(assert (=> b!699075 (= lt!317418 (contains!3780 lt!317416 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!699076 () Bool)

(declare-fun res!462793 () Bool)

(assert (=> b!699076 (=> (not res!462793) (not e!397238))))

(assert (=> b!699076 (= res!462793 (not (contains!3780 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!699077 () Bool)

(declare-fun res!462780 () Bool)

(assert (=> b!699077 (=> (not res!462780) (not e!397238))))

(assert (=> b!699077 (= res!462780 (not (contains!3780 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!699078 () Bool)

(declare-fun res!462782 () Bool)

(assert (=> b!699078 (=> (not res!462782) (not e!397237))))

(assert (=> b!699078 (= res!462782 (not (contains!3780 lt!317417 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!699079 () Bool)

(declare-fun res!462771 () Bool)

(assert (=> b!699079 (=> (not res!462771) (not e!397238))))

(assert (=> b!699079 (= res!462771 (noDuplicate!1054 newAcc!49))))

(declare-fun b!699080 () Bool)

(declare-fun res!462775 () Bool)

(assert (=> b!699080 (=> (not res!462775) (not e!397237))))

(assert (=> b!699080 (= res!462775 (not (contains!3780 lt!317417 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!699081 () Bool)

(declare-fun res!462790 () Bool)

(assert (=> b!699081 (=> (not res!462790) (not e!397238))))

(assert (=> b!699081 (= res!462790 (noDuplicate!1054 acc!652))))

(declare-fun b!699082 () Bool)

(declare-fun res!462783 () Bool)

(assert (=> b!699082 (=> (not res!462783) (not e!397237))))

(assert (=> b!699082 (= res!462783 (not (contains!3780 lt!317417 k0!2824)))))

(assert (= (and start!62434 res!462785) b!699081))

(assert (= (and b!699081 res!462790) b!699079))

(assert (= (and b!699079 res!462771) b!699077))

(assert (= (and b!699077 res!462780) b!699066))

(assert (= (and b!699066 res!462772) b!699070))

(assert (= (and b!699070 res!462792) b!699064))

(assert (= (and b!699064 res!462773) b!699073))

(assert (= (and b!699073 res!462781) b!699056))

(assert (= (and b!699056 res!462767) b!699061))

(assert (= (and b!699061 res!462769) b!699065))

(assert (= (and b!699065 res!462791) b!699059))

(assert (= (and b!699059 res!462766) b!699076))

(assert (= (and b!699076 res!462793) b!699057))

(assert (= (and b!699057 res!462776) b!699072))

(assert (= (and b!699072 res!462786) b!699068))

(assert (= (and b!699068 res!462788) b!699055))

(assert (= (and b!699055 res!462777) b!699074))

(assert (= (and b!699074 res!462768) b!699071))

(assert (= (and b!699071 res!462784) b!699080))

(assert (= (and b!699080 res!462775) b!699078))

(assert (= (and b!699078 res!462782) b!699058))

(assert (= (and b!699058 res!462770) b!699082))

(assert (= (and b!699082 res!462783) b!699060))

(assert (= (and b!699060 res!462778) b!699067))

(assert (= (and b!699067 res!462789) b!699062))

(assert (= (and b!699062 res!462779) b!699063))

(assert (= (and b!699063 res!462787) b!699069))

(assert (= (and b!699069 res!462774) b!699075))

(declare-fun m!659631 () Bool)

(assert (=> b!699081 m!659631))

(declare-fun m!659633 () Bool)

(assert (=> b!699057 m!659633))

(declare-fun m!659635 () Bool)

(assert (=> b!699080 m!659635))

(declare-fun m!659637 () Bool)

(assert (=> b!699076 m!659637))

(declare-fun m!659639 () Bool)

(assert (=> b!699058 m!659639))

(declare-fun m!659641 () Bool)

(assert (=> b!699062 m!659641))

(declare-fun m!659643 () Bool)

(assert (=> b!699071 m!659643))

(declare-fun m!659645 () Bool)

(assert (=> b!699055 m!659645))

(assert (=> b!699055 m!659645))

(declare-fun m!659647 () Bool)

(assert (=> b!699055 m!659647))

(assert (=> b!699055 m!659645))

(declare-fun m!659649 () Bool)

(assert (=> b!699055 m!659649))

(declare-fun m!659651 () Bool)

(assert (=> b!699060 m!659651))

(declare-fun m!659653 () Bool)

(assert (=> b!699059 m!659653))

(declare-fun m!659655 () Bool)

(assert (=> b!699073 m!659655))

(declare-fun m!659657 () Bool)

(assert (=> b!699075 m!659657))

(declare-fun m!659659 () Bool)

(assert (=> b!699078 m!659659))

(declare-fun m!659661 () Bool)

(assert (=> b!699079 m!659661))

(declare-fun m!659663 () Bool)

(assert (=> b!699066 m!659663))

(declare-fun m!659665 () Bool)

(assert (=> b!699065 m!659665))

(declare-fun m!659667 () Bool)

(assert (=> b!699064 m!659667))

(declare-fun m!659669 () Bool)

(assert (=> b!699069 m!659669))

(declare-fun m!659671 () Bool)

(assert (=> b!699074 m!659671))

(declare-fun m!659673 () Bool)

(assert (=> b!699077 m!659673))

(declare-fun m!659675 () Bool)

(assert (=> b!699056 m!659675))

(declare-fun m!659677 () Bool)

(assert (=> b!699082 m!659677))

(declare-fun m!659679 () Bool)

(assert (=> b!699070 m!659679))

(assert (=> b!699068 m!659645))

(assert (=> b!699068 m!659645))

(declare-fun m!659681 () Bool)

(assert (=> b!699068 m!659681))

(declare-fun m!659683 () Bool)

(assert (=> b!699061 m!659683))

(declare-fun m!659685 () Bool)

(assert (=> b!699063 m!659685))

(declare-fun m!659687 () Bool)

(assert (=> b!699067 m!659687))

(declare-fun m!659689 () Bool)

(assert (=> start!62434 m!659689))

(check-sat (not b!699074) (not b!699061) (not b!699081) (not b!699068) (not b!699060) (not b!699063) (not b!699076) (not b!699059) (not b!699064) (not b!699082) (not b!699058) (not b!699062) (not b!699075) (not start!62434) (not b!699073) (not b!699067) (not b!699077) (not b!699066) (not b!699057) (not b!699078) (not b!699055) (not b!699079) (not b!699056) (not b!699070) (not b!699065) (not b!699069) (not b!699080) (not b!699071))
(check-sat)
