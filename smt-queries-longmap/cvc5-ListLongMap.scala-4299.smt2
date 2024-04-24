; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59884 () Bool)

(assert start!59884)

(declare-fun b!661314 () Bool)

(declare-fun res!429272 () Bool)

(declare-fun e!379961 () Bool)

(assert (=> b!661314 (=> (not res!429272) (not e!379961))))

(declare-fun e!379960 () Bool)

(assert (=> b!661314 (= res!429272 e!379960)))

(declare-fun res!429268 () Bool)

(assert (=> b!661314 (=> res!429268 e!379960)))

(declare-fun e!379958 () Bool)

(assert (=> b!661314 (= res!429268 e!379958)))

(declare-fun res!429275 () Bool)

(assert (=> b!661314 (=> (not res!429275) (not e!379958))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!661314 (= res!429275 (bvsgt from!3004 i!1382))))

(declare-fun b!661315 () Bool)

(declare-fun e!379959 () Bool)

(declare-datatypes ((List!12572 0))(
  ( (Nil!12569) (Cons!12568 (h!13616 (_ BitVec 64)) (t!18792 List!12572)) )
))
(declare-fun acc!681 () List!12572)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3224 (List!12572 (_ BitVec 64)) Bool)

(assert (=> b!661315 (= e!379959 (not (contains!3224 acc!681 k!2843)))))

(declare-fun b!661316 () Bool)

(declare-fun res!429278 () Bool)

(assert (=> b!661316 (=> (not res!429278) (not e!379961))))

(assert (=> b!661316 (= res!429278 (not (contains!3224 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!661317 () Bool)

(assert (=> b!661317 (= e!379960 e!379959)))

(declare-fun res!429279 () Bool)

(assert (=> b!661317 (=> (not res!429279) (not e!379959))))

(assert (=> b!661317 (= res!429279 (bvsle from!3004 i!1382))))

(declare-fun b!661318 () Bool)

(declare-fun res!429267 () Bool)

(assert (=> b!661318 (=> (not res!429267) (not e!379961))))

(declare-datatypes ((array!38869 0))(
  ( (array!38870 (arr!18624 (Array (_ BitVec 32) (_ BitVec 64))) (size!18988 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38869)

(assert (=> b!661318 (= res!429267 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!18988 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!661319 () Bool)

(declare-fun res!429280 () Bool)

(assert (=> b!661319 (=> (not res!429280) (not e!379961))))

(declare-fun arrayNoDuplicates!0 (array!38869 (_ BitVec 32) List!12572) Bool)

(assert (=> b!661319 (= res!429280 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!661320 () Bool)

(declare-fun res!429269 () Bool)

(assert (=> b!661320 (=> (not res!429269) (not e!379961))))

(declare-fun arrayContainsKey!0 (array!38869 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!661320 (= res!429269 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!661321 () Bool)

(declare-fun res!429274 () Bool)

(assert (=> b!661321 (=> (not res!429274) (not e!379961))))

(assert (=> b!661321 (= res!429274 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!18988 a!3626))))))

(declare-fun b!661322 () Bool)

(assert (=> b!661322 (= e!379961 (not true))))

(assert (=> b!661322 (arrayContainsKey!0 (array!38870 (store (arr!18624 a!3626) i!1382 k!2843) (size!18988 a!3626)) k!2843 from!3004)))

(declare-fun b!661323 () Bool)

(declare-fun res!429273 () Bool)

(assert (=> b!661323 (=> (not res!429273) (not e!379961))))

(assert (=> b!661323 (= res!429273 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12569))))

(declare-fun b!661324 () Bool)

(declare-fun res!429277 () Bool)

(assert (=> b!661324 (=> (not res!429277) (not e!379961))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!661324 (= res!429277 (validKeyInArray!0 k!2843))))

(declare-fun b!661325 () Bool)

(declare-fun res!429270 () Bool)

(assert (=> b!661325 (=> (not res!429270) (not e!379961))))

(declare-fun noDuplicate!498 (List!12572) Bool)

(assert (=> b!661325 (= res!429270 (noDuplicate!498 acc!681))))

(declare-fun b!661326 () Bool)

(declare-fun res!429276 () Bool)

(assert (=> b!661326 (=> (not res!429276) (not e!379961))))

(assert (=> b!661326 (= res!429276 (not (contains!3224 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!429271 () Bool)

(assert (=> start!59884 (=> (not res!429271) (not e!379961))))

(assert (=> start!59884 (= res!429271 (and (bvslt (size!18988 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18988 a!3626))))))

(assert (=> start!59884 e!379961))

(assert (=> start!59884 true))

(declare-fun array_inv!14483 (array!38869) Bool)

(assert (=> start!59884 (array_inv!14483 a!3626)))

(declare-fun b!661327 () Bool)

(assert (=> b!661327 (= e!379958 (contains!3224 acc!681 k!2843))))

(assert (= (and start!59884 res!429271) b!661325))

(assert (= (and b!661325 res!429270) b!661326))

(assert (= (and b!661326 res!429276) b!661316))

(assert (= (and b!661316 res!429278) b!661314))

(assert (= (and b!661314 res!429275) b!661327))

(assert (= (and b!661314 (not res!429268)) b!661317))

(assert (= (and b!661317 res!429279) b!661315))

(assert (= (and b!661314 res!429272) b!661323))

(assert (= (and b!661323 res!429273) b!661319))

(assert (= (and b!661319 res!429280) b!661321))

(assert (= (and b!661321 res!429274) b!661324))

(assert (= (and b!661324 res!429277) b!661320))

(assert (= (and b!661320 res!429269) b!661318))

(assert (= (and b!661318 res!429267) b!661322))

(declare-fun m!634143 () Bool)

(assert (=> b!661323 m!634143))

(declare-fun m!634145 () Bool)

(assert (=> b!661316 m!634145))

(declare-fun m!634147 () Bool)

(assert (=> b!661326 m!634147))

(declare-fun m!634149 () Bool)

(assert (=> b!661325 m!634149))

(declare-fun m!634151 () Bool)

(assert (=> b!661320 m!634151))

(declare-fun m!634153 () Bool)

(assert (=> b!661319 m!634153))

(declare-fun m!634155 () Bool)

(assert (=> b!661322 m!634155))

(declare-fun m!634157 () Bool)

(assert (=> b!661322 m!634157))

(declare-fun m!634159 () Bool)

(assert (=> b!661327 m!634159))

(declare-fun m!634161 () Bool)

(assert (=> start!59884 m!634161))

(assert (=> b!661315 m!634159))

(declare-fun m!634163 () Bool)

(assert (=> b!661324 m!634163))

(push 1)

(assert (not b!661319))

(assert (not b!661316))

(assert (not b!661323))

(assert (not b!661325))

(assert (not b!661315))

(assert (not b!661326))

(assert (not b!661322))

(assert (not b!661324))

(assert (not b!661327))

(assert (not b!661320))

(assert (not start!59884))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

