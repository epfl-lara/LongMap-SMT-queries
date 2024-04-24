; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56958 () Bool)

(assert start!56958)

(declare-fun b!630240 () Bool)

(declare-fun e!360408 () Bool)

(declare-datatypes ((SeekEntryResult!6646 0))(
  ( (MissingZero!6646 (index!28871 (_ BitVec 32))) (Found!6646 (index!28872 (_ BitVec 32))) (Intermediate!6646 (undefined!7458 Bool) (index!28873 (_ BitVec 32)) (x!57762 (_ BitVec 32))) (Undefined!6646) (MissingVacant!6646 (index!28874 (_ BitVec 32))) )
))
(declare-fun lt!291090 () SeekEntryResult!6646)

(declare-fun lt!291094 () SeekEntryResult!6646)

(assert (=> b!630240 (= e!360408 (= lt!291090 lt!291094))))

(declare-fun b!630241 () Bool)

(declare-fun e!360411 () Bool)

(declare-fun e!360409 () Bool)

(assert (=> b!630241 (= e!360411 e!360409)))

(declare-fun res!407350 () Bool)

(assert (=> b!630241 (=> (not res!407350) (not e!360409))))

(declare-fun lt!291093 () SeekEntryResult!6646)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!630241 (= res!407350 (or (= lt!291093 (MissingZero!6646 i!1108)) (= lt!291093 (MissingVacant!6646 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!38034 0))(
  ( (array!38035 (arr!18250 (Array (_ BitVec 32) (_ BitVec 64))) (size!18614 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38034)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38034 (_ BitVec 32)) SeekEntryResult!6646)

(assert (=> b!630241 (= lt!291093 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!407355 () Bool)

(assert (=> start!56958 (=> (not res!407355) (not e!360411))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56958 (= res!407355 (validMask!0 mask!3053))))

(assert (=> start!56958 e!360411))

(assert (=> start!56958 true))

(declare-fun array_inv!14109 (array!38034) Bool)

(assert (=> start!56958 (array_inv!14109 a!2986)))

(declare-fun b!630242 () Bool)

(declare-fun e!360407 () Bool)

(assert (=> b!630242 (= e!360409 e!360407)))

(declare-fun res!407357 () Bool)

(assert (=> b!630242 (=> (not res!407357) (not e!360407))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!630242 (= res!407357 (and (= lt!291090 (Found!6646 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18250 a!2986) index!984) (select (arr!18250 a!2986) j!136))) (not (= (select (arr!18250 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38034 (_ BitVec 32)) SeekEntryResult!6646)

(assert (=> b!630242 (= lt!291090 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18250 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!630243 () Bool)

(assert (=> b!630243 (= e!360407 (not true))))

(assert (=> b!630243 e!360408))

(declare-fun res!407358 () Bool)

(assert (=> b!630243 (=> (not res!407358) (not e!360408))))

(declare-fun lt!291092 () (_ BitVec 32))

(assert (=> b!630243 (= res!407358 (= lt!291094 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291092 vacantSpotIndex!68 (select (store (arr!18250 a!2986) i!1108 k0!1786) j!136) (array!38035 (store (arr!18250 a!2986) i!1108 k0!1786) (size!18614 a!2986)) mask!3053)))))

(assert (=> b!630243 (= lt!291094 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291092 vacantSpotIndex!68 (select (arr!18250 a!2986) j!136) a!2986 mask!3053))))

(declare-datatypes ((Unit!21111 0))(
  ( (Unit!21112) )
))
(declare-fun lt!291091 () Unit!21111)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38034 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21111)

(assert (=> b!630243 (= lt!291091 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!291092 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!630243 (= lt!291092 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!630244 () Bool)

(declare-fun res!407351 () Bool)

(assert (=> b!630244 (=> (not res!407351) (not e!360411))))

(declare-fun arrayContainsKey!0 (array!38034 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!630244 (= res!407351 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!630245 () Bool)

(declare-fun res!407353 () Bool)

(assert (=> b!630245 (=> (not res!407353) (not e!360409))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38034 (_ BitVec 32)) Bool)

(assert (=> b!630245 (= res!407353 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!630246 () Bool)

(declare-fun res!407349 () Bool)

(assert (=> b!630246 (=> (not res!407349) (not e!360411))))

(assert (=> b!630246 (= res!407349 (and (= (size!18614 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18614 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18614 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!630247 () Bool)

(declare-fun res!407356 () Bool)

(assert (=> b!630247 (=> (not res!407356) (not e!360411))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!630247 (= res!407356 (validKeyInArray!0 k0!1786))))

(declare-fun b!630248 () Bool)

(declare-fun res!407354 () Bool)

(assert (=> b!630248 (=> (not res!407354) (not e!360409))))

(assert (=> b!630248 (= res!407354 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18250 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18250 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!630249 () Bool)

(declare-fun res!407359 () Bool)

(assert (=> b!630249 (=> (not res!407359) (not e!360411))))

(assert (=> b!630249 (= res!407359 (validKeyInArray!0 (select (arr!18250 a!2986) j!136)))))

(declare-fun b!630250 () Bool)

(declare-fun res!407352 () Bool)

(assert (=> b!630250 (=> (not res!407352) (not e!360409))))

(declare-datatypes ((List!12198 0))(
  ( (Nil!12195) (Cons!12194 (h!13242 (_ BitVec 64)) (t!18418 List!12198)) )
))
(declare-fun arrayNoDuplicates!0 (array!38034 (_ BitVec 32) List!12198) Bool)

(assert (=> b!630250 (= res!407352 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12195))))

(assert (= (and start!56958 res!407355) b!630246))

(assert (= (and b!630246 res!407349) b!630249))

(assert (= (and b!630249 res!407359) b!630247))

(assert (= (and b!630247 res!407356) b!630244))

(assert (= (and b!630244 res!407351) b!630241))

(assert (= (and b!630241 res!407350) b!630245))

(assert (= (and b!630245 res!407353) b!630250))

(assert (= (and b!630250 res!407352) b!630248))

(assert (= (and b!630248 res!407354) b!630242))

(assert (= (and b!630242 res!407357) b!630243))

(assert (= (and b!630243 res!407358) b!630240))

(declare-fun m!605533 () Bool)

(assert (=> b!630242 m!605533))

(declare-fun m!605535 () Bool)

(assert (=> b!630242 m!605535))

(assert (=> b!630242 m!605535))

(declare-fun m!605537 () Bool)

(assert (=> b!630242 m!605537))

(declare-fun m!605539 () Bool)

(assert (=> b!630250 m!605539))

(declare-fun m!605541 () Bool)

(assert (=> b!630248 m!605541))

(declare-fun m!605543 () Bool)

(assert (=> b!630248 m!605543))

(declare-fun m!605545 () Bool)

(assert (=> b!630248 m!605545))

(declare-fun m!605547 () Bool)

(assert (=> b!630243 m!605547))

(declare-fun m!605549 () Bool)

(assert (=> b!630243 m!605549))

(assert (=> b!630243 m!605535))

(assert (=> b!630243 m!605535))

(declare-fun m!605551 () Bool)

(assert (=> b!630243 m!605551))

(assert (=> b!630243 m!605543))

(declare-fun m!605553 () Bool)

(assert (=> b!630243 m!605553))

(assert (=> b!630243 m!605549))

(declare-fun m!605555 () Bool)

(assert (=> b!630243 m!605555))

(assert (=> b!630249 m!605535))

(assert (=> b!630249 m!605535))

(declare-fun m!605557 () Bool)

(assert (=> b!630249 m!605557))

(declare-fun m!605559 () Bool)

(assert (=> start!56958 m!605559))

(declare-fun m!605561 () Bool)

(assert (=> start!56958 m!605561))

(declare-fun m!605563 () Bool)

(assert (=> b!630247 m!605563))

(declare-fun m!605565 () Bool)

(assert (=> b!630241 m!605565))

(declare-fun m!605567 () Bool)

(assert (=> b!630244 m!605567))

(declare-fun m!605569 () Bool)

(assert (=> b!630245 m!605569))

(check-sat (not b!630250) (not start!56958) (not b!630244) (not b!630245) (not b!630249) (not b!630243) (not b!630242) (not b!630241) (not b!630247))
(check-sat)
