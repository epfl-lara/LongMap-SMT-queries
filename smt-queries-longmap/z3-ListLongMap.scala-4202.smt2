; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57416 () Bool)

(assert start!57416)

(declare-fun b!635193 () Bool)

(declare-datatypes ((Unit!21416 0))(
  ( (Unit!21417) )
))
(declare-fun e!363287 () Unit!21416)

(declare-fun Unit!21418 () Unit!21416)

(assert (=> b!635193 (= e!363287 Unit!21418)))

(assert (=> b!635193 false))

(declare-fun b!635194 () Bool)

(declare-fun res!410957 () Bool)

(declare-fun e!363285 () Bool)

(assert (=> b!635194 (=> (not res!410957) (not e!363285))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!38217 0))(
  ( (array!38218 (arr!18335 (Array (_ BitVec 32) (_ BitVec 64))) (size!18700 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38217)

(assert (=> b!635194 (= res!410957 (and (= (size!18700 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18700 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18700 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!635195 () Bool)

(declare-fun res!410953 () Bool)

(assert (=> b!635195 (=> (not res!410953) (not e!363285))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38217 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!635195 (= res!410953 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!635196 () Bool)

(declare-fun e!363286 () Bool)

(declare-fun e!363279 () Bool)

(assert (=> b!635196 (= e!363286 e!363279)))

(declare-fun res!410959 () Bool)

(assert (=> b!635196 (=> (not res!410959) (not e!363279))))

(declare-fun lt!293579 () array!38217)

(assert (=> b!635196 (= res!410959 (arrayContainsKey!0 lt!293579 (select (arr!18335 a!2986) j!136) j!136))))

(declare-fun b!635197 () Bool)

(declare-fun res!410965 () Bool)

(assert (=> b!635197 (=> (not res!410965) (not e!363285))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!635197 (= res!410965 (validKeyInArray!0 (select (arr!18335 a!2986) j!136)))))

(declare-fun b!635198 () Bool)

(declare-fun res!410960 () Bool)

(declare-fun e!363280 () Bool)

(assert (=> b!635198 (=> (not res!410960) (not e!363280))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!635198 (= res!410960 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18335 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!635199 () Bool)

(assert (=> b!635199 (= e!363279 (arrayContainsKey!0 lt!293579 (select (arr!18335 a!2986) j!136) index!984))))

(declare-fun b!635201 () Bool)

(declare-fun e!363288 () Bool)

(declare-fun e!363289 () Bool)

(assert (=> b!635201 (= e!363288 e!363289)))

(declare-fun res!410950 () Bool)

(assert (=> b!635201 (=> res!410950 e!363289)))

(declare-fun lt!293575 () (_ BitVec 64))

(declare-fun lt!293572 () (_ BitVec 64))

(assert (=> b!635201 (= res!410950 (or (not (= (select (arr!18335 a!2986) j!136) lt!293572)) (not (= (select (arr!18335 a!2986) j!136) lt!293575)) (bvsge j!136 index!984)))))

(declare-fun e!363282 () Bool)

(assert (=> b!635201 e!363282))

(declare-fun res!410962 () Bool)

(assert (=> b!635201 (=> (not res!410962) (not e!363282))))

(assert (=> b!635201 (= res!410962 (= lt!293575 (select (arr!18335 a!2986) j!136)))))

(assert (=> b!635201 (= lt!293575 (select (store (arr!18335 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!635202 () Bool)

(assert (=> b!635202 (= e!363285 e!363280)))

(declare-fun res!410951 () Bool)

(assert (=> b!635202 (=> (not res!410951) (not e!363280))))

(declare-datatypes ((SeekEntryResult!6772 0))(
  ( (MissingZero!6772 (index!29393 (_ BitVec 32))) (Found!6772 (index!29394 (_ BitVec 32))) (Intermediate!6772 (undefined!7584 Bool) (index!29395 (_ BitVec 32)) (x!58150 (_ BitVec 32))) (Undefined!6772) (MissingVacant!6772 (index!29396 (_ BitVec 32))) )
))
(declare-fun lt!293574 () SeekEntryResult!6772)

(assert (=> b!635202 (= res!410951 (or (= lt!293574 (MissingZero!6772 i!1108)) (= lt!293574 (MissingVacant!6772 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38217 (_ BitVec 32)) SeekEntryResult!6772)

(assert (=> b!635202 (= lt!293574 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!635203 () Bool)

(declare-fun res!410958 () Bool)

(assert (=> b!635203 (=> (not res!410958) (not e!363280))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38217 (_ BitVec 32)) Bool)

(assert (=> b!635203 (= res!410958 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!635204 () Bool)

(declare-fun e!363283 () Bool)

(assert (=> b!635204 (= e!363283 (not e!363288))))

(declare-fun res!410956 () Bool)

(assert (=> b!635204 (=> res!410956 e!363288)))

(declare-fun lt!293573 () SeekEntryResult!6772)

(assert (=> b!635204 (= res!410956 (not (= lt!293573 (Found!6772 index!984))))))

(declare-fun lt!293576 () Unit!21416)

(assert (=> b!635204 (= lt!293576 e!363287)))

(declare-fun c!72489 () Bool)

(assert (=> b!635204 (= c!72489 (= lt!293573 Undefined!6772))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38217 (_ BitVec 32)) SeekEntryResult!6772)

(assert (=> b!635204 (= lt!293573 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!293572 lt!293579 mask!3053))))

(declare-fun e!363290 () Bool)

(assert (=> b!635204 e!363290))

(declare-fun res!410963 () Bool)

(assert (=> b!635204 (=> (not res!410963) (not e!363290))))

(declare-fun lt!293578 () SeekEntryResult!6772)

(declare-fun lt!293571 () (_ BitVec 32))

(assert (=> b!635204 (= res!410963 (= lt!293578 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293571 vacantSpotIndex!68 lt!293572 lt!293579 mask!3053)))))

(assert (=> b!635204 (= lt!293578 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293571 vacantSpotIndex!68 (select (arr!18335 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!635204 (= lt!293572 (select (store (arr!18335 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!293577 () Unit!21416)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38217 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21416)

(assert (=> b!635204 (= lt!293577 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!293571 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!635204 (= lt!293571 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!635205 () Bool)

(declare-fun e!363281 () Bool)

(assert (=> b!635205 (= e!363280 e!363281)))

(declare-fun res!410964 () Bool)

(assert (=> b!635205 (=> (not res!410964) (not e!363281))))

(assert (=> b!635205 (= res!410964 (= (select (store (arr!18335 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!635205 (= lt!293579 (array!38218 (store (arr!18335 a!2986) i!1108 k0!1786) (size!18700 a!2986)))))

(declare-fun b!635206 () Bool)

(declare-fun lt!293580 () SeekEntryResult!6772)

(assert (=> b!635206 (= e!363290 (= lt!293580 lt!293578))))

(declare-fun b!635207 () Bool)

(declare-fun res!410949 () Bool)

(assert (=> b!635207 (=> (not res!410949) (not e!363280))))

(declare-datatypes ((List!12415 0))(
  ( (Nil!12412) (Cons!12411 (h!13456 (_ BitVec 64)) (t!18634 List!12415)) )
))
(declare-fun arrayNoDuplicates!0 (array!38217 (_ BitVec 32) List!12415) Bool)

(assert (=> b!635207 (= res!410949 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12412))))

(declare-fun b!635208 () Bool)

(assert (=> b!635208 (= e!363281 e!363283)))

(declare-fun res!410961 () Bool)

(assert (=> b!635208 (=> (not res!410961) (not e!363283))))

(assert (=> b!635208 (= res!410961 (and (= lt!293580 (Found!6772 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18335 a!2986) index!984) (select (arr!18335 a!2986) j!136))) (not (= (select (arr!18335 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!635208 (= lt!293580 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18335 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!635209 () Bool)

(assert (=> b!635209 (= e!363289 true)))

(assert (=> b!635209 (arrayContainsKey!0 lt!293579 (select (arr!18335 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!293570 () Unit!21416)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38217 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21416)

(assert (=> b!635209 (= lt!293570 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!293579 (select (arr!18335 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!635210 () Bool)

(assert (=> b!635210 (= e!363282 e!363286)))

(declare-fun res!410952 () Bool)

(assert (=> b!635210 (=> res!410952 e!363286)))

(assert (=> b!635210 (= res!410952 (or (not (= (select (arr!18335 a!2986) j!136) lt!293572)) (not (= (select (arr!18335 a!2986) j!136) lt!293575)) (bvsge j!136 index!984)))))

(declare-fun b!635211 () Bool)

(declare-fun res!410954 () Bool)

(assert (=> b!635211 (=> (not res!410954) (not e!363285))))

(assert (=> b!635211 (= res!410954 (validKeyInArray!0 k0!1786))))

(declare-fun res!410955 () Bool)

(assert (=> start!57416 (=> (not res!410955) (not e!363285))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57416 (= res!410955 (validMask!0 mask!3053))))

(assert (=> start!57416 e!363285))

(assert (=> start!57416 true))

(declare-fun array_inv!14218 (array!38217) Bool)

(assert (=> start!57416 (array_inv!14218 a!2986)))

(declare-fun b!635200 () Bool)

(declare-fun Unit!21419 () Unit!21416)

(assert (=> b!635200 (= e!363287 Unit!21419)))

(assert (= (and start!57416 res!410955) b!635194))

(assert (= (and b!635194 res!410957) b!635197))

(assert (= (and b!635197 res!410965) b!635211))

(assert (= (and b!635211 res!410954) b!635195))

(assert (= (and b!635195 res!410953) b!635202))

(assert (= (and b!635202 res!410951) b!635203))

(assert (= (and b!635203 res!410958) b!635207))

(assert (= (and b!635207 res!410949) b!635198))

(assert (= (and b!635198 res!410960) b!635205))

(assert (= (and b!635205 res!410964) b!635208))

(assert (= (and b!635208 res!410961) b!635204))

(assert (= (and b!635204 res!410963) b!635206))

(assert (= (and b!635204 c!72489) b!635193))

(assert (= (and b!635204 (not c!72489)) b!635200))

(assert (= (and b!635204 (not res!410956)) b!635201))

(assert (= (and b!635201 res!410962) b!635210))

(assert (= (and b!635210 (not res!410952)) b!635196))

(assert (= (and b!635196 res!410959) b!635199))

(assert (= (and b!635201 (not res!410950)) b!635209))

(declare-fun m!609057 () Bool)

(assert (=> b!635209 m!609057))

(assert (=> b!635209 m!609057))

(declare-fun m!609059 () Bool)

(assert (=> b!635209 m!609059))

(assert (=> b!635209 m!609057))

(declare-fun m!609061 () Bool)

(assert (=> b!635209 m!609061))

(assert (=> b!635210 m!609057))

(declare-fun m!609063 () Bool)

(assert (=> b!635203 m!609063))

(declare-fun m!609065 () Bool)

(assert (=> b!635207 m!609065))

(declare-fun m!609067 () Bool)

(assert (=> b!635204 m!609067))

(declare-fun m!609069 () Bool)

(assert (=> b!635204 m!609069))

(assert (=> b!635204 m!609057))

(declare-fun m!609071 () Bool)

(assert (=> b!635204 m!609071))

(declare-fun m!609073 () Bool)

(assert (=> b!635204 m!609073))

(declare-fun m!609075 () Bool)

(assert (=> b!635204 m!609075))

(declare-fun m!609077 () Bool)

(assert (=> b!635204 m!609077))

(assert (=> b!635204 m!609057))

(declare-fun m!609079 () Bool)

(assert (=> b!635204 m!609079))

(declare-fun m!609081 () Bool)

(assert (=> b!635202 m!609081))

(declare-fun m!609083 () Bool)

(assert (=> b!635211 m!609083))

(declare-fun m!609085 () Bool)

(assert (=> b!635198 m!609085))

(declare-fun m!609087 () Bool)

(assert (=> b!635208 m!609087))

(assert (=> b!635208 m!609057))

(assert (=> b!635208 m!609057))

(declare-fun m!609089 () Bool)

(assert (=> b!635208 m!609089))

(declare-fun m!609091 () Bool)

(assert (=> start!57416 m!609091))

(declare-fun m!609093 () Bool)

(assert (=> start!57416 m!609093))

(assert (=> b!635199 m!609057))

(assert (=> b!635199 m!609057))

(declare-fun m!609095 () Bool)

(assert (=> b!635199 m!609095))

(assert (=> b!635196 m!609057))

(assert (=> b!635196 m!609057))

(declare-fun m!609097 () Bool)

(assert (=> b!635196 m!609097))

(assert (=> b!635205 m!609071))

(declare-fun m!609099 () Bool)

(assert (=> b!635205 m!609099))

(assert (=> b!635201 m!609057))

(assert (=> b!635201 m!609071))

(declare-fun m!609101 () Bool)

(assert (=> b!635201 m!609101))

(declare-fun m!609103 () Bool)

(assert (=> b!635195 m!609103))

(assert (=> b!635197 m!609057))

(assert (=> b!635197 m!609057))

(declare-fun m!609105 () Bool)

(assert (=> b!635197 m!609105))

(check-sat (not b!635208) (not b!635196) (not start!57416) (not b!635211) (not b!635195) (not b!635203) (not b!635199) (not b!635197) (not b!635207) (not b!635204) (not b!635202) (not b!635209))
(check-sat)
