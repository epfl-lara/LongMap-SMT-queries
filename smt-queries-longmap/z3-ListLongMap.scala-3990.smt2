; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54054 () Bool)

(assert start!54054)

(declare-fun b!590352 () Bool)

(declare-fun res!377708 () Bool)

(declare-fun e!337022 () Bool)

(assert (=> b!590352 (=> (not res!377708) (not e!337022))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!590352 (= res!377708 (validKeyInArray!0 k0!1786))))

(declare-fun b!590353 () Bool)

(declare-fun res!377694 () Bool)

(assert (=> b!590353 (=> (not res!377694) (not e!337022))))

(declare-datatypes ((array!36855 0))(
  ( (array!36856 (arr!17699 (Array (_ BitVec 32) (_ BitVec 64))) (size!18064 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36855)

(declare-fun arrayContainsKey!0 (array!36855 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!590353 (= res!377694 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!590354 () Bool)

(declare-fun e!337021 () Bool)

(declare-fun e!337024 () Bool)

(assert (=> b!590354 (= e!337021 e!337024)))

(declare-fun res!377704 () Bool)

(assert (=> b!590354 (=> (not res!377704) (not e!337024))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6136 0))(
  ( (MissingZero!6136 (index!26777 (_ BitVec 32))) (Found!6136 (index!26778 (_ BitVec 32))) (Intermediate!6136 (undefined!6948 Bool) (index!26779 (_ BitVec 32)) (x!55578 (_ BitVec 32))) (Undefined!6136) (MissingVacant!6136 (index!26780 (_ BitVec 32))) )
))
(declare-fun lt!267728 () SeekEntryResult!6136)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!590354 (= res!377704 (and (= lt!267728 (Found!6136 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17699 a!2986) index!984) (select (arr!17699 a!2986) j!136))) (not (= (select (arr!17699 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36855 (_ BitVec 32)) SeekEntryResult!6136)

(assert (=> b!590354 (= lt!267728 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17699 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!590355 () Bool)

(declare-fun res!377695 () Bool)

(assert (=> b!590355 (=> (not res!377695) (not e!337022))))

(assert (=> b!590355 (= res!377695 (validKeyInArray!0 (select (arr!17699 a!2986) j!136)))))

(declare-fun b!590356 () Bool)

(declare-fun res!377697 () Bool)

(declare-fun e!337023 () Bool)

(assert (=> b!590356 (=> (not res!377697) (not e!337023))))

(declare-datatypes ((List!11779 0))(
  ( (Nil!11776) (Cons!11775 (h!12820 (_ BitVec 64)) (t!17998 List!11779)) )
))
(declare-fun arrayNoDuplicates!0 (array!36855 (_ BitVec 32) List!11779) Bool)

(assert (=> b!590356 (= res!377697 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11776))))

(declare-fun b!590357 () Bool)

(declare-fun e!337028 () Bool)

(declare-fun e!337029 () Bool)

(assert (=> b!590357 (= e!337028 e!337029)))

(declare-fun res!377703 () Bool)

(assert (=> b!590357 (=> res!377703 e!337029)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun lt!267734 () (_ BitVec 64))

(assert (=> b!590357 (= res!377703 (or (not (= (select (arr!17699 a!2986) j!136) lt!267734)) (not (= (select (arr!17699 a!2986) j!136) (select (store (arr!17699 a!2986) i!1108 k0!1786) index!984))) (bvsge j!136 index!984)))))

(declare-fun b!590358 () Bool)

(declare-fun res!377705 () Bool)

(assert (=> b!590358 (=> (not res!377705) (not e!337023))))

(assert (=> b!590358 (= res!377705 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17699 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!590359 () Bool)

(declare-fun e!337020 () Bool)

(assert (=> b!590359 (= e!337020 (or (not (= (select (arr!17699 a!2986) j!136) lt!267734)) (not (= (select (arr!17699 a!2986) j!136) (select (store (arr!17699 a!2986) i!1108 k0!1786) index!984))) (bvsge j!136 index!984) (bvsge index!984 (size!18064 a!2986)) (bvslt (size!18064 a!2986) #b01111111111111111111111111111111)))))

(assert (=> b!590359 e!337028))

(declare-fun res!377699 () Bool)

(assert (=> b!590359 (=> (not res!377699) (not e!337028))))

(assert (=> b!590359 (= res!377699 (= (select (store (arr!17699 a!2986) i!1108 k0!1786) index!984) (select (arr!17699 a!2986) j!136)))))

(declare-fun b!590360 () Bool)

(assert (=> b!590360 (= e!337022 e!337023)))

(declare-fun res!377696 () Bool)

(assert (=> b!590360 (=> (not res!377696) (not e!337023))))

(declare-fun lt!267733 () SeekEntryResult!6136)

(assert (=> b!590360 (= res!377696 (or (= lt!267733 (MissingZero!6136 i!1108)) (= lt!267733 (MissingVacant!6136 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36855 (_ BitVec 32)) SeekEntryResult!6136)

(assert (=> b!590360 (= lt!267733 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!590362 () Bool)

(declare-fun e!337027 () Bool)

(declare-fun lt!267735 () SeekEntryResult!6136)

(assert (=> b!590362 (= e!337027 (= lt!267728 lt!267735))))

(declare-fun b!590363 () Bool)

(assert (=> b!590363 (= e!337023 e!337021)))

(declare-fun res!377707 () Bool)

(assert (=> b!590363 (=> (not res!377707) (not e!337021))))

(assert (=> b!590363 (= res!377707 (= (select (store (arr!17699 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!267731 () array!36855)

(assert (=> b!590363 (= lt!267731 (array!36856 (store (arr!17699 a!2986) i!1108 k0!1786) (size!18064 a!2986)))))

(declare-fun b!590364 () Bool)

(assert (=> b!590364 (= e!337024 (not e!337020))))

(declare-fun res!377700 () Bool)

(assert (=> b!590364 (=> res!377700 e!337020)))

(declare-fun lt!267729 () SeekEntryResult!6136)

(assert (=> b!590364 (= res!377700 (not (= lt!267729 (Found!6136 index!984))))))

(declare-datatypes ((Unit!18456 0))(
  ( (Unit!18457) )
))
(declare-fun lt!267732 () Unit!18456)

(declare-fun e!337025 () Unit!18456)

(assert (=> b!590364 (= lt!267732 e!337025)))

(declare-fun c!66696 () Bool)

(assert (=> b!590364 (= c!66696 (= lt!267729 Undefined!6136))))

(assert (=> b!590364 (= lt!267729 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!267734 lt!267731 mask!3053))))

(assert (=> b!590364 e!337027))

(declare-fun res!377698 () Bool)

(assert (=> b!590364 (=> (not res!377698) (not e!337027))))

(declare-fun lt!267730 () (_ BitVec 32))

(assert (=> b!590364 (= res!377698 (= lt!267735 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267730 vacantSpotIndex!68 lt!267734 lt!267731 mask!3053)))))

(assert (=> b!590364 (= lt!267735 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267730 vacantSpotIndex!68 (select (arr!17699 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!590364 (= lt!267734 (select (store (arr!17699 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!267736 () Unit!18456)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36855 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18456)

(assert (=> b!590364 (= lt!267736 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!267730 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!590364 (= lt!267730 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!590365 () Bool)

(declare-fun Unit!18458 () Unit!18456)

(assert (=> b!590365 (= e!337025 Unit!18458)))

(assert (=> b!590365 false))

(declare-fun b!590366 () Bool)

(declare-fun res!377706 () Bool)

(assert (=> b!590366 (=> (not res!377706) (not e!337023))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36855 (_ BitVec 32)) Bool)

(assert (=> b!590366 (= res!377706 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!590367 () Bool)

(declare-fun Unit!18459 () Unit!18456)

(assert (=> b!590367 (= e!337025 Unit!18459)))

(declare-fun b!590368 () Bool)

(declare-fun res!377702 () Bool)

(assert (=> b!590368 (=> (not res!377702) (not e!337022))))

(assert (=> b!590368 (= res!377702 (and (= (size!18064 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18064 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18064 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!590361 () Bool)

(assert (=> b!590361 (= e!337029 (arrayContainsKey!0 lt!267731 (select (arr!17699 a!2986) j!136) j!136))))

(declare-fun res!377701 () Bool)

(assert (=> start!54054 (=> (not res!377701) (not e!337022))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54054 (= res!377701 (validMask!0 mask!3053))))

(assert (=> start!54054 e!337022))

(assert (=> start!54054 true))

(declare-fun array_inv!13582 (array!36855) Bool)

(assert (=> start!54054 (array_inv!13582 a!2986)))

(assert (= (and start!54054 res!377701) b!590368))

(assert (= (and b!590368 res!377702) b!590355))

(assert (= (and b!590355 res!377695) b!590352))

(assert (= (and b!590352 res!377708) b!590353))

(assert (= (and b!590353 res!377694) b!590360))

(assert (= (and b!590360 res!377696) b!590366))

(assert (= (and b!590366 res!377706) b!590356))

(assert (= (and b!590356 res!377697) b!590358))

(assert (= (and b!590358 res!377705) b!590363))

(assert (= (and b!590363 res!377707) b!590354))

(assert (= (and b!590354 res!377704) b!590364))

(assert (= (and b!590364 res!377698) b!590362))

(assert (= (and b!590364 c!66696) b!590365))

(assert (= (and b!590364 (not c!66696)) b!590367))

(assert (= (and b!590364 (not res!377700)) b!590359))

(assert (= (and b!590359 res!377699) b!590357))

(assert (= (and b!590357 (not res!377703)) b!590361))

(declare-fun m!568219 () Bool)

(assert (=> b!590364 m!568219))

(declare-fun m!568221 () Bool)

(assert (=> b!590364 m!568221))

(declare-fun m!568223 () Bool)

(assert (=> b!590364 m!568223))

(declare-fun m!568225 () Bool)

(assert (=> b!590364 m!568225))

(assert (=> b!590364 m!568219))

(declare-fun m!568227 () Bool)

(assert (=> b!590364 m!568227))

(declare-fun m!568229 () Bool)

(assert (=> b!590364 m!568229))

(declare-fun m!568231 () Bool)

(assert (=> b!590364 m!568231))

(declare-fun m!568233 () Bool)

(assert (=> b!590364 m!568233))

(declare-fun m!568235 () Bool)

(assert (=> b!590354 m!568235))

(assert (=> b!590354 m!568219))

(assert (=> b!590354 m!568219))

(declare-fun m!568237 () Bool)

(assert (=> b!590354 m!568237))

(declare-fun m!568239 () Bool)

(assert (=> b!590366 m!568239))

(assert (=> b!590361 m!568219))

(assert (=> b!590361 m!568219))

(declare-fun m!568241 () Bool)

(assert (=> b!590361 m!568241))

(declare-fun m!568243 () Bool)

(assert (=> start!54054 m!568243))

(declare-fun m!568245 () Bool)

(assert (=> start!54054 m!568245))

(declare-fun m!568247 () Bool)

(assert (=> b!590358 m!568247))

(assert (=> b!590363 m!568227))

(declare-fun m!568249 () Bool)

(assert (=> b!590363 m!568249))

(declare-fun m!568251 () Bool)

(assert (=> b!590353 m!568251))

(declare-fun m!568253 () Bool)

(assert (=> b!590356 m!568253))

(assert (=> b!590359 m!568219))

(assert (=> b!590359 m!568227))

(declare-fun m!568255 () Bool)

(assert (=> b!590359 m!568255))

(declare-fun m!568257 () Bool)

(assert (=> b!590352 m!568257))

(assert (=> b!590357 m!568219))

(assert (=> b!590357 m!568227))

(assert (=> b!590357 m!568255))

(declare-fun m!568259 () Bool)

(assert (=> b!590360 m!568259))

(assert (=> b!590355 m!568219))

(assert (=> b!590355 m!568219))

(declare-fun m!568261 () Bool)

(assert (=> b!590355 m!568261))

(check-sat (not b!590356) (not b!590353) (not b!590352) (not b!590360) (not b!590364) (not b!590361) (not b!590354) (not b!590355) (not b!590366) (not start!54054))
(check-sat)
(get-model)

(declare-fun b!590483 () Bool)

(declare-fun e!337097 () SeekEntryResult!6136)

(assert (=> b!590483 (= e!337097 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!17699 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!590484 () Bool)

(declare-fun e!337096 () SeekEntryResult!6136)

(assert (=> b!590484 (= e!337096 (Found!6136 index!984))))

(declare-fun b!590485 () Bool)

(declare-fun c!66711 () Bool)

(declare-fun lt!267796 () (_ BitVec 64))

(assert (=> b!590485 (= c!66711 (= lt!267796 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!590485 (= e!337096 e!337097)))

(declare-fun b!590486 () Bool)

(declare-fun e!337098 () SeekEntryResult!6136)

(assert (=> b!590486 (= e!337098 e!337096)))

(declare-fun c!66710 () Bool)

(assert (=> b!590486 (= c!66710 (= lt!267796 (select (arr!17699 a!2986) j!136)))))

(declare-fun d!85903 () Bool)

(declare-fun lt!267795 () SeekEntryResult!6136)

(get-info :version)

(assert (=> d!85903 (and (or ((_ is Undefined!6136) lt!267795) (not ((_ is Found!6136) lt!267795)) (and (bvsge (index!26778 lt!267795) #b00000000000000000000000000000000) (bvslt (index!26778 lt!267795) (size!18064 a!2986)))) (or ((_ is Undefined!6136) lt!267795) ((_ is Found!6136) lt!267795) (not ((_ is MissingVacant!6136) lt!267795)) (not (= (index!26780 lt!267795) vacantSpotIndex!68)) (and (bvsge (index!26780 lt!267795) #b00000000000000000000000000000000) (bvslt (index!26780 lt!267795) (size!18064 a!2986)))) (or ((_ is Undefined!6136) lt!267795) (ite ((_ is Found!6136) lt!267795) (= (select (arr!17699 a!2986) (index!26778 lt!267795)) (select (arr!17699 a!2986) j!136)) (and ((_ is MissingVacant!6136) lt!267795) (= (index!26780 lt!267795) vacantSpotIndex!68) (= (select (arr!17699 a!2986) (index!26780 lt!267795)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!85903 (= lt!267795 e!337098)))

(declare-fun c!66709 () Bool)

(assert (=> d!85903 (= c!66709 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!85903 (= lt!267796 (select (arr!17699 a!2986) index!984))))

(assert (=> d!85903 (validMask!0 mask!3053)))

(assert (=> d!85903 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17699 a!2986) j!136) a!2986 mask!3053) lt!267795)))

(declare-fun b!590487 () Bool)

(assert (=> b!590487 (= e!337097 (MissingVacant!6136 vacantSpotIndex!68))))

(declare-fun b!590488 () Bool)

(assert (=> b!590488 (= e!337098 Undefined!6136)))

(assert (= (and d!85903 c!66709) b!590488))

(assert (= (and d!85903 (not c!66709)) b!590486))

(assert (= (and b!590486 c!66710) b!590484))

(assert (= (and b!590486 (not c!66710)) b!590485))

(assert (= (and b!590485 c!66711) b!590487))

(assert (= (and b!590485 (not c!66711)) b!590483))

(assert (=> b!590483 m!568223))

(assert (=> b!590483 m!568223))

(assert (=> b!590483 m!568219))

(declare-fun m!568351 () Bool)

(assert (=> b!590483 m!568351))

(declare-fun m!568353 () Bool)

(assert (=> d!85903 m!568353))

(declare-fun m!568355 () Bool)

(assert (=> d!85903 m!568355))

(assert (=> d!85903 m!568235))

(assert (=> d!85903 m!568243))

(assert (=> b!590354 d!85903))

(declare-fun b!590501 () Bool)

(declare-fun e!337107 () SeekEntryResult!6136)

(declare-fun lt!267805 () SeekEntryResult!6136)

(assert (=> b!590501 (= e!337107 (MissingZero!6136 (index!26779 lt!267805)))))

(declare-fun b!590502 () Bool)

(declare-fun e!337106 () SeekEntryResult!6136)

(assert (=> b!590502 (= e!337106 Undefined!6136)))

(declare-fun b!590503 () Bool)

(declare-fun e!337105 () SeekEntryResult!6136)

(assert (=> b!590503 (= e!337105 (Found!6136 (index!26779 lt!267805)))))

(declare-fun b!590504 () Bool)

(assert (=> b!590504 (= e!337106 e!337105)))

(declare-fun lt!267804 () (_ BitVec 64))

(assert (=> b!590504 (= lt!267804 (select (arr!17699 a!2986) (index!26779 lt!267805)))))

(declare-fun c!66720 () Bool)

(assert (=> b!590504 (= c!66720 (= lt!267804 k0!1786))))

(declare-fun b!590505 () Bool)

(assert (=> b!590505 (= e!337107 (seekKeyOrZeroReturnVacant!0 (x!55578 lt!267805) (index!26779 lt!267805) (index!26779 lt!267805) k0!1786 a!2986 mask!3053))))

(declare-fun d!85905 () Bool)

(declare-fun lt!267803 () SeekEntryResult!6136)

(assert (=> d!85905 (and (or ((_ is Undefined!6136) lt!267803) (not ((_ is Found!6136) lt!267803)) (and (bvsge (index!26778 lt!267803) #b00000000000000000000000000000000) (bvslt (index!26778 lt!267803) (size!18064 a!2986)))) (or ((_ is Undefined!6136) lt!267803) ((_ is Found!6136) lt!267803) (not ((_ is MissingZero!6136) lt!267803)) (and (bvsge (index!26777 lt!267803) #b00000000000000000000000000000000) (bvslt (index!26777 lt!267803) (size!18064 a!2986)))) (or ((_ is Undefined!6136) lt!267803) ((_ is Found!6136) lt!267803) ((_ is MissingZero!6136) lt!267803) (not ((_ is MissingVacant!6136) lt!267803)) (and (bvsge (index!26780 lt!267803) #b00000000000000000000000000000000) (bvslt (index!26780 lt!267803) (size!18064 a!2986)))) (or ((_ is Undefined!6136) lt!267803) (ite ((_ is Found!6136) lt!267803) (= (select (arr!17699 a!2986) (index!26778 lt!267803)) k0!1786) (ite ((_ is MissingZero!6136) lt!267803) (= (select (arr!17699 a!2986) (index!26777 lt!267803)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6136) lt!267803) (= (select (arr!17699 a!2986) (index!26780 lt!267803)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!85905 (= lt!267803 e!337106)))

(declare-fun c!66718 () Bool)

(assert (=> d!85905 (= c!66718 (and ((_ is Intermediate!6136) lt!267805) (undefined!6948 lt!267805)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36855 (_ BitVec 32)) SeekEntryResult!6136)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!85905 (= lt!267805 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!85905 (validMask!0 mask!3053)))

(assert (=> d!85905 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!267803)))

(declare-fun b!590506 () Bool)

(declare-fun c!66719 () Bool)

(assert (=> b!590506 (= c!66719 (= lt!267804 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!590506 (= e!337105 e!337107)))

(assert (= (and d!85905 c!66718) b!590502))

(assert (= (and d!85905 (not c!66718)) b!590504))

(assert (= (and b!590504 c!66720) b!590503))

(assert (= (and b!590504 (not c!66720)) b!590506))

(assert (= (and b!590506 c!66719) b!590501))

(assert (= (and b!590506 (not c!66719)) b!590505))

(declare-fun m!568357 () Bool)

(assert (=> b!590504 m!568357))

(declare-fun m!568359 () Bool)

(assert (=> b!590505 m!568359))

(declare-fun m!568361 () Bool)

(assert (=> d!85905 m!568361))

(declare-fun m!568363 () Bool)

(assert (=> d!85905 m!568363))

(assert (=> d!85905 m!568243))

(declare-fun m!568365 () Bool)

(assert (=> d!85905 m!568365))

(declare-fun m!568367 () Bool)

(assert (=> d!85905 m!568367))

(declare-fun m!568369 () Bool)

(assert (=> d!85905 m!568369))

(assert (=> d!85905 m!568365))

(assert (=> b!590360 d!85905))

(declare-fun d!85913 () Bool)

(assert (=> d!85913 (= (validKeyInArray!0 (select (arr!17699 a!2986) j!136)) (and (not (= (select (arr!17699 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17699 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!590355 d!85913))

(declare-fun b!590545 () Bool)

(declare-fun e!337138 () Bool)

(declare-fun e!337139 () Bool)

(assert (=> b!590545 (= e!337138 e!337139)))

(declare-fun lt!267814 () (_ BitVec 64))

(assert (=> b!590545 (= lt!267814 (select (arr!17699 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!267812 () Unit!18456)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!36855 (_ BitVec 64) (_ BitVec 32)) Unit!18456)

(assert (=> b!590545 (= lt!267812 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!267814 #b00000000000000000000000000000000))))

(assert (=> b!590545 (arrayContainsKey!0 a!2986 lt!267814 #b00000000000000000000000000000000)))

(declare-fun lt!267813 () Unit!18456)

(assert (=> b!590545 (= lt!267813 lt!267812)))

(declare-fun res!377822 () Bool)

(assert (=> b!590545 (= res!377822 (= (seekEntryOrOpen!0 (select (arr!17699 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6136 #b00000000000000000000000000000000)))))

(assert (=> b!590545 (=> (not res!377822) (not e!337139))))

(declare-fun b!590546 () Bool)

(declare-fun e!337140 () Bool)

(assert (=> b!590546 (= e!337140 e!337138)))

(declare-fun c!66729 () Bool)

(assert (=> b!590546 (= c!66729 (validKeyInArray!0 (select (arr!17699 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!590547 () Bool)

(declare-fun call!32797 () Bool)

(assert (=> b!590547 (= e!337139 call!32797)))

(declare-fun d!85917 () Bool)

(declare-fun res!377821 () Bool)

(assert (=> d!85917 (=> res!377821 e!337140)))

(assert (=> d!85917 (= res!377821 (bvsge #b00000000000000000000000000000000 (size!18064 a!2986)))))

(assert (=> d!85917 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!337140)))

(declare-fun bm!32794 () Bool)

(assert (=> bm!32794 (= call!32797 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!590548 () Bool)

(assert (=> b!590548 (= e!337138 call!32797)))

(assert (= (and d!85917 (not res!377821)) b!590546))

(assert (= (and b!590546 c!66729) b!590545))

(assert (= (and b!590546 (not c!66729)) b!590548))

(assert (= (and b!590545 res!377822) b!590547))

(assert (= (or b!590547 b!590548) bm!32794))

(declare-fun m!568387 () Bool)

(assert (=> b!590545 m!568387))

(declare-fun m!568389 () Bool)

(assert (=> b!590545 m!568389))

(declare-fun m!568391 () Bool)

(assert (=> b!590545 m!568391))

(assert (=> b!590545 m!568387))

(declare-fun m!568393 () Bool)

(assert (=> b!590545 m!568393))

(assert (=> b!590546 m!568387))

(assert (=> b!590546 m!568387))

(declare-fun m!568395 () Bool)

(assert (=> b!590546 m!568395))

(declare-fun m!568397 () Bool)

(assert (=> bm!32794 m!568397))

(assert (=> b!590366 d!85917))

(declare-fun d!85925 () Bool)

(declare-fun res!377827 () Bool)

(declare-fun e!337151 () Bool)

(assert (=> d!85925 (=> res!377827 e!337151)))

(assert (=> d!85925 (= res!377827 (= (select (arr!17699 lt!267731) j!136) (select (arr!17699 a!2986) j!136)))))

(assert (=> d!85925 (= (arrayContainsKey!0 lt!267731 (select (arr!17699 a!2986) j!136) j!136) e!337151)))

(declare-fun b!590565 () Bool)

(declare-fun e!337152 () Bool)

(assert (=> b!590565 (= e!337151 e!337152)))

(declare-fun res!377828 () Bool)

(assert (=> b!590565 (=> (not res!377828) (not e!337152))))

(assert (=> b!590565 (= res!377828 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18064 lt!267731)))))

(declare-fun b!590566 () Bool)

(assert (=> b!590566 (= e!337152 (arrayContainsKey!0 lt!267731 (select (arr!17699 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!85925 (not res!377827)) b!590565))

(assert (= (and b!590565 res!377828) b!590566))

(declare-fun m!568399 () Bool)

(assert (=> d!85925 m!568399))

(assert (=> b!590566 m!568219))

(declare-fun m!568401 () Bool)

(assert (=> b!590566 m!568401))

(assert (=> b!590361 d!85925))

(declare-fun b!590589 () Bool)

(declare-fun e!337171 () Bool)

(declare-fun e!337170 () Bool)

(assert (=> b!590589 (= e!337171 e!337170)))

(declare-fun res!377843 () Bool)

(assert (=> b!590589 (=> (not res!377843) (not e!337170))))

(declare-fun e!337172 () Bool)

(assert (=> b!590589 (= res!377843 (not e!337172))))

(declare-fun res!377842 () Bool)

(assert (=> b!590589 (=> (not res!377842) (not e!337172))))

(assert (=> b!590589 (= res!377842 (validKeyInArray!0 (select (arr!17699 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!85927 () Bool)

(declare-fun res!377841 () Bool)

(assert (=> d!85927 (=> res!377841 e!337171)))

(assert (=> d!85927 (= res!377841 (bvsge #b00000000000000000000000000000000 (size!18064 a!2986)))))

(assert (=> d!85927 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11776) e!337171)))

(declare-fun b!590590 () Bool)

(declare-fun e!337173 () Bool)

(declare-fun call!32800 () Bool)

(assert (=> b!590590 (= e!337173 call!32800)))

(declare-fun b!590591 () Bool)

(assert (=> b!590591 (= e!337173 call!32800)))

(declare-fun b!590592 () Bool)

(declare-fun contains!2894 (List!11779 (_ BitVec 64)) Bool)

(assert (=> b!590592 (= e!337172 (contains!2894 Nil!11776 (select (arr!17699 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!32797 () Bool)

(declare-fun c!66741 () Bool)

(assert (=> bm!32797 (= call!32800 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!66741 (Cons!11775 (select (arr!17699 a!2986) #b00000000000000000000000000000000) Nil!11776) Nil!11776)))))

(declare-fun b!590593 () Bool)

(assert (=> b!590593 (= e!337170 e!337173)))

(assert (=> b!590593 (= c!66741 (validKeyInArray!0 (select (arr!17699 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!85927 (not res!377841)) b!590589))

(assert (= (and b!590589 res!377842) b!590592))

(assert (= (and b!590589 res!377843) b!590593))

(assert (= (and b!590593 c!66741) b!590590))

(assert (= (and b!590593 (not c!66741)) b!590591))

(assert (= (or b!590590 b!590591) bm!32797))

(assert (=> b!590589 m!568387))

(assert (=> b!590589 m!568387))

(assert (=> b!590589 m!568395))

(assert (=> b!590592 m!568387))

(assert (=> b!590592 m!568387))

(declare-fun m!568413 () Bool)

(assert (=> b!590592 m!568413))

(assert (=> bm!32797 m!568387))

(declare-fun m!568415 () Bool)

(assert (=> bm!32797 m!568415))

(assert (=> b!590593 m!568387))

(assert (=> b!590593 m!568387))

(assert (=> b!590593 m!568395))

(assert (=> b!590356 d!85927))

(declare-fun d!85935 () Bool)

(assert (=> d!85935 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!54054 d!85935))

(declare-fun d!85947 () Bool)

(assert (=> d!85947 (= (array_inv!13582 a!2986) (bvsge (size!18064 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!54054 d!85947))

(declare-fun d!85949 () Bool)

(assert (=> d!85949 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!590352 d!85949))

(declare-fun d!85951 () Bool)

(declare-fun res!377858 () Bool)

(declare-fun e!337200 () Bool)

(assert (=> d!85951 (=> res!377858 e!337200)))

(assert (=> d!85951 (= res!377858 (= (select (arr!17699 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!85951 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!337200)))

(declare-fun b!590632 () Bool)

(declare-fun e!337201 () Bool)

(assert (=> b!590632 (= e!337200 e!337201)))

(declare-fun res!377859 () Bool)

(assert (=> b!590632 (=> (not res!377859) (not e!337201))))

(assert (=> b!590632 (= res!377859 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18064 a!2986)))))

(declare-fun b!590633 () Bool)

(assert (=> b!590633 (= e!337201 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!85951 (not res!377858)) b!590632))

(assert (= (and b!590632 res!377859) b!590633))

(assert (=> d!85951 m!568387))

(declare-fun m!568443 () Bool)

(assert (=> b!590633 m!568443))

(assert (=> b!590353 d!85951))

(declare-fun e!337203 () SeekEntryResult!6136)

(declare-fun b!590634 () Bool)

(assert (=> b!590634 (= e!337203 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!267734 lt!267731 mask!3053))))

(declare-fun b!590635 () Bool)

(declare-fun e!337202 () SeekEntryResult!6136)

(assert (=> b!590635 (= e!337202 (Found!6136 index!984))))

(declare-fun b!590636 () Bool)

(declare-fun c!66756 () Bool)

(declare-fun lt!267840 () (_ BitVec 64))

(assert (=> b!590636 (= c!66756 (= lt!267840 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!590636 (= e!337202 e!337203)))

(declare-fun b!590637 () Bool)

(declare-fun e!337206 () SeekEntryResult!6136)

(assert (=> b!590637 (= e!337206 e!337202)))

(declare-fun c!66755 () Bool)

(assert (=> b!590637 (= c!66755 (= lt!267840 lt!267734))))

(declare-fun lt!267839 () SeekEntryResult!6136)

(declare-fun d!85953 () Bool)

(assert (=> d!85953 (and (or ((_ is Undefined!6136) lt!267839) (not ((_ is Found!6136) lt!267839)) (and (bvsge (index!26778 lt!267839) #b00000000000000000000000000000000) (bvslt (index!26778 lt!267839) (size!18064 lt!267731)))) (or ((_ is Undefined!6136) lt!267839) ((_ is Found!6136) lt!267839) (not ((_ is MissingVacant!6136) lt!267839)) (not (= (index!26780 lt!267839) vacantSpotIndex!68)) (and (bvsge (index!26780 lt!267839) #b00000000000000000000000000000000) (bvslt (index!26780 lt!267839) (size!18064 lt!267731)))) (or ((_ is Undefined!6136) lt!267839) (ite ((_ is Found!6136) lt!267839) (= (select (arr!17699 lt!267731) (index!26778 lt!267839)) lt!267734) (and ((_ is MissingVacant!6136) lt!267839) (= (index!26780 lt!267839) vacantSpotIndex!68) (= (select (arr!17699 lt!267731) (index!26780 lt!267839)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!85953 (= lt!267839 e!337206)))

(declare-fun c!66754 () Bool)

(assert (=> d!85953 (= c!66754 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!85953 (= lt!267840 (select (arr!17699 lt!267731) index!984))))

(assert (=> d!85953 (validMask!0 mask!3053)))

(assert (=> d!85953 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!267734 lt!267731 mask!3053) lt!267839)))

(declare-fun b!590638 () Bool)

(assert (=> b!590638 (= e!337203 (MissingVacant!6136 vacantSpotIndex!68))))

(declare-fun b!590639 () Bool)

(assert (=> b!590639 (= e!337206 Undefined!6136)))

(assert (= (and d!85953 c!66754) b!590639))

(assert (= (and d!85953 (not c!66754)) b!590637))

(assert (= (and b!590637 c!66755) b!590635))

(assert (= (and b!590637 (not c!66755)) b!590636))

(assert (= (and b!590636 c!66756) b!590638))

(assert (= (and b!590636 (not c!66756)) b!590634))

(assert (=> b!590634 m!568223))

(assert (=> b!590634 m!568223))

(declare-fun m!568445 () Bool)

(assert (=> b!590634 m!568445))

(declare-fun m!568447 () Bool)

(assert (=> d!85953 m!568447))

(declare-fun m!568449 () Bool)

(assert (=> d!85953 m!568449))

(declare-fun m!568451 () Bool)

(assert (=> d!85953 m!568451))

(assert (=> d!85953 m!568243))

(assert (=> b!590364 d!85953))

(declare-fun d!85955 () Bool)

(declare-fun e!337231 () Bool)

(assert (=> d!85955 e!337231))

(declare-fun res!377868 () Bool)

(assert (=> d!85955 (=> (not res!377868) (not e!337231))))

(assert (=> d!85955 (= res!377868 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18064 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18064 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18064 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18064 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18064 a!2986))))))

(declare-fun lt!267865 () Unit!18456)

(declare-fun choose!9 (array!36855 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18456)

(assert (=> d!85955 (= lt!267865 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!267730 vacantSpotIndex!68 mask!3053))))

(assert (=> d!85955 (validMask!0 mask!3053)))

(assert (=> d!85955 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!267730 vacantSpotIndex!68 mask!3053) lt!267865)))

(declare-fun b!590684 () Bool)

(assert (=> b!590684 (= e!337231 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267730 vacantSpotIndex!68 (select (arr!17699 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267730 vacantSpotIndex!68 (select (store (arr!17699 a!2986) i!1108 k0!1786) j!136) (array!36856 (store (arr!17699 a!2986) i!1108 k0!1786) (size!18064 a!2986)) mask!3053)))))

(assert (= (and d!85955 res!377868) b!590684))

(declare-fun m!568475 () Bool)

(assert (=> d!85955 m!568475))

(assert (=> d!85955 m!568243))

(assert (=> b!590684 m!568225))

(declare-fun m!568477 () Bool)

(assert (=> b!590684 m!568477))

(assert (=> b!590684 m!568225))

(assert (=> b!590684 m!568219))

(assert (=> b!590684 m!568219))

(assert (=> b!590684 m!568221))

(assert (=> b!590684 m!568227))

(assert (=> b!590364 d!85955))

(declare-fun b!590685 () Bool)

(declare-fun e!337233 () SeekEntryResult!6136)

(assert (=> b!590685 (= e!337233 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!267730 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!17699 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!590686 () Bool)

(declare-fun e!337232 () SeekEntryResult!6136)

(assert (=> b!590686 (= e!337232 (Found!6136 lt!267730))))

(declare-fun b!590687 () Bool)

(declare-fun c!66777 () Bool)

(declare-fun lt!267867 () (_ BitVec 64))

(assert (=> b!590687 (= c!66777 (= lt!267867 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!590687 (= e!337232 e!337233)))

(declare-fun b!590688 () Bool)

(declare-fun e!337234 () SeekEntryResult!6136)

(assert (=> b!590688 (= e!337234 e!337232)))

(declare-fun c!66776 () Bool)

(assert (=> b!590688 (= c!66776 (= lt!267867 (select (arr!17699 a!2986) j!136)))))

(declare-fun lt!267866 () SeekEntryResult!6136)

(declare-fun d!85963 () Bool)

(assert (=> d!85963 (and (or ((_ is Undefined!6136) lt!267866) (not ((_ is Found!6136) lt!267866)) (and (bvsge (index!26778 lt!267866) #b00000000000000000000000000000000) (bvslt (index!26778 lt!267866) (size!18064 a!2986)))) (or ((_ is Undefined!6136) lt!267866) ((_ is Found!6136) lt!267866) (not ((_ is MissingVacant!6136) lt!267866)) (not (= (index!26780 lt!267866) vacantSpotIndex!68)) (and (bvsge (index!26780 lt!267866) #b00000000000000000000000000000000) (bvslt (index!26780 lt!267866) (size!18064 a!2986)))) (or ((_ is Undefined!6136) lt!267866) (ite ((_ is Found!6136) lt!267866) (= (select (arr!17699 a!2986) (index!26778 lt!267866)) (select (arr!17699 a!2986) j!136)) (and ((_ is MissingVacant!6136) lt!267866) (= (index!26780 lt!267866) vacantSpotIndex!68) (= (select (arr!17699 a!2986) (index!26780 lt!267866)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!85963 (= lt!267866 e!337234)))

(declare-fun c!66775 () Bool)

(assert (=> d!85963 (= c!66775 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!85963 (= lt!267867 (select (arr!17699 a!2986) lt!267730))))

(assert (=> d!85963 (validMask!0 mask!3053)))

(assert (=> d!85963 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267730 vacantSpotIndex!68 (select (arr!17699 a!2986) j!136) a!2986 mask!3053) lt!267866)))

(declare-fun b!590689 () Bool)

(assert (=> b!590689 (= e!337233 (MissingVacant!6136 vacantSpotIndex!68))))

(declare-fun b!590690 () Bool)

(assert (=> b!590690 (= e!337234 Undefined!6136)))

(assert (= (and d!85963 c!66775) b!590690))

(assert (= (and d!85963 (not c!66775)) b!590688))

(assert (= (and b!590688 c!66776) b!590686))

(assert (= (and b!590688 (not c!66776)) b!590687))

(assert (= (and b!590687 c!66777) b!590689))

(assert (= (and b!590687 (not c!66777)) b!590685))

(declare-fun m!568479 () Bool)

(assert (=> b!590685 m!568479))

(assert (=> b!590685 m!568479))

(assert (=> b!590685 m!568219))

(declare-fun m!568481 () Bool)

(assert (=> b!590685 m!568481))

(declare-fun m!568483 () Bool)

(assert (=> d!85963 m!568483))

(declare-fun m!568485 () Bool)

(assert (=> d!85963 m!568485))

(declare-fun m!568487 () Bool)

(assert (=> d!85963 m!568487))

(assert (=> d!85963 m!568243))

(assert (=> b!590364 d!85963))

(declare-fun e!337239 () SeekEntryResult!6136)

(declare-fun b!590697 () Bool)

(assert (=> b!590697 (= e!337239 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!267730 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!267734 lt!267731 mask!3053))))

(declare-fun b!590698 () Bool)

(declare-fun e!337238 () SeekEntryResult!6136)

(assert (=> b!590698 (= e!337238 (Found!6136 lt!267730))))

(declare-fun b!590699 () Bool)

(declare-fun c!66783 () Bool)

(declare-fun lt!267871 () (_ BitVec 64))

(assert (=> b!590699 (= c!66783 (= lt!267871 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!590699 (= e!337238 e!337239)))

(declare-fun b!590700 () Bool)

(declare-fun e!337240 () SeekEntryResult!6136)

(assert (=> b!590700 (= e!337240 e!337238)))

(declare-fun c!66782 () Bool)

(assert (=> b!590700 (= c!66782 (= lt!267871 lt!267734))))

(declare-fun d!85965 () Bool)

(declare-fun lt!267870 () SeekEntryResult!6136)

(assert (=> d!85965 (and (or ((_ is Undefined!6136) lt!267870) (not ((_ is Found!6136) lt!267870)) (and (bvsge (index!26778 lt!267870) #b00000000000000000000000000000000) (bvslt (index!26778 lt!267870) (size!18064 lt!267731)))) (or ((_ is Undefined!6136) lt!267870) ((_ is Found!6136) lt!267870) (not ((_ is MissingVacant!6136) lt!267870)) (not (= (index!26780 lt!267870) vacantSpotIndex!68)) (and (bvsge (index!26780 lt!267870) #b00000000000000000000000000000000) (bvslt (index!26780 lt!267870) (size!18064 lt!267731)))) (or ((_ is Undefined!6136) lt!267870) (ite ((_ is Found!6136) lt!267870) (= (select (arr!17699 lt!267731) (index!26778 lt!267870)) lt!267734) (and ((_ is MissingVacant!6136) lt!267870) (= (index!26780 lt!267870) vacantSpotIndex!68) (= (select (arr!17699 lt!267731) (index!26780 lt!267870)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!85965 (= lt!267870 e!337240)))

(declare-fun c!66781 () Bool)

(assert (=> d!85965 (= c!66781 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!85965 (= lt!267871 (select (arr!17699 lt!267731) lt!267730))))

(assert (=> d!85965 (validMask!0 mask!3053)))

(assert (=> d!85965 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267730 vacantSpotIndex!68 lt!267734 lt!267731 mask!3053) lt!267870)))

(declare-fun b!590701 () Bool)

(assert (=> b!590701 (= e!337239 (MissingVacant!6136 vacantSpotIndex!68))))

(declare-fun b!590702 () Bool)

(assert (=> b!590702 (= e!337240 Undefined!6136)))

(assert (= (and d!85965 c!66781) b!590702))

(assert (= (and d!85965 (not c!66781)) b!590700))

(assert (= (and b!590700 c!66782) b!590698))

(assert (= (and b!590700 (not c!66782)) b!590699))

(assert (= (and b!590699 c!66783) b!590701))

(assert (= (and b!590699 (not c!66783)) b!590697))

(assert (=> b!590697 m!568479))

(assert (=> b!590697 m!568479))

(declare-fun m!568493 () Bool)

(assert (=> b!590697 m!568493))

(declare-fun m!568497 () Bool)

(assert (=> d!85965 m!568497))

(declare-fun m!568499 () Bool)

(assert (=> d!85965 m!568499))

(declare-fun m!568501 () Bool)

(assert (=> d!85965 m!568501))

(assert (=> d!85965 m!568243))

(assert (=> b!590364 d!85965))

(declare-fun d!85969 () Bool)

(declare-fun lt!267876 () (_ BitVec 32))

(assert (=> d!85969 (and (bvsge lt!267876 #b00000000000000000000000000000000) (bvslt lt!267876 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!85969 (= lt!267876 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!85969 (validMask!0 mask!3053)))

(assert (=> d!85969 (= (nextIndex!0 index!984 x!910 mask!3053) lt!267876)))

(declare-fun bs!18229 () Bool)

(assert (= bs!18229 d!85969))

(declare-fun m!568511 () Bool)

(assert (=> bs!18229 m!568511))

(assert (=> bs!18229 m!568243))

(assert (=> b!590364 d!85969))

(check-sat (not b!590634) (not b!590697) (not d!85965) (not d!85903) (not d!85963) (not b!590685) (not b!590505) (not bm!32797) (not d!85905) (not b!590546) (not b!590592) (not b!590566) (not b!590633) (not b!590593) (not b!590684) (not bm!32794) (not b!590545) (not d!85955) (not b!590589) (not d!85969) (not b!590483) (not d!85953))
(check-sat)
