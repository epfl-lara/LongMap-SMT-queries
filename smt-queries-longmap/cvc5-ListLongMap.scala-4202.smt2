; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57428 () Bool)

(assert start!57428)

(declare-fun b!635490 () Bool)

(declare-fun res!411101 () Bool)

(declare-fun e!363480 () Bool)

(assert (=> b!635490 (=> (not res!411101) (not e!363480))))

(declare-datatypes ((array!38218 0))(
  ( (array!38219 (arr!18336 (Array (_ BitVec 32) (_ BitVec 64))) (size!18700 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38218)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38218 (_ BitVec 32)) Bool)

(assert (=> b!635490 (= res!411101 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!635491 () Bool)

(declare-fun res!411085 () Bool)

(assert (=> b!635491 (=> (not res!411085) (not e!363480))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!635491 (= res!411085 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18336 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!635492 () Bool)

(declare-fun e!363473 () Bool)

(declare-fun e!363469 () Bool)

(assert (=> b!635492 (= e!363473 e!363469)))

(declare-fun res!411090 () Bool)

(assert (=> b!635492 (=> res!411090 e!363469)))

(declare-fun lt!293834 () (_ BitVec 64))

(declare-fun lt!293831 () (_ BitVec 64))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!635492 (= res!411090 (or (not (= (select (arr!18336 a!2986) j!136) lt!293831)) (not (= (select (arr!18336 a!2986) j!136) lt!293834)) (bvsge j!136 index!984)))))

(declare-fun b!635493 () Bool)

(declare-fun res!411087 () Bool)

(declare-fun e!363476 () Bool)

(assert (=> b!635493 (=> (not res!411087) (not e!363476))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!635493 (= res!411087 (and (= (size!18700 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18700 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18700 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!635494 () Bool)

(declare-fun res!411097 () Bool)

(assert (=> b!635494 (=> (not res!411097) (not e!363476))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38218 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!635494 (= res!411097 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!635495 () Bool)

(declare-fun e!363478 () Bool)

(assert (=> b!635495 (= e!363480 e!363478)))

(declare-fun res!411089 () Bool)

(assert (=> b!635495 (=> (not res!411089) (not e!363478))))

(assert (=> b!635495 (= res!411089 (= (select (store (arr!18336 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!293835 () array!38218)

(assert (=> b!635495 (= lt!293835 (array!38219 (store (arr!18336 a!2986) i!1108 k!1786) (size!18700 a!2986)))))

(declare-fun b!635496 () Bool)

(declare-fun e!363475 () Bool)

(assert (=> b!635496 (= e!363475 (arrayContainsKey!0 lt!293835 (select (arr!18336 a!2986) j!136) index!984))))

(declare-fun b!635497 () Bool)

(declare-fun e!363470 () Bool)

(assert (=> b!635497 (= e!363478 e!363470)))

(declare-fun res!411092 () Bool)

(assert (=> b!635497 (=> (not res!411092) (not e!363470))))

(declare-datatypes ((SeekEntryResult!6776 0))(
  ( (MissingZero!6776 (index!29409 (_ BitVec 32))) (Found!6776 (index!29410 (_ BitVec 32))) (Intermediate!6776 (undefined!7588 Bool) (index!29411 (_ BitVec 32)) (x!58159 (_ BitVec 32))) (Undefined!6776) (MissingVacant!6776 (index!29412 (_ BitVec 32))) )
))
(declare-fun lt!293828 () SeekEntryResult!6776)

(assert (=> b!635497 (= res!411092 (and (= lt!293828 (Found!6776 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18336 a!2986) index!984) (select (arr!18336 a!2986) j!136))) (not (= (select (arr!18336 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38218 (_ BitVec 32)) SeekEntryResult!6776)

(assert (=> b!635497 (= lt!293828 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18336 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!635498 () Bool)

(declare-datatypes ((Unit!21438 0))(
  ( (Unit!21439) )
))
(declare-fun e!363472 () Unit!21438)

(declare-fun Unit!21440 () Unit!21438)

(assert (=> b!635498 (= e!363472 Unit!21440)))

(declare-fun b!635499 () Bool)

(declare-fun e!363477 () Bool)

(assert (=> b!635499 (= e!363477 true)))

(assert (=> b!635499 (arrayContainsKey!0 lt!293835 (select (arr!18336 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!293829 () Unit!21438)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38218 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21438)

(assert (=> b!635499 (= lt!293829 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!293835 (select (arr!18336 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!635500 () Bool)

(declare-fun res!411086 () Bool)

(assert (=> b!635500 (=> (not res!411086) (not e!363480))))

(declare-datatypes ((List!12377 0))(
  ( (Nil!12374) (Cons!12373 (h!13418 (_ BitVec 64)) (t!18605 List!12377)) )
))
(declare-fun arrayNoDuplicates!0 (array!38218 (_ BitVec 32) List!12377) Bool)

(assert (=> b!635500 (= res!411086 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12374))))

(declare-fun b!635501 () Bool)

(declare-fun res!411095 () Bool)

(assert (=> b!635501 (=> (not res!411095) (not e!363476))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!635501 (= res!411095 (validKeyInArray!0 k!1786))))

(declare-fun b!635502 () Bool)

(declare-fun e!363471 () Bool)

(assert (=> b!635502 (= e!363471 e!363477)))

(declare-fun res!411091 () Bool)

(assert (=> b!635502 (=> res!411091 e!363477)))

(assert (=> b!635502 (= res!411091 (or (not (= (select (arr!18336 a!2986) j!136) lt!293831)) (not (= (select (arr!18336 a!2986) j!136) lt!293834)) (bvsge j!136 index!984)))))

(assert (=> b!635502 e!363473))

(declare-fun res!411100 () Bool)

(assert (=> b!635502 (=> (not res!411100) (not e!363473))))

(assert (=> b!635502 (= res!411100 (= lt!293834 (select (arr!18336 a!2986) j!136)))))

(assert (=> b!635502 (= lt!293834 (select (store (arr!18336 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!635503 () Bool)

(assert (=> b!635503 (= e!363469 e!363475)))

(declare-fun res!411096 () Bool)

(assert (=> b!635503 (=> (not res!411096) (not e!363475))))

(assert (=> b!635503 (= res!411096 (arrayContainsKey!0 lt!293835 (select (arr!18336 a!2986) j!136) j!136))))

(declare-fun b!635504 () Bool)

(assert (=> b!635504 (= e!363476 e!363480)))

(declare-fun res!411099 () Bool)

(assert (=> b!635504 (=> (not res!411099) (not e!363480))))

(declare-fun lt!293827 () SeekEntryResult!6776)

(assert (=> b!635504 (= res!411099 (or (= lt!293827 (MissingZero!6776 i!1108)) (= lt!293827 (MissingVacant!6776 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38218 (_ BitVec 32)) SeekEntryResult!6776)

(assert (=> b!635504 (= lt!293827 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!635489 () Bool)

(assert (=> b!635489 (= e!363470 (not e!363471))))

(declare-fun res!411093 () Bool)

(assert (=> b!635489 (=> res!411093 e!363471)))

(declare-fun lt!293836 () SeekEntryResult!6776)

(assert (=> b!635489 (= res!411093 (not (= lt!293836 (Found!6776 index!984))))))

(declare-fun lt!293826 () Unit!21438)

(assert (=> b!635489 (= lt!293826 e!363472)))

(declare-fun c!72569 () Bool)

(assert (=> b!635489 (= c!72569 (= lt!293836 Undefined!6776))))

(assert (=> b!635489 (= lt!293836 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!293831 lt!293835 mask!3053))))

(declare-fun e!363479 () Bool)

(assert (=> b!635489 e!363479))

(declare-fun res!411088 () Bool)

(assert (=> b!635489 (=> (not res!411088) (not e!363479))))

(declare-fun lt!293833 () SeekEntryResult!6776)

(declare-fun lt!293832 () (_ BitVec 32))

(assert (=> b!635489 (= res!411088 (= lt!293833 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293832 vacantSpotIndex!68 lt!293831 lt!293835 mask!3053)))))

(assert (=> b!635489 (= lt!293833 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293832 vacantSpotIndex!68 (select (arr!18336 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!635489 (= lt!293831 (select (store (arr!18336 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!293830 () Unit!21438)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38218 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21438)

(assert (=> b!635489 (= lt!293830 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!293832 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!635489 (= lt!293832 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!411098 () Bool)

(assert (=> start!57428 (=> (not res!411098) (not e!363476))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57428 (= res!411098 (validMask!0 mask!3053))))

(assert (=> start!57428 e!363476))

(assert (=> start!57428 true))

(declare-fun array_inv!14132 (array!38218) Bool)

(assert (=> start!57428 (array_inv!14132 a!2986)))

(declare-fun b!635505 () Bool)

(declare-fun Unit!21441 () Unit!21438)

(assert (=> b!635505 (= e!363472 Unit!21441)))

(assert (=> b!635505 false))

(declare-fun b!635506 () Bool)

(assert (=> b!635506 (= e!363479 (= lt!293828 lt!293833))))

(declare-fun b!635507 () Bool)

(declare-fun res!411094 () Bool)

(assert (=> b!635507 (=> (not res!411094) (not e!363476))))

(assert (=> b!635507 (= res!411094 (validKeyInArray!0 (select (arr!18336 a!2986) j!136)))))

(assert (= (and start!57428 res!411098) b!635493))

(assert (= (and b!635493 res!411087) b!635507))

(assert (= (and b!635507 res!411094) b!635501))

(assert (= (and b!635501 res!411095) b!635494))

(assert (= (and b!635494 res!411097) b!635504))

(assert (= (and b!635504 res!411099) b!635490))

(assert (= (and b!635490 res!411101) b!635500))

(assert (= (and b!635500 res!411086) b!635491))

(assert (= (and b!635491 res!411085) b!635495))

(assert (= (and b!635495 res!411089) b!635497))

(assert (= (and b!635497 res!411092) b!635489))

(assert (= (and b!635489 res!411088) b!635506))

(assert (= (and b!635489 c!72569) b!635505))

(assert (= (and b!635489 (not c!72569)) b!635498))

(assert (= (and b!635489 (not res!411093)) b!635502))

(assert (= (and b!635502 res!411100) b!635492))

(assert (= (and b!635492 (not res!411090)) b!635503))

(assert (= (and b!635503 res!411096) b!635496))

(assert (= (and b!635502 (not res!411091)) b!635499))

(declare-fun m!609839 () Bool)

(assert (=> b!635496 m!609839))

(assert (=> b!635496 m!609839))

(declare-fun m!609841 () Bool)

(assert (=> b!635496 m!609841))

(declare-fun m!609843 () Bool)

(assert (=> b!635495 m!609843))

(declare-fun m!609845 () Bool)

(assert (=> b!635495 m!609845))

(assert (=> b!635492 m!609839))

(declare-fun m!609847 () Bool)

(assert (=> b!635494 m!609847))

(declare-fun m!609849 () Bool)

(assert (=> start!57428 m!609849))

(declare-fun m!609851 () Bool)

(assert (=> start!57428 m!609851))

(declare-fun m!609853 () Bool)

(assert (=> b!635497 m!609853))

(assert (=> b!635497 m!609839))

(assert (=> b!635497 m!609839))

(declare-fun m!609855 () Bool)

(assert (=> b!635497 m!609855))

(assert (=> b!635503 m!609839))

(assert (=> b!635503 m!609839))

(declare-fun m!609857 () Bool)

(assert (=> b!635503 m!609857))

(declare-fun m!609859 () Bool)

(assert (=> b!635500 m!609859))

(assert (=> b!635499 m!609839))

(assert (=> b!635499 m!609839))

(declare-fun m!609861 () Bool)

(assert (=> b!635499 m!609861))

(assert (=> b!635499 m!609839))

(declare-fun m!609863 () Bool)

(assert (=> b!635499 m!609863))

(declare-fun m!609865 () Bool)

(assert (=> b!635501 m!609865))

(declare-fun m!609867 () Bool)

(assert (=> b!635490 m!609867))

(declare-fun m!609869 () Bool)

(assert (=> b!635491 m!609869))

(declare-fun m!609871 () Bool)

(assert (=> b!635504 m!609871))

(assert (=> b!635507 m!609839))

(assert (=> b!635507 m!609839))

(declare-fun m!609873 () Bool)

(assert (=> b!635507 m!609873))

(declare-fun m!609875 () Bool)

(assert (=> b!635489 m!609875))

(declare-fun m!609877 () Bool)

(assert (=> b!635489 m!609877))

(assert (=> b!635489 m!609843))

(declare-fun m!609879 () Bool)

(assert (=> b!635489 m!609879))

(assert (=> b!635489 m!609839))

(declare-fun m!609881 () Bool)

(assert (=> b!635489 m!609881))

(declare-fun m!609883 () Bool)

(assert (=> b!635489 m!609883))

(assert (=> b!635489 m!609839))

(declare-fun m!609885 () Bool)

(assert (=> b!635489 m!609885))

(assert (=> b!635502 m!609839))

(assert (=> b!635502 m!609843))

(declare-fun m!609887 () Bool)

(assert (=> b!635502 m!609887))

(push 1)

