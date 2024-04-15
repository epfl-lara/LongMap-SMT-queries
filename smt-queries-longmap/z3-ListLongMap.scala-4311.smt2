; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59882 () Bool)

(assert start!59882)

(declare-fun b!662670 () Bool)

(declare-fun e!380306 () Bool)

(declare-datatypes ((List!12742 0))(
  ( (Nil!12739) (Cons!12738 (h!13783 (_ BitVec 64)) (t!18961 List!12742)) )
))
(declare-fun acc!681 () List!12742)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3264 (List!12742 (_ BitVec 64)) Bool)

(assert (=> b!662670 (= e!380306 (contains!3264 acc!681 k0!2843))))

(declare-fun b!662671 () Bool)

(declare-fun res!430788 () Bool)

(declare-fun e!380309 () Bool)

(assert (=> b!662671 (=> (not res!430788) (not e!380309))))

(declare-datatypes ((array!38940 0))(
  ( (array!38941 (arr!18662 (Array (_ BitVec 32) (_ BitVec 64))) (size!19027 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38940)

(declare-fun arrayContainsKey!0 (array!38940 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!662671 (= res!430788 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!662672 () Bool)

(declare-fun res!430787 () Bool)

(declare-fun e!380308 () Bool)

(assert (=> b!662672 (=> res!430787 e!380308)))

(declare-fun lt!308903 () List!12742)

(declare-fun noDuplicate!533 (List!12742) Bool)

(assert (=> b!662672 (= res!430787 (not (noDuplicate!533 lt!308903)))))

(declare-fun b!662673 () Bool)

(assert (=> b!662673 (= e!380308 true)))

(declare-fun lt!308902 () Bool)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!38940 (_ BitVec 32) List!12742) Bool)

(assert (=> b!662673 (= lt!308902 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!308903))))

(declare-datatypes ((Unit!23024 0))(
  ( (Unit!23025) )
))
(declare-fun lt!308899 () Unit!23024)

(declare-fun noDuplicateSubseq!20 (List!12742 List!12742) Unit!23024)

(assert (=> b!662673 (= lt!308899 (noDuplicateSubseq!20 acc!681 lt!308903))))

(declare-fun b!662674 () Bool)

(declare-fun res!430790 () Bool)

(assert (=> b!662674 (=> res!430790 e!380308)))

(assert (=> b!662674 (= res!430790 (contains!3264 lt!308903 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!662675 () Bool)

(declare-fun res!430795 () Bool)

(assert (=> b!662675 (=> (not res!430795) (not e!380309))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!662675 (= res!430795 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19027 a!3626))))))

(declare-fun b!662676 () Bool)

(declare-fun res!430794 () Bool)

(assert (=> b!662676 (=> (not res!430794) (not e!380309))))

(assert (=> b!662676 (= res!430794 (not (contains!3264 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!662677 () Bool)

(declare-fun e!380310 () Bool)

(assert (=> b!662677 (= e!380310 e!380308)))

(declare-fun res!430801 () Bool)

(assert (=> b!662677 (=> res!430801 e!380308)))

(assert (=> b!662677 (= res!430801 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!151 (List!12742 (_ BitVec 64)) List!12742)

(assert (=> b!662677 (= lt!308903 ($colon$colon!151 acc!681 (select (arr!18662 a!3626) from!3004)))))

(declare-fun subseq!20 (List!12742 List!12742) Bool)

(assert (=> b!662677 (subseq!20 acc!681 acc!681)))

(declare-fun lt!308900 () Unit!23024)

(declare-fun lemmaListSubSeqRefl!0 (List!12742) Unit!23024)

(assert (=> b!662677 (= lt!308900 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!662678 () Bool)

(declare-fun e!380307 () Bool)

(declare-fun e!380312 () Bool)

(assert (=> b!662678 (= e!380307 e!380312)))

(declare-fun res!430791 () Bool)

(assert (=> b!662678 (=> (not res!430791) (not e!380312))))

(assert (=> b!662678 (= res!430791 (bvsle from!3004 i!1382))))

(declare-fun b!662679 () Bool)

(declare-fun res!430786 () Bool)

(assert (=> b!662679 (=> res!430786 e!380308)))

(assert (=> b!662679 (= res!430786 (contains!3264 lt!308903 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!662680 () Bool)

(declare-fun e!380305 () Unit!23024)

(declare-fun Unit!23026 () Unit!23024)

(assert (=> b!662680 (= e!380305 Unit!23026)))

(declare-fun b!662682 () Bool)

(assert (=> b!662682 (= e!380312 (not (contains!3264 acc!681 k0!2843)))))

(declare-fun b!662683 () Bool)

(declare-fun res!430799 () Bool)

(assert (=> b!662683 (=> (not res!430799) (not e!380309))))

(assert (=> b!662683 (= res!430799 e!380307)))

(declare-fun res!430789 () Bool)

(assert (=> b!662683 (=> res!430789 e!380307)))

(assert (=> b!662683 (= res!430789 e!380306)))

(declare-fun res!430783 () Bool)

(assert (=> b!662683 (=> (not res!430783) (not e!380306))))

(assert (=> b!662683 (= res!430783 (bvsgt from!3004 i!1382))))

(declare-fun b!662684 () Bool)

(declare-fun res!430792 () Bool)

(assert (=> b!662684 (=> (not res!430792) (not e!380309))))

(assert (=> b!662684 (= res!430792 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!662685 () Bool)

(declare-fun res!430785 () Bool)

(assert (=> b!662685 (=> (not res!430785) (not e!380309))))

(assert (=> b!662685 (= res!430785 (not (contains!3264 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!662686 () Bool)

(declare-fun res!430800 () Bool)

(assert (=> b!662686 (=> (not res!430800) (not e!380309))))

(assert (=> b!662686 (= res!430800 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19027 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!662687 () Bool)

(declare-fun Unit!23027 () Unit!23024)

(assert (=> b!662687 (= e!380305 Unit!23027)))

(declare-fun lt!308901 () Unit!23024)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38940 (_ BitVec 64) (_ BitVec 32)) Unit!23024)

(assert (=> b!662687 (= lt!308901 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!662687 false))

(declare-fun b!662688 () Bool)

(assert (=> b!662688 (= e!380309 (not e!380310))))

(declare-fun res!430784 () Bool)

(assert (=> b!662688 (=> res!430784 e!380310)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!662688 (= res!430784 (not (validKeyInArray!0 (select (arr!18662 a!3626) from!3004))))))

(declare-fun lt!308904 () Unit!23024)

(assert (=> b!662688 (= lt!308904 e!380305)))

(declare-fun c!76311 () Bool)

(assert (=> b!662688 (= c!76311 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!662688 (arrayContainsKey!0 (array!38941 (store (arr!18662 a!3626) i!1382 k0!2843) (size!19027 a!3626)) k0!2843 from!3004)))

(declare-fun b!662689 () Bool)

(declare-fun res!430798 () Bool)

(assert (=> b!662689 (=> (not res!430798) (not e!380309))))

(assert (=> b!662689 (= res!430798 (noDuplicate!533 acc!681))))

(declare-fun res!430782 () Bool)

(assert (=> start!59882 (=> (not res!430782) (not e!380309))))

(assert (=> start!59882 (= res!430782 (and (bvslt (size!19027 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19027 a!3626))))))

(assert (=> start!59882 e!380309))

(assert (=> start!59882 true))

(declare-fun array_inv!14545 (array!38940) Bool)

(assert (=> start!59882 (array_inv!14545 a!3626)))

(declare-fun b!662681 () Bool)

(declare-fun res!430796 () Bool)

(assert (=> b!662681 (=> (not res!430796) (not e!380309))))

(assert (=> b!662681 (= res!430796 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12739))))

(declare-fun b!662690 () Bool)

(declare-fun res!430793 () Bool)

(assert (=> b!662690 (=> (not res!430793) (not e!380309))))

(assert (=> b!662690 (= res!430793 (validKeyInArray!0 k0!2843))))

(declare-fun b!662691 () Bool)

(declare-fun res!430797 () Bool)

(assert (=> b!662691 (=> res!430797 e!380308)))

(assert (=> b!662691 (= res!430797 (not (subseq!20 acc!681 lt!308903)))))

(assert (= (and start!59882 res!430782) b!662689))

(assert (= (and b!662689 res!430798) b!662676))

(assert (= (and b!662676 res!430794) b!662685))

(assert (= (and b!662685 res!430785) b!662683))

(assert (= (and b!662683 res!430783) b!662670))

(assert (= (and b!662683 (not res!430789)) b!662678))

(assert (= (and b!662678 res!430791) b!662682))

(assert (= (and b!662683 res!430799) b!662681))

(assert (= (and b!662681 res!430796) b!662684))

(assert (= (and b!662684 res!430792) b!662675))

(assert (= (and b!662675 res!430795) b!662690))

(assert (= (and b!662690 res!430793) b!662671))

(assert (= (and b!662671 res!430788) b!662686))

(assert (= (and b!662686 res!430800) b!662688))

(assert (= (and b!662688 c!76311) b!662687))

(assert (= (and b!662688 (not c!76311)) b!662680))

(assert (= (and b!662688 (not res!430784)) b!662677))

(assert (= (and b!662677 (not res!430801)) b!662672))

(assert (= (and b!662672 (not res!430787)) b!662674))

(assert (= (and b!662674 (not res!430790)) b!662679))

(assert (= (and b!662679 (not res!430786)) b!662691))

(assert (= (and b!662691 (not res!430797)) b!662673))

(declare-fun m!633879 () Bool)

(assert (=> b!662677 m!633879))

(assert (=> b!662677 m!633879))

(declare-fun m!633881 () Bool)

(assert (=> b!662677 m!633881))

(declare-fun m!633883 () Bool)

(assert (=> b!662677 m!633883))

(declare-fun m!633885 () Bool)

(assert (=> b!662677 m!633885))

(declare-fun m!633887 () Bool)

(assert (=> b!662674 m!633887))

(declare-fun m!633889 () Bool)

(assert (=> b!662673 m!633889))

(declare-fun m!633891 () Bool)

(assert (=> b!662673 m!633891))

(declare-fun m!633893 () Bool)

(assert (=> b!662687 m!633893))

(declare-fun m!633895 () Bool)

(assert (=> b!662689 m!633895))

(declare-fun m!633897 () Bool)

(assert (=> b!662682 m!633897))

(declare-fun m!633899 () Bool)

(assert (=> b!662685 m!633899))

(declare-fun m!633901 () Bool)

(assert (=> b!662676 m!633901))

(declare-fun m!633903 () Bool)

(assert (=> b!662679 m!633903))

(declare-fun m!633905 () Bool)

(assert (=> b!662681 m!633905))

(declare-fun m!633907 () Bool)

(assert (=> start!59882 m!633907))

(declare-fun m!633909 () Bool)

(assert (=> b!662691 m!633909))

(declare-fun m!633911 () Bool)

(assert (=> b!662672 m!633911))

(declare-fun m!633913 () Bool)

(assert (=> b!662671 m!633913))

(assert (=> b!662688 m!633879))

(declare-fun m!633915 () Bool)

(assert (=> b!662688 m!633915))

(declare-fun m!633917 () Bool)

(assert (=> b!662688 m!633917))

(assert (=> b!662688 m!633879))

(declare-fun m!633919 () Bool)

(assert (=> b!662688 m!633919))

(declare-fun m!633921 () Bool)

(assert (=> b!662688 m!633921))

(assert (=> b!662670 m!633897))

(declare-fun m!633923 () Bool)

(assert (=> b!662684 m!633923))

(declare-fun m!633925 () Bool)

(assert (=> b!662690 m!633925))

(check-sat (not b!662673) (not b!662672) (not b!662671) (not b!662677) (not b!662682) (not b!662679) (not b!662674) (not b!662684) (not b!662670) (not b!662687) (not b!662688) (not b!662689) (not b!662691) (not b!662676) (not b!662681) (not start!59882) (not b!662685) (not b!662690))
(check-sat)
