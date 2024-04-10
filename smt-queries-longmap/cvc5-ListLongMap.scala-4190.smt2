; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57116 () Bool)

(assert start!57116)

(declare-fun b!632442 () Bool)

(declare-fun e!361574 () Bool)

(declare-fun e!361576 () Bool)

(assert (=> b!632442 (= e!361574 e!361576)))

(declare-fun res!409049 () Bool)

(assert (=> b!632442 (=> (not res!409049) (not e!361576))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6740 0))(
  ( (MissingZero!6740 (index!29253 (_ BitVec 32))) (Found!6740 (index!29254 (_ BitVec 32))) (Intermediate!6740 (undefined!7552 Bool) (index!29255 (_ BitVec 32)) (x!57991 (_ BitVec 32))) (Undefined!6740) (MissingVacant!6740 (index!29256 (_ BitVec 32))) )
))
(declare-fun lt!292295 () SeekEntryResult!6740)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38135 0))(
  ( (array!38136 (arr!18300 (Array (_ BitVec 32) (_ BitVec 64))) (size!18664 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38135)

(assert (=> b!632442 (= res!409049 (and (= lt!292295 (Found!6740 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18300 a!2986) index!984) (select (arr!18300 a!2986) j!136))) (not (= (select (arr!18300 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38135 (_ BitVec 32)) SeekEntryResult!6740)

(assert (=> b!632442 (= lt!292295 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18300 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!632443 () Bool)

(declare-fun res!409051 () Bool)

(declare-fun e!361577 () Bool)

(assert (=> b!632443 (=> (not res!409051) (not e!361577))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38135 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!632443 (= res!409051 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!632444 () Bool)

(declare-fun res!409044 () Bool)

(declare-fun e!361572 () Bool)

(assert (=> b!632444 (=> (not res!409044) (not e!361572))))

(declare-datatypes ((List!12341 0))(
  ( (Nil!12338) (Cons!12337 (h!13382 (_ BitVec 64)) (t!18569 List!12341)) )
))
(declare-fun arrayNoDuplicates!0 (array!38135 (_ BitVec 32) List!12341) Bool)

(assert (=> b!632444 (= res!409044 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12338))))

(declare-fun b!632445 () Bool)

(declare-fun lt!292298 () (_ BitVec 64))

(declare-fun e!361575 () Bool)

(assert (=> b!632445 (= e!361575 (or (not (= (select (arr!18300 a!2986) j!136) lt!292298)) (bvslt index!984 (size!18664 a!2986))))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!632445 (= (select (store (arr!18300 a!2986) i!1108 k!1786) index!984) (select (arr!18300 a!2986) j!136))))

(declare-fun b!632446 () Bool)

(declare-fun res!409050 () Bool)

(assert (=> b!632446 (=> (not res!409050) (not e!361572))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38135 (_ BitVec 32)) Bool)

(assert (=> b!632446 (= res!409050 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!409041 () Bool)

(assert (=> start!57116 (=> (not res!409041) (not e!361577))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57116 (= res!409041 (validMask!0 mask!3053))))

(assert (=> start!57116 e!361577))

(assert (=> start!57116 true))

(declare-fun array_inv!14096 (array!38135) Bool)

(assert (=> start!57116 (array_inv!14096 a!2986)))

(declare-fun b!632447 () Bool)

(declare-fun res!409048 () Bool)

(assert (=> b!632447 (=> (not res!409048) (not e!361577))))

(assert (=> b!632447 (= res!409048 (and (= (size!18664 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18664 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18664 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!632448 () Bool)

(declare-fun res!409045 () Bool)

(assert (=> b!632448 (=> (not res!409045) (not e!361572))))

(assert (=> b!632448 (= res!409045 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18300 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!632449 () Bool)

(assert (=> b!632449 (= e!361572 e!361574)))

(declare-fun res!409046 () Bool)

(assert (=> b!632449 (=> (not res!409046) (not e!361574))))

(assert (=> b!632449 (= res!409046 (= (select (store (arr!18300 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!292299 () array!38135)

(assert (=> b!632449 (= lt!292299 (array!38136 (store (arr!18300 a!2986) i!1108 k!1786) (size!18664 a!2986)))))

(declare-fun b!632450 () Bool)

(declare-fun e!361571 () Bool)

(declare-fun lt!292293 () SeekEntryResult!6740)

(assert (=> b!632450 (= e!361571 (= lt!292295 lt!292293))))

(declare-fun b!632451 () Bool)

(declare-fun res!409047 () Bool)

(assert (=> b!632451 (=> (not res!409047) (not e!361577))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!632451 (= res!409047 (validKeyInArray!0 (select (arr!18300 a!2986) j!136)))))

(declare-fun b!632452 () Bool)

(declare-datatypes ((Unit!21294 0))(
  ( (Unit!21295) )
))
(declare-fun e!361573 () Unit!21294)

(declare-fun Unit!21296 () Unit!21294)

(assert (=> b!632452 (= e!361573 Unit!21296)))

(assert (=> b!632452 false))

(declare-fun b!632453 () Bool)

(declare-fun res!409040 () Bool)

(assert (=> b!632453 (=> (not res!409040) (not e!361577))))

(assert (=> b!632453 (= res!409040 (validKeyInArray!0 k!1786))))

(declare-fun b!632454 () Bool)

(assert (=> b!632454 (= e!361576 (not e!361575))))

(declare-fun res!409052 () Bool)

(assert (=> b!632454 (=> res!409052 e!361575)))

(declare-fun lt!292294 () SeekEntryResult!6740)

(assert (=> b!632454 (= res!409052 (not (= lt!292294 (Found!6740 index!984))))))

(declare-fun lt!292297 () Unit!21294)

(assert (=> b!632454 (= lt!292297 e!361573)))

(declare-fun c!72068 () Bool)

(assert (=> b!632454 (= c!72068 (= lt!292294 Undefined!6740))))

(assert (=> b!632454 (= lt!292294 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!292298 lt!292299 mask!3053))))

(assert (=> b!632454 e!361571))

(declare-fun res!409042 () Bool)

(assert (=> b!632454 (=> (not res!409042) (not e!361571))))

(declare-fun lt!292296 () (_ BitVec 32))

(assert (=> b!632454 (= res!409042 (= lt!292293 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292296 vacantSpotIndex!68 lt!292298 lt!292299 mask!3053)))))

(assert (=> b!632454 (= lt!292293 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292296 vacantSpotIndex!68 (select (arr!18300 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!632454 (= lt!292298 (select (store (arr!18300 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!292300 () Unit!21294)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38135 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21294)

(assert (=> b!632454 (= lt!292300 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!292296 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!632454 (= lt!292296 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!632455 () Bool)

(declare-fun Unit!21297 () Unit!21294)

(assert (=> b!632455 (= e!361573 Unit!21297)))

(declare-fun b!632456 () Bool)

(assert (=> b!632456 (= e!361577 e!361572)))

(declare-fun res!409043 () Bool)

(assert (=> b!632456 (=> (not res!409043) (not e!361572))))

(declare-fun lt!292292 () SeekEntryResult!6740)

(assert (=> b!632456 (= res!409043 (or (= lt!292292 (MissingZero!6740 i!1108)) (= lt!292292 (MissingVacant!6740 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38135 (_ BitVec 32)) SeekEntryResult!6740)

(assert (=> b!632456 (= lt!292292 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(assert (= (and start!57116 res!409041) b!632447))

(assert (= (and b!632447 res!409048) b!632451))

(assert (= (and b!632451 res!409047) b!632453))

(assert (= (and b!632453 res!409040) b!632443))

(assert (= (and b!632443 res!409051) b!632456))

(assert (= (and b!632456 res!409043) b!632446))

(assert (= (and b!632446 res!409050) b!632444))

(assert (= (and b!632444 res!409044) b!632448))

(assert (= (and b!632448 res!409045) b!632449))

(assert (= (and b!632449 res!409046) b!632442))

(assert (= (and b!632442 res!409049) b!632454))

(assert (= (and b!632454 res!409042) b!632450))

(assert (= (and b!632454 c!72068) b!632452))

(assert (= (and b!632454 (not c!72068)) b!632455))

(assert (= (and b!632454 (not res!409052)) b!632445))

(declare-fun m!607269 () Bool)

(assert (=> b!632456 m!607269))

(declare-fun m!607271 () Bool)

(assert (=> b!632445 m!607271))

(declare-fun m!607273 () Bool)

(assert (=> b!632445 m!607273))

(declare-fun m!607275 () Bool)

(assert (=> b!632445 m!607275))

(declare-fun m!607277 () Bool)

(assert (=> b!632454 m!607277))

(assert (=> b!632454 m!607271))

(assert (=> b!632454 m!607273))

(declare-fun m!607279 () Bool)

(assert (=> b!632454 m!607279))

(declare-fun m!607281 () Bool)

(assert (=> b!632454 m!607281))

(declare-fun m!607283 () Bool)

(assert (=> b!632454 m!607283))

(assert (=> b!632454 m!607271))

(declare-fun m!607285 () Bool)

(assert (=> b!632454 m!607285))

(declare-fun m!607287 () Bool)

(assert (=> b!632454 m!607287))

(declare-fun m!607289 () Bool)

(assert (=> b!632448 m!607289))

(assert (=> b!632451 m!607271))

(assert (=> b!632451 m!607271))

(declare-fun m!607291 () Bool)

(assert (=> b!632451 m!607291))

(declare-fun m!607293 () Bool)

(assert (=> start!57116 m!607293))

(declare-fun m!607295 () Bool)

(assert (=> start!57116 m!607295))

(declare-fun m!607297 () Bool)

(assert (=> b!632446 m!607297))

(declare-fun m!607299 () Bool)

(assert (=> b!632453 m!607299))

(assert (=> b!632449 m!607273))

(declare-fun m!607301 () Bool)

(assert (=> b!632449 m!607301))

(declare-fun m!607303 () Bool)

(assert (=> b!632443 m!607303))

(declare-fun m!607305 () Bool)

(assert (=> b!632444 m!607305))

(declare-fun m!607307 () Bool)

(assert (=> b!632442 m!607307))

(assert (=> b!632442 m!607271))

(assert (=> b!632442 m!607271))

(declare-fun m!607309 () Bool)

(assert (=> b!632442 m!607309))

(push 1)

(assert (not start!57116))

(assert (not b!632451))

(assert (not b!632446))

(assert (not b!632456))

(assert (not b!632453))

(assert (not b!632443))

(assert (not b!632444))

(assert (not b!632454))

(assert (not b!632442))

(check-sat)

(pop 1)

(push 1)

(check-sat)

