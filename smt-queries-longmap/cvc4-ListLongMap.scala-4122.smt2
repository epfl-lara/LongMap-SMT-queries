; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56282 () Bool)

(assert start!56282)

(declare-fun b!623915 () Bool)

(declare-fun res!402110 () Bool)

(declare-fun e!357844 () Bool)

(assert (=> b!623915 (=> (not res!402110) (not e!357844))))

(declare-datatypes ((array!37707 0))(
  ( (array!37708 (arr!18098 (Array (_ BitVec 32) (_ BitVec 64))) (size!18462 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37707)

(declare-datatypes ((List!12139 0))(
  ( (Nil!12136) (Cons!12135 (h!13180 (_ BitVec 64)) (t!18367 List!12139)) )
))
(declare-fun arrayNoDuplicates!0 (array!37707 (_ BitVec 32) List!12139) Bool)

(assert (=> b!623915 (= res!402110 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12136))))

(declare-fun b!623916 () Bool)

(declare-fun res!402102 () Bool)

(assert (=> b!623916 (=> (not res!402102) (not e!357844))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!623916 (= res!402102 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18098 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18098 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!623917 () Bool)

(declare-fun res!402101 () Bool)

(declare-fun e!357846 () Bool)

(assert (=> b!623917 (=> (not res!402101) (not e!357846))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!623917 (= res!402101 (validKeyInArray!0 (select (arr!18098 a!2986) j!136)))))

(declare-fun b!623918 () Bool)

(declare-fun res!402103 () Bool)

(assert (=> b!623918 (=> (not res!402103) (not e!357844))))

(declare-datatypes ((SeekEntryResult!6538 0))(
  ( (MissingZero!6538 (index!28436 (_ BitVec 32))) (Found!6538 (index!28437 (_ BitVec 32))) (Intermediate!6538 (undefined!7350 Bool) (index!28438 (_ BitVec 32)) (x!57197 (_ BitVec 32))) (Undefined!6538) (MissingVacant!6538 (index!28439 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37707 (_ BitVec 32)) SeekEntryResult!6538)

(assert (=> b!623918 (= res!402103 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18098 a!2986) j!136) a!2986 mask!3053) (Found!6538 j!136)))))

(declare-fun res!402109 () Bool)

(assert (=> start!56282 (=> (not res!402109) (not e!357846))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56282 (= res!402109 (validMask!0 mask!3053))))

(assert (=> start!56282 e!357846))

(assert (=> start!56282 true))

(declare-fun array_inv!13894 (array!37707) Bool)

(assert (=> start!56282 (array_inv!13894 a!2986)))

(declare-fun b!623919 () Bool)

(declare-fun res!402107 () Bool)

(assert (=> b!623919 (=> (not res!402107) (not e!357846))))

(assert (=> b!623919 (= res!402107 (validKeyInArray!0 k!1786))))

(declare-fun b!623920 () Bool)

(assert (=> b!623920 (= e!357846 e!357844)))

(declare-fun res!402108 () Bool)

(assert (=> b!623920 (=> (not res!402108) (not e!357844))))

(declare-fun lt!289387 () SeekEntryResult!6538)

(assert (=> b!623920 (= res!402108 (or (= lt!289387 (MissingZero!6538 i!1108)) (= lt!289387 (MissingVacant!6538 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37707 (_ BitVec 32)) SeekEntryResult!6538)

(assert (=> b!623920 (= lt!289387 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!623921 () Bool)

(declare-fun res!402105 () Bool)

(assert (=> b!623921 (=> (not res!402105) (not e!357846))))

(assert (=> b!623921 (= res!402105 (and (= (size!18462 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18462 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18462 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!623922 () Bool)

(declare-fun res!402104 () Bool)

(assert (=> b!623922 (=> (not res!402104) (not e!357846))))

(declare-fun arrayContainsKey!0 (array!37707 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!623922 (= res!402104 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!623923 () Bool)

(declare-fun res!402106 () Bool)

(assert (=> b!623923 (=> (not res!402106) (not e!357844))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37707 (_ BitVec 32)) Bool)

(assert (=> b!623923 (= res!402106 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!623924 () Bool)

(assert (=> b!623924 (= e!357844 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18098 a!2986) index!984) (select (arr!18098 a!2986) j!136))) (not (= (select (arr!18098 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (= index!984 j!136)))))

(assert (= (and start!56282 res!402109) b!623921))

(assert (= (and b!623921 res!402105) b!623917))

(assert (= (and b!623917 res!402101) b!623919))

(assert (= (and b!623919 res!402107) b!623922))

(assert (= (and b!623922 res!402104) b!623920))

(assert (= (and b!623920 res!402108) b!623923))

(assert (= (and b!623923 res!402106) b!623915))

(assert (= (and b!623915 res!402110) b!623916))

(assert (= (and b!623916 res!402102) b!623918))

(assert (= (and b!623918 res!402103) b!623924))

(declare-fun m!599677 () Bool)

(assert (=> b!623922 m!599677))

(declare-fun m!599679 () Bool)

(assert (=> start!56282 m!599679))

(declare-fun m!599681 () Bool)

(assert (=> start!56282 m!599681))

(declare-fun m!599683 () Bool)

(assert (=> b!623917 m!599683))

(assert (=> b!623917 m!599683))

(declare-fun m!599685 () Bool)

(assert (=> b!623917 m!599685))

(declare-fun m!599687 () Bool)

(assert (=> b!623919 m!599687))

(declare-fun m!599689 () Bool)

(assert (=> b!623924 m!599689))

(assert (=> b!623924 m!599683))

(declare-fun m!599691 () Bool)

(assert (=> b!623920 m!599691))

(declare-fun m!599693 () Bool)

(assert (=> b!623916 m!599693))

(declare-fun m!599695 () Bool)

(assert (=> b!623916 m!599695))

(declare-fun m!599697 () Bool)

(assert (=> b!623916 m!599697))

(declare-fun m!599699 () Bool)

(assert (=> b!623923 m!599699))

(declare-fun m!599701 () Bool)

(assert (=> b!623915 m!599701))

(assert (=> b!623918 m!599683))

(assert (=> b!623918 m!599683))

(declare-fun m!599703 () Bool)

(assert (=> b!623918 m!599703))

(push 1)

(assert (not b!623915))

(assert (not start!56282))

(assert (not b!623917))

(assert (not b!623918))

