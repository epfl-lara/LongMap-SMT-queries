; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60006 () Bool)

(assert start!60006)

(declare-fun b!664852 () Bool)

(declare-fun res!432401 () Bool)

(declare-fun e!381242 () Bool)

(assert (=> b!664852 (=> res!432401 e!381242)))

(declare-datatypes ((List!12633 0))(
  ( (Nil!12630) (Cons!12629 (h!13677 (_ BitVec 64)) (t!18853 List!12633)) )
))
(declare-fun lt!309796 () List!12633)

(declare-fun contains!3285 (List!12633 (_ BitVec 64)) Bool)

(assert (=> b!664852 (= res!432401 (contains!3285 lt!309796 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!664853 () Bool)

(declare-fun res!432409 () Bool)

(declare-fun e!381244 () Bool)

(assert (=> b!664853 (=> (not res!432409) (not e!381244))))

(declare-datatypes ((array!38991 0))(
  ( (array!38992 (arr!18685 (Array (_ BitVec 32) (_ BitVec 64))) (size!19049 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38991)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38991 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!664853 (= res!432409 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!664854 () Bool)

(declare-fun res!432407 () Bool)

(assert (=> b!664854 (=> (not res!432407) (not e!381244))))

(declare-fun arrayNoDuplicates!0 (array!38991 (_ BitVec 32) List!12633) Bool)

(assert (=> b!664854 (= res!432407 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12630))))

(declare-fun b!664855 () Bool)

(declare-fun res!432405 () Bool)

(assert (=> b!664855 (=> (not res!432405) (not e!381244))))

(declare-fun e!381245 () Bool)

(assert (=> b!664855 (= res!432405 e!381245)))

(declare-fun res!432412 () Bool)

(assert (=> b!664855 (=> res!432412 e!381245)))

(declare-fun e!381243 () Bool)

(assert (=> b!664855 (= res!432412 e!381243)))

(declare-fun res!432411 () Bool)

(assert (=> b!664855 (=> (not res!432411) (not e!381243))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!664855 (= res!432411 (bvsgt from!3004 i!1382))))

(declare-fun b!664856 () Bool)

(declare-fun res!432417 () Bool)

(assert (=> b!664856 (=> (not res!432417) (not e!381244))))

(declare-fun acc!681 () List!12633)

(assert (=> b!664856 (= res!432417 (not (contains!3285 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!664857 () Bool)

(declare-fun e!381246 () Bool)

(assert (=> b!664857 (= e!381245 e!381246)))

(declare-fun res!432419 () Bool)

(assert (=> b!664857 (=> (not res!432419) (not e!381246))))

(assert (=> b!664857 (= res!432419 (bvsle from!3004 i!1382))))

(declare-fun b!664858 () Bool)

(declare-fun res!432410 () Bool)

(assert (=> b!664858 (=> (not res!432410) (not e!381244))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!664858 (= res!432410 (validKeyInArray!0 k0!2843))))

(declare-fun b!664859 () Bool)

(assert (=> b!664859 (= e!381244 (not e!381242))))

(declare-fun res!432404 () Bool)

(assert (=> b!664859 (=> res!432404 e!381242)))

(assert (=> b!664859 (= res!432404 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!44 (List!12633 (_ BitVec 64)) List!12633)

(assert (=> b!664859 (= (-!44 lt!309796 k0!2843) acc!681)))

(declare-fun $colon$colon!176 (List!12633 (_ BitVec 64)) List!12633)

(assert (=> b!664859 (= lt!309796 ($colon$colon!176 acc!681 k0!2843))))

(declare-datatypes ((Unit!23154 0))(
  ( (Unit!23155) )
))
(declare-fun lt!309803 () Unit!23154)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12633) Unit!23154)

(assert (=> b!664859 (= lt!309803 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(declare-fun subseq!47 (List!12633 List!12633) Bool)

(assert (=> b!664859 (subseq!47 acc!681 acc!681)))

(declare-fun lt!309802 () Unit!23154)

(declare-fun lemmaListSubSeqRefl!0 (List!12633) Unit!23154)

(assert (=> b!664859 (= lt!309802 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!664859 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!309805 () Unit!23154)

(declare-fun e!381239 () Unit!23154)

(assert (=> b!664859 (= lt!309805 e!381239)))

(declare-fun c!76594 () Bool)

(assert (=> b!664859 (= c!76594 (validKeyInArray!0 (select (arr!18685 a!3626) from!3004)))))

(declare-fun lt!309798 () Unit!23154)

(declare-fun e!381241 () Unit!23154)

(assert (=> b!664859 (= lt!309798 e!381241)))

(declare-fun c!76595 () Bool)

(declare-fun lt!309804 () Bool)

(assert (=> b!664859 (= c!76595 lt!309804)))

(assert (=> b!664859 (= lt!309804 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!664859 (arrayContainsKey!0 (array!38992 (store (arr!18685 a!3626) i!1382 k0!2843) (size!19049 a!3626)) k0!2843 from!3004)))

(declare-fun res!432408 () Bool)

(assert (=> start!60006 (=> (not res!432408) (not e!381244))))

(assert (=> start!60006 (= res!432408 (and (bvslt (size!19049 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19049 a!3626))))))

(assert (=> start!60006 e!381244))

(assert (=> start!60006 true))

(declare-fun array_inv!14544 (array!38991) Bool)

(assert (=> start!60006 (array_inv!14544 a!3626)))

(declare-fun b!664860 () Bool)

(declare-fun res!432418 () Bool)

(assert (=> b!664860 (=> (not res!432418) (not e!381244))))

(assert (=> b!664860 (= res!432418 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19049 a!3626))))))

(declare-fun b!664861 () Bool)

(declare-fun Unit!23156 () Unit!23154)

(assert (=> b!664861 (= e!381239 Unit!23156)))

(declare-fun b!664862 () Bool)

(assert (=> b!664862 (= e!381246 (not (contains!3285 acc!681 k0!2843)))))

(declare-fun b!664863 () Bool)

(assert (=> b!664863 (= e!381242 true)))

(declare-fun lt!309797 () Bool)

(assert (=> b!664863 (= lt!309797 (contains!3285 lt!309796 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!664864 () Bool)

(declare-fun Unit!23157 () Unit!23154)

(assert (=> b!664864 (= e!381241 Unit!23157)))

(declare-fun lt!309799 () Unit!23154)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38991 (_ BitVec 64) (_ BitVec 32)) Unit!23154)

(assert (=> b!664864 (= lt!309799 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!664864 false))

(declare-fun b!664865 () Bool)

(declare-fun res!432416 () Bool)

(assert (=> b!664865 (=> (not res!432416) (not e!381244))))

(assert (=> b!664865 (= res!432416 (not (contains!3285 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!664866 () Bool)

(declare-fun res!432415 () Bool)

(assert (=> b!664866 (=> res!432415 e!381242)))

(declare-fun noDuplicate!559 (List!12633) Bool)

(assert (=> b!664866 (= res!432415 (not (noDuplicate!559 lt!309796)))))

(declare-fun b!664867 () Bool)

(assert (=> b!664867 (= e!381243 (contains!3285 acc!681 k0!2843))))

(declare-fun b!664868 () Bool)

(declare-fun res!432406 () Bool)

(assert (=> b!664868 (=> res!432406 e!381242)))

(assert (=> b!664868 (= res!432406 (not (contains!3285 lt!309796 k0!2843)))))

(declare-fun b!664869 () Bool)

(declare-fun res!432403 () Bool)

(assert (=> b!664869 (=> res!432403 e!381242)))

(assert (=> b!664869 (= res!432403 lt!309804)))

(declare-fun b!664870 () Bool)

(declare-fun res!432402 () Bool)

(assert (=> b!664870 (=> (not res!432402) (not e!381244))))

(assert (=> b!664870 (= res!432402 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!664871 () Bool)

(declare-fun res!432420 () Bool)

(assert (=> b!664871 (=> (not res!432420) (not e!381244))))

(assert (=> b!664871 (= res!432420 (noDuplicate!559 acc!681))))

(declare-fun b!664872 () Bool)

(declare-fun res!432414 () Bool)

(assert (=> b!664872 (=> res!432414 e!381242)))

(assert (=> b!664872 (= res!432414 (not (subseq!47 acc!681 lt!309796)))))

(declare-fun b!664873 () Bool)

(declare-fun res!432421 () Bool)

(assert (=> b!664873 (=> (not res!432421) (not e!381244))))

(assert (=> b!664873 (= res!432421 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19049 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!664874 () Bool)

(declare-fun res!432413 () Bool)

(assert (=> b!664874 (=> res!432413 e!381242)))

(assert (=> b!664874 (= res!432413 (contains!3285 acc!681 k0!2843))))

(declare-fun b!664875 () Bool)

(declare-fun Unit!23158 () Unit!23154)

(assert (=> b!664875 (= e!381241 Unit!23158)))

(declare-fun b!664876 () Bool)

(declare-fun lt!309800 () Unit!23154)

(assert (=> b!664876 (= e!381239 lt!309800)))

(declare-fun lt!309801 () Unit!23154)

(assert (=> b!664876 (= lt!309801 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!664876 (subseq!47 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!38991 List!12633 List!12633 (_ BitVec 32)) Unit!23154)

(assert (=> b!664876 (= lt!309800 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!176 acc!681 (select (arr!18685 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!664876 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(assert (= (and start!60006 res!432408) b!664871))

(assert (= (and b!664871 res!432420) b!664865))

(assert (= (and b!664865 res!432416) b!664856))

(assert (= (and b!664856 res!432417) b!664855))

(assert (= (and b!664855 res!432411) b!664867))

(assert (= (and b!664855 (not res!432412)) b!664857))

(assert (= (and b!664857 res!432419) b!664862))

(assert (= (and b!664855 res!432405) b!664854))

(assert (= (and b!664854 res!432407) b!664870))

(assert (= (and b!664870 res!432402) b!664860))

(assert (= (and b!664860 res!432418) b!664858))

(assert (= (and b!664858 res!432410) b!664853))

(assert (= (and b!664853 res!432409) b!664873))

(assert (= (and b!664873 res!432421) b!664859))

(assert (= (and b!664859 c!76595) b!664864))

(assert (= (and b!664859 (not c!76595)) b!664875))

(assert (= (and b!664859 c!76594) b!664876))

(assert (= (and b!664859 (not c!76594)) b!664861))

(assert (= (and b!664859 (not res!432404)) b!664866))

(assert (= (and b!664866 (not res!432415)) b!664869))

(assert (= (and b!664869 (not res!432403)) b!664874))

(assert (= (and b!664874 (not res!432413)) b!664872))

(assert (= (and b!664872 (not res!432414)) b!664868))

(assert (= (and b!664868 (not res!432406)) b!664852))

(assert (= (and b!664852 (not res!432401)) b!664863))

(declare-fun m!636583 () Bool)

(assert (=> b!664864 m!636583))

(declare-fun m!636585 () Bool)

(assert (=> b!664853 m!636585))

(declare-fun m!636587 () Bool)

(assert (=> start!60006 m!636587))

(declare-fun m!636589 () Bool)

(assert (=> b!664852 m!636589))

(declare-fun m!636591 () Bool)

(assert (=> b!664868 m!636591))

(declare-fun m!636593 () Bool)

(assert (=> b!664854 m!636593))

(declare-fun m!636595 () Bool)

(assert (=> b!664871 m!636595))

(declare-fun m!636597 () Bool)

(assert (=> b!664874 m!636597))

(assert (=> b!664862 m!636597))

(declare-fun m!636599 () Bool)

(assert (=> b!664856 m!636599))

(assert (=> b!664867 m!636597))

(declare-fun m!636601 () Bool)

(assert (=> b!664870 m!636601))

(declare-fun m!636603 () Bool)

(assert (=> b!664872 m!636603))

(declare-fun m!636605 () Bool)

(assert (=> b!664858 m!636605))

(declare-fun m!636607 () Bool)

(assert (=> b!664863 m!636607))

(declare-fun m!636609 () Bool)

(assert (=> b!664866 m!636609))

(declare-fun m!636611 () Bool)

(assert (=> b!664876 m!636611))

(declare-fun m!636613 () Bool)

(assert (=> b!664876 m!636613))

(declare-fun m!636615 () Bool)

(assert (=> b!664876 m!636615))

(declare-fun m!636617 () Bool)

(assert (=> b!664876 m!636617))

(assert (=> b!664876 m!636613))

(assert (=> b!664876 m!636615))

(declare-fun m!636619 () Bool)

(assert (=> b!664876 m!636619))

(declare-fun m!636621 () Bool)

(assert (=> b!664876 m!636621))

(declare-fun m!636623 () Bool)

(assert (=> b!664865 m!636623))

(declare-fun m!636625 () Bool)

(assert (=> b!664859 m!636625))

(assert (=> b!664859 m!636611))

(assert (=> b!664859 m!636613))

(declare-fun m!636627 () Bool)

(assert (=> b!664859 m!636627))

(declare-fun m!636629 () Bool)

(assert (=> b!664859 m!636629))

(assert (=> b!664859 m!636619))

(declare-fun m!636631 () Bool)

(assert (=> b!664859 m!636631))

(declare-fun m!636633 () Bool)

(assert (=> b!664859 m!636633))

(assert (=> b!664859 m!636613))

(declare-fun m!636635 () Bool)

(assert (=> b!664859 m!636635))

(declare-fun m!636637 () Bool)

(assert (=> b!664859 m!636637))

(assert (=> b!664859 m!636621))

(check-sat (not b!664864) (not b!664865) (not b!664870) (not b!664876) (not b!664867) (not b!664874) (not b!664854) (not b!664862) (not b!664871) (not b!664868) (not b!664872) (not start!60006) (not b!664866) (not b!664858) (not b!664856) (not b!664853) (not b!664852) (not b!664859) (not b!664863))
(check-sat)
