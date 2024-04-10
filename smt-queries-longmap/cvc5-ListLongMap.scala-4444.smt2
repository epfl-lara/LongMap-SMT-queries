; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61766 () Bool)

(assert start!61766)

(declare-fun b!691178 () Bool)

(declare-fun res!455567 () Bool)

(declare-fun e!393424 () Bool)

(assert (=> b!691178 (=> (not res!455567) (not e!393424))))

(declare-datatypes ((List!13103 0))(
  ( (Nil!13100) (Cons!13099 (h!14144 (_ BitVec 64)) (t!19370 List!13103)) )
))
(declare-fun acc!681 () List!13103)

(declare-fun noDuplicate!927 (List!13103) Bool)

(assert (=> b!691178 (= res!455567 (noDuplicate!927 acc!681))))

(declare-fun b!691179 () Bool)

(declare-fun res!455571 () Bool)

(assert (=> b!691179 (=> (not res!455571) (not e!393424))))

(declare-datatypes ((array!39787 0))(
  ( (array!39788 (arr!19062 (Array (_ BitVec 32) (_ BitVec 64))) (size!19447 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39787)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!39787 (_ BitVec 32) List!13103) Bool)

(assert (=> b!691179 (= res!455571 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!691181 () Bool)

(declare-fun res!455570 () Bool)

(assert (=> b!691181 (=> (not res!455570) (not e!393424))))

(declare-fun e!393422 () Bool)

(assert (=> b!691181 (= res!455570 e!393422)))

(declare-fun res!455568 () Bool)

(assert (=> b!691181 (=> res!455568 e!393422)))

(declare-fun e!393426 () Bool)

(assert (=> b!691181 (= res!455568 e!393426)))

(declare-fun res!455563 () Bool)

(assert (=> b!691181 (=> (not res!455563) (not e!393426))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!691181 (= res!455563 (bvsgt from!3004 i!1382))))

(declare-fun b!691182 () Bool)

(declare-fun res!455560 () Bool)

(assert (=> b!691182 (=> (not res!455560) (not e!393424))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!691182 (= res!455560 (validKeyInArray!0 (select (arr!19062 a!3626) from!3004)))))

(declare-fun b!691183 () Bool)

(declare-fun res!455558 () Bool)

(assert (=> b!691183 (=> (not res!455558) (not e!393424))))

(declare-fun contains!3680 (List!13103 (_ BitVec 64)) Bool)

(assert (=> b!691183 (= res!455558 (not (contains!3680 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!691184 () Bool)

(declare-fun e!393423 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!691184 (= e!393423 (not (contains!3680 acc!681 k!2843)))))

(declare-fun b!691185 () Bool)

(assert (=> b!691185 (= e!393424 (not true))))

(assert (=> b!691185 false))

(declare-datatypes ((Unit!24372 0))(
  ( (Unit!24373) )
))
(declare-fun lt!316441 () Unit!24372)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39787 (_ BitVec 64) (_ BitVec 32)) Unit!24372)

(assert (=> b!691185 (= lt!316441 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(declare-fun arrayContainsKey!0 (array!39787 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!691185 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun b!691186 () Bool)

(declare-fun res!455562 () Bool)

(assert (=> b!691186 (=> (not res!455562) (not e!393424))))

(assert (=> b!691186 (= res!455562 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13100))))

(declare-fun b!691187 () Bool)

(declare-fun res!455561 () Bool)

(assert (=> b!691187 (=> (not res!455561) (not e!393424))))

(assert (=> b!691187 (= res!455561 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19447 a!3626))))))

(declare-fun b!691188 () Bool)

(declare-fun res!455572 () Bool)

(assert (=> b!691188 (=> (not res!455572) (not e!393424))))

(assert (=> b!691188 (= res!455572 (not (contains!3680 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!691189 () Bool)

(assert (=> b!691189 (= e!393426 (contains!3680 acc!681 k!2843))))

(declare-fun b!691190 () Bool)

(declare-fun res!455565 () Bool)

(assert (=> b!691190 (=> (not res!455565) (not e!393424))))

(assert (=> b!691190 (= res!455565 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!691191 () Bool)

(assert (=> b!691191 (= e!393422 e!393423)))

(declare-fun res!455566 () Bool)

(assert (=> b!691191 (=> (not res!455566) (not e!393423))))

(assert (=> b!691191 (= res!455566 (bvsle from!3004 i!1382))))

(declare-fun res!455564 () Bool)

(assert (=> start!61766 (=> (not res!455564) (not e!393424))))

(assert (=> start!61766 (= res!455564 (and (bvslt (size!19447 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19447 a!3626))))))

(assert (=> start!61766 e!393424))

(assert (=> start!61766 true))

(declare-fun array_inv!14858 (array!39787) Bool)

(assert (=> start!61766 (array_inv!14858 a!3626)))

(declare-fun b!691180 () Bool)

(declare-fun res!455559 () Bool)

(assert (=> b!691180 (=> (not res!455559) (not e!393424))))

(assert (=> b!691180 (= res!455559 (validKeyInArray!0 k!2843))))

(declare-fun b!691192 () Bool)

(declare-fun res!455569 () Bool)

(assert (=> b!691192 (=> (not res!455569) (not e!393424))))

(assert (=> b!691192 (= res!455569 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19447 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!691193 () Bool)

(declare-fun res!455573 () Bool)

(assert (=> b!691193 (=> (not res!455573) (not e!393424))))

(assert (=> b!691193 (= res!455573 (= (select (arr!19062 a!3626) from!3004) k!2843))))

(assert (= (and start!61766 res!455564) b!691178))

(assert (= (and b!691178 res!455567) b!691188))

(assert (= (and b!691188 res!455572) b!691183))

(assert (= (and b!691183 res!455558) b!691181))

(assert (= (and b!691181 res!455563) b!691189))

(assert (= (and b!691181 (not res!455568)) b!691191))

(assert (= (and b!691191 res!455566) b!691184))

(assert (= (and b!691181 res!455570) b!691186))

(assert (= (and b!691186 res!455562) b!691179))

(assert (= (and b!691179 res!455571) b!691187))

(assert (= (and b!691187 res!455561) b!691180))

(assert (= (and b!691180 res!455559) b!691190))

(assert (= (and b!691190 res!455565) b!691192))

(assert (= (and b!691192 res!455569) b!691182))

(assert (= (and b!691182 res!455560) b!691193))

(assert (= (and b!691193 res!455573) b!691185))

(declare-fun m!654329 () Bool)

(assert (=> b!691182 m!654329))

(assert (=> b!691182 m!654329))

(declare-fun m!654331 () Bool)

(assert (=> b!691182 m!654331))

(declare-fun m!654333 () Bool)

(assert (=> b!691178 m!654333))

(declare-fun m!654335 () Bool)

(assert (=> b!691189 m!654335))

(assert (=> b!691193 m!654329))

(declare-fun m!654337 () Bool)

(assert (=> b!691183 m!654337))

(declare-fun m!654339 () Bool)

(assert (=> start!61766 m!654339))

(declare-fun m!654341 () Bool)

(assert (=> b!691185 m!654341))

(declare-fun m!654343 () Bool)

(assert (=> b!691185 m!654343))

(declare-fun m!654345 () Bool)

(assert (=> b!691190 m!654345))

(declare-fun m!654347 () Bool)

(assert (=> b!691180 m!654347))

(assert (=> b!691184 m!654335))

(declare-fun m!654349 () Bool)

(assert (=> b!691188 m!654349))

(declare-fun m!654351 () Bool)

(assert (=> b!691186 m!654351))

(declare-fun m!654353 () Bool)

(assert (=> b!691179 m!654353))

(push 1)

(assert (not start!61766))

(assert (not b!691188))

(assert (not b!691179))

(assert (not b!691189))

(assert (not b!691180))

(assert (not b!691182))

(assert (not b!691185))

(assert (not b!691184))

(assert (not b!691186))

(assert (not b!691183))

(assert (not b!691178))

(assert (not b!691190))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

