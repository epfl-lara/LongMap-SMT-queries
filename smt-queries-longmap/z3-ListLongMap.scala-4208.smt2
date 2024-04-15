; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57680 () Bool)

(assert start!57680)

(declare-fun b!637307 () Bool)

(declare-fun res!412371 () Bool)

(declare-fun e!364653 () Bool)

(assert (=> b!637307 (=> (not res!412371) (not e!364653))))

(declare-datatypes ((array!38262 0))(
  ( (array!38263 (arr!18353 (Array (_ BitVec 32) (_ BitVec 64))) (size!18718 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38262)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38262 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!637307 (= res!412371 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!637308 () Bool)

(declare-fun res!412368 () Bool)

(assert (=> b!637308 (=> (not res!412368) (not e!364653))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!637308 (= res!412368 (and (= (size!18718 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18718 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18718 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!637309 () Bool)

(declare-fun res!412379 () Bool)

(assert (=> b!637309 (=> (not res!412379) (not e!364653))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!637309 (= res!412379 (validKeyInArray!0 (select (arr!18353 a!2986) j!136)))))

(declare-fun b!637311 () Bool)

(declare-fun e!364660 () Bool)

(declare-fun e!364659 () Bool)

(assert (=> b!637311 (= e!364660 e!364659)))

(declare-fun res!412367 () Bool)

(assert (=> b!637311 (=> res!412367 e!364659)))

(declare-fun lt!294561 () (_ BitVec 64))

(declare-fun lt!294560 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!637311 (= res!412367 (or (not (= (select (arr!18353 a!2986) j!136) lt!294560)) (not (= (select (arr!18353 a!2986) j!136) lt!294561)) (bvsge j!136 index!984)))))

(declare-fun e!364656 () Bool)

(assert (=> b!637311 e!364656))

(declare-fun res!412362 () Bool)

(assert (=> b!637311 (=> (not res!412362) (not e!364656))))

(assert (=> b!637311 (= res!412362 (= lt!294561 (select (arr!18353 a!2986) j!136)))))

(assert (=> b!637311 (= lt!294561 (select (store (arr!18353 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!637312 () Bool)

(declare-fun e!364652 () Bool)

(assert (=> b!637312 (= e!364656 e!364652)))

(declare-fun res!412377 () Bool)

(assert (=> b!637312 (=> res!412377 e!364652)))

(assert (=> b!637312 (= res!412377 (or (not (= (select (arr!18353 a!2986) j!136) lt!294560)) (not (= (select (arr!18353 a!2986) j!136) lt!294561)) (bvsge j!136 index!984)))))

(declare-fun b!637313 () Bool)

(declare-fun e!364649 () Bool)

(assert (=> b!637313 (= e!364649 true)))

(declare-fun lt!294559 () Bool)

(declare-datatypes ((List!12433 0))(
  ( (Nil!12430) (Cons!12429 (h!13474 (_ BitVec 64)) (t!18652 List!12433)) )
))
(declare-fun contains!3093 (List!12433 (_ BitVec 64)) Bool)

(assert (=> b!637313 (= lt!294559 (contains!3093 Nil!12430 k0!1786))))

(declare-fun b!637314 () Bool)

(declare-fun e!364654 () Bool)

(declare-fun e!364651 () Bool)

(assert (=> b!637314 (= e!364654 e!364651)))

(declare-fun res!412378 () Bool)

(assert (=> b!637314 (=> (not res!412378) (not e!364651))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!637314 (= res!412378 (= (select (store (arr!18353 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!294558 () array!38262)

(assert (=> b!637314 (= lt!294558 (array!38263 (store (arr!18353 a!2986) i!1108 k0!1786) (size!18718 a!2986)))))

(declare-fun b!637315 () Bool)

(declare-fun e!364657 () Bool)

(assert (=> b!637315 (= e!364651 e!364657)))

(declare-fun res!412364 () Bool)

(assert (=> b!637315 (=> (not res!412364) (not e!364657))))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6790 0))(
  ( (MissingZero!6790 (index!29474 (_ BitVec 32))) (Found!6790 (index!29475 (_ BitVec 32))) (Intermediate!6790 (undefined!7602 Bool) (index!29476 (_ BitVec 32)) (x!58243 (_ BitVec 32))) (Undefined!6790) (MissingVacant!6790 (index!29477 (_ BitVec 32))) )
))
(declare-fun lt!294562 () SeekEntryResult!6790)

(assert (=> b!637315 (= res!412364 (and (= lt!294562 (Found!6790 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18353 a!2986) index!984) (select (arr!18353 a!2986) j!136))) (not (= (select (arr!18353 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38262 (_ BitVec 32)) SeekEntryResult!6790)

(assert (=> b!637315 (= lt!294562 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18353 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!637316 () Bool)

(assert (=> b!637316 (= e!364657 (not e!364660))))

(declare-fun res!412380 () Bool)

(assert (=> b!637316 (=> res!412380 e!364660)))

(declare-fun lt!294554 () SeekEntryResult!6790)

(assert (=> b!637316 (= res!412380 (not (= lt!294554 (Found!6790 index!984))))))

(declare-datatypes ((Unit!21488 0))(
  ( (Unit!21489) )
))
(declare-fun lt!294555 () Unit!21488)

(declare-fun e!364661 () Unit!21488)

(assert (=> b!637316 (= lt!294555 e!364661)))

(declare-fun c!72840 () Bool)

(assert (=> b!637316 (= c!72840 (= lt!294554 Undefined!6790))))

(assert (=> b!637316 (= lt!294554 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!294560 lt!294558 mask!3053))))

(declare-fun e!364650 () Bool)

(assert (=> b!637316 e!364650))

(declare-fun res!412375 () Bool)

(assert (=> b!637316 (=> (not res!412375) (not e!364650))))

(declare-fun lt!294556 () (_ BitVec 32))

(declare-fun lt!294564 () SeekEntryResult!6790)

(assert (=> b!637316 (= res!412375 (= lt!294564 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294556 vacantSpotIndex!68 lt!294560 lt!294558 mask!3053)))))

(assert (=> b!637316 (= lt!294564 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294556 vacantSpotIndex!68 (select (arr!18353 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!637316 (= lt!294560 (select (store (arr!18353 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!294563 () Unit!21488)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38262 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21488)

(assert (=> b!637316 (= lt!294563 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!294556 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!637316 (= lt!294556 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!637317 () Bool)

(declare-fun res!412376 () Bool)

(assert (=> b!637317 (=> (not res!412376) (not e!364654))))

(declare-fun arrayNoDuplicates!0 (array!38262 (_ BitVec 32) List!12433) Bool)

(assert (=> b!637317 (= res!412376 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12430))))

(declare-fun e!364655 () Bool)

(declare-fun b!637318 () Bool)

(assert (=> b!637318 (= e!364655 (arrayContainsKey!0 lt!294558 (select (arr!18353 a!2986) j!136) index!984))))

(declare-fun b!637319 () Bool)

(assert (=> b!637319 (= e!364659 e!364649)))

(declare-fun res!412372 () Bool)

(assert (=> b!637319 (=> res!412372 e!364649)))

(assert (=> b!637319 (= res!412372 (or (bvsge (size!18718 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18718 a!2986))))))

(assert (=> b!637319 (arrayContainsKey!0 lt!294558 (select (arr!18353 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!294553 () Unit!21488)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38262 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21488)

(assert (=> b!637319 (= lt!294553 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!294558 (select (arr!18353 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun res!412381 () Bool)

(assert (=> start!57680 (=> (not res!412381) (not e!364653))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57680 (= res!412381 (validMask!0 mask!3053))))

(assert (=> start!57680 e!364653))

(assert (=> start!57680 true))

(declare-fun array_inv!14236 (array!38262) Bool)

(assert (=> start!57680 (array_inv!14236 a!2986)))

(declare-fun b!637310 () Bool)

(assert (=> b!637310 (= e!364650 (= lt!294562 lt!294564))))

(declare-fun b!637320 () Bool)

(assert (=> b!637320 (= e!364652 e!364655)))

(declare-fun res!412373 () Bool)

(assert (=> b!637320 (=> (not res!412373) (not e!364655))))

(assert (=> b!637320 (= res!412373 (arrayContainsKey!0 lt!294558 (select (arr!18353 a!2986) j!136) j!136))))

(declare-fun b!637321 () Bool)

(declare-fun res!412361 () Bool)

(assert (=> b!637321 (=> (not res!412361) (not e!364653))))

(assert (=> b!637321 (= res!412361 (validKeyInArray!0 k0!1786))))

(declare-fun b!637322 () Bool)

(declare-fun res!412363 () Bool)

(assert (=> b!637322 (=> res!412363 e!364649)))

(assert (=> b!637322 (= res!412363 (contains!3093 Nil!12430 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!637323 () Bool)

(declare-fun Unit!21490 () Unit!21488)

(assert (=> b!637323 (= e!364661 Unit!21490)))

(declare-fun b!637324 () Bool)

(declare-fun res!412366 () Bool)

(assert (=> b!637324 (=> res!412366 e!364649)))

(declare-fun noDuplicate!392 (List!12433) Bool)

(assert (=> b!637324 (= res!412366 (not (noDuplicate!392 Nil!12430)))))

(declare-fun b!637325 () Bool)

(declare-fun res!412369 () Bool)

(assert (=> b!637325 (=> (not res!412369) (not e!364654))))

(assert (=> b!637325 (= res!412369 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18353 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!637326 () Bool)

(declare-fun res!412374 () Bool)

(assert (=> b!637326 (=> (not res!412374) (not e!364654))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38262 (_ BitVec 32)) Bool)

(assert (=> b!637326 (= res!412374 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!637327 () Bool)

(declare-fun Unit!21491 () Unit!21488)

(assert (=> b!637327 (= e!364661 Unit!21491)))

(assert (=> b!637327 false))

(declare-fun b!637328 () Bool)

(declare-fun res!412365 () Bool)

(assert (=> b!637328 (=> res!412365 e!364649)))

(assert (=> b!637328 (= res!412365 (contains!3093 Nil!12430 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!637329 () Bool)

(assert (=> b!637329 (= e!364653 e!364654)))

(declare-fun res!412370 () Bool)

(assert (=> b!637329 (=> (not res!412370) (not e!364654))))

(declare-fun lt!294557 () SeekEntryResult!6790)

(assert (=> b!637329 (= res!412370 (or (= lt!294557 (MissingZero!6790 i!1108)) (= lt!294557 (MissingVacant!6790 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38262 (_ BitVec 32)) SeekEntryResult!6790)

(assert (=> b!637329 (= lt!294557 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(assert (= (and start!57680 res!412381) b!637308))

(assert (= (and b!637308 res!412368) b!637309))

(assert (= (and b!637309 res!412379) b!637321))

(assert (= (and b!637321 res!412361) b!637307))

(assert (= (and b!637307 res!412371) b!637329))

(assert (= (and b!637329 res!412370) b!637326))

(assert (= (and b!637326 res!412374) b!637317))

(assert (= (and b!637317 res!412376) b!637325))

(assert (= (and b!637325 res!412369) b!637314))

(assert (= (and b!637314 res!412378) b!637315))

(assert (= (and b!637315 res!412364) b!637316))

(assert (= (and b!637316 res!412375) b!637310))

(assert (= (and b!637316 c!72840) b!637327))

(assert (= (and b!637316 (not c!72840)) b!637323))

(assert (= (and b!637316 (not res!412380)) b!637311))

(assert (= (and b!637311 res!412362) b!637312))

(assert (= (and b!637312 (not res!412377)) b!637320))

(assert (= (and b!637320 res!412373) b!637318))

(assert (= (and b!637311 (not res!412367)) b!637319))

(assert (= (and b!637319 (not res!412372)) b!637324))

(assert (= (and b!637324 (not res!412366)) b!637322))

(assert (= (and b!637322 (not res!412363)) b!637328))

(assert (= (and b!637328 (not res!412365)) b!637313))

(declare-fun m!610875 () Bool)

(assert (=> b!637318 m!610875))

(assert (=> b!637318 m!610875))

(declare-fun m!610877 () Bool)

(assert (=> b!637318 m!610877))

(declare-fun m!610879 () Bool)

(assert (=> b!637321 m!610879))

(assert (=> b!637312 m!610875))

(declare-fun m!610881 () Bool)

(assert (=> b!637322 m!610881))

(assert (=> b!637309 m!610875))

(assert (=> b!637309 m!610875))

(declare-fun m!610883 () Bool)

(assert (=> b!637309 m!610883))

(declare-fun m!610885 () Bool)

(assert (=> b!637314 m!610885))

(declare-fun m!610887 () Bool)

(assert (=> b!637314 m!610887))

(declare-fun m!610889 () Bool)

(assert (=> b!637328 m!610889))

(assert (=> b!637311 m!610875))

(assert (=> b!637311 m!610885))

(declare-fun m!610891 () Bool)

(assert (=> b!637311 m!610891))

(declare-fun m!610893 () Bool)

(assert (=> b!637313 m!610893))

(declare-fun m!610895 () Bool)

(assert (=> b!637317 m!610895))

(declare-fun m!610897 () Bool)

(assert (=> b!637316 m!610897))

(declare-fun m!610899 () Bool)

(assert (=> b!637316 m!610899))

(assert (=> b!637316 m!610875))

(declare-fun m!610901 () Bool)

(assert (=> b!637316 m!610901))

(assert (=> b!637316 m!610885))

(assert (=> b!637316 m!610875))

(declare-fun m!610903 () Bool)

(assert (=> b!637316 m!610903))

(declare-fun m!610905 () Bool)

(assert (=> b!637316 m!610905))

(declare-fun m!610907 () Bool)

(assert (=> b!637316 m!610907))

(declare-fun m!610909 () Bool)

(assert (=> start!57680 m!610909))

(declare-fun m!610911 () Bool)

(assert (=> start!57680 m!610911))

(declare-fun m!610913 () Bool)

(assert (=> b!637325 m!610913))

(declare-fun m!610915 () Bool)

(assert (=> b!637315 m!610915))

(assert (=> b!637315 m!610875))

(assert (=> b!637315 m!610875))

(declare-fun m!610917 () Bool)

(assert (=> b!637315 m!610917))

(declare-fun m!610919 () Bool)

(assert (=> b!637329 m!610919))

(assert (=> b!637319 m!610875))

(assert (=> b!637319 m!610875))

(declare-fun m!610921 () Bool)

(assert (=> b!637319 m!610921))

(assert (=> b!637319 m!610875))

(declare-fun m!610923 () Bool)

(assert (=> b!637319 m!610923))

(declare-fun m!610925 () Bool)

(assert (=> b!637307 m!610925))

(assert (=> b!637320 m!610875))

(assert (=> b!637320 m!610875))

(declare-fun m!610927 () Bool)

(assert (=> b!637320 m!610927))

(declare-fun m!610929 () Bool)

(assert (=> b!637326 m!610929))

(declare-fun m!610931 () Bool)

(assert (=> b!637324 m!610931))

(check-sat (not b!637328) (not b!637315) (not b!637321) (not b!637317) (not b!637329) (not b!637316) (not b!637324) (not start!57680) (not b!637319) (not b!637318) (not b!637307) (not b!637320) (not b!637326) (not b!637309) (not b!637313) (not b!637322))
(check-sat)
