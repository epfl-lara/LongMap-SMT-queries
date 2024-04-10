; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56732 () Bool)

(assert start!56732)

(declare-fun b!628546 () Bool)

(declare-fun res!406107 () Bool)

(declare-fun e!359637 () Bool)

(assert (=> b!628546 (=> (not res!406107) (not e!359637))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37973 0))(
  ( (array!37974 (arr!18225 (Array (_ BitVec 32) (_ BitVec 64))) (size!18589 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37973)

(declare-datatypes ((SeekEntryResult!6665 0))(
  ( (MissingZero!6665 (index!28944 (_ BitVec 32))) (Found!6665 (index!28945 (_ BitVec 32))) (Intermediate!6665 (undefined!7477 Bool) (index!28946 (_ BitVec 32)) (x!57683 (_ BitVec 32))) (Undefined!6665) (MissingVacant!6665 (index!28947 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37973 (_ BitVec 32)) SeekEntryResult!6665)

(assert (=> b!628546 (= res!406107 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18225 a!2986) j!136) a!2986 mask!3053) (Found!6665 j!136)))))

(declare-fun b!628547 () Bool)

(declare-fun res!406111 () Bool)

(declare-fun e!359635 () Bool)

(assert (=> b!628547 (=> (not res!406111) (not e!359635))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!628547 (= res!406111 (validKeyInArray!0 (select (arr!18225 a!2986) j!136)))))

(declare-fun b!628548 () Bool)

(declare-fun res!406103 () Bool)

(assert (=> b!628548 (=> (not res!406103) (not e!359637))))

(declare-datatypes ((List!12266 0))(
  ( (Nil!12263) (Cons!12262 (h!13307 (_ BitVec 64)) (t!18494 List!12266)) )
))
(declare-fun arrayNoDuplicates!0 (array!37973 (_ BitVec 32) List!12266) Bool)

(assert (=> b!628548 (= res!406103 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12263))))

(declare-fun b!628549 () Bool)

(declare-fun res!406108 () Bool)

(assert (=> b!628549 (=> (not res!406108) (not e!359637))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!628549 (= res!406108 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18225 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18225 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!628550 () Bool)

(declare-fun res!406102 () Bool)

(assert (=> b!628550 (=> (not res!406102) (not e!359637))))

(assert (=> b!628550 (= res!406102 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18225 a!2986) index!984) (select (arr!18225 a!2986) j!136))) (not (= (select (arr!18225 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!628551 () Bool)

(assert (=> b!628551 (= e!359635 e!359637)))

(declare-fun res!406106 () Bool)

(assert (=> b!628551 (=> (not res!406106) (not e!359637))))

(declare-fun lt!290524 () SeekEntryResult!6665)

(assert (=> b!628551 (= res!406106 (or (= lt!290524 (MissingZero!6665 i!1108)) (= lt!290524 (MissingVacant!6665 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37973 (_ BitVec 32)) SeekEntryResult!6665)

(assert (=> b!628551 (= lt!290524 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!628552 () Bool)

(declare-fun res!406104 () Bool)

(assert (=> b!628552 (=> (not res!406104) (not e!359635))))

(assert (=> b!628552 (= res!406104 (and (= (size!18589 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18589 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18589 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!628553 () Bool)

(declare-fun res!406112 () Bool)

(assert (=> b!628553 (=> (not res!406112) (not e!359635))))

(assert (=> b!628553 (= res!406112 (validKeyInArray!0 k!1786))))

(declare-fun b!628554 () Bool)

(declare-fun res!406105 () Bool)

(assert (=> b!628554 (=> (not res!406105) (not e!359637))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37973 (_ BitVec 32)) Bool)

(assert (=> b!628554 (= res!406105 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!406110 () Bool)

(assert (=> start!56732 (=> (not res!406110) (not e!359635))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56732 (= res!406110 (validMask!0 mask!3053))))

(assert (=> start!56732 e!359635))

(assert (=> start!56732 true))

(declare-fun array_inv!14021 (array!37973) Bool)

(assert (=> start!56732 (array_inv!14021 a!2986)))

(declare-fun b!628555 () Bool)

(declare-fun res!406109 () Bool)

(assert (=> b!628555 (=> (not res!406109) (not e!359635))))

(declare-fun arrayContainsKey!0 (array!37973 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!628555 (= res!406109 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!628556 () Bool)

(declare-fun lt!290523 () (_ BitVec 32))

(assert (=> b!628556 (= e!359637 (and (bvsge lt!290523 #b00000000000000000000000000000000) (bvslt lt!290523 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvslt (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!628556 (= lt!290523 (nextIndex!0 index!984 x!910 mask!3053))))

(assert (= (and start!56732 res!406110) b!628552))

(assert (= (and b!628552 res!406104) b!628547))

(assert (= (and b!628547 res!406111) b!628553))

(assert (= (and b!628553 res!406112) b!628555))

(assert (= (and b!628555 res!406109) b!628551))

(assert (= (and b!628551 res!406106) b!628554))

(assert (= (and b!628554 res!406105) b!628548))

(assert (= (and b!628548 res!406103) b!628549))

(assert (= (and b!628549 res!406108) b!628546))

(assert (= (and b!628546 res!406107) b!628550))

(assert (= (and b!628550 res!406102) b!628556))

(declare-fun m!603687 () Bool)

(assert (=> b!628547 m!603687))

(assert (=> b!628547 m!603687))

(declare-fun m!603689 () Bool)

(assert (=> b!628547 m!603689))

(declare-fun m!603691 () Bool)

(assert (=> b!628555 m!603691))

(declare-fun m!603693 () Bool)

(assert (=> b!628553 m!603693))

(declare-fun m!603695 () Bool)

(assert (=> start!56732 m!603695))

(declare-fun m!603697 () Bool)

(assert (=> start!56732 m!603697))

(declare-fun m!603699 () Bool)

(assert (=> b!628556 m!603699))

(assert (=> b!628546 m!603687))

(assert (=> b!628546 m!603687))

(declare-fun m!603701 () Bool)

(assert (=> b!628546 m!603701))

(declare-fun m!603703 () Bool)

(assert (=> b!628550 m!603703))

(assert (=> b!628550 m!603687))

(declare-fun m!603705 () Bool)

(assert (=> b!628554 m!603705))

(declare-fun m!603707 () Bool)

(assert (=> b!628548 m!603707))

(declare-fun m!603709 () Bool)

(assert (=> b!628551 m!603709))

(declare-fun m!603711 () Bool)

(assert (=> b!628549 m!603711))

(declare-fun m!603713 () Bool)

(assert (=> b!628549 m!603713))

(declare-fun m!603715 () Bool)

(assert (=> b!628549 m!603715))

(push 1)

