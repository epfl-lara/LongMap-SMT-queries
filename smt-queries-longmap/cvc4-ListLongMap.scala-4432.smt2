; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61572 () Bool)

(assert start!61572)

(declare-fun b!688868 () Bool)

(declare-fun res!453515 () Bool)

(declare-fun e!392297 () Bool)

(assert (=> b!688868 (=> res!453515 e!392297)))

(declare-datatypes ((List!13069 0))(
  ( (Nil!13066) (Cons!13065 (h!14110 (_ BitVec 64)) (t!19333 List!13069)) )
))
(declare-fun lt!315940 () List!13069)

(declare-fun contains!3646 (List!13069 (_ BitVec 64)) Bool)

(assert (=> b!688868 (= res!453515 (contains!3646 lt!315940 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!688869 () Bool)

(declare-fun res!453517 () Bool)

(declare-fun e!392299 () Bool)

(assert (=> b!688869 (=> (not res!453517) (not e!392299))))

(declare-fun acc!681 () List!13069)

(declare-fun noDuplicate!893 (List!13069) Bool)

(assert (=> b!688869 (= res!453517 (noDuplicate!893 acc!681))))

(declare-fun b!688870 () Bool)

(declare-fun e!392304 () Bool)

(declare-fun e!392301 () Bool)

(assert (=> b!688870 (= e!392304 e!392301)))

(declare-fun res!453509 () Bool)

(assert (=> b!688870 (=> (not res!453509) (not e!392301))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!688870 (= res!453509 (bvsle from!3004 i!1382))))

(declare-fun b!688871 () Bool)

(declare-fun e!392302 () Bool)

(declare-fun e!392298 () Bool)

(assert (=> b!688871 (= e!392302 e!392298)))

(declare-fun res!453521 () Bool)

(assert (=> b!688871 (=> (not res!453521) (not e!392298))))

(assert (=> b!688871 (= res!453521 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!688872 () Bool)

(assert (=> b!688872 (= e!392299 (not e!392297))))

(declare-fun res!453522 () Bool)

(assert (=> b!688872 (=> res!453522 e!392297)))

(assert (=> b!688872 (= res!453522 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-datatypes ((array!39713 0))(
  ( (array!39714 (arr!19028 (Array (_ BitVec 32) (_ BitVec 64))) (size!19410 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39713)

(declare-fun arrayNoDuplicates!0 (array!39713 (_ BitVec 32) List!13069) Bool)

(assert (=> b!688872 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!315940)))

(declare-datatypes ((Unit!24307 0))(
  ( (Unit!24308) )
))
(declare-fun lt!315942 () Unit!24307)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39713 (_ BitVec 64) (_ BitVec 32) List!13069 List!13069) Unit!24307)

(assert (=> b!688872 (= lt!315942 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!315940))))

(declare-fun -!197 (List!13069 (_ BitVec 64)) List!13069)

(assert (=> b!688872 (= (-!197 lt!315940 k!2843) acc!681)))

(declare-fun $colon$colon!397 (List!13069 (_ BitVec 64)) List!13069)

(assert (=> b!688872 (= lt!315940 ($colon$colon!397 acc!681 k!2843))))

(declare-fun lt!315946 () Unit!24307)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13069) Unit!24307)

(assert (=> b!688872 (= lt!315946 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!232 (List!13069 List!13069) Bool)

(assert (=> b!688872 (subseq!232 acc!681 acc!681)))

(declare-fun lt!315945 () Unit!24307)

(declare-fun lemmaListSubSeqRefl!0 (List!13069) Unit!24307)

(assert (=> b!688872 (= lt!315945 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!688872 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!315949 () Unit!24307)

(declare-fun e!392303 () Unit!24307)

(assert (=> b!688872 (= lt!315949 e!392303)))

(declare-fun c!78049 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!688872 (= c!78049 (validKeyInArray!0 (select (arr!19028 a!3626) from!3004)))))

(declare-fun lt!315941 () Unit!24307)

(declare-fun e!392307 () Unit!24307)

(assert (=> b!688872 (= lt!315941 e!392307)))

(declare-fun c!78050 () Bool)

(declare-fun arrayContainsKey!0 (array!39713 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!688872 (= c!78050 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!688872 (arrayContainsKey!0 (array!39714 (store (arr!19028 a!3626) i!1382 k!2843) (size!19410 a!3626)) k!2843 from!3004)))

(declare-fun b!688873 () Bool)

(declare-fun res!453516 () Bool)

(assert (=> b!688873 (=> (not res!453516) (not e!392299))))

(assert (=> b!688873 (= res!453516 (not (contains!3646 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!688874 () Bool)

(declare-fun e!392305 () Bool)

(assert (=> b!688874 (= e!392305 (contains!3646 lt!315940 k!2843))))

(declare-fun b!688875 () Bool)

(assert (=> b!688875 (= e!392298 (not (contains!3646 lt!315940 k!2843)))))

(declare-fun b!688877 () Bool)

(declare-fun res!453514 () Bool)

(assert (=> b!688877 (=> (not res!453514) (not e!392299))))

(assert (=> b!688877 (= res!453514 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!688878 () Bool)

(declare-fun res!453523 () Bool)

(assert (=> b!688878 (=> res!453523 e!392297)))

(assert (=> b!688878 (= res!453523 (contains!3646 lt!315940 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!688879 () Bool)

(declare-fun res!453518 () Bool)

(assert (=> b!688879 (=> res!453518 e!392297)))

(assert (=> b!688879 (= res!453518 (not (noDuplicate!893 lt!315940)))))

(declare-fun b!688880 () Bool)

(assert (=> b!688880 (= e!392301 (not (contains!3646 acc!681 k!2843)))))

(declare-fun b!688881 () Bool)

(declare-fun res!453512 () Bool)

(assert (=> b!688881 (=> (not res!453512) (not e!392299))))

(assert (=> b!688881 (= res!453512 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19410 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!688882 () Bool)

(declare-fun Unit!24309 () Unit!24307)

(assert (=> b!688882 (= e!392303 Unit!24309)))

(declare-fun b!688883 () Bool)

(declare-fun res!453508 () Bool)

(assert (=> b!688883 (=> (not res!453508) (not e!392299))))

(assert (=> b!688883 (= res!453508 (validKeyInArray!0 k!2843))))

(declare-fun b!688884 () Bool)

(declare-fun e!392306 () Bool)

(assert (=> b!688884 (= e!392306 (contains!3646 acc!681 k!2843))))

(declare-fun b!688885 () Bool)

(declare-fun Unit!24310 () Unit!24307)

(assert (=> b!688885 (= e!392307 Unit!24310)))

(declare-fun b!688886 () Bool)

(declare-fun lt!315944 () Unit!24307)

(assert (=> b!688886 (= e!392303 lt!315944)))

(declare-fun lt!315948 () Unit!24307)

(assert (=> b!688886 (= lt!315948 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!688886 (subseq!232 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39713 List!13069 List!13069 (_ BitVec 32)) Unit!24307)

(assert (=> b!688886 (= lt!315944 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!397 acc!681 (select (arr!19028 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!688886 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!688887 () Bool)

(declare-fun res!453507 () Bool)

(assert (=> b!688887 (=> (not res!453507) (not e!392299))))

(assert (=> b!688887 (= res!453507 (not (contains!3646 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!688888 () Bool)

(assert (=> b!688888 (= e!392297 true)))

(declare-fun lt!315947 () Bool)

(assert (=> b!688888 (= lt!315947 e!392302)))

(declare-fun res!453504 () Bool)

(assert (=> b!688888 (=> res!453504 e!392302)))

(assert (=> b!688888 (= res!453504 e!392305)))

(declare-fun res!453524 () Bool)

(assert (=> b!688888 (=> (not res!453524) (not e!392305))))

(assert (=> b!688888 (= res!453524 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!688889 () Bool)

(declare-fun res!453520 () Bool)

(assert (=> b!688889 (=> (not res!453520) (not e!392299))))

(assert (=> b!688889 (= res!453520 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13066))))

(declare-fun b!688890 () Bool)

(declare-fun Unit!24311 () Unit!24307)

(assert (=> b!688890 (= e!392307 Unit!24311)))

(declare-fun lt!315943 () Unit!24307)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39713 (_ BitVec 64) (_ BitVec 32)) Unit!24307)

(assert (=> b!688890 (= lt!315943 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!688890 false))

(declare-fun b!688876 () Bool)

(declare-fun res!453513 () Bool)

(assert (=> b!688876 (=> (not res!453513) (not e!392299))))

(assert (=> b!688876 (= res!453513 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun res!453505 () Bool)

(assert (=> start!61572 (=> (not res!453505) (not e!392299))))

(assert (=> start!61572 (= res!453505 (and (bvslt (size!19410 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19410 a!3626))))))

(assert (=> start!61572 e!392299))

(assert (=> start!61572 true))

(declare-fun array_inv!14824 (array!39713) Bool)

(assert (=> start!61572 (array_inv!14824 a!3626)))

(declare-fun b!688891 () Bool)

(declare-fun res!453519 () Bool)

(assert (=> b!688891 (=> (not res!453519) (not e!392299))))

(assert (=> b!688891 (= res!453519 e!392304)))

(declare-fun res!453510 () Bool)

(assert (=> b!688891 (=> res!453510 e!392304)))

(assert (=> b!688891 (= res!453510 e!392306)))

(declare-fun res!453506 () Bool)

(assert (=> b!688891 (=> (not res!453506) (not e!392306))))

(assert (=> b!688891 (= res!453506 (bvsgt from!3004 i!1382))))

(declare-fun b!688892 () Bool)

(declare-fun res!453511 () Bool)

(assert (=> b!688892 (=> (not res!453511) (not e!392299))))

(assert (=> b!688892 (= res!453511 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19410 a!3626))))))

(assert (= (and start!61572 res!453505) b!688869))

(assert (= (and b!688869 res!453517) b!688873))

(assert (= (and b!688873 res!453516) b!688887))

(assert (= (and b!688887 res!453507) b!688891))

(assert (= (and b!688891 res!453506) b!688884))

(assert (= (and b!688891 (not res!453510)) b!688870))

(assert (= (and b!688870 res!453509) b!688880))

(assert (= (and b!688891 res!453519) b!688889))

(assert (= (and b!688889 res!453520) b!688876))

(assert (= (and b!688876 res!453513) b!688892))

(assert (= (and b!688892 res!453511) b!688883))

(assert (= (and b!688883 res!453508) b!688877))

(assert (= (and b!688877 res!453514) b!688881))

(assert (= (and b!688881 res!453512) b!688872))

(assert (= (and b!688872 c!78050) b!688890))

(assert (= (and b!688872 (not c!78050)) b!688885))

(assert (= (and b!688872 c!78049) b!688886))

(assert (= (and b!688872 (not c!78049)) b!688882))

(assert (= (and b!688872 (not res!453522)) b!688879))

(assert (= (and b!688879 (not res!453518)) b!688868))

(assert (= (and b!688868 (not res!453515)) b!688878))

(assert (= (and b!688878 (not res!453523)) b!688888))

(assert (= (and b!688888 res!453524) b!688874))

(assert (= (and b!688888 (not res!453504)) b!688871))

(assert (= (and b!688871 res!453521) b!688875))

(declare-fun m!652663 () Bool)

(assert (=> b!688875 m!652663))

(declare-fun m!652665 () Bool)

(assert (=> b!688889 m!652665))

(declare-fun m!652667 () Bool)

(assert (=> b!688872 m!652667))

(declare-fun m!652669 () Bool)

(assert (=> b!688872 m!652669))

(declare-fun m!652671 () Bool)

(assert (=> b!688872 m!652671))

(declare-fun m!652673 () Bool)

(assert (=> b!688872 m!652673))

(declare-fun m!652675 () Bool)

(assert (=> b!688872 m!652675))

(declare-fun m!652677 () Bool)

(assert (=> b!688872 m!652677))

(declare-fun m!652679 () Bool)

(assert (=> b!688872 m!652679))

(declare-fun m!652681 () Bool)

(assert (=> b!688872 m!652681))

(declare-fun m!652683 () Bool)

(assert (=> b!688872 m!652683))

(declare-fun m!652685 () Bool)

(assert (=> b!688872 m!652685))

(assert (=> b!688872 m!652671))

(declare-fun m!652687 () Bool)

(assert (=> b!688872 m!652687))

(declare-fun m!652689 () Bool)

(assert (=> b!688872 m!652689))

(declare-fun m!652691 () Bool)

(assert (=> b!688872 m!652691))

(declare-fun m!652693 () Bool)

(assert (=> b!688876 m!652693))

(declare-fun m!652695 () Bool)

(assert (=> b!688869 m!652695))

(declare-fun m!652697 () Bool)

(assert (=> b!688877 m!652697))

(declare-fun m!652699 () Bool)

(assert (=> b!688887 m!652699))

(declare-fun m!652701 () Bool)

(assert (=> b!688890 m!652701))

(declare-fun m!652703 () Bool)

(assert (=> b!688868 m!652703))

(declare-fun m!652705 () Bool)

(assert (=> b!688883 m!652705))

(declare-fun m!652707 () Bool)

(assert (=> b!688878 m!652707))

(assert (=> b!688886 m!652669))

(assert (=> b!688886 m!652671))

(declare-fun m!652709 () Bool)

(assert (=> b!688886 m!652709))

(declare-fun m!652711 () Bool)

(assert (=> b!688886 m!652711))

(assert (=> b!688886 m!652671))

(assert (=> b!688886 m!652709))

(assert (=> b!688886 m!652681))

(assert (=> b!688886 m!652691))

(declare-fun m!652713 () Bool)

(assert (=> b!688884 m!652713))

(assert (=> b!688874 m!652663))

(declare-fun m!652715 () Bool)

(assert (=> b!688873 m!652715))

(declare-fun m!652717 () Bool)

(assert (=> b!688879 m!652717))

(declare-fun m!652719 () Bool)

(assert (=> start!61572 m!652719))

(assert (=> b!688880 m!652713))

(push 1)

(assert (not start!61572))

(assert (not b!688878))

(assert (not b!688872))

(assert (not b!688880))

(assert (not b!688873))

(assert (not b!688890))

(assert (not b!688874))

(assert (not b!688889))

(assert (not b!688875))

(assert (not b!688884))

(assert (not b!688877))

(assert (not b!688886))

(assert (not b!688883))

(assert (not b!688879))

(assert (not b!688869))

(assert (not b!688868))

(assert (not b!688887))

(assert (not b!688876))

(check-sat)

(pop 1)

