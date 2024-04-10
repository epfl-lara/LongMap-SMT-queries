; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56828 () Bool)

(assert start!56828)

(declare-fun b!629491 () Bool)

(declare-fun e!360004 () Bool)

(assert (=> b!629491 (= e!360004 (not true))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((array!38018 0))(
  ( (array!38019 (arr!18246 (Array (_ BitVec 32) (_ BitVec 64))) (size!18610 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38018)

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun lt!290766 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6686 0))(
  ( (MissingZero!6686 (index!29028 (_ BitVec 32))) (Found!6686 (index!29029 (_ BitVec 32))) (Intermediate!6686 (undefined!7498 Bool) (index!29030 (_ BitVec 32)) (x!57766 (_ BitVec 32))) (Undefined!6686) (MissingVacant!6686 (index!29031 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38018 (_ BitVec 32)) SeekEntryResult!6686)

(assert (=> b!629491 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!290766 vacantSpotIndex!68 (select (arr!18246 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!290766 vacantSpotIndex!68 (select (store (arr!18246 a!2986) i!1108 k!1786) j!136) (array!38019 (store (arr!18246 a!2986) i!1108 k!1786) (size!18610 a!2986)) mask!3053))))

(declare-datatypes ((Unit!21114 0))(
  ( (Unit!21115) )
))
(declare-fun lt!290767 () Unit!21114)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38018 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21114)

(assert (=> b!629491 (= lt!290767 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!290766 vacantSpotIndex!68 mask!3053))))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!629491 (= lt!290766 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!406894 () Bool)

(declare-fun e!360006 () Bool)

(assert (=> start!56828 (=> (not res!406894) (not e!360006))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56828 (= res!406894 (validMask!0 mask!3053))))

(assert (=> start!56828 e!360006))

(assert (=> start!56828 true))

(declare-fun array_inv!14042 (array!38018) Bool)

(assert (=> start!56828 (array_inv!14042 a!2986)))

(declare-fun b!629492 () Bool)

(declare-fun res!406890 () Bool)

(assert (=> b!629492 (=> (not res!406890) (not e!360006))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!629492 (= res!406890 (validKeyInArray!0 (select (arr!18246 a!2986) j!136)))))

(declare-fun b!629493 () Bool)

(declare-fun res!406889 () Bool)

(assert (=> b!629493 (=> (not res!406889) (not e!360004))))

(assert (=> b!629493 (= res!406889 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18246 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18246 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!629494 () Bool)

(declare-fun res!406888 () Bool)

(assert (=> b!629494 (=> (not res!406888) (not e!360004))))

(assert (=> b!629494 (= res!406888 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18246 a!2986) index!984) (select (arr!18246 a!2986) j!136))) (not (= (select (arr!18246 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!629495 () Bool)

(assert (=> b!629495 (= e!360006 e!360004)))

(declare-fun res!406892 () Bool)

(assert (=> b!629495 (=> (not res!406892) (not e!360004))))

(declare-fun lt!290765 () SeekEntryResult!6686)

(assert (=> b!629495 (= res!406892 (or (= lt!290765 (MissingZero!6686 i!1108)) (= lt!290765 (MissingVacant!6686 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38018 (_ BitVec 32)) SeekEntryResult!6686)

(assert (=> b!629495 (= lt!290765 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!629496 () Bool)

(declare-fun res!406893 () Bool)

(assert (=> b!629496 (=> (not res!406893) (not e!360006))))

(assert (=> b!629496 (= res!406893 (validKeyInArray!0 k!1786))))

(declare-fun b!629497 () Bool)

(declare-fun res!406891 () Bool)

(assert (=> b!629497 (=> (not res!406891) (not e!360006))))

(assert (=> b!629497 (= res!406891 (and (= (size!18610 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18610 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18610 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!629498 () Bool)

(declare-fun res!406887 () Bool)

(assert (=> b!629498 (=> (not res!406887) (not e!360004))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38018 (_ BitVec 32)) Bool)

(assert (=> b!629498 (= res!406887 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!629499 () Bool)

(declare-fun res!406885 () Bool)

(assert (=> b!629499 (=> (not res!406885) (not e!360004))))

(declare-datatypes ((List!12287 0))(
  ( (Nil!12284) (Cons!12283 (h!13328 (_ BitVec 64)) (t!18515 List!12287)) )
))
(declare-fun arrayNoDuplicates!0 (array!38018 (_ BitVec 32) List!12287) Bool)

(assert (=> b!629499 (= res!406885 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12284))))

(declare-fun b!629500 () Bool)

(declare-fun res!406886 () Bool)

(assert (=> b!629500 (=> (not res!406886) (not e!360004))))

(assert (=> b!629500 (= res!406886 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18246 a!2986) j!136) a!2986 mask!3053) (Found!6686 j!136)))))

(declare-fun b!629501 () Bool)

(declare-fun res!406895 () Bool)

(assert (=> b!629501 (=> (not res!406895) (not e!360006))))

(declare-fun arrayContainsKey!0 (array!38018 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!629501 (= res!406895 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!56828 res!406894) b!629497))

(assert (= (and b!629497 res!406891) b!629492))

(assert (= (and b!629492 res!406890) b!629496))

(assert (= (and b!629496 res!406893) b!629501))

(assert (= (and b!629501 res!406895) b!629495))

(assert (= (and b!629495 res!406892) b!629498))

(assert (= (and b!629498 res!406887) b!629499))

(assert (= (and b!629499 res!406885) b!629493))

(assert (= (and b!629493 res!406889) b!629500))

(assert (= (and b!629500 res!406886) b!629494))

(assert (= (and b!629494 res!406888) b!629491))

(declare-fun m!604503 () Bool)

(assert (=> b!629501 m!604503))

(declare-fun m!604505 () Bool)

(assert (=> b!629500 m!604505))

(assert (=> b!629500 m!604505))

(declare-fun m!604507 () Bool)

(assert (=> b!629500 m!604507))

(declare-fun m!604509 () Bool)

(assert (=> b!629499 m!604509))

(declare-fun m!604511 () Bool)

(assert (=> b!629495 m!604511))

(declare-fun m!604513 () Bool)

(assert (=> b!629493 m!604513))

(declare-fun m!604515 () Bool)

(assert (=> b!629493 m!604515))

(declare-fun m!604517 () Bool)

(assert (=> b!629493 m!604517))

(declare-fun m!604519 () Bool)

(assert (=> b!629494 m!604519))

(assert (=> b!629494 m!604505))

(assert (=> b!629492 m!604505))

(assert (=> b!629492 m!604505))

(declare-fun m!604521 () Bool)

(assert (=> b!629492 m!604521))

(declare-fun m!604523 () Bool)

(assert (=> b!629496 m!604523))

(declare-fun m!604525 () Bool)

(assert (=> start!56828 m!604525))

(declare-fun m!604527 () Bool)

(assert (=> start!56828 m!604527))

(declare-fun m!604529 () Bool)

(assert (=> b!629498 m!604529))

(declare-fun m!604531 () Bool)

(assert (=> b!629491 m!604531))

(declare-fun m!604533 () Bool)

(assert (=> b!629491 m!604533))

(assert (=> b!629491 m!604505))

(declare-fun m!604535 () Bool)

(assert (=> b!629491 m!604535))

(assert (=> b!629491 m!604505))

(assert (=> b!629491 m!604515))

(declare-fun m!604537 () Bool)

(assert (=> b!629491 m!604537))

(assert (=> b!629491 m!604533))

(declare-fun m!604539 () Bool)

(assert (=> b!629491 m!604539))

(push 1)

