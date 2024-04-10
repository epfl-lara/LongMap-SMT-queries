; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56832 () Bool)

(assert start!56832)

(declare-fun b!629557 () Bool)

(declare-fun res!406960 () Bool)

(declare-fun e!360024 () Bool)

(assert (=> b!629557 (=> (not res!406960) (not e!360024))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38022 0))(
  ( (array!38023 (arr!18248 (Array (_ BitVec 32) (_ BitVec 64))) (size!18612 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38022)

(assert (=> b!629557 (= res!406960 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18248 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18248 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!629558 () Bool)

(assert (=> b!629558 (= e!360024 (not true))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!290784 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6688 0))(
  ( (MissingZero!6688 (index!29036 (_ BitVec 32))) (Found!6688 (index!29037 (_ BitVec 32))) (Intermediate!6688 (undefined!7500 Bool) (index!29038 (_ BitVec 32)) (x!57768 (_ BitVec 32))) (Undefined!6688) (MissingVacant!6688 (index!29039 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38022 (_ BitVec 32)) SeekEntryResult!6688)

(assert (=> b!629558 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!290784 vacantSpotIndex!68 (select (arr!18248 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!290784 vacantSpotIndex!68 (select (store (arr!18248 a!2986) i!1108 k!1786) j!136) (array!38023 (store (arr!18248 a!2986) i!1108 k!1786) (size!18612 a!2986)) mask!3053))))

(declare-datatypes ((Unit!21118 0))(
  ( (Unit!21119) )
))
(declare-fun lt!290783 () Unit!21118)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38022 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21118)

(assert (=> b!629558 (= lt!290783 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!290784 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!629558 (= lt!290784 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!629559 () Bool)

(declare-fun res!406958 () Bool)

(declare-fun e!360022 () Bool)

(assert (=> b!629559 (=> (not res!406958) (not e!360022))))

(assert (=> b!629559 (= res!406958 (and (= (size!18612 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18612 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18612 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!629560 () Bool)

(declare-fun res!406959 () Bool)

(assert (=> b!629560 (=> (not res!406959) (not e!360024))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38022 (_ BitVec 32)) Bool)

(assert (=> b!629560 (= res!406959 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!629561 () Bool)

(declare-fun res!406955 () Bool)

(assert (=> b!629561 (=> (not res!406955) (not e!360024))))

(assert (=> b!629561 (= res!406955 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18248 a!2986) index!984) (select (arr!18248 a!2986) j!136))) (not (= (select (arr!18248 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!629562 () Bool)

(declare-fun res!406961 () Bool)

(assert (=> b!629562 (=> (not res!406961) (not e!360024))))

(assert (=> b!629562 (= res!406961 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18248 a!2986) j!136) a!2986 mask!3053) (Found!6688 j!136)))))

(declare-fun b!629563 () Bool)

(declare-fun res!406957 () Bool)

(assert (=> b!629563 (=> (not res!406957) (not e!360024))))

(declare-datatypes ((List!12289 0))(
  ( (Nil!12286) (Cons!12285 (h!13330 (_ BitVec 64)) (t!18517 List!12289)) )
))
(declare-fun arrayNoDuplicates!0 (array!38022 (_ BitVec 32) List!12289) Bool)

(assert (=> b!629563 (= res!406957 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12286))))

(declare-fun b!629564 () Bool)

(declare-fun res!406956 () Bool)

(assert (=> b!629564 (=> (not res!406956) (not e!360022))))

(declare-fun arrayContainsKey!0 (array!38022 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!629564 (= res!406956 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!629565 () Bool)

(assert (=> b!629565 (= e!360022 e!360024)))

(declare-fun res!406953 () Bool)

(assert (=> b!629565 (=> (not res!406953) (not e!360024))))

(declare-fun lt!290785 () SeekEntryResult!6688)

(assert (=> b!629565 (= res!406953 (or (= lt!290785 (MissingZero!6688 i!1108)) (= lt!290785 (MissingVacant!6688 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38022 (_ BitVec 32)) SeekEntryResult!6688)

(assert (=> b!629565 (= lt!290785 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!629566 () Bool)

(declare-fun res!406954 () Bool)

(assert (=> b!629566 (=> (not res!406954) (not e!360022))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!629566 (= res!406954 (validKeyInArray!0 (select (arr!18248 a!2986) j!136)))))

(declare-fun b!629567 () Bool)

(declare-fun res!406951 () Bool)

(assert (=> b!629567 (=> (not res!406951) (not e!360022))))

(assert (=> b!629567 (= res!406951 (validKeyInArray!0 k!1786))))

(declare-fun res!406952 () Bool)

(assert (=> start!56832 (=> (not res!406952) (not e!360022))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56832 (= res!406952 (validMask!0 mask!3053))))

(assert (=> start!56832 e!360022))

(assert (=> start!56832 true))

(declare-fun array_inv!14044 (array!38022) Bool)

(assert (=> start!56832 (array_inv!14044 a!2986)))

(assert (= (and start!56832 res!406952) b!629559))

(assert (= (and b!629559 res!406958) b!629566))

(assert (= (and b!629566 res!406954) b!629567))

(assert (= (and b!629567 res!406951) b!629564))

(assert (= (and b!629564 res!406956) b!629565))

(assert (= (and b!629565 res!406953) b!629560))

(assert (= (and b!629560 res!406959) b!629563))

(assert (= (and b!629563 res!406957) b!629557))

(assert (= (and b!629557 res!406960) b!629562))

(assert (= (and b!629562 res!406961) b!629561))

(assert (= (and b!629561 res!406955) b!629558))

(declare-fun m!604579 () Bool)

(assert (=> b!629566 m!604579))

(assert (=> b!629566 m!604579))

(declare-fun m!604581 () Bool)

(assert (=> b!629566 m!604581))

(declare-fun m!604583 () Bool)

(assert (=> b!629563 m!604583))

(assert (=> b!629562 m!604579))

(assert (=> b!629562 m!604579))

(declare-fun m!604585 () Bool)

(assert (=> b!629562 m!604585))

(declare-fun m!604587 () Bool)

(assert (=> b!629560 m!604587))

(declare-fun m!604589 () Bool)

(assert (=> b!629558 m!604589))

(declare-fun m!604591 () Bool)

(assert (=> b!629558 m!604591))

(assert (=> b!629558 m!604579))

(declare-fun m!604593 () Bool)

(assert (=> b!629558 m!604593))

(assert (=> b!629558 m!604579))

(declare-fun m!604595 () Bool)

(assert (=> b!629558 m!604595))

(declare-fun m!604597 () Bool)

(assert (=> b!629558 m!604597))

(assert (=> b!629558 m!604591))

(declare-fun m!604599 () Bool)

(assert (=> b!629558 m!604599))

(declare-fun m!604601 () Bool)

(assert (=> b!629561 m!604601))

(assert (=> b!629561 m!604579))

(declare-fun m!604603 () Bool)

(assert (=> b!629567 m!604603))

(declare-fun m!604605 () Bool)

(assert (=> start!56832 m!604605))

(declare-fun m!604607 () Bool)

(assert (=> start!56832 m!604607))

(declare-fun m!604609 () Bool)

(assert (=> b!629557 m!604609))

(assert (=> b!629557 m!604595))

(declare-fun m!604611 () Bool)

(assert (=> b!629557 m!604611))

(declare-fun m!604613 () Bool)

(assert (=> b!629565 m!604613))

(declare-fun m!604615 () Bool)

(assert (=> b!629564 m!604615))

(push 1)

(assert (not b!629565))

(assert (not b!629566))

(assert (not b!629567))

(assert (not b!629560))

(assert (not b!629563))

(assert (not b!629562))

(assert (not b!629564))

(assert (not b!629558))

(assert (not start!56832))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

