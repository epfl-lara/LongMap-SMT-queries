; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61580 () Bool)

(assert start!61580)

(declare-fun b!689342 () Bool)

(declare-fun e!392443 () Bool)

(declare-fun e!392440 () Bool)

(assert (=> b!689342 (= e!392443 e!392440)))

(declare-fun res!454022 () Bool)

(assert (=> b!689342 (=> (not res!454022) (not e!392440))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!689342 (= res!454022 (bvsle from!3004 i!1382))))

(declare-fun b!689343 () Bool)

(declare-datatypes ((Unit!24335 0))(
  ( (Unit!24336) )
))
(declare-fun e!392444 () Unit!24335)

(declare-fun Unit!24337 () Unit!24335)

(assert (=> b!689343 (= e!392444 Unit!24337)))

(declare-fun b!689344 () Bool)

(declare-fun res!454039 () Bool)

(declare-fun e!392438 () Bool)

(assert (=> b!689344 (=> (not res!454039) (not e!392438))))

(declare-datatypes ((array!39732 0))(
  ( (array!39733 (arr!19037 (Array (_ BitVec 32) (_ BitVec 64))) (size!19418 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39732)

(declare-datatypes ((List!13117 0))(
  ( (Nil!13114) (Cons!13113 (h!14158 (_ BitVec 64)) (t!19372 List!13117)) )
))
(declare-fun arrayNoDuplicates!0 (array!39732 (_ BitVec 32) List!13117) Bool)

(assert (=> b!689344 (= res!454039 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13114))))

(declare-fun b!689345 () Bool)

(declare-fun res!454029 () Bool)

(assert (=> b!689345 (=> (not res!454029) (not e!392438))))

(declare-fun acc!681 () List!13117)

(declare-fun noDuplicate!908 (List!13117) Bool)

(assert (=> b!689345 (= res!454029 (noDuplicate!908 acc!681))))

(declare-fun b!689346 () Bool)

(declare-fun res!454033 () Bool)

(declare-fun e!392437 () Bool)

(assert (=> b!689346 (=> res!454033 e!392437)))

(declare-fun lt!315991 () List!13117)

(declare-fun contains!3639 (List!13117 (_ BitVec 64)) Bool)

(assert (=> b!689346 (= res!454033 (contains!3639 lt!315991 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!689347 () Bool)

(declare-fun e!392439 () Unit!24335)

(declare-fun Unit!24338 () Unit!24335)

(assert (=> b!689347 (= e!392439 Unit!24338)))

(declare-fun b!689348 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(assert (=> b!689348 (= e!392440 (not (contains!3639 acc!681 k0!2843)))))

(declare-fun b!689349 () Bool)

(declare-fun e!392441 () Bool)

(assert (=> b!689349 (= e!392441 (contains!3639 lt!315991 k0!2843))))

(declare-fun b!689350 () Bool)

(declare-fun res!454026 () Bool)

(assert (=> b!689350 (=> (not res!454026) (not e!392438))))

(assert (=> b!689350 (= res!454026 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19418 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!689351 () Bool)

(declare-fun res!454024 () Bool)

(assert (=> b!689351 (=> (not res!454024) (not e!392438))))

(assert (=> b!689351 (= res!454024 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!689352 () Bool)

(declare-fun res!454018 () Bool)

(assert (=> b!689352 (=> (not res!454018) (not e!392438))))

(assert (=> b!689352 (= res!454018 (not (contains!3639 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!689353 () Bool)

(declare-fun e!392445 () Bool)

(assert (=> b!689353 (= e!392445 (contains!3639 acc!681 k0!2843))))

(declare-fun res!454028 () Bool)

(assert (=> start!61580 (=> (not res!454028) (not e!392438))))

(assert (=> start!61580 (= res!454028 (and (bvslt (size!19418 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19418 a!3626))))))

(assert (=> start!61580 e!392438))

(assert (=> start!61580 true))

(declare-fun array_inv!14920 (array!39732) Bool)

(assert (=> start!61580 (array_inv!14920 a!3626)))

(declare-fun b!689354 () Bool)

(declare-fun res!454019 () Bool)

(assert (=> b!689354 (=> (not res!454019) (not e!392438))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!689354 (= res!454019 (validKeyInArray!0 k0!2843))))

(declare-fun b!689355 () Bool)

(declare-fun res!454027 () Bool)

(assert (=> b!689355 (=> (not res!454027) (not e!392438))))

(assert (=> b!689355 (= res!454027 e!392443)))

(declare-fun res!454025 () Bool)

(assert (=> b!689355 (=> res!454025 e!392443)))

(assert (=> b!689355 (= res!454025 e!392445)))

(declare-fun res!454032 () Bool)

(assert (=> b!689355 (=> (not res!454032) (not e!392445))))

(assert (=> b!689355 (= res!454032 (bvsgt from!3004 i!1382))))

(declare-fun b!689356 () Bool)

(declare-fun res!454036 () Bool)

(assert (=> b!689356 (=> res!454036 e!392437)))

(assert (=> b!689356 (= res!454036 (not (noDuplicate!908 lt!315991)))))

(declare-fun b!689357 () Bool)

(declare-fun res!454031 () Bool)

(assert (=> b!689357 (=> (not res!454031) (not e!392438))))

(assert (=> b!689357 (= res!454031 (not (contains!3639 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!689358 () Bool)

(assert (=> b!689358 (= e!392438 (not e!392437))))

(declare-fun res!454035 () Bool)

(assert (=> b!689358 (=> res!454035 e!392437)))

(assert (=> b!689358 (= res!454035 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (=> b!689358 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!315991)))

(declare-fun lt!315987 () Unit!24335)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39732 (_ BitVec 64) (_ BitVec 32) List!13117 List!13117) Unit!24335)

(assert (=> b!689358 (= lt!315987 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!315991))))

(declare-fun -!207 (List!13117 (_ BitVec 64)) List!13117)

(assert (=> b!689358 (= (-!207 lt!315991 k0!2843) acc!681)))

(declare-fun $colon$colon!406 (List!13117 (_ BitVec 64)) List!13117)

(assert (=> b!689358 (= lt!315991 ($colon$colon!406 acc!681 k0!2843))))

(declare-fun lt!315986 () Unit!24335)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13117) Unit!24335)

(assert (=> b!689358 (= lt!315986 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(declare-fun subseq!242 (List!13117 List!13117) Bool)

(assert (=> b!689358 (subseq!242 acc!681 acc!681)))

(declare-fun lt!315990 () Unit!24335)

(declare-fun lemmaListSubSeqRefl!0 (List!13117) Unit!24335)

(assert (=> b!689358 (= lt!315990 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!689358 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!315994 () Unit!24335)

(assert (=> b!689358 (= lt!315994 e!392444)))

(declare-fun c!78030 () Bool)

(assert (=> b!689358 (= c!78030 (validKeyInArray!0 (select (arr!19037 a!3626) from!3004)))))

(declare-fun lt!315988 () Unit!24335)

(assert (=> b!689358 (= lt!315988 e!392439)))

(declare-fun c!78029 () Bool)

(declare-fun arrayContainsKey!0 (array!39732 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!689358 (= c!78029 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun lt!315995 () array!39732)

(assert (=> b!689358 (arrayContainsKey!0 lt!315995 k0!2843 from!3004)))

(assert (=> b!689358 (= lt!315995 (array!39733 (store (arr!19037 a!3626) i!1382 k0!2843) (size!19418 a!3626)))))

(declare-fun b!689359 () Bool)

(declare-fun Unit!24339 () Unit!24335)

(assert (=> b!689359 (= e!392439 Unit!24339)))

(declare-fun lt!315996 () Unit!24335)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39732 (_ BitVec 64) (_ BitVec 32)) Unit!24335)

(assert (=> b!689359 (= lt!315996 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!689359 false))

(declare-fun b!689360 () Bool)

(declare-fun e!392442 () Bool)

(assert (=> b!689360 (= e!392442 (not (contains!3639 lt!315991 k0!2843)))))

(declare-fun b!689361 () Bool)

(declare-fun res!454030 () Bool)

(assert (=> b!689361 (=> (not res!454030) (not e!392438))))

(assert (=> b!689361 (= res!454030 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19418 a!3626))))))

(declare-fun b!689362 () Bool)

(declare-fun res!454023 () Bool)

(assert (=> b!689362 (=> res!454023 e!392437)))

(assert (=> b!689362 (= res!454023 (contains!3639 lt!315991 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!689363 () Bool)

(assert (=> b!689363 (= e!392437 (arrayNoDuplicates!0 lt!315995 from!3004 acc!681))))

(assert (=> b!689363 (arrayNoDuplicates!0 lt!315995 (bvadd #b00000000000000000000000000000001 from!3004) lt!315991)))

(declare-fun lt!315989 () Unit!24335)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39732 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!13117) Unit!24335)

(assert (=> b!689363 (= lt!315989 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k0!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) lt!315991))))

(declare-fun b!689364 () Bool)

(declare-fun lt!315993 () Unit!24335)

(assert (=> b!689364 (= e!392444 lt!315993)))

(declare-fun lt!315992 () Unit!24335)

(assert (=> b!689364 (= lt!315992 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!689364 (subseq!242 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39732 List!13117 List!13117 (_ BitVec 32)) Unit!24335)

(assert (=> b!689364 (= lt!315993 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!406 acc!681 (select (arr!19037 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!689364 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!689365 () Bool)

(declare-fun e!392446 () Bool)

(assert (=> b!689365 (= e!392446 e!392441)))

(declare-fun res!454020 () Bool)

(assert (=> b!689365 (=> res!454020 e!392441)))

(assert (=> b!689365 (= res!454020 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!689366 () Bool)

(declare-fun res!454038 () Bool)

(assert (=> b!689366 (=> res!454038 e!392437)))

(assert (=> b!689366 (= res!454038 e!392446)))

(declare-fun res!454021 () Bool)

(assert (=> b!689366 (=> (not res!454021) (not e!392446))))

(assert (=> b!689366 (= res!454021 e!392442)))

(declare-fun res!454034 () Bool)

(assert (=> b!689366 (=> res!454034 e!392442)))

(assert (=> b!689366 (= res!454034 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!689367 () Bool)

(declare-fun res!454037 () Bool)

(assert (=> b!689367 (=> (not res!454037) (not e!392438))))

(assert (=> b!689367 (= res!454037 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(assert (= (and start!61580 res!454028) b!689345))

(assert (= (and b!689345 res!454029) b!689352))

(assert (= (and b!689352 res!454018) b!689357))

(assert (= (and b!689357 res!454031) b!689355))

(assert (= (and b!689355 res!454032) b!689353))

(assert (= (and b!689355 (not res!454025)) b!689342))

(assert (= (and b!689342 res!454022) b!689348))

(assert (= (and b!689355 res!454027) b!689344))

(assert (= (and b!689344 res!454039) b!689351))

(assert (= (and b!689351 res!454024) b!689361))

(assert (= (and b!689361 res!454030) b!689354))

(assert (= (and b!689354 res!454019) b!689367))

(assert (= (and b!689367 res!454037) b!689350))

(assert (= (and b!689350 res!454026) b!689358))

(assert (= (and b!689358 c!78029) b!689359))

(assert (= (and b!689358 (not c!78029)) b!689347))

(assert (= (and b!689358 c!78030) b!689364))

(assert (= (and b!689358 (not c!78030)) b!689343))

(assert (= (and b!689358 (not res!454035)) b!689356))

(assert (= (and b!689356 (not res!454036)) b!689362))

(assert (= (and b!689362 (not res!454023)) b!689346))

(assert (= (and b!689346 (not res!454033)) b!689366))

(assert (= (and b!689366 (not res!454034)) b!689360))

(assert (= (and b!689366 res!454021) b!689365))

(assert (= (and b!689365 (not res!454020)) b!689349))

(assert (= (and b!689366 (not res!454038)) b!689363))

(declare-fun m!652473 () Bool)

(assert (=> b!689357 m!652473))

(declare-fun m!652475 () Bool)

(assert (=> b!689362 m!652475))

(declare-fun m!652477 () Bool)

(assert (=> b!689363 m!652477))

(declare-fun m!652479 () Bool)

(assert (=> b!689363 m!652479))

(declare-fun m!652481 () Bool)

(assert (=> b!689363 m!652481))

(declare-fun m!652483 () Bool)

(assert (=> b!689359 m!652483))

(declare-fun m!652485 () Bool)

(assert (=> b!689354 m!652485))

(declare-fun m!652487 () Bool)

(assert (=> b!689344 m!652487))

(declare-fun m!652489 () Bool)

(assert (=> b!689364 m!652489))

(declare-fun m!652491 () Bool)

(assert (=> b!689364 m!652491))

(declare-fun m!652493 () Bool)

(assert (=> b!689364 m!652493))

(declare-fun m!652495 () Bool)

(assert (=> b!689364 m!652495))

(assert (=> b!689364 m!652491))

(assert (=> b!689364 m!652493))

(declare-fun m!652497 () Bool)

(assert (=> b!689364 m!652497))

(declare-fun m!652499 () Bool)

(assert (=> b!689364 m!652499))

(declare-fun m!652501 () Bool)

(assert (=> b!689349 m!652501))

(declare-fun m!652503 () Bool)

(assert (=> b!689367 m!652503))

(declare-fun m!652505 () Bool)

(assert (=> b!689346 m!652505))

(declare-fun m!652507 () Bool)

(assert (=> b!689353 m!652507))

(assert (=> b!689358 m!652489))

(declare-fun m!652509 () Bool)

(assert (=> b!689358 m!652509))

(assert (=> b!689358 m!652497))

(assert (=> b!689358 m!652491))

(declare-fun m!652511 () Bool)

(assert (=> b!689358 m!652511))

(assert (=> b!689358 m!652499))

(assert (=> b!689358 m!652491))

(declare-fun m!652513 () Bool)

(assert (=> b!689358 m!652513))

(declare-fun m!652515 () Bool)

(assert (=> b!689358 m!652515))

(declare-fun m!652517 () Bool)

(assert (=> b!689358 m!652517))

(declare-fun m!652519 () Bool)

(assert (=> b!689358 m!652519))

(declare-fun m!652521 () Bool)

(assert (=> b!689358 m!652521))

(declare-fun m!652523 () Bool)

(assert (=> b!689358 m!652523))

(declare-fun m!652525 () Bool)

(assert (=> b!689358 m!652525))

(declare-fun m!652527 () Bool)

(assert (=> start!61580 m!652527))

(declare-fun m!652529 () Bool)

(assert (=> b!689352 m!652529))

(declare-fun m!652531 () Bool)

(assert (=> b!689345 m!652531))

(declare-fun m!652533 () Bool)

(assert (=> b!689351 m!652533))

(assert (=> b!689360 m!652501))

(assert (=> b!689348 m!652507))

(declare-fun m!652535 () Bool)

(assert (=> b!689356 m!652535))

(check-sat (not b!689362) (not b!689364) (not b!689367) (not b!689353) (not b!689360) (not b!689346) (not b!689349) (not b!689344) (not b!689358) (not start!61580) (not b!689356) (not b!689345) (not b!689363) (not b!689354) (not b!689352) (not b!689348) (not b!689359) (not b!689351) (not b!689357))
(check-sat)
(get-model)

(declare-fun d!95033 () Bool)

(declare-fun res!454180 () Bool)

(declare-fun e!392524 () Bool)

(assert (=> d!95033 (=> res!454180 e!392524)))

(assert (=> d!95033 (= res!454180 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19418 a!3626)))))

(assert (=> d!95033 (= (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!315991) e!392524)))

(declare-fun b!689534 () Bool)

(declare-fun e!392523 () Bool)

(assert (=> b!689534 (= e!392523 (contains!3639 lt!315991 (select (arr!19037 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!689535 () Bool)

(declare-fun e!392522 () Bool)

(declare-fun e!392525 () Bool)

(assert (=> b!689535 (= e!392522 e!392525)))

(declare-fun c!78045 () Bool)

(assert (=> b!689535 (= c!78045 (validKeyInArray!0 (select (arr!19037 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!689536 () Bool)

(declare-fun call!34156 () Bool)

(assert (=> b!689536 (= e!392525 call!34156)))

(declare-fun bm!34153 () Bool)

(assert (=> bm!34153 (= call!34156 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!78045 (Cons!13113 (select (arr!19037 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) lt!315991) lt!315991)))))

(declare-fun b!689537 () Bool)

(assert (=> b!689537 (= e!392524 e!392522)))

(declare-fun res!454178 () Bool)

(assert (=> b!689537 (=> (not res!454178) (not e!392522))))

(assert (=> b!689537 (= res!454178 (not e!392523))))

(declare-fun res!454179 () Bool)

(assert (=> b!689537 (=> (not res!454179) (not e!392523))))

(assert (=> b!689537 (= res!454179 (validKeyInArray!0 (select (arr!19037 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!689538 () Bool)

(assert (=> b!689538 (= e!392525 call!34156)))

(assert (= (and d!95033 (not res!454180)) b!689537))

(assert (= (and b!689537 res!454179) b!689534))

(assert (= (and b!689537 res!454178) b!689535))

(assert (= (and b!689535 c!78045) b!689538))

(assert (= (and b!689535 (not c!78045)) b!689536))

(assert (= (or b!689538 b!689536) bm!34153))

(declare-fun m!652665 () Bool)

(assert (=> b!689534 m!652665))

(assert (=> b!689534 m!652665))

(declare-fun m!652667 () Bool)

(assert (=> b!689534 m!652667))

(assert (=> b!689535 m!652665))

(assert (=> b!689535 m!652665))

(declare-fun m!652669 () Bool)

(assert (=> b!689535 m!652669))

(assert (=> bm!34153 m!652665))

(declare-fun m!652671 () Bool)

(assert (=> bm!34153 m!652671))

(assert (=> b!689537 m!652665))

(assert (=> b!689537 m!652665))

(assert (=> b!689537 m!652669))

(assert (=> b!689358 d!95033))

(declare-fun b!689550 () Bool)

(declare-fun e!392534 () Bool)

(assert (=> b!689550 (= e!392534 (subseq!242 acc!681 (t!19372 acc!681)))))

(declare-fun b!689547 () Bool)

(declare-fun e!392536 () Bool)

(declare-fun e!392535 () Bool)

(assert (=> b!689547 (= e!392536 e!392535)))

(declare-fun res!454192 () Bool)

(assert (=> b!689547 (=> (not res!454192) (not e!392535))))

(get-info :version)

(assert (=> b!689547 (= res!454192 ((_ is Cons!13113) acc!681))))

(declare-fun d!95035 () Bool)

(declare-fun res!454189 () Bool)

(assert (=> d!95035 (=> res!454189 e!392536)))

(assert (=> d!95035 (= res!454189 ((_ is Nil!13114) acc!681))))

(assert (=> d!95035 (= (subseq!242 acc!681 acc!681) e!392536)))

(declare-fun b!689548 () Bool)

(assert (=> b!689548 (= e!392535 e!392534)))

(declare-fun res!454191 () Bool)

(assert (=> b!689548 (=> res!454191 e!392534)))

(declare-fun e!392537 () Bool)

(assert (=> b!689548 (= res!454191 e!392537)))

(declare-fun res!454190 () Bool)

(assert (=> b!689548 (=> (not res!454190) (not e!392537))))

(assert (=> b!689548 (= res!454190 (= (h!14158 acc!681) (h!14158 acc!681)))))

(declare-fun b!689549 () Bool)

(assert (=> b!689549 (= e!392537 (subseq!242 (t!19372 acc!681) (t!19372 acc!681)))))

(assert (= (and d!95035 (not res!454189)) b!689547))

(assert (= (and b!689547 res!454192) b!689548))

(assert (= (and b!689548 res!454190) b!689549))

(assert (= (and b!689548 (not res!454191)) b!689550))

(declare-fun m!652673 () Bool)

(assert (=> b!689550 m!652673))

(declare-fun m!652675 () Bool)

(assert (=> b!689549 m!652675))

(assert (=> b!689358 d!95035))

(declare-fun d!95037 () Bool)

(declare-fun res!454197 () Bool)

(declare-fun e!392542 () Bool)

(assert (=> d!95037 (=> res!454197 e!392542)))

(assert (=> d!95037 (= res!454197 (= (select (arr!19037 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) k0!2843))))

(assert (=> d!95037 (= (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)) e!392542)))

(declare-fun b!689555 () Bool)

(declare-fun e!392543 () Bool)

(assert (=> b!689555 (= e!392542 e!392543)))

(declare-fun res!454198 () Bool)

(assert (=> b!689555 (=> (not res!454198) (not e!392543))))

(assert (=> b!689555 (= res!454198 (bvslt (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (size!19418 a!3626)))))

(declare-fun b!689556 () Bool)

(assert (=> b!689556 (= e!392543 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!95037 (not res!454197)) b!689555))

(assert (= (and b!689555 res!454198) b!689556))

(assert (=> d!95037 m!652665))

(declare-fun m!652677 () Bool)

(assert (=> b!689556 m!652677))

(assert (=> b!689358 d!95037))

(declare-fun b!689573 () Bool)

(declare-fun e!392559 () List!13117)

(declare-fun call!34159 () List!13117)

(assert (=> b!689573 (= e!392559 call!34159)))

(declare-fun d!95039 () Bool)

(declare-fun e!392558 () Bool)

(assert (=> d!95039 e!392558))

(declare-fun res!454207 () Bool)

(assert (=> d!95039 (=> (not res!454207) (not e!392558))))

(declare-fun lt!316068 () List!13117)

(declare-fun size!19421 (List!13117) Int)

(assert (=> d!95039 (= res!454207 (<= (size!19421 lt!316068) (size!19421 lt!315991)))))

(declare-fun e!392557 () List!13117)

(assert (=> d!95039 (= lt!316068 e!392557)))

(declare-fun c!78050 () Bool)

(assert (=> d!95039 (= c!78050 ((_ is Cons!13113) lt!315991))))

(assert (=> d!95039 (= (-!207 lt!315991 k0!2843) lt!316068)))

(declare-fun b!689574 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!302 (List!13117) (InoxSet (_ BitVec 64)))

(assert (=> b!689574 (= e!392558 (= (content!302 lt!316068) ((_ map and) (content!302 lt!315991) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) k0!2843 true)))))))

(declare-fun b!689575 () Bool)

(assert (=> b!689575 (= e!392559 (Cons!13113 (h!14158 lt!315991) call!34159))))

(declare-fun b!689576 () Bool)

(assert (=> b!689576 (= e!392557 e!392559)))

(declare-fun c!78051 () Bool)

(assert (=> b!689576 (= c!78051 (= k0!2843 (h!14158 lt!315991)))))

(declare-fun bm!34156 () Bool)

(assert (=> bm!34156 (= call!34159 (-!207 (t!19372 lt!315991) k0!2843))))

(declare-fun b!689577 () Bool)

(assert (=> b!689577 (= e!392557 Nil!13114)))

(assert (= (and d!95039 c!78050) b!689576))

(assert (= (and d!95039 (not c!78050)) b!689577))

(assert (= (and b!689576 c!78051) b!689573))

(assert (= (and b!689576 (not c!78051)) b!689575))

(assert (= (or b!689573 b!689575) bm!34156))

(assert (= (and d!95039 res!454207) b!689574))

(declare-fun m!652685 () Bool)

(assert (=> d!95039 m!652685))

(declare-fun m!652687 () Bool)

(assert (=> d!95039 m!652687))

(declare-fun m!652689 () Bool)

(assert (=> b!689574 m!652689))

(declare-fun m!652691 () Bool)

(assert (=> b!689574 m!652691))

(declare-fun m!652693 () Bool)

(assert (=> b!689574 m!652693))

(declare-fun m!652695 () Bool)

(assert (=> bm!34156 m!652695))

(assert (=> b!689358 d!95039))

(declare-fun d!95045 () Bool)

(assert (=> d!95045 (= (-!207 ($colon$colon!406 acc!681 k0!2843) k0!2843) acc!681)))

(declare-fun lt!316071 () Unit!24335)

(declare-fun choose!16 ((_ BitVec 64) List!13117) Unit!24335)

(assert (=> d!95045 (= lt!316071 (choose!16 k0!2843 acc!681))))

(assert (=> d!95045 (not (contains!3639 acc!681 k0!2843))))

(assert (=> d!95045 (= (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681) lt!316071)))

(declare-fun bs!20175 () Bool)

(assert (= bs!20175 d!95045))

(assert (=> bs!20175 m!652525))

(assert (=> bs!20175 m!652525))

(declare-fun m!652697 () Bool)

(assert (=> bs!20175 m!652697))

(declare-fun m!652699 () Bool)

(assert (=> bs!20175 m!652699))

(assert (=> bs!20175 m!652507))

(assert (=> b!689358 d!95045))

(declare-fun d!95047 () Bool)

(assert (=> d!95047 (subseq!242 acc!681 acc!681)))

(declare-fun lt!316074 () Unit!24335)

(declare-fun choose!36 (List!13117) Unit!24335)

(assert (=> d!95047 (= lt!316074 (choose!36 acc!681))))

(assert (=> d!95047 (= (lemmaListSubSeqRefl!0 acc!681) lt!316074)))

(declare-fun bs!20176 () Bool)

(assert (= bs!20176 d!95047))

(assert (=> bs!20176 m!652499))

(declare-fun m!652701 () Bool)

(assert (=> bs!20176 m!652701))

(assert (=> b!689358 d!95047))

(declare-fun d!95051 () Bool)

(assert (=> d!95051 (= (validKeyInArray!0 (select (arr!19037 a!3626) from!3004)) (and (not (= (select (arr!19037 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19037 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!689358 d!95051))

(declare-fun d!95053 () Bool)

(declare-fun res!454223 () Bool)

(declare-fun e!392578 () Bool)

(assert (=> d!95053 (=> res!454223 e!392578)))

(assert (=> d!95053 (= res!454223 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19418 a!3626)))))

(assert (=> d!95053 (= (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681) e!392578)))

(declare-fun e!392577 () Bool)

(declare-fun b!689597 () Bool)

(assert (=> b!689597 (= e!392577 (contains!3639 acc!681 (select (arr!19037 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!689598 () Bool)

(declare-fun e!392576 () Bool)

(declare-fun e!392579 () Bool)

(assert (=> b!689598 (= e!392576 e!392579)))

(declare-fun c!78055 () Bool)

(assert (=> b!689598 (= c!78055 (validKeyInArray!0 (select (arr!19037 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!689599 () Bool)

(declare-fun call!34163 () Bool)

(assert (=> b!689599 (= e!392579 call!34163)))

(declare-fun bm!34160 () Bool)

(assert (=> bm!34160 (= call!34163 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!78055 (Cons!13113 (select (arr!19037 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) acc!681) acc!681)))))

(declare-fun b!689600 () Bool)

(assert (=> b!689600 (= e!392578 e!392576)))

(declare-fun res!454221 () Bool)

(assert (=> b!689600 (=> (not res!454221) (not e!392576))))

(assert (=> b!689600 (= res!454221 (not e!392577))))

(declare-fun res!454222 () Bool)

(assert (=> b!689600 (=> (not res!454222) (not e!392577))))

(assert (=> b!689600 (= res!454222 (validKeyInArray!0 (select (arr!19037 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!689601 () Bool)

(assert (=> b!689601 (= e!392579 call!34163)))

(assert (= (and d!95053 (not res!454223)) b!689600))

(assert (= (and b!689600 res!454222) b!689597))

(assert (= (and b!689600 res!454221) b!689598))

(assert (= (and b!689598 c!78055) b!689601))

(assert (= (and b!689598 (not c!78055)) b!689599))

(assert (= (or b!689601 b!689599) bm!34160))

(assert (=> b!689597 m!652665))

(assert (=> b!689597 m!652665))

(declare-fun m!652711 () Bool)

(assert (=> b!689597 m!652711))

(assert (=> b!689598 m!652665))

(assert (=> b!689598 m!652665))

(assert (=> b!689598 m!652669))

(assert (=> bm!34160 m!652665))

(declare-fun m!652715 () Bool)

(assert (=> bm!34160 m!652715))

(assert (=> b!689600 m!652665))

(assert (=> b!689600 m!652665))

(assert (=> b!689600 m!652669))

(assert (=> b!689358 d!95053))

(declare-fun d!95057 () Bool)

(assert (=> d!95057 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!315991)))

(declare-fun lt!316079 () Unit!24335)

(declare-fun choose!66 (array!39732 (_ BitVec 64) (_ BitVec 32) List!13117 List!13117) Unit!24335)

(assert (=> d!95057 (= lt!316079 (choose!66 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!315991))))

(assert (=> d!95057 (bvslt (size!19418 a!3626) #b01111111111111111111111111111111)))

(assert (=> d!95057 (= (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!315991) lt!316079)))

(declare-fun bs!20177 () Bool)

(assert (= bs!20177 d!95057))

(assert (=> bs!20177 m!652523))

(declare-fun m!652735 () Bool)

(assert (=> bs!20177 m!652735))

(assert (=> b!689358 d!95057))

(declare-fun d!95065 () Bool)

(assert (=> d!95065 (= ($colon$colon!406 acc!681 k0!2843) (Cons!13113 k0!2843 acc!681))))

(assert (=> b!689358 d!95065))

(declare-fun d!95067 () Bool)

(declare-fun res!454236 () Bool)

(declare-fun e!392594 () Bool)

(assert (=> d!95067 (=> res!454236 e!392594)))

(assert (=> d!95067 (= res!454236 (= (select (arr!19037 lt!315995) from!3004) k0!2843))))

(assert (=> d!95067 (= (arrayContainsKey!0 lt!315995 k0!2843 from!3004) e!392594)))

(declare-fun b!689618 () Bool)

(declare-fun e!392595 () Bool)

(assert (=> b!689618 (= e!392594 e!392595)))

(declare-fun res!454237 () Bool)

(assert (=> b!689618 (=> (not res!454237) (not e!392595))))

(assert (=> b!689618 (= res!454237 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19418 lt!315995)))))

(declare-fun b!689619 () Bool)

(assert (=> b!689619 (= e!392595 (arrayContainsKey!0 lt!315995 k0!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!95067 (not res!454236)) b!689618))

(assert (= (and b!689618 res!454237) b!689619))

(declare-fun m!652737 () Bool)

(assert (=> d!95067 m!652737))

(declare-fun m!652739 () Bool)

(assert (=> b!689619 m!652739))

(assert (=> b!689358 d!95067))

(declare-fun d!95069 () Bool)

(declare-fun lt!316088 () Bool)

(assert (=> d!95069 (= lt!316088 (select (content!302 lt!315991) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!392613 () Bool)

(assert (=> d!95069 (= lt!316088 e!392613)))

(declare-fun res!454256 () Bool)

(assert (=> d!95069 (=> (not res!454256) (not e!392613))))

(assert (=> d!95069 (= res!454256 ((_ is Cons!13113) lt!315991))))

(assert (=> d!95069 (= (contains!3639 lt!315991 #b1000000000000000000000000000000000000000000000000000000000000000) lt!316088)))

(declare-fun b!689637 () Bool)

(declare-fun e!392614 () Bool)

(assert (=> b!689637 (= e!392613 e!392614)))

(declare-fun res!454255 () Bool)

(assert (=> b!689637 (=> res!454255 e!392614)))

(assert (=> b!689637 (= res!454255 (= (h!14158 lt!315991) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!689638 () Bool)

(assert (=> b!689638 (= e!392614 (contains!3639 (t!19372 lt!315991) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95069 res!454256) b!689637))

(assert (= (and b!689637 (not res!454255)) b!689638))

(assert (=> d!95069 m!652691))

(declare-fun m!652759 () Bool)

(assert (=> d!95069 m!652759))

(declare-fun m!652761 () Bool)

(assert (=> b!689638 m!652761))

(assert (=> b!689346 d!95069))

(declare-fun d!95079 () Bool)

(declare-fun lt!316089 () Bool)

(assert (=> d!95079 (= lt!316089 (select (content!302 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!392617 () Bool)

(assert (=> d!95079 (= lt!316089 e!392617)))

(declare-fun res!454260 () Bool)

(assert (=> d!95079 (=> (not res!454260) (not e!392617))))

(assert (=> d!95079 (= res!454260 ((_ is Cons!13113) acc!681))))

(assert (=> d!95079 (= (contains!3639 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!316089)))

(declare-fun b!689641 () Bool)

(declare-fun e!392618 () Bool)

(assert (=> b!689641 (= e!392617 e!392618)))

(declare-fun res!454259 () Bool)

(assert (=> b!689641 (=> res!454259 e!392618)))

(assert (=> b!689641 (= res!454259 (= (h!14158 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!689642 () Bool)

(assert (=> b!689642 (= e!392618 (contains!3639 (t!19372 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95079 res!454260) b!689641))

(assert (= (and b!689641 (not res!454259)) b!689642))

(declare-fun m!652767 () Bool)

(assert (=> d!95079 m!652767))

(declare-fun m!652769 () Bool)

(assert (=> d!95079 m!652769))

(declare-fun m!652771 () Bool)

(assert (=> b!689642 m!652771))

(assert (=> b!689357 d!95079))

(declare-fun d!95083 () Bool)

(declare-fun res!454271 () Bool)

(declare-fun e!392629 () Bool)

(assert (=> d!95083 (=> res!454271 e!392629)))

(assert (=> d!95083 (= res!454271 ((_ is Nil!13114) lt!315991))))

(assert (=> d!95083 (= (noDuplicate!908 lt!315991) e!392629)))

(declare-fun b!689653 () Bool)

(declare-fun e!392630 () Bool)

(assert (=> b!689653 (= e!392629 e!392630)))

(declare-fun res!454273 () Bool)

(assert (=> b!689653 (=> (not res!454273) (not e!392630))))

(assert (=> b!689653 (= res!454273 (not (contains!3639 (t!19372 lt!315991) (h!14158 lt!315991))))))

(declare-fun b!689654 () Bool)

(assert (=> b!689654 (= e!392630 (noDuplicate!908 (t!19372 lt!315991)))))

(assert (= (and d!95083 (not res!454271)) b!689653))

(assert (= (and b!689653 res!454273) b!689654))

(declare-fun m!652777 () Bool)

(assert (=> b!689653 m!652777))

(declare-fun m!652781 () Bool)

(assert (=> b!689654 m!652781))

(assert (=> b!689356 d!95083))

(declare-fun d!95089 () Bool)

(declare-fun res!454275 () Bool)

(declare-fun e!392633 () Bool)

(assert (=> d!95089 (=> res!454275 e!392633)))

(assert (=> d!95089 (= res!454275 (= (select (arr!19037 a!3626) #b00000000000000000000000000000000) k0!2843))))

(assert (=> d!95089 (= (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000) e!392633)))

(declare-fun b!689657 () Bool)

(declare-fun e!392634 () Bool)

(assert (=> b!689657 (= e!392633 e!392634)))

(declare-fun res!454276 () Bool)

(assert (=> b!689657 (=> (not res!454276) (not e!392634))))

(assert (=> b!689657 (= res!454276 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19418 a!3626)))))

(declare-fun b!689658 () Bool)

(assert (=> b!689658 (= e!392634 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!95089 (not res!454275)) b!689657))

(assert (= (and b!689657 res!454276) b!689658))

(declare-fun m!652787 () Bool)

(assert (=> d!95089 m!652787))

(declare-fun m!652789 () Bool)

(assert (=> b!689658 m!652789))

(assert (=> b!689367 d!95089))

(declare-fun d!95093 () Bool)

(declare-fun res!454279 () Bool)

(declare-fun e!392637 () Bool)

(assert (=> d!95093 (=> res!454279 e!392637)))

(assert (=> d!95093 (= res!454279 ((_ is Nil!13114) acc!681))))

(assert (=> d!95093 (= (noDuplicate!908 acc!681) e!392637)))

(declare-fun b!689661 () Bool)

(declare-fun e!392638 () Bool)

(assert (=> b!689661 (= e!392637 e!392638)))

(declare-fun res!454280 () Bool)

(assert (=> b!689661 (=> (not res!454280) (not e!392638))))

(assert (=> b!689661 (= res!454280 (not (contains!3639 (t!19372 acc!681) (h!14158 acc!681))))))

(declare-fun b!689662 () Bool)

(assert (=> b!689662 (= e!392638 (noDuplicate!908 (t!19372 acc!681)))))

(assert (= (and d!95093 (not res!454279)) b!689661))

(assert (= (and b!689661 res!454280) b!689662))

(declare-fun m!652791 () Bool)

(assert (=> b!689661 m!652791))

(declare-fun m!652793 () Bool)

(assert (=> b!689662 m!652793))

(assert (=> b!689345 d!95093))

(declare-fun d!95095 () Bool)

(declare-fun res!454287 () Bool)

(declare-fun e!392647 () Bool)

(assert (=> d!95095 (=> res!454287 e!392647)))

(assert (=> d!95095 (= res!454287 (bvsge #b00000000000000000000000000000000 (size!19418 a!3626)))))

(assert (=> d!95095 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13114) e!392647)))

(declare-fun b!689671 () Bool)

(declare-fun e!392646 () Bool)

(assert (=> b!689671 (= e!392646 (contains!3639 Nil!13114 (select (arr!19037 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!689672 () Bool)

(declare-fun e!392645 () Bool)

(declare-fun e!392648 () Bool)

(assert (=> b!689672 (= e!392645 e!392648)))

(declare-fun c!78060 () Bool)

(assert (=> b!689672 (= c!78060 (validKeyInArray!0 (select (arr!19037 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!689673 () Bool)

(declare-fun call!34166 () Bool)

(assert (=> b!689673 (= e!392648 call!34166)))

(declare-fun bm!34163 () Bool)

(assert (=> bm!34163 (= call!34166 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!78060 (Cons!13113 (select (arr!19037 a!3626) #b00000000000000000000000000000000) Nil!13114) Nil!13114)))))

(declare-fun b!689674 () Bool)

(assert (=> b!689674 (= e!392647 e!392645)))

(declare-fun res!454285 () Bool)

(assert (=> b!689674 (=> (not res!454285) (not e!392645))))

(assert (=> b!689674 (= res!454285 (not e!392646))))

(declare-fun res!454286 () Bool)

(assert (=> b!689674 (=> (not res!454286) (not e!392646))))

(assert (=> b!689674 (= res!454286 (validKeyInArray!0 (select (arr!19037 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!689675 () Bool)

(assert (=> b!689675 (= e!392648 call!34166)))

(assert (= (and d!95095 (not res!454287)) b!689674))

(assert (= (and b!689674 res!454286) b!689671))

(assert (= (and b!689674 res!454285) b!689672))

(assert (= (and b!689672 c!78060) b!689675))

(assert (= (and b!689672 (not c!78060)) b!689673))

(assert (= (or b!689675 b!689673) bm!34163))

(assert (=> b!689671 m!652787))

(assert (=> b!689671 m!652787))

(declare-fun m!652799 () Bool)

(assert (=> b!689671 m!652799))

(assert (=> b!689672 m!652787))

(assert (=> b!689672 m!652787))

(declare-fun m!652801 () Bool)

(assert (=> b!689672 m!652801))

(assert (=> bm!34163 m!652787))

(declare-fun m!652803 () Bool)

(assert (=> bm!34163 m!652803))

(assert (=> b!689674 m!652787))

(assert (=> b!689674 m!652787))

(assert (=> b!689674 m!652801))

(assert (=> b!689344 d!95095))

(declare-fun d!95101 () Bool)

(assert (=> d!95101 (= (validKeyInArray!0 k0!2843) (and (not (= k0!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!689354 d!95101))

(declare-fun d!95103 () Bool)

(assert (=> d!95103 (= ($colon$colon!406 acc!681 (select (arr!19037 a!3626) from!3004)) (Cons!13113 (select (arr!19037 a!3626) from!3004) acc!681))))

(assert (=> b!689364 d!95103))

(assert (=> b!689364 d!95035))

(declare-fun d!95105 () Bool)

(assert (=> d!95105 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!316094 () Unit!24335)

(declare-fun choose!80 (array!39732 List!13117 List!13117 (_ BitVec 32)) Unit!24335)

(assert (=> d!95105 (= lt!316094 (choose!80 a!3626 ($colon$colon!406 acc!681 (select (arr!19037 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> d!95105 (bvslt (size!19418 a!3626) #b01111111111111111111111111111111)))

(assert (=> d!95105 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!406 acc!681 (select (arr!19037 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)) lt!316094)))

(declare-fun bs!20178 () Bool)

(assert (= bs!20178 d!95105))

(assert (=> bs!20178 m!652489))

(assert (=> bs!20178 m!652493))

(declare-fun m!652813 () Bool)

(assert (=> bs!20178 m!652813))

(assert (=> b!689364 d!95105))

(assert (=> b!689364 d!95047))

(assert (=> b!689364 d!95053))

(declare-fun d!95109 () Bool)

(assert (=> d!95109 (= (array_inv!14920 a!3626) (bvsge (size!19418 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!61580 d!95109))

(declare-fun d!95113 () Bool)

(declare-fun lt!316095 () Bool)

(assert (=> d!95113 (= lt!316095 (select (content!302 acc!681) k0!2843))))

(declare-fun e!392671 () Bool)

(assert (=> d!95113 (= lt!316095 e!392671)))

(declare-fun res!454309 () Bool)

(assert (=> d!95113 (=> (not res!454309) (not e!392671))))

(assert (=> d!95113 (= res!454309 ((_ is Cons!13113) acc!681))))

(assert (=> d!95113 (= (contains!3639 acc!681 k0!2843) lt!316095)))

(declare-fun b!689700 () Bool)

(declare-fun e!392672 () Bool)

(assert (=> b!689700 (= e!392671 e!392672)))

(declare-fun res!454308 () Bool)

(assert (=> b!689700 (=> res!454308 e!392672)))

(assert (=> b!689700 (= res!454308 (= (h!14158 acc!681) k0!2843))))

(declare-fun b!689701 () Bool)

(assert (=> b!689701 (= e!392672 (contains!3639 (t!19372 acc!681) k0!2843))))

(assert (= (and d!95113 res!454309) b!689700))

(assert (= (and b!689700 (not res!454308)) b!689701))

(assert (=> d!95113 m!652767))

(declare-fun m!652827 () Bool)

(assert (=> d!95113 m!652827))

(declare-fun m!652829 () Bool)

(assert (=> b!689701 m!652829))

(assert (=> b!689353 d!95113))

(declare-fun d!95117 () Bool)

(declare-fun lt!316096 () Bool)

(assert (=> d!95117 (= lt!316096 (select (content!302 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!392673 () Bool)

(assert (=> d!95117 (= lt!316096 e!392673)))

(declare-fun res!454311 () Bool)

(assert (=> d!95117 (=> (not res!454311) (not e!392673))))

(assert (=> d!95117 (= res!454311 ((_ is Cons!13113) acc!681))))

(assert (=> d!95117 (= (contains!3639 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!316096)))

(declare-fun b!689702 () Bool)

(declare-fun e!392674 () Bool)

(assert (=> b!689702 (= e!392673 e!392674)))

(declare-fun res!454310 () Bool)

(assert (=> b!689702 (=> res!454310 e!392674)))

(assert (=> b!689702 (= res!454310 (= (h!14158 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!689703 () Bool)

(assert (=> b!689703 (= e!392674 (contains!3639 (t!19372 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95117 res!454311) b!689702))

(assert (= (and b!689702 (not res!454310)) b!689703))

(assert (=> d!95117 m!652767))

(declare-fun m!652831 () Bool)

(assert (=> d!95117 m!652831))

(declare-fun m!652833 () Bool)

(assert (=> b!689703 m!652833))

(assert (=> b!689352 d!95117))

(declare-fun d!95119 () Bool)

(declare-fun res!454314 () Bool)

(declare-fun e!392677 () Bool)

(assert (=> d!95119 (=> res!454314 e!392677)))

(assert (=> d!95119 (= res!454314 (bvsge from!3004 (size!19418 lt!315995)))))

(assert (=> d!95119 (= (arrayNoDuplicates!0 lt!315995 from!3004 acc!681) e!392677)))

(declare-fun b!689704 () Bool)

(declare-fun e!392676 () Bool)

(assert (=> b!689704 (= e!392676 (contains!3639 acc!681 (select (arr!19037 lt!315995) from!3004)))))

(declare-fun b!689705 () Bool)

(declare-fun e!392675 () Bool)

(declare-fun e!392678 () Bool)

(assert (=> b!689705 (= e!392675 e!392678)))

(declare-fun c!78063 () Bool)

(assert (=> b!689705 (= c!78063 (validKeyInArray!0 (select (arr!19037 lt!315995) from!3004)))))

(declare-fun b!689706 () Bool)

(declare-fun call!34171 () Bool)

(assert (=> b!689706 (= e!392678 call!34171)))

(declare-fun bm!34168 () Bool)

(assert (=> bm!34168 (= call!34171 (arrayNoDuplicates!0 lt!315995 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!78063 (Cons!13113 (select (arr!19037 lt!315995) from!3004) acc!681) acc!681)))))

(declare-fun b!689707 () Bool)

(assert (=> b!689707 (= e!392677 e!392675)))

(declare-fun res!454312 () Bool)

(assert (=> b!689707 (=> (not res!454312) (not e!392675))))

(assert (=> b!689707 (= res!454312 (not e!392676))))

(declare-fun res!454313 () Bool)

(assert (=> b!689707 (=> (not res!454313) (not e!392676))))

(assert (=> b!689707 (= res!454313 (validKeyInArray!0 (select (arr!19037 lt!315995) from!3004)))))

(declare-fun b!689708 () Bool)

(assert (=> b!689708 (= e!392678 call!34171)))

(assert (= (and d!95119 (not res!454314)) b!689707))

(assert (= (and b!689707 res!454313) b!689704))

(assert (= (and b!689707 res!454312) b!689705))

(assert (= (and b!689705 c!78063) b!689708))

(assert (= (and b!689705 (not c!78063)) b!689706))

(assert (= (or b!689708 b!689706) bm!34168))

(assert (=> b!689704 m!652737))

(assert (=> b!689704 m!652737))

(declare-fun m!652835 () Bool)

(assert (=> b!689704 m!652835))

(assert (=> b!689705 m!652737))

(assert (=> b!689705 m!652737))

(declare-fun m!652837 () Bool)

(assert (=> b!689705 m!652837))

(assert (=> bm!34168 m!652737))

(declare-fun m!652839 () Bool)

(assert (=> bm!34168 m!652839))

(assert (=> b!689707 m!652737))

(assert (=> b!689707 m!652737))

(assert (=> b!689707 m!652837))

(assert (=> b!689363 d!95119))

(declare-fun d!95121 () Bool)

(declare-fun res!454319 () Bool)

(declare-fun e!392683 () Bool)

(assert (=> d!95121 (=> res!454319 e!392683)))

(assert (=> d!95121 (= res!454319 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19418 lt!315995)))))

(assert (=> d!95121 (= (arrayNoDuplicates!0 lt!315995 (bvadd #b00000000000000000000000000000001 from!3004) lt!315991) e!392683)))

(declare-fun e!392682 () Bool)

(declare-fun b!689711 () Bool)

(assert (=> b!689711 (= e!392682 (contains!3639 lt!315991 (select (arr!19037 lt!315995) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!689712 () Bool)

(declare-fun e!392681 () Bool)

(declare-fun e!392684 () Bool)

(assert (=> b!689712 (= e!392681 e!392684)))

(declare-fun c!78064 () Bool)

(assert (=> b!689712 (= c!78064 (validKeyInArray!0 (select (arr!19037 lt!315995) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!689713 () Bool)

(declare-fun call!34172 () Bool)

(assert (=> b!689713 (= e!392684 call!34172)))

(declare-fun bm!34169 () Bool)

(assert (=> bm!34169 (= call!34172 (arrayNoDuplicates!0 lt!315995 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!78064 (Cons!13113 (select (arr!19037 lt!315995) (bvadd #b00000000000000000000000000000001 from!3004)) lt!315991) lt!315991)))))

(declare-fun b!689714 () Bool)

(assert (=> b!689714 (= e!392683 e!392681)))

(declare-fun res!454317 () Bool)

(assert (=> b!689714 (=> (not res!454317) (not e!392681))))

(assert (=> b!689714 (= res!454317 (not e!392682))))

(declare-fun res!454318 () Bool)

(assert (=> b!689714 (=> (not res!454318) (not e!392682))))

(assert (=> b!689714 (= res!454318 (validKeyInArray!0 (select (arr!19037 lt!315995) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!689715 () Bool)

(assert (=> b!689715 (= e!392684 call!34172)))

(assert (= (and d!95121 (not res!454319)) b!689714))

(assert (= (and b!689714 res!454318) b!689711))

(assert (= (and b!689714 res!454317) b!689712))

(assert (= (and b!689712 c!78064) b!689715))

(assert (= (and b!689712 (not c!78064)) b!689713))

(assert (= (or b!689715 b!689713) bm!34169))

(declare-fun m!652841 () Bool)

(assert (=> b!689711 m!652841))

(assert (=> b!689711 m!652841))

(declare-fun m!652843 () Bool)

(assert (=> b!689711 m!652843))

(assert (=> b!689712 m!652841))

(assert (=> b!689712 m!652841))

(declare-fun m!652845 () Bool)

(assert (=> b!689712 m!652845))

(assert (=> bm!34169 m!652841))

(declare-fun m!652847 () Bool)

(assert (=> bm!34169 m!652847))

(assert (=> b!689714 m!652841))

(assert (=> b!689714 m!652841))

(assert (=> b!689714 m!652845))

(assert (=> b!689363 d!95121))

(declare-fun d!95123 () Bool)

(declare-fun e!392704 () Bool)

(assert (=> d!95123 e!392704))

(declare-fun res!454337 () Bool)

(assert (=> d!95123 (=> (not res!454337) (not e!392704))))

(assert (=> d!95123 (= res!454337 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19418 a!3626))))))

(declare-fun lt!316105 () Unit!24335)

(declare-fun choose!41 (array!39732 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!13117) Unit!24335)

(assert (=> d!95123 (= lt!316105 (choose!41 a!3626 k0!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) lt!315991))))

(assert (=> d!95123 (bvslt (size!19418 a!3626) #b01111111111111111111111111111111)))

(assert (=> d!95123 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k0!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) lt!315991) lt!316105)))

(declare-fun b!689737 () Bool)

(assert (=> b!689737 (= e!392704 (arrayNoDuplicates!0 (array!39733 (store (arr!19037 a!3626) i!1382 k0!2843) (size!19418 a!3626)) (bvadd #b00000000000000000000000000000001 from!3004) lt!315991))))

(assert (= (and d!95123 res!454337) b!689737))

(declare-fun m!652873 () Bool)

(assert (=> d!95123 m!652873))

(assert (=> b!689737 m!652509))

(declare-fun m!652875 () Bool)

(assert (=> b!689737 m!652875))

(assert (=> b!689363 d!95123))

(declare-fun d!95141 () Bool)

(declare-fun lt!316106 () Bool)

(assert (=> d!95141 (= lt!316106 (select (content!302 lt!315991) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!392705 () Bool)

(assert (=> d!95141 (= lt!316106 e!392705)))

(declare-fun res!454339 () Bool)

(assert (=> d!95141 (=> (not res!454339) (not e!392705))))

(assert (=> d!95141 (= res!454339 ((_ is Cons!13113) lt!315991))))

(assert (=> d!95141 (= (contains!3639 lt!315991 #b0000000000000000000000000000000000000000000000000000000000000000) lt!316106)))

(declare-fun b!689738 () Bool)

(declare-fun e!392706 () Bool)

(assert (=> b!689738 (= e!392705 e!392706)))

(declare-fun res!454338 () Bool)

(assert (=> b!689738 (=> res!454338 e!392706)))

(assert (=> b!689738 (= res!454338 (= (h!14158 lt!315991) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!689739 () Bool)

(assert (=> b!689739 (= e!392706 (contains!3639 (t!19372 lt!315991) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95141 res!454339) b!689738))

(assert (= (and b!689738 (not res!454338)) b!689739))

(assert (=> d!95141 m!652691))

(declare-fun m!652877 () Bool)

(assert (=> d!95141 m!652877))

(declare-fun m!652879 () Bool)

(assert (=> b!689739 m!652879))

(assert (=> b!689362 d!95141))

(declare-fun d!95143 () Bool)

(declare-fun res!454342 () Bool)

(declare-fun e!392709 () Bool)

(assert (=> d!95143 (=> res!454342 e!392709)))

(assert (=> d!95143 (= res!454342 (bvsge from!3004 (size!19418 a!3626)))))

(assert (=> d!95143 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!392709)))

(declare-fun b!689740 () Bool)

(declare-fun e!392708 () Bool)

(assert (=> b!689740 (= e!392708 (contains!3639 acc!681 (select (arr!19037 a!3626) from!3004)))))

(declare-fun b!689741 () Bool)

(declare-fun e!392707 () Bool)

(declare-fun e!392710 () Bool)

(assert (=> b!689741 (= e!392707 e!392710)))

(declare-fun c!78067 () Bool)

(assert (=> b!689741 (= c!78067 (validKeyInArray!0 (select (arr!19037 a!3626) from!3004)))))

(declare-fun b!689742 () Bool)

(declare-fun call!34175 () Bool)

(assert (=> b!689742 (= e!392710 call!34175)))

(declare-fun bm!34172 () Bool)

(assert (=> bm!34172 (= call!34175 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!78067 (Cons!13113 (select (arr!19037 a!3626) from!3004) acc!681) acc!681)))))

(declare-fun b!689743 () Bool)

(assert (=> b!689743 (= e!392709 e!392707)))

(declare-fun res!454340 () Bool)

(assert (=> b!689743 (=> (not res!454340) (not e!392707))))

(assert (=> b!689743 (= res!454340 (not e!392708))))

(declare-fun res!454341 () Bool)

(assert (=> b!689743 (=> (not res!454341) (not e!392708))))

(assert (=> b!689743 (= res!454341 (validKeyInArray!0 (select (arr!19037 a!3626) from!3004)))))

(declare-fun b!689744 () Bool)

(assert (=> b!689744 (= e!392710 call!34175)))

(assert (= (and d!95143 (not res!454342)) b!689743))

(assert (= (and b!689743 res!454341) b!689740))

(assert (= (and b!689743 res!454340) b!689741))

(assert (= (and b!689741 c!78067) b!689744))

(assert (= (and b!689741 (not c!78067)) b!689742))

(assert (= (or b!689744 b!689742) bm!34172))

(assert (=> b!689740 m!652491))

(assert (=> b!689740 m!652491))

(declare-fun m!652881 () Bool)

(assert (=> b!689740 m!652881))

(assert (=> b!689741 m!652491))

(assert (=> b!689741 m!652491))

(assert (=> b!689741 m!652511))

(assert (=> bm!34172 m!652491))

(declare-fun m!652883 () Bool)

(assert (=> bm!34172 m!652883))

(assert (=> b!689743 m!652491))

(assert (=> b!689743 m!652491))

(assert (=> b!689743 m!652511))

(assert (=> b!689351 d!95143))

(declare-fun d!95145 () Bool)

(declare-fun lt!316107 () Bool)

(assert (=> d!95145 (= lt!316107 (select (content!302 lt!315991) k0!2843))))

(declare-fun e!392711 () Bool)

(assert (=> d!95145 (= lt!316107 e!392711)))

(declare-fun res!454344 () Bool)

(assert (=> d!95145 (=> (not res!454344) (not e!392711))))

(assert (=> d!95145 (= res!454344 ((_ is Cons!13113) lt!315991))))

(assert (=> d!95145 (= (contains!3639 lt!315991 k0!2843) lt!316107)))

(declare-fun b!689745 () Bool)

(declare-fun e!392712 () Bool)

(assert (=> b!689745 (= e!392711 e!392712)))

(declare-fun res!454343 () Bool)

(assert (=> b!689745 (=> res!454343 e!392712)))

(assert (=> b!689745 (= res!454343 (= (h!14158 lt!315991) k0!2843))))

(declare-fun b!689746 () Bool)

(assert (=> b!689746 (= e!392712 (contains!3639 (t!19372 lt!315991) k0!2843))))

(assert (= (and d!95145 res!454344) b!689745))

(assert (= (and b!689745 (not res!454343)) b!689746))

(assert (=> d!95145 m!652691))

(declare-fun m!652885 () Bool)

(assert (=> d!95145 m!652885))

(declare-fun m!652887 () Bool)

(assert (=> b!689746 m!652887))

(assert (=> b!689360 d!95145))

(assert (=> b!689349 d!95145))

(assert (=> b!689348 d!95113))

(declare-fun d!95147 () Bool)

(assert (=> d!95147 (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))

(declare-fun lt!316113 () Unit!24335)

(declare-fun choose!13 (array!39732 (_ BitVec 64) (_ BitVec 32)) Unit!24335)

(assert (=> d!95147 (= lt!316113 (choose!13 a!3626 k0!2843 from!3004))))

(assert (=> d!95147 (bvsge from!3004 #b00000000000000000000000000000000)))

(assert (=> d!95147 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004) lt!316113)))

(declare-fun bs!20181 () Bool)

(assert (= bs!20181 d!95147))

(assert (=> bs!20181 m!652503))

(declare-fun m!652893 () Bool)

(assert (=> bs!20181 m!652893))

(assert (=> b!689359 d!95147))

(check-sat (not b!689701) (not d!95079) (not bm!34156) (not b!689600) (not b!689661) (not bm!34163) (not b!689537) (not d!95047) (not bm!34172) (not b!689556) (not bm!34160) (not b!689705) (not bm!34153) (not d!95045) (not b!689597) (not d!95113) (not b!689739) (not b!689743) (not b!689619) (not b!689711) (not b!689638) (not b!689741) (not b!689662) (not d!95069) (not d!95057) (not d!95123) (not b!689654) (not b!689674) (not b!689658) (not b!689598) (not bm!34168) (not d!95039) (not b!689549) (not b!689642) (not d!95141) (not b!689704) (not d!95117) (not b!689671) (not b!689707) (not b!689534) (not b!689535) (not b!689712) (not bm!34169) (not d!95105) (not b!689714) (not b!689703) (not b!689653) (not b!689740) (not d!95147) (not b!689574) (not b!689746) (not b!689737) (not b!689550) (not b!689672) (not d!95145))
(check-sat)
