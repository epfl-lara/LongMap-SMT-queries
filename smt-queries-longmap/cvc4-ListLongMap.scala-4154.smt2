; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56616 () Bool)

(assert start!56616)

(declare-fun b!627316 () Bool)

(declare-fun res!405016 () Bool)

(declare-fun e!359223 () Bool)

(assert (=> b!627316 (=> (not res!405016) (not e!359223))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!37908 0))(
  ( (array!37909 (arr!18194 (Array (_ BitVec 32) (_ BitVec 64))) (size!18558 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37908)

(assert (=> b!627316 (= res!405016 (and (= (size!18558 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18558 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18558 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!627317 () Bool)

(declare-fun res!405021 () Bool)

(declare-fun e!359221 () Bool)

(assert (=> b!627317 (=> (not res!405021) (not e!359221))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37908 (_ BitVec 32)) Bool)

(assert (=> b!627317 (= res!405021 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!405020 () Bool)

(assert (=> start!56616 (=> (not res!405020) (not e!359223))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56616 (= res!405020 (validMask!0 mask!3053))))

(assert (=> start!56616 e!359223))

(assert (=> start!56616 true))

(declare-fun array_inv!13990 (array!37908) Bool)

(assert (=> start!56616 (array_inv!13990 a!2986)))

(declare-fun b!627318 () Bool)

(declare-fun res!405024 () Bool)

(assert (=> b!627318 (=> (not res!405024) (not e!359223))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!627318 (= res!405024 (validKeyInArray!0 (select (arr!18194 a!2986) j!136)))))

(declare-fun b!627319 () Bool)

(declare-fun res!405019 () Bool)

(assert (=> b!627319 (=> (not res!405019) (not e!359221))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6634 0))(
  ( (MissingZero!6634 (index!28820 (_ BitVec 32))) (Found!6634 (index!28821 (_ BitVec 32))) (Intermediate!6634 (undefined!7446 Bool) (index!28822 (_ BitVec 32)) (x!57558 (_ BitVec 32))) (Undefined!6634) (MissingVacant!6634 (index!28823 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37908 (_ BitVec 32)) SeekEntryResult!6634)

(assert (=> b!627319 (= res!405019 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18194 a!2986) j!136) a!2986 mask!3053) (Found!6634 j!136)))))

(declare-fun b!627320 () Bool)

(declare-fun res!405018 () Bool)

(assert (=> b!627320 (=> (not res!405018) (not e!359221))))

(assert (=> b!627320 (= res!405018 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18194 a!2986) index!984) (select (arr!18194 a!2986) j!136))) (not (= (select (arr!18194 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!627321 () Bool)

(declare-fun res!405026 () Bool)

(assert (=> b!627321 (=> (not res!405026) (not e!359221))))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!627321 (= res!405026 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18194 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18194 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!627322 () Bool)

(declare-fun res!405023 () Bool)

(assert (=> b!627322 (=> (not res!405023) (not e!359223))))

(assert (=> b!627322 (= res!405023 (validKeyInArray!0 k!1786))))

(declare-fun b!627323 () Bool)

(assert (=> b!627323 (= e!359223 e!359221)))

(declare-fun res!405025 () Bool)

(assert (=> b!627323 (=> (not res!405025) (not e!359221))))

(declare-fun lt!290257 () SeekEntryResult!6634)

(assert (=> b!627323 (= res!405025 (or (= lt!290257 (MissingZero!6634 i!1108)) (= lt!290257 (MissingVacant!6634 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37908 (_ BitVec 32)) SeekEntryResult!6634)

(assert (=> b!627323 (= lt!290257 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!627324 () Bool)

(declare-fun res!405022 () Bool)

(assert (=> b!627324 (=> (not res!405022) (not e!359221))))

(declare-datatypes ((List!12235 0))(
  ( (Nil!12232) (Cons!12231 (h!13276 (_ BitVec 64)) (t!18463 List!12235)) )
))
(declare-fun arrayNoDuplicates!0 (array!37908 (_ BitVec 32) List!12235) Bool)

(assert (=> b!627324 (= res!405022 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12232))))

(declare-fun b!627325 () Bool)

(assert (=> b!627325 (= e!359221 false)))

(declare-fun lt!290256 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!627325 (= lt!290256 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!627326 () Bool)

(declare-fun res!405017 () Bool)

(assert (=> b!627326 (=> (not res!405017) (not e!359223))))

(declare-fun arrayContainsKey!0 (array!37908 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!627326 (= res!405017 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!56616 res!405020) b!627316))

(assert (= (and b!627316 res!405016) b!627318))

(assert (= (and b!627318 res!405024) b!627322))

(assert (= (and b!627322 res!405023) b!627326))

(assert (= (and b!627326 res!405017) b!627323))

(assert (= (and b!627323 res!405025) b!627317))

(assert (= (and b!627317 res!405021) b!627324))

(assert (= (and b!627324 res!405022) b!627321))

(assert (= (and b!627321 res!405026) b!627319))

(assert (= (and b!627319 res!405019) b!627320))

(assert (= (and b!627320 res!405018) b!627325))

(declare-fun m!602637 () Bool)

(assert (=> b!627326 m!602637))

(declare-fun m!602639 () Bool)

(assert (=> b!627321 m!602639))

(declare-fun m!602641 () Bool)

(assert (=> b!627321 m!602641))

(declare-fun m!602643 () Bool)

(assert (=> b!627321 m!602643))

(declare-fun m!602645 () Bool)

(assert (=> b!627324 m!602645))

(declare-fun m!602647 () Bool)

(assert (=> b!627320 m!602647))

(declare-fun m!602649 () Bool)

(assert (=> b!627320 m!602649))

(assert (=> b!627318 m!602649))

(assert (=> b!627318 m!602649))

(declare-fun m!602651 () Bool)

(assert (=> b!627318 m!602651))

(declare-fun m!602653 () Bool)

(assert (=> b!627317 m!602653))

(declare-fun m!602655 () Bool)

(assert (=> start!56616 m!602655))

(declare-fun m!602657 () Bool)

(assert (=> start!56616 m!602657))

(declare-fun m!602659 () Bool)

(assert (=> b!627322 m!602659))

(declare-fun m!602661 () Bool)

(assert (=> b!627323 m!602661))

(declare-fun m!602663 () Bool)

(assert (=> b!627325 m!602663))

(assert (=> b!627319 m!602649))

(assert (=> b!627319 m!602649))

(declare-fun m!602665 () Bool)

(assert (=> b!627319 m!602665))

(push 1)

(assert (not b!627323))

(assert (not b!627322))

(assert (not b!627317))

(assert (not b!627324))

(assert (not b!627319))

(assert (not start!56616))

