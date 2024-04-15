; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54240 () Bool)

(assert start!54240)

(declare-fun b!592558 () Bool)

(declare-fun res!379330 () Bool)

(declare-fun e!338401 () Bool)

(assert (=> b!592558 (=> (not res!379330) (not e!338401))))

(declare-datatypes ((array!36921 0))(
  ( (array!36922 (arr!17729 (Array (_ BitVec 32) (_ BitVec 64))) (size!18094 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36921)

(declare-datatypes ((List!11809 0))(
  ( (Nil!11806) (Cons!11805 (h!12850 (_ BitVec 64)) (t!18028 List!11809)) )
))
(declare-fun arrayNoDuplicates!0 (array!36921 (_ BitVec 32) List!11809) Bool)

(assert (=> b!592558 (= res!379330 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11806))))

(declare-fun b!592559 () Bool)

(declare-fun e!338402 () Bool)

(declare-fun e!338409 () Bool)

(assert (=> b!592559 (= e!338402 e!338409)))

(declare-fun res!379324 () Bool)

(assert (=> b!592559 (=> res!379324 e!338409)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!268877 () (_ BitVec 64))

(declare-fun lt!268884 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!592559 (= res!379324 (or (not (= (select (arr!17729 a!2986) j!136) lt!268884)) (not (= (select (arr!17729 a!2986) j!136) lt!268877)) (bvsge j!136 index!984)))))

(declare-fun b!592560 () Bool)

(declare-fun e!338404 () Bool)

(declare-datatypes ((SeekEntryResult!6166 0))(
  ( (MissingZero!6166 (index!26903 (_ BitVec 32))) (Found!6166 (index!26904 (_ BitVec 32))) (Intermediate!6166 (undefined!6978 Bool) (index!26905 (_ BitVec 32)) (x!55706 (_ BitVec 32))) (Undefined!6166) (MissingVacant!6166 (index!26906 (_ BitVec 32))) )
))
(declare-fun lt!268878 () SeekEntryResult!6166)

(declare-fun lt!268876 () SeekEntryResult!6166)

(assert (=> b!592560 (= e!338404 (= lt!268878 lt!268876))))

(declare-fun e!338403 () Bool)

(declare-fun lt!268879 () array!36921)

(declare-fun b!592561 () Bool)

(declare-fun arrayContainsKey!0 (array!36921 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!592561 (= e!338403 (arrayContainsKey!0 lt!268879 (select (arr!17729 a!2986) j!136) index!984))))

(declare-fun b!592562 () Bool)

(declare-fun res!379332 () Bool)

(assert (=> b!592562 (=> (not res!379332) (not e!338401))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36921 (_ BitVec 32)) Bool)

(assert (=> b!592562 (= res!379332 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!592563 () Bool)

(declare-fun res!379329 () Bool)

(declare-fun e!338407 () Bool)

(assert (=> b!592563 (=> (not res!379329) (not e!338407))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!592563 (= res!379329 (validKeyInArray!0 (select (arr!17729 a!2986) j!136)))))

(declare-fun b!592564 () Bool)

(declare-fun e!338405 () Bool)

(declare-fun e!338400 () Bool)

(assert (=> b!592564 (= e!338405 e!338400)))

(declare-fun res!379338 () Bool)

(assert (=> b!592564 (=> res!379338 e!338400)))

(assert (=> b!592564 (= res!379338 (or (not (= (select (arr!17729 a!2986) j!136) lt!268884)) (not (= (select (arr!17729 a!2986) j!136) lt!268877)) (bvsge j!136 index!984)))))

(assert (=> b!592564 e!338402))

(declare-fun res!379333 () Bool)

(assert (=> b!592564 (=> (not res!379333) (not e!338402))))

(assert (=> b!592564 (= res!379333 (= lt!268877 (select (arr!17729 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!592564 (= lt!268877 (select (store (arr!17729 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!592565 () Bool)

(declare-fun e!338398 () Bool)

(assert (=> b!592565 (= e!338398 (not e!338405))))

(declare-fun res!379339 () Bool)

(assert (=> b!592565 (=> res!379339 e!338405)))

(declare-fun lt!268880 () SeekEntryResult!6166)

(assert (=> b!592565 (= res!379339 (not (= lt!268880 (Found!6166 index!984))))))

(declare-datatypes ((Unit!18576 0))(
  ( (Unit!18577) )
))
(declare-fun lt!268885 () Unit!18576)

(declare-fun e!338406 () Unit!18576)

(assert (=> b!592565 (= lt!268885 e!338406)))

(declare-fun c!66984 () Bool)

(assert (=> b!592565 (= c!66984 (= lt!268880 Undefined!6166))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36921 (_ BitVec 32)) SeekEntryResult!6166)

(assert (=> b!592565 (= lt!268880 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!268884 lt!268879 mask!3053))))

(assert (=> b!592565 e!338404))

(declare-fun res!379326 () Bool)

(assert (=> b!592565 (=> (not res!379326) (not e!338404))))

(declare-fun lt!268882 () (_ BitVec 32))

(assert (=> b!592565 (= res!379326 (= lt!268876 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268882 vacantSpotIndex!68 lt!268884 lt!268879 mask!3053)))))

(assert (=> b!592565 (= lt!268876 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268882 vacantSpotIndex!68 (select (arr!17729 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!592565 (= lt!268884 (select (store (arr!17729 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!268875 () Unit!18576)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36921 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18576)

(assert (=> b!592565 (= lt!268875 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!268882 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!592565 (= lt!268882 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!592566 () Bool)

(declare-fun res!379336 () Bool)

(assert (=> b!592566 (=> (not res!379336) (not e!338407))))

(assert (=> b!592566 (= res!379336 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!592567 () Bool)

(assert (=> b!592567 (= e!338409 e!338403)))

(declare-fun res!379340 () Bool)

(assert (=> b!592567 (=> (not res!379340) (not e!338403))))

(assert (=> b!592567 (= res!379340 (arrayContainsKey!0 lt!268879 (select (arr!17729 a!2986) j!136) j!136))))

(declare-fun b!592568 () Bool)

(assert (=> b!592568 (= e!338400 (bvsle #b00000000000000000000000000000000 (size!18094 a!2986)))))

(assert (=> b!592568 (arrayContainsKey!0 lt!268879 (select (arr!17729 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!268883 () Unit!18576)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!36921 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18576)

(assert (=> b!592568 (= lt!268883 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!268879 (select (arr!17729 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!592570 () Bool)

(declare-fun res!379334 () Bool)

(assert (=> b!592570 (=> (not res!379334) (not e!338407))))

(assert (=> b!592570 (= res!379334 (and (= (size!18094 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18094 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18094 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!592571 () Bool)

(declare-fun e!338399 () Bool)

(assert (=> b!592571 (= e!338401 e!338399)))

(declare-fun res!379335 () Bool)

(assert (=> b!592571 (=> (not res!379335) (not e!338399))))

(assert (=> b!592571 (= res!379335 (= (select (store (arr!17729 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!592571 (= lt!268879 (array!36922 (store (arr!17729 a!2986) i!1108 k0!1786) (size!18094 a!2986)))))

(declare-fun b!592572 () Bool)

(declare-fun Unit!18578 () Unit!18576)

(assert (=> b!592572 (= e!338406 Unit!18578)))

(assert (=> b!592572 false))

(declare-fun b!592573 () Bool)

(declare-fun res!379325 () Bool)

(assert (=> b!592573 (=> (not res!379325) (not e!338401))))

(assert (=> b!592573 (= res!379325 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17729 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!592574 () Bool)

(assert (=> b!592574 (= e!338407 e!338401)))

(declare-fun res!379328 () Bool)

(assert (=> b!592574 (=> (not res!379328) (not e!338401))))

(declare-fun lt!268881 () SeekEntryResult!6166)

(assert (=> b!592574 (= res!379328 (or (= lt!268881 (MissingZero!6166 i!1108)) (= lt!268881 (MissingVacant!6166 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36921 (_ BitVec 32)) SeekEntryResult!6166)

(assert (=> b!592574 (= lt!268881 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!592575 () Bool)

(assert (=> b!592575 (= e!338399 e!338398)))

(declare-fun res!379337 () Bool)

(assert (=> b!592575 (=> (not res!379337) (not e!338398))))

(assert (=> b!592575 (= res!379337 (and (= lt!268878 (Found!6166 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17729 a!2986) index!984) (select (arr!17729 a!2986) j!136))) (not (= (select (arr!17729 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!592575 (= lt!268878 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17729 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!592576 () Bool)

(declare-fun res!379327 () Bool)

(assert (=> b!592576 (=> (not res!379327) (not e!338407))))

(assert (=> b!592576 (= res!379327 (validKeyInArray!0 k0!1786))))

(declare-fun res!379331 () Bool)

(assert (=> start!54240 (=> (not res!379331) (not e!338407))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54240 (= res!379331 (validMask!0 mask!3053))))

(assert (=> start!54240 e!338407))

(assert (=> start!54240 true))

(declare-fun array_inv!13612 (array!36921) Bool)

(assert (=> start!54240 (array_inv!13612 a!2986)))

(declare-fun b!592569 () Bool)

(declare-fun Unit!18579 () Unit!18576)

(assert (=> b!592569 (= e!338406 Unit!18579)))

(assert (= (and start!54240 res!379331) b!592570))

(assert (= (and b!592570 res!379334) b!592563))

(assert (= (and b!592563 res!379329) b!592576))

(assert (= (and b!592576 res!379327) b!592566))

(assert (= (and b!592566 res!379336) b!592574))

(assert (= (and b!592574 res!379328) b!592562))

(assert (= (and b!592562 res!379332) b!592558))

(assert (= (and b!592558 res!379330) b!592573))

(assert (= (and b!592573 res!379325) b!592571))

(assert (= (and b!592571 res!379335) b!592575))

(assert (= (and b!592575 res!379337) b!592565))

(assert (= (and b!592565 res!379326) b!592560))

(assert (= (and b!592565 c!66984) b!592572))

(assert (= (and b!592565 (not c!66984)) b!592569))

(assert (= (and b!592565 (not res!379339)) b!592564))

(assert (= (and b!592564 res!379333) b!592559))

(assert (= (and b!592559 (not res!379324)) b!592567))

(assert (= (and b!592567 res!379340) b!592561))

(assert (= (and b!592564 (not res!379338)) b!592568))

(declare-fun m!570097 () Bool)

(assert (=> b!592564 m!570097))

(declare-fun m!570099 () Bool)

(assert (=> b!592564 m!570099))

(declare-fun m!570101 () Bool)

(assert (=> b!592564 m!570101))

(assert (=> b!592559 m!570097))

(declare-fun m!570103 () Bool)

(assert (=> start!54240 m!570103))

(declare-fun m!570105 () Bool)

(assert (=> start!54240 m!570105))

(declare-fun m!570107 () Bool)

(assert (=> b!592574 m!570107))

(assert (=> b!592561 m!570097))

(assert (=> b!592561 m!570097))

(declare-fun m!570109 () Bool)

(assert (=> b!592561 m!570109))

(declare-fun m!570111 () Bool)

(assert (=> b!592565 m!570111))

(declare-fun m!570113 () Bool)

(assert (=> b!592565 m!570113))

(assert (=> b!592565 m!570097))

(declare-fun m!570115 () Bool)

(assert (=> b!592565 m!570115))

(assert (=> b!592565 m!570099))

(assert (=> b!592565 m!570097))

(declare-fun m!570117 () Bool)

(assert (=> b!592565 m!570117))

(declare-fun m!570119 () Bool)

(assert (=> b!592565 m!570119))

(declare-fun m!570121 () Bool)

(assert (=> b!592565 m!570121))

(assert (=> b!592567 m!570097))

(assert (=> b!592567 m!570097))

(declare-fun m!570123 () Bool)

(assert (=> b!592567 m!570123))

(declare-fun m!570125 () Bool)

(assert (=> b!592558 m!570125))

(declare-fun m!570127 () Bool)

(assert (=> b!592573 m!570127))

(declare-fun m!570129 () Bool)

(assert (=> b!592562 m!570129))

(declare-fun m!570131 () Bool)

(assert (=> b!592575 m!570131))

(assert (=> b!592575 m!570097))

(assert (=> b!592575 m!570097))

(declare-fun m!570133 () Bool)

(assert (=> b!592575 m!570133))

(assert (=> b!592571 m!570099))

(declare-fun m!570135 () Bool)

(assert (=> b!592571 m!570135))

(assert (=> b!592563 m!570097))

(assert (=> b!592563 m!570097))

(declare-fun m!570137 () Bool)

(assert (=> b!592563 m!570137))

(assert (=> b!592568 m!570097))

(assert (=> b!592568 m!570097))

(declare-fun m!570139 () Bool)

(assert (=> b!592568 m!570139))

(assert (=> b!592568 m!570097))

(declare-fun m!570141 () Bool)

(assert (=> b!592568 m!570141))

(declare-fun m!570143 () Bool)

(assert (=> b!592576 m!570143))

(declare-fun m!570145 () Bool)

(assert (=> b!592566 m!570145))

(check-sat (not b!592558) (not start!54240) (not b!592561) (not b!592565) (not b!592567) (not b!592562) (not b!592574) (not b!592563) (not b!592576) (not b!592575) (not b!592568) (not b!592566))
(check-sat)
