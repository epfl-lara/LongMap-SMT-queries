; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53984 () Bool)

(assert start!53984)

(declare-fun b!589728 () Bool)

(declare-fun e!336675 () Bool)

(declare-fun e!336673 () Bool)

(assert (=> b!589728 (= e!336675 e!336673)))

(declare-fun res!377207 () Bool)

(assert (=> b!589728 (=> (not res!377207) (not e!336673))))

(declare-datatypes ((SeekEntryResult!6127 0))(
  ( (MissingZero!6127 (index!26738 (_ BitVec 32))) (Found!6127 (index!26739 (_ BitVec 32))) (Intermediate!6127 (undefined!6939 Bool) (index!26740 (_ BitVec 32)) (x!55525 (_ BitVec 32))) (Undefined!6127) (MissingVacant!6127 (index!26741 (_ BitVec 32))) )
))
(declare-fun lt!267511 () SeekEntryResult!6127)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!589728 (= res!377207 (or (= lt!267511 (MissingZero!6127 i!1108)) (= lt!267511 (MissingVacant!6127 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((array!36828 0))(
  ( (array!36829 (arr!17687 (Array (_ BitVec 32) (_ BitVec 64))) (size!18051 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36828)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36828 (_ BitVec 32)) SeekEntryResult!6127)

(assert (=> b!589728 (= lt!267511 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!589729 () Bool)

(declare-fun res!377215 () Bool)

(assert (=> b!589729 (=> (not res!377215) (not e!336675))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!589729 (= res!377215 (and (= (size!18051 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18051 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18051 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!589730 () Bool)

(declare-datatypes ((Unit!18426 0))(
  ( (Unit!18427) )
))
(declare-fun e!336672 () Unit!18426)

(declare-fun Unit!18428 () Unit!18426)

(assert (=> b!589730 (= e!336672 Unit!18428)))

(assert (=> b!589730 false))

(declare-fun b!589731 () Bool)

(declare-fun e!336671 () Bool)

(declare-fun e!336674 () Bool)

(assert (=> b!589731 (= e!336671 e!336674)))

(declare-fun res!377212 () Bool)

(assert (=> b!589731 (=> (not res!377212) (not e!336674))))

(declare-fun lt!267505 () SeekEntryResult!6127)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!589731 (= res!377212 (and (= lt!267505 (Found!6127 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17687 a!2986) index!984) (select (arr!17687 a!2986) j!136))) (not (= (select (arr!17687 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36828 (_ BitVec 32)) SeekEntryResult!6127)

(assert (=> b!589731 (= lt!267505 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17687 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!589733 () Bool)

(declare-fun Unit!18429 () Unit!18426)

(assert (=> b!589733 (= e!336672 Unit!18429)))

(declare-fun b!589734 () Bool)

(declare-fun res!377211 () Bool)

(assert (=> b!589734 (=> (not res!377211) (not e!336675))))

(declare-fun arrayContainsKey!0 (array!36828 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!589734 (= res!377211 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!589735 () Bool)

(declare-fun res!377208 () Bool)

(assert (=> b!589735 (=> (not res!377208) (not e!336675))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!589735 (= res!377208 (validKeyInArray!0 k!1786))))

(declare-fun b!589736 () Bool)

(declare-fun e!336678 () Bool)

(declare-fun lt!267504 () SeekEntryResult!6127)

(assert (=> b!589736 (= e!336678 (= lt!267505 lt!267504))))

(declare-fun b!589737 () Bool)

(declare-fun res!377210 () Bool)

(assert (=> b!589737 (=> (not res!377210) (not e!336673))))

(assert (=> b!589737 (= res!377210 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17687 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!589738 () Bool)

(declare-fun res!377213 () Bool)

(assert (=> b!589738 (=> (not res!377213) (not e!336673))))

(declare-datatypes ((List!11728 0))(
  ( (Nil!11725) (Cons!11724 (h!12769 (_ BitVec 64)) (t!17956 List!11728)) )
))
(declare-fun arrayNoDuplicates!0 (array!36828 (_ BitVec 32) List!11728) Bool)

(assert (=> b!589738 (= res!377213 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11725))))

(declare-fun b!589739 () Bool)

(declare-fun res!377205 () Bool)

(assert (=> b!589739 (=> (not res!377205) (not e!336675))))

(assert (=> b!589739 (= res!377205 (validKeyInArray!0 (select (arr!17687 a!2986) j!136)))))

(declare-fun b!589740 () Bool)

(declare-fun e!336677 () Bool)

(assert (=> b!589740 (= e!336677 true)))

(assert (=> b!589740 (= (select (store (arr!17687 a!2986) i!1108 k!1786) index!984) (select (arr!17687 a!2986) j!136))))

(declare-fun b!589732 () Bool)

(declare-fun res!377204 () Bool)

(assert (=> b!589732 (=> (not res!377204) (not e!336673))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36828 (_ BitVec 32)) Bool)

(assert (=> b!589732 (= res!377204 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!377206 () Bool)

(assert (=> start!53984 (=> (not res!377206) (not e!336675))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53984 (= res!377206 (validMask!0 mask!3053))))

(assert (=> start!53984 e!336675))

(assert (=> start!53984 true))

(declare-fun array_inv!13483 (array!36828) Bool)

(assert (=> start!53984 (array_inv!13483 a!2986)))

(declare-fun b!589741 () Bool)

(assert (=> b!589741 (= e!336673 e!336671)))

(declare-fun res!377209 () Bool)

(assert (=> b!589741 (=> (not res!377209) (not e!336671))))

(assert (=> b!589741 (= res!377209 (= (select (store (arr!17687 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!267507 () array!36828)

(assert (=> b!589741 (= lt!267507 (array!36829 (store (arr!17687 a!2986) i!1108 k!1786) (size!18051 a!2986)))))

(declare-fun b!589742 () Bool)

(assert (=> b!589742 (= e!336674 (not e!336677))))

(declare-fun res!377216 () Bool)

(assert (=> b!589742 (=> res!377216 e!336677)))

(declare-fun lt!267509 () SeekEntryResult!6127)

(assert (=> b!589742 (= res!377216 (not (= lt!267509 (Found!6127 index!984))))))

(declare-fun lt!267510 () Unit!18426)

(assert (=> b!589742 (= lt!267510 e!336672)))

(declare-fun c!66629 () Bool)

(assert (=> b!589742 (= c!66629 (= lt!267509 Undefined!6127))))

(declare-fun lt!267503 () (_ BitVec 64))

(assert (=> b!589742 (= lt!267509 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!267503 lt!267507 mask!3053))))

(assert (=> b!589742 e!336678))

(declare-fun res!377214 () Bool)

(assert (=> b!589742 (=> (not res!377214) (not e!336678))))

(declare-fun lt!267506 () (_ BitVec 32))

(assert (=> b!589742 (= res!377214 (= lt!267504 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267506 vacantSpotIndex!68 lt!267503 lt!267507 mask!3053)))))

(assert (=> b!589742 (= lt!267504 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267506 vacantSpotIndex!68 (select (arr!17687 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!589742 (= lt!267503 (select (store (arr!17687 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!267508 () Unit!18426)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36828 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18426)

(assert (=> b!589742 (= lt!267508 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!267506 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!589742 (= lt!267506 (nextIndex!0 index!984 x!910 mask!3053))))

(assert (= (and start!53984 res!377206) b!589729))

(assert (= (and b!589729 res!377215) b!589739))

(assert (= (and b!589739 res!377205) b!589735))

(assert (= (and b!589735 res!377208) b!589734))

(assert (= (and b!589734 res!377211) b!589728))

(assert (= (and b!589728 res!377207) b!589732))

(assert (= (and b!589732 res!377204) b!589738))

(assert (= (and b!589738 res!377213) b!589737))

(assert (= (and b!589737 res!377210) b!589741))

(assert (= (and b!589741 res!377209) b!589731))

(assert (= (and b!589731 res!377212) b!589742))

(assert (= (and b!589742 res!377214) b!589736))

(assert (= (and b!589742 c!66629) b!589730))

(assert (= (and b!589742 (not c!66629)) b!589733))

(assert (= (and b!589742 (not res!377216)) b!589740))

(declare-fun m!568237 () Bool)

(assert (=> b!589741 m!568237))

(declare-fun m!568239 () Bool)

(assert (=> b!589741 m!568239))

(declare-fun m!568241 () Bool)

(assert (=> b!589735 m!568241))

(declare-fun m!568243 () Bool)

(assert (=> b!589739 m!568243))

(assert (=> b!589739 m!568243))

(declare-fun m!568245 () Bool)

(assert (=> b!589739 m!568245))

(declare-fun m!568247 () Bool)

(assert (=> b!589742 m!568247))

(declare-fun m!568249 () Bool)

(assert (=> b!589742 m!568249))

(assert (=> b!589742 m!568243))

(assert (=> b!589742 m!568237))

(declare-fun m!568251 () Bool)

(assert (=> b!589742 m!568251))

(assert (=> b!589742 m!568243))

(declare-fun m!568253 () Bool)

(assert (=> b!589742 m!568253))

(declare-fun m!568255 () Bool)

(assert (=> b!589742 m!568255))

(declare-fun m!568257 () Bool)

(assert (=> b!589742 m!568257))

(declare-fun m!568259 () Bool)

(assert (=> b!589728 m!568259))

(assert (=> b!589740 m!568237))

(declare-fun m!568261 () Bool)

(assert (=> b!589740 m!568261))

(assert (=> b!589740 m!568243))

(declare-fun m!568263 () Bool)

(assert (=> b!589737 m!568263))

(declare-fun m!568265 () Bool)

(assert (=> b!589731 m!568265))

(assert (=> b!589731 m!568243))

(assert (=> b!589731 m!568243))

(declare-fun m!568267 () Bool)

(assert (=> b!589731 m!568267))

(declare-fun m!568269 () Bool)

(assert (=> start!53984 m!568269))

(declare-fun m!568271 () Bool)

(assert (=> start!53984 m!568271))

(declare-fun m!568273 () Bool)

(assert (=> b!589734 m!568273))

(declare-fun m!568275 () Bool)

(assert (=> b!589738 m!568275))

(declare-fun m!568277 () Bool)

(assert (=> b!589732 m!568277))

(push 1)

