; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56564 () Bool)

(assert start!56564)

(declare-fun b!626544 () Bool)

(declare-fun res!404249 () Bool)

(declare-fun e!358988 () Bool)

(assert (=> b!626544 (=> (not res!404249) (not e!358988))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37856 0))(
  ( (array!37857 (arr!18168 (Array (_ BitVec 32) (_ BitVec 64))) (size!18532 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37856)

(assert (=> b!626544 (= res!404249 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18168 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18168 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!626545 () Bool)

(declare-fun res!404248 () Bool)

(declare-fun e!358987 () Bool)

(assert (=> b!626545 (=> (not res!404248) (not e!358987))))

(declare-fun arrayContainsKey!0 (array!37856 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!626545 (= res!404248 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!626546 () Bool)

(declare-fun res!404247 () Bool)

(assert (=> b!626546 (=> (not res!404247) (not e!358988))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37856 (_ BitVec 32)) Bool)

(assert (=> b!626546 (= res!404247 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!626547 () Bool)

(declare-fun res!404252 () Bool)

(assert (=> b!626547 (=> (not res!404252) (not e!358988))))

(declare-datatypes ((List!12209 0))(
  ( (Nil!12206) (Cons!12205 (h!13250 (_ BitVec 64)) (t!18437 List!12209)) )
))
(declare-fun arrayNoDuplicates!0 (array!37856 (_ BitVec 32) List!12209) Bool)

(assert (=> b!626547 (= res!404252 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12206))))

(declare-fun b!626548 () Bool)

(assert (=> b!626548 (= e!358988 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6608 0))(
  ( (MissingZero!6608 (index!28716 (_ BitVec 32))) (Found!6608 (index!28717 (_ BitVec 32))) (Intermediate!6608 (undefined!7420 Bool) (index!28718 (_ BitVec 32)) (x!57468 (_ BitVec 32))) (Undefined!6608) (MissingVacant!6608 (index!28719 (_ BitVec 32))) )
))
(declare-fun lt!290100 () SeekEntryResult!6608)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37856 (_ BitVec 32)) SeekEntryResult!6608)

(assert (=> b!626548 (= lt!290100 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18168 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!626549 () Bool)

(declare-fun res!404245 () Bool)

(assert (=> b!626549 (=> (not res!404245) (not e!358987))))

(assert (=> b!626549 (= res!404245 (and (= (size!18532 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18532 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18532 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!626551 () Bool)

(assert (=> b!626551 (= e!358987 e!358988)))

(declare-fun res!404251 () Bool)

(assert (=> b!626551 (=> (not res!404251) (not e!358988))))

(declare-fun lt!290101 () SeekEntryResult!6608)

(assert (=> b!626551 (= res!404251 (or (= lt!290101 (MissingZero!6608 i!1108)) (= lt!290101 (MissingVacant!6608 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37856 (_ BitVec 32)) SeekEntryResult!6608)

(assert (=> b!626551 (= lt!290101 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!626552 () Bool)

(declare-fun res!404250 () Bool)

(assert (=> b!626552 (=> (not res!404250) (not e!358987))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!626552 (= res!404250 (validKeyInArray!0 k!1786))))

(declare-fun b!626550 () Bool)

(declare-fun res!404246 () Bool)

(assert (=> b!626550 (=> (not res!404246) (not e!358987))))

(assert (=> b!626550 (= res!404246 (validKeyInArray!0 (select (arr!18168 a!2986) j!136)))))

(declare-fun res!404244 () Bool)

(assert (=> start!56564 (=> (not res!404244) (not e!358987))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56564 (= res!404244 (validMask!0 mask!3053))))

(assert (=> start!56564 e!358987))

(assert (=> start!56564 true))

(declare-fun array_inv!13964 (array!37856) Bool)

(assert (=> start!56564 (array_inv!13964 a!2986)))

(assert (= (and start!56564 res!404244) b!626549))

(assert (= (and b!626549 res!404245) b!626550))

(assert (= (and b!626550 res!404246) b!626552))

(assert (= (and b!626552 res!404250) b!626545))

(assert (= (and b!626545 res!404248) b!626551))

(assert (= (and b!626551 res!404251) b!626546))

(assert (= (and b!626546 res!404247) b!626547))

(assert (= (and b!626547 res!404252) b!626544))

(assert (= (and b!626544 res!404249) b!626548))

(declare-fun m!601917 () Bool)

(assert (=> b!626552 m!601917))

(declare-fun m!601919 () Bool)

(assert (=> b!626544 m!601919))

(declare-fun m!601921 () Bool)

(assert (=> b!626544 m!601921))

(declare-fun m!601923 () Bool)

(assert (=> b!626544 m!601923))

(declare-fun m!601925 () Bool)

(assert (=> b!626548 m!601925))

(assert (=> b!626548 m!601925))

(declare-fun m!601927 () Bool)

(assert (=> b!626548 m!601927))

(assert (=> b!626550 m!601925))

(assert (=> b!626550 m!601925))

(declare-fun m!601929 () Bool)

(assert (=> b!626550 m!601929))

(declare-fun m!601931 () Bool)

(assert (=> b!626546 m!601931))

(declare-fun m!601933 () Bool)

(assert (=> b!626547 m!601933))

(declare-fun m!601935 () Bool)

(assert (=> b!626551 m!601935))

(declare-fun m!601937 () Bool)

(assert (=> b!626545 m!601937))

(declare-fun m!601939 () Bool)

(assert (=> start!56564 m!601939))

(declare-fun m!601941 () Bool)

(assert (=> start!56564 m!601941))

(push 1)

