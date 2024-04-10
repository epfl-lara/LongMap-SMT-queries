; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55018 () Bool)

(assert start!55018)

(declare-fun b!602399 () Bool)

(declare-fun e!344526 () Bool)

(declare-fun e!344529 () Bool)

(assert (=> b!602399 (= e!344526 (not e!344529))))

(declare-fun res!386829 () Bool)

(assert (=> b!602399 (=> res!386829 e!344529)))

(declare-datatypes ((SeekEntryResult!6284 0))(
  ( (MissingZero!6284 (index!27396 (_ BitVec 32))) (Found!6284 (index!27397 (_ BitVec 32))) (Intermediate!6284 (undefined!7096 Bool) (index!27398 (_ BitVec 32)) (x!56196 (_ BitVec 32))) (Undefined!6284) (MissingVacant!6284 (index!27399 (_ BitVec 32))) )
))
(declare-fun lt!274383 () SeekEntryResult!6284)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!602399 (= res!386829 (not (= lt!274383 (Found!6284 index!984))))))

(declare-datatypes ((Unit!19084 0))(
  ( (Unit!19085) )
))
(declare-fun lt!274382 () Unit!19084)

(declare-fun e!344521 () Unit!19084)

(assert (=> b!602399 (= lt!274382 e!344521)))

(declare-fun c!68153 () Bool)

(assert (=> b!602399 (= c!68153 (= lt!274383 Undefined!6284))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-datatypes ((array!37172 0))(
  ( (array!37173 (arr!17844 (Array (_ BitVec 32) (_ BitVec 64))) (size!18208 (_ BitVec 32))) )
))
(declare-fun lt!274381 () array!37172)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!274391 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37172 (_ BitVec 32)) SeekEntryResult!6284)

(assert (=> b!602399 (= lt!274383 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!274391 lt!274381 mask!3053))))

(declare-fun e!344527 () Bool)

(assert (=> b!602399 e!344527))

(declare-fun res!386838 () Bool)

(assert (=> b!602399 (=> (not res!386838) (not e!344527))))

(declare-fun lt!274387 () SeekEntryResult!6284)

(declare-fun lt!274386 () (_ BitVec 32))

(assert (=> b!602399 (= res!386838 (= lt!274387 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!274386 vacantSpotIndex!68 lt!274391 lt!274381 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun a!2986 () array!37172)

(assert (=> b!602399 (= lt!274387 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!274386 vacantSpotIndex!68 (select (arr!17844 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!602399 (= lt!274391 (select (store (arr!17844 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!274388 () Unit!19084)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37172 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19084)

(assert (=> b!602399 (= lt!274388 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!274386 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!602399 (= lt!274386 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun e!344517 () Bool)

(declare-fun b!602400 () Bool)

(declare-fun arrayContainsKey!0 (array!37172 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!602400 (= e!344517 (arrayContainsKey!0 lt!274381 (select (arr!17844 a!2986) j!136) index!984))))

(declare-fun b!602401 () Bool)

(declare-fun res!386837 () Bool)

(declare-fun e!344516 () Bool)

(assert (=> b!602401 (=> (not res!386837) (not e!344516))))

(declare-datatypes ((List!11885 0))(
  ( (Nil!11882) (Cons!11881 (h!12926 (_ BitVec 64)) (t!18113 List!11885)) )
))
(declare-fun arrayNoDuplicates!0 (array!37172 (_ BitVec 32) List!11885) Bool)

(assert (=> b!602401 (= res!386837 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11882))))

(declare-fun b!602402 () Bool)

(declare-fun e!344518 () Bool)

(assert (=> b!602402 (= e!344518 e!344526)))

(declare-fun res!386835 () Bool)

(assert (=> b!602402 (=> (not res!386835) (not e!344526))))

(declare-fun lt!274385 () SeekEntryResult!6284)

(assert (=> b!602402 (= res!386835 (and (= lt!274385 (Found!6284 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17844 a!2986) index!984) (select (arr!17844 a!2986) j!136))) (not (= (select (arr!17844 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!602402 (= lt!274385 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17844 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!602403 () Bool)

(declare-fun e!344524 () Unit!19084)

(declare-fun Unit!19086 () Unit!19084)

(assert (=> b!602403 (= e!344524 Unit!19086)))

(declare-fun lt!274393 () Unit!19084)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37172 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19084)

(assert (=> b!602403 (= lt!274393 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!274381 (select (arr!17844 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!602403 (arrayContainsKey!0 lt!274381 (select (arr!17844 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!274392 () Unit!19084)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37172 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11885) Unit!19084)

(assert (=> b!602403 (= lt!274392 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11882))))

(assert (=> b!602403 (arrayNoDuplicates!0 lt!274381 #b00000000000000000000000000000000 Nil!11882)))

(declare-fun lt!274389 () Unit!19084)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37172 (_ BitVec 32) (_ BitVec 32)) Unit!19084)

(assert (=> b!602403 (= lt!274389 (lemmaNoDuplicateFromThenFromBigger!0 lt!274381 #b00000000000000000000000000000000 j!136))))

(assert (=> b!602403 (arrayNoDuplicates!0 lt!274381 j!136 Nil!11882)))

(declare-fun lt!274390 () Unit!19084)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37172 (_ BitVec 64) (_ BitVec 32) List!11885) Unit!19084)

(assert (=> b!602403 (= lt!274390 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!274381 (select (arr!17844 a!2986) j!136) j!136 Nil!11882))))

(assert (=> b!602403 false))

(declare-fun b!602404 () Bool)

(declare-fun res!386839 () Bool)

(declare-fun e!344528 () Bool)

(assert (=> b!602404 (=> (not res!386839) (not e!344528))))

(assert (=> b!602404 (= res!386839 (and (= (size!18208 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18208 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18208 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!602405 () Bool)

(declare-fun res!386845 () Bool)

(assert (=> b!602405 (=> (not res!386845) (not e!344528))))

(assert (=> b!602405 (= res!386845 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!602406 () Bool)

(declare-fun Unit!19087 () Unit!19084)

(assert (=> b!602406 (= e!344521 Unit!19087)))

(declare-fun b!602407 () Bool)

(declare-fun res!386836 () Bool)

(assert (=> b!602407 (=> (not res!386836) (not e!344528))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!602407 (= res!386836 (validKeyInArray!0 (select (arr!17844 a!2986) j!136)))))

(declare-fun b!602408 () Bool)

(assert (=> b!602408 (= e!344516 e!344518)))

(declare-fun res!386832 () Bool)

(assert (=> b!602408 (=> (not res!386832) (not e!344518))))

(assert (=> b!602408 (= res!386832 (= (select (store (arr!17844 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!602408 (= lt!274381 (array!37173 (store (arr!17844 a!2986) i!1108 k!1786) (size!18208 a!2986)))))

(declare-fun b!602409 () Bool)

(declare-fun e!344519 () Bool)

(declare-fun e!344520 () Bool)

(assert (=> b!602409 (= e!344519 e!344520)))

(declare-fun res!386840 () Bool)

(assert (=> b!602409 (=> res!386840 e!344520)))

(assert (=> b!602409 (= res!386840 (bvsge index!984 j!136))))

(declare-fun lt!274380 () Unit!19084)

(assert (=> b!602409 (= lt!274380 e!344524)))

(declare-fun c!68152 () Bool)

(assert (=> b!602409 (= c!68152 (bvslt j!136 index!984))))

(declare-fun b!602411 () Bool)

(assert (=> b!602411 (= e!344528 e!344516)))

(declare-fun res!386844 () Bool)

(assert (=> b!602411 (=> (not res!386844) (not e!344516))))

(declare-fun lt!274379 () SeekEntryResult!6284)

(assert (=> b!602411 (= res!386844 (or (= lt!274379 (MissingZero!6284 i!1108)) (= lt!274379 (MissingVacant!6284 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37172 (_ BitVec 32)) SeekEntryResult!6284)

(assert (=> b!602411 (= lt!274379 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!602412 () Bool)

(declare-fun e!344523 () Bool)

(assert (=> b!602412 (= e!344523 e!344517)))

(declare-fun res!386842 () Bool)

(assert (=> b!602412 (=> (not res!386842) (not e!344517))))

(assert (=> b!602412 (= res!386842 (arrayContainsKey!0 lt!274381 (select (arr!17844 a!2986) j!136) j!136))))

(declare-fun b!602413 () Bool)

(declare-fun res!386843 () Bool)

(assert (=> b!602413 (=> (not res!386843) (not e!344516))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37172 (_ BitVec 32)) Bool)

(assert (=> b!602413 (= res!386843 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!602414 () Bool)

(assert (=> b!602414 (= e!344529 e!344519)))

(declare-fun res!386830 () Bool)

(assert (=> b!602414 (=> res!386830 e!344519)))

(declare-fun lt!274384 () (_ BitVec 64))

(assert (=> b!602414 (= res!386830 (or (not (= (select (arr!17844 a!2986) j!136) lt!274391)) (not (= (select (arr!17844 a!2986) j!136) lt!274384))))))

(declare-fun e!344522 () Bool)

(assert (=> b!602414 e!344522))

(declare-fun res!386834 () Bool)

(assert (=> b!602414 (=> (not res!386834) (not e!344522))))

(assert (=> b!602414 (= res!386834 (= lt!274384 (select (arr!17844 a!2986) j!136)))))

(assert (=> b!602414 (= lt!274384 (select (store (arr!17844 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!602415 () Bool)

(assert (=> b!602415 (= e!344527 (= lt!274385 lt!274387))))

(declare-fun b!602416 () Bool)

(declare-fun res!386833 () Bool)

(assert (=> b!602416 (=> (not res!386833) (not e!344516))))

(assert (=> b!602416 (= res!386833 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17844 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!602417 () Bool)

(assert (=> b!602417 (= e!344520 (or (bvsge index!984 (size!18208 a!2986)) (bvslt (size!18208 a!2986) #b01111111111111111111111111111111)))))

(assert (=> b!602417 (arrayContainsKey!0 lt!274381 (select (arr!17844 a!2986) j!136) j!136)))

(declare-fun b!602418 () Bool)

(declare-fun res!386831 () Bool)

(assert (=> b!602418 (=> (not res!386831) (not e!344528))))

(assert (=> b!602418 (= res!386831 (validKeyInArray!0 k!1786))))

(declare-fun res!386841 () Bool)

(assert (=> start!55018 (=> (not res!386841) (not e!344528))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55018 (= res!386841 (validMask!0 mask!3053))))

(assert (=> start!55018 e!344528))

(assert (=> start!55018 true))

(declare-fun array_inv!13640 (array!37172) Bool)

(assert (=> start!55018 (array_inv!13640 a!2986)))

(declare-fun b!602410 () Bool)

(declare-fun Unit!19088 () Unit!19084)

(assert (=> b!602410 (= e!344521 Unit!19088)))

(assert (=> b!602410 false))

(declare-fun b!602419 () Bool)

(declare-fun Unit!19089 () Unit!19084)

(assert (=> b!602419 (= e!344524 Unit!19089)))

(declare-fun b!602420 () Bool)

(assert (=> b!602420 (= e!344522 e!344523)))

(declare-fun res!386846 () Bool)

(assert (=> b!602420 (=> res!386846 e!344523)))

(assert (=> b!602420 (= res!386846 (or (not (= (select (arr!17844 a!2986) j!136) lt!274391)) (not (= (select (arr!17844 a!2986) j!136) lt!274384)) (bvsge j!136 index!984)))))

(assert (= (and start!55018 res!386841) b!602404))

(assert (= (and b!602404 res!386839) b!602407))

(assert (= (and b!602407 res!386836) b!602418))

(assert (= (and b!602418 res!386831) b!602405))

(assert (= (and b!602405 res!386845) b!602411))

(assert (= (and b!602411 res!386844) b!602413))

(assert (= (and b!602413 res!386843) b!602401))

(assert (= (and b!602401 res!386837) b!602416))

(assert (= (and b!602416 res!386833) b!602408))

(assert (= (and b!602408 res!386832) b!602402))

(assert (= (and b!602402 res!386835) b!602399))

(assert (= (and b!602399 res!386838) b!602415))

(assert (= (and b!602399 c!68153) b!602410))

(assert (= (and b!602399 (not c!68153)) b!602406))

(assert (= (and b!602399 (not res!386829)) b!602414))

(assert (= (and b!602414 res!386834) b!602420))

(assert (= (and b!602420 (not res!386846)) b!602412))

(assert (= (and b!602412 res!386842) b!602400))

(assert (= (and b!602414 (not res!386830)) b!602409))

(assert (= (and b!602409 c!68152) b!602403))

(assert (= (and b!602409 (not c!68152)) b!602419))

(assert (= (and b!602409 (not res!386840)) b!602417))

(declare-fun m!579521 () Bool)

(assert (=> b!602417 m!579521))

(assert (=> b!602417 m!579521))

(declare-fun m!579523 () Bool)

(assert (=> b!602417 m!579523))

(assert (=> b!602407 m!579521))

(assert (=> b!602407 m!579521))

(declare-fun m!579525 () Bool)

(assert (=> b!602407 m!579525))

(declare-fun m!579527 () Bool)

(assert (=> b!602405 m!579527))

(declare-fun m!579529 () Bool)

(assert (=> b!602401 m!579529))

(declare-fun m!579531 () Bool)

(assert (=> b!602399 m!579531))

(assert (=> b!602399 m!579521))

(declare-fun m!579533 () Bool)

(assert (=> b!602399 m!579533))

(assert (=> b!602399 m!579521))

(declare-fun m!579535 () Bool)

(assert (=> b!602399 m!579535))

(declare-fun m!579537 () Bool)

(assert (=> b!602399 m!579537))

(declare-fun m!579539 () Bool)

(assert (=> b!602399 m!579539))

(declare-fun m!579541 () Bool)

(assert (=> b!602399 m!579541))

(declare-fun m!579543 () Bool)

(assert (=> b!602399 m!579543))

(declare-fun m!579545 () Bool)

(assert (=> b!602411 m!579545))

(assert (=> b!602408 m!579533))

(declare-fun m!579547 () Bool)

(assert (=> b!602408 m!579547))

(declare-fun m!579549 () Bool)

(assert (=> b!602413 m!579549))

(declare-fun m!579551 () Bool)

(assert (=> start!55018 m!579551))

(declare-fun m!579553 () Bool)

(assert (=> start!55018 m!579553))

(assert (=> b!602414 m!579521))

(assert (=> b!602414 m!579533))

(declare-fun m!579555 () Bool)

(assert (=> b!602414 m!579555))

(assert (=> b!602400 m!579521))

(assert (=> b!602400 m!579521))

(declare-fun m!579557 () Bool)

(assert (=> b!602400 m!579557))

(declare-fun m!579559 () Bool)

(assert (=> b!602418 m!579559))

(declare-fun m!579561 () Bool)

(assert (=> b!602416 m!579561))

(declare-fun m!579563 () Bool)

(assert (=> b!602403 m!579563))

(assert (=> b!602403 m!579521))

(declare-fun m!579565 () Bool)

(assert (=> b!602403 m!579565))

(assert (=> b!602403 m!579521))

(declare-fun m!579567 () Bool)

(assert (=> b!602403 m!579567))

(assert (=> b!602403 m!579521))

(declare-fun m!579569 () Bool)

(assert (=> b!602403 m!579569))

(declare-fun m!579571 () Bool)

(assert (=> b!602403 m!579571))

(assert (=> b!602403 m!579521))

(declare-fun m!579573 () Bool)

(assert (=> b!602403 m!579573))

(declare-fun m!579575 () Bool)

(assert (=> b!602403 m!579575))

(assert (=> b!602420 m!579521))

(declare-fun m!579577 () Bool)

(assert (=> b!602402 m!579577))

(assert (=> b!602402 m!579521))

(assert (=> b!602402 m!579521))

(declare-fun m!579579 () Bool)

(assert (=> b!602402 m!579579))

(assert (=> b!602412 m!579521))

(assert (=> b!602412 m!579521))

(assert (=> b!602412 m!579523))

(push 1)

(assert (not b!602418))

(assert (not b!602400))

(assert (not b!602402))

(assert (not b!602413))

(assert (not start!55018))

(assert (not b!602411))

(assert (not b!602399))

(assert (not b!602407))

(assert (not b!602405))

(assert (not b!602417))

(assert (not b!602401))

(assert (not b!602403))

(assert (not b!602412))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!87297 () Bool)

(declare-fun res!386983 () Bool)

(declare-fun e!344660 () Bool)

(assert (=> d!87297 (=> res!386983 e!344660)))

(assert (=> d!87297 (= res!386983 (= (select (arr!17844 a!2986) #b00000000000000000000000000000000) k!1786))))

(assert (=> d!87297 (= (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000) e!344660)))

(declare-fun b!602617 () Bool)

(declare-fun e!344661 () Bool)

(assert (=> b!602617 (= e!344660 e!344661)))

(declare-fun res!386984 () Bool)

(assert (=> b!602617 (=> (not res!386984) (not e!344661))))

(assert (=> b!602617 (= res!386984 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18208 a!2986)))))

(declare-fun b!602618 () Bool)

(assert (=> b!602618 (= e!344661 (arrayContainsKey!0 a!2986 k!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!87297 (not res!386983)) b!602617))

(assert (= (and b!602617 res!386984) b!602618))

(declare-fun m!579749 () Bool)

(assert (=> d!87297 m!579749))

(declare-fun m!579751 () Bool)

(assert (=> b!602618 m!579751))

(assert (=> b!602405 d!87297))

(declare-fun d!87303 () Bool)

(declare-fun res!386985 () Bool)

(declare-fun e!344662 () Bool)

(assert (=> d!87303 (=> res!386985 e!344662)))

(assert (=> d!87303 (= res!386985 (= (select (arr!17844 lt!274381) j!136) (select (arr!17844 a!2986) j!136)))))

(assert (=> d!87303 (= (arrayContainsKey!0 lt!274381 (select (arr!17844 a!2986) j!136) j!136) e!344662)))

(declare-fun b!602619 () Bool)

(declare-fun e!344663 () Bool)

(assert (=> b!602619 (= e!344662 e!344663)))

(declare-fun res!386986 () Bool)

(assert (=> b!602619 (=> (not res!386986) (not e!344663))))

(assert (=> b!602619 (= res!386986 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18208 lt!274381)))))

(declare-fun b!602620 () Bool)

(assert (=> b!602620 (= e!344663 (arrayContainsKey!0 lt!274381 (select (arr!17844 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!87303 (not res!386985)) b!602619))

(assert (= (and b!602619 res!386986) b!602620))

(declare-fun m!579753 () Bool)

(assert (=> d!87303 m!579753))

(assert (=> b!602620 m!579521))

(declare-fun m!579755 () Bool)

(assert (=> b!602620 m!579755))

(assert (=> b!602417 d!87303))

(declare-fun d!87305 () Bool)

(assert (=> d!87305 (= (validKeyInArray!0 k!1786) (and (not (= k!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!602418 d!87305))

(declare-fun d!87309 () Bool)

(assert (=> d!87309 (= (validKeyInArray!0 (select (arr!17844 a!2986) j!136)) (and (not (= (select (arr!17844 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17844 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!602407 d!87309))

(declare-fun d!87311 () Bool)

(declare-fun res!386990 () Bool)

(declare-fun e!344668 () Bool)

(assert (=> d!87311 (=> res!386990 e!344668)))

(assert (=> d!87311 (= res!386990 (= (select (arr!17844 lt!274381) index!984) (select (arr!17844 a!2986) j!136)))))

(assert (=> d!87311 (= (arrayContainsKey!0 lt!274381 (select (arr!17844 a!2986) j!136) index!984) e!344668)))

(declare-fun b!602626 () Bool)

(declare-fun e!344669 () Bool)

(assert (=> b!602626 (= e!344668 e!344669)))

(declare-fun res!386991 () Bool)

(assert (=> b!602626 (=> (not res!386991) (not e!344669))))

(assert (=> b!602626 (= res!386991 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18208 lt!274381)))))

(declare-fun b!602627 () Bool)

(assert (=> b!602627 (= e!344669 (arrayContainsKey!0 lt!274381 (select (arr!17844 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!87311 (not res!386990)) b!602626))

(assert (= (and b!602626 res!386991) b!602627))

(declare-fun m!579763 () Bool)

(assert (=> d!87311 m!579763))

(assert (=> b!602627 m!579521))

(declare-fun m!579767 () Bool)

(assert (=> b!602627 m!579767))

(assert (=> b!602400 d!87311))

(declare-fun d!87313 () Bool)

(declare-fun lt!274541 () SeekEntryResult!6284)

(assert (=> d!87313 (and (or (is-Undefined!6284 lt!274541) (not (is-Found!6284 lt!274541)) (and (bvsge (index!27397 lt!274541) #b00000000000000000000000000000000) (bvslt (index!27397 lt!274541) (size!18208 a!2986)))) (or (is-Undefined!6284 lt!274541) (is-Found!6284 lt!274541) (not (is-MissingZero!6284 lt!274541)) (and (bvsge (index!27396 lt!274541) #b00000000000000000000000000000000) (bvslt (index!27396 lt!274541) (size!18208 a!2986)))) (or (is-Undefined!6284 lt!274541) (is-Found!6284 lt!274541) (is-MissingZero!6284 lt!274541) (not (is-MissingVacant!6284 lt!274541)) (and (bvsge (index!27399 lt!274541) #b00000000000000000000000000000000) (bvslt (index!27399 lt!274541) (size!18208 a!2986)))) (or (is-Undefined!6284 lt!274541) (ite (is-Found!6284 lt!274541) (= (select (arr!17844 a!2986) (index!27397 lt!274541)) k!1786) (ite (is-MissingZero!6284 lt!274541) (= (select (arr!17844 a!2986) (index!27396 lt!274541)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!6284 lt!274541) (= (select (arr!17844 a!2986) (index!27399 lt!274541)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!344714 () SeekEntryResult!6284)

(assert (=> d!87313 (= lt!274541 e!344714)))

(declare-fun c!68203 () Bool)

(declare-fun lt!274542 () SeekEntryResult!6284)

(assert (=> d!87313 (= c!68203 (and (is-Intermediate!6284 lt!274542) (undefined!7096 lt!274542)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37172 (_ BitVec 32)) SeekEntryResult!6284)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!87313 (= lt!274542 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1786 mask!3053) k!1786 a!2986 mask!3053))))

(assert (=> d!87313 (validMask!0 mask!3053)))

(assert (=> d!87313 (= (seekEntryOrOpen!0 k!1786 a!2986 mask!3053) lt!274541)))

(declare-fun b!602686 () Bool)

(declare-fun e!344713 () SeekEntryResult!6284)

(assert (=> b!602686 (= e!344713 (seekKeyOrZeroReturnVacant!0 (x!56196 lt!274542) (index!27398 lt!274542) (index!27398 lt!274542) k!1786 a!2986 mask!3053))))

(declare-fun b!602687 () Bool)

(assert (=> b!602687 (= e!344714 Undefined!6284)))

(declare-fun b!602688 () Bool)

(assert (=> b!602688 (= e!344713 (MissingZero!6284 (index!27398 lt!274542)))))

(declare-fun b!602689 () Bool)

(declare-fun e!344712 () SeekEntryResult!6284)

(assert (=> b!602689 (= e!344712 (Found!6284 (index!27398 lt!274542)))))

(declare-fun b!602690 () Bool)

(assert (=> b!602690 (= e!344714 e!344712)))

(declare-fun lt!274543 () (_ BitVec 64))

(assert (=> b!602690 (= lt!274543 (select (arr!17844 a!2986) (index!27398 lt!274542)))))

(declare-fun c!68202 () Bool)

(assert (=> b!602690 (= c!68202 (= lt!274543 k!1786))))

(declare-fun b!602691 () Bool)

(declare-fun c!68201 () Bool)

(assert (=> b!602691 (= c!68201 (= lt!274543 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!602691 (= e!344712 e!344713)))

(assert (= (and d!87313 c!68203) b!602687))

(assert (= (and d!87313 (not c!68203)) b!602690))

(assert (= (and b!602690 c!68202) b!602689))

(assert (= (and b!602690 (not c!68202)) b!602691))

(assert (= (and b!602691 c!68201) b!602688))

(assert (= (and b!602691 (not c!68201)) b!602686))

(declare-fun m!579825 () Bool)

(assert (=> d!87313 m!579825))

(assert (=> d!87313 m!579825))

(declare-fun m!579827 () Bool)

(assert (=> d!87313 m!579827))

(declare-fun m!579831 () Bool)

(assert (=> d!87313 m!579831))

(declare-fun m!579833 () Bool)

(assert (=> d!87313 m!579833))

(declare-fun m!579835 () Bool)

(assert (=> d!87313 m!579835))

(assert (=> d!87313 m!579551))

(declare-fun m!579837 () Bool)

(assert (=> b!602686 m!579837))

(declare-fun m!579839 () Bool)

(assert (=> b!602690 m!579839))

(assert (=> b!602411 d!87313))

(declare-fun b!602711 () Bool)

(declare-fun e!344729 () SeekEntryResult!6284)

(assert (=> b!602711 (= e!344729 (MissingVacant!6284 vacantSpotIndex!68))))

(declare-fun b!602712 () Bool)

(declare-fun e!344730 () SeekEntryResult!6284)

(assert (=> b!602712 (= e!344730 Undefined!6284)))

(declare-fun b!602713 () Bool)

(declare-fun e!344728 () SeekEntryResult!6284)

(assert (=> b!602713 (= e!344728 (Found!6284 lt!274386))))

(declare-fun b!602714 () Bool)

(assert (=> b!602714 (= e!344729 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!274386 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!274391 lt!274381 mask!3053))))

(declare-fun d!87347 () Bool)

(declare-fun lt!274555 () SeekEntryResult!6284)

(assert (=> d!87347 (and (or (is-Undefined!6284 lt!274555) (not (is-Found!6284 lt!274555)) (and (bvsge (index!27397 lt!274555) #b00000000000000000000000000000000) (bvslt (index!27397 lt!274555) (size!18208 lt!274381)))) (or (is-Undefined!6284 lt!274555) (is-Found!6284 lt!274555) (not (is-MissingVacant!6284 lt!274555)) (not (= (index!27399 lt!274555) vacantSpotIndex!68)) (and (bvsge (index!27399 lt!274555) #b00000000000000000000000000000000) (bvslt (index!27399 lt!274555) (size!18208 lt!274381)))) (or (is-Undefined!6284 lt!274555) (ite (is-Found!6284 lt!274555) (= (select (arr!17844 lt!274381) (index!27397 lt!274555)) lt!274391) (and (is-MissingVacant!6284 lt!274555) (= (index!27399 lt!274555) vacantSpotIndex!68) (= (select (arr!17844 lt!274381) (index!27399 lt!274555)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87347 (= lt!274555 e!344730)))

(declare-fun c!68210 () Bool)

(assert (=> d!87347 (= c!68210 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!274554 () (_ BitVec 64))

(assert (=> d!87347 (= lt!274554 (select (arr!17844 lt!274381) lt!274386))))

(assert (=> d!87347 (validMask!0 mask!3053)))

(assert (=> d!87347 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!274386 vacantSpotIndex!68 lt!274391 lt!274381 mask!3053) lt!274555)))

(declare-fun b!602715 () Bool)

(assert (=> b!602715 (= e!344730 e!344728)))

(declare-fun c!68211 () Bool)

(assert (=> b!602715 (= c!68211 (= lt!274554 lt!274391))))

(declare-fun b!602716 () Bool)

(declare-fun c!68212 () Bool)

(assert (=> b!602716 (= c!68212 (= lt!274554 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!602716 (= e!344728 e!344729)))

(assert (= (and d!87347 c!68210) b!602712))

(assert (= (and d!87347 (not c!68210)) b!602715))

(assert (= (and b!602715 c!68211) b!602713))

(assert (= (and b!602715 (not c!68211)) b!602716))

(assert (= (and b!602716 c!68212) b!602711))

(assert (= (and b!602716 (not c!68212)) b!602714))

(declare-fun m!579849 () Bool)

(assert (=> b!602714 m!579849))

(assert (=> b!602714 m!579849))

(declare-fun m!579851 () Bool)

(assert (=> b!602714 m!579851))

(declare-fun m!579853 () Bool)

(assert (=> d!87347 m!579853))

(declare-fun m!579855 () Bool)

(assert (=> d!87347 m!579855))

(declare-fun m!579857 () Bool)

(assert (=> d!87347 m!579857))

(assert (=> d!87347 m!579551))

(assert (=> b!602399 d!87347))

(declare-fun d!87359 () Bool)

(declare-fun lt!274558 () (_ BitVec 32))

(assert (=> d!87359 (and (bvsge lt!274558 #b00000000000000000000000000000000) (bvslt lt!274558 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!87359 (= lt!274558 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!87359 (validMask!0 mask!3053)))

(assert (=> d!87359 (= (nextIndex!0 index!984 x!910 mask!3053) lt!274558)))

(declare-fun bs!18468 () Bool)

(assert (= bs!18468 d!87359))

(declare-fun m!579859 () Bool)

(assert (=> bs!18468 m!579859))

(assert (=> bs!18468 m!579551))

(assert (=> b!602399 d!87359))

(declare-fun b!602717 () Bool)

(declare-fun e!344732 () SeekEntryResult!6284)

(assert (=> b!602717 (= e!344732 (MissingVacant!6284 vacantSpotIndex!68))))

(declare-fun b!602718 () Bool)

(declare-fun e!344733 () SeekEntryResult!6284)

(assert (=> b!602718 (= e!344733 Undefined!6284)))

(declare-fun b!602719 () Bool)

(declare-fun e!344731 () SeekEntryResult!6284)

(assert (=> b!602719 (= e!344731 (Found!6284 index!984))))

(declare-fun b!602720 () Bool)

(assert (=> b!602720 (= e!344732 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!274391 lt!274381 mask!3053))))

(declare-fun lt!274560 () SeekEntryResult!6284)

(declare-fun d!87361 () Bool)

(assert (=> d!87361 (and (or (is-Undefined!6284 lt!274560) (not (is-Found!6284 lt!274560)) (and (bvsge (index!27397 lt!274560) #b00000000000000000000000000000000) (bvslt (index!27397 lt!274560) (size!18208 lt!274381)))) (or (is-Undefined!6284 lt!274560) (is-Found!6284 lt!274560) (not (is-MissingVacant!6284 lt!274560)) (not (= (index!27399 lt!274560) vacantSpotIndex!68)) (and (bvsge (index!27399 lt!274560) #b00000000000000000000000000000000) (bvslt (index!27399 lt!274560) (size!18208 lt!274381)))) (or (is-Undefined!6284 lt!274560) (ite (is-Found!6284 lt!274560) (= (select (arr!17844 lt!274381) (index!27397 lt!274560)) lt!274391) (and (is-MissingVacant!6284 lt!274560) (= (index!27399 lt!274560) vacantSpotIndex!68) (= (select (arr!17844 lt!274381) (index!27399 lt!274560)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87361 (= lt!274560 e!344733)))

(declare-fun c!68213 () Bool)

(assert (=> d!87361 (= c!68213 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!274559 () (_ BitVec 64))

(assert (=> d!87361 (= lt!274559 (select (arr!17844 lt!274381) index!984))))

(assert (=> d!87361 (validMask!0 mask!3053)))

(assert (=> d!87361 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!274391 lt!274381 mask!3053) lt!274560)))

(declare-fun b!602721 () Bool)

(assert (=> b!602721 (= e!344733 e!344731)))

(declare-fun c!68214 () Bool)

(assert (=> b!602721 (= c!68214 (= lt!274559 lt!274391))))

(declare-fun b!602722 () Bool)

(declare-fun c!68215 () Bool)

(assert (=> b!602722 (= c!68215 (= lt!274559 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!602722 (= e!344731 e!344732)))

(assert (= (and d!87361 c!68213) b!602718))

(assert (= (and d!87361 (not c!68213)) b!602721))

(assert (= (and b!602721 c!68214) b!602719))

(assert (= (and b!602721 (not c!68214)) b!602722))

(assert (= (and b!602722 c!68215) b!602717))

(assert (= (and b!602722 (not c!68215)) b!602720))

(assert (=> b!602720 m!579541))

(assert (=> b!602720 m!579541))

(declare-fun m!579861 () Bool)

(assert (=> b!602720 m!579861))

(declare-fun m!579863 () Bool)

(assert (=> d!87361 m!579863))

(declare-fun m!579865 () Bool)

(assert (=> d!87361 m!579865))

(assert (=> d!87361 m!579763))

(assert (=> d!87361 m!579551))

(assert (=> b!602399 d!87361))

(declare-fun d!87363 () Bool)

(declare-fun e!344768 () Bool)

(assert (=> d!87363 e!344768))

(declare-fun res!387033 () Bool)

(assert (=> d!87363 (=> (not res!387033) (not e!344768))))

(assert (=> d!87363 (= res!387033 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18208 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18208 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18208 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18208 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18208 a!2986))))))

(declare-fun lt!274582 () Unit!19084)

(declare-fun choose!9 (array!37172 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19084)

(assert (=> d!87363 (= lt!274582 (choose!9 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!274386 vacantSpotIndex!68 mask!3053))))

(assert (=> d!87363 (validMask!0 mask!3053)))

(assert (=> d!87363 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!274386 vacantSpotIndex!68 mask!3053) lt!274582)))

(declare-fun b!602783 () Bool)

(assert (=> b!602783 (= e!344768 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!274386 vacantSpotIndex!68 (select (arr!17844 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!274386 vacantSpotIndex!68 (select (store (arr!17844 a!2986) i!1108 k!1786) j!136) (array!37173 (store (arr!17844 a!2986) i!1108 k!1786) (size!18208 a!2986)) mask!3053)))))

(assert (= (and d!87363 res!387033) b!602783))

(declare-fun m!579915 () Bool)

(assert (=> d!87363 m!579915))

(assert (=> d!87363 m!579551))

(assert (=> b!602783 m!579521))

(assert (=> b!602783 m!579535))

(assert (=> b!602783 m!579531))

(declare-fun m!579921 () Bool)

(assert (=> b!602783 m!579921))

(assert (=> b!602783 m!579533))

(assert (=> b!602783 m!579531))

(assert (=> b!602783 m!579521))

(assert (=> b!602399 d!87363))

(declare-fun b!602784 () Bool)

(declare-fun e!344770 () SeekEntryResult!6284)

(assert (=> b!602784 (= e!344770 (MissingVacant!6284 vacantSpotIndex!68))))

(declare-fun b!602785 () Bool)

