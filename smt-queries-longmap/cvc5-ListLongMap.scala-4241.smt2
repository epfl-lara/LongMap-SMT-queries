; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58550 () Bool)

(assert start!58550)

(declare-fun b!646599 () Bool)

(declare-fun e!370666 () Bool)

(declare-fun e!370661 () Bool)

(assert (=> b!646599 (= e!370666 e!370661)))

(declare-fun res!418998 () Bool)

(assert (=> b!646599 (=> res!418998 e!370661)))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!646599 (= res!418998 (bvsge index!984 j!136))))

(declare-datatypes ((Unit!21984 0))(
  ( (Unit!21985) )
))
(declare-fun lt!300025 () Unit!21984)

(declare-fun e!370653 () Unit!21984)

(assert (=> b!646599 (= lt!300025 e!370653)))

(declare-fun c!74174 () Bool)

(assert (=> b!646599 (= c!74174 (bvslt j!136 index!984))))

(declare-fun b!646600 () Bool)

(declare-fun res!418997 () Bool)

(declare-fun e!370658 () Bool)

(assert (=> b!646600 (=> (not res!418997) (not e!370658))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!646600 (= res!418997 (validKeyInArray!0 k!1786))))

(declare-fun b!646601 () Bool)

(declare-fun Unit!21986 () Unit!21984)

(assert (=> b!646601 (= e!370653 Unit!21986)))

(declare-fun b!646602 () Bool)

(declare-fun res!419003 () Bool)

(declare-fun e!370659 () Bool)

(assert (=> b!646602 (=> (not res!419003) (not e!370659))))

(declare-datatypes ((array!38485 0))(
  ( (array!38486 (arr!18453 (Array (_ BitVec 32) (_ BitVec 64))) (size!18817 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38485)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38485 (_ BitVec 32)) Bool)

(assert (=> b!646602 (= res!419003 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!646603 () Bool)

(declare-fun e!370664 () Unit!21984)

(declare-fun Unit!21987 () Unit!21984)

(assert (=> b!646603 (= e!370664 Unit!21987)))

(declare-fun b!646604 () Bool)

(declare-fun e!370668 () Bool)

(declare-fun e!370655 () Bool)

(assert (=> b!646604 (= e!370668 e!370655)))

(declare-fun res!418987 () Bool)

(assert (=> b!646604 (=> (not res!418987) (not e!370655))))

(declare-fun lt!300020 () array!38485)

(declare-fun arrayContainsKey!0 (array!38485 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!646604 (= res!418987 (arrayContainsKey!0 lt!300020 (select (arr!18453 a!2986) j!136) j!136))))

(declare-fun b!646605 () Bool)

(declare-fun e!370656 () Bool)

(assert (=> b!646605 (= e!370656 e!370666)))

(declare-fun res!418992 () Bool)

(assert (=> b!646605 (=> res!418992 e!370666)))

(declare-fun lt!300029 () (_ BitVec 64))

(declare-fun lt!300021 () (_ BitVec 64))

(assert (=> b!646605 (= res!418992 (or (not (= (select (arr!18453 a!2986) j!136) lt!300021)) (not (= (select (arr!18453 a!2986) j!136) lt!300029))))))

(declare-fun e!370654 () Bool)

(assert (=> b!646605 e!370654))

(declare-fun res!418988 () Bool)

(assert (=> b!646605 (=> (not res!418988) (not e!370654))))

(assert (=> b!646605 (= res!418988 (= lt!300029 (select (arr!18453 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!646605 (= lt!300029 (select (store (arr!18453 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!646606 () Bool)

(declare-fun Unit!21988 () Unit!21984)

(assert (=> b!646606 (= e!370664 Unit!21988)))

(assert (=> b!646606 false))

(declare-fun b!646607 () Bool)

(declare-fun e!370660 () Bool)

(assert (=> b!646607 (= e!370661 e!370660)))

(declare-fun res!419004 () Bool)

(assert (=> b!646607 (=> res!419004 e!370660)))

(assert (=> b!646607 (= res!419004 (or (bvsge (size!18817 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18817 a!2986))))))

(assert (=> b!646607 (arrayContainsKey!0 lt!300020 (select (arr!18453 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!300024 () Unit!21984)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38485 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21984)

(assert (=> b!646607 (= lt!300024 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!300020 (select (arr!18453 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!370662 () Bool)

(assert (=> b!646607 e!370662))

(declare-fun res!418995 () Bool)

(assert (=> b!646607 (=> (not res!418995) (not e!370662))))

(assert (=> b!646607 (= res!418995 (arrayContainsKey!0 lt!300020 (select (arr!18453 a!2986) j!136) j!136))))

(declare-fun b!646608 () Bool)

(assert (=> b!646608 (= e!370658 e!370659)))

(declare-fun res!419001 () Bool)

(assert (=> b!646608 (=> (not res!419001) (not e!370659))))

(declare-datatypes ((SeekEntryResult!6893 0))(
  ( (MissingZero!6893 (index!29910 (_ BitVec 32))) (Found!6893 (index!29911 (_ BitVec 32))) (Intermediate!6893 (undefined!7705 Bool) (index!29912 (_ BitVec 32)) (x!58687 (_ BitVec 32))) (Undefined!6893) (MissingVacant!6893 (index!29913 (_ BitVec 32))) )
))
(declare-fun lt!300027 () SeekEntryResult!6893)

(assert (=> b!646608 (= res!419001 (or (= lt!300027 (MissingZero!6893 i!1108)) (= lt!300027 (MissingVacant!6893 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38485 (_ BitVec 32)) SeekEntryResult!6893)

(assert (=> b!646608 (= lt!300027 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!646609 () Bool)

(declare-fun res!418999 () Bool)

(assert (=> b!646609 (=> (not res!418999) (not e!370659))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!646609 (= res!418999 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18453 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!646610 () Bool)

(declare-fun e!370665 () Bool)

(assert (=> b!646610 (= e!370659 e!370665)))

(declare-fun res!419002 () Bool)

(assert (=> b!646610 (=> (not res!419002) (not e!370665))))

(assert (=> b!646610 (= res!419002 (= (select (store (arr!18453 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!646610 (= lt!300020 (array!38486 (store (arr!18453 a!2986) i!1108 k!1786) (size!18817 a!2986)))))

(declare-fun b!646611 () Bool)

(declare-fun res!418996 () Bool)

(assert (=> b!646611 (=> (not res!418996) (not e!370658))))

(assert (=> b!646611 (= res!418996 (and (= (size!18817 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18817 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18817 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!646612 () Bool)

(assert (=> b!646612 (= e!370654 e!370668)))

(declare-fun res!418989 () Bool)

(assert (=> b!646612 (=> res!418989 e!370668)))

(assert (=> b!646612 (= res!418989 (or (not (= (select (arr!18453 a!2986) j!136) lt!300021)) (not (= (select (arr!18453 a!2986) j!136) lt!300029)) (bvsge j!136 index!984)))))

(declare-fun b!646613 () Bool)

(declare-fun e!370657 () Bool)

(assert (=> b!646613 (= e!370665 e!370657)))

(declare-fun res!418994 () Bool)

(assert (=> b!646613 (=> (not res!418994) (not e!370657))))

(declare-fun lt!300023 () SeekEntryResult!6893)

(assert (=> b!646613 (= res!418994 (and (= lt!300023 (Found!6893 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18453 a!2986) index!984) (select (arr!18453 a!2986) j!136))) (not (= (select (arr!18453 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38485 (_ BitVec 32)) SeekEntryResult!6893)

(assert (=> b!646613 (= lt!300023 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18453 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!646614 () Bool)

(declare-fun res!419000 () Bool)

(assert (=> b!646614 (=> (not res!419000) (not e!370659))))

(declare-datatypes ((List!12494 0))(
  ( (Nil!12491) (Cons!12490 (h!13535 (_ BitVec 64)) (t!18722 List!12494)) )
))
(declare-fun arrayNoDuplicates!0 (array!38485 (_ BitVec 32) List!12494) Bool)

(assert (=> b!646614 (= res!419000 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12491))))

(declare-fun b!646615 () Bool)

(declare-fun Unit!21989 () Unit!21984)

(assert (=> b!646615 (= e!370653 Unit!21989)))

(declare-fun lt!300031 () Unit!21984)

(assert (=> b!646615 (= lt!300031 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!300020 (select (arr!18453 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!646615 (arrayContainsKey!0 lt!300020 (select (arr!18453 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!300016 () Unit!21984)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38485 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12494) Unit!21984)

(assert (=> b!646615 (= lt!300016 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12491))))

(assert (=> b!646615 (arrayNoDuplicates!0 lt!300020 #b00000000000000000000000000000000 Nil!12491)))

(declare-fun lt!300018 () Unit!21984)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38485 (_ BitVec 32) (_ BitVec 32)) Unit!21984)

(assert (=> b!646615 (= lt!300018 (lemmaNoDuplicateFromThenFromBigger!0 lt!300020 #b00000000000000000000000000000000 j!136))))

(assert (=> b!646615 (arrayNoDuplicates!0 lt!300020 j!136 Nil!12491)))

(declare-fun lt!300017 () Unit!21984)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38485 (_ BitVec 64) (_ BitVec 32) List!12494) Unit!21984)

(assert (=> b!646615 (= lt!300017 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!300020 (select (arr!18453 a!2986) j!136) j!136 Nil!12491))))

(assert (=> b!646615 false))

(declare-fun b!646616 () Bool)

(declare-fun noDuplicate!411 (List!12494) Bool)

(assert (=> b!646616 (= e!370660 (noDuplicate!411 Nil!12491))))

(declare-fun b!646617 () Bool)

(declare-fun res!418990 () Bool)

(assert (=> b!646617 (=> (not res!418990) (not e!370658))))

(assert (=> b!646617 (= res!418990 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!646618 () Bool)

(assert (=> b!646618 (= e!370655 (arrayContainsKey!0 lt!300020 (select (arr!18453 a!2986) j!136) index!984))))

(declare-fun b!646619 () Bool)

(assert (=> b!646619 (= e!370657 (not e!370656))))

(declare-fun res!418993 () Bool)

(assert (=> b!646619 (=> res!418993 e!370656)))

(declare-fun lt!300019 () SeekEntryResult!6893)

(assert (=> b!646619 (= res!418993 (not (= lt!300019 (Found!6893 index!984))))))

(declare-fun lt!300028 () Unit!21984)

(assert (=> b!646619 (= lt!300028 e!370664)))

(declare-fun c!74173 () Bool)

(assert (=> b!646619 (= c!74173 (= lt!300019 Undefined!6893))))

(assert (=> b!646619 (= lt!300019 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!300021 lt!300020 mask!3053))))

(declare-fun e!370663 () Bool)

(assert (=> b!646619 e!370663))

(declare-fun res!418991 () Bool)

(assert (=> b!646619 (=> (not res!418991) (not e!370663))))

(declare-fun lt!300026 () SeekEntryResult!6893)

(declare-fun lt!300030 () (_ BitVec 32))

(assert (=> b!646619 (= res!418991 (= lt!300026 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!300030 vacantSpotIndex!68 lt!300021 lt!300020 mask!3053)))))

(assert (=> b!646619 (= lt!300026 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!300030 vacantSpotIndex!68 (select (arr!18453 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!646619 (= lt!300021 (select (store (arr!18453 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!300022 () Unit!21984)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38485 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21984)

(assert (=> b!646619 (= lt!300022 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!300030 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!646619 (= lt!300030 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!646620 () Bool)

(declare-fun res!419006 () Bool)

(assert (=> b!646620 (=> (not res!419006) (not e!370658))))

(assert (=> b!646620 (= res!419006 (validKeyInArray!0 (select (arr!18453 a!2986) j!136)))))

(declare-fun res!419005 () Bool)

(assert (=> start!58550 (=> (not res!419005) (not e!370658))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58550 (= res!419005 (validMask!0 mask!3053))))

(assert (=> start!58550 e!370658))

(assert (=> start!58550 true))

(declare-fun array_inv!14249 (array!38485) Bool)

(assert (=> start!58550 (array_inv!14249 a!2986)))

(declare-fun b!646621 () Bool)

(assert (=> b!646621 (= e!370662 (arrayContainsKey!0 lt!300020 (select (arr!18453 a!2986) j!136) index!984))))

(declare-fun b!646622 () Bool)

(assert (=> b!646622 (= e!370663 (= lt!300023 lt!300026))))

(assert (= (and start!58550 res!419005) b!646611))

(assert (= (and b!646611 res!418996) b!646620))

(assert (= (and b!646620 res!419006) b!646600))

(assert (= (and b!646600 res!418997) b!646617))

(assert (= (and b!646617 res!418990) b!646608))

(assert (= (and b!646608 res!419001) b!646602))

(assert (= (and b!646602 res!419003) b!646614))

(assert (= (and b!646614 res!419000) b!646609))

(assert (= (and b!646609 res!418999) b!646610))

(assert (= (and b!646610 res!419002) b!646613))

(assert (= (and b!646613 res!418994) b!646619))

(assert (= (and b!646619 res!418991) b!646622))

(assert (= (and b!646619 c!74173) b!646606))

(assert (= (and b!646619 (not c!74173)) b!646603))

(assert (= (and b!646619 (not res!418993)) b!646605))

(assert (= (and b!646605 res!418988) b!646612))

(assert (= (and b!646612 (not res!418989)) b!646604))

(assert (= (and b!646604 res!418987) b!646618))

(assert (= (and b!646605 (not res!418992)) b!646599))

(assert (= (and b!646599 c!74174) b!646615))

(assert (= (and b!646599 (not c!74174)) b!646601))

(assert (= (and b!646599 (not res!418998)) b!646607))

(assert (= (and b!646607 res!418995) b!646621))

(assert (= (and b!646607 (not res!419004)) b!646616))

(declare-fun m!620051 () Bool)

(assert (=> b!646612 m!620051))

(assert (=> b!646604 m!620051))

(assert (=> b!646604 m!620051))

(declare-fun m!620053 () Bool)

(assert (=> b!646604 m!620053))

(assert (=> b!646621 m!620051))

(assert (=> b!646621 m!620051))

(declare-fun m!620055 () Bool)

(assert (=> b!646621 m!620055))

(declare-fun m!620057 () Bool)

(assert (=> start!58550 m!620057))

(declare-fun m!620059 () Bool)

(assert (=> start!58550 m!620059))

(declare-fun m!620061 () Bool)

(assert (=> b!646619 m!620061))

(declare-fun m!620063 () Bool)

(assert (=> b!646619 m!620063))

(assert (=> b!646619 m!620051))

(assert (=> b!646619 m!620051))

(declare-fun m!620065 () Bool)

(assert (=> b!646619 m!620065))

(declare-fun m!620067 () Bool)

(assert (=> b!646619 m!620067))

(declare-fun m!620069 () Bool)

(assert (=> b!646619 m!620069))

(declare-fun m!620071 () Bool)

(assert (=> b!646619 m!620071))

(declare-fun m!620073 () Bool)

(assert (=> b!646619 m!620073))

(declare-fun m!620075 () Bool)

(assert (=> b!646614 m!620075))

(declare-fun m!620077 () Bool)

(assert (=> b!646613 m!620077))

(assert (=> b!646613 m!620051))

(assert (=> b!646613 m!620051))

(declare-fun m!620079 () Bool)

(assert (=> b!646613 m!620079))

(assert (=> b!646610 m!620073))

(declare-fun m!620081 () Bool)

(assert (=> b!646610 m!620081))

(assert (=> b!646615 m!620051))

(assert (=> b!646615 m!620051))

(declare-fun m!620083 () Bool)

(assert (=> b!646615 m!620083))

(assert (=> b!646615 m!620051))

(declare-fun m!620085 () Bool)

(assert (=> b!646615 m!620085))

(declare-fun m!620087 () Bool)

(assert (=> b!646615 m!620087))

(declare-fun m!620089 () Bool)

(assert (=> b!646615 m!620089))

(assert (=> b!646615 m!620051))

(declare-fun m!620091 () Bool)

(assert (=> b!646615 m!620091))

(declare-fun m!620093 () Bool)

(assert (=> b!646615 m!620093))

(declare-fun m!620095 () Bool)

(assert (=> b!646615 m!620095))

(declare-fun m!620097 () Bool)

(assert (=> b!646608 m!620097))

(declare-fun m!620099 () Bool)

(assert (=> b!646616 m!620099))

(declare-fun m!620101 () Bool)

(assert (=> b!646609 m!620101))

(assert (=> b!646607 m!620051))

(assert (=> b!646607 m!620051))

(declare-fun m!620103 () Bool)

(assert (=> b!646607 m!620103))

(assert (=> b!646607 m!620051))

(declare-fun m!620105 () Bool)

(assert (=> b!646607 m!620105))

(assert (=> b!646607 m!620051))

(assert (=> b!646607 m!620053))

(declare-fun m!620107 () Bool)

(assert (=> b!646602 m!620107))

(declare-fun m!620109 () Bool)

(assert (=> b!646600 m!620109))

(assert (=> b!646620 m!620051))

(assert (=> b!646620 m!620051))

(declare-fun m!620111 () Bool)

(assert (=> b!646620 m!620111))

(assert (=> b!646605 m!620051))

(assert (=> b!646605 m!620073))

(declare-fun m!620113 () Bool)

(assert (=> b!646605 m!620113))

(assert (=> b!646618 m!620051))

(assert (=> b!646618 m!620051))

(assert (=> b!646618 m!620055))

(declare-fun m!620115 () Bool)

(assert (=> b!646617 m!620115))

(push 1)

(assert (not b!646619))

(assert (not b!646608))

(assert (not b!646602))

(assert (not b!646600))

(assert (not b!646614))

(assert (not start!58550))

(assert (not b!646613))

(assert (not b!646607))

(assert (not b!646617))

(assert (not b!646618))

(assert (not b!646604))

(assert (not b!646621))

(assert (not b!646616))

(assert (not b!646615))

(assert (not b!646620))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!91417 () Bool)

(declare-fun res!419169 () Bool)

(declare-fun e!370821 () Bool)

(assert (=> d!91417 (=> res!419169 e!370821)))

(assert (=> d!91417 (= res!419169 (is-Nil!12491 Nil!12491))))

(assert (=> d!91417 (= (noDuplicate!411 Nil!12491) e!370821)))

(declare-fun b!646837 () Bool)

(declare-fun e!370822 () Bool)

(assert (=> b!646837 (= e!370821 e!370822)))

(declare-fun res!419170 () Bool)

(assert (=> b!646837 (=> (not res!419170) (not e!370822))))

(declare-fun contains!3151 (List!12494 (_ BitVec 64)) Bool)

(assert (=> b!646837 (= res!419170 (not (contains!3151 (t!18722 Nil!12491) (h!13535 Nil!12491))))))

(declare-fun b!646838 () Bool)

(assert (=> b!646838 (= e!370822 (noDuplicate!411 (t!18722 Nil!12491)))))

(assert (= (and d!91417 (not res!419169)) b!646837))

(assert (= (and b!646837 res!419170) b!646838))

(declare-fun m!620311 () Bool)

(assert (=> b!646837 m!620311))

(declare-fun m!620313 () Bool)

(assert (=> b!646838 m!620313))

(assert (=> b!646616 d!91417))

(declare-fun d!91419 () Bool)

(assert (=> d!91419 (arrayContainsKey!0 lt!300020 (select (arr!18453 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!300155 () Unit!21984)

(declare-fun choose!114 (array!38485 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21984)

(assert (=> d!91419 (= lt!300155 (choose!114 lt!300020 (select (arr!18453 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!91419 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!91419 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!300020 (select (arr!18453 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!300155)))

(declare-fun bs!19322 () Bool)

(assert (= bs!19322 d!91419))

(assert (=> bs!19322 m!620051))

(assert (=> bs!19322 m!620091))

(assert (=> bs!19322 m!620051))

(declare-fun m!620315 () Bool)

(assert (=> bs!19322 m!620315))

(assert (=> b!646615 d!91419))

(declare-fun b!646881 () Bool)

(declare-fun e!370855 () Bool)

(assert (=> b!646881 (= e!370855 (contains!3151 Nil!12491 (select (arr!18453 lt!300020) #b00000000000000000000000000000000)))))

(declare-fun d!91421 () Bool)

(declare-fun res!419192 () Bool)

(declare-fun e!370856 () Bool)

(assert (=> d!91421 (=> res!419192 e!370856)))

(assert (=> d!91421 (= res!419192 (bvsge #b00000000000000000000000000000000 (size!18817 lt!300020)))))

(assert (=> d!91421 (= (arrayNoDuplicates!0 lt!300020 #b00000000000000000000000000000000 Nil!12491) e!370856)))

(declare-fun b!646882 () Bool)

(declare-fun e!370857 () Bool)

(declare-fun call!33670 () Bool)

(assert (=> b!646882 (= e!370857 call!33670)))

(declare-fun b!646883 () Bool)

(declare-fun e!370854 () Bool)

(assert (=> b!646883 (= e!370854 e!370857)))

(declare-fun c!74212 () Bool)

(assert (=> b!646883 (= c!74212 (validKeyInArray!0 (select (arr!18453 lt!300020) #b00000000000000000000000000000000)))))

(declare-fun bm!33667 () Bool)

(assert (=> bm!33667 (= call!33670 (arrayNoDuplicates!0 lt!300020 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!74212 (Cons!12490 (select (arr!18453 lt!300020) #b00000000000000000000000000000000) Nil!12491) Nil!12491)))))

(declare-fun b!646884 () Bool)

(assert (=> b!646884 (= e!370856 e!370854)))

(declare-fun res!419193 () Bool)

(assert (=> b!646884 (=> (not res!419193) (not e!370854))))

(assert (=> b!646884 (= res!419193 (not e!370855))))

(declare-fun res!419191 () Bool)

(assert (=> b!646884 (=> (not res!419191) (not e!370855))))

(assert (=> b!646884 (= res!419191 (validKeyInArray!0 (select (arr!18453 lt!300020) #b00000000000000000000000000000000)))))

(declare-fun b!646885 () Bool)

(assert (=> b!646885 (= e!370857 call!33670)))

(assert (= (and d!91421 (not res!419192)) b!646884))

(assert (= (and b!646884 res!419191) b!646881))

(assert (= (and b!646884 res!419193) b!646883))

(assert (= (and b!646883 c!74212) b!646882))

(assert (= (and b!646883 (not c!74212)) b!646885))

(assert (= (or b!646882 b!646885) bm!33667))

(declare-fun m!620349 () Bool)

(assert (=> b!646881 m!620349))

(assert (=> b!646881 m!620349))

(declare-fun m!620351 () Bool)

(assert (=> b!646881 m!620351))

(assert (=> b!646883 m!620349))

(assert (=> b!646883 m!620349))

(declare-fun m!620353 () Bool)

(assert (=> b!646883 m!620353))

(assert (=> bm!33667 m!620349))

(declare-fun m!620355 () Bool)

(assert (=> bm!33667 m!620355))

(assert (=> b!646884 m!620349))

(assert (=> b!646884 m!620349))

(assert (=> b!646884 m!620353))

(assert (=> b!646615 d!91421))

(declare-fun d!91431 () Bool)

(assert (=> d!91431 (arrayNoDuplicates!0 lt!300020 j!136 Nil!12491)))

(declare-fun lt!300172 () Unit!21984)

(declare-fun choose!39 (array!38485 (_ BitVec 32) (_ BitVec 32)) Unit!21984)

(assert (=> d!91431 (= lt!300172 (choose!39 lt!300020 #b00000000000000000000000000000000 j!136))))

(assert (=> d!91431 (bvslt (size!18817 lt!300020) #b01111111111111111111111111111111)))

(assert (=> d!91431 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!300020 #b00000000000000000000000000000000 j!136) lt!300172)))

(declare-fun bs!19323 () Bool)

(assert (= bs!19323 d!91431))

(assert (=> bs!19323 m!620087))

(declare-fun m!620357 () Bool)

(assert (=> bs!19323 m!620357))

(assert (=> b!646615 d!91431))

(declare-fun d!91433 () Bool)

(assert (=> d!91433 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18817 lt!300020)) (not (= (select (arr!18453 lt!300020) j!136) (select (arr!18453 a!2986) j!136))))))

(declare-fun lt!300175 () Unit!21984)

(declare-fun choose!21 (array!38485 (_ BitVec 64) (_ BitVec 32) List!12494) Unit!21984)

(assert (=> d!91433 (= lt!300175 (choose!21 lt!300020 (select (arr!18453 a!2986) j!136) j!136 Nil!12491))))

(assert (=> d!91433 (bvslt (size!18817 lt!300020) #b01111111111111111111111111111111)))

(assert (=> d!91433 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!300020 (select (arr!18453 a!2986) j!136) j!136 Nil!12491) lt!300175)))

(declare-fun bs!19324 () Bool)

(assert (= bs!19324 d!91433))

(declare-fun m!620359 () Bool)

(assert (=> bs!19324 m!620359))

(assert (=> bs!19324 m!620051))

(declare-fun m!620361 () Bool)

(assert (=> bs!19324 m!620361))

(assert (=> b!646615 d!91433))

(declare-fun d!91435 () Bool)

(declare-fun e!370864 () Bool)

(assert (=> d!91435 e!370864))

(declare-fun res!419200 () Bool)

(assert (=> d!91435 (=> (not res!419200) (not e!370864))))

(assert (=> d!91435 (= res!419200 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18817 a!2986))))))

(declare-fun lt!300180 () Unit!21984)

(declare-fun choose!41 (array!38485 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12494) Unit!21984)

(assert (=> d!91435 (= lt!300180 (choose!41 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12491))))

(assert (=> d!91435 (bvslt (size!18817 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!91435 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12491) lt!300180)))

(declare-fun b!646892 () Bool)

(assert (=> b!646892 (= e!370864 (arrayNoDuplicates!0 (array!38486 (store (arr!18453 a!2986) i!1108 k!1786) (size!18817 a!2986)) #b00000000000000000000000000000000 Nil!12491))))

(assert (= (and d!91435 res!419200) b!646892))

(declare-fun m!620367 () Bool)

(assert (=> d!91435 m!620367))

(assert (=> b!646892 m!620073))

(declare-fun m!620369 () Bool)

(assert (=> b!646892 m!620369))

(assert (=> b!646615 d!91435))

(declare-fun d!91445 () Bool)

(declare-fun res!419206 () Bool)

(declare-fun e!370873 () Bool)

(assert (=> d!91445 (=> res!419206 e!370873)))

(assert (=> d!91445 (= res!419206 (= (select (arr!18453 lt!300020) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18453 a!2986) j!136)))))

(assert (=> d!91445 (= (arrayContainsKey!0 lt!300020 (select (arr!18453 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!370873)))

(declare-fun b!646904 () Bool)

(declare-fun e!370874 () Bool)

(assert (=> b!646904 (= e!370873 e!370874)))

(declare-fun res!419207 () Bool)

(assert (=> b!646904 (=> (not res!419207) (not e!370874))))

(assert (=> b!646904 (= res!419207 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18817 lt!300020)))))

(declare-fun b!646905 () Bool)

(assert (=> b!646905 (= e!370874 (arrayContainsKey!0 lt!300020 (select (arr!18453 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!91445 (not res!419206)) b!646904))

(assert (= (and b!646904 res!419207) b!646905))

(declare-fun m!620381 () Bool)

(assert (=> d!91445 m!620381))

(assert (=> b!646905 m!620051))

(declare-fun m!620383 () Bool)

(assert (=> b!646905 m!620383))

(assert (=> b!646615 d!91445))

(declare-fun b!646906 () Bool)

(declare-fun e!370876 () Bool)

(assert (=> b!646906 (= e!370876 (contains!3151 Nil!12491 (select (arr!18453 lt!300020) j!136)))))

(declare-fun d!91451 () Bool)

(declare-fun res!419209 () Bool)

(declare-fun e!370877 () Bool)

(assert (=> d!91451 (=> res!419209 e!370877)))

(assert (=> d!91451 (= res!419209 (bvsge j!136 (size!18817 lt!300020)))))

(assert (=> d!91451 (= (arrayNoDuplicates!0 lt!300020 j!136 Nil!12491) e!370877)))

(declare-fun b!646907 () Bool)

(declare-fun e!370878 () Bool)

(declare-fun call!33671 () Bool)

(assert (=> b!646907 (= e!370878 call!33671)))

(declare-fun b!646908 () Bool)

(declare-fun e!370875 () Bool)

(assert (=> b!646908 (= e!370875 e!370878)))

(declare-fun c!74216 () Bool)

(assert (=> b!646908 (= c!74216 (validKeyInArray!0 (select (arr!18453 lt!300020) j!136)))))

(declare-fun bm!33668 () Bool)

(assert (=> bm!33668 (= call!33671 (arrayNoDuplicates!0 lt!300020 (bvadd j!136 #b00000000000000000000000000000001) (ite c!74216 (Cons!12490 (select (arr!18453 lt!300020) j!136) Nil!12491) Nil!12491)))))

(declare-fun b!646909 () Bool)

(assert (=> b!646909 (= e!370877 e!370875)))

(declare-fun res!419210 () Bool)

(assert (=> b!646909 (=> (not res!419210) (not e!370875))))

(assert (=> b!646909 (= res!419210 (not e!370876))))

(declare-fun res!419208 () Bool)

(assert (=> b!646909 (=> (not res!419208) (not e!370876))))

(assert (=> b!646909 (= res!419208 (validKeyInArray!0 (select (arr!18453 lt!300020) j!136)))))

(declare-fun b!646910 () Bool)

(assert (=> b!646910 (= e!370878 call!33671)))

(assert (= (and d!91451 (not res!419209)) b!646909))

(assert (= (and b!646909 res!419208) b!646906))

(assert (= (and b!646909 res!419210) b!646908))

(assert (= (and b!646908 c!74216) b!646907))

(assert (= (and b!646908 (not c!74216)) b!646910))

(assert (= (or b!646907 b!646910) bm!33668))

(assert (=> b!646906 m!620359))

(assert (=> b!646906 m!620359))

(declare-fun m!620385 () Bool)

(assert (=> b!646906 m!620385))

(assert (=> b!646908 m!620359))

(assert (=> b!646908 m!620359))

(declare-fun m!620387 () Bool)

(assert (=> b!646908 m!620387))

(assert (=> bm!33668 m!620359))

(declare-fun m!620389 () Bool)

(assert (=> bm!33668 m!620389))

(assert (=> b!646909 m!620359))

(assert (=> b!646909 m!620359))

(assert (=> b!646909 m!620387))

(assert (=> b!646615 d!91451))

(declare-fun d!91453 () Bool)

(declare-fun res!419211 () Bool)

(declare-fun e!370879 () Bool)

(assert (=> d!91453 (=> res!419211 e!370879)))

(assert (=> d!91453 (= res!419211 (= (select (arr!18453 a!2986) #b00000000000000000000000000000000) k!1786))))

(assert (=> d!91453 (= (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000) e!370879)))

(declare-fun b!646911 () Bool)

(declare-fun e!370880 () Bool)

(assert (=> b!646911 (= e!370879 e!370880)))

(declare-fun res!419212 () Bool)

(assert (=> b!646911 (=> (not res!419212) (not e!370880))))

(assert (=> b!646911 (= res!419212 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18817 a!2986)))))

(declare-fun b!646912 () Bool)

(assert (=> b!646912 (= e!370880 (arrayContainsKey!0 a!2986 k!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!91453 (not res!419211)) b!646911))

(assert (= (and b!646911 res!419212) b!646912))

(declare-fun m!620393 () Bool)

(assert (=> d!91453 m!620393))

(declare-fun m!620395 () Bool)

(assert (=> b!646912 m!620395))

(assert (=> b!646617 d!91453))

(declare-fun b!646949 () Bool)

(declare-fun e!370900 () SeekEntryResult!6893)

(assert (=> b!646949 (= e!370900 Undefined!6893)))

(declare-fun b!646951 () Bool)

(declare-fun c!74236 () Bool)

(declare-fun lt!300199 () (_ BitVec 64))

(assert (=> b!646951 (= c!74236 (= lt!300199 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!370901 () SeekEntryResult!6893)

(declare-fun e!370899 () SeekEntryResult!6893)

(assert (=> b!646951 (= e!370901 e!370899)))

(declare-fun b!646952 () Bool)

(assert (=> b!646952 (= e!370900 e!370901)))

(declare-fun c!74237 () Bool)

(assert (=> b!646952 (= c!74237 (= lt!300199 (select (arr!18453 a!2986) j!136)))))

(declare-fun b!646953 () Bool)

(assert (=> b!646953 (= e!370899 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18453 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!646954 () Bool)

(assert (=> b!646954 (= e!370901 (Found!6893 index!984))))

(declare-fun b!646950 () Bool)

(assert (=> b!646950 (= e!370899 (MissingVacant!6893 vacantSpotIndex!68))))

(declare-fun d!91457 () Bool)

(declare-fun lt!300200 () SeekEntryResult!6893)

(assert (=> d!91457 (and (or (is-Undefined!6893 lt!300200) (not (is-Found!6893 lt!300200)) (and (bvsge (index!29911 lt!300200) #b00000000000000000000000000000000) (bvslt (index!29911 lt!300200) (size!18817 a!2986)))) (or (is-Undefined!6893 lt!300200) (is-Found!6893 lt!300200) (not (is-MissingVacant!6893 lt!300200)) (not (= (index!29913 lt!300200) vacantSpotIndex!68)) (and (bvsge (index!29913 lt!300200) #b00000000000000000000000000000000) (bvslt (index!29913 lt!300200) (size!18817 a!2986)))) (or (is-Undefined!6893 lt!300200) (ite (is-Found!6893 lt!300200) (= (select (arr!18453 a!2986) (index!29911 lt!300200)) (select (arr!18453 a!2986) j!136)) (and (is-MissingVacant!6893 lt!300200) (= (index!29913 lt!300200) vacantSpotIndex!68) (= (select (arr!18453 a!2986) (index!29913 lt!300200)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!91457 (= lt!300200 e!370900)))

(declare-fun c!74235 () Bool)

(assert (=> d!91457 (= c!74235 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!91457 (= lt!300199 (select (arr!18453 a!2986) index!984))))

(assert (=> d!91457 (validMask!0 mask!3053)))

(assert (=> d!91457 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18453 a!2986) j!136) a!2986 mask!3053) lt!300200)))

(assert (= (and d!91457 c!74235) b!646949))

(assert (= (and d!91457 (not c!74235)) b!646952))

(assert (= (and b!646952 c!74237) b!646954))

(assert (= (and b!646952 (not c!74237)) b!646951))

(assert (= (and b!646951 c!74236) b!646950))

(assert (= (and b!646951 (not c!74236)) b!646953))

(assert (=> b!646953 m!620061))

(assert (=> b!646953 m!620061))

(assert (=> b!646953 m!620051))

(declare-fun m!620411 () Bool)

(assert (=> b!646953 m!620411))

(declare-fun m!620413 () Bool)

(assert (=> d!91457 m!620413))

(declare-fun m!620415 () Bool)

(assert (=> d!91457 m!620415))

(assert (=> d!91457 m!620077))

(assert (=> d!91457 m!620057))

(assert (=> b!646613 d!91457))

(declare-fun d!91463 () Bool)

(declare-fun res!419227 () Bool)

(declare-fun e!370933 () Bool)

(assert (=> d!91463 (=> res!419227 e!370933)))

(assert (=> d!91463 (= res!419227 (bvsge #b00000000000000000000000000000000 (size!18817 a!2986)))))

(assert (=> d!91463 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!370933)))

(declare-fun b!647002 () Bool)

(declare-fun e!370932 () Bool)

(assert (=> b!647002 (= e!370933 e!370932)))

(declare-fun c!74255 () Bool)

(assert (=> b!647002 (= c!74255 (validKeyInArray!0 (select (arr!18453 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!647003 () Bool)

(declare-fun e!370934 () Bool)

(declare-fun call!33674 () Bool)

(assert (=> b!647003 (= e!370934 call!33674)))

(declare-fun b!647004 () Bool)

(assert (=> b!647004 (= e!370932 call!33674)))

(declare-fun b!647005 () Bool)

(assert (=> b!647005 (= e!370932 e!370934)))

(declare-fun lt!300225 () (_ BitVec 64))

(assert (=> b!647005 (= lt!300225 (select (arr!18453 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!300223 () Unit!21984)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38485 (_ BitVec 64) (_ BitVec 32)) Unit!21984)

(assert (=> b!647005 (= lt!300223 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!300225 #b00000000000000000000000000000000))))

(assert (=> b!647005 (arrayContainsKey!0 a!2986 lt!300225 #b00000000000000000000000000000000)))

(declare-fun lt!300224 () Unit!21984)

(assert (=> b!647005 (= lt!300224 lt!300223)))

(declare-fun res!419226 () Bool)

(assert (=> b!647005 (= res!419226 (= (seekEntryOrOpen!0 (select (arr!18453 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6893 #b00000000000000000000000000000000)))))

(assert (=> b!647005 (=> (not res!419226) (not e!370934))))

(declare-fun bm!33671 () Bool)

(assert (=> bm!33671 (= call!33674 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(assert (= (and d!91463 (not res!419227)) b!647002))

(assert (= (and b!647002 c!74255) b!647005))

(assert (= (and b!647002 (not c!74255)) b!647004))

(assert (= (and b!647005 res!419226) b!647003))

(assert (= (or b!647003 b!647004) bm!33671))

(assert (=> b!647002 m!620393))

(assert (=> b!647002 m!620393))

(declare-fun m!620449 () Bool)

(assert (=> b!647002 m!620449))

(assert (=> b!647005 m!620393))

(declare-fun m!620451 () Bool)

(assert (=> b!647005 m!620451))

(declare-fun m!620455 () Bool)

(assert (=> b!647005 m!620455))

(assert (=> b!647005 m!620393))

(declare-fun m!620459 () Bool)

(assert (=> b!647005 m!620459))

(declare-fun m!620463 () Bool)

(assert (=> bm!33671 m!620463))

(assert (=> b!646602 d!91463))

(declare-fun d!91471 () Bool)

(declare-fun res!419228 () Bool)

(declare-fun e!370935 () Bool)

(assert (=> d!91471 (=> res!419228 e!370935)))

(assert (=> d!91471 (= res!419228 (= (select (arr!18453 lt!300020) j!136) (select (arr!18453 a!2986) j!136)))))

(assert (=> d!91471 (= (arrayContainsKey!0 lt!300020 (select (arr!18453 a!2986) j!136) j!136) e!370935)))

(declare-fun b!647006 () Bool)

(declare-fun e!370936 () Bool)

(assert (=> b!647006 (= e!370935 e!370936)))

(declare-fun res!419229 () Bool)

(assert (=> b!647006 (=> (not res!419229) (not e!370936))))

(assert (=> b!647006 (= res!419229 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18817 lt!300020)))))

(declare-fun b!647007 () Bool)

(assert (=> b!647007 (= e!370936 (arrayContainsKey!0 lt!300020 (select (arr!18453 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!91471 (not res!419228)) b!647006))

(assert (= (and b!647006 res!419229) b!647007))

(assert (=> d!91471 m!620359))

(assert (=> b!647007 m!620051))

(declare-fun m!620467 () Bool)

(assert (=> b!647007 m!620467))

(assert (=> b!646604 d!91471))

(declare-fun b!647008 () Bool)

(declare-fun e!370938 () Bool)

(assert (=> b!647008 (= e!370938 (contains!3151 Nil!12491 (select (arr!18453 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!91475 () Bool)

(declare-fun res!419231 () Bool)

(declare-fun e!370939 () Bool)

(assert (=> d!91475 (=> res!419231 e!370939)))

(assert (=> d!91475 (= res!419231 (bvsge #b00000000000000000000000000000000 (size!18817 a!2986)))))

(assert (=> d!91475 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12491) e!370939)))

(declare-fun b!647009 () Bool)

(declare-fun e!370940 () Bool)

(declare-fun call!33675 () Bool)

(assert (=> b!647009 (= e!370940 call!33675)))

(declare-fun b!647010 () Bool)

(declare-fun e!370937 () Bool)

(assert (=> b!647010 (= e!370937 e!370940)))

(declare-fun c!74256 () Bool)

(assert (=> b!647010 (= c!74256 (validKeyInArray!0 (select (arr!18453 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33672 () Bool)

(assert (=> bm!33672 (= call!33675 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!74256 (Cons!12490 (select (arr!18453 a!2986) #b00000000000000000000000000000000) Nil!12491) Nil!12491)))))

(declare-fun b!647011 () Bool)

(assert (=> b!647011 (= e!370939 e!370937)))

