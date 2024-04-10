; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60492 () Bool)

(assert start!60492)

(declare-fun b!679831 () Bool)

(declare-fun res!446158 () Bool)

(declare-fun e!387285 () Bool)

(assert (=> b!679831 (=> (not res!446158) (not e!387285))))

(declare-datatypes ((array!39473 0))(
  ( (array!39474 (arr!18926 (Array (_ BitVec 32) (_ BitVec 64))) (size!19290 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39473)

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((List!12967 0))(
  ( (Nil!12964) (Cons!12963 (h!14008 (_ BitVec 64)) (t!19195 List!12967)) )
))
(declare-fun acc!681 () List!12967)

(declare-fun arrayNoDuplicates!0 (array!39473 (_ BitVec 32) List!12967) Bool)

(assert (=> b!679831 (= res!446158 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!679832 () Bool)

(declare-fun res!446170 () Bool)

(assert (=> b!679832 (=> (not res!446170) (not e!387285))))

(declare-fun noDuplicate!791 (List!12967) Bool)

(assert (=> b!679832 (= res!446170 (noDuplicate!791 acc!681))))

(declare-fun b!679833 () Bool)

(declare-fun res!446163 () Bool)

(assert (=> b!679833 (=> (not res!446163) (not e!387285))))

(declare-fun e!387287 () Bool)

(assert (=> b!679833 (= res!446163 e!387287)))

(declare-fun res!446160 () Bool)

(assert (=> b!679833 (=> res!446160 e!387287)))

(declare-fun e!387286 () Bool)

(assert (=> b!679833 (= res!446160 e!387286)))

(declare-fun res!446166 () Bool)

(assert (=> b!679833 (=> (not res!446166) (not e!387286))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!679833 (= res!446166 (bvsgt from!3004 i!1382))))

(declare-fun b!679834 () Bool)

(declare-fun e!387291 () Bool)

(assert (=> b!679834 (= e!387287 e!387291)))

(declare-fun res!446161 () Bool)

(assert (=> b!679834 (=> (not res!446161) (not e!387291))))

(assert (=> b!679834 (= res!446161 (bvsle from!3004 i!1382))))

(declare-fun b!679835 () Bool)

(declare-datatypes ((Unit!23822 0))(
  ( (Unit!23823) )
))
(declare-fun e!387288 () Unit!23822)

(declare-fun Unit!23824 () Unit!23822)

(assert (=> b!679835 (= e!387288 Unit!23824)))

(declare-fun b!679836 () Bool)

(declare-fun res!446167 () Bool)

(assert (=> b!679836 (=> (not res!446167) (not e!387285))))

(assert (=> b!679836 (= res!446167 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19290 a!3626))))))

(declare-fun b!679837 () Bool)

(declare-fun res!446162 () Bool)

(assert (=> b!679837 (=> (not res!446162) (not e!387285))))

(declare-fun contains!3544 (List!12967 (_ BitVec 64)) Bool)

(assert (=> b!679837 (= res!446162 (not (contains!3544 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!446159 () Bool)

(assert (=> start!60492 (=> (not res!446159) (not e!387285))))

(assert (=> start!60492 (= res!446159 (and (bvslt (size!19290 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19290 a!3626))))))

(assert (=> start!60492 e!387285))

(assert (=> start!60492 true))

(declare-fun array_inv!14722 (array!39473) Bool)

(assert (=> start!60492 (array_inv!14722 a!3626)))

(declare-fun b!679838 () Bool)

(declare-fun res!446169 () Bool)

(assert (=> b!679838 (=> (not res!446169) (not e!387285))))

(assert (=> b!679838 (= res!446169 (not (contains!3544 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!679839 () Bool)

(declare-fun Unit!23825 () Unit!23822)

(assert (=> b!679839 (= e!387288 Unit!23825)))

(declare-fun lt!312977 () Unit!23822)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39473 (_ BitVec 64) (_ BitVec 32)) Unit!23822)

(assert (=> b!679839 (= lt!312977 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!679839 false))

(declare-fun b!679840 () Bool)

(assert (=> b!679840 (= e!387286 (contains!3544 acc!681 k!2843))))

(declare-fun b!679841 () Bool)

(declare-fun res!446157 () Bool)

(assert (=> b!679841 (=> (not res!446157) (not e!387285))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!679841 (= res!446157 (validKeyInArray!0 k!2843))))

(declare-fun b!679842 () Bool)

(declare-fun res!446165 () Bool)

(assert (=> b!679842 (=> (not res!446165) (not e!387285))))

(declare-fun arrayContainsKey!0 (array!39473 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!679842 (= res!446165 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!679843 () Bool)

(declare-fun e!387290 () Bool)

(assert (=> b!679843 (= e!387290 true)))

(declare-fun subseq!130 (List!12967 List!12967) Bool)

(assert (=> b!679843 (subseq!130 acc!681 acc!681)))

(declare-fun lt!312979 () Unit!23822)

(declare-fun lemmaListSubSeqRefl!0 (List!12967) Unit!23822)

(assert (=> b!679843 (= lt!312979 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!679844 () Bool)

(declare-fun res!446171 () Bool)

(assert (=> b!679844 (=> (not res!446171) (not e!387285))))

(assert (=> b!679844 (= res!446171 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12964))))

(declare-fun b!679845 () Bool)

(declare-fun res!446164 () Bool)

(assert (=> b!679845 (=> (not res!446164) (not e!387285))))

(assert (=> b!679845 (= res!446164 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19290 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!679846 () Bool)

(assert (=> b!679846 (= e!387291 (not (contains!3544 acc!681 k!2843)))))

(declare-fun b!679847 () Bool)

(assert (=> b!679847 (= e!387285 (not e!387290))))

(declare-fun res!446168 () Bool)

(assert (=> b!679847 (=> res!446168 e!387290)))

(assert (=> b!679847 (= res!446168 (not (validKeyInArray!0 (select (arr!18926 a!3626) from!3004))))))

(declare-fun lt!312978 () Unit!23822)

(assert (=> b!679847 (= lt!312978 e!387288)))

(declare-fun c!77204 () Bool)

(assert (=> b!679847 (= c!77204 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!679847 (arrayContainsKey!0 (array!39474 (store (arr!18926 a!3626) i!1382 k!2843) (size!19290 a!3626)) k!2843 from!3004)))

(assert (= (and start!60492 res!446159) b!679832))

(assert (= (and b!679832 res!446170) b!679837))

(assert (= (and b!679837 res!446162) b!679838))

(assert (= (and b!679838 res!446169) b!679833))

(assert (= (and b!679833 res!446166) b!679840))

(assert (= (and b!679833 (not res!446160)) b!679834))

(assert (= (and b!679834 res!446161) b!679846))

(assert (= (and b!679833 res!446163) b!679844))

(assert (= (and b!679844 res!446171) b!679831))

(assert (= (and b!679831 res!446158) b!679836))

(assert (= (and b!679836 res!446167) b!679841))

(assert (= (and b!679841 res!446157) b!679842))

(assert (= (and b!679842 res!446165) b!679845))

(assert (= (and b!679845 res!446164) b!679847))

(assert (= (and b!679847 c!77204) b!679839))

(assert (= (and b!679847 (not c!77204)) b!679835))

(assert (= (and b!679847 (not res!446168)) b!679843))

(declare-fun m!645085 () Bool)

(assert (=> b!679838 m!645085))

(declare-fun m!645087 () Bool)

(assert (=> b!679843 m!645087))

(declare-fun m!645089 () Bool)

(assert (=> b!679843 m!645089))

(declare-fun m!645091 () Bool)

(assert (=> b!679847 m!645091))

(declare-fun m!645093 () Bool)

(assert (=> b!679847 m!645093))

(declare-fun m!645095 () Bool)

(assert (=> b!679847 m!645095))

(assert (=> b!679847 m!645091))

(declare-fun m!645097 () Bool)

(assert (=> b!679847 m!645097))

(declare-fun m!645099 () Bool)

(assert (=> b!679847 m!645099))

(declare-fun m!645101 () Bool)

(assert (=> b!679831 m!645101))

(declare-fun m!645103 () Bool)

(assert (=> b!679840 m!645103))

(declare-fun m!645105 () Bool)

(assert (=> b!679841 m!645105))

(declare-fun m!645107 () Bool)

(assert (=> b!679844 m!645107))

(declare-fun m!645109 () Bool)

(assert (=> start!60492 m!645109))

(assert (=> b!679846 m!645103))

(declare-fun m!645111 () Bool)

(assert (=> b!679832 m!645111))

(declare-fun m!645113 () Bool)

(assert (=> b!679842 m!645113))

(declare-fun m!645115 () Bool)

(assert (=> b!679839 m!645115))

(declare-fun m!645117 () Bool)

(assert (=> b!679837 m!645117))

(push 1)

(assert (not b!679840))

(assert (not start!60492))

(assert (not b!679839))

(assert (not b!679841))

(assert (not b!679844))

(assert (not b!679843))

(assert (not b!679847))

(assert (not b!679837))

(assert (not b!679838))

(assert (not b!679842))

(assert (not b!679846))

(assert (not b!679832))

(assert (not b!679831))

