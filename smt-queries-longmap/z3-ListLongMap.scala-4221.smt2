; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57922 () Bool)

(assert start!57922)

(declare-fun res!414903 () Bool)

(declare-fun e!366750 () Bool)

(assert (=> start!57922 (=> (not res!414903) (not e!366750))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57922 (= res!414903 (validMask!0 mask!3053))))

(assert (=> start!57922 e!366750))

(assert (=> start!57922 true))

(declare-datatypes ((array!38349 0))(
  ( (array!38350 (arr!18394 (Array (_ BitVec 32) (_ BitVec 64))) (size!18758 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38349)

(declare-fun array_inv!14190 (array!38349) Bool)

(assert (=> start!57922 (array_inv!14190 a!2986)))

(declare-fun b!640658 () Bool)

(declare-fun res!414902 () Bool)

(declare-fun e!366749 () Bool)

(assert (=> b!640658 (=> (not res!414902) (not e!366749))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38349 (_ BitVec 32)) Bool)

(assert (=> b!640658 (= res!414902 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!640659 () Bool)

(declare-fun res!414900 () Bool)

(assert (=> b!640659 (=> (not res!414900) (not e!366750))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!640659 (= res!414900 (and (= (size!18758 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18758 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18758 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!640660 () Bool)

(declare-fun e!366746 () Bool)

(declare-fun e!366755 () Bool)

(assert (=> b!640660 (= e!366746 e!366755)))

(declare-fun res!414899 () Bool)

(assert (=> b!640660 (=> (not res!414899) (not e!366755))))

(declare-fun lt!296550 () array!38349)

(declare-fun arrayContainsKey!0 (array!38349 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!640660 (= res!414899 (arrayContainsKey!0 lt!296550 (select (arr!18394 a!2986) j!136) j!136))))

(declare-fun b!640661 () Bool)

(declare-fun e!366747 () Bool)

(declare-datatypes ((SeekEntryResult!6834 0))(
  ( (MissingZero!6834 (index!29656 (_ BitVec 32))) (Found!6834 (index!29657 (_ BitVec 32))) (Intermediate!6834 (undefined!7646 Bool) (index!29658 (_ BitVec 32)) (x!58414 (_ BitVec 32))) (Undefined!6834) (MissingVacant!6834 (index!29659 (_ BitVec 32))) )
))
(declare-fun lt!296542 () SeekEntryResult!6834)

(declare-fun lt!296553 () SeekEntryResult!6834)

(assert (=> b!640661 (= e!366747 (= lt!296542 lt!296553))))

(declare-fun b!640662 () Bool)

(declare-fun e!366752 () Bool)

(declare-fun e!366748 () Bool)

(assert (=> b!640662 (= e!366752 e!366748)))

(declare-fun res!414911 () Bool)

(assert (=> b!640662 (=> (not res!414911) (not e!366748))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!640662 (= res!414911 (and (= lt!296542 (Found!6834 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18394 a!2986) index!984) (select (arr!18394 a!2986) j!136))) (not (= (select (arr!18394 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38349 (_ BitVec 32)) SeekEntryResult!6834)

(assert (=> b!640662 (= lt!296542 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18394 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!640663 () Bool)

(declare-fun e!366751 () Bool)

(declare-fun e!366745 () Bool)

(assert (=> b!640663 (= e!366751 e!366745)))

(declare-fun res!414910 () Bool)

(assert (=> b!640663 (=> res!414910 e!366745)))

(declare-fun lt!296546 () (_ BitVec 64))

(declare-fun lt!296543 () (_ BitVec 64))

(assert (=> b!640663 (= res!414910 (or (not (= (select (arr!18394 a!2986) j!136) lt!296546)) (not (= (select (arr!18394 a!2986) j!136) lt!296543)) (bvsge j!136 index!984)))))

(declare-fun e!366753 () Bool)

(assert (=> b!640663 e!366753))

(declare-fun res!414904 () Bool)

(assert (=> b!640663 (=> (not res!414904) (not e!366753))))

(assert (=> b!640663 (= res!414904 (= lt!296543 (select (arr!18394 a!2986) j!136)))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!640663 (= lt!296543 (select (store (arr!18394 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!640664 () Bool)

(assert (=> b!640664 (= e!366748 (not e!366751))))

(declare-fun res!414901 () Bool)

(assert (=> b!640664 (=> res!414901 e!366751)))

(declare-fun lt!296552 () SeekEntryResult!6834)

(assert (=> b!640664 (= res!414901 (not (= lt!296552 (Found!6834 index!984))))))

(declare-datatypes ((Unit!21670 0))(
  ( (Unit!21671) )
))
(declare-fun lt!296554 () Unit!21670)

(declare-fun e!366754 () Unit!21670)

(assert (=> b!640664 (= lt!296554 e!366754)))

(declare-fun c!73247 () Bool)

(assert (=> b!640664 (= c!73247 (= lt!296552 Undefined!6834))))

(assert (=> b!640664 (= lt!296552 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!296546 lt!296550 mask!3053))))

(assert (=> b!640664 e!366747))

(declare-fun res!414906 () Bool)

(assert (=> b!640664 (=> (not res!414906) (not e!366747))))

(declare-fun lt!296548 () (_ BitVec 32))

(assert (=> b!640664 (= res!414906 (= lt!296553 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296548 vacantSpotIndex!68 lt!296546 lt!296550 mask!3053)))))

(assert (=> b!640664 (= lt!296553 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296548 vacantSpotIndex!68 (select (arr!18394 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!640664 (= lt!296546 (select (store (arr!18394 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!296549 () Unit!21670)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38349 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21670)

(assert (=> b!640664 (= lt!296549 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!296548 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!640664 (= lt!296548 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!640665 () Bool)

(declare-fun res!414913 () Bool)

(assert (=> b!640665 (=> (not res!414913) (not e!366750))))

(assert (=> b!640665 (= res!414913 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!640666 () Bool)

(declare-fun res!414914 () Bool)

(assert (=> b!640666 (=> (not res!414914) (not e!366750))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!640666 (= res!414914 (validKeyInArray!0 (select (arr!18394 a!2986) j!136)))))

(declare-fun b!640667 () Bool)

(assert (=> b!640667 (= e!366749 e!366752)))

(declare-fun res!414909 () Bool)

(assert (=> b!640667 (=> (not res!414909) (not e!366752))))

(assert (=> b!640667 (= res!414909 (= (select (store (arr!18394 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!640667 (= lt!296550 (array!38350 (store (arr!18394 a!2986) i!1108 k0!1786) (size!18758 a!2986)))))

(declare-fun b!640668 () Bool)

(assert (=> b!640668 (= e!366753 e!366746)))

(declare-fun res!414898 () Bool)

(assert (=> b!640668 (=> res!414898 e!366746)))

(assert (=> b!640668 (= res!414898 (or (not (= (select (arr!18394 a!2986) j!136) lt!296546)) (not (= (select (arr!18394 a!2986) j!136) lt!296543)) (bvsge j!136 index!984)))))

(declare-fun b!640669 () Bool)

(declare-fun Unit!21672 () Unit!21670)

(assert (=> b!640669 (= e!366754 Unit!21672)))

(declare-fun b!640670 () Bool)

(assert (=> b!640670 (= e!366745 (or (bvsge (size!18758 a!2986) #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 j!136) (size!18758 a!2986))))))

(declare-datatypes ((List!12435 0))(
  ( (Nil!12432) (Cons!12431 (h!13476 (_ BitVec 64)) (t!18663 List!12435)) )
))
(declare-fun arrayNoDuplicates!0 (array!38349 (_ BitVec 32) List!12435) Bool)

(assert (=> b!640670 (arrayNoDuplicates!0 lt!296550 j!136 Nil!12432)))

(declare-fun lt!296551 () Unit!21670)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38349 (_ BitVec 32) (_ BitVec 32)) Unit!21670)

(assert (=> b!640670 (= lt!296551 (lemmaNoDuplicateFromThenFromBigger!0 lt!296550 #b00000000000000000000000000000000 j!136))))

(assert (=> b!640670 (arrayNoDuplicates!0 lt!296550 #b00000000000000000000000000000000 Nil!12432)))

(declare-fun lt!296545 () Unit!21670)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38349 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12435) Unit!21670)

(assert (=> b!640670 (= lt!296545 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12432))))

(assert (=> b!640670 (arrayContainsKey!0 lt!296550 (select (arr!18394 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!296547 () Unit!21670)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38349 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21670)

(assert (=> b!640670 (= lt!296547 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!296550 (select (arr!18394 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!640671 () Bool)

(declare-fun res!414905 () Bool)

(assert (=> b!640671 (=> (not res!414905) (not e!366749))))

(assert (=> b!640671 (= res!414905 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18394 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!640672 () Bool)

(declare-fun res!414912 () Bool)

(assert (=> b!640672 (=> (not res!414912) (not e!366749))))

(assert (=> b!640672 (= res!414912 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12432))))

(declare-fun b!640673 () Bool)

(declare-fun Unit!21673 () Unit!21670)

(assert (=> b!640673 (= e!366754 Unit!21673)))

(assert (=> b!640673 false))

(declare-fun b!640674 () Bool)

(assert (=> b!640674 (= e!366750 e!366749)))

(declare-fun res!414907 () Bool)

(assert (=> b!640674 (=> (not res!414907) (not e!366749))))

(declare-fun lt!296544 () SeekEntryResult!6834)

(assert (=> b!640674 (= res!414907 (or (= lt!296544 (MissingZero!6834 i!1108)) (= lt!296544 (MissingVacant!6834 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38349 (_ BitVec 32)) SeekEntryResult!6834)

(assert (=> b!640674 (= lt!296544 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!640675 () Bool)

(declare-fun res!414908 () Bool)

(assert (=> b!640675 (=> (not res!414908) (not e!366750))))

(assert (=> b!640675 (= res!414908 (validKeyInArray!0 k0!1786))))

(declare-fun b!640676 () Bool)

(assert (=> b!640676 (= e!366755 (arrayContainsKey!0 lt!296550 (select (arr!18394 a!2986) j!136) index!984))))

(assert (= (and start!57922 res!414903) b!640659))

(assert (= (and b!640659 res!414900) b!640666))

(assert (= (and b!640666 res!414914) b!640675))

(assert (= (and b!640675 res!414908) b!640665))

(assert (= (and b!640665 res!414913) b!640674))

(assert (= (and b!640674 res!414907) b!640658))

(assert (= (and b!640658 res!414902) b!640672))

(assert (= (and b!640672 res!414912) b!640671))

(assert (= (and b!640671 res!414905) b!640667))

(assert (= (and b!640667 res!414909) b!640662))

(assert (= (and b!640662 res!414911) b!640664))

(assert (= (and b!640664 res!414906) b!640661))

(assert (= (and b!640664 c!73247) b!640673))

(assert (= (and b!640664 (not c!73247)) b!640669))

(assert (= (and b!640664 (not res!414901)) b!640663))

(assert (= (and b!640663 res!414904) b!640668))

(assert (= (and b!640668 (not res!414898)) b!640660))

(assert (= (and b!640660 res!414899) b!640676))

(assert (= (and b!640663 (not res!414910)) b!640670))

(declare-fun m!614493 () Bool)

(assert (=> b!640658 m!614493))

(declare-fun m!614495 () Bool)

(assert (=> b!640668 m!614495))

(declare-fun m!614497 () Bool)

(assert (=> b!640675 m!614497))

(declare-fun m!614499 () Bool)

(assert (=> b!640662 m!614499))

(assert (=> b!640662 m!614495))

(assert (=> b!640662 m!614495))

(declare-fun m!614501 () Bool)

(assert (=> b!640662 m!614501))

(declare-fun m!614503 () Bool)

(assert (=> start!57922 m!614503))

(declare-fun m!614505 () Bool)

(assert (=> start!57922 m!614505))

(declare-fun m!614507 () Bool)

(assert (=> b!640674 m!614507))

(declare-fun m!614509 () Bool)

(assert (=> b!640672 m!614509))

(declare-fun m!614511 () Bool)

(assert (=> b!640671 m!614511))

(assert (=> b!640660 m!614495))

(assert (=> b!640660 m!614495))

(declare-fun m!614513 () Bool)

(assert (=> b!640660 m!614513))

(declare-fun m!614515 () Bool)

(assert (=> b!640664 m!614515))

(declare-fun m!614517 () Bool)

(assert (=> b!640664 m!614517))

(assert (=> b!640664 m!614495))

(declare-fun m!614519 () Bool)

(assert (=> b!640664 m!614519))

(declare-fun m!614521 () Bool)

(assert (=> b!640664 m!614521))

(declare-fun m!614523 () Bool)

(assert (=> b!640664 m!614523))

(declare-fun m!614525 () Bool)

(assert (=> b!640664 m!614525))

(assert (=> b!640664 m!614495))

(declare-fun m!614527 () Bool)

(assert (=> b!640664 m!614527))

(assert (=> b!640676 m!614495))

(assert (=> b!640676 m!614495))

(declare-fun m!614529 () Bool)

(assert (=> b!640676 m!614529))

(declare-fun m!614531 () Bool)

(assert (=> b!640665 m!614531))

(assert (=> b!640663 m!614495))

(assert (=> b!640663 m!614519))

(declare-fun m!614533 () Bool)

(assert (=> b!640663 m!614533))

(assert (=> b!640667 m!614519))

(declare-fun m!614535 () Bool)

(assert (=> b!640667 m!614535))

(declare-fun m!614537 () Bool)

(assert (=> b!640670 m!614537))

(assert (=> b!640670 m!614495))

(declare-fun m!614539 () Bool)

(assert (=> b!640670 m!614539))

(assert (=> b!640670 m!614495))

(declare-fun m!614541 () Bool)

(assert (=> b!640670 m!614541))

(declare-fun m!614543 () Bool)

(assert (=> b!640670 m!614543))

(assert (=> b!640670 m!614495))

(declare-fun m!614545 () Bool)

(assert (=> b!640670 m!614545))

(declare-fun m!614547 () Bool)

(assert (=> b!640670 m!614547))

(assert (=> b!640666 m!614495))

(assert (=> b!640666 m!614495))

(declare-fun m!614549 () Bool)

(assert (=> b!640666 m!614549))

(check-sat (not b!640660) (not b!640670) (not b!640662) (not b!640674) (not b!640676) (not b!640658) (not b!640666) (not b!640672) (not b!640675) (not b!640665) (not b!640664) (not start!57922))
(check-sat)
