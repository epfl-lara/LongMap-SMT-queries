; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59374 () Bool)

(assert start!59374)

(declare-fun b!656037 () Bool)

(declare-datatypes ((Unit!22624 0))(
  ( (Unit!22625) )
))
(declare-fun e!376769 () Unit!22624)

(declare-fun Unit!22626 () Unit!22624)

(assert (=> b!656037 (= e!376769 Unit!22626)))

(declare-fun b!656038 () Bool)

(declare-fun Unit!22627 () Unit!22624)

(assert (=> b!656038 (= e!376769 Unit!22627)))

(assert (=> b!656038 false))

(declare-fun res!425588 () Bool)

(declare-fun e!376761 () Bool)

(assert (=> start!59374 (=> (not res!425588) (not e!376761))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59374 (= res!425588 (validMask!0 mask!3053))))

(assert (=> start!59374 e!376761))

(assert (=> start!59374 true))

(declare-datatypes ((array!38694 0))(
  ( (array!38695 (arr!18547 (Array (_ BitVec 32) (_ BitVec 64))) (size!18911 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38694)

(declare-fun array_inv!14343 (array!38694) Bool)

(assert (=> start!59374 (array_inv!14343 a!2986)))

(declare-fun b!656039 () Bool)

(declare-fun res!425575 () Bool)

(assert (=> b!656039 (=> (not res!425575) (not e!376761))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!656039 (= res!425575 (and (= (size!18911 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18911 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18911 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!656040 () Bool)

(declare-fun e!376762 () Unit!22624)

(declare-fun Unit!22628 () Unit!22624)

(assert (=> b!656040 (= e!376762 Unit!22628)))

(declare-fun b!656041 () Bool)

(declare-fun e!376757 () Unit!22624)

(declare-fun Unit!22629 () Unit!22624)

(assert (=> b!656041 (= e!376757 Unit!22629)))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun res!425587 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!656041 (= res!425587 (= (select (store (arr!18547 a!2986) i!1108 k0!1786) index!984) (select (arr!18547 a!2986) j!136)))))

(declare-fun e!376764 () Bool)

(assert (=> b!656041 (=> (not res!425587) (not e!376764))))

(assert (=> b!656041 e!376764))

(declare-fun c!75600 () Bool)

(assert (=> b!656041 (= c!75600 (bvslt j!136 index!984))))

(declare-fun lt!306198 () Unit!22624)

(assert (=> b!656041 (= lt!306198 e!376762)))

(declare-fun c!75599 () Bool)

(assert (=> b!656041 (= c!75599 (bvslt index!984 j!136))))

(declare-fun lt!306192 () Unit!22624)

(declare-fun e!376758 () Unit!22624)

(assert (=> b!656041 (= lt!306192 e!376758)))

(assert (=> b!656041 false))

(declare-fun b!656042 () Bool)

(declare-fun res!425576 () Bool)

(assert (=> b!656042 (= res!425576 (bvsge j!136 index!984))))

(declare-fun e!376759 () Bool)

(assert (=> b!656042 (=> res!425576 e!376759)))

(assert (=> b!656042 (= e!376764 e!376759)))

(declare-fun b!656043 () Bool)

(declare-fun e!376770 () Bool)

(declare-fun e!376763 () Bool)

(assert (=> b!656043 (= e!376770 e!376763)))

(declare-fun res!425582 () Bool)

(assert (=> b!656043 (=> (not res!425582) (not e!376763))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!656043 (= res!425582 (= (select (store (arr!18547 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!306187 () array!38694)

(assert (=> b!656043 (= lt!306187 (array!38695 (store (arr!18547 a!2986) i!1108 k0!1786) (size!18911 a!2986)))))

(declare-fun b!656044 () Bool)

(declare-fun Unit!22630 () Unit!22624)

(assert (=> b!656044 (= e!376758 Unit!22630)))

(declare-fun b!656045 () Bool)

(declare-fun res!425586 () Bool)

(assert (=> b!656045 (=> (not res!425586) (not e!376761))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!656045 (= res!425586 (validKeyInArray!0 (select (arr!18547 a!2986) j!136)))))

(declare-fun b!656046 () Bool)

(assert (=> b!656046 false))

(declare-fun lt!306196 () Unit!22624)

(declare-datatypes ((List!12588 0))(
  ( (Nil!12585) (Cons!12584 (h!13629 (_ BitVec 64)) (t!18816 List!12588)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38694 (_ BitVec 64) (_ BitVec 32) List!12588) Unit!22624)

(assert (=> b!656046 (= lt!306196 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!306187 (select (arr!18547 a!2986) j!136) j!136 Nil!12585))))

(declare-fun arrayNoDuplicates!0 (array!38694 (_ BitVec 32) List!12588) Bool)

(assert (=> b!656046 (arrayNoDuplicates!0 lt!306187 j!136 Nil!12585)))

(declare-fun lt!306201 () Unit!22624)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38694 (_ BitVec 32) (_ BitVec 32)) Unit!22624)

(assert (=> b!656046 (= lt!306201 (lemmaNoDuplicateFromThenFromBigger!0 lt!306187 #b00000000000000000000000000000000 j!136))))

(assert (=> b!656046 (arrayNoDuplicates!0 lt!306187 #b00000000000000000000000000000000 Nil!12585)))

(declare-fun lt!306183 () Unit!22624)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38694 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12588) Unit!22624)

(assert (=> b!656046 (= lt!306183 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12585))))

(declare-fun arrayContainsKey!0 (array!38694 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!656046 (arrayContainsKey!0 lt!306187 (select (arr!18547 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!306194 () Unit!22624)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38694 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22624)

(assert (=> b!656046 (= lt!306194 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!306187 (select (arr!18547 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!22631 () Unit!22624)

(assert (=> b!656046 (= e!376762 Unit!22631)))

(declare-fun b!656047 () Bool)

(declare-fun e!376768 () Bool)

(declare-datatypes ((SeekEntryResult!6987 0))(
  ( (MissingZero!6987 (index!30307 (_ BitVec 32))) (Found!6987 (index!30308 (_ BitVec 32))) (Intermediate!6987 (undefined!7799 Bool) (index!30309 (_ BitVec 32)) (x!59092 (_ BitVec 32))) (Undefined!6987) (MissingVacant!6987 (index!30310 (_ BitVec 32))) )
))
(declare-fun lt!306186 () SeekEntryResult!6987)

(declare-fun lt!306191 () SeekEntryResult!6987)

(assert (=> b!656047 (= e!376768 (= lt!306186 lt!306191))))

(declare-fun b!656048 () Bool)

(declare-fun e!376760 () Bool)

(assert (=> b!656048 (= e!376760 (arrayContainsKey!0 lt!306187 (select (arr!18547 a!2986) j!136) index!984))))

(declare-fun b!656049 () Bool)

(declare-fun res!425578 () Bool)

(assert (=> b!656049 (=> (not res!425578) (not e!376770))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!656049 (= res!425578 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18547 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!656050 () Bool)

(assert (=> b!656050 false))

(declare-fun lt!306184 () Unit!22624)

(assert (=> b!656050 (= lt!306184 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!306187 (select (arr!18547 a!2986) j!136) index!984 Nil!12585))))

(assert (=> b!656050 (arrayNoDuplicates!0 lt!306187 index!984 Nil!12585)))

(declare-fun lt!306200 () Unit!22624)

(assert (=> b!656050 (= lt!306200 (lemmaNoDuplicateFromThenFromBigger!0 lt!306187 #b00000000000000000000000000000000 index!984))))

(assert (=> b!656050 (arrayNoDuplicates!0 lt!306187 #b00000000000000000000000000000000 Nil!12585)))

(declare-fun lt!306199 () Unit!22624)

(assert (=> b!656050 (= lt!306199 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12585))))

(assert (=> b!656050 (arrayContainsKey!0 lt!306187 (select (arr!18547 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!306189 () Unit!22624)

(assert (=> b!656050 (= lt!306189 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!306187 (select (arr!18547 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!376766 () Bool)

(assert (=> b!656050 e!376766))

(declare-fun res!425583 () Bool)

(assert (=> b!656050 (=> (not res!425583) (not e!376766))))

(assert (=> b!656050 (= res!425583 (arrayContainsKey!0 lt!306187 (select (arr!18547 a!2986) j!136) j!136))))

(declare-fun Unit!22632 () Unit!22624)

(assert (=> b!656050 (= e!376758 Unit!22632)))

(declare-fun b!656051 () Bool)

(declare-fun res!425579 () Bool)

(assert (=> b!656051 (=> (not res!425579) (not e!376761))))

(assert (=> b!656051 (= res!425579 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!656052 () Bool)

(declare-fun res!425574 () Bool)

(assert (=> b!656052 (=> (not res!425574) (not e!376770))))

(assert (=> b!656052 (= res!425574 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12585))))

(declare-fun b!656053 () Bool)

(assert (=> b!656053 (= e!376766 (arrayContainsKey!0 lt!306187 (select (arr!18547 a!2986) j!136) index!984))))

(declare-fun b!656054 () Bool)

(declare-fun res!425581 () Bool)

(assert (=> b!656054 (=> (not res!425581) (not e!376770))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38694 (_ BitVec 32)) Bool)

(assert (=> b!656054 (= res!425581 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!656055 () Bool)

(declare-fun res!425573 () Bool)

(assert (=> b!656055 (=> (not res!425573) (not e!376761))))

(assert (=> b!656055 (= res!425573 (validKeyInArray!0 k0!1786))))

(declare-fun res!425580 () Bool)

(declare-fun b!656056 () Bool)

(assert (=> b!656056 (= res!425580 (arrayContainsKey!0 lt!306187 (select (arr!18547 a!2986) j!136) j!136))))

(assert (=> b!656056 (=> (not res!425580) (not e!376760))))

(assert (=> b!656056 (= e!376759 e!376760)))

(declare-fun b!656057 () Bool)

(declare-fun Unit!22633 () Unit!22624)

(assert (=> b!656057 (= e!376757 Unit!22633)))

(declare-fun b!656058 () Bool)

(declare-fun lt!306195 () SeekEntryResult!6987)

(declare-fun e!376765 () Bool)

(assert (=> b!656058 (= e!376765 (not (or (not (= lt!306195 (MissingVacant!6987 vacantSpotIndex!68))) (= (select (store (arr!18547 a!2986) i!1108 k0!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!306188 () Unit!22624)

(assert (=> b!656058 (= lt!306188 e!376757)))

(declare-fun c!75601 () Bool)

(assert (=> b!656058 (= c!75601 (= lt!306195 (Found!6987 index!984)))))

(declare-fun lt!306193 () Unit!22624)

(assert (=> b!656058 (= lt!306193 e!376769)))

(declare-fun c!75602 () Bool)

(assert (=> b!656058 (= c!75602 (= lt!306195 Undefined!6987))))

(declare-fun lt!306197 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38694 (_ BitVec 32)) SeekEntryResult!6987)

(assert (=> b!656058 (= lt!306195 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!306197 lt!306187 mask!3053))))

(assert (=> b!656058 e!376768))

(declare-fun res!425577 () Bool)

(assert (=> b!656058 (=> (not res!425577) (not e!376768))))

(declare-fun lt!306185 () (_ BitVec 32))

(assert (=> b!656058 (= res!425577 (= lt!306191 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!306185 vacantSpotIndex!68 lt!306197 lt!306187 mask!3053)))))

(assert (=> b!656058 (= lt!306191 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!306185 vacantSpotIndex!68 (select (arr!18547 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!656058 (= lt!306197 (select (store (arr!18547 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!306202 () Unit!22624)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38694 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22624)

(assert (=> b!656058 (= lt!306202 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!306185 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!656058 (= lt!306185 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!656059 () Bool)

(assert (=> b!656059 (= e!376761 e!376770)))

(declare-fun res!425584 () Bool)

(assert (=> b!656059 (=> (not res!425584) (not e!376770))))

(declare-fun lt!306190 () SeekEntryResult!6987)

(assert (=> b!656059 (= res!425584 (or (= lt!306190 (MissingZero!6987 i!1108)) (= lt!306190 (MissingVacant!6987 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38694 (_ BitVec 32)) SeekEntryResult!6987)

(assert (=> b!656059 (= lt!306190 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!656060 () Bool)

(assert (=> b!656060 (= e!376763 e!376765)))

(declare-fun res!425585 () Bool)

(assert (=> b!656060 (=> (not res!425585) (not e!376765))))

(assert (=> b!656060 (= res!425585 (and (= lt!306186 (Found!6987 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18547 a!2986) index!984) (select (arr!18547 a!2986) j!136))) (not (= (select (arr!18547 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!656060 (= lt!306186 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18547 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!59374 res!425588) b!656039))

(assert (= (and b!656039 res!425575) b!656045))

(assert (= (and b!656045 res!425586) b!656055))

(assert (= (and b!656055 res!425573) b!656051))

(assert (= (and b!656051 res!425579) b!656059))

(assert (= (and b!656059 res!425584) b!656054))

(assert (= (and b!656054 res!425581) b!656052))

(assert (= (and b!656052 res!425574) b!656049))

(assert (= (and b!656049 res!425578) b!656043))

(assert (= (and b!656043 res!425582) b!656060))

(assert (= (and b!656060 res!425585) b!656058))

(assert (= (and b!656058 res!425577) b!656047))

(assert (= (and b!656058 c!75602) b!656038))

(assert (= (and b!656058 (not c!75602)) b!656037))

(assert (= (and b!656058 c!75601) b!656041))

(assert (= (and b!656058 (not c!75601)) b!656057))

(assert (= (and b!656041 res!425587) b!656042))

(assert (= (and b!656042 (not res!425576)) b!656056))

(assert (= (and b!656056 res!425580) b!656048))

(assert (= (and b!656041 c!75600) b!656046))

(assert (= (and b!656041 (not c!75600)) b!656040))

(assert (= (and b!656041 c!75599) b!656050))

(assert (= (and b!656041 (not c!75599)) b!656044))

(assert (= (and b!656050 res!425583) b!656053))

(declare-fun m!629097 () Bool)

(assert (=> b!656055 m!629097))

(declare-fun m!629099 () Bool)

(assert (=> b!656041 m!629099))

(declare-fun m!629101 () Bool)

(assert (=> b!656041 m!629101))

(declare-fun m!629103 () Bool)

(assert (=> b!656041 m!629103))

(declare-fun m!629105 () Bool)

(assert (=> start!59374 m!629105))

(declare-fun m!629107 () Bool)

(assert (=> start!59374 m!629107))

(declare-fun m!629109 () Bool)

(assert (=> b!656046 m!629109))

(assert (=> b!656046 m!629103))

(declare-fun m!629111 () Bool)

(assert (=> b!656046 m!629111))

(assert (=> b!656046 m!629103))

(declare-fun m!629113 () Bool)

(assert (=> b!656046 m!629113))

(assert (=> b!656046 m!629103))

(declare-fun m!629115 () Bool)

(assert (=> b!656046 m!629115))

(declare-fun m!629117 () Bool)

(assert (=> b!656046 m!629117))

(assert (=> b!656046 m!629103))

(declare-fun m!629119 () Bool)

(assert (=> b!656046 m!629119))

(declare-fun m!629121 () Bool)

(assert (=> b!656046 m!629121))

(assert (=> b!656043 m!629099))

(declare-fun m!629123 () Bool)

(assert (=> b!656043 m!629123))

(assert (=> b!656050 m!629109))

(assert (=> b!656050 m!629103))

(declare-fun m!629125 () Bool)

(assert (=> b!656050 m!629125))

(assert (=> b!656050 m!629103))

(declare-fun m!629127 () Bool)

(assert (=> b!656050 m!629127))

(assert (=> b!656050 m!629103))

(declare-fun m!629129 () Bool)

(assert (=> b!656050 m!629129))

(assert (=> b!656050 m!629103))

(declare-fun m!629131 () Bool)

(assert (=> b!656050 m!629131))

(declare-fun m!629133 () Bool)

(assert (=> b!656050 m!629133))

(assert (=> b!656050 m!629103))

(declare-fun m!629135 () Bool)

(assert (=> b!656050 m!629135))

(assert (=> b!656050 m!629121))

(declare-fun m!629137 () Bool)

(assert (=> b!656051 m!629137))

(declare-fun m!629139 () Bool)

(assert (=> b!656059 m!629139))

(declare-fun m!629141 () Bool)

(assert (=> b!656058 m!629141))

(declare-fun m!629143 () Bool)

(assert (=> b!656058 m!629143))

(assert (=> b!656058 m!629103))

(assert (=> b!656058 m!629099))

(assert (=> b!656058 m!629101))

(assert (=> b!656058 m!629103))

(declare-fun m!629145 () Bool)

(assert (=> b!656058 m!629145))

(declare-fun m!629147 () Bool)

(assert (=> b!656058 m!629147))

(declare-fun m!629149 () Bool)

(assert (=> b!656058 m!629149))

(declare-fun m!629151 () Bool)

(assert (=> b!656058 m!629151))

(declare-fun m!629153 () Bool)

(assert (=> b!656060 m!629153))

(assert (=> b!656060 m!629103))

(assert (=> b!656060 m!629103))

(declare-fun m!629155 () Bool)

(assert (=> b!656060 m!629155))

(declare-fun m!629157 () Bool)

(assert (=> b!656054 m!629157))

(assert (=> b!656053 m!629103))

(assert (=> b!656053 m!629103))

(declare-fun m!629159 () Bool)

(assert (=> b!656053 m!629159))

(declare-fun m!629161 () Bool)

(assert (=> b!656052 m!629161))

(assert (=> b!656056 m!629103))

(assert (=> b!656056 m!629103))

(assert (=> b!656056 m!629125))

(declare-fun m!629163 () Bool)

(assert (=> b!656049 m!629163))

(assert (=> b!656045 m!629103))

(assert (=> b!656045 m!629103))

(declare-fun m!629165 () Bool)

(assert (=> b!656045 m!629165))

(assert (=> b!656048 m!629103))

(assert (=> b!656048 m!629103))

(assert (=> b!656048 m!629159))

(check-sat (not b!656046) (not b!656045) (not b!656058) (not b!656056) (not b!656059) (not b!656053) (not b!656054) (not b!656051) (not b!656048) (not b!656060) (not b!656052) (not start!59374) (not b!656050) (not b!656055))
(check-sat)
(get-model)

(declare-fun d!92593 () Bool)

(assert (=> d!92593 (arrayContainsKey!0 lt!306187 (select (arr!18547 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!306265 () Unit!22624)

(declare-fun choose!114 (array!38694 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22624)

(assert (=> d!92593 (= lt!306265 (choose!114 lt!306187 (select (arr!18547 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> d!92593 (bvsge j!136 #b00000000000000000000000000000000)))

(assert (=> d!92593 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!306187 (select (arr!18547 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)) lt!306265)))

(declare-fun bs!19525 () Bool)

(assert (= bs!19525 d!92593))

(assert (=> bs!19525 m!629103))

(assert (=> bs!19525 m!629131))

(assert (=> bs!19525 m!629103))

(declare-fun m!629237 () Bool)

(assert (=> bs!19525 m!629237))

(assert (=> b!656050 d!92593))

(declare-fun b!656143 () Bool)

(declare-fun e!376821 () Bool)

(declare-fun contains!3191 (List!12588 (_ BitVec 64)) Bool)

(assert (=> b!656143 (= e!376821 (contains!3191 Nil!12585 (select (arr!18547 lt!306187) #b00000000000000000000000000000000)))))

(declare-fun b!656144 () Bool)

(declare-fun e!376824 () Bool)

(declare-fun e!376823 () Bool)

(assert (=> b!656144 (= e!376824 e!376823)))

(declare-fun c!75617 () Bool)

(assert (=> b!656144 (= c!75617 (validKeyInArray!0 (select (arr!18547 lt!306187) #b00000000000000000000000000000000)))))

(declare-fun d!92595 () Bool)

(declare-fun res!425644 () Bool)

(declare-fun e!376822 () Bool)

(assert (=> d!92595 (=> res!425644 e!376822)))

(assert (=> d!92595 (= res!425644 (bvsge #b00000000000000000000000000000000 (size!18911 lt!306187)))))

(assert (=> d!92595 (= (arrayNoDuplicates!0 lt!306187 #b00000000000000000000000000000000 Nil!12585) e!376822)))

(declare-fun b!656145 () Bool)

(declare-fun call!33836 () Bool)

(assert (=> b!656145 (= e!376823 call!33836)))

(declare-fun b!656146 () Bool)

(assert (=> b!656146 (= e!376822 e!376824)))

(declare-fun res!425643 () Bool)

(assert (=> b!656146 (=> (not res!425643) (not e!376824))))

(assert (=> b!656146 (= res!425643 (not e!376821))))

(declare-fun res!425645 () Bool)

(assert (=> b!656146 (=> (not res!425645) (not e!376821))))

(assert (=> b!656146 (= res!425645 (validKeyInArray!0 (select (arr!18547 lt!306187) #b00000000000000000000000000000000)))))

(declare-fun b!656147 () Bool)

(assert (=> b!656147 (= e!376823 call!33836)))

(declare-fun bm!33833 () Bool)

(assert (=> bm!33833 (= call!33836 (arrayNoDuplicates!0 lt!306187 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!75617 (Cons!12584 (select (arr!18547 lt!306187) #b00000000000000000000000000000000) Nil!12585) Nil!12585)))))

(assert (= (and d!92595 (not res!425644)) b!656146))

(assert (= (and b!656146 res!425645) b!656143))

(assert (= (and b!656146 res!425643) b!656144))

(assert (= (and b!656144 c!75617) b!656145))

(assert (= (and b!656144 (not c!75617)) b!656147))

(assert (= (or b!656145 b!656147) bm!33833))

(declare-fun m!629239 () Bool)

(assert (=> b!656143 m!629239))

(assert (=> b!656143 m!629239))

(declare-fun m!629241 () Bool)

(assert (=> b!656143 m!629241))

(assert (=> b!656144 m!629239))

(assert (=> b!656144 m!629239))

(declare-fun m!629243 () Bool)

(assert (=> b!656144 m!629243))

(assert (=> b!656146 m!629239))

(assert (=> b!656146 m!629239))

(assert (=> b!656146 m!629243))

(assert (=> bm!33833 m!629239))

(declare-fun m!629245 () Bool)

(assert (=> bm!33833 m!629245))

(assert (=> b!656050 d!92595))

(declare-fun d!92597 () Bool)

(declare-fun res!425650 () Bool)

(declare-fun e!376829 () Bool)

(assert (=> d!92597 (=> res!425650 e!376829)))

(assert (=> d!92597 (= res!425650 (= (select (arr!18547 lt!306187) j!136) (select (arr!18547 a!2986) j!136)))))

(assert (=> d!92597 (= (arrayContainsKey!0 lt!306187 (select (arr!18547 a!2986) j!136) j!136) e!376829)))

(declare-fun b!656152 () Bool)

(declare-fun e!376830 () Bool)

(assert (=> b!656152 (= e!376829 e!376830)))

(declare-fun res!425651 () Bool)

(assert (=> b!656152 (=> (not res!425651) (not e!376830))))

(assert (=> b!656152 (= res!425651 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18911 lt!306187)))))

(declare-fun b!656153 () Bool)

(assert (=> b!656153 (= e!376830 (arrayContainsKey!0 lt!306187 (select (arr!18547 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!92597 (not res!425650)) b!656152))

(assert (= (and b!656152 res!425651) b!656153))

(declare-fun m!629247 () Bool)

(assert (=> d!92597 m!629247))

(assert (=> b!656153 m!629103))

(declare-fun m!629249 () Bool)

(assert (=> b!656153 m!629249))

(assert (=> b!656050 d!92597))

(declare-fun d!92599 () Bool)

(assert (=> d!92599 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (size!18911 lt!306187)) (not (= (select (arr!18547 lt!306187) index!984) (select (arr!18547 a!2986) j!136))))))

(declare-fun lt!306268 () Unit!22624)

(declare-fun choose!21 (array!38694 (_ BitVec 64) (_ BitVec 32) List!12588) Unit!22624)

(assert (=> d!92599 (= lt!306268 (choose!21 lt!306187 (select (arr!18547 a!2986) j!136) index!984 Nil!12585))))

(assert (=> d!92599 (bvslt (size!18911 lt!306187) #b01111111111111111111111111111111)))

(assert (=> d!92599 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!306187 (select (arr!18547 a!2986) j!136) index!984 Nil!12585) lt!306268)))

(declare-fun bs!19526 () Bool)

(assert (= bs!19526 d!92599))

(declare-fun m!629251 () Bool)

(assert (=> bs!19526 m!629251))

(assert (=> bs!19526 m!629103))

(declare-fun m!629253 () Bool)

(assert (=> bs!19526 m!629253))

(assert (=> b!656050 d!92599))

(declare-fun b!656154 () Bool)

(declare-fun e!376831 () Bool)

(assert (=> b!656154 (= e!376831 (contains!3191 Nil!12585 (select (arr!18547 lt!306187) index!984)))))

(declare-fun b!656155 () Bool)

(declare-fun e!376834 () Bool)

(declare-fun e!376833 () Bool)

(assert (=> b!656155 (= e!376834 e!376833)))

(declare-fun c!75618 () Bool)

(assert (=> b!656155 (= c!75618 (validKeyInArray!0 (select (arr!18547 lt!306187) index!984)))))

(declare-fun d!92603 () Bool)

(declare-fun res!425653 () Bool)

(declare-fun e!376832 () Bool)

(assert (=> d!92603 (=> res!425653 e!376832)))

(assert (=> d!92603 (= res!425653 (bvsge index!984 (size!18911 lt!306187)))))

(assert (=> d!92603 (= (arrayNoDuplicates!0 lt!306187 index!984 Nil!12585) e!376832)))

(declare-fun b!656156 () Bool)

(declare-fun call!33837 () Bool)

(assert (=> b!656156 (= e!376833 call!33837)))

(declare-fun b!656157 () Bool)

(assert (=> b!656157 (= e!376832 e!376834)))

(declare-fun res!425652 () Bool)

(assert (=> b!656157 (=> (not res!425652) (not e!376834))))

(assert (=> b!656157 (= res!425652 (not e!376831))))

(declare-fun res!425654 () Bool)

(assert (=> b!656157 (=> (not res!425654) (not e!376831))))

(assert (=> b!656157 (= res!425654 (validKeyInArray!0 (select (arr!18547 lt!306187) index!984)))))

(declare-fun b!656158 () Bool)

(assert (=> b!656158 (= e!376833 call!33837)))

(declare-fun bm!33834 () Bool)

(assert (=> bm!33834 (= call!33837 (arrayNoDuplicates!0 lt!306187 (bvadd index!984 #b00000000000000000000000000000001) (ite c!75618 (Cons!12584 (select (arr!18547 lt!306187) index!984) Nil!12585) Nil!12585)))))

(assert (= (and d!92603 (not res!425653)) b!656157))

(assert (= (and b!656157 res!425654) b!656154))

(assert (= (and b!656157 res!425652) b!656155))

(assert (= (and b!656155 c!75618) b!656156))

(assert (= (and b!656155 (not c!75618)) b!656158))

(assert (= (or b!656156 b!656158) bm!33834))

(assert (=> b!656154 m!629251))

(assert (=> b!656154 m!629251))

(declare-fun m!629255 () Bool)

(assert (=> b!656154 m!629255))

(assert (=> b!656155 m!629251))

(assert (=> b!656155 m!629251))

(declare-fun m!629257 () Bool)

(assert (=> b!656155 m!629257))

(assert (=> b!656157 m!629251))

(assert (=> b!656157 m!629251))

(assert (=> b!656157 m!629257))

(assert (=> bm!33834 m!629251))

(declare-fun m!629259 () Bool)

(assert (=> bm!33834 m!629259))

(assert (=> b!656050 d!92603))

(declare-fun d!92605 () Bool)

(declare-fun res!425655 () Bool)

(declare-fun e!376835 () Bool)

(assert (=> d!92605 (=> res!425655 e!376835)))

(assert (=> d!92605 (= res!425655 (= (select (arr!18547 lt!306187) (bvadd #b00000000000000000000000000000001 index!984)) (select (arr!18547 a!2986) j!136)))))

(assert (=> d!92605 (= (arrayContainsKey!0 lt!306187 (select (arr!18547 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984)) e!376835)))

(declare-fun b!656159 () Bool)

(declare-fun e!376836 () Bool)

(assert (=> b!656159 (= e!376835 e!376836)))

(declare-fun res!425656 () Bool)

(assert (=> b!656159 (=> (not res!425656) (not e!376836))))

(assert (=> b!656159 (= res!425656 (bvslt (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001) (size!18911 lt!306187)))))

(declare-fun b!656160 () Bool)

(assert (=> b!656160 (= e!376836 (arrayContainsKey!0 lt!306187 (select (arr!18547 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!92605 (not res!425655)) b!656159))

(assert (= (and b!656159 res!425656) b!656160))

(declare-fun m!629261 () Bool)

(assert (=> d!92605 m!629261))

(assert (=> b!656160 m!629103))

(declare-fun m!629263 () Bool)

(assert (=> b!656160 m!629263))

(assert (=> b!656050 d!92605))

(declare-fun d!92607 () Bool)

(assert (=> d!92607 (arrayNoDuplicates!0 lt!306187 index!984 Nil!12585)))

(declare-fun lt!306271 () Unit!22624)

(declare-fun choose!39 (array!38694 (_ BitVec 32) (_ BitVec 32)) Unit!22624)

(assert (=> d!92607 (= lt!306271 (choose!39 lt!306187 #b00000000000000000000000000000000 index!984))))

(assert (=> d!92607 (bvslt (size!18911 lt!306187) #b01111111111111111111111111111111)))

(assert (=> d!92607 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!306187 #b00000000000000000000000000000000 index!984) lt!306271)))

(declare-fun bs!19527 () Bool)

(assert (= bs!19527 d!92607))

(assert (=> bs!19527 m!629127))

(declare-fun m!629265 () Bool)

(assert (=> bs!19527 m!629265))

(assert (=> b!656050 d!92607))

(declare-fun d!92609 () Bool)

(declare-fun e!376848 () Bool)

(assert (=> d!92609 e!376848))

(declare-fun res!425664 () Bool)

(assert (=> d!92609 (=> (not res!425664) (not e!376848))))

(assert (=> d!92609 (= res!425664 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18911 a!2986))))))

(declare-fun lt!306282 () Unit!22624)

(declare-fun choose!41 (array!38694 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12588) Unit!22624)

(assert (=> d!92609 (= lt!306282 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12585))))

(assert (=> d!92609 (bvslt (size!18911 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!92609 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12585) lt!306282)))

(declare-fun b!656171 () Bool)

(assert (=> b!656171 (= e!376848 (arrayNoDuplicates!0 (array!38695 (store (arr!18547 a!2986) i!1108 k0!1786) (size!18911 a!2986)) #b00000000000000000000000000000000 Nil!12585))))

(assert (= (and d!92609 res!425664) b!656171))

(declare-fun m!629267 () Bool)

(assert (=> d!92609 m!629267))

(assert (=> b!656171 m!629099))

(declare-fun m!629269 () Bool)

(assert (=> b!656171 m!629269))

(assert (=> b!656050 d!92609))

(declare-fun d!92611 () Bool)

(assert (=> d!92611 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!59374 d!92611))

(declare-fun d!92615 () Bool)

(assert (=> d!92615 (= (array_inv!14343 a!2986) (bvsge (size!18911 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!59374 d!92615))

(declare-fun b!656213 () Bool)

(declare-fun e!376874 () SeekEntryResult!6987)

(declare-fun lt!306297 () SeekEntryResult!6987)

(assert (=> b!656213 (= e!376874 (MissingZero!6987 (index!30309 lt!306297)))))

(declare-fun b!656214 () Bool)

(declare-fun e!376875 () SeekEntryResult!6987)

(declare-fun e!376876 () SeekEntryResult!6987)

(assert (=> b!656214 (= e!376875 e!376876)))

(declare-fun lt!306298 () (_ BitVec 64))

(assert (=> b!656214 (= lt!306298 (select (arr!18547 a!2986) (index!30309 lt!306297)))))

(declare-fun c!75636 () Bool)

(assert (=> b!656214 (= c!75636 (= lt!306298 k0!1786))))

(declare-fun b!656215 () Bool)

(declare-fun c!75634 () Bool)

(assert (=> b!656215 (= c!75634 (= lt!306298 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!656215 (= e!376876 e!376874)))

(declare-fun d!92617 () Bool)

(declare-fun lt!306299 () SeekEntryResult!6987)

(get-info :version)

(assert (=> d!92617 (and (or ((_ is Undefined!6987) lt!306299) (not ((_ is Found!6987) lt!306299)) (and (bvsge (index!30308 lt!306299) #b00000000000000000000000000000000) (bvslt (index!30308 lt!306299) (size!18911 a!2986)))) (or ((_ is Undefined!6987) lt!306299) ((_ is Found!6987) lt!306299) (not ((_ is MissingZero!6987) lt!306299)) (and (bvsge (index!30307 lt!306299) #b00000000000000000000000000000000) (bvslt (index!30307 lt!306299) (size!18911 a!2986)))) (or ((_ is Undefined!6987) lt!306299) ((_ is Found!6987) lt!306299) ((_ is MissingZero!6987) lt!306299) (not ((_ is MissingVacant!6987) lt!306299)) (and (bvsge (index!30310 lt!306299) #b00000000000000000000000000000000) (bvslt (index!30310 lt!306299) (size!18911 a!2986)))) (or ((_ is Undefined!6987) lt!306299) (ite ((_ is Found!6987) lt!306299) (= (select (arr!18547 a!2986) (index!30308 lt!306299)) k0!1786) (ite ((_ is MissingZero!6987) lt!306299) (= (select (arr!18547 a!2986) (index!30307 lt!306299)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6987) lt!306299) (= (select (arr!18547 a!2986) (index!30310 lt!306299)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!92617 (= lt!306299 e!376875)))

(declare-fun c!75635 () Bool)

(assert (=> d!92617 (= c!75635 (and ((_ is Intermediate!6987) lt!306297) (undefined!7799 lt!306297)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38694 (_ BitVec 32)) SeekEntryResult!6987)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!92617 (= lt!306297 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!92617 (validMask!0 mask!3053)))

(assert (=> d!92617 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!306299)))

(declare-fun b!656216 () Bool)

(assert (=> b!656216 (= e!376876 (Found!6987 (index!30309 lt!306297)))))

(declare-fun b!656217 () Bool)

(assert (=> b!656217 (= e!376874 (seekKeyOrZeroReturnVacant!0 (x!59092 lt!306297) (index!30309 lt!306297) (index!30309 lt!306297) k0!1786 a!2986 mask!3053))))

(declare-fun b!656218 () Bool)

(assert (=> b!656218 (= e!376875 Undefined!6987)))

(assert (= (and d!92617 c!75635) b!656218))

(assert (= (and d!92617 (not c!75635)) b!656214))

(assert (= (and b!656214 c!75636) b!656216))

(assert (= (and b!656214 (not c!75636)) b!656215))

(assert (= (and b!656215 c!75634) b!656213))

(assert (= (and b!656215 (not c!75634)) b!656217))

(declare-fun m!629299 () Bool)

(assert (=> b!656214 m!629299))

(declare-fun m!629301 () Bool)

(assert (=> d!92617 m!629301))

(assert (=> d!92617 m!629301))

(declare-fun m!629303 () Bool)

(assert (=> d!92617 m!629303))

(declare-fun m!629305 () Bool)

(assert (=> d!92617 m!629305))

(declare-fun m!629307 () Bool)

(assert (=> d!92617 m!629307))

(assert (=> d!92617 m!629105))

(declare-fun m!629309 () Bool)

(assert (=> d!92617 m!629309))

(declare-fun m!629311 () Bool)

(assert (=> b!656217 m!629311))

(assert (=> b!656059 d!92617))

(declare-fun b!656261 () Bool)

(declare-fun e!376902 () SeekEntryResult!6987)

(assert (=> b!656261 (= e!376902 (MissingVacant!6987 vacantSpotIndex!68))))

(declare-fun b!656262 () Bool)

(declare-fun e!376901 () SeekEntryResult!6987)

(assert (=> b!656262 (= e!376901 Undefined!6987)))

(declare-fun d!92629 () Bool)

(declare-fun lt!306322 () SeekEntryResult!6987)

(assert (=> d!92629 (and (or ((_ is Undefined!6987) lt!306322) (not ((_ is Found!6987) lt!306322)) (and (bvsge (index!30308 lt!306322) #b00000000000000000000000000000000) (bvslt (index!30308 lt!306322) (size!18911 a!2986)))) (or ((_ is Undefined!6987) lt!306322) ((_ is Found!6987) lt!306322) (not ((_ is MissingVacant!6987) lt!306322)) (not (= (index!30310 lt!306322) vacantSpotIndex!68)) (and (bvsge (index!30310 lt!306322) #b00000000000000000000000000000000) (bvslt (index!30310 lt!306322) (size!18911 a!2986)))) (or ((_ is Undefined!6987) lt!306322) (ite ((_ is Found!6987) lt!306322) (= (select (arr!18547 a!2986) (index!30308 lt!306322)) (select (arr!18547 a!2986) j!136)) (and ((_ is MissingVacant!6987) lt!306322) (= (index!30310 lt!306322) vacantSpotIndex!68) (= (select (arr!18547 a!2986) (index!30310 lt!306322)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!92629 (= lt!306322 e!376901)))

(declare-fun c!75655 () Bool)

(assert (=> d!92629 (= c!75655 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!306323 () (_ BitVec 64))

(assert (=> d!92629 (= lt!306323 (select (arr!18547 a!2986) index!984))))

(assert (=> d!92629 (validMask!0 mask!3053)))

(assert (=> d!92629 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18547 a!2986) j!136) a!2986 mask!3053) lt!306322)))

(declare-fun b!656263 () Bool)

(declare-fun e!376903 () SeekEntryResult!6987)

(assert (=> b!656263 (= e!376903 (Found!6987 index!984))))

(declare-fun b!656264 () Bool)

(declare-fun c!75657 () Bool)

(assert (=> b!656264 (= c!75657 (= lt!306323 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!656264 (= e!376903 e!376902)))

(declare-fun b!656265 () Bool)

(assert (=> b!656265 (= e!376902 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18547 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!656266 () Bool)

(assert (=> b!656266 (= e!376901 e!376903)))

(declare-fun c!75656 () Bool)

(assert (=> b!656266 (= c!75656 (= lt!306323 (select (arr!18547 a!2986) j!136)))))

(assert (= (and d!92629 c!75655) b!656262))

(assert (= (and d!92629 (not c!75655)) b!656266))

(assert (= (and b!656266 c!75656) b!656263))

(assert (= (and b!656266 (not c!75656)) b!656264))

(assert (= (and b!656264 c!75657) b!656261))

(assert (= (and b!656264 (not c!75657)) b!656265))

(declare-fun m!629351 () Bool)

(assert (=> d!92629 m!629351))

(declare-fun m!629353 () Bool)

(assert (=> d!92629 m!629353))

(assert (=> d!92629 m!629153))

(assert (=> d!92629 m!629105))

(assert (=> b!656265 m!629143))

(assert (=> b!656265 m!629143))

(assert (=> b!656265 m!629103))

(declare-fun m!629355 () Bool)

(assert (=> b!656265 m!629355))

(assert (=> b!656060 d!92629))

(declare-fun b!656267 () Bool)

(declare-fun e!376905 () SeekEntryResult!6987)

(assert (=> b!656267 (= e!376905 (MissingVacant!6987 vacantSpotIndex!68))))

(declare-fun b!656268 () Bool)

(declare-fun e!376904 () SeekEntryResult!6987)

(assert (=> b!656268 (= e!376904 Undefined!6987)))

(declare-fun d!92641 () Bool)

(declare-fun lt!306324 () SeekEntryResult!6987)

(assert (=> d!92641 (and (or ((_ is Undefined!6987) lt!306324) (not ((_ is Found!6987) lt!306324)) (and (bvsge (index!30308 lt!306324) #b00000000000000000000000000000000) (bvslt (index!30308 lt!306324) (size!18911 lt!306187)))) (or ((_ is Undefined!6987) lt!306324) ((_ is Found!6987) lt!306324) (not ((_ is MissingVacant!6987) lt!306324)) (not (= (index!30310 lt!306324) vacantSpotIndex!68)) (and (bvsge (index!30310 lt!306324) #b00000000000000000000000000000000) (bvslt (index!30310 lt!306324) (size!18911 lt!306187)))) (or ((_ is Undefined!6987) lt!306324) (ite ((_ is Found!6987) lt!306324) (= (select (arr!18547 lt!306187) (index!30308 lt!306324)) lt!306197) (and ((_ is MissingVacant!6987) lt!306324) (= (index!30310 lt!306324) vacantSpotIndex!68) (= (select (arr!18547 lt!306187) (index!30310 lt!306324)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!92641 (= lt!306324 e!376904)))

(declare-fun c!75658 () Bool)

(assert (=> d!92641 (= c!75658 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!306325 () (_ BitVec 64))

(assert (=> d!92641 (= lt!306325 (select (arr!18547 lt!306187) index!984))))

(assert (=> d!92641 (validMask!0 mask!3053)))

(assert (=> d!92641 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!306197 lt!306187 mask!3053) lt!306324)))

(declare-fun b!656269 () Bool)

(declare-fun e!376906 () SeekEntryResult!6987)

(assert (=> b!656269 (= e!376906 (Found!6987 index!984))))

(declare-fun b!656270 () Bool)

(declare-fun c!75660 () Bool)

(assert (=> b!656270 (= c!75660 (= lt!306325 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!656270 (= e!376906 e!376905)))

(declare-fun b!656271 () Bool)

(assert (=> b!656271 (= e!376905 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!306197 lt!306187 mask!3053))))

(declare-fun b!656272 () Bool)

(assert (=> b!656272 (= e!376904 e!376906)))

(declare-fun c!75659 () Bool)

(assert (=> b!656272 (= c!75659 (= lt!306325 lt!306197))))

(assert (= (and d!92641 c!75658) b!656268))

(assert (= (and d!92641 (not c!75658)) b!656272))

(assert (= (and b!656272 c!75659) b!656269))

(assert (= (and b!656272 (not c!75659)) b!656270))

(assert (= (and b!656270 c!75660) b!656267))

(assert (= (and b!656270 (not c!75660)) b!656271))

(declare-fun m!629357 () Bool)

(assert (=> d!92641 m!629357))

(declare-fun m!629359 () Bool)

(assert (=> d!92641 m!629359))

(assert (=> d!92641 m!629251))

(assert (=> d!92641 m!629105))

(assert (=> b!656271 m!629143))

(assert (=> b!656271 m!629143))

(declare-fun m!629361 () Bool)

(assert (=> b!656271 m!629361))

(assert (=> b!656058 d!92641))

(declare-fun b!656273 () Bool)

(declare-fun e!376908 () SeekEntryResult!6987)

(assert (=> b!656273 (= e!376908 (MissingVacant!6987 vacantSpotIndex!68))))

(declare-fun b!656274 () Bool)

(declare-fun e!376907 () SeekEntryResult!6987)

(assert (=> b!656274 (= e!376907 Undefined!6987)))

(declare-fun lt!306326 () SeekEntryResult!6987)

(declare-fun d!92643 () Bool)

(assert (=> d!92643 (and (or ((_ is Undefined!6987) lt!306326) (not ((_ is Found!6987) lt!306326)) (and (bvsge (index!30308 lt!306326) #b00000000000000000000000000000000) (bvslt (index!30308 lt!306326) (size!18911 a!2986)))) (or ((_ is Undefined!6987) lt!306326) ((_ is Found!6987) lt!306326) (not ((_ is MissingVacant!6987) lt!306326)) (not (= (index!30310 lt!306326) vacantSpotIndex!68)) (and (bvsge (index!30310 lt!306326) #b00000000000000000000000000000000) (bvslt (index!30310 lt!306326) (size!18911 a!2986)))) (or ((_ is Undefined!6987) lt!306326) (ite ((_ is Found!6987) lt!306326) (= (select (arr!18547 a!2986) (index!30308 lt!306326)) (select (arr!18547 a!2986) j!136)) (and ((_ is MissingVacant!6987) lt!306326) (= (index!30310 lt!306326) vacantSpotIndex!68) (= (select (arr!18547 a!2986) (index!30310 lt!306326)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!92643 (= lt!306326 e!376907)))

(declare-fun c!75661 () Bool)

(assert (=> d!92643 (= c!75661 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!306327 () (_ BitVec 64))

(assert (=> d!92643 (= lt!306327 (select (arr!18547 a!2986) lt!306185))))

(assert (=> d!92643 (validMask!0 mask!3053)))

(assert (=> d!92643 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!306185 vacantSpotIndex!68 (select (arr!18547 a!2986) j!136) a!2986 mask!3053) lt!306326)))

(declare-fun b!656275 () Bool)

(declare-fun e!376909 () SeekEntryResult!6987)

(assert (=> b!656275 (= e!376909 (Found!6987 lt!306185))))

(declare-fun b!656276 () Bool)

(declare-fun c!75663 () Bool)

(assert (=> b!656276 (= c!75663 (= lt!306327 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!656276 (= e!376909 e!376908)))

(declare-fun b!656277 () Bool)

(assert (=> b!656277 (= e!376908 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!306185 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!18547 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!656278 () Bool)

(assert (=> b!656278 (= e!376907 e!376909)))

(declare-fun c!75662 () Bool)

(assert (=> b!656278 (= c!75662 (= lt!306327 (select (arr!18547 a!2986) j!136)))))

(assert (= (and d!92643 c!75661) b!656274))

(assert (= (and d!92643 (not c!75661)) b!656278))

(assert (= (and b!656278 c!75662) b!656275))

(assert (= (and b!656278 (not c!75662)) b!656276))

(assert (= (and b!656276 c!75663) b!656273))

(assert (= (and b!656276 (not c!75663)) b!656277))

(declare-fun m!629363 () Bool)

(assert (=> d!92643 m!629363))

(declare-fun m!629365 () Bool)

(assert (=> d!92643 m!629365))

(declare-fun m!629367 () Bool)

(assert (=> d!92643 m!629367))

(assert (=> d!92643 m!629105))

(declare-fun m!629369 () Bool)

(assert (=> b!656277 m!629369))

(assert (=> b!656277 m!629369))

(assert (=> b!656277 m!629103))

(declare-fun m!629371 () Bool)

(assert (=> b!656277 m!629371))

(assert (=> b!656058 d!92643))

(declare-fun d!92645 () Bool)

(declare-fun lt!306334 () (_ BitVec 32))

(assert (=> d!92645 (and (bvsge lt!306334 #b00000000000000000000000000000000) (bvslt lt!306334 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!92645 (= lt!306334 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!92645 (validMask!0 mask!3053)))

(assert (=> d!92645 (= (nextIndex!0 index!984 x!910 mask!3053) lt!306334)))

(declare-fun bs!19529 () Bool)

(assert (= bs!19529 d!92645))

(declare-fun m!629373 () Bool)

(assert (=> bs!19529 m!629373))

(assert (=> bs!19529 m!629105))

(assert (=> b!656058 d!92645))

(declare-fun d!92647 () Bool)

(declare-fun e!376939 () Bool)

(assert (=> d!92647 e!376939))

(declare-fun res!425693 () Bool)

(assert (=> d!92647 (=> (not res!425693) (not e!376939))))

(assert (=> d!92647 (= res!425693 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18911 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18911 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18911 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18911 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18911 a!2986))))))

(declare-fun lt!306350 () Unit!22624)

(declare-fun choose!9 (array!38694 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22624)

(assert (=> d!92647 (= lt!306350 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!306185 vacantSpotIndex!68 mask!3053))))

(assert (=> d!92647 (validMask!0 mask!3053)))

(assert (=> d!92647 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!306185 vacantSpotIndex!68 mask!3053) lt!306350)))

(declare-fun b!656327 () Bool)

(assert (=> b!656327 (= e!376939 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!306185 vacantSpotIndex!68 (select (arr!18547 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!306185 vacantSpotIndex!68 (select (store (arr!18547 a!2986) i!1108 k0!1786) j!136) (array!38695 (store (arr!18547 a!2986) i!1108 k0!1786) (size!18911 a!2986)) mask!3053)))))

(assert (= (and d!92647 res!425693) b!656327))

(declare-fun m!629407 () Bool)

(assert (=> d!92647 m!629407))

(assert (=> d!92647 m!629105))

(assert (=> b!656327 m!629103))

(assert (=> b!656327 m!629145))

(assert (=> b!656327 m!629149))

(assert (=> b!656327 m!629099))

(assert (=> b!656327 m!629149))

(declare-fun m!629409 () Bool)

(assert (=> b!656327 m!629409))

(assert (=> b!656327 m!629103))

(assert (=> b!656058 d!92647))

(declare-fun b!656334 () Bool)

(declare-fun e!376943 () SeekEntryResult!6987)

(assert (=> b!656334 (= e!376943 (MissingVacant!6987 vacantSpotIndex!68))))

(declare-fun b!656335 () Bool)

(declare-fun e!376942 () SeekEntryResult!6987)

(assert (=> b!656335 (= e!376942 Undefined!6987)))

(declare-fun lt!306351 () SeekEntryResult!6987)

(declare-fun d!92655 () Bool)

(assert (=> d!92655 (and (or ((_ is Undefined!6987) lt!306351) (not ((_ is Found!6987) lt!306351)) (and (bvsge (index!30308 lt!306351) #b00000000000000000000000000000000) (bvslt (index!30308 lt!306351) (size!18911 lt!306187)))) (or ((_ is Undefined!6987) lt!306351) ((_ is Found!6987) lt!306351) (not ((_ is MissingVacant!6987) lt!306351)) (not (= (index!30310 lt!306351) vacantSpotIndex!68)) (and (bvsge (index!30310 lt!306351) #b00000000000000000000000000000000) (bvslt (index!30310 lt!306351) (size!18911 lt!306187)))) (or ((_ is Undefined!6987) lt!306351) (ite ((_ is Found!6987) lt!306351) (= (select (arr!18547 lt!306187) (index!30308 lt!306351)) lt!306197) (and ((_ is MissingVacant!6987) lt!306351) (= (index!30310 lt!306351) vacantSpotIndex!68) (= (select (arr!18547 lt!306187) (index!30310 lt!306351)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!92655 (= lt!306351 e!376942)))

(declare-fun c!75687 () Bool)

(assert (=> d!92655 (= c!75687 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!306352 () (_ BitVec 64))

(assert (=> d!92655 (= lt!306352 (select (arr!18547 lt!306187) lt!306185))))

(assert (=> d!92655 (validMask!0 mask!3053)))

(assert (=> d!92655 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!306185 vacantSpotIndex!68 lt!306197 lt!306187 mask!3053) lt!306351)))

(declare-fun b!656336 () Bool)

(declare-fun e!376944 () SeekEntryResult!6987)

(assert (=> b!656336 (= e!376944 (Found!6987 lt!306185))))

(declare-fun b!656337 () Bool)

(declare-fun c!75689 () Bool)

(assert (=> b!656337 (= c!75689 (= lt!306352 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!656337 (= e!376944 e!376943)))

(declare-fun b!656338 () Bool)

(assert (=> b!656338 (= e!376943 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!306185 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!306197 lt!306187 mask!3053))))

(declare-fun b!656339 () Bool)

(assert (=> b!656339 (= e!376942 e!376944)))

(declare-fun c!75688 () Bool)

(assert (=> b!656339 (= c!75688 (= lt!306352 lt!306197))))

(assert (= (and d!92655 c!75687) b!656335))

(assert (= (and d!92655 (not c!75687)) b!656339))

(assert (= (and b!656339 c!75688) b!656336))

(assert (= (and b!656339 (not c!75688)) b!656337))

(assert (= (and b!656337 c!75689) b!656334))

(assert (= (and b!656337 (not c!75689)) b!656338))

(declare-fun m!629411 () Bool)

(assert (=> d!92655 m!629411))

(declare-fun m!629413 () Bool)

(assert (=> d!92655 m!629413))

(declare-fun m!629415 () Bool)

(assert (=> d!92655 m!629415))

(assert (=> d!92655 m!629105))

(assert (=> b!656338 m!629369))

(assert (=> b!656338 m!629369))

(declare-fun m!629417 () Bool)

(assert (=> b!656338 m!629417))

(assert (=> b!656058 d!92655))

(declare-fun d!92657 () Bool)

(declare-fun res!425696 () Bool)

(declare-fun e!376947 () Bool)

(assert (=> d!92657 (=> res!425696 e!376947)))

(assert (=> d!92657 (= res!425696 (= (select (arr!18547 lt!306187) index!984) (select (arr!18547 a!2986) j!136)))))

(assert (=> d!92657 (= (arrayContainsKey!0 lt!306187 (select (arr!18547 a!2986) j!136) index!984) e!376947)))

(declare-fun b!656342 () Bool)

(declare-fun e!376948 () Bool)

(assert (=> b!656342 (= e!376947 e!376948)))

(declare-fun res!425697 () Bool)

(assert (=> b!656342 (=> (not res!425697) (not e!376948))))

(assert (=> b!656342 (= res!425697 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18911 lt!306187)))))

(declare-fun b!656343 () Bool)

(assert (=> b!656343 (= e!376948 (arrayContainsKey!0 lt!306187 (select (arr!18547 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!92657 (not res!425696)) b!656342))

(assert (= (and b!656342 res!425697) b!656343))

(assert (=> d!92657 m!629251))

(assert (=> b!656343 m!629103))

(declare-fun m!629419 () Bool)

(assert (=> b!656343 m!629419))

(assert (=> b!656048 d!92657))

(declare-fun d!92659 () Bool)

(assert (=> d!92659 (arrayContainsKey!0 lt!306187 (select (arr!18547 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!306355 () Unit!22624)

(assert (=> d!92659 (= lt!306355 (choose!114 lt!306187 (select (arr!18547 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!92659 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!92659 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!306187 (select (arr!18547 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!306355)))

(declare-fun bs!19530 () Bool)

(assert (= bs!19530 d!92659))

(assert (=> bs!19530 m!629103))

(assert (=> bs!19530 m!629115))

(assert (=> bs!19530 m!629103))

(declare-fun m!629421 () Bool)

(assert (=> bs!19530 m!629421))

(assert (=> b!656046 d!92659))

(declare-fun b!656344 () Bool)

(declare-fun e!376949 () Bool)

(assert (=> b!656344 (= e!376949 (contains!3191 Nil!12585 (select (arr!18547 lt!306187) j!136)))))

(declare-fun b!656345 () Bool)

(declare-fun e!376952 () Bool)

(declare-fun e!376951 () Bool)

(assert (=> b!656345 (= e!376952 e!376951)))

(declare-fun c!75690 () Bool)

(assert (=> b!656345 (= c!75690 (validKeyInArray!0 (select (arr!18547 lt!306187) j!136)))))

(declare-fun d!92661 () Bool)

(declare-fun res!425699 () Bool)

(declare-fun e!376950 () Bool)

(assert (=> d!92661 (=> res!425699 e!376950)))

(assert (=> d!92661 (= res!425699 (bvsge j!136 (size!18911 lt!306187)))))

(assert (=> d!92661 (= (arrayNoDuplicates!0 lt!306187 j!136 Nil!12585) e!376950)))

(declare-fun b!656346 () Bool)

(declare-fun call!33846 () Bool)

(assert (=> b!656346 (= e!376951 call!33846)))

(declare-fun b!656347 () Bool)

(assert (=> b!656347 (= e!376950 e!376952)))

(declare-fun res!425698 () Bool)

(assert (=> b!656347 (=> (not res!425698) (not e!376952))))

(assert (=> b!656347 (= res!425698 (not e!376949))))

(declare-fun res!425700 () Bool)

(assert (=> b!656347 (=> (not res!425700) (not e!376949))))

(assert (=> b!656347 (= res!425700 (validKeyInArray!0 (select (arr!18547 lt!306187) j!136)))))

(declare-fun b!656348 () Bool)

(assert (=> b!656348 (= e!376951 call!33846)))

(declare-fun bm!33843 () Bool)

(assert (=> bm!33843 (= call!33846 (arrayNoDuplicates!0 lt!306187 (bvadd j!136 #b00000000000000000000000000000001) (ite c!75690 (Cons!12584 (select (arr!18547 lt!306187) j!136) Nil!12585) Nil!12585)))))

(assert (= (and d!92661 (not res!425699)) b!656347))

(assert (= (and b!656347 res!425700) b!656344))

(assert (= (and b!656347 res!425698) b!656345))

(assert (= (and b!656345 c!75690) b!656346))

(assert (= (and b!656345 (not c!75690)) b!656348))

(assert (= (or b!656346 b!656348) bm!33843))

(assert (=> b!656344 m!629247))

(assert (=> b!656344 m!629247))

(declare-fun m!629423 () Bool)

(assert (=> b!656344 m!629423))

(assert (=> b!656345 m!629247))

(assert (=> b!656345 m!629247))

(declare-fun m!629425 () Bool)

(assert (=> b!656345 m!629425))

(assert (=> b!656347 m!629247))

(assert (=> b!656347 m!629247))

(assert (=> b!656347 m!629425))

(assert (=> bm!33843 m!629247))

(declare-fun m!629427 () Bool)

(assert (=> bm!33843 m!629427))

(assert (=> b!656046 d!92661))

(assert (=> b!656046 d!92609))

(assert (=> b!656046 d!92595))

(declare-fun d!92663 () Bool)

(assert (=> d!92663 (arrayNoDuplicates!0 lt!306187 j!136 Nil!12585)))

(declare-fun lt!306357 () Unit!22624)

(assert (=> d!92663 (= lt!306357 (choose!39 lt!306187 #b00000000000000000000000000000000 j!136))))

(assert (=> d!92663 (bvslt (size!18911 lt!306187) #b01111111111111111111111111111111)))

(assert (=> d!92663 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!306187 #b00000000000000000000000000000000 j!136) lt!306357)))

(declare-fun bs!19531 () Bool)

(assert (= bs!19531 d!92663))

(assert (=> bs!19531 m!629113))

(declare-fun m!629431 () Bool)

(assert (=> bs!19531 m!629431))

(assert (=> b!656046 d!92663))

(declare-fun d!92665 () Bool)

(declare-fun res!425705 () Bool)

(declare-fun e!376958 () Bool)

(assert (=> d!92665 (=> res!425705 e!376958)))

(assert (=> d!92665 (= res!425705 (= (select (arr!18547 lt!306187) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18547 a!2986) j!136)))))

(assert (=> d!92665 (= (arrayContainsKey!0 lt!306187 (select (arr!18547 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!376958)))

(declare-fun b!656355 () Bool)

(declare-fun e!376959 () Bool)

(assert (=> b!656355 (= e!376958 e!376959)))

(declare-fun res!425706 () Bool)

(assert (=> b!656355 (=> (not res!425706) (not e!376959))))

(assert (=> b!656355 (= res!425706 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18911 lt!306187)))))

(declare-fun b!656356 () Bool)

(assert (=> b!656356 (= e!376959 (arrayContainsKey!0 lt!306187 (select (arr!18547 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!92665 (not res!425705)) b!656355))

(assert (= (and b!656355 res!425706) b!656356))

(declare-fun m!629439 () Bool)

(assert (=> d!92665 m!629439))

(assert (=> b!656356 m!629103))

(declare-fun m!629441 () Bool)

(assert (=> b!656356 m!629441))

(assert (=> b!656046 d!92665))

(declare-fun d!92671 () Bool)

(assert (=> d!92671 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18911 lt!306187)) (not (= (select (arr!18547 lt!306187) j!136) (select (arr!18547 a!2986) j!136))))))

(declare-fun lt!306360 () Unit!22624)

(assert (=> d!92671 (= lt!306360 (choose!21 lt!306187 (select (arr!18547 a!2986) j!136) j!136 Nil!12585))))

(assert (=> d!92671 (bvslt (size!18911 lt!306187) #b01111111111111111111111111111111)))

(assert (=> d!92671 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!306187 (select (arr!18547 a!2986) j!136) j!136 Nil!12585) lt!306360)))

(declare-fun bs!19532 () Bool)

(assert (= bs!19532 d!92671))

(assert (=> bs!19532 m!629247))

(assert (=> bs!19532 m!629103))

(declare-fun m!629443 () Bool)

(assert (=> bs!19532 m!629443))

(assert (=> b!656046 d!92671))

(declare-fun d!92673 () Bool)

(assert (=> d!92673 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!656055 d!92673))

(declare-fun d!92677 () Bool)

(assert (=> d!92677 (= (validKeyInArray!0 (select (arr!18547 a!2986) j!136)) (and (not (= (select (arr!18547 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18547 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!656045 d!92677))

(assert (=> b!656056 d!92597))

(declare-fun b!656379 () Bool)

(declare-fun e!376977 () Bool)

(declare-fun call!33850 () Bool)

(assert (=> b!656379 (= e!376977 call!33850)))

(declare-fun b!656380 () Bool)

(declare-fun e!376979 () Bool)

(assert (=> b!656380 (= e!376977 e!376979)))

(declare-fun lt!306371 () (_ BitVec 64))

(assert (=> b!656380 (= lt!306371 (select (arr!18547 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!306372 () Unit!22624)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38694 (_ BitVec 64) (_ BitVec 32)) Unit!22624)

(assert (=> b!656380 (= lt!306372 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!306371 #b00000000000000000000000000000000))))

(assert (=> b!656380 (arrayContainsKey!0 a!2986 lt!306371 #b00000000000000000000000000000000)))

(declare-fun lt!306370 () Unit!22624)

(assert (=> b!656380 (= lt!306370 lt!306372)))

(declare-fun res!425720 () Bool)

(assert (=> b!656380 (= res!425720 (= (seekEntryOrOpen!0 (select (arr!18547 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6987 #b00000000000000000000000000000000)))))

(assert (=> b!656380 (=> (not res!425720) (not e!376979))))

(declare-fun d!92679 () Bool)

(declare-fun res!425719 () Bool)

(declare-fun e!376978 () Bool)

(assert (=> d!92679 (=> res!425719 e!376978)))

(assert (=> d!92679 (= res!425719 (bvsge #b00000000000000000000000000000000 (size!18911 a!2986)))))

(assert (=> d!92679 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!376978)))

(declare-fun bm!33847 () Bool)

(assert (=> bm!33847 (= call!33850 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!656381 () Bool)

(assert (=> b!656381 (= e!376979 call!33850)))

(declare-fun b!656382 () Bool)

(assert (=> b!656382 (= e!376978 e!376977)))

(declare-fun c!75697 () Bool)

(assert (=> b!656382 (= c!75697 (validKeyInArray!0 (select (arr!18547 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!92679 (not res!425719)) b!656382))

(assert (= (and b!656382 c!75697) b!656380))

(assert (= (and b!656382 (not c!75697)) b!656379))

(assert (= (and b!656380 res!425720) b!656381))

(assert (= (or b!656381 b!656379) bm!33847))

(declare-fun m!629459 () Bool)

(assert (=> b!656380 m!629459))

(declare-fun m!629461 () Bool)

(assert (=> b!656380 m!629461))

(declare-fun m!629463 () Bool)

(assert (=> b!656380 m!629463))

(assert (=> b!656380 m!629459))

(declare-fun m!629465 () Bool)

(assert (=> b!656380 m!629465))

(declare-fun m!629467 () Bool)

(assert (=> bm!33847 m!629467))

(assert (=> b!656382 m!629459))

(assert (=> b!656382 m!629459))

(declare-fun m!629469 () Bool)

(assert (=> b!656382 m!629469))

(assert (=> b!656054 d!92679))

(assert (=> b!656053 d!92657))

(declare-fun d!92687 () Bool)

(declare-fun res!425721 () Bool)

(declare-fun e!376980 () Bool)

(assert (=> d!92687 (=> res!425721 e!376980)))

(assert (=> d!92687 (= res!425721 (= (select (arr!18547 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!92687 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!376980)))

(declare-fun b!656383 () Bool)

(declare-fun e!376981 () Bool)

(assert (=> b!656383 (= e!376980 e!376981)))

(declare-fun res!425722 () Bool)

(assert (=> b!656383 (=> (not res!425722) (not e!376981))))

(assert (=> b!656383 (= res!425722 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18911 a!2986)))))

(declare-fun b!656384 () Bool)

(assert (=> b!656384 (= e!376981 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!92687 (not res!425721)) b!656383))

(assert (= (and b!656383 res!425722) b!656384))

(assert (=> d!92687 m!629459))

(declare-fun m!629471 () Bool)

(assert (=> b!656384 m!629471))

(assert (=> b!656051 d!92687))

(declare-fun b!656385 () Bool)

(declare-fun e!376982 () Bool)

(assert (=> b!656385 (= e!376982 (contains!3191 Nil!12585 (select (arr!18547 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!656386 () Bool)

(declare-fun e!376985 () Bool)

(declare-fun e!376984 () Bool)

(assert (=> b!656386 (= e!376985 e!376984)))

(declare-fun c!75698 () Bool)

(assert (=> b!656386 (= c!75698 (validKeyInArray!0 (select (arr!18547 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!92689 () Bool)

(declare-fun res!425724 () Bool)

(declare-fun e!376983 () Bool)

(assert (=> d!92689 (=> res!425724 e!376983)))

(assert (=> d!92689 (= res!425724 (bvsge #b00000000000000000000000000000000 (size!18911 a!2986)))))

(assert (=> d!92689 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12585) e!376983)))

(declare-fun b!656387 () Bool)

(declare-fun call!33851 () Bool)

(assert (=> b!656387 (= e!376984 call!33851)))

(declare-fun b!656388 () Bool)

(assert (=> b!656388 (= e!376983 e!376985)))

(declare-fun res!425723 () Bool)

(assert (=> b!656388 (=> (not res!425723) (not e!376985))))

(assert (=> b!656388 (= res!425723 (not e!376982))))

(declare-fun res!425725 () Bool)

(assert (=> b!656388 (=> (not res!425725) (not e!376982))))

(assert (=> b!656388 (= res!425725 (validKeyInArray!0 (select (arr!18547 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!656389 () Bool)

(assert (=> b!656389 (= e!376984 call!33851)))

(declare-fun bm!33848 () Bool)

(assert (=> bm!33848 (= call!33851 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!75698 (Cons!12584 (select (arr!18547 a!2986) #b00000000000000000000000000000000) Nil!12585) Nil!12585)))))

(assert (= (and d!92689 (not res!425724)) b!656388))

(assert (= (and b!656388 res!425725) b!656385))

(assert (= (and b!656388 res!425723) b!656386))

(assert (= (and b!656386 c!75698) b!656387))

(assert (= (and b!656386 (not c!75698)) b!656389))

(assert (= (or b!656387 b!656389) bm!33848))

(assert (=> b!656385 m!629459))

(assert (=> b!656385 m!629459))

(declare-fun m!629473 () Bool)

(assert (=> b!656385 m!629473))

(assert (=> b!656386 m!629459))

(assert (=> b!656386 m!629459))

(assert (=> b!656386 m!629469))

(assert (=> b!656388 m!629459))

(assert (=> b!656388 m!629459))

(assert (=> b!656388 m!629469))

(assert (=> bm!33848 m!629459))

(declare-fun m!629475 () Bool)

(assert (=> bm!33848 m!629475))

(assert (=> b!656052 d!92689))

(check-sat (not b!656347) (not b!656384) (not d!92629) (not b!656155) (not b!656271) (not b!656144) (not d!92609) (not b!656154) (not b!656327) (not b!656146) (not d!92655) (not b!656265) (not b!656277) (not b!656345) (not d!92663) (not b!656153) (not d!92593) (not d!92659) (not d!92671) (not bm!33847) (not b!656386) (not d!92617) (not b!656171) (not b!656380) (not b!656343) (not bm!33848) (not d!92599) (not d!92643) (not b!656217) (not b!656157) (not d!92647) (not b!656344) (not d!92645) (not d!92607) (not b!656382) (not b!656388) (not b!656160) (not bm!33843) (not b!656356) (not b!656338) (not bm!33834) (not bm!33833) (not b!656385) (not d!92641) (not b!656143))
(check-sat)
