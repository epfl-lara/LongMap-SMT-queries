; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56138 () Bool)

(assert start!56138)

(declare-fun b!620481 () Bool)

(declare-fun res!399838 () Bool)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!620481 (= res!399838 (bvsge j!136 index!984))))

(declare-fun e!355880 () Bool)

(assert (=> b!620481 (=> res!399838 e!355880)))

(declare-fun e!355878 () Bool)

(assert (=> b!620481 (= e!355878 e!355880)))

(declare-fun b!620482 () Bool)

(declare-datatypes ((Unit!20628 0))(
  ( (Unit!20629) )
))
(declare-fun e!355875 () Unit!20628)

(declare-fun Unit!20630 () Unit!20628)

(assert (=> b!620482 (= e!355875 Unit!20630)))

(assert (=> b!620482 false))

(declare-fun b!620483 () Bool)

(declare-datatypes ((array!37608 0))(
  ( (array!37609 (arr!18050 (Array (_ BitVec 32) (_ BitVec 64))) (size!18414 (_ BitVec 32))) )
))
(declare-fun lt!286759 () array!37608)

(declare-fun e!355884 () Bool)

(declare-fun a!2986 () array!37608)

(declare-fun arrayContainsKey!0 (array!37608 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!620483 (= e!355884 (arrayContainsKey!0 lt!286759 (select (arr!18050 a!2986) j!136) index!984))))

(declare-fun b!620484 () Bool)

(declare-fun e!355881 () Bool)

(declare-fun e!355874 () Bool)

(assert (=> b!620484 (= e!355881 e!355874)))

(declare-fun res!399827 () Bool)

(assert (=> b!620484 (=> (not res!399827) (not e!355874))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!620484 (= res!399827 (= (select (store (arr!18050 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!620484 (= lt!286759 (array!37609 (store (arr!18050 a!2986) i!1108 k!1786) (size!18414 a!2986)))))

(declare-fun b!620485 () Bool)

(declare-fun e!355882 () Bool)

(assert (=> b!620485 (= e!355874 e!355882)))

(declare-fun res!399828 () Bool)

(assert (=> b!620485 (=> (not res!399828) (not e!355882))))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6490 0))(
  ( (MissingZero!6490 (index!28244 (_ BitVec 32))) (Found!6490 (index!28245 (_ BitVec 32))) (Intermediate!6490 (undefined!7302 Bool) (index!28246 (_ BitVec 32)) (x!57018 (_ BitVec 32))) (Undefined!6490) (MissingVacant!6490 (index!28247 (_ BitVec 32))) )
))
(declare-fun lt!286776 () SeekEntryResult!6490)

(assert (=> b!620485 (= res!399828 (and (= lt!286776 (Found!6490 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18050 a!2986) index!984) (select (arr!18050 a!2986) j!136))) (not (= (select (arr!18050 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37608 (_ BitVec 32)) SeekEntryResult!6490)

(assert (=> b!620485 (= lt!286776 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18050 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!620486 () Bool)

(declare-fun res!399830 () Bool)

(assert (=> b!620486 (=> (not res!399830) (not e!355881))))

(assert (=> b!620486 (= res!399830 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18050 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!620487 () Bool)

(declare-fun e!355879 () Unit!20628)

(declare-fun Unit!20631 () Unit!20628)

(assert (=> b!620487 (= e!355879 Unit!20631)))

(declare-fun b!620488 () Bool)

(declare-fun e!355873 () Unit!20628)

(declare-fun Unit!20632 () Unit!20628)

(assert (=> b!620488 (= e!355873 Unit!20632)))

(declare-fun b!620489 () Bool)

(declare-fun res!399832 () Bool)

(assert (=> b!620489 (=> (not res!399832) (not e!355881))))

(declare-datatypes ((List!12091 0))(
  ( (Nil!12088) (Cons!12087 (h!13132 (_ BitVec 64)) (t!18319 List!12091)) )
))
(declare-fun arrayNoDuplicates!0 (array!37608 (_ BitVec 32) List!12091) Bool)

(assert (=> b!620489 (= res!399832 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12088))))

(declare-fun res!399831 () Bool)

(declare-fun e!355872 () Bool)

(assert (=> start!56138 (=> (not res!399831) (not e!355872))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56138 (= res!399831 (validMask!0 mask!3053))))

(assert (=> start!56138 e!355872))

(assert (=> start!56138 true))

(declare-fun array_inv!13846 (array!37608) Bool)

(assert (=> start!56138 (array_inv!13846 a!2986)))

(declare-fun b!620490 () Bool)

(declare-fun res!399835 () Bool)

(assert (=> b!620490 (=> (not res!399835) (not e!355872))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!620490 (= res!399835 (validKeyInArray!0 (select (arr!18050 a!2986) j!136)))))

(declare-fun res!399841 () Bool)

(declare-fun b!620491 () Bool)

(assert (=> b!620491 (= res!399841 (arrayContainsKey!0 lt!286759 (select (arr!18050 a!2986) j!136) j!136))))

(assert (=> b!620491 (=> (not res!399841) (not e!355884))))

(assert (=> b!620491 (= e!355880 e!355884)))

(declare-fun b!620492 () Bool)

(assert (=> b!620492 false))

(declare-fun lt!286777 () Unit!20628)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37608 (_ BitVec 64) (_ BitVec 32) List!12091) Unit!20628)

(assert (=> b!620492 (= lt!286777 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!286759 (select (arr!18050 a!2986) j!136) j!136 Nil!12088))))

(assert (=> b!620492 (arrayNoDuplicates!0 lt!286759 j!136 Nil!12088)))

(declare-fun lt!286768 () Unit!20628)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37608 (_ BitVec 32) (_ BitVec 32)) Unit!20628)

(assert (=> b!620492 (= lt!286768 (lemmaNoDuplicateFromThenFromBigger!0 lt!286759 #b00000000000000000000000000000000 j!136))))

(assert (=> b!620492 (arrayNoDuplicates!0 lt!286759 #b00000000000000000000000000000000 Nil!12088)))

(declare-fun lt!286761 () Unit!20628)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37608 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12091) Unit!20628)

(assert (=> b!620492 (= lt!286761 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12088))))

(assert (=> b!620492 (arrayContainsKey!0 lt!286759 (select (arr!18050 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!286773 () Unit!20628)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37608 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20628)

(assert (=> b!620492 (= lt!286773 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!286759 (select (arr!18050 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!355877 () Unit!20628)

(declare-fun Unit!20633 () Unit!20628)

(assert (=> b!620492 (= e!355877 Unit!20633)))

(declare-fun b!620493 () Bool)

(declare-fun Unit!20634 () Unit!20628)

(assert (=> b!620493 (= e!355877 Unit!20634)))

(declare-fun b!620494 () Bool)

(declare-fun e!355883 () Bool)

(assert (=> b!620494 (= e!355883 (arrayContainsKey!0 lt!286759 (select (arr!18050 a!2986) j!136) index!984))))

(declare-fun b!620495 () Bool)

(declare-fun res!399833 () Bool)

(assert (=> b!620495 (=> (not res!399833) (not e!355872))))

(assert (=> b!620495 (= res!399833 (and (= (size!18414 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18414 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18414 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!620496 () Bool)

(declare-fun lt!286763 () SeekEntryResult!6490)

(assert (=> b!620496 (= e!355882 (not (or (= lt!286763 (MissingVacant!6490 vacantSpotIndex!68)) (bvsge mask!3053 #b00000000000000000000000000000000))))))

(declare-fun lt!286765 () Unit!20628)

(assert (=> b!620496 (= lt!286765 e!355873)))

(declare-fun c!70697 () Bool)

(assert (=> b!620496 (= c!70697 (= lt!286763 (Found!6490 index!984)))))

(declare-fun lt!286769 () Unit!20628)

(assert (=> b!620496 (= lt!286769 e!355875)))

(declare-fun c!70696 () Bool)

(assert (=> b!620496 (= c!70696 (= lt!286763 Undefined!6490))))

(declare-fun lt!286767 () (_ BitVec 64))

(assert (=> b!620496 (= lt!286763 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!286767 lt!286759 mask!3053))))

(declare-fun e!355876 () Bool)

(assert (=> b!620496 e!355876))

(declare-fun res!399837 () Bool)

(assert (=> b!620496 (=> (not res!399837) (not e!355876))))

(declare-fun lt!286762 () (_ BitVec 32))

(declare-fun lt!286766 () SeekEntryResult!6490)

(assert (=> b!620496 (= res!399837 (= lt!286766 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!286762 vacantSpotIndex!68 lt!286767 lt!286759 mask!3053)))))

(assert (=> b!620496 (= lt!286766 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!286762 vacantSpotIndex!68 (select (arr!18050 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!620496 (= lt!286767 (select (store (arr!18050 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!286758 () Unit!20628)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37608 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20628)

(assert (=> b!620496 (= lt!286758 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!286762 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!620496 (= lt!286762 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!620497 () Bool)

(declare-fun Unit!20635 () Unit!20628)

(assert (=> b!620497 (= e!355873 Unit!20635)))

(declare-fun res!399842 () Bool)

(assert (=> b!620497 (= res!399842 (= (select (store (arr!18050 a!2986) i!1108 k!1786) index!984) (select (arr!18050 a!2986) j!136)))))

(assert (=> b!620497 (=> (not res!399842) (not e!355878))))

(assert (=> b!620497 e!355878))

(declare-fun c!70695 () Bool)

(assert (=> b!620497 (= c!70695 (bvslt j!136 index!984))))

(declare-fun lt!286771 () Unit!20628)

(assert (=> b!620497 (= lt!286771 e!355877)))

(declare-fun c!70694 () Bool)

(assert (=> b!620497 (= c!70694 (bvslt index!984 j!136))))

(declare-fun lt!286775 () Unit!20628)

(assert (=> b!620497 (= lt!286775 e!355879)))

(assert (=> b!620497 false))

(declare-fun b!620498 () Bool)

(assert (=> b!620498 (= e!355872 e!355881)))

(declare-fun res!399829 () Bool)

(assert (=> b!620498 (=> (not res!399829) (not e!355881))))

(declare-fun lt!286770 () SeekEntryResult!6490)

(assert (=> b!620498 (= res!399829 (or (= lt!286770 (MissingZero!6490 i!1108)) (= lt!286770 (MissingVacant!6490 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37608 (_ BitVec 32)) SeekEntryResult!6490)

(assert (=> b!620498 (= lt!286770 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!620499 () Bool)

(assert (=> b!620499 false))

(declare-fun lt!286772 () Unit!20628)

(assert (=> b!620499 (= lt!286772 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!286759 (select (arr!18050 a!2986) j!136) index!984 Nil!12088))))

(assert (=> b!620499 (arrayNoDuplicates!0 lt!286759 index!984 Nil!12088)))

(declare-fun lt!286760 () Unit!20628)

(assert (=> b!620499 (= lt!286760 (lemmaNoDuplicateFromThenFromBigger!0 lt!286759 #b00000000000000000000000000000000 index!984))))

(assert (=> b!620499 (arrayNoDuplicates!0 lt!286759 #b00000000000000000000000000000000 Nil!12088)))

(declare-fun lt!286774 () Unit!20628)

(assert (=> b!620499 (= lt!286774 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12088))))

(assert (=> b!620499 (arrayContainsKey!0 lt!286759 (select (arr!18050 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!286764 () Unit!20628)

(assert (=> b!620499 (= lt!286764 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!286759 (select (arr!18050 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!620499 e!355883))

(declare-fun res!399834 () Bool)

(assert (=> b!620499 (=> (not res!399834) (not e!355883))))

(assert (=> b!620499 (= res!399834 (arrayContainsKey!0 lt!286759 (select (arr!18050 a!2986) j!136) j!136))))

(declare-fun Unit!20636 () Unit!20628)

(assert (=> b!620499 (= e!355879 Unit!20636)))

(declare-fun b!620500 () Bool)

(declare-fun res!399839 () Bool)

(assert (=> b!620500 (=> (not res!399839) (not e!355881))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37608 (_ BitVec 32)) Bool)

(assert (=> b!620500 (= res!399839 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!620501 () Bool)

(declare-fun res!399836 () Bool)

(assert (=> b!620501 (=> (not res!399836) (not e!355872))))

(assert (=> b!620501 (= res!399836 (validKeyInArray!0 k!1786))))

(declare-fun b!620502 () Bool)

(declare-fun Unit!20637 () Unit!20628)

(assert (=> b!620502 (= e!355875 Unit!20637)))

(declare-fun b!620503 () Bool)

(assert (=> b!620503 (= e!355876 (= lt!286776 lt!286766))))

(declare-fun b!620504 () Bool)

(declare-fun res!399840 () Bool)

(assert (=> b!620504 (=> (not res!399840) (not e!355872))))

(assert (=> b!620504 (= res!399840 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!56138 res!399831) b!620495))

(assert (= (and b!620495 res!399833) b!620490))

(assert (= (and b!620490 res!399835) b!620501))

(assert (= (and b!620501 res!399836) b!620504))

(assert (= (and b!620504 res!399840) b!620498))

(assert (= (and b!620498 res!399829) b!620500))

(assert (= (and b!620500 res!399839) b!620489))

(assert (= (and b!620489 res!399832) b!620486))

(assert (= (and b!620486 res!399830) b!620484))

(assert (= (and b!620484 res!399827) b!620485))

(assert (= (and b!620485 res!399828) b!620496))

(assert (= (and b!620496 res!399837) b!620503))

(assert (= (and b!620496 c!70696) b!620482))

(assert (= (and b!620496 (not c!70696)) b!620502))

(assert (= (and b!620496 c!70697) b!620497))

(assert (= (and b!620496 (not c!70697)) b!620488))

(assert (= (and b!620497 res!399842) b!620481))

(assert (= (and b!620481 (not res!399838)) b!620491))

(assert (= (and b!620491 res!399841) b!620483))

(assert (= (and b!620497 c!70695) b!620492))

(assert (= (and b!620497 (not c!70695)) b!620493))

(assert (= (and b!620497 c!70694) b!620499))

(assert (= (and b!620497 (not c!70694)) b!620487))

(assert (= (and b!620499 res!399834) b!620494))

(declare-fun m!596401 () Bool)

(assert (=> b!620499 m!596401))

(declare-fun m!596403 () Bool)

(assert (=> b!620499 m!596403))

(assert (=> b!620499 m!596401))

(declare-fun m!596405 () Bool)

(assert (=> b!620499 m!596405))

(assert (=> b!620499 m!596401))

(declare-fun m!596407 () Bool)

(assert (=> b!620499 m!596407))

(assert (=> b!620499 m!596401))

(declare-fun m!596409 () Bool)

(assert (=> b!620499 m!596409))

(declare-fun m!596411 () Bool)

(assert (=> b!620499 m!596411))

(declare-fun m!596413 () Bool)

(assert (=> b!620499 m!596413))

(assert (=> b!620499 m!596401))

(declare-fun m!596415 () Bool)

(assert (=> b!620499 m!596415))

(declare-fun m!596417 () Bool)

(assert (=> b!620499 m!596417))

(declare-fun m!596419 () Bool)

(assert (=> b!620504 m!596419))

(assert (=> b!620483 m!596401))

(assert (=> b!620483 m!596401))

(declare-fun m!596421 () Bool)

(assert (=> b!620483 m!596421))

(declare-fun m!596423 () Bool)

(assert (=> b!620497 m!596423))

(declare-fun m!596425 () Bool)

(assert (=> b!620497 m!596425))

(assert (=> b!620497 m!596401))

(declare-fun m!596427 () Bool)

(assert (=> b!620501 m!596427))

(declare-fun m!596429 () Bool)

(assert (=> b!620500 m!596429))

(declare-fun m!596431 () Bool)

(assert (=> b!620486 m!596431))

(declare-fun m!596433 () Bool)

(assert (=> start!56138 m!596433))

(declare-fun m!596435 () Bool)

(assert (=> start!56138 m!596435))

(assert (=> b!620494 m!596401))

(assert (=> b!620494 m!596401))

(assert (=> b!620494 m!596421))

(declare-fun m!596437 () Bool)

(assert (=> b!620485 m!596437))

(assert (=> b!620485 m!596401))

(assert (=> b!620485 m!596401))

(declare-fun m!596439 () Bool)

(assert (=> b!620485 m!596439))

(assert (=> b!620490 m!596401))

(assert (=> b!620490 m!596401))

(declare-fun m!596441 () Bool)

(assert (=> b!620490 m!596441))

(assert (=> b!620484 m!596423))

(declare-fun m!596443 () Bool)

(assert (=> b!620484 m!596443))

(declare-fun m!596445 () Bool)

(assert (=> b!620492 m!596445))

(assert (=> b!620492 m!596401))

(declare-fun m!596447 () Bool)

(assert (=> b!620492 m!596447))

(assert (=> b!620492 m!596401))

(assert (=> b!620492 m!596405))

(declare-fun m!596449 () Bool)

(assert (=> b!620492 m!596449))

(assert (=> b!620492 m!596401))

(declare-fun m!596451 () Bool)

(assert (=> b!620492 m!596451))

(assert (=> b!620492 m!596401))

(declare-fun m!596453 () Bool)

(assert (=> b!620492 m!596453))

(assert (=> b!620492 m!596413))

(declare-fun m!596455 () Bool)

(assert (=> b!620496 m!596455))

(declare-fun m!596457 () Bool)

(assert (=> b!620496 m!596457))

(declare-fun m!596459 () Bool)

(assert (=> b!620496 m!596459))

(assert (=> b!620496 m!596401))

(assert (=> b!620496 m!596423))

(declare-fun m!596461 () Bool)

(assert (=> b!620496 m!596461))

(assert (=> b!620496 m!596401))

(declare-fun m!596463 () Bool)

(assert (=> b!620496 m!596463))

(declare-fun m!596465 () Bool)

(assert (=> b!620496 m!596465))

(declare-fun m!596467 () Bool)

(assert (=> b!620489 m!596467))

(assert (=> b!620491 m!596401))

(assert (=> b!620491 m!596401))

(assert (=> b!620491 m!596409))

(declare-fun m!596469 () Bool)

(assert (=> b!620498 m!596469))

(push 1)

