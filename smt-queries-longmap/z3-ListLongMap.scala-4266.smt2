; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59324 () Bool)

(assert start!59324)

(declare-fun res!424523 () Bool)

(declare-fun e!375776 () Bool)

(assert (=> start!59324 (=> (not res!424523) (not e!375776))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59324 (= res!424523 (validMask!0 mask!3053))))

(assert (=> start!59324 e!375776))

(assert (=> start!59324 true))

(declare-datatypes ((array!38655 0))(
  ( (array!38656 (arr!18527 (Array (_ BitVec 32) (_ BitVec 64))) (size!18892 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38655)

(declare-fun array_inv!14410 (array!38655) Bool)

(assert (=> start!59324 (array_inv!14410 a!2986)))

(declare-fun b!654373 () Bool)

(declare-fun res!424527 () Bool)

(assert (=> b!654373 (=> (not res!424527) (not e!375776))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!654373 (= res!424527 (and (= (size!18892 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18892 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18892 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!654374 () Bool)

(declare-fun e!375770 () Bool)

(assert (=> b!654374 (= e!375770 true)))

(assert (=> b!654374 false))

(declare-datatypes ((Unit!22418 0))(
  ( (Unit!22419) )
))
(declare-fun lt!304795 () Unit!22418)

(declare-fun e!375774 () Unit!22418)

(assert (=> b!654374 (= lt!304795 e!375774)))

(declare-fun c!75298 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!654374 (= c!75298 (bvslt index!984 j!136))))

(declare-fun lt!304794 () Unit!22418)

(declare-fun e!375766 () Unit!22418)

(assert (=> b!654374 (= lt!304794 e!375766)))

(declare-fun c!75299 () Bool)

(assert (=> b!654374 (= c!75299 (bvslt j!136 index!984))))

(declare-fun b!654375 () Bool)

(declare-fun res!424526 () Bool)

(assert (=> b!654375 (=> (not res!424526) (not e!375776))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!654375 (= res!424526 (validKeyInArray!0 k0!1786))))

(declare-fun b!654376 () Bool)

(declare-fun res!424516 () Bool)

(declare-fun e!375769 () Bool)

(assert (=> b!654376 (=> (not res!424516) (not e!375769))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38655 (_ BitVec 32)) Bool)

(assert (=> b!654376 (= res!424516 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!654377 () Bool)

(declare-fun Unit!22420 () Unit!22418)

(assert (=> b!654377 (= e!375766 Unit!22420)))

(declare-fun b!654378 () Bool)

(declare-fun e!375767 () Bool)

(assert (=> b!654378 (= e!375767 e!375770)))

(declare-fun res!424518 () Bool)

(assert (=> b!654378 (=> res!424518 e!375770)))

(declare-fun lt!304792 () (_ BitVec 64))

(declare-fun lt!304791 () (_ BitVec 64))

(assert (=> b!654378 (= res!424518 (or (not (= (select (arr!18527 a!2986) j!136) lt!304791)) (not (= (select (arr!18527 a!2986) j!136) lt!304792))))))

(declare-fun e!375762 () Bool)

(assert (=> b!654378 e!375762))

(declare-fun res!424522 () Bool)

(assert (=> b!654378 (=> (not res!424522) (not e!375762))))

(assert (=> b!654378 (= res!424522 (= lt!304792 (select (arr!18527 a!2986) j!136)))))

(assert (=> b!654378 (= lt!304792 (select (store (arr!18527 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!654379 () Bool)

(declare-fun e!375763 () Bool)

(assert (=> b!654379 (= e!375762 e!375763)))

(declare-fun res!424521 () Bool)

(assert (=> b!654379 (=> res!424521 e!375763)))

(assert (=> b!654379 (= res!424521 (or (not (= (select (arr!18527 a!2986) j!136) lt!304791)) (not (= (select (arr!18527 a!2986) j!136) lt!304792)) (bvsge j!136 index!984)))))

(declare-fun b!654380 () Bool)

(declare-fun e!375765 () Unit!22418)

(declare-fun Unit!22421 () Unit!22418)

(assert (=> b!654380 (= e!375765 Unit!22421)))

(declare-fun b!654381 () Bool)

(declare-fun res!424513 () Bool)

(assert (=> b!654381 (=> (not res!424513) (not e!375769))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!654381 (= res!424513 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18527 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!654382 () Bool)

(declare-fun Unit!22422 () Unit!22418)

(assert (=> b!654382 (= e!375766 Unit!22422)))

(declare-fun lt!304804 () Unit!22418)

(declare-fun lt!304788 () array!38655)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38655 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22418)

(assert (=> b!654382 (= lt!304804 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!304788 (select (arr!18527 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun arrayContainsKey!0 (array!38655 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!654382 (arrayContainsKey!0 lt!304788 (select (arr!18527 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!304802 () Unit!22418)

(declare-datatypes ((List!12607 0))(
  ( (Nil!12604) (Cons!12603 (h!13648 (_ BitVec 64)) (t!18826 List!12607)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38655 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12607) Unit!22418)

(assert (=> b!654382 (= lt!304802 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12604))))

(declare-fun arrayNoDuplicates!0 (array!38655 (_ BitVec 32) List!12607) Bool)

(assert (=> b!654382 (arrayNoDuplicates!0 lt!304788 #b00000000000000000000000000000000 Nil!12604)))

(declare-fun lt!304801 () Unit!22418)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38655 (_ BitVec 32) (_ BitVec 32)) Unit!22418)

(assert (=> b!654382 (= lt!304801 (lemmaNoDuplicateFromThenFromBigger!0 lt!304788 #b00000000000000000000000000000000 j!136))))

(assert (=> b!654382 (arrayNoDuplicates!0 lt!304788 j!136 Nil!12604)))

(declare-fun lt!304790 () Unit!22418)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38655 (_ BitVec 64) (_ BitVec 32) List!12607) Unit!22418)

(assert (=> b!654382 (= lt!304790 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!304788 (select (arr!18527 a!2986) j!136) j!136 Nil!12604))))

(assert (=> b!654382 false))

(declare-fun b!654383 () Bool)

(declare-fun e!375768 () Bool)

(assert (=> b!654383 (= e!375768 (arrayContainsKey!0 lt!304788 (select (arr!18527 a!2986) j!136) index!984))))

(declare-fun b!654384 () Bool)

(assert (=> b!654384 (= e!375776 e!375769)))

(declare-fun res!424511 () Bool)

(assert (=> b!654384 (=> (not res!424511) (not e!375769))))

(declare-datatypes ((SeekEntryResult!6964 0))(
  ( (MissingZero!6964 (index!30215 (_ BitVec 32))) (Found!6964 (index!30216 (_ BitVec 32))) (Intermediate!6964 (undefined!7776 Bool) (index!30217 (_ BitVec 32)) (x!59016 (_ BitVec 32))) (Undefined!6964) (MissingVacant!6964 (index!30218 (_ BitVec 32))) )
))
(declare-fun lt!304803 () SeekEntryResult!6964)

(assert (=> b!654384 (= res!424511 (or (= lt!304803 (MissingZero!6964 i!1108)) (= lt!304803 (MissingVacant!6964 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38655 (_ BitVec 32)) SeekEntryResult!6964)

(assert (=> b!654384 (= lt!304803 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!654385 () Bool)

(declare-fun res!424517 () Bool)

(assert (=> b!654385 (=> (not res!424517) (not e!375776))))

(assert (=> b!654385 (= res!424517 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun e!375775 () Bool)

(declare-fun b!654386 () Bool)

(assert (=> b!654386 (= e!375775 (arrayContainsKey!0 lt!304788 (select (arr!18527 a!2986) j!136) index!984))))

(declare-fun b!654387 () Bool)

(assert (=> b!654387 (= e!375763 e!375768)))

(declare-fun res!424515 () Bool)

(assert (=> b!654387 (=> (not res!424515) (not e!375768))))

(assert (=> b!654387 (= res!424515 (arrayContainsKey!0 lt!304788 (select (arr!18527 a!2986) j!136) j!136))))

(declare-fun b!654388 () Bool)

(declare-fun res!424512 () Bool)

(assert (=> b!654388 (=> (not res!424512) (not e!375776))))

(assert (=> b!654388 (= res!424512 (validKeyInArray!0 (select (arr!18527 a!2986) j!136)))))

(declare-fun b!654389 () Bool)

(declare-fun e!375772 () Bool)

(assert (=> b!654389 (= e!375772 (not e!375767))))

(declare-fun res!424519 () Bool)

(assert (=> b!654389 (=> res!424519 e!375767)))

(declare-fun lt!304793 () SeekEntryResult!6964)

(assert (=> b!654389 (= res!424519 (not (= lt!304793 (Found!6964 index!984))))))

(declare-fun lt!304800 () Unit!22418)

(assert (=> b!654389 (= lt!304800 e!375765)))

(declare-fun c!75300 () Bool)

(assert (=> b!654389 (= c!75300 (= lt!304793 Undefined!6964))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38655 (_ BitVec 32)) SeekEntryResult!6964)

(assert (=> b!654389 (= lt!304793 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!304791 lt!304788 mask!3053))))

(declare-fun e!375773 () Bool)

(assert (=> b!654389 e!375773))

(declare-fun res!424520 () Bool)

(assert (=> b!654389 (=> (not res!424520) (not e!375773))))

(declare-fun lt!304806 () SeekEntryResult!6964)

(declare-fun lt!304798 () (_ BitVec 32))

(assert (=> b!654389 (= res!424520 (= lt!304806 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!304798 vacantSpotIndex!68 lt!304791 lt!304788 mask!3053)))))

(assert (=> b!654389 (= lt!304806 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!304798 vacantSpotIndex!68 (select (arr!18527 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!654389 (= lt!304791 (select (store (arr!18527 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!304797 () Unit!22418)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38655 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22418)

(assert (=> b!654389 (= lt!304797 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!304798 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!654389 (= lt!304798 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!654390 () Bool)

(declare-fun e!375764 () Bool)

(assert (=> b!654390 (= e!375769 e!375764)))

(declare-fun res!424514 () Bool)

(assert (=> b!654390 (=> (not res!424514) (not e!375764))))

(assert (=> b!654390 (= res!424514 (= (select (store (arr!18527 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!654390 (= lt!304788 (array!38656 (store (arr!18527 a!2986) i!1108 k0!1786) (size!18892 a!2986)))))

(declare-fun b!654391 () Bool)

(declare-fun lt!304787 () SeekEntryResult!6964)

(assert (=> b!654391 (= e!375773 (= lt!304787 lt!304806))))

(declare-fun b!654392 () Bool)

(declare-fun Unit!22423 () Unit!22418)

(assert (=> b!654392 (= e!375774 Unit!22423)))

(declare-fun b!654393 () Bool)

(declare-fun res!424528 () Bool)

(assert (=> b!654393 (=> (not res!424528) (not e!375769))))

(assert (=> b!654393 (= res!424528 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12604))))

(declare-fun b!654394 () Bool)

(assert (=> b!654394 (= e!375764 e!375772)))

(declare-fun res!424525 () Bool)

(assert (=> b!654394 (=> (not res!424525) (not e!375772))))

(assert (=> b!654394 (= res!424525 (and (= lt!304787 (Found!6964 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18527 a!2986) index!984) (select (arr!18527 a!2986) j!136))) (not (= (select (arr!18527 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!654394 (= lt!304787 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18527 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!654395 () Bool)

(declare-fun Unit!22424 () Unit!22418)

(assert (=> b!654395 (= e!375774 Unit!22424)))

(declare-fun res!424524 () Bool)

(assert (=> b!654395 (= res!424524 (arrayContainsKey!0 lt!304788 (select (arr!18527 a!2986) j!136) j!136))))

(assert (=> b!654395 (=> (not res!424524) (not e!375775))))

(assert (=> b!654395 e!375775))

(declare-fun lt!304796 () Unit!22418)

(assert (=> b!654395 (= lt!304796 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!304788 (select (arr!18527 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!654395 (arrayContainsKey!0 lt!304788 (select (arr!18527 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!304805 () Unit!22418)

(assert (=> b!654395 (= lt!304805 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12604))))

(assert (=> b!654395 (arrayNoDuplicates!0 lt!304788 #b00000000000000000000000000000000 Nil!12604)))

(declare-fun lt!304799 () Unit!22418)

(assert (=> b!654395 (= lt!304799 (lemmaNoDuplicateFromThenFromBigger!0 lt!304788 #b00000000000000000000000000000000 index!984))))

(assert (=> b!654395 (arrayNoDuplicates!0 lt!304788 index!984 Nil!12604)))

(declare-fun lt!304789 () Unit!22418)

(assert (=> b!654395 (= lt!304789 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!304788 (select (arr!18527 a!2986) j!136) index!984 Nil!12604))))

(assert (=> b!654395 false))

(declare-fun b!654396 () Bool)

(declare-fun Unit!22425 () Unit!22418)

(assert (=> b!654396 (= e!375765 Unit!22425)))

(assert (=> b!654396 false))

(assert (= (and start!59324 res!424523) b!654373))

(assert (= (and b!654373 res!424527) b!654388))

(assert (= (and b!654388 res!424512) b!654375))

(assert (= (and b!654375 res!424526) b!654385))

(assert (= (and b!654385 res!424517) b!654384))

(assert (= (and b!654384 res!424511) b!654376))

(assert (= (and b!654376 res!424516) b!654393))

(assert (= (and b!654393 res!424528) b!654381))

(assert (= (and b!654381 res!424513) b!654390))

(assert (= (and b!654390 res!424514) b!654394))

(assert (= (and b!654394 res!424525) b!654389))

(assert (= (and b!654389 res!424520) b!654391))

(assert (= (and b!654389 c!75300) b!654396))

(assert (= (and b!654389 (not c!75300)) b!654380))

(assert (= (and b!654389 (not res!424519)) b!654378))

(assert (= (and b!654378 res!424522) b!654379))

(assert (= (and b!654379 (not res!424521)) b!654387))

(assert (= (and b!654387 res!424515) b!654383))

(assert (= (and b!654378 (not res!424518)) b!654374))

(assert (= (and b!654374 c!75299) b!654382))

(assert (= (and b!654374 (not c!75299)) b!654377))

(assert (= (and b!654374 c!75298) b!654395))

(assert (= (and b!654374 (not c!75298)) b!654392))

(assert (= (and b!654395 res!424524) b!654386))

(declare-fun m!626985 () Bool)

(assert (=> b!654393 m!626985))

(declare-fun m!626987 () Bool)

(assert (=> b!654387 m!626987))

(assert (=> b!654387 m!626987))

(declare-fun m!626989 () Bool)

(assert (=> b!654387 m!626989))

(assert (=> b!654383 m!626987))

(assert (=> b!654383 m!626987))

(declare-fun m!626991 () Bool)

(assert (=> b!654383 m!626991))

(assert (=> b!654378 m!626987))

(declare-fun m!626993 () Bool)

(assert (=> b!654378 m!626993))

(declare-fun m!626995 () Bool)

(assert (=> b!654378 m!626995))

(assert (=> b!654390 m!626993))

(declare-fun m!626997 () Bool)

(assert (=> b!654390 m!626997))

(declare-fun m!626999 () Bool)

(assert (=> b!654389 m!626999))

(declare-fun m!627001 () Bool)

(assert (=> b!654389 m!627001))

(declare-fun m!627003 () Bool)

(assert (=> b!654389 m!627003))

(declare-fun m!627005 () Bool)

(assert (=> b!654389 m!627005))

(declare-fun m!627007 () Bool)

(assert (=> b!654389 m!627007))

(assert (=> b!654389 m!626993))

(assert (=> b!654389 m!626987))

(declare-fun m!627009 () Bool)

(assert (=> b!654389 m!627009))

(assert (=> b!654389 m!626987))

(assert (=> b!654386 m!626987))

(assert (=> b!654386 m!626987))

(assert (=> b!654386 m!626991))

(declare-fun m!627011 () Bool)

(assert (=> b!654376 m!627011))

(assert (=> b!654388 m!626987))

(assert (=> b!654388 m!626987))

(declare-fun m!627013 () Bool)

(assert (=> b!654388 m!627013))

(declare-fun m!627015 () Bool)

(assert (=> b!654375 m!627015))

(declare-fun m!627017 () Bool)

(assert (=> b!654381 m!627017))

(assert (=> b!654379 m!626987))

(declare-fun m!627019 () Bool)

(assert (=> b!654394 m!627019))

(assert (=> b!654394 m!626987))

(assert (=> b!654394 m!626987))

(declare-fun m!627021 () Bool)

(assert (=> b!654394 m!627021))

(assert (=> b!654395 m!626987))

(declare-fun m!627023 () Bool)

(assert (=> b!654395 m!627023))

(assert (=> b!654395 m!626987))

(declare-fun m!627025 () Bool)

(assert (=> b!654395 m!627025))

(declare-fun m!627027 () Bool)

(assert (=> b!654395 m!627027))

(assert (=> b!654395 m!626987))

(declare-fun m!627029 () Bool)

(assert (=> b!654395 m!627029))

(assert (=> b!654395 m!626987))

(assert (=> b!654395 m!626989))

(declare-fun m!627031 () Bool)

(assert (=> b!654395 m!627031))

(assert (=> b!654395 m!626987))

(declare-fun m!627033 () Bool)

(assert (=> b!654395 m!627033))

(declare-fun m!627035 () Bool)

(assert (=> b!654395 m!627035))

(declare-fun m!627037 () Bool)

(assert (=> b!654385 m!627037))

(declare-fun m!627039 () Bool)

(assert (=> b!654384 m!627039))

(assert (=> b!654382 m!626987))

(declare-fun m!627041 () Bool)

(assert (=> b!654382 m!627041))

(assert (=> b!654382 m!627023))

(assert (=> b!654382 m!626987))

(declare-fun m!627043 () Bool)

(assert (=> b!654382 m!627043))

(declare-fun m!627045 () Bool)

(assert (=> b!654382 m!627045))

(assert (=> b!654382 m!626987))

(declare-fun m!627047 () Bool)

(assert (=> b!654382 m!627047))

(assert (=> b!654382 m!627035))

(assert (=> b!654382 m!626987))

(declare-fun m!627049 () Bool)

(assert (=> b!654382 m!627049))

(declare-fun m!627051 () Bool)

(assert (=> start!59324 m!627051))

(declare-fun m!627053 () Bool)

(assert (=> start!59324 m!627053))

(check-sat (not b!654375) (not b!654376) (not b!654395) (not b!654388) (not b!654393) (not b!654384) (not b!654387) (not start!59324) (not b!654394) (not b!654386) (not b!654385) (not b!654389) (not b!654382) (not b!654383))
(check-sat)
