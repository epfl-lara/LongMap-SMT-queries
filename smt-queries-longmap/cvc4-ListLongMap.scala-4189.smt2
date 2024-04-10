; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57114 () Bool)

(assert start!57114)

(declare-fun b!632397 () Bool)

(declare-fun res!409003 () Bool)

(declare-fun e!361553 () Bool)

(assert (=> b!632397 (=> (not res!409003) (not e!361553))))

(declare-datatypes ((array!38133 0))(
  ( (array!38134 (arr!18299 (Array (_ BitVec 32) (_ BitVec 64))) (size!18663 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38133)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!632397 (= res!409003 (validKeyInArray!0 (select (arr!18299 a!2986) j!136)))))

(declare-fun b!632398 () Bool)

(declare-fun e!361554 () Bool)

(declare-fun e!361550 () Bool)

(assert (=> b!632398 (= e!361554 e!361550)))

(declare-fun res!409004 () Bool)

(assert (=> b!632398 (=> (not res!409004) (not e!361550))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!632398 (= res!409004 (= (select (store (arr!18299 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!292267 () array!38133)

(assert (=> b!632398 (= lt!292267 (array!38134 (store (arr!18299 a!2986) i!1108 k!1786) (size!18663 a!2986)))))

(declare-fun b!632399 () Bool)

(declare-fun res!409006 () Bool)

(assert (=> b!632399 (=> (not res!409006) (not e!361553))))

(assert (=> b!632399 (= res!409006 (validKeyInArray!0 k!1786))))

(declare-fun b!632400 () Bool)

(declare-datatypes ((Unit!21290 0))(
  ( (Unit!21291) )
))
(declare-fun e!361551 () Unit!21290)

(declare-fun Unit!21292 () Unit!21290)

(assert (=> b!632400 (= e!361551 Unit!21292)))

(declare-fun b!632401 () Bool)

(declare-fun e!361547 () Bool)

(assert (=> b!632401 (= e!361547 true)))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!632401 (= (select (store (arr!18299 a!2986) i!1108 k!1786) index!984) (select (arr!18299 a!2986) j!136))))

(declare-fun b!632402 () Bool)

(declare-fun res!409013 () Bool)

(assert (=> b!632402 (=> (not res!409013) (not e!361554))))

(declare-datatypes ((List!12340 0))(
  ( (Nil!12337) (Cons!12336 (h!13381 (_ BitVec 64)) (t!18568 List!12340)) )
))
(declare-fun arrayNoDuplicates!0 (array!38133 (_ BitVec 32) List!12340) Bool)

(assert (=> b!632402 (= res!409013 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12337))))

(declare-fun b!632403 () Bool)

(declare-fun res!409008 () Bool)

(assert (=> b!632403 (=> (not res!409008) (not e!361553))))

(declare-fun mask!3053 () (_ BitVec 32))

(assert (=> b!632403 (= res!409008 (and (= (size!18663 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18663 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18663 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!632404 () Bool)

(declare-fun e!361552 () Bool)

(declare-datatypes ((SeekEntryResult!6739 0))(
  ( (MissingZero!6739 (index!29249 (_ BitVec 32))) (Found!6739 (index!29250 (_ BitVec 32))) (Intermediate!6739 (undefined!7551 Bool) (index!29251 (_ BitVec 32)) (x!57982 (_ BitVec 32))) (Undefined!6739) (MissingVacant!6739 (index!29252 (_ BitVec 32))) )
))
(declare-fun lt!292271 () SeekEntryResult!6739)

(declare-fun lt!292269 () SeekEntryResult!6739)

(assert (=> b!632404 (= e!361552 (= lt!292271 lt!292269))))

(declare-fun res!409010 () Bool)

(assert (=> start!57114 (=> (not res!409010) (not e!361553))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57114 (= res!409010 (validMask!0 mask!3053))))

(assert (=> start!57114 e!361553))

(assert (=> start!57114 true))

(declare-fun array_inv!14095 (array!38133) Bool)

(assert (=> start!57114 (array_inv!14095 a!2986)))

(declare-fun b!632405 () Bool)

(declare-fun res!409002 () Bool)

(assert (=> b!632405 (=> (not res!409002) (not e!361554))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38133 (_ BitVec 32)) Bool)

(assert (=> b!632405 (= res!409002 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!632406 () Bool)

(declare-fun res!409012 () Bool)

(assert (=> b!632406 (=> (not res!409012) (not e!361553))))

(declare-fun arrayContainsKey!0 (array!38133 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!632406 (= res!409012 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!632407 () Bool)

(assert (=> b!632407 (= e!361553 e!361554)))

(declare-fun res!409007 () Bool)

(assert (=> b!632407 (=> (not res!409007) (not e!361554))))

(declare-fun lt!292266 () SeekEntryResult!6739)

(assert (=> b!632407 (= res!409007 (or (= lt!292266 (MissingZero!6739 i!1108)) (= lt!292266 (MissingVacant!6739 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38133 (_ BitVec 32)) SeekEntryResult!6739)

(assert (=> b!632407 (= lt!292266 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!632408 () Bool)

(declare-fun e!361548 () Bool)

(assert (=> b!632408 (= e!361548 (not e!361547))))

(declare-fun res!409005 () Bool)

(assert (=> b!632408 (=> res!409005 e!361547)))

(declare-fun lt!292268 () SeekEntryResult!6739)

(assert (=> b!632408 (= res!409005 (not (= lt!292268 (Found!6739 index!984))))))

(declare-fun lt!292272 () Unit!21290)

(assert (=> b!632408 (= lt!292272 e!361551)))

(declare-fun c!72065 () Bool)

(assert (=> b!632408 (= c!72065 (= lt!292268 Undefined!6739))))

(declare-fun lt!292273 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38133 (_ BitVec 32)) SeekEntryResult!6739)

(assert (=> b!632408 (= lt!292268 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!292273 lt!292267 mask!3053))))

(assert (=> b!632408 e!361552))

(declare-fun res!409009 () Bool)

(assert (=> b!632408 (=> (not res!409009) (not e!361552))))

(declare-fun lt!292270 () (_ BitVec 32))

(assert (=> b!632408 (= res!409009 (= lt!292269 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292270 vacantSpotIndex!68 lt!292273 lt!292267 mask!3053)))))

(assert (=> b!632408 (= lt!292269 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292270 vacantSpotIndex!68 (select (arr!18299 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!632408 (= lt!292273 (select (store (arr!18299 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!292265 () Unit!21290)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38133 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21290)

(assert (=> b!632408 (= lt!292265 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!292270 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!632408 (= lt!292270 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!632409 () Bool)

(assert (=> b!632409 (= e!361550 e!361548)))

(declare-fun res!409001 () Bool)

(assert (=> b!632409 (=> (not res!409001) (not e!361548))))

(assert (=> b!632409 (= res!409001 (and (= lt!292271 (Found!6739 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18299 a!2986) index!984) (select (arr!18299 a!2986) j!136))) (not (= (select (arr!18299 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!632409 (= lt!292271 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18299 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!632410 () Bool)

(declare-fun Unit!21293 () Unit!21290)

(assert (=> b!632410 (= e!361551 Unit!21293)))

(assert (=> b!632410 false))

(declare-fun b!632411 () Bool)

(declare-fun res!409011 () Bool)

(assert (=> b!632411 (=> (not res!409011) (not e!361554))))

(assert (=> b!632411 (= res!409011 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18299 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!57114 res!409010) b!632403))

(assert (= (and b!632403 res!409008) b!632397))

(assert (= (and b!632397 res!409003) b!632399))

(assert (= (and b!632399 res!409006) b!632406))

(assert (= (and b!632406 res!409012) b!632407))

(assert (= (and b!632407 res!409007) b!632405))

(assert (= (and b!632405 res!409002) b!632402))

(assert (= (and b!632402 res!409013) b!632411))

(assert (= (and b!632411 res!409011) b!632398))

(assert (= (and b!632398 res!409004) b!632409))

(assert (= (and b!632409 res!409001) b!632408))

(assert (= (and b!632408 res!409009) b!632404))

(assert (= (and b!632408 c!72065) b!632410))

(assert (= (and b!632408 (not c!72065)) b!632400))

(assert (= (and b!632408 (not res!409005)) b!632401))

(declare-fun m!607227 () Bool)

(assert (=> b!632405 m!607227))

(declare-fun m!607229 () Bool)

(assert (=> b!632406 m!607229))

(declare-fun m!607231 () Bool)

(assert (=> b!632402 m!607231))

(declare-fun m!607233 () Bool)

(assert (=> b!632397 m!607233))

(assert (=> b!632397 m!607233))

(declare-fun m!607235 () Bool)

(assert (=> b!632397 m!607235))

(declare-fun m!607237 () Bool)

(assert (=> b!632407 m!607237))

(declare-fun m!607239 () Bool)

(assert (=> b!632399 m!607239))

(assert (=> b!632408 m!607233))

(declare-fun m!607241 () Bool)

(assert (=> b!632408 m!607241))

(declare-fun m!607243 () Bool)

(assert (=> b!632408 m!607243))

(declare-fun m!607245 () Bool)

(assert (=> b!632408 m!607245))

(declare-fun m!607247 () Bool)

(assert (=> b!632408 m!607247))

(assert (=> b!632408 m!607233))

(declare-fun m!607249 () Bool)

(assert (=> b!632408 m!607249))

(declare-fun m!607251 () Bool)

(assert (=> b!632408 m!607251))

(declare-fun m!607253 () Bool)

(assert (=> b!632408 m!607253))

(assert (=> b!632401 m!607251))

(declare-fun m!607255 () Bool)

(assert (=> b!632401 m!607255))

(assert (=> b!632401 m!607233))

(assert (=> b!632398 m!607251))

(declare-fun m!607257 () Bool)

(assert (=> b!632398 m!607257))

(declare-fun m!607259 () Bool)

(assert (=> b!632411 m!607259))

(declare-fun m!607261 () Bool)

(assert (=> start!57114 m!607261))

(declare-fun m!607263 () Bool)

(assert (=> start!57114 m!607263))

(declare-fun m!607265 () Bool)

(assert (=> b!632409 m!607265))

(assert (=> b!632409 m!607233))

(assert (=> b!632409 m!607233))

(declare-fun m!607267 () Bool)

(assert (=> b!632409 m!607267))

(push 1)

