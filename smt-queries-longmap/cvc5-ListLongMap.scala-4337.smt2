; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60112 () Bool)

(assert start!60112)

(declare-fun b!668827 () Bool)

(declare-fun e!382674 () Bool)

(declare-datatypes ((List!12686 0))(
  ( (Nil!12683) (Cons!12682 (h!13730 (_ BitVec 64)) (t!18906 List!12686)) )
))
(declare-fun lt!311386 () List!12686)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3338 (List!12686 (_ BitVec 64)) Bool)

(assert (=> b!668827 (= e!382674 (contains!3338 lt!311386 k!2843))))

(declare-fun b!668828 () Bool)

(declare-fun res!435745 () Bool)

(declare-fun e!382671 () Bool)

(assert (=> b!668828 (=> (not res!435745) (not e!382671))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!668828 (= res!435745 (validKeyInArray!0 k!2843))))

(declare-fun b!668829 () Bool)

(declare-fun res!435746 () Bool)

(assert (=> b!668829 (=> (not res!435746) (not e!382671))))

(declare-datatypes ((array!39097 0))(
  ( (array!39098 (arr!18738 (Array (_ BitVec 32) (_ BitVec 64))) (size!19102 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39097)

(declare-fun arrayNoDuplicates!0 (array!39097 (_ BitVec 32) List!12686) Bool)

(assert (=> b!668829 (= res!435746 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12683))))

(declare-fun b!668830 () Bool)

(declare-fun e!382672 () Bool)

(declare-fun e!382673 () Bool)

(assert (=> b!668830 (= e!382672 e!382673)))

(declare-fun res!435743 () Bool)

(assert (=> b!668830 (=> (not res!435743) (not e!382673))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!668830 (= res!435743 (bvsle from!3004 i!1382))))

(declare-fun res!435752 () Bool)

(assert (=> start!60112 (=> (not res!435752) (not e!382671))))

(assert (=> start!60112 (= res!435752 (and (bvslt (size!19102 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19102 a!3626))))))

(assert (=> start!60112 e!382671))

(assert (=> start!60112 true))

(declare-fun array_inv!14597 (array!39097) Bool)

(assert (=> start!60112 (array_inv!14597 a!3626)))

(declare-fun b!668831 () Bool)

(declare-fun e!382675 () Bool)

(assert (=> b!668831 (= e!382675 (not (contains!3338 lt!311386 k!2843)))))

(declare-fun b!668832 () Bool)

(declare-fun res!435751 () Bool)

(assert (=> b!668832 (=> (not res!435751) (not e!382671))))

(assert (=> b!668832 (= res!435751 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19102 a!3626))))))

(declare-fun b!668833 () Bool)

(declare-fun res!435757 () Bool)

(declare-fun e!382679 () Bool)

(assert (=> b!668833 (=> res!435757 e!382679)))

(assert (=> b!668833 (= res!435757 (contains!3338 lt!311386 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!668834 () Bool)

(declare-fun res!435756 () Bool)

(assert (=> b!668834 (=> res!435756 e!382679)))

(declare-fun noDuplicate!612 (List!12686) Bool)

(assert (=> b!668834 (= res!435756 (not (noDuplicate!612 lt!311386)))))

(declare-fun b!668835 () Bool)

(declare-fun res!435754 () Bool)

(assert (=> b!668835 (=> (not res!435754) (not e!382671))))

(assert (=> b!668835 (= res!435754 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19102 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!668836 () Bool)

(declare-datatypes ((Unit!23419 0))(
  ( (Unit!23420) )
))
(declare-fun e!382670 () Unit!23419)

(declare-fun Unit!23421 () Unit!23419)

(assert (=> b!668836 (= e!382670 Unit!23421)))

(declare-fun b!668837 () Bool)

(declare-fun e!382678 () Unit!23419)

(declare-fun lt!311390 () Unit!23419)

(assert (=> b!668837 (= e!382678 lt!311390)))

(declare-fun lt!311393 () Unit!23419)

(declare-fun acc!681 () List!12686)

(declare-fun lemmaListSubSeqRefl!0 (List!12686) Unit!23419)

(assert (=> b!668837 (= lt!311393 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!100 (List!12686 List!12686) Bool)

(assert (=> b!668837 (subseq!100 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39097 List!12686 List!12686 (_ BitVec 32)) Unit!23419)

(declare-fun $colon$colon!229 (List!12686 (_ BitVec 64)) List!12686)

(assert (=> b!668837 (= lt!311390 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!229 acc!681 (select (arr!18738 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!668837 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!668838 () Bool)

(declare-fun res!435749 () Bool)

(assert (=> b!668838 (=> (not res!435749) (not e!382671))))

(assert (=> b!668838 (= res!435749 (noDuplicate!612 acc!681))))

(declare-fun b!668839 () Bool)

(assert (=> b!668839 (= e!382679 true)))

(declare-fun lt!311395 () Bool)

(declare-fun e!382680 () Bool)

(assert (=> b!668839 (= lt!311395 e!382680)))

(declare-fun res!435759 () Bool)

(assert (=> b!668839 (=> res!435759 e!382680)))

(assert (=> b!668839 (= res!435759 e!382674)))

(declare-fun res!435744 () Bool)

(assert (=> b!668839 (=> (not res!435744) (not e!382674))))

(assert (=> b!668839 (= res!435744 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!668840 () Bool)

(assert (=> b!668840 (= e!382680 e!382675)))

(declare-fun res!435753 () Bool)

(assert (=> b!668840 (=> (not res!435753) (not e!382675))))

(assert (=> b!668840 (= res!435753 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!668841 () Bool)

(declare-fun res!435760 () Bool)

(assert (=> b!668841 (=> (not res!435760) (not e!382671))))

(declare-fun arrayContainsKey!0 (array!39097 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!668841 (= res!435760 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!668842 () Bool)

(declare-fun Unit!23422 () Unit!23419)

(assert (=> b!668842 (= e!382678 Unit!23422)))

(declare-fun b!668843 () Bool)

(declare-fun res!435755 () Bool)

(assert (=> b!668843 (=> (not res!435755) (not e!382671))))

(assert (=> b!668843 (= res!435755 (not (contains!3338 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!668844 () Bool)

(assert (=> b!668844 (= e!382671 (not e!382679))))

(declare-fun res!435750 () Bool)

(assert (=> b!668844 (=> res!435750 e!382679)))

(assert (=> b!668844 (= res!435750 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (=> b!668844 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!311386)))

(declare-fun lt!311388 () Unit!23419)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39097 (_ BitVec 64) (_ BitVec 32) List!12686 List!12686) Unit!23419)

(assert (=> b!668844 (= lt!311388 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!311386))))

(declare-fun -!97 (List!12686 (_ BitVec 64)) List!12686)

(assert (=> b!668844 (= (-!97 lt!311386 k!2843) acc!681)))

(assert (=> b!668844 (= lt!311386 ($colon$colon!229 acc!681 k!2843))))

(declare-fun lt!311391 () Unit!23419)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12686) Unit!23419)

(assert (=> b!668844 (= lt!311391 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(assert (=> b!668844 (subseq!100 acc!681 acc!681)))

(declare-fun lt!311394 () Unit!23419)

(assert (=> b!668844 (= lt!311394 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!668844 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!311389 () Unit!23419)

(assert (=> b!668844 (= lt!311389 e!382678)))

(declare-fun c!76913 () Bool)

(assert (=> b!668844 (= c!76913 (validKeyInArray!0 (select (arr!18738 a!3626) from!3004)))))

(declare-fun lt!311387 () Unit!23419)

(assert (=> b!668844 (= lt!311387 e!382670)))

(declare-fun c!76912 () Bool)

(assert (=> b!668844 (= c!76912 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!668844 (arrayContainsKey!0 (array!39098 (store (arr!18738 a!3626) i!1382 k!2843) (size!19102 a!3626)) k!2843 from!3004)))

(declare-fun b!668845 () Bool)

(declare-fun res!435748 () Bool)

(assert (=> b!668845 (=> res!435748 e!382679)))

(assert (=> b!668845 (= res!435748 (contains!3338 lt!311386 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!668846 () Bool)

(declare-fun res!435741 () Bool)

(assert (=> b!668846 (=> (not res!435741) (not e!382671))))

(assert (=> b!668846 (= res!435741 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!668847 () Bool)

(declare-fun res!435740 () Bool)

(assert (=> b!668847 (=> (not res!435740) (not e!382671))))

(assert (=> b!668847 (= res!435740 (not (contains!3338 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!668848 () Bool)

(declare-fun res!435758 () Bool)

(assert (=> b!668848 (=> (not res!435758) (not e!382671))))

(assert (=> b!668848 (= res!435758 e!382672)))

(declare-fun res!435742 () Bool)

(assert (=> b!668848 (=> res!435742 e!382672)))

(declare-fun e!382677 () Bool)

(assert (=> b!668848 (= res!435742 e!382677)))

(declare-fun res!435747 () Bool)

(assert (=> b!668848 (=> (not res!435747) (not e!382677))))

(assert (=> b!668848 (= res!435747 (bvsgt from!3004 i!1382))))

(declare-fun b!668849 () Bool)

(declare-fun Unit!23423 () Unit!23419)

(assert (=> b!668849 (= e!382670 Unit!23423)))

(declare-fun lt!311392 () Unit!23419)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39097 (_ BitVec 64) (_ BitVec 32)) Unit!23419)

(assert (=> b!668849 (= lt!311392 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!668849 false))

(declare-fun b!668850 () Bool)

(assert (=> b!668850 (= e!382673 (not (contains!3338 acc!681 k!2843)))))

(declare-fun b!668851 () Bool)

(assert (=> b!668851 (= e!382677 (contains!3338 acc!681 k!2843))))

(assert (= (and start!60112 res!435752) b!668838))

(assert (= (and b!668838 res!435749) b!668843))

(assert (= (and b!668843 res!435755) b!668847))

(assert (= (and b!668847 res!435740) b!668848))

(assert (= (and b!668848 res!435747) b!668851))

(assert (= (and b!668848 (not res!435742)) b!668830))

(assert (= (and b!668830 res!435743) b!668850))

(assert (= (and b!668848 res!435758) b!668829))

(assert (= (and b!668829 res!435746) b!668846))

(assert (= (and b!668846 res!435741) b!668832))

(assert (= (and b!668832 res!435751) b!668828))

(assert (= (and b!668828 res!435745) b!668841))

(assert (= (and b!668841 res!435760) b!668835))

(assert (= (and b!668835 res!435754) b!668844))

(assert (= (and b!668844 c!76912) b!668849))

(assert (= (and b!668844 (not c!76912)) b!668836))

(assert (= (and b!668844 c!76913) b!668837))

(assert (= (and b!668844 (not c!76913)) b!668842))

(assert (= (and b!668844 (not res!435750)) b!668834))

(assert (= (and b!668834 (not res!435756)) b!668833))

(assert (= (and b!668833 (not res!435757)) b!668845))

(assert (= (and b!668845 (not res!435748)) b!668839))

(assert (= (and b!668839 res!435744) b!668827))

(assert (= (and b!668839 (not res!435759)) b!668840))

(assert (= (and b!668840 res!435753) b!668831))

(declare-fun m!639585 () Bool)

(assert (=> b!668838 m!639585))

(declare-fun m!639587 () Bool)

(assert (=> b!668828 m!639587))

(declare-fun m!639589 () Bool)

(assert (=> b!668851 m!639589))

(declare-fun m!639591 () Bool)

(assert (=> b!668845 m!639591))

(declare-fun m!639593 () Bool)

(assert (=> b!668847 m!639593))

(declare-fun m!639595 () Bool)

(assert (=> b!668846 m!639595))

(declare-fun m!639597 () Bool)

(assert (=> b!668841 m!639597))

(declare-fun m!639599 () Bool)

(assert (=> b!668837 m!639599))

(declare-fun m!639601 () Bool)

(assert (=> b!668837 m!639601))

(declare-fun m!639603 () Bool)

(assert (=> b!668837 m!639603))

(declare-fun m!639605 () Bool)

(assert (=> b!668837 m!639605))

(assert (=> b!668837 m!639601))

(assert (=> b!668837 m!639603))

(declare-fun m!639607 () Bool)

(assert (=> b!668837 m!639607))

(declare-fun m!639609 () Bool)

(assert (=> b!668837 m!639609))

(declare-fun m!639611 () Bool)

(assert (=> b!668833 m!639611))

(declare-fun m!639613 () Bool)

(assert (=> b!668827 m!639613))

(assert (=> b!668850 m!639589))

(declare-fun m!639615 () Bool)

(assert (=> b!668844 m!639615))

(declare-fun m!639617 () Bool)

(assert (=> b!668844 m!639617))

(assert (=> b!668844 m!639599))

(declare-fun m!639619 () Bool)

(assert (=> b!668844 m!639619))

(assert (=> b!668844 m!639601))

(declare-fun m!639621 () Bool)

(assert (=> b!668844 m!639621))

(declare-fun m!639623 () Bool)

(assert (=> b!668844 m!639623))

(assert (=> b!668844 m!639607))

(declare-fun m!639625 () Bool)

(assert (=> b!668844 m!639625))

(declare-fun m!639627 () Bool)

(assert (=> b!668844 m!639627))

(assert (=> b!668844 m!639601))

(declare-fun m!639629 () Bool)

(assert (=> b!668844 m!639629))

(declare-fun m!639631 () Bool)

(assert (=> b!668844 m!639631))

(assert (=> b!668844 m!639609))

(declare-fun m!639633 () Bool)

(assert (=> b!668834 m!639633))

(declare-fun m!639635 () Bool)

(assert (=> b!668843 m!639635))

(declare-fun m!639637 () Bool)

(assert (=> start!60112 m!639637))

(declare-fun m!639639 () Bool)

(assert (=> b!668849 m!639639))

(declare-fun m!639641 () Bool)

(assert (=> b!668829 m!639641))

(assert (=> b!668831 m!639613))

(push 1)

(assert (not b!668834))

(assert (not b!668838))

(assert (not b!668828))

(assert (not b!668829))

(assert (not b!668833))

(assert (not b!668837))

(assert (not b!668847))

(assert (not b!668851))

(assert (not b!668849))

(assert (not start!60112))

(assert (not b!668831))

(assert (not b!668827))

(assert (not b!668846))

(assert (not b!668844))

(assert (not b!668843))

(assert (not b!668845))

(assert (not b!668850))

(assert (not b!668841))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

