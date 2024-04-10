; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60506 () Bool)

(assert start!60506)

(declare-fun b!680188 () Bool)

(declare-fun res!446485 () Bool)

(declare-fun e!387432 () Bool)

(assert (=> b!680188 (=> (not res!446485) (not e!387432))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!680188 (= res!446485 (validKeyInArray!0 k!2843))))

(declare-fun b!680189 () Bool)

(declare-fun res!446476 () Bool)

(assert (=> b!680189 (=> (not res!446476) (not e!387432))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39487 0))(
  ( (array!39488 (arr!18933 (Array (_ BitVec 32) (_ BitVec 64))) (size!19297 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39487)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!680189 (= res!446476 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19297 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!680190 () Bool)

(declare-fun e!387436 () Bool)

(assert (=> b!680190 (= e!387432 (not e!387436))))

(declare-fun res!446474 () Bool)

(assert (=> b!680190 (=> res!446474 e!387436)))

(assert (=> b!680190 (= res!446474 (not (validKeyInArray!0 (select (arr!18933 a!3626) from!3004))))))

(declare-datatypes ((Unit!23850 0))(
  ( (Unit!23851) )
))
(declare-fun lt!313042 () Unit!23850)

(declare-fun e!387437 () Unit!23850)

(assert (=> b!680190 (= lt!313042 e!387437)))

(declare-fun c!77225 () Bool)

(declare-fun arrayContainsKey!0 (array!39487 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!680190 (= c!77225 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!680190 (arrayContainsKey!0 (array!39488 (store (arr!18933 a!3626) i!1382 k!2843) (size!19297 a!3626)) k!2843 from!3004)))

(declare-fun b!680191 () Bool)

(declare-fun res!446481 () Bool)

(assert (=> b!680191 (=> (not res!446481) (not e!387432))))

(declare-datatypes ((List!12974 0))(
  ( (Nil!12971) (Cons!12970 (h!14015 (_ BitVec 64)) (t!19202 List!12974)) )
))
(declare-fun acc!681 () List!12974)

(declare-fun arrayNoDuplicates!0 (array!39487 (_ BitVec 32) List!12974) Bool)

(assert (=> b!680191 (= res!446481 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!680192 () Bool)

(declare-fun Unit!23852 () Unit!23850)

(assert (=> b!680192 (= e!387437 Unit!23852)))

(declare-fun lt!313041 () Unit!23850)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39487 (_ BitVec 64) (_ BitVec 32)) Unit!23850)

(assert (=> b!680192 (= lt!313041 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!680192 false))

(declare-fun b!680193 () Bool)

(declare-fun Unit!23853 () Unit!23850)

(assert (=> b!680193 (= e!387437 Unit!23853)))

(declare-fun b!680194 () Bool)

(declare-fun res!446473 () Bool)

(assert (=> b!680194 (=> (not res!446473) (not e!387432))))

(assert (=> b!680194 (= res!446473 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12971))))

(declare-fun b!680195 () Bool)

(declare-fun res!446479 () Bool)

(assert (=> b!680195 (=> (not res!446479) (not e!387432))))

(declare-fun e!387435 () Bool)

(assert (=> b!680195 (= res!446479 e!387435)))

(declare-fun res!446480 () Bool)

(assert (=> b!680195 (=> res!446480 e!387435)))

(declare-fun e!387433 () Bool)

(assert (=> b!680195 (= res!446480 e!387433)))

(declare-fun res!446482 () Bool)

(assert (=> b!680195 (=> (not res!446482) (not e!387433))))

(assert (=> b!680195 (= res!446482 (bvsgt from!3004 i!1382))))

(declare-fun b!680196 () Bool)

(declare-fun res!446475 () Bool)

(assert (=> b!680196 (=> (not res!446475) (not e!387432))))

(assert (=> b!680196 (= res!446475 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19297 a!3626))))))

(declare-fun b!680197 () Bool)

(assert (=> b!680197 (= e!387436 true)))

(declare-fun subseq!137 (List!12974 List!12974) Bool)

(assert (=> b!680197 (subseq!137 acc!681 acc!681)))

(declare-fun lt!313040 () Unit!23850)

(declare-fun lemmaListSubSeqRefl!0 (List!12974) Unit!23850)

(assert (=> b!680197 (= lt!313040 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!680198 () Bool)

(declare-fun e!387434 () Bool)

(declare-fun contains!3551 (List!12974 (_ BitVec 64)) Bool)

(assert (=> b!680198 (= e!387434 (not (contains!3551 acc!681 k!2843)))))

(declare-fun b!680199 () Bool)

(declare-fun res!446484 () Bool)

(assert (=> b!680199 (=> (not res!446484) (not e!387432))))

(assert (=> b!680199 (= res!446484 (not (contains!3551 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!680201 () Bool)

(declare-fun res!446478 () Bool)

(assert (=> b!680201 (=> (not res!446478) (not e!387432))))

(declare-fun noDuplicate!798 (List!12974) Bool)

(assert (=> b!680201 (= res!446478 (noDuplicate!798 acc!681))))

(declare-fun b!680200 () Bool)

(declare-fun res!446477 () Bool)

(assert (=> b!680200 (=> (not res!446477) (not e!387432))))

(assert (=> b!680200 (= res!446477 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun res!446486 () Bool)

(assert (=> start!60506 (=> (not res!446486) (not e!387432))))

(assert (=> start!60506 (= res!446486 (and (bvslt (size!19297 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19297 a!3626))))))

(assert (=> start!60506 e!387432))

(assert (=> start!60506 true))

(declare-fun array_inv!14729 (array!39487) Bool)

(assert (=> start!60506 (array_inv!14729 a!3626)))

(declare-fun b!680202 () Bool)

(declare-fun res!446472 () Bool)

(assert (=> b!680202 (=> (not res!446472) (not e!387432))))

(assert (=> b!680202 (= res!446472 (not (contains!3551 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!680203 () Bool)

(assert (=> b!680203 (= e!387435 e!387434)))

(declare-fun res!446483 () Bool)

(assert (=> b!680203 (=> (not res!446483) (not e!387434))))

(assert (=> b!680203 (= res!446483 (bvsle from!3004 i!1382))))

(declare-fun b!680204 () Bool)

(assert (=> b!680204 (= e!387433 (contains!3551 acc!681 k!2843))))

(assert (= (and start!60506 res!446486) b!680201))

(assert (= (and b!680201 res!446478) b!680202))

(assert (= (and b!680202 res!446472) b!680199))

(assert (= (and b!680199 res!446484) b!680195))

(assert (= (and b!680195 res!446482) b!680204))

(assert (= (and b!680195 (not res!446480)) b!680203))

(assert (= (and b!680203 res!446483) b!680198))

(assert (= (and b!680195 res!446479) b!680194))

(assert (= (and b!680194 res!446473) b!680191))

(assert (= (and b!680191 res!446481) b!680196))

(assert (= (and b!680196 res!446475) b!680188))

(assert (= (and b!680188 res!446485) b!680200))

(assert (= (and b!680200 res!446477) b!680189))

(assert (= (and b!680189 res!446476) b!680190))

(assert (= (and b!680190 c!77225) b!680192))

(assert (= (and b!680190 (not c!77225)) b!680193))

(assert (= (and b!680190 (not res!446474)) b!680197))

(declare-fun m!645323 () Bool)

(assert (=> b!680191 m!645323))

(declare-fun m!645325 () Bool)

(assert (=> b!680198 m!645325))

(declare-fun m!645327 () Bool)

(assert (=> b!680199 m!645327))

(declare-fun m!645329 () Bool)

(assert (=> b!680190 m!645329))

(declare-fun m!645331 () Bool)

(assert (=> b!680190 m!645331))

(declare-fun m!645333 () Bool)

(assert (=> b!680190 m!645333))

(assert (=> b!680190 m!645329))

(declare-fun m!645335 () Bool)

(assert (=> b!680190 m!645335))

(declare-fun m!645337 () Bool)

(assert (=> b!680190 m!645337))

(declare-fun m!645339 () Bool)

(assert (=> b!680202 m!645339))

(declare-fun m!645341 () Bool)

(assert (=> b!680194 m!645341))

(declare-fun m!645343 () Bool)

(assert (=> b!680200 m!645343))

(declare-fun m!645345 () Bool)

(assert (=> b!680197 m!645345))

(declare-fun m!645347 () Bool)

(assert (=> b!680197 m!645347))

(declare-fun m!645349 () Bool)

(assert (=> start!60506 m!645349))

(declare-fun m!645351 () Bool)

(assert (=> b!680192 m!645351))

(assert (=> b!680204 m!645325))

(declare-fun m!645353 () Bool)

(assert (=> b!680188 m!645353))

(declare-fun m!645355 () Bool)

(assert (=> b!680201 m!645355))

(push 1)

(assert (not b!680201))

(assert (not b!680194))

(assert (not b!680197))

(assert (not start!60506))

(assert (not b!680204))

(assert (not b!680188))

(assert (not b!680192))

(assert (not b!680198))

(assert (not b!680190))

(assert (not b!680199))

(assert (not b!680202))

(assert (not b!680200))

(assert (not b!680191))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

