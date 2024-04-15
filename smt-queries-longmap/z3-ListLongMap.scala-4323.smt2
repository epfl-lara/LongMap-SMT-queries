; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59954 () Bool)

(assert start!59954)

(declare-fun b!665007 () Bool)

(declare-fun e!381126 () Bool)

(declare-fun e!381131 () Bool)

(assert (=> b!665007 (= e!381126 (not e!381131))))

(declare-fun res!432725 () Bool)

(assert (=> b!665007 (=> res!432725 e!381131)))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!665007 (= res!432725 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-datatypes ((List!12778 0))(
  ( (Nil!12775) (Cons!12774 (h!13819 (_ BitVec 64)) (t!18997 List!12778)) )
))
(declare-fun lt!309710 () List!12778)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun acc!681 () List!12778)

(declare-fun -!54 (List!12778 (_ BitVec 64)) List!12778)

(assert (=> b!665007 (= (-!54 lt!309710 k0!2843) acc!681)))

(declare-fun $colon$colon!187 (List!12778 (_ BitVec 64)) List!12778)

(assert (=> b!665007 (= lt!309710 ($colon$colon!187 acc!681 k0!2843))))

(declare-datatypes ((Unit!23198 0))(
  ( (Unit!23199) )
))
(declare-fun lt!309716 () Unit!23198)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12778) Unit!23198)

(assert (=> b!665007 (= lt!309716 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(declare-fun subseq!56 (List!12778 List!12778) Bool)

(assert (=> b!665007 (subseq!56 acc!681 acc!681)))

(declare-fun lt!309711 () Unit!23198)

(declare-fun lemmaListSubSeqRefl!0 (List!12778) Unit!23198)

(assert (=> b!665007 (= lt!309711 (lemmaListSubSeqRefl!0 acc!681))))

(declare-datatypes ((array!39012 0))(
  ( (array!39013 (arr!18698 (Array (_ BitVec 32) (_ BitVec 64))) (size!19063 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39012)

(declare-fun arrayNoDuplicates!0 (array!39012 (_ BitVec 32) List!12778) Bool)

(assert (=> b!665007 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!309709 () Unit!23198)

(declare-fun e!381127 () Unit!23198)

(assert (=> b!665007 (= lt!309709 e!381127)))

(declare-fun c!76511 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!665007 (= c!76511 (validKeyInArray!0 (select (arr!18698 a!3626) from!3004)))))

(declare-fun lt!309717 () Unit!23198)

(declare-fun e!381129 () Unit!23198)

(assert (=> b!665007 (= lt!309717 e!381129)))

(declare-fun c!76512 () Bool)

(declare-fun lt!309713 () Bool)

(assert (=> b!665007 (= c!76512 lt!309713)))

(declare-fun arrayContainsKey!0 (array!39012 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!665007 (= lt!309713 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!665007 (arrayContainsKey!0 (array!39013 (store (arr!18698 a!3626) i!1382 k0!2843) (size!19063 a!3626)) k0!2843 from!3004)))

(declare-fun b!665008 () Bool)

(declare-fun res!432720 () Bool)

(assert (=> b!665008 (=> res!432720 e!381131)))

(declare-fun contains!3300 (List!12778 (_ BitVec 64)) Bool)

(assert (=> b!665008 (= res!432720 (contains!3300 lt!309710 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!665009 () Bool)

(declare-fun res!432724 () Bool)

(assert (=> b!665009 (=> (not res!432724) (not e!381126))))

(assert (=> b!665009 (= res!432724 (validKeyInArray!0 k0!2843))))

(declare-fun b!665010 () Bool)

(assert (=> b!665010 (= e!381131 true)))

(declare-fun lt!309712 () Bool)

(assert (=> b!665010 (= lt!309712 (contains!3300 lt!309710 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!665011 () Bool)

(declare-fun e!381128 () Bool)

(assert (=> b!665011 (= e!381128 (not (contains!3300 acc!681 k0!2843)))))

(declare-fun b!665012 () Bool)

(declare-fun res!432719 () Bool)

(assert (=> b!665012 (=> (not res!432719) (not e!381126))))

(declare-fun noDuplicate!569 (List!12778) Bool)

(assert (=> b!665012 (= res!432719 (noDuplicate!569 acc!681))))

(declare-fun b!665013 () Bool)

(declare-fun res!432739 () Bool)

(assert (=> b!665013 (=> res!432739 e!381131)))

(assert (=> b!665013 (= res!432739 (not (contains!3300 lt!309710 k0!2843)))))

(declare-fun b!665014 () Bool)

(declare-fun e!381130 () Bool)

(assert (=> b!665014 (= e!381130 e!381128)))

(declare-fun res!432737 () Bool)

(assert (=> b!665014 (=> (not res!432737) (not e!381128))))

(assert (=> b!665014 (= res!432737 (bvsle from!3004 i!1382))))

(declare-fun b!665015 () Bool)

(declare-fun res!432731 () Bool)

(assert (=> b!665015 (=> (not res!432731) (not e!381126))))

(assert (=> b!665015 (= res!432731 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun res!432736 () Bool)

(assert (=> start!59954 (=> (not res!432736) (not e!381126))))

(assert (=> start!59954 (= res!432736 (and (bvslt (size!19063 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19063 a!3626))))))

(assert (=> start!59954 e!381126))

(assert (=> start!59954 true))

(declare-fun array_inv!14581 (array!39012) Bool)

(assert (=> start!59954 (array_inv!14581 a!3626)))

(declare-fun b!665016 () Bool)

(declare-fun lt!309714 () Unit!23198)

(assert (=> b!665016 (= e!381127 lt!309714)))

(declare-fun lt!309715 () Unit!23198)

(assert (=> b!665016 (= lt!309715 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!665016 (subseq!56 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39012 List!12778 List!12778 (_ BitVec 32)) Unit!23198)

(assert (=> b!665016 (= lt!309714 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!187 acc!681 (select (arr!18698 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!665016 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!665017 () Bool)

(declare-fun res!432726 () Bool)

(assert (=> b!665017 (=> (not res!432726) (not e!381126))))

(assert (=> b!665017 (= res!432726 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19063 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!665018 () Bool)

(declare-fun res!432728 () Bool)

(assert (=> b!665018 (=> res!432728 e!381131)))

(assert (=> b!665018 (= res!432728 (not (subseq!56 acc!681 lt!309710)))))

(declare-fun b!665019 () Bool)

(declare-fun res!432738 () Bool)

(assert (=> b!665019 (=> res!432738 e!381131)))

(assert (=> b!665019 (= res!432738 (contains!3300 acc!681 k0!2843))))

(declare-fun b!665020 () Bool)

(declare-fun Unit!23200 () Unit!23198)

(assert (=> b!665020 (= e!381129 Unit!23200)))

(declare-fun lt!309708 () Unit!23198)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39012 (_ BitVec 64) (_ BitVec 32)) Unit!23198)

(assert (=> b!665020 (= lt!309708 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!665020 false))

(declare-fun b!665021 () Bool)

(declare-fun res!432721 () Bool)

(assert (=> b!665021 (=> (not res!432721) (not e!381126))))

(assert (=> b!665021 (= res!432721 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!665022 () Bool)

(declare-fun Unit!23201 () Unit!23198)

(assert (=> b!665022 (= e!381129 Unit!23201)))

(declare-fun b!665023 () Bool)

(declare-fun e!381124 () Bool)

(assert (=> b!665023 (= e!381124 (contains!3300 acc!681 k0!2843))))

(declare-fun b!665024 () Bool)

(declare-fun res!432723 () Bool)

(assert (=> b!665024 (=> (not res!432723) (not e!381126))))

(assert (=> b!665024 (= res!432723 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12775))))

(declare-fun b!665025 () Bool)

(declare-fun res!432729 () Bool)

(assert (=> b!665025 (=> (not res!432729) (not e!381126))))

(assert (=> b!665025 (= res!432729 (not (contains!3300 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!665026 () Bool)

(declare-fun res!432727 () Bool)

(assert (=> b!665026 (=> (not res!432727) (not e!381126))))

(assert (=> b!665026 (= res!432727 (not (contains!3300 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!665027 () Bool)

(declare-fun res!432733 () Bool)

(assert (=> b!665027 (=> (not res!432733) (not e!381126))))

(assert (=> b!665027 (= res!432733 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19063 a!3626))))))

(declare-fun b!665028 () Bool)

(declare-fun Unit!23202 () Unit!23198)

(assert (=> b!665028 (= e!381127 Unit!23202)))

(declare-fun b!665029 () Bool)

(declare-fun res!432735 () Bool)

(assert (=> b!665029 (=> res!432735 e!381131)))

(assert (=> b!665029 (= res!432735 lt!309713)))

(declare-fun b!665030 () Bool)

(declare-fun res!432734 () Bool)

(assert (=> b!665030 (=> res!432734 e!381131)))

(assert (=> b!665030 (= res!432734 (not (noDuplicate!569 lt!309710)))))

(declare-fun b!665031 () Bool)

(declare-fun res!432732 () Bool)

(assert (=> b!665031 (=> (not res!432732) (not e!381126))))

(assert (=> b!665031 (= res!432732 e!381130)))

(declare-fun res!432730 () Bool)

(assert (=> b!665031 (=> res!432730 e!381130)))

(assert (=> b!665031 (= res!432730 e!381124)))

(declare-fun res!432722 () Bool)

(assert (=> b!665031 (=> (not res!432722) (not e!381124))))

(assert (=> b!665031 (= res!432722 (bvsgt from!3004 i!1382))))

(assert (= (and start!59954 res!432736) b!665012))

(assert (= (and b!665012 res!432719) b!665026))

(assert (= (and b!665026 res!432727) b!665025))

(assert (= (and b!665025 res!432729) b!665031))

(assert (= (and b!665031 res!432722) b!665023))

(assert (= (and b!665031 (not res!432730)) b!665014))

(assert (= (and b!665014 res!432737) b!665011))

(assert (= (and b!665031 res!432732) b!665024))

(assert (= (and b!665024 res!432723) b!665015))

(assert (= (and b!665015 res!432731) b!665027))

(assert (= (and b!665027 res!432733) b!665009))

(assert (= (and b!665009 res!432724) b!665021))

(assert (= (and b!665021 res!432721) b!665017))

(assert (= (and b!665017 res!432726) b!665007))

(assert (= (and b!665007 c!76512) b!665020))

(assert (= (and b!665007 (not c!76512)) b!665022))

(assert (= (and b!665007 c!76511) b!665016))

(assert (= (and b!665007 (not c!76511)) b!665028))

(assert (= (and b!665007 (not res!432725)) b!665030))

(assert (= (and b!665030 (not res!432734)) b!665029))

(assert (= (and b!665029 (not res!432735)) b!665019))

(assert (= (and b!665019 (not res!432738)) b!665018))

(assert (= (and b!665018 (not res!432728)) b!665013))

(assert (= (and b!665013 (not res!432739)) b!665008))

(assert (= (and b!665008 (not res!432720)) b!665010))

(declare-fun m!635607 () Bool)

(assert (=> b!665025 m!635607))

(declare-fun m!635609 () Bool)

(assert (=> b!665011 m!635609))

(declare-fun m!635611 () Bool)

(assert (=> b!665018 m!635611))

(declare-fun m!635613 () Bool)

(assert (=> b!665009 m!635613))

(declare-fun m!635615 () Bool)

(assert (=> b!665015 m!635615))

(declare-fun m!635617 () Bool)

(assert (=> b!665024 m!635617))

(assert (=> b!665019 m!635609))

(declare-fun m!635619 () Bool)

(assert (=> b!665008 m!635619))

(declare-fun m!635621 () Bool)

(assert (=> b!665007 m!635621))

(declare-fun m!635623 () Bool)

(assert (=> b!665007 m!635623))

(declare-fun m!635625 () Bool)

(assert (=> b!665007 m!635625))

(declare-fun m!635627 () Bool)

(assert (=> b!665007 m!635627))

(declare-fun m!635629 () Bool)

(assert (=> b!665007 m!635629))

(declare-fun m!635631 () Bool)

(assert (=> b!665007 m!635631))

(declare-fun m!635633 () Bool)

(assert (=> b!665007 m!635633))

(declare-fun m!635635 () Bool)

(assert (=> b!665007 m!635635))

(assert (=> b!665007 m!635623))

(declare-fun m!635637 () Bool)

(assert (=> b!665007 m!635637))

(declare-fun m!635639 () Bool)

(assert (=> b!665007 m!635639))

(declare-fun m!635641 () Bool)

(assert (=> b!665007 m!635641))

(declare-fun m!635643 () Bool)

(assert (=> b!665030 m!635643))

(declare-fun m!635645 () Bool)

(assert (=> b!665026 m!635645))

(assert (=> b!665016 m!635621))

(assert (=> b!665016 m!635623))

(declare-fun m!635647 () Bool)

(assert (=> b!665016 m!635647))

(declare-fun m!635649 () Bool)

(assert (=> b!665016 m!635649))

(assert (=> b!665016 m!635623))

(assert (=> b!665016 m!635647))

(assert (=> b!665016 m!635631))

(assert (=> b!665016 m!635641))

(declare-fun m!635651 () Bool)

(assert (=> b!665021 m!635651))

(declare-fun m!635653 () Bool)

(assert (=> start!59954 m!635653))

(declare-fun m!635655 () Bool)

(assert (=> b!665013 m!635655))

(declare-fun m!635657 () Bool)

(assert (=> b!665020 m!635657))

(assert (=> b!665023 m!635609))

(declare-fun m!635659 () Bool)

(assert (=> b!665012 m!635659))

(declare-fun m!635661 () Bool)

(assert (=> b!665010 m!635661))

(check-sat (not b!665015) (not b!665030) (not b!665011) (not b!665008) (not b!665010) (not start!59954) (not b!665007) (not b!665019) (not b!665020) (not b!665018) (not b!665024) (not b!665016) (not b!665009) (not b!665025) (not b!665023) (not b!665013) (not b!665021) (not b!665012) (not b!665026))
(check-sat)
