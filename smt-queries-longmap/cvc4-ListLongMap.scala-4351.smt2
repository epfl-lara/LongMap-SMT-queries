; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60138 () Bool)

(assert start!60138)

(declare-fun b!671204 () Bool)

(declare-fun res!437908 () Bool)

(declare-fun e!383653 () Bool)

(assert (=> b!671204 (=> (not res!437908) (not e!383653))))

(declare-datatypes ((array!39185 0))(
  ( (array!39186 (arr!18785 (Array (_ BitVec 32) (_ BitVec 64))) (size!19149 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39185)

(declare-datatypes ((List!12826 0))(
  ( (Nil!12823) (Cons!12822 (h!13867 (_ BitVec 64)) (t!19054 List!12826)) )
))
(declare-fun arrayNoDuplicates!0 (array!39185 (_ BitVec 32) List!12826) Bool)

(assert (=> b!671204 (= res!437908 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12823))))

(declare-fun b!671205 () Bool)

(declare-fun res!437914 () Bool)

(assert (=> b!671205 (=> (not res!437914) (not e!383653))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!671205 (= res!437914 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19149 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!671206 () Bool)

(declare-fun e!383654 () Bool)

(declare-fun acc!681 () List!12826)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3403 (List!12826 (_ BitVec 64)) Bool)

(assert (=> b!671206 (= e!383654 (contains!3403 acc!681 k!2843))))

(declare-fun b!671207 () Bool)

(declare-fun res!437912 () Bool)

(assert (=> b!671207 (=> (not res!437912) (not e!383653))))

(declare-fun arrayContainsKey!0 (array!39185 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!671207 (= res!437912 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!671208 () Bool)

(declare-fun e!383655 () Bool)

(assert (=> b!671208 (= e!383655 (not (contains!3403 acc!681 k!2843)))))

(declare-fun b!671209 () Bool)

(declare-fun res!437906 () Bool)

(assert (=> b!671209 (=> (not res!437906) (not e!383653))))

(declare-fun e!383651 () Bool)

(assert (=> b!671209 (= res!437906 e!383651)))

(declare-fun res!437905 () Bool)

(assert (=> b!671209 (=> res!437905 e!383651)))

(assert (=> b!671209 (= res!437905 e!383654)))

(declare-fun res!437910 () Bool)

(assert (=> b!671209 (=> (not res!437910) (not e!383654))))

(assert (=> b!671209 (= res!437910 (bvsgt from!3004 i!1382))))

(declare-fun b!671210 () Bool)

(declare-fun res!437915 () Bool)

(assert (=> b!671210 (=> (not res!437915) (not e!383653))))

(assert (=> b!671210 (= res!437915 (not (contains!3403 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!671211 () Bool)

(declare-fun res!437907 () Bool)

(assert (=> b!671211 (=> (not res!437907) (not e!383653))))

(assert (=> b!671211 (= res!437907 (not (contains!3403 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!671212 () Bool)

(assert (=> b!671212 (= e!383651 e!383655)))

(declare-fun res!437909 () Bool)

(assert (=> b!671212 (=> (not res!437909) (not e!383655))))

(assert (=> b!671212 (= res!437909 (bvsle from!3004 i!1382))))

(declare-fun b!671213 () Bool)

(assert (=> b!671213 (= e!383653 (not true))))

(assert (=> b!671213 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun res!437903 () Bool)

(assert (=> start!60138 (=> (not res!437903) (not e!383653))))

(assert (=> start!60138 (= res!437903 (and (bvslt (size!19149 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19149 a!3626))))))

(assert (=> start!60138 e!383653))

(assert (=> start!60138 true))

(declare-fun array_inv!14581 (array!39185) Bool)

(assert (=> start!60138 (array_inv!14581 a!3626)))

(declare-fun b!671214 () Bool)

(declare-fun res!437902 () Bool)

(assert (=> b!671214 (=> (not res!437902) (not e!383653))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!671214 (= res!437902 (validKeyInArray!0 (select (arr!18785 a!3626) from!3004)))))

(declare-fun b!671215 () Bool)

(declare-fun res!437913 () Bool)

(assert (=> b!671215 (=> (not res!437913) (not e!383653))))

(assert (=> b!671215 (= res!437913 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!671216 () Bool)

(declare-fun res!437904 () Bool)

(assert (=> b!671216 (=> (not res!437904) (not e!383653))))

(assert (=> b!671216 (= res!437904 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19149 a!3626))))))

(declare-fun b!671217 () Bool)

(declare-fun res!437900 () Bool)

(assert (=> b!671217 (=> (not res!437900) (not e!383653))))

(assert (=> b!671217 (= res!437900 (= (select (arr!18785 a!3626) from!3004) k!2843))))

(declare-fun b!671218 () Bool)

(declare-fun res!437901 () Bool)

(assert (=> b!671218 (=> (not res!437901) (not e!383653))))

(declare-fun noDuplicate!650 (List!12826) Bool)

(assert (=> b!671218 (= res!437901 (noDuplicate!650 acc!681))))

(declare-fun b!671219 () Bool)

(declare-fun res!437911 () Bool)

(assert (=> b!671219 (=> (not res!437911) (not e!383653))))

(assert (=> b!671219 (= res!437911 (validKeyInArray!0 k!2843))))

(assert (= (and start!60138 res!437903) b!671218))

(assert (= (and b!671218 res!437901) b!671210))

(assert (= (and b!671210 res!437915) b!671211))

(assert (= (and b!671211 res!437907) b!671209))

(assert (= (and b!671209 res!437910) b!671206))

(assert (= (and b!671209 (not res!437905)) b!671212))

(assert (= (and b!671212 res!437909) b!671208))

(assert (= (and b!671209 res!437906) b!671204))

(assert (= (and b!671204 res!437908) b!671215))

(assert (= (and b!671215 res!437913) b!671216))

(assert (= (and b!671216 res!437904) b!671219))

(assert (= (and b!671219 res!437911) b!671207))

(assert (= (and b!671207 res!437912) b!671205))

(assert (= (and b!671205 res!437914) b!671214))

(assert (= (and b!671214 res!437902) b!671217))

(assert (= (and b!671217 res!437900) b!671213))

(declare-fun m!640805 () Bool)

(assert (=> b!671211 m!640805))

(declare-fun m!640807 () Bool)

(assert (=> b!671204 m!640807))

(declare-fun m!640809 () Bool)

(assert (=> b!671215 m!640809))

(declare-fun m!640811 () Bool)

(assert (=> b!671213 m!640811))

(declare-fun m!640813 () Bool)

(assert (=> b!671207 m!640813))

(declare-fun m!640815 () Bool)

(assert (=> b!671208 m!640815))

(declare-fun m!640817 () Bool)

(assert (=> b!671210 m!640817))

(declare-fun m!640819 () Bool)

(assert (=> start!60138 m!640819))

(declare-fun m!640821 () Bool)

(assert (=> b!671214 m!640821))

(assert (=> b!671214 m!640821))

(declare-fun m!640823 () Bool)

(assert (=> b!671214 m!640823))

(assert (=> b!671206 m!640815))

(declare-fun m!640825 () Bool)

(assert (=> b!671219 m!640825))

(declare-fun m!640827 () Bool)

(assert (=> b!671218 m!640827))

(assert (=> b!671217 m!640821))

(push 1)

(assert (not b!671218))

(assert (not b!671210))

(assert (not b!671208))

(assert (not b!671213))

(assert (not b!671219))

(assert (not b!671215))

(assert (not start!60138))

(assert (not b!671207))

(assert (not b!671206))

(assert (not b!671211))

(assert (not b!671214))

(assert (not b!671204))

(check-sat)

(pop 1)

(push 1)

