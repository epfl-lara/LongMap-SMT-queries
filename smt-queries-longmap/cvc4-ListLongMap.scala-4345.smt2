; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60102 () Bool)

(assert start!60102)

(declare-fun b!670429 () Bool)

(declare-fun e!383321 () Bool)

(declare-datatypes ((List!12808 0))(
  ( (Nil!12805) (Cons!12804 (h!13849 (_ BitVec 64)) (t!19036 List!12808)) )
))
(declare-fun lt!312033 () List!12808)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3385 (List!12808 (_ BitVec 64)) Bool)

(assert (=> b!670429 (= e!383321 (not (contains!3385 lt!312033 k!2843)))))

(declare-fun res!437184 () Bool)

(declare-fun e!383330 () Bool)

(assert (=> start!60102 (=> (not res!437184) (not e!383330))))

(declare-datatypes ((array!39149 0))(
  ( (array!39150 (arr!18767 (Array (_ BitVec 32) (_ BitVec 64))) (size!19131 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39149)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!60102 (= res!437184 (and (bvslt (size!19131 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19131 a!3626))))))

(assert (=> start!60102 e!383330))

(assert (=> start!60102 true))

(declare-fun array_inv!14563 (array!39149) Bool)

(assert (=> start!60102 (array_inv!14563 a!3626)))

(declare-fun b!670430 () Bool)

(declare-fun res!437174 () Bool)

(assert (=> b!670430 (=> (not res!437174) (not e!383330))))

(declare-fun arrayContainsKey!0 (array!39149 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!670430 (= res!437174 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!670431 () Bool)

(declare-datatypes ((Unit!23560 0))(
  ( (Unit!23561) )
))
(declare-fun e!383322 () Unit!23560)

(declare-fun Unit!23562 () Unit!23560)

(assert (=> b!670431 (= e!383322 Unit!23562)))

(declare-fun lt!312037 () Unit!23560)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39149 (_ BitVec 64) (_ BitVec 32)) Unit!23560)

(assert (=> b!670431 (= lt!312037 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!670431 false))

(declare-fun b!670432 () Bool)

(declare-fun Unit!23563 () Unit!23560)

(assert (=> b!670432 (= e!383322 Unit!23563)))

(declare-fun b!670433 () Bool)

(declare-fun res!437176 () Bool)

(assert (=> b!670433 (=> (not res!437176) (not e!383330))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!670433 (= res!437176 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19131 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!670434 () Bool)

(declare-fun e!383324 () Bool)

(declare-fun e!383323 () Bool)

(assert (=> b!670434 (= e!383324 e!383323)))

(declare-fun res!437172 () Bool)

(assert (=> b!670434 (=> (not res!437172) (not e!383323))))

(assert (=> b!670434 (= res!437172 (bvsle from!3004 i!1382))))

(declare-fun b!670435 () Bool)

(declare-fun res!437170 () Bool)

(assert (=> b!670435 (=> (not res!437170) (not e!383330))))

(declare-fun acc!681 () List!12808)

(declare-fun noDuplicate!632 (List!12808) Bool)

(assert (=> b!670435 (= res!437170 (noDuplicate!632 acc!681))))

(declare-fun b!670436 () Bool)

(declare-fun res!437186 () Bool)

(assert (=> b!670436 (=> (not res!437186) (not e!383330))))

(assert (=> b!670436 (= res!437186 (not (contains!3385 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!670437 () Bool)

(declare-fun e!383327 () Bool)

(assert (=> b!670437 (= e!383330 (not e!383327))))

(declare-fun res!437173 () Bool)

(assert (=> b!670437 (=> res!437173 e!383327)))

(assert (=> b!670437 (= res!437173 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun arrayNoDuplicates!0 (array!39149 (_ BitVec 32) List!12808) Bool)

(assert (=> b!670437 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!312033)))

(declare-fun lt!312036 () Unit!23560)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39149 (_ BitVec 64) (_ BitVec 32) List!12808 List!12808) Unit!23560)

(assert (=> b!670437 (= lt!312036 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!312033))))

(declare-fun -!122 (List!12808 (_ BitVec 64)) List!12808)

(assert (=> b!670437 (= (-!122 lt!312033 k!2843) acc!681)))

(declare-fun $colon$colon!256 (List!12808 (_ BitVec 64)) List!12808)

(assert (=> b!670437 (= lt!312033 ($colon$colon!256 acc!681 k!2843))))

(declare-fun lt!312032 () Unit!23560)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12808) Unit!23560)

(assert (=> b!670437 (= lt!312032 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!124 (List!12808 List!12808) Bool)

(assert (=> b!670437 (subseq!124 acc!681 acc!681)))

(declare-fun lt!312038 () Unit!23560)

(declare-fun lemmaListSubSeqRefl!0 (List!12808) Unit!23560)

(assert (=> b!670437 (= lt!312038 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!670437 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!312040 () Unit!23560)

(declare-fun e!383325 () Unit!23560)

(assert (=> b!670437 (= lt!312040 e!383325)))

(declare-fun c!77000 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!670437 (= c!77000 (validKeyInArray!0 (select (arr!18767 a!3626) from!3004)))))

(declare-fun lt!312034 () Unit!23560)

(assert (=> b!670437 (= lt!312034 e!383322)))

(declare-fun c!76999 () Bool)

(assert (=> b!670437 (= c!76999 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun lt!312031 () array!39149)

(assert (=> b!670437 (arrayContainsKey!0 lt!312031 k!2843 from!3004)))

(assert (=> b!670437 (= lt!312031 (array!39150 (store (arr!18767 a!3626) i!1382 k!2843) (size!19131 a!3626)))))

(declare-fun b!670438 () Bool)

(declare-fun e!383328 () Bool)

(assert (=> b!670438 (= e!383328 (contains!3385 acc!681 k!2843))))

(declare-fun b!670439 () Bool)

(declare-fun res!437166 () Bool)

(assert (=> b!670439 (=> res!437166 e!383327)))

(assert (=> b!670439 (= res!437166 (contains!3385 lt!312033 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!670440 () Bool)

(declare-fun e!383331 () Bool)

(declare-fun e!383326 () Bool)

(assert (=> b!670440 (= e!383331 e!383326)))

(declare-fun res!437171 () Bool)

(assert (=> b!670440 (=> res!437171 e!383326)))

(assert (=> b!670440 (= res!437171 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!670441 () Bool)

(declare-fun res!437165 () Bool)

(assert (=> b!670441 (=> (not res!437165) (not e!383330))))

(assert (=> b!670441 (= res!437165 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!670442 () Bool)

(declare-fun lt!312035 () Unit!23560)

(assert (=> b!670442 (= e!383325 lt!312035)))

(declare-fun lt!312030 () Unit!23560)

(assert (=> b!670442 (= lt!312030 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!670442 (subseq!124 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39149 List!12808 List!12808 (_ BitVec 32)) Unit!23560)

(assert (=> b!670442 (= lt!312035 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!256 acc!681 (select (arr!18767 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!670442 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!670443 () Bool)

(assert (=> b!670443 (= e!383323 (not (contains!3385 acc!681 k!2843)))))

(declare-fun b!670444 () Bool)

(declare-fun res!437178 () Bool)

(assert (=> b!670444 (=> res!437178 e!383327)))

(assert (=> b!670444 (= res!437178 e!383331)))

(declare-fun res!437175 () Bool)

(assert (=> b!670444 (=> (not res!437175) (not e!383331))))

(assert (=> b!670444 (= res!437175 e!383321)))

(declare-fun res!437169 () Bool)

(assert (=> b!670444 (=> res!437169 e!383321)))

(assert (=> b!670444 (= res!437169 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!670445 () Bool)

(assert (=> b!670445 (= e!383326 (contains!3385 lt!312033 k!2843))))

(declare-fun b!670446 () Bool)

(declare-fun res!437167 () Bool)

(assert (=> b!670446 (=> res!437167 e!383327)))

(assert (=> b!670446 (= res!437167 (not (noDuplicate!632 lt!312033)))))

(declare-fun b!670447 () Bool)

(declare-fun Unit!23564 () Unit!23560)

(assert (=> b!670447 (= e!383325 Unit!23564)))

(declare-fun b!670448 () Bool)

(declare-fun res!437168 () Bool)

(assert (=> b!670448 (=> (not res!437168) (not e!383330))))

(assert (=> b!670448 (= res!437168 e!383324)))

(declare-fun res!437181 () Bool)

(assert (=> b!670448 (=> res!437181 e!383324)))

(assert (=> b!670448 (= res!437181 e!383328)))

(declare-fun res!437182 () Bool)

(assert (=> b!670448 (=> (not res!437182) (not e!383328))))

(assert (=> b!670448 (= res!437182 (bvsgt from!3004 i!1382))))

(declare-fun b!670449 () Bool)

(declare-fun res!437183 () Bool)

(assert (=> b!670449 (=> (not res!437183) (not e!383330))))

(assert (=> b!670449 (= res!437183 (not (contains!3385 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!670450 () Bool)

(declare-fun res!437177 () Bool)

(assert (=> b!670450 (=> (not res!437177) (not e!383330))))

(assert (=> b!670450 (= res!437177 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19131 a!3626))))))

(declare-fun b!670451 () Bool)

(assert (=> b!670451 (= e!383327 true)))

(assert (=> b!670451 (arrayNoDuplicates!0 lt!312031 (bvadd #b00000000000000000000000000000001 from!3004) lt!312033)))

(declare-fun lt!312039 () Unit!23560)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39149 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12808) Unit!23560)

(assert (=> b!670451 (= lt!312039 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) lt!312033))))

(declare-fun b!670452 () Bool)

(declare-fun res!437180 () Bool)

(assert (=> b!670452 (=> (not res!437180) (not e!383330))))

(assert (=> b!670452 (= res!437180 (validKeyInArray!0 k!2843))))

(declare-fun b!670453 () Bool)

(declare-fun res!437179 () Bool)

(assert (=> b!670453 (=> res!437179 e!383327)))

(assert (=> b!670453 (= res!437179 (contains!3385 lt!312033 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!670454 () Bool)

(declare-fun res!437185 () Bool)

(assert (=> b!670454 (=> (not res!437185) (not e!383330))))

(assert (=> b!670454 (= res!437185 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12805))))

(assert (= (and start!60102 res!437184) b!670435))

(assert (= (and b!670435 res!437170) b!670436))

(assert (= (and b!670436 res!437186) b!670449))

(assert (= (and b!670449 res!437183) b!670448))

(assert (= (and b!670448 res!437182) b!670438))

(assert (= (and b!670448 (not res!437181)) b!670434))

(assert (= (and b!670434 res!437172) b!670443))

(assert (= (and b!670448 res!437168) b!670454))

(assert (= (and b!670454 res!437185) b!670441))

(assert (= (and b!670441 res!437165) b!670450))

(assert (= (and b!670450 res!437177) b!670452))

(assert (= (and b!670452 res!437180) b!670430))

(assert (= (and b!670430 res!437174) b!670433))

(assert (= (and b!670433 res!437176) b!670437))

(assert (= (and b!670437 c!76999) b!670431))

(assert (= (and b!670437 (not c!76999)) b!670432))

(assert (= (and b!670437 c!77000) b!670442))

(assert (= (and b!670437 (not c!77000)) b!670447))

(assert (= (and b!670437 (not res!437173)) b!670446))

(assert (= (and b!670446 (not res!437167)) b!670439))

(assert (= (and b!670439 (not res!437166)) b!670453))

(assert (= (and b!670453 (not res!437179)) b!670444))

(assert (= (and b!670444 (not res!437169)) b!670429))

(assert (= (and b!670444 res!437175) b!670440))

(assert (= (and b!670440 (not res!437171)) b!670445))

(assert (= (and b!670444 (not res!437178)) b!670451))

(declare-fun m!640311 () Bool)

(assert (=> b!670429 m!640311))

(assert (=> b!670445 m!640311))

(declare-fun m!640313 () Bool)

(assert (=> b!670439 m!640313))

(declare-fun m!640315 () Bool)

(assert (=> b!670452 m!640315))

(declare-fun m!640317 () Bool)

(assert (=> b!670438 m!640317))

(declare-fun m!640319 () Bool)

(assert (=> b!670435 m!640319))

(declare-fun m!640321 () Bool)

(assert (=> start!60102 m!640321))

(declare-fun m!640323 () Bool)

(assert (=> b!670454 m!640323))

(declare-fun m!640325 () Bool)

(assert (=> b!670431 m!640325))

(declare-fun m!640327 () Bool)

(assert (=> b!670436 m!640327))

(declare-fun m!640329 () Bool)

(assert (=> b!670449 m!640329))

(declare-fun m!640331 () Bool)

(assert (=> b!670430 m!640331))

(assert (=> b!670443 m!640317))

(declare-fun m!640333 () Bool)

(assert (=> b!670441 m!640333))

(declare-fun m!640335 () Bool)

(assert (=> b!670451 m!640335))

(declare-fun m!640337 () Bool)

(assert (=> b!670451 m!640337))

(declare-fun m!640339 () Bool)

(assert (=> b!670437 m!640339))

(declare-fun m!640341 () Bool)

(assert (=> b!670437 m!640341))

(declare-fun m!640343 () Bool)

(assert (=> b!670437 m!640343))

(declare-fun m!640345 () Bool)

(assert (=> b!670437 m!640345))

(declare-fun m!640347 () Bool)

(assert (=> b!670437 m!640347))

(assert (=> b!670437 m!640341))

(declare-fun m!640349 () Bool)

(assert (=> b!670437 m!640349))

(declare-fun m!640351 () Bool)

(assert (=> b!670437 m!640351))

(declare-fun m!640353 () Bool)

(assert (=> b!670437 m!640353))

(declare-fun m!640355 () Bool)

(assert (=> b!670437 m!640355))

(declare-fun m!640357 () Bool)

(assert (=> b!670437 m!640357))

(declare-fun m!640359 () Bool)

(assert (=> b!670437 m!640359))

(declare-fun m!640361 () Bool)

(assert (=> b!670437 m!640361))

(declare-fun m!640363 () Bool)

(assert (=> b!670437 m!640363))

(declare-fun m!640365 () Bool)

(assert (=> b!670446 m!640365))

(declare-fun m!640367 () Bool)

(assert (=> b!670453 m!640367))

(assert (=> b!670442 m!640339))

(assert (=> b!670442 m!640341))

(declare-fun m!640369 () Bool)

(assert (=> b!670442 m!640369))

(declare-fun m!640371 () Bool)

(assert (=> b!670442 m!640371))

(assert (=> b!670442 m!640341))

(assert (=> b!670442 m!640369))

(assert (=> b!670442 m!640347))

(assert (=> b!670442 m!640351))

(push 1)

(assert (not b!670438))

(assert (not b!670431))

(assert (not b!670437))

(assert (not b!670443))

(assert (not b!670435))

(assert (not b!670453))

(assert (not b!670454))

(assert (not start!60102))

(assert (not b!670430))

(assert (not b!670442))

(assert (not b!670452))

(assert (not b!670445))

(assert (not b!670451))

(assert (not b!670436))

(assert (not b!670446))

(assert (not b!670439))

(assert (not b!670429))

(assert (not b!670449))

(assert (not b!670441))

(check-sat)

(pop 1)

(push 1)

(check-sat)

