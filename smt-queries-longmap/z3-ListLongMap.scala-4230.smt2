; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58304 () Bool)

(assert start!58304)

(declare-fun b!643364 () Bool)

(declare-fun e!368530 () Bool)

(declare-fun e!368535 () Bool)

(assert (=> b!643364 (= e!368530 e!368535)))

(declare-fun res!416731 () Bool)

(assert (=> b!643364 (=> (not res!416731) (not e!368535))))

(declare-datatypes ((SeekEntryResult!6856 0))(
  ( (MissingZero!6856 (index!29756 (_ BitVec 32))) (Found!6856 (index!29757 (_ BitVec 32))) (Intermediate!6856 (undefined!7668 Bool) (index!29758 (_ BitVec 32)) (x!58539 (_ BitVec 32))) (Undefined!6856) (MissingVacant!6856 (index!29759 (_ BitVec 32))) )
))
(declare-fun lt!297945 () SeekEntryResult!6856)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!643364 (= res!416731 (or (= lt!297945 (MissingZero!6856 i!1108)) (= lt!297945 (MissingVacant!6856 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-datatypes ((array!38412 0))(
  ( (array!38413 (arr!18419 (Array (_ BitVec 32) (_ BitVec 64))) (size!18784 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38412)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38412 (_ BitVec 32)) SeekEntryResult!6856)

(assert (=> b!643364 (= lt!297945 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!643365 () Bool)

(declare-fun e!368532 () Bool)

(declare-fun e!368529 () Bool)

(assert (=> b!643365 (= e!368532 e!368529)))

(declare-fun res!416733 () Bool)

(assert (=> b!643365 (=> (not res!416733) (not e!368529))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!297940 () array!38412)

(declare-fun arrayContainsKey!0 (array!38412 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!643365 (= res!416733 (arrayContainsKey!0 lt!297940 (select (arr!18419 a!2986) j!136) j!136))))

(declare-fun b!643366 () Bool)

(declare-fun res!416744 () Bool)

(assert (=> b!643366 (=> (not res!416744) (not e!368530))))

(assert (=> b!643366 (= res!416744 (and (= (size!18784 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18784 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18784 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!643367 () Bool)

(declare-fun res!416743 () Bool)

(assert (=> b!643367 (=> (not res!416743) (not e!368535))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38412 (_ BitVec 32)) Bool)

(assert (=> b!643367 (= res!416743 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!643368 () Bool)

(declare-fun res!416740 () Bool)

(assert (=> b!643368 (=> (not res!416740) (not e!368535))))

(declare-datatypes ((List!12499 0))(
  ( (Nil!12496) (Cons!12495 (h!13540 (_ BitVec 64)) (t!18718 List!12499)) )
))
(declare-fun arrayNoDuplicates!0 (array!38412 (_ BitVec 32) List!12499) Bool)

(assert (=> b!643368 (= res!416740 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12496))))

(declare-fun b!643369 () Bool)

(declare-fun e!368531 () Bool)

(assert (=> b!643369 (= e!368531 true)))

(declare-fun e!368539 () Bool)

(assert (=> b!643369 e!368539))

(declare-fun res!416745 () Bool)

(assert (=> b!643369 (=> (not res!416745) (not e!368539))))

(assert (=> b!643369 (= res!416745 (arrayContainsKey!0 lt!297940 (select (arr!18419 a!2986) j!136) j!136))))

(declare-fun b!643370 () Bool)

(declare-fun e!368536 () Bool)

(declare-fun e!368534 () Bool)

(assert (=> b!643370 (= e!368536 e!368534)))

(declare-fun res!416746 () Bool)

(assert (=> b!643370 (=> res!416746 e!368534)))

(declare-fun lt!297947 () (_ BitVec 64))

(declare-fun lt!297942 () (_ BitVec 64))

(assert (=> b!643370 (= res!416746 (or (not (= (select (arr!18419 a!2986) j!136) lt!297942)) (not (= (select (arr!18419 a!2986) j!136) lt!297947))))))

(declare-fun e!368533 () Bool)

(assert (=> b!643370 e!368533))

(declare-fun res!416732 () Bool)

(assert (=> b!643370 (=> (not res!416732) (not e!368533))))

(assert (=> b!643370 (= res!416732 (= lt!297947 (select (arr!18419 a!2986) j!136)))))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!643370 (= lt!297947 (select (store (arr!18419 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!643371 () Bool)

(declare-fun e!368527 () Bool)

(declare-fun e!368526 () Bool)

(assert (=> b!643371 (= e!368527 e!368526)))

(declare-fun res!416728 () Bool)

(assert (=> b!643371 (=> (not res!416728) (not e!368526))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!297937 () SeekEntryResult!6856)

(assert (=> b!643371 (= res!416728 (and (= lt!297937 (Found!6856 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18419 a!2986) index!984) (select (arr!18419 a!2986) j!136))) (not (= (select (arr!18419 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38412 (_ BitVec 32)) SeekEntryResult!6856)

(assert (=> b!643371 (= lt!297937 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18419 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!643372 () Bool)

(assert (=> b!643372 (= e!368533 e!368532)))

(declare-fun res!416738 () Bool)

(assert (=> b!643372 (=> res!416738 e!368532)))

(assert (=> b!643372 (= res!416738 (or (not (= (select (arr!18419 a!2986) j!136) lt!297942)) (not (= (select (arr!18419 a!2986) j!136) lt!297947)) (bvsge j!136 index!984)))))

(declare-fun b!643373 () Bool)

(declare-datatypes ((Unit!21764 0))(
  ( (Unit!21765) )
))
(declare-fun e!368540 () Unit!21764)

(declare-fun Unit!21766 () Unit!21764)

(assert (=> b!643373 (= e!368540 Unit!21766)))

(declare-fun b!643374 () Bool)

(assert (=> b!643374 (= e!368535 e!368527)))

(declare-fun res!416730 () Bool)

(assert (=> b!643374 (=> (not res!416730) (not e!368527))))

(assert (=> b!643374 (= res!416730 (= (select (store (arr!18419 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!643374 (= lt!297940 (array!38413 (store (arr!18419 a!2986) i!1108 k0!1786) (size!18784 a!2986)))))

(declare-fun b!643375 () Bool)

(declare-fun res!416729 () Bool)

(assert (=> b!643375 (=> (not res!416729) (not e!368530))))

(assert (=> b!643375 (= res!416729 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!643376 () Bool)

(assert (=> b!643376 (= e!368526 (not e!368536))))

(declare-fun res!416734 () Bool)

(assert (=> b!643376 (=> res!416734 e!368536)))

(declare-fun lt!297938 () SeekEntryResult!6856)

(assert (=> b!643376 (= res!416734 (not (= lt!297938 (Found!6856 index!984))))))

(declare-fun lt!297939 () Unit!21764)

(assert (=> b!643376 (= lt!297939 e!368540)))

(declare-fun c!73686 () Bool)

(assert (=> b!643376 (= c!73686 (= lt!297938 Undefined!6856))))

(assert (=> b!643376 (= lt!297938 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!297942 lt!297940 mask!3053))))

(declare-fun e!368528 () Bool)

(assert (=> b!643376 e!368528))

(declare-fun res!416741 () Bool)

(assert (=> b!643376 (=> (not res!416741) (not e!368528))))

(declare-fun lt!297951 () (_ BitVec 32))

(declare-fun lt!297948 () SeekEntryResult!6856)

(assert (=> b!643376 (= res!416741 (= lt!297948 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297951 vacantSpotIndex!68 lt!297942 lt!297940 mask!3053)))))

(assert (=> b!643376 (= lt!297948 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297951 vacantSpotIndex!68 (select (arr!18419 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!643376 (= lt!297942 (select (store (arr!18419 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!297949 () Unit!21764)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38412 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21764)

(assert (=> b!643376 (= lt!297949 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!297951 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!643376 (= lt!297951 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!643377 () Bool)

(declare-fun res!416742 () Bool)

(assert (=> b!643377 (=> (not res!416742) (not e!368530))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!643377 (= res!416742 (validKeyInArray!0 k0!1786))))

(declare-fun b!643378 () Bool)

(declare-fun e!368538 () Unit!21764)

(declare-fun Unit!21767 () Unit!21764)

(assert (=> b!643378 (= e!368538 Unit!21767)))

(declare-fun lt!297941 () Unit!21764)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38412 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21764)

(assert (=> b!643378 (= lt!297941 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!297940 (select (arr!18419 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!643378 (arrayContainsKey!0 lt!297940 (select (arr!18419 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!297950 () Unit!21764)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38412 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12499) Unit!21764)

(assert (=> b!643378 (= lt!297950 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12496))))

(assert (=> b!643378 (arrayNoDuplicates!0 lt!297940 #b00000000000000000000000000000000 Nil!12496)))

(declare-fun lt!297944 () Unit!21764)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38412 (_ BitVec 32) (_ BitVec 32)) Unit!21764)

(assert (=> b!643378 (= lt!297944 (lemmaNoDuplicateFromThenFromBigger!0 lt!297940 #b00000000000000000000000000000000 j!136))))

(assert (=> b!643378 (arrayNoDuplicates!0 lt!297940 j!136 Nil!12496)))

(declare-fun lt!297943 () Unit!21764)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38412 (_ BitVec 64) (_ BitVec 32) List!12499) Unit!21764)

(assert (=> b!643378 (= lt!297943 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!297940 (select (arr!18419 a!2986) j!136) j!136 Nil!12496))))

(assert (=> b!643378 false))

(declare-fun b!643379 () Bool)

(assert (=> b!643379 (= e!368529 (arrayContainsKey!0 lt!297940 (select (arr!18419 a!2986) j!136) index!984))))

(declare-fun b!643380 () Bool)

(declare-fun res!416739 () Bool)

(assert (=> b!643380 (=> (not res!416739) (not e!368535))))

(assert (=> b!643380 (= res!416739 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18419 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!643381 () Bool)

(assert (=> b!643381 (= e!368528 (= lt!297937 lt!297948))))

(declare-fun b!643382 () Bool)

(declare-fun Unit!21768 () Unit!21764)

(assert (=> b!643382 (= e!368538 Unit!21768)))

(declare-fun b!643383 () Bool)

(assert (=> b!643383 (= e!368539 (arrayContainsKey!0 lt!297940 (select (arr!18419 a!2986) j!136) index!984))))

(declare-fun b!643384 () Bool)

(assert (=> b!643384 (= e!368534 e!368531)))

(declare-fun res!416737 () Bool)

(assert (=> b!643384 (=> res!416737 e!368531)))

(assert (=> b!643384 (= res!416737 (bvsge index!984 j!136))))

(declare-fun lt!297946 () Unit!21764)

(assert (=> b!643384 (= lt!297946 e!368538)))

(declare-fun c!73685 () Bool)

(assert (=> b!643384 (= c!73685 (bvslt j!136 index!984))))

(declare-fun b!643385 () Bool)

(declare-fun Unit!21769 () Unit!21764)

(assert (=> b!643385 (= e!368540 Unit!21769)))

(assert (=> b!643385 false))

(declare-fun res!416735 () Bool)

(assert (=> start!58304 (=> (not res!416735) (not e!368530))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58304 (= res!416735 (validMask!0 mask!3053))))

(assert (=> start!58304 e!368530))

(assert (=> start!58304 true))

(declare-fun array_inv!14302 (array!38412) Bool)

(assert (=> start!58304 (array_inv!14302 a!2986)))

(declare-fun b!643386 () Bool)

(declare-fun res!416736 () Bool)

(assert (=> b!643386 (=> (not res!416736) (not e!368530))))

(assert (=> b!643386 (= res!416736 (validKeyInArray!0 (select (arr!18419 a!2986) j!136)))))

(assert (= (and start!58304 res!416735) b!643366))

(assert (= (and b!643366 res!416744) b!643386))

(assert (= (and b!643386 res!416736) b!643377))

(assert (= (and b!643377 res!416742) b!643375))

(assert (= (and b!643375 res!416729) b!643364))

(assert (= (and b!643364 res!416731) b!643367))

(assert (= (and b!643367 res!416743) b!643368))

(assert (= (and b!643368 res!416740) b!643380))

(assert (= (and b!643380 res!416739) b!643374))

(assert (= (and b!643374 res!416730) b!643371))

(assert (= (and b!643371 res!416728) b!643376))

(assert (= (and b!643376 res!416741) b!643381))

(assert (= (and b!643376 c!73686) b!643385))

(assert (= (and b!643376 (not c!73686)) b!643373))

(assert (= (and b!643376 (not res!416734)) b!643370))

(assert (= (and b!643370 res!416732) b!643372))

(assert (= (and b!643372 (not res!416738)) b!643365))

(assert (= (and b!643365 res!416733) b!643379))

(assert (= (and b!643370 (not res!416746)) b!643384))

(assert (= (and b!643384 c!73685) b!643378))

(assert (= (and b!643384 (not c!73685)) b!643382))

(assert (= (and b!643384 (not res!416737)) b!643369))

(assert (= (and b!643369 res!416745) b!643383))

(declare-fun m!616587 () Bool)

(assert (=> b!643386 m!616587))

(assert (=> b!643386 m!616587))

(declare-fun m!616589 () Bool)

(assert (=> b!643386 m!616589))

(assert (=> b!643372 m!616587))

(declare-fun m!616591 () Bool)

(assert (=> b!643367 m!616591))

(assert (=> b!643370 m!616587))

(declare-fun m!616593 () Bool)

(assert (=> b!643370 m!616593))

(declare-fun m!616595 () Bool)

(assert (=> b!643370 m!616595))

(declare-fun m!616597 () Bool)

(assert (=> b!643377 m!616597))

(assert (=> b!643383 m!616587))

(assert (=> b!643383 m!616587))

(declare-fun m!616599 () Bool)

(assert (=> b!643383 m!616599))

(declare-fun m!616601 () Bool)

(assert (=> b!643371 m!616601))

(assert (=> b!643371 m!616587))

(assert (=> b!643371 m!616587))

(declare-fun m!616603 () Bool)

(assert (=> b!643371 m!616603))

(declare-fun m!616605 () Bool)

(assert (=> b!643375 m!616605))

(assert (=> b!643369 m!616587))

(assert (=> b!643369 m!616587))

(declare-fun m!616607 () Bool)

(assert (=> b!643369 m!616607))

(assert (=> b!643379 m!616587))

(assert (=> b!643379 m!616587))

(assert (=> b!643379 m!616599))

(assert (=> b!643374 m!616593))

(declare-fun m!616609 () Bool)

(assert (=> b!643374 m!616609))

(declare-fun m!616611 () Bool)

(assert (=> b!643380 m!616611))

(declare-fun m!616613 () Bool)

(assert (=> b!643376 m!616613))

(assert (=> b!643376 m!616587))

(assert (=> b!643376 m!616593))

(declare-fun m!616615 () Bool)

(assert (=> b!643376 m!616615))

(assert (=> b!643376 m!616587))

(declare-fun m!616617 () Bool)

(assert (=> b!643376 m!616617))

(declare-fun m!616619 () Bool)

(assert (=> b!643376 m!616619))

(declare-fun m!616621 () Bool)

(assert (=> b!643376 m!616621))

(declare-fun m!616623 () Bool)

(assert (=> b!643376 m!616623))

(assert (=> b!643378 m!616587))

(declare-fun m!616625 () Bool)

(assert (=> b!643378 m!616625))

(assert (=> b!643378 m!616587))

(declare-fun m!616627 () Bool)

(assert (=> b!643378 m!616627))

(assert (=> b!643378 m!616587))

(declare-fun m!616629 () Bool)

(assert (=> b!643378 m!616629))

(assert (=> b!643378 m!616587))

(declare-fun m!616631 () Bool)

(assert (=> b!643378 m!616631))

(declare-fun m!616633 () Bool)

(assert (=> b!643378 m!616633))

(declare-fun m!616635 () Bool)

(assert (=> b!643378 m!616635))

(declare-fun m!616637 () Bool)

(assert (=> b!643378 m!616637))

(declare-fun m!616639 () Bool)

(assert (=> start!58304 m!616639))

(declare-fun m!616641 () Bool)

(assert (=> start!58304 m!616641))

(assert (=> b!643365 m!616587))

(assert (=> b!643365 m!616587))

(assert (=> b!643365 m!616607))

(declare-fun m!616643 () Bool)

(assert (=> b!643364 m!616643))

(declare-fun m!616645 () Bool)

(assert (=> b!643368 m!616645))

(check-sat (not b!643377) (not b!643379) (not b!643375) (not b!643367) (not start!58304) (not b!643369) (not b!643371) (not b!643368) (not b!643376) (not b!643383) (not b!643386) (not b!643378) (not b!643365) (not b!643364))
(check-sat)
