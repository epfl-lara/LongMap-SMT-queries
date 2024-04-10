; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60504 () Bool)

(assert start!60504)

(declare-fun b!680137 () Bool)

(declare-datatypes ((Unit!23846 0))(
  ( (Unit!23847) )
))
(declare-fun e!387414 () Unit!23846)

(declare-fun Unit!23848 () Unit!23846)

(assert (=> b!680137 (= e!387414 Unit!23848)))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun lt!313033 () Unit!23846)

(declare-fun k!2843 () (_ BitVec 64))

(declare-datatypes ((array!39485 0))(
  ( (array!39486 (arr!18932 (Array (_ BitVec 32) (_ BitVec 64))) (size!19296 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39485)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39485 (_ BitVec 64) (_ BitVec 32)) Unit!23846)

(assert (=> b!680137 (= lt!313033 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!680137 false))

(declare-fun b!680138 () Bool)

(declare-fun res!446438 () Bool)

(declare-fun e!387411 () Bool)

(assert (=> b!680138 (=> (not res!446438) (not e!387411))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!680138 (= res!446438 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19296 a!3626))))))

(declare-fun b!680139 () Bool)

(declare-fun res!446427 () Bool)

(assert (=> b!680139 (=> (not res!446427) (not e!387411))))

(declare-fun e!387413 () Bool)

(assert (=> b!680139 (= res!446427 e!387413)))

(declare-fun res!446434 () Bool)

(assert (=> b!680139 (=> res!446434 e!387413)))

(declare-fun e!387416 () Bool)

(assert (=> b!680139 (= res!446434 e!387416)))

(declare-fun res!446440 () Bool)

(assert (=> b!680139 (=> (not res!446440) (not e!387416))))

(assert (=> b!680139 (= res!446440 (bvsgt from!3004 i!1382))))

(declare-fun res!446433 () Bool)

(assert (=> start!60504 (=> (not res!446433) (not e!387411))))

(assert (=> start!60504 (= res!446433 (and (bvslt (size!19296 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19296 a!3626))))))

(assert (=> start!60504 e!387411))

(assert (=> start!60504 true))

(declare-fun array_inv!14728 (array!39485) Bool)

(assert (=> start!60504 (array_inv!14728 a!3626)))

(declare-fun b!680140 () Bool)

(declare-fun e!387415 () Bool)

(assert (=> b!680140 (= e!387415 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-datatypes ((List!12973 0))(
  ( (Nil!12970) (Cons!12969 (h!14014 (_ BitVec 64)) (t!19201 List!12973)) )
))
(declare-fun acc!681 () List!12973)

(declare-fun subseq!136 (List!12973 List!12973) Bool)

(assert (=> b!680140 (subseq!136 acc!681 acc!681)))

(declare-fun lt!313031 () Unit!23846)

(declare-fun lemmaListSubSeqRefl!0 (List!12973) Unit!23846)

(assert (=> b!680140 (= lt!313031 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!680141 () Bool)

(declare-fun res!446428 () Bool)

(assert (=> b!680141 (=> (not res!446428) (not e!387411))))

(declare-fun arrayNoDuplicates!0 (array!39485 (_ BitVec 32) List!12973) Bool)

(assert (=> b!680141 (= res!446428 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12970))))

(declare-fun b!680142 () Bool)

(declare-fun res!446432 () Bool)

(assert (=> b!680142 (=> (not res!446432) (not e!387411))))

(assert (=> b!680142 (= res!446432 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19296 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!680143 () Bool)

(declare-fun res!446439 () Bool)

(assert (=> b!680143 (=> (not res!446439) (not e!387411))))

(declare-fun noDuplicate!797 (List!12973) Bool)

(assert (=> b!680143 (= res!446439 (noDuplicate!797 acc!681))))

(declare-fun b!680144 () Bool)

(declare-fun res!446436 () Bool)

(assert (=> b!680144 (=> (not res!446436) (not e!387411))))

(assert (=> b!680144 (= res!446436 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!680145 () Bool)

(assert (=> b!680145 (= e!387411 (not e!387415))))

(declare-fun res!446430 () Bool)

(assert (=> b!680145 (=> res!446430 e!387415)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!680145 (= res!446430 (not (validKeyInArray!0 (select (arr!18932 a!3626) from!3004))))))

(declare-fun lt!313032 () Unit!23846)

(assert (=> b!680145 (= lt!313032 e!387414)))

(declare-fun c!77222 () Bool)

(declare-fun arrayContainsKey!0 (array!39485 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!680145 (= c!77222 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!680145 (arrayContainsKey!0 (array!39486 (store (arr!18932 a!3626) i!1382 k!2843) (size!19296 a!3626)) k!2843 from!3004)))

(declare-fun b!680146 () Bool)

(declare-fun res!446437 () Bool)

(assert (=> b!680146 (=> (not res!446437) (not e!387411))))

(assert (=> b!680146 (= res!446437 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!680147 () Bool)

(declare-fun res!446435 () Bool)

(assert (=> b!680147 (=> (not res!446435) (not e!387411))))

(declare-fun contains!3550 (List!12973 (_ BitVec 64)) Bool)

(assert (=> b!680147 (= res!446435 (not (contains!3550 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!680148 () Bool)

(assert (=> b!680148 (= e!387416 (contains!3550 acc!681 k!2843))))

(declare-fun b!680149 () Bool)

(declare-fun res!446429 () Bool)

(assert (=> b!680149 (=> (not res!446429) (not e!387411))))

(assert (=> b!680149 (= res!446429 (not (contains!3550 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!680150 () Bool)

(declare-fun res!446431 () Bool)

(assert (=> b!680150 (=> (not res!446431) (not e!387411))))

(assert (=> b!680150 (= res!446431 (validKeyInArray!0 k!2843))))

(declare-fun b!680151 () Bool)

(declare-fun e!387417 () Bool)

(assert (=> b!680151 (= e!387417 (not (contains!3550 acc!681 k!2843)))))

(declare-fun b!680152 () Bool)

(declare-fun Unit!23849 () Unit!23846)

(assert (=> b!680152 (= e!387414 Unit!23849)))

(declare-fun b!680153 () Bool)

(assert (=> b!680153 (= e!387413 e!387417)))

(declare-fun res!446441 () Bool)

(assert (=> b!680153 (=> (not res!446441) (not e!387417))))

(assert (=> b!680153 (= res!446441 (bvsle from!3004 i!1382))))

(assert (= (and start!60504 res!446433) b!680143))

(assert (= (and b!680143 res!446439) b!680147))

(assert (= (and b!680147 res!446435) b!680149))

(assert (= (and b!680149 res!446429) b!680139))

(assert (= (and b!680139 res!446440) b!680148))

(assert (= (and b!680139 (not res!446434)) b!680153))

(assert (= (and b!680153 res!446441) b!680151))

(assert (= (and b!680139 res!446427) b!680141))

(assert (= (and b!680141 res!446428) b!680144))

(assert (= (and b!680144 res!446436) b!680138))

(assert (= (and b!680138 res!446438) b!680150))

(assert (= (and b!680150 res!446431) b!680146))

(assert (= (and b!680146 res!446437) b!680142))

(assert (= (and b!680142 res!446432) b!680145))

(assert (= (and b!680145 c!77222) b!680137))

(assert (= (and b!680145 (not c!77222)) b!680152))

(assert (= (and b!680145 (not res!446430)) b!680140))

(declare-fun m!645289 () Bool)

(assert (=> start!60504 m!645289))

(declare-fun m!645291 () Bool)

(assert (=> b!680143 m!645291))

(declare-fun m!645293 () Bool)

(assert (=> b!680149 m!645293))

(declare-fun m!645295 () Bool)

(assert (=> b!680140 m!645295))

(declare-fun m!645297 () Bool)

(assert (=> b!680140 m!645297))

(declare-fun m!645299 () Bool)

(assert (=> b!680141 m!645299))

(declare-fun m!645301 () Bool)

(assert (=> b!680147 m!645301))

(declare-fun m!645303 () Bool)

(assert (=> b!680137 m!645303))

(declare-fun m!645305 () Bool)

(assert (=> b!680144 m!645305))

(declare-fun m!645307 () Bool)

(assert (=> b!680148 m!645307))

(declare-fun m!645309 () Bool)

(assert (=> b!680150 m!645309))

(declare-fun m!645311 () Bool)

(assert (=> b!680146 m!645311))

(assert (=> b!680151 m!645307))

(declare-fun m!645313 () Bool)

(assert (=> b!680145 m!645313))

(declare-fun m!645315 () Bool)

(assert (=> b!680145 m!645315))

(declare-fun m!645317 () Bool)

(assert (=> b!680145 m!645317))

(assert (=> b!680145 m!645313))

(declare-fun m!645319 () Bool)

(assert (=> b!680145 m!645319))

(declare-fun m!645321 () Bool)

(assert (=> b!680145 m!645321))

(push 1)

(assert (not b!680146))

(assert (not b!680143))

(assert (not b!680144))

