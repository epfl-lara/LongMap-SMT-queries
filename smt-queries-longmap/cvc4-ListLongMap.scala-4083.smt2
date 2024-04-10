; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56000 () Bool)

(assert start!56000)

(declare-fun b!615360 () Bool)

(declare-fun e!352821 () Bool)

(declare-fun e!352832 () Bool)

(assert (=> b!615360 (= e!352821 e!352832)))

(declare-fun res!396374 () Bool)

(assert (=> b!615360 (=> (not res!396374) (not e!352832))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!37470 0))(
  ( (array!37471 (arr!17981 (Array (_ BitVec 32) (_ BitVec 64))) (size!18345 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37470)

(assert (=> b!615360 (= res!396374 (= (select (store (arr!17981 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!282624 () array!37470)

(assert (=> b!615360 (= lt!282624 (array!37471 (store (arr!17981 a!2986) i!1108 k!1786) (size!18345 a!2986)))))

(declare-fun b!615361 () Bool)

(declare-datatypes ((Unit!19938 0))(
  ( (Unit!19939) )
))
(declare-fun e!352827 () Unit!19938)

(declare-fun Unit!19940 () Unit!19938)

(assert (=> b!615361 (= e!352827 Unit!19940)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun res!396367 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!615361 (= res!396367 (= (select (store (arr!17981 a!2986) i!1108 k!1786) index!984) (select (arr!17981 a!2986) j!136)))))

(declare-fun e!352820 () Bool)

(assert (=> b!615361 (=> (not res!396367) (not e!352820))))

(assert (=> b!615361 e!352820))

(declare-fun c!69868 () Bool)

(assert (=> b!615361 (= c!69868 (bvslt j!136 index!984))))

(declare-fun lt!282625 () Unit!19938)

(declare-fun e!352825 () Unit!19938)

(assert (=> b!615361 (= lt!282625 e!352825)))

(declare-fun c!69867 () Bool)

(assert (=> b!615361 (= c!69867 (bvslt index!984 j!136))))

(declare-fun lt!282622 () Unit!19938)

(declare-fun e!352828 () Unit!19938)

(assert (=> b!615361 (= lt!282622 e!352828)))

(assert (=> b!615361 false))

(declare-fun b!615362 () Bool)

(declare-fun res!396373 () Bool)

(declare-fun e!352829 () Bool)

(assert (=> b!615362 (=> (not res!396373) (not e!352829))))

(declare-fun arrayContainsKey!0 (array!37470 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!615362 (= res!396373 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!615363 () Bool)

(assert (=> b!615363 (= e!352829 e!352821)))

(declare-fun res!396362 () Bool)

(assert (=> b!615363 (=> (not res!396362) (not e!352821))))

(declare-datatypes ((SeekEntryResult!6421 0))(
  ( (MissingZero!6421 (index!27968 (_ BitVec 32))) (Found!6421 (index!27969 (_ BitVec 32))) (Intermediate!6421 (undefined!7233 Bool) (index!27970 (_ BitVec 32)) (x!56765 (_ BitVec 32))) (Undefined!6421) (MissingVacant!6421 (index!27971 (_ BitVec 32))) )
))
(declare-fun lt!282632 () SeekEntryResult!6421)

(assert (=> b!615363 (= res!396362 (or (= lt!282632 (MissingZero!6421 i!1108)) (= lt!282632 (MissingVacant!6421 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37470 (_ BitVec 32)) SeekEntryResult!6421)

(assert (=> b!615363 (= lt!282632 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!615364 () Bool)

(declare-fun e!352833 () Bool)

(assert (=> b!615364 (= e!352833 (arrayContainsKey!0 lt!282624 (select (arr!17981 a!2986) j!136) index!984))))

(declare-fun b!615365 () Bool)

(declare-fun res!396364 () Bool)

(assert (=> b!615365 (=> (not res!396364) (not e!352821))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37470 (_ BitVec 32)) Bool)

(assert (=> b!615365 (= res!396364 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!396366 () Bool)

(assert (=> start!56000 (=> (not res!396366) (not e!352829))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56000 (= res!396366 (validMask!0 mask!3053))))

(assert (=> start!56000 e!352829))

(assert (=> start!56000 true))

(declare-fun array_inv!13777 (array!37470) Bool)

(assert (=> start!56000 (array_inv!13777 a!2986)))

(declare-fun b!615366 () Bool)

(declare-fun res!396375 () Bool)

(assert (=> b!615366 (= res!396375 (bvsge j!136 index!984))))

(declare-fun e!352826 () Bool)

(assert (=> b!615366 (=> res!396375 e!352826)))

(assert (=> b!615366 (= e!352820 e!352826)))

(declare-fun b!615367 () Bool)

(declare-fun e!352823 () Bool)

(assert (=> b!615367 (= e!352832 e!352823)))

(declare-fun res!396363 () Bool)

(assert (=> b!615367 (=> (not res!396363) (not e!352823))))

(declare-fun lt!282630 () SeekEntryResult!6421)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!615367 (= res!396363 (and (= lt!282630 (Found!6421 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17981 a!2986) index!984) (select (arr!17981 a!2986) j!136))) (not (= (select (arr!17981 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37470 (_ BitVec 32)) SeekEntryResult!6421)

(assert (=> b!615367 (= lt!282630 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17981 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!615368 () Bool)

(declare-fun Unit!19941 () Unit!19938)

(assert (=> b!615368 (= e!352828 Unit!19941)))

(declare-fun b!615369 () Bool)

(declare-fun res!396369 () Bool)

(assert (=> b!615369 (=> (not res!396369) (not e!352829))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!615369 (= res!396369 (validKeyInArray!0 k!1786))))

(declare-fun b!615370 () Bool)

(declare-fun e!352824 () Unit!19938)

(declare-fun Unit!19942 () Unit!19938)

(assert (=> b!615370 (= e!352824 Unit!19942)))

(assert (=> b!615370 false))

(declare-fun b!615371 () Bool)

(declare-fun res!396371 () Bool)

(assert (=> b!615371 (=> (not res!396371) (not e!352829))))

(assert (=> b!615371 (= res!396371 (and (= (size!18345 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18345 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18345 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!615372 () Bool)

(assert (=> b!615372 false))

(declare-fun lt!282618 () Unit!19938)

(declare-datatypes ((List!12022 0))(
  ( (Nil!12019) (Cons!12018 (h!13063 (_ BitVec 64)) (t!18250 List!12022)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37470 (_ BitVec 64) (_ BitVec 32) List!12022) Unit!19938)

(assert (=> b!615372 (= lt!282618 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!282624 (select (arr!17981 a!2986) j!136) index!984 Nil!12019))))

(declare-fun arrayNoDuplicates!0 (array!37470 (_ BitVec 32) List!12022) Bool)

(assert (=> b!615372 (arrayNoDuplicates!0 lt!282624 index!984 Nil!12019)))

(declare-fun lt!282627 () Unit!19938)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37470 (_ BitVec 32) (_ BitVec 32)) Unit!19938)

(assert (=> b!615372 (= lt!282627 (lemmaNoDuplicateFromThenFromBigger!0 lt!282624 #b00000000000000000000000000000000 index!984))))

(assert (=> b!615372 (arrayNoDuplicates!0 lt!282624 #b00000000000000000000000000000000 Nil!12019)))

(declare-fun lt!282635 () Unit!19938)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37470 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12022) Unit!19938)

(assert (=> b!615372 (= lt!282635 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12019))))

(assert (=> b!615372 (arrayContainsKey!0 lt!282624 (select (arr!17981 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!282634 () Unit!19938)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37470 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19938)

(assert (=> b!615372 (= lt!282634 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!282624 (select (arr!17981 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!615372 e!352833))

(declare-fun res!396372 () Bool)

(assert (=> b!615372 (=> (not res!396372) (not e!352833))))

(assert (=> b!615372 (= res!396372 (arrayContainsKey!0 lt!282624 (select (arr!17981 a!2986) j!136) j!136))))

(declare-fun Unit!19943 () Unit!19938)

(assert (=> b!615372 (= e!352828 Unit!19943)))

(declare-fun b!615373 () Bool)

(declare-fun e!352822 () Bool)

(assert (=> b!615373 (= e!352822 (arrayContainsKey!0 lt!282624 (select (arr!17981 a!2986) j!136) index!984))))

(declare-fun b!615374 () Bool)

(declare-fun res!396377 () Bool)

(assert (=> b!615374 (=> (not res!396377) (not e!352821))))

(assert (=> b!615374 (= res!396377 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12019))))

(declare-fun b!615375 () Bool)

(declare-fun res!396368 () Bool)

(assert (=> b!615375 (=> (not res!396368) (not e!352829))))

(assert (=> b!615375 (= res!396368 (validKeyInArray!0 (select (arr!17981 a!2986) j!136)))))

(declare-fun b!615376 () Bool)

(declare-fun Unit!19944 () Unit!19938)

(assert (=> b!615376 (= e!352827 Unit!19944)))

(declare-fun b!615377 () Bool)

(assert (=> b!615377 (= e!352823 (not true))))

(declare-fun lt!282620 () Unit!19938)

(assert (=> b!615377 (= lt!282620 e!352827)))

(declare-fun c!69866 () Bool)

(declare-fun lt!282633 () SeekEntryResult!6421)

(assert (=> b!615377 (= c!69866 (= lt!282633 (Found!6421 index!984)))))

(declare-fun lt!282628 () Unit!19938)

(assert (=> b!615377 (= lt!282628 e!352824)))

(declare-fun c!69869 () Bool)

(assert (=> b!615377 (= c!69869 (= lt!282633 Undefined!6421))))

(declare-fun lt!282621 () (_ BitVec 64))

(assert (=> b!615377 (= lt!282633 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!282621 lt!282624 mask!3053))))

(declare-fun e!352830 () Bool)

(assert (=> b!615377 e!352830))

(declare-fun res!396365 () Bool)

(assert (=> b!615377 (=> (not res!396365) (not e!352830))))

(declare-fun lt!282629 () (_ BitVec 32))

(declare-fun lt!282623 () SeekEntryResult!6421)

(assert (=> b!615377 (= res!396365 (= lt!282623 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!282629 vacantSpotIndex!68 lt!282621 lt!282624 mask!3053)))))

(assert (=> b!615377 (= lt!282623 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!282629 vacantSpotIndex!68 (select (arr!17981 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!615377 (= lt!282621 (select (store (arr!17981 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!282626 () Unit!19938)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37470 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19938)

(assert (=> b!615377 (= lt!282626 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!282629 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!615377 (= lt!282629 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!615378 () Bool)

(declare-fun Unit!19945 () Unit!19938)

(assert (=> b!615378 (= e!352824 Unit!19945)))

(declare-fun b!615379 () Bool)

(assert (=> b!615379 false))

(declare-fun lt!282636 () Unit!19938)

(assert (=> b!615379 (= lt!282636 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!282624 (select (arr!17981 a!2986) j!136) j!136 Nil!12019))))

(assert (=> b!615379 (arrayNoDuplicates!0 lt!282624 j!136 Nil!12019)))

(declare-fun lt!282637 () Unit!19938)

(assert (=> b!615379 (= lt!282637 (lemmaNoDuplicateFromThenFromBigger!0 lt!282624 #b00000000000000000000000000000000 j!136))))

(assert (=> b!615379 (arrayNoDuplicates!0 lt!282624 #b00000000000000000000000000000000 Nil!12019)))

(declare-fun lt!282619 () Unit!19938)

(assert (=> b!615379 (= lt!282619 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12019))))

(assert (=> b!615379 (arrayContainsKey!0 lt!282624 (select (arr!17981 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!282631 () Unit!19938)

(assert (=> b!615379 (= lt!282631 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!282624 (select (arr!17981 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!19946 () Unit!19938)

(assert (=> b!615379 (= e!352825 Unit!19946)))

(declare-fun res!396376 () Bool)

(declare-fun b!615380 () Bool)

(assert (=> b!615380 (= res!396376 (arrayContainsKey!0 lt!282624 (select (arr!17981 a!2986) j!136) j!136))))

(assert (=> b!615380 (=> (not res!396376) (not e!352822))))

(assert (=> b!615380 (= e!352826 e!352822)))

(declare-fun b!615381 () Bool)

(declare-fun res!396370 () Bool)

(assert (=> b!615381 (=> (not res!396370) (not e!352821))))

(assert (=> b!615381 (= res!396370 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17981 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!615382 () Bool)

(assert (=> b!615382 (= e!352830 (= lt!282630 lt!282623))))

(declare-fun b!615383 () Bool)

(declare-fun Unit!19947 () Unit!19938)

(assert (=> b!615383 (= e!352825 Unit!19947)))

(assert (= (and start!56000 res!396366) b!615371))

(assert (= (and b!615371 res!396371) b!615375))

(assert (= (and b!615375 res!396368) b!615369))

(assert (= (and b!615369 res!396369) b!615362))

(assert (= (and b!615362 res!396373) b!615363))

(assert (= (and b!615363 res!396362) b!615365))

(assert (= (and b!615365 res!396364) b!615374))

(assert (= (and b!615374 res!396377) b!615381))

(assert (= (and b!615381 res!396370) b!615360))

(assert (= (and b!615360 res!396374) b!615367))

(assert (= (and b!615367 res!396363) b!615377))

(assert (= (and b!615377 res!396365) b!615382))

(assert (= (and b!615377 c!69869) b!615370))

(assert (= (and b!615377 (not c!69869)) b!615378))

(assert (= (and b!615377 c!69866) b!615361))

(assert (= (and b!615377 (not c!69866)) b!615376))

(assert (= (and b!615361 res!396367) b!615366))

(assert (= (and b!615366 (not res!396375)) b!615380))

(assert (= (and b!615380 res!396376) b!615373))

(assert (= (and b!615361 c!69868) b!615379))

(assert (= (and b!615361 (not c!69868)) b!615383))

(assert (= (and b!615361 c!69867) b!615372))

(assert (= (and b!615361 (not c!69867)) b!615368))

(assert (= (and b!615372 res!396372) b!615364))

(declare-fun m!591565 () Bool)

(assert (=> b!615374 m!591565))

(declare-fun m!591567 () Bool)

(assert (=> b!615360 m!591567))

(declare-fun m!591569 () Bool)

(assert (=> b!615360 m!591569))

(declare-fun m!591571 () Bool)

(assert (=> b!615364 m!591571))

(assert (=> b!615364 m!591571))

(declare-fun m!591573 () Bool)

(assert (=> b!615364 m!591573))

(declare-fun m!591575 () Bool)

(assert (=> b!615369 m!591575))

(declare-fun m!591577 () Bool)

(assert (=> b!615362 m!591577))

(declare-fun m!591579 () Bool)

(assert (=> b!615367 m!591579))

(assert (=> b!615367 m!591571))

(assert (=> b!615367 m!591571))

(declare-fun m!591581 () Bool)

(assert (=> b!615367 m!591581))

(declare-fun m!591583 () Bool)

(assert (=> b!615381 m!591583))

(declare-fun m!591585 () Bool)

(assert (=> b!615365 m!591585))

(assert (=> b!615375 m!591571))

(assert (=> b!615375 m!591571))

(declare-fun m!591587 () Bool)

(assert (=> b!615375 m!591587))

(assert (=> b!615380 m!591571))

(assert (=> b!615380 m!591571))

(declare-fun m!591589 () Bool)

(assert (=> b!615380 m!591589))

(declare-fun m!591591 () Bool)

(assert (=> start!56000 m!591591))

(declare-fun m!591593 () Bool)

(assert (=> start!56000 m!591593))

(assert (=> b!615373 m!591571))

(assert (=> b!615373 m!591571))

(assert (=> b!615373 m!591573))

(declare-fun m!591595 () Bool)

(assert (=> b!615377 m!591595))

(assert (=> b!615377 m!591571))

(assert (=> b!615377 m!591567))

(declare-fun m!591597 () Bool)

(assert (=> b!615377 m!591597))

(declare-fun m!591599 () Bool)

(assert (=> b!615377 m!591599))

(declare-fun m!591601 () Bool)

(assert (=> b!615377 m!591601))

(declare-fun m!591603 () Bool)

(assert (=> b!615377 m!591603))

(assert (=> b!615377 m!591571))

(declare-fun m!591605 () Bool)

(assert (=> b!615377 m!591605))

(assert (=> b!615361 m!591567))

(declare-fun m!591607 () Bool)

(assert (=> b!615361 m!591607))

(assert (=> b!615361 m!591571))

(declare-fun m!591609 () Bool)

(assert (=> b!615363 m!591609))

(assert (=> b!615379 m!591571))

(declare-fun m!591611 () Bool)

(assert (=> b!615379 m!591611))

(assert (=> b!615379 m!591571))

(declare-fun m!591613 () Bool)

(assert (=> b!615379 m!591613))

(assert (=> b!615379 m!591571))

(declare-fun m!591615 () Bool)

(assert (=> b!615379 m!591615))

(declare-fun m!591617 () Bool)

(assert (=> b!615379 m!591617))

(declare-fun m!591619 () Bool)

(assert (=> b!615379 m!591619))

(assert (=> b!615379 m!591571))

(declare-fun m!591621 () Bool)

(assert (=> b!615379 m!591621))

(declare-fun m!591623 () Bool)

(assert (=> b!615379 m!591623))

(declare-fun m!591625 () Bool)

(assert (=> b!615372 m!591625))

(assert (=> b!615372 m!591571))

(declare-fun m!591627 () Bool)

(assert (=> b!615372 m!591627))

(assert (=> b!615372 m!591571))

(assert (=> b!615372 m!591617))

(assert (=> b!615372 m!591571))

(declare-fun m!591629 () Bool)

(assert (=> b!615372 m!591629))

(assert (=> b!615372 m!591571))

(assert (=> b!615372 m!591589))

(declare-fun m!591631 () Bool)

(assert (=> b!615372 m!591631))

(assert (=> b!615372 m!591571))

(declare-fun m!591633 () Bool)

(assert (=> b!615372 m!591633))

(assert (=> b!615372 m!591623))

(push 1)

