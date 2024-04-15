; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59942 () Bool)

(assert start!59942)

(declare-fun b!664557 () Bool)

(declare-fun res!432359 () Bool)

(declare-fun e!380986 () Bool)

(assert (=> b!664557 (=> (not res!432359) (not e!380986))))

(declare-datatypes ((array!39000 0))(
  ( (array!39001 (arr!18692 (Array (_ BitVec 32) (_ BitVec 64))) (size!19057 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39000)

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((List!12772 0))(
  ( (Nil!12769) (Cons!12768 (h!13813 (_ BitVec 64)) (t!18991 List!12772)) )
))
(declare-fun acc!681 () List!12772)

(declare-fun arrayNoDuplicates!0 (array!39000 (_ BitVec 32) List!12772) Bool)

(assert (=> b!664557 (= res!432359 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!664558 () Bool)

(declare-fun res!432343 () Bool)

(assert (=> b!664558 (=> (not res!432343) (not e!380986))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39000 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!664558 (= res!432343 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!664559 () Bool)

(declare-datatypes ((Unit!23168 0))(
  ( (Unit!23169) )
))
(declare-fun e!380980 () Unit!23168)

(declare-fun lt!309532 () Unit!23168)

(assert (=> b!664559 (= e!380980 lt!309532)))

(declare-fun lt!309537 () Unit!23168)

(declare-fun lemmaListSubSeqRefl!0 (List!12772) Unit!23168)

(assert (=> b!664559 (= lt!309537 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!50 (List!12772 List!12772) Bool)

(assert (=> b!664559 (subseq!50 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39000 List!12772 List!12772 (_ BitVec 32)) Unit!23168)

(declare-fun $colon$colon!181 (List!12772 (_ BitVec 64)) List!12772)

(assert (=> b!664559 (= lt!309532 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!181 acc!681 (select (arr!18692 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!664559 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!664560 () Bool)

(declare-fun Unit!23170 () Unit!23168)

(assert (=> b!664560 (= e!380980 Unit!23170)))

(declare-fun b!664561 () Bool)

(declare-fun res!432346 () Bool)

(assert (=> b!664561 (=> (not res!432346) (not e!380986))))

(declare-fun contains!3294 (List!12772 (_ BitVec 64)) Bool)

(assert (=> b!664561 (= res!432346 (not (contains!3294 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!664562 () Bool)

(declare-fun e!380982 () Unit!23168)

(declare-fun Unit!23171 () Unit!23168)

(assert (=> b!664562 (= e!380982 Unit!23171)))

(declare-fun b!664563 () Bool)

(declare-fun res!432342 () Bool)

(declare-fun e!380984 () Bool)

(assert (=> b!664563 (=> res!432342 e!380984)))

(declare-fun lt!309530 () List!12772)

(assert (=> b!664563 (= res!432342 (contains!3294 lt!309530 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!664564 () Bool)

(declare-fun res!432356 () Bool)

(assert (=> b!664564 (=> (not res!432356) (not e!380986))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!664564 (= res!432356 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19057 a!3626))))))

(declare-fun b!664566 () Bool)

(declare-fun e!380983 () Bool)

(declare-fun e!380985 () Bool)

(assert (=> b!664566 (= e!380983 e!380985)))

(declare-fun res!432341 () Bool)

(assert (=> b!664566 (=> (not res!432341) (not e!380985))))

(assert (=> b!664566 (= res!432341 (bvsle from!3004 i!1382))))

(declare-fun b!664567 () Bool)

(declare-fun res!432352 () Bool)

(assert (=> b!664567 (=> res!432352 e!380984)))

(assert (=> b!664567 (= res!432352 (contains!3294 acc!681 k0!2843))))

(declare-fun b!664568 () Bool)

(declare-fun e!380981 () Bool)

(assert (=> b!664568 (= e!380981 (contains!3294 acc!681 k0!2843))))

(declare-fun b!664569 () Bool)

(declare-fun res!432355 () Bool)

(assert (=> b!664569 (=> res!432355 e!380984)))

(assert (=> b!664569 (= res!432355 (not (contains!3294 lt!309530 k0!2843)))))

(declare-fun b!664570 () Bool)

(declare-fun res!432349 () Bool)

(assert (=> b!664570 (=> (not res!432349) (not e!380986))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!664570 (= res!432349 (validKeyInArray!0 k0!2843))))

(declare-fun b!664571 () Bool)

(declare-fun res!432354 () Bool)

(assert (=> b!664571 (=> (not res!432354) (not e!380986))))

(assert (=> b!664571 (= res!432354 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12769))))

(declare-fun b!664572 () Bool)

(declare-fun res!432351 () Bool)

(assert (=> b!664572 (=> (not res!432351) (not e!380986))))

(assert (=> b!664572 (= res!432351 e!380983)))

(declare-fun res!432361 () Bool)

(assert (=> b!664572 (=> res!432361 e!380983)))

(assert (=> b!664572 (= res!432361 e!380981)))

(declare-fun res!432353 () Bool)

(assert (=> b!664572 (=> (not res!432353) (not e!380981))))

(assert (=> b!664572 (= res!432353 (bvsgt from!3004 i!1382))))

(declare-fun b!664573 () Bool)

(declare-fun res!432345 () Bool)

(assert (=> b!664573 (=> (not res!432345) (not e!380986))))

(assert (=> b!664573 (= res!432345 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19057 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!664574 () Bool)

(declare-fun res!432347 () Bool)

(assert (=> b!664574 (=> res!432347 e!380984)))

(assert (=> b!664574 (= res!432347 (not (subseq!50 acc!681 lt!309530)))))

(declare-fun b!664575 () Bool)

(declare-fun Unit!23172 () Unit!23168)

(assert (=> b!664575 (= e!380982 Unit!23172)))

(declare-fun lt!309534 () Unit!23168)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39000 (_ BitVec 64) (_ BitVec 32)) Unit!23168)

(assert (=> b!664575 (= lt!309534 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!664575 false))

(declare-fun b!664565 () Bool)

(declare-fun res!432357 () Bool)

(assert (=> b!664565 (=> res!432357 e!380984)))

(declare-fun noDuplicate!563 (List!12772) Bool)

(assert (=> b!664565 (= res!432357 (not (noDuplicate!563 lt!309530)))))

(declare-fun res!432360 () Bool)

(assert (=> start!59942 (=> (not res!432360) (not e!380986))))

(assert (=> start!59942 (= res!432360 (and (bvslt (size!19057 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19057 a!3626))))))

(assert (=> start!59942 e!380986))

(assert (=> start!59942 true))

(declare-fun array_inv!14575 (array!39000) Bool)

(assert (=> start!59942 (array_inv!14575 a!3626)))

(declare-fun b!664576 () Bool)

(assert (=> b!664576 (= e!380985 (not (contains!3294 acc!681 k0!2843)))))

(declare-fun b!664577 () Bool)

(assert (=> b!664577 (= e!380984 true)))

(declare-fun lt!309528 () Bool)

(assert (=> b!664577 (= lt!309528 (contains!3294 lt!309530 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!664578 () Bool)

(declare-fun res!432344 () Bool)

(assert (=> b!664578 (=> res!432344 e!380984)))

(declare-fun lt!309529 () Bool)

(assert (=> b!664578 (= res!432344 lt!309529)))

(declare-fun b!664579 () Bool)

(declare-fun res!432348 () Bool)

(assert (=> b!664579 (=> (not res!432348) (not e!380986))))

(assert (=> b!664579 (= res!432348 (noDuplicate!563 acc!681))))

(declare-fun b!664580 () Bool)

(assert (=> b!664580 (= e!380986 (not e!380984))))

(declare-fun res!432350 () Bool)

(assert (=> b!664580 (=> res!432350 e!380984)))

(assert (=> b!664580 (= res!432350 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!48 (List!12772 (_ BitVec 64)) List!12772)

(assert (=> b!664580 (= (-!48 lt!309530 k0!2843) acc!681)))

(assert (=> b!664580 (= lt!309530 ($colon$colon!181 acc!681 k0!2843))))

(declare-fun lt!309531 () Unit!23168)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12772) Unit!23168)

(assert (=> b!664580 (= lt!309531 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(assert (=> b!664580 (subseq!50 acc!681 acc!681)))

(declare-fun lt!309533 () Unit!23168)

(assert (=> b!664580 (= lt!309533 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!664580 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!309535 () Unit!23168)

(assert (=> b!664580 (= lt!309535 e!380980)))

(declare-fun c!76475 () Bool)

(assert (=> b!664580 (= c!76475 (validKeyInArray!0 (select (arr!18692 a!3626) from!3004)))))

(declare-fun lt!309536 () Unit!23168)

(assert (=> b!664580 (= lt!309536 e!380982)))

(declare-fun c!76476 () Bool)

(assert (=> b!664580 (= c!76476 lt!309529)))

(assert (=> b!664580 (= lt!309529 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!664580 (arrayContainsKey!0 (array!39001 (store (arr!18692 a!3626) i!1382 k0!2843) (size!19057 a!3626)) k0!2843 from!3004)))

(declare-fun b!664581 () Bool)

(declare-fun res!432358 () Bool)

(assert (=> b!664581 (=> (not res!432358) (not e!380986))))

(assert (=> b!664581 (= res!432358 (not (contains!3294 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!59942 res!432360) b!664579))

(assert (= (and b!664579 res!432348) b!664561))

(assert (= (and b!664561 res!432346) b!664581))

(assert (= (and b!664581 res!432358) b!664572))

(assert (= (and b!664572 res!432353) b!664568))

(assert (= (and b!664572 (not res!432361)) b!664566))

(assert (= (and b!664566 res!432341) b!664576))

(assert (= (and b!664572 res!432351) b!664571))

(assert (= (and b!664571 res!432354) b!664557))

(assert (= (and b!664557 res!432359) b!664564))

(assert (= (and b!664564 res!432356) b!664570))

(assert (= (and b!664570 res!432349) b!664558))

(assert (= (and b!664558 res!432343) b!664573))

(assert (= (and b!664573 res!432345) b!664580))

(assert (= (and b!664580 c!76476) b!664575))

(assert (= (and b!664580 (not c!76476)) b!664562))

(assert (= (and b!664580 c!76475) b!664559))

(assert (= (and b!664580 (not c!76475)) b!664560))

(assert (= (and b!664580 (not res!432350)) b!664565))

(assert (= (and b!664565 (not res!432357)) b!664578))

(assert (= (and b!664578 (not res!432344)) b!664567))

(assert (= (and b!664567 (not res!432352)) b!664574))

(assert (= (and b!664574 (not res!432347)) b!664569))

(assert (= (and b!664569 (not res!432355)) b!664563))

(assert (= (and b!664563 (not res!432342)) b!664577))

(declare-fun m!635271 () Bool)

(assert (=> b!664579 m!635271))

(declare-fun m!635273 () Bool)

(assert (=> b!664575 m!635273))

(declare-fun m!635275 () Bool)

(assert (=> b!664569 m!635275))

(declare-fun m!635277 () Bool)

(assert (=> b!664559 m!635277))

(declare-fun m!635279 () Bool)

(assert (=> b!664559 m!635279))

(declare-fun m!635281 () Bool)

(assert (=> b!664559 m!635281))

(declare-fun m!635283 () Bool)

(assert (=> b!664559 m!635283))

(assert (=> b!664559 m!635279))

(assert (=> b!664559 m!635281))

(declare-fun m!635285 () Bool)

(assert (=> b!664559 m!635285))

(declare-fun m!635287 () Bool)

(assert (=> b!664559 m!635287))

(declare-fun m!635289 () Bool)

(assert (=> b!664563 m!635289))

(declare-fun m!635291 () Bool)

(assert (=> b!664557 m!635291))

(declare-fun m!635293 () Bool)

(assert (=> b!664576 m!635293))

(declare-fun m!635295 () Bool)

(assert (=> b!664577 m!635295))

(declare-fun m!635297 () Bool)

(assert (=> b!664558 m!635297))

(declare-fun m!635299 () Bool)

(assert (=> b!664574 m!635299))

(declare-fun m!635301 () Bool)

(assert (=> b!664565 m!635301))

(declare-fun m!635303 () Bool)

(assert (=> b!664561 m!635303))

(assert (=> b!664568 m!635293))

(declare-fun m!635305 () Bool)

(assert (=> b!664581 m!635305))

(declare-fun m!635307 () Bool)

(assert (=> b!664571 m!635307))

(assert (=> b!664567 m!635293))

(declare-fun m!635309 () Bool)

(assert (=> b!664570 m!635309))

(declare-fun m!635311 () Bool)

(assert (=> start!59942 m!635311))

(assert (=> b!664580 m!635277))

(assert (=> b!664580 m!635279))

(declare-fun m!635313 () Bool)

(assert (=> b!664580 m!635313))

(declare-fun m!635315 () Bool)

(assert (=> b!664580 m!635315))

(assert (=> b!664580 m!635285))

(declare-fun m!635317 () Bool)

(assert (=> b!664580 m!635317))

(assert (=> b!664580 m!635279))

(declare-fun m!635319 () Bool)

(assert (=> b!664580 m!635319))

(declare-fun m!635321 () Bool)

(assert (=> b!664580 m!635321))

(declare-fun m!635323 () Bool)

(assert (=> b!664580 m!635323))

(declare-fun m!635325 () Bool)

(assert (=> b!664580 m!635325))

(assert (=> b!664580 m!635287))

(check-sat (not b!664563) (not b!664569) (not b!664581) (not b!664570) (not b!664580) (not b!664559) (not b!664558) (not b!664577) (not b!664568) (not b!664557) (not b!664565) (not start!59942) (not b!664576) (not b!664571) (not b!664574) (not b!664579) (not b!664561) (not b!664567) (not b!664575))
(check-sat)
