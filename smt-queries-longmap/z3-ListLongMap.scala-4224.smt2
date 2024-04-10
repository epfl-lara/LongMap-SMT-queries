; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58024 () Bool)

(assert start!58024)

(declare-fun b!641540 () Bool)

(declare-fun res!415527 () Bool)

(declare-fun e!367339 () Bool)

(assert (=> b!641540 (=> (not res!415527) (not e!367339))))

(declare-datatypes ((array!38370 0))(
  ( (array!38371 (arr!18403 (Array (_ BitVec 32) (_ BitVec 64))) (size!18767 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38370)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!641540 (= res!415527 (validKeyInArray!0 (select (arr!18403 a!2986) j!136)))))

(declare-fun b!641541 () Bool)

(declare-fun e!367329 () Bool)

(declare-datatypes ((SeekEntryResult!6843 0))(
  ( (MissingZero!6843 (index!29695 (_ BitVec 32))) (Found!6843 (index!29696 (_ BitVec 32))) (Intermediate!6843 (undefined!7655 Bool) (index!29697 (_ BitVec 32)) (x!58456 (_ BitVec 32))) (Undefined!6843) (MissingVacant!6843 (index!29698 (_ BitVec 32))) )
))
(declare-fun lt!297037 () SeekEntryResult!6843)

(declare-fun lt!297029 () SeekEntryResult!6843)

(assert (=> b!641541 (= e!367329 (= lt!297037 lt!297029))))

(declare-fun b!641542 () Bool)

(declare-fun res!415518 () Bool)

(declare-fun e!367338 () Bool)

(assert (=> b!641542 (=> res!415518 e!367338)))

(declare-datatypes ((List!12444 0))(
  ( (Nil!12441) (Cons!12440 (h!13485 (_ BitVec 64)) (t!18672 List!12444)) )
))
(declare-fun noDuplicate!403 (List!12444) Bool)

(assert (=> b!641542 (= res!415518 (not (noDuplicate!403 Nil!12441)))))

(declare-fun b!641543 () Bool)

(declare-fun e!367341 () Bool)

(assert (=> b!641543 (= e!367338 e!367341)))

(declare-fun res!415533 () Bool)

(assert (=> b!641543 (=> (not res!415533) (not e!367341))))

(declare-fun contains!3131 (List!12444 (_ BitVec 64)) Bool)

(assert (=> b!641543 (= res!415533 (not (contains!3131 Nil!12441 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!641544 () Bool)

(declare-fun res!415524 () Bool)

(declare-fun e!367335 () Bool)

(assert (=> b!641544 (=> (not res!415524) (not e!367335))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38370 (_ BitVec 32)) Bool)

(assert (=> b!641544 (= res!415524 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!641545 () Bool)

(declare-fun e!367328 () Bool)

(declare-fun e!367334 () Bool)

(assert (=> b!641545 (= e!367328 e!367334)))

(declare-fun res!415528 () Bool)

(assert (=> b!641545 (=> res!415528 e!367334)))

(declare-fun lt!297030 () (_ BitVec 64))

(declare-fun lt!297040 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!641545 (= res!415528 (or (not (= (select (arr!18403 a!2986) j!136) lt!297030)) (not (= (select (arr!18403 a!2986) j!136) lt!297040)) (bvsge j!136 index!984)))))

(declare-fun e!367331 () Bool)

(assert (=> b!641545 e!367331))

(declare-fun res!415525 () Bool)

(assert (=> b!641545 (=> (not res!415525) (not e!367331))))

(assert (=> b!641545 (= res!415525 (= lt!297040 (select (arr!18403 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!641545 (= lt!297040 (select (store (arr!18403 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!641546 () Bool)

(declare-fun e!367332 () Bool)

(assert (=> b!641546 (= e!367332 (not e!367328))))

(declare-fun res!415516 () Bool)

(assert (=> b!641546 (=> res!415516 e!367328)))

(declare-fun lt!297033 () SeekEntryResult!6843)

(assert (=> b!641546 (= res!415516 (not (= lt!297033 (Found!6843 index!984))))))

(declare-datatypes ((Unit!21706 0))(
  ( (Unit!21707) )
))
(declare-fun lt!297032 () Unit!21706)

(declare-fun e!367337 () Unit!21706)

(assert (=> b!641546 (= lt!297032 e!367337)))

(declare-fun c!73379 () Bool)

(assert (=> b!641546 (= c!73379 (= lt!297033 Undefined!6843))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!297034 () array!38370)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38370 (_ BitVec 32)) SeekEntryResult!6843)

(assert (=> b!641546 (= lt!297033 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!297030 lt!297034 mask!3053))))

(assert (=> b!641546 e!367329))

(declare-fun res!415531 () Bool)

(assert (=> b!641546 (=> (not res!415531) (not e!367329))))

(declare-fun lt!297028 () (_ BitVec 32))

(assert (=> b!641546 (= res!415531 (= lt!297029 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297028 vacantSpotIndex!68 lt!297030 lt!297034 mask!3053)))))

(assert (=> b!641546 (= lt!297029 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297028 vacantSpotIndex!68 (select (arr!18403 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!641546 (= lt!297030 (select (store (arr!18403 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!297035 () Unit!21706)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38370 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21706)

(assert (=> b!641546 (= lt!297035 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!297028 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!641546 (= lt!297028 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!641547 () Bool)

(declare-fun res!415535 () Bool)

(assert (=> b!641547 (=> (not res!415535) (not e!367339))))

(assert (=> b!641547 (= res!415535 (and (= (size!18767 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18767 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18767 a!2986)) (not (= i!1108 j!136))))))

(declare-fun e!367330 () Bool)

(declare-fun b!641548 () Bool)

(declare-fun arrayContainsKey!0 (array!38370 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!641548 (= e!367330 (arrayContainsKey!0 lt!297034 (select (arr!18403 a!2986) j!136) index!984))))

(declare-fun b!641549 () Bool)

(declare-fun res!415526 () Bool)

(assert (=> b!641549 (=> (not res!415526) (not e!367335))))

(assert (=> b!641549 (= res!415526 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18403 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!641550 () Bool)

(declare-fun e!367340 () Bool)

(assert (=> b!641550 (= e!367331 e!367340)))

(declare-fun res!415519 () Bool)

(assert (=> b!641550 (=> res!415519 e!367340)))

(assert (=> b!641550 (= res!415519 (or (not (= (select (arr!18403 a!2986) j!136) lt!297030)) (not (= (select (arr!18403 a!2986) j!136) lt!297040)) (bvsge j!136 index!984)))))

(declare-fun b!641551 () Bool)

(declare-fun Unit!21708 () Unit!21706)

(assert (=> b!641551 (= e!367337 Unit!21708)))

(assert (=> b!641551 false))

(declare-fun b!641553 () Bool)

(assert (=> b!641553 (= e!367339 e!367335)))

(declare-fun res!415523 () Bool)

(assert (=> b!641553 (=> (not res!415523) (not e!367335))))

(declare-fun lt!297036 () SeekEntryResult!6843)

(assert (=> b!641553 (= res!415523 (or (= lt!297036 (MissingZero!6843 i!1108)) (= lt!297036 (MissingVacant!6843 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38370 (_ BitVec 32)) SeekEntryResult!6843)

(assert (=> b!641553 (= lt!297036 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!641554 () Bool)

(declare-fun e!367336 () Bool)

(assert (=> b!641554 (= e!367335 e!367336)))

(declare-fun res!415529 () Bool)

(assert (=> b!641554 (=> (not res!415529) (not e!367336))))

(assert (=> b!641554 (= res!415529 (= (select (store (arr!18403 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!641554 (= lt!297034 (array!38371 (store (arr!18403 a!2986) i!1108 k0!1786) (size!18767 a!2986)))))

(declare-fun b!641555 () Bool)

(declare-fun Unit!21709 () Unit!21706)

(assert (=> b!641555 (= e!367337 Unit!21709)))

(declare-fun b!641556 () Bool)

(assert (=> b!641556 (= e!367334 e!367338)))

(declare-fun res!415534 () Bool)

(assert (=> b!641556 (=> res!415534 e!367338)))

(assert (=> b!641556 (= res!415534 (or (bvsge (size!18767 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 j!136) (size!18767 a!2986))))))

(declare-fun arrayNoDuplicates!0 (array!38370 (_ BitVec 32) List!12444) Bool)

(assert (=> b!641556 (arrayNoDuplicates!0 lt!297034 j!136 Nil!12441)))

(declare-fun lt!297039 () Unit!21706)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38370 (_ BitVec 32) (_ BitVec 32)) Unit!21706)

(assert (=> b!641556 (= lt!297039 (lemmaNoDuplicateFromThenFromBigger!0 lt!297034 #b00000000000000000000000000000000 j!136))))

(assert (=> b!641556 (arrayNoDuplicates!0 lt!297034 #b00000000000000000000000000000000 Nil!12441)))

(declare-fun lt!297031 () Unit!21706)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38370 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12444) Unit!21706)

(assert (=> b!641556 (= lt!297031 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12441))))

(assert (=> b!641556 (arrayContainsKey!0 lt!297034 (select (arr!18403 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!297038 () Unit!21706)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38370 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21706)

(assert (=> b!641556 (= lt!297038 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!297034 (select (arr!18403 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!641557 () Bool)

(declare-fun res!415530 () Bool)

(assert (=> b!641557 (=> (not res!415530) (not e!367339))))

(assert (=> b!641557 (= res!415530 (validKeyInArray!0 k0!1786))))

(declare-fun b!641558 () Bool)

(assert (=> b!641558 (= e!367341 (not (contains!3131 Nil!12441 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!641559 () Bool)

(declare-fun res!415517 () Bool)

(assert (=> b!641559 (=> (not res!415517) (not e!367339))))

(assert (=> b!641559 (= res!415517 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!641560 () Bool)

(declare-fun res!415522 () Bool)

(assert (=> b!641560 (=> (not res!415522) (not e!367335))))

(assert (=> b!641560 (= res!415522 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12441))))

(declare-fun b!641561 () Bool)

(assert (=> b!641561 (= e!367340 e!367330)))

(declare-fun res!415520 () Bool)

(assert (=> b!641561 (=> (not res!415520) (not e!367330))))

(assert (=> b!641561 (= res!415520 (arrayContainsKey!0 lt!297034 (select (arr!18403 a!2986) j!136) j!136))))

(declare-fun b!641552 () Bool)

(assert (=> b!641552 (= e!367336 e!367332)))

(declare-fun res!415532 () Bool)

(assert (=> b!641552 (=> (not res!415532) (not e!367332))))

(assert (=> b!641552 (= res!415532 (and (= lt!297037 (Found!6843 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18403 a!2986) index!984) (select (arr!18403 a!2986) j!136))) (not (= (select (arr!18403 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!641552 (= lt!297037 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18403 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!415521 () Bool)

(assert (=> start!58024 (=> (not res!415521) (not e!367339))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58024 (= res!415521 (validMask!0 mask!3053))))

(assert (=> start!58024 e!367339))

(assert (=> start!58024 true))

(declare-fun array_inv!14199 (array!38370) Bool)

(assert (=> start!58024 (array_inv!14199 a!2986)))

(assert (= (and start!58024 res!415521) b!641547))

(assert (= (and b!641547 res!415535) b!641540))

(assert (= (and b!641540 res!415527) b!641557))

(assert (= (and b!641557 res!415530) b!641559))

(assert (= (and b!641559 res!415517) b!641553))

(assert (= (and b!641553 res!415523) b!641544))

(assert (= (and b!641544 res!415524) b!641560))

(assert (= (and b!641560 res!415522) b!641549))

(assert (= (and b!641549 res!415526) b!641554))

(assert (= (and b!641554 res!415529) b!641552))

(assert (= (and b!641552 res!415532) b!641546))

(assert (= (and b!641546 res!415531) b!641541))

(assert (= (and b!641546 c!73379) b!641551))

(assert (= (and b!641546 (not c!73379)) b!641555))

(assert (= (and b!641546 (not res!415516)) b!641545))

(assert (= (and b!641545 res!415525) b!641550))

(assert (= (and b!641550 (not res!415519)) b!641561))

(assert (= (and b!641561 res!415520) b!641548))

(assert (= (and b!641545 (not res!415528)) b!641556))

(assert (= (and b!641556 (not res!415534)) b!641542))

(assert (= (and b!641542 (not res!415518)) b!641543))

(assert (= (and b!641543 res!415533) b!641558))

(declare-fun m!615345 () Bool)

(assert (=> b!641558 m!615345))

(declare-fun m!615347 () Bool)

(assert (=> b!641553 m!615347))

(declare-fun m!615349 () Bool)

(assert (=> b!641548 m!615349))

(assert (=> b!641548 m!615349))

(declare-fun m!615351 () Bool)

(assert (=> b!641548 m!615351))

(assert (=> b!641545 m!615349))

(declare-fun m!615353 () Bool)

(assert (=> b!641545 m!615353))

(declare-fun m!615355 () Bool)

(assert (=> b!641545 m!615355))

(declare-fun m!615357 () Bool)

(assert (=> b!641552 m!615357))

(assert (=> b!641552 m!615349))

(assert (=> b!641552 m!615349))

(declare-fun m!615359 () Bool)

(assert (=> b!641552 m!615359))

(declare-fun m!615361 () Bool)

(assert (=> b!641544 m!615361))

(declare-fun m!615363 () Bool)

(assert (=> b!641557 m!615363))

(assert (=> b!641561 m!615349))

(assert (=> b!641561 m!615349))

(declare-fun m!615365 () Bool)

(assert (=> b!641561 m!615365))

(declare-fun m!615367 () Bool)

(assert (=> b!641559 m!615367))

(declare-fun m!615369 () Bool)

(assert (=> b!641549 m!615369))

(declare-fun m!615371 () Bool)

(assert (=> b!641560 m!615371))

(assert (=> b!641556 m!615349))

(declare-fun m!615373 () Bool)

(assert (=> b!641556 m!615373))

(declare-fun m!615375 () Bool)

(assert (=> b!641556 m!615375))

(declare-fun m!615377 () Bool)

(assert (=> b!641556 m!615377))

(declare-fun m!615379 () Bool)

(assert (=> b!641556 m!615379))

(declare-fun m!615381 () Bool)

(assert (=> b!641556 m!615381))

(assert (=> b!641556 m!615349))

(assert (=> b!641556 m!615349))

(declare-fun m!615383 () Bool)

(assert (=> b!641556 m!615383))

(declare-fun m!615385 () Bool)

(assert (=> b!641543 m!615385))

(assert (=> b!641554 m!615353))

(declare-fun m!615387 () Bool)

(assert (=> b!641554 m!615387))

(declare-fun m!615389 () Bool)

(assert (=> b!641546 m!615389))

(declare-fun m!615391 () Bool)

(assert (=> b!641546 m!615391))

(declare-fun m!615393 () Bool)

(assert (=> b!641546 m!615393))

(assert (=> b!641546 m!615349))

(assert (=> b!641546 m!615353))

(declare-fun m!615395 () Bool)

(assert (=> b!641546 m!615395))

(declare-fun m!615397 () Bool)

(assert (=> b!641546 m!615397))

(assert (=> b!641546 m!615349))

(declare-fun m!615399 () Bool)

(assert (=> b!641546 m!615399))

(declare-fun m!615401 () Bool)

(assert (=> start!58024 m!615401))

(declare-fun m!615403 () Bool)

(assert (=> start!58024 m!615403))

(assert (=> b!641540 m!615349))

(assert (=> b!641540 m!615349))

(declare-fun m!615405 () Bool)

(assert (=> b!641540 m!615405))

(assert (=> b!641550 m!615349))

(declare-fun m!615407 () Bool)

(assert (=> b!641542 m!615407))

(check-sat (not b!641552) (not b!641540) (not b!641559) (not b!641556) (not b!641544) (not b!641561) (not b!641543) (not b!641560) (not b!641558) (not b!641542) (not b!641546) (not b!641557) (not b!641548) (not b!641553) (not start!58024))
(check-sat)
(get-model)

(declare-fun d!90625 () Bool)

(declare-fun res!415602 () Bool)

(declare-fun e!367392 () Bool)

(assert (=> d!90625 (=> res!415602 e!367392)))

(assert (=> d!90625 (= res!415602 (bvsge #b00000000000000000000000000000000 (size!18767 a!2986)))))

(assert (=> d!90625 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12441) e!367392)))

(declare-fun b!641638 () Bool)

(declare-fun e!367393 () Bool)

(declare-fun call!33539 () Bool)

(assert (=> b!641638 (= e!367393 call!33539)))

(declare-fun b!641639 () Bool)

(declare-fun e!367394 () Bool)

(assert (=> b!641639 (= e!367392 e!367394)))

(declare-fun res!415604 () Bool)

(assert (=> b!641639 (=> (not res!415604) (not e!367394))))

(declare-fun e!367395 () Bool)

(assert (=> b!641639 (= res!415604 (not e!367395))))

(declare-fun res!415603 () Bool)

(assert (=> b!641639 (=> (not res!415603) (not e!367395))))

(assert (=> b!641639 (= res!415603 (validKeyInArray!0 (select (arr!18403 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!641640 () Bool)

(assert (=> b!641640 (= e!367393 call!33539)))

(declare-fun b!641641 () Bool)

(assert (=> b!641641 (= e!367395 (contains!3131 Nil!12441 (select (arr!18403 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!641642 () Bool)

(assert (=> b!641642 (= e!367394 e!367393)))

(declare-fun c!73385 () Bool)

(assert (=> b!641642 (= c!73385 (validKeyInArray!0 (select (arr!18403 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33536 () Bool)

(assert (=> bm!33536 (= call!33539 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!73385 (Cons!12440 (select (arr!18403 a!2986) #b00000000000000000000000000000000) Nil!12441) Nil!12441)))))

(assert (= (and d!90625 (not res!415602)) b!641639))

(assert (= (and b!641639 res!415603) b!641641))

(assert (= (and b!641639 res!415604) b!641642))

(assert (= (and b!641642 c!73385) b!641640))

(assert (= (and b!641642 (not c!73385)) b!641638))

(assert (= (or b!641640 b!641638) bm!33536))

(declare-fun m!615473 () Bool)

(assert (=> b!641639 m!615473))

(assert (=> b!641639 m!615473))

(declare-fun m!615475 () Bool)

(assert (=> b!641639 m!615475))

(assert (=> b!641641 m!615473))

(assert (=> b!641641 m!615473))

(declare-fun m!615477 () Bool)

(assert (=> b!641641 m!615477))

(assert (=> b!641642 m!615473))

(assert (=> b!641642 m!615473))

(assert (=> b!641642 m!615475))

(assert (=> bm!33536 m!615473))

(declare-fun m!615479 () Bool)

(assert (=> bm!33536 m!615479))

(assert (=> b!641560 d!90625))

(declare-fun d!90627 () Bool)

(assert (=> d!90627 (= (validKeyInArray!0 (select (arr!18403 a!2986) j!136)) (and (not (= (select (arr!18403 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18403 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!641540 d!90627))

(declare-fun d!90629 () Bool)

(declare-fun res!415609 () Bool)

(declare-fun e!367400 () Bool)

(assert (=> d!90629 (=> res!415609 e!367400)))

(assert (=> d!90629 (= res!415609 (= (select (arr!18403 lt!297034) j!136) (select (arr!18403 a!2986) j!136)))))

(assert (=> d!90629 (= (arrayContainsKey!0 lt!297034 (select (arr!18403 a!2986) j!136) j!136) e!367400)))

(declare-fun b!641647 () Bool)

(declare-fun e!367401 () Bool)

(assert (=> b!641647 (= e!367400 e!367401)))

(declare-fun res!415610 () Bool)

(assert (=> b!641647 (=> (not res!415610) (not e!367401))))

(assert (=> b!641647 (= res!415610 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18767 lt!297034)))))

(declare-fun b!641648 () Bool)

(assert (=> b!641648 (= e!367401 (arrayContainsKey!0 lt!297034 (select (arr!18403 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!90629 (not res!415609)) b!641647))

(assert (= (and b!641647 res!415610) b!641648))

(declare-fun m!615481 () Bool)

(assert (=> d!90629 m!615481))

(assert (=> b!641648 m!615349))

(declare-fun m!615483 () Bool)

(assert (=> b!641648 m!615483))

(assert (=> b!641561 d!90629))

(declare-fun d!90631 () Bool)

(declare-fun res!415615 () Bool)

(declare-fun e!367406 () Bool)

(assert (=> d!90631 (=> res!415615 e!367406)))

(get-info :version)

(assert (=> d!90631 (= res!415615 ((_ is Nil!12441) Nil!12441))))

(assert (=> d!90631 (= (noDuplicate!403 Nil!12441) e!367406)))

(declare-fun b!641653 () Bool)

(declare-fun e!367407 () Bool)

(assert (=> b!641653 (= e!367406 e!367407)))

(declare-fun res!415616 () Bool)

(assert (=> b!641653 (=> (not res!415616) (not e!367407))))

(assert (=> b!641653 (= res!415616 (not (contains!3131 (t!18672 Nil!12441) (h!13485 Nil!12441))))))

(declare-fun b!641654 () Bool)

(assert (=> b!641654 (= e!367407 (noDuplicate!403 (t!18672 Nil!12441)))))

(assert (= (and d!90631 (not res!415615)) b!641653))

(assert (= (and b!641653 res!415616) b!641654))

(declare-fun m!615485 () Bool)

(assert (=> b!641653 m!615485))

(declare-fun m!615487 () Bool)

(assert (=> b!641654 m!615487))

(assert (=> b!641542 d!90631))

(declare-fun b!641667 () Bool)

(declare-fun e!367415 () SeekEntryResult!6843)

(assert (=> b!641667 (= e!367415 Undefined!6843)))

(declare-fun b!641668 () Bool)

(declare-fun c!73392 () Bool)

(declare-fun lt!297084 () (_ BitVec 64))

(assert (=> b!641668 (= c!73392 (= lt!297084 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!367416 () SeekEntryResult!6843)

(declare-fun e!367414 () SeekEntryResult!6843)

(assert (=> b!641668 (= e!367416 e!367414)))

(declare-fun b!641669 () Bool)

(assert (=> b!641669 (= e!367416 (Found!6843 index!984))))

(declare-fun d!90633 () Bool)

(declare-fun lt!297085 () SeekEntryResult!6843)

(assert (=> d!90633 (and (or ((_ is Undefined!6843) lt!297085) (not ((_ is Found!6843) lt!297085)) (and (bvsge (index!29696 lt!297085) #b00000000000000000000000000000000) (bvslt (index!29696 lt!297085) (size!18767 a!2986)))) (or ((_ is Undefined!6843) lt!297085) ((_ is Found!6843) lt!297085) (not ((_ is MissingVacant!6843) lt!297085)) (not (= (index!29698 lt!297085) vacantSpotIndex!68)) (and (bvsge (index!29698 lt!297085) #b00000000000000000000000000000000) (bvslt (index!29698 lt!297085) (size!18767 a!2986)))) (or ((_ is Undefined!6843) lt!297085) (ite ((_ is Found!6843) lt!297085) (= (select (arr!18403 a!2986) (index!29696 lt!297085)) (select (arr!18403 a!2986) j!136)) (and ((_ is MissingVacant!6843) lt!297085) (= (index!29698 lt!297085) vacantSpotIndex!68) (= (select (arr!18403 a!2986) (index!29698 lt!297085)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!90633 (= lt!297085 e!367415)))

(declare-fun c!73394 () Bool)

(assert (=> d!90633 (= c!73394 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!90633 (= lt!297084 (select (arr!18403 a!2986) index!984))))

(assert (=> d!90633 (validMask!0 mask!3053)))

(assert (=> d!90633 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18403 a!2986) j!136) a!2986 mask!3053) lt!297085)))

(declare-fun b!641670 () Bool)

(assert (=> b!641670 (= e!367415 e!367416)))

(declare-fun c!73393 () Bool)

(assert (=> b!641670 (= c!73393 (= lt!297084 (select (arr!18403 a!2986) j!136)))))

(declare-fun b!641671 () Bool)

(assert (=> b!641671 (= e!367414 (MissingVacant!6843 vacantSpotIndex!68))))

(declare-fun b!641672 () Bool)

(assert (=> b!641672 (= e!367414 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18403 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and d!90633 c!73394) b!641667))

(assert (= (and d!90633 (not c!73394)) b!641670))

(assert (= (and b!641670 c!73393) b!641669))

(assert (= (and b!641670 (not c!73393)) b!641668))

(assert (= (and b!641668 c!73392) b!641671))

(assert (= (and b!641668 (not c!73392)) b!641672))

(declare-fun m!615489 () Bool)

(assert (=> d!90633 m!615489))

(declare-fun m!615491 () Bool)

(assert (=> d!90633 m!615491))

(assert (=> d!90633 m!615357))

(assert (=> d!90633 m!615401))

(assert (=> b!641672 m!615389))

(assert (=> b!641672 m!615389))

(assert (=> b!641672 m!615349))

(declare-fun m!615493 () Bool)

(assert (=> b!641672 m!615493))

(assert (=> b!641552 d!90633))

(declare-fun d!90635 () Bool)

(declare-fun lt!297088 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!246 (List!12444) (InoxSet (_ BitVec 64)))

(assert (=> d!90635 (= lt!297088 (select (content!246 Nil!12441) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!367422 () Bool)

(assert (=> d!90635 (= lt!297088 e!367422)))

(declare-fun res!415621 () Bool)

(assert (=> d!90635 (=> (not res!415621) (not e!367422))))

(assert (=> d!90635 (= res!415621 ((_ is Cons!12440) Nil!12441))))

(assert (=> d!90635 (= (contains!3131 Nil!12441 #b0000000000000000000000000000000000000000000000000000000000000000) lt!297088)))

(declare-fun b!641677 () Bool)

(declare-fun e!367421 () Bool)

(assert (=> b!641677 (= e!367422 e!367421)))

(declare-fun res!415622 () Bool)

(assert (=> b!641677 (=> res!415622 e!367421)))

(assert (=> b!641677 (= res!415622 (= (h!13485 Nil!12441) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!641678 () Bool)

(assert (=> b!641678 (= e!367421 (contains!3131 (t!18672 Nil!12441) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!90635 res!415621) b!641677))

(assert (= (and b!641677 (not res!415622)) b!641678))

(declare-fun m!615495 () Bool)

(assert (=> d!90635 m!615495))

(declare-fun m!615497 () Bool)

(assert (=> d!90635 m!615497))

(declare-fun m!615499 () Bool)

(assert (=> b!641678 m!615499))

(assert (=> b!641543 d!90635))

(declare-fun d!90637 () Bool)

(assert (=> d!90637 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!58024 d!90637))

(declare-fun d!90639 () Bool)

(assert (=> d!90639 (= (array_inv!14199 a!2986) (bvsge (size!18767 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!58024 d!90639))

(declare-fun b!641691 () Bool)

(declare-fun e!367430 () SeekEntryResult!6843)

(assert (=> b!641691 (= e!367430 Undefined!6843)))

(declare-fun b!641692 () Bool)

(declare-fun e!367429 () SeekEntryResult!6843)

(declare-fun lt!297097 () SeekEntryResult!6843)

(assert (=> b!641692 (= e!367429 (Found!6843 (index!29697 lt!297097)))))

(declare-fun b!641693 () Bool)

(declare-fun c!73403 () Bool)

(declare-fun lt!297095 () (_ BitVec 64))

(assert (=> b!641693 (= c!73403 (= lt!297095 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!367431 () SeekEntryResult!6843)

(assert (=> b!641693 (= e!367429 e!367431)))

(declare-fun d!90641 () Bool)

(declare-fun lt!297096 () SeekEntryResult!6843)

(assert (=> d!90641 (and (or ((_ is Undefined!6843) lt!297096) (not ((_ is Found!6843) lt!297096)) (and (bvsge (index!29696 lt!297096) #b00000000000000000000000000000000) (bvslt (index!29696 lt!297096) (size!18767 a!2986)))) (or ((_ is Undefined!6843) lt!297096) ((_ is Found!6843) lt!297096) (not ((_ is MissingZero!6843) lt!297096)) (and (bvsge (index!29695 lt!297096) #b00000000000000000000000000000000) (bvslt (index!29695 lt!297096) (size!18767 a!2986)))) (or ((_ is Undefined!6843) lt!297096) ((_ is Found!6843) lt!297096) ((_ is MissingZero!6843) lt!297096) (not ((_ is MissingVacant!6843) lt!297096)) (and (bvsge (index!29698 lt!297096) #b00000000000000000000000000000000) (bvslt (index!29698 lt!297096) (size!18767 a!2986)))) (or ((_ is Undefined!6843) lt!297096) (ite ((_ is Found!6843) lt!297096) (= (select (arr!18403 a!2986) (index!29696 lt!297096)) k0!1786) (ite ((_ is MissingZero!6843) lt!297096) (= (select (arr!18403 a!2986) (index!29695 lt!297096)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6843) lt!297096) (= (select (arr!18403 a!2986) (index!29698 lt!297096)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!90641 (= lt!297096 e!367430)))

(declare-fun c!73401 () Bool)

(assert (=> d!90641 (= c!73401 (and ((_ is Intermediate!6843) lt!297097) (undefined!7655 lt!297097)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38370 (_ BitVec 32)) SeekEntryResult!6843)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!90641 (= lt!297097 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!90641 (validMask!0 mask!3053)))

(assert (=> d!90641 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!297096)))

(declare-fun b!641694 () Bool)

(assert (=> b!641694 (= e!367431 (seekKeyOrZeroReturnVacant!0 (x!58456 lt!297097) (index!29697 lt!297097) (index!29697 lt!297097) k0!1786 a!2986 mask!3053))))

(declare-fun b!641695 () Bool)

(assert (=> b!641695 (= e!367430 e!367429)))

(assert (=> b!641695 (= lt!297095 (select (arr!18403 a!2986) (index!29697 lt!297097)))))

(declare-fun c!73402 () Bool)

(assert (=> b!641695 (= c!73402 (= lt!297095 k0!1786))))

(declare-fun b!641696 () Bool)

(assert (=> b!641696 (= e!367431 (MissingZero!6843 (index!29697 lt!297097)))))

(assert (= (and d!90641 c!73401) b!641691))

(assert (= (and d!90641 (not c!73401)) b!641695))

(assert (= (and b!641695 c!73402) b!641692))

(assert (= (and b!641695 (not c!73402)) b!641693))

(assert (= (and b!641693 c!73403) b!641696))

(assert (= (and b!641693 (not c!73403)) b!641694))

(declare-fun m!615501 () Bool)

(assert (=> d!90641 m!615501))

(declare-fun m!615503 () Bool)

(assert (=> d!90641 m!615503))

(declare-fun m!615505 () Bool)

(assert (=> d!90641 m!615505))

(declare-fun m!615507 () Bool)

(assert (=> d!90641 m!615507))

(declare-fun m!615509 () Bool)

(assert (=> d!90641 m!615509))

(assert (=> d!90641 m!615401))

(assert (=> d!90641 m!615503))

(declare-fun m!615511 () Bool)

(assert (=> b!641694 m!615511))

(declare-fun m!615513 () Bool)

(assert (=> b!641695 m!615513))

(assert (=> b!641553 d!90641))

(declare-fun bm!33542 () Bool)

(declare-fun call!33545 () Bool)

(assert (=> bm!33542 (= call!33545 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!641738 () Bool)

(declare-fun e!367461 () Bool)

(declare-fun e!367460 () Bool)

(assert (=> b!641738 (= e!367461 e!367460)))

(declare-fun c!73418 () Bool)

(assert (=> b!641738 (= c!73418 (validKeyInArray!0 (select (arr!18403 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!641739 () Bool)

(declare-fun e!367459 () Bool)

(assert (=> b!641739 (= e!367460 e!367459)))

(declare-fun lt!297114 () (_ BitVec 64))

(assert (=> b!641739 (= lt!297114 (select (arr!18403 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!297115 () Unit!21706)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38370 (_ BitVec 64) (_ BitVec 32)) Unit!21706)

(assert (=> b!641739 (= lt!297115 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!297114 #b00000000000000000000000000000000))))

(assert (=> b!641739 (arrayContainsKey!0 a!2986 lt!297114 #b00000000000000000000000000000000)))

(declare-fun lt!297113 () Unit!21706)

(assert (=> b!641739 (= lt!297113 lt!297115)))

(declare-fun res!415637 () Bool)

(assert (=> b!641739 (= res!415637 (= (seekEntryOrOpen!0 (select (arr!18403 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6843 #b00000000000000000000000000000000)))))

(assert (=> b!641739 (=> (not res!415637) (not e!367459))))

(declare-fun b!641740 () Bool)

(assert (=> b!641740 (= e!367459 call!33545)))

(declare-fun d!90647 () Bool)

(declare-fun res!415636 () Bool)

(assert (=> d!90647 (=> res!415636 e!367461)))

(assert (=> d!90647 (= res!415636 (bvsge #b00000000000000000000000000000000 (size!18767 a!2986)))))

(assert (=> d!90647 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!367461)))

(declare-fun b!641741 () Bool)

(assert (=> b!641741 (= e!367460 call!33545)))

(assert (= (and d!90647 (not res!415636)) b!641738))

(assert (= (and b!641738 c!73418) b!641739))

(assert (= (and b!641738 (not c!73418)) b!641741))

(assert (= (and b!641739 res!415637) b!641740))

(assert (= (or b!641740 b!641741) bm!33542))

(declare-fun m!615537 () Bool)

(assert (=> bm!33542 m!615537))

(assert (=> b!641738 m!615473))

(assert (=> b!641738 m!615473))

(assert (=> b!641738 m!615475))

(assert (=> b!641739 m!615473))

(declare-fun m!615539 () Bool)

(assert (=> b!641739 m!615539))

(declare-fun m!615541 () Bool)

(assert (=> b!641739 m!615541))

(assert (=> b!641739 m!615473))

(declare-fun m!615543 () Bool)

(assert (=> b!641739 m!615543))

(assert (=> b!641544 d!90647))

(declare-fun b!641744 () Bool)

(declare-fun e!367467 () SeekEntryResult!6843)

(assert (=> b!641744 (= e!367467 Undefined!6843)))

(declare-fun b!641745 () Bool)

(declare-fun c!73419 () Bool)

(declare-fun lt!297116 () (_ BitVec 64))

(assert (=> b!641745 (= c!73419 (= lt!297116 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!367468 () SeekEntryResult!6843)

(declare-fun e!367466 () SeekEntryResult!6843)

(assert (=> b!641745 (= e!367468 e!367466)))

(declare-fun b!641746 () Bool)

(assert (=> b!641746 (= e!367468 (Found!6843 lt!297028))))

(declare-fun lt!297117 () SeekEntryResult!6843)

(declare-fun d!90653 () Bool)

(assert (=> d!90653 (and (or ((_ is Undefined!6843) lt!297117) (not ((_ is Found!6843) lt!297117)) (and (bvsge (index!29696 lt!297117) #b00000000000000000000000000000000) (bvslt (index!29696 lt!297117) (size!18767 lt!297034)))) (or ((_ is Undefined!6843) lt!297117) ((_ is Found!6843) lt!297117) (not ((_ is MissingVacant!6843) lt!297117)) (not (= (index!29698 lt!297117) vacantSpotIndex!68)) (and (bvsge (index!29698 lt!297117) #b00000000000000000000000000000000) (bvslt (index!29698 lt!297117) (size!18767 lt!297034)))) (or ((_ is Undefined!6843) lt!297117) (ite ((_ is Found!6843) lt!297117) (= (select (arr!18403 lt!297034) (index!29696 lt!297117)) lt!297030) (and ((_ is MissingVacant!6843) lt!297117) (= (index!29698 lt!297117) vacantSpotIndex!68) (= (select (arr!18403 lt!297034) (index!29698 lt!297117)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!90653 (= lt!297117 e!367467)))

(declare-fun c!73421 () Bool)

(assert (=> d!90653 (= c!73421 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!90653 (= lt!297116 (select (arr!18403 lt!297034) lt!297028))))

(assert (=> d!90653 (validMask!0 mask!3053)))

(assert (=> d!90653 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297028 vacantSpotIndex!68 lt!297030 lt!297034 mask!3053) lt!297117)))

(declare-fun b!641747 () Bool)

(assert (=> b!641747 (= e!367467 e!367468)))

(declare-fun c!73420 () Bool)

(assert (=> b!641747 (= c!73420 (= lt!297116 lt!297030))))

(declare-fun b!641748 () Bool)

(assert (=> b!641748 (= e!367466 (MissingVacant!6843 vacantSpotIndex!68))))

(declare-fun b!641749 () Bool)

(assert (=> b!641749 (= e!367466 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!297028 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!297030 lt!297034 mask!3053))))

(assert (= (and d!90653 c!73421) b!641744))

(assert (= (and d!90653 (not c!73421)) b!641747))

(assert (= (and b!641747 c!73420) b!641746))

(assert (= (and b!641747 (not c!73420)) b!641745))

(assert (= (and b!641745 c!73419) b!641748))

(assert (= (and b!641745 (not c!73419)) b!641749))

(declare-fun m!615545 () Bool)

(assert (=> d!90653 m!615545))

(declare-fun m!615547 () Bool)

(assert (=> d!90653 m!615547))

(declare-fun m!615549 () Bool)

(assert (=> d!90653 m!615549))

(assert (=> d!90653 m!615401))

(declare-fun m!615551 () Bool)

(assert (=> b!641749 m!615551))

(assert (=> b!641749 m!615551))

(declare-fun m!615553 () Bool)

(assert (=> b!641749 m!615553))

(assert (=> b!641546 d!90653))

(declare-fun b!641756 () Bool)

(declare-fun e!367474 () SeekEntryResult!6843)

(assert (=> b!641756 (= e!367474 Undefined!6843)))

(declare-fun b!641757 () Bool)

(declare-fun c!73422 () Bool)

(declare-fun lt!297118 () (_ BitVec 64))

(assert (=> b!641757 (= c!73422 (= lt!297118 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!367475 () SeekEntryResult!6843)

(declare-fun e!367473 () SeekEntryResult!6843)

(assert (=> b!641757 (= e!367475 e!367473)))

(declare-fun b!641758 () Bool)

(assert (=> b!641758 (= e!367475 (Found!6843 lt!297028))))

(declare-fun lt!297119 () SeekEntryResult!6843)

(declare-fun d!90655 () Bool)

(assert (=> d!90655 (and (or ((_ is Undefined!6843) lt!297119) (not ((_ is Found!6843) lt!297119)) (and (bvsge (index!29696 lt!297119) #b00000000000000000000000000000000) (bvslt (index!29696 lt!297119) (size!18767 a!2986)))) (or ((_ is Undefined!6843) lt!297119) ((_ is Found!6843) lt!297119) (not ((_ is MissingVacant!6843) lt!297119)) (not (= (index!29698 lt!297119) vacantSpotIndex!68)) (and (bvsge (index!29698 lt!297119) #b00000000000000000000000000000000) (bvslt (index!29698 lt!297119) (size!18767 a!2986)))) (or ((_ is Undefined!6843) lt!297119) (ite ((_ is Found!6843) lt!297119) (= (select (arr!18403 a!2986) (index!29696 lt!297119)) (select (arr!18403 a!2986) j!136)) (and ((_ is MissingVacant!6843) lt!297119) (= (index!29698 lt!297119) vacantSpotIndex!68) (= (select (arr!18403 a!2986) (index!29698 lt!297119)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!90655 (= lt!297119 e!367474)))

(declare-fun c!73424 () Bool)

(assert (=> d!90655 (= c!73424 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!90655 (= lt!297118 (select (arr!18403 a!2986) lt!297028))))

(assert (=> d!90655 (validMask!0 mask!3053)))

(assert (=> d!90655 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297028 vacantSpotIndex!68 (select (arr!18403 a!2986) j!136) a!2986 mask!3053) lt!297119)))

(declare-fun b!641759 () Bool)

(assert (=> b!641759 (= e!367474 e!367475)))

(declare-fun c!73423 () Bool)

(assert (=> b!641759 (= c!73423 (= lt!297118 (select (arr!18403 a!2986) j!136)))))

(declare-fun b!641760 () Bool)

(assert (=> b!641760 (= e!367473 (MissingVacant!6843 vacantSpotIndex!68))))

(declare-fun b!641761 () Bool)

(assert (=> b!641761 (= e!367473 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!297028 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!18403 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and d!90655 c!73424) b!641756))

(assert (= (and d!90655 (not c!73424)) b!641759))

(assert (= (and b!641759 c!73423) b!641758))

(assert (= (and b!641759 (not c!73423)) b!641757))

(assert (= (and b!641757 c!73422) b!641760))

(assert (= (and b!641757 (not c!73422)) b!641761))

(declare-fun m!615559 () Bool)

(assert (=> d!90655 m!615559))

(declare-fun m!615561 () Bool)

(assert (=> d!90655 m!615561))

(declare-fun m!615563 () Bool)

(assert (=> d!90655 m!615563))

(assert (=> d!90655 m!615401))

(assert (=> b!641761 m!615551))

(assert (=> b!641761 m!615551))

(assert (=> b!641761 m!615349))

(declare-fun m!615565 () Bool)

(assert (=> b!641761 m!615565))

(assert (=> b!641546 d!90655))

(declare-fun d!90659 () Bool)

(declare-fun lt!297122 () (_ BitVec 32))

(assert (=> d!90659 (and (bvsge lt!297122 #b00000000000000000000000000000000) (bvslt lt!297122 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!90659 (= lt!297122 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!90659 (validMask!0 mask!3053)))

(assert (=> d!90659 (= (nextIndex!0 index!984 x!910 mask!3053) lt!297122)))

(declare-fun bs!19207 () Bool)

(assert (= bs!19207 d!90659))

(declare-fun m!615575 () Bool)

(assert (=> bs!19207 m!615575))

(assert (=> bs!19207 m!615401))

(assert (=> b!641546 d!90659))

(declare-fun b!641772 () Bool)

(declare-fun e!367487 () SeekEntryResult!6843)

(assert (=> b!641772 (= e!367487 Undefined!6843)))

(declare-fun b!641773 () Bool)

(declare-fun c!73425 () Bool)

(declare-fun lt!297123 () (_ BitVec 64))

(assert (=> b!641773 (= c!73425 (= lt!297123 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!367488 () SeekEntryResult!6843)

(declare-fun e!367486 () SeekEntryResult!6843)

(assert (=> b!641773 (= e!367488 e!367486)))

(declare-fun b!641774 () Bool)

(assert (=> b!641774 (= e!367488 (Found!6843 index!984))))

(declare-fun d!90665 () Bool)

(declare-fun lt!297124 () SeekEntryResult!6843)

(assert (=> d!90665 (and (or ((_ is Undefined!6843) lt!297124) (not ((_ is Found!6843) lt!297124)) (and (bvsge (index!29696 lt!297124) #b00000000000000000000000000000000) (bvslt (index!29696 lt!297124) (size!18767 lt!297034)))) (or ((_ is Undefined!6843) lt!297124) ((_ is Found!6843) lt!297124) (not ((_ is MissingVacant!6843) lt!297124)) (not (= (index!29698 lt!297124) vacantSpotIndex!68)) (and (bvsge (index!29698 lt!297124) #b00000000000000000000000000000000) (bvslt (index!29698 lt!297124) (size!18767 lt!297034)))) (or ((_ is Undefined!6843) lt!297124) (ite ((_ is Found!6843) lt!297124) (= (select (arr!18403 lt!297034) (index!29696 lt!297124)) lt!297030) (and ((_ is MissingVacant!6843) lt!297124) (= (index!29698 lt!297124) vacantSpotIndex!68) (= (select (arr!18403 lt!297034) (index!29698 lt!297124)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!90665 (= lt!297124 e!367487)))

(declare-fun c!73427 () Bool)

(assert (=> d!90665 (= c!73427 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!90665 (= lt!297123 (select (arr!18403 lt!297034) index!984))))

(assert (=> d!90665 (validMask!0 mask!3053)))

(assert (=> d!90665 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!297030 lt!297034 mask!3053) lt!297124)))

(declare-fun b!641775 () Bool)

(assert (=> b!641775 (= e!367487 e!367488)))

(declare-fun c!73426 () Bool)

(assert (=> b!641775 (= c!73426 (= lt!297123 lt!297030))))

(declare-fun b!641776 () Bool)

(assert (=> b!641776 (= e!367486 (MissingVacant!6843 vacantSpotIndex!68))))

(declare-fun b!641777 () Bool)

(assert (=> b!641777 (= e!367486 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!297030 lt!297034 mask!3053))))

(assert (= (and d!90665 c!73427) b!641772))

(assert (= (and d!90665 (not c!73427)) b!641775))

(assert (= (and b!641775 c!73426) b!641774))

(assert (= (and b!641775 (not c!73426)) b!641773))

(assert (= (and b!641773 c!73425) b!641776))

(assert (= (and b!641773 (not c!73425)) b!641777))

(declare-fun m!615577 () Bool)

(assert (=> d!90665 m!615577))

(declare-fun m!615579 () Bool)

(assert (=> d!90665 m!615579))

(declare-fun m!615581 () Bool)

(assert (=> d!90665 m!615581))

(assert (=> d!90665 m!615401))

(assert (=> b!641777 m!615389))

(assert (=> b!641777 m!615389))

(declare-fun m!615583 () Bool)

(assert (=> b!641777 m!615583))

(assert (=> b!641546 d!90665))

(declare-fun d!90667 () Bool)

(declare-fun e!367497 () Bool)

(assert (=> d!90667 e!367497))

(declare-fun res!415658 () Bool)

(assert (=> d!90667 (=> (not res!415658) (not e!367497))))

(assert (=> d!90667 (= res!415658 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18767 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18767 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18767 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18767 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18767 a!2986))))))

(declare-fun lt!297131 () Unit!21706)

(declare-fun choose!9 (array!38370 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21706)

(assert (=> d!90667 (= lt!297131 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!297028 vacantSpotIndex!68 mask!3053))))

(assert (=> d!90667 (validMask!0 mask!3053)))

(assert (=> d!90667 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!297028 vacantSpotIndex!68 mask!3053) lt!297131)))

(declare-fun b!641792 () Bool)

(assert (=> b!641792 (= e!367497 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297028 vacantSpotIndex!68 (select (arr!18403 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297028 vacantSpotIndex!68 (select (store (arr!18403 a!2986) i!1108 k0!1786) j!136) (array!38371 (store (arr!18403 a!2986) i!1108 k0!1786) (size!18767 a!2986)) mask!3053)))))

(assert (= (and d!90667 res!415658) b!641792))

(declare-fun m!615585 () Bool)

(assert (=> d!90667 m!615585))

(assert (=> d!90667 m!615401))

(assert (=> b!641792 m!615353))

(assert (=> b!641792 m!615349))

(assert (=> b!641792 m!615399))

(assert (=> b!641792 m!615349))

(assert (=> b!641792 m!615391))

(declare-fun m!615587 () Bool)

(assert (=> b!641792 m!615587))

(assert (=> b!641792 m!615391))

(assert (=> b!641546 d!90667))

(declare-fun d!90669 () Bool)

(declare-fun res!415659 () Bool)

(declare-fun e!367503 () Bool)

(assert (=> d!90669 (=> res!415659 e!367503)))

(assert (=> d!90669 (= res!415659 (bvsge j!136 (size!18767 lt!297034)))))

(assert (=> d!90669 (= (arrayNoDuplicates!0 lt!297034 j!136 Nil!12441) e!367503)))

(declare-fun b!641803 () Bool)

(declare-fun e!367504 () Bool)

(declare-fun call!33546 () Bool)

(assert (=> b!641803 (= e!367504 call!33546)))

(declare-fun b!641804 () Bool)

(declare-fun e!367505 () Bool)

(assert (=> b!641804 (= e!367503 e!367505)))

(declare-fun res!415661 () Bool)

(assert (=> b!641804 (=> (not res!415661) (not e!367505))))

(declare-fun e!367506 () Bool)

(assert (=> b!641804 (= res!415661 (not e!367506))))

(declare-fun res!415660 () Bool)

(assert (=> b!641804 (=> (not res!415660) (not e!367506))))

(assert (=> b!641804 (= res!415660 (validKeyInArray!0 (select (arr!18403 lt!297034) j!136)))))

(declare-fun b!641805 () Bool)

(assert (=> b!641805 (= e!367504 call!33546)))

(declare-fun b!641806 () Bool)

(assert (=> b!641806 (= e!367506 (contains!3131 Nil!12441 (select (arr!18403 lt!297034) j!136)))))

(declare-fun b!641807 () Bool)

(assert (=> b!641807 (= e!367505 e!367504)))

(declare-fun c!73439 () Bool)

(assert (=> b!641807 (= c!73439 (validKeyInArray!0 (select (arr!18403 lt!297034) j!136)))))

(declare-fun bm!33543 () Bool)

(assert (=> bm!33543 (= call!33546 (arrayNoDuplicates!0 lt!297034 (bvadd j!136 #b00000000000000000000000000000001) (ite c!73439 (Cons!12440 (select (arr!18403 lt!297034) j!136) Nil!12441) Nil!12441)))))

(assert (= (and d!90669 (not res!415659)) b!641804))

(assert (= (and b!641804 res!415660) b!641806))

(assert (= (and b!641804 res!415661) b!641807))

(assert (= (and b!641807 c!73439) b!641805))

(assert (= (and b!641807 (not c!73439)) b!641803))

(assert (= (or b!641805 b!641803) bm!33543))

(assert (=> b!641804 m!615481))

(assert (=> b!641804 m!615481))

(declare-fun m!615593 () Bool)

(assert (=> b!641804 m!615593))

(assert (=> b!641806 m!615481))

(assert (=> b!641806 m!615481))

(declare-fun m!615596 () Bool)

(assert (=> b!641806 m!615596))

(assert (=> b!641807 m!615481))

(assert (=> b!641807 m!615481))

(assert (=> b!641807 m!615593))

(assert (=> bm!33543 m!615481))

(declare-fun m!615599 () Bool)

(assert (=> bm!33543 m!615599))

(assert (=> b!641556 d!90669))

(declare-fun d!90673 () Bool)

(declare-fun res!415664 () Bool)

(declare-fun e!367513 () Bool)

(assert (=> d!90673 (=> res!415664 e!367513)))

(assert (=> d!90673 (= res!415664 (= (select (arr!18403 lt!297034) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18403 a!2986) j!136)))))

(assert (=> d!90673 (= (arrayContainsKey!0 lt!297034 (select (arr!18403 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!367513)))

(declare-fun b!641818 () Bool)

(declare-fun e!367514 () Bool)

(assert (=> b!641818 (= e!367513 e!367514)))

(declare-fun res!415665 () Bool)

(assert (=> b!641818 (=> (not res!415665) (not e!367514))))

(assert (=> b!641818 (= res!415665 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18767 lt!297034)))))

(declare-fun b!641819 () Bool)

(assert (=> b!641819 (= e!367514 (arrayContainsKey!0 lt!297034 (select (arr!18403 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!90673 (not res!415664)) b!641818))

(assert (= (and b!641818 res!415665) b!641819))

(declare-fun m!615605 () Bool)

(assert (=> d!90673 m!615605))

(assert (=> b!641819 m!615349))

(declare-fun m!615607 () Bool)

(assert (=> b!641819 m!615607))

(assert (=> b!641556 d!90673))

(declare-fun d!90677 () Bool)

(declare-fun res!415666 () Bool)

(declare-fun e!367515 () Bool)

(assert (=> d!90677 (=> res!415666 e!367515)))

(assert (=> d!90677 (= res!415666 (bvsge #b00000000000000000000000000000000 (size!18767 lt!297034)))))

(assert (=> d!90677 (= (arrayNoDuplicates!0 lt!297034 #b00000000000000000000000000000000 Nil!12441) e!367515)))

(declare-fun b!641820 () Bool)

(declare-fun e!367516 () Bool)

(declare-fun call!33547 () Bool)

(assert (=> b!641820 (= e!367516 call!33547)))

(declare-fun b!641821 () Bool)

(declare-fun e!367517 () Bool)

(assert (=> b!641821 (= e!367515 e!367517)))

(declare-fun res!415668 () Bool)

(assert (=> b!641821 (=> (not res!415668) (not e!367517))))

(declare-fun e!367518 () Bool)

(assert (=> b!641821 (= res!415668 (not e!367518))))

(declare-fun res!415667 () Bool)

(assert (=> b!641821 (=> (not res!415667) (not e!367518))))

(assert (=> b!641821 (= res!415667 (validKeyInArray!0 (select (arr!18403 lt!297034) #b00000000000000000000000000000000)))))

(declare-fun b!641822 () Bool)

(assert (=> b!641822 (= e!367516 call!33547)))

(declare-fun b!641823 () Bool)

(assert (=> b!641823 (= e!367518 (contains!3131 Nil!12441 (select (arr!18403 lt!297034) #b00000000000000000000000000000000)))))

(declare-fun b!641824 () Bool)

(assert (=> b!641824 (= e!367517 e!367516)))

(declare-fun c!73444 () Bool)

(assert (=> b!641824 (= c!73444 (validKeyInArray!0 (select (arr!18403 lt!297034) #b00000000000000000000000000000000)))))

(declare-fun bm!33544 () Bool)

(assert (=> bm!33544 (= call!33547 (arrayNoDuplicates!0 lt!297034 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!73444 (Cons!12440 (select (arr!18403 lt!297034) #b00000000000000000000000000000000) Nil!12441) Nil!12441)))))

(assert (= (and d!90677 (not res!415666)) b!641821))

(assert (= (and b!641821 res!415667) b!641823))

(assert (= (and b!641821 res!415668) b!641824))

(assert (= (and b!641824 c!73444) b!641822))

(assert (= (and b!641824 (not c!73444)) b!641820))

(assert (= (or b!641822 b!641820) bm!33544))

(declare-fun m!615609 () Bool)

(assert (=> b!641821 m!615609))

(assert (=> b!641821 m!615609))

(declare-fun m!615611 () Bool)

(assert (=> b!641821 m!615611))

(assert (=> b!641823 m!615609))

(assert (=> b!641823 m!615609))

(declare-fun m!615613 () Bool)

(assert (=> b!641823 m!615613))

(assert (=> b!641824 m!615609))

(assert (=> b!641824 m!615609))

(assert (=> b!641824 m!615611))

(assert (=> bm!33544 m!615609))

(declare-fun m!615615 () Bool)

(assert (=> bm!33544 m!615615))

(assert (=> b!641556 d!90677))

(declare-fun d!90679 () Bool)

(declare-fun e!367532 () Bool)

(assert (=> d!90679 e!367532))

(declare-fun res!415679 () Bool)

(assert (=> d!90679 (=> (not res!415679) (not e!367532))))

(assert (=> d!90679 (= res!415679 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18767 a!2986))))))

(declare-fun lt!297148 () Unit!21706)

(declare-fun choose!41 (array!38370 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12444) Unit!21706)

(assert (=> d!90679 (= lt!297148 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12441))))

(assert (=> d!90679 (bvslt (size!18767 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!90679 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12441) lt!297148)))

(declare-fun b!641841 () Bool)

(assert (=> b!641841 (= e!367532 (arrayNoDuplicates!0 (array!38371 (store (arr!18403 a!2986) i!1108 k0!1786) (size!18767 a!2986)) #b00000000000000000000000000000000 Nil!12441))))

(assert (= (and d!90679 res!415679) b!641841))

(declare-fun m!615641 () Bool)

(assert (=> d!90679 m!615641))

(assert (=> b!641841 m!615353))

(declare-fun m!615643 () Bool)

(assert (=> b!641841 m!615643))

(assert (=> b!641556 d!90679))

(declare-fun d!90695 () Bool)

(assert (=> d!90695 (arrayContainsKey!0 lt!297034 (select (arr!18403 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!297153 () Unit!21706)

(declare-fun choose!114 (array!38370 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21706)

(assert (=> d!90695 (= lt!297153 (choose!114 lt!297034 (select (arr!18403 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!90695 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!90695 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!297034 (select (arr!18403 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!297153)))

(declare-fun bs!19208 () Bool)

(assert (= bs!19208 d!90695))

(assert (=> bs!19208 m!615349))

(assert (=> bs!19208 m!615373))

(assert (=> bs!19208 m!615349))

(declare-fun m!615645 () Bool)

(assert (=> bs!19208 m!615645))

(assert (=> b!641556 d!90695))

(declare-fun d!90697 () Bool)

(assert (=> d!90697 (arrayNoDuplicates!0 lt!297034 j!136 Nil!12441)))

(declare-fun lt!297157 () Unit!21706)

(declare-fun choose!39 (array!38370 (_ BitVec 32) (_ BitVec 32)) Unit!21706)

(assert (=> d!90697 (= lt!297157 (choose!39 lt!297034 #b00000000000000000000000000000000 j!136))))

(assert (=> d!90697 (bvslt (size!18767 lt!297034) #b01111111111111111111111111111111)))

(assert (=> d!90697 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!297034 #b00000000000000000000000000000000 j!136) lt!297157)))

(declare-fun bs!19209 () Bool)

(assert (= bs!19209 d!90697))

(assert (=> bs!19209 m!615377))

(declare-fun m!615653 () Bool)

(assert (=> bs!19209 m!615653))

(assert (=> b!641556 d!90697))

(declare-fun d!90701 () Bool)

(declare-fun lt!297158 () Bool)

(assert (=> d!90701 (= lt!297158 (select (content!246 Nil!12441) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!367540 () Bool)

(assert (=> d!90701 (= lt!297158 e!367540)))

(declare-fun res!415686 () Bool)

(assert (=> d!90701 (=> (not res!415686) (not e!367540))))

(assert (=> d!90701 (= res!415686 ((_ is Cons!12440) Nil!12441))))

(assert (=> d!90701 (= (contains!3131 Nil!12441 #b1000000000000000000000000000000000000000000000000000000000000000) lt!297158)))

(declare-fun b!641848 () Bool)

(declare-fun e!367539 () Bool)

(assert (=> b!641848 (= e!367540 e!367539)))

(declare-fun res!415687 () Bool)

(assert (=> b!641848 (=> res!415687 e!367539)))

(assert (=> b!641848 (= res!415687 (= (h!13485 Nil!12441) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!641849 () Bool)

(assert (=> b!641849 (= e!367539 (contains!3131 (t!18672 Nil!12441) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!90701 res!415686) b!641848))

(assert (= (and b!641848 (not res!415687)) b!641849))

(assert (=> d!90701 m!615495))

(declare-fun m!615655 () Bool)

(assert (=> d!90701 m!615655))

(declare-fun m!615657 () Bool)

(assert (=> b!641849 m!615657))

(assert (=> b!641558 d!90701))

(declare-fun d!90703 () Bool)

(assert (=> d!90703 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!641557 d!90703))

(declare-fun d!90705 () Bool)

(declare-fun res!415688 () Bool)

(declare-fun e!367541 () Bool)

(assert (=> d!90705 (=> res!415688 e!367541)))

(assert (=> d!90705 (= res!415688 (= (select (arr!18403 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!90705 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!367541)))

(declare-fun b!641850 () Bool)

(declare-fun e!367542 () Bool)

(assert (=> b!641850 (= e!367541 e!367542)))

(declare-fun res!415689 () Bool)

(assert (=> b!641850 (=> (not res!415689) (not e!367542))))

(assert (=> b!641850 (= res!415689 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18767 a!2986)))))

(declare-fun b!641851 () Bool)

(assert (=> b!641851 (= e!367542 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!90705 (not res!415688)) b!641850))

(assert (= (and b!641850 res!415689) b!641851))

(assert (=> d!90705 m!615473))

(declare-fun m!615659 () Bool)

(assert (=> b!641851 m!615659))

(assert (=> b!641559 d!90705))

(declare-fun d!90707 () Bool)

(declare-fun res!415690 () Bool)

(declare-fun e!367543 () Bool)

(assert (=> d!90707 (=> res!415690 e!367543)))

(assert (=> d!90707 (= res!415690 (= (select (arr!18403 lt!297034) index!984) (select (arr!18403 a!2986) j!136)))))

(assert (=> d!90707 (= (arrayContainsKey!0 lt!297034 (select (arr!18403 a!2986) j!136) index!984) e!367543)))

(declare-fun b!641852 () Bool)

(declare-fun e!367544 () Bool)

(assert (=> b!641852 (= e!367543 e!367544)))

(declare-fun res!415691 () Bool)

(assert (=> b!641852 (=> (not res!415691) (not e!367544))))

(assert (=> b!641852 (= res!415691 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18767 lt!297034)))))

(declare-fun b!641853 () Bool)

(assert (=> b!641853 (= e!367544 (arrayContainsKey!0 lt!297034 (select (arr!18403 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!90707 (not res!415690)) b!641852))

(assert (= (and b!641852 res!415691) b!641853))

(assert (=> d!90707 m!615581))

(assert (=> b!641853 m!615349))

(declare-fun m!615661 () Bool)

(assert (=> b!641853 m!615661))

(assert (=> b!641548 d!90707))

(check-sat (not b!641739) (not d!90653) (not b!641853) (not d!90659) (not d!90695) (not d!90633) (not bm!33542) (not b!641792) (not d!90701) (not bm!33536) (not d!90679) (not b!641648) (not b!641694) (not d!90697) (not b!641824) (not b!641821) (not bm!33543) (not b!641761) (not b!641642) (not d!90655) (not b!641678) (not b!641807) (not b!641653) (not b!641654) (not b!641738) (not b!641749) (not d!90667) (not b!641672) (not b!641823) (not d!90635) (not b!641804) (not b!641639) (not b!641641) (not b!641777) (not b!641851) (not d!90641) (not b!641849) (not bm!33544) (not b!641806) (not b!641819) (not b!641841) (not d!90665))
(check-sat)
