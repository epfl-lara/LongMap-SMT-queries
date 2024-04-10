; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56128 () Bool)

(assert start!56128)

(declare-fun b!620121 () Bool)

(declare-datatypes ((Unit!20578 0))(
  ( (Unit!20579) )
))
(declare-fun e!355669 () Unit!20578)

(declare-fun Unit!20580 () Unit!20578)

(assert (=> b!620121 (= e!355669 Unit!20580)))

(declare-fun b!620122 () Bool)

(declare-fun e!355668 () Unit!20578)

(declare-fun Unit!20581 () Unit!20578)

(assert (=> b!620122 (= e!355668 Unit!20581)))

(declare-fun b!620123 () Bool)

(declare-fun res!399598 () Bool)

(declare-fun e!355670 () Bool)

(assert (=> b!620123 (=> (not res!399598) (not e!355670))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!37598 0))(
  ( (array!37599 (arr!18045 (Array (_ BitVec 32) (_ BitVec 64))) (size!18409 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37598)

(assert (=> b!620123 (= res!399598 (and (= (size!18409 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18409 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18409 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!620124 () Bool)

(declare-fun res!399599 () Bool)

(declare-fun e!355662 () Bool)

(assert (=> b!620124 (=> (not res!399599) (not e!355662))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37598 (_ BitVec 32)) Bool)

(assert (=> b!620124 (= res!399599 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!620125 () Bool)

(declare-fun e!355665 () Unit!20578)

(declare-fun Unit!20582 () Unit!20578)

(assert (=> b!620125 (= e!355665 Unit!20582)))

(declare-fun b!620126 () Bool)

(declare-fun e!355666 () Bool)

(declare-fun e!355667 () Bool)

(assert (=> b!620126 (= e!355666 e!355667)))

(declare-fun res!399596 () Bool)

(assert (=> b!620126 (=> (not res!399596) (not e!355667))))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6485 0))(
  ( (MissingZero!6485 (index!28224 (_ BitVec 32))) (Found!6485 (index!28225 (_ BitVec 32))) (Intermediate!6485 (undefined!7297 Bool) (index!28226 (_ BitVec 32)) (x!57005 (_ BitVec 32))) (Undefined!6485) (MissingVacant!6485 (index!28227 (_ BitVec 32))) )
))
(declare-fun lt!286468 () SeekEntryResult!6485)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!620126 (= res!399596 (and (= lt!286468 (Found!6485 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18045 a!2986) index!984) (select (arr!18045 a!2986) j!136))) (not (= (select (arr!18045 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37598 (_ BitVec 32)) SeekEntryResult!6485)

(assert (=> b!620126 (= lt!286468 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18045 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!620127 () Bool)

(assert (=> b!620127 (= e!355670 e!355662)))

(declare-fun res!399594 () Bool)

(assert (=> b!620127 (=> (not res!399594) (not e!355662))))

(declare-fun lt!286474 () SeekEntryResult!6485)

(assert (=> b!620127 (= res!399594 (or (= lt!286474 (MissingZero!6485 i!1108)) (= lt!286474 (MissingVacant!6485 i!1108))))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37598 (_ BitVec 32)) SeekEntryResult!6485)

(assert (=> b!620127 (= lt!286474 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!620128 () Bool)

(declare-fun res!399597 () Bool)

(assert (=> b!620128 (=> (not res!399597) (not e!355662))))

(declare-datatypes ((List!12086 0))(
  ( (Nil!12083) (Cons!12082 (h!13127 (_ BitVec 64)) (t!18314 List!12086)) )
))
(declare-fun arrayNoDuplicates!0 (array!37598 (_ BitVec 32) List!12086) Bool)

(assert (=> b!620128 (= res!399597 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12083))))

(declare-fun b!620130 () Bool)

(declare-fun e!355672 () Bool)

(declare-fun lt!286466 () SeekEntryResult!6485)

(assert (=> b!620130 (= e!355672 (= lt!286468 lt!286466))))

(declare-fun b!620131 () Bool)

(declare-fun res!399602 () Bool)

(assert (=> b!620131 (=> (not res!399602) (not e!355662))))

(assert (=> b!620131 (= res!399602 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18045 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!620132 () Bool)

(declare-fun e!355673 () Unit!20578)

(declare-fun Unit!20583 () Unit!20578)

(assert (=> b!620132 (= e!355673 Unit!20583)))

(declare-fun b!620133 () Bool)

(assert (=> b!620133 (= e!355667 (not true))))

(declare-fun lt!286460 () Unit!20578)

(assert (=> b!620133 (= lt!286460 e!355673)))

(declare-fun c!70635 () Bool)

(declare-fun lt!286476 () SeekEntryResult!6485)

(assert (=> b!620133 (= c!70635 (= lt!286476 (Found!6485 index!984)))))

(declare-fun lt!286462 () Unit!20578)

(assert (=> b!620133 (= lt!286462 e!355669)))

(declare-fun c!70634 () Bool)

(assert (=> b!620133 (= c!70634 (= lt!286476 Undefined!6485))))

(declare-fun lt!286461 () array!37598)

(declare-fun lt!286475 () (_ BitVec 64))

(assert (=> b!620133 (= lt!286476 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!286475 lt!286461 mask!3053))))

(assert (=> b!620133 e!355672))

(declare-fun res!399593 () Bool)

(assert (=> b!620133 (=> (not res!399593) (not e!355672))))

(declare-fun lt!286469 () (_ BitVec 32))

(assert (=> b!620133 (= res!399593 (= lt!286466 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!286469 vacantSpotIndex!68 lt!286475 lt!286461 mask!3053)))))

(assert (=> b!620133 (= lt!286466 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!286469 vacantSpotIndex!68 (select (arr!18045 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!620133 (= lt!286475 (select (store (arr!18045 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!286464 () Unit!20578)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37598 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20578)

(assert (=> b!620133 (= lt!286464 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!286469 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!620133 (= lt!286469 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!620134 () Bool)

(declare-fun res!399591 () Bool)

(assert (=> b!620134 (=> (not res!399591) (not e!355670))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!620134 (= res!399591 (validKeyInArray!0 (select (arr!18045 a!2986) j!136)))))

(declare-fun b!620135 () Bool)

(declare-fun Unit!20584 () Unit!20578)

(assert (=> b!620135 (= e!355673 Unit!20584)))

(declare-fun res!399600 () Bool)

(assert (=> b!620135 (= res!399600 (= (select (store (arr!18045 a!2986) i!1108 k!1786) index!984) (select (arr!18045 a!2986) j!136)))))

(declare-fun e!355674 () Bool)

(assert (=> b!620135 (=> (not res!399600) (not e!355674))))

(assert (=> b!620135 e!355674))

(declare-fun c!70637 () Bool)

(assert (=> b!620135 (= c!70637 (bvslt j!136 index!984))))

(declare-fun lt!286472 () Unit!20578)

(assert (=> b!620135 (= lt!286472 e!355665)))

(declare-fun c!70636 () Bool)

(assert (=> b!620135 (= c!70636 (bvslt index!984 j!136))))

(declare-fun lt!286467 () Unit!20578)

(assert (=> b!620135 (= lt!286467 e!355668)))

(assert (=> b!620135 false))

(declare-fun b!620136 () Bool)

(declare-fun res!399587 () Bool)

(declare-fun arrayContainsKey!0 (array!37598 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!620136 (= res!399587 (arrayContainsKey!0 lt!286461 (select (arr!18045 a!2986) j!136) j!136))))

(declare-fun e!355664 () Bool)

(assert (=> b!620136 (=> (not res!399587) (not e!355664))))

(declare-fun e!355663 () Bool)

(assert (=> b!620136 (= e!355663 e!355664)))

(declare-fun res!399588 () Bool)

(assert (=> start!56128 (=> (not res!399588) (not e!355670))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56128 (= res!399588 (validMask!0 mask!3053))))

(assert (=> start!56128 e!355670))

(assert (=> start!56128 true))

(declare-fun array_inv!13841 (array!37598) Bool)

(assert (=> start!56128 (array_inv!13841 a!2986)))

(declare-fun b!620129 () Bool)

(declare-fun res!399592 () Bool)

(assert (=> b!620129 (=> (not res!399592) (not e!355670))))

(assert (=> b!620129 (= res!399592 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!620137 () Bool)

(declare-fun Unit!20585 () Unit!20578)

(assert (=> b!620137 (= e!355669 Unit!20585)))

(assert (=> b!620137 false))

(declare-fun b!620138 () Bool)

(declare-fun res!399589 () Bool)

(assert (=> b!620138 (= res!399589 (bvsge j!136 index!984))))

(assert (=> b!620138 (=> res!399589 e!355663)))

(assert (=> b!620138 (= e!355674 e!355663)))

(declare-fun b!620139 () Bool)

(assert (=> b!620139 (= e!355662 e!355666)))

(declare-fun res!399595 () Bool)

(assert (=> b!620139 (=> (not res!399595) (not e!355666))))

(assert (=> b!620139 (= res!399595 (= (select (store (arr!18045 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!620139 (= lt!286461 (array!37599 (store (arr!18045 a!2986) i!1108 k!1786) (size!18409 a!2986)))))

(declare-fun b!620140 () Bool)

(assert (=> b!620140 (= e!355664 (arrayContainsKey!0 lt!286461 (select (arr!18045 a!2986) j!136) index!984))))

(declare-fun e!355661 () Bool)

(declare-fun b!620141 () Bool)

(assert (=> b!620141 (= e!355661 (arrayContainsKey!0 lt!286461 (select (arr!18045 a!2986) j!136) index!984))))

(declare-fun b!620142 () Bool)

(assert (=> b!620142 false))

(declare-fun lt!286459 () Unit!20578)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37598 (_ BitVec 64) (_ BitVec 32) List!12086) Unit!20578)

(assert (=> b!620142 (= lt!286459 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!286461 (select (arr!18045 a!2986) j!136) index!984 Nil!12083))))

(assert (=> b!620142 (arrayNoDuplicates!0 lt!286461 index!984 Nil!12083)))

(declare-fun lt!286470 () Unit!20578)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37598 (_ BitVec 32) (_ BitVec 32)) Unit!20578)

(assert (=> b!620142 (= lt!286470 (lemmaNoDuplicateFromThenFromBigger!0 lt!286461 #b00000000000000000000000000000000 index!984))))

(assert (=> b!620142 (arrayNoDuplicates!0 lt!286461 #b00000000000000000000000000000000 Nil!12083)))

(declare-fun lt!286473 () Unit!20578)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37598 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12086) Unit!20578)

(assert (=> b!620142 (= lt!286473 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12083))))

(assert (=> b!620142 (arrayContainsKey!0 lt!286461 (select (arr!18045 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!286465 () Unit!20578)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37598 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20578)

(assert (=> b!620142 (= lt!286465 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!286461 (select (arr!18045 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!620142 e!355661))

(declare-fun res!399601 () Bool)

(assert (=> b!620142 (=> (not res!399601) (not e!355661))))

(assert (=> b!620142 (= res!399601 (arrayContainsKey!0 lt!286461 (select (arr!18045 a!2986) j!136) j!136))))

(declare-fun Unit!20586 () Unit!20578)

(assert (=> b!620142 (= e!355668 Unit!20586)))

(declare-fun b!620143 () Bool)

(declare-fun res!399590 () Bool)

(assert (=> b!620143 (=> (not res!399590) (not e!355670))))

(assert (=> b!620143 (= res!399590 (validKeyInArray!0 k!1786))))

(declare-fun b!620144 () Bool)

(assert (=> b!620144 false))

(declare-fun lt!286463 () Unit!20578)

(assert (=> b!620144 (= lt!286463 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!286461 (select (arr!18045 a!2986) j!136) j!136 Nil!12083))))

(assert (=> b!620144 (arrayNoDuplicates!0 lt!286461 j!136 Nil!12083)))

(declare-fun lt!286458 () Unit!20578)

(assert (=> b!620144 (= lt!286458 (lemmaNoDuplicateFromThenFromBigger!0 lt!286461 #b00000000000000000000000000000000 j!136))))

(assert (=> b!620144 (arrayNoDuplicates!0 lt!286461 #b00000000000000000000000000000000 Nil!12083)))

(declare-fun lt!286477 () Unit!20578)

(assert (=> b!620144 (= lt!286477 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12083))))

(assert (=> b!620144 (arrayContainsKey!0 lt!286461 (select (arr!18045 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!286471 () Unit!20578)

(assert (=> b!620144 (= lt!286471 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!286461 (select (arr!18045 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20587 () Unit!20578)

(assert (=> b!620144 (= e!355665 Unit!20587)))

(assert (= (and start!56128 res!399588) b!620123))

(assert (= (and b!620123 res!399598) b!620134))

(assert (= (and b!620134 res!399591) b!620143))

(assert (= (and b!620143 res!399590) b!620129))

(assert (= (and b!620129 res!399592) b!620127))

(assert (= (and b!620127 res!399594) b!620124))

(assert (= (and b!620124 res!399599) b!620128))

(assert (= (and b!620128 res!399597) b!620131))

(assert (= (and b!620131 res!399602) b!620139))

(assert (= (and b!620139 res!399595) b!620126))

(assert (= (and b!620126 res!399596) b!620133))

(assert (= (and b!620133 res!399593) b!620130))

(assert (= (and b!620133 c!70634) b!620137))

(assert (= (and b!620133 (not c!70634)) b!620121))

(assert (= (and b!620133 c!70635) b!620135))

(assert (= (and b!620133 (not c!70635)) b!620132))

(assert (= (and b!620135 res!399600) b!620138))

(assert (= (and b!620138 (not res!399589)) b!620136))

(assert (= (and b!620136 res!399587) b!620140))

(assert (= (and b!620135 c!70637) b!620144))

(assert (= (and b!620135 (not c!70637)) b!620125))

(assert (= (and b!620135 c!70636) b!620142))

(assert (= (and b!620135 (not c!70636)) b!620122))

(assert (= (and b!620142 res!399601) b!620141))

(declare-fun m!596051 () Bool)

(assert (=> b!620140 m!596051))

(assert (=> b!620140 m!596051))

(declare-fun m!596053 () Bool)

(assert (=> b!620140 m!596053))

(assert (=> b!620142 m!596051))

(declare-fun m!596055 () Bool)

(assert (=> b!620142 m!596055))

(assert (=> b!620142 m!596051))

(declare-fun m!596057 () Bool)

(assert (=> b!620142 m!596057))

(assert (=> b!620142 m!596051))

(declare-fun m!596059 () Bool)

(assert (=> b!620142 m!596059))

(assert (=> b!620142 m!596051))

(declare-fun m!596061 () Bool)

(assert (=> b!620142 m!596061))

(declare-fun m!596063 () Bool)

(assert (=> b!620142 m!596063))

(declare-fun m!596065 () Bool)

(assert (=> b!620142 m!596065))

(assert (=> b!620142 m!596051))

(declare-fun m!596067 () Bool)

(assert (=> b!620142 m!596067))

(declare-fun m!596069 () Bool)

(assert (=> b!620142 m!596069))

(assert (=> b!620144 m!596051))

(assert (=> b!620144 m!596051))

(declare-fun m!596071 () Bool)

(assert (=> b!620144 m!596071))

(declare-fun m!596073 () Bool)

(assert (=> b!620144 m!596073))

(assert (=> b!620144 m!596065))

(assert (=> b!620144 m!596051))

(declare-fun m!596075 () Bool)

(assert (=> b!620144 m!596075))

(assert (=> b!620144 m!596069))

(assert (=> b!620144 m!596051))

(declare-fun m!596077 () Bool)

(assert (=> b!620144 m!596077))

(declare-fun m!596079 () Bool)

(assert (=> b!620144 m!596079))

(declare-fun m!596081 () Bool)

(assert (=> b!620124 m!596081))

(declare-fun m!596083 () Bool)

(assert (=> b!620135 m!596083))

(declare-fun m!596085 () Bool)

(assert (=> b!620135 m!596085))

(assert (=> b!620135 m!596051))

(assert (=> b!620139 m!596083))

(declare-fun m!596087 () Bool)

(assert (=> b!620139 m!596087))

(declare-fun m!596089 () Bool)

(assert (=> b!620143 m!596089))

(assert (=> b!620134 m!596051))

(assert (=> b!620134 m!596051))

(declare-fun m!596091 () Bool)

(assert (=> b!620134 m!596091))

(declare-fun m!596093 () Bool)

(assert (=> b!620127 m!596093))

(declare-fun m!596095 () Bool)

(assert (=> start!56128 m!596095))

(declare-fun m!596097 () Bool)

(assert (=> start!56128 m!596097))

(declare-fun m!596099 () Bool)

(assert (=> b!620131 m!596099))

(declare-fun m!596101 () Bool)

(assert (=> b!620129 m!596101))

(assert (=> b!620136 m!596051))

(assert (=> b!620136 m!596051))

(assert (=> b!620136 m!596061))

(declare-fun m!596103 () Bool)

(assert (=> b!620128 m!596103))

(declare-fun m!596105 () Bool)

(assert (=> b!620126 m!596105))

(assert (=> b!620126 m!596051))

(assert (=> b!620126 m!596051))

(declare-fun m!596107 () Bool)

(assert (=> b!620126 m!596107))

(assert (=> b!620141 m!596051))

(assert (=> b!620141 m!596051))

(assert (=> b!620141 m!596053))

(declare-fun m!596109 () Bool)

(assert (=> b!620133 m!596109))

(declare-fun m!596111 () Bool)

(assert (=> b!620133 m!596111))

(assert (=> b!620133 m!596051))

(declare-fun m!596113 () Bool)

(assert (=> b!620133 m!596113))

(assert (=> b!620133 m!596083))

(declare-fun m!596115 () Bool)

(assert (=> b!620133 m!596115))

(assert (=> b!620133 m!596051))

(declare-fun m!596117 () Bool)

(assert (=> b!620133 m!596117))

(declare-fun m!596119 () Bool)

(assert (=> b!620133 m!596119))

(push 1)

