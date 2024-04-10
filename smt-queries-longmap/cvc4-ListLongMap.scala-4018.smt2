; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54734 () Bool)

(assert start!54734)

(declare-fun res!383343 () Bool)

(declare-fun e!341804 () Bool)

(assert (=> start!54734 (=> (not res!383343) (not e!341804))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54734 (= res!383343 (validMask!0 mask!3053))))

(assert (=> start!54734 e!341804))

(assert (=> start!54734 true))

(declare-datatypes ((array!37050 0))(
  ( (array!37051 (arr!17786 (Array (_ BitVec 32) (_ BitVec 64))) (size!18150 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37050)

(declare-fun array_inv!13582 (array!37050) Bool)

(assert (=> start!54734 (array_inv!13582 a!2986)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!271711 () array!37050)

(declare-fun e!341806 () Bool)

(declare-fun b!598052 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!37050 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!598052 (= e!341806 (arrayContainsKey!0 lt!271711 (select (arr!17786 a!2986) j!136) index!984))))

(declare-fun b!598053 () Bool)

(declare-fun res!383346 () Bool)

(declare-fun e!341816 () Bool)

(assert (=> b!598053 (=> res!383346 e!341816)))

(declare-datatypes ((List!11827 0))(
  ( (Nil!11824) (Cons!11823 (h!12868 (_ BitVec 64)) (t!18055 List!11827)) )
))
(declare-fun noDuplicate!275 (List!11827) Bool)

(assert (=> b!598053 (= res!383346 (not (noDuplicate!275 Nil!11824)))))

(declare-fun b!598054 () Bool)

(declare-fun res!383351 () Bool)

(assert (=> b!598054 (=> (not res!383351) (not e!341804))))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!598054 (= res!383351 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!598055 () Bool)

(declare-fun e!341817 () Bool)

(declare-fun e!341810 () Bool)

(assert (=> b!598055 (= e!341817 (not e!341810))))

(declare-fun res!383357 () Bool)

(assert (=> b!598055 (=> res!383357 e!341810)))

(declare-datatypes ((SeekEntryResult!6226 0))(
  ( (MissingZero!6226 (index!27158 (_ BitVec 32))) (Found!6226 (index!27159 (_ BitVec 32))) (Intermediate!6226 (undefined!7038 Bool) (index!27160 (_ BitVec 32)) (x!55960 (_ BitVec 32))) (Undefined!6226) (MissingVacant!6226 (index!27161 (_ BitVec 32))) )
))
(declare-fun lt!271709 () SeekEntryResult!6226)

(assert (=> b!598055 (= res!383357 (not (= lt!271709 (Found!6226 index!984))))))

(declare-datatypes ((Unit!18822 0))(
  ( (Unit!18823) )
))
(declare-fun lt!271715 () Unit!18822)

(declare-fun e!341809 () Unit!18822)

(assert (=> b!598055 (= lt!271715 e!341809)))

(declare-fun c!67724 () Bool)

(assert (=> b!598055 (= c!67724 (= lt!271709 Undefined!6226))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!271714 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37050 (_ BitVec 32)) SeekEntryResult!6226)

(assert (=> b!598055 (= lt!271709 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!271714 lt!271711 mask!3053))))

(declare-fun e!341815 () Bool)

(assert (=> b!598055 e!341815))

(declare-fun res!383349 () Bool)

(assert (=> b!598055 (=> (not res!383349) (not e!341815))))

(declare-fun lt!271717 () SeekEntryResult!6226)

(declare-fun lt!271706 () (_ BitVec 32))

(assert (=> b!598055 (= res!383349 (= lt!271717 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271706 vacantSpotIndex!68 lt!271714 lt!271711 mask!3053)))))

(assert (=> b!598055 (= lt!271717 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271706 vacantSpotIndex!68 (select (arr!17786 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!598055 (= lt!271714 (select (store (arr!17786 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!271713 () Unit!18822)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37050 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18822)

(assert (=> b!598055 (= lt!271713 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!271706 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!598055 (= lt!271706 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!598056 () Bool)

(declare-fun Unit!18824 () Unit!18822)

(assert (=> b!598056 (= e!341809 Unit!18824)))

(declare-fun b!598057 () Bool)

(declare-fun e!341813 () Bool)

(assert (=> b!598057 (= e!341813 e!341816)))

(declare-fun res!383344 () Bool)

(assert (=> b!598057 (=> res!383344 e!341816)))

(assert (=> b!598057 (= res!383344 (or (bvsgt #b00000000000000000000000000000000 (size!18150 a!2986)) (bvsge (size!18150 a!2986) #b01111111111111111111111111111111)))))

(declare-fun arrayNoDuplicates!0 (array!37050 (_ BitVec 32) List!11827) Bool)

(assert (=> b!598057 (arrayNoDuplicates!0 lt!271711 #b00000000000000000000000000000000 Nil!11824)))

(declare-fun lt!271710 () Unit!18822)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37050 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11827) Unit!18822)

(assert (=> b!598057 (= lt!271710 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11824))))

(assert (=> b!598057 (arrayContainsKey!0 lt!271711 (select (arr!17786 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!271716 () Unit!18822)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37050 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18822)

(assert (=> b!598057 (= lt!271716 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!271711 (select (arr!17786 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!598058 () Bool)

(declare-fun res!383339 () Bool)

(declare-fun e!341811 () Bool)

(assert (=> b!598058 (=> (not res!383339) (not e!341811))))

(assert (=> b!598058 (= res!383339 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11824))))

(declare-fun b!598059 () Bool)

(declare-fun e!341807 () Bool)

(declare-fun e!341812 () Bool)

(assert (=> b!598059 (= e!341807 e!341812)))

(declare-fun res!383345 () Bool)

(assert (=> b!598059 (=> res!383345 e!341812)))

(declare-fun lt!271708 () (_ BitVec 64))

(assert (=> b!598059 (= res!383345 (or (not (= (select (arr!17786 a!2986) j!136) lt!271714)) (not (= (select (arr!17786 a!2986) j!136) lt!271708)) (bvsge j!136 index!984)))))

(declare-fun b!598060 () Bool)

(declare-fun e!341805 () Bool)

(assert (=> b!598060 (= e!341811 e!341805)))

(declare-fun res!383354 () Bool)

(assert (=> b!598060 (=> (not res!383354) (not e!341805))))

(assert (=> b!598060 (= res!383354 (= (select (store (arr!17786 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!598060 (= lt!271711 (array!37051 (store (arr!17786 a!2986) i!1108 k!1786) (size!18150 a!2986)))))

(declare-fun b!598061 () Bool)

(declare-fun Unit!18825 () Unit!18822)

(assert (=> b!598061 (= e!341809 Unit!18825)))

(assert (=> b!598061 false))

(declare-fun b!598062 () Bool)

(declare-fun lt!271712 () SeekEntryResult!6226)

(assert (=> b!598062 (= e!341815 (= lt!271712 lt!271717))))

(declare-fun b!598063 () Bool)

(assert (=> b!598063 (= e!341810 e!341813)))

(declare-fun res!383340 () Bool)

(assert (=> b!598063 (=> res!383340 e!341813)))

(assert (=> b!598063 (= res!383340 (or (not (= (select (arr!17786 a!2986) j!136) lt!271714)) (not (= (select (arr!17786 a!2986) j!136) lt!271708)) (bvsge j!136 index!984)))))

(assert (=> b!598063 e!341807))

(declare-fun res!383347 () Bool)

(assert (=> b!598063 (=> (not res!383347) (not e!341807))))

(assert (=> b!598063 (= res!383347 (= lt!271708 (select (arr!17786 a!2986) j!136)))))

(assert (=> b!598063 (= lt!271708 (select (store (arr!17786 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!598064 () Bool)

(assert (=> b!598064 (= e!341804 e!341811)))

(declare-fun res!383356 () Bool)

(assert (=> b!598064 (=> (not res!383356) (not e!341811))))

(declare-fun lt!271707 () SeekEntryResult!6226)

(assert (=> b!598064 (= res!383356 (or (= lt!271707 (MissingZero!6226 i!1108)) (= lt!271707 (MissingVacant!6226 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37050 (_ BitVec 32)) SeekEntryResult!6226)

(assert (=> b!598064 (= lt!271707 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!598065 () Bool)

(declare-fun res!383341 () Bool)

(assert (=> b!598065 (=> (not res!383341) (not e!341804))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!598065 (= res!383341 (validKeyInArray!0 (select (arr!17786 a!2986) j!136)))))

(declare-fun b!598066 () Bool)

(assert (=> b!598066 (= e!341812 e!341806)))

(declare-fun res!383352 () Bool)

(assert (=> b!598066 (=> (not res!383352) (not e!341806))))

(assert (=> b!598066 (= res!383352 (arrayContainsKey!0 lt!271711 (select (arr!17786 a!2986) j!136) j!136))))

(declare-fun b!598067 () Bool)

(declare-fun res!383342 () Bool)

(assert (=> b!598067 (=> (not res!383342) (not e!341811))))

(assert (=> b!598067 (= res!383342 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17786 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!598068 () Bool)

(declare-fun e!341808 () Bool)

(assert (=> b!598068 (= e!341816 e!341808)))

(declare-fun res!383348 () Bool)

(assert (=> b!598068 (=> (not res!383348) (not e!341808))))

(declare-fun contains!2958 (List!11827 (_ BitVec 64)) Bool)

(assert (=> b!598068 (= res!383348 (not (contains!2958 Nil!11824 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!598069 () Bool)

(declare-fun res!383355 () Bool)

(assert (=> b!598069 (=> (not res!383355) (not e!341804))))

(assert (=> b!598069 (= res!383355 (and (= (size!18150 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18150 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18150 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!598070 () Bool)

(declare-fun res!383353 () Bool)

(assert (=> b!598070 (=> (not res!383353) (not e!341804))))

(assert (=> b!598070 (= res!383353 (validKeyInArray!0 k!1786))))

(declare-fun b!598071 () Bool)

(declare-fun res!383350 () Bool)

(assert (=> b!598071 (=> (not res!383350) (not e!341811))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37050 (_ BitVec 32)) Bool)

(assert (=> b!598071 (= res!383350 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!598072 () Bool)

(assert (=> b!598072 (= e!341805 e!341817)))

(declare-fun res!383338 () Bool)

(assert (=> b!598072 (=> (not res!383338) (not e!341817))))

(assert (=> b!598072 (= res!383338 (and (= lt!271712 (Found!6226 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17786 a!2986) index!984) (select (arr!17786 a!2986) j!136))) (not (= (select (arr!17786 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!598072 (= lt!271712 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17786 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!598073 () Bool)

(assert (=> b!598073 (= e!341808 (not (contains!2958 Nil!11824 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!54734 res!383343) b!598069))

(assert (= (and b!598069 res!383355) b!598065))

(assert (= (and b!598065 res!383341) b!598070))

(assert (= (and b!598070 res!383353) b!598054))

(assert (= (and b!598054 res!383351) b!598064))

(assert (= (and b!598064 res!383356) b!598071))

(assert (= (and b!598071 res!383350) b!598058))

(assert (= (and b!598058 res!383339) b!598067))

(assert (= (and b!598067 res!383342) b!598060))

(assert (= (and b!598060 res!383354) b!598072))

(assert (= (and b!598072 res!383338) b!598055))

(assert (= (and b!598055 res!383349) b!598062))

(assert (= (and b!598055 c!67724) b!598061))

(assert (= (and b!598055 (not c!67724)) b!598056))

(assert (= (and b!598055 (not res!383357)) b!598063))

(assert (= (and b!598063 res!383347) b!598059))

(assert (= (and b!598059 (not res!383345)) b!598066))

(assert (= (and b!598066 res!383352) b!598052))

(assert (= (and b!598063 (not res!383340)) b!598057))

(assert (= (and b!598057 (not res!383344)) b!598053))

(assert (= (and b!598053 (not res!383346)) b!598068))

(assert (= (and b!598068 res!383348) b!598073))

(declare-fun m!575387 () Bool)

(assert (=> b!598064 m!575387))

(declare-fun m!575389 () Bool)

(assert (=> b!598063 m!575389))

(declare-fun m!575391 () Bool)

(assert (=> b!598063 m!575391))

(declare-fun m!575393 () Bool)

(assert (=> b!598063 m!575393))

(assert (=> b!598066 m!575389))

(assert (=> b!598066 m!575389))

(declare-fun m!575395 () Bool)

(assert (=> b!598066 m!575395))

(assert (=> b!598065 m!575389))

(assert (=> b!598065 m!575389))

(declare-fun m!575397 () Bool)

(assert (=> b!598065 m!575397))

(declare-fun m!575399 () Bool)

(assert (=> b!598053 m!575399))

(declare-fun m!575401 () Bool)

(assert (=> b!598072 m!575401))

(assert (=> b!598072 m!575389))

(assert (=> b!598072 m!575389))

(declare-fun m!575403 () Bool)

(assert (=> b!598072 m!575403))

(declare-fun m!575405 () Bool)

(assert (=> b!598071 m!575405))

(declare-fun m!575407 () Bool)

(assert (=> b!598054 m!575407))

(declare-fun m!575409 () Bool)

(assert (=> b!598073 m!575409))

(declare-fun m!575411 () Bool)

(assert (=> b!598067 m!575411))

(declare-fun m!575413 () Bool)

(assert (=> b!598058 m!575413))

(assert (=> b!598057 m!575389))

(assert (=> b!598057 m!575389))

(declare-fun m!575415 () Bool)

(assert (=> b!598057 m!575415))

(assert (=> b!598057 m!575389))

(declare-fun m!575417 () Bool)

(assert (=> b!598057 m!575417))

(declare-fun m!575419 () Bool)

(assert (=> b!598057 m!575419))

(declare-fun m!575421 () Bool)

(assert (=> b!598057 m!575421))

(assert (=> b!598052 m!575389))

(assert (=> b!598052 m!575389))

(declare-fun m!575423 () Bool)

(assert (=> b!598052 m!575423))

(assert (=> b!598060 m!575391))

(declare-fun m!575425 () Bool)

(assert (=> b!598060 m!575425))

(declare-fun m!575427 () Bool)

(assert (=> b!598055 m!575427))

(declare-fun m!575429 () Bool)

(assert (=> b!598055 m!575429))

(declare-fun m!575431 () Bool)

(assert (=> b!598055 m!575431))

(assert (=> b!598055 m!575389))

(assert (=> b!598055 m!575391))

(declare-fun m!575433 () Bool)

(assert (=> b!598055 m!575433))

(assert (=> b!598055 m!575389))

(declare-fun m!575435 () Bool)

(assert (=> b!598055 m!575435))

(declare-fun m!575437 () Bool)

(assert (=> b!598055 m!575437))

(declare-fun m!575439 () Bool)

(assert (=> b!598070 m!575439))

(assert (=> b!598059 m!575389))

(declare-fun m!575441 () Bool)

(assert (=> start!54734 m!575441))

(declare-fun m!575443 () Bool)

(assert (=> start!54734 m!575443))

(declare-fun m!575445 () Bool)

(assert (=> b!598068 m!575445))

(push 1)

(assert (not b!598054))

(assert (not b!598068))

(assert (not b!598066))

(assert (not b!598064))

(assert (not b!598073))

(assert (not b!598053))

(assert (not b!598057))

(assert (not b!598058))

(assert (not b!598055))

(assert (not b!598072))

(assert (not b!598071))

(assert (not start!54734))

(assert (not b!598065))

(assert (not b!598070))

(assert (not b!598052))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!86975 () Bool)

(declare-fun res!383382 () Bool)

(declare-fun e!341858 () Bool)

(assert (=> d!86975 (=> res!383382 e!341858)))

(assert (=> d!86975 (= res!383382 (= (select (arr!17786 lt!271711) j!136) (select (arr!17786 a!2986) j!136)))))

(assert (=> d!86975 (= (arrayContainsKey!0 lt!271711 (select (arr!17786 a!2986) j!136) j!136) e!341858)))

(declare-fun b!598130 () Bool)

(declare-fun e!341859 () Bool)

(assert (=> b!598130 (= e!341858 e!341859)))

(declare-fun res!383383 () Bool)

(assert (=> b!598130 (=> (not res!383383) (not e!341859))))

(assert (=> b!598130 (= res!383383 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18150 lt!271711)))))

(declare-fun b!598131 () Bool)

(assert (=> b!598131 (= e!341859 (arrayContainsKey!0 lt!271711 (select (arr!17786 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!86975 (not res!383382)) b!598130))

(assert (= (and b!598130 res!383383) b!598131))

(declare-fun m!575477 () Bool)

(assert (=> d!86975 m!575477))

(assert (=> b!598131 m!575389))

(declare-fun m!575479 () Bool)

(assert (=> b!598131 m!575479))

(assert (=> b!598066 d!86975))

(declare-fun d!86979 () Bool)

(declare-fun e!341896 () Bool)

(assert (=> d!86979 e!341896))

(declare-fun res!383406 () Bool)

(assert (=> d!86979 (=> (not res!383406) (not e!341896))))

(assert (=> d!86979 (= res!383406 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18150 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18150 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18150 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18150 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18150 a!2986))))))

(declare-fun lt!271756 () Unit!18822)

(declare-fun choose!9 (array!37050 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18822)

(assert (=> d!86979 (= lt!271756 (choose!9 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!271706 vacantSpotIndex!68 mask!3053))))

(assert (=> d!86979 (validMask!0 mask!3053)))

(assert (=> d!86979 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!271706 vacantSpotIndex!68 mask!3053) lt!271756)))

(declare-fun b!598182 () Bool)

(assert (=> b!598182 (= e!341896 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271706 vacantSpotIndex!68 (select (arr!17786 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271706 vacantSpotIndex!68 (select (store (arr!17786 a!2986) i!1108 k!1786) j!136) (array!37051 (store (arr!17786 a!2986) i!1108 k!1786) (size!18150 a!2986)) mask!3053)))))

(assert (= (and d!86979 res!383406) b!598182))

(declare-fun m!575527 () Bool)

(assert (=> d!86979 m!575527))

(assert (=> d!86979 m!575441))

(assert (=> b!598182 m!575389))

(assert (=> b!598182 m!575435))

(assert (=> b!598182 m!575391))

(assert (=> b!598182 m!575429))

(declare-fun m!575529 () Bool)

(assert (=> b!598182 m!575529))

(assert (=> b!598182 m!575429))

(assert (=> b!598182 m!575389))

(assert (=> b!598055 d!86979))

(declare-fun b!598226 () Bool)

(declare-fun e!341934 () SeekEntryResult!6226)

(assert (=> b!598226 (= e!341934 (Found!6226 lt!271706))))

(declare-fun b!598227 () Bool)

(declare-fun e!341933 () SeekEntryResult!6226)

(assert (=> b!598227 (= e!341933 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!271706 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!17786 a!2986) j!136) a!2986 mask!3053))))

(declare-fun lt!271773 () SeekEntryResult!6226)

(declare-fun d!86997 () Bool)

(assert (=> d!86997 (and (or (is-Undefined!6226 lt!271773) (not (is-Found!6226 lt!271773)) (and (bvsge (index!27159 lt!271773) #b00000000000000000000000000000000) (bvslt (index!27159 lt!271773) (size!18150 a!2986)))) (or (is-Undefined!6226 lt!271773) (is-Found!6226 lt!271773) (not (is-MissingVacant!6226 lt!271773)) (not (= (index!27161 lt!271773) vacantSpotIndex!68)) (and (bvsge (index!27161 lt!271773) #b00000000000000000000000000000000) (bvslt (index!27161 lt!271773) (size!18150 a!2986)))) (or (is-Undefined!6226 lt!271773) (ite (is-Found!6226 lt!271773) (= (select (arr!17786 a!2986) (index!27159 lt!271773)) (select (arr!17786 a!2986) j!136)) (and (is-MissingVacant!6226 lt!271773) (= (index!27161 lt!271773) vacantSpotIndex!68) (= (select (arr!17786 a!2986) (index!27161 lt!271773)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!341932 () SeekEntryResult!6226)

(assert (=> d!86997 (= lt!271773 e!341932)))

(declare-fun c!67764 () Bool)

(assert (=> d!86997 (= c!67764 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!271774 () (_ BitVec 64))

(assert (=> d!86997 (= lt!271774 (select (arr!17786 a!2986) lt!271706))))

(assert (=> d!86997 (validMask!0 mask!3053)))

(assert (=> d!86997 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271706 vacantSpotIndex!68 (select (arr!17786 a!2986) j!136) a!2986 mask!3053) lt!271773)))

(declare-fun b!598228 () Bool)

(assert (=> b!598228 (= e!341932 Undefined!6226)))

(declare-fun b!598229 () Bool)

(declare-fun c!67765 () Bool)

(assert (=> b!598229 (= c!67765 (= lt!271774 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!598229 (= e!341934 e!341933)))

(declare-fun b!598230 () Bool)

(assert (=> b!598230 (= e!341933 (MissingVacant!6226 vacantSpotIndex!68))))

(declare-fun b!598231 () Bool)

(assert (=> b!598231 (= e!341932 e!341934)))

(declare-fun c!67763 () Bool)

(assert (=> b!598231 (= c!67763 (= lt!271774 (select (arr!17786 a!2986) j!136)))))

(assert (= (and d!86997 c!67764) b!598228))

(assert (= (and d!86997 (not c!67764)) b!598231))

(assert (= (and b!598231 c!67763) b!598226))

(assert (= (and b!598231 (not c!67763)) b!598229))

(assert (= (and b!598229 c!67765) b!598230))

(assert (= (and b!598229 (not c!67765)) b!598227))

(declare-fun m!575569 () Bool)

(assert (=> b!598227 m!575569))

(assert (=> b!598227 m!575569))

(assert (=> b!598227 m!575389))

(declare-fun m!575573 () Bool)

(assert (=> b!598227 m!575573))

(declare-fun m!575577 () Bool)

(assert (=> d!86997 m!575577))

(declare-fun m!575579 () Bool)

(assert (=> d!86997 m!575579))

(declare-fun m!575581 () Bool)

(assert (=> d!86997 m!575581))

(assert (=> d!86997 m!575441))

(assert (=> b!598055 d!86997))

(declare-fun d!87025 () Bool)

(declare-fun lt!271782 () (_ BitVec 32))

(assert (=> d!87025 (and (bvsge lt!271782 #b00000000000000000000000000000000) (bvslt lt!271782 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!87025 (= lt!271782 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!87025 (validMask!0 mask!3053)))

(assert (=> d!87025 (= (nextIndex!0 index!984 x!910 mask!3053) lt!271782)))

(declare-fun bs!18385 () Bool)

(assert (= bs!18385 d!87025))

(declare-fun m!575583 () Bool)

(assert (=> bs!18385 m!575583))

(assert (=> bs!18385 m!575441))

(assert (=> b!598055 d!87025))

(declare-fun b!598244 () Bool)

(declare-fun e!341949 () SeekEntryResult!6226)

(assert (=> b!598244 (= e!341949 (Found!6226 lt!271706))))

(declare-fun e!341948 () SeekEntryResult!6226)

(declare-fun b!598245 () Bool)

(assert (=> b!598245 (= e!341948 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!271706 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!271714 lt!271711 mask!3053))))

(declare-fun lt!271783 () SeekEntryResult!6226)

(declare-fun d!87027 () Bool)

(assert (=> d!87027 (and (or (is-Undefined!6226 lt!271783) (not (is-Found!6226 lt!271783)) (and (bvsge (index!27159 lt!271783) #b00000000000000000000000000000000) (bvslt (index!27159 lt!271783) (size!18150 lt!271711)))) (or (is-Undefined!6226 lt!271783) (is-Found!6226 lt!271783) (not (is-MissingVacant!6226 lt!271783)) (not (= (index!27161 lt!271783) vacantSpotIndex!68)) (and (bvsge (index!27161 lt!271783) #b00000000000000000000000000000000) (bvslt (index!27161 lt!271783) (size!18150 lt!271711)))) (or (is-Undefined!6226 lt!271783) (ite (is-Found!6226 lt!271783) (= (select (arr!17786 lt!271711) (index!27159 lt!271783)) lt!271714) (and (is-MissingVacant!6226 lt!271783) (= (index!27161 lt!271783) vacantSpotIndex!68) (= (select (arr!17786 lt!271711) (index!27161 lt!271783)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!341947 () SeekEntryResult!6226)

(assert (=> d!87027 (= lt!271783 e!341947)))

(declare-fun c!67767 () Bool)

(assert (=> d!87027 (= c!67767 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!271784 () (_ BitVec 64))

(assert (=> d!87027 (= lt!271784 (select (arr!17786 lt!271711) lt!271706))))

(assert (=> d!87027 (validMask!0 mask!3053)))

(assert (=> d!87027 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271706 vacantSpotIndex!68 lt!271714 lt!271711 mask!3053) lt!271783)))

(declare-fun b!598246 () Bool)

(assert (=> b!598246 (= e!341947 Undefined!6226)))

(declare-fun b!598247 () Bool)

(declare-fun c!67768 () Bool)

(assert (=> b!598247 (= c!67768 (= lt!271784 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!598247 (= e!341949 e!341948)))

(declare-fun b!598248 () Bool)

(assert (=> b!598248 (= e!341948 (MissingVacant!6226 vacantSpotIndex!68))))

(declare-fun b!598249 () Bool)

(assert (=> b!598249 (= e!341947 e!341949)))

(declare-fun c!67766 () Bool)

(assert (=> b!598249 (= c!67766 (= lt!271784 lt!271714))))

(assert (= (and d!87027 c!67767) b!598246))

(assert (= (and d!87027 (not c!67767)) b!598249))

(assert (= (and b!598249 c!67766) b!598244))

(assert (= (and b!598249 (not c!67766)) b!598247))

(assert (= (and b!598247 c!67768) b!598248))

(assert (= (and b!598247 (not c!67768)) b!598245))

(assert (=> b!598245 m!575569))

(assert (=> b!598245 m!575569))

(declare-fun m!575593 () Bool)

(assert (=> b!598245 m!575593))

(declare-fun m!575597 () Bool)

(assert (=> d!87027 m!575597))

(declare-fun m!575601 () Bool)

(assert (=> d!87027 m!575601))

(declare-fun m!575603 () Bool)

(assert (=> d!87027 m!575603))

(assert (=> d!87027 m!575441))

(assert (=> b!598055 d!87027))

(declare-fun b!598252 () Bool)

(declare-fun e!341954 () SeekEntryResult!6226)

(assert (=> b!598252 (= e!341954 (Found!6226 index!984))))

(declare-fun b!598253 () Bool)

(declare-fun e!341953 () SeekEntryResult!6226)

(assert (=> b!598253 (= e!341953 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!271714 lt!271711 mask!3053))))

(declare-fun d!87033 () Bool)

(declare-fun lt!271786 () SeekEntryResult!6226)

(assert (=> d!87033 (and (or (is-Undefined!6226 lt!271786) (not (is-Found!6226 lt!271786)) (and (bvsge (index!27159 lt!271786) #b00000000000000000000000000000000) (bvslt (index!27159 lt!271786) (size!18150 lt!271711)))) (or (is-Undefined!6226 lt!271786) (is-Found!6226 lt!271786) (not (is-MissingVacant!6226 lt!271786)) (not (= (index!27161 lt!271786) vacantSpotIndex!68)) (and (bvsge (index!27161 lt!271786) #b00000000000000000000000000000000) (bvslt (index!27161 lt!271786) (size!18150 lt!271711)))) (or (is-Undefined!6226 lt!271786) (ite (is-Found!6226 lt!271786) (= (select (arr!17786 lt!271711) (index!27159 lt!271786)) lt!271714) (and (is-MissingVacant!6226 lt!271786) (= (index!27161 lt!271786) vacantSpotIndex!68) (= (select (arr!17786 lt!271711) (index!27161 lt!271786)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!341952 () SeekEntryResult!6226)

(assert (=> d!87033 (= lt!271786 e!341952)))

(declare-fun c!67770 () Bool)

(assert (=> d!87033 (= c!67770 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!271787 () (_ BitVec 64))

(assert (=> d!87033 (= lt!271787 (select (arr!17786 lt!271711) index!984))))

(assert (=> d!87033 (validMask!0 mask!3053)))

(assert (=> d!87033 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!271714 lt!271711 mask!3053) lt!271786)))

(declare-fun b!598254 () Bool)

(assert (=> b!598254 (= e!341952 Undefined!6226)))

(declare-fun b!598255 () Bool)

(declare-fun c!67771 () Bool)

(assert (=> b!598255 (= c!67771 (= lt!271787 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!598255 (= e!341954 e!341953)))

(declare-fun b!598256 () Bool)

(assert (=> b!598256 (= e!341953 (MissingVacant!6226 vacantSpotIndex!68))))

(declare-fun b!598257 () Bool)

(assert (=> b!598257 (= e!341952 e!341954)))

(declare-fun c!67769 () Bool)

(assert (=> b!598257 (= c!67769 (= lt!271787 lt!271714))))

(assert (= (and d!87033 c!67770) b!598254))

(assert (= (and d!87033 (not c!67770)) b!598257))

(assert (= (and b!598257 c!67769) b!598252))

(assert (= (and b!598257 (not c!67769)) b!598255))

(assert (= (and b!598255 c!67771) b!598256))

(assert (= (and b!598255 (not c!67771)) b!598253))

(assert (=> b!598253 m!575427))

(assert (=> b!598253 m!575427))

(declare-fun m!575605 () Bool)

(assert (=> b!598253 m!575605))

(declare-fun m!575607 () Bool)

(assert (=> d!87033 m!575607))

(declare-fun m!575609 () Bool)

(assert (=> d!87033 m!575609))

(declare-fun m!575611 () Bool)

(assert (=> d!87033 m!575611))

(assert (=> d!87033 m!575441))

(assert (=> b!598055 d!87033))

(declare-fun b!598268 () Bool)

(declare-fun e!341963 () Bool)

(assert (=> b!598268 (= e!341963 (contains!2958 Nil!11824 (select (arr!17786 lt!271711) #b00000000000000000000000000000000)))))

(declare-fun b!598269 () Bool)

(declare-fun e!341964 () Bool)

(declare-fun e!341966 () Bool)

(assert (=> b!598269 (= e!341964 e!341966)))

(declare-fun c!67774 () Bool)

(assert (=> b!598269 (= c!67774 (validKeyInArray!0 (select (arr!17786 lt!271711) #b00000000000000000000000000000000)))))

(declare-fun d!87037 () Bool)

(declare-fun res!383454 () Bool)

(declare-fun e!341965 () Bool)

(assert (=> d!87037 (=> res!383454 e!341965)))

(assert (=> d!87037 (= res!383454 (bvsge #b00000000000000000000000000000000 (size!18150 lt!271711)))))

(assert (=> d!87037 (= (arrayNoDuplicates!0 lt!271711 #b00000000000000000000000000000000 Nil!11824) e!341965)))

(declare-fun b!598270 () Bool)

(declare-fun call!32962 () Bool)

(assert (=> b!598270 (= e!341966 call!32962)))

(declare-fun b!598271 () Bool)

(assert (=> b!598271 (= e!341966 call!32962)))

(declare-fun bm!32959 () Bool)

(assert (=> bm!32959 (= call!32962 (arrayNoDuplicates!0 lt!271711 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!67774 (Cons!11823 (select (arr!17786 lt!271711) #b00000000000000000000000000000000) Nil!11824) Nil!11824)))))

(declare-fun b!598272 () Bool)

(assert (=> b!598272 (= e!341965 e!341964)))

(declare-fun res!383455 () Bool)

(assert (=> b!598272 (=> (not res!383455) (not e!341964))))

(assert (=> b!598272 (= res!383455 (not e!341963))))

(declare-fun res!383456 () Bool)

(assert (=> b!598272 (=> (not res!383456) (not e!341963))))

(assert (=> b!598272 (= res!383456 (validKeyInArray!0 (select (arr!17786 lt!271711) #b00000000000000000000000000000000)))))

(assert (= (and d!87037 (not res!383454)) b!598272))

(assert (= (and b!598272 res!383456) b!598268))

(assert (= (and b!598272 res!383455) b!598269))

(assert (= (and b!598269 c!67774) b!598271))

(assert (= (and b!598269 (not c!67774)) b!598270))

(assert (= (or b!598271 b!598270) bm!32959))

(declare-fun m!575613 () Bool)

(assert (=> b!598268 m!575613))

(assert (=> b!598268 m!575613))

(declare-fun m!575615 () Bool)

(assert (=> b!598268 m!575615))

(assert (=> b!598269 m!575613))

(assert (=> b!598269 m!575613))

(declare-fun m!575617 () Bool)

(assert (=> b!598269 m!575617))

(assert (=> bm!32959 m!575613))

(declare-fun m!575619 () Bool)

(assert (=> bm!32959 m!575619))

(assert (=> b!598272 m!575613))

(assert (=> b!598272 m!575613))

(assert (=> b!598272 m!575617))

(assert (=> b!598057 d!87037))

(declare-fun d!87039 () Bool)

(declare-fun e!341975 () Bool)

(assert (=> d!87039 e!341975))

(declare-fun res!383459 () Bool)

(assert (=> d!87039 (=> (not res!383459) (not e!341975))))

(assert (=> d!87039 (= res!383459 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18150 a!2986))))))

(declare-fun lt!271794 () Unit!18822)

(declare-fun choose!41 (array!37050 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11827) Unit!18822)

(assert (=> d!87039 (= lt!271794 (choose!41 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11824))))

(assert (=> d!87039 (bvslt (size!18150 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!87039 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11824) lt!271794)))

(declare-fun b!598287 () Bool)

(assert (=> b!598287 (= e!341975 (arrayNoDuplicates!0 (array!37051 (store (arr!17786 a!2986) i!1108 k!1786) (size!18150 a!2986)) #b00000000000000000000000000000000 Nil!11824))))

(assert (= (and d!87039 res!383459) b!598287))

(declare-fun m!575621 () Bool)

(assert (=> d!87039 m!575621))

(assert (=> b!598287 m!575391))

(declare-fun m!575623 () Bool)

(assert (=> b!598287 m!575623))

(assert (=> b!598057 d!87039))

(declare-fun d!87041 () Bool)

(declare-fun res!383460 () Bool)

(declare-fun e!341976 () Bool)

(assert (=> d!87041 (=> res!383460 e!341976)))

(assert (=> d!87041 (= res!383460 (= (select (arr!17786 lt!271711) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!17786 a!2986) j!136)))))

(assert (=> d!87041 (= (arrayContainsKey!0 lt!271711 (select (arr!17786 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!341976)))

(declare-fun b!598288 () Bool)

(declare-fun e!341977 () Bool)

(assert (=> b!598288 (= e!341976 e!341977)))

(declare-fun res!383461 () Bool)

(assert (=> b!598288 (=> (not res!383461) (not e!341977))))

(assert (=> b!598288 (= res!383461 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18150 lt!271711)))))

