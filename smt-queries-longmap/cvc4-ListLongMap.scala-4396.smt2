; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60466 () Bool)

(assert start!60466)

(declare-fun b!679195 () Bool)

(declare-fun e!386964 () Bool)

(declare-fun e!386962 () Bool)

(assert (=> b!679195 (= e!386964 e!386962)))

(declare-fun res!445725 () Bool)

(assert (=> b!679195 (=> (not res!445725) (not e!386962))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!679195 (= res!445725 (bvsle from!3004 i!1382))))

(declare-fun b!679196 () Bool)

(declare-fun res!445727 () Bool)

(declare-fun e!386966 () Bool)

(assert (=> b!679196 (=> (not res!445727) (not e!386966))))

(assert (=> b!679196 (= res!445727 e!386964)))

(declare-fun res!445717 () Bool)

(assert (=> b!679196 (=> res!445717 e!386964)))

(declare-fun e!386963 () Bool)

(assert (=> b!679196 (= res!445717 e!386963)))

(declare-fun res!445724 () Bool)

(assert (=> b!679196 (=> (not res!445724) (not e!386963))))

(assert (=> b!679196 (= res!445724 (bvsgt from!3004 i!1382))))

(declare-fun b!679197 () Bool)

(declare-datatypes ((List!12998 0))(
  ( (Nil!12995) (Cons!12994 (h!14039 (_ BitVec 64)) (t!19217 List!12998)) )
))
(declare-fun acc!681 () List!12998)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3520 (List!12998 (_ BitVec 64)) Bool)

(assert (=> b!679197 (= e!386962 (not (contains!3520 acc!681 k!2843)))))

(declare-fun b!679198 () Bool)

(declare-fun res!445715 () Bool)

(assert (=> b!679198 (=> (not res!445715) (not e!386966))))

(declare-datatypes ((array!39458 0))(
  ( (array!39459 (arr!18918 (Array (_ BitVec 32) (_ BitVec 64))) (size!19283 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39458)

(assert (=> b!679198 (= res!445715 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19283 a!3626))))))

(declare-fun b!679199 () Bool)

(declare-fun res!445729 () Bool)

(assert (=> b!679199 (=> (not res!445729) (not e!386966))))

(assert (=> b!679199 (= res!445729 (not (contains!3520 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!679200 () Bool)

(declare-fun res!445728 () Bool)

(assert (=> b!679200 (=> (not res!445728) (not e!386966))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!679200 (= res!445728 (validKeyInArray!0 k!2843))))

(declare-fun b!679201 () Bool)

(declare-fun res!445722 () Bool)

(assert (=> b!679201 (=> (not res!445722) (not e!386966))))

(declare-fun noDuplicate!789 (List!12998) Bool)

(assert (=> b!679201 (= res!445722 (noDuplicate!789 acc!681))))

(declare-fun b!679202 () Bool)

(declare-fun e!386965 () Bool)

(assert (=> b!679202 (= e!386966 (not e!386965))))

(declare-fun res!445721 () Bool)

(assert (=> b!679202 (=> res!445721 e!386965)))

(declare-fun arrayContainsKey!0 (array!39458 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!679202 (= res!445721 (not (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004))))))

(assert (=> b!679202 (arrayContainsKey!0 (array!39459 (store (arr!18918 a!3626) i!1382 k!2843) (size!19283 a!3626)) k!2843 from!3004)))

(declare-fun b!679203 () Bool)

(declare-fun res!445719 () Bool)

(assert (=> b!679203 (=> (not res!445719) (not e!386966))))

(assert (=> b!679203 (= res!445719 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!679204 () Bool)

(declare-fun res!445718 () Bool)

(assert (=> b!679204 (=> (not res!445718) (not e!386966))))

(assert (=> b!679204 (= res!445718 (not (contains!3520 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!679205 () Bool)

(declare-fun res!445723 () Bool)

(assert (=> b!679205 (=> (not res!445723) (not e!386966))))

(assert (=> b!679205 (= res!445723 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19283 a!3626)) (= from!3004 i!1382)))))

(declare-fun res!445716 () Bool)

(assert (=> start!60466 (=> (not res!445716) (not e!386966))))

(assert (=> start!60466 (= res!445716 (and (bvslt (size!19283 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19283 a!3626))))))

(assert (=> start!60466 e!386966))

(assert (=> start!60466 true))

(declare-fun array_inv!14801 (array!39458) Bool)

(assert (=> start!60466 (array_inv!14801 a!3626)))

(declare-fun b!679206 () Bool)

(assert (=> b!679206 (= e!386965 true)))

(assert (=> b!679206 false))

(declare-datatypes ((Unit!23776 0))(
  ( (Unit!23777) )
))
(declare-fun lt!312675 () Unit!23776)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39458 (_ BitVec 64) (_ BitVec 32)) Unit!23776)

(assert (=> b!679206 (= lt!312675 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(declare-fun b!679207 () Bool)

(declare-fun res!445720 () Bool)

(assert (=> b!679207 (=> (not res!445720) (not e!386966))))

(declare-fun arrayNoDuplicates!0 (array!39458 (_ BitVec 32) List!12998) Bool)

(assert (=> b!679207 (= res!445720 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!679208 () Bool)

(declare-fun res!445726 () Bool)

(assert (=> b!679208 (=> (not res!445726) (not e!386966))))

(assert (=> b!679208 (= res!445726 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12995))))

(declare-fun b!679209 () Bool)

(assert (=> b!679209 (= e!386963 (contains!3520 acc!681 k!2843))))

(assert (= (and start!60466 res!445716) b!679201))

(assert (= (and b!679201 res!445722) b!679199))

(assert (= (and b!679199 res!445729) b!679204))

(assert (= (and b!679204 res!445718) b!679196))

(assert (= (and b!679196 res!445724) b!679209))

(assert (= (and b!679196 (not res!445717)) b!679195))

(assert (= (and b!679195 res!445725) b!679197))

(assert (= (and b!679196 res!445727) b!679208))

(assert (= (and b!679208 res!445726) b!679207))

(assert (= (and b!679207 res!445720) b!679198))

(assert (= (and b!679198 res!445715) b!679200))

(assert (= (and b!679200 res!445728) b!679203))

(assert (= (and b!679203 res!445719) b!679205))

(assert (= (and b!679205 res!445723) b!679202))

(assert (= (and b!679202 (not res!445721)) b!679206))

(declare-fun m!644105 () Bool)

(assert (=> b!679203 m!644105))

(declare-fun m!644107 () Bool)

(assert (=> b!679204 m!644107))

(declare-fun m!644109 () Bool)

(assert (=> b!679201 m!644109))

(declare-fun m!644111 () Bool)

(assert (=> b!679199 m!644111))

(declare-fun m!644113 () Bool)

(assert (=> b!679209 m!644113))

(declare-fun m!644115 () Bool)

(assert (=> start!60466 m!644115))

(declare-fun m!644117 () Bool)

(assert (=> b!679208 m!644117))

(declare-fun m!644119 () Bool)

(assert (=> b!679207 m!644119))

(declare-fun m!644121 () Bool)

(assert (=> b!679200 m!644121))

(assert (=> b!679197 m!644113))

(declare-fun m!644123 () Bool)

(assert (=> b!679202 m!644123))

(declare-fun m!644125 () Bool)

(assert (=> b!679202 m!644125))

(declare-fun m!644127 () Bool)

(assert (=> b!679202 m!644127))

(declare-fun m!644129 () Bool)

(assert (=> b!679206 m!644129))

(push 1)

(assert (not b!679199))

(assert (not b!679202))

(assert (not start!60466))

(assert (not b!679201))

(assert (not b!679200))

(assert (not b!679203))

(assert (not b!679204))

(assert (not b!679207))

(assert (not b!679208))

(assert (not b!679209))

(assert (not b!679206))

(assert (not b!679197))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

