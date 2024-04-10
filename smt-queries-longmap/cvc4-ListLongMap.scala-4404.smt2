; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60648 () Bool)

(assert start!60648)

(declare-fun b!681181 () Bool)

(declare-fun e!388050 () Bool)

(declare-datatypes ((List!12985 0))(
  ( (Nil!12982) (Cons!12981 (h!14026 (_ BitVec 64)) (t!19219 List!12985)) )
))
(declare-fun acc!681 () List!12985)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3562 (List!12985 (_ BitVec 64)) Bool)

(assert (=> b!681181 (= e!388050 (not (contains!3562 acc!681 k!2843)))))

(declare-fun b!681182 () Bool)

(declare-fun res!447366 () Bool)

(declare-fun e!388048 () Bool)

(assert (=> b!681182 (=> (not res!447366) (not e!388048))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!681182 (= res!447366 (validKeyInArray!0 k!2843))))

(declare-fun b!681183 () Bool)

(declare-fun res!447356 () Bool)

(assert (=> b!681183 (=> (not res!447356) (not e!388048))))

(assert (=> b!681183 (= res!447356 (not (contains!3562 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!681184 () Bool)

(declare-datatypes ((Unit!23894 0))(
  ( (Unit!23895) )
))
(declare-fun e!388053 () Unit!23894)

(declare-fun Unit!23896 () Unit!23894)

(assert (=> b!681184 (= e!388053 Unit!23896)))

(declare-fun b!681185 () Bool)

(declare-fun e!388051 () Bool)

(assert (=> b!681185 (= e!388051 true)))

(declare-fun lt!313236 () Bool)

(declare-fun lt!313239 () List!12985)

(assert (=> b!681185 (= lt!313236 (contains!3562 lt!313239 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!681186 () Bool)

(declare-fun res!447362 () Bool)

(assert (=> b!681186 (=> (not res!447362) (not e!388048))))

(declare-datatypes ((array!39515 0))(
  ( (array!39516 (arr!18944 (Array (_ BitVec 32) (_ BitVec 64))) (size!19308 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39515)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!39515 (_ BitVec 32) List!12985) Bool)

(assert (=> b!681186 (= res!447362 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!681187 () Bool)

(declare-fun e!388052 () Bool)

(assert (=> b!681187 (= e!388052 (contains!3562 acc!681 k!2843))))

(declare-fun b!681188 () Bool)

(declare-fun res!447357 () Bool)

(assert (=> b!681188 (=> (not res!447357) (not e!388048))))

(declare-fun arrayContainsKey!0 (array!39515 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!681188 (= res!447357 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!681189 () Bool)

(declare-fun res!447368 () Bool)

(assert (=> b!681189 (=> (not res!447368) (not e!388048))))

(assert (=> b!681189 (= res!447368 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12982))))

(declare-fun b!681190 () Bool)

(declare-fun res!447353 () Bool)

(assert (=> b!681190 (=> (not res!447353) (not e!388048))))

(declare-fun noDuplicate!809 (List!12985) Bool)

(assert (=> b!681190 (= res!447353 (noDuplicate!809 acc!681))))

(declare-fun b!681191 () Bool)

(declare-fun Unit!23897 () Unit!23894)

(assert (=> b!681191 (= e!388053 Unit!23897)))

(declare-fun lt!313238 () Unit!23894)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39515 (_ BitVec 64) (_ BitVec 32)) Unit!23894)

(assert (=> b!681191 (= lt!313238 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!681191 false))

(declare-fun b!681192 () Bool)

(declare-fun res!447351 () Bool)

(assert (=> b!681192 (=> (not res!447351) (not e!388048))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!681192 (= res!447351 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19308 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!681193 () Bool)

(declare-fun e!388049 () Bool)

(assert (=> b!681193 (= e!388048 (not e!388049))))

(declare-fun res!447354 () Bool)

(assert (=> b!681193 (=> res!447354 e!388049)))

(assert (=> b!681193 (= res!447354 (not (validKeyInArray!0 (select (arr!18944 a!3626) from!3004))))))

(declare-fun lt!313237 () Unit!23894)

(assert (=> b!681193 (= lt!313237 e!388053)))

(declare-fun c!77282 () Bool)

(assert (=> b!681193 (= c!77282 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!681193 (arrayContainsKey!0 (array!39516 (store (arr!18944 a!3626) i!1382 k!2843) (size!19308 a!3626)) k!2843 from!3004)))

(declare-fun b!681194 () Bool)

(declare-fun res!447358 () Bool)

(assert (=> b!681194 (=> (not res!447358) (not e!388048))))

(assert (=> b!681194 (= res!447358 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19308 a!3626))))))

(declare-fun b!681195 () Bool)

(declare-fun e!388047 () Bool)

(assert (=> b!681195 (= e!388047 e!388050)))

(declare-fun res!447360 () Bool)

(assert (=> b!681195 (=> (not res!447360) (not e!388050))))

(assert (=> b!681195 (= res!447360 (bvsle from!3004 i!1382))))

(declare-fun b!681196 () Bool)

(declare-fun res!447364 () Bool)

(assert (=> b!681196 (=> res!447364 e!388051)))

(assert (=> b!681196 (= res!447364 (contains!3562 lt!313239 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!681197 () Bool)

(declare-fun res!447361 () Bool)

(assert (=> b!681197 (=> res!447361 e!388051)))

(assert (=> b!681197 (= res!447361 (not (noDuplicate!809 lt!313239)))))

(declare-fun b!681198 () Bool)

(declare-fun res!447355 () Bool)

(assert (=> b!681198 (=> (not res!447355) (not e!388048))))

(assert (=> b!681198 (= res!447355 (not (contains!3562 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!447352 () Bool)

(assert (=> start!60648 (=> (not res!447352) (not e!388048))))

(assert (=> start!60648 (= res!447352 (and (bvslt (size!19308 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19308 a!3626))))))

(assert (=> start!60648 e!388048))

(assert (=> start!60648 true))

(declare-fun array_inv!14740 (array!39515) Bool)

(assert (=> start!60648 (array_inv!14740 a!3626)))

(declare-fun b!681199 () Bool)

(assert (=> b!681199 (= e!388049 e!388051)))

(declare-fun res!447365 () Bool)

(assert (=> b!681199 (=> res!447365 e!388051)))

(assert (=> b!681199 (= res!447365 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!313 (List!12985 (_ BitVec 64)) List!12985)

(assert (=> b!681199 (= lt!313239 ($colon$colon!313 acc!681 (select (arr!18944 a!3626) from!3004)))))

(declare-fun subseq!148 (List!12985 List!12985) Bool)

(assert (=> b!681199 (subseq!148 acc!681 acc!681)))

(declare-fun lt!313240 () Unit!23894)

(declare-fun lemmaListSubSeqRefl!0 (List!12985) Unit!23894)

(assert (=> b!681199 (= lt!313240 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!681200 () Bool)

(declare-fun res!447359 () Bool)

(assert (=> b!681200 (=> (not res!447359) (not e!388048))))

(assert (=> b!681200 (= res!447359 e!388047)))

(declare-fun res!447363 () Bool)

(assert (=> b!681200 (=> res!447363 e!388047)))

(assert (=> b!681200 (= res!447363 e!388052)))

(declare-fun res!447367 () Bool)

(assert (=> b!681200 (=> (not res!447367) (not e!388052))))

(assert (=> b!681200 (= res!447367 (bvsgt from!3004 i!1382))))

(assert (= (and start!60648 res!447352) b!681190))

(assert (= (and b!681190 res!447353) b!681183))

(assert (= (and b!681183 res!447356) b!681198))

(assert (= (and b!681198 res!447355) b!681200))

(assert (= (and b!681200 res!447367) b!681187))

(assert (= (and b!681200 (not res!447363)) b!681195))

(assert (= (and b!681195 res!447360) b!681181))

(assert (= (and b!681200 res!447359) b!681189))

(assert (= (and b!681189 res!447368) b!681186))

(assert (= (and b!681186 res!447362) b!681194))

(assert (= (and b!681194 res!447358) b!681182))

(assert (= (and b!681182 res!447366) b!681188))

(assert (= (and b!681188 res!447357) b!681192))

(assert (= (and b!681192 res!447351) b!681193))

(assert (= (and b!681193 c!77282) b!681191))

(assert (= (and b!681193 (not c!77282)) b!681184))

(assert (= (and b!681193 (not res!447354)) b!681199))

(assert (= (and b!681199 (not res!447365)) b!681197))

(assert (= (and b!681197 (not res!447361)) b!681196))

(assert (= (and b!681196 (not res!447364)) b!681185))

(declare-fun m!646091 () Bool)

(assert (=> b!681190 m!646091))

(declare-fun m!646093 () Bool)

(assert (=> b!681198 m!646093))

(declare-fun m!646095 () Bool)

(assert (=> b!681186 m!646095))

(declare-fun m!646097 () Bool)

(assert (=> b!681183 m!646097))

(declare-fun m!646099 () Bool)

(assert (=> b!681193 m!646099))

(declare-fun m!646101 () Bool)

(assert (=> b!681193 m!646101))

(declare-fun m!646103 () Bool)

(assert (=> b!681193 m!646103))

(assert (=> b!681193 m!646099))

(declare-fun m!646105 () Bool)

(assert (=> b!681193 m!646105))

(declare-fun m!646107 () Bool)

(assert (=> b!681193 m!646107))

(declare-fun m!646109 () Bool)

(assert (=> b!681181 m!646109))

(assert (=> b!681187 m!646109))

(declare-fun m!646111 () Bool)

(assert (=> b!681196 m!646111))

(declare-fun m!646113 () Bool)

(assert (=> start!60648 m!646113))

(declare-fun m!646115 () Bool)

(assert (=> b!681189 m!646115))

(declare-fun m!646117 () Bool)

(assert (=> b!681197 m!646117))

(declare-fun m!646119 () Bool)

(assert (=> b!681182 m!646119))

(declare-fun m!646121 () Bool)

(assert (=> b!681185 m!646121))

(declare-fun m!646123 () Bool)

(assert (=> b!681188 m!646123))

(assert (=> b!681199 m!646099))

(assert (=> b!681199 m!646099))

(declare-fun m!646125 () Bool)

(assert (=> b!681199 m!646125))

(declare-fun m!646127 () Bool)

(assert (=> b!681199 m!646127))

(declare-fun m!646129 () Bool)

(assert (=> b!681199 m!646129))

(declare-fun m!646131 () Bool)

(assert (=> b!681191 m!646131))

(push 1)

(assert (not b!681183))

(assert (not b!681199))

(assert (not b!681187))

(assert (not b!681189))

(assert (not b!681190))

(assert (not b!681185))

(assert (not b!681197))

(assert (not b!681198))

(assert (not b!681188))

(assert (not b!681191))

(assert (not b!681182))

(assert (not b!681181))

(assert (not start!60648))

(assert (not b!681193))

(assert (not b!681196))

(assert (not b!681186))

(check-sat)

(pop 1)

