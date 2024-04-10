; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59890 () Bool)

(assert start!59890)

(declare-fun b!662834 () Bool)

(declare-fun res!430809 () Bool)

(declare-fun e!380447 () Bool)

(assert (=> b!662834 (=> (not res!430809) (not e!380447))))

(declare-datatypes ((array!38937 0))(
  ( (array!38938 (arr!18661 (Array (_ BitVec 32) (_ BitVec 64))) (size!19025 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38937)

(declare-datatypes ((List!12702 0))(
  ( (Nil!12699) (Cons!12698 (h!13743 (_ BitVec 64)) (t!18930 List!12702)) )
))
(declare-fun arrayNoDuplicates!0 (array!38937 (_ BitVec 32) List!12702) Bool)

(assert (=> b!662834 (= res!430809 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12699))))

(declare-fun b!662835 () Bool)

(declare-fun res!430804 () Bool)

(assert (=> b!662835 (=> (not res!430804) (not e!380447))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!662835 (= res!430804 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19025 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!662836 () Bool)

(declare-fun res!430803 () Bool)

(declare-fun e!380453 () Bool)

(assert (=> b!662836 (=> res!430803 e!380453)))

(declare-fun lt!309124 () List!12702)

(declare-fun noDuplicate!526 (List!12702) Bool)

(assert (=> b!662836 (= res!430803 (not (noDuplicate!526 lt!309124)))))

(declare-fun b!662837 () Bool)

(declare-fun res!430801 () Bool)

(assert (=> b!662837 (=> (not res!430801) (not e!380447))))

(declare-fun e!380452 () Bool)

(assert (=> b!662837 (= res!430801 e!380452)))

(declare-fun res!430812 () Bool)

(assert (=> b!662837 (=> res!430812 e!380452)))

(declare-fun e!380451 () Bool)

(assert (=> b!662837 (= res!430812 e!380451)))

(declare-fun res!430800 () Bool)

(assert (=> b!662837 (=> (not res!430800) (not e!380451))))

(assert (=> b!662837 (= res!430800 (bvsgt from!3004 i!1382))))

(declare-fun b!662838 () Bool)

(declare-fun res!430813 () Bool)

(assert (=> b!662838 (=> (not res!430813) (not e!380447))))

(assert (=> b!662838 (= res!430813 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19025 a!3626))))))

(declare-fun res!430805 () Bool)

(assert (=> start!59890 (=> (not res!430805) (not e!380447))))

(assert (=> start!59890 (= res!430805 (and (bvslt (size!19025 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19025 a!3626))))))

(assert (=> start!59890 e!380447))

(assert (=> start!59890 true))

(declare-fun array_inv!14457 (array!38937) Bool)

(assert (=> start!59890 (array_inv!14457 a!3626)))

(declare-fun b!662839 () Bool)

(declare-fun e!380449 () Bool)

(assert (=> b!662839 (= e!380452 e!380449)))

(declare-fun res!430815 () Bool)

(assert (=> b!662839 (=> (not res!430815) (not e!380449))))

(assert (=> b!662839 (= res!430815 (bvsle from!3004 i!1382))))

(declare-fun b!662840 () Bool)

(declare-datatypes ((Unit!23038 0))(
  ( (Unit!23039) )
))
(declare-fun e!380450 () Unit!23038)

(declare-fun Unit!23040 () Unit!23038)

(assert (=> b!662840 (= e!380450 Unit!23040)))

(declare-fun lt!309120 () Unit!23038)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38937 (_ BitVec 64) (_ BitVec 32)) Unit!23038)

(assert (=> b!662840 (= lt!309120 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!662840 false))

(declare-fun b!662841 () Bool)

(declare-fun res!430807 () Bool)

(assert (=> b!662841 (=> (not res!430807) (not e!380447))))

(declare-fun acc!681 () List!12702)

(assert (=> b!662841 (= res!430807 (noDuplicate!526 acc!681))))

(declare-fun b!662842 () Bool)

(declare-fun e!380454 () Bool)

(assert (=> b!662842 (= e!380447 (not e!380454))))

(declare-fun res!430808 () Bool)

(assert (=> b!662842 (=> res!430808 e!380454)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!662842 (= res!430808 (not (validKeyInArray!0 (select (arr!18661 a!3626) from!3004))))))

(declare-fun lt!309121 () Unit!23038)

(assert (=> b!662842 (= lt!309121 e!380450)))

(declare-fun c!76385 () Bool)

(declare-fun arrayContainsKey!0 (array!38937 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!662842 (= c!76385 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!662842 (arrayContainsKey!0 (array!38938 (store (arr!18661 a!3626) i!1382 k0!2843) (size!19025 a!3626)) k0!2843 from!3004)))

(declare-fun b!662843 () Bool)

(declare-fun res!430816 () Bool)

(assert (=> b!662843 (=> (not res!430816) (not e!380447))))

(assert (=> b!662843 (= res!430816 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!662844 () Bool)

(declare-fun res!430802 () Bool)

(assert (=> b!662844 (=> (not res!430802) (not e!380447))))

(declare-fun contains!3279 (List!12702 (_ BitVec 64)) Bool)

(assert (=> b!662844 (= res!430802 (not (contains!3279 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!662845 () Bool)

(declare-fun res!430811 () Bool)

(assert (=> b!662845 (=> (not res!430811) (not e!380447))))

(assert (=> b!662845 (= res!430811 (not (contains!3279 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!662846 () Bool)

(declare-fun res!430814 () Bool)

(assert (=> b!662846 (=> res!430814 e!380453)))

(assert (=> b!662846 (= res!430814 (contains!3279 lt!309124 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!662847 () Bool)

(declare-fun res!430810 () Bool)

(assert (=> b!662847 (=> res!430810 e!380453)))

(assert (=> b!662847 (= res!430810 (contains!3279 lt!309124 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!662848 () Bool)

(assert (=> b!662848 (= e!380453 true)))

(declare-fun lt!309122 () Bool)

(assert (=> b!662848 (= lt!309122 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!309124))))

(declare-fun lt!309123 () Unit!23038)

(declare-fun noDuplicateSubseq!18 (List!12702 List!12702) Unit!23038)

(assert (=> b!662848 (= lt!309123 (noDuplicateSubseq!18 acc!681 lt!309124))))

(declare-fun b!662849 () Bool)

(declare-fun res!430799 () Bool)

(assert (=> b!662849 (=> (not res!430799) (not e!380447))))

(assert (=> b!662849 (= res!430799 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!662850 () Bool)

(assert (=> b!662850 (= e!380451 (contains!3279 acc!681 k0!2843))))

(declare-fun b!662851 () Bool)

(declare-fun res!430806 () Bool)

(assert (=> b!662851 (=> (not res!430806) (not e!380447))))

(assert (=> b!662851 (= res!430806 (validKeyInArray!0 k0!2843))))

(declare-fun b!662852 () Bool)

(declare-fun Unit!23041 () Unit!23038)

(assert (=> b!662852 (= e!380450 Unit!23041)))

(declare-fun b!662853 () Bool)

(assert (=> b!662853 (= e!380454 e!380453)))

(declare-fun res!430817 () Bool)

(assert (=> b!662853 (=> res!430817 e!380453)))

(assert (=> b!662853 (= res!430817 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!150 (List!12702 (_ BitVec 64)) List!12702)

(assert (=> b!662853 (= lt!309124 ($colon$colon!150 acc!681 (select (arr!18661 a!3626) from!3004)))))

(declare-fun subseq!18 (List!12702 List!12702) Bool)

(assert (=> b!662853 (subseq!18 acc!681 acc!681)))

(declare-fun lt!309119 () Unit!23038)

(declare-fun lemmaListSubSeqRefl!0 (List!12702) Unit!23038)

(assert (=> b!662853 (= lt!309119 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!662854 () Bool)

(declare-fun res!430798 () Bool)

(assert (=> b!662854 (=> res!430798 e!380453)))

(assert (=> b!662854 (= res!430798 (not (subseq!18 acc!681 lt!309124)))))

(declare-fun b!662855 () Bool)

(assert (=> b!662855 (= e!380449 (not (contains!3279 acc!681 k0!2843)))))

(assert (= (and start!59890 res!430805) b!662841))

(assert (= (and b!662841 res!430807) b!662844))

(assert (= (and b!662844 res!430802) b!662845))

(assert (= (and b!662845 res!430811) b!662837))

(assert (= (and b!662837 res!430800) b!662850))

(assert (= (and b!662837 (not res!430812)) b!662839))

(assert (= (and b!662839 res!430815) b!662855))

(assert (= (and b!662837 res!430801) b!662834))

(assert (= (and b!662834 res!430809) b!662843))

(assert (= (and b!662843 res!430816) b!662838))

(assert (= (and b!662838 res!430813) b!662851))

(assert (= (and b!662851 res!430806) b!662849))

(assert (= (and b!662849 res!430799) b!662835))

(assert (= (and b!662835 res!430804) b!662842))

(assert (= (and b!662842 c!76385) b!662840))

(assert (= (and b!662842 (not c!76385)) b!662852))

(assert (= (and b!662842 (not res!430808)) b!662853))

(assert (= (and b!662853 (not res!430817)) b!662836))

(assert (= (and b!662836 (not res!430803)) b!662846))

(assert (= (and b!662846 (not res!430814)) b!662847))

(assert (= (and b!662847 (not res!430810)) b!662854))

(assert (= (and b!662854 (not res!430798)) b!662848))

(declare-fun m!634565 () Bool)

(assert (=> b!662834 m!634565))

(declare-fun m!634567 () Bool)

(assert (=> b!662844 m!634567))

(declare-fun m!634569 () Bool)

(assert (=> b!662845 m!634569))

(declare-fun m!634571 () Bool)

(assert (=> b!662846 m!634571))

(declare-fun m!634573 () Bool)

(assert (=> b!662849 m!634573))

(declare-fun m!634575 () Bool)

(assert (=> b!662841 m!634575))

(declare-fun m!634577 () Bool)

(assert (=> b!662843 m!634577))

(declare-fun m!634579 () Bool)

(assert (=> start!59890 m!634579))

(declare-fun m!634581 () Bool)

(assert (=> b!662840 m!634581))

(declare-fun m!634583 () Bool)

(assert (=> b!662847 m!634583))

(declare-fun m!634585 () Bool)

(assert (=> b!662855 m!634585))

(assert (=> b!662850 m!634585))

(declare-fun m!634587 () Bool)

(assert (=> b!662836 m!634587))

(declare-fun m!634589 () Bool)

(assert (=> b!662848 m!634589))

(declare-fun m!634591 () Bool)

(assert (=> b!662848 m!634591))

(declare-fun m!634593 () Bool)

(assert (=> b!662853 m!634593))

(assert (=> b!662853 m!634593))

(declare-fun m!634595 () Bool)

(assert (=> b!662853 m!634595))

(declare-fun m!634597 () Bool)

(assert (=> b!662853 m!634597))

(declare-fun m!634599 () Bool)

(assert (=> b!662853 m!634599))

(declare-fun m!634601 () Bool)

(assert (=> b!662854 m!634601))

(declare-fun m!634603 () Bool)

(assert (=> b!662851 m!634603))

(assert (=> b!662842 m!634593))

(declare-fun m!634605 () Bool)

(assert (=> b!662842 m!634605))

(declare-fun m!634607 () Bool)

(assert (=> b!662842 m!634607))

(assert (=> b!662842 m!634593))

(declare-fun m!634609 () Bool)

(assert (=> b!662842 m!634609))

(declare-fun m!634611 () Bool)

(assert (=> b!662842 m!634611))

(check-sat (not b!662847) (not start!59890) (not b!662853) (not b!662844) (not b!662840) (not b!662845) (not b!662836) (not b!662843) (not b!662848) (not b!662834) (not b!662842) (not b!662850) (not b!662846) (not b!662851) (not b!662849) (not b!662854) (not b!662841) (not b!662855))
(check-sat)
