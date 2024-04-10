; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54522 () Bool)

(assert start!54522)

(declare-fun b!595378 () Bool)

(declare-fun res!381271 () Bool)

(declare-fun e!340168 () Bool)

(assert (=> b!595378 (=> (not res!381271) (not e!340168))))

(declare-datatypes ((array!36982 0))(
  ( (array!36983 (arr!17755 (Array (_ BitVec 32) (_ BitVec 64))) (size!18119 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36982)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36982 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!595378 (= res!381271 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!595379 () Bool)

(declare-fun e!340170 () Bool)

(declare-fun e!340167 () Bool)

(assert (=> b!595379 (= e!340170 e!340167)))

(declare-fun res!381277 () Bool)

(assert (=> b!595379 (=> res!381277 e!340167)))

(declare-fun lt!270339 () (_ BitVec 64))

(declare-fun lt!270338 () (_ BitVec 64))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!595379 (= res!381277 (or (not (= (select (arr!17755 a!2986) j!136) lt!270338)) (not (= (select (arr!17755 a!2986) j!136) lt!270339)) (bvsge j!136 index!984)))))

(declare-fun e!340171 () Bool)

(assert (=> b!595379 e!340171))

(declare-fun res!381265 () Bool)

(assert (=> b!595379 (=> (not res!381265) (not e!340171))))

(assert (=> b!595379 (= res!381265 (= lt!270339 (select (arr!17755 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!595379 (= lt!270339 (select (store (arr!17755 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!595380 () Bool)

(declare-fun res!381262 () Bool)

(declare-fun e!340173 () Bool)

(assert (=> b!595380 (=> res!381262 e!340173)))

(declare-datatypes ((List!11796 0))(
  ( (Nil!11793) (Cons!11792 (h!12837 (_ BitVec 64)) (t!18024 List!11796)) )
))
(declare-fun contains!2931 (List!11796 (_ BitVec 64)) Bool)

(assert (=> b!595380 (= res!381262 (contains!2931 Nil!11793 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!595381 () Bool)

(declare-fun res!381270 () Bool)

(declare-fun e!340169 () Bool)

(assert (=> b!595381 (=> (not res!381270) (not e!340169))))

(declare-fun arrayNoDuplicates!0 (array!36982 (_ BitVec 32) List!11796) Bool)

(assert (=> b!595381 (= res!381270 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11793))))

(declare-fun b!595382 () Bool)

(declare-datatypes ((Unit!18698 0))(
  ( (Unit!18699) )
))
(declare-fun e!340174 () Unit!18698)

(declare-fun Unit!18700 () Unit!18698)

(assert (=> b!595382 (= e!340174 Unit!18700)))

(declare-fun b!595384 () Bool)

(declare-fun Unit!18701 () Unit!18698)

(assert (=> b!595384 (= e!340174 Unit!18701)))

(assert (=> b!595384 false))

(declare-fun b!595385 () Bool)

(declare-fun res!381266 () Bool)

(assert (=> b!595385 (=> (not res!381266) (not e!340168))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!595385 (= res!381266 (validKeyInArray!0 k0!1786))))

(declare-fun b!595386 () Bool)

(declare-fun res!381272 () Bool)

(assert (=> b!595386 (=> res!381272 e!340173)))

(assert (=> b!595386 (= res!381272 (contains!2931 Nil!11793 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!595387 () Bool)

(assert (=> b!595387 (= e!340167 e!340173)))

(declare-fun res!381264 () Bool)

(assert (=> b!595387 (=> res!381264 e!340173)))

(assert (=> b!595387 (= res!381264 (or (bvsge (size!18119 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18119 a!2986))))))

(declare-fun lt!270348 () array!36982)

(assert (=> b!595387 (arrayContainsKey!0 lt!270348 (select (arr!17755 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!270340 () Unit!18698)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!36982 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18698)

(assert (=> b!595387 (= lt!270340 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!270348 (select (arr!17755 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!595388 () Bool)

(declare-fun e!340179 () Bool)

(assert (=> b!595388 (= e!340179 (not e!340170))))

(declare-fun res!381258 () Bool)

(assert (=> b!595388 (=> res!381258 e!340170)))

(declare-datatypes ((SeekEntryResult!6195 0))(
  ( (MissingZero!6195 (index!27028 (_ BitVec 32))) (Found!6195 (index!27029 (_ BitVec 32))) (Intermediate!6195 (undefined!7007 Bool) (index!27030 (_ BitVec 32)) (x!55831 (_ BitVec 32))) (Undefined!6195) (MissingVacant!6195 (index!27031 (_ BitVec 32))) )
))
(declare-fun lt!270344 () SeekEntryResult!6195)

(assert (=> b!595388 (= res!381258 (not (= lt!270344 (Found!6195 index!984))))))

(declare-fun lt!270347 () Unit!18698)

(assert (=> b!595388 (= lt!270347 e!340174)))

(declare-fun c!67427 () Bool)

(assert (=> b!595388 (= c!67427 (= lt!270344 Undefined!6195))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36982 (_ BitVec 32)) SeekEntryResult!6195)

(assert (=> b!595388 (= lt!270344 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!270338 lt!270348 mask!3053))))

(declare-fun e!340178 () Bool)

(assert (=> b!595388 e!340178))

(declare-fun res!381275 () Bool)

(assert (=> b!595388 (=> (not res!381275) (not e!340178))))

(declare-fun lt!270342 () SeekEntryResult!6195)

(declare-fun lt!270343 () (_ BitVec 32))

(assert (=> b!595388 (= res!381275 (= lt!270342 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270343 vacantSpotIndex!68 lt!270338 lt!270348 mask!3053)))))

(assert (=> b!595388 (= lt!270342 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270343 vacantSpotIndex!68 (select (arr!17755 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!595388 (= lt!270338 (select (store (arr!17755 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!270341 () Unit!18698)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36982 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18698)

(assert (=> b!595388 (= lt!270341 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!270343 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!595388 (= lt!270343 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!595389 () Bool)

(declare-fun e!340175 () Bool)

(declare-fun e!340176 () Bool)

(assert (=> b!595389 (= e!340175 e!340176)))

(declare-fun res!381261 () Bool)

(assert (=> b!595389 (=> (not res!381261) (not e!340176))))

(assert (=> b!595389 (= res!381261 (arrayContainsKey!0 lt!270348 (select (arr!17755 a!2986) j!136) j!136))))

(declare-fun b!595390 () Bool)

(declare-fun res!381260 () Bool)

(assert (=> b!595390 (=> (not res!381260) (not e!340169))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36982 (_ BitVec 32)) Bool)

(assert (=> b!595390 (= res!381260 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!595391 () Bool)

(declare-fun e!340172 () Bool)

(assert (=> b!595391 (= e!340169 e!340172)))

(declare-fun res!381268 () Bool)

(assert (=> b!595391 (=> (not res!381268) (not e!340172))))

(assert (=> b!595391 (= res!381268 (= (select (store (arr!17755 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!595391 (= lt!270348 (array!36983 (store (arr!17755 a!2986) i!1108 k0!1786) (size!18119 a!2986)))))

(declare-fun b!595392 () Bool)

(declare-fun res!381278 () Bool)

(assert (=> b!595392 (=> (not res!381278) (not e!340168))))

(assert (=> b!595392 (= res!381278 (validKeyInArray!0 (select (arr!17755 a!2986) j!136)))))

(declare-fun b!595393 () Bool)

(declare-fun res!381259 () Bool)

(assert (=> b!595393 (=> (not res!381259) (not e!340169))))

(assert (=> b!595393 (= res!381259 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17755 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!595394 () Bool)

(assert (=> b!595394 (= e!340173 true)))

(declare-fun lt!270349 () Bool)

(assert (=> b!595394 (= lt!270349 (contains!2931 Nil!11793 k0!1786))))

(declare-fun res!381274 () Bool)

(assert (=> start!54522 (=> (not res!381274) (not e!340168))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54522 (= res!381274 (validMask!0 mask!3053))))

(assert (=> start!54522 e!340168))

(assert (=> start!54522 true))

(declare-fun array_inv!13551 (array!36982) Bool)

(assert (=> start!54522 (array_inv!13551 a!2986)))

(declare-fun b!595383 () Bool)

(declare-fun res!381267 () Bool)

(assert (=> b!595383 (=> (not res!381267) (not e!340168))))

(assert (=> b!595383 (= res!381267 (and (= (size!18119 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18119 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18119 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!595395 () Bool)

(assert (=> b!595395 (= e!340172 e!340179)))

(declare-fun res!381276 () Bool)

(assert (=> b!595395 (=> (not res!381276) (not e!340179))))

(declare-fun lt!270345 () SeekEntryResult!6195)

(assert (=> b!595395 (= res!381276 (and (= lt!270345 (Found!6195 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17755 a!2986) index!984) (select (arr!17755 a!2986) j!136))) (not (= (select (arr!17755 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!595395 (= lt!270345 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17755 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!595396 () Bool)

(assert (=> b!595396 (= e!340178 (= lt!270345 lt!270342))))

(declare-fun b!595397 () Bool)

(assert (=> b!595397 (= e!340176 (arrayContainsKey!0 lt!270348 (select (arr!17755 a!2986) j!136) index!984))))

(declare-fun b!595398 () Bool)

(assert (=> b!595398 (= e!340171 e!340175)))

(declare-fun res!381269 () Bool)

(assert (=> b!595398 (=> res!381269 e!340175)))

(assert (=> b!595398 (= res!381269 (or (not (= (select (arr!17755 a!2986) j!136) lt!270338)) (not (= (select (arr!17755 a!2986) j!136) lt!270339)) (bvsge j!136 index!984)))))

(declare-fun b!595399 () Bool)

(assert (=> b!595399 (= e!340168 e!340169)))

(declare-fun res!381263 () Bool)

(assert (=> b!595399 (=> (not res!381263) (not e!340169))))

(declare-fun lt!270346 () SeekEntryResult!6195)

(assert (=> b!595399 (= res!381263 (or (= lt!270346 (MissingZero!6195 i!1108)) (= lt!270346 (MissingVacant!6195 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36982 (_ BitVec 32)) SeekEntryResult!6195)

(assert (=> b!595399 (= lt!270346 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!595400 () Bool)

(declare-fun res!381273 () Bool)

(assert (=> b!595400 (=> res!381273 e!340173)))

(declare-fun noDuplicate!250 (List!11796) Bool)

(assert (=> b!595400 (= res!381273 (not (noDuplicate!250 Nil!11793)))))

(assert (= (and start!54522 res!381274) b!595383))

(assert (= (and b!595383 res!381267) b!595392))

(assert (= (and b!595392 res!381278) b!595385))

(assert (= (and b!595385 res!381266) b!595378))

(assert (= (and b!595378 res!381271) b!595399))

(assert (= (and b!595399 res!381263) b!595390))

(assert (= (and b!595390 res!381260) b!595381))

(assert (= (and b!595381 res!381270) b!595393))

(assert (= (and b!595393 res!381259) b!595391))

(assert (= (and b!595391 res!381268) b!595395))

(assert (= (and b!595395 res!381276) b!595388))

(assert (= (and b!595388 res!381275) b!595396))

(assert (= (and b!595388 c!67427) b!595384))

(assert (= (and b!595388 (not c!67427)) b!595382))

(assert (= (and b!595388 (not res!381258)) b!595379))

(assert (= (and b!595379 res!381265) b!595398))

(assert (= (and b!595398 (not res!381269)) b!595389))

(assert (= (and b!595389 res!381261) b!595397))

(assert (= (and b!595379 (not res!381277)) b!595387))

(assert (= (and b!595387 (not res!381264)) b!595400))

(assert (= (and b!595400 (not res!381273)) b!595386))

(assert (= (and b!595386 (not res!381272)) b!595380))

(assert (= (and b!595380 (not res!381262)) b!595394))

(declare-fun m!573039 () Bool)

(assert (=> b!595381 m!573039))

(declare-fun m!573041 () Bool)

(assert (=> b!595387 m!573041))

(assert (=> b!595387 m!573041))

(declare-fun m!573043 () Bool)

(assert (=> b!595387 m!573043))

(assert (=> b!595387 m!573041))

(declare-fun m!573045 () Bool)

(assert (=> b!595387 m!573045))

(assert (=> b!595389 m!573041))

(assert (=> b!595389 m!573041))

(declare-fun m!573047 () Bool)

(assert (=> b!595389 m!573047))

(assert (=> b!595392 m!573041))

(assert (=> b!595392 m!573041))

(declare-fun m!573049 () Bool)

(assert (=> b!595392 m!573049))

(assert (=> b!595379 m!573041))

(declare-fun m!573051 () Bool)

(assert (=> b!595379 m!573051))

(declare-fun m!573053 () Bool)

(assert (=> b!595379 m!573053))

(declare-fun m!573055 () Bool)

(assert (=> b!595378 m!573055))

(declare-fun m!573057 () Bool)

(assert (=> b!595385 m!573057))

(declare-fun m!573059 () Bool)

(assert (=> b!595394 m!573059))

(assert (=> b!595391 m!573051))

(declare-fun m!573061 () Bool)

(assert (=> b!595391 m!573061))

(declare-fun m!573063 () Bool)

(assert (=> start!54522 m!573063))

(declare-fun m!573065 () Bool)

(assert (=> start!54522 m!573065))

(declare-fun m!573067 () Bool)

(assert (=> b!595386 m!573067))

(declare-fun m!573069 () Bool)

(assert (=> b!595400 m!573069))

(declare-fun m!573071 () Bool)

(assert (=> b!595388 m!573071))

(declare-fun m!573073 () Bool)

(assert (=> b!595388 m!573073))

(declare-fun m!573075 () Bool)

(assert (=> b!595388 m!573075))

(declare-fun m!573077 () Bool)

(assert (=> b!595388 m!573077))

(assert (=> b!595388 m!573051))

(declare-fun m!573079 () Bool)

(assert (=> b!595388 m!573079))

(assert (=> b!595388 m!573041))

(declare-fun m!573081 () Bool)

(assert (=> b!595388 m!573081))

(assert (=> b!595388 m!573041))

(declare-fun m!573083 () Bool)

(assert (=> b!595395 m!573083))

(assert (=> b!595395 m!573041))

(assert (=> b!595395 m!573041))

(declare-fun m!573085 () Bool)

(assert (=> b!595395 m!573085))

(assert (=> b!595398 m!573041))

(declare-fun m!573087 () Bool)

(assert (=> b!595393 m!573087))

(declare-fun m!573089 () Bool)

(assert (=> b!595380 m!573089))

(declare-fun m!573091 () Bool)

(assert (=> b!595399 m!573091))

(declare-fun m!573093 () Bool)

(assert (=> b!595390 m!573093))

(assert (=> b!595397 m!573041))

(assert (=> b!595397 m!573041))

(declare-fun m!573095 () Bool)

(assert (=> b!595397 m!573095))

(check-sat (not b!595386) (not b!595394) (not b!595380) (not b!595378) (not b!595395) (not b!595392) (not b!595389) (not b!595385) (not b!595399) (not b!595388) (not b!595390) (not b!595381) (not b!595397) (not b!595400) (not b!595387) (not start!54522))
(check-sat)
