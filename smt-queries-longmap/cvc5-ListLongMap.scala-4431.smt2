; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61554 () Bool)

(assert start!61554)

(declare-fun b!688347 () Bool)

(declare-fun res!453192 () Bool)

(declare-fun e!392016 () Bool)

(assert (=> b!688347 (=> (not res!453192) (not e!392016))))

(declare-datatypes ((List!13104 0))(
  ( (Nil!13101) (Cons!13100 (h!14145 (_ BitVec 64)) (t!19359 List!13104)) )
))
(declare-fun acc!681 () List!13104)

(declare-fun noDuplicate!895 (List!13104) Bool)

(assert (=> b!688347 (= res!453192 (noDuplicate!895 acc!681))))

(declare-fun b!688348 () Bool)

(declare-datatypes ((Unit!24270 0))(
  ( (Unit!24271) )
))
(declare-fun e!392018 () Unit!24270)

(declare-fun Unit!24272 () Unit!24270)

(assert (=> b!688348 (= e!392018 Unit!24272)))

(declare-fun b!688350 () Bool)

(declare-fun e!392015 () Bool)

(assert (=> b!688350 (= e!392016 (not e!392015))))

(declare-fun res!453199 () Bool)

(assert (=> b!688350 (=> res!453199 e!392015)))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!688350 (= res!453199 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-datatypes ((array!39706 0))(
  ( (array!39707 (arr!19024 (Array (_ BitVec 32) (_ BitVec 64))) (size!19405 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39706)

(declare-fun lt!315597 () List!13104)

(declare-fun arrayNoDuplicates!0 (array!39706 (_ BitVec 32) List!13104) Bool)

(assert (=> b!688350 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!315597)))

(declare-fun lt!315601 () Unit!24270)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39706 (_ BitVec 64) (_ BitVec 32) List!13104 List!13104) Unit!24270)

(assert (=> b!688350 (= lt!315601 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!315597))))

(declare-fun -!194 (List!13104 (_ BitVec 64)) List!13104)

(assert (=> b!688350 (= (-!194 lt!315597 k!2843) acc!681)))

(declare-fun $colon$colon!393 (List!13104 (_ BitVec 64)) List!13104)

(assert (=> b!688350 (= lt!315597 ($colon$colon!393 acc!681 k!2843))))

(declare-fun lt!315602 () Unit!24270)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13104) Unit!24270)

(assert (=> b!688350 (= lt!315602 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!229 (List!13104 List!13104) Bool)

(assert (=> b!688350 (subseq!229 acc!681 acc!681)))

(declare-fun lt!315596 () Unit!24270)

(declare-fun lemmaListSubSeqRefl!0 (List!13104) Unit!24270)

(assert (=> b!688350 (= lt!315596 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!688350 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!315598 () Unit!24270)

(declare-fun e!392008 () Unit!24270)

(assert (=> b!688350 (= lt!315598 e!392008)))

(declare-fun c!77952 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!688350 (= c!77952 (validKeyInArray!0 (select (arr!19024 a!3626) from!3004)))))

(declare-fun lt!315599 () Unit!24270)

(assert (=> b!688350 (= lt!315599 e!392018)))

(declare-fun c!77951 () Bool)

(declare-fun arrayContainsKey!0 (array!39706 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!688350 (= c!77951 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!688350 (arrayContainsKey!0 (array!39707 (store (arr!19024 a!3626) i!1382 k!2843) (size!19405 a!3626)) k!2843 from!3004)))

(declare-fun b!688351 () Bool)

(declare-fun res!453194 () Bool)

(assert (=> b!688351 (=> res!453194 e!392015)))

(declare-fun contains!3626 (List!13104 (_ BitVec 64)) Bool)

(assert (=> b!688351 (= res!453194 (contains!3626 lt!315597 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!688352 () Bool)

(assert (=> b!688352 (= e!392015 true)))

(declare-fun lt!315594 () Bool)

(declare-fun e!392011 () Bool)

(assert (=> b!688352 (= lt!315594 e!392011)))

(declare-fun res!453193 () Bool)

(assert (=> b!688352 (=> res!453193 e!392011)))

(declare-fun e!392012 () Bool)

(assert (=> b!688352 (= res!453193 e!392012)))

(declare-fun res!453179 () Bool)

(assert (=> b!688352 (=> (not res!453179) (not e!392012))))

(assert (=> b!688352 (= res!453179 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!688353 () Bool)

(declare-fun lt!315595 () Unit!24270)

(assert (=> b!688353 (= e!392008 lt!315595)))

(declare-fun lt!315600 () Unit!24270)

(assert (=> b!688353 (= lt!315600 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!688353 (subseq!229 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39706 List!13104 List!13104 (_ BitVec 32)) Unit!24270)

(assert (=> b!688353 (= lt!315595 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!393 acc!681 (select (arr!19024 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!688353 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!688354 () Bool)

(declare-fun res!453186 () Bool)

(assert (=> b!688354 (=> res!453186 e!392015)))

(assert (=> b!688354 (= res!453186 (contains!3626 lt!315597 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!688355 () Bool)

(declare-fun res!453191 () Bool)

(assert (=> b!688355 (=> (not res!453191) (not e!392016))))

(assert (=> b!688355 (= res!453191 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!688356 () Bool)

(assert (=> b!688356 (= e!392012 (contains!3626 lt!315597 k!2843))))

(declare-fun b!688357 () Bool)

(declare-fun Unit!24273 () Unit!24270)

(assert (=> b!688357 (= e!392008 Unit!24273)))

(declare-fun b!688358 () Bool)

(declare-fun res!453195 () Bool)

(assert (=> b!688358 (=> (not res!453195) (not e!392016))))

(assert (=> b!688358 (= res!453195 (not (contains!3626 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!688359 () Bool)

(declare-fun e!392013 () Bool)

(assert (=> b!688359 (= e!392013 (contains!3626 acc!681 k!2843))))

(declare-fun b!688360 () Bool)

(declare-fun res!453198 () Bool)

(assert (=> b!688360 (=> (not res!453198) (not e!392016))))

(assert (=> b!688360 (= res!453198 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!688361 () Bool)

(declare-fun e!392010 () Bool)

(declare-fun e!392017 () Bool)

(assert (=> b!688361 (= e!392010 e!392017)))

(declare-fun res!453185 () Bool)

(assert (=> b!688361 (=> (not res!453185) (not e!392017))))

(assert (=> b!688361 (= res!453185 (bvsle from!3004 i!1382))))

(declare-fun res!453188 () Bool)

(assert (=> start!61554 (=> (not res!453188) (not e!392016))))

(assert (=> start!61554 (= res!453188 (and (bvslt (size!19405 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19405 a!3626))))))

(assert (=> start!61554 e!392016))

(assert (=> start!61554 true))

(declare-fun array_inv!14907 (array!39706) Bool)

(assert (=> start!61554 (array_inv!14907 a!3626)))

(declare-fun b!688349 () Bool)

(declare-fun res!453180 () Bool)

(assert (=> b!688349 (=> (not res!453180) (not e!392016))))

(assert (=> b!688349 (= res!453180 e!392010)))

(declare-fun res!453182 () Bool)

(assert (=> b!688349 (=> res!453182 e!392010)))

(assert (=> b!688349 (= res!453182 e!392013)))

(declare-fun res!453189 () Bool)

(assert (=> b!688349 (=> (not res!453189) (not e!392013))))

(assert (=> b!688349 (= res!453189 (bvsgt from!3004 i!1382))))

(declare-fun b!688362 () Bool)

(declare-fun e!392014 () Bool)

(assert (=> b!688362 (= e!392014 (not (contains!3626 lt!315597 k!2843)))))

(declare-fun b!688363 () Bool)

(declare-fun Unit!24274 () Unit!24270)

(assert (=> b!688363 (= e!392018 Unit!24274)))

(declare-fun lt!315603 () Unit!24270)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39706 (_ BitVec 64) (_ BitVec 32)) Unit!24270)

(assert (=> b!688363 (= lt!315603 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!688363 false))

(declare-fun b!688364 () Bool)

(declare-fun res!453187 () Bool)

(assert (=> b!688364 (=> (not res!453187) (not e!392016))))

(assert (=> b!688364 (= res!453187 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19405 a!3626))))))

(declare-fun b!688365 () Bool)

(declare-fun res!453196 () Bool)

(assert (=> b!688365 (=> (not res!453196) (not e!392016))))

(assert (=> b!688365 (= res!453196 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19405 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!688366 () Bool)

(assert (=> b!688366 (= e!392017 (not (contains!3626 acc!681 k!2843)))))

(declare-fun b!688367 () Bool)

(declare-fun res!453190 () Bool)

(assert (=> b!688367 (=> (not res!453190) (not e!392016))))

(assert (=> b!688367 (= res!453190 (validKeyInArray!0 k!2843))))

(declare-fun b!688368 () Bool)

(declare-fun res!453183 () Bool)

(assert (=> b!688368 (=> (not res!453183) (not e!392016))))

(assert (=> b!688368 (= res!453183 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13101))))

(declare-fun b!688369 () Bool)

(declare-fun res!453181 () Bool)

(assert (=> b!688369 (=> res!453181 e!392015)))

(assert (=> b!688369 (= res!453181 (not (noDuplicate!895 lt!315597)))))

(declare-fun b!688370 () Bool)

(declare-fun res!453197 () Bool)

(assert (=> b!688370 (=> (not res!453197) (not e!392016))))

(assert (=> b!688370 (= res!453197 (not (contains!3626 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!688371 () Bool)

(assert (=> b!688371 (= e!392011 e!392014)))

(declare-fun res!453184 () Bool)

(assert (=> b!688371 (=> (not res!453184) (not e!392014))))

(assert (=> b!688371 (= res!453184 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(assert (= (and start!61554 res!453188) b!688347))

(assert (= (and b!688347 res!453192) b!688370))

(assert (= (and b!688370 res!453197) b!688358))

(assert (= (and b!688358 res!453195) b!688349))

(assert (= (and b!688349 res!453189) b!688359))

(assert (= (and b!688349 (not res!453182)) b!688361))

(assert (= (and b!688361 res!453185) b!688366))

(assert (= (and b!688349 res!453180) b!688368))

(assert (= (and b!688368 res!453183) b!688360))

(assert (= (and b!688360 res!453198) b!688364))

(assert (= (and b!688364 res!453187) b!688367))

(assert (= (and b!688367 res!453190) b!688355))

(assert (= (and b!688355 res!453191) b!688365))

(assert (= (and b!688365 res!453196) b!688350))

(assert (= (and b!688350 c!77951) b!688363))

(assert (= (and b!688350 (not c!77951)) b!688348))

(assert (= (and b!688350 c!77952) b!688353))

(assert (= (and b!688350 (not c!77952)) b!688357))

(assert (= (and b!688350 (not res!453199)) b!688369))

(assert (= (and b!688369 (not res!453181)) b!688354))

(assert (= (and b!688354 (not res!453186)) b!688351))

(assert (= (and b!688351 (not res!453194)) b!688352))

(assert (= (and b!688352 res!453179) b!688356))

(assert (= (and b!688352 (not res!453193)) b!688371))

(assert (= (and b!688371 res!453184) b!688362))

(declare-fun m!651707 () Bool)

(assert (=> b!688347 m!651707))

(declare-fun m!651709 () Bool)

(assert (=> b!688350 m!651709))

(declare-fun m!651711 () Bool)

(assert (=> b!688350 m!651711))

(declare-fun m!651713 () Bool)

(assert (=> b!688350 m!651713))

(declare-fun m!651715 () Bool)

(assert (=> b!688350 m!651715))

(declare-fun m!651717 () Bool)

(assert (=> b!688350 m!651717))

(declare-fun m!651719 () Bool)

(assert (=> b!688350 m!651719))

(declare-fun m!651721 () Bool)

(assert (=> b!688350 m!651721))

(declare-fun m!651723 () Bool)

(assert (=> b!688350 m!651723))

(declare-fun m!651725 () Bool)

(assert (=> b!688350 m!651725))

(declare-fun m!651727 () Bool)

(assert (=> b!688350 m!651727))

(assert (=> b!688350 m!651711))

(declare-fun m!651729 () Bool)

(assert (=> b!688350 m!651729))

(declare-fun m!651731 () Bool)

(assert (=> b!688350 m!651731))

(declare-fun m!651733 () Bool)

(assert (=> b!688350 m!651733))

(declare-fun m!651735 () Bool)

(assert (=> b!688368 m!651735))

(declare-fun m!651737 () Bool)

(assert (=> b!688359 m!651737))

(declare-fun m!651739 () Bool)

(assert (=> b!688351 m!651739))

(declare-fun m!651741 () Bool)

(assert (=> b!688354 m!651741))

(declare-fun m!651743 () Bool)

(assert (=> b!688355 m!651743))

(declare-fun m!651745 () Bool)

(assert (=> b!688367 m!651745))

(assert (=> b!688366 m!651737))

(declare-fun m!651747 () Bool)

(assert (=> b!688370 m!651747))

(declare-fun m!651749 () Bool)

(assert (=> b!688356 m!651749))

(declare-fun m!651751 () Bool)

(assert (=> b!688369 m!651751))

(assert (=> b!688353 m!651709))

(assert (=> b!688353 m!651711))

(declare-fun m!651753 () Bool)

(assert (=> b!688353 m!651753))

(declare-fun m!651755 () Bool)

(assert (=> b!688353 m!651755))

(assert (=> b!688353 m!651711))

(assert (=> b!688353 m!651753))

(assert (=> b!688353 m!651715))

(assert (=> b!688353 m!651733))

(declare-fun m!651757 () Bool)

(assert (=> start!61554 m!651757))

(declare-fun m!651759 () Bool)

(assert (=> b!688358 m!651759))

(declare-fun m!651761 () Bool)

(assert (=> b!688363 m!651761))

(assert (=> b!688362 m!651749))

(declare-fun m!651763 () Bool)

(assert (=> b!688360 m!651763))

(push 1)

(assert (not b!688359))

(assert (not b!688355))

(assert (not b!688370))

(assert (not b!688363))

(assert (not b!688347))

(assert (not b!688353))

(assert (not b!688369))

(assert (not b!688367))

(assert (not b!688350))

(assert (not b!688368))

(assert (not start!61554))

(assert (not b!688351))

(assert (not b!688356))

(assert (not b!688362))

(assert (not b!688366))

(assert (not b!688354))

(assert (not b!688360))

(assert (not b!688358))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

