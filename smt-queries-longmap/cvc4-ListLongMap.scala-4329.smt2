; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60006 () Bool)

(assert start!60006)

(declare-fun b!666803 () Bool)

(declare-fun res!434130 () Bool)

(declare-fun e!381796 () Bool)

(assert (=> b!666803 (=> (not res!434130) (not e!381796))))

(declare-datatypes ((array!39053 0))(
  ( (array!39054 (arr!18719 (Array (_ BitVec 32) (_ BitVec 64))) (size!19083 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39053)

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((List!12760 0))(
  ( (Nil!12757) (Cons!12756 (h!13801 (_ BitVec 64)) (t!18988 List!12760)) )
))
(declare-fun acc!681 () List!12760)

(declare-fun arrayNoDuplicates!0 (array!39053 (_ BitVec 32) List!12760) Bool)

(assert (=> b!666803 (= res!434130 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!666804 () Bool)

(declare-fun res!434118 () Bool)

(declare-fun e!381799 () Bool)

(assert (=> b!666804 (=> res!434118 e!381799)))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3337 (List!12760 (_ BitVec 64)) Bool)

(assert (=> b!666804 (= res!434118 (contains!3337 acc!681 k!2843))))

(declare-fun b!666805 () Bool)

(declare-fun res!434131 () Bool)

(assert (=> b!666805 (=> (not res!434131) (not e!381796))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!666805 (= res!434131 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19083 a!3626))))))

(declare-fun b!666806 () Bool)

(declare-fun res!434128 () Bool)

(assert (=> b!666806 (=> (not res!434128) (not e!381796))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!666806 (= res!434128 (validKeyInArray!0 k!2843))))

(declare-fun b!666807 () Bool)

(declare-fun res!434115 () Bool)

(assert (=> b!666807 (=> (not res!434115) (not e!381796))))

(declare-fun noDuplicate!584 (List!12760) Bool)

(assert (=> b!666807 (= res!434115 (noDuplicate!584 acc!681))))

(declare-fun b!666808 () Bool)

(declare-fun res!434127 () Bool)

(assert (=> b!666808 (=> res!434127 e!381799)))

(declare-fun lt!310571 () Bool)

(assert (=> b!666808 (= res!434127 lt!310571)))

(declare-fun b!666809 () Bool)

(declare-datatypes ((Unit!23320 0))(
  ( (Unit!23321) )
))
(declare-fun e!381794 () Unit!23320)

(declare-fun lt!310567 () Unit!23320)

(assert (=> b!666809 (= e!381794 lt!310567)))

(declare-fun lt!310570 () Unit!23320)

(declare-fun lemmaListSubSeqRefl!0 (List!12760) Unit!23320)

(assert (=> b!666809 (= lt!310570 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!76 (List!12760 List!12760) Bool)

(assert (=> b!666809 (subseq!76 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39053 List!12760 List!12760 (_ BitVec 32)) Unit!23320)

(declare-fun $colon$colon!208 (List!12760 (_ BitVec 64)) List!12760)

(assert (=> b!666809 (= lt!310567 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!208 acc!681 (select (arr!18719 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!666809 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!666810 () Bool)

(declare-fun res!434116 () Bool)

(assert (=> b!666810 (=> res!434116 e!381799)))

(declare-fun lt!310572 () List!12760)

(assert (=> b!666810 (= res!434116 (not (subseq!76 acc!681 lt!310572)))))

(declare-fun b!666811 () Bool)

(declare-fun res!434117 () Bool)

(assert (=> b!666811 (=> (not res!434117) (not e!381796))))

(declare-fun arrayContainsKey!0 (array!39053 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!666811 (= res!434117 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!666812 () Bool)

(declare-fun res!434126 () Bool)

(assert (=> b!666812 (=> (not res!434126) (not e!381796))))

(assert (=> b!666812 (= res!434126 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12757))))

(declare-fun b!666813 () Bool)

(declare-fun res!434135 () Bool)

(assert (=> b!666813 (=> res!434135 e!381799)))

(assert (=> b!666813 (= res!434135 (contains!3337 lt!310572 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!666814 () Bool)

(assert (=> b!666814 (= e!381796 (not e!381799))))

(declare-fun res!434132 () Bool)

(assert (=> b!666814 (=> res!434132 e!381799)))

(assert (=> b!666814 (= res!434132 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!74 (List!12760 (_ BitVec 64)) List!12760)

(assert (=> b!666814 (= (-!74 lt!310572 k!2843) acc!681)))

(assert (=> b!666814 (= lt!310572 ($colon$colon!208 acc!681 k!2843))))

(declare-fun lt!310566 () Unit!23320)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12760) Unit!23320)

(assert (=> b!666814 (= lt!310566 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(assert (=> b!666814 (subseq!76 acc!681 acc!681)))

(declare-fun lt!310569 () Unit!23320)

(assert (=> b!666814 (= lt!310569 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!666814 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!310565 () Unit!23320)

(assert (=> b!666814 (= lt!310565 e!381794)))

(declare-fun c!76712 () Bool)

(assert (=> b!666814 (= c!76712 (validKeyInArray!0 (select (arr!18719 a!3626) from!3004)))))

(declare-fun lt!310564 () Unit!23320)

(declare-fun e!381797 () Unit!23320)

(assert (=> b!666814 (= lt!310564 e!381797)))

(declare-fun c!76711 () Bool)

(assert (=> b!666814 (= c!76711 lt!310571)))

(assert (=> b!666814 (= lt!310571 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!666814 (arrayContainsKey!0 (array!39054 (store (arr!18719 a!3626) i!1382 k!2843) (size!19083 a!3626)) k!2843 from!3004)))

(declare-fun b!666815 () Bool)

(declare-fun res!434120 () Bool)

(assert (=> b!666815 (=> (not res!434120) (not e!381796))))

(declare-fun e!381801 () Bool)

(assert (=> b!666815 (= res!434120 e!381801)))

(declare-fun res!434133 () Bool)

(assert (=> b!666815 (=> res!434133 e!381801)))

(declare-fun e!381795 () Bool)

(assert (=> b!666815 (= res!434133 e!381795)))

(declare-fun res!434134 () Bool)

(assert (=> b!666815 (=> (not res!434134) (not e!381795))))

(assert (=> b!666815 (= res!434134 (bvsgt from!3004 i!1382))))

(declare-fun b!666816 () Bool)

(declare-fun res!434121 () Bool)

(assert (=> b!666816 (=> res!434121 e!381799)))

(assert (=> b!666816 (= res!434121 (not (contains!3337 lt!310572 k!2843)))))

(declare-fun b!666817 () Bool)

(declare-fun Unit!23322 () Unit!23320)

(assert (=> b!666817 (= e!381797 Unit!23322)))

(declare-fun lt!310573 () Unit!23320)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39053 (_ BitVec 64) (_ BitVec 32)) Unit!23320)

(assert (=> b!666817 (= lt!310573 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!666817 false))

(declare-fun res!434122 () Bool)

(assert (=> start!60006 (=> (not res!434122) (not e!381796))))

(assert (=> start!60006 (= res!434122 (and (bvslt (size!19083 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19083 a!3626))))))

(assert (=> start!60006 e!381796))

(assert (=> start!60006 true))

(declare-fun array_inv!14515 (array!39053) Bool)

(assert (=> start!60006 (array_inv!14515 a!3626)))

(declare-fun b!666818 () Bool)

(declare-fun Unit!23323 () Unit!23320)

(assert (=> b!666818 (= e!381797 Unit!23323)))

(declare-fun b!666819 () Bool)

(assert (=> b!666819 (= e!381795 (contains!3337 acc!681 k!2843))))

(declare-fun b!666820 () Bool)

(declare-fun res!434119 () Bool)

(assert (=> b!666820 (=> res!434119 e!381799)))

(assert (=> b!666820 (= res!434119 (not (noDuplicate!584 lt!310572)))))

(declare-fun b!666821 () Bool)

(assert (=> b!666821 (= e!381799 true)))

(declare-fun lt!310568 () Bool)

(assert (=> b!666821 (= lt!310568 (contains!3337 lt!310572 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!666822 () Bool)

(declare-fun e!381800 () Bool)

(assert (=> b!666822 (= e!381801 e!381800)))

(declare-fun res!434123 () Bool)

(assert (=> b!666822 (=> (not res!434123) (not e!381800))))

(assert (=> b!666822 (= res!434123 (bvsle from!3004 i!1382))))

(declare-fun b!666823 () Bool)

(assert (=> b!666823 (= e!381800 (not (contains!3337 acc!681 k!2843)))))

(declare-fun b!666824 () Bool)

(declare-fun res!434129 () Bool)

(assert (=> b!666824 (=> (not res!434129) (not e!381796))))

(assert (=> b!666824 (= res!434129 (not (contains!3337 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!666825 () Bool)

(declare-fun res!434125 () Bool)

(assert (=> b!666825 (=> (not res!434125) (not e!381796))))

(assert (=> b!666825 (= res!434125 (not (contains!3337 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!666826 () Bool)

(declare-fun Unit!23324 () Unit!23320)

(assert (=> b!666826 (= e!381794 Unit!23324)))

(declare-fun b!666827 () Bool)

(declare-fun res!434124 () Bool)

(assert (=> b!666827 (=> (not res!434124) (not e!381796))))

(assert (=> b!666827 (= res!434124 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19083 a!3626)) (= from!3004 i!1382)))))

(assert (= (and start!60006 res!434122) b!666807))

(assert (= (and b!666807 res!434115) b!666824))

(assert (= (and b!666824 res!434129) b!666825))

(assert (= (and b!666825 res!434125) b!666815))

(assert (= (and b!666815 res!434134) b!666819))

(assert (= (and b!666815 (not res!434133)) b!666822))

(assert (= (and b!666822 res!434123) b!666823))

(assert (= (and b!666815 res!434120) b!666812))

(assert (= (and b!666812 res!434126) b!666803))

(assert (= (and b!666803 res!434130) b!666805))

(assert (= (and b!666805 res!434131) b!666806))

(assert (= (and b!666806 res!434128) b!666811))

(assert (= (and b!666811 res!434117) b!666827))

(assert (= (and b!666827 res!434124) b!666814))

(assert (= (and b!666814 c!76711) b!666817))

(assert (= (and b!666814 (not c!76711)) b!666818))

(assert (= (and b!666814 c!76712) b!666809))

(assert (= (and b!666814 (not c!76712)) b!666826))

(assert (= (and b!666814 (not res!434132)) b!666820))

(assert (= (and b!666820 (not res!434119)) b!666808))

(assert (= (and b!666808 (not res!434127)) b!666804))

(assert (= (and b!666804 (not res!434118)) b!666810))

(assert (= (and b!666810 (not res!434116)) b!666816))

(assert (= (and b!666816 (not res!434121)) b!666813))

(assert (= (and b!666813 (not res!434135)) b!666821))

(declare-fun m!637509 () Bool)

(assert (=> b!666819 m!637509))

(declare-fun m!637511 () Bool)

(assert (=> b!666814 m!637511))

(declare-fun m!637513 () Bool)

(assert (=> b!666814 m!637513))

(declare-fun m!637515 () Bool)

(assert (=> b!666814 m!637515))

(declare-fun m!637517 () Bool)

(assert (=> b!666814 m!637517))

(declare-fun m!637519 () Bool)

(assert (=> b!666814 m!637519))

(declare-fun m!637521 () Bool)

(assert (=> b!666814 m!637521))

(declare-fun m!637523 () Bool)

(assert (=> b!666814 m!637523))

(declare-fun m!637525 () Bool)

(assert (=> b!666814 m!637525))

(assert (=> b!666814 m!637513))

(declare-fun m!637527 () Bool)

(assert (=> b!666814 m!637527))

(declare-fun m!637529 () Bool)

(assert (=> b!666814 m!637529))

(declare-fun m!637531 () Bool)

(assert (=> b!666814 m!637531))

(declare-fun m!637533 () Bool)

(assert (=> b!666816 m!637533))

(declare-fun m!637535 () Bool)

(assert (=> b!666817 m!637535))

(declare-fun m!637537 () Bool)

(assert (=> b!666806 m!637537))

(declare-fun m!637539 () Bool)

(assert (=> b!666811 m!637539))

(declare-fun m!637541 () Bool)

(assert (=> b!666825 m!637541))

(declare-fun m!637543 () Bool)

(assert (=> start!60006 m!637543))

(declare-fun m!637545 () Bool)

(assert (=> b!666821 m!637545))

(declare-fun m!637547 () Bool)

(assert (=> b!666813 m!637547))

(declare-fun m!637549 () Bool)

(assert (=> b!666812 m!637549))

(declare-fun m!637551 () Bool)

(assert (=> b!666803 m!637551))

(assert (=> b!666809 m!637511))

(assert (=> b!666809 m!637513))

(declare-fun m!637553 () Bool)

(assert (=> b!666809 m!637553))

(declare-fun m!637555 () Bool)

(assert (=> b!666809 m!637555))

(assert (=> b!666809 m!637513))

(assert (=> b!666809 m!637553))

(assert (=> b!666809 m!637521))

(assert (=> b!666809 m!637531))

(declare-fun m!637557 () Bool)

(assert (=> b!666807 m!637557))

(declare-fun m!637559 () Bool)

(assert (=> b!666824 m!637559))

(assert (=> b!666823 m!637509))

(declare-fun m!637561 () Bool)

(assert (=> b!666810 m!637561))

(assert (=> b!666804 m!637509))

(declare-fun m!637563 () Bool)

(assert (=> b!666820 m!637563))

(push 1)

(assert (not b!666817))

(assert (not b!666812))

(assert (not b!666814))

(assert (not b!666823))

(assert (not b!666803))

(assert (not b!666816))

(assert (not b!666824))

(assert (not b!666809))

(assert (not b!666820))

(assert (not b!666821))

(assert (not b!666804))

(assert (not start!60006))

(assert (not b!666813))

(assert (not b!666811))

(assert (not b!666825))

(assert (not b!666810))

(assert (not b!666807))

(assert (not b!666819))

(assert (not b!666806))

(check-sat)

