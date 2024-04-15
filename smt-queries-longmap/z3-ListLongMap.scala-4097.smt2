; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56064 () Bool)

(assert start!56064)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun e!354415 () Bool)

(declare-datatypes ((array!37548 0))(
  ( (array!37549 (arr!18020 (Array (_ BitVec 32) (_ BitVec 64))) (size!18385 (_ BitVec 32))) )
))
(declare-fun lt!284795 () array!37548)

(declare-fun b!618052 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!37548)

(declare-fun arrayContainsKey!0 (array!37548 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!618052 (= e!354415 (arrayContainsKey!0 lt!284795 (select (arr!18020 a!2986) j!136) index!984))))

(declare-fun b!618053 () Bool)

(assert (=> b!618053 false))

(declare-datatypes ((Unit!20316 0))(
  ( (Unit!20317) )
))
(declare-fun lt!284792 () Unit!20316)

(declare-datatypes ((List!12100 0))(
  ( (Nil!12097) (Cons!12096 (h!13141 (_ BitVec 64)) (t!18319 List!12100)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37548 (_ BitVec 64) (_ BitVec 32) List!12100) Unit!20316)

(assert (=> b!618053 (= lt!284792 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!284795 (select (arr!18020 a!2986) j!136) index!984 Nil!12097))))

(declare-fun arrayNoDuplicates!0 (array!37548 (_ BitVec 32) List!12100) Bool)

(assert (=> b!618053 (arrayNoDuplicates!0 lt!284795 index!984 Nil!12097)))

(declare-fun lt!284802 () Unit!20316)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37548 (_ BitVec 32) (_ BitVec 32)) Unit!20316)

(assert (=> b!618053 (= lt!284802 (lemmaNoDuplicateFromThenFromBigger!0 lt!284795 #b00000000000000000000000000000000 index!984))))

(assert (=> b!618053 (arrayNoDuplicates!0 lt!284795 #b00000000000000000000000000000000 Nil!12097)))

(declare-fun lt!284787 () Unit!20316)

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37548 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12100) Unit!20316)

(assert (=> b!618053 (= lt!284787 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12097))))

(assert (=> b!618053 (arrayContainsKey!0 lt!284795 (select (arr!18020 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!284784 () Unit!20316)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37548 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20316)

(assert (=> b!618053 (= lt!284784 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!284795 (select (arr!18020 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!618053 e!354415))

(declare-fun res!398251 () Bool)

(assert (=> b!618053 (=> (not res!398251) (not e!354415))))

(assert (=> b!618053 (= res!398251 (arrayContainsKey!0 lt!284795 (select (arr!18020 a!2986) j!136) j!136))))

(declare-fun e!354421 () Unit!20316)

(declare-fun Unit!20318 () Unit!20316)

(assert (=> b!618053 (= e!354421 Unit!20318)))

(declare-fun b!618054 () Bool)

(assert (=> b!618054 false))

(declare-fun lt!284788 () Unit!20316)

(assert (=> b!618054 (= lt!284788 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!284795 (select (arr!18020 a!2986) j!136) j!136 Nil!12097))))

(assert (=> b!618054 (arrayNoDuplicates!0 lt!284795 j!136 Nil!12097)))

(declare-fun lt!284803 () Unit!20316)

(assert (=> b!618054 (= lt!284803 (lemmaNoDuplicateFromThenFromBigger!0 lt!284795 #b00000000000000000000000000000000 j!136))))

(assert (=> b!618054 (arrayNoDuplicates!0 lt!284795 #b00000000000000000000000000000000 Nil!12097)))

(declare-fun lt!284800 () Unit!20316)

(assert (=> b!618054 (= lt!284800 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12097))))

(assert (=> b!618054 (arrayContainsKey!0 lt!284795 (select (arr!18020 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!284794 () Unit!20316)

(assert (=> b!618054 (= lt!284794 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!284795 (select (arr!18020 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!354413 () Unit!20316)

(declare-fun Unit!20319 () Unit!20316)

(assert (=> b!618054 (= e!354413 Unit!20319)))

(declare-fun b!618055 () Bool)

(declare-fun res!398244 () Bool)

(declare-fun e!354411 () Bool)

(assert (=> b!618055 (=> (not res!398244) (not e!354411))))

(declare-fun mask!3053 () (_ BitVec 32))

(assert (=> b!618055 (= res!398244 (and (= (size!18385 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18385 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18385 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!618056 () Bool)

(declare-fun res!398239 () Bool)

(assert (=> b!618056 (= res!398239 (arrayContainsKey!0 lt!284795 (select (arr!18020 a!2986) j!136) j!136))))

(declare-fun e!354412 () Bool)

(assert (=> b!618056 (=> (not res!398239) (not e!354412))))

(declare-fun e!354416 () Bool)

(assert (=> b!618056 (= e!354416 e!354412)))

(declare-fun b!618057 () Bool)

(declare-fun res!398247 () Bool)

(declare-fun e!354418 () Bool)

(assert (=> b!618057 (=> (not res!398247) (not e!354418))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37548 (_ BitVec 32)) Bool)

(assert (=> b!618057 (= res!398247 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!618058 () Bool)

(declare-fun res!398242 () Bool)

(assert (=> b!618058 (=> (not res!398242) (not e!354411))))

(assert (=> b!618058 (= res!398242 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!618059 () Bool)

(declare-fun e!354414 () Bool)

(declare-fun e!354423 () Bool)

(assert (=> b!618059 (= e!354414 e!354423)))

(declare-fun res!398248 () Bool)

(assert (=> b!618059 (=> (not res!398248) (not e!354423))))

(declare-datatypes ((SeekEntryResult!6457 0))(
  ( (MissingZero!6457 (index!28112 (_ BitVec 32))) (Found!6457 (index!28113 (_ BitVec 32))) (Intermediate!6457 (undefined!7269 Bool) (index!28114 (_ BitVec 32)) (x!56908 (_ BitVec 32))) (Undefined!6457) (MissingVacant!6457 (index!28115 (_ BitVec 32))) )
))
(declare-fun lt!284791 () SeekEntryResult!6457)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!618059 (= res!398248 (and (= lt!284791 (Found!6457 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18020 a!2986) index!984) (select (arr!18020 a!2986) j!136))) (not (= (select (arr!18020 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37548 (_ BitVec 32)) SeekEntryResult!6457)

(assert (=> b!618059 (= lt!284791 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18020 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!618060 () Bool)

(declare-fun e!354419 () Bool)

(assert (=> b!618060 (= e!354423 (not e!354419))))

(declare-fun res!398241 () Bool)

(assert (=> b!618060 (=> res!398241 e!354419)))

(declare-fun lt!284793 () SeekEntryResult!6457)

(assert (=> b!618060 (= res!398241 (not (= lt!284793 (MissingVacant!6457 vacantSpotIndex!68))))))

(declare-fun lt!284790 () Unit!20316)

(declare-fun e!354409 () Unit!20316)

(assert (=> b!618060 (= lt!284790 e!354409)))

(declare-fun c!70276 () Bool)

(assert (=> b!618060 (= c!70276 (= lt!284793 (Found!6457 index!984)))))

(declare-fun lt!284789 () Unit!20316)

(declare-fun e!354422 () Unit!20316)

(assert (=> b!618060 (= lt!284789 e!354422)))

(declare-fun c!70278 () Bool)

(assert (=> b!618060 (= c!70278 (= lt!284793 Undefined!6457))))

(declare-fun lt!284797 () (_ BitVec 64))

(assert (=> b!618060 (= lt!284793 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!284797 lt!284795 mask!3053))))

(declare-fun e!354417 () Bool)

(assert (=> b!618060 e!354417))

(declare-fun res!398237 () Bool)

(assert (=> b!618060 (=> (not res!398237) (not e!354417))))

(declare-fun lt!284786 () SeekEntryResult!6457)

(declare-fun lt!284798 () (_ BitVec 32))

(assert (=> b!618060 (= res!398237 (= lt!284786 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!284798 vacantSpotIndex!68 lt!284797 lt!284795 mask!3053)))))

(assert (=> b!618060 (= lt!284786 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!284798 vacantSpotIndex!68 (select (arr!18020 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!618060 (= lt!284797 (select (store (arr!18020 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!284801 () Unit!20316)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37548 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20316)

(assert (=> b!618060 (= lt!284801 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!284798 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!618060 (= lt!284798 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!618061 () Bool)

(declare-fun res!398250 () Bool)

(assert (=> b!618061 (=> (not res!398250) (not e!354411))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!618061 (= res!398250 (validKeyInArray!0 k0!1786))))

(declare-fun b!618062 () Bool)

(assert (=> b!618062 (= e!354419 true)))

(assert (=> b!618062 (= (select (store (arr!18020 a!2986) i!1108 k0!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!618063 () Bool)

(assert (=> b!618063 (= e!354418 e!354414)))

(declare-fun res!398236 () Bool)

(assert (=> b!618063 (=> (not res!398236) (not e!354414))))

(assert (=> b!618063 (= res!398236 (= (select (store (arr!18020 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!618063 (= lt!284795 (array!37549 (store (arr!18020 a!2986) i!1108 k0!1786) (size!18385 a!2986)))))

(declare-fun b!618064 () Bool)

(declare-fun Unit!20320 () Unit!20316)

(assert (=> b!618064 (= e!354409 Unit!20320)))

(declare-fun res!398246 () Bool)

(assert (=> b!618064 (= res!398246 (= (select (store (arr!18020 a!2986) i!1108 k0!1786) index!984) (select (arr!18020 a!2986) j!136)))))

(declare-fun e!354410 () Bool)

(assert (=> b!618064 (=> (not res!398246) (not e!354410))))

(assert (=> b!618064 e!354410))

(declare-fun c!70275 () Bool)

(assert (=> b!618064 (= c!70275 (bvslt j!136 index!984))))

(declare-fun lt!284785 () Unit!20316)

(assert (=> b!618064 (= lt!284785 e!354413)))

(declare-fun c!70277 () Bool)

(assert (=> b!618064 (= c!70277 (bvslt index!984 j!136))))

(declare-fun lt!284796 () Unit!20316)

(assert (=> b!618064 (= lt!284796 e!354421)))

(assert (=> b!618064 false))

(declare-fun b!618065 () Bool)

(declare-fun res!398249 () Bool)

(assert (=> b!618065 (=> (not res!398249) (not e!354411))))

(assert (=> b!618065 (= res!398249 (validKeyInArray!0 (select (arr!18020 a!2986) j!136)))))

(declare-fun b!618067 () Bool)

(assert (=> b!618067 (= e!354412 (arrayContainsKey!0 lt!284795 (select (arr!18020 a!2986) j!136) index!984))))

(declare-fun b!618068 () Bool)

(declare-fun Unit!20321 () Unit!20316)

(assert (=> b!618068 (= e!354413 Unit!20321)))

(declare-fun b!618069 () Bool)

(assert (=> b!618069 (= e!354417 (= lt!284791 lt!284786))))

(declare-fun b!618070 () Bool)

(declare-fun Unit!20322 () Unit!20316)

(assert (=> b!618070 (= e!354409 Unit!20322)))

(declare-fun b!618071 () Bool)

(declare-fun res!398243 () Bool)

(assert (=> b!618071 (= res!398243 (bvsge j!136 index!984))))

(assert (=> b!618071 (=> res!398243 e!354416)))

(assert (=> b!618071 (= e!354410 e!354416)))

(declare-fun b!618072 () Bool)

(declare-fun Unit!20323 () Unit!20316)

(assert (=> b!618072 (= e!354422 Unit!20323)))

(declare-fun b!618073 () Bool)

(assert (=> b!618073 (= e!354411 e!354418)))

(declare-fun res!398252 () Bool)

(assert (=> b!618073 (=> (not res!398252) (not e!354418))))

(declare-fun lt!284799 () SeekEntryResult!6457)

(assert (=> b!618073 (= res!398252 (or (= lt!284799 (MissingZero!6457 i!1108)) (= lt!284799 (MissingVacant!6457 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37548 (_ BitVec 32)) SeekEntryResult!6457)

(assert (=> b!618073 (= lt!284799 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!618074 () Bool)

(declare-fun res!398240 () Bool)

(assert (=> b!618074 (=> (not res!398240) (not e!354418))))

(assert (=> b!618074 (= res!398240 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18020 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!618075 () Bool)

(declare-fun Unit!20324 () Unit!20316)

(assert (=> b!618075 (= e!354421 Unit!20324)))

(declare-fun b!618076 () Bool)

(declare-fun Unit!20325 () Unit!20316)

(assert (=> b!618076 (= e!354422 Unit!20325)))

(assert (=> b!618076 false))

(declare-fun b!618066 () Bool)

(declare-fun res!398238 () Bool)

(assert (=> b!618066 (=> (not res!398238) (not e!354418))))

(assert (=> b!618066 (= res!398238 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12097))))

(declare-fun res!398245 () Bool)

(assert (=> start!56064 (=> (not res!398245) (not e!354411))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56064 (= res!398245 (validMask!0 mask!3053))))

(assert (=> start!56064 e!354411))

(assert (=> start!56064 true))

(declare-fun array_inv!13903 (array!37548) Bool)

(assert (=> start!56064 (array_inv!13903 a!2986)))

(assert (= (and start!56064 res!398245) b!618055))

(assert (= (and b!618055 res!398244) b!618065))

(assert (= (and b!618065 res!398249) b!618061))

(assert (= (and b!618061 res!398250) b!618058))

(assert (= (and b!618058 res!398242) b!618073))

(assert (= (and b!618073 res!398252) b!618057))

(assert (= (and b!618057 res!398247) b!618066))

(assert (= (and b!618066 res!398238) b!618074))

(assert (= (and b!618074 res!398240) b!618063))

(assert (= (and b!618063 res!398236) b!618059))

(assert (= (and b!618059 res!398248) b!618060))

(assert (= (and b!618060 res!398237) b!618069))

(assert (= (and b!618060 c!70278) b!618076))

(assert (= (and b!618060 (not c!70278)) b!618072))

(assert (= (and b!618060 c!70276) b!618064))

(assert (= (and b!618060 (not c!70276)) b!618070))

(assert (= (and b!618064 res!398246) b!618071))

(assert (= (and b!618071 (not res!398243)) b!618056))

(assert (= (and b!618056 res!398239) b!618067))

(assert (= (and b!618064 c!70275) b!618054))

(assert (= (and b!618064 (not c!70275)) b!618068))

(assert (= (and b!618064 c!70277) b!618053))

(assert (= (and b!618064 (not c!70277)) b!618075))

(assert (= (and b!618053 res!398251) b!618052))

(assert (= (and b!618060 (not res!398241)) b!618062))

(declare-fun m!593599 () Bool)

(assert (=> b!618058 m!593599))

(declare-fun m!593601 () Bool)

(assert (=> b!618063 m!593601))

(declare-fun m!593603 () Bool)

(assert (=> b!618063 m!593603))

(declare-fun m!593605 () Bool)

(assert (=> b!618053 m!593605))

(declare-fun m!593607 () Bool)

(assert (=> b!618053 m!593607))

(declare-fun m!593609 () Bool)

(assert (=> b!618053 m!593609))

(assert (=> b!618053 m!593605))

(declare-fun m!593611 () Bool)

(assert (=> b!618053 m!593611))

(assert (=> b!618053 m!593605))

(declare-fun m!593613 () Bool)

(assert (=> b!618053 m!593613))

(declare-fun m!593615 () Bool)

(assert (=> b!618053 m!593615))

(assert (=> b!618053 m!593605))

(declare-fun m!593617 () Bool)

(assert (=> b!618053 m!593617))

(declare-fun m!593619 () Bool)

(assert (=> b!618053 m!593619))

(assert (=> b!618053 m!593605))

(declare-fun m!593621 () Bool)

(assert (=> b!618053 m!593621))

(assert (=> b!618052 m!593605))

(assert (=> b!618052 m!593605))

(declare-fun m!593623 () Bool)

(assert (=> b!618052 m!593623))

(assert (=> b!618054 m!593605))

(declare-fun m!593625 () Bool)

(assert (=> b!618054 m!593625))

(assert (=> b!618054 m!593605))

(declare-fun m!593627 () Bool)

(assert (=> b!618054 m!593627))

(assert (=> b!618054 m!593605))

(declare-fun m!593629 () Bool)

(assert (=> b!618054 m!593629))

(assert (=> b!618054 m!593605))

(declare-fun m!593631 () Bool)

(assert (=> b!618054 m!593631))

(assert (=> b!618054 m!593615))

(declare-fun m!593633 () Bool)

(assert (=> b!618054 m!593633))

(assert (=> b!618054 m!593619))

(assert (=> b!618064 m!593601))

(declare-fun m!593635 () Bool)

(assert (=> b!618064 m!593635))

(assert (=> b!618064 m!593605))

(declare-fun m!593637 () Bool)

(assert (=> b!618066 m!593637))

(assert (=> b!618056 m!593605))

(assert (=> b!618056 m!593605))

(assert (=> b!618056 m!593607))

(assert (=> b!618065 m!593605))

(assert (=> b!618065 m!593605))

(declare-fun m!593639 () Bool)

(assert (=> b!618065 m!593639))

(declare-fun m!593641 () Bool)

(assert (=> start!56064 m!593641))

(declare-fun m!593643 () Bool)

(assert (=> start!56064 m!593643))

(declare-fun m!593645 () Bool)

(assert (=> b!618060 m!593645))

(declare-fun m!593647 () Bool)

(assert (=> b!618060 m!593647))

(assert (=> b!618060 m!593605))

(assert (=> b!618060 m!593601))

(declare-fun m!593649 () Bool)

(assert (=> b!618060 m!593649))

(declare-fun m!593651 () Bool)

(assert (=> b!618060 m!593651))

(declare-fun m!593653 () Bool)

(assert (=> b!618060 m!593653))

(assert (=> b!618060 m!593605))

(declare-fun m!593655 () Bool)

(assert (=> b!618060 m!593655))

(declare-fun m!593657 () Bool)

(assert (=> b!618059 m!593657))

(assert (=> b!618059 m!593605))

(assert (=> b!618059 m!593605))

(declare-fun m!593659 () Bool)

(assert (=> b!618059 m!593659))

(declare-fun m!593661 () Bool)

(assert (=> b!618057 m!593661))

(assert (=> b!618062 m!593601))

(assert (=> b!618062 m!593635))

(declare-fun m!593663 () Bool)

(assert (=> b!618074 m!593663))

(assert (=> b!618067 m!593605))

(assert (=> b!618067 m!593605))

(assert (=> b!618067 m!593623))

(declare-fun m!593665 () Bool)

(assert (=> b!618073 m!593665))

(declare-fun m!593667 () Bool)

(assert (=> b!618061 m!593667))

(check-sat (not b!618067) (not b!618061) (not b!618073) (not b!618065) (not b!618056) (not start!56064) (not b!618058) (not b!618052) (not b!618053) (not b!618057) (not b!618059) (not b!618054) (not b!618066) (not b!618060))
(check-sat)
