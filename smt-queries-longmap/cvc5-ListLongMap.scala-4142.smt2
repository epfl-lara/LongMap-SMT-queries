; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56446 () Bool)

(assert start!56446)

(declare-fun b!625761 () Bool)

(declare-fun res!403771 () Bool)

(declare-fun e!358591 () Bool)

(assert (=> b!625761 (=> (not res!403771) (not e!358591))))

(declare-datatypes ((array!37826 0))(
  ( (array!37827 (arr!18156 (Array (_ BitVec 32) (_ BitVec 64))) (size!18520 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37826)

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37826 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!625761 (= res!403771 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!625762 () Bool)

(declare-fun res!403770 () Bool)

(assert (=> b!625762 (=> (not res!403770) (not e!358591))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!625762 (= res!403770 (validKeyInArray!0 (select (arr!18156 a!2986) j!136)))))

(declare-fun b!625763 () Bool)

(declare-fun res!403774 () Bool)

(declare-fun e!358593 () Bool)

(assert (=> b!625763 (=> (not res!403774) (not e!358593))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37826 (_ BitVec 32)) Bool)

(assert (=> b!625763 (= res!403774 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!403772 () Bool)

(assert (=> start!56446 (=> (not res!403772) (not e!358591))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56446 (= res!403772 (validMask!0 mask!3053))))

(assert (=> start!56446 e!358591))

(assert (=> start!56446 true))

(declare-fun array_inv!13952 (array!37826) Bool)

(assert (=> start!56446 (array_inv!13952 a!2986)))

(declare-fun b!625764 () Bool)

(assert (=> b!625764 (= e!358593 false)))

(declare-datatypes ((SeekEntryResult!6596 0))(
  ( (MissingZero!6596 (index!28668 (_ BitVec 32))) (Found!6596 (index!28669 (_ BitVec 32))) (Intermediate!6596 (undefined!7408 Bool) (index!28670 (_ BitVec 32)) (x!57418 (_ BitVec 32))) (Undefined!6596) (MissingVacant!6596 (index!28671 (_ BitVec 32))) )
))
(declare-fun lt!289897 () SeekEntryResult!6596)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37826 (_ BitVec 32)) SeekEntryResult!6596)

(assert (=> b!625764 (= lt!289897 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18156 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!625765 () Bool)

(assert (=> b!625765 (= e!358591 e!358593)))

(declare-fun res!403769 () Bool)

(assert (=> b!625765 (=> (not res!403769) (not e!358593))))

(declare-fun lt!289896 () SeekEntryResult!6596)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!625765 (= res!403769 (or (= lt!289896 (MissingZero!6596 i!1108)) (= lt!289896 (MissingVacant!6596 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37826 (_ BitVec 32)) SeekEntryResult!6596)

(assert (=> b!625765 (= lt!289896 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!625766 () Bool)

(declare-fun res!403775 () Bool)

(assert (=> b!625766 (=> (not res!403775) (not e!358591))))

(assert (=> b!625766 (= res!403775 (validKeyInArray!0 k!1786))))

(declare-fun b!625767 () Bool)

(declare-fun res!403767 () Bool)

(assert (=> b!625767 (=> (not res!403767) (not e!358591))))

(assert (=> b!625767 (= res!403767 (and (= (size!18520 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18520 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18520 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!625768 () Bool)

(declare-fun res!403768 () Bool)

(assert (=> b!625768 (=> (not res!403768) (not e!358593))))

(declare-datatypes ((List!12197 0))(
  ( (Nil!12194) (Cons!12193 (h!13238 (_ BitVec 64)) (t!18425 List!12197)) )
))
(declare-fun arrayNoDuplicates!0 (array!37826 (_ BitVec 32) List!12197) Bool)

(assert (=> b!625768 (= res!403768 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12194))))

(declare-fun b!625769 () Bool)

(declare-fun res!403773 () Bool)

(assert (=> b!625769 (=> (not res!403773) (not e!358593))))

(assert (=> b!625769 (= res!403773 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18156 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18156 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!56446 res!403772) b!625767))

(assert (= (and b!625767 res!403767) b!625762))

(assert (= (and b!625762 res!403770) b!625766))

(assert (= (and b!625766 res!403775) b!625761))

(assert (= (and b!625761 res!403771) b!625765))

(assert (= (and b!625765 res!403769) b!625763))

(assert (= (and b!625763 res!403774) b!625768))

(assert (= (and b!625768 res!403768) b!625769))

(assert (= (and b!625769 res!403773) b!625764))

(declare-fun m!601319 () Bool)

(assert (=> b!625768 m!601319))

(declare-fun m!601321 () Bool)

(assert (=> b!625766 m!601321))

(declare-fun m!601323 () Bool)

(assert (=> b!625765 m!601323))

(declare-fun m!601325 () Bool)

(assert (=> b!625762 m!601325))

(assert (=> b!625762 m!601325))

(declare-fun m!601327 () Bool)

(assert (=> b!625762 m!601327))

(declare-fun m!601329 () Bool)

(assert (=> b!625769 m!601329))

(declare-fun m!601331 () Bool)

(assert (=> b!625769 m!601331))

(declare-fun m!601333 () Bool)

(assert (=> b!625769 m!601333))

(declare-fun m!601335 () Bool)

(assert (=> b!625761 m!601335))

(declare-fun m!601337 () Bool)

(assert (=> start!56446 m!601337))

(declare-fun m!601339 () Bool)

(assert (=> start!56446 m!601339))

(declare-fun m!601341 () Bool)

(assert (=> b!625763 m!601341))

(assert (=> b!625764 m!601325))

(assert (=> b!625764 m!601325))

(declare-fun m!601343 () Bool)

(assert (=> b!625764 m!601343))

(push 1)

