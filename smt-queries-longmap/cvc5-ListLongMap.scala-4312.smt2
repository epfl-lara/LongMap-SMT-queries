; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59900 () Bool)

(assert start!59900)

(declare-fun b!663164 () Bool)

(declare-fun res!431109 () Bool)

(declare-fun e!380570 () Bool)

(assert (=> b!663164 (=> res!431109 e!380570)))

(declare-datatypes ((List!12707 0))(
  ( (Nil!12704) (Cons!12703 (h!13748 (_ BitVec 64)) (t!18935 List!12707)) )
))
(declare-fun lt!309211 () List!12707)

(declare-fun contains!3284 (List!12707 (_ BitVec 64)) Bool)

(assert (=> b!663164 (= res!431109 (contains!3284 lt!309211 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!663165 () Bool)

(declare-fun res!431113 () Bool)

(declare-fun e!380567 () Bool)

(assert (=> b!663165 (=> (not res!431113) (not e!380567))))

(declare-datatypes ((array!38947 0))(
  ( (array!38948 (arr!18666 (Array (_ BitVec 32) (_ BitVec 64))) (size!19030 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38947)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun acc!681 () List!12707)

(declare-fun arrayNoDuplicates!0 (array!38947 (_ BitVec 32) List!12707) Bool)

(assert (=> b!663165 (= res!431113 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!663166 () Bool)

(declare-fun e!380572 () Bool)

(assert (=> b!663166 (= e!380567 (not e!380572))))

(declare-fun res!431114 () Bool)

(assert (=> b!663166 (=> res!431114 e!380572)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!663166 (= res!431114 (not (validKeyInArray!0 (select (arr!18666 a!3626) from!3004))))))

(declare-datatypes ((Unit!23058 0))(
  ( (Unit!23059) )
))
(declare-fun lt!309210 () Unit!23058)

(declare-fun e!380569 () Unit!23058)

(assert (=> b!663166 (= lt!309210 e!380569)))

(declare-fun c!76400 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38947 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!663166 (= c!76400 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!663166 (arrayContainsKey!0 (array!38948 (store (arr!18666 a!3626) i!1382 k!2843) (size!19030 a!3626)) k!2843 from!3004)))

(declare-fun b!663167 () Bool)

(assert (=> b!663167 (= e!380572 e!380570)))

(declare-fun res!431115 () Bool)

(assert (=> b!663167 (=> res!431115 e!380570)))

(assert (=> b!663167 (= res!431115 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!155 (List!12707 (_ BitVec 64)) List!12707)

(assert (=> b!663167 (= lt!309211 ($colon$colon!155 acc!681 (select (arr!18666 a!3626) from!3004)))))

(declare-fun subseq!23 (List!12707 List!12707) Bool)

(assert (=> b!663167 (subseq!23 acc!681 acc!681)))

(declare-fun lt!309209 () Unit!23058)

(declare-fun lemmaListSubSeqRefl!0 (List!12707) Unit!23058)

(assert (=> b!663167 (= lt!309209 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!663168 () Bool)

(declare-fun res!431098 () Bool)

(assert (=> b!663168 (=> (not res!431098) (not e!380567))))

(assert (=> b!663168 (= res!431098 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19030 a!3626))))))

(declare-fun b!663169 () Bool)

(assert (=> b!663169 (= e!380570 true)))

(declare-fun lt!309214 () Bool)

(assert (=> b!663169 (= lt!309214 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!309211))))

(declare-fun lt!309212 () Unit!23058)

(declare-fun noDuplicateSubseq!23 (List!12707 List!12707) Unit!23058)

(assert (=> b!663169 (= lt!309212 (noDuplicateSubseq!23 acc!681 lt!309211))))

(declare-fun b!663170 () Bool)

(declare-fun res!431116 () Bool)

(assert (=> b!663170 (=> (not res!431116) (not e!380567))))

(declare-fun noDuplicate!531 (List!12707) Bool)

(assert (=> b!663170 (= res!431116 (noDuplicate!531 acc!681))))

(declare-fun b!663171 () Bool)

(declare-fun Unit!23060 () Unit!23058)

(assert (=> b!663171 (= e!380569 Unit!23060)))

(declare-fun lt!309213 () Unit!23058)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38947 (_ BitVec 64) (_ BitVec 32)) Unit!23058)

(assert (=> b!663171 (= lt!309213 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!663171 false))

(declare-fun b!663172 () Bool)

(declare-fun res!431110 () Bool)

(assert (=> b!663172 (=> (not res!431110) (not e!380567))))

(assert (=> b!663172 (= res!431110 (not (contains!3284 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!663173 () Bool)

(declare-fun res!431100 () Bool)

(assert (=> b!663173 (=> res!431100 e!380570)))

(assert (=> b!663173 (= res!431100 (contains!3284 lt!309211 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!663174 () Bool)

(declare-fun e!380571 () Bool)

(assert (=> b!663174 (= e!380571 (contains!3284 acc!681 k!2843))))

(declare-fun b!663175 () Bool)

(declare-fun res!431101 () Bool)

(assert (=> b!663175 (=> (not res!431101) (not e!380567))))

(assert (=> b!663175 (= res!431101 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12704))))

(declare-fun b!663176 () Bool)

(declare-fun res!431104 () Bool)

(assert (=> b!663176 (=> (not res!431104) (not e!380567))))

(assert (=> b!663176 (= res!431104 (not (contains!3284 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!663178 () Bool)

(declare-fun res!431108 () Bool)

(assert (=> b!663178 (=> (not res!431108) (not e!380567))))

(declare-fun e!380573 () Bool)

(assert (=> b!663178 (= res!431108 e!380573)))

(declare-fun res!431117 () Bool)

(assert (=> b!663178 (=> res!431117 e!380573)))

(assert (=> b!663178 (= res!431117 e!380571)))

(declare-fun res!431105 () Bool)

(assert (=> b!663178 (=> (not res!431105) (not e!380571))))

(assert (=> b!663178 (= res!431105 (bvsgt from!3004 i!1382))))

(declare-fun b!663179 () Bool)

(declare-fun e!380568 () Bool)

(assert (=> b!663179 (= e!380573 e!380568)))

(declare-fun res!431107 () Bool)

(assert (=> b!663179 (=> (not res!431107) (not e!380568))))

(assert (=> b!663179 (= res!431107 (bvsle from!3004 i!1382))))

(declare-fun b!663180 () Bool)

(declare-fun Unit!23061 () Unit!23058)

(assert (=> b!663180 (= e!380569 Unit!23061)))

(declare-fun b!663181 () Bool)

(declare-fun res!431106 () Bool)

(assert (=> b!663181 (=> res!431106 e!380570)))

(assert (=> b!663181 (= res!431106 (not (noDuplicate!531 lt!309211)))))

(declare-fun b!663182 () Bool)

(declare-fun res!431102 () Bool)

(assert (=> b!663182 (=> (not res!431102) (not e!380567))))

(assert (=> b!663182 (= res!431102 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19030 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!663183 () Bool)

(declare-fun res!431103 () Bool)

(assert (=> b!663183 (=> (not res!431103) (not e!380567))))

(assert (=> b!663183 (= res!431103 (validKeyInArray!0 k!2843))))

(declare-fun b!663177 () Bool)

(declare-fun res!431099 () Bool)

(assert (=> b!663177 (=> res!431099 e!380570)))

(assert (=> b!663177 (= res!431099 (not (subseq!23 acc!681 lt!309211)))))

(declare-fun res!431111 () Bool)

(assert (=> start!59900 (=> (not res!431111) (not e!380567))))

(assert (=> start!59900 (= res!431111 (and (bvslt (size!19030 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19030 a!3626))))))

(assert (=> start!59900 e!380567))

(assert (=> start!59900 true))

(declare-fun array_inv!14462 (array!38947) Bool)

(assert (=> start!59900 (array_inv!14462 a!3626)))

(declare-fun b!663184 () Bool)

(declare-fun res!431112 () Bool)

(assert (=> b!663184 (=> (not res!431112) (not e!380567))))

(assert (=> b!663184 (= res!431112 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!663185 () Bool)

(assert (=> b!663185 (= e!380568 (not (contains!3284 acc!681 k!2843)))))

(assert (= (and start!59900 res!431111) b!663170))

(assert (= (and b!663170 res!431116) b!663176))

(assert (= (and b!663176 res!431104) b!663172))

(assert (= (and b!663172 res!431110) b!663178))

(assert (= (and b!663178 res!431105) b!663174))

(assert (= (and b!663178 (not res!431117)) b!663179))

(assert (= (and b!663179 res!431107) b!663185))

(assert (= (and b!663178 res!431108) b!663175))

(assert (= (and b!663175 res!431101) b!663165))

(assert (= (and b!663165 res!431113) b!663168))

(assert (= (and b!663168 res!431098) b!663183))

(assert (= (and b!663183 res!431103) b!663184))

(assert (= (and b!663184 res!431112) b!663182))

(assert (= (and b!663182 res!431102) b!663166))

(assert (= (and b!663166 c!76400) b!663171))

(assert (= (and b!663166 (not c!76400)) b!663180))

(assert (= (and b!663166 (not res!431114)) b!663167))

(assert (= (and b!663167 (not res!431115)) b!663181))

(assert (= (and b!663181 (not res!431106)) b!663164))

(assert (= (and b!663164 (not res!431109)) b!663173))

(assert (= (and b!663173 (not res!431100)) b!663177))

(assert (= (and b!663177 (not res!431099)) b!663169))

(declare-fun m!634805 () Bool)

(assert (=> b!663175 m!634805))

(declare-fun m!634807 () Bool)

(assert (=> b!663176 m!634807))

(declare-fun m!634809 () Bool)

(assert (=> b!663165 m!634809))

(declare-fun m!634811 () Bool)

(assert (=> b!663181 m!634811))

(declare-fun m!634813 () Bool)

(assert (=> b!663173 m!634813))

(declare-fun m!634815 () Bool)

(assert (=> start!59900 m!634815))

(declare-fun m!634817 () Bool)

(assert (=> b!663166 m!634817))

(declare-fun m!634819 () Bool)

(assert (=> b!663166 m!634819))

(declare-fun m!634821 () Bool)

(assert (=> b!663166 m!634821))

(assert (=> b!663166 m!634817))

(declare-fun m!634823 () Bool)

(assert (=> b!663166 m!634823))

(declare-fun m!634825 () Bool)

(assert (=> b!663166 m!634825))

(declare-fun m!634827 () Bool)

(assert (=> b!663171 m!634827))

(declare-fun m!634829 () Bool)

(assert (=> b!663169 m!634829))

(declare-fun m!634831 () Bool)

(assert (=> b!663169 m!634831))

(declare-fun m!634833 () Bool)

(assert (=> b!663170 m!634833))

(assert (=> b!663167 m!634817))

(assert (=> b!663167 m!634817))

(declare-fun m!634835 () Bool)

(assert (=> b!663167 m!634835))

(declare-fun m!634837 () Bool)

(assert (=> b!663167 m!634837))

(declare-fun m!634839 () Bool)

(assert (=> b!663167 m!634839))

(declare-fun m!634841 () Bool)

(assert (=> b!663177 m!634841))

(declare-fun m!634843 () Bool)

(assert (=> b!663183 m!634843))

(declare-fun m!634845 () Bool)

(assert (=> b!663185 m!634845))

(declare-fun m!634847 () Bool)

(assert (=> b!663184 m!634847))

(declare-fun m!634849 () Bool)

(assert (=> b!663164 m!634849))

(assert (=> b!663174 m!634845))

(declare-fun m!634851 () Bool)

(assert (=> b!663172 m!634851))

(push 1)

