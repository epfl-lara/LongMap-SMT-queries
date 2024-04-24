; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57486 () Bool)

(assert start!57486)

(declare-fun b!635713 () Bool)

(declare-fun res!411200 () Bool)

(declare-fun e!363620 () Bool)

(assert (=> b!635713 (=> (not res!411200) (not e!363620))))

(declare-datatypes ((array!38214 0))(
  ( (array!38215 (arr!18331 (Array (_ BitVec 32) (_ BitVec 64))) (size!18695 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38214)

(declare-datatypes ((List!12279 0))(
  ( (Nil!12276) (Cons!12275 (h!13323 (_ BitVec 64)) (t!18499 List!12279)) )
))
(declare-fun arrayNoDuplicates!0 (array!38214 (_ BitVec 32) List!12279) Bool)

(assert (=> b!635713 (= res!411200 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12276))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun b!635714 () Bool)

(declare-fun e!363619 () Bool)

(declare-fun lt!293934 () array!38214)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!38214 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!635714 (= e!363619 (arrayContainsKey!0 lt!293934 (select (arr!18331 a!2986) j!136) index!984))))

(declare-fun b!635716 () Bool)

(declare-datatypes ((Unit!21417 0))(
  ( (Unit!21418) )
))
(declare-fun e!363616 () Unit!21417)

(declare-fun Unit!21419 () Unit!21417)

(assert (=> b!635716 (= e!363616 Unit!21419)))

(declare-fun b!635717 () Bool)

(declare-fun Unit!21420 () Unit!21417)

(assert (=> b!635717 (= e!363616 Unit!21420)))

(assert (=> b!635717 false))

(declare-fun b!635718 () Bool)

(declare-fun res!411214 () Bool)

(declare-fun e!363610 () Bool)

(assert (=> b!635718 (=> (not res!411214) (not e!363610))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!635718 (= res!411214 (and (= (size!18695 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18695 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18695 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!635719 () Bool)

(declare-fun e!363617 () Bool)

(declare-fun e!363611 () Bool)

(assert (=> b!635719 (= e!363617 e!363611)))

(declare-fun res!411199 () Bool)

(assert (=> b!635719 (=> res!411199 e!363611)))

(declare-fun lt!293933 () (_ BitVec 64))

(declare-fun lt!293931 () (_ BitVec 64))

(assert (=> b!635719 (= res!411199 (or (not (= (select (arr!18331 a!2986) j!136) lt!293933)) (not (= (select (arr!18331 a!2986) j!136) lt!293931)) (bvsge j!136 index!984)))))

(declare-fun b!635720 () Bool)

(declare-fun res!411208 () Bool)

(assert (=> b!635720 (=> (not res!411208) (not e!363620))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!635720 (= res!411208 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18331 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!635721 () Bool)

(declare-fun res!411198 () Bool)

(assert (=> b!635721 (=> (not res!411198) (not e!363620))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38214 (_ BitVec 32)) Bool)

(assert (=> b!635721 (= res!411198 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!635722 () Bool)

(declare-fun e!363612 () Bool)

(declare-fun e!363621 () Bool)

(assert (=> b!635722 (= e!363612 (not e!363621))))

(declare-fun res!411205 () Bool)

(assert (=> b!635722 (=> res!411205 e!363621)))

(declare-datatypes ((SeekEntryResult!6727 0))(
  ( (MissingZero!6727 (index!29213 (_ BitVec 32))) (Found!6727 (index!29214 (_ BitVec 32))) (Intermediate!6727 (undefined!7539 Bool) (index!29215 (_ BitVec 32)) (x!58113 (_ BitVec 32))) (Undefined!6727) (MissingVacant!6727 (index!29216 (_ BitVec 32))) )
))
(declare-fun lt!293929 () SeekEntryResult!6727)

(assert (=> b!635722 (= res!411205 (not (= lt!293929 (Found!6727 index!984))))))

(declare-fun lt!293932 () Unit!21417)

(assert (=> b!635722 (= lt!293932 e!363616)))

(declare-fun c!72626 () Bool)

(assert (=> b!635722 (= c!72626 (= lt!293929 Undefined!6727))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38214 (_ BitVec 32)) SeekEntryResult!6727)

(assert (=> b!635722 (= lt!293929 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!293933 lt!293934 mask!3053))))

(declare-fun e!363618 () Bool)

(assert (=> b!635722 e!363618))

(declare-fun res!411213 () Bool)

(assert (=> b!635722 (=> (not res!411213) (not e!363618))))

(declare-fun lt!293935 () SeekEntryResult!6727)

(declare-fun lt!293936 () (_ BitVec 32))

(assert (=> b!635722 (= res!411213 (= lt!293935 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293936 vacantSpotIndex!68 lt!293933 lt!293934 mask!3053)))))

(assert (=> b!635722 (= lt!293935 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293936 vacantSpotIndex!68 (select (arr!18331 a!2986) j!136) a!2986 mask!3053))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!635722 (= lt!293933 (select (store (arr!18331 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!293938 () Unit!21417)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38214 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21417)

(assert (=> b!635722 (= lt!293938 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!293936 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!635722 (= lt!293936 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!635723 () Bool)

(declare-fun e!363615 () Bool)

(assert (=> b!635723 (= e!363620 e!363615)))

(declare-fun res!411211 () Bool)

(assert (=> b!635723 (=> (not res!411211) (not e!363615))))

(assert (=> b!635723 (= res!411211 (= (select (store (arr!18331 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!635723 (= lt!293934 (array!38215 (store (arr!18331 a!2986) i!1108 k0!1786) (size!18695 a!2986)))))

(declare-fun b!635724 () Bool)

(declare-fun res!411203 () Bool)

(assert (=> b!635724 (=> (not res!411203) (not e!363610))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!635724 (= res!411203 (validKeyInArray!0 k0!1786))))

(declare-fun b!635725 () Bool)

(assert (=> b!635725 (= e!363615 e!363612)))

(declare-fun res!411207 () Bool)

(assert (=> b!635725 (=> (not res!411207) (not e!363612))))

(declare-fun lt!293930 () SeekEntryResult!6727)

(assert (=> b!635725 (= res!411207 (and (= lt!293930 (Found!6727 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18331 a!2986) index!984) (select (arr!18331 a!2986) j!136))) (not (= (select (arr!18331 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!635725 (= lt!293930 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18331 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!411202 () Bool)

(assert (=> start!57486 (=> (not res!411202) (not e!363610))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57486 (= res!411202 (validMask!0 mask!3053))))

(assert (=> start!57486 e!363610))

(assert (=> start!57486 true))

(declare-fun array_inv!14190 (array!38214) Bool)

(assert (=> start!57486 (array_inv!14190 a!2986)))

(declare-fun b!635715 () Bool)

(declare-fun e!363613 () Bool)

(assert (=> b!635715 (= e!363613 true)))

(assert (=> b!635715 (arrayContainsKey!0 lt!293934 (select (arr!18331 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!293928 () Unit!21417)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38214 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21417)

(assert (=> b!635715 (= lt!293928 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!293934 (select (arr!18331 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!635726 () Bool)

(assert (=> b!635726 (= e!363611 e!363619)))

(declare-fun res!411209 () Bool)

(assert (=> b!635726 (=> (not res!411209) (not e!363619))))

(assert (=> b!635726 (= res!411209 (arrayContainsKey!0 lt!293934 (select (arr!18331 a!2986) j!136) j!136))))

(declare-fun b!635727 () Bool)

(assert (=> b!635727 (= e!363621 e!363613)))

(declare-fun res!411201 () Bool)

(assert (=> b!635727 (=> res!411201 e!363613)))

(assert (=> b!635727 (= res!411201 (or (not (= (select (arr!18331 a!2986) j!136) lt!293933)) (not (= (select (arr!18331 a!2986) j!136) lt!293931)) (bvsge j!136 index!984)))))

(assert (=> b!635727 e!363617))

(declare-fun res!411212 () Bool)

(assert (=> b!635727 (=> (not res!411212) (not e!363617))))

(assert (=> b!635727 (= res!411212 (= lt!293931 (select (arr!18331 a!2986) j!136)))))

(assert (=> b!635727 (= lt!293931 (select (store (arr!18331 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!635728 () Bool)

(assert (=> b!635728 (= e!363618 (= lt!293930 lt!293935))))

(declare-fun b!635729 () Bool)

(declare-fun res!411206 () Bool)

(assert (=> b!635729 (=> (not res!411206) (not e!363610))))

(assert (=> b!635729 (= res!411206 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!635730 () Bool)

(assert (=> b!635730 (= e!363610 e!363620)))

(declare-fun res!411210 () Bool)

(assert (=> b!635730 (=> (not res!411210) (not e!363620))))

(declare-fun lt!293937 () SeekEntryResult!6727)

(assert (=> b!635730 (= res!411210 (or (= lt!293937 (MissingZero!6727 i!1108)) (= lt!293937 (MissingVacant!6727 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38214 (_ BitVec 32)) SeekEntryResult!6727)

(assert (=> b!635730 (= lt!293937 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!635731 () Bool)

(declare-fun res!411204 () Bool)

(assert (=> b!635731 (=> (not res!411204) (not e!363610))))

(assert (=> b!635731 (= res!411204 (validKeyInArray!0 (select (arr!18331 a!2986) j!136)))))

(assert (= (and start!57486 res!411202) b!635718))

(assert (= (and b!635718 res!411214) b!635731))

(assert (= (and b!635731 res!411204) b!635724))

(assert (= (and b!635724 res!411203) b!635729))

(assert (= (and b!635729 res!411206) b!635730))

(assert (= (and b!635730 res!411210) b!635721))

(assert (= (and b!635721 res!411198) b!635713))

(assert (= (and b!635713 res!411200) b!635720))

(assert (= (and b!635720 res!411208) b!635723))

(assert (= (and b!635723 res!411211) b!635725))

(assert (= (and b!635725 res!411207) b!635722))

(assert (= (and b!635722 res!411213) b!635728))

(assert (= (and b!635722 c!72626) b!635717))

(assert (= (and b!635722 (not c!72626)) b!635716))

(assert (= (and b!635722 (not res!411205)) b!635727))

(assert (= (and b!635727 res!411212) b!635719))

(assert (= (and b!635719 (not res!411199)) b!635726))

(assert (= (and b!635726 res!411209) b!635714))

(assert (= (and b!635727 (not res!411201)) b!635715))

(declare-fun m!610411 () Bool)

(assert (=> b!635726 m!610411))

(assert (=> b!635726 m!610411))

(declare-fun m!610413 () Bool)

(assert (=> b!635726 m!610413))

(declare-fun m!610415 () Bool)

(assert (=> b!635725 m!610415))

(assert (=> b!635725 m!610411))

(assert (=> b!635725 m!610411))

(declare-fun m!610417 () Bool)

(assert (=> b!635725 m!610417))

(declare-fun m!610419 () Bool)

(assert (=> b!635729 m!610419))

(assert (=> b!635714 m!610411))

(assert (=> b!635714 m!610411))

(declare-fun m!610421 () Bool)

(assert (=> b!635714 m!610421))

(declare-fun m!610423 () Bool)

(assert (=> b!635722 m!610423))

(declare-fun m!610425 () Bool)

(assert (=> b!635722 m!610425))

(declare-fun m!610427 () Bool)

(assert (=> b!635722 m!610427))

(assert (=> b!635722 m!610411))

(declare-fun m!610429 () Bool)

(assert (=> b!635722 m!610429))

(declare-fun m!610431 () Bool)

(assert (=> b!635722 m!610431))

(declare-fun m!610433 () Bool)

(assert (=> b!635722 m!610433))

(assert (=> b!635722 m!610411))

(declare-fun m!610435 () Bool)

(assert (=> b!635722 m!610435))

(assert (=> b!635723 m!610431))

(declare-fun m!610437 () Bool)

(assert (=> b!635723 m!610437))

(declare-fun m!610439 () Bool)

(assert (=> b!635724 m!610439))

(declare-fun m!610441 () Bool)

(assert (=> b!635713 m!610441))

(assert (=> b!635731 m!610411))

(assert (=> b!635731 m!610411))

(declare-fun m!610443 () Bool)

(assert (=> b!635731 m!610443))

(assert (=> b!635727 m!610411))

(assert (=> b!635727 m!610431))

(declare-fun m!610445 () Bool)

(assert (=> b!635727 m!610445))

(declare-fun m!610447 () Bool)

(assert (=> start!57486 m!610447))

(declare-fun m!610449 () Bool)

(assert (=> start!57486 m!610449))

(assert (=> b!635715 m!610411))

(assert (=> b!635715 m!610411))

(declare-fun m!610451 () Bool)

(assert (=> b!635715 m!610451))

(assert (=> b!635715 m!610411))

(declare-fun m!610453 () Bool)

(assert (=> b!635715 m!610453))

(declare-fun m!610455 () Bool)

(assert (=> b!635721 m!610455))

(declare-fun m!610457 () Bool)

(assert (=> b!635730 m!610457))

(assert (=> b!635719 m!610411))

(declare-fun m!610459 () Bool)

(assert (=> b!635720 m!610459))

(check-sat (not b!635725) (not b!635726) (not b!635713) (not b!635731) (not b!635724) (not b!635715) (not b!635714) (not b!635722) (not b!635730) (not b!635721) (not b!635729) (not start!57486))
(check-sat)
