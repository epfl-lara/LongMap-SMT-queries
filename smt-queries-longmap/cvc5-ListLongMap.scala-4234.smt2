; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58340 () Bool)

(assert start!58340)

(declare-fun b!644488 () Bool)

(declare-fun e!369267 () Bool)

(declare-fun e!369270 () Bool)

(assert (=> b!644488 (= e!369267 e!369270)))

(declare-fun res!417565 () Bool)

(assert (=> b!644488 (=> (not res!417565) (not e!369270))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6872 0))(
  ( (MissingZero!6872 (index!29820 (_ BitVec 32))) (Found!6872 (index!29821 (_ BitVec 32))) (Intermediate!6872 (undefined!7684 Bool) (index!29822 (_ BitVec 32)) (x!58592 (_ BitVec 32))) (Undefined!6872) (MissingVacant!6872 (index!29823 (_ BitVec 32))) )
))
(declare-fun lt!298746 () SeekEntryResult!6872)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38437 0))(
  ( (array!38438 (arr!18432 (Array (_ BitVec 32) (_ BitVec 64))) (size!18796 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38437)

(assert (=> b!644488 (= res!417565 (and (= lt!298746 (Found!6872 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18432 a!2986) index!984) (select (arr!18432 a!2986) j!136))) (not (= (select (arr!18432 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38437 (_ BitVec 32)) SeekEntryResult!6872)

(assert (=> b!644488 (= lt!298746 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18432 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!644489 () Bool)

(declare-fun res!417564 () Bool)

(declare-fun e!369269 () Bool)

(assert (=> b!644489 (=> (not res!417564) (not e!369269))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38437 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!644489 (= res!417564 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun lt!298734 () array!38437)

(declare-fun b!644490 () Bool)

(declare-fun e!369256 () Bool)

(assert (=> b!644490 (= e!369256 (arrayContainsKey!0 lt!298734 (select (arr!18432 a!2986) j!136) index!984))))

(declare-fun b!644491 () Bool)

(declare-datatypes ((Unit!21858 0))(
  ( (Unit!21859) )
))
(declare-fun e!369260 () Unit!21858)

(declare-fun Unit!21860 () Unit!21858)

(assert (=> b!644491 (= e!369260 Unit!21860)))

(assert (=> b!644491 false))

(declare-fun b!644492 () Bool)

(declare-fun e!369257 () Bool)

(declare-fun e!369266 () Bool)

(assert (=> b!644492 (= e!369257 e!369266)))

(declare-fun res!417559 () Bool)

(assert (=> b!644492 (=> (not res!417559) (not e!369266))))

(assert (=> b!644492 (= res!417559 (arrayContainsKey!0 lt!298734 (select (arr!18432 a!2986) j!136) j!136))))

(declare-fun b!644493 () Bool)

(declare-fun e!369262 () Unit!21858)

(declare-fun Unit!21861 () Unit!21858)

(assert (=> b!644493 (= e!369262 Unit!21861)))

(declare-fun b!644494 () Bool)

(declare-fun res!417555 () Bool)

(declare-fun e!369268 () Bool)

(assert (=> b!644494 (=> (not res!417555) (not e!369268))))

(assert (=> b!644494 (= res!417555 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18432 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!644495 () Bool)

(declare-fun e!369263 () Bool)

(assert (=> b!644495 (= e!369263 (or (bvslt (bvadd #b00000000000000000000000000000001 index!984) #b00000000000000000000000000000000) (bvslt (size!18796 a!2986) #b01111111111111111111111111111111)))))

(assert (=> b!644495 e!369256))

(declare-fun res!417556 () Bool)

(assert (=> b!644495 (=> (not res!417556) (not e!369256))))

(assert (=> b!644495 (= res!417556 (arrayContainsKey!0 lt!298734 (select (arr!18432 a!2986) j!136) j!136))))

(declare-fun b!644496 () Bool)

(declare-fun Unit!21862 () Unit!21858)

(assert (=> b!644496 (= e!369260 Unit!21862)))

(declare-fun b!644497 () Bool)

(declare-fun e!369264 () Bool)

(assert (=> b!644497 (= e!369264 e!369257)))

(declare-fun res!417554 () Bool)

(assert (=> b!644497 (=> res!417554 e!369257)))

(declare-fun lt!298747 () (_ BitVec 64))

(declare-fun lt!298740 () (_ BitVec 64))

(assert (=> b!644497 (= res!417554 (or (not (= (select (arr!18432 a!2986) j!136) lt!298740)) (not (= (select (arr!18432 a!2986) j!136) lt!298747)) (bvsge j!136 index!984)))))

(declare-fun b!644498 () Bool)

(assert (=> b!644498 (= e!369266 (arrayContainsKey!0 lt!298734 (select (arr!18432 a!2986) j!136) index!984))))

(declare-fun b!644499 () Bool)

(declare-fun res!417550 () Bool)

(assert (=> b!644499 (=> (not res!417550) (not e!369269))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!644499 (= res!417550 (validKeyInArray!0 (select (arr!18432 a!2986) j!136)))))

(declare-fun res!417552 () Bool)

(assert (=> start!58340 (=> (not res!417552) (not e!369269))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58340 (= res!417552 (validMask!0 mask!3053))))

(assert (=> start!58340 e!369269))

(assert (=> start!58340 true))

(declare-fun array_inv!14228 (array!38437) Bool)

(assert (=> start!58340 (array_inv!14228 a!2986)))

(declare-fun b!644500 () Bool)

(declare-fun res!417551 () Bool)

(assert (=> b!644500 (=> (not res!417551) (not e!369269))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!644500 (= res!417551 (and (= (size!18796 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18796 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18796 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!644501 () Bool)

(declare-fun res!417560 () Bool)

(assert (=> b!644501 (=> (not res!417560) (not e!369269))))

(assert (=> b!644501 (= res!417560 (validKeyInArray!0 k!1786))))

(declare-fun b!644502 () Bool)

(declare-fun e!369265 () Bool)

(declare-fun lt!298742 () SeekEntryResult!6872)

(assert (=> b!644502 (= e!369265 (= lt!298746 lt!298742))))

(declare-fun b!644503 () Bool)

(declare-fun res!417553 () Bool)

(assert (=> b!644503 (=> (not res!417553) (not e!369268))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38437 (_ BitVec 32)) Bool)

(assert (=> b!644503 (= res!417553 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!644504 () Bool)

(declare-fun e!369258 () Bool)

(assert (=> b!644504 (= e!369258 e!369263)))

(declare-fun res!417561 () Bool)

(assert (=> b!644504 (=> res!417561 e!369263)))

(assert (=> b!644504 (= res!417561 (bvsge index!984 j!136))))

(declare-fun lt!298733 () Unit!21858)

(assert (=> b!644504 (= lt!298733 e!369262)))

(declare-fun c!73837 () Bool)

(assert (=> b!644504 (= c!73837 (bvslt j!136 index!984))))

(declare-fun b!644505 () Bool)

(declare-fun e!369261 () Bool)

(assert (=> b!644505 (= e!369270 (not e!369261))))

(declare-fun res!417562 () Bool)

(assert (=> b!644505 (=> res!417562 e!369261)))

(declare-fun lt!298739 () SeekEntryResult!6872)

(assert (=> b!644505 (= res!417562 (not (= lt!298739 (Found!6872 index!984))))))

(declare-fun lt!298738 () Unit!21858)

(assert (=> b!644505 (= lt!298738 e!369260)))

(declare-fun c!73838 () Bool)

(assert (=> b!644505 (= c!73838 (= lt!298739 Undefined!6872))))

(assert (=> b!644505 (= lt!298739 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!298740 lt!298734 mask!3053))))

(assert (=> b!644505 e!369265))

(declare-fun res!417558 () Bool)

(assert (=> b!644505 (=> (not res!417558) (not e!369265))))

(declare-fun lt!298745 () (_ BitVec 32))

(assert (=> b!644505 (= res!417558 (= lt!298742 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!298745 vacantSpotIndex!68 lt!298740 lt!298734 mask!3053)))))

(assert (=> b!644505 (= lt!298742 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!298745 vacantSpotIndex!68 (select (arr!18432 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!644505 (= lt!298740 (select (store (arr!18432 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!298744 () Unit!21858)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38437 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21858)

(assert (=> b!644505 (= lt!298744 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!298745 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!644505 (= lt!298745 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!644506 () Bool)

(assert (=> b!644506 (= e!369261 e!369258)))

(declare-fun res!417563 () Bool)

(assert (=> b!644506 (=> res!417563 e!369258)))

(assert (=> b!644506 (= res!417563 (or (not (= (select (arr!18432 a!2986) j!136) lt!298740)) (not (= (select (arr!18432 a!2986) j!136) lt!298747))))))

(assert (=> b!644506 e!369264))

(declare-fun res!417548 () Bool)

(assert (=> b!644506 (=> (not res!417548) (not e!369264))))

(assert (=> b!644506 (= res!417548 (= lt!298747 (select (arr!18432 a!2986) j!136)))))

(assert (=> b!644506 (= lt!298747 (select (store (arr!18432 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!644507 () Bool)

(assert (=> b!644507 (= e!369269 e!369268)))

(declare-fun res!417557 () Bool)

(assert (=> b!644507 (=> (not res!417557) (not e!369268))))

(declare-fun lt!298743 () SeekEntryResult!6872)

(assert (=> b!644507 (= res!417557 (or (= lt!298743 (MissingZero!6872 i!1108)) (= lt!298743 (MissingVacant!6872 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38437 (_ BitVec 32)) SeekEntryResult!6872)

(assert (=> b!644507 (= lt!298743 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!644508 () Bool)

(declare-fun Unit!21863 () Unit!21858)

(assert (=> b!644508 (= e!369262 Unit!21863)))

(declare-fun lt!298735 () Unit!21858)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38437 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21858)

(assert (=> b!644508 (= lt!298735 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!298734 (select (arr!18432 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!644508 (arrayContainsKey!0 lt!298734 (select (arr!18432 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!298741 () Unit!21858)

(declare-datatypes ((List!12473 0))(
  ( (Nil!12470) (Cons!12469 (h!13514 (_ BitVec 64)) (t!18701 List!12473)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38437 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12473) Unit!21858)

(assert (=> b!644508 (= lt!298741 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12470))))

(declare-fun arrayNoDuplicates!0 (array!38437 (_ BitVec 32) List!12473) Bool)

(assert (=> b!644508 (arrayNoDuplicates!0 lt!298734 #b00000000000000000000000000000000 Nil!12470)))

(declare-fun lt!298737 () Unit!21858)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38437 (_ BitVec 32) (_ BitVec 32)) Unit!21858)

(assert (=> b!644508 (= lt!298737 (lemmaNoDuplicateFromThenFromBigger!0 lt!298734 #b00000000000000000000000000000000 j!136))))

(assert (=> b!644508 (arrayNoDuplicates!0 lt!298734 j!136 Nil!12470)))

(declare-fun lt!298736 () Unit!21858)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38437 (_ BitVec 64) (_ BitVec 32) List!12473) Unit!21858)

(assert (=> b!644508 (= lt!298736 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!298734 (select (arr!18432 a!2986) j!136) j!136 Nil!12470))))

(assert (=> b!644508 false))

(declare-fun b!644509 () Bool)

(declare-fun res!417549 () Bool)

(assert (=> b!644509 (=> (not res!417549) (not e!369268))))

(assert (=> b!644509 (= res!417549 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12470))))

(declare-fun b!644510 () Bool)

(assert (=> b!644510 (= e!369268 e!369267)))

(declare-fun res!417566 () Bool)

(assert (=> b!644510 (=> (not res!417566) (not e!369267))))

(assert (=> b!644510 (= res!417566 (= (select (store (arr!18432 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!644510 (= lt!298734 (array!38438 (store (arr!18432 a!2986) i!1108 k!1786) (size!18796 a!2986)))))

(assert (= (and start!58340 res!417552) b!644500))

(assert (= (and b!644500 res!417551) b!644499))

(assert (= (and b!644499 res!417550) b!644501))

(assert (= (and b!644501 res!417560) b!644489))

(assert (= (and b!644489 res!417564) b!644507))

(assert (= (and b!644507 res!417557) b!644503))

(assert (= (and b!644503 res!417553) b!644509))

(assert (= (and b!644509 res!417549) b!644494))

(assert (= (and b!644494 res!417555) b!644510))

(assert (= (and b!644510 res!417566) b!644488))

(assert (= (and b!644488 res!417565) b!644505))

(assert (= (and b!644505 res!417558) b!644502))

(assert (= (and b!644505 c!73838) b!644491))

(assert (= (and b!644505 (not c!73838)) b!644496))

(assert (= (and b!644505 (not res!417562)) b!644506))

(assert (= (and b!644506 res!417548) b!644497))

(assert (= (and b!644497 (not res!417554)) b!644492))

(assert (= (and b!644492 res!417559) b!644498))

(assert (= (and b!644506 (not res!417563)) b!644504))

(assert (= (and b!644504 c!73837) b!644508))

(assert (= (and b!644504 (not c!73837)) b!644493))

(assert (= (and b!644504 (not res!417561)) b!644495))

(assert (= (and b!644495 res!417556) b!644490))

(declare-fun m!618089 () Bool)

(assert (=> b!644506 m!618089))

(declare-fun m!618091 () Bool)

(assert (=> b!644506 m!618091))

(declare-fun m!618093 () Bool)

(assert (=> b!644506 m!618093))

(declare-fun m!618095 () Bool)

(assert (=> b!644507 m!618095))

(declare-fun m!618097 () Bool)

(assert (=> b!644503 m!618097))

(declare-fun m!618099 () Bool)

(assert (=> b!644505 m!618099))

(declare-fun m!618101 () Bool)

(assert (=> b!644505 m!618101))

(assert (=> b!644505 m!618089))

(assert (=> b!644505 m!618091))

(assert (=> b!644505 m!618089))

(declare-fun m!618103 () Bool)

(assert (=> b!644505 m!618103))

(declare-fun m!618105 () Bool)

(assert (=> b!644505 m!618105))

(declare-fun m!618107 () Bool)

(assert (=> b!644505 m!618107))

(declare-fun m!618109 () Bool)

(assert (=> b!644505 m!618109))

(assert (=> b!644510 m!618091))

(declare-fun m!618111 () Bool)

(assert (=> b!644510 m!618111))

(assert (=> b!644492 m!618089))

(assert (=> b!644492 m!618089))

(declare-fun m!618113 () Bool)

(assert (=> b!644492 m!618113))

(assert (=> b!644490 m!618089))

(assert (=> b!644490 m!618089))

(declare-fun m!618115 () Bool)

(assert (=> b!644490 m!618115))

(assert (=> b!644497 m!618089))

(assert (=> b!644495 m!618089))

(assert (=> b!644495 m!618089))

(assert (=> b!644495 m!618113))

(declare-fun m!618117 () Bool)

(assert (=> start!58340 m!618117))

(declare-fun m!618119 () Bool)

(assert (=> start!58340 m!618119))

(declare-fun m!618121 () Bool)

(assert (=> b!644509 m!618121))

(declare-fun m!618123 () Bool)

(assert (=> b!644488 m!618123))

(assert (=> b!644488 m!618089))

(assert (=> b!644488 m!618089))

(declare-fun m!618125 () Bool)

(assert (=> b!644488 m!618125))

(declare-fun m!618127 () Bool)

(assert (=> b!644494 m!618127))

(assert (=> b!644498 m!618089))

(assert (=> b!644498 m!618089))

(assert (=> b!644498 m!618115))

(declare-fun m!618129 () Bool)

(assert (=> b!644501 m!618129))

(assert (=> b!644499 m!618089))

(assert (=> b!644499 m!618089))

(declare-fun m!618131 () Bool)

(assert (=> b!644499 m!618131))

(declare-fun m!618133 () Bool)

(assert (=> b!644489 m!618133))

(declare-fun m!618135 () Bool)

(assert (=> b!644508 m!618135))

(assert (=> b!644508 m!618089))

(declare-fun m!618137 () Bool)

(assert (=> b!644508 m!618137))

(declare-fun m!618139 () Bool)

(assert (=> b!644508 m!618139))

(declare-fun m!618141 () Bool)

(assert (=> b!644508 m!618141))

(assert (=> b!644508 m!618089))

(declare-fun m!618143 () Bool)

(assert (=> b!644508 m!618143))

(declare-fun m!618145 () Bool)

(assert (=> b!644508 m!618145))

(assert (=> b!644508 m!618089))

(declare-fun m!618147 () Bool)

(assert (=> b!644508 m!618147))

(assert (=> b!644508 m!618089))

(push 1)

(assert (not b!644503))

(assert (not b!644507))

(assert (not b!644498))

(assert (not b!644489))

(assert (not b!644492))

(assert (not b!644509))

(assert (not b!644505))

(assert (not b!644488))

(assert (not b!644499))

(assert (not start!58340))

(assert (not b!644490))

(assert (not b!644501))

(assert (not b!644508))

(assert (not b!644495))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!91097 () Bool)

(assert (=> d!91097 (= (validKeyInArray!0 (select (arr!18432 a!2986) j!136)) (and (not (= (select (arr!18432 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18432 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!644499 d!91097))

(declare-fun d!91099 () Bool)

(declare-fun res!417711 () Bool)

(declare-fun e!369418 () Bool)

(assert (=> d!91099 (=> res!417711 e!369418)))

(assert (=> d!91099 (= res!417711 (= (select (arr!18432 a!2986) #b00000000000000000000000000000000) k!1786))))

(assert (=> d!91099 (= (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000) e!369418)))

(declare-fun b!644733 () Bool)

(declare-fun e!369419 () Bool)

(assert (=> b!644733 (= e!369418 e!369419)))

(declare-fun res!417712 () Bool)

(assert (=> b!644733 (=> (not res!417712) (not e!369419))))

(assert (=> b!644733 (= res!417712 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18796 a!2986)))))

(declare-fun b!644734 () Bool)

(assert (=> b!644734 (= e!369419 (arrayContainsKey!0 a!2986 k!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!91099 (not res!417711)) b!644733))

(assert (= (and b!644733 res!417712) b!644734))

(declare-fun m!618331 () Bool)

(assert (=> d!91099 m!618331))

(declare-fun m!618333 () Bool)

(assert (=> b!644734 m!618333))

(assert (=> b!644489 d!91099))

(declare-fun d!91103 () Bool)

(declare-fun res!417713 () Bool)

(declare-fun e!369420 () Bool)

(assert (=> d!91103 (=> res!417713 e!369420)))

(assert (=> d!91103 (= res!417713 (= (select (arr!18432 lt!298734) index!984) (select (arr!18432 a!2986) j!136)))))

(assert (=> d!91103 (= (arrayContainsKey!0 lt!298734 (select (arr!18432 a!2986) j!136) index!984) e!369420)))

(declare-fun b!644735 () Bool)

(declare-fun e!369421 () Bool)

(assert (=> b!644735 (= e!369420 e!369421)))

(declare-fun res!417714 () Bool)

(assert (=> b!644735 (=> (not res!417714) (not e!369421))))

(assert (=> b!644735 (= res!417714 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18796 lt!298734)))))

(declare-fun b!644736 () Bool)

(assert (=> b!644736 (= e!369421 (arrayContainsKey!0 lt!298734 (select (arr!18432 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!91103 (not res!417713)) b!644735))

(assert (= (and b!644735 res!417714) b!644736))

(declare-fun m!618335 () Bool)

(assert (=> d!91103 m!618335))

(assert (=> b!644736 m!618089))

(declare-fun m!618337 () Bool)

(assert (=> b!644736 m!618337))

(assert (=> b!644498 d!91103))

(declare-fun b!644796 () Bool)

(declare-fun e!369465 () SeekEntryResult!6872)

(assert (=> b!644796 (= e!369465 (Found!6872 index!984))))

(declare-fun e!369466 () SeekEntryResult!6872)

(declare-fun b!644797 () Bool)

(assert (=> b!644797 (= e!369466 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18432 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!644798 () Bool)

(declare-fun e!369464 () SeekEntryResult!6872)

(assert (=> b!644798 (= e!369464 e!369465)))

(declare-fun c!73896 () Bool)

(declare-fun lt!298900 () (_ BitVec 64))

(assert (=> b!644798 (= c!73896 (= lt!298900 (select (arr!18432 a!2986) j!136)))))

(declare-fun lt!298899 () SeekEntryResult!6872)

(declare-fun d!91105 () Bool)

(assert (=> d!91105 (and (or (is-Undefined!6872 lt!298899) (not (is-Found!6872 lt!298899)) (and (bvsge (index!29821 lt!298899) #b00000000000000000000000000000000) (bvslt (index!29821 lt!298899) (size!18796 a!2986)))) (or (is-Undefined!6872 lt!298899) (is-Found!6872 lt!298899) (not (is-MissingVacant!6872 lt!298899)) (not (= (index!29823 lt!298899) vacantSpotIndex!68)) (and (bvsge (index!29823 lt!298899) #b00000000000000000000000000000000) (bvslt (index!29823 lt!298899) (size!18796 a!2986)))) (or (is-Undefined!6872 lt!298899) (ite (is-Found!6872 lt!298899) (= (select (arr!18432 a!2986) (index!29821 lt!298899)) (select (arr!18432 a!2986) j!136)) (and (is-MissingVacant!6872 lt!298899) (= (index!29823 lt!298899) vacantSpotIndex!68) (= (select (arr!18432 a!2986) (index!29823 lt!298899)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!91105 (= lt!298899 e!369464)))

(declare-fun c!73897 () Bool)

(assert (=> d!91105 (= c!73897 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!91105 (= lt!298900 (select (arr!18432 a!2986) index!984))))

(assert (=> d!91105 (validMask!0 mask!3053)))

(assert (=> d!91105 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18432 a!2986) j!136) a!2986 mask!3053) lt!298899)))

(declare-fun b!644799 () Bool)

(assert (=> b!644799 (= e!369464 Undefined!6872)))

(declare-fun b!644800 () Bool)

(declare-fun c!73895 () Bool)

(assert (=> b!644800 (= c!73895 (= lt!298900 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!644800 (= e!369465 e!369466)))

(declare-fun b!644801 () Bool)

(assert (=> b!644801 (= e!369466 (MissingVacant!6872 vacantSpotIndex!68))))

(assert (= (and d!91105 c!73897) b!644799))

(assert (= (and d!91105 (not c!73897)) b!644798))

(assert (= (and b!644798 c!73896) b!644796))

(assert (= (and b!644798 (not c!73896)) b!644800))

(assert (= (and b!644800 c!73895) b!644801))

(assert (= (and b!644800 (not c!73895)) b!644797))

(assert (=> b!644797 m!618099))

(assert (=> b!644797 m!618099))

(assert (=> b!644797 m!618089))

(declare-fun m!618389 () Bool)

(assert (=> b!644797 m!618389))

(declare-fun m!618391 () Bool)

(assert (=> d!91105 m!618391))

(declare-fun m!618393 () Bool)

(assert (=> d!91105 m!618393))

(assert (=> d!91105 m!618123))

(assert (=> d!91105 m!618117))

(assert (=> b!644488 d!91105))

(declare-fun b!644827 () Bool)

(declare-fun e!369488 () Bool)

(declare-fun e!369490 () Bool)

(assert (=> b!644827 (= e!369488 e!369490)))

(declare-fun c!73903 () Bool)

(assert (=> b!644827 (= c!73903 (validKeyInArray!0 (select (arr!18432 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33622 () Bool)

(declare-fun call!33625 () Bool)

(assert (=> bm!33622 (= call!33625 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!73903 (Cons!12469 (select (arr!18432 a!2986) #b00000000000000000000000000000000) Nil!12470) Nil!12470)))))

(declare-fun b!644828 () Bool)

(assert (=> b!644828 (= e!369490 call!33625)))

(declare-fun b!644829 () Bool)

(declare-fun e!369489 () Bool)

(assert (=> b!644829 (= e!369489 e!369488)))

(declare-fun res!417755 () Bool)

(assert (=> b!644829 (=> (not res!417755) (not e!369488))))

(declare-fun e!369487 () Bool)

(assert (=> b!644829 (= res!417755 (not e!369487))))

(declare-fun res!417757 () Bool)

(assert (=> b!644829 (=> (not res!417757) (not e!369487))))

(assert (=> b!644829 (= res!417757 (validKeyInArray!0 (select (arr!18432 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!91135 () Bool)

(declare-fun res!417756 () Bool)

(assert (=> d!91135 (=> res!417756 e!369489)))

(assert (=> d!91135 (= res!417756 (bvsge #b00000000000000000000000000000000 (size!18796 a!2986)))))

(assert (=> d!91135 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12470) e!369489)))

(declare-fun b!644830 () Bool)

(declare-fun contains!3146 (List!12473 (_ BitVec 64)) Bool)

(assert (=> b!644830 (= e!369487 (contains!3146 Nil!12470 (select (arr!18432 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!644831 () Bool)

(assert (=> b!644831 (= e!369490 call!33625)))

(assert (= (and d!91135 (not res!417756)) b!644829))

(assert (= (and b!644829 res!417757) b!644830))

(assert (= (and b!644829 res!417755) b!644827))

(assert (= (and b!644827 c!73903) b!644828))

(assert (= (and b!644827 (not c!73903)) b!644831))

(assert (= (or b!644828 b!644831) bm!33622))

(assert (=> b!644827 m!618331))

(assert (=> b!644827 m!618331))

(declare-fun m!618405 () Bool)

(assert (=> b!644827 m!618405))

(assert (=> bm!33622 m!618331))

(declare-fun m!618407 () Bool)

(assert (=> bm!33622 m!618407))

(assert (=> b!644829 m!618331))

(assert (=> b!644829 m!618331))

(assert (=> b!644829 m!618405))

(assert (=> b!644830 m!618331))

(assert (=> b!644830 m!618331))

(declare-fun m!618409 () Bool)

(assert (=> b!644830 m!618409))

(assert (=> b!644509 d!91135))

(declare-fun d!91141 () Bool)

(declare-fun res!417758 () Bool)

(declare-fun e!369491 () Bool)

(assert (=> d!91141 (=> res!417758 e!369491)))

(assert (=> d!91141 (= res!417758 (= (select (arr!18432 lt!298734) j!136) (select (arr!18432 a!2986) j!136)))))

(assert (=> d!91141 (= (arrayContainsKey!0 lt!298734 (select (arr!18432 a!2986) j!136) j!136) e!369491)))

(declare-fun b!644832 () Bool)

(declare-fun e!369492 () Bool)

(assert (=> b!644832 (= e!369491 e!369492)))

(declare-fun res!417759 () Bool)

(assert (=> b!644832 (=> (not res!417759) (not e!369492))))

(assert (=> b!644832 (= res!417759 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18796 lt!298734)))))

(declare-fun b!644833 () Bool)

(assert (=> b!644833 (= e!369492 (arrayContainsKey!0 lt!298734 (select (arr!18432 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!91141 (not res!417758)) b!644832))

(assert (= (and b!644832 res!417759) b!644833))

(declare-fun m!618411 () Bool)

(assert (=> d!91141 m!618411))

(assert (=> b!644833 m!618089))

(declare-fun m!618413 () Bool)

(assert (=> b!644833 m!618413))

(assert (=> b!644492 d!91141))

(assert (=> b!644490 d!91103))

(declare-fun d!91143 () Bool)

(assert (=> d!91143 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

