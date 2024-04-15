; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61164 () Bool)

(assert start!61164)

(declare-fun b!685313 () Bool)

(declare-fun res!450787 () Bool)

(declare-fun e!390266 () Bool)

(assert (=> b!685313 (=> res!450787 e!390266)))

(declare-datatypes ((List!13074 0))(
  ( (Nil!13071) (Cons!13070 (h!14115 (_ BitVec 64)) (t!19317 List!13074)) )
))
(declare-fun lt!314473 () List!13074)

(declare-fun noDuplicate!865 (List!13074) Bool)

(assert (=> b!685313 (= res!450787 (not (noDuplicate!865 lt!314473)))))

(declare-fun b!685314 () Bool)

(declare-datatypes ((Unit!24120 0))(
  ( (Unit!24121) )
))
(declare-fun e!390270 () Unit!24120)

(declare-fun Unit!24122 () Unit!24120)

(assert (=> b!685314 (= e!390270 Unit!24122)))

(declare-fun b!685315 () Bool)

(declare-fun res!450804 () Bool)

(assert (=> b!685315 (=> res!450804 e!390266)))

(declare-fun lt!314471 () Bool)

(assert (=> b!685315 (= res!450804 lt!314471)))

(declare-fun b!685316 () Bool)

(assert (=> b!685316 (= e!390266 true)))

(declare-fun lt!314472 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3596 (List!13074 (_ BitVec 64)) Bool)

(assert (=> b!685316 (= lt!314472 (contains!3596 lt!314473 k!2843))))

(declare-fun b!685318 () Bool)

(declare-fun res!450801 () Bool)

(declare-fun e!390267 () Bool)

(assert (=> b!685318 (=> (not res!450801) (not e!390267))))

(declare-fun acc!681 () List!13074)

(assert (=> b!685318 (= res!450801 (not (contains!3596 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!685319 () Bool)

(declare-fun e!390269 () Bool)

(declare-fun e!390272 () Bool)

(assert (=> b!685319 (= e!390269 e!390272)))

(declare-fun res!450800 () Bool)

(assert (=> b!685319 (=> (not res!450800) (not e!390272))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!685319 (= res!450800 (bvsle from!3004 i!1382))))

(declare-fun b!685320 () Bool)

(declare-fun res!450797 () Bool)

(assert (=> b!685320 (=> res!450797 e!390266)))

(assert (=> b!685320 (= res!450797 (contains!3596 acc!681 k!2843))))

(declare-fun b!685321 () Bool)

(declare-fun res!450805 () Bool)

(assert (=> b!685321 (=> (not res!450805) (not e!390267))))

(declare-datatypes ((array!39634 0))(
  ( (array!39635 (arr!18994 (Array (_ BitVec 32) (_ BitVec 64))) (size!19366 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39634)

(assert (=> b!685321 (= res!450805 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19366 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!685322 () Bool)

(declare-fun res!450790 () Bool)

(assert (=> b!685322 (=> (not res!450790) (not e!390267))))

(assert (=> b!685322 (= res!450790 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19366 a!3626))))))

(declare-fun b!685323 () Bool)

(declare-fun e!390271 () Unit!24120)

(declare-fun lt!314475 () Unit!24120)

(assert (=> b!685323 (= e!390271 lt!314475)))

(declare-fun lt!314469 () Unit!24120)

(declare-fun lemmaListSubSeqRefl!0 (List!13074) Unit!24120)

(assert (=> b!685323 (= lt!314469 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!199 (List!13074 List!13074) Bool)

(assert (=> b!685323 (subseq!199 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39634 List!13074 List!13074 (_ BitVec 32)) Unit!24120)

(declare-fun $colon$colon!363 (List!13074 (_ BitVec 64)) List!13074)

(assert (=> b!685323 (= lt!314475 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!363 acc!681 (select (arr!18994 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun arrayNoDuplicates!0 (array!39634 (_ BitVec 32) List!13074) Bool)

(assert (=> b!685323 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!685324 () Bool)

(declare-fun res!450796 () Bool)

(assert (=> b!685324 (=> (not res!450796) (not e!390267))))

(assert (=> b!685324 (= res!450796 (noDuplicate!865 acc!681))))

(declare-fun b!685325 () Bool)

(declare-fun res!450792 () Bool)

(assert (=> b!685325 (=> (not res!450792) (not e!390267))))

(assert (=> b!685325 (= res!450792 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13071))))

(declare-fun b!685326 () Bool)

(declare-fun res!450803 () Bool)

(assert (=> b!685326 (=> (not res!450803) (not e!390267))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!685326 (= res!450803 (validKeyInArray!0 k!2843))))

(declare-fun res!450788 () Bool)

(assert (=> start!61164 (=> (not res!450788) (not e!390267))))

(assert (=> start!61164 (= res!450788 (and (bvslt (size!19366 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19366 a!3626))))))

(assert (=> start!61164 e!390267))

(assert (=> start!61164 true))

(declare-fun array_inv!14877 (array!39634) Bool)

(assert (=> start!61164 (array_inv!14877 a!3626)))

(declare-fun b!685317 () Bool)

(declare-fun e!390265 () Bool)

(assert (=> b!685317 (= e!390265 (contains!3596 acc!681 k!2843))))

(declare-fun b!685327 () Bool)

(declare-fun res!450798 () Bool)

(assert (=> b!685327 (=> (not res!450798) (not e!390267))))

(assert (=> b!685327 (= res!450798 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!685328 () Bool)

(declare-fun Unit!24123 () Unit!24120)

(assert (=> b!685328 (= e!390271 Unit!24123)))

(declare-fun b!685329 () Bool)

(declare-fun Unit!24124 () Unit!24120)

(assert (=> b!685329 (= e!390270 Unit!24124)))

(declare-fun lt!314470 () Unit!24120)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39634 (_ BitVec 64) (_ BitVec 32)) Unit!24120)

(assert (=> b!685329 (= lt!314470 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!685329 false))

(declare-fun b!685330 () Bool)

(assert (=> b!685330 (= e!390272 (not (contains!3596 acc!681 k!2843)))))

(declare-fun b!685331 () Bool)

(declare-fun res!450791 () Bool)

(assert (=> b!685331 (=> res!450791 e!390266)))

(assert (=> b!685331 (= res!450791 (not (subseq!199 acc!681 lt!314473)))))

(declare-fun b!685332 () Bool)

(assert (=> b!685332 (= e!390267 (not e!390266))))

(declare-fun res!450794 () Bool)

(assert (=> b!685332 (=> res!450794 e!390266)))

(assert (=> b!685332 (= res!450794 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!164 (List!13074 (_ BitVec 64)) List!13074)

(assert (=> b!685332 (= (-!164 lt!314473 k!2843) acc!681)))

(assert (=> b!685332 (= lt!314473 ($colon$colon!363 acc!681 k!2843))))

(declare-fun lt!314466 () Unit!24120)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13074) Unit!24120)

(assert (=> b!685332 (= lt!314466 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(assert (=> b!685332 (subseq!199 acc!681 acc!681)))

(declare-fun lt!314468 () Unit!24120)

(assert (=> b!685332 (= lt!314468 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!685332 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!314474 () Unit!24120)

(assert (=> b!685332 (= lt!314474 e!390271)))

(declare-fun c!77631 () Bool)

(assert (=> b!685332 (= c!77631 (validKeyInArray!0 (select (arr!18994 a!3626) from!3004)))))

(declare-fun lt!314467 () Unit!24120)

(assert (=> b!685332 (= lt!314467 e!390270)))

(declare-fun c!77630 () Bool)

(assert (=> b!685332 (= c!77630 lt!314471)))

(declare-fun arrayContainsKey!0 (array!39634 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!685332 (= lt!314471 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!685332 (arrayContainsKey!0 (array!39635 (store (arr!18994 a!3626) i!1382 k!2843) (size!19366 a!3626)) k!2843 from!3004)))

(declare-fun b!685333 () Bool)

(declare-fun res!450802 () Bool)

(assert (=> b!685333 (=> (not res!450802) (not e!390267))))

(assert (=> b!685333 (= res!450802 e!390269)))

(declare-fun res!450789 () Bool)

(assert (=> b!685333 (=> res!450789 e!390269)))

(assert (=> b!685333 (= res!450789 e!390265)))

(declare-fun res!450793 () Bool)

(assert (=> b!685333 (=> (not res!450793) (not e!390265))))

(assert (=> b!685333 (= res!450793 (bvsgt from!3004 i!1382))))

(declare-fun b!685334 () Bool)

(declare-fun res!450795 () Bool)

(assert (=> b!685334 (=> (not res!450795) (not e!390267))))

(assert (=> b!685334 (= res!450795 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!685335 () Bool)

(declare-fun res!450799 () Bool)

(assert (=> b!685335 (=> (not res!450799) (not e!390267))))

(assert (=> b!685335 (= res!450799 (not (contains!3596 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!61164 res!450788) b!685324))

(assert (= (and b!685324 res!450796) b!685335))

(assert (= (and b!685335 res!450799) b!685318))

(assert (= (and b!685318 res!450801) b!685333))

(assert (= (and b!685333 res!450793) b!685317))

(assert (= (and b!685333 (not res!450789)) b!685319))

(assert (= (and b!685319 res!450800) b!685330))

(assert (= (and b!685333 res!450802) b!685325))

(assert (= (and b!685325 res!450792) b!685327))

(assert (= (and b!685327 res!450798) b!685322))

(assert (= (and b!685322 res!450790) b!685326))

(assert (= (and b!685326 res!450803) b!685334))

(assert (= (and b!685334 res!450795) b!685321))

(assert (= (and b!685321 res!450805) b!685332))

(assert (= (and b!685332 c!77630) b!685329))

(assert (= (and b!685332 (not c!77630)) b!685314))

(assert (= (and b!685332 c!77631) b!685323))

(assert (= (and b!685332 (not c!77631)) b!685328))

(assert (= (and b!685332 (not res!450794)) b!685313))

(assert (= (and b!685313 (not res!450787)) b!685315))

(assert (= (and b!685315 (not res!450804)) b!685320))

(assert (= (and b!685320 (not res!450797)) b!685331))

(assert (= (and b!685331 (not res!450791)) b!685316))

(declare-fun m!649001 () Bool)

(assert (=> b!685327 m!649001))

(declare-fun m!649003 () Bool)

(assert (=> b!685324 m!649003))

(declare-fun m!649005 () Bool)

(assert (=> b!685316 m!649005))

(declare-fun m!649007 () Bool)

(assert (=> b!685335 m!649007))

(declare-fun m!649009 () Bool)

(assert (=> b!685323 m!649009))

(declare-fun m!649011 () Bool)

(assert (=> b!685323 m!649011))

(declare-fun m!649013 () Bool)

(assert (=> b!685323 m!649013))

(declare-fun m!649015 () Bool)

(assert (=> b!685323 m!649015))

(assert (=> b!685323 m!649011))

(assert (=> b!685323 m!649013))

(declare-fun m!649017 () Bool)

(assert (=> b!685323 m!649017))

(declare-fun m!649019 () Bool)

(assert (=> b!685323 m!649019))

(declare-fun m!649021 () Bool)

(assert (=> b!685331 m!649021))

(declare-fun m!649023 () Bool)

(assert (=> b!685329 m!649023))

(assert (=> b!685332 m!649009))

(assert (=> b!685332 m!649011))

(declare-fun m!649025 () Bool)

(assert (=> b!685332 m!649025))

(declare-fun m!649027 () Bool)

(assert (=> b!685332 m!649027))

(declare-fun m!649029 () Bool)

(assert (=> b!685332 m!649029))

(assert (=> b!685332 m!649017))

(declare-fun m!649031 () Bool)

(assert (=> b!685332 m!649031))

(declare-fun m!649033 () Bool)

(assert (=> b!685332 m!649033))

(assert (=> b!685332 m!649011))

(declare-fun m!649035 () Bool)

(assert (=> b!685332 m!649035))

(declare-fun m!649037 () Bool)

(assert (=> b!685332 m!649037))

(assert (=> b!685332 m!649019))

(declare-fun m!649039 () Bool)

(assert (=> start!61164 m!649039))

(declare-fun m!649041 () Bool)

(assert (=> b!685317 m!649041))

(declare-fun m!649043 () Bool)

(assert (=> b!685334 m!649043))

(declare-fun m!649045 () Bool)

(assert (=> b!685325 m!649045))

(assert (=> b!685330 m!649041))

(assert (=> b!685320 m!649041))

(declare-fun m!649047 () Bool)

(assert (=> b!685318 m!649047))

(declare-fun m!649049 () Bool)

(assert (=> b!685326 m!649049))

(declare-fun m!649051 () Bool)

(assert (=> b!685313 m!649051))

(push 1)

(assert (not b!685318))

(assert (not start!61164))

(assert (not b!685332))

(assert (not b!685331))

(assert (not b!685326))

(assert (not b!685317))

(assert (not b!685334))

(assert (not b!685330))

(assert (not b!685327))

(assert (not b!685316))

(assert (not b!685313))

(assert (not b!685325))

(assert (not b!685324))

(assert (not b!685335))

(assert (not b!685329))

(assert (not b!685323))

(assert (not b!685320))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

