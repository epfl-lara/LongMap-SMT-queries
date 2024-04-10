; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59964 () Bool)

(assert start!59964)

(declare-fun b!665228 () Bool)

(declare-datatypes ((Unit!23215 0))(
  ( (Unit!23216) )
))
(declare-fun e!381296 () Unit!23215)

(declare-fun Unit!23217 () Unit!23215)

(assert (=> b!665228 (= e!381296 Unit!23217)))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun lt!309938 () Unit!23215)

(declare-fun k!2843 () (_ BitVec 64))

(declare-datatypes ((array!39011 0))(
  ( (array!39012 (arr!18698 (Array (_ BitVec 32) (_ BitVec 64))) (size!19062 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39011)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39011 (_ BitVec 64) (_ BitVec 32)) Unit!23215)

(assert (=> b!665228 (= lt!309938 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!665228 false))

(declare-fun b!665229 () Bool)

(declare-fun res!432811 () Bool)

(declare-fun e!381297 () Bool)

(assert (=> b!665229 (=> res!432811 e!381297)))

(declare-datatypes ((List!12739 0))(
  ( (Nil!12736) (Cons!12735 (h!13780 (_ BitVec 64)) (t!18967 List!12739)) )
))
(declare-fun acc!681 () List!12739)

(declare-fun contains!3316 (List!12739 (_ BitVec 64)) Bool)

(assert (=> b!665229 (= res!432811 (contains!3316 acc!681 k!2843))))

(declare-fun b!665230 () Bool)

(declare-fun res!432805 () Bool)

(declare-fun e!381290 () Bool)

(assert (=> b!665230 (=> (not res!432805) (not e!381290))))

(declare-fun e!381293 () Bool)

(assert (=> b!665230 (= res!432805 e!381293)))

(declare-fun res!432796 () Bool)

(assert (=> b!665230 (=> res!432796 e!381293)))

(declare-fun e!381295 () Bool)

(assert (=> b!665230 (= res!432796 e!381295)))

(declare-fun res!432810 () Bool)

(assert (=> b!665230 (=> (not res!432810) (not e!381295))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!665230 (= res!432810 (bvsgt from!3004 i!1382))))

(declare-fun b!665231 () Bool)

(declare-fun res!432794 () Bool)

(assert (=> b!665231 (=> (not res!432794) (not e!381290))))

(declare-fun noDuplicate!563 (List!12739) Bool)

(assert (=> b!665231 (= res!432794 (noDuplicate!563 acc!681))))

(declare-fun b!665232 () Bool)

(assert (=> b!665232 (= e!381295 (contains!3316 acc!681 k!2843))))

(declare-fun b!665233 () Bool)

(declare-fun e!381292 () Unit!23215)

(declare-fun lt!309940 () Unit!23215)

(assert (=> b!665233 (= e!381292 lt!309940)))

(declare-fun lt!309939 () Unit!23215)

(declare-fun lemmaListSubSeqRefl!0 (List!12739) Unit!23215)

(assert (=> b!665233 (= lt!309939 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!55 (List!12739 List!12739) Bool)

(assert (=> b!665233 (subseq!55 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39011 List!12739 List!12739 (_ BitVec 32)) Unit!23215)

(declare-fun $colon$colon!187 (List!12739 (_ BitVec 64)) List!12739)

(assert (=> b!665233 (= lt!309940 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!187 acc!681 (select (arr!18698 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun arrayNoDuplicates!0 (array!39011 (_ BitVec 32) List!12739) Bool)

(assert (=> b!665233 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!665234 () Bool)

(assert (=> b!665234 (= e!381297 true)))

(declare-fun lt!309937 () Bool)

(declare-fun lt!309934 () List!12739)

(assert (=> b!665234 (= lt!309937 (contains!3316 lt!309934 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!665235 () Bool)

(declare-fun res!432807 () Bool)

(assert (=> b!665235 (=> res!432807 e!381297)))

(assert (=> b!665235 (= res!432807 (not (contains!3316 lt!309934 k!2843)))))

(declare-fun b!665236 () Bool)

(declare-fun res!432806 () Bool)

(assert (=> b!665236 (=> (not res!432806) (not e!381290))))

(assert (=> b!665236 (= res!432806 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12736))))

(declare-fun b!665237 () Bool)

(declare-fun res!432795 () Bool)

(assert (=> b!665237 (=> res!432795 e!381297)))

(assert (=> b!665237 (= res!432795 (not (noDuplicate!563 lt!309934)))))

(declare-fun b!665238 () Bool)

(declare-fun res!432801 () Bool)

(assert (=> b!665238 (=> (not res!432801) (not e!381290))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!665238 (= res!432801 (validKeyInArray!0 k!2843))))

(declare-fun b!665239 () Bool)

(declare-fun res!432792 () Bool)

(assert (=> b!665239 (=> (not res!432792) (not e!381290))))

(assert (=> b!665239 (= res!432792 (not (contains!3316 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!665240 () Bool)

(declare-fun e!381294 () Bool)

(assert (=> b!665240 (= e!381294 (not (contains!3316 acc!681 k!2843)))))

(declare-fun b!665241 () Bool)

(declare-fun res!432799 () Bool)

(assert (=> b!665241 (=> res!432799 e!381297)))

(assert (=> b!665241 (= res!432799 (not (subseq!55 acc!681 lt!309934)))))

(declare-fun b!665242 () Bool)

(declare-fun Unit!23218 () Unit!23215)

(assert (=> b!665242 (= e!381296 Unit!23218)))

(declare-fun res!432800 () Bool)

(assert (=> start!59964 (=> (not res!432800) (not e!381290))))

(assert (=> start!59964 (= res!432800 (and (bvslt (size!19062 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19062 a!3626))))))

(assert (=> start!59964 e!381290))

(assert (=> start!59964 true))

(declare-fun array_inv!14494 (array!39011) Bool)

(assert (=> start!59964 (array_inv!14494 a!3626)))

(declare-fun b!665243 () Bool)

(declare-fun res!432797 () Bool)

(assert (=> b!665243 (=> (not res!432797) (not e!381290))))

(assert (=> b!665243 (= res!432797 (not (contains!3316 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!665244 () Bool)

(assert (=> b!665244 (= e!381290 (not e!381297))))

(declare-fun res!432803 () Bool)

(assert (=> b!665244 (=> res!432803 e!381297)))

(assert (=> b!665244 (= res!432803 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!53 (List!12739 (_ BitVec 64)) List!12739)

(assert (=> b!665244 (= (-!53 lt!309934 k!2843) acc!681)))

(assert (=> b!665244 (= lt!309934 ($colon$colon!187 acc!681 k!2843))))

(declare-fun lt!309941 () Unit!23215)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12739) Unit!23215)

(assert (=> b!665244 (= lt!309941 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(assert (=> b!665244 (subseq!55 acc!681 acc!681)))

(declare-fun lt!309936 () Unit!23215)

(assert (=> b!665244 (= lt!309936 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!665244 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!309935 () Unit!23215)

(assert (=> b!665244 (= lt!309935 e!381292)))

(declare-fun c!76585 () Bool)

(assert (=> b!665244 (= c!76585 (validKeyInArray!0 (select (arr!18698 a!3626) from!3004)))))

(declare-fun lt!309943 () Unit!23215)

(assert (=> b!665244 (= lt!309943 e!381296)))

(declare-fun c!76586 () Bool)

(declare-fun lt!309942 () Bool)

(assert (=> b!665244 (= c!76586 lt!309942)))

(declare-fun arrayContainsKey!0 (array!39011 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!665244 (= lt!309942 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!665244 (arrayContainsKey!0 (array!39012 (store (arr!18698 a!3626) i!1382 k!2843) (size!19062 a!3626)) k!2843 from!3004)))

(declare-fun b!665245 () Bool)

(declare-fun res!432804 () Bool)

(assert (=> b!665245 (=> res!432804 e!381297)))

(assert (=> b!665245 (= res!432804 lt!309942)))

(declare-fun b!665246 () Bool)

(declare-fun res!432808 () Bool)

(assert (=> b!665246 (=> res!432808 e!381297)))

(assert (=> b!665246 (= res!432808 (contains!3316 lt!309934 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!665247 () Bool)

(declare-fun Unit!23219 () Unit!23215)

(assert (=> b!665247 (= e!381292 Unit!23219)))

(declare-fun b!665248 () Bool)

(declare-fun res!432793 () Bool)

(assert (=> b!665248 (=> (not res!432793) (not e!381290))))

(assert (=> b!665248 (= res!432793 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19062 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!665249 () Bool)

(declare-fun res!432809 () Bool)

(assert (=> b!665249 (=> (not res!432809) (not e!381290))))

(assert (=> b!665249 (= res!432809 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!665250 () Bool)

(declare-fun res!432798 () Bool)

(assert (=> b!665250 (=> (not res!432798) (not e!381290))))

(assert (=> b!665250 (= res!432798 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!665251 () Bool)

(assert (=> b!665251 (= e!381293 e!381294)))

(declare-fun res!432812 () Bool)

(assert (=> b!665251 (=> (not res!432812) (not e!381294))))

(assert (=> b!665251 (= res!432812 (bvsle from!3004 i!1382))))

(declare-fun b!665252 () Bool)

(declare-fun res!432802 () Bool)

(assert (=> b!665252 (=> (not res!432802) (not e!381290))))

(assert (=> b!665252 (= res!432802 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19062 a!3626))))))

(assert (= (and start!59964 res!432800) b!665231))

(assert (= (and b!665231 res!432794) b!665239))

(assert (= (and b!665239 res!432792) b!665243))

(assert (= (and b!665243 res!432797) b!665230))

(assert (= (and b!665230 res!432810) b!665232))

(assert (= (and b!665230 (not res!432796)) b!665251))

(assert (= (and b!665251 res!432812) b!665240))

(assert (= (and b!665230 res!432805) b!665236))

(assert (= (and b!665236 res!432806) b!665250))

(assert (= (and b!665250 res!432798) b!665252))

(assert (= (and b!665252 res!432802) b!665238))

(assert (= (and b!665238 res!432801) b!665249))

(assert (= (and b!665249 res!432809) b!665248))

(assert (= (and b!665248 res!432793) b!665244))

(assert (= (and b!665244 c!76586) b!665228))

(assert (= (and b!665244 (not c!76586)) b!665242))

(assert (= (and b!665244 c!76585) b!665233))

(assert (= (and b!665244 (not c!76585)) b!665247))

(assert (= (and b!665244 (not res!432803)) b!665237))

(assert (= (and b!665237 (not res!432795)) b!665245))

(assert (= (and b!665245 (not res!432804)) b!665229))

(assert (= (and b!665229 (not res!432811)) b!665241))

(assert (= (and b!665241 (not res!432799)) b!665235))

(assert (= (and b!665235 (not res!432807)) b!665246))

(assert (= (and b!665246 (not res!432808)) b!665234))

(declare-fun m!636333 () Bool)

(assert (=> b!665239 m!636333))

(declare-fun m!636335 () Bool)

(assert (=> b!665237 m!636335))

(declare-fun m!636337 () Bool)

(assert (=> b!665250 m!636337))

(declare-fun m!636339 () Bool)

(assert (=> b!665234 m!636339))

(declare-fun m!636341 () Bool)

(assert (=> b!665236 m!636341))

(declare-fun m!636343 () Bool)

(assert (=> b!665238 m!636343))

(declare-fun m!636345 () Bool)

(assert (=> b!665235 m!636345))

(declare-fun m!636347 () Bool)

(assert (=> b!665240 m!636347))

(declare-fun m!636349 () Bool)

(assert (=> b!665241 m!636349))

(assert (=> b!665229 m!636347))

(assert (=> b!665232 m!636347))

(declare-fun m!636351 () Bool)

(assert (=> b!665233 m!636351))

(declare-fun m!636353 () Bool)

(assert (=> b!665233 m!636353))

(declare-fun m!636355 () Bool)

(assert (=> b!665233 m!636355))

(declare-fun m!636357 () Bool)

(assert (=> b!665233 m!636357))

(assert (=> b!665233 m!636353))

(assert (=> b!665233 m!636355))

(declare-fun m!636359 () Bool)

(assert (=> b!665233 m!636359))

(declare-fun m!636361 () Bool)

(assert (=> b!665233 m!636361))

(declare-fun m!636363 () Bool)

(assert (=> b!665231 m!636363))

(declare-fun m!636365 () Bool)

(assert (=> start!59964 m!636365))

(declare-fun m!636367 () Bool)

(assert (=> b!665246 m!636367))

(assert (=> b!665244 m!636351))

(assert (=> b!665244 m!636353))

(declare-fun m!636369 () Bool)

(assert (=> b!665244 m!636369))

(declare-fun m!636371 () Bool)

(assert (=> b!665244 m!636371))

(assert (=> b!665244 m!636359))

(declare-fun m!636373 () Bool)

(assert (=> b!665244 m!636373))

(declare-fun m!636375 () Bool)

(assert (=> b!665244 m!636375))

(declare-fun m!636377 () Bool)

(assert (=> b!665244 m!636377))

(assert (=> b!665244 m!636353))

(declare-fun m!636379 () Bool)

(assert (=> b!665244 m!636379))

(declare-fun m!636381 () Bool)

(assert (=> b!665244 m!636381))

(assert (=> b!665244 m!636361))

(declare-fun m!636383 () Bool)

(assert (=> b!665228 m!636383))

(declare-fun m!636385 () Bool)

(assert (=> b!665243 m!636385))

(declare-fun m!636387 () Bool)

(assert (=> b!665249 m!636387))

(push 1)

(assert (not b!665243))

(assert (not b!665228))

(assert (not b!665239))

(assert (not b!665238))

(assert (not b!665233))

(assert (not b!665229))

(assert (not b!665240))

(assert (not b!665244))

(assert (not start!59964))

(assert (not b!665236))

(assert (not b!665235))

(assert (not b!665249))

(assert (not b!665237))

(assert (not b!665250))

(assert (not b!665231))

(assert (not b!665246))

(assert (not b!665232))

(assert (not b!665241))

(assert (not b!665234))

(check-sat)

