; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54306 () Bool)

(assert start!54306)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun e!338701 () Bool)

(declare-datatypes ((array!36918 0))(
  ( (array!36919 (arr!17725 (Array (_ BitVec 32) (_ BitVec 64))) (size!18089 (_ BitVec 32))) )
))
(declare-fun lt!269218 () array!36918)

(declare-fun b!593038 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!36918)

(declare-fun arrayContainsKey!0 (array!36918 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!593038 (= e!338701 (arrayContainsKey!0 lt!269218 (select (arr!17725 a!2986) j!136) index!984))))

(declare-fun b!593039 () Bool)

(declare-fun res!379560 () Bool)

(declare-fun e!338712 () Bool)

(assert (=> b!593039 (=> (not res!379560) (not e!338712))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!593039 (= res!379560 (validKeyInArray!0 k0!1786))))

(declare-fun b!593040 () Bool)

(declare-fun res!379562 () Bool)

(declare-fun e!338705 () Bool)

(assert (=> b!593040 (=> (not res!379562) (not e!338705))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36918 (_ BitVec 32)) Bool)

(assert (=> b!593040 (= res!379562 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!593041 () Bool)

(declare-fun e!338709 () Bool)

(assert (=> b!593041 (= e!338709 e!338701)))

(declare-fun res!379563 () Bool)

(assert (=> b!593041 (=> (not res!379563) (not e!338701))))

(assert (=> b!593041 (= res!379563 (arrayContainsKey!0 lt!269218 (select (arr!17725 a!2986) j!136) j!136))))

(declare-fun b!593042 () Bool)

(declare-fun res!379570 () Bool)

(assert (=> b!593042 (=> (not res!379570) (not e!338705))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!593042 (= res!379570 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17725 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!593043 () Bool)

(declare-datatypes ((Unit!18577 0))(
  ( (Unit!18578) )
))
(declare-fun e!338702 () Unit!18577)

(declare-fun Unit!18579 () Unit!18577)

(assert (=> b!593043 (= e!338702 Unit!18579)))

(declare-fun b!593045 () Bool)

(declare-fun e!338704 () Bool)

(assert (=> b!593045 (= e!338705 e!338704)))

(declare-fun res!379559 () Bool)

(assert (=> b!593045 (=> (not res!379559) (not e!338704))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!593045 (= res!379559 (= (select (store (arr!17725 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!593045 (= lt!269218 (array!36919 (store (arr!17725 a!2986) i!1108 k0!1786) (size!18089 a!2986)))))

(declare-fun b!593046 () Bool)

(declare-fun e!338706 () Bool)

(declare-datatypes ((SeekEntryResult!6121 0))(
  ( (MissingZero!6121 (index!26723 (_ BitVec 32))) (Found!6121 (index!26724 (_ BitVec 32))) (Intermediate!6121 (undefined!6933 Bool) (index!26725 (_ BitVec 32)) (x!55669 (_ BitVec 32))) (Undefined!6121) (MissingVacant!6121 (index!26726 (_ BitVec 32))) )
))
(declare-fun lt!269220 () SeekEntryResult!6121)

(declare-fun lt!269212 () SeekEntryResult!6121)

(assert (=> b!593046 (= e!338706 (= lt!269220 lt!269212))))

(declare-fun b!593047 () Bool)

(declare-fun res!379558 () Bool)

(assert (=> b!593047 (=> (not res!379558) (not e!338705))))

(declare-datatypes ((List!11673 0))(
  ( (Nil!11670) (Cons!11669 (h!12717 (_ BitVec 64)) (t!17893 List!11673)) )
))
(declare-fun arrayNoDuplicates!0 (array!36918 (_ BitVec 32) List!11673) Bool)

(assert (=> b!593047 (= res!379558 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11670))))

(declare-fun b!593048 () Bool)

(declare-fun e!338707 () Bool)

(assert (=> b!593048 (= e!338707 (bvsle #b00000000000000000000000000000000 (size!18089 a!2986)))))

(assert (=> b!593048 (arrayContainsKey!0 lt!269218 (select (arr!17725 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!269213 () Unit!18577)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!36918 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18577)

(assert (=> b!593048 (= lt!269213 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!269218 (select (arr!17725 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!593049 () Bool)

(declare-fun e!338703 () Bool)

(declare-fun e!338708 () Bool)

(assert (=> b!593049 (= e!338703 (not e!338708))))

(declare-fun res!379564 () Bool)

(assert (=> b!593049 (=> res!379564 e!338708)))

(declare-fun lt!269216 () SeekEntryResult!6121)

(assert (=> b!593049 (= res!379564 (not (= lt!269216 (Found!6121 index!984))))))

(declare-fun lt!269221 () Unit!18577)

(assert (=> b!593049 (= lt!269221 e!338702)))

(declare-fun c!67109 () Bool)

(assert (=> b!593049 (= c!67109 (= lt!269216 Undefined!6121))))

(declare-fun lt!269214 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36918 (_ BitVec 32)) SeekEntryResult!6121)

(assert (=> b!593049 (= lt!269216 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!269214 lt!269218 mask!3053))))

(assert (=> b!593049 e!338706))

(declare-fun res!379567 () Bool)

(assert (=> b!593049 (=> (not res!379567) (not e!338706))))

(declare-fun lt!269215 () (_ BitVec 32))

(assert (=> b!593049 (= res!379567 (= lt!269212 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269215 vacantSpotIndex!68 lt!269214 lt!269218 mask!3053)))))

(assert (=> b!593049 (= lt!269212 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269215 vacantSpotIndex!68 (select (arr!17725 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!593049 (= lt!269214 (select (store (arr!17725 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!269217 () Unit!18577)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36918 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18577)

(assert (=> b!593049 (= lt!269217 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!269215 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!593049 (= lt!269215 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!593050 () Bool)

(assert (=> b!593050 (= e!338712 e!338705)))

(declare-fun res!379569 () Bool)

(assert (=> b!593050 (=> (not res!379569) (not e!338705))))

(declare-fun lt!269219 () SeekEntryResult!6121)

(assert (=> b!593050 (= res!379569 (or (= lt!269219 (MissingZero!6121 i!1108)) (= lt!269219 (MissingVacant!6121 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36918 (_ BitVec 32)) SeekEntryResult!6121)

(assert (=> b!593050 (= lt!269219 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!593051 () Bool)

(declare-fun res!379568 () Bool)

(assert (=> b!593051 (=> (not res!379568) (not e!338712))))

(assert (=> b!593051 (= res!379568 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!593052 () Bool)

(declare-fun e!338710 () Bool)

(assert (=> b!593052 (= e!338710 e!338709)))

(declare-fun res!379565 () Bool)

(assert (=> b!593052 (=> res!379565 e!338709)))

(declare-fun lt!269211 () (_ BitVec 64))

(assert (=> b!593052 (= res!379565 (or (not (= (select (arr!17725 a!2986) j!136) lt!269214)) (not (= (select (arr!17725 a!2986) j!136) lt!269211)) (bvsge j!136 index!984)))))

(declare-fun b!593053 () Bool)

(declare-fun res!379573 () Bool)

(assert (=> b!593053 (=> (not res!379573) (not e!338712))))

(assert (=> b!593053 (= res!379573 (and (= (size!18089 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18089 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18089 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!593054 () Bool)

(declare-fun Unit!18580 () Unit!18577)

(assert (=> b!593054 (= e!338702 Unit!18580)))

(assert (=> b!593054 false))

(declare-fun res!379561 () Bool)

(assert (=> start!54306 (=> (not res!379561) (not e!338712))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54306 (= res!379561 (validMask!0 mask!3053))))

(assert (=> start!54306 e!338712))

(assert (=> start!54306 true))

(declare-fun array_inv!13584 (array!36918) Bool)

(assert (=> start!54306 (array_inv!13584 a!2986)))

(declare-fun b!593044 () Bool)

(assert (=> b!593044 (= e!338704 e!338703)))

(declare-fun res!379572 () Bool)

(assert (=> b!593044 (=> (not res!379572) (not e!338703))))

(assert (=> b!593044 (= res!379572 (and (= lt!269220 (Found!6121 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17725 a!2986) index!984) (select (arr!17725 a!2986) j!136))) (not (= (select (arr!17725 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!593044 (= lt!269220 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17725 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!593055 () Bool)

(assert (=> b!593055 (= e!338708 e!338707)))

(declare-fun res!379571 () Bool)

(assert (=> b!593055 (=> res!379571 e!338707)))

(assert (=> b!593055 (= res!379571 (or (not (= (select (arr!17725 a!2986) j!136) lt!269214)) (not (= (select (arr!17725 a!2986) j!136) lt!269211)) (bvsge j!136 index!984)))))

(assert (=> b!593055 e!338710))

(declare-fun res!379557 () Bool)

(assert (=> b!593055 (=> (not res!379557) (not e!338710))))

(assert (=> b!593055 (= res!379557 (= lt!269211 (select (arr!17725 a!2986) j!136)))))

(assert (=> b!593055 (= lt!269211 (select (store (arr!17725 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!593056 () Bool)

(declare-fun res!379566 () Bool)

(assert (=> b!593056 (=> (not res!379566) (not e!338712))))

(assert (=> b!593056 (= res!379566 (validKeyInArray!0 (select (arr!17725 a!2986) j!136)))))

(assert (= (and start!54306 res!379561) b!593053))

(assert (= (and b!593053 res!379573) b!593056))

(assert (= (and b!593056 res!379566) b!593039))

(assert (= (and b!593039 res!379560) b!593051))

(assert (= (and b!593051 res!379568) b!593050))

(assert (= (and b!593050 res!379569) b!593040))

(assert (= (and b!593040 res!379562) b!593047))

(assert (= (and b!593047 res!379558) b!593042))

(assert (= (and b!593042 res!379570) b!593045))

(assert (= (and b!593045 res!379559) b!593044))

(assert (= (and b!593044 res!379572) b!593049))

(assert (= (and b!593049 res!379567) b!593046))

(assert (= (and b!593049 c!67109) b!593054))

(assert (= (and b!593049 (not c!67109)) b!593043))

(assert (= (and b!593049 (not res!379564)) b!593055))

(assert (= (and b!593055 res!379557) b!593052))

(assert (= (and b!593052 (not res!379565)) b!593041))

(assert (= (and b!593041 res!379563) b!593038))

(assert (= (and b!593055 (not res!379571)) b!593048))

(declare-fun m!571265 () Bool)

(assert (=> b!593045 m!571265))

(declare-fun m!571267 () Bool)

(assert (=> b!593045 m!571267))

(declare-fun m!571269 () Bool)

(assert (=> b!593039 m!571269))

(declare-fun m!571271 () Bool)

(assert (=> b!593049 m!571271))

(declare-fun m!571273 () Bool)

(assert (=> b!593049 m!571273))

(assert (=> b!593049 m!571273))

(declare-fun m!571275 () Bool)

(assert (=> b!593049 m!571275))

(declare-fun m!571277 () Bool)

(assert (=> b!593049 m!571277))

(declare-fun m!571279 () Bool)

(assert (=> b!593049 m!571279))

(declare-fun m!571281 () Bool)

(assert (=> b!593049 m!571281))

(declare-fun m!571283 () Bool)

(assert (=> b!593049 m!571283))

(assert (=> b!593049 m!571265))

(assert (=> b!593052 m!571273))

(declare-fun m!571285 () Bool)

(assert (=> b!593047 m!571285))

(declare-fun m!571287 () Bool)

(assert (=> b!593050 m!571287))

(assert (=> b!593055 m!571273))

(assert (=> b!593055 m!571265))

(declare-fun m!571289 () Bool)

(assert (=> b!593055 m!571289))

(declare-fun m!571291 () Bool)

(assert (=> b!593042 m!571291))

(assert (=> b!593041 m!571273))

(assert (=> b!593041 m!571273))

(declare-fun m!571293 () Bool)

(assert (=> b!593041 m!571293))

(declare-fun m!571295 () Bool)

(assert (=> b!593051 m!571295))

(assert (=> b!593038 m!571273))

(assert (=> b!593038 m!571273))

(declare-fun m!571297 () Bool)

(assert (=> b!593038 m!571297))

(declare-fun m!571299 () Bool)

(assert (=> start!54306 m!571299))

(declare-fun m!571301 () Bool)

(assert (=> start!54306 m!571301))

(assert (=> b!593056 m!571273))

(assert (=> b!593056 m!571273))

(declare-fun m!571303 () Bool)

(assert (=> b!593056 m!571303))

(assert (=> b!593048 m!571273))

(assert (=> b!593048 m!571273))

(declare-fun m!571305 () Bool)

(assert (=> b!593048 m!571305))

(assert (=> b!593048 m!571273))

(declare-fun m!571307 () Bool)

(assert (=> b!593048 m!571307))

(declare-fun m!571309 () Bool)

(assert (=> b!593044 m!571309))

(assert (=> b!593044 m!571273))

(assert (=> b!593044 m!571273))

(declare-fun m!571311 () Bool)

(assert (=> b!593044 m!571311))

(declare-fun m!571313 () Bool)

(assert (=> b!593040 m!571313))

(check-sat (not b!593039) (not b!593047) (not b!593050) (not b!593038) (not b!593051) (not b!593049) (not b!593041) (not start!54306) (not b!593048) (not b!593040) (not b!593044) (not b!593056))
(check-sat)
