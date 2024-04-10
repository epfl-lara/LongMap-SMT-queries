; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56440 () Bool)

(assert start!56440)

(declare-fun res!403689 () Bool)

(declare-fun e!358564 () Bool)

(assert (=> start!56440 (=> (not res!403689) (not e!358564))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56440 (= res!403689 (validMask!0 mask!3053))))

(assert (=> start!56440 e!358564))

(assert (=> start!56440 true))

(declare-datatypes ((array!37820 0))(
  ( (array!37821 (arr!18153 (Array (_ BitVec 32) (_ BitVec 64))) (size!18517 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37820)

(declare-fun array_inv!13949 (array!37820) Bool)

(assert (=> start!56440 (array_inv!13949 a!2986)))

(declare-fun b!625680 () Bool)

(declare-fun res!403687 () Bool)

(assert (=> b!625680 (=> (not res!403687) (not e!358564))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!625680 (= res!403687 (validKeyInArray!0 (select (arr!18153 a!2986) j!136)))))

(declare-fun b!625681 () Bool)

(declare-fun res!403686 () Bool)

(assert (=> b!625681 (=> (not res!403686) (not e!358564))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37820 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!625681 (= res!403686 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!625682 () Bool)

(declare-fun res!403694 () Bool)

(declare-fun e!358566 () Bool)

(assert (=> b!625682 (=> (not res!403694) (not e!358566))))

(declare-datatypes ((List!12194 0))(
  ( (Nil!12191) (Cons!12190 (h!13235 (_ BitVec 64)) (t!18422 List!12194)) )
))
(declare-fun arrayNoDuplicates!0 (array!37820 (_ BitVec 32) List!12194) Bool)

(assert (=> b!625682 (= res!403694 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12191))))

(declare-fun b!625683 () Bool)

(declare-fun res!403692 () Bool)

(assert (=> b!625683 (=> (not res!403692) (not e!358566))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!625683 (= res!403692 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18153 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18153 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!625684 () Bool)

(declare-fun res!403691 () Bool)

(assert (=> b!625684 (=> (not res!403691) (not e!358564))))

(assert (=> b!625684 (= res!403691 (and (= (size!18517 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18517 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18517 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!625685 () Bool)

(declare-fun res!403690 () Bool)

(assert (=> b!625685 (=> (not res!403690) (not e!358566))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37820 (_ BitVec 32)) Bool)

(assert (=> b!625685 (= res!403690 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!625686 () Bool)

(assert (=> b!625686 (= e!358566 false)))

(declare-datatypes ((SeekEntryResult!6593 0))(
  ( (MissingZero!6593 (index!28656 (_ BitVec 32))) (Found!6593 (index!28657 (_ BitVec 32))) (Intermediate!6593 (undefined!7405 Bool) (index!28658 (_ BitVec 32)) (x!57407 (_ BitVec 32))) (Undefined!6593) (MissingVacant!6593 (index!28659 (_ BitVec 32))) )
))
(declare-fun lt!289879 () SeekEntryResult!6593)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37820 (_ BitVec 32)) SeekEntryResult!6593)

(assert (=> b!625686 (= lt!289879 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18153 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!625687 () Bool)

(assert (=> b!625687 (= e!358564 e!358566)))

(declare-fun res!403693 () Bool)

(assert (=> b!625687 (=> (not res!403693) (not e!358566))))

(declare-fun lt!289878 () SeekEntryResult!6593)

(assert (=> b!625687 (= res!403693 (or (= lt!289878 (MissingZero!6593 i!1108)) (= lt!289878 (MissingVacant!6593 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37820 (_ BitVec 32)) SeekEntryResult!6593)

(assert (=> b!625687 (= lt!289878 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!625688 () Bool)

(declare-fun res!403688 () Bool)

(assert (=> b!625688 (=> (not res!403688) (not e!358564))))

(assert (=> b!625688 (= res!403688 (validKeyInArray!0 k!1786))))

(assert (= (and start!56440 res!403689) b!625684))

(assert (= (and b!625684 res!403691) b!625680))

(assert (= (and b!625680 res!403687) b!625688))

(assert (= (and b!625688 res!403688) b!625681))

(assert (= (and b!625681 res!403686) b!625687))

(assert (= (and b!625687 res!403693) b!625685))

(assert (= (and b!625685 res!403690) b!625682))

(assert (= (and b!625682 res!403694) b!625683))

(assert (= (and b!625683 res!403692) b!625686))

(declare-fun m!601241 () Bool)

(assert (=> start!56440 m!601241))

(declare-fun m!601243 () Bool)

(assert (=> start!56440 m!601243))

(declare-fun m!601245 () Bool)

(assert (=> b!625681 m!601245))

(declare-fun m!601247 () Bool)

(assert (=> b!625683 m!601247))

(declare-fun m!601249 () Bool)

(assert (=> b!625683 m!601249))

(declare-fun m!601251 () Bool)

(assert (=> b!625683 m!601251))

(declare-fun m!601253 () Bool)

(assert (=> b!625685 m!601253))

(declare-fun m!601255 () Bool)

(assert (=> b!625686 m!601255))

(assert (=> b!625686 m!601255))

(declare-fun m!601257 () Bool)

(assert (=> b!625686 m!601257))

(declare-fun m!601259 () Bool)

(assert (=> b!625688 m!601259))

(declare-fun m!601261 () Bool)

(assert (=> b!625682 m!601261))

(declare-fun m!601263 () Bool)

(assert (=> b!625687 m!601263))

(assert (=> b!625680 m!601255))

(assert (=> b!625680 m!601255))

(declare-fun m!601265 () Bool)

(assert (=> b!625680 m!601265))

(push 1)

