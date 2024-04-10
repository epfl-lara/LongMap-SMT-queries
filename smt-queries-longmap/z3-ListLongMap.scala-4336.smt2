; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60046 () Bool)

(assert start!60046)

(declare-fun b!668303 () Bool)

(declare-fun e!382401 () Bool)

(declare-fun e!382399 () Bool)

(assert (=> b!668303 (= e!382401 (not e!382399))))

(declare-fun res!435390 () Bool)

(assert (=> b!668303 (=> res!435390 e!382399)))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!668303 (= res!435390 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-datatypes ((array!39093 0))(
  ( (array!39094 (arr!18739 (Array (_ BitVec 32) (_ BitVec 64))) (size!19103 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39093)

(declare-datatypes ((List!12780 0))(
  ( (Nil!12777) (Cons!12776 (h!13821 (_ BitVec 64)) (t!19008 List!12780)) )
))
(declare-fun lt!311171 () List!12780)

(declare-fun arrayNoDuplicates!0 (array!39093 (_ BitVec 32) List!12780) Bool)

(assert (=> b!668303 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!311171)))

(declare-fun acc!681 () List!12780)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-datatypes ((Unit!23420 0))(
  ( (Unit!23421) )
))
(declare-fun lt!311170 () Unit!23420)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39093 (_ BitVec 64) (_ BitVec 32) List!12780 List!12780) Unit!23420)

(assert (=> b!668303 (= lt!311170 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!311171))))

(declare-fun -!94 (List!12780 (_ BitVec 64)) List!12780)

(assert (=> b!668303 (= (-!94 lt!311171 k0!2843) acc!681)))

(declare-fun $colon$colon!228 (List!12780 (_ BitVec 64)) List!12780)

(assert (=> b!668303 (= lt!311171 ($colon$colon!228 acc!681 k0!2843))))

(declare-fun lt!311169 () Unit!23420)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12780) Unit!23420)

(assert (=> b!668303 (= lt!311169 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(declare-fun subseq!96 (List!12780 List!12780) Bool)

(assert (=> b!668303 (subseq!96 acc!681 acc!681)))

(declare-fun lt!311172 () Unit!23420)

(declare-fun lemmaListSubSeqRefl!0 (List!12780) Unit!23420)

(assert (=> b!668303 (= lt!311172 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!668303 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!311167 () Unit!23420)

(declare-fun e!382407 () Unit!23420)

(assert (=> b!668303 (= lt!311167 e!382407)))

(declare-fun c!76832 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!668303 (= c!76832 (validKeyInArray!0 (select (arr!18739 a!3626) from!3004)))))

(declare-fun lt!311164 () Unit!23420)

(declare-fun e!382402 () Unit!23420)

(assert (=> b!668303 (= lt!311164 e!382402)))

(declare-fun c!76831 () Bool)

(declare-fun arrayContainsKey!0 (array!39093 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!668303 (= c!76831 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!668303 (arrayContainsKey!0 (array!39094 (store (arr!18739 a!3626) i!1382 k0!2843) (size!19103 a!3626)) k0!2843 from!3004)))

(declare-fun b!668304 () Bool)

(declare-fun res!435384 () Bool)

(assert (=> b!668304 (=> (not res!435384) (not e!382401))))

(assert (=> b!668304 (= res!435384 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19103 a!3626)) (= from!3004 i!1382)))))

(declare-fun res!435385 () Bool)

(assert (=> start!60046 (=> (not res!435385) (not e!382401))))

(assert (=> start!60046 (= res!435385 (and (bvslt (size!19103 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19103 a!3626))))))

(assert (=> start!60046 e!382401))

(assert (=> start!60046 true))

(declare-fun array_inv!14535 (array!39093) Bool)

(assert (=> start!60046 (array_inv!14535 a!3626)))

(declare-fun b!668305 () Bool)

(declare-fun res!435389 () Bool)

(assert (=> b!668305 (=> (not res!435389) (not e!382401))))

(declare-fun contains!3357 (List!12780 (_ BitVec 64)) Bool)

(assert (=> b!668305 (= res!435389 (not (contains!3357 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!668306 () Bool)

(declare-fun res!435377 () Bool)

(assert (=> b!668306 (=> (not res!435377) (not e!382401))))

(assert (=> b!668306 (= res!435377 (not (contains!3357 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!668307 () Bool)

(declare-fun res!435376 () Bool)

(assert (=> b!668307 (=> (not res!435376) (not e!382401))))

(declare-fun noDuplicate!604 (List!12780) Bool)

(assert (=> b!668307 (= res!435376 (noDuplicate!604 acc!681))))

(declare-fun b!668308 () Bool)

(declare-fun res!435379 () Bool)

(assert (=> b!668308 (=> (not res!435379) (not e!382401))))

(assert (=> b!668308 (= res!435379 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!668309 () Bool)

(declare-fun e!382404 () Bool)

(assert (=> b!668309 (= e!382404 (not (contains!3357 acc!681 k0!2843)))))

(declare-fun b!668310 () Bool)

(declare-fun res!435391 () Bool)

(assert (=> b!668310 (=> res!435391 e!382399)))

(assert (=> b!668310 (= res!435391 (contains!3357 lt!311171 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!668311 () Bool)

(declare-fun res!435378 () Bool)

(assert (=> b!668311 (=> (not res!435378) (not e!382401))))

(assert (=> b!668311 (= res!435378 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12777))))

(declare-fun b!668312 () Bool)

(assert (=> b!668312 (= e!382399 true)))

(declare-fun lt!311168 () Bool)

(declare-fun e!382398 () Bool)

(assert (=> b!668312 (= lt!311168 e!382398)))

(declare-fun res!435386 () Bool)

(assert (=> b!668312 (=> res!435386 e!382398)))

(declare-fun e!382403 () Bool)

(assert (=> b!668312 (= res!435386 e!382403)))

(declare-fun res!435380 () Bool)

(assert (=> b!668312 (=> (not res!435380) (not e!382403))))

(assert (=> b!668312 (= res!435380 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!668313 () Bool)

(declare-fun e!382400 () Bool)

(assert (=> b!668313 (= e!382398 e!382400)))

(declare-fun res!435387 () Bool)

(assert (=> b!668313 (=> (not res!435387) (not e!382400))))

(assert (=> b!668313 (= res!435387 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!668314 () Bool)

(assert (=> b!668314 (= e!382403 (contains!3357 lt!311171 k0!2843))))

(declare-fun b!668315 () Bool)

(declare-fun res!435388 () Bool)

(assert (=> b!668315 (=> (not res!435388) (not e!382401))))

(assert (=> b!668315 (= res!435388 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!668316 () Bool)

(declare-fun e!382405 () Bool)

(assert (=> b!668316 (= e!382405 e!382404)))

(declare-fun res!435375 () Bool)

(assert (=> b!668316 (=> (not res!435375) (not e!382404))))

(assert (=> b!668316 (= res!435375 (bvsle from!3004 i!1382))))

(declare-fun b!668317 () Bool)

(declare-fun Unit!23422 () Unit!23420)

(assert (=> b!668317 (= e!382402 Unit!23422)))

(declare-fun lt!311166 () Unit!23420)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39093 (_ BitVec 64) (_ BitVec 32)) Unit!23420)

(assert (=> b!668317 (= lt!311166 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!668317 false))

(declare-fun b!668318 () Bool)

(declare-fun res!435394 () Bool)

(assert (=> b!668318 (=> res!435394 e!382399)))

(assert (=> b!668318 (= res!435394 (contains!3357 lt!311171 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!668319 () Bool)

(declare-fun e!382406 () Bool)

(assert (=> b!668319 (= e!382406 (contains!3357 acc!681 k0!2843))))

(declare-fun b!668320 () Bool)

(declare-fun res!435395 () Bool)

(assert (=> b!668320 (=> res!435395 e!382399)))

(assert (=> b!668320 (= res!435395 (not (noDuplicate!604 lt!311171)))))

(declare-fun b!668321 () Bool)

(declare-fun Unit!23423 () Unit!23420)

(assert (=> b!668321 (= e!382407 Unit!23423)))

(declare-fun b!668322 () Bool)

(assert (=> b!668322 (= e!382400 (not (contains!3357 lt!311171 k0!2843)))))

(declare-fun b!668323 () Bool)

(declare-fun res!435392 () Bool)

(assert (=> b!668323 (=> (not res!435392) (not e!382401))))

(assert (=> b!668323 (= res!435392 (validKeyInArray!0 k0!2843))))

(declare-fun b!668324 () Bool)

(declare-fun res!435381 () Bool)

(assert (=> b!668324 (=> (not res!435381) (not e!382401))))

(assert (=> b!668324 (= res!435381 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19103 a!3626))))))

(declare-fun b!668325 () Bool)

(declare-fun lt!311165 () Unit!23420)

(assert (=> b!668325 (= e!382407 lt!311165)))

(declare-fun lt!311173 () Unit!23420)

(assert (=> b!668325 (= lt!311173 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!668325 (subseq!96 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39093 List!12780 List!12780 (_ BitVec 32)) Unit!23420)

(assert (=> b!668325 (= lt!311165 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!228 acc!681 (select (arr!18739 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!668325 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!668326 () Bool)

(declare-fun Unit!23424 () Unit!23420)

(assert (=> b!668326 (= e!382402 Unit!23424)))

(declare-fun b!668327 () Bool)

(declare-fun res!435382 () Bool)

(assert (=> b!668327 (=> (not res!435382) (not e!382401))))

(assert (=> b!668327 (= res!435382 e!382405)))

(declare-fun res!435393 () Bool)

(assert (=> b!668327 (=> res!435393 e!382405)))

(assert (=> b!668327 (= res!435393 e!382406)))

(declare-fun res!435383 () Bool)

(assert (=> b!668327 (=> (not res!435383) (not e!382406))))

(assert (=> b!668327 (= res!435383 (bvsgt from!3004 i!1382))))

(assert (= (and start!60046 res!435385) b!668307))

(assert (= (and b!668307 res!435376) b!668306))

(assert (= (and b!668306 res!435377) b!668305))

(assert (= (and b!668305 res!435389) b!668327))

(assert (= (and b!668327 res!435383) b!668319))

(assert (= (and b!668327 (not res!435393)) b!668316))

(assert (= (and b!668316 res!435375) b!668309))

(assert (= (and b!668327 res!435382) b!668311))

(assert (= (and b!668311 res!435378) b!668315))

(assert (= (and b!668315 res!435388) b!668324))

(assert (= (and b!668324 res!435381) b!668323))

(assert (= (and b!668323 res!435392) b!668308))

(assert (= (and b!668308 res!435379) b!668304))

(assert (= (and b!668304 res!435384) b!668303))

(assert (= (and b!668303 c!76831) b!668317))

(assert (= (and b!668303 (not c!76831)) b!668326))

(assert (= (and b!668303 c!76832) b!668325))

(assert (= (and b!668303 (not c!76832)) b!668321))

(assert (= (and b!668303 (not res!435390)) b!668320))

(assert (= (and b!668320 (not res!435395)) b!668318))

(assert (= (and b!668318 (not res!435394)) b!668310))

(assert (= (and b!668310 (not res!435391)) b!668312))

(assert (= (and b!668312 res!435380) b!668314))

(assert (= (and b!668312 (not res!435386)) b!668313))

(assert (= (and b!668313 res!435387) b!668322))

(declare-fun m!638655 () Bool)

(assert (=> b!668323 m!638655))

(declare-fun m!638657 () Bool)

(assert (=> b!668318 m!638657))

(declare-fun m!638659 () Bool)

(assert (=> b!668314 m!638659))

(declare-fun m!638661 () Bool)

(assert (=> b!668320 m!638661))

(declare-fun m!638663 () Bool)

(assert (=> b!668307 m!638663))

(declare-fun m!638665 () Bool)

(assert (=> b!668303 m!638665))

(declare-fun m!638667 () Bool)

(assert (=> b!668303 m!638667))

(declare-fun m!638669 () Bool)

(assert (=> b!668303 m!638669))

(declare-fun m!638671 () Bool)

(assert (=> b!668303 m!638671))

(declare-fun m!638673 () Bool)

(assert (=> b!668303 m!638673))

(declare-fun m!638675 () Bool)

(assert (=> b!668303 m!638675))

(declare-fun m!638677 () Bool)

(assert (=> b!668303 m!638677))

(declare-fun m!638679 () Bool)

(assert (=> b!668303 m!638679))

(assert (=> b!668303 m!638669))

(declare-fun m!638681 () Bool)

(assert (=> b!668303 m!638681))

(declare-fun m!638683 () Bool)

(assert (=> b!668303 m!638683))

(declare-fun m!638685 () Bool)

(assert (=> b!668303 m!638685))

(declare-fun m!638687 () Bool)

(assert (=> b!668303 m!638687))

(declare-fun m!638689 () Bool)

(assert (=> b!668303 m!638689))

(declare-fun m!638691 () Bool)

(assert (=> b!668305 m!638691))

(declare-fun m!638693 () Bool)

(assert (=> b!668309 m!638693))

(assert (=> b!668319 m!638693))

(declare-fun m!638695 () Bool)

(assert (=> b!668306 m!638695))

(declare-fun m!638697 () Bool)

(assert (=> b!668308 m!638697))

(assert (=> b!668325 m!638667))

(assert (=> b!668325 m!638669))

(declare-fun m!638699 () Bool)

(assert (=> b!668325 m!638699))

(declare-fun m!638701 () Bool)

(assert (=> b!668325 m!638701))

(assert (=> b!668325 m!638669))

(assert (=> b!668325 m!638699))

(assert (=> b!668325 m!638677))

(assert (=> b!668325 m!638689))

(declare-fun m!638703 () Bool)

(assert (=> start!60046 m!638703))

(declare-fun m!638705 () Bool)

(assert (=> b!668317 m!638705))

(declare-fun m!638707 () Bool)

(assert (=> b!668311 m!638707))

(declare-fun m!638709 () Bool)

(assert (=> b!668315 m!638709))

(assert (=> b!668322 m!638659))

(declare-fun m!638711 () Bool)

(assert (=> b!668310 m!638711))

(check-sat (not b!668310) (not b!668323) (not b!668325) (not b!668311) (not b!668320) (not b!668317) (not b!668314) (not b!668309) (not b!668305) (not b!668319) (not b!668318) (not b!668306) (not b!668307) (not start!60046) (not b!668315) (not b!668303) (not b!668322) (not b!668308))
(check-sat)
