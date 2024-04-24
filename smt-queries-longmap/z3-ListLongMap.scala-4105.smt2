; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56178 () Bool)

(assert start!56178)

(declare-fun b!620330 () Bool)

(declare-fun e!355792 () Bool)

(declare-fun e!355791 () Bool)

(assert (=> b!620330 (= e!355792 e!355791)))

(declare-fun res!399701 () Bool)

(assert (=> b!620330 (=> (not res!399701) (not e!355791))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6436 0))(
  ( (MissingZero!6436 (index!28028 (_ BitVec 32))) (Found!6436 (index!28029 (_ BitVec 32))) (Intermediate!6436 (undefined!7248 Bool) (index!28030 (_ BitVec 32)) (x!56959 (_ BitVec 32))) (Undefined!6436) (MissingVacant!6436 (index!28031 (_ BitVec 32))) )
))
(declare-fun lt!286565 () SeekEntryResult!6436)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37593 0))(
  ( (array!37594 (arr!18040 (Array (_ BitVec 32) (_ BitVec 64))) (size!18404 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37593)

(assert (=> b!620330 (= res!399701 (and (= lt!286565 (Found!6436 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18040 a!2986) index!984) (select (arr!18040 a!2986) j!136))) (not (= (select (arr!18040 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37593 (_ BitVec 32)) SeekEntryResult!6436)

(assert (=> b!620330 (= lt!286565 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18040 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!620331 () Bool)

(declare-fun res!399706 () Bool)

(declare-fun e!355790 () Bool)

(assert (=> b!620331 (=> (not res!399706) (not e!355790))))

(declare-datatypes ((List!11988 0))(
  ( (Nil!11985) (Cons!11984 (h!13032 (_ BitVec 64)) (t!18208 List!11988)) )
))
(declare-fun arrayNoDuplicates!0 (array!37593 (_ BitVec 32) List!11988) Bool)

(assert (=> b!620331 (= res!399706 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11985))))

(declare-fun b!620332 () Bool)

(assert (=> b!620332 (= e!355790 e!355792)))

(declare-fun res!399699 () Bool)

(assert (=> b!620332 (=> (not res!399699) (not e!355792))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!620332 (= res!399699 (= (select (store (arr!18040 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!286569 () array!37593)

(assert (=> b!620332 (= lt!286569 (array!37594 (store (arr!18040 a!2986) i!1108 k0!1786) (size!18404 a!2986)))))

(declare-fun b!620334 () Bool)

(declare-fun res!399693 () Bool)

(declare-fun e!355797 () Bool)

(assert (=> b!620334 (=> (not res!399693) (not e!355797))))

(declare-fun arrayContainsKey!0 (array!37593 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!620334 (= res!399693 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!620335 () Bool)

(declare-fun res!399703 () Bool)

(assert (=> b!620335 (=> (not res!399703) (not e!355797))))

(assert (=> b!620335 (= res!399703 (and (= (size!18404 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18404 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18404 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!620336 () Bool)

(declare-datatypes ((Unit!20557 0))(
  ( (Unit!20558) )
))
(declare-fun e!355794 () Unit!20557)

(declare-fun Unit!20559 () Unit!20557)

(assert (=> b!620336 (= e!355794 Unit!20559)))

(declare-fun b!620337 () Bool)

(declare-fun res!399704 () Bool)

(assert (=> b!620337 (=> (not res!399704) (not e!355790))))

(assert (=> b!620337 (= res!399704 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18040 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!620338 () Bool)

(declare-fun res!399696 () Bool)

(assert (=> b!620338 (=> (not res!399696) (not e!355790))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37593 (_ BitVec 32)) Bool)

(assert (=> b!620338 (= res!399696 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!620339 () Bool)

(declare-fun e!355803 () Bool)

(declare-fun lt!286579 () SeekEntryResult!6436)

(assert (=> b!620339 (= e!355803 (= lt!286565 lt!286579))))

(declare-fun b!620340 () Bool)

(declare-fun res!399698 () Bool)

(assert (=> b!620340 (= res!399698 (arrayContainsKey!0 lt!286569 (select (arr!18040 a!2986) j!136) j!136))))

(declare-fun e!355799 () Bool)

(assert (=> b!620340 (=> (not res!399698) (not e!355799))))

(declare-fun e!355801 () Bool)

(assert (=> b!620340 (= e!355801 e!355799)))

(declare-fun b!620341 () Bool)

(declare-fun Unit!20560 () Unit!20557)

(assert (=> b!620341 (= e!355794 Unit!20560)))

(assert (=> b!620341 false))

(declare-fun b!620342 () Bool)

(assert (=> b!620342 false))

(declare-fun lt!286578 () Unit!20557)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37593 (_ BitVec 64) (_ BitVec 32) List!11988) Unit!20557)

(assert (=> b!620342 (= lt!286578 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!286569 (select (arr!18040 a!2986) j!136) index!984 Nil!11985))))

(assert (=> b!620342 (arrayNoDuplicates!0 lt!286569 index!984 Nil!11985)))

(declare-fun lt!286577 () Unit!20557)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37593 (_ BitVec 32) (_ BitVec 32)) Unit!20557)

(assert (=> b!620342 (= lt!286577 (lemmaNoDuplicateFromThenFromBigger!0 lt!286569 #b00000000000000000000000000000000 index!984))))

(assert (=> b!620342 (arrayNoDuplicates!0 lt!286569 #b00000000000000000000000000000000 Nil!11985)))

(declare-fun lt!286563 () Unit!20557)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37593 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11988) Unit!20557)

(assert (=> b!620342 (= lt!286563 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11985))))

(assert (=> b!620342 (arrayContainsKey!0 lt!286569 (select (arr!18040 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!286560 () Unit!20557)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37593 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20557)

(assert (=> b!620342 (= lt!286560 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!286569 (select (arr!18040 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!355800 () Bool)

(assert (=> b!620342 e!355800))

(declare-fun res!399695 () Bool)

(assert (=> b!620342 (=> (not res!399695) (not e!355800))))

(assert (=> b!620342 (= res!399695 (arrayContainsKey!0 lt!286569 (select (arr!18040 a!2986) j!136) j!136))))

(declare-fun e!355796 () Unit!20557)

(declare-fun Unit!20561 () Unit!20557)

(assert (=> b!620342 (= e!355796 Unit!20561)))

(declare-fun b!620343 () Bool)

(declare-fun res!399692 () Bool)

(assert (=> b!620343 (=> (not res!399692) (not e!355797))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!620343 (= res!399692 (validKeyInArray!0 (select (arr!18040 a!2986) j!136)))))

(declare-fun b!620344 () Bool)

(assert (=> b!620344 false))

(declare-fun lt!286573 () Unit!20557)

(assert (=> b!620344 (= lt!286573 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!286569 (select (arr!18040 a!2986) j!136) j!136 Nil!11985))))

(assert (=> b!620344 (arrayNoDuplicates!0 lt!286569 j!136 Nil!11985)))

(declare-fun lt!286570 () Unit!20557)

(assert (=> b!620344 (= lt!286570 (lemmaNoDuplicateFromThenFromBigger!0 lt!286569 #b00000000000000000000000000000000 j!136))))

(assert (=> b!620344 (arrayNoDuplicates!0 lt!286569 #b00000000000000000000000000000000 Nil!11985)))

(declare-fun lt!286564 () Unit!20557)

(assert (=> b!620344 (= lt!286564 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11985))))

(assert (=> b!620344 (arrayContainsKey!0 lt!286569 (select (arr!18040 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!286572 () Unit!20557)

(assert (=> b!620344 (= lt!286572 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!286569 (select (arr!18040 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!355802 () Unit!20557)

(declare-fun Unit!20562 () Unit!20557)

(assert (=> b!620344 (= e!355802 Unit!20562)))

(declare-fun b!620345 () Bool)

(declare-fun Unit!20563 () Unit!20557)

(assert (=> b!620345 (= e!355796 Unit!20563)))

(declare-fun b!620346 () Bool)

(assert (=> b!620346 (= e!355799 (arrayContainsKey!0 lt!286569 (select (arr!18040 a!2986) j!136) index!984))))

(declare-fun b!620347 () Bool)

(declare-fun res!399700 () Bool)

(assert (=> b!620347 (= res!399700 (bvsge j!136 index!984))))

(assert (=> b!620347 (=> res!399700 e!355801)))

(declare-fun e!355795 () Bool)

(assert (=> b!620347 (= e!355795 e!355801)))

(declare-fun b!620348 () Bool)

(declare-fun res!399691 () Bool)

(assert (=> b!620348 (=> (not res!399691) (not e!355797))))

(assert (=> b!620348 (= res!399691 (validKeyInArray!0 k0!1786))))

(declare-fun b!620349 () Bool)

(declare-fun Unit!20564 () Unit!20557)

(assert (=> b!620349 (= e!355802 Unit!20564)))

(declare-fun b!620333 () Bool)

(assert (=> b!620333 (= e!355800 (arrayContainsKey!0 lt!286569 (select (arr!18040 a!2986) j!136) index!984))))

(declare-fun res!399697 () Bool)

(assert (=> start!56178 (=> (not res!399697) (not e!355797))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56178 (= res!399697 (validMask!0 mask!3053))))

(assert (=> start!56178 e!355797))

(assert (=> start!56178 true))

(declare-fun array_inv!13899 (array!37593) Bool)

(assert (=> start!56178 (array_inv!13899 a!2986)))

(declare-fun b!620350 () Bool)

(assert (=> b!620350 (= e!355797 e!355790)))

(declare-fun res!399702 () Bool)

(assert (=> b!620350 (=> (not res!399702) (not e!355790))))

(declare-fun lt!286576 () SeekEntryResult!6436)

(assert (=> b!620350 (= res!399702 (or (= lt!286576 (MissingZero!6436 i!1108)) (= lt!286576 (MissingVacant!6436 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37593 (_ BitVec 32)) SeekEntryResult!6436)

(assert (=> b!620350 (= lt!286576 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!620351 () Bool)

(declare-fun e!355793 () Unit!20557)

(declare-fun Unit!20565 () Unit!20557)

(assert (=> b!620351 (= e!355793 Unit!20565)))

(declare-fun res!399694 () Bool)

(assert (=> b!620351 (= res!399694 (= (select (store (arr!18040 a!2986) i!1108 k0!1786) index!984) (select (arr!18040 a!2986) j!136)))))

(assert (=> b!620351 (=> (not res!399694) (not e!355795))))

(assert (=> b!620351 e!355795))

(declare-fun c!70691 () Bool)

(assert (=> b!620351 (= c!70691 (bvslt j!136 index!984))))

(declare-fun lt!286574 () Unit!20557)

(assert (=> b!620351 (= lt!286574 e!355802)))

(declare-fun c!70690 () Bool)

(assert (=> b!620351 (= c!70690 (bvslt index!984 j!136))))

(declare-fun lt!286561 () Unit!20557)

(assert (=> b!620351 (= lt!286561 e!355796)))

(assert (=> b!620351 false))

(declare-fun b!620352 () Bool)

(assert (=> b!620352 (= e!355791 (not true))))

(declare-fun lt!286575 () Unit!20557)

(assert (=> b!620352 (= lt!286575 e!355793)))

(declare-fun c!70689 () Bool)

(declare-fun lt!286567 () SeekEntryResult!6436)

(assert (=> b!620352 (= c!70689 (= lt!286567 (Found!6436 index!984)))))

(declare-fun lt!286562 () Unit!20557)

(assert (=> b!620352 (= lt!286562 e!355794)))

(declare-fun c!70688 () Bool)

(assert (=> b!620352 (= c!70688 (= lt!286567 Undefined!6436))))

(declare-fun lt!286568 () (_ BitVec 64))

(assert (=> b!620352 (= lt!286567 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!286568 lt!286569 mask!3053))))

(assert (=> b!620352 e!355803))

(declare-fun res!399705 () Bool)

(assert (=> b!620352 (=> (not res!399705) (not e!355803))))

(declare-fun lt!286571 () (_ BitVec 32))

(assert (=> b!620352 (= res!399705 (= lt!286579 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!286571 vacantSpotIndex!68 lt!286568 lt!286569 mask!3053)))))

(assert (=> b!620352 (= lt!286579 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!286571 vacantSpotIndex!68 (select (arr!18040 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!620352 (= lt!286568 (select (store (arr!18040 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!286566 () Unit!20557)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37593 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20557)

(assert (=> b!620352 (= lt!286566 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!286571 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!620352 (= lt!286571 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!620353 () Bool)

(declare-fun Unit!20566 () Unit!20557)

(assert (=> b!620353 (= e!355793 Unit!20566)))

(assert (= (and start!56178 res!399697) b!620335))

(assert (= (and b!620335 res!399703) b!620343))

(assert (= (and b!620343 res!399692) b!620348))

(assert (= (and b!620348 res!399691) b!620334))

(assert (= (and b!620334 res!399693) b!620350))

(assert (= (and b!620350 res!399702) b!620338))

(assert (= (and b!620338 res!399696) b!620331))

(assert (= (and b!620331 res!399706) b!620337))

(assert (= (and b!620337 res!399704) b!620332))

(assert (= (and b!620332 res!399699) b!620330))

(assert (= (and b!620330 res!399701) b!620352))

(assert (= (and b!620352 res!399705) b!620339))

(assert (= (and b!620352 c!70688) b!620341))

(assert (= (and b!620352 (not c!70688)) b!620336))

(assert (= (and b!620352 c!70689) b!620351))

(assert (= (and b!620352 (not c!70689)) b!620353))

(assert (= (and b!620351 res!399694) b!620347))

(assert (= (and b!620347 (not res!399700)) b!620340))

(assert (= (and b!620340 res!399698) b!620346))

(assert (= (and b!620351 c!70691) b!620344))

(assert (= (and b!620351 (not c!70691)) b!620349))

(assert (= (and b!620351 c!70690) b!620342))

(assert (= (and b!620351 (not c!70690)) b!620345))

(assert (= (and b!620342 res!399695) b!620333))

(declare-fun m!596537 () Bool)

(assert (=> start!56178 m!596537))

(declare-fun m!596539 () Bool)

(assert (=> start!56178 m!596539))

(declare-fun m!596541 () Bool)

(assert (=> b!620337 m!596541))

(declare-fun m!596543 () Bool)

(assert (=> b!620334 m!596543))

(declare-fun m!596545 () Bool)

(assert (=> b!620351 m!596545))

(declare-fun m!596547 () Bool)

(assert (=> b!620351 m!596547))

(declare-fun m!596549 () Bool)

(assert (=> b!620351 m!596549))

(declare-fun m!596551 () Bool)

(assert (=> b!620344 m!596551))

(assert (=> b!620344 m!596549))

(declare-fun m!596553 () Bool)

(assert (=> b!620344 m!596553))

(declare-fun m!596555 () Bool)

(assert (=> b!620344 m!596555))

(assert (=> b!620344 m!596549))

(assert (=> b!620344 m!596549))

(declare-fun m!596557 () Bool)

(assert (=> b!620344 m!596557))

(declare-fun m!596559 () Bool)

(assert (=> b!620344 m!596559))

(assert (=> b!620344 m!596549))

(declare-fun m!596561 () Bool)

(assert (=> b!620344 m!596561))

(declare-fun m!596563 () Bool)

(assert (=> b!620344 m!596563))

(declare-fun m!596565 () Bool)

(assert (=> b!620330 m!596565))

(assert (=> b!620330 m!596549))

(assert (=> b!620330 m!596549))

(declare-fun m!596567 () Bool)

(assert (=> b!620330 m!596567))

(declare-fun m!596569 () Bool)

(assert (=> b!620348 m!596569))

(declare-fun m!596571 () Bool)

(assert (=> b!620350 m!596571))

(assert (=> b!620343 m!596549))

(assert (=> b!620343 m!596549))

(declare-fun m!596573 () Bool)

(assert (=> b!620343 m!596573))

(assert (=> b!620340 m!596549))

(assert (=> b!620340 m!596549))

(declare-fun m!596575 () Bool)

(assert (=> b!620340 m!596575))

(assert (=> b!620332 m!596545))

(declare-fun m!596577 () Bool)

(assert (=> b!620332 m!596577))

(assert (=> b!620342 m!596549))

(assert (=> b!620342 m!596575))

(declare-fun m!596579 () Bool)

(assert (=> b!620342 m!596579))

(assert (=> b!620342 m!596549))

(declare-fun m!596581 () Bool)

(assert (=> b!620342 m!596581))

(declare-fun m!596583 () Bool)

(assert (=> b!620342 m!596583))

(assert (=> b!620342 m!596563))

(assert (=> b!620342 m!596555))

(assert (=> b!620342 m!596549))

(assert (=> b!620342 m!596549))

(declare-fun m!596585 () Bool)

(assert (=> b!620342 m!596585))

(assert (=> b!620342 m!596549))

(declare-fun m!596587 () Bool)

(assert (=> b!620342 m!596587))

(declare-fun m!596589 () Bool)

(assert (=> b!620352 m!596589))

(assert (=> b!620352 m!596549))

(assert (=> b!620352 m!596545))

(declare-fun m!596591 () Bool)

(assert (=> b!620352 m!596591))

(assert (=> b!620352 m!596549))

(declare-fun m!596593 () Bool)

(assert (=> b!620352 m!596593))

(declare-fun m!596595 () Bool)

(assert (=> b!620352 m!596595))

(declare-fun m!596597 () Bool)

(assert (=> b!620352 m!596597))

(declare-fun m!596599 () Bool)

(assert (=> b!620352 m!596599))

(declare-fun m!596601 () Bool)

(assert (=> b!620338 m!596601))

(assert (=> b!620333 m!596549))

(assert (=> b!620333 m!596549))

(declare-fun m!596603 () Bool)

(assert (=> b!620333 m!596603))

(assert (=> b!620346 m!596549))

(assert (=> b!620346 m!596549))

(assert (=> b!620346 m!596603))

(declare-fun m!596605 () Bool)

(assert (=> b!620331 m!596605))

(check-sat (not b!620348) (not b!620331) (not b!620352) (not b!620340) (not b!620350) (not b!620343) (not b!620334) (not start!56178) (not b!620338) (not b!620330) (not b!620333) (not b!620346) (not b!620342) (not b!620344))
(check-sat)
