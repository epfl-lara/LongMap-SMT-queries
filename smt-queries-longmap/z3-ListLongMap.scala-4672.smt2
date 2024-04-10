; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64950 () Bool)

(assert start!64950)

(declare-fun b!733508 () Bool)

(declare-fun e!410413 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun lt!325110 () (_ BitVec 32))

(assert (=> b!733508 (= e!410413 (or (bvslt mask!3328 #b00000000000000000000000000000000) (and (bvsge lt!325110 #b00000000000000000000000000000000) (bvslt lt!325110 (bvadd #b00000000000000000000000000000001 mask!3328)))))))

(declare-fun b!733509 () Bool)

(declare-fun res!493002 () Bool)

(declare-fun e!410412 () Bool)

(assert (=> b!733509 (=> (not res!493002) (not e!410412))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41261 0))(
  ( (array!41262 (arr!19747 (Array (_ BitVec 32) (_ BitVec 64))) (size!20168 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41261)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!733509 (= res!493002 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19747 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!733511 () Bool)

(declare-fun e!410417 () Bool)

(declare-fun e!410416 () Bool)

(assert (=> b!733511 (= e!410417 e!410416)))

(declare-fun res!492994 () Bool)

(assert (=> b!733511 (=> (not res!492994) (not e!410416))))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7347 0))(
  ( (MissingZero!7347 (index!31756 (_ BitVec 32))) (Found!7347 (index!31757 (_ BitVec 32))) (Intermediate!7347 (undefined!8159 Bool) (index!31758 (_ BitVec 32)) (x!62745 (_ BitVec 32))) (Undefined!7347) (MissingVacant!7347 (index!31759 (_ BitVec 32))) )
))
(declare-fun lt!325105 () SeekEntryResult!7347)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41261 (_ BitVec 32)) SeekEntryResult!7347)

(assert (=> b!733511 (= res!492994 (= (seekEntryOrOpen!0 (select (arr!19747 a!3186) j!159) a!3186 mask!3328) lt!325105))))

(assert (=> b!733511 (= lt!325105 (Found!7347 j!159))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!733512 () Bool)

(declare-fun e!410418 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41261 (_ BitVec 32)) SeekEntryResult!7347)

(assert (=> b!733512 (= e!410418 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19747 a!3186) j!159) a!3186 mask!3328) (Found!7347 j!159)))))

(declare-fun b!733513 () Bool)

(declare-fun res!493000 () Bool)

(declare-fun e!410420 () Bool)

(assert (=> b!733513 (=> (not res!493000) (not e!410420))))

(declare-datatypes ((List!13749 0))(
  ( (Nil!13746) (Cons!13745 (h!14811 (_ BitVec 64)) (t!20064 List!13749)) )
))
(declare-fun arrayNoDuplicates!0 (array!41261 (_ BitVec 32) List!13749) Bool)

(assert (=> b!733513 (= res!493000 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13746))))

(declare-fun b!733514 () Bool)

(declare-fun e!410415 () Bool)

(assert (=> b!733514 (= e!410415 e!410420)))

(declare-fun res!492996 () Bool)

(assert (=> b!733514 (=> (not res!492996) (not e!410420))))

(declare-fun lt!325109 () SeekEntryResult!7347)

(assert (=> b!733514 (= res!492996 (or (= lt!325109 (MissingZero!7347 i!1173)) (= lt!325109 (MissingVacant!7347 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!733514 (= lt!325109 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!733515 () Bool)

(assert (=> b!733515 (= e!410420 e!410412)))

(declare-fun res!492998 () Bool)

(assert (=> b!733515 (=> (not res!492998) (not e!410412))))

(declare-fun lt!325106 () SeekEntryResult!7347)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41261 (_ BitVec 32)) SeekEntryResult!7347)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!733515 (= res!492998 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19747 a!3186) j!159) mask!3328) (select (arr!19747 a!3186) j!159) a!3186 mask!3328) lt!325106))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!733515 (= lt!325106 (Intermediate!7347 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!733516 () Bool)

(declare-fun res!492991 () Bool)

(assert (=> b!733516 (=> (not res!492991) (not e!410415))))

(declare-fun arrayContainsKey!0 (array!41261 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!733516 (= res!492991 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!733517 () Bool)

(declare-fun e!410411 () Bool)

(assert (=> b!733517 (= e!410412 e!410411)))

(declare-fun res!492999 () Bool)

(assert (=> b!733517 (=> (not res!492999) (not e!410411))))

(declare-fun lt!325107 () SeekEntryResult!7347)

(declare-fun lt!325112 () SeekEntryResult!7347)

(assert (=> b!733517 (= res!492999 (= lt!325107 lt!325112))))

(declare-fun lt!325108 () array!41261)

(declare-fun lt!325111 () (_ BitVec 64))

(assert (=> b!733517 (= lt!325112 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!325111 lt!325108 mask!3328))))

(assert (=> b!733517 (= lt!325107 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!325111 mask!3328) lt!325111 lt!325108 mask!3328))))

(assert (=> b!733517 (= lt!325111 (select (store (arr!19747 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!733517 (= lt!325108 (array!41262 (store (arr!19747 a!3186) i!1173 k0!2102) (size!20168 a!3186)))))

(declare-fun b!733518 () Bool)

(declare-fun res!493004 () Bool)

(assert (=> b!733518 (=> res!493004 e!410413)))

(assert (=> b!733518 (= res!493004 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19747 a!3186) j!159) a!3186 mask!3328) (Found!7347 j!159)))))

(declare-fun b!733519 () Bool)

(declare-fun res!492988 () Bool)

(assert (=> b!733519 (=> (not res!492988) (not e!410420))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41261 (_ BitVec 32)) Bool)

(assert (=> b!733519 (= res!492988 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!733510 () Bool)

(declare-fun e!410414 () Bool)

(assert (=> b!733510 (= e!410411 (not e!410414))))

(declare-fun res!492987 () Bool)

(assert (=> b!733510 (=> res!492987 e!410414)))

(get-info :version)

(assert (=> b!733510 (= res!492987 (or (not ((_ is Intermediate!7347) lt!325112)) (bvsge x!1131 (x!62745 lt!325112))))))

(assert (=> b!733510 e!410417))

(declare-fun res!492989 () Bool)

(assert (=> b!733510 (=> (not res!492989) (not e!410417))))

(assert (=> b!733510 (= res!492989 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25012 0))(
  ( (Unit!25013) )
))
(declare-fun lt!325104 () Unit!25012)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41261 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25012)

(assert (=> b!733510 (= lt!325104 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun res!492992 () Bool)

(assert (=> start!64950 (=> (not res!492992) (not e!410415))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64950 (= res!492992 (validMask!0 mask!3328))))

(assert (=> start!64950 e!410415))

(assert (=> start!64950 true))

(declare-fun array_inv!15543 (array!41261) Bool)

(assert (=> start!64950 (array_inv!15543 a!3186)))

(declare-fun b!733520 () Bool)

(assert (=> b!733520 (= e!410414 e!410413)))

(declare-fun res!492995 () Bool)

(assert (=> b!733520 (=> res!492995 e!410413)))

(assert (=> b!733520 (= res!492995 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!733520 (= lt!325110 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!733521 () Bool)

(declare-fun res!493003 () Bool)

(assert (=> b!733521 (=> (not res!493003) (not e!410415))))

(assert (=> b!733521 (= res!493003 (and (= (size!20168 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20168 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20168 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!733522 () Bool)

(declare-fun res!492997 () Bool)

(assert (=> b!733522 (=> (not res!492997) (not e!410415))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!733522 (= res!492997 (validKeyInArray!0 (select (arr!19747 a!3186) j!159)))))

(declare-fun b!733523 () Bool)

(declare-fun res!493001 () Bool)

(assert (=> b!733523 (=> (not res!493001) (not e!410412))))

(assert (=> b!733523 (= res!493001 e!410418)))

(declare-fun c!80638 () Bool)

(assert (=> b!733523 (= c!80638 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!733524 () Bool)

(assert (=> b!733524 (= e!410416 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19747 a!3186) j!159) a!3186 mask!3328) lt!325105))))

(declare-fun b!733525 () Bool)

(assert (=> b!733525 (= e!410418 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19747 a!3186) j!159) a!3186 mask!3328) lt!325106))))

(declare-fun b!733526 () Bool)

(declare-fun res!492993 () Bool)

(assert (=> b!733526 (=> (not res!492993) (not e!410420))))

(assert (=> b!733526 (= res!492993 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20168 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20168 a!3186))))))

(declare-fun b!733527 () Bool)

(declare-fun res!492990 () Bool)

(assert (=> b!733527 (=> (not res!492990) (not e!410415))))

(assert (=> b!733527 (= res!492990 (validKeyInArray!0 k0!2102))))

(assert (= (and start!64950 res!492992) b!733521))

(assert (= (and b!733521 res!493003) b!733522))

(assert (= (and b!733522 res!492997) b!733527))

(assert (= (and b!733527 res!492990) b!733516))

(assert (= (and b!733516 res!492991) b!733514))

(assert (= (and b!733514 res!492996) b!733519))

(assert (= (and b!733519 res!492988) b!733513))

(assert (= (and b!733513 res!493000) b!733526))

(assert (= (and b!733526 res!492993) b!733515))

(assert (= (and b!733515 res!492998) b!733509))

(assert (= (and b!733509 res!493002) b!733523))

(assert (= (and b!733523 c!80638) b!733525))

(assert (= (and b!733523 (not c!80638)) b!733512))

(assert (= (and b!733523 res!493001) b!733517))

(assert (= (and b!733517 res!492999) b!733510))

(assert (= (and b!733510 res!492989) b!733511))

(assert (= (and b!733511 res!492994) b!733524))

(assert (= (and b!733510 (not res!492987)) b!733520))

(assert (= (and b!733520 (not res!492995)) b!733518))

(assert (= (and b!733518 (not res!493004)) b!733508))

(declare-fun m!686383 () Bool)

(assert (=> b!733525 m!686383))

(assert (=> b!733525 m!686383))

(declare-fun m!686385 () Bool)

(assert (=> b!733525 m!686385))

(declare-fun m!686387 () Bool)

(assert (=> b!733514 m!686387))

(declare-fun m!686389 () Bool)

(assert (=> b!733519 m!686389))

(declare-fun m!686391 () Bool)

(assert (=> b!733513 m!686391))

(declare-fun m!686393 () Bool)

(assert (=> b!733510 m!686393))

(declare-fun m!686395 () Bool)

(assert (=> b!733510 m!686395))

(assert (=> b!733515 m!686383))

(assert (=> b!733515 m!686383))

(declare-fun m!686397 () Bool)

(assert (=> b!733515 m!686397))

(assert (=> b!733515 m!686397))

(assert (=> b!733515 m!686383))

(declare-fun m!686399 () Bool)

(assert (=> b!733515 m!686399))

(declare-fun m!686401 () Bool)

(assert (=> start!64950 m!686401))

(declare-fun m!686403 () Bool)

(assert (=> start!64950 m!686403))

(declare-fun m!686405 () Bool)

(assert (=> b!733516 m!686405))

(declare-fun m!686407 () Bool)

(assert (=> b!733517 m!686407))

(declare-fun m!686409 () Bool)

(assert (=> b!733517 m!686409))

(declare-fun m!686411 () Bool)

(assert (=> b!733517 m!686411))

(declare-fun m!686413 () Bool)

(assert (=> b!733517 m!686413))

(declare-fun m!686415 () Bool)

(assert (=> b!733517 m!686415))

(assert (=> b!733517 m!686413))

(assert (=> b!733524 m!686383))

(assert (=> b!733524 m!686383))

(declare-fun m!686417 () Bool)

(assert (=> b!733524 m!686417))

(assert (=> b!733518 m!686383))

(assert (=> b!733518 m!686383))

(declare-fun m!686419 () Bool)

(assert (=> b!733518 m!686419))

(assert (=> b!733522 m!686383))

(assert (=> b!733522 m!686383))

(declare-fun m!686421 () Bool)

(assert (=> b!733522 m!686421))

(assert (=> b!733512 m!686383))

(assert (=> b!733512 m!686383))

(assert (=> b!733512 m!686419))

(declare-fun m!686423 () Bool)

(assert (=> b!733509 m!686423))

(declare-fun m!686425 () Bool)

(assert (=> b!733520 m!686425))

(assert (=> b!733511 m!686383))

(assert (=> b!733511 m!686383))

(declare-fun m!686427 () Bool)

(assert (=> b!733511 m!686427))

(declare-fun m!686429 () Bool)

(assert (=> b!733527 m!686429))

(check-sat (not b!733518) (not b!733517) (not b!733524) (not b!733522) (not b!733513) (not b!733514) (not b!733520) (not b!733512) (not b!733510) (not b!733519) (not b!733516) (not b!733511) (not start!64950) (not b!733527) (not b!733515) (not b!733525))
(check-sat)
(get-model)

(declare-fun bm!34869 () Bool)

(declare-fun call!34872 () Bool)

(assert (=> bm!34869 (= call!34872 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!733597 () Bool)

(declare-fun e!410458 () Bool)

(declare-fun e!410459 () Bool)

(assert (=> b!733597 (= e!410458 e!410459)))

(declare-fun lt!325147 () (_ BitVec 64))

(assert (=> b!733597 (= lt!325147 (select (arr!19747 a!3186) j!159))))

(declare-fun lt!325146 () Unit!25012)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!41261 (_ BitVec 64) (_ BitVec 32)) Unit!25012)

(assert (=> b!733597 (= lt!325146 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!325147 j!159))))

(assert (=> b!733597 (arrayContainsKey!0 a!3186 lt!325147 #b00000000000000000000000000000000)))

(declare-fun lt!325148 () Unit!25012)

(assert (=> b!733597 (= lt!325148 lt!325146)))

(declare-fun res!493064 () Bool)

(assert (=> b!733597 (= res!493064 (= (seekEntryOrOpen!0 (select (arr!19747 a!3186) j!159) a!3186 mask!3328) (Found!7347 j!159)))))

(assert (=> b!733597 (=> (not res!493064) (not e!410459))))

(declare-fun b!733598 () Bool)

(assert (=> b!733598 (= e!410458 call!34872)))

(declare-fun b!733599 () Bool)

(declare-fun e!410457 () Bool)

(assert (=> b!733599 (= e!410457 e!410458)))

(declare-fun c!80644 () Bool)

(assert (=> b!733599 (= c!80644 (validKeyInArray!0 (select (arr!19747 a!3186) j!159)))))

(declare-fun d!99867 () Bool)

(declare-fun res!493063 () Bool)

(assert (=> d!99867 (=> res!493063 e!410457)))

(assert (=> d!99867 (= res!493063 (bvsge j!159 (size!20168 a!3186)))))

(assert (=> d!99867 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!410457)))

(declare-fun b!733596 () Bool)

(assert (=> b!733596 (= e!410459 call!34872)))

(assert (= (and d!99867 (not res!493063)) b!733599))

(assert (= (and b!733599 c!80644) b!733597))

(assert (= (and b!733599 (not c!80644)) b!733598))

(assert (= (and b!733597 res!493064) b!733596))

(assert (= (or b!733596 b!733598) bm!34869))

(declare-fun m!686479 () Bool)

(assert (=> bm!34869 m!686479))

(assert (=> b!733597 m!686383))

(declare-fun m!686481 () Bool)

(assert (=> b!733597 m!686481))

(declare-fun m!686483 () Bool)

(assert (=> b!733597 m!686483))

(assert (=> b!733597 m!686383))

(assert (=> b!733597 m!686427))

(assert (=> b!733599 m!686383))

(assert (=> b!733599 m!686383))

(assert (=> b!733599 m!686421))

(assert (=> b!733510 d!99867))

(declare-fun d!99869 () Bool)

(assert (=> d!99869 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!325151 () Unit!25012)

(declare-fun choose!38 (array!41261 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25012)

(assert (=> d!99869 (= lt!325151 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!99869 (validMask!0 mask!3328)))

(assert (=> d!99869 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!325151)))

(declare-fun bs!20971 () Bool)

(assert (= bs!20971 d!99869))

(assert (=> bs!20971 m!686393))

(declare-fun m!686485 () Bool)

(assert (=> bs!20971 m!686485))

(assert (=> bs!20971 m!686401))

(assert (=> b!733510 d!99869))

(declare-fun b!733613 () Bool)

(declare-fun e!410466 () SeekEntryResult!7347)

(declare-fun lt!325159 () SeekEntryResult!7347)

(assert (=> b!733613 (= e!410466 (MissingZero!7347 (index!31758 lt!325159)))))

(declare-fun b!733614 () Bool)

(declare-fun e!410467 () SeekEntryResult!7347)

(declare-fun e!410468 () SeekEntryResult!7347)

(assert (=> b!733614 (= e!410467 e!410468)))

(declare-fun lt!325160 () (_ BitVec 64))

(assert (=> b!733614 (= lt!325160 (select (arr!19747 a!3186) (index!31758 lt!325159)))))

(declare-fun c!80652 () Bool)

(assert (=> b!733614 (= c!80652 (= lt!325160 (select (arr!19747 a!3186) j!159)))))

(declare-fun b!733615 () Bool)

(assert (=> b!733615 (= e!410466 (seekKeyOrZeroReturnVacant!0 (x!62745 lt!325159) (index!31758 lt!325159) (index!31758 lt!325159) (select (arr!19747 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!733616 () Bool)

(assert (=> b!733616 (= e!410467 Undefined!7347)))

(declare-fun b!733617 () Bool)

(declare-fun c!80653 () Bool)

(assert (=> b!733617 (= c!80653 (= lt!325160 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!733617 (= e!410468 e!410466)))

(declare-fun d!99871 () Bool)

(declare-fun lt!325158 () SeekEntryResult!7347)

(assert (=> d!99871 (and (or ((_ is Undefined!7347) lt!325158) (not ((_ is Found!7347) lt!325158)) (and (bvsge (index!31757 lt!325158) #b00000000000000000000000000000000) (bvslt (index!31757 lt!325158) (size!20168 a!3186)))) (or ((_ is Undefined!7347) lt!325158) ((_ is Found!7347) lt!325158) (not ((_ is MissingZero!7347) lt!325158)) (and (bvsge (index!31756 lt!325158) #b00000000000000000000000000000000) (bvslt (index!31756 lt!325158) (size!20168 a!3186)))) (or ((_ is Undefined!7347) lt!325158) ((_ is Found!7347) lt!325158) ((_ is MissingZero!7347) lt!325158) (not ((_ is MissingVacant!7347) lt!325158)) (and (bvsge (index!31759 lt!325158) #b00000000000000000000000000000000) (bvslt (index!31759 lt!325158) (size!20168 a!3186)))) (or ((_ is Undefined!7347) lt!325158) (ite ((_ is Found!7347) lt!325158) (= (select (arr!19747 a!3186) (index!31757 lt!325158)) (select (arr!19747 a!3186) j!159)) (ite ((_ is MissingZero!7347) lt!325158) (= (select (arr!19747 a!3186) (index!31756 lt!325158)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7347) lt!325158) (= (select (arr!19747 a!3186) (index!31759 lt!325158)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!99871 (= lt!325158 e!410467)))

(declare-fun c!80651 () Bool)

(assert (=> d!99871 (= c!80651 (and ((_ is Intermediate!7347) lt!325159) (undefined!8159 lt!325159)))))

(assert (=> d!99871 (= lt!325159 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19747 a!3186) j!159) mask!3328) (select (arr!19747 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!99871 (validMask!0 mask!3328)))

(assert (=> d!99871 (= (seekEntryOrOpen!0 (select (arr!19747 a!3186) j!159) a!3186 mask!3328) lt!325158)))

(declare-fun b!733612 () Bool)

(assert (=> b!733612 (= e!410468 (Found!7347 (index!31758 lt!325159)))))

(assert (= (and d!99871 c!80651) b!733616))

(assert (= (and d!99871 (not c!80651)) b!733614))

(assert (= (and b!733614 c!80652) b!733612))

(assert (= (and b!733614 (not c!80652)) b!733617))

(assert (= (and b!733617 c!80653) b!733613))

(assert (= (and b!733617 (not c!80653)) b!733615))

(declare-fun m!686487 () Bool)

(assert (=> b!733614 m!686487))

(assert (=> b!733615 m!686383))

(declare-fun m!686489 () Bool)

(assert (=> b!733615 m!686489))

(declare-fun m!686491 () Bool)

(assert (=> d!99871 m!686491))

(declare-fun m!686493 () Bool)

(assert (=> d!99871 m!686493))

(assert (=> d!99871 m!686397))

(assert (=> d!99871 m!686383))

(assert (=> d!99871 m!686399))

(assert (=> d!99871 m!686401))

(declare-fun m!686495 () Bool)

(assert (=> d!99871 m!686495))

(assert (=> d!99871 m!686383))

(assert (=> d!99871 m!686397))

(assert (=> b!733511 d!99871))

(declare-fun d!99873 () Bool)

(assert (=> d!99873 (= (validKeyInArray!0 (select (arr!19747 a!3186) j!159)) (and (not (= (select (arr!19747 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19747 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!733522 d!99873))

(declare-fun b!733630 () Bool)

(declare-fun e!410476 () SeekEntryResult!7347)

(assert (=> b!733630 (= e!410476 (MissingVacant!7347 resIntermediateIndex!5))))

(declare-fun b!733631 () Bool)

(declare-fun e!410475 () SeekEntryResult!7347)

(assert (=> b!733631 (= e!410475 (Found!7347 index!1321))))

(declare-fun b!733632 () Bool)

(declare-fun e!410477 () SeekEntryResult!7347)

(assert (=> b!733632 (= e!410477 e!410475)))

(declare-fun c!80660 () Bool)

(declare-fun lt!325165 () (_ BitVec 64))

(assert (=> b!733632 (= c!80660 (= lt!325165 (select (arr!19747 a!3186) j!159)))))

(declare-fun d!99875 () Bool)

(declare-fun lt!325166 () SeekEntryResult!7347)

(assert (=> d!99875 (and (or ((_ is Undefined!7347) lt!325166) (not ((_ is Found!7347) lt!325166)) (and (bvsge (index!31757 lt!325166) #b00000000000000000000000000000000) (bvslt (index!31757 lt!325166) (size!20168 a!3186)))) (or ((_ is Undefined!7347) lt!325166) ((_ is Found!7347) lt!325166) (not ((_ is MissingVacant!7347) lt!325166)) (not (= (index!31759 lt!325166) resIntermediateIndex!5)) (and (bvsge (index!31759 lt!325166) #b00000000000000000000000000000000) (bvslt (index!31759 lt!325166) (size!20168 a!3186)))) (or ((_ is Undefined!7347) lt!325166) (ite ((_ is Found!7347) lt!325166) (= (select (arr!19747 a!3186) (index!31757 lt!325166)) (select (arr!19747 a!3186) j!159)) (and ((_ is MissingVacant!7347) lt!325166) (= (index!31759 lt!325166) resIntermediateIndex!5) (= (select (arr!19747 a!3186) (index!31759 lt!325166)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!99875 (= lt!325166 e!410477)))

(declare-fun c!80661 () Bool)

(assert (=> d!99875 (= c!80661 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!99875 (= lt!325165 (select (arr!19747 a!3186) index!1321))))

(assert (=> d!99875 (validMask!0 mask!3328)))

(assert (=> d!99875 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19747 a!3186) j!159) a!3186 mask!3328) lt!325166)))

(declare-fun b!733633 () Bool)

(assert (=> b!733633 (= e!410477 Undefined!7347)))

(declare-fun b!733634 () Bool)

(declare-fun c!80662 () Bool)

(assert (=> b!733634 (= c!80662 (= lt!325165 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!733634 (= e!410475 e!410476)))

(declare-fun b!733635 () Bool)

(assert (=> b!733635 (= e!410476 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!19747 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and d!99875 c!80661) b!733633))

(assert (= (and d!99875 (not c!80661)) b!733632))

(assert (= (and b!733632 c!80660) b!733631))

(assert (= (and b!733632 (not c!80660)) b!733634))

(assert (= (and b!733634 c!80662) b!733630))

(assert (= (and b!733634 (not c!80662)) b!733635))

(declare-fun m!686497 () Bool)

(assert (=> d!99875 m!686497))

(declare-fun m!686499 () Bool)

(assert (=> d!99875 m!686499))

(declare-fun m!686501 () Bool)

(assert (=> d!99875 m!686501))

(assert (=> d!99875 m!686401))

(assert (=> b!733635 m!686425))

(assert (=> b!733635 m!686425))

(assert (=> b!733635 m!686383))

(declare-fun m!686503 () Bool)

(assert (=> b!733635 m!686503))

(assert (=> b!733512 d!99875))

(declare-fun d!99877 () Bool)

(assert (=> d!99877 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!64950 d!99877))

(declare-fun d!99881 () Bool)

(assert (=> d!99881 (= (array_inv!15543 a!3186) (bvsge (size!20168 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!64950 d!99881))

(declare-fun b!733664 () Bool)

(declare-fun e!410496 () Bool)

(declare-fun call!34875 () Bool)

(assert (=> b!733664 (= e!410496 call!34875)))

(declare-fun b!733665 () Bool)

(declare-fun e!410497 () Bool)

(declare-fun contains!4057 (List!13749 (_ BitVec 64)) Bool)

(assert (=> b!733665 (= e!410497 (contains!4057 Nil!13746 (select (arr!19747 a!3186) #b00000000000000000000000000000000)))))

(declare-fun bm!34872 () Bool)

(declare-fun c!80674 () Bool)

(assert (=> bm!34872 (= call!34875 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!80674 (Cons!13745 (select (arr!19747 a!3186) #b00000000000000000000000000000000) Nil!13746) Nil!13746)))))

(declare-fun b!733666 () Bool)

(declare-fun e!410498 () Bool)

(assert (=> b!733666 (= e!410498 e!410496)))

(assert (=> b!733666 (= c!80674 (validKeyInArray!0 (select (arr!19747 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!733667 () Bool)

(assert (=> b!733667 (= e!410496 call!34875)))

(declare-fun b!733668 () Bool)

(declare-fun e!410495 () Bool)

(assert (=> b!733668 (= e!410495 e!410498)))

(declare-fun res!493071 () Bool)

(assert (=> b!733668 (=> (not res!493071) (not e!410498))))

(assert (=> b!733668 (= res!493071 (not e!410497))))

(declare-fun res!493072 () Bool)

(assert (=> b!733668 (=> (not res!493072) (not e!410497))))

(assert (=> b!733668 (= res!493072 (validKeyInArray!0 (select (arr!19747 a!3186) #b00000000000000000000000000000000)))))

(declare-fun d!99883 () Bool)

(declare-fun res!493073 () Bool)

(assert (=> d!99883 (=> res!493073 e!410495)))

(assert (=> d!99883 (= res!493073 (bvsge #b00000000000000000000000000000000 (size!20168 a!3186)))))

(assert (=> d!99883 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13746) e!410495)))

(assert (= (and d!99883 (not res!493073)) b!733668))

(assert (= (and b!733668 res!493072) b!733665))

(assert (= (and b!733668 res!493071) b!733666))

(assert (= (and b!733666 c!80674) b!733667))

(assert (= (and b!733666 (not c!80674)) b!733664))

(assert (= (or b!733667 b!733664) bm!34872))

(declare-fun m!686513 () Bool)

(assert (=> b!733665 m!686513))

(assert (=> b!733665 m!686513))

(declare-fun m!686515 () Bool)

(assert (=> b!733665 m!686515))

(assert (=> bm!34872 m!686513))

(declare-fun m!686517 () Bool)

(assert (=> bm!34872 m!686517))

(assert (=> b!733666 m!686513))

(assert (=> b!733666 m!686513))

(declare-fun m!686519 () Bool)

(assert (=> b!733666 m!686519))

(assert (=> b!733668 m!686513))

(assert (=> b!733668 m!686513))

(assert (=> b!733668 m!686519))

(assert (=> b!733513 d!99883))

(declare-fun b!733669 () Bool)

(declare-fun e!410500 () SeekEntryResult!7347)

(assert (=> b!733669 (= e!410500 (MissingVacant!7347 resIntermediateIndex!5))))

(declare-fun b!733670 () Bool)

(declare-fun e!410499 () SeekEntryResult!7347)

(assert (=> b!733670 (= e!410499 (Found!7347 resIntermediateIndex!5))))

(declare-fun b!733671 () Bool)

(declare-fun e!410501 () SeekEntryResult!7347)

(assert (=> b!733671 (= e!410501 e!410499)))

(declare-fun c!80675 () Bool)

(declare-fun lt!325173 () (_ BitVec 64))

(assert (=> b!733671 (= c!80675 (= lt!325173 (select (arr!19747 a!3186) j!159)))))

(declare-fun d!99887 () Bool)

(declare-fun lt!325174 () SeekEntryResult!7347)

(assert (=> d!99887 (and (or ((_ is Undefined!7347) lt!325174) (not ((_ is Found!7347) lt!325174)) (and (bvsge (index!31757 lt!325174) #b00000000000000000000000000000000) (bvslt (index!31757 lt!325174) (size!20168 a!3186)))) (or ((_ is Undefined!7347) lt!325174) ((_ is Found!7347) lt!325174) (not ((_ is MissingVacant!7347) lt!325174)) (not (= (index!31759 lt!325174) resIntermediateIndex!5)) (and (bvsge (index!31759 lt!325174) #b00000000000000000000000000000000) (bvslt (index!31759 lt!325174) (size!20168 a!3186)))) (or ((_ is Undefined!7347) lt!325174) (ite ((_ is Found!7347) lt!325174) (= (select (arr!19747 a!3186) (index!31757 lt!325174)) (select (arr!19747 a!3186) j!159)) (and ((_ is MissingVacant!7347) lt!325174) (= (index!31759 lt!325174) resIntermediateIndex!5) (= (select (arr!19747 a!3186) (index!31759 lt!325174)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!99887 (= lt!325174 e!410501)))

(declare-fun c!80676 () Bool)

(assert (=> d!99887 (= c!80676 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(assert (=> d!99887 (= lt!325173 (select (arr!19747 a!3186) resIntermediateIndex!5))))

(assert (=> d!99887 (validMask!0 mask!3328)))

(assert (=> d!99887 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19747 a!3186) j!159) a!3186 mask!3328) lt!325174)))

(declare-fun b!733672 () Bool)

(assert (=> b!733672 (= e!410501 Undefined!7347)))

(declare-fun b!733673 () Bool)

(declare-fun c!80677 () Bool)

(assert (=> b!733673 (= c!80677 (= lt!325173 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!733673 (= e!410499 e!410500)))

(declare-fun b!733674 () Bool)

(assert (=> b!733674 (= e!410500 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) resIntermediateIndex!5 (select (arr!19747 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and d!99887 c!80676) b!733672))

(assert (= (and d!99887 (not c!80676)) b!733671))

(assert (= (and b!733671 c!80675) b!733670))

(assert (= (and b!733671 (not c!80675)) b!733673))

(assert (= (and b!733673 c!80677) b!733669))

(assert (= (and b!733673 (not c!80677)) b!733674))

(declare-fun m!686521 () Bool)

(assert (=> d!99887 m!686521))

(declare-fun m!686523 () Bool)

(assert (=> d!99887 m!686523))

(assert (=> d!99887 m!686423))

(assert (=> d!99887 m!686401))

(declare-fun m!686525 () Bool)

(assert (=> b!733674 m!686525))

(assert (=> b!733674 m!686525))

(assert (=> b!733674 m!686383))

(declare-fun m!686527 () Bool)

(assert (=> b!733674 m!686527))

(assert (=> b!733524 d!99887))

(declare-fun b!733680 () Bool)

(declare-fun e!410506 () SeekEntryResult!7347)

(declare-fun lt!325176 () SeekEntryResult!7347)

(assert (=> b!733680 (= e!410506 (MissingZero!7347 (index!31758 lt!325176)))))

(declare-fun b!733681 () Bool)

(declare-fun e!410507 () SeekEntryResult!7347)

(declare-fun e!410508 () SeekEntryResult!7347)

(assert (=> b!733681 (= e!410507 e!410508)))

(declare-fun lt!325177 () (_ BitVec 64))

(assert (=> b!733681 (= lt!325177 (select (arr!19747 a!3186) (index!31758 lt!325176)))))

(declare-fun c!80679 () Bool)

(assert (=> b!733681 (= c!80679 (= lt!325177 k0!2102))))

(declare-fun b!733682 () Bool)

(assert (=> b!733682 (= e!410506 (seekKeyOrZeroReturnVacant!0 (x!62745 lt!325176) (index!31758 lt!325176) (index!31758 lt!325176) k0!2102 a!3186 mask!3328))))

(declare-fun b!733683 () Bool)

(assert (=> b!733683 (= e!410507 Undefined!7347)))

(declare-fun b!733684 () Bool)

(declare-fun c!80680 () Bool)

(assert (=> b!733684 (= c!80680 (= lt!325177 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!733684 (= e!410508 e!410506)))

(declare-fun d!99889 () Bool)

(declare-fun lt!325175 () SeekEntryResult!7347)

(assert (=> d!99889 (and (or ((_ is Undefined!7347) lt!325175) (not ((_ is Found!7347) lt!325175)) (and (bvsge (index!31757 lt!325175) #b00000000000000000000000000000000) (bvslt (index!31757 lt!325175) (size!20168 a!3186)))) (or ((_ is Undefined!7347) lt!325175) ((_ is Found!7347) lt!325175) (not ((_ is MissingZero!7347) lt!325175)) (and (bvsge (index!31756 lt!325175) #b00000000000000000000000000000000) (bvslt (index!31756 lt!325175) (size!20168 a!3186)))) (or ((_ is Undefined!7347) lt!325175) ((_ is Found!7347) lt!325175) ((_ is MissingZero!7347) lt!325175) (not ((_ is MissingVacant!7347) lt!325175)) (and (bvsge (index!31759 lt!325175) #b00000000000000000000000000000000) (bvslt (index!31759 lt!325175) (size!20168 a!3186)))) (or ((_ is Undefined!7347) lt!325175) (ite ((_ is Found!7347) lt!325175) (= (select (arr!19747 a!3186) (index!31757 lt!325175)) k0!2102) (ite ((_ is MissingZero!7347) lt!325175) (= (select (arr!19747 a!3186) (index!31756 lt!325175)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7347) lt!325175) (= (select (arr!19747 a!3186) (index!31759 lt!325175)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!99889 (= lt!325175 e!410507)))

(declare-fun c!80678 () Bool)

(assert (=> d!99889 (= c!80678 (and ((_ is Intermediate!7347) lt!325176) (undefined!8159 lt!325176)))))

(assert (=> d!99889 (= lt!325176 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328))))

(assert (=> d!99889 (validMask!0 mask!3328)))

(assert (=> d!99889 (= (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328) lt!325175)))

(declare-fun b!733679 () Bool)

(assert (=> b!733679 (= e!410508 (Found!7347 (index!31758 lt!325176)))))

(assert (= (and d!99889 c!80678) b!733683))

(assert (= (and d!99889 (not c!80678)) b!733681))

(assert (= (and b!733681 c!80679) b!733679))

(assert (= (and b!733681 (not c!80679)) b!733684))

(assert (= (and b!733684 c!80680) b!733680))

(assert (= (and b!733684 (not c!80680)) b!733682))

(declare-fun m!686529 () Bool)

(assert (=> b!733681 m!686529))

(declare-fun m!686531 () Bool)

(assert (=> b!733682 m!686531))

(declare-fun m!686533 () Bool)

(assert (=> d!99889 m!686533))

(declare-fun m!686535 () Bool)

(assert (=> d!99889 m!686535))

(declare-fun m!686537 () Bool)

(assert (=> d!99889 m!686537))

(declare-fun m!686539 () Bool)

(assert (=> d!99889 m!686539))

(assert (=> d!99889 m!686401))

(declare-fun m!686541 () Bool)

(assert (=> d!99889 m!686541))

(assert (=> d!99889 m!686537))

(assert (=> b!733514 d!99889))

(declare-fun b!733717 () Bool)

(declare-fun lt!325189 () SeekEntryResult!7347)

(assert (=> b!733717 (and (bvsge (index!31758 lt!325189) #b00000000000000000000000000000000) (bvslt (index!31758 lt!325189) (size!20168 a!3186)))))

(declare-fun res!493088 () Bool)

(assert (=> b!733717 (= res!493088 (= (select (arr!19747 a!3186) (index!31758 lt!325189)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!410529 () Bool)

(assert (=> b!733717 (=> res!493088 e!410529)))

(declare-fun b!733718 () Bool)

(declare-fun e!410530 () SeekEntryResult!7347)

(assert (=> b!733718 (= e!410530 (Intermediate!7347 false index!1321 x!1131))))

(declare-fun b!733719 () Bool)

(declare-fun e!410527 () Bool)

(assert (=> b!733719 (= e!410527 (bvsge (x!62745 lt!325189) #b01111111111111111111111111111110))))

(declare-fun b!733720 () Bool)

(declare-fun e!410528 () SeekEntryResult!7347)

(assert (=> b!733720 (= e!410528 (Intermediate!7347 true index!1321 x!1131))))

(declare-fun b!733721 () Bool)

(declare-fun e!410531 () Bool)

(assert (=> b!733721 (= e!410527 e!410531)))

(declare-fun res!493087 () Bool)

(assert (=> b!733721 (= res!493087 (and ((_ is Intermediate!7347) lt!325189) (not (undefined!8159 lt!325189)) (bvslt (x!62745 lt!325189) #b01111111111111111111111111111110) (bvsge (x!62745 lt!325189) #b00000000000000000000000000000000) (bvsge (x!62745 lt!325189) x!1131)))))

(assert (=> b!733721 (=> (not res!493087) (not e!410531))))

(declare-fun b!733722 () Bool)

(assert (=> b!733722 (and (bvsge (index!31758 lt!325189) #b00000000000000000000000000000000) (bvslt (index!31758 lt!325189) (size!20168 a!3186)))))

(declare-fun res!493086 () Bool)

(assert (=> b!733722 (= res!493086 (= (select (arr!19747 a!3186) (index!31758 lt!325189)) (select (arr!19747 a!3186) j!159)))))

(assert (=> b!733722 (=> res!493086 e!410529)))

(assert (=> b!733722 (= e!410531 e!410529)))

(declare-fun b!733723 () Bool)

(assert (=> b!733723 (= e!410528 e!410530)))

(declare-fun lt!325188 () (_ BitVec 64))

(declare-fun c!80695 () Bool)

(assert (=> b!733723 (= c!80695 (or (= lt!325188 (select (arr!19747 a!3186) j!159)) (= (bvadd lt!325188 lt!325188) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!99891 () Bool)

(assert (=> d!99891 e!410527))

(declare-fun c!80694 () Bool)

(assert (=> d!99891 (= c!80694 (and ((_ is Intermediate!7347) lt!325189) (undefined!8159 lt!325189)))))

(assert (=> d!99891 (= lt!325189 e!410528)))

(declare-fun c!80693 () Bool)

(assert (=> d!99891 (= c!80693 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!99891 (= lt!325188 (select (arr!19747 a!3186) index!1321))))

(assert (=> d!99891 (validMask!0 mask!3328)))

(assert (=> d!99891 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19747 a!3186) j!159) a!3186 mask!3328) lt!325189)))

(declare-fun b!733724 () Bool)

(assert (=> b!733724 (= e!410530 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!19747 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!733725 () Bool)

(assert (=> b!733725 (and (bvsge (index!31758 lt!325189) #b00000000000000000000000000000000) (bvslt (index!31758 lt!325189) (size!20168 a!3186)))))

(assert (=> b!733725 (= e!410529 (= (select (arr!19747 a!3186) (index!31758 lt!325189)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!99891 c!80693) b!733720))

(assert (= (and d!99891 (not c!80693)) b!733723))

(assert (= (and b!733723 c!80695) b!733718))

(assert (= (and b!733723 (not c!80695)) b!733724))

(assert (= (and d!99891 c!80694) b!733719))

(assert (= (and d!99891 (not c!80694)) b!733721))

(assert (= (and b!733721 res!493087) b!733722))

(assert (= (and b!733722 (not res!493086)) b!733717))

(assert (= (and b!733717 (not res!493088)) b!733725))

(assert (=> d!99891 m!686501))

(assert (=> d!99891 m!686401))

(declare-fun m!686551 () Bool)

(assert (=> b!733725 m!686551))

(assert (=> b!733722 m!686551))

(assert (=> b!733717 m!686551))

(assert (=> b!733724 m!686425))

(assert (=> b!733724 m!686425))

(assert (=> b!733724 m!686383))

(declare-fun m!686559 () Bool)

(assert (=> b!733724 m!686559))

(assert (=> b!733525 d!99891))

(declare-fun b!733732 () Bool)

(declare-fun lt!325194 () SeekEntryResult!7347)

(assert (=> b!733732 (and (bvsge (index!31758 lt!325194) #b00000000000000000000000000000000) (bvslt (index!31758 lt!325194) (size!20168 a!3186)))))

(declare-fun res!493091 () Bool)

(assert (=> b!733732 (= res!493091 (= (select (arr!19747 a!3186) (index!31758 lt!325194)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!410537 () Bool)

(assert (=> b!733732 (=> res!493091 e!410537)))

(declare-fun b!733733 () Bool)

(declare-fun e!410538 () SeekEntryResult!7347)

(assert (=> b!733733 (= e!410538 (Intermediate!7347 false (toIndex!0 (select (arr!19747 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!733734 () Bool)

(declare-fun e!410535 () Bool)

(assert (=> b!733734 (= e!410535 (bvsge (x!62745 lt!325194) #b01111111111111111111111111111110))))

(declare-fun b!733735 () Bool)

(declare-fun e!410536 () SeekEntryResult!7347)

(assert (=> b!733735 (= e!410536 (Intermediate!7347 true (toIndex!0 (select (arr!19747 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!733736 () Bool)

(declare-fun e!410539 () Bool)

(assert (=> b!733736 (= e!410535 e!410539)))

(declare-fun res!493090 () Bool)

(assert (=> b!733736 (= res!493090 (and ((_ is Intermediate!7347) lt!325194) (not (undefined!8159 lt!325194)) (bvslt (x!62745 lt!325194) #b01111111111111111111111111111110) (bvsge (x!62745 lt!325194) #b00000000000000000000000000000000) (bvsge (x!62745 lt!325194) #b00000000000000000000000000000000)))))

(assert (=> b!733736 (=> (not res!493090) (not e!410539))))

(declare-fun b!733737 () Bool)

(assert (=> b!733737 (and (bvsge (index!31758 lt!325194) #b00000000000000000000000000000000) (bvslt (index!31758 lt!325194) (size!20168 a!3186)))))

(declare-fun res!493089 () Bool)

(assert (=> b!733737 (= res!493089 (= (select (arr!19747 a!3186) (index!31758 lt!325194)) (select (arr!19747 a!3186) j!159)))))

(assert (=> b!733737 (=> res!493089 e!410537)))

(assert (=> b!733737 (= e!410539 e!410537)))

(declare-fun b!733738 () Bool)

(assert (=> b!733738 (= e!410536 e!410538)))

(declare-fun lt!325193 () (_ BitVec 64))

(declare-fun c!80701 () Bool)

(assert (=> b!733738 (= c!80701 (or (= lt!325193 (select (arr!19747 a!3186) j!159)) (= (bvadd lt!325193 lt!325193) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!99895 () Bool)

(assert (=> d!99895 e!410535))

(declare-fun c!80700 () Bool)

(assert (=> d!99895 (= c!80700 (and ((_ is Intermediate!7347) lt!325194) (undefined!8159 lt!325194)))))

(assert (=> d!99895 (= lt!325194 e!410536)))

(declare-fun c!80699 () Bool)

(assert (=> d!99895 (= c!80699 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!99895 (= lt!325193 (select (arr!19747 a!3186) (toIndex!0 (select (arr!19747 a!3186) j!159) mask!3328)))))

(assert (=> d!99895 (validMask!0 mask!3328)))

(assert (=> d!99895 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19747 a!3186) j!159) mask!3328) (select (arr!19747 a!3186) j!159) a!3186 mask!3328) lt!325194)))

(declare-fun b!733739 () Bool)

(assert (=> b!733739 (= e!410538 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!19747 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!19747 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!733740 () Bool)

(assert (=> b!733740 (and (bvsge (index!31758 lt!325194) #b00000000000000000000000000000000) (bvslt (index!31758 lt!325194) (size!20168 a!3186)))))

(assert (=> b!733740 (= e!410537 (= (select (arr!19747 a!3186) (index!31758 lt!325194)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!99895 c!80699) b!733735))

(assert (= (and d!99895 (not c!80699)) b!733738))

(assert (= (and b!733738 c!80701) b!733733))

(assert (= (and b!733738 (not c!80701)) b!733739))

(assert (= (and d!99895 c!80700) b!733734))

(assert (= (and d!99895 (not c!80700)) b!733736))

(assert (= (and b!733736 res!493090) b!733737))

(assert (= (and b!733737 (not res!493089)) b!733732))

(assert (= (and b!733732 (not res!493091)) b!733740))

(assert (=> d!99895 m!686397))

(declare-fun m!686565 () Bool)

(assert (=> d!99895 m!686565))

(assert (=> d!99895 m!686401))

(declare-fun m!686567 () Bool)

(assert (=> b!733740 m!686567))

(assert (=> b!733737 m!686567))

(assert (=> b!733732 m!686567))

(assert (=> b!733739 m!686397))

(declare-fun m!686569 () Bool)

(assert (=> b!733739 m!686569))

(assert (=> b!733739 m!686569))

(assert (=> b!733739 m!686383))

(declare-fun m!686571 () Bool)

(assert (=> b!733739 m!686571))

(assert (=> b!733515 d!99895))

(declare-fun d!99899 () Bool)

(declare-fun lt!325200 () (_ BitVec 32))

(declare-fun lt!325199 () (_ BitVec 32))

(assert (=> d!99899 (= lt!325200 (bvmul (bvxor lt!325199 (bvlshr lt!325199 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!99899 (= lt!325199 ((_ extract 31 0) (bvand (bvxor (select (arr!19747 a!3186) j!159) (bvlshr (select (arr!19747 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!99899 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!493092 (let ((h!14813 ((_ extract 31 0) (bvand (bvxor (select (arr!19747 a!3186) j!159) (bvlshr (select (arr!19747 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!62750 (bvmul (bvxor h!14813 (bvlshr h!14813 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!62750 (bvlshr x!62750 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!493092 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!493092 #b00000000000000000000000000000000))))))

(assert (=> d!99899 (= (toIndex!0 (select (arr!19747 a!3186) j!159) mask!3328) (bvand (bvxor lt!325200 (bvlshr lt!325200 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!733515 d!99899))

(declare-fun d!99901 () Bool)

(declare-fun res!493097 () Bool)

(declare-fun e!410544 () Bool)

(assert (=> d!99901 (=> res!493097 e!410544)))

(assert (=> d!99901 (= res!493097 (= (select (arr!19747 a!3186) #b00000000000000000000000000000000) k0!2102))))

(assert (=> d!99901 (= (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000) e!410544)))

(declare-fun b!733745 () Bool)

(declare-fun e!410545 () Bool)

(assert (=> b!733745 (= e!410544 e!410545)))

(declare-fun res!493098 () Bool)

(assert (=> b!733745 (=> (not res!493098) (not e!410545))))

(assert (=> b!733745 (= res!493098 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20168 a!3186)))))

(declare-fun b!733746 () Bool)

(assert (=> b!733746 (= e!410545 (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!99901 (not res!493097)) b!733745))

(assert (= (and b!733745 res!493098) b!733746))

(assert (=> d!99901 m!686513))

(declare-fun m!686573 () Bool)

(assert (=> b!733746 m!686573))

(assert (=> b!733516 d!99901))

(declare-fun d!99903 () Bool)

(assert (=> d!99903 (= (validKeyInArray!0 k0!2102) (and (not (= k0!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!733527 d!99903))

(declare-fun b!733747 () Bool)

(declare-fun lt!325202 () SeekEntryResult!7347)

(assert (=> b!733747 (and (bvsge (index!31758 lt!325202) #b00000000000000000000000000000000) (bvslt (index!31758 lt!325202) (size!20168 lt!325108)))))

(declare-fun res!493101 () Bool)

(assert (=> b!733747 (= res!493101 (= (select (arr!19747 lt!325108) (index!31758 lt!325202)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!410548 () Bool)

(assert (=> b!733747 (=> res!493101 e!410548)))

(declare-fun b!733748 () Bool)

(declare-fun e!410549 () SeekEntryResult!7347)

(assert (=> b!733748 (= e!410549 (Intermediate!7347 false index!1321 x!1131))))

(declare-fun b!733749 () Bool)

(declare-fun e!410546 () Bool)

(assert (=> b!733749 (= e!410546 (bvsge (x!62745 lt!325202) #b01111111111111111111111111111110))))

(declare-fun b!733750 () Bool)

(declare-fun e!410547 () SeekEntryResult!7347)

(assert (=> b!733750 (= e!410547 (Intermediate!7347 true index!1321 x!1131))))

(declare-fun b!733751 () Bool)

(declare-fun e!410550 () Bool)

(assert (=> b!733751 (= e!410546 e!410550)))

(declare-fun res!493100 () Bool)

(assert (=> b!733751 (= res!493100 (and ((_ is Intermediate!7347) lt!325202) (not (undefined!8159 lt!325202)) (bvslt (x!62745 lt!325202) #b01111111111111111111111111111110) (bvsge (x!62745 lt!325202) #b00000000000000000000000000000000) (bvsge (x!62745 lt!325202) x!1131)))))

(assert (=> b!733751 (=> (not res!493100) (not e!410550))))

(declare-fun b!733752 () Bool)

(assert (=> b!733752 (and (bvsge (index!31758 lt!325202) #b00000000000000000000000000000000) (bvslt (index!31758 lt!325202) (size!20168 lt!325108)))))

(declare-fun res!493099 () Bool)

(assert (=> b!733752 (= res!493099 (= (select (arr!19747 lt!325108) (index!31758 lt!325202)) lt!325111))))

(assert (=> b!733752 (=> res!493099 e!410548)))

(assert (=> b!733752 (= e!410550 e!410548)))

(declare-fun b!733753 () Bool)

(assert (=> b!733753 (= e!410547 e!410549)))

(declare-fun c!80704 () Bool)

(declare-fun lt!325201 () (_ BitVec 64))

(assert (=> b!733753 (= c!80704 (or (= lt!325201 lt!325111) (= (bvadd lt!325201 lt!325201) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!99905 () Bool)

(assert (=> d!99905 e!410546))

(declare-fun c!80703 () Bool)

(assert (=> d!99905 (= c!80703 (and ((_ is Intermediate!7347) lt!325202) (undefined!8159 lt!325202)))))

(assert (=> d!99905 (= lt!325202 e!410547)))

(declare-fun c!80702 () Bool)

(assert (=> d!99905 (= c!80702 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!99905 (= lt!325201 (select (arr!19747 lt!325108) index!1321))))

(assert (=> d!99905 (validMask!0 mask!3328)))

(assert (=> d!99905 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!325111 lt!325108 mask!3328) lt!325202)))

(declare-fun b!733754 () Bool)

(assert (=> b!733754 (= e!410549 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!325111 lt!325108 mask!3328))))

(declare-fun b!733755 () Bool)

(assert (=> b!733755 (and (bvsge (index!31758 lt!325202) #b00000000000000000000000000000000) (bvslt (index!31758 lt!325202) (size!20168 lt!325108)))))

(assert (=> b!733755 (= e!410548 (= (select (arr!19747 lt!325108) (index!31758 lt!325202)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!99905 c!80702) b!733750))

(assert (= (and d!99905 (not c!80702)) b!733753))

(assert (= (and b!733753 c!80704) b!733748))

(assert (= (and b!733753 (not c!80704)) b!733754))

(assert (= (and d!99905 c!80703) b!733749))

(assert (= (and d!99905 (not c!80703)) b!733751))

(assert (= (and b!733751 res!493100) b!733752))

(assert (= (and b!733752 (not res!493099)) b!733747))

(assert (= (and b!733747 (not res!493101)) b!733755))

(declare-fun m!686575 () Bool)

(assert (=> d!99905 m!686575))

(assert (=> d!99905 m!686401))

(declare-fun m!686577 () Bool)

(assert (=> b!733755 m!686577))

(assert (=> b!733752 m!686577))

(assert (=> b!733747 m!686577))

(assert (=> b!733754 m!686425))

(assert (=> b!733754 m!686425))

(declare-fun m!686579 () Bool)

(assert (=> b!733754 m!686579))

(assert (=> b!733517 d!99905))

(declare-fun b!733756 () Bool)

(declare-fun lt!325204 () SeekEntryResult!7347)

(assert (=> b!733756 (and (bvsge (index!31758 lt!325204) #b00000000000000000000000000000000) (bvslt (index!31758 lt!325204) (size!20168 lt!325108)))))

(declare-fun res!493104 () Bool)

(assert (=> b!733756 (= res!493104 (= (select (arr!19747 lt!325108) (index!31758 lt!325204)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!410553 () Bool)

(assert (=> b!733756 (=> res!493104 e!410553)))

(declare-fun b!733757 () Bool)

(declare-fun e!410554 () SeekEntryResult!7347)

(assert (=> b!733757 (= e!410554 (Intermediate!7347 false (toIndex!0 lt!325111 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!733758 () Bool)

(declare-fun e!410551 () Bool)

(assert (=> b!733758 (= e!410551 (bvsge (x!62745 lt!325204) #b01111111111111111111111111111110))))

(declare-fun b!733759 () Bool)

(declare-fun e!410552 () SeekEntryResult!7347)

(assert (=> b!733759 (= e!410552 (Intermediate!7347 true (toIndex!0 lt!325111 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!733760 () Bool)

(declare-fun e!410555 () Bool)

(assert (=> b!733760 (= e!410551 e!410555)))

(declare-fun res!493103 () Bool)

(assert (=> b!733760 (= res!493103 (and ((_ is Intermediate!7347) lt!325204) (not (undefined!8159 lt!325204)) (bvslt (x!62745 lt!325204) #b01111111111111111111111111111110) (bvsge (x!62745 lt!325204) #b00000000000000000000000000000000) (bvsge (x!62745 lt!325204) #b00000000000000000000000000000000)))))

(assert (=> b!733760 (=> (not res!493103) (not e!410555))))

(declare-fun b!733761 () Bool)

(assert (=> b!733761 (and (bvsge (index!31758 lt!325204) #b00000000000000000000000000000000) (bvslt (index!31758 lt!325204) (size!20168 lt!325108)))))

(declare-fun res!493102 () Bool)

(assert (=> b!733761 (= res!493102 (= (select (arr!19747 lt!325108) (index!31758 lt!325204)) lt!325111))))

(assert (=> b!733761 (=> res!493102 e!410553)))

(assert (=> b!733761 (= e!410555 e!410553)))

(declare-fun b!733762 () Bool)

(assert (=> b!733762 (= e!410552 e!410554)))

(declare-fun c!80707 () Bool)

(declare-fun lt!325203 () (_ BitVec 64))

(assert (=> b!733762 (= c!80707 (or (= lt!325203 lt!325111) (= (bvadd lt!325203 lt!325203) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!99907 () Bool)

(assert (=> d!99907 e!410551))

(declare-fun c!80706 () Bool)

(assert (=> d!99907 (= c!80706 (and ((_ is Intermediate!7347) lt!325204) (undefined!8159 lt!325204)))))

(assert (=> d!99907 (= lt!325204 e!410552)))

(declare-fun c!80705 () Bool)

(assert (=> d!99907 (= c!80705 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!99907 (= lt!325203 (select (arr!19747 lt!325108) (toIndex!0 lt!325111 mask!3328)))))

(assert (=> d!99907 (validMask!0 mask!3328)))

(assert (=> d!99907 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!325111 mask!3328) lt!325111 lt!325108 mask!3328) lt!325204)))

(declare-fun b!733763 () Bool)

(assert (=> b!733763 (= e!410554 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!325111 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!325111 lt!325108 mask!3328))))

(declare-fun b!733764 () Bool)

(assert (=> b!733764 (and (bvsge (index!31758 lt!325204) #b00000000000000000000000000000000) (bvslt (index!31758 lt!325204) (size!20168 lt!325108)))))

(assert (=> b!733764 (= e!410553 (= (select (arr!19747 lt!325108) (index!31758 lt!325204)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!99907 c!80705) b!733759))

(assert (= (and d!99907 (not c!80705)) b!733762))

(assert (= (and b!733762 c!80707) b!733757))

(assert (= (and b!733762 (not c!80707)) b!733763))

(assert (= (and d!99907 c!80706) b!733758))

(assert (= (and d!99907 (not c!80706)) b!733760))

(assert (= (and b!733760 res!493103) b!733761))

(assert (= (and b!733761 (not res!493102)) b!733756))

(assert (= (and b!733756 (not res!493104)) b!733764))

(assert (=> d!99907 m!686413))

(declare-fun m!686581 () Bool)

(assert (=> d!99907 m!686581))

(assert (=> d!99907 m!686401))

(declare-fun m!686583 () Bool)

(assert (=> b!733764 m!686583))

(assert (=> b!733761 m!686583))

(assert (=> b!733756 m!686583))

(assert (=> b!733763 m!686413))

(declare-fun m!686585 () Bool)

(assert (=> b!733763 m!686585))

(assert (=> b!733763 m!686585))

(declare-fun m!686587 () Bool)

(assert (=> b!733763 m!686587))

(assert (=> b!733517 d!99907))

(declare-fun d!99909 () Bool)

(declare-fun lt!325206 () (_ BitVec 32))

(declare-fun lt!325205 () (_ BitVec 32))

(assert (=> d!99909 (= lt!325206 (bvmul (bvxor lt!325205 (bvlshr lt!325205 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!99909 (= lt!325205 ((_ extract 31 0) (bvand (bvxor lt!325111 (bvlshr lt!325111 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!99909 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!493092 (let ((h!14813 ((_ extract 31 0) (bvand (bvxor lt!325111 (bvlshr lt!325111 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!62750 (bvmul (bvxor h!14813 (bvlshr h!14813 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!62750 (bvlshr x!62750 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!493092 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!493092 #b00000000000000000000000000000000))))))

(assert (=> d!99909 (= (toIndex!0 lt!325111 mask!3328) (bvand (bvxor lt!325206 (bvlshr lt!325206 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!733517 d!99909))

(assert (=> b!733518 d!99875))

(declare-fun bm!34873 () Bool)

(declare-fun call!34876 () Bool)

(assert (=> bm!34873 (= call!34876 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!733766 () Bool)

(declare-fun e!410557 () Bool)

(declare-fun e!410558 () Bool)

(assert (=> b!733766 (= e!410557 e!410558)))

(declare-fun lt!325208 () (_ BitVec 64))

(assert (=> b!733766 (= lt!325208 (select (arr!19747 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!325207 () Unit!25012)

(assert (=> b!733766 (= lt!325207 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!325208 #b00000000000000000000000000000000))))

(assert (=> b!733766 (arrayContainsKey!0 a!3186 lt!325208 #b00000000000000000000000000000000)))

(declare-fun lt!325209 () Unit!25012)

(assert (=> b!733766 (= lt!325209 lt!325207)))

(declare-fun res!493106 () Bool)

(assert (=> b!733766 (= res!493106 (= (seekEntryOrOpen!0 (select (arr!19747 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7347 #b00000000000000000000000000000000)))))

(assert (=> b!733766 (=> (not res!493106) (not e!410558))))

(declare-fun b!733767 () Bool)

(assert (=> b!733767 (= e!410557 call!34876)))

(declare-fun b!733768 () Bool)

(declare-fun e!410556 () Bool)

(assert (=> b!733768 (= e!410556 e!410557)))

(declare-fun c!80708 () Bool)

(assert (=> b!733768 (= c!80708 (validKeyInArray!0 (select (arr!19747 a!3186) #b00000000000000000000000000000000)))))

(declare-fun d!99911 () Bool)

(declare-fun res!493105 () Bool)

(assert (=> d!99911 (=> res!493105 e!410556)))

(assert (=> d!99911 (= res!493105 (bvsge #b00000000000000000000000000000000 (size!20168 a!3186)))))

(assert (=> d!99911 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!410556)))

(declare-fun b!733765 () Bool)

(assert (=> b!733765 (= e!410558 call!34876)))

(assert (= (and d!99911 (not res!493105)) b!733768))

(assert (= (and b!733768 c!80708) b!733766))

(assert (= (and b!733768 (not c!80708)) b!733767))

(assert (= (and b!733766 res!493106) b!733765))

(assert (= (or b!733765 b!733767) bm!34873))

(declare-fun m!686589 () Bool)

(assert (=> bm!34873 m!686589))

(assert (=> b!733766 m!686513))

(declare-fun m!686591 () Bool)

(assert (=> b!733766 m!686591))

(declare-fun m!686593 () Bool)

(assert (=> b!733766 m!686593))

(assert (=> b!733766 m!686513))

(declare-fun m!686595 () Bool)

(assert (=> b!733766 m!686595))

(assert (=> b!733768 m!686513))

(assert (=> b!733768 m!686513))

(assert (=> b!733768 m!686519))

(assert (=> b!733519 d!99911))

(declare-fun d!99913 () Bool)

(declare-fun lt!325216 () (_ BitVec 32))

(assert (=> d!99913 (and (bvsge lt!325216 #b00000000000000000000000000000000) (bvslt lt!325216 (bvadd mask!3328 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!99913 (= lt!325216 (choose!52 index!1321 x!1131 mask!3328))))

(assert (=> d!99913 (validMask!0 mask!3328)))

(assert (=> d!99913 (= (nextIndex!0 index!1321 x!1131 mask!3328) lt!325216)))

(declare-fun bs!20972 () Bool)

(assert (= bs!20972 d!99913))

(declare-fun m!686597 () Bool)

(assert (=> bs!20972 m!686597))

(assert (=> bs!20972 m!686401))

(assert (=> b!733520 d!99913))

(check-sat (not bm!34873) (not b!733635) (not bm!34869) (not b!733763) (not d!99913) (not d!99891) (not b!733754) (not b!733766) (not d!99875) (not bm!34872) (not b!733739) (not b!733746) (not d!99907) (not b!733599) (not d!99871) (not d!99905) (not b!733682) (not d!99895) (not d!99887) (not b!733665) (not b!733724) (not b!733668) (not b!733597) (not b!733615) (not d!99889) (not d!99869) (not b!733674) (not b!733768) (not b!733666))
(check-sat)
