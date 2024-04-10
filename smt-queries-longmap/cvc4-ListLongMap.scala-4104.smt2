; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56126 () Bool)

(assert start!56126)

(declare-fun b!620048 () Bool)

(declare-fun res!399548 () Bool)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!620048 (= res!399548 (bvsge j!136 index!984))))

(declare-fun e!355625 () Bool)

(assert (=> b!620048 (=> res!399548 e!355625)))

(declare-fun e!355621 () Bool)

(assert (=> b!620048 (= e!355621 e!355625)))

(declare-fun b!620049 () Bool)

(declare-fun e!355628 () Bool)

(declare-fun e!355632 () Bool)

(assert (=> b!620049 (= e!355628 e!355632)))

(declare-fun res!399543 () Bool)

(assert (=> b!620049 (=> (not res!399543) (not e!355632))))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6484 0))(
  ( (MissingZero!6484 (index!28220 (_ BitVec 32))) (Found!6484 (index!28221 (_ BitVec 32))) (Intermediate!6484 (undefined!7296 Bool) (index!28222 (_ BitVec 32)) (x!56996 (_ BitVec 32))) (Undefined!6484) (MissingVacant!6484 (index!28223 (_ BitVec 32))) )
))
(declare-fun lt!286403 () SeekEntryResult!6484)

(declare-datatypes ((array!37596 0))(
  ( (array!37597 (arr!18044 (Array (_ BitVec 32) (_ BitVec 64))) (size!18408 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37596)

(assert (=> b!620049 (= res!399543 (and (= lt!286403 (Found!6484 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18044 a!2986) index!984) (select (arr!18044 a!2986) j!136))) (not (= (select (arr!18044 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37596 (_ BitVec 32)) SeekEntryResult!6484)

(assert (=> b!620049 (= lt!286403 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18044 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!620050 () Bool)

(declare-datatypes ((Unit!20568 0))(
  ( (Unit!20569) )
))
(declare-fun e!355627 () Unit!20568)

(declare-fun Unit!20570 () Unit!20568)

(assert (=> b!620050 (= e!355627 Unit!20570)))

(declare-fun res!399545 () Bool)

(declare-fun e!355630 () Bool)

(assert (=> start!56126 (=> (not res!399545) (not e!355630))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56126 (= res!399545 (validMask!0 mask!3053))))

(assert (=> start!56126 e!355630))

(assert (=> start!56126 true))

(declare-fun array_inv!13840 (array!37596) Bool)

(assert (=> start!56126 (array_inv!13840 a!2986)))

(declare-fun b!620051 () Bool)

(declare-fun res!399554 () Bool)

(declare-fun e!355618 () Bool)

(assert (=> b!620051 (=> (not res!399554) (not e!355618))))

(declare-datatypes ((List!12085 0))(
  ( (Nil!12082) (Cons!12081 (h!13126 (_ BitVec 64)) (t!18313 List!12085)) )
))
(declare-fun arrayNoDuplicates!0 (array!37596 (_ BitVec 32) List!12085) Bool)

(assert (=> b!620051 (= res!399554 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12082))))

(declare-fun lt!286416 () array!37596)

(declare-fun b!620052 () Bool)

(declare-fun e!355620 () Bool)

(declare-fun arrayContainsKey!0 (array!37596 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!620052 (= e!355620 (arrayContainsKey!0 lt!286416 (select (arr!18044 a!2986) j!136) index!984))))

(declare-fun b!620053 () Bool)

(declare-fun e!355623 () Unit!20568)

(declare-fun Unit!20571 () Unit!20568)

(assert (=> b!620053 (= e!355623 Unit!20571)))

(declare-fun b!620054 () Bool)

(declare-fun e!355629 () Unit!20568)

(declare-fun Unit!20572 () Unit!20568)

(assert (=> b!620054 (= e!355629 Unit!20572)))

(assert (=> b!620054 false))

(declare-fun b!620055 () Bool)

(declare-fun res!399539 () Bool)

(assert (=> b!620055 (=> (not res!399539) (not e!355618))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37596 (_ BitVec 32)) Bool)

(assert (=> b!620055 (= res!399539 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!620056 () Bool)

(declare-fun res!399541 () Bool)

(assert (=> b!620056 (=> (not res!399541) (not e!355618))))

(assert (=> b!620056 (= res!399541 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18044 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!620057 () Bool)

(declare-fun res!399549 () Bool)

(assert (=> b!620057 (= res!399549 (arrayContainsKey!0 lt!286416 (select (arr!18044 a!2986) j!136) j!136))))

(declare-fun e!355624 () Bool)

(assert (=> b!620057 (=> (not res!399549) (not e!355624))))

(assert (=> b!620057 (= e!355625 e!355624)))

(declare-fun b!620058 () Bool)

(declare-fun e!355631 () Bool)

(assert (=> b!620058 (= e!355632 (not e!355631))))

(declare-fun res!399550 () Bool)

(assert (=> b!620058 (=> res!399550 e!355631)))

(declare-fun lt!286404 () SeekEntryResult!6484)

(assert (=> b!620058 (= res!399550 (not (= lt!286404 (MissingVacant!6484 vacantSpotIndex!68))))))

(declare-fun lt!286410 () Unit!20568)

(declare-fun e!355619 () Unit!20568)

(assert (=> b!620058 (= lt!286410 e!355619)))

(declare-fun c!70625 () Bool)

(assert (=> b!620058 (= c!70625 (= lt!286404 (Found!6484 index!984)))))

(declare-fun lt!286408 () Unit!20568)

(assert (=> b!620058 (= lt!286408 e!355629)))

(declare-fun c!70622 () Bool)

(assert (=> b!620058 (= c!70622 (= lt!286404 Undefined!6484))))

(declare-fun lt!286411 () (_ BitVec 64))

(assert (=> b!620058 (= lt!286404 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!286411 lt!286416 mask!3053))))

(declare-fun e!355626 () Bool)

(assert (=> b!620058 e!355626))

(declare-fun res!399544 () Bool)

(assert (=> b!620058 (=> (not res!399544) (not e!355626))))

(declare-fun lt!286402 () SeekEntryResult!6484)

(declare-fun lt!286399 () (_ BitVec 32))

(assert (=> b!620058 (= res!399544 (= lt!286402 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!286399 vacantSpotIndex!68 lt!286411 lt!286416 mask!3053)))))

(assert (=> b!620058 (= lt!286402 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!286399 vacantSpotIndex!68 (select (arr!18044 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!620058 (= lt!286411 (select (store (arr!18044 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!286407 () Unit!20568)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37596 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20568)

(assert (=> b!620058 (= lt!286407 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!286399 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!620058 (= lt!286399 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!620059 () Bool)

(assert (=> b!620059 (= e!355624 (arrayContainsKey!0 lt!286416 (select (arr!18044 a!2986) j!136) index!984))))

(declare-fun b!620060 () Bool)

(declare-fun Unit!20573 () Unit!20568)

(assert (=> b!620060 (= e!355629 Unit!20573)))

(declare-fun b!620061 () Bool)

(assert (=> b!620061 (= e!355630 e!355618)))

(declare-fun res!399538 () Bool)

(assert (=> b!620061 (=> (not res!399538) (not e!355618))))

(declare-fun lt!286412 () SeekEntryResult!6484)

(assert (=> b!620061 (= res!399538 (or (= lt!286412 (MissingZero!6484 i!1108)) (= lt!286412 (MissingVacant!6484 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37596 (_ BitVec 32)) SeekEntryResult!6484)

(assert (=> b!620061 (= lt!286412 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!620062 () Bool)

(declare-fun Unit!20574 () Unit!20568)

(assert (=> b!620062 (= e!355619 Unit!20574)))

(declare-fun res!399553 () Bool)

(assert (=> b!620062 (= res!399553 (= (select (store (arr!18044 a!2986) i!1108 k!1786) index!984) (select (arr!18044 a!2986) j!136)))))

(assert (=> b!620062 (=> (not res!399553) (not e!355621))))

(assert (=> b!620062 e!355621))

(declare-fun c!70624 () Bool)

(assert (=> b!620062 (= c!70624 (bvslt j!136 index!984))))

(declare-fun lt!286417 () Unit!20568)

(assert (=> b!620062 (= lt!286417 e!355627)))

(declare-fun c!70623 () Bool)

(assert (=> b!620062 (= c!70623 (bvslt index!984 j!136))))

(declare-fun lt!286414 () Unit!20568)

(assert (=> b!620062 (= lt!286414 e!355623)))

(assert (=> b!620062 false))

(declare-fun b!620063 () Bool)

(declare-fun res!399552 () Bool)

(assert (=> b!620063 (=> (not res!399552) (not e!355630))))

(assert (=> b!620063 (= res!399552 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!620064 () Bool)

(declare-fun res!399551 () Bool)

(assert (=> b!620064 (=> (not res!399551) (not e!355630))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!620064 (= res!399551 (validKeyInArray!0 k!1786))))

(declare-fun b!620065 () Bool)

(assert (=> b!620065 (= e!355618 e!355628)))

(declare-fun res!399540 () Bool)

(assert (=> b!620065 (=> (not res!399540) (not e!355628))))

(assert (=> b!620065 (= res!399540 (= (select (store (arr!18044 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!620065 (= lt!286416 (array!37597 (store (arr!18044 a!2986) i!1108 k!1786) (size!18408 a!2986)))))

(declare-fun b!620066 () Bool)

(assert (=> b!620066 false))

(declare-fun lt!286400 () Unit!20568)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37596 (_ BitVec 64) (_ BitVec 32) List!12085) Unit!20568)

(assert (=> b!620066 (= lt!286400 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!286416 (select (arr!18044 a!2986) j!136) j!136 Nil!12082))))

(assert (=> b!620066 (arrayNoDuplicates!0 lt!286416 j!136 Nil!12082)))

(declare-fun lt!286398 () Unit!20568)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37596 (_ BitVec 32) (_ BitVec 32)) Unit!20568)

(assert (=> b!620066 (= lt!286398 (lemmaNoDuplicateFromThenFromBigger!0 lt!286416 #b00000000000000000000000000000000 j!136))))

(assert (=> b!620066 (arrayNoDuplicates!0 lt!286416 #b00000000000000000000000000000000 Nil!12082)))

(declare-fun lt!286406 () Unit!20568)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37596 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12085) Unit!20568)

(assert (=> b!620066 (= lt!286406 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12082))))

(assert (=> b!620066 (arrayContainsKey!0 lt!286416 (select (arr!18044 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!286409 () Unit!20568)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37596 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20568)

(assert (=> b!620066 (= lt!286409 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!286416 (select (arr!18044 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20575 () Unit!20568)

(assert (=> b!620066 (= e!355627 Unit!20575)))

(declare-fun b!620067 () Bool)

(declare-fun res!399542 () Bool)

(assert (=> b!620067 (=> (not res!399542) (not e!355630))))

(assert (=> b!620067 (= res!399542 (validKeyInArray!0 (select (arr!18044 a!2986) j!136)))))

(declare-fun b!620068 () Bool)

(assert (=> b!620068 false))

(declare-fun lt!286413 () Unit!20568)

(assert (=> b!620068 (= lt!286413 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!286416 (select (arr!18044 a!2986) j!136) index!984 Nil!12082))))

(assert (=> b!620068 (arrayNoDuplicates!0 lt!286416 index!984 Nil!12082)))

(declare-fun lt!286405 () Unit!20568)

(assert (=> b!620068 (= lt!286405 (lemmaNoDuplicateFromThenFromBigger!0 lt!286416 #b00000000000000000000000000000000 index!984))))

(assert (=> b!620068 (arrayNoDuplicates!0 lt!286416 #b00000000000000000000000000000000 Nil!12082)))

(declare-fun lt!286401 () Unit!20568)

(assert (=> b!620068 (= lt!286401 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12082))))

(assert (=> b!620068 (arrayContainsKey!0 lt!286416 (select (arr!18044 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!286415 () Unit!20568)

(assert (=> b!620068 (= lt!286415 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!286416 (select (arr!18044 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!620068 e!355620))

(declare-fun res!399546 () Bool)

(assert (=> b!620068 (=> (not res!399546) (not e!355620))))

(assert (=> b!620068 (= res!399546 (arrayContainsKey!0 lt!286416 (select (arr!18044 a!2986) j!136) j!136))))

(declare-fun Unit!20576 () Unit!20568)

(assert (=> b!620068 (= e!355623 Unit!20576)))

(declare-fun b!620069 () Bool)

(declare-fun res!399547 () Bool)

(assert (=> b!620069 (=> (not res!399547) (not e!355630))))

(assert (=> b!620069 (= res!399547 (and (= (size!18408 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18408 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18408 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!620070 () Bool)

(declare-fun Unit!20577 () Unit!20568)

(assert (=> b!620070 (= e!355619 Unit!20577)))

(declare-fun b!620071 () Bool)

(assert (=> b!620071 (= e!355631 true)))

(assert (=> b!620071 (= (select (store (arr!18044 a!2986) i!1108 k!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!620072 () Bool)

(assert (=> b!620072 (= e!355626 (= lt!286403 lt!286402))))

(assert (= (and start!56126 res!399545) b!620069))

(assert (= (and b!620069 res!399547) b!620067))

(assert (= (and b!620067 res!399542) b!620064))

(assert (= (and b!620064 res!399551) b!620063))

(assert (= (and b!620063 res!399552) b!620061))

(assert (= (and b!620061 res!399538) b!620055))

(assert (= (and b!620055 res!399539) b!620051))

(assert (= (and b!620051 res!399554) b!620056))

(assert (= (and b!620056 res!399541) b!620065))

(assert (= (and b!620065 res!399540) b!620049))

(assert (= (and b!620049 res!399543) b!620058))

(assert (= (and b!620058 res!399544) b!620072))

(assert (= (and b!620058 c!70622) b!620054))

(assert (= (and b!620058 (not c!70622)) b!620060))

(assert (= (and b!620058 c!70625) b!620062))

(assert (= (and b!620058 (not c!70625)) b!620070))

(assert (= (and b!620062 res!399553) b!620048))

(assert (= (and b!620048 (not res!399548)) b!620057))

(assert (= (and b!620057 res!399549) b!620059))

(assert (= (and b!620062 c!70624) b!620066))

(assert (= (and b!620062 (not c!70624)) b!620050))

(assert (= (and b!620062 c!70623) b!620068))

(assert (= (and b!620062 (not c!70623)) b!620053))

(assert (= (and b!620068 res!399546) b!620052))

(assert (= (and b!620058 (not res!399550)) b!620071))

(declare-fun m!595981 () Bool)

(assert (=> b!620061 m!595981))

(declare-fun m!595983 () Bool)

(assert (=> b!620058 m!595983))

(declare-fun m!595985 () Bool)

(assert (=> b!620058 m!595985))

(declare-fun m!595987 () Bool)

(assert (=> b!620058 m!595987))

(declare-fun m!595989 () Bool)

(assert (=> b!620058 m!595989))

(declare-fun m!595991 () Bool)

(assert (=> b!620058 m!595991))

(declare-fun m!595993 () Bool)

(assert (=> b!620058 m!595993))

(declare-fun m!595995 () Bool)

(assert (=> b!620058 m!595995))

(assert (=> b!620058 m!595991))

(declare-fun m!595997 () Bool)

(assert (=> b!620058 m!595997))

(declare-fun m!595999 () Bool)

(assert (=> b!620056 m!595999))

(declare-fun m!596001 () Bool)

(assert (=> b!620049 m!596001))

(assert (=> b!620049 m!595991))

(assert (=> b!620049 m!595991))

(declare-fun m!596003 () Bool)

(assert (=> b!620049 m!596003))

(assert (=> b!620052 m!595991))

(assert (=> b!620052 m!595991))

(declare-fun m!596005 () Bool)

(assert (=> b!620052 m!596005))

(assert (=> b!620068 m!595991))

(declare-fun m!596007 () Bool)

(assert (=> b!620068 m!596007))

(assert (=> b!620068 m!595991))

(declare-fun m!596009 () Bool)

(assert (=> b!620068 m!596009))

(assert (=> b!620068 m!595991))

(declare-fun m!596011 () Bool)

(assert (=> b!620068 m!596011))

(declare-fun m!596013 () Bool)

(assert (=> b!620068 m!596013))

(declare-fun m!596015 () Bool)

(assert (=> b!620068 m!596015))

(declare-fun m!596017 () Bool)

(assert (=> b!620068 m!596017))

(assert (=> b!620068 m!595991))

(declare-fun m!596019 () Bool)

(assert (=> b!620068 m!596019))

(assert (=> b!620068 m!595991))

(declare-fun m!596021 () Bool)

(assert (=> b!620068 m!596021))

(assert (=> b!620057 m!595991))

(assert (=> b!620057 m!595991))

(assert (=> b!620057 m!596011))

(declare-fun m!596023 () Bool)

(assert (=> b!620051 m!596023))

(declare-fun m!596025 () Bool)

(assert (=> b!620064 m!596025))

(declare-fun m!596027 () Bool)

(assert (=> b!620063 m!596027))

(assert (=> b!620071 m!595987))

(declare-fun m!596029 () Bool)

(assert (=> b!620071 m!596029))

(assert (=> b!620067 m!595991))

(assert (=> b!620067 m!595991))

(declare-fun m!596031 () Bool)

(assert (=> b!620067 m!596031))

(assert (=> b!620065 m!595987))

(declare-fun m!596033 () Bool)

(assert (=> b!620065 m!596033))

(declare-fun m!596035 () Bool)

(assert (=> b!620066 m!596035))

(declare-fun m!596037 () Bool)

(assert (=> b!620066 m!596037))

(assert (=> b!620066 m!595991))

(declare-fun m!596039 () Bool)

(assert (=> b!620066 m!596039))

(assert (=> b!620066 m!595991))

(assert (=> b!620066 m!595991))

(declare-fun m!596041 () Bool)

(assert (=> b!620066 m!596041))

(assert (=> b!620066 m!596013))

(assert (=> b!620066 m!595991))

(declare-fun m!596043 () Bool)

(assert (=> b!620066 m!596043))

(assert (=> b!620066 m!596017))

(declare-fun m!596045 () Bool)

(assert (=> b!620055 m!596045))

(assert (=> b!620062 m!595987))

(assert (=> b!620062 m!596029))

(assert (=> b!620062 m!595991))

(assert (=> b!620059 m!595991))

(assert (=> b!620059 m!595991))

(assert (=> b!620059 m!596005))

(declare-fun m!596047 () Bool)

(assert (=> start!56126 m!596047))

(declare-fun m!596049 () Bool)

(assert (=> start!56126 m!596049))

(push 1)

