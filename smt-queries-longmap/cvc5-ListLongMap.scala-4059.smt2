; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55582 () Bool)

(assert start!55582)

(declare-fun res!391393 () Bool)

(declare-fun e!348630 () Bool)

(assert (=> start!55582 (=> (not res!391393) (not e!348630))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55582 (= res!391393 (validMask!0 mask!3053))))

(assert (=> start!55582 e!348630))

(assert (=> start!55582 true))

(declare-datatypes ((array!37313 0))(
  ( (array!37314 (arr!17907 (Array (_ BitVec 32) (_ BitVec 64))) (size!18271 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37313)

(declare-fun array_inv!13703 (array!37313) Bool)

(assert (=> start!55582 (array_inv!13703 a!2986)))

(declare-fun b!608754 () Bool)

(declare-fun res!391383 () Bool)

(declare-fun e!348641 () Bool)

(assert (=> b!608754 (=> (not res!391383) (not e!348641))))

(declare-datatypes ((List!11948 0))(
  ( (Nil!11945) (Cons!11944 (h!12989 (_ BitVec 64)) (t!18176 List!11948)) )
))
(declare-fun arrayNoDuplicates!0 (array!37313 (_ BitVec 32) List!11948) Bool)

(assert (=> b!608754 (= res!391383 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11945))))

(declare-fun b!608755 () Bool)

(declare-datatypes ((Unit!19462 0))(
  ( (Unit!19463) )
))
(declare-fun e!348645 () Unit!19462)

(declare-fun Unit!19464 () Unit!19462)

(assert (=> b!608755 (= e!348645 Unit!19464)))

(declare-fun b!608756 () Bool)

(declare-fun res!391379 () Bool)

(declare-fun e!348636 () Bool)

(assert (=> b!608756 (=> res!391379 e!348636)))

(declare-fun contains!3024 (List!11948 (_ BitVec 64)) Bool)

(assert (=> b!608756 (= res!391379 (contains!3024 Nil!11945 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!608757 () Bool)

(declare-fun res!391395 () Bool)

(assert (=> b!608757 (=> (not res!391395) (not e!348641))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!608757 (= res!391395 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17907 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!608758 () Bool)

(declare-fun e!348632 () Unit!19462)

(declare-fun Unit!19465 () Unit!19462)

(assert (=> b!608758 (= e!348632 Unit!19465)))

(assert (=> b!608758 false))

(declare-fun b!608759 () Bool)

(declare-fun res!391389 () Bool)

(assert (=> b!608759 (=> (not res!391389) (not e!348630))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37313 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!608759 (= res!391389 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!608760 () Bool)

(assert (=> b!608760 (= e!348636 true)))

(declare-fun lt!278154 () Bool)

(assert (=> b!608760 (= lt!278154 (contains!3024 Nil!11945 k!1786))))

(declare-fun b!608761 () Bool)

(declare-fun res!391400 () Bool)

(assert (=> b!608761 (=> res!391400 e!348636)))

(assert (=> b!608761 (= res!391400 (contains!3024 Nil!11945 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!608762 () Bool)

(declare-fun res!391396 () Bool)

(assert (=> b!608762 (=> (not res!391396) (not e!348630))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!608762 (= res!391396 (validKeyInArray!0 (select (arr!17907 a!2986) j!136)))))

(declare-fun b!608763 () Bool)

(declare-fun e!348639 () Bool)

(declare-fun e!348637 () Bool)

(assert (=> b!608763 (= e!348639 e!348637)))

(declare-fun res!391382 () Bool)

(assert (=> b!608763 (=> res!391382 e!348637)))

(assert (=> b!608763 (= res!391382 (bvsge index!984 j!136))))

(declare-fun lt!278155 () Unit!19462)

(assert (=> b!608763 (= lt!278155 e!348645)))

(declare-fun c!69055 () Bool)

(assert (=> b!608763 (= c!69055 (bvslt j!136 index!984))))

(declare-fun b!608764 () Bool)

(assert (=> b!608764 (= e!348637 e!348636)))

(declare-fun res!391381 () Bool)

(assert (=> b!608764 (=> res!391381 e!348636)))

(assert (=> b!608764 (= res!391381 (or (bvsge (size!18271 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18271 a!2986))))))

(declare-fun lt!278151 () array!37313)

(assert (=> b!608764 (arrayContainsKey!0 lt!278151 (select (arr!17907 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!278158 () Unit!19462)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37313 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19462)

(assert (=> b!608764 (= lt!278158 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!278151 (select (arr!17907 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!348633 () Bool)

(assert (=> b!608764 e!348633))

(declare-fun res!391385 () Bool)

(assert (=> b!608764 (=> (not res!391385) (not e!348633))))

(assert (=> b!608764 (= res!391385 (arrayContainsKey!0 lt!278151 (select (arr!17907 a!2986) j!136) j!136))))

(declare-fun b!608765 () Bool)

(declare-fun Unit!19466 () Unit!19462)

(assert (=> b!608765 (= e!348632 Unit!19466)))

(declare-fun b!608766 () Bool)

(declare-fun Unit!19467 () Unit!19462)

(assert (=> b!608766 (= e!348645 Unit!19467)))

(declare-fun lt!278167 () Unit!19462)

(assert (=> b!608766 (= lt!278167 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!278151 (select (arr!17907 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!608766 (arrayContainsKey!0 lt!278151 (select (arr!17907 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun lt!278160 () Unit!19462)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37313 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11948) Unit!19462)

(assert (=> b!608766 (= lt!278160 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11945))))

(assert (=> b!608766 (arrayNoDuplicates!0 lt!278151 #b00000000000000000000000000000000 Nil!11945)))

(declare-fun lt!278166 () Unit!19462)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37313 (_ BitVec 32) (_ BitVec 32)) Unit!19462)

(assert (=> b!608766 (= lt!278166 (lemmaNoDuplicateFromThenFromBigger!0 lt!278151 #b00000000000000000000000000000000 j!136))))

(assert (=> b!608766 (arrayNoDuplicates!0 lt!278151 j!136 Nil!11945)))

(declare-fun lt!278163 () Unit!19462)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37313 (_ BitVec 64) (_ BitVec 32) List!11948) Unit!19462)

(assert (=> b!608766 (= lt!278163 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!278151 (select (arr!17907 a!2986) j!136) j!136 Nil!11945))))

(assert (=> b!608766 false))

(declare-fun b!608767 () Bool)

(declare-fun e!348642 () Bool)

(assert (=> b!608767 (= e!348642 (arrayContainsKey!0 lt!278151 (select (arr!17907 a!2986) j!136) index!984))))

(declare-fun b!608768 () Bool)

(assert (=> b!608768 (= e!348630 e!348641)))

(declare-fun res!391399 () Bool)

(assert (=> b!608768 (=> (not res!391399) (not e!348641))))

(declare-datatypes ((SeekEntryResult!6347 0))(
  ( (MissingZero!6347 (index!27663 (_ BitVec 32))) (Found!6347 (index!27664 (_ BitVec 32))) (Intermediate!6347 (undefined!7159 Bool) (index!27665 (_ BitVec 32)) (x!56472 (_ BitVec 32))) (Undefined!6347) (MissingVacant!6347 (index!27666 (_ BitVec 32))) )
))
(declare-fun lt!278159 () SeekEntryResult!6347)

(assert (=> b!608768 (= res!391399 (or (= lt!278159 (MissingZero!6347 i!1108)) (= lt!278159 (MissingVacant!6347 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37313 (_ BitVec 32)) SeekEntryResult!6347)

(assert (=> b!608768 (= lt!278159 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!608769 () Bool)

(declare-fun e!348638 () Bool)

(declare-fun e!348643 () Bool)

(assert (=> b!608769 (= e!348638 e!348643)))

(declare-fun res!391384 () Bool)

(assert (=> b!608769 (=> (not res!391384) (not e!348643))))

(declare-fun lt!278153 () SeekEntryResult!6347)

(assert (=> b!608769 (= res!391384 (and (= lt!278153 (Found!6347 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17907 a!2986) index!984) (select (arr!17907 a!2986) j!136))) (not (= (select (arr!17907 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37313 (_ BitVec 32)) SeekEntryResult!6347)

(assert (=> b!608769 (= lt!278153 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17907 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!608770 () Bool)

(declare-fun res!391378 () Bool)

(assert (=> b!608770 (=> (not res!391378) (not e!348630))))

(assert (=> b!608770 (= res!391378 (and (= (size!18271 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18271 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18271 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!608771 () Bool)

(declare-fun e!348640 () Bool)

(declare-fun lt!278152 () SeekEntryResult!6347)

(assert (=> b!608771 (= e!348640 (= lt!278153 lt!278152))))

(declare-fun b!608772 () Bool)

(declare-fun res!391398 () Bool)

(assert (=> b!608772 (=> (not res!391398) (not e!348630))))

(assert (=> b!608772 (= res!391398 (validKeyInArray!0 k!1786))))

(declare-fun b!608773 () Bool)

(declare-fun e!348635 () Bool)

(assert (=> b!608773 (= e!348635 e!348639)))

(declare-fun res!391387 () Bool)

(assert (=> b!608773 (=> res!391387 e!348639)))

(declare-fun lt!278157 () (_ BitVec 64))

(declare-fun lt!278156 () (_ BitVec 64))

(assert (=> b!608773 (= res!391387 (or (not (= (select (arr!17907 a!2986) j!136) lt!278157)) (not (= (select (arr!17907 a!2986) j!136) lt!278156))))))

(declare-fun e!348631 () Bool)

(assert (=> b!608773 e!348631))

(declare-fun res!391392 () Bool)

(assert (=> b!608773 (=> (not res!391392) (not e!348631))))

(assert (=> b!608773 (= res!391392 (= lt!278156 (select (arr!17907 a!2986) j!136)))))

(assert (=> b!608773 (= lt!278156 (select (store (arr!17907 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!608774 () Bool)

(assert (=> b!608774 (= e!348643 (not e!348635))))

(declare-fun res!391380 () Bool)

(assert (=> b!608774 (=> res!391380 e!348635)))

(declare-fun lt!278161 () SeekEntryResult!6347)

(assert (=> b!608774 (= res!391380 (not (= lt!278161 (Found!6347 index!984))))))

(declare-fun lt!278164 () Unit!19462)

(assert (=> b!608774 (= lt!278164 e!348632)))

(declare-fun c!69056 () Bool)

(assert (=> b!608774 (= c!69056 (= lt!278161 Undefined!6347))))

(assert (=> b!608774 (= lt!278161 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!278157 lt!278151 mask!3053))))

(assert (=> b!608774 e!348640))

(declare-fun res!391397 () Bool)

(assert (=> b!608774 (=> (not res!391397) (not e!348640))))

(declare-fun lt!278165 () (_ BitVec 32))

(assert (=> b!608774 (= res!391397 (= lt!278152 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!278165 vacantSpotIndex!68 lt!278157 lt!278151 mask!3053)))))

(assert (=> b!608774 (= lt!278152 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!278165 vacantSpotIndex!68 (select (arr!17907 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!608774 (= lt!278157 (select (store (arr!17907 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!278162 () Unit!19462)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37313 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19462)

(assert (=> b!608774 (= lt!278162 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!278165 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!608774 (= lt!278165 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!608775 () Bool)

(declare-fun res!391386 () Bool)

(assert (=> b!608775 (=> (not res!391386) (not e!348641))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37313 (_ BitVec 32)) Bool)

(assert (=> b!608775 (= res!391386 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!608776 () Bool)

(declare-fun e!348644 () Bool)

(assert (=> b!608776 (= e!348644 e!348642)))

(declare-fun res!391394 () Bool)

(assert (=> b!608776 (=> (not res!391394) (not e!348642))))

(assert (=> b!608776 (= res!391394 (arrayContainsKey!0 lt!278151 (select (arr!17907 a!2986) j!136) j!136))))

(declare-fun b!608777 () Bool)

(assert (=> b!608777 (= e!348631 e!348644)))

(declare-fun res!391391 () Bool)

(assert (=> b!608777 (=> res!391391 e!348644)))

(assert (=> b!608777 (= res!391391 (or (not (= (select (arr!17907 a!2986) j!136) lt!278157)) (not (= (select (arr!17907 a!2986) j!136) lt!278156)) (bvsge j!136 index!984)))))

(declare-fun b!608778 () Bool)

(assert (=> b!608778 (= e!348633 (arrayContainsKey!0 lt!278151 (select (arr!17907 a!2986) j!136) index!984))))

(declare-fun b!608779 () Bool)

(assert (=> b!608779 (= e!348641 e!348638)))

(declare-fun res!391390 () Bool)

(assert (=> b!608779 (=> (not res!391390) (not e!348638))))

(assert (=> b!608779 (= res!391390 (= (select (store (arr!17907 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!608779 (= lt!278151 (array!37314 (store (arr!17907 a!2986) i!1108 k!1786) (size!18271 a!2986)))))

(declare-fun b!608780 () Bool)

(declare-fun res!391388 () Bool)

(assert (=> b!608780 (=> res!391388 e!348636)))

(declare-fun noDuplicate!330 (List!11948) Bool)

(assert (=> b!608780 (= res!391388 (not (noDuplicate!330 Nil!11945)))))

(assert (= (and start!55582 res!391393) b!608770))

(assert (= (and b!608770 res!391378) b!608762))

(assert (= (and b!608762 res!391396) b!608772))

(assert (= (and b!608772 res!391398) b!608759))

(assert (= (and b!608759 res!391389) b!608768))

(assert (= (and b!608768 res!391399) b!608775))

(assert (= (and b!608775 res!391386) b!608754))

(assert (= (and b!608754 res!391383) b!608757))

(assert (= (and b!608757 res!391395) b!608779))

(assert (= (and b!608779 res!391390) b!608769))

(assert (= (and b!608769 res!391384) b!608774))

(assert (= (and b!608774 res!391397) b!608771))

(assert (= (and b!608774 c!69056) b!608758))

(assert (= (and b!608774 (not c!69056)) b!608765))

(assert (= (and b!608774 (not res!391380)) b!608773))

(assert (= (and b!608773 res!391392) b!608777))

(assert (= (and b!608777 (not res!391391)) b!608776))

(assert (= (and b!608776 res!391394) b!608767))

(assert (= (and b!608773 (not res!391387)) b!608763))

(assert (= (and b!608763 c!69055) b!608766))

(assert (= (and b!608763 (not c!69055)) b!608755))

(assert (= (and b!608763 (not res!391382)) b!608764))

(assert (= (and b!608764 res!391385) b!608778))

(assert (= (and b!608764 (not res!391381)) b!608780))

(assert (= (and b!608780 (not res!391388)) b!608761))

(assert (= (and b!608761 (not res!391400)) b!608756))

(assert (= (and b!608756 (not res!391379)) b!608760))

(declare-fun m!585347 () Bool)

(assert (=> b!608777 m!585347))

(declare-fun m!585349 () Bool)

(assert (=> b!608754 m!585349))

(assert (=> b!608762 m!585347))

(assert (=> b!608762 m!585347))

(declare-fun m!585351 () Bool)

(assert (=> b!608762 m!585351))

(assert (=> b!608764 m!585347))

(assert (=> b!608764 m!585347))

(declare-fun m!585353 () Bool)

(assert (=> b!608764 m!585353))

(assert (=> b!608764 m!585347))

(declare-fun m!585355 () Bool)

(assert (=> b!608764 m!585355))

(assert (=> b!608764 m!585347))

(declare-fun m!585357 () Bool)

(assert (=> b!608764 m!585357))

(declare-fun m!585359 () Bool)

(assert (=> b!608779 m!585359))

(declare-fun m!585361 () Bool)

(assert (=> b!608779 m!585361))

(declare-fun m!585363 () Bool)

(assert (=> b!608775 m!585363))

(assert (=> b!608767 m!585347))

(assert (=> b!608767 m!585347))

(declare-fun m!585365 () Bool)

(assert (=> b!608767 m!585365))

(declare-fun m!585367 () Bool)

(assert (=> b!608769 m!585367))

(assert (=> b!608769 m!585347))

(assert (=> b!608769 m!585347))

(declare-fun m!585369 () Bool)

(assert (=> b!608769 m!585369))

(declare-fun m!585371 () Bool)

(assert (=> b!608761 m!585371))

(declare-fun m!585373 () Bool)

(assert (=> b!608772 m!585373))

(declare-fun m!585375 () Bool)

(assert (=> start!55582 m!585375))

(declare-fun m!585377 () Bool)

(assert (=> start!55582 m!585377))

(declare-fun m!585379 () Bool)

(assert (=> b!608760 m!585379))

(assert (=> b!608773 m!585347))

(assert (=> b!608773 m!585359))

(declare-fun m!585381 () Bool)

(assert (=> b!608773 m!585381))

(declare-fun m!585383 () Bool)

(assert (=> b!608759 m!585383))

(assert (=> b!608778 m!585347))

(assert (=> b!608778 m!585347))

(assert (=> b!608778 m!585365))

(declare-fun m!585385 () Bool)

(assert (=> b!608757 m!585385))

(declare-fun m!585387 () Bool)

(assert (=> b!608780 m!585387))

(assert (=> b!608766 m!585347))

(declare-fun m!585389 () Bool)

(assert (=> b!608766 m!585389))

(assert (=> b!608766 m!585347))

(declare-fun m!585391 () Bool)

(assert (=> b!608766 m!585391))

(assert (=> b!608766 m!585347))

(declare-fun m!585393 () Bool)

(assert (=> b!608766 m!585393))

(declare-fun m!585395 () Bool)

(assert (=> b!608766 m!585395))

(declare-fun m!585397 () Bool)

(assert (=> b!608766 m!585397))

(assert (=> b!608766 m!585347))

(declare-fun m!585399 () Bool)

(assert (=> b!608766 m!585399))

(declare-fun m!585401 () Bool)

(assert (=> b!608766 m!585401))

(declare-fun m!585403 () Bool)

(assert (=> b!608756 m!585403))

(declare-fun m!585405 () Bool)

(assert (=> b!608774 m!585405))

(declare-fun m!585407 () Bool)

(assert (=> b!608774 m!585407))

(assert (=> b!608774 m!585347))

(assert (=> b!608774 m!585359))

(declare-fun m!585409 () Bool)

(assert (=> b!608774 m!585409))

(assert (=> b!608774 m!585347))

(declare-fun m!585411 () Bool)

(assert (=> b!608774 m!585411))

(declare-fun m!585413 () Bool)

(assert (=> b!608774 m!585413))

(declare-fun m!585415 () Bool)

(assert (=> b!608774 m!585415))

(declare-fun m!585417 () Bool)

(assert (=> b!608768 m!585417))

(assert (=> b!608776 m!585347))

(assert (=> b!608776 m!585347))

(assert (=> b!608776 m!585357))

(push 1)

