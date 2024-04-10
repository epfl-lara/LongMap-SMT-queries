; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53962 () Bool)

(assert start!53962)

(declare-fun b!589249 () Bool)

(declare-fun e!336424 () Bool)

(assert (=> b!589249 (= e!336424 (not true))))

(declare-datatypes ((Unit!18382 0))(
  ( (Unit!18383) )
))
(declare-fun lt!267236 () Unit!18382)

(declare-fun e!336423 () Unit!18382)

(assert (=> b!589249 (= lt!267236 e!336423)))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun c!66596 () Bool)

(declare-datatypes ((array!36806 0))(
  ( (array!36807 (arr!17676 (Array (_ BitVec 32) (_ BitVec 64))) (size!18040 (_ BitVec 32))) )
))
(declare-fun lt!267234 () array!36806)

(declare-fun lt!267237 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6116 0))(
  ( (MissingZero!6116 (index!26694 (_ BitVec 32))) (Found!6116 (index!26695 (_ BitVec 32))) (Intermediate!6116 (undefined!6928 Bool) (index!26696 (_ BitVec 32)) (x!55490 (_ BitVec 32))) (Undefined!6116) (MissingVacant!6116 (index!26697 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36806 (_ BitVec 32)) SeekEntryResult!6116)

(assert (=> b!589249 (= c!66596 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!267237 lt!267234 mask!3053) Undefined!6116))))

(declare-fun e!336425 () Bool)

(assert (=> b!589249 e!336425))

(declare-fun res!376797 () Bool)

(assert (=> b!589249 (=> (not res!376797) (not e!336425))))

(declare-fun lt!267231 () (_ BitVec 32))

(declare-fun lt!267235 () SeekEntryResult!6116)

(assert (=> b!589249 (= res!376797 (= lt!267235 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267231 vacantSpotIndex!68 lt!267237 lt!267234 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun a!2986 () array!36806)

(assert (=> b!589249 (= lt!267235 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267231 vacantSpotIndex!68 (select (arr!17676 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!589249 (= lt!267237 (select (store (arr!17676 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!267238 () Unit!18382)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36806 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18382)

(assert (=> b!589249 (= lt!267238 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!267231 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!589249 (= lt!267231 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!589250 () Bool)

(declare-fun res!376794 () Bool)

(declare-fun e!336427 () Bool)

(assert (=> b!589250 (=> (not res!376794) (not e!336427))))

(assert (=> b!589250 (= res!376794 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17676 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!589251 () Bool)

(declare-fun res!376800 () Bool)

(declare-fun e!336429 () Bool)

(assert (=> b!589251 (=> (not res!376800) (not e!336429))))

(declare-fun arrayContainsKey!0 (array!36806 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!589251 (= res!376800 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!589252 () Bool)

(declare-fun e!336426 () Bool)

(assert (=> b!589252 (= e!336426 e!336424)))

(declare-fun res!376791 () Bool)

(assert (=> b!589252 (=> (not res!376791) (not e!336424))))

(declare-fun lt!267232 () SeekEntryResult!6116)

(assert (=> b!589252 (= res!376791 (and (= lt!267232 (Found!6116 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17676 a!2986) index!984) (select (arr!17676 a!2986) j!136))) (not (= (select (arr!17676 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!589252 (= lt!267232 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17676 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!589253 () Bool)

(declare-fun Unit!18384 () Unit!18382)

(assert (=> b!589253 (= e!336423 Unit!18384)))

(assert (=> b!589253 false))

(declare-fun b!589254 () Bool)

(declare-fun res!376798 () Bool)

(assert (=> b!589254 (=> (not res!376798) (not e!336427))))

(declare-datatypes ((List!11717 0))(
  ( (Nil!11714) (Cons!11713 (h!12758 (_ BitVec 64)) (t!17945 List!11717)) )
))
(declare-fun arrayNoDuplicates!0 (array!36806 (_ BitVec 32) List!11717) Bool)

(assert (=> b!589254 (= res!376798 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11714))))

(declare-fun res!376802 () Bool)

(assert (=> start!53962 (=> (not res!376802) (not e!336429))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53962 (= res!376802 (validMask!0 mask!3053))))

(assert (=> start!53962 e!336429))

(assert (=> start!53962 true))

(declare-fun array_inv!13472 (array!36806) Bool)

(assert (=> start!53962 (array_inv!13472 a!2986)))

(declare-fun b!589255 () Bool)

(declare-fun res!376795 () Bool)

(assert (=> b!589255 (=> (not res!376795) (not e!336427))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36806 (_ BitVec 32)) Bool)

(assert (=> b!589255 (= res!376795 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!589256 () Bool)

(declare-fun res!376793 () Bool)

(assert (=> b!589256 (=> (not res!376793) (not e!336429))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!589256 (= res!376793 (validKeyInArray!0 k!1786))))

(declare-fun b!589257 () Bool)

(assert (=> b!589257 (= e!336427 e!336426)))

(declare-fun res!376792 () Bool)

(assert (=> b!589257 (=> (not res!376792) (not e!336426))))

(assert (=> b!589257 (= res!376792 (= (select (store (arr!17676 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!589257 (= lt!267234 (array!36807 (store (arr!17676 a!2986) i!1108 k!1786) (size!18040 a!2986)))))

(declare-fun b!589258 () Bool)

(declare-fun res!376796 () Bool)

(assert (=> b!589258 (=> (not res!376796) (not e!336429))))

(assert (=> b!589258 (= res!376796 (validKeyInArray!0 (select (arr!17676 a!2986) j!136)))))

(declare-fun b!589259 () Bool)

(assert (=> b!589259 (= e!336425 (= lt!267232 lt!267235))))

(declare-fun b!589260 () Bool)

(declare-fun Unit!18385 () Unit!18382)

(assert (=> b!589260 (= e!336423 Unit!18385)))

(declare-fun b!589261 () Bool)

(declare-fun res!376801 () Bool)

(assert (=> b!589261 (=> (not res!376801) (not e!336429))))

(assert (=> b!589261 (= res!376801 (and (= (size!18040 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18040 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18040 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!589262 () Bool)

(assert (=> b!589262 (= e!336429 e!336427)))

(declare-fun res!376799 () Bool)

(assert (=> b!589262 (=> (not res!376799) (not e!336427))))

(declare-fun lt!267233 () SeekEntryResult!6116)

(assert (=> b!589262 (= res!376799 (or (= lt!267233 (MissingZero!6116 i!1108)) (= lt!267233 (MissingVacant!6116 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36806 (_ BitVec 32)) SeekEntryResult!6116)

(assert (=> b!589262 (= lt!267233 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(assert (= (and start!53962 res!376802) b!589261))

(assert (= (and b!589261 res!376801) b!589258))

(assert (= (and b!589258 res!376796) b!589256))

(assert (= (and b!589256 res!376793) b!589251))

(assert (= (and b!589251 res!376800) b!589262))

(assert (= (and b!589262 res!376799) b!589255))

(assert (= (and b!589255 res!376795) b!589254))

(assert (= (and b!589254 res!376798) b!589250))

(assert (= (and b!589250 res!376794) b!589257))

(assert (= (and b!589257 res!376792) b!589252))

(assert (= (and b!589252 res!376791) b!589249))

(assert (= (and b!589249 res!376797) b!589259))

(assert (= (and b!589249 c!66596) b!589253))

(assert (= (and b!589249 (not c!66596)) b!589260))

(declare-fun m!567787 () Bool)

(assert (=> b!589256 m!567787))

(declare-fun m!567789 () Bool)

(assert (=> b!589252 m!567789))

(declare-fun m!567791 () Bool)

(assert (=> b!589252 m!567791))

(assert (=> b!589252 m!567791))

(declare-fun m!567793 () Bool)

(assert (=> b!589252 m!567793))

(declare-fun m!567795 () Bool)

(assert (=> b!589255 m!567795))

(declare-fun m!567797 () Bool)

(assert (=> start!53962 m!567797))

(declare-fun m!567799 () Bool)

(assert (=> start!53962 m!567799))

(declare-fun m!567801 () Bool)

(assert (=> b!589262 m!567801))

(declare-fun m!567803 () Bool)

(assert (=> b!589250 m!567803))

(declare-fun m!567805 () Bool)

(assert (=> b!589257 m!567805))

(declare-fun m!567807 () Bool)

(assert (=> b!589257 m!567807))

(declare-fun m!567809 () Bool)

(assert (=> b!589251 m!567809))

(declare-fun m!567811 () Bool)

(assert (=> b!589254 m!567811))

(declare-fun m!567813 () Bool)

(assert (=> b!589249 m!567813))

(declare-fun m!567815 () Bool)

(assert (=> b!589249 m!567815))

(assert (=> b!589249 m!567791))

(declare-fun m!567817 () Bool)

(assert (=> b!589249 m!567817))

(assert (=> b!589249 m!567791))

(declare-fun m!567819 () Bool)

(assert (=> b!589249 m!567819))

(assert (=> b!589249 m!567805))

(declare-fun m!567821 () Bool)

(assert (=> b!589249 m!567821))

(declare-fun m!567823 () Bool)

(assert (=> b!589249 m!567823))

(assert (=> b!589258 m!567791))

(assert (=> b!589258 m!567791))

(declare-fun m!567825 () Bool)

(assert (=> b!589258 m!567825))

(push 1)

