; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59328 () Bool)

(assert start!59328)

(declare-fun b!654382 () Bool)

(declare-datatypes ((Unit!22410 0))(
  ( (Unit!22411) )
))
(declare-fun e!375779 () Unit!22410)

(declare-fun Unit!22412 () Unit!22410)

(assert (=> b!654382 (= e!375779 Unit!22412)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!304822 () Unit!22410)

(declare-datatypes ((array!38648 0))(
  ( (array!38649 (arr!18524 (Array (_ BitVec 32) (_ BitVec 64))) (size!18888 (_ BitVec 32))) )
))
(declare-fun lt!304816 () array!38648)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!38648)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38648 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22410)

(assert (=> b!654382 (= lt!304822 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!304816 (select (arr!18524 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun arrayContainsKey!0 (array!38648 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!654382 (arrayContainsKey!0 lt!304816 (select (arr!18524 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!304811 () Unit!22410)

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((List!12565 0))(
  ( (Nil!12562) (Cons!12561 (h!13606 (_ BitVec 64)) (t!18793 List!12565)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38648 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12565) Unit!22410)

(assert (=> b!654382 (= lt!304811 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12562))))

(declare-fun arrayNoDuplicates!0 (array!38648 (_ BitVec 32) List!12565) Bool)

(assert (=> b!654382 (arrayNoDuplicates!0 lt!304816 #b00000000000000000000000000000000 Nil!12562)))

(declare-fun lt!304820 () Unit!22410)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38648 (_ BitVec 32) (_ BitVec 32)) Unit!22410)

(assert (=> b!654382 (= lt!304820 (lemmaNoDuplicateFromThenFromBigger!0 lt!304816 #b00000000000000000000000000000000 j!136))))

(assert (=> b!654382 (arrayNoDuplicates!0 lt!304816 j!136 Nil!12562)))

(declare-fun lt!304817 () Unit!22410)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38648 (_ BitVec 64) (_ BitVec 32) List!12565) Unit!22410)

(assert (=> b!654382 (= lt!304817 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!304816 (select (arr!18524 a!2986) j!136) j!136 Nil!12562))))

(assert (=> b!654382 false))

(declare-fun b!654383 () Bool)

(declare-fun e!375777 () Bool)

(assert (=> b!654383 (= e!375777 (arrayContainsKey!0 lt!304816 (select (arr!18524 a!2986) j!136) index!984))))

(declare-fun b!654385 () Bool)

(declare-fun e!375786 () Bool)

(declare-fun e!375773 () Bool)

(assert (=> b!654385 (= e!375786 e!375773)))

(declare-fun res!424438 () Bool)

(assert (=> b!654385 (=> res!424438 e!375773)))

(assert (=> b!654385 (= res!424438 (bvsge index!984 j!136))))

(declare-fun lt!304818 () Unit!22410)

(assert (=> b!654385 (= lt!304818 e!375779)))

(declare-fun c!75343 () Bool)

(assert (=> b!654385 (= c!75343 (bvslt j!136 index!984))))

(declare-fun b!654386 () Bool)

(assert (=> b!654386 (= e!375773 true)))

(assert (=> b!654386 false))

(declare-fun lt!304804 () Unit!22410)

(assert (=> b!654386 (= lt!304804 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!304816 (select (arr!18524 a!2986) j!136) index!984 Nil!12562))))

(assert (=> b!654386 (arrayNoDuplicates!0 lt!304816 index!984 Nil!12562)))

(declare-fun lt!304806 () Unit!22410)

(assert (=> b!654386 (= lt!304806 (lemmaNoDuplicateFromThenFromBigger!0 lt!304816 #b00000000000000000000000000000000 index!984))))

(assert (=> b!654386 (arrayNoDuplicates!0 lt!304816 #b00000000000000000000000000000000 Nil!12562)))

(declare-fun lt!304814 () Unit!22410)

(assert (=> b!654386 (= lt!304814 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12562))))

(assert (=> b!654386 (arrayContainsKey!0 lt!304816 (select (arr!18524 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!304808 () Unit!22410)

(assert (=> b!654386 (= lt!304808 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!304816 (select (arr!18524 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!654386 e!375777))

(declare-fun res!424443 () Bool)

(assert (=> b!654386 (=> (not res!424443) (not e!375777))))

(assert (=> b!654386 (= res!424443 (arrayContainsKey!0 lt!304816 (select (arr!18524 a!2986) j!136) j!136))))

(declare-fun b!654387 () Bool)

(declare-fun e!375785 () Bool)

(declare-fun e!375775 () Bool)

(assert (=> b!654387 (= e!375785 e!375775)))

(declare-fun res!424430 () Bool)

(assert (=> b!654387 (=> res!424430 e!375775)))

(declare-fun lt!304813 () (_ BitVec 64))

(declare-fun lt!304809 () (_ BitVec 64))

(assert (=> b!654387 (= res!424430 (or (not (= (select (arr!18524 a!2986) j!136) lt!304809)) (not (= (select (arr!18524 a!2986) j!136) lt!304813)) (bvsge j!136 index!984)))))

(declare-fun b!654388 () Bool)

(declare-fun Unit!22413 () Unit!22410)

(assert (=> b!654388 (= e!375779 Unit!22413)))

(declare-fun b!654389 () Bool)

(declare-fun res!424444 () Bool)

(declare-fun e!375776 () Bool)

(assert (=> b!654389 (=> (not res!424444) (not e!375776))))

(assert (=> b!654389 (= res!424444 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12562))))

(declare-fun b!654390 () Bool)

(declare-fun e!375782 () Bool)

(assert (=> b!654390 (= e!375782 e!375786)))

(declare-fun res!424431 () Bool)

(assert (=> b!654390 (=> res!424431 e!375786)))

(assert (=> b!654390 (= res!424431 (or (not (= (select (arr!18524 a!2986) j!136) lt!304809)) (not (= (select (arr!18524 a!2986) j!136) lt!304813))))))

(assert (=> b!654390 e!375785))

(declare-fun res!424440 () Bool)

(assert (=> b!654390 (=> (not res!424440) (not e!375785))))

(assert (=> b!654390 (= res!424440 (= lt!304813 (select (arr!18524 a!2986) j!136)))))

(assert (=> b!654390 (= lt!304813 (select (store (arr!18524 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!654391 () Bool)

(declare-fun res!424445 () Bool)

(assert (=> b!654391 (=> (not res!424445) (not e!375776))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!654391 (= res!424445 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18524 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!654392 () Bool)

(declare-fun e!375784 () Bool)

(assert (=> b!654392 (= e!375776 e!375784)))

(declare-fun res!424437 () Bool)

(assert (=> b!654392 (=> (not res!424437) (not e!375784))))

(assert (=> b!654392 (= res!424437 (= (select (store (arr!18524 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!654392 (= lt!304816 (array!38649 (store (arr!18524 a!2986) i!1108 k!1786) (size!18888 a!2986)))))

(declare-fun b!654393 () Bool)

(declare-fun e!375781 () Bool)

(assert (=> b!654393 (= e!375781 e!375776)))

(declare-fun res!424448 () Bool)

(assert (=> b!654393 (=> (not res!424448) (not e!375776))))

(declare-datatypes ((SeekEntryResult!6964 0))(
  ( (MissingZero!6964 (index!30215 (_ BitVec 32))) (Found!6964 (index!30216 (_ BitVec 32))) (Intermediate!6964 (undefined!7776 Bool) (index!30217 (_ BitVec 32)) (x!59005 (_ BitVec 32))) (Undefined!6964) (MissingVacant!6964 (index!30218 (_ BitVec 32))) )
))
(declare-fun lt!304807 () SeekEntryResult!6964)

(assert (=> b!654393 (= res!424448 (or (= lt!304807 (MissingZero!6964 i!1108)) (= lt!304807 (MissingVacant!6964 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38648 (_ BitVec 32)) SeekEntryResult!6964)

(assert (=> b!654393 (= lt!304807 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!654384 () Bool)

(declare-fun res!424446 () Bool)

(assert (=> b!654384 (=> (not res!424446) (not e!375781))))

(assert (=> b!654384 (= res!424446 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun res!424441 () Bool)

(assert (=> start!59328 (=> (not res!424441) (not e!375781))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59328 (= res!424441 (validMask!0 mask!3053))))

(assert (=> start!59328 e!375781))

(assert (=> start!59328 true))

(declare-fun array_inv!14320 (array!38648) Bool)

(assert (=> start!59328 (array_inv!14320 a!2986)))

(declare-fun b!654394 () Bool)

(declare-fun e!375783 () Bool)

(assert (=> b!654394 (= e!375784 e!375783)))

(declare-fun res!424447 () Bool)

(assert (=> b!654394 (=> (not res!424447) (not e!375783))))

(declare-fun lt!304805 () SeekEntryResult!6964)

(assert (=> b!654394 (= res!424447 (and (= lt!304805 (Found!6964 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18524 a!2986) index!984) (select (arr!18524 a!2986) j!136))) (not (= (select (arr!18524 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38648 (_ BitVec 32)) SeekEntryResult!6964)

(assert (=> b!654394 (= lt!304805 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18524 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!654395 () Bool)

(declare-fun e!375778 () Bool)

(assert (=> b!654395 (= e!375778 (arrayContainsKey!0 lt!304816 (select (arr!18524 a!2986) j!136) index!984))))

(declare-fun b!654396 () Bool)

(assert (=> b!654396 (= e!375783 (not e!375782))))

(declare-fun res!424434 () Bool)

(assert (=> b!654396 (=> res!424434 e!375782)))

(declare-fun lt!304821 () SeekEntryResult!6964)

(assert (=> b!654396 (= res!424434 (not (= lt!304821 (Found!6964 index!984))))))

(declare-fun lt!304810 () Unit!22410)

(declare-fun e!375780 () Unit!22410)

(assert (=> b!654396 (= lt!304810 e!375780)))

(declare-fun c!75344 () Bool)

(assert (=> b!654396 (= c!75344 (= lt!304821 Undefined!6964))))

(assert (=> b!654396 (= lt!304821 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!304809 lt!304816 mask!3053))))

(declare-fun e!375774 () Bool)

(assert (=> b!654396 e!375774))

(declare-fun res!424439 () Bool)

(assert (=> b!654396 (=> (not res!424439) (not e!375774))))

(declare-fun lt!304812 () SeekEntryResult!6964)

(declare-fun lt!304815 () (_ BitVec 32))

(assert (=> b!654396 (= res!424439 (= lt!304812 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!304815 vacantSpotIndex!68 lt!304809 lt!304816 mask!3053)))))

(assert (=> b!654396 (= lt!304812 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!304815 vacantSpotIndex!68 (select (arr!18524 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!654396 (= lt!304809 (select (store (arr!18524 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!304819 () Unit!22410)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38648 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22410)

(assert (=> b!654396 (= lt!304819 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!304815 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!654396 (= lt!304815 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!654397 () Bool)

(declare-fun res!424433 () Bool)

(assert (=> b!654397 (=> (not res!424433) (not e!375781))))

(assert (=> b!654397 (= res!424433 (and (= (size!18888 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18888 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18888 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!654398 () Bool)

(declare-fun res!424442 () Bool)

(assert (=> b!654398 (=> (not res!424442) (not e!375781))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!654398 (= res!424442 (validKeyInArray!0 (select (arr!18524 a!2986) j!136)))))

(declare-fun b!654399 () Bool)

(declare-fun Unit!22414 () Unit!22410)

(assert (=> b!654399 (= e!375780 Unit!22414)))

(declare-fun b!654400 () Bool)

(declare-fun Unit!22415 () Unit!22410)

(assert (=> b!654400 (= e!375780 Unit!22415)))

(assert (=> b!654400 false))

(declare-fun b!654401 () Bool)

(declare-fun res!424436 () Bool)

(assert (=> b!654401 (=> (not res!424436) (not e!375781))))

(assert (=> b!654401 (= res!424436 (validKeyInArray!0 k!1786))))

(declare-fun b!654402 () Bool)

(assert (=> b!654402 (= e!375774 (= lt!304805 lt!304812))))

(declare-fun b!654403 () Bool)

(assert (=> b!654403 (= e!375775 e!375778)))

(declare-fun res!424432 () Bool)

(assert (=> b!654403 (=> (not res!424432) (not e!375778))))

(assert (=> b!654403 (= res!424432 (arrayContainsKey!0 lt!304816 (select (arr!18524 a!2986) j!136) j!136))))

(declare-fun b!654404 () Bool)

(declare-fun res!424435 () Bool)

(assert (=> b!654404 (=> (not res!424435) (not e!375776))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38648 (_ BitVec 32)) Bool)

(assert (=> b!654404 (= res!424435 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!59328 res!424441) b!654397))

(assert (= (and b!654397 res!424433) b!654398))

(assert (= (and b!654398 res!424442) b!654401))

(assert (= (and b!654401 res!424436) b!654384))

(assert (= (and b!654384 res!424446) b!654393))

(assert (= (and b!654393 res!424448) b!654404))

(assert (= (and b!654404 res!424435) b!654389))

(assert (= (and b!654389 res!424444) b!654391))

(assert (= (and b!654391 res!424445) b!654392))

(assert (= (and b!654392 res!424437) b!654394))

(assert (= (and b!654394 res!424447) b!654396))

(assert (= (and b!654396 res!424439) b!654402))

(assert (= (and b!654396 c!75344) b!654400))

(assert (= (and b!654396 (not c!75344)) b!654399))

(assert (= (and b!654396 (not res!424434)) b!654390))

(assert (= (and b!654390 res!424440) b!654387))

(assert (= (and b!654387 (not res!424430)) b!654403))

(assert (= (and b!654403 res!424432) b!654395))

(assert (= (and b!654390 (not res!424431)) b!654385))

(assert (= (and b!654385 c!75343) b!654382))

(assert (= (and b!654385 (not c!75343)) b!654388))

(assert (= (and b!654385 (not res!424438)) b!654386))

(assert (= (and b!654386 res!424443) b!654383))

(declare-fun m!627487 () Bool)

(assert (=> b!654387 m!627487))

(declare-fun m!627489 () Bool)

(assert (=> b!654391 m!627489))

(assert (=> b!654398 m!627487))

(assert (=> b!654398 m!627487))

(declare-fun m!627491 () Bool)

(assert (=> b!654398 m!627491))

(assert (=> b!654390 m!627487))

(declare-fun m!627493 () Bool)

(assert (=> b!654390 m!627493))

(declare-fun m!627495 () Bool)

(assert (=> b!654390 m!627495))

(assert (=> b!654403 m!627487))

(assert (=> b!654403 m!627487))

(declare-fun m!627497 () Bool)

(assert (=> b!654403 m!627497))

(declare-fun m!627499 () Bool)

(assert (=> b!654394 m!627499))

(assert (=> b!654394 m!627487))

(assert (=> b!654394 m!627487))

(declare-fun m!627501 () Bool)

(assert (=> b!654394 m!627501))

(assert (=> b!654383 m!627487))

(assert (=> b!654383 m!627487))

(declare-fun m!627503 () Bool)

(assert (=> b!654383 m!627503))

(declare-fun m!627505 () Bool)

(assert (=> b!654404 m!627505))

(declare-fun m!627507 () Bool)

(assert (=> b!654396 m!627507))

(declare-fun m!627509 () Bool)

(assert (=> b!654396 m!627509))

(declare-fun m!627511 () Bool)

(assert (=> b!654396 m!627511))

(assert (=> b!654396 m!627487))

(declare-fun m!627513 () Bool)

(assert (=> b!654396 m!627513))

(assert (=> b!654396 m!627487))

(assert (=> b!654396 m!627493))

(declare-fun m!627515 () Bool)

(assert (=> b!654396 m!627515))

(declare-fun m!627517 () Bool)

(assert (=> b!654396 m!627517))

(assert (=> b!654395 m!627487))

(assert (=> b!654395 m!627487))

(assert (=> b!654395 m!627503))

(declare-fun m!627519 () Bool)

(assert (=> b!654389 m!627519))

(declare-fun m!627521 () Bool)

(assert (=> b!654393 m!627521))

(assert (=> b!654382 m!627487))

(declare-fun m!627523 () Bool)

(assert (=> b!654382 m!627523))

(assert (=> b!654382 m!627487))

(declare-fun m!627525 () Bool)

(assert (=> b!654382 m!627525))

(assert (=> b!654382 m!627487))

(declare-fun m!627527 () Bool)

(assert (=> b!654382 m!627527))

(declare-fun m!627529 () Bool)

(assert (=> b!654382 m!627529))

(assert (=> b!654382 m!627487))

(declare-fun m!627531 () Bool)

(assert (=> b!654382 m!627531))

(declare-fun m!627533 () Bool)

(assert (=> b!654382 m!627533))

(declare-fun m!627535 () Bool)

(assert (=> b!654382 m!627535))

(declare-fun m!627537 () Bool)

(assert (=> b!654386 m!627537))

(assert (=> b!654386 m!627487))

(assert (=> b!654386 m!627487))

(declare-fun m!627539 () Bool)

(assert (=> b!654386 m!627539))

(assert (=> b!654386 m!627525))

(assert (=> b!654386 m!627487))

(declare-fun m!627541 () Bool)

(assert (=> b!654386 m!627541))

(assert (=> b!654386 m!627487))

(declare-fun m!627543 () Bool)

(assert (=> b!654386 m!627543))

(assert (=> b!654386 m!627487))

(assert (=> b!654386 m!627497))

(declare-fun m!627545 () Bool)

(assert (=> b!654386 m!627545))

(assert (=> b!654386 m!627535))

(declare-fun m!627547 () Bool)

(assert (=> start!59328 m!627547))

(declare-fun m!627549 () Bool)

(assert (=> start!59328 m!627549))

(declare-fun m!627551 () Bool)

(assert (=> b!654401 m!627551))

(declare-fun m!627553 () Bool)

(assert (=> b!654384 m!627553))

(assert (=> b!654392 m!627493))

(declare-fun m!627555 () Bool)

(assert (=> b!654392 m!627555))

(push 1)

