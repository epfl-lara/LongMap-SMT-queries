; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53732 () Bool)

(assert start!53732)

(declare-fun b!586042 () Bool)

(declare-fun res!373867 () Bool)

(declare-fun e!335157 () Bool)

(assert (=> b!586042 (=> (not res!373867) (not e!335157))))

(declare-datatypes ((array!36633 0))(
  ( (array!36634 (arr!17591 (Array (_ BitVec 32) (_ BitVec 64))) (size!17955 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36633)

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36633 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!586042 (= res!373867 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!586043 () Bool)

(declare-fun res!373868 () Bool)

(declare-fun e!335156 () Bool)

(assert (=> b!586043 (=> (not res!373868) (not e!335156))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!586043 (= res!373868 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17591 a!2986) index!984) (select (arr!17591 a!2986) j!136))) (not (= (select (arr!17591 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun res!373861 () Bool)

(assert (=> start!53732 (=> (not res!373861) (not e!335157))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53732 (= res!373861 (validMask!0 mask!3053))))

(assert (=> start!53732 e!335157))

(assert (=> start!53732 true))

(declare-fun array_inv!13387 (array!36633) Bool)

(assert (=> start!53732 (array_inv!13387 a!2986)))

(declare-fun b!586044 () Bool)

(declare-fun res!373858 () Bool)

(assert (=> b!586044 (=> (not res!373858) (not e!335156))))

(declare-datatypes ((List!11632 0))(
  ( (Nil!11629) (Cons!11628 (h!12673 (_ BitVec 64)) (t!17860 List!11632)) )
))
(declare-fun arrayNoDuplicates!0 (array!36633 (_ BitVec 32) List!11632) Bool)

(assert (=> b!586044 (= res!373858 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11629))))

(declare-fun b!586045 () Bool)

(assert (=> b!586045 (= e!335156 (not true))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!265986 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6031 0))(
  ( (MissingZero!6031 (index!26351 (_ BitVec 32))) (Found!6031 (index!26352 (_ BitVec 32))) (Intermediate!6031 (undefined!6843 Bool) (index!26353 (_ BitVec 32)) (x!55164 (_ BitVec 32))) (Undefined!6031) (MissingVacant!6031 (index!26354 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36633 (_ BitVec 32)) SeekEntryResult!6031)

(assert (=> b!586045 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265986 vacantSpotIndex!68 (select (arr!17591 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265986 vacantSpotIndex!68 (select (store (arr!17591 a!2986) i!1108 k!1786) j!136) (array!36634 (store (arr!17591 a!2986) i!1108 k!1786) (size!17955 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18182 0))(
  ( (Unit!18183) )
))
(declare-fun lt!265987 () Unit!18182)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36633 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18182)

(assert (=> b!586045 (= lt!265987 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!265986 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!586045 (= lt!265986 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!586046 () Bool)

(declare-fun res!373866 () Bool)

(assert (=> b!586046 (=> (not res!373866) (not e!335156))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36633 (_ BitVec 32)) Bool)

(assert (=> b!586046 (= res!373866 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!586047 () Bool)

(assert (=> b!586047 (= e!335157 e!335156)))

(declare-fun res!373862 () Bool)

(assert (=> b!586047 (=> (not res!373862) (not e!335156))))

(declare-fun lt!265985 () SeekEntryResult!6031)

(assert (=> b!586047 (= res!373862 (or (= lt!265985 (MissingZero!6031 i!1108)) (= lt!265985 (MissingVacant!6031 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36633 (_ BitVec 32)) SeekEntryResult!6031)

(assert (=> b!586047 (= lt!265985 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!586048 () Bool)

(declare-fun res!373863 () Bool)

(assert (=> b!586048 (=> (not res!373863) (not e!335156))))

(assert (=> b!586048 (= res!373863 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17591 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17591 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!586049 () Bool)

(declare-fun res!373859 () Bool)

(assert (=> b!586049 (=> (not res!373859) (not e!335157))))

(assert (=> b!586049 (= res!373859 (and (= (size!17955 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17955 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17955 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!586050 () Bool)

(declare-fun res!373860 () Bool)

(assert (=> b!586050 (=> (not res!373860) (not e!335157))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!586050 (= res!373860 (validKeyInArray!0 k!1786))))

(declare-fun b!586051 () Bool)

(declare-fun res!373865 () Bool)

(assert (=> b!586051 (=> (not res!373865) (not e!335156))))

(assert (=> b!586051 (= res!373865 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17591 a!2986) j!136) a!2986 mask!3053) (Found!6031 j!136)))))

(declare-fun b!586052 () Bool)

(declare-fun res!373864 () Bool)

(assert (=> b!586052 (=> (not res!373864) (not e!335157))))

(assert (=> b!586052 (= res!373864 (validKeyInArray!0 (select (arr!17591 a!2986) j!136)))))

(assert (= (and start!53732 res!373861) b!586049))

(assert (= (and b!586049 res!373859) b!586052))

(assert (= (and b!586052 res!373864) b!586050))

(assert (= (and b!586050 res!373860) b!586042))

(assert (= (and b!586042 res!373867) b!586047))

(assert (= (and b!586047 res!373862) b!586046))

(assert (= (and b!586046 res!373866) b!586044))

(assert (= (and b!586044 res!373858) b!586048))

(assert (= (and b!586048 res!373863) b!586051))

(assert (= (and b!586051 res!373865) b!586043))

(assert (= (and b!586043 res!373868) b!586045))

(declare-fun m!564341 () Bool)

(assert (=> start!53732 m!564341))

(declare-fun m!564343 () Bool)

(assert (=> start!53732 m!564343))

(declare-fun m!564345 () Bool)

(assert (=> b!586047 m!564345))

(declare-fun m!564347 () Bool)

(assert (=> b!586042 m!564347))

(declare-fun m!564349 () Bool)

(assert (=> b!586052 m!564349))

(assert (=> b!586052 m!564349))

(declare-fun m!564351 () Bool)

(assert (=> b!586052 m!564351))

(declare-fun m!564353 () Bool)

(assert (=> b!586046 m!564353))

(declare-fun m!564355 () Bool)

(assert (=> b!586044 m!564355))

(declare-fun m!564357 () Bool)

(assert (=> b!586050 m!564357))

(declare-fun m!564359 () Bool)

(assert (=> b!586048 m!564359))

(declare-fun m!564361 () Bool)

(assert (=> b!586048 m!564361))

(declare-fun m!564363 () Bool)

(assert (=> b!586048 m!564363))

(declare-fun m!564365 () Bool)

(assert (=> b!586045 m!564365))

(declare-fun m!564367 () Bool)

(assert (=> b!586045 m!564367))

(declare-fun m!564369 () Bool)

(assert (=> b!586045 m!564369))

(assert (=> b!586045 m!564349))

(assert (=> b!586045 m!564349))

(declare-fun m!564371 () Bool)

(assert (=> b!586045 m!564371))

(assert (=> b!586045 m!564367))

(declare-fun m!564373 () Bool)

(assert (=> b!586045 m!564373))

(assert (=> b!586045 m!564361))

(declare-fun m!564375 () Bool)

(assert (=> b!586043 m!564375))

(assert (=> b!586043 m!564349))

(assert (=> b!586051 m!564349))

(assert (=> b!586051 m!564349))

(declare-fun m!564377 () Bool)

(assert (=> b!586051 m!564377))

(push 1)

