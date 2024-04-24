; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53994 () Bool)

(assert start!53994)

(declare-fun b!589080 () Bool)

(declare-fun res!376578 () Bool)

(declare-fun e!336363 () Bool)

(assert (=> b!589080 (=> (not res!376578) (not e!336363))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36783 0))(
  ( (array!36784 (arr!17662 (Array (_ BitVec 32) (_ BitVec 64))) (size!18026 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36783)

(assert (=> b!589080 (= res!376578 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17662 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!589081 () Bool)

(declare-datatypes ((Unit!18325 0))(
  ( (Unit!18326) )
))
(declare-fun e!336369 () Unit!18325)

(declare-fun Unit!18327 () Unit!18325)

(assert (=> b!589081 (= e!336369 Unit!18327)))

(assert (=> b!589081 false))

(declare-fun b!589082 () Bool)

(declare-fun e!336364 () Bool)

(declare-fun e!336365 () Bool)

(assert (=> b!589082 (= e!336364 e!336365)))

(declare-fun res!376571 () Bool)

(assert (=> b!589082 (=> (not res!376571) (not e!336365))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6058 0))(
  ( (MissingZero!6058 (index!26462 (_ BitVec 32))) (Found!6058 (index!26463 (_ BitVec 32))) (Intermediate!6058 (undefined!6870 Bool) (index!26464 (_ BitVec 32)) (x!55411 (_ BitVec 32))) (Undefined!6058) (MissingVacant!6058 (index!26465 (_ BitVec 32))) )
))
(declare-fun lt!267118 () SeekEntryResult!6058)

(assert (=> b!589082 (= res!376571 (and (= lt!267118 (Found!6058 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17662 a!2986) index!984) (select (arr!17662 a!2986) j!136))) (not (= (select (arr!17662 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36783 (_ BitVec 32)) SeekEntryResult!6058)

(assert (=> b!589082 (= lt!267118 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17662 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!589083 () Bool)

(declare-fun res!376572 () Bool)

(assert (=> b!589083 (=> (not res!376572) (not e!336363))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36783 (_ BitVec 32)) Bool)

(assert (=> b!589083 (= res!376572 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!589084 () Bool)

(declare-fun res!376580 () Bool)

(declare-fun e!336367 () Bool)

(assert (=> b!589084 (=> (not res!376580) (not e!336367))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!589084 (= res!376580 (validKeyInArray!0 (select (arr!17662 a!2986) j!136)))))

(declare-fun b!589085 () Bool)

(declare-fun res!376582 () Bool)

(assert (=> b!589085 (=> (not res!376582) (not e!336367))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36783 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!589085 (= res!376582 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!589086 () Bool)

(declare-fun res!376577 () Bool)

(assert (=> b!589086 (=> (not res!376577) (not e!336363))))

(declare-datatypes ((List!11610 0))(
  ( (Nil!11607) (Cons!11606 (h!12654 (_ BitVec 64)) (t!17830 List!11610)) )
))
(declare-fun arrayNoDuplicates!0 (array!36783 (_ BitVec 32) List!11610) Bool)

(assert (=> b!589086 (= res!376577 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11607))))

(declare-fun res!376576 () Bool)

(assert (=> start!53994 (=> (not res!376576) (not e!336367))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53994 (= res!376576 (validMask!0 mask!3053))))

(assert (=> start!53994 e!336367))

(assert (=> start!53994 true))

(declare-fun array_inv!13521 (array!36783) Bool)

(assert (=> start!53994 (array_inv!13521 a!2986)))

(declare-fun b!589087 () Bool)

(assert (=> b!589087 (= e!336367 e!336363)))

(declare-fun res!376581 () Bool)

(assert (=> b!589087 (=> (not res!376581) (not e!336363))))

(declare-fun lt!267123 () SeekEntryResult!6058)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!589087 (= res!376581 (or (= lt!267123 (MissingZero!6058 i!1108)) (= lt!267123 (MissingVacant!6058 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36783 (_ BitVec 32)) SeekEntryResult!6058)

(assert (=> b!589087 (= lt!267123 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!589088 () Bool)

(declare-fun Unit!18328 () Unit!18325)

(assert (=> b!589088 (= e!336369 Unit!18328)))

(declare-fun b!589089 () Bool)

(assert (=> b!589089 (= e!336363 e!336364)))

(declare-fun res!376574 () Bool)

(assert (=> b!589089 (=> (not res!376574) (not e!336364))))

(assert (=> b!589089 (= res!376574 (= (select (store (arr!17662 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!267122 () array!36783)

(assert (=> b!589089 (= lt!267122 (array!36784 (store (arr!17662 a!2986) i!1108 k0!1786) (size!18026 a!2986)))))

(declare-fun b!589090 () Bool)

(declare-fun res!376573 () Bool)

(assert (=> b!589090 (=> (not res!376573) (not e!336367))))

(assert (=> b!589090 (= res!376573 (validKeyInArray!0 k0!1786))))

(declare-fun b!589091 () Bool)

(assert (=> b!589091 (= e!336365 (not true))))

(declare-fun lt!267121 () Unit!18325)

(assert (=> b!589091 (= lt!267121 e!336369)))

(declare-fun c!66623 () Bool)

(declare-fun lt!267119 () (_ BitVec 64))

(assert (=> b!589091 (= c!66623 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!267119 lt!267122 mask!3053) Undefined!6058))))

(declare-fun e!336368 () Bool)

(assert (=> b!589091 e!336368))

(declare-fun res!376579 () Bool)

(assert (=> b!589091 (=> (not res!376579) (not e!336368))))

(declare-fun lt!267117 () SeekEntryResult!6058)

(declare-fun lt!267124 () (_ BitVec 32))

(assert (=> b!589091 (= res!376579 (= lt!267117 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267124 vacantSpotIndex!68 lt!267119 lt!267122 mask!3053)))))

(assert (=> b!589091 (= lt!267117 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267124 vacantSpotIndex!68 (select (arr!17662 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!589091 (= lt!267119 (select (store (arr!17662 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!267120 () Unit!18325)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36783 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18325)

(assert (=> b!589091 (= lt!267120 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!267124 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!589091 (= lt!267124 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!589092 () Bool)

(assert (=> b!589092 (= e!336368 (= lt!267118 lt!267117))))

(declare-fun b!589093 () Bool)

(declare-fun res!376575 () Bool)

(assert (=> b!589093 (=> (not res!376575) (not e!336367))))

(assert (=> b!589093 (= res!376575 (and (= (size!18026 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18026 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18026 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!53994 res!376576) b!589093))

(assert (= (and b!589093 res!376575) b!589084))

(assert (= (and b!589084 res!376580) b!589090))

(assert (= (and b!589090 res!376573) b!589085))

(assert (= (and b!589085 res!376582) b!589087))

(assert (= (and b!589087 res!376581) b!589083))

(assert (= (and b!589083 res!376572) b!589086))

(assert (= (and b!589086 res!376577) b!589080))

(assert (= (and b!589080 res!376578) b!589089))

(assert (= (and b!589089 res!376574) b!589082))

(assert (= (and b!589082 res!376571) b!589091))

(assert (= (and b!589091 res!376579) b!589092))

(assert (= (and b!589091 c!66623) b!589081))

(assert (= (and b!589091 (not c!66623)) b!589088))

(declare-fun m!567791 () Bool)

(assert (=> b!589083 m!567791))

(declare-fun m!567793 () Bool)

(assert (=> b!589090 m!567793))

(declare-fun m!567795 () Bool)

(assert (=> b!589091 m!567795))

(declare-fun m!567797 () Bool)

(assert (=> b!589091 m!567797))

(declare-fun m!567799 () Bool)

(assert (=> b!589091 m!567799))

(declare-fun m!567801 () Bool)

(assert (=> b!589091 m!567801))

(declare-fun m!567803 () Bool)

(assert (=> b!589091 m!567803))

(declare-fun m!567805 () Bool)

(assert (=> b!589091 m!567805))

(assert (=> b!589091 m!567801))

(declare-fun m!567807 () Bool)

(assert (=> b!589091 m!567807))

(declare-fun m!567809 () Bool)

(assert (=> b!589091 m!567809))

(declare-fun m!567811 () Bool)

(assert (=> b!589086 m!567811))

(declare-fun m!567813 () Bool)

(assert (=> b!589087 m!567813))

(declare-fun m!567815 () Bool)

(assert (=> b!589080 m!567815))

(declare-fun m!567817 () Bool)

(assert (=> b!589082 m!567817))

(assert (=> b!589082 m!567801))

(assert (=> b!589082 m!567801))

(declare-fun m!567819 () Bool)

(assert (=> b!589082 m!567819))

(declare-fun m!567821 () Bool)

(assert (=> start!53994 m!567821))

(declare-fun m!567823 () Bool)

(assert (=> start!53994 m!567823))

(assert (=> b!589084 m!567801))

(assert (=> b!589084 m!567801))

(declare-fun m!567825 () Bool)

(assert (=> b!589084 m!567825))

(assert (=> b!589089 m!567803))

(declare-fun m!567827 () Bool)

(assert (=> b!589089 m!567827))

(declare-fun m!567829 () Bool)

(assert (=> b!589085 m!567829))

(check-sat (not b!589091) (not b!589084) (not b!589083) (not b!589082) (not b!589090) (not b!589087) (not b!589086) (not start!53994) (not b!589085))
(check-sat)
