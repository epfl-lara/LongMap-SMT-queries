; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60848 () Bool)

(assert start!60848)

(declare-fun b!682111 () Bool)

(declare-fun e!388666 () Bool)

(declare-datatypes ((List!13033 0))(
  ( (Nil!13030) (Cons!13029 (h!14074 (_ BitVec 64)) (t!19267 List!13033)) )
))
(declare-fun acc!681 () List!13033)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3555 (List!13033 (_ BitVec 64)) Bool)

(assert (=> b!682111 (= e!388666 (not (not (contains!3555 acc!681 k0!2843))))))

(declare-fun subseq!158 (List!13033 List!13033) Bool)

(assert (=> b!682111 (subseq!158 acc!681 acc!681)))

(declare-datatypes ((Unit!23915 0))(
  ( (Unit!23916) )
))
(declare-fun lt!313255 () Unit!23915)

(declare-fun lemmaListSubSeqRefl!0 (List!13033) Unit!23915)

(assert (=> b!682111 (= lt!313255 (lemmaListSubSeqRefl!0 acc!681))))

(declare-datatypes ((array!39543 0))(
  ( (array!39544 (arr!18953 (Array (_ BitVec 32) (_ BitVec 64))) (size!19318 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39543)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!39543 (_ BitVec 32) List!13033) Bool)

(assert (=> b!682111 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!313252 () Unit!23915)

(declare-fun e!388668 () Unit!23915)

(assert (=> b!682111 (= lt!313252 e!388668)))

(declare-fun c!77286 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!682111 (= c!77286 (validKeyInArray!0 (select (arr!18953 a!3626) from!3004)))))

(declare-fun lt!313253 () Unit!23915)

(declare-fun e!388664 () Unit!23915)

(assert (=> b!682111 (= lt!313253 e!388664)))

(declare-fun c!77285 () Bool)

(declare-fun arrayContainsKey!0 (array!39543 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!682111 (= c!77285 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!682111 (arrayContainsKey!0 (array!39544 (store (arr!18953 a!3626) i!1382 k0!2843) (size!19318 a!3626)) k0!2843 from!3004)))

(declare-fun b!682112 () Bool)

(declare-fun res!448276 () Bool)

(assert (=> b!682112 (=> (not res!448276) (not e!388666))))

(assert (=> b!682112 (= res!448276 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!682113 () Bool)

(declare-fun Unit!23917 () Unit!23915)

(assert (=> b!682113 (= e!388664 Unit!23917)))

(declare-fun lt!313256 () Unit!23915)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39543 (_ BitVec 64) (_ BitVec 32)) Unit!23915)

(assert (=> b!682113 (= lt!313256 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!682113 false))

(declare-fun b!682114 () Bool)

(declare-fun lt!313254 () Unit!23915)

(assert (=> b!682114 (= e!388668 lt!313254)))

(declare-fun lt!313257 () Unit!23915)

(assert (=> b!682114 (= lt!313257 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!682114 (subseq!158 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39543 List!13033 List!13033 (_ BitVec 32)) Unit!23915)

(declare-fun $colon$colon!322 (List!13033 (_ BitVec 64)) List!13033)

(assert (=> b!682114 (= lt!313254 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!322 acc!681 (select (arr!18953 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!682114 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!682115 () Bool)

(declare-fun res!448285 () Bool)

(assert (=> b!682115 (=> (not res!448285) (not e!388666))))

(assert (=> b!682115 (= res!448285 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!682116 () Bool)

(declare-fun res!448283 () Bool)

(assert (=> b!682116 (=> (not res!448283) (not e!388666))))

(assert (=> b!682116 (= res!448283 (not (contains!3555 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!682117 () Bool)

(declare-fun e!388669 () Bool)

(assert (=> b!682117 (= e!388669 (contains!3555 acc!681 k0!2843))))

(declare-fun b!682118 () Bool)

(declare-fun e!388670 () Bool)

(declare-fun e!388667 () Bool)

(assert (=> b!682118 (= e!388670 e!388667)))

(declare-fun res!448281 () Bool)

(assert (=> b!682118 (=> (not res!448281) (not e!388667))))

(assert (=> b!682118 (= res!448281 (bvsle from!3004 i!1382))))

(declare-fun b!682119 () Bool)

(declare-fun res!448280 () Bool)

(assert (=> b!682119 (=> (not res!448280) (not e!388666))))

(assert (=> b!682119 (= res!448280 (validKeyInArray!0 k0!2843))))

(declare-fun b!682120 () Bool)

(declare-fun res!448275 () Bool)

(assert (=> b!682120 (=> (not res!448275) (not e!388666))))

(declare-fun noDuplicate!824 (List!13033) Bool)

(assert (=> b!682120 (= res!448275 (noDuplicate!824 acc!681))))

(declare-fun b!682121 () Bool)

(assert (=> b!682121 (= e!388667 (not (contains!3555 acc!681 k0!2843)))))

(declare-fun res!448286 () Bool)

(assert (=> start!60848 (=> (not res!448286) (not e!388666))))

(assert (=> start!60848 (= res!448286 (and (bvslt (size!19318 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19318 a!3626))))))

(assert (=> start!60848 e!388666))

(assert (=> start!60848 true))

(declare-fun array_inv!14836 (array!39543) Bool)

(assert (=> start!60848 (array_inv!14836 a!3626)))

(declare-fun b!682122 () Bool)

(declare-fun Unit!23918 () Unit!23915)

(assert (=> b!682122 (= e!388664 Unit!23918)))

(declare-fun b!682123 () Bool)

(declare-fun res!448279 () Bool)

(assert (=> b!682123 (=> (not res!448279) (not e!388666))))

(assert (=> b!682123 (= res!448279 e!388670)))

(declare-fun res!448287 () Bool)

(assert (=> b!682123 (=> res!448287 e!388670)))

(assert (=> b!682123 (= res!448287 e!388669)))

(declare-fun res!448288 () Bool)

(assert (=> b!682123 (=> (not res!448288) (not e!388669))))

(assert (=> b!682123 (= res!448288 (bvsgt from!3004 i!1382))))

(declare-fun b!682124 () Bool)

(declare-fun res!448284 () Bool)

(assert (=> b!682124 (=> (not res!448284) (not e!388666))))

(assert (=> b!682124 (= res!448284 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13030))))

(declare-fun b!682125 () Bool)

(declare-fun res!448282 () Bool)

(assert (=> b!682125 (=> (not res!448282) (not e!388666))))

(assert (=> b!682125 (= res!448282 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19318 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!682126 () Bool)

(declare-fun Unit!23919 () Unit!23915)

(assert (=> b!682126 (= e!388668 Unit!23919)))

(declare-fun b!682127 () Bool)

(declare-fun res!448278 () Bool)

(assert (=> b!682127 (=> (not res!448278) (not e!388666))))

(assert (=> b!682127 (= res!448278 (not (contains!3555 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!682128 () Bool)

(declare-fun res!448277 () Bool)

(assert (=> b!682128 (=> (not res!448277) (not e!388666))))

(assert (=> b!682128 (= res!448277 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19318 a!3626))))))

(assert (= (and start!60848 res!448286) b!682120))

(assert (= (and b!682120 res!448275) b!682127))

(assert (= (and b!682127 res!448278) b!682116))

(assert (= (and b!682116 res!448283) b!682123))

(assert (= (and b!682123 res!448288) b!682117))

(assert (= (and b!682123 (not res!448287)) b!682118))

(assert (= (and b!682118 res!448281) b!682121))

(assert (= (and b!682123 res!448279) b!682124))

(assert (= (and b!682124 res!448284) b!682112))

(assert (= (and b!682112 res!448276) b!682128))

(assert (= (and b!682128 res!448277) b!682119))

(assert (= (and b!682119 res!448280) b!682115))

(assert (= (and b!682115 res!448285) b!682125))

(assert (= (and b!682125 res!448282) b!682111))

(assert (= (and b!682111 c!77285) b!682113))

(assert (= (and b!682111 (not c!77285)) b!682122))

(assert (= (and b!682111 c!77286) b!682114))

(assert (= (and b!682111 (not c!77286)) b!682126))

(declare-fun m!646335 () Bool)

(assert (=> b!682113 m!646335))

(declare-fun m!646337 () Bool)

(assert (=> b!682124 m!646337))

(declare-fun m!646339 () Bool)

(assert (=> b!682120 m!646339))

(declare-fun m!646341 () Bool)

(assert (=> b!682116 m!646341))

(declare-fun m!646343 () Bool)

(assert (=> start!60848 m!646343))

(declare-fun m!646345 () Bool)

(assert (=> b!682112 m!646345))

(declare-fun m!646347 () Bool)

(assert (=> b!682117 m!646347))

(declare-fun m!646349 () Bool)

(assert (=> b!682115 m!646349))

(declare-fun m!646351 () Bool)

(assert (=> b!682114 m!646351))

(declare-fun m!646353 () Bool)

(assert (=> b!682114 m!646353))

(declare-fun m!646355 () Bool)

(assert (=> b!682114 m!646355))

(declare-fun m!646357 () Bool)

(assert (=> b!682114 m!646357))

(assert (=> b!682114 m!646353))

(assert (=> b!682114 m!646355))

(declare-fun m!646359 () Bool)

(assert (=> b!682114 m!646359))

(declare-fun m!646361 () Bool)

(assert (=> b!682114 m!646361))

(assert (=> b!682121 m!646347))

(declare-fun m!646363 () Bool)

(assert (=> b!682127 m!646363))

(declare-fun m!646365 () Bool)

(assert (=> b!682119 m!646365))

(assert (=> b!682111 m!646351))

(assert (=> b!682111 m!646353))

(assert (=> b!682111 m!646347))

(declare-fun m!646367 () Bool)

(assert (=> b!682111 m!646367))

(assert (=> b!682111 m!646359))

(declare-fun m!646369 () Bool)

(assert (=> b!682111 m!646369))

(assert (=> b!682111 m!646353))

(declare-fun m!646371 () Bool)

(assert (=> b!682111 m!646371))

(declare-fun m!646373 () Bool)

(assert (=> b!682111 m!646373))

(assert (=> b!682111 m!646361))

(check-sat (not b!682127) (not b!682116) (not b!682112) (not b!682113) (not start!60848) (not b!682115) (not b!682111) (not b!682124) (not b!682117) (not b!682114) (not b!682121) (not b!682119) (not b!682120))
(check-sat)
