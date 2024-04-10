; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56032 () Bool)

(assert start!56032)

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!37502 0))(
  ( (array!37503 (arr!17997 (Array (_ BitVec 32) (_ BitVec 64))) (size!18361 (_ BitVec 32))) )
))
(declare-fun lt!283579 () array!37502)

(declare-fun b!616523 () Bool)

(declare-fun e!353506 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!37502)

(declare-fun arrayContainsKey!0 (array!37502 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!616523 (= e!353506 (arrayContainsKey!0 lt!283579 (select (arr!17997 a!2986) j!136) index!984))))

(declare-fun b!616524 () Bool)

(assert (=> b!616524 false))

(declare-datatypes ((Unit!20098 0))(
  ( (Unit!20099) )
))
(declare-fun lt!283591 () Unit!20098)

(declare-datatypes ((List!12038 0))(
  ( (Nil!12035) (Cons!12034 (h!13079 (_ BitVec 64)) (t!18266 List!12038)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37502 (_ BitVec 64) (_ BitVec 32) List!12038) Unit!20098)

(assert (=> b!616524 (= lt!283591 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!283579 (select (arr!17997 a!2986) j!136) index!984 Nil!12035))))

(declare-fun arrayNoDuplicates!0 (array!37502 (_ BitVec 32) List!12038) Bool)

(assert (=> b!616524 (arrayNoDuplicates!0 lt!283579 index!984 Nil!12035)))

(declare-fun lt!283590 () Unit!20098)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37502 (_ BitVec 32) (_ BitVec 32)) Unit!20098)

(assert (=> b!616524 (= lt!283590 (lemmaNoDuplicateFromThenFromBigger!0 lt!283579 #b00000000000000000000000000000000 index!984))))

(assert (=> b!616524 (arrayNoDuplicates!0 lt!283579 #b00000000000000000000000000000000 Nil!12035)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun lt!283585 () Unit!20098)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37502 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12038) Unit!20098)

(assert (=> b!616524 (= lt!283585 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12035))))

(assert (=> b!616524 (arrayContainsKey!0 lt!283579 (select (arr!17997 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!283596 () Unit!20098)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37502 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20098)

(assert (=> b!616524 (= lt!283596 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!283579 (select (arr!17997 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!353508 () Bool)

(assert (=> b!616524 e!353508))

(declare-fun res!397145 () Bool)

(assert (=> b!616524 (=> (not res!397145) (not e!353508))))

(assert (=> b!616524 (= res!397145 (arrayContainsKey!0 lt!283579 (select (arr!17997 a!2986) j!136) j!136))))

(declare-fun e!353511 () Unit!20098)

(declare-fun Unit!20100 () Unit!20098)

(assert (=> b!616524 (= e!353511 Unit!20100)))

(declare-fun b!616525 () Bool)

(declare-fun e!353514 () Unit!20098)

(declare-fun Unit!20101 () Unit!20098)

(assert (=> b!616525 (= e!353514 Unit!20101)))

(declare-fun b!616526 () Bool)

(declare-fun e!353515 () Bool)

(declare-fun e!353510 () Bool)

(assert (=> b!616526 (= e!353515 e!353510)))

(declare-fun res!397149 () Bool)

(assert (=> b!616526 (=> (not res!397149) (not e!353510))))

(declare-datatypes ((SeekEntryResult!6437 0))(
  ( (MissingZero!6437 (index!28032 (_ BitVec 32))) (Found!6437 (index!28033 (_ BitVec 32))) (Intermediate!6437 (undefined!7249 Bool) (index!28034 (_ BitVec 32)) (x!56829 (_ BitVec 32))) (Undefined!6437) (MissingVacant!6437 (index!28035 (_ BitVec 32))) )
))
(declare-fun lt!283583 () SeekEntryResult!6437)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!616526 (= res!397149 (and (= lt!283583 (Found!6437 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17997 a!2986) index!984) (select (arr!17997 a!2986) j!136))) (not (= (select (arr!17997 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37502 (_ BitVec 32)) SeekEntryResult!6437)

(assert (=> b!616526 (= lt!283583 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17997 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!616527 () Bool)

(declare-fun e!353517 () Unit!20098)

(declare-fun Unit!20102 () Unit!20098)

(assert (=> b!616527 (= e!353517 Unit!20102)))

(assert (=> b!616527 false))

(declare-fun b!616528 () Bool)

(assert (=> b!616528 false))

(declare-fun lt!283581 () Unit!20098)

(assert (=> b!616528 (= lt!283581 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!283579 (select (arr!17997 a!2986) j!136) j!136 Nil!12035))))

(assert (=> b!616528 (arrayNoDuplicates!0 lt!283579 j!136 Nil!12035)))

(declare-fun lt!283593 () Unit!20098)

(assert (=> b!616528 (= lt!283593 (lemmaNoDuplicateFromThenFromBigger!0 lt!283579 #b00000000000000000000000000000000 j!136))))

(assert (=> b!616528 (arrayNoDuplicates!0 lt!283579 #b00000000000000000000000000000000 Nil!12035)))

(declare-fun lt!283584 () Unit!20098)

(assert (=> b!616528 (= lt!283584 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12035))))

(assert (=> b!616528 (arrayContainsKey!0 lt!283579 (select (arr!17997 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!283582 () Unit!20098)

(assert (=> b!616528 (= lt!283582 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!283579 (select (arr!17997 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!353513 () Unit!20098)

(declare-fun Unit!20103 () Unit!20098)

(assert (=> b!616528 (= e!353513 Unit!20103)))

(declare-fun b!616529 () Bool)

(declare-fun res!397154 () Bool)

(declare-fun e!353504 () Bool)

(assert (=> b!616529 (=> (not res!397154) (not e!353504))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!616529 (= res!397154 (validKeyInArray!0 (select (arr!17997 a!2986) j!136)))))

(declare-fun b!616530 () Bool)

(declare-fun e!353509 () Bool)

(declare-fun lt!283587 () SeekEntryResult!6437)

(assert (=> b!616530 (= e!353509 (= lt!283583 lt!283587))))

(declare-fun b!616531 () Bool)

(declare-fun res!397153 () Bool)

(assert (=> b!616531 (=> (not res!397153) (not e!353504))))

(assert (=> b!616531 (= res!397153 (and (= (size!18361 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18361 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18361 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!616532 () Bool)

(declare-fun e!353512 () Bool)

(assert (=> b!616532 (= e!353512 e!353515)))

(declare-fun res!397148 () Bool)

(assert (=> b!616532 (=> (not res!397148) (not e!353515))))

(assert (=> b!616532 (= res!397148 (= (select (store (arr!17997 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!616532 (= lt!283579 (array!37503 (store (arr!17997 a!2986) i!1108 k!1786) (size!18361 a!2986)))))

(declare-fun b!616533 () Bool)

(declare-fun Unit!20104 () Unit!20098)

(assert (=> b!616533 (= e!353514 Unit!20104)))

(declare-fun res!397146 () Bool)

(assert (=> b!616533 (= res!397146 (= (select (store (arr!17997 a!2986) i!1108 k!1786) index!984) (select (arr!17997 a!2986) j!136)))))

(declare-fun e!353505 () Bool)

(assert (=> b!616533 (=> (not res!397146) (not e!353505))))

(assert (=> b!616533 e!353505))

(declare-fun c!70061 () Bool)

(assert (=> b!616533 (= c!70061 (bvslt j!136 index!984))))

(declare-fun lt!283580 () Unit!20098)

(assert (=> b!616533 (= lt!283580 e!353513)))

(declare-fun c!70059 () Bool)

(assert (=> b!616533 (= c!70059 (bvslt index!984 j!136))))

(declare-fun lt!283588 () Unit!20098)

(assert (=> b!616533 (= lt!283588 e!353511)))

(assert (=> b!616533 false))

(declare-fun b!616534 () Bool)

(declare-fun res!397151 () Bool)

(assert (=> b!616534 (=> (not res!397151) (not e!353512))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37502 (_ BitVec 32)) Bool)

(assert (=> b!616534 (= res!397151 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!616535 () Bool)

(assert (=> b!616535 (= e!353504 e!353512)))

(declare-fun res!397157 () Bool)

(assert (=> b!616535 (=> (not res!397157) (not e!353512))))

(declare-fun lt!283594 () SeekEntryResult!6437)

(assert (=> b!616535 (= res!397157 (or (= lt!283594 (MissingZero!6437 i!1108)) (= lt!283594 (MissingVacant!6437 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37502 (_ BitVec 32)) SeekEntryResult!6437)

(assert (=> b!616535 (= lt!283594 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!616536 () Bool)

(declare-fun e!353507 () Bool)

(assert (=> b!616536 (= e!353507 true)))

(assert (=> b!616536 (= (select (store (arr!17997 a!2986) i!1108 k!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!616537 () Bool)

(assert (=> b!616537 (= e!353508 (arrayContainsKey!0 lt!283579 (select (arr!17997 a!2986) j!136) index!984))))

(declare-fun b!616538 () Bool)

(declare-fun Unit!20105 () Unit!20098)

(assert (=> b!616538 (= e!353513 Unit!20105)))

(declare-fun res!397144 () Bool)

(assert (=> start!56032 (=> (not res!397144) (not e!353504))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56032 (= res!397144 (validMask!0 mask!3053))))

(assert (=> start!56032 e!353504))

(assert (=> start!56032 true))

(declare-fun array_inv!13793 (array!37502) Bool)

(assert (=> start!56032 (array_inv!13793 a!2986)))

(declare-fun b!616539 () Bool)

(declare-fun res!397155 () Bool)

(assert (=> b!616539 (= res!397155 (bvsge j!136 index!984))))

(declare-fun e!353516 () Bool)

(assert (=> b!616539 (=> res!397155 e!353516)))

(assert (=> b!616539 (= e!353505 e!353516)))

(declare-fun b!616540 () Bool)

(declare-fun res!397150 () Bool)

(assert (=> b!616540 (=> (not res!397150) (not e!353504))))

(assert (=> b!616540 (= res!397150 (validKeyInArray!0 k!1786))))

(declare-fun b!616541 () Bool)

(declare-fun Unit!20106 () Unit!20098)

(assert (=> b!616541 (= e!353517 Unit!20106)))

(declare-fun b!616542 () Bool)

(assert (=> b!616542 (= e!353510 (not e!353507))))

(declare-fun res!397147 () Bool)

(assert (=> b!616542 (=> res!397147 e!353507)))

(declare-fun lt!283595 () SeekEntryResult!6437)

(assert (=> b!616542 (= res!397147 (not (= lt!283595 (MissingVacant!6437 vacantSpotIndex!68))))))

(declare-fun lt!283597 () Unit!20098)

(assert (=> b!616542 (= lt!283597 e!353514)))

(declare-fun c!70060 () Bool)

(assert (=> b!616542 (= c!70060 (= lt!283595 (Found!6437 index!984)))))

(declare-fun lt!283589 () Unit!20098)

(assert (=> b!616542 (= lt!283589 e!353517)))

(declare-fun c!70058 () Bool)

(assert (=> b!616542 (= c!70058 (= lt!283595 Undefined!6437))))

(declare-fun lt!283578 () (_ BitVec 64))

(assert (=> b!616542 (= lt!283595 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!283578 lt!283579 mask!3053))))

(assert (=> b!616542 e!353509))

(declare-fun res!397142 () Bool)

(assert (=> b!616542 (=> (not res!397142) (not e!353509))))

(declare-fun lt!283586 () (_ BitVec 32))

(assert (=> b!616542 (= res!397142 (= lt!283587 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!283586 vacantSpotIndex!68 lt!283578 lt!283579 mask!3053)))))

(assert (=> b!616542 (= lt!283587 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!283586 vacantSpotIndex!68 (select (arr!17997 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!616542 (= lt!283578 (select (store (arr!17997 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!283592 () Unit!20098)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37502 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20098)

(assert (=> b!616542 (= lt!283592 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!283586 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!616542 (= lt!283586 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!616543 () Bool)

(declare-fun res!397156 () Bool)

(assert (=> b!616543 (= res!397156 (arrayContainsKey!0 lt!283579 (select (arr!17997 a!2986) j!136) j!136))))

(assert (=> b!616543 (=> (not res!397156) (not e!353506))))

(assert (=> b!616543 (= e!353516 e!353506)))

(declare-fun b!616544 () Bool)

(declare-fun res!397152 () Bool)

(assert (=> b!616544 (=> (not res!397152) (not e!353512))))

(assert (=> b!616544 (= res!397152 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17997 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!616545 () Bool)

(declare-fun res!397141 () Bool)

(assert (=> b!616545 (=> (not res!397141) (not e!353512))))

(assert (=> b!616545 (= res!397141 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12035))))

(declare-fun b!616546 () Bool)

(declare-fun res!397143 () Bool)

(assert (=> b!616546 (=> (not res!397143) (not e!353504))))

(assert (=> b!616546 (= res!397143 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!616547 () Bool)

(declare-fun Unit!20107 () Unit!20098)

(assert (=> b!616547 (= e!353511 Unit!20107)))

(assert (= (and start!56032 res!397144) b!616531))

(assert (= (and b!616531 res!397153) b!616529))

(assert (= (and b!616529 res!397154) b!616540))

(assert (= (and b!616540 res!397150) b!616546))

(assert (= (and b!616546 res!397143) b!616535))

(assert (= (and b!616535 res!397157) b!616534))

(assert (= (and b!616534 res!397151) b!616545))

(assert (= (and b!616545 res!397141) b!616544))

(assert (= (and b!616544 res!397152) b!616532))

(assert (= (and b!616532 res!397148) b!616526))

(assert (= (and b!616526 res!397149) b!616542))

(assert (= (and b!616542 res!397142) b!616530))

(assert (= (and b!616542 c!70058) b!616527))

(assert (= (and b!616542 (not c!70058)) b!616541))

(assert (= (and b!616542 c!70060) b!616533))

(assert (= (and b!616542 (not c!70060)) b!616525))

(assert (= (and b!616533 res!397146) b!616539))

(assert (= (and b!616539 (not res!397155)) b!616543))

(assert (= (and b!616543 res!397156) b!616523))

(assert (= (and b!616533 c!70061) b!616528))

(assert (= (and b!616533 (not c!70061)) b!616538))

(assert (= (and b!616533 c!70059) b!616524))

(assert (= (and b!616533 (not c!70059)) b!616547))

(assert (= (and b!616524 res!397145) b!616537))

(assert (= (and b!616542 (not res!397147)) b!616536))

(declare-fun m!592691 () Bool)

(assert (=> b!616523 m!592691))

(assert (=> b!616523 m!592691))

(declare-fun m!592693 () Bool)

(assert (=> b!616523 m!592693))

(declare-fun m!592695 () Bool)

(assert (=> start!56032 m!592695))

(declare-fun m!592697 () Bool)

(assert (=> start!56032 m!592697))

(assert (=> b!616537 m!592691))

(assert (=> b!616537 m!592691))

(assert (=> b!616537 m!592693))

(declare-fun m!592699 () Bool)

(assert (=> b!616544 m!592699))

(declare-fun m!592701 () Bool)

(assert (=> b!616532 m!592701))

(declare-fun m!592703 () Bool)

(assert (=> b!616532 m!592703))

(declare-fun m!592705 () Bool)

(assert (=> b!616534 m!592705))

(assert (=> b!616533 m!592701))

(declare-fun m!592707 () Bool)

(assert (=> b!616533 m!592707))

(assert (=> b!616533 m!592691))

(declare-fun m!592709 () Bool)

(assert (=> b!616526 m!592709))

(assert (=> b!616526 m!592691))

(assert (=> b!616526 m!592691))

(declare-fun m!592711 () Bool)

(assert (=> b!616526 m!592711))

(assert (=> b!616524 m!592691))

(declare-fun m!592713 () Bool)

(assert (=> b!616524 m!592713))

(assert (=> b!616524 m!592691))

(declare-fun m!592715 () Bool)

(assert (=> b!616524 m!592715))

(assert (=> b!616524 m!592691))

(declare-fun m!592717 () Bool)

(assert (=> b!616524 m!592717))

(declare-fun m!592719 () Bool)

(assert (=> b!616524 m!592719))

(declare-fun m!592721 () Bool)

(assert (=> b!616524 m!592721))

(declare-fun m!592723 () Bool)

(assert (=> b!616524 m!592723))

(assert (=> b!616524 m!592691))

(declare-fun m!592725 () Bool)

(assert (=> b!616524 m!592725))

(assert (=> b!616524 m!592691))

(declare-fun m!592727 () Bool)

(assert (=> b!616524 m!592727))

(assert (=> b!616536 m!592701))

(assert (=> b!616536 m!592707))

(declare-fun m!592729 () Bool)

(assert (=> b!616540 m!592729))

(declare-fun m!592731 () Bool)

(assert (=> b!616546 m!592731))

(declare-fun m!592733 () Bool)

(assert (=> b!616545 m!592733))

(declare-fun m!592735 () Bool)

(assert (=> b!616535 m!592735))

(assert (=> b!616543 m!592691))

(assert (=> b!616543 m!592691))

(assert (=> b!616543 m!592713))

(declare-fun m!592737 () Bool)

(assert (=> b!616542 m!592737))

(declare-fun m!592739 () Bool)

(assert (=> b!616542 m!592739))

(assert (=> b!616542 m!592691))

(assert (=> b!616542 m!592691))

(declare-fun m!592741 () Bool)

(assert (=> b!616542 m!592741))

(declare-fun m!592743 () Bool)

(assert (=> b!616542 m!592743))

(declare-fun m!592745 () Bool)

(assert (=> b!616542 m!592745))

(declare-fun m!592747 () Bool)

(assert (=> b!616542 m!592747))

(assert (=> b!616542 m!592701))

(assert (=> b!616528 m!592691))

(declare-fun m!592749 () Bool)

(assert (=> b!616528 m!592749))

(assert (=> b!616528 m!592691))

(declare-fun m!592751 () Bool)

(assert (=> b!616528 m!592751))

(assert (=> b!616528 m!592715))

(assert (=> b!616528 m!592691))

(declare-fun m!592753 () Bool)

(assert (=> b!616528 m!592753))

(declare-fun m!592755 () Bool)

(assert (=> b!616528 m!592755))

(assert (=> b!616528 m!592723))

(assert (=> b!616528 m!592691))

(declare-fun m!592757 () Bool)

(assert (=> b!616528 m!592757))

(assert (=> b!616529 m!592691))

(assert (=> b!616529 m!592691))

(declare-fun m!592759 () Bool)

(assert (=> b!616529 m!592759))

(push 1)

