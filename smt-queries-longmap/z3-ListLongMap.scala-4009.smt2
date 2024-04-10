; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54528 () Bool)

(assert start!54528)

(declare-fun b!595585 () Bool)

(declare-fun res!381465 () Bool)

(declare-fun e!340296 () Bool)

(assert (=> b!595585 (=> res!381465 e!340296)))

(declare-datatypes ((List!11799 0))(
  ( (Nil!11796) (Cons!11795 (h!12840 (_ BitVec 64)) (t!18027 List!11799)) )
))
(declare-fun contains!2934 (List!11799 (_ BitVec 64)) Bool)

(assert (=> b!595585 (= res!381465 (contains!2934 Nil!11796 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!595587 () Bool)

(declare-datatypes ((Unit!18710 0))(
  ( (Unit!18711) )
))
(declare-fun e!340294 () Unit!18710)

(declare-fun Unit!18712 () Unit!18710)

(assert (=> b!595587 (= e!340294 Unit!18712)))

(assert (=> b!595587 false))

(declare-fun b!595588 () Bool)

(declare-fun e!340289 () Bool)

(declare-fun e!340292 () Bool)

(assert (=> b!595588 (= e!340289 e!340292)))

(declare-fun res!381448 () Bool)

(assert (=> b!595588 (=> res!381448 e!340292)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!270446 () (_ BitVec 64))

(declare-fun lt!270456 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36988 0))(
  ( (array!36989 (arr!17758 (Array (_ BitVec 32) (_ BitVec 64))) (size!18122 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36988)

(assert (=> b!595588 (= res!381448 (or (not (= (select (arr!17758 a!2986) j!136) lt!270456)) (not (= (select (arr!17758 a!2986) j!136) lt!270446)) (bvsge j!136 index!984)))))

(declare-fun e!340288 () Bool)

(assert (=> b!595588 e!340288))

(declare-fun res!381454 () Bool)

(assert (=> b!595588 (=> (not res!381454) (not e!340288))))

(assert (=> b!595588 (= res!381454 (= lt!270446 (select (arr!17758 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!595588 (= lt!270446 (select (store (arr!17758 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!595589 () Bool)

(declare-fun res!381459 () Bool)

(declare-fun e!340293 () Bool)

(assert (=> b!595589 (=> (not res!381459) (not e!340293))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!595589 (= res!381459 (validKeyInArray!0 (select (arr!17758 a!2986) j!136)))))

(declare-fun b!595590 () Bool)

(declare-fun e!340285 () Bool)

(assert (=> b!595590 (= e!340285 (not e!340289))))

(declare-fun res!381447 () Bool)

(assert (=> b!595590 (=> res!381447 e!340289)))

(declare-datatypes ((SeekEntryResult!6198 0))(
  ( (MissingZero!6198 (index!27040 (_ BitVec 32))) (Found!6198 (index!27041 (_ BitVec 32))) (Intermediate!6198 (undefined!7010 Bool) (index!27042 (_ BitVec 32)) (x!55842 (_ BitVec 32))) (Undefined!6198) (MissingVacant!6198 (index!27043 (_ BitVec 32))) )
))
(declare-fun lt!270449 () SeekEntryResult!6198)

(assert (=> b!595590 (= res!381447 (not (= lt!270449 (Found!6198 index!984))))))

(declare-fun lt!270451 () Unit!18710)

(assert (=> b!595590 (= lt!270451 e!340294)))

(declare-fun c!67436 () Bool)

(assert (=> b!595590 (= c!67436 (= lt!270449 Undefined!6198))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!270448 () array!36988)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36988 (_ BitVec 32)) SeekEntryResult!6198)

(assert (=> b!595590 (= lt!270449 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!270456 lt!270448 mask!3053))))

(declare-fun e!340295 () Bool)

(assert (=> b!595590 e!340295))

(declare-fun res!381453 () Bool)

(assert (=> b!595590 (=> (not res!381453) (not e!340295))))

(declare-fun lt!270452 () SeekEntryResult!6198)

(declare-fun lt!270454 () (_ BitVec 32))

(assert (=> b!595590 (= res!381453 (= lt!270452 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270454 vacantSpotIndex!68 lt!270456 lt!270448 mask!3053)))))

(assert (=> b!595590 (= lt!270452 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270454 vacantSpotIndex!68 (select (arr!17758 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!595590 (= lt!270456 (select (store (arr!17758 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!270447 () Unit!18710)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36988 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18710)

(assert (=> b!595590 (= lt!270447 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!270454 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!595590 (= lt!270454 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!595591 () Bool)

(declare-fun res!381461 () Bool)

(assert (=> b!595591 (=> (not res!381461) (not e!340293))))

(assert (=> b!595591 (= res!381461 (and (= (size!18122 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18122 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18122 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!595592 () Bool)

(declare-fun res!381450 () Bool)

(assert (=> b!595592 (=> res!381450 e!340296)))

(declare-fun noDuplicate!253 (List!11799) Bool)

(assert (=> b!595592 (= res!381450 (not (noDuplicate!253 Nil!11796)))))

(declare-fun b!595593 () Bool)

(declare-fun e!340290 () Bool)

(assert (=> b!595593 (= e!340288 e!340290)))

(declare-fun res!381458 () Bool)

(assert (=> b!595593 (=> res!381458 e!340290)))

(assert (=> b!595593 (= res!381458 (or (not (= (select (arr!17758 a!2986) j!136) lt!270456)) (not (= (select (arr!17758 a!2986) j!136) lt!270446)) (bvsge j!136 index!984)))))

(declare-fun b!595594 () Bool)

(declare-fun res!381462 () Bool)

(assert (=> b!595594 (=> res!381462 e!340296)))

(assert (=> b!595594 (= res!381462 (contains!2934 Nil!11796 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!595595 () Bool)

(assert (=> b!595595 (= e!340296 true)))

(declare-fun lt!270455 () Bool)

(assert (=> b!595595 (= lt!270455 (contains!2934 Nil!11796 k0!1786))))

(declare-fun b!595596 () Bool)

(declare-fun e!340287 () Bool)

(assert (=> b!595596 (= e!340287 e!340285)))

(declare-fun res!381463 () Bool)

(assert (=> b!595596 (=> (not res!381463) (not e!340285))))

(declare-fun lt!270450 () SeekEntryResult!6198)

(assert (=> b!595596 (= res!381463 (and (= lt!270450 (Found!6198 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17758 a!2986) index!984) (select (arr!17758 a!2986) j!136))) (not (= (select (arr!17758 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!595596 (= lt!270450 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17758 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!595597 () Bool)

(declare-fun e!340284 () Bool)

(declare-fun arrayContainsKey!0 (array!36988 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!595597 (= e!340284 (arrayContainsKey!0 lt!270448 (select (arr!17758 a!2986) j!136) index!984))))

(declare-fun b!595598 () Bool)

(declare-fun Unit!18713 () Unit!18710)

(assert (=> b!595598 (= e!340294 Unit!18713)))

(declare-fun b!595599 () Bool)

(declare-fun res!381451 () Bool)

(assert (=> b!595599 (=> (not res!381451) (not e!340293))))

(assert (=> b!595599 (= res!381451 (validKeyInArray!0 k0!1786))))

(declare-fun b!595600 () Bool)

(assert (=> b!595600 (= e!340295 (= lt!270450 lt!270452))))

(declare-fun b!595601 () Bool)

(assert (=> b!595601 (= e!340292 e!340296)))

(declare-fun res!381457 () Bool)

(assert (=> b!595601 (=> res!381457 e!340296)))

(assert (=> b!595601 (= res!381457 (or (bvsge (size!18122 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18122 a!2986))))))

(assert (=> b!595601 (arrayContainsKey!0 lt!270448 (select (arr!17758 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!270453 () Unit!18710)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!36988 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18710)

(assert (=> b!595601 (= lt!270453 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!270448 (select (arr!17758 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!595586 () Bool)

(declare-fun res!381455 () Bool)

(assert (=> b!595586 (=> (not res!381455) (not e!340293))))

(assert (=> b!595586 (= res!381455 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!381467 () Bool)

(assert (=> start!54528 (=> (not res!381467) (not e!340293))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54528 (= res!381467 (validMask!0 mask!3053))))

(assert (=> start!54528 e!340293))

(assert (=> start!54528 true))

(declare-fun array_inv!13554 (array!36988) Bool)

(assert (=> start!54528 (array_inv!13554 a!2986)))

(declare-fun b!595602 () Bool)

(declare-fun res!381460 () Bool)

(declare-fun e!340291 () Bool)

(assert (=> b!595602 (=> (not res!381460) (not e!340291))))

(assert (=> b!595602 (= res!381460 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17758 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!595603 () Bool)

(assert (=> b!595603 (= e!340290 e!340284)))

(declare-fun res!381449 () Bool)

(assert (=> b!595603 (=> (not res!381449) (not e!340284))))

(assert (=> b!595603 (= res!381449 (arrayContainsKey!0 lt!270448 (select (arr!17758 a!2986) j!136) j!136))))

(declare-fun b!595604 () Bool)

(declare-fun res!381464 () Bool)

(assert (=> b!595604 (=> (not res!381464) (not e!340291))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36988 (_ BitVec 32)) Bool)

(assert (=> b!595604 (= res!381464 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!595605 () Bool)

(assert (=> b!595605 (= e!340291 e!340287)))

(declare-fun res!381452 () Bool)

(assert (=> b!595605 (=> (not res!381452) (not e!340287))))

(assert (=> b!595605 (= res!381452 (= (select (store (arr!17758 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!595605 (= lt!270448 (array!36989 (store (arr!17758 a!2986) i!1108 k0!1786) (size!18122 a!2986)))))

(declare-fun b!595606 () Bool)

(assert (=> b!595606 (= e!340293 e!340291)))

(declare-fun res!381456 () Bool)

(assert (=> b!595606 (=> (not res!381456) (not e!340291))))

(declare-fun lt!270457 () SeekEntryResult!6198)

(assert (=> b!595606 (= res!381456 (or (= lt!270457 (MissingZero!6198 i!1108)) (= lt!270457 (MissingVacant!6198 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36988 (_ BitVec 32)) SeekEntryResult!6198)

(assert (=> b!595606 (= lt!270457 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!595607 () Bool)

(declare-fun res!381466 () Bool)

(assert (=> b!595607 (=> (not res!381466) (not e!340291))))

(declare-fun arrayNoDuplicates!0 (array!36988 (_ BitVec 32) List!11799) Bool)

(assert (=> b!595607 (= res!381466 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11796))))

(assert (= (and start!54528 res!381467) b!595591))

(assert (= (and b!595591 res!381461) b!595589))

(assert (= (and b!595589 res!381459) b!595599))

(assert (= (and b!595599 res!381451) b!595586))

(assert (= (and b!595586 res!381455) b!595606))

(assert (= (and b!595606 res!381456) b!595604))

(assert (= (and b!595604 res!381464) b!595607))

(assert (= (and b!595607 res!381466) b!595602))

(assert (= (and b!595602 res!381460) b!595605))

(assert (= (and b!595605 res!381452) b!595596))

(assert (= (and b!595596 res!381463) b!595590))

(assert (= (and b!595590 res!381453) b!595600))

(assert (= (and b!595590 c!67436) b!595587))

(assert (= (and b!595590 (not c!67436)) b!595598))

(assert (= (and b!595590 (not res!381447)) b!595588))

(assert (= (and b!595588 res!381454) b!595593))

(assert (= (and b!595593 (not res!381458)) b!595603))

(assert (= (and b!595603 res!381449) b!595597))

(assert (= (and b!595588 (not res!381448)) b!595601))

(assert (= (and b!595601 (not res!381457)) b!595592))

(assert (= (and b!595592 (not res!381450)) b!595594))

(assert (= (and b!595594 (not res!381462)) b!595585))

(assert (= (and b!595585 (not res!381465)) b!595595))

(declare-fun m!573213 () Bool)

(assert (=> b!595588 m!573213))

(declare-fun m!573215 () Bool)

(assert (=> b!595588 m!573215))

(declare-fun m!573217 () Bool)

(assert (=> b!595588 m!573217))

(declare-fun m!573219 () Bool)

(assert (=> b!595599 m!573219))

(assert (=> b!595593 m!573213))

(declare-fun m!573221 () Bool)

(assert (=> b!595596 m!573221))

(assert (=> b!595596 m!573213))

(assert (=> b!595596 m!573213))

(declare-fun m!573223 () Bool)

(assert (=> b!595596 m!573223))

(declare-fun m!573225 () Bool)

(assert (=> b!595604 m!573225))

(declare-fun m!573227 () Bool)

(assert (=> b!595595 m!573227))

(assert (=> b!595590 m!573215))

(declare-fun m!573229 () Bool)

(assert (=> b!595590 m!573229))

(declare-fun m!573231 () Bool)

(assert (=> b!595590 m!573231))

(assert (=> b!595590 m!573213))

(declare-fun m!573233 () Bool)

(assert (=> b!595590 m!573233))

(declare-fun m!573235 () Bool)

(assert (=> b!595590 m!573235))

(declare-fun m!573237 () Bool)

(assert (=> b!595590 m!573237))

(assert (=> b!595590 m!573213))

(declare-fun m!573239 () Bool)

(assert (=> b!595590 m!573239))

(assert (=> b!595601 m!573213))

(assert (=> b!595601 m!573213))

(declare-fun m!573241 () Bool)

(assert (=> b!595601 m!573241))

(assert (=> b!595601 m!573213))

(declare-fun m!573243 () Bool)

(assert (=> b!595601 m!573243))

(assert (=> b!595603 m!573213))

(assert (=> b!595603 m!573213))

(declare-fun m!573245 () Bool)

(assert (=> b!595603 m!573245))

(declare-fun m!573247 () Bool)

(assert (=> b!595594 m!573247))

(assert (=> b!595589 m!573213))

(assert (=> b!595589 m!573213))

(declare-fun m!573249 () Bool)

(assert (=> b!595589 m!573249))

(declare-fun m!573251 () Bool)

(assert (=> b!595607 m!573251))

(declare-fun m!573253 () Bool)

(assert (=> start!54528 m!573253))

(declare-fun m!573255 () Bool)

(assert (=> start!54528 m!573255))

(declare-fun m!573257 () Bool)

(assert (=> b!595586 m!573257))

(declare-fun m!573259 () Bool)

(assert (=> b!595585 m!573259))

(assert (=> b!595605 m!573215))

(declare-fun m!573261 () Bool)

(assert (=> b!595605 m!573261))

(assert (=> b!595597 m!573213))

(assert (=> b!595597 m!573213))

(declare-fun m!573263 () Bool)

(assert (=> b!595597 m!573263))

(declare-fun m!573265 () Bool)

(assert (=> b!595606 m!573265))

(declare-fun m!573267 () Bool)

(assert (=> b!595592 m!573267))

(declare-fun m!573269 () Bool)

(assert (=> b!595602 m!573269))

(check-sat (not b!595606) (not start!54528) (not b!595586) (not b!595597) (not b!595592) (not b!595596) (not b!595594) (not b!595599) (not b!595601) (not b!595585) (not b!595595) (not b!595590) (not b!595589) (not b!595603) (not b!595604) (not b!595607))
(check-sat)
