; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55056 () Bool)

(assert start!55056)

(declare-fun b!602212 () Bool)

(declare-fun e!344395 () Bool)

(declare-fun e!344401 () Bool)

(assert (=> b!602212 (= e!344395 e!344401)))

(declare-fun res!386620 () Bool)

(assert (=> b!602212 (=> res!386620 e!344401)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!274224 () (_ BitVec 64))

(declare-fun lt!274220 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37155 0))(
  ( (array!37156 (arr!17833 (Array (_ BitVec 32) (_ BitVec 64))) (size!18197 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37155)

(assert (=> b!602212 (= res!386620 (or (not (= (select (arr!17833 a!2986) j!136) lt!274220)) (not (= (select (arr!17833 a!2986) j!136) lt!274224)) (bvsge j!136 index!984)))))

(declare-fun b!602213 () Bool)

(declare-fun e!344405 () Bool)

(declare-datatypes ((SeekEntryResult!6229 0))(
  ( (MissingZero!6229 (index!27176 (_ BitVec 32))) (Found!6229 (index!27177 (_ BitVec 32))) (Intermediate!6229 (undefined!7041 Bool) (index!27178 (_ BitVec 32)) (x!56128 (_ BitVec 32))) (Undefined!6229) (MissingVacant!6229 (index!27179 (_ BitVec 32))) )
))
(declare-fun lt!274213 () SeekEntryResult!6229)

(declare-fun lt!274225 () SeekEntryResult!6229)

(assert (=> b!602213 (= e!344405 (= lt!274213 lt!274225))))

(declare-fun b!602214 () Bool)

(declare-fun res!386621 () Bool)

(declare-fun e!344394 () Bool)

(assert (=> b!602214 (=> (not res!386621) (not e!344394))))

(declare-datatypes ((List!11781 0))(
  ( (Nil!11778) (Cons!11777 (h!12825 (_ BitVec 64)) (t!18001 List!11781)) )
))
(declare-fun arrayNoDuplicates!0 (array!37155 (_ BitVec 32) List!11781) Bool)

(assert (=> b!602214 (= res!386621 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11778))))

(declare-fun b!602215 () Bool)

(declare-fun e!344400 () Bool)

(assert (=> b!602215 (= e!344400 true)))

(declare-fun lt!274217 () array!37155)

(declare-fun arrayContainsKey!0 (array!37155 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!602215 (arrayContainsKey!0 lt!274217 (select (arr!17833 a!2986) j!136) j!136)))

(declare-fun b!602216 () Bool)

(declare-fun res!386614 () Bool)

(declare-fun e!344396 () Bool)

(assert (=> b!602216 (=> (not res!386614) (not e!344396))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!602216 (= res!386614 (validKeyInArray!0 k0!1786))))

(declare-fun b!602217 () Bool)

(declare-fun res!386609 () Bool)

(assert (=> b!602217 (=> (not res!386609) (not e!344396))))

(assert (=> b!602217 (= res!386609 (validKeyInArray!0 (select (arr!17833 a!2986) j!136)))))

(declare-fun b!602218 () Bool)

(declare-fun res!386624 () Bool)

(assert (=> b!602218 (=> (not res!386624) (not e!344394))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37155 (_ BitVec 32)) Bool)

(assert (=> b!602218 (= res!386624 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!602219 () Bool)

(declare-fun e!344397 () Bool)

(declare-fun e!344404 () Bool)

(assert (=> b!602219 (= e!344397 (not e!344404))))

(declare-fun res!386613 () Bool)

(assert (=> b!602219 (=> res!386613 e!344404)))

(declare-fun lt!274222 () SeekEntryResult!6229)

(assert (=> b!602219 (= res!386613 (not (= lt!274222 (Found!6229 index!984))))))

(declare-datatypes ((Unit!19027 0))(
  ( (Unit!19028) )
))
(declare-fun lt!274216 () Unit!19027)

(declare-fun e!344393 () Unit!19027)

(assert (=> b!602219 (= lt!274216 e!344393)))

(declare-fun c!68170 () Bool)

(assert (=> b!602219 (= c!68170 (= lt!274222 Undefined!6229))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37155 (_ BitVec 32)) SeekEntryResult!6229)

(assert (=> b!602219 (= lt!274222 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!274220 lt!274217 mask!3053))))

(assert (=> b!602219 e!344405))

(declare-fun res!386616 () Bool)

(assert (=> b!602219 (=> (not res!386616) (not e!344405))))

(declare-fun lt!274218 () (_ BitVec 32))

(assert (=> b!602219 (= res!386616 (= lt!274225 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!274218 vacantSpotIndex!68 lt!274220 lt!274217 mask!3053)))))

(assert (=> b!602219 (= lt!274225 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!274218 vacantSpotIndex!68 (select (arr!17833 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!602219 (= lt!274220 (select (store (arr!17833 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!274221 () Unit!19027)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37155 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19027)

(assert (=> b!602219 (= lt!274221 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!274218 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!602219 (= lt!274218 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!602220 () Bool)

(declare-fun e!344402 () Bool)

(assert (=> b!602220 (= e!344404 e!344402)))

(declare-fun res!386618 () Bool)

(assert (=> b!602220 (=> res!386618 e!344402)))

(assert (=> b!602220 (= res!386618 (or (not (= (select (arr!17833 a!2986) j!136) lt!274220)) (not (= (select (arr!17833 a!2986) j!136) lt!274224))))))

(assert (=> b!602220 e!344395))

(declare-fun res!386622 () Bool)

(assert (=> b!602220 (=> (not res!386622) (not e!344395))))

(assert (=> b!602220 (= res!386622 (= lt!274224 (select (arr!17833 a!2986) j!136)))))

(assert (=> b!602220 (= lt!274224 (select (store (arr!17833 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!602221 () Bool)

(declare-fun res!386615 () Bool)

(assert (=> b!602221 (=> (not res!386615) (not e!344396))))

(assert (=> b!602221 (= res!386615 (and (= (size!18197 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18197 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18197 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!602222 () Bool)

(declare-fun e!344398 () Bool)

(assert (=> b!602222 (= e!344394 e!344398)))

(declare-fun res!386612 () Bool)

(assert (=> b!602222 (=> (not res!386612) (not e!344398))))

(assert (=> b!602222 (= res!386612 (= (select (store (arr!17833 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!602222 (= lt!274217 (array!37156 (store (arr!17833 a!2986) i!1108 k0!1786) (size!18197 a!2986)))))

(declare-fun res!386611 () Bool)

(assert (=> start!55056 (=> (not res!386611) (not e!344396))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55056 (= res!386611 (validMask!0 mask!3053))))

(assert (=> start!55056 e!344396))

(assert (=> start!55056 true))

(declare-fun array_inv!13692 (array!37155) Bool)

(assert (=> start!55056 (array_inv!13692 a!2986)))

(declare-fun b!602223 () Bool)

(declare-fun e!344399 () Unit!19027)

(declare-fun Unit!19029 () Unit!19027)

(assert (=> b!602223 (= e!344399 Unit!19029)))

(declare-fun b!602224 () Bool)

(assert (=> b!602224 (= e!344402 e!344400)))

(declare-fun res!386610 () Bool)

(assert (=> b!602224 (=> res!386610 e!344400)))

(assert (=> b!602224 (= res!386610 (bvsge index!984 j!136))))

(declare-fun lt!274212 () Unit!19027)

(assert (=> b!602224 (= lt!274212 e!344399)))

(declare-fun c!68171 () Bool)

(assert (=> b!602224 (= c!68171 (bvslt j!136 index!984))))

(declare-fun b!602225 () Bool)

(declare-fun res!386625 () Bool)

(assert (=> b!602225 (=> (not res!386625) (not e!344394))))

(assert (=> b!602225 (= res!386625 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17833 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!602226 () Bool)

(declare-fun Unit!19030 () Unit!19027)

(assert (=> b!602226 (= e!344399 Unit!19030)))

(declare-fun lt!274215 () Unit!19027)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37155 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19027)

(assert (=> b!602226 (= lt!274215 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!274217 (select (arr!17833 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!602226 (arrayContainsKey!0 lt!274217 (select (arr!17833 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!274214 () Unit!19027)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37155 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11781) Unit!19027)

(assert (=> b!602226 (= lt!274214 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11778))))

(assert (=> b!602226 (arrayNoDuplicates!0 lt!274217 #b00000000000000000000000000000000 Nil!11778)))

(declare-fun lt!274219 () Unit!19027)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37155 (_ BitVec 32) (_ BitVec 32)) Unit!19027)

(assert (=> b!602226 (= lt!274219 (lemmaNoDuplicateFromThenFromBigger!0 lt!274217 #b00000000000000000000000000000000 j!136))))

(assert (=> b!602226 (arrayNoDuplicates!0 lt!274217 j!136 Nil!11778)))

(declare-fun lt!274223 () Unit!19027)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37155 (_ BitVec 64) (_ BitVec 32) List!11781) Unit!19027)

(assert (=> b!602226 (= lt!274223 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!274217 (select (arr!17833 a!2986) j!136) j!136 Nil!11778))))

(assert (=> b!602226 false))

(declare-fun b!602227 () Bool)

(declare-fun Unit!19031 () Unit!19027)

(assert (=> b!602227 (= e!344393 Unit!19031)))

(declare-fun b!602228 () Bool)

(assert (=> b!602228 (= e!344398 e!344397)))

(declare-fun res!386617 () Bool)

(assert (=> b!602228 (=> (not res!386617) (not e!344397))))

(assert (=> b!602228 (= res!386617 (and (= lt!274213 (Found!6229 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17833 a!2986) index!984) (select (arr!17833 a!2986) j!136))) (not (= (select (arr!17833 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!602228 (= lt!274213 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17833 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!602229 () Bool)

(assert (=> b!602229 (= e!344396 e!344394)))

(declare-fun res!386623 () Bool)

(assert (=> b!602229 (=> (not res!386623) (not e!344394))))

(declare-fun lt!274211 () SeekEntryResult!6229)

(assert (=> b!602229 (= res!386623 (or (= lt!274211 (MissingZero!6229 i!1108)) (= lt!274211 (MissingVacant!6229 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37155 (_ BitVec 32)) SeekEntryResult!6229)

(assert (=> b!602229 (= lt!274211 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!602230 () Bool)

(declare-fun Unit!19032 () Unit!19027)

(assert (=> b!602230 (= e!344393 Unit!19032)))

(assert (=> b!602230 false))

(declare-fun b!602231 () Bool)

(declare-fun e!344403 () Bool)

(assert (=> b!602231 (= e!344403 (arrayContainsKey!0 lt!274217 (select (arr!17833 a!2986) j!136) index!984))))

(declare-fun b!602232 () Bool)

(declare-fun res!386626 () Bool)

(assert (=> b!602232 (=> (not res!386626) (not e!344396))))

(assert (=> b!602232 (= res!386626 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!602233 () Bool)

(assert (=> b!602233 (= e!344401 e!344403)))

(declare-fun res!386619 () Bool)

(assert (=> b!602233 (=> (not res!386619) (not e!344403))))

(assert (=> b!602233 (= res!386619 (arrayContainsKey!0 lt!274217 (select (arr!17833 a!2986) j!136) j!136))))

(assert (= (and start!55056 res!386611) b!602221))

(assert (= (and b!602221 res!386615) b!602217))

(assert (= (and b!602217 res!386609) b!602216))

(assert (= (and b!602216 res!386614) b!602232))

(assert (= (and b!602232 res!386626) b!602229))

(assert (= (and b!602229 res!386623) b!602218))

(assert (= (and b!602218 res!386624) b!602214))

(assert (= (and b!602214 res!386621) b!602225))

(assert (= (and b!602225 res!386625) b!602222))

(assert (= (and b!602222 res!386612) b!602228))

(assert (= (and b!602228 res!386617) b!602219))

(assert (= (and b!602219 res!386616) b!602213))

(assert (= (and b!602219 c!68170) b!602230))

(assert (= (and b!602219 (not c!68170)) b!602227))

(assert (= (and b!602219 (not res!386613)) b!602220))

(assert (= (and b!602220 res!386622) b!602212))

(assert (= (and b!602212 (not res!386620)) b!602233))

(assert (= (and b!602233 res!386619) b!602231))

(assert (= (and b!602220 (not res!386618)) b!602224))

(assert (= (and b!602224 c!68171) b!602226))

(assert (= (and b!602224 (not c!68171)) b!602223))

(assert (= (and b!602224 (not res!386610)) b!602215))

(declare-fun m!579599 () Bool)

(assert (=> b!602232 m!579599))

(declare-fun m!579601 () Bool)

(assert (=> b!602216 m!579601))

(declare-fun m!579603 () Bool)

(assert (=> b!602226 m!579603))

(declare-fun m!579605 () Bool)

(assert (=> b!602226 m!579605))

(assert (=> b!602226 m!579603))

(declare-fun m!579607 () Bool)

(assert (=> b!602226 m!579607))

(assert (=> b!602226 m!579603))

(declare-fun m!579609 () Bool)

(assert (=> b!602226 m!579609))

(assert (=> b!602226 m!579603))

(declare-fun m!579611 () Bool)

(assert (=> b!602226 m!579611))

(declare-fun m!579613 () Bool)

(assert (=> b!602226 m!579613))

(declare-fun m!579615 () Bool)

(assert (=> b!602226 m!579615))

(declare-fun m!579617 () Bool)

(assert (=> b!602226 m!579617))

(assert (=> b!602212 m!579603))

(assert (=> b!602233 m!579603))

(assert (=> b!602233 m!579603))

(declare-fun m!579619 () Bool)

(assert (=> b!602233 m!579619))

(assert (=> b!602231 m!579603))

(assert (=> b!602231 m!579603))

(declare-fun m!579621 () Bool)

(assert (=> b!602231 m!579621))

(declare-fun m!579623 () Bool)

(assert (=> b!602214 m!579623))

(assert (=> b!602217 m!579603))

(assert (=> b!602217 m!579603))

(declare-fun m!579625 () Bool)

(assert (=> b!602217 m!579625))

(declare-fun m!579627 () Bool)

(assert (=> b!602222 m!579627))

(declare-fun m!579629 () Bool)

(assert (=> b!602222 m!579629))

(declare-fun m!579631 () Bool)

(assert (=> b!602228 m!579631))

(assert (=> b!602228 m!579603))

(assert (=> b!602228 m!579603))

(declare-fun m!579633 () Bool)

(assert (=> b!602228 m!579633))

(assert (=> b!602215 m!579603))

(assert (=> b!602215 m!579603))

(assert (=> b!602215 m!579619))

(declare-fun m!579635 () Bool)

(assert (=> b!602218 m!579635))

(assert (=> b!602220 m!579603))

(assert (=> b!602220 m!579627))

(declare-fun m!579637 () Bool)

(assert (=> b!602220 m!579637))

(declare-fun m!579639 () Bool)

(assert (=> b!602225 m!579639))

(declare-fun m!579641 () Bool)

(assert (=> b!602219 m!579641))

(declare-fun m!579643 () Bool)

(assert (=> b!602219 m!579643))

(declare-fun m!579645 () Bool)

(assert (=> b!602219 m!579645))

(assert (=> b!602219 m!579603))

(assert (=> b!602219 m!579627))

(declare-fun m!579647 () Bool)

(assert (=> b!602219 m!579647))

(assert (=> b!602219 m!579603))

(declare-fun m!579649 () Bool)

(assert (=> b!602219 m!579649))

(declare-fun m!579651 () Bool)

(assert (=> b!602219 m!579651))

(declare-fun m!579653 () Bool)

(assert (=> b!602229 m!579653))

(declare-fun m!579655 () Bool)

(assert (=> start!55056 m!579655))

(declare-fun m!579657 () Bool)

(assert (=> start!55056 m!579657))

(check-sat (not b!602226) (not b!602232) (not start!55056) (not b!602229) (not b!602233) (not b!602215) (not b!602216) (not b!602214) (not b!602218) (not b!602217) (not b!602219) (not b!602231) (not b!602228))
(check-sat)
