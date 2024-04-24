; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60258 () Bool)

(assert start!60258)

(declare-fun b!673656 () Bool)

(declare-fun res!440100 () Bool)

(declare-fun e!384708 () Bool)

(assert (=> b!673656 (=> (not res!440100) (not e!384708))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39243 0))(
  ( (array!39244 (arr!18811 (Array (_ BitVec 32) (_ BitVec 64))) (size!19175 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39243)

(assert (=> b!673656 (= res!440100 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19175 a!3626))))))

(declare-fun res!440094 () Bool)

(assert (=> start!60258 (=> (not res!440094) (not e!384708))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!60258 (= res!440094 (and (bvslt (size!19175 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19175 a!3626))))))

(assert (=> start!60258 e!384708))

(assert (=> start!60258 true))

(declare-fun array_inv!14670 (array!39243) Bool)

(assert (=> start!60258 (array_inv!14670 a!3626)))

(declare-fun b!673657 () Bool)

(declare-fun e!384707 () Bool)

(assert (=> b!673657 (= e!384708 e!384707)))

(declare-fun res!440101 () Bool)

(assert (=> b!673657 (=> (not res!440101) (not e!384707))))

(declare-fun k0!2843 () (_ BitVec 64))

(assert (=> b!673657 (= res!440101 (not (= (select (arr!18811 a!3626) from!3004) k0!2843)))))

(declare-datatypes ((Unit!23655 0))(
  ( (Unit!23656) )
))
(declare-fun lt!312567 () Unit!23655)

(declare-fun e!384703 () Unit!23655)

(assert (=> b!673657 (= lt!312567 e!384703)))

(declare-fun c!77150 () Bool)

(assert (=> b!673657 (= c!77150 (= (select (arr!18811 a!3626) from!3004) k0!2843))))

(declare-fun b!673658 () Bool)

(declare-fun res!440110 () Bool)

(assert (=> b!673658 (=> (not res!440110) (not e!384708))))

(declare-fun e!384701 () Bool)

(assert (=> b!673658 (= res!440110 e!384701)))

(declare-fun res!440112 () Bool)

(assert (=> b!673658 (=> res!440112 e!384701)))

(declare-fun e!384706 () Bool)

(assert (=> b!673658 (= res!440112 e!384706)))

(declare-fun res!440109 () Bool)

(assert (=> b!673658 (=> (not res!440109) (not e!384706))))

(assert (=> b!673658 (= res!440109 (bvsgt from!3004 i!1382))))

(declare-fun b!673659 () Bool)

(declare-fun res!440097 () Bool)

(declare-fun e!384710 () Bool)

(assert (=> b!673659 (=> (not res!440097) (not e!384710))))

(declare-datatypes ((List!12759 0))(
  ( (Nil!12756) (Cons!12755 (h!13803 (_ BitVec 64)) (t!18979 List!12759)) )
))
(declare-fun lt!312566 () List!12759)

(declare-fun contains!3411 (List!12759 (_ BitVec 64)) Bool)

(assert (=> b!673659 (= res!440097 (not (contains!3411 lt!312566 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!673660 () Bool)

(assert (=> b!673660 (= e!384710 false)))

(declare-fun lt!312565 () Bool)

(declare-fun arrayNoDuplicates!0 (array!39243 (_ BitVec 32) List!12759) Bool)

(assert (=> b!673660 (= lt!312565 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!312566))))

(declare-fun b!673661 () Bool)

(declare-fun Unit!23657 () Unit!23655)

(assert (=> b!673661 (= e!384703 Unit!23657)))

(declare-fun b!673662 () Bool)

(declare-fun res!440111 () Bool)

(assert (=> b!673662 (=> (not res!440111) (not e!384708))))

(assert (=> b!673662 (= res!440111 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19175 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!673663 () Bool)

(declare-fun e!384705 () Bool)

(declare-fun acc!681 () List!12759)

(assert (=> b!673663 (= e!384705 (not (contains!3411 acc!681 k0!2843)))))

(declare-fun b!673664 () Bool)

(declare-fun res!440102 () Bool)

(assert (=> b!673664 (=> (not res!440102) (not e!384710))))

(declare-fun noDuplicate!685 (List!12759) Bool)

(assert (=> b!673664 (= res!440102 (noDuplicate!685 lt!312566))))

(declare-fun b!673665 () Bool)

(declare-fun res!440105 () Bool)

(assert (=> b!673665 (=> (not res!440105) (not e!384708))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!673665 (= res!440105 (validKeyInArray!0 (select (arr!18811 a!3626) from!3004)))))

(declare-fun b!673666 () Bool)

(declare-fun e!384709 () Bool)

(assert (=> b!673666 (= e!384709 (not (contains!3411 lt!312566 k0!2843)))))

(declare-fun b!673667 () Bool)

(declare-fun res!440106 () Bool)

(assert (=> b!673667 (=> (not res!440106) (not e!384708))))

(assert (=> b!673667 (= res!440106 (validKeyInArray!0 k0!2843))))

(declare-fun b!673668 () Bool)

(declare-fun res!440107 () Bool)

(assert (=> b!673668 (=> (not res!440107) (not e!384710))))

(declare-fun e!384702 () Bool)

(assert (=> b!673668 (= res!440107 e!384702)))

(declare-fun res!440113 () Bool)

(assert (=> b!673668 (=> res!440113 e!384702)))

(declare-fun e!384704 () Bool)

(assert (=> b!673668 (= res!440113 e!384704)))

(declare-fun res!440096 () Bool)

(assert (=> b!673668 (=> (not res!440096) (not e!384704))))

(assert (=> b!673668 (= res!440096 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!673669 () Bool)

(declare-fun res!440099 () Bool)

(assert (=> b!673669 (=> (not res!440099) (not e!384708))))

(assert (=> b!673669 (= res!440099 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12756))))

(declare-fun b!673670 () Bool)

(assert (=> b!673670 (= e!384707 e!384710)))

(declare-fun res!440114 () Bool)

(assert (=> b!673670 (=> (not res!440114) (not e!384710))))

(assert (=> b!673670 (= res!440114 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!281 (List!12759 (_ BitVec 64)) List!12759)

(assert (=> b!673670 (= lt!312566 ($colon$colon!281 acc!681 (select (arr!18811 a!3626) from!3004)))))

(declare-fun b!673671 () Bool)

(assert (=> b!673671 (= e!384706 (contains!3411 acc!681 k0!2843))))

(declare-fun b!673672 () Bool)

(assert (=> b!673672 (= e!384701 e!384705)))

(declare-fun res!440095 () Bool)

(assert (=> b!673672 (=> (not res!440095) (not e!384705))))

(assert (=> b!673672 (= res!440095 (bvsle from!3004 i!1382))))

(declare-fun b!673673 () Bool)

(declare-fun res!440104 () Bool)

(assert (=> b!673673 (=> (not res!440104) (not e!384708))))

(declare-fun arrayContainsKey!0 (array!39243 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!673673 (= res!440104 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!673674 () Bool)

(declare-fun Unit!23658 () Unit!23655)

(assert (=> b!673674 (= e!384703 Unit!23658)))

(assert (=> b!673674 (arrayContainsKey!0 a!3626 k0!2843 from!3004)))

(declare-fun lt!312568 () Unit!23655)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39243 (_ BitVec 64) (_ BitVec 32)) Unit!23655)

(assert (=> b!673674 (= lt!312568 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!673674 false))

(declare-fun b!673675 () Bool)

(declare-fun res!440116 () Bool)

(assert (=> b!673675 (=> (not res!440116) (not e!384708))))

(assert (=> b!673675 (= res!440116 (noDuplicate!685 acc!681))))

(declare-fun b!673676 () Bool)

(assert (=> b!673676 (= e!384702 e!384709)))

(declare-fun res!440103 () Bool)

(assert (=> b!673676 (=> (not res!440103) (not e!384709))))

(assert (=> b!673676 (= res!440103 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!673677 () Bool)

(declare-fun res!440098 () Bool)

(assert (=> b!673677 (=> (not res!440098) (not e!384710))))

(assert (=> b!673677 (= res!440098 (not (contains!3411 lt!312566 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!673678 () Bool)

(declare-fun res!440115 () Bool)

(assert (=> b!673678 (=> (not res!440115) (not e!384708))))

(assert (=> b!673678 (= res!440115 (not (contains!3411 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!673679 () Bool)

(assert (=> b!673679 (= e!384704 (contains!3411 lt!312566 k0!2843))))

(declare-fun b!673680 () Bool)

(declare-fun res!440108 () Bool)

(assert (=> b!673680 (=> (not res!440108) (not e!384708))))

(assert (=> b!673680 (= res!440108 (not (contains!3411 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!673681 () Bool)

(declare-fun res!440093 () Bool)

(assert (=> b!673681 (=> (not res!440093) (not e!384708))))

(assert (=> b!673681 (= res!440093 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(assert (= (and start!60258 res!440094) b!673675))

(assert (= (and b!673675 res!440116) b!673680))

(assert (= (and b!673680 res!440108) b!673678))

(assert (= (and b!673678 res!440115) b!673658))

(assert (= (and b!673658 res!440109) b!673671))

(assert (= (and b!673658 (not res!440112)) b!673672))

(assert (= (and b!673672 res!440095) b!673663))

(assert (= (and b!673658 res!440110) b!673669))

(assert (= (and b!673669 res!440099) b!673681))

(assert (= (and b!673681 res!440093) b!673656))

(assert (= (and b!673656 res!440100) b!673667))

(assert (= (and b!673667 res!440106) b!673673))

(assert (= (and b!673673 res!440104) b!673662))

(assert (= (and b!673662 res!440111) b!673665))

(assert (= (and b!673665 res!440105) b!673657))

(assert (= (and b!673657 c!77150) b!673674))

(assert (= (and b!673657 (not c!77150)) b!673661))

(assert (= (and b!673657 res!440101) b!673670))

(assert (= (and b!673670 res!440114) b!673664))

(assert (= (and b!673664 res!440102) b!673677))

(assert (= (and b!673677 res!440098) b!673659))

(assert (= (and b!673659 res!440097) b!673668))

(assert (= (and b!673668 res!440096) b!673679))

(assert (= (and b!673668 (not res!440113)) b!673676))

(assert (= (and b!673676 res!440103) b!673666))

(assert (= (and b!673668 res!440107) b!673660))

(declare-fun m!642583 () Bool)

(assert (=> b!673660 m!642583))

(declare-fun m!642585 () Bool)

(assert (=> b!673681 m!642585))

(declare-fun m!642587 () Bool)

(assert (=> b!673679 m!642587))

(declare-fun m!642589 () Bool)

(assert (=> b!673674 m!642589))

(declare-fun m!642591 () Bool)

(assert (=> b!673674 m!642591))

(declare-fun m!642593 () Bool)

(assert (=> b!673663 m!642593))

(assert (=> b!673666 m!642587))

(declare-fun m!642595 () Bool)

(assert (=> b!673659 m!642595))

(declare-fun m!642597 () Bool)

(assert (=> b!673680 m!642597))

(declare-fun m!642599 () Bool)

(assert (=> b!673657 m!642599))

(declare-fun m!642601 () Bool)

(assert (=> b!673669 m!642601))

(declare-fun m!642603 () Bool)

(assert (=> b!673673 m!642603))

(declare-fun m!642605 () Bool)

(assert (=> b!673675 m!642605))

(assert (=> b!673670 m!642599))

(assert (=> b!673670 m!642599))

(declare-fun m!642607 () Bool)

(assert (=> b!673670 m!642607))

(declare-fun m!642609 () Bool)

(assert (=> b!673664 m!642609))

(declare-fun m!642611 () Bool)

(assert (=> b!673678 m!642611))

(declare-fun m!642613 () Bool)

(assert (=> start!60258 m!642613))

(assert (=> b!673665 m!642599))

(assert (=> b!673665 m!642599))

(declare-fun m!642615 () Bool)

(assert (=> b!673665 m!642615))

(declare-fun m!642617 () Bool)

(assert (=> b!673677 m!642617))

(assert (=> b!673671 m!642593))

(declare-fun m!642619 () Bool)

(assert (=> b!673667 m!642619))

(check-sat (not b!673667) (not b!673665) (not b!673679) (not b!673660) (not b!673677) (not b!673675) (not start!60258) (not b!673681) (not b!673671) (not b!673673) (not b!673680) (not b!673670) (not b!673666) (not b!673664) (not b!673659) (not b!673678) (not b!673669) (not b!673663) (not b!673674))
(check-sat)
