; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60486 () Bool)

(assert start!60486)

(declare-fun b!679679 () Bool)

(declare-datatypes ((Unit!23810 0))(
  ( (Unit!23811) )
))
(declare-fun e!387228 () Unit!23810)

(declare-fun Unit!23812 () Unit!23810)

(assert (=> b!679679 (= e!387228 Unit!23812)))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun lt!312952 () Unit!23810)

(declare-fun k!2843 () (_ BitVec 64))

(declare-datatypes ((array!39467 0))(
  ( (array!39468 (arr!18923 (Array (_ BitVec 32) (_ BitVec 64))) (size!19287 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39467)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39467 (_ BitVec 64) (_ BitVec 32)) Unit!23810)

(assert (=> b!679679 (= lt!312952 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!679679 false))

(declare-fun b!679680 () Bool)

(declare-fun e!387223 () Bool)

(declare-datatypes ((List!12964 0))(
  ( (Nil!12961) (Cons!12960 (h!14005 (_ BitVec 64)) (t!19192 List!12964)) )
))
(declare-fun acc!681 () List!12964)

(declare-fun contains!3541 (List!12964 (_ BitVec 64)) Bool)

(assert (=> b!679680 (= e!387223 (contains!3541 acc!681 k!2843))))

(declare-fun res!446029 () Bool)

(declare-fun e!387225 () Bool)

(assert (=> start!60486 (=> (not res!446029) (not e!387225))))

(assert (=> start!60486 (= res!446029 (and (bvslt (size!19287 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19287 a!3626))))))

(assert (=> start!60486 e!387225))

(assert (=> start!60486 true))

(declare-fun array_inv!14719 (array!39467) Bool)

(assert (=> start!60486 (array_inv!14719 a!3626)))

(declare-fun b!679681 () Bool)

(declare-fun res!446028 () Bool)

(assert (=> b!679681 (=> (not res!446028) (not e!387225))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!679681 (= res!446028 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19287 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!679682 () Bool)

(assert (=> b!679682 (= e!387225 (not true))))

(declare-fun lt!312951 () Unit!23810)

(assert (=> b!679682 (= lt!312951 e!387228)))

(declare-fun c!77195 () Bool)

(declare-fun arrayContainsKey!0 (array!39467 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!679682 (= c!77195 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!679682 (arrayContainsKey!0 (array!39468 (store (arr!18923 a!3626) i!1382 k!2843) (size!19287 a!3626)) k!2843 from!3004)))

(declare-fun b!679683 () Bool)

(declare-fun res!446035 () Bool)

(assert (=> b!679683 (=> (not res!446035) (not e!387225))))

(declare-fun arrayNoDuplicates!0 (array!39467 (_ BitVec 32) List!12964) Bool)

(assert (=> b!679683 (= res!446035 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!679684 () Bool)

(declare-fun e!387226 () Bool)

(assert (=> b!679684 (= e!387226 (not (contains!3541 acc!681 k!2843)))))

(declare-fun b!679685 () Bool)

(declare-fun res!446031 () Bool)

(assert (=> b!679685 (=> (not res!446031) (not e!387225))))

(assert (=> b!679685 (= res!446031 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19287 a!3626))))))

(declare-fun b!679686 () Bool)

(declare-fun res!446034 () Bool)

(assert (=> b!679686 (=> (not res!446034) (not e!387225))))

(declare-fun noDuplicate!788 (List!12964) Bool)

(assert (=> b!679686 (= res!446034 (noDuplicate!788 acc!681))))

(declare-fun b!679687 () Bool)

(declare-fun res!446033 () Bool)

(assert (=> b!679687 (=> (not res!446033) (not e!387225))))

(declare-fun e!387224 () Bool)

(assert (=> b!679687 (= res!446033 e!387224)))

(declare-fun res!446026 () Bool)

(assert (=> b!679687 (=> res!446026 e!387224)))

(assert (=> b!679687 (= res!446026 e!387223)))

(declare-fun res!446023 () Bool)

(assert (=> b!679687 (=> (not res!446023) (not e!387223))))

(assert (=> b!679687 (= res!446023 (bvsgt from!3004 i!1382))))

(declare-fun b!679688 () Bool)

(declare-fun res!446036 () Bool)

(assert (=> b!679688 (=> (not res!446036) (not e!387225))))

(assert (=> b!679688 (= res!446036 (not (contains!3541 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!679689 () Bool)

(declare-fun Unit!23813 () Unit!23810)

(assert (=> b!679689 (= e!387228 Unit!23813)))

(declare-fun b!679690 () Bool)

(declare-fun res!446025 () Bool)

(assert (=> b!679690 (=> (not res!446025) (not e!387225))))

(assert (=> b!679690 (= res!446025 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!679691 () Bool)

(declare-fun res!446030 () Bool)

(assert (=> b!679691 (=> (not res!446030) (not e!387225))))

(assert (=> b!679691 (= res!446030 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12961))))

(declare-fun b!679692 () Bool)

(declare-fun res!446027 () Bool)

(assert (=> b!679692 (=> (not res!446027) (not e!387225))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!679692 (= res!446027 (validKeyInArray!0 k!2843))))

(declare-fun b!679693 () Bool)

(assert (=> b!679693 (= e!387224 e!387226)))

(declare-fun res!446024 () Bool)

(assert (=> b!679693 (=> (not res!446024) (not e!387226))))

(assert (=> b!679693 (= res!446024 (bvsle from!3004 i!1382))))

(declare-fun b!679694 () Bool)

(declare-fun res!446032 () Bool)

(assert (=> b!679694 (=> (not res!446032) (not e!387225))))

(assert (=> b!679694 (= res!446032 (not (contains!3541 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!60486 res!446029) b!679686))

(assert (= (and b!679686 res!446034) b!679694))

(assert (= (and b!679694 res!446032) b!679688))

(assert (= (and b!679688 res!446036) b!679687))

(assert (= (and b!679687 res!446023) b!679680))

(assert (= (and b!679687 (not res!446026)) b!679693))

(assert (= (and b!679693 res!446024) b!679684))

(assert (= (and b!679687 res!446033) b!679691))

(assert (= (and b!679691 res!446030) b!679683))

(assert (= (and b!679683 res!446035) b!679685))

(assert (= (and b!679685 res!446031) b!679692))

(assert (= (and b!679692 res!446027) b!679690))

(assert (= (and b!679690 res!446025) b!679681))

(assert (= (and b!679681 res!446028) b!679682))

(assert (= (and b!679682 c!77195) b!679679))

(assert (= (and b!679682 (not c!77195)) b!679689))

(declare-fun m!644991 () Bool)

(assert (=> start!60486 m!644991))

(declare-fun m!644993 () Bool)

(assert (=> b!679679 m!644993))

(declare-fun m!644995 () Bool)

(assert (=> b!679680 m!644995))

(declare-fun m!644997 () Bool)

(assert (=> b!679686 m!644997))

(declare-fun m!644999 () Bool)

(assert (=> b!679694 m!644999))

(declare-fun m!645001 () Bool)

(assert (=> b!679692 m!645001))

(declare-fun m!645003 () Bool)

(assert (=> b!679690 m!645003))

(declare-fun m!645005 () Bool)

(assert (=> b!679691 m!645005))

(assert (=> b!679684 m!644995))

(declare-fun m!645007 () Bool)

(assert (=> b!679688 m!645007))

(declare-fun m!645009 () Bool)

(assert (=> b!679683 m!645009))

(declare-fun m!645011 () Bool)

(assert (=> b!679682 m!645011))

(declare-fun m!645013 () Bool)

(assert (=> b!679682 m!645013))

(declare-fun m!645015 () Bool)

(assert (=> b!679682 m!645015))

(push 1)

(assert (not b!679679))

(assert (not b!679680))

(assert (not b!679690))

(assert (not b!679684))

(assert (not b!679688))

(assert (not b!679683))

(assert (not b!679691))

(assert (not b!679694))

(assert (not b!679682))

(assert (not start!60486))

(assert (not b!679686))

