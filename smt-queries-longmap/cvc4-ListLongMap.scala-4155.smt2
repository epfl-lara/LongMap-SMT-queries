; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56622 () Bool)

(assert start!56622)

(declare-fun b!627415 () Bool)

(declare-fun e!359248 () Bool)

(assert (=> b!627415 (= e!359248 false)))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lt!290275 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!627415 (= lt!290275 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!627416 () Bool)

(declare-fun res!405123 () Bool)

(assert (=> b!627416 (=> (not res!405123) (not e!359248))))

(declare-datatypes ((array!37914 0))(
  ( (array!37915 (arr!18197 (Array (_ BitVec 32) (_ BitVec 64))) (size!18561 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37914)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37914 (_ BitVec 32)) Bool)

(assert (=> b!627416 (= res!405123 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!627417 () Bool)

(declare-fun res!405122 () Bool)

(declare-fun e!359249 () Bool)

(assert (=> b!627417 (=> (not res!405122) (not e!359249))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!627417 (= res!405122 (validKeyInArray!0 (select (arr!18197 a!2986) j!136)))))

(declare-fun b!627418 () Bool)

(declare-fun res!405118 () Bool)

(assert (=> b!627418 (=> (not res!405118) (not e!359248))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6637 0))(
  ( (MissingZero!6637 (index!28832 (_ BitVec 32))) (Found!6637 (index!28833 (_ BitVec 32))) (Intermediate!6637 (undefined!7449 Bool) (index!28834 (_ BitVec 32)) (x!57569 (_ BitVec 32))) (Undefined!6637) (MissingVacant!6637 (index!28835 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37914 (_ BitVec 32)) SeekEntryResult!6637)

(assert (=> b!627418 (= res!405118 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18197 a!2986) j!136) a!2986 mask!3053) (Found!6637 j!136)))))

(declare-fun b!627419 () Bool)

(declare-fun res!405120 () Bool)

(assert (=> b!627419 (=> (not res!405120) (not e!359249))))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!627419 (= res!405120 (validKeyInArray!0 k!1786))))

(declare-fun b!627420 () Bool)

(declare-fun res!405117 () Bool)

(assert (=> b!627420 (=> (not res!405117) (not e!359248))))

(declare-datatypes ((List!12238 0))(
  ( (Nil!12235) (Cons!12234 (h!13279 (_ BitVec 64)) (t!18466 List!12238)) )
))
(declare-fun arrayNoDuplicates!0 (array!37914 (_ BitVec 32) List!12238) Bool)

(assert (=> b!627420 (= res!405117 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12235))))

(declare-fun b!627421 () Bool)

(assert (=> b!627421 (= e!359249 e!359248)))

(declare-fun res!405116 () Bool)

(assert (=> b!627421 (=> (not res!405116) (not e!359248))))

(declare-fun lt!290274 () SeekEntryResult!6637)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!627421 (= res!405116 (or (= lt!290274 (MissingZero!6637 i!1108)) (= lt!290274 (MissingVacant!6637 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37914 (_ BitVec 32)) SeekEntryResult!6637)

(assert (=> b!627421 (= lt!290274 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun res!405121 () Bool)

(assert (=> start!56622 (=> (not res!405121) (not e!359249))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56622 (= res!405121 (validMask!0 mask!3053))))

(assert (=> start!56622 e!359249))

(assert (=> start!56622 true))

(declare-fun array_inv!13993 (array!37914) Bool)

(assert (=> start!56622 (array_inv!13993 a!2986)))

(declare-fun b!627422 () Bool)

(declare-fun res!405125 () Bool)

(assert (=> b!627422 (=> (not res!405125) (not e!359249))))

(assert (=> b!627422 (= res!405125 (and (= (size!18561 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18561 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18561 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!627423 () Bool)

(declare-fun res!405115 () Bool)

(assert (=> b!627423 (=> (not res!405115) (not e!359249))))

(declare-fun arrayContainsKey!0 (array!37914 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!627423 (= res!405115 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!627424 () Bool)

(declare-fun res!405124 () Bool)

(assert (=> b!627424 (=> (not res!405124) (not e!359248))))

(assert (=> b!627424 (= res!405124 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18197 a!2986) index!984) (select (arr!18197 a!2986) j!136))) (not (= (select (arr!18197 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!627425 () Bool)

(declare-fun res!405119 () Bool)

(assert (=> b!627425 (=> (not res!405119) (not e!359248))))

(assert (=> b!627425 (= res!405119 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18197 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18197 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!56622 res!405121) b!627422))

(assert (= (and b!627422 res!405125) b!627417))

(assert (= (and b!627417 res!405122) b!627419))

(assert (= (and b!627419 res!405120) b!627423))

(assert (= (and b!627423 res!405115) b!627421))

(assert (= (and b!627421 res!405116) b!627416))

(assert (= (and b!627416 res!405123) b!627420))

(assert (= (and b!627420 res!405117) b!627425))

(assert (= (and b!627425 res!405119) b!627418))

(assert (= (and b!627418 res!405118) b!627424))

(assert (= (and b!627424 res!405124) b!627415))

(declare-fun m!602727 () Bool)

(assert (=> b!627424 m!602727))

(declare-fun m!602729 () Bool)

(assert (=> b!627424 m!602729))

(assert (=> b!627417 m!602729))

(assert (=> b!627417 m!602729))

(declare-fun m!602731 () Bool)

(assert (=> b!627417 m!602731))

(declare-fun m!602733 () Bool)

(assert (=> b!627423 m!602733))

(declare-fun m!602735 () Bool)

(assert (=> start!56622 m!602735))

(declare-fun m!602737 () Bool)

(assert (=> start!56622 m!602737))

(declare-fun m!602739 () Bool)

(assert (=> b!627419 m!602739))

(declare-fun m!602741 () Bool)

(assert (=> b!627425 m!602741))

(declare-fun m!602743 () Bool)

(assert (=> b!627425 m!602743))

(declare-fun m!602745 () Bool)

(assert (=> b!627425 m!602745))

(assert (=> b!627418 m!602729))

(assert (=> b!627418 m!602729))

(declare-fun m!602747 () Bool)

(assert (=> b!627418 m!602747))

(declare-fun m!602749 () Bool)

(assert (=> b!627415 m!602749))

(declare-fun m!602751 () Bool)

(assert (=> b!627421 m!602751))

(declare-fun m!602753 () Bool)

(assert (=> b!627420 m!602753))

(declare-fun m!602755 () Bool)

(assert (=> b!627416 m!602755))

(push 1)

(assert (not b!627421))

