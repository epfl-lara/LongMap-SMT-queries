; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60354 () Bool)

(assert start!60354)

(declare-fun b!678141 () Bool)

(declare-fun res!444571 () Bool)

(declare-fun e!386490 () Bool)

(assert (=> b!678141 (=> (not res!444571) (not e!386490))))

(declare-datatypes ((List!12934 0))(
  ( (Nil!12931) (Cons!12930 (h!13975 (_ BitVec 64)) (t!19162 List!12934)) )
))
(declare-fun acc!681 () List!12934)

(declare-fun noDuplicate!758 (List!12934) Bool)

(assert (=> b!678141 (= res!444571 (noDuplicate!758 acc!681))))

(declare-fun b!678142 () Bool)

(declare-fun res!444574 () Bool)

(assert (=> b!678142 (=> (not res!444574) (not e!386490))))

(declare-fun contains!3511 (List!12934 (_ BitVec 64)) Bool)

(assert (=> b!678142 (= res!444574 (not (contains!3511 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!678143 () Bool)

(assert (=> b!678143 (= e!386490 false)))

(declare-datatypes ((array!39401 0))(
  ( (array!39402 (arr!18893 (Array (_ BitVec 32) (_ BitVec 64))) (size!19257 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39401)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun lt!312868 () Bool)

(declare-fun arrayNoDuplicates!0 (array!39401 (_ BitVec 32) List!12934) Bool)

(assert (=> b!678143 (= lt!312868 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!678144 () Bool)

(declare-fun res!444568 () Bool)

(assert (=> b!678144 (=> (not res!444568) (not e!386490))))

(assert (=> b!678144 (= res!444568 (not (contains!3511 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!678145 () Bool)

(declare-fun e!386488 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!678145 (= e!386488 (not (contains!3511 acc!681 k!2843)))))

(declare-fun res!444573 () Bool)

(assert (=> start!60354 (=> (not res!444573) (not e!386490))))

(assert (=> start!60354 (= res!444573 (and (bvslt (size!19257 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19257 a!3626))))))

(assert (=> start!60354 e!386490))

(assert (=> start!60354 true))

(declare-fun array_inv!14689 (array!39401) Bool)

(assert (=> start!60354 (array_inv!14689 a!3626)))

(declare-fun b!678146 () Bool)

(declare-fun res!444567 () Bool)

(assert (=> b!678146 (=> (not res!444567) (not e!386490))))

(assert (=> b!678146 (= res!444567 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12931))))

(declare-fun b!678147 () Bool)

(declare-fun e!386489 () Bool)

(assert (=> b!678147 (= e!386489 (contains!3511 acc!681 k!2843))))

(declare-fun b!678148 () Bool)

(declare-fun res!444569 () Bool)

(assert (=> b!678148 (=> (not res!444569) (not e!386490))))

(declare-fun e!386486 () Bool)

(assert (=> b!678148 (= res!444569 e!386486)))

(declare-fun res!444572 () Bool)

(assert (=> b!678148 (=> res!444572 e!386486)))

(assert (=> b!678148 (= res!444572 e!386489)))

(declare-fun res!444575 () Bool)

(assert (=> b!678148 (=> (not res!444575) (not e!386489))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!678148 (= res!444575 (bvsgt from!3004 i!1382))))

(declare-fun b!678149 () Bool)

(assert (=> b!678149 (= e!386486 e!386488)))

(declare-fun res!444570 () Bool)

(assert (=> b!678149 (=> (not res!444570) (not e!386488))))

(assert (=> b!678149 (= res!444570 (bvsle from!3004 i!1382))))

(assert (= (and start!60354 res!444573) b!678141))

(assert (= (and b!678141 res!444571) b!678144))

(assert (= (and b!678144 res!444568) b!678142))

(assert (= (and b!678142 res!444574) b!678148))

(assert (= (and b!678148 res!444575) b!678147))

(assert (= (and b!678148 (not res!444572)) b!678149))

(assert (= (and b!678149 res!444570) b!678145))

(assert (= (and b!678148 res!444569) b!678146))

(assert (= (and b!678146 res!444567) b!678143))

(declare-fun m!644073 () Bool)

(assert (=> b!678147 m!644073))

(declare-fun m!644075 () Bool)

(assert (=> b!678142 m!644075))

(declare-fun m!644077 () Bool)

(assert (=> start!60354 m!644077))

(declare-fun m!644079 () Bool)

(assert (=> b!678143 m!644079))

(declare-fun m!644081 () Bool)

(assert (=> b!678146 m!644081))

(declare-fun m!644083 () Bool)

(assert (=> b!678144 m!644083))

(assert (=> b!678145 m!644073))

(declare-fun m!644085 () Bool)

(assert (=> b!678141 m!644085))

(push 1)

(assert (not b!678141))

(assert (not b!678145))

(assert (not start!60354))

(assert (not b!678146))

(assert (not b!678144))

(assert (not b!678143))

(assert (not b!678142))

(assert (not b!678147))

(check-sat)

