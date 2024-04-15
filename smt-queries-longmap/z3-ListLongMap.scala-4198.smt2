; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57326 () Bool)

(assert start!57326)

(declare-fun b!634228 () Bool)

(declare-fun e!362667 () Bool)

(assert (=> b!634228 (= e!362667 true)))

(declare-fun e!362672 () Bool)

(assert (=> b!634228 e!362672))

(declare-fun res!410263 () Bool)

(assert (=> b!634228 (=> (not res!410263) (not e!362672))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!293070 () (_ BitVec 64))

(declare-datatypes ((array!38190 0))(
  ( (array!38191 (arr!18323 (Array (_ BitVec 32) (_ BitVec 64))) (size!18688 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38190)

(assert (=> b!634228 (= res!410263 (= lt!293070 (select (arr!18323 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!634228 (= lt!293070 (select (store (arr!18323 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!634229 () Bool)

(declare-fun e!362671 () Bool)

(assert (=> b!634229 (= e!362672 e!362671)))

(declare-fun res!410255 () Bool)

(assert (=> b!634229 (=> res!410255 e!362671)))

(declare-fun lt!293065 () (_ BitVec 64))

(assert (=> b!634229 (= res!410255 (or (not (= (select (arr!18323 a!2986) j!136) lt!293065)) (not (= (select (arr!18323 a!2986) j!136) lt!293070)) (bvsge j!136 index!984)))))

(declare-fun res!410258 () Bool)

(declare-fun e!362675 () Bool)

(assert (=> start!57326 (=> (not res!410258) (not e!362675))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57326 (= res!410258 (validMask!0 mask!3053))))

(assert (=> start!57326 e!362675))

(assert (=> start!57326 true))

(declare-fun array_inv!14206 (array!38190) Bool)

(assert (=> start!57326 (array_inv!14206 a!2986)))

(declare-fun b!634230 () Bool)

(declare-fun res!410261 () Bool)

(declare-fun e!362668 () Bool)

(assert (=> b!634230 (=> (not res!410261) (not e!362668))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!634230 (= res!410261 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18323 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!634231 () Bool)

(declare-fun e!362670 () Bool)

(assert (=> b!634231 (= e!362668 e!362670)))

(declare-fun res!410264 () Bool)

(assert (=> b!634231 (=> (not res!410264) (not e!362670))))

(assert (=> b!634231 (= res!410264 (= (select (store (arr!18323 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!293071 () array!38190)

(assert (=> b!634231 (= lt!293071 (array!38191 (store (arr!18323 a!2986) i!1108 k0!1786) (size!18688 a!2986)))))

(declare-fun b!634232 () Bool)

(declare-fun res!410254 () Bool)

(assert (=> b!634232 (=> (not res!410254) (not e!362675))))

(declare-fun arrayContainsKey!0 (array!38190 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!634232 (= res!410254 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!634233 () Bool)

(declare-fun e!362669 () Bool)

(assert (=> b!634233 (= e!362671 e!362669)))

(declare-fun res!410262 () Bool)

(assert (=> b!634233 (=> (not res!410262) (not e!362669))))

(assert (=> b!634233 (= res!410262 (arrayContainsKey!0 lt!293071 (select (arr!18323 a!2986) j!136) j!136))))

(declare-fun b!634234 () Bool)

(assert (=> b!634234 (= e!362675 e!362668)))

(declare-fun res!410260 () Bool)

(assert (=> b!634234 (=> (not res!410260) (not e!362668))))

(declare-datatypes ((SeekEntryResult!6760 0))(
  ( (MissingZero!6760 (index!29342 (_ BitVec 32))) (Found!6760 (index!29343 (_ BitVec 32))) (Intermediate!6760 (undefined!7572 Bool) (index!29344 (_ BitVec 32)) (x!58097 (_ BitVec 32))) (Undefined!6760) (MissingVacant!6760 (index!29345 (_ BitVec 32))) )
))
(declare-fun lt!293069 () SeekEntryResult!6760)

(assert (=> b!634234 (= res!410260 (or (= lt!293069 (MissingZero!6760 i!1108)) (= lt!293069 (MissingVacant!6760 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38190 (_ BitVec 32)) SeekEntryResult!6760)

(assert (=> b!634234 (= lt!293069 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!634235 () Bool)

(declare-fun res!410265 () Bool)

(assert (=> b!634235 (=> (not res!410265) (not e!362675))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!634235 (= res!410265 (validKeyInArray!0 (select (arr!18323 a!2986) j!136)))))

(declare-fun b!634236 () Bool)

(declare-fun e!362665 () Bool)

(assert (=> b!634236 (= e!362665 (not e!362667))))

(declare-fun res!410257 () Bool)

(assert (=> b!634236 (=> res!410257 e!362667)))

(declare-fun lt!293066 () SeekEntryResult!6760)

(assert (=> b!634236 (= res!410257 (not (= lt!293066 (Found!6760 index!984))))))

(declare-datatypes ((Unit!21368 0))(
  ( (Unit!21369) )
))
(declare-fun lt!293073 () Unit!21368)

(declare-fun e!362666 () Unit!21368)

(assert (=> b!634236 (= lt!293073 e!362666)))

(declare-fun c!72354 () Bool)

(assert (=> b!634236 (= c!72354 (= lt!293066 Undefined!6760))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38190 (_ BitVec 32)) SeekEntryResult!6760)

(assert (=> b!634236 (= lt!293066 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!293065 lt!293071 mask!3053))))

(declare-fun e!362674 () Bool)

(assert (=> b!634236 e!362674))

(declare-fun res!410266 () Bool)

(assert (=> b!634236 (=> (not res!410266) (not e!362674))))

(declare-fun lt!293064 () SeekEntryResult!6760)

(declare-fun lt!293068 () (_ BitVec 32))

(assert (=> b!634236 (= res!410266 (= lt!293064 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293068 vacantSpotIndex!68 lt!293065 lt!293071 mask!3053)))))

(assert (=> b!634236 (= lt!293064 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293068 vacantSpotIndex!68 (select (arr!18323 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!634236 (= lt!293065 (select (store (arr!18323 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!293067 () Unit!21368)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38190 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21368)

(assert (=> b!634236 (= lt!293067 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!293068 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!634236 (= lt!293068 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!634237 () Bool)

(declare-fun lt!293072 () SeekEntryResult!6760)

(assert (=> b!634237 (= e!362674 (= lt!293072 lt!293064))))

(declare-fun b!634238 () Bool)

(declare-fun res!410268 () Bool)

(assert (=> b!634238 (=> (not res!410268) (not e!362668))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38190 (_ BitVec 32)) Bool)

(assert (=> b!634238 (= res!410268 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!634239 () Bool)

(declare-fun res!410267 () Bool)

(assert (=> b!634239 (=> (not res!410267) (not e!362668))))

(declare-datatypes ((List!12403 0))(
  ( (Nil!12400) (Cons!12399 (h!13444 (_ BitVec 64)) (t!18622 List!12403)) )
))
(declare-fun arrayNoDuplicates!0 (array!38190 (_ BitVec 32) List!12403) Bool)

(assert (=> b!634239 (= res!410267 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12400))))

(declare-fun b!634240 () Bool)

(assert (=> b!634240 (= e!362670 e!362665)))

(declare-fun res!410269 () Bool)

(assert (=> b!634240 (=> (not res!410269) (not e!362665))))

(assert (=> b!634240 (= res!410269 (and (= lt!293072 (Found!6760 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18323 a!2986) index!984) (select (arr!18323 a!2986) j!136))) (not (= (select (arr!18323 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!634240 (= lt!293072 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18323 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!634241 () Bool)

(declare-fun res!410256 () Bool)

(assert (=> b!634241 (=> (not res!410256) (not e!362675))))

(assert (=> b!634241 (= res!410256 (and (= (size!18688 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18688 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18688 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!634242 () Bool)

(declare-fun Unit!21370 () Unit!21368)

(assert (=> b!634242 (= e!362666 Unit!21370)))

(assert (=> b!634242 false))

(declare-fun b!634243 () Bool)

(declare-fun res!410259 () Bool)

(assert (=> b!634243 (=> (not res!410259) (not e!362675))))

(assert (=> b!634243 (= res!410259 (validKeyInArray!0 k0!1786))))

(declare-fun b!634244 () Bool)

(assert (=> b!634244 (= e!362669 (arrayContainsKey!0 lt!293071 (select (arr!18323 a!2986) j!136) index!984))))

(declare-fun b!634245 () Bool)

(declare-fun Unit!21371 () Unit!21368)

(assert (=> b!634245 (= e!362666 Unit!21371)))

(assert (= (and start!57326 res!410258) b!634241))

(assert (= (and b!634241 res!410256) b!634235))

(assert (= (and b!634235 res!410265) b!634243))

(assert (= (and b!634243 res!410259) b!634232))

(assert (= (and b!634232 res!410254) b!634234))

(assert (= (and b!634234 res!410260) b!634238))

(assert (= (and b!634238 res!410268) b!634239))

(assert (= (and b!634239 res!410267) b!634230))

(assert (= (and b!634230 res!410261) b!634231))

(assert (= (and b!634231 res!410264) b!634240))

(assert (= (and b!634240 res!410269) b!634236))

(assert (= (and b!634236 res!410266) b!634237))

(assert (= (and b!634236 c!72354) b!634242))

(assert (= (and b!634236 (not c!72354)) b!634245))

(assert (= (and b!634236 (not res!410257)) b!634228))

(assert (= (and b!634228 res!410263) b!634229))

(assert (= (and b!634229 (not res!410255)) b!634233))

(assert (= (and b!634233 res!410262) b!634244))

(declare-fun m!608223 () Bool)

(assert (=> b!634243 m!608223))

(declare-fun m!608225 () Bool)

(assert (=> b!634244 m!608225))

(assert (=> b!634244 m!608225))

(declare-fun m!608227 () Bool)

(assert (=> b!634244 m!608227))

(declare-fun m!608229 () Bool)

(assert (=> b!634240 m!608229))

(assert (=> b!634240 m!608225))

(assert (=> b!634240 m!608225))

(declare-fun m!608231 () Bool)

(assert (=> b!634240 m!608231))

(declare-fun m!608233 () Bool)

(assert (=> start!57326 m!608233))

(declare-fun m!608235 () Bool)

(assert (=> start!57326 m!608235))

(assert (=> b!634235 m!608225))

(assert (=> b!634235 m!608225))

(declare-fun m!608237 () Bool)

(assert (=> b!634235 m!608237))

(assert (=> b!634229 m!608225))

(declare-fun m!608239 () Bool)

(assert (=> b!634230 m!608239))

(assert (=> b!634228 m!608225))

(declare-fun m!608241 () Bool)

(assert (=> b!634228 m!608241))

(declare-fun m!608243 () Bool)

(assert (=> b!634228 m!608243))

(declare-fun m!608245 () Bool)

(assert (=> b!634232 m!608245))

(declare-fun m!608247 () Bool)

(assert (=> b!634236 m!608247))

(declare-fun m!608249 () Bool)

(assert (=> b!634236 m!608249))

(assert (=> b!634236 m!608225))

(assert (=> b!634236 m!608241))

(declare-fun m!608251 () Bool)

(assert (=> b!634236 m!608251))

(assert (=> b!634236 m!608225))

(declare-fun m!608253 () Bool)

(assert (=> b!634236 m!608253))

(declare-fun m!608255 () Bool)

(assert (=> b!634236 m!608255))

(declare-fun m!608257 () Bool)

(assert (=> b!634236 m!608257))

(assert (=> b!634233 m!608225))

(assert (=> b!634233 m!608225))

(declare-fun m!608259 () Bool)

(assert (=> b!634233 m!608259))

(declare-fun m!608261 () Bool)

(assert (=> b!634239 m!608261))

(assert (=> b!634231 m!608241))

(declare-fun m!608263 () Bool)

(assert (=> b!634231 m!608263))

(declare-fun m!608265 () Bool)

(assert (=> b!634234 m!608265))

(declare-fun m!608267 () Bool)

(assert (=> b!634238 m!608267))

(check-sat (not b!634239) (not b!634235) (not start!57326) (not b!634244) (not b!634238) (not b!634236) (not b!634243) (not b!634234) (not b!634240) (not b!634232) (not b!634233))
(check-sat)
