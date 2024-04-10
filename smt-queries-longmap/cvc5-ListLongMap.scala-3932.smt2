; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53602 () Bool)

(assert start!53602)

(declare-fun b!583746 () Bool)

(declare-fun res!371567 () Bool)

(declare-fun e!334419 () Bool)

(assert (=> b!583746 (=> (not res!371567) (not e!334419))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!583746 (= res!371567 (validKeyInArray!0 k!1786))))

(declare-fun b!583747 () Bool)

(declare-fun res!371564 () Bool)

(declare-fun e!334420 () Bool)

(assert (=> b!583747 (=> (not res!371564) (not e!334420))))

(declare-datatypes ((array!36503 0))(
  ( (array!36504 (arr!17526 (Array (_ BitVec 32) (_ BitVec 64))) (size!17890 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36503)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36503 (_ BitVec 32)) Bool)

(assert (=> b!583747 (= res!371564 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!583749 () Bool)

(declare-fun e!334421 () Bool)

(assert (=> b!583749 (= e!334420 e!334421)))

(declare-fun res!371565 () Bool)

(assert (=> b!583749 (=> (not res!371565) (not e!334421))))

(declare-fun lt!265401 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!583749 (= res!371565 (and (bvsge lt!265401 #b00000000000000000000000000000000) (bvslt lt!265401 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!583749 (= lt!265401 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!583750 () Bool)

(declare-fun res!371573 () Bool)

(assert (=> b!583750 (=> (not res!371573) (not e!334420))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!583750 (= res!371573 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17526 a!2986) index!984) (select (arr!17526 a!2986) j!136))) (not (= (select (arr!17526 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!583751 () Bool)

(assert (=> b!583751 (= e!334421 false)))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5966 0))(
  ( (MissingZero!5966 (index!26091 (_ BitVec 32))) (Found!5966 (index!26092 (_ BitVec 32))) (Intermediate!5966 (undefined!6778 Bool) (index!26093 (_ BitVec 32)) (x!54931 (_ BitVec 32))) (Undefined!5966) (MissingVacant!5966 (index!26094 (_ BitVec 32))) )
))
(declare-fun lt!265402 () SeekEntryResult!5966)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36503 (_ BitVec 32)) SeekEntryResult!5966)

(assert (=> b!583751 (= lt!265402 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265401 vacantSpotIndex!68 (select (arr!17526 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!583752 () Bool)

(declare-fun res!371570 () Bool)

(assert (=> b!583752 (=> (not res!371570) (not e!334420))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!583752 (= res!371570 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17526 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17526 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!371571 () Bool)

(assert (=> start!53602 (=> (not res!371571) (not e!334419))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53602 (= res!371571 (validMask!0 mask!3053))))

(assert (=> start!53602 e!334419))

(assert (=> start!53602 true))

(declare-fun array_inv!13322 (array!36503) Bool)

(assert (=> start!53602 (array_inv!13322 a!2986)))

(declare-fun b!583748 () Bool)

(declare-fun res!371569 () Bool)

(assert (=> b!583748 (=> (not res!371569) (not e!334420))))

(declare-datatypes ((List!11567 0))(
  ( (Nil!11564) (Cons!11563 (h!12608 (_ BitVec 64)) (t!17795 List!11567)) )
))
(declare-fun arrayNoDuplicates!0 (array!36503 (_ BitVec 32) List!11567) Bool)

(assert (=> b!583748 (= res!371569 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11564))))

(declare-fun b!583753 () Bool)

(declare-fun res!371572 () Bool)

(assert (=> b!583753 (=> (not res!371572) (not e!334420))))

(assert (=> b!583753 (= res!371572 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17526 a!2986) j!136) a!2986 mask!3053) (Found!5966 j!136)))))

(declare-fun b!583754 () Bool)

(declare-fun res!371566 () Bool)

(assert (=> b!583754 (=> (not res!371566) (not e!334419))))

(assert (=> b!583754 (= res!371566 (validKeyInArray!0 (select (arr!17526 a!2986) j!136)))))

(declare-fun b!583755 () Bool)

(assert (=> b!583755 (= e!334419 e!334420)))

(declare-fun res!371563 () Bool)

(assert (=> b!583755 (=> (not res!371563) (not e!334420))))

(declare-fun lt!265400 () SeekEntryResult!5966)

(assert (=> b!583755 (= res!371563 (or (= lt!265400 (MissingZero!5966 i!1108)) (= lt!265400 (MissingVacant!5966 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36503 (_ BitVec 32)) SeekEntryResult!5966)

(assert (=> b!583755 (= lt!265400 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!583756 () Bool)

(declare-fun res!371562 () Bool)

(assert (=> b!583756 (=> (not res!371562) (not e!334419))))

(declare-fun arrayContainsKey!0 (array!36503 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!583756 (= res!371562 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!583757 () Bool)

(declare-fun res!371568 () Bool)

(assert (=> b!583757 (=> (not res!371568) (not e!334419))))

(assert (=> b!583757 (= res!371568 (and (= (size!17890 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17890 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17890 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!53602 res!371571) b!583757))

(assert (= (and b!583757 res!371568) b!583754))

(assert (= (and b!583754 res!371566) b!583746))

(assert (= (and b!583746 res!371567) b!583756))

(assert (= (and b!583756 res!371562) b!583755))

(assert (= (and b!583755 res!371563) b!583747))

(assert (= (and b!583747 res!371564) b!583748))

(assert (= (and b!583748 res!371569) b!583752))

(assert (= (and b!583752 res!371570) b!583753))

(assert (= (and b!583753 res!371572) b!583750))

(assert (= (and b!583750 res!371573) b!583749))

(assert (= (and b!583749 res!371565) b!583751))

(declare-fun m!562177 () Bool)

(assert (=> b!583754 m!562177))

(assert (=> b!583754 m!562177))

(declare-fun m!562179 () Bool)

(assert (=> b!583754 m!562179))

(declare-fun m!562181 () Bool)

(assert (=> b!583749 m!562181))

(declare-fun m!562183 () Bool)

(assert (=> start!53602 m!562183))

(declare-fun m!562185 () Bool)

(assert (=> start!53602 m!562185))

(declare-fun m!562187 () Bool)

(assert (=> b!583748 m!562187))

(declare-fun m!562189 () Bool)

(assert (=> b!583746 m!562189))

(assert (=> b!583753 m!562177))

(assert (=> b!583753 m!562177))

(declare-fun m!562191 () Bool)

(assert (=> b!583753 m!562191))

(declare-fun m!562193 () Bool)

(assert (=> b!583755 m!562193))

(declare-fun m!562195 () Bool)

(assert (=> b!583752 m!562195))

(declare-fun m!562197 () Bool)

(assert (=> b!583752 m!562197))

(declare-fun m!562199 () Bool)

(assert (=> b!583752 m!562199))

(assert (=> b!583751 m!562177))

(assert (=> b!583751 m!562177))

(declare-fun m!562201 () Bool)

(assert (=> b!583751 m!562201))

(declare-fun m!562203 () Bool)

(assert (=> b!583747 m!562203))

(declare-fun m!562205 () Bool)

(assert (=> b!583750 m!562205))

(assert (=> b!583750 m!562177))

(declare-fun m!562207 () Bool)

(assert (=> b!583756 m!562207))

(push 1)

