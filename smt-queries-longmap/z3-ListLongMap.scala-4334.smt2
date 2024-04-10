; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60034 () Bool)

(assert start!60034)

(declare-fun b!667853 () Bool)

(declare-datatypes ((Unit!23390 0))(
  ( (Unit!23391) )
))
(declare-fun e!382208 () Unit!23390)

(declare-fun Unit!23392 () Unit!23390)

(assert (=> b!667853 (= e!382208 Unit!23392)))

(declare-fun lt!310985 () Unit!23390)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-datatypes ((array!39081 0))(
  ( (array!39082 (arr!18733 (Array (_ BitVec 32) (_ BitVec 64))) (size!19097 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39081)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39081 (_ BitVec 64) (_ BitVec 32)) Unit!23390)

(assert (=> b!667853 (= lt!310985 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!667853 false))

(declare-fun b!667854 () Bool)

(declare-fun e!382199 () Unit!23390)

(declare-fun lt!310993 () Unit!23390)

(assert (=> b!667854 (= e!382199 lt!310993)))

(declare-fun lt!310988 () Unit!23390)

(declare-datatypes ((List!12774 0))(
  ( (Nil!12771) (Cons!12770 (h!13815 (_ BitVec 64)) (t!19002 List!12774)) )
))
(declare-fun acc!681 () List!12774)

(declare-fun lemmaListSubSeqRefl!0 (List!12774) Unit!23390)

(assert (=> b!667854 (= lt!310988 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!90 (List!12774 List!12774) Bool)

(assert (=> b!667854 (subseq!90 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39081 List!12774 List!12774 (_ BitVec 32)) Unit!23390)

(declare-fun $colon$colon!222 (List!12774 (_ BitVec 64)) List!12774)

(assert (=> b!667854 (= lt!310993 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!222 acc!681 (select (arr!18733 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun arrayNoDuplicates!0 (array!39081 (_ BitVec 32) List!12774) Bool)

(assert (=> b!667854 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!667855 () Bool)

(declare-fun res!435015 () Bool)

(declare-fun e!382200 () Bool)

(assert (=> b!667855 (=> (not res!435015) (not e!382200))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!667855 (= res!435015 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19097 a!3626))))))

(declare-fun b!667856 () Bool)

(declare-fun res!435013 () Bool)

(assert (=> b!667856 (=> (not res!435013) (not e!382200))))

(assert (=> b!667856 (= res!435013 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19097 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!667857 () Bool)

(declare-fun Unit!23393 () Unit!23390)

(assert (=> b!667857 (= e!382208 Unit!23393)))

(declare-fun b!667858 () Bool)

(declare-fun res!435001 () Bool)

(assert (=> b!667858 (=> (not res!435001) (not e!382200))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!667858 (= res!435001 (validKeyInArray!0 k0!2843))))

(declare-fun b!667859 () Bool)

(declare-fun res!435017 () Bool)

(declare-fun e!382202 () Bool)

(assert (=> b!667859 (=> res!435017 e!382202)))

(declare-fun lt!310989 () List!12774)

(declare-fun noDuplicate!598 (List!12774) Bool)

(assert (=> b!667859 (= res!435017 (not (noDuplicate!598 lt!310989)))))

(declare-fun b!667861 () Bool)

(assert (=> b!667861 (= e!382200 (not e!382202))))

(declare-fun res!435008 () Bool)

(assert (=> b!667861 (=> res!435008 e!382202)))

(assert (=> b!667861 (= res!435008 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (=> b!667861 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!310989)))

(declare-fun lt!310986 () Unit!23390)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39081 (_ BitVec 64) (_ BitVec 32) List!12774 List!12774) Unit!23390)

(assert (=> b!667861 (= lt!310986 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!310989))))

(declare-fun -!88 (List!12774 (_ BitVec 64)) List!12774)

(assert (=> b!667861 (= (-!88 lt!310989 k0!2843) acc!681)))

(assert (=> b!667861 (= lt!310989 ($colon$colon!222 acc!681 k0!2843))))

(declare-fun lt!310984 () Unit!23390)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12774) Unit!23390)

(assert (=> b!667861 (= lt!310984 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(assert (=> b!667861 (subseq!90 acc!681 acc!681)))

(declare-fun lt!310992 () Unit!23390)

(assert (=> b!667861 (= lt!310992 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!667861 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!310987 () Unit!23390)

(assert (=> b!667861 (= lt!310987 e!382199)))

(declare-fun c!76795 () Bool)

(assert (=> b!667861 (= c!76795 (validKeyInArray!0 (select (arr!18733 a!3626) from!3004)))))

(declare-fun lt!310990 () Unit!23390)

(assert (=> b!667861 (= lt!310990 e!382208)))

(declare-fun c!76796 () Bool)

(declare-fun arrayContainsKey!0 (array!39081 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!667861 (= c!76796 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!667861 (arrayContainsKey!0 (array!39082 (store (arr!18733 a!3626) i!1382 k0!2843) (size!19097 a!3626)) k0!2843 from!3004)))

(declare-fun b!667862 () Bool)

(declare-fun e!382203 () Bool)

(declare-fun e!382204 () Bool)

(assert (=> b!667862 (= e!382203 e!382204)))

(declare-fun res!435009 () Bool)

(assert (=> b!667862 (=> (not res!435009) (not e!382204))))

(assert (=> b!667862 (= res!435009 (bvsle from!3004 i!1382))))

(declare-fun b!667863 () Bool)

(declare-fun res!434998 () Bool)

(assert (=> b!667863 (=> (not res!434998) (not e!382200))))

(assert (=> b!667863 (= res!434998 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12771))))

(declare-fun b!667864 () Bool)

(declare-fun res!435012 () Bool)

(assert (=> b!667864 (=> (not res!435012) (not e!382200))))

(declare-fun contains!3351 (List!12774 (_ BitVec 64)) Bool)

(assert (=> b!667864 (= res!435012 (not (contains!3351 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!667865 () Bool)

(declare-fun res!435016 () Bool)

(assert (=> b!667865 (=> (not res!435016) (not e!382200))))

(assert (=> b!667865 (= res!435016 (noDuplicate!598 acc!681))))

(declare-fun b!667866 () Bool)

(declare-fun res!434999 () Bool)

(assert (=> b!667866 (=> res!434999 e!382202)))

(assert (=> b!667866 (= res!434999 (contains!3351 lt!310989 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!667867 () Bool)

(declare-fun res!435004 () Bool)

(assert (=> b!667867 (=> (not res!435004) (not e!382200))))

(assert (=> b!667867 (= res!435004 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!667860 () Bool)

(declare-fun e!382209 () Bool)

(assert (=> b!667860 (= e!382209 (contains!3351 lt!310989 k0!2843))))

(declare-fun res!435010 () Bool)

(assert (=> start!60034 (=> (not res!435010) (not e!382200))))

(assert (=> start!60034 (= res!435010 (and (bvslt (size!19097 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19097 a!3626))))))

(assert (=> start!60034 e!382200))

(assert (=> start!60034 true))

(declare-fun array_inv!14529 (array!39081) Bool)

(assert (=> start!60034 (array_inv!14529 a!3626)))

(declare-fun b!667868 () Bool)

(declare-fun Unit!23394 () Unit!23390)

(assert (=> b!667868 (= e!382199 Unit!23394)))

(declare-fun b!667869 () Bool)

(declare-fun res!434997 () Bool)

(assert (=> b!667869 (=> res!434997 e!382202)))

(assert (=> b!667869 (= res!434997 (contains!3351 lt!310989 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!667870 () Bool)

(declare-fun e!382201 () Bool)

(declare-fun e!382206 () Bool)

(assert (=> b!667870 (= e!382201 e!382206)))

(declare-fun res!435005 () Bool)

(assert (=> b!667870 (=> (not res!435005) (not e!382206))))

(assert (=> b!667870 (= res!435005 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!667871 () Bool)

(assert (=> b!667871 (= e!382202 true)))

(declare-fun lt!310991 () Bool)

(assert (=> b!667871 (= lt!310991 e!382201)))

(declare-fun res!435014 () Bool)

(assert (=> b!667871 (=> res!435014 e!382201)))

(assert (=> b!667871 (= res!435014 e!382209)))

(declare-fun res!435011 () Bool)

(assert (=> b!667871 (=> (not res!435011) (not e!382209))))

(assert (=> b!667871 (= res!435011 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!667872 () Bool)

(declare-fun e!382207 () Bool)

(assert (=> b!667872 (= e!382207 (contains!3351 acc!681 k0!2843))))

(declare-fun b!667873 () Bool)

(assert (=> b!667873 (= e!382204 (not (contains!3351 acc!681 k0!2843)))))

(declare-fun b!667874 () Bool)

(declare-fun res!435003 () Bool)

(assert (=> b!667874 (=> (not res!435003) (not e!382200))))

(assert (=> b!667874 (= res!435003 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!667875 () Bool)

(declare-fun res!435006 () Bool)

(assert (=> b!667875 (=> (not res!435006) (not e!382200))))

(assert (=> b!667875 (= res!435006 e!382203)))

(declare-fun res!435000 () Bool)

(assert (=> b!667875 (=> res!435000 e!382203)))

(assert (=> b!667875 (= res!435000 e!382207)))

(declare-fun res!435007 () Bool)

(assert (=> b!667875 (=> (not res!435007) (not e!382207))))

(assert (=> b!667875 (= res!435007 (bvsgt from!3004 i!1382))))

(declare-fun b!667876 () Bool)

(assert (=> b!667876 (= e!382206 (not (contains!3351 lt!310989 k0!2843)))))

(declare-fun b!667877 () Bool)

(declare-fun res!435002 () Bool)

(assert (=> b!667877 (=> (not res!435002) (not e!382200))))

(assert (=> b!667877 (= res!435002 (not (contains!3351 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!60034 res!435010) b!667865))

(assert (= (and b!667865 res!435016) b!667877))

(assert (= (and b!667877 res!435002) b!667864))

(assert (= (and b!667864 res!435012) b!667875))

(assert (= (and b!667875 res!435007) b!667872))

(assert (= (and b!667875 (not res!435000)) b!667862))

(assert (= (and b!667862 res!435009) b!667873))

(assert (= (and b!667875 res!435006) b!667863))

(assert (= (and b!667863 res!434998) b!667874))

(assert (= (and b!667874 res!435003) b!667855))

(assert (= (and b!667855 res!435015) b!667858))

(assert (= (and b!667858 res!435001) b!667867))

(assert (= (and b!667867 res!435004) b!667856))

(assert (= (and b!667856 res!435013) b!667861))

(assert (= (and b!667861 c!76796) b!667853))

(assert (= (and b!667861 (not c!76796)) b!667857))

(assert (= (and b!667861 c!76795) b!667854))

(assert (= (and b!667861 (not c!76795)) b!667868))

(assert (= (and b!667861 (not res!435008)) b!667859))

(assert (= (and b!667859 (not res!435017)) b!667869))

(assert (= (and b!667869 (not res!434997)) b!667866))

(assert (= (and b!667866 (not res!434999)) b!667871))

(assert (= (and b!667871 res!435011) b!667860))

(assert (= (and b!667871 (not res!435014)) b!667870))

(assert (= (and b!667870 res!435005) b!667876))

(declare-fun m!638307 () Bool)

(assert (=> b!667864 m!638307))

(declare-fun m!638309 () Bool)

(assert (=> b!667859 m!638309))

(declare-fun m!638311 () Bool)

(assert (=> b!667858 m!638311))

(declare-fun m!638313 () Bool)

(assert (=> b!667873 m!638313))

(declare-fun m!638315 () Bool)

(assert (=> b!667861 m!638315))

(declare-fun m!638317 () Bool)

(assert (=> b!667861 m!638317))

(declare-fun m!638319 () Bool)

(assert (=> b!667861 m!638319))

(declare-fun m!638321 () Bool)

(assert (=> b!667861 m!638321))

(declare-fun m!638323 () Bool)

(assert (=> b!667861 m!638323))

(declare-fun m!638325 () Bool)

(assert (=> b!667861 m!638325))

(declare-fun m!638327 () Bool)

(assert (=> b!667861 m!638327))

(declare-fun m!638329 () Bool)

(assert (=> b!667861 m!638329))

(assert (=> b!667861 m!638317))

(declare-fun m!638331 () Bool)

(assert (=> b!667861 m!638331))

(declare-fun m!638333 () Bool)

(assert (=> b!667861 m!638333))

(declare-fun m!638335 () Bool)

(assert (=> b!667861 m!638335))

(declare-fun m!638337 () Bool)

(assert (=> b!667861 m!638337))

(declare-fun m!638339 () Bool)

(assert (=> b!667861 m!638339))

(declare-fun m!638341 () Bool)

(assert (=> b!667866 m!638341))

(declare-fun m!638343 () Bool)

(assert (=> b!667860 m!638343))

(declare-fun m!638345 () Bool)

(assert (=> b!667853 m!638345))

(declare-fun m!638347 () Bool)

(assert (=> b!667877 m!638347))

(declare-fun m!638349 () Bool)

(assert (=> b!667863 m!638349))

(assert (=> b!667872 m!638313))

(declare-fun m!638351 () Bool)

(assert (=> b!667865 m!638351))

(assert (=> b!667854 m!638315))

(assert (=> b!667854 m!638317))

(declare-fun m!638353 () Bool)

(assert (=> b!667854 m!638353))

(declare-fun m!638355 () Bool)

(assert (=> b!667854 m!638355))

(assert (=> b!667854 m!638317))

(assert (=> b!667854 m!638353))

(assert (=> b!667854 m!638327))

(assert (=> b!667854 m!638339))

(declare-fun m!638357 () Bool)

(assert (=> b!667869 m!638357))

(assert (=> b!667876 m!638343))

(declare-fun m!638359 () Bool)

(assert (=> start!60034 m!638359))

(declare-fun m!638361 () Bool)

(assert (=> b!667874 m!638361))

(declare-fun m!638363 () Bool)

(assert (=> b!667867 m!638363))

(check-sat (not b!667866) (not b!667869) (not b!667867) (not b!667874) (not b!667865) (not b!667872) (not start!60034) (not b!667877) (not b!667873) (not b!667864) (not b!667853) (not b!667859) (not b!667858) (not b!667860) (not b!667854) (not b!667861) (not b!667876) (not b!667863))
(check-sat)
