; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57338 () Bool)

(assert start!57338)

(declare-fun b!634524 () Bool)

(declare-fun res!410405 () Bool)

(declare-fun e!362862 () Bool)

(assert (=> b!634524 (=> (not res!410405) (not e!362862))))

(declare-datatypes ((array!38191 0))(
  ( (array!38192 (arr!18324 (Array (_ BitVec 32) (_ BitVec 64))) (size!18688 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38191)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!634524 (= res!410405 (validKeyInArray!0 (select (arr!18324 a!2986) j!136)))))

(declare-fun b!634525 () Bool)

(declare-datatypes ((Unit!21390 0))(
  ( (Unit!21391) )
))
(declare-fun e!362856 () Unit!21390)

(declare-fun Unit!21392 () Unit!21390)

(assert (=> b!634525 (= e!362856 Unit!21392)))

(declare-fun b!634526 () Bool)

(declare-fun e!362864 () Bool)

(declare-fun e!362861 () Bool)

(assert (=> b!634526 (= e!362864 e!362861)))

(declare-fun res!410401 () Bool)

(assert (=> b!634526 (=> (not res!410401) (not e!362861))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!634526 (= res!410401 (= (select (store (arr!18324 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!293329 () array!38191)

(assert (=> b!634526 (= lt!293329 (array!38192 (store (arr!18324 a!2986) i!1108 k!1786) (size!18688 a!2986)))))

(declare-fun b!634527 () Bool)

(declare-fun Unit!21393 () Unit!21390)

(assert (=> b!634527 (= e!362856 Unit!21393)))

(assert (=> b!634527 false))

(declare-fun b!634528 () Bool)

(declare-fun e!362855 () Bool)

(declare-datatypes ((SeekEntryResult!6764 0))(
  ( (MissingZero!6764 (index!29358 (_ BitVec 32))) (Found!6764 (index!29359 (_ BitVec 32))) (Intermediate!6764 (undefined!7576 Bool) (index!29360 (_ BitVec 32)) (x!58106 (_ BitVec 32))) (Undefined!6764) (MissingVacant!6764 (index!29361 (_ BitVec 32))) )
))
(declare-fun lt!293325 () SeekEntryResult!6764)

(declare-fun lt!293324 () SeekEntryResult!6764)

(assert (=> b!634528 (= e!362855 (= lt!293325 lt!293324))))

(declare-fun b!634529 () Bool)

(declare-fun e!362863 () Bool)

(declare-fun e!362857 () Bool)

(assert (=> b!634529 (= e!362863 e!362857)))

(declare-fun res!410402 () Bool)

(assert (=> b!634529 (=> (not res!410402) (not e!362857))))

(declare-fun arrayContainsKey!0 (array!38191 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!634529 (= res!410402 (arrayContainsKey!0 lt!293329 (select (arr!18324 a!2986) j!136) j!136))))

(declare-fun res!410403 () Bool)

(assert (=> start!57338 (=> (not res!410403) (not e!362862))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57338 (= res!410403 (validMask!0 mask!3053))))

(assert (=> start!57338 e!362862))

(assert (=> start!57338 true))

(declare-fun array_inv!14120 (array!38191) Bool)

(assert (=> start!57338 (array_inv!14120 a!2986)))

(declare-fun b!634530 () Bool)

(declare-fun res!410392 () Bool)

(assert (=> b!634530 (=> (not res!410392) (not e!362862))))

(assert (=> b!634530 (= res!410392 (and (= (size!18688 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18688 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18688 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!634531 () Bool)

(declare-fun e!362859 () Bool)

(assert (=> b!634531 (= e!362859 e!362863)))

(declare-fun res!410393 () Bool)

(assert (=> b!634531 (=> res!410393 e!362863)))

(declare-fun lt!293326 () (_ BitVec 64))

(declare-fun lt!293322 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!634531 (= res!410393 (or (not (= (select (arr!18324 a!2986) j!136) lt!293322)) (not (= (select (arr!18324 a!2986) j!136) lt!293326)) (bvsge j!136 index!984)))))

(declare-fun b!634532 () Bool)

(declare-fun res!410404 () Bool)

(assert (=> b!634532 (=> (not res!410404) (not e!362864))))

(declare-datatypes ((List!12365 0))(
  ( (Nil!12362) (Cons!12361 (h!13406 (_ BitVec 64)) (t!18593 List!12365)) )
))
(declare-fun arrayNoDuplicates!0 (array!38191 (_ BitVec 32) List!12365) Bool)

(assert (=> b!634532 (= res!410404 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12362))))

(declare-fun b!634533 () Bool)

(declare-fun e!362860 () Bool)

(assert (=> b!634533 (= e!362861 e!362860)))

(declare-fun res!410391 () Bool)

(assert (=> b!634533 (=> (not res!410391) (not e!362860))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!634533 (= res!410391 (and (= lt!293325 (Found!6764 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18324 a!2986) index!984) (select (arr!18324 a!2986) j!136))) (not (= (select (arr!18324 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38191 (_ BitVec 32)) SeekEntryResult!6764)

(assert (=> b!634533 (= lt!293325 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18324 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!634534 () Bool)

(declare-fun e!362858 () Bool)

(assert (=> b!634534 (= e!362860 (not e!362858))))

(declare-fun res!410395 () Bool)

(assert (=> b!634534 (=> res!410395 e!362858)))

(declare-fun lt!293323 () SeekEntryResult!6764)

(assert (=> b!634534 (= res!410395 (not (= lt!293323 (Found!6764 index!984))))))

(declare-fun lt!293327 () Unit!21390)

(assert (=> b!634534 (= lt!293327 e!362856)))

(declare-fun c!72434 () Bool)

(assert (=> b!634534 (= c!72434 (= lt!293323 Undefined!6764))))

(assert (=> b!634534 (= lt!293323 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!293322 lt!293329 mask!3053))))

(assert (=> b!634534 e!362855))

(declare-fun res!410399 () Bool)

(assert (=> b!634534 (=> (not res!410399) (not e!362855))))

(declare-fun lt!293321 () (_ BitVec 32))

(assert (=> b!634534 (= res!410399 (= lt!293324 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293321 vacantSpotIndex!68 lt!293322 lt!293329 mask!3053)))))

(assert (=> b!634534 (= lt!293324 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293321 vacantSpotIndex!68 (select (arr!18324 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!634534 (= lt!293322 (select (store (arr!18324 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!293328 () Unit!21390)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38191 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21390)

(assert (=> b!634534 (= lt!293328 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!293321 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!634534 (= lt!293321 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!634535 () Bool)

(declare-fun res!410400 () Bool)

(assert (=> b!634535 (=> (not res!410400) (not e!362862))))

(assert (=> b!634535 (= res!410400 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!634536 () Bool)

(assert (=> b!634536 (= e!362857 (arrayContainsKey!0 lt!293329 (select (arr!18324 a!2986) j!136) index!984))))

(declare-fun b!634537 () Bool)

(declare-fun res!410398 () Bool)

(assert (=> b!634537 (=> (not res!410398) (not e!362864))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38191 (_ BitVec 32)) Bool)

(assert (=> b!634537 (= res!410398 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!634538 () Bool)

(declare-fun res!410397 () Bool)

(assert (=> b!634538 (=> (not res!410397) (not e!362864))))

(assert (=> b!634538 (= res!410397 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18324 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!634539 () Bool)

(assert (=> b!634539 (= e!362858 true)))

(assert (=> b!634539 e!362859))

(declare-fun res!410396 () Bool)

(assert (=> b!634539 (=> (not res!410396) (not e!362859))))

(assert (=> b!634539 (= res!410396 (= lt!293326 (select (arr!18324 a!2986) j!136)))))

(assert (=> b!634539 (= lt!293326 (select (store (arr!18324 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!634540 () Bool)

(assert (=> b!634540 (= e!362862 e!362864)))

(declare-fun res!410390 () Bool)

(assert (=> b!634540 (=> (not res!410390) (not e!362864))))

(declare-fun lt!293320 () SeekEntryResult!6764)

(assert (=> b!634540 (= res!410390 (or (= lt!293320 (MissingZero!6764 i!1108)) (= lt!293320 (MissingVacant!6764 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38191 (_ BitVec 32)) SeekEntryResult!6764)

(assert (=> b!634540 (= lt!293320 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!634541 () Bool)

(declare-fun res!410394 () Bool)

(assert (=> b!634541 (=> (not res!410394) (not e!362862))))

(assert (=> b!634541 (= res!410394 (validKeyInArray!0 k!1786))))

(assert (= (and start!57338 res!410403) b!634530))

(assert (= (and b!634530 res!410392) b!634524))

(assert (= (and b!634524 res!410405) b!634541))

(assert (= (and b!634541 res!410394) b!634535))

(assert (= (and b!634535 res!410400) b!634540))

(assert (= (and b!634540 res!410390) b!634537))

(assert (= (and b!634537 res!410398) b!634532))

(assert (= (and b!634532 res!410404) b!634538))

(assert (= (and b!634538 res!410397) b!634526))

(assert (= (and b!634526 res!410401) b!634533))

(assert (= (and b!634533 res!410391) b!634534))

(assert (= (and b!634534 res!410399) b!634528))

(assert (= (and b!634534 c!72434) b!634527))

(assert (= (and b!634534 (not c!72434)) b!634525))

(assert (= (and b!634534 (not res!410395)) b!634539))

(assert (= (and b!634539 res!410396) b!634531))

(assert (= (and b!634531 (not res!410393)) b!634529))

(assert (= (and b!634529 res!410402) b!634536))

(declare-fun m!609005 () Bool)

(assert (=> b!634541 m!609005))

(declare-fun m!609007 () Bool)

(assert (=> b!634524 m!609007))

(assert (=> b!634524 m!609007))

(declare-fun m!609009 () Bool)

(assert (=> b!634524 m!609009))

(assert (=> b!634531 m!609007))

(declare-fun m!609011 () Bool)

(assert (=> b!634540 m!609011))

(declare-fun m!609013 () Bool)

(assert (=> b!634535 m!609013))

(declare-fun m!609015 () Bool)

(assert (=> b!634532 m!609015))

(declare-fun m!609017 () Bool)

(assert (=> b!634538 m!609017))

(declare-fun m!609019 () Bool)

(assert (=> start!57338 m!609019))

(declare-fun m!609021 () Bool)

(assert (=> start!57338 m!609021))

(declare-fun m!609023 () Bool)

(assert (=> b!634533 m!609023))

(assert (=> b!634533 m!609007))

(assert (=> b!634533 m!609007))

(declare-fun m!609025 () Bool)

(assert (=> b!634533 m!609025))

(assert (=> b!634539 m!609007))

(declare-fun m!609027 () Bool)

(assert (=> b!634539 m!609027))

(declare-fun m!609029 () Bool)

(assert (=> b!634539 m!609029))

(assert (=> b!634526 m!609027))

(declare-fun m!609031 () Bool)

(assert (=> b!634526 m!609031))

(assert (=> b!634529 m!609007))

(assert (=> b!634529 m!609007))

(declare-fun m!609033 () Bool)

(assert (=> b!634529 m!609033))

(assert (=> b!634536 m!609007))

(assert (=> b!634536 m!609007))

(declare-fun m!609035 () Bool)

(assert (=> b!634536 m!609035))

(declare-fun m!609037 () Bool)

(assert (=> b!634537 m!609037))

(declare-fun m!609039 () Bool)

(assert (=> b!634534 m!609039))

(declare-fun m!609041 () Bool)

(assert (=> b!634534 m!609041))

(assert (=> b!634534 m!609027))

(declare-fun m!609043 () Bool)

(assert (=> b!634534 m!609043))

(declare-fun m!609045 () Bool)

(assert (=> b!634534 m!609045))

(declare-fun m!609047 () Bool)

(assert (=> b!634534 m!609047))

(assert (=> b!634534 m!609007))

(assert (=> b!634534 m!609007))

(declare-fun m!609049 () Bool)

(assert (=> b!634534 m!609049))

(push 1)

