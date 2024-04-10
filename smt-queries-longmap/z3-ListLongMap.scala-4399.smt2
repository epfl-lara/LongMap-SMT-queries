; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60496 () Bool)

(assert start!60496)

(declare-fun b!679933 () Bool)

(declare-fun res!446257 () Bool)

(declare-fun e!387333 () Bool)

(assert (=> b!679933 (=> (not res!446257) (not e!387333))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((array!39477 0))(
  ( (array!39478 (arr!18928 (Array (_ BitVec 32) (_ BitVec 64))) (size!19292 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39477)

(assert (=> b!679933 (= res!446257 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19292 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!679934 () Bool)

(declare-fun res!446254 () Bool)

(assert (=> b!679934 (=> (not res!446254) (not e!387333))))

(declare-datatypes ((List!12969 0))(
  ( (Nil!12966) (Cons!12965 (h!14010 (_ BitVec 64)) (t!19197 List!12969)) )
))
(declare-fun acc!681 () List!12969)

(declare-fun contains!3546 (List!12969 (_ BitVec 64)) Bool)

(assert (=> b!679934 (= res!446254 (not (contains!3546 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!679935 () Bool)

(declare-fun res!446248 () Bool)

(assert (=> b!679935 (=> (not res!446248) (not e!387333))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!679935 (= res!446248 (validKeyInArray!0 k0!2843))))

(declare-fun b!679936 () Bool)

(declare-fun e!387327 () Bool)

(assert (=> b!679936 (= e!387327 (contains!3546 acc!681 k0!2843))))

(declare-fun res!446251 () Bool)

(assert (=> start!60496 (=> (not res!446251) (not e!387333))))

(assert (=> start!60496 (= res!446251 (and (bvslt (size!19292 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19292 a!3626))))))

(assert (=> start!60496 e!387333))

(assert (=> start!60496 true))

(declare-fun array_inv!14724 (array!39477) Bool)

(assert (=> start!60496 (array_inv!14724 a!3626)))

(declare-fun b!679937 () Bool)

(declare-fun res!446249 () Bool)

(assert (=> b!679937 (=> (not res!446249) (not e!387333))))

(declare-fun arrayNoDuplicates!0 (array!39477 (_ BitVec 32) List!12969) Bool)

(assert (=> b!679937 (= res!446249 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12966))))

(declare-fun b!679938 () Bool)

(declare-fun res!446259 () Bool)

(assert (=> b!679938 (=> (not res!446259) (not e!387333))))

(declare-fun e!387328 () Bool)

(assert (=> b!679938 (= res!446259 e!387328)))

(declare-fun res!446258 () Bool)

(assert (=> b!679938 (=> res!446258 e!387328)))

(assert (=> b!679938 (= res!446258 e!387327)))

(declare-fun res!446255 () Bool)

(assert (=> b!679938 (=> (not res!446255) (not e!387327))))

(assert (=> b!679938 (= res!446255 (bvsgt from!3004 i!1382))))

(declare-fun b!679939 () Bool)

(declare-fun res!446261 () Bool)

(assert (=> b!679939 (=> (not res!446261) (not e!387333))))

(declare-fun noDuplicate!793 (List!12969) Bool)

(assert (=> b!679939 (= res!446261 (noDuplicate!793 acc!681))))

(declare-fun b!679940 () Bool)

(declare-fun res!446253 () Bool)

(assert (=> b!679940 (=> (not res!446253) (not e!387333))))

(assert (=> b!679940 (= res!446253 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19292 a!3626))))))

(declare-fun b!679941 () Bool)

(declare-fun e!387331 () Bool)

(assert (=> b!679941 (= e!387333 (not e!387331))))

(declare-fun res!446247 () Bool)

(assert (=> b!679941 (=> res!446247 e!387331)))

(assert (=> b!679941 (= res!446247 (not (validKeyInArray!0 (select (arr!18928 a!3626) from!3004))))))

(declare-datatypes ((Unit!23830 0))(
  ( (Unit!23831) )
))
(declare-fun lt!312995 () Unit!23830)

(declare-fun e!387332 () Unit!23830)

(assert (=> b!679941 (= lt!312995 e!387332)))

(declare-fun c!77210 () Bool)

(declare-fun arrayContainsKey!0 (array!39477 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!679941 (= c!77210 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!679941 (arrayContainsKey!0 (array!39478 (store (arr!18928 a!3626) i!1382 k0!2843) (size!19292 a!3626)) k0!2843 from!3004)))

(declare-fun b!679942 () Bool)

(declare-fun res!446260 () Bool)

(assert (=> b!679942 (=> (not res!446260) (not e!387333))))

(assert (=> b!679942 (= res!446260 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!679943 () Bool)

(declare-fun Unit!23832 () Unit!23830)

(assert (=> b!679943 (= e!387332 Unit!23832)))

(declare-fun lt!312996 () Unit!23830)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39477 (_ BitVec 64) (_ BitVec 32)) Unit!23830)

(assert (=> b!679943 (= lt!312996 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!679943 false))

(declare-fun b!679944 () Bool)

(declare-fun e!387329 () Bool)

(assert (=> b!679944 (= e!387328 e!387329)))

(declare-fun res!446252 () Bool)

(assert (=> b!679944 (=> (not res!446252) (not e!387329))))

(assert (=> b!679944 (= res!446252 (bvsle from!3004 i!1382))))

(declare-fun b!679945 () Bool)

(assert (=> b!679945 (= e!387329 (not (contains!3546 acc!681 k0!2843)))))

(declare-fun b!679946 () Bool)

(declare-fun res!446250 () Bool)

(assert (=> b!679946 (=> (not res!446250) (not e!387333))))

(assert (=> b!679946 (= res!446250 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!679947 () Bool)

(declare-fun Unit!23833 () Unit!23830)

(assert (=> b!679947 (= e!387332 Unit!23833)))

(declare-fun b!679948 () Bool)

(assert (=> b!679948 (= e!387331 true)))

(declare-fun subseq!132 (List!12969 List!12969) Bool)

(assert (=> b!679948 (subseq!132 acc!681 acc!681)))

(declare-fun lt!312997 () Unit!23830)

(declare-fun lemmaListSubSeqRefl!0 (List!12969) Unit!23830)

(assert (=> b!679948 (= lt!312997 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!679949 () Bool)

(declare-fun res!446256 () Bool)

(assert (=> b!679949 (=> (not res!446256) (not e!387333))))

(assert (=> b!679949 (= res!446256 (not (contains!3546 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!60496 res!446251) b!679939))

(assert (= (and b!679939 res!446261) b!679949))

(assert (= (and b!679949 res!446256) b!679934))

(assert (= (and b!679934 res!446254) b!679938))

(assert (= (and b!679938 res!446255) b!679936))

(assert (= (and b!679938 (not res!446258)) b!679944))

(assert (= (and b!679944 res!446252) b!679945))

(assert (= (and b!679938 res!446259) b!679937))

(assert (= (and b!679937 res!446249) b!679942))

(assert (= (and b!679942 res!446260) b!679940))

(assert (= (and b!679940 res!446253) b!679935))

(assert (= (and b!679935 res!446248) b!679946))

(assert (= (and b!679946 res!446250) b!679933))

(assert (= (and b!679933 res!446257) b!679941))

(assert (= (and b!679941 c!77210) b!679943))

(assert (= (and b!679941 (not c!77210)) b!679947))

(assert (= (and b!679941 (not res!446247)) b!679948))

(declare-fun m!645153 () Bool)

(assert (=> b!679936 m!645153))

(declare-fun m!645155 () Bool)

(assert (=> b!679937 m!645155))

(declare-fun m!645157 () Bool)

(assert (=> b!679935 m!645157))

(declare-fun m!645159 () Bool)

(assert (=> b!679943 m!645159))

(declare-fun m!645161 () Bool)

(assert (=> b!679949 m!645161))

(declare-fun m!645163 () Bool)

(assert (=> b!679946 m!645163))

(declare-fun m!645165 () Bool)

(assert (=> b!679939 m!645165))

(declare-fun m!645167 () Bool)

(assert (=> start!60496 m!645167))

(declare-fun m!645169 () Bool)

(assert (=> b!679948 m!645169))

(declare-fun m!645171 () Bool)

(assert (=> b!679948 m!645171))

(declare-fun m!645173 () Bool)

(assert (=> b!679941 m!645173))

(declare-fun m!645175 () Bool)

(assert (=> b!679941 m!645175))

(declare-fun m!645177 () Bool)

(assert (=> b!679941 m!645177))

(assert (=> b!679941 m!645173))

(declare-fun m!645179 () Bool)

(assert (=> b!679941 m!645179))

(declare-fun m!645181 () Bool)

(assert (=> b!679941 m!645181))

(assert (=> b!679945 m!645153))

(declare-fun m!645183 () Bool)

(assert (=> b!679942 m!645183))

(declare-fun m!645185 () Bool)

(assert (=> b!679934 m!645185))

(check-sat (not b!679948) (not b!679943) (not b!679937) (not b!679946) (not b!679934) (not b!679942) (not b!679945) (not b!679936) (not b!679939) (not start!60496) (not b!679935) (not b!679941) (not b!679949))
(check-sat)
