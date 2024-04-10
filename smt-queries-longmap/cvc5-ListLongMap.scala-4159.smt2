; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56642 () Bool)

(assert start!56642)

(declare-fun b!627745 () Bool)

(declare-fun res!405452 () Bool)

(declare-fun e!359338 () Bool)

(assert (=> b!627745 (=> (not res!405452) (not e!359338))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!37934 0))(
  ( (array!37935 (arr!18207 (Array (_ BitVec 32) (_ BitVec 64))) (size!18571 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37934)

(assert (=> b!627745 (= res!405452 (and (= (size!18571 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18571 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18571 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!627746 () Bool)

(declare-fun res!405454 () Bool)

(assert (=> b!627746 (=> (not res!405454) (not e!359338))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!627746 (= res!405454 (validKeyInArray!0 k!1786))))

(declare-fun b!627747 () Bool)

(declare-fun res!405455 () Bool)

(declare-fun e!359339 () Bool)

(assert (=> b!627747 (=> (not res!405455) (not e!359339))))

(declare-datatypes ((List!12248 0))(
  ( (Nil!12245) (Cons!12244 (h!13289 (_ BitVec 64)) (t!18476 List!12248)) )
))
(declare-fun arrayNoDuplicates!0 (array!37934 (_ BitVec 32) List!12248) Bool)

(assert (=> b!627747 (= res!405455 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12245))))

(declare-fun res!405445 () Bool)

(assert (=> start!56642 (=> (not res!405445) (not e!359338))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56642 (= res!405445 (validMask!0 mask!3053))))

(assert (=> start!56642 e!359338))

(assert (=> start!56642 true))

(declare-fun array_inv!14003 (array!37934) Bool)

(assert (=> start!56642 (array_inv!14003 a!2986)))

(declare-fun b!627748 () Bool)

(declare-fun res!405450 () Bool)

(assert (=> b!627748 (=> (not res!405450) (not e!359339))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!627748 (= res!405450 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18207 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18207 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!627749 () Bool)

(declare-fun res!405449 () Bool)

(assert (=> b!627749 (=> (not res!405449) (not e!359339))))

(declare-datatypes ((SeekEntryResult!6647 0))(
  ( (MissingZero!6647 (index!28872 (_ BitVec 32))) (Found!6647 (index!28873 (_ BitVec 32))) (Intermediate!6647 (undefined!7459 Bool) (index!28874 (_ BitVec 32)) (x!57611 (_ BitVec 32))) (Undefined!6647) (MissingVacant!6647 (index!28875 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37934 (_ BitVec 32)) SeekEntryResult!6647)

(assert (=> b!627749 (= res!405449 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18207 a!2986) j!136) a!2986 mask!3053) (Found!6647 j!136)))))

(declare-fun b!627750 () Bool)

(declare-fun res!405448 () Bool)

(assert (=> b!627750 (=> (not res!405448) (not e!359338))))

(declare-fun arrayContainsKey!0 (array!37934 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!627750 (= res!405448 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!627751 () Bool)

(declare-fun res!405447 () Bool)

(assert (=> b!627751 (=> (not res!405447) (not e!359339))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37934 (_ BitVec 32)) Bool)

(assert (=> b!627751 (= res!405447 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!627752 () Bool)

(declare-fun res!405453 () Bool)

(assert (=> b!627752 (=> (not res!405453) (not e!359339))))

(assert (=> b!627752 (= res!405453 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18207 a!2986) index!984) (select (arr!18207 a!2986) j!136))) (not (= (select (arr!18207 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!627753 () Bool)

(declare-fun res!405451 () Bool)

(assert (=> b!627753 (=> (not res!405451) (not e!359338))))

(assert (=> b!627753 (= res!405451 (validKeyInArray!0 (select (arr!18207 a!2986) j!136)))))

(declare-fun b!627754 () Bool)

(assert (=> b!627754 (= e!359338 e!359339)))

(declare-fun res!405446 () Bool)

(assert (=> b!627754 (=> (not res!405446) (not e!359339))))

(declare-fun lt!290335 () SeekEntryResult!6647)

(assert (=> b!627754 (= res!405446 (or (= lt!290335 (MissingZero!6647 i!1108)) (= lt!290335 (MissingVacant!6647 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37934 (_ BitVec 32)) SeekEntryResult!6647)

(assert (=> b!627754 (= lt!290335 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!627755 () Bool)

(assert (=> b!627755 (= e!359339 false)))

(declare-fun lt!290334 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!627755 (= lt!290334 (nextIndex!0 index!984 x!910 mask!3053))))

(assert (= (and start!56642 res!405445) b!627745))

(assert (= (and b!627745 res!405452) b!627753))

(assert (= (and b!627753 res!405451) b!627746))

(assert (= (and b!627746 res!405454) b!627750))

(assert (= (and b!627750 res!405448) b!627754))

(assert (= (and b!627754 res!405446) b!627751))

(assert (= (and b!627751 res!405447) b!627747))

(assert (= (and b!627747 res!405455) b!627748))

(assert (= (and b!627748 res!405450) b!627749))

(assert (= (and b!627749 res!405449) b!627752))

(assert (= (and b!627752 res!405453) b!627755))

(declare-fun m!603027 () Bool)

(assert (=> b!627747 m!603027))

(declare-fun m!603029 () Bool)

(assert (=> start!56642 m!603029))

(declare-fun m!603031 () Bool)

(assert (=> start!56642 m!603031))

(declare-fun m!603033 () Bool)

(assert (=> b!627749 m!603033))

(assert (=> b!627749 m!603033))

(declare-fun m!603035 () Bool)

(assert (=> b!627749 m!603035))

(declare-fun m!603037 () Bool)

(assert (=> b!627754 m!603037))

(declare-fun m!603039 () Bool)

(assert (=> b!627750 m!603039))

(declare-fun m!603041 () Bool)

(assert (=> b!627751 m!603041))

(declare-fun m!603043 () Bool)

(assert (=> b!627755 m!603043))

(declare-fun m!603045 () Bool)

(assert (=> b!627752 m!603045))

(assert (=> b!627752 m!603033))

(assert (=> b!627753 m!603033))

(assert (=> b!627753 m!603033))

(declare-fun m!603047 () Bool)

(assert (=> b!627753 m!603047))

(declare-fun m!603049 () Bool)

(assert (=> b!627746 m!603049))

(declare-fun m!603051 () Bool)

(assert (=> b!627748 m!603051))

(declare-fun m!603053 () Bool)

(assert (=> b!627748 m!603053))

(declare-fun m!603055 () Bool)

(assert (=> b!627748 m!603055))

(push 1)

