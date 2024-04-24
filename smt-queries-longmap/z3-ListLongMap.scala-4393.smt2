; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60480 () Bool)

(assert start!60480)

(declare-fun b!679137 () Bool)

(declare-fun res!445422 () Bool)

(declare-fun e!387000 () Bool)

(assert (=> b!679137 (=> (not res!445422) (not e!387000))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39432 0))(
  ( (array!39433 (arr!18904 (Array (_ BitVec 32) (_ BitVec 64))) (size!19268 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39432)

(assert (=> b!679137 (= res!445422 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19268 a!3626))))))

(declare-fun b!679138 () Bool)

(declare-fun res!445411 () Bool)

(assert (=> b!679138 (=> (not res!445411) (not e!387000))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((List!12852 0))(
  ( (Nil!12849) (Cons!12848 (h!13896 (_ BitVec 64)) (t!19072 List!12852)) )
))
(declare-fun acc!681 () List!12852)

(declare-fun arrayNoDuplicates!0 (array!39432 (_ BitVec 32) List!12852) Bool)

(assert (=> b!679138 (= res!445411 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!679139 () Bool)

(declare-fun res!445418 () Bool)

(assert (=> b!679139 (=> (not res!445418) (not e!387000))))

(assert (=> b!679139 (= res!445418 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12849))))

(declare-fun b!679140 () Bool)

(declare-fun res!445414 () Bool)

(assert (=> b!679140 (=> (not res!445414) (not e!387000))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!679140 (= res!445414 (validKeyInArray!0 k0!2843))))

(declare-fun b!679141 () Bool)

(declare-fun res!445415 () Bool)

(assert (=> b!679141 (=> (not res!445415) (not e!387000))))

(declare-fun contains!3504 (List!12852 (_ BitVec 64)) Bool)

(assert (=> b!679141 (= res!445415 (not (contains!3504 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!679142 () Bool)

(declare-fun e!386997 () Bool)

(assert (=> b!679142 (= e!386997 (not (contains!3504 acc!681 k0!2843)))))

(declare-fun b!679144 () Bool)

(declare-fun e!386999 () Bool)

(assert (=> b!679144 (= e!386999 e!386997)))

(declare-fun res!445420 () Bool)

(assert (=> b!679144 (=> (not res!445420) (not e!386997))))

(assert (=> b!679144 (= res!445420 (bvsle from!3004 i!1382))))

(declare-fun b!679145 () Bool)

(declare-fun res!445416 () Bool)

(assert (=> b!679145 (=> (not res!445416) (not e!387000))))

(declare-fun arrayContainsKey!0 (array!39432 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!679145 (= res!445416 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!679146 () Bool)

(declare-fun res!445417 () Bool)

(assert (=> b!679146 (=> (not res!445417) (not e!387000))))

(assert (=> b!679146 (= res!445417 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19268 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!679147 () Bool)

(declare-fun res!445412 () Bool)

(assert (=> b!679147 (=> (not res!445412) (not e!387000))))

(assert (=> b!679147 (= res!445412 e!386999)))

(declare-fun res!445419 () Bool)

(assert (=> b!679147 (=> res!445419 e!386999)))

(declare-fun e!386998 () Bool)

(assert (=> b!679147 (= res!445419 e!386998)))

(declare-fun res!445413 () Bool)

(assert (=> b!679147 (=> (not res!445413) (not e!386998))))

(assert (=> b!679147 (= res!445413 (bvsgt from!3004 i!1382))))

(declare-fun b!679148 () Bool)

(declare-fun res!445423 () Bool)

(assert (=> b!679148 (=> (not res!445423) (not e!387000))))

(declare-fun noDuplicate!778 (List!12852) Bool)

(assert (=> b!679148 (= res!445423 (noDuplicate!778 acc!681))))

(declare-fun res!445410 () Bool)

(assert (=> start!60480 (=> (not res!445410) (not e!387000))))

(assert (=> start!60480 (= res!445410 (and (bvslt (size!19268 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19268 a!3626))))))

(assert (=> start!60480 e!387000))

(assert (=> start!60480 true))

(declare-fun array_inv!14763 (array!39432) Bool)

(assert (=> start!60480 (array_inv!14763 a!3626)))

(declare-fun b!679143 () Bool)

(assert (=> b!679143 (= e!386998 (contains!3504 acc!681 k0!2843))))

(declare-fun b!679149 () Bool)

(assert (=> b!679149 (= e!387000 (not true))))

(assert (=> b!679149 (arrayContainsKey!0 (array!39433 (store (arr!18904 a!3626) i!1382 k0!2843) (size!19268 a!3626)) k0!2843 from!3004)))

(declare-fun b!679150 () Bool)

(declare-fun res!445421 () Bool)

(assert (=> b!679150 (=> (not res!445421) (not e!387000))))

(assert (=> b!679150 (= res!445421 (not (contains!3504 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!60480 res!445410) b!679148))

(assert (= (and b!679148 res!445423) b!679150))

(assert (= (and b!679150 res!445421) b!679141))

(assert (= (and b!679141 res!445415) b!679147))

(assert (= (and b!679147 res!445413) b!679143))

(assert (= (and b!679147 (not res!445419)) b!679144))

(assert (= (and b!679144 res!445420) b!679142))

(assert (= (and b!679147 res!445412) b!679139))

(assert (= (and b!679139 res!445418) b!679138))

(assert (= (and b!679138 res!445411) b!679137))

(assert (= (and b!679137 res!445422) b!679140))

(assert (= (and b!679140 res!445414) b!679145))

(assert (= (and b!679145 res!445416) b!679146))

(assert (= (and b!679146 res!445417) b!679149))

(declare-fun m!645211 () Bool)

(assert (=> b!679145 m!645211))

(declare-fun m!645213 () Bool)

(assert (=> b!679148 m!645213))

(declare-fun m!645215 () Bool)

(assert (=> b!679139 m!645215))

(declare-fun m!645217 () Bool)

(assert (=> b!679140 m!645217))

(declare-fun m!645219 () Bool)

(assert (=> b!679138 m!645219))

(declare-fun m!645221 () Bool)

(assert (=> b!679143 m!645221))

(declare-fun m!645223 () Bool)

(assert (=> b!679141 m!645223))

(declare-fun m!645225 () Bool)

(assert (=> b!679149 m!645225))

(declare-fun m!645227 () Bool)

(assert (=> b!679149 m!645227))

(declare-fun m!645229 () Bool)

(assert (=> b!679150 m!645229))

(declare-fun m!645231 () Bool)

(assert (=> start!60480 m!645231))

(assert (=> b!679142 m!645221))

(check-sat (not b!679150) (not b!679140) (not b!679141) (not b!679138) (not b!679143) (not b!679142) (not start!60480) (not b!679149) (not b!679139) (not b!679145) (not b!679148))
(check-sat)
