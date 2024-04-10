; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53716 () Bool)

(assert start!53716)

(declare-fun b!585778 () Bool)

(declare-fun res!373597 () Bool)

(declare-fun e!335085 () Bool)

(assert (=> b!585778 (=> (not res!373597) (not e!335085))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36617 0))(
  ( (array!36618 (arr!17583 (Array (_ BitVec 32) (_ BitVec 64))) (size!17947 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36617)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(assert (=> b!585778 (= res!373597 (and (= (size!17947 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17947 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17947 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!585779 () Bool)

(declare-fun res!373600 () Bool)

(assert (=> b!585779 (=> (not res!373600) (not e!335085))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36617 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!585779 (= res!373600 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!585780 () Bool)

(declare-fun res!373604 () Bool)

(assert (=> b!585780 (=> (not res!373604) (not e!335085))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!585780 (= res!373604 (validKeyInArray!0 (select (arr!17583 a!2986) j!136)))))

(declare-fun b!585781 () Bool)

(declare-fun res!373598 () Bool)

(declare-fun e!335083 () Bool)

(assert (=> b!585781 (=> (not res!373598) (not e!335083))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!585781 (= res!373598 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17583 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17583 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!373596 () Bool)

(assert (=> start!53716 (=> (not res!373596) (not e!335085))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53716 (= res!373596 (validMask!0 mask!3053))))

(assert (=> start!53716 e!335085))

(assert (=> start!53716 true))

(declare-fun array_inv!13379 (array!36617) Bool)

(assert (=> start!53716 (array_inv!13379 a!2986)))

(declare-fun b!585782 () Bool)

(assert (=> b!585782 (= e!335085 e!335083)))

(declare-fun res!373602 () Bool)

(assert (=> b!585782 (=> (not res!373602) (not e!335083))))

(declare-datatypes ((SeekEntryResult!6023 0))(
  ( (MissingZero!6023 (index!26319 (_ BitVec 32))) (Found!6023 (index!26320 (_ BitVec 32))) (Intermediate!6023 (undefined!6835 Bool) (index!26321 (_ BitVec 32)) (x!55140 (_ BitVec 32))) (Undefined!6023) (MissingVacant!6023 (index!26322 (_ BitVec 32))) )
))
(declare-fun lt!265913 () SeekEntryResult!6023)

(assert (=> b!585782 (= res!373602 (or (= lt!265913 (MissingZero!6023 i!1108)) (= lt!265913 (MissingVacant!6023 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36617 (_ BitVec 32)) SeekEntryResult!6023)

(assert (=> b!585782 (= lt!265913 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!585783 () Bool)

(declare-fun res!373599 () Bool)

(assert (=> b!585783 (=> (not res!373599) (not e!335083))))

(assert (=> b!585783 (= res!373599 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17583 a!2986) index!984) (select (arr!17583 a!2986) j!136))) (not (= (select (arr!17583 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!585784 () Bool)

(declare-fun res!373595 () Bool)

(assert (=> b!585784 (=> (not res!373595) (not e!335085))))

(assert (=> b!585784 (= res!373595 (validKeyInArray!0 k!1786))))

(declare-fun b!585785 () Bool)

(assert (=> b!585785 (= e!335083 (not true))))

(declare-fun lt!265914 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36617 (_ BitVec 32)) SeekEntryResult!6023)

(assert (=> b!585785 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265914 vacantSpotIndex!68 (select (arr!17583 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265914 vacantSpotIndex!68 (select (store (arr!17583 a!2986) i!1108 k!1786) j!136) (array!36618 (store (arr!17583 a!2986) i!1108 k!1786) (size!17947 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18166 0))(
  ( (Unit!18167) )
))
(declare-fun lt!265915 () Unit!18166)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36617 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18166)

(assert (=> b!585785 (= lt!265915 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!265914 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!585785 (= lt!265914 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!585786 () Bool)

(declare-fun res!373594 () Bool)

(assert (=> b!585786 (=> (not res!373594) (not e!335083))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36617 (_ BitVec 32)) Bool)

(assert (=> b!585786 (= res!373594 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!585787 () Bool)

(declare-fun res!373601 () Bool)

(assert (=> b!585787 (=> (not res!373601) (not e!335083))))

(declare-datatypes ((List!11624 0))(
  ( (Nil!11621) (Cons!11620 (h!12665 (_ BitVec 64)) (t!17852 List!11624)) )
))
(declare-fun arrayNoDuplicates!0 (array!36617 (_ BitVec 32) List!11624) Bool)

(assert (=> b!585787 (= res!373601 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11621))))

(declare-fun b!585788 () Bool)

(declare-fun res!373603 () Bool)

(assert (=> b!585788 (=> (not res!373603) (not e!335083))))

(assert (=> b!585788 (= res!373603 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17583 a!2986) j!136) a!2986 mask!3053) (Found!6023 j!136)))))

(assert (= (and start!53716 res!373596) b!585778))

(assert (= (and b!585778 res!373597) b!585780))

(assert (= (and b!585780 res!373604) b!585784))

(assert (= (and b!585784 res!373595) b!585779))

(assert (= (and b!585779 res!373600) b!585782))

(assert (= (and b!585782 res!373602) b!585786))

(assert (= (and b!585786 res!373594) b!585787))

(assert (= (and b!585787 res!373601) b!585781))

(assert (= (and b!585781 res!373598) b!585788))

(assert (= (and b!585788 res!373603) b!585783))

(assert (= (and b!585783 res!373599) b!585785))

(declare-fun m!564037 () Bool)

(assert (=> b!585780 m!564037))

(assert (=> b!585780 m!564037))

(declare-fun m!564039 () Bool)

(assert (=> b!585780 m!564039))

(declare-fun m!564041 () Bool)

(assert (=> b!585781 m!564041))

(declare-fun m!564043 () Bool)

(assert (=> b!585781 m!564043))

(declare-fun m!564045 () Bool)

(assert (=> b!585781 m!564045))

(declare-fun m!564047 () Bool)

(assert (=> b!585783 m!564047))

(assert (=> b!585783 m!564037))

(declare-fun m!564049 () Bool)

(assert (=> b!585785 m!564049))

(declare-fun m!564051 () Bool)

(assert (=> b!585785 m!564051))

(assert (=> b!585785 m!564037))

(assert (=> b!585785 m!564043))

(assert (=> b!585785 m!564037))

(declare-fun m!564053 () Bool)

(assert (=> b!585785 m!564053))

(declare-fun m!564055 () Bool)

(assert (=> b!585785 m!564055))

(assert (=> b!585785 m!564051))

(declare-fun m!564057 () Bool)

(assert (=> b!585785 m!564057))

(declare-fun m!564059 () Bool)

(assert (=> b!585779 m!564059))

(declare-fun m!564061 () Bool)

(assert (=> b!585787 m!564061))

(declare-fun m!564063 () Bool)

(assert (=> b!585782 m!564063))

(assert (=> b!585788 m!564037))

(assert (=> b!585788 m!564037))

(declare-fun m!564065 () Bool)

(assert (=> b!585788 m!564065))

(declare-fun m!564067 () Bool)

(assert (=> b!585786 m!564067))

(declare-fun m!564069 () Bool)

(assert (=> start!53716 m!564069))

(declare-fun m!564071 () Bool)

(assert (=> start!53716 m!564071))

(declare-fun m!564073 () Bool)

(assert (=> b!585784 m!564073))

(push 1)

