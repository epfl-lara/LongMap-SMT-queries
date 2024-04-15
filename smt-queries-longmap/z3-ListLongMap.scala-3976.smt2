; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53910 () Bool)

(assert start!53910)

(declare-fun b!588236 () Bool)

(declare-fun res!376023 () Bool)

(declare-fun e!335881 () Bool)

(assert (=> b!588236 (=> (not res!376023) (not e!335881))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36768 0))(
  ( (array!36769 (arr!17657 (Array (_ BitVec 32) (_ BitVec 64))) (size!18022 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36768)

(assert (=> b!588236 (= res!376023 (and (= (size!18022 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18022 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18022 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!376019 () Bool)

(assert (=> start!53910 (=> (not res!376019) (not e!335881))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53910 (= res!376019 (validMask!0 mask!3053))))

(assert (=> start!53910 e!335881))

(assert (=> start!53910 true))

(declare-fun array_inv!13540 (array!36768) Bool)

(assert (=> start!53910 (array_inv!13540 a!2986)))

(declare-fun b!588237 () Bool)

(declare-fun e!335880 () Bool)

(declare-fun e!335882 () Bool)

(assert (=> b!588237 (= e!335880 e!335882)))

(declare-fun res!376020 () Bool)

(assert (=> b!588237 (=> (not res!376020) (not e!335882))))

(declare-datatypes ((SeekEntryResult!6094 0))(
  ( (MissingZero!6094 (index!26606 (_ BitVec 32))) (Found!6094 (index!26607 (_ BitVec 32))) (Intermediate!6094 (undefined!6906 Bool) (index!26608 (_ BitVec 32)) (x!55415 (_ BitVec 32))) (Undefined!6094) (MissingVacant!6094 (index!26609 (_ BitVec 32))) )
))
(declare-fun lt!266586 () SeekEntryResult!6094)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!588237 (= res!376020 (and (= lt!266586 (Found!6094 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17657 a!2986) index!984) (select (arr!17657 a!2986) j!136))) (not (= (select (arr!17657 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36768 (_ BitVec 32)) SeekEntryResult!6094)

(assert (=> b!588237 (= lt!266586 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17657 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!588238 () Bool)

(declare-fun res!376014 () Bool)

(assert (=> b!588238 (=> (not res!376014) (not e!335881))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!588238 (= res!376014 (validKeyInArray!0 (select (arr!17657 a!2986) j!136)))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun b!588239 () Bool)

(declare-fun e!335878 () Bool)

(assert (=> b!588239 (= e!335878 (validKeyInArray!0 (select (store (arr!17657 a!2986) i!1108 k0!1786) j!136)))))

(declare-fun b!588240 () Bool)

(assert (=> b!588240 (= e!335881 e!335880)))

(declare-fun res!376017 () Bool)

(assert (=> b!588240 (=> (not res!376017) (not e!335880))))

(declare-fun lt!266587 () SeekEntryResult!6094)

(assert (=> b!588240 (= res!376017 (or (= lt!266587 (MissingZero!6094 i!1108)) (= lt!266587 (MissingVacant!6094 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36768 (_ BitVec 32)) SeekEntryResult!6094)

(assert (=> b!588240 (= lt!266587 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!588241 () Bool)

(declare-fun res!376024 () Bool)

(assert (=> b!588241 (=> (not res!376024) (not e!335880))))

(assert (=> b!588241 (= res!376024 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17657 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17657 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!588242 () Bool)

(assert (=> b!588242 (= e!335882 (not e!335878))))

(declare-fun res!376016 () Bool)

(assert (=> b!588242 (=> res!376016 e!335878)))

(assert (=> b!588242 (= res!376016 (bvslt mask!3053 #b00000000000000000000000000000000))))

(declare-fun e!335883 () Bool)

(assert (=> b!588242 e!335883))

(declare-fun res!376015 () Bool)

(assert (=> b!588242 (=> (not res!376015) (not e!335883))))

(declare-fun lt!266588 () SeekEntryResult!6094)

(declare-fun lt!266590 () (_ BitVec 32))

(assert (=> b!588242 (= res!376015 (= lt!266588 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266590 vacantSpotIndex!68 (select (store (arr!17657 a!2986) i!1108 k0!1786) j!136) (array!36769 (store (arr!17657 a!2986) i!1108 k0!1786) (size!18022 a!2986)) mask!3053)))))

(assert (=> b!588242 (= lt!266588 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266590 vacantSpotIndex!68 (select (arr!17657 a!2986) j!136) a!2986 mask!3053))))

(declare-datatypes ((Unit!18294 0))(
  ( (Unit!18295) )
))
(declare-fun lt!266589 () Unit!18294)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36768 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18294)

(assert (=> b!588242 (= lt!266589 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266590 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!588242 (= lt!266590 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!588243 () Bool)

(declare-fun res!376022 () Bool)

(assert (=> b!588243 (=> (not res!376022) (not e!335880))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36768 (_ BitVec 32)) Bool)

(assert (=> b!588243 (= res!376022 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!588244 () Bool)

(declare-fun res!376025 () Bool)

(assert (=> b!588244 (=> (not res!376025) (not e!335881))))

(assert (=> b!588244 (= res!376025 (validKeyInArray!0 k0!1786))))

(declare-fun b!588245 () Bool)

(declare-fun res!376018 () Bool)

(assert (=> b!588245 (=> (not res!376018) (not e!335881))))

(declare-fun arrayContainsKey!0 (array!36768 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!588245 (= res!376018 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!588246 () Bool)

(assert (=> b!588246 (= e!335883 (= lt!266586 lt!266588))))

(declare-fun b!588247 () Bool)

(declare-fun res!376021 () Bool)

(assert (=> b!588247 (=> (not res!376021) (not e!335880))))

(declare-datatypes ((List!11737 0))(
  ( (Nil!11734) (Cons!11733 (h!12778 (_ BitVec 64)) (t!17956 List!11737)) )
))
(declare-fun arrayNoDuplicates!0 (array!36768 (_ BitVec 32) List!11737) Bool)

(assert (=> b!588247 (= res!376021 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11734))))

(assert (= (and start!53910 res!376019) b!588236))

(assert (= (and b!588236 res!376023) b!588238))

(assert (= (and b!588238 res!376014) b!588244))

(assert (= (and b!588244 res!376025) b!588245))

(assert (= (and b!588245 res!376018) b!588240))

(assert (= (and b!588240 res!376017) b!588243))

(assert (= (and b!588243 res!376022) b!588247))

(assert (= (and b!588247 res!376021) b!588241))

(assert (= (and b!588241 res!376024) b!588237))

(assert (= (and b!588237 res!376020) b!588242))

(assert (= (and b!588242 res!376015) b!588246))

(assert (= (and b!588242 (not res!376016)) b!588239))

(declare-fun m!566281 () Bool)

(assert (=> b!588245 m!566281))

(declare-fun m!566283 () Bool)

(assert (=> b!588238 m!566283))

(assert (=> b!588238 m!566283))

(declare-fun m!566285 () Bool)

(assert (=> b!588238 m!566285))

(declare-fun m!566287 () Bool)

(assert (=> b!588243 m!566287))

(declare-fun m!566289 () Bool)

(assert (=> b!588247 m!566289))

(declare-fun m!566291 () Bool)

(assert (=> b!588241 m!566291))

(declare-fun m!566293 () Bool)

(assert (=> b!588241 m!566293))

(declare-fun m!566295 () Bool)

(assert (=> b!588241 m!566295))

(declare-fun m!566297 () Bool)

(assert (=> b!588242 m!566297))

(declare-fun m!566299 () Bool)

(assert (=> b!588242 m!566299))

(assert (=> b!588242 m!566283))

(assert (=> b!588242 m!566283))

(declare-fun m!566301 () Bool)

(assert (=> b!588242 m!566301))

(assert (=> b!588242 m!566293))

(declare-fun m!566303 () Bool)

(assert (=> b!588242 m!566303))

(assert (=> b!588242 m!566299))

(declare-fun m!566305 () Bool)

(assert (=> b!588242 m!566305))

(declare-fun m!566307 () Bool)

(assert (=> b!588237 m!566307))

(assert (=> b!588237 m!566283))

(assert (=> b!588237 m!566283))

(declare-fun m!566309 () Bool)

(assert (=> b!588237 m!566309))

(assert (=> b!588239 m!566293))

(assert (=> b!588239 m!566299))

(assert (=> b!588239 m!566299))

(declare-fun m!566311 () Bool)

(assert (=> b!588239 m!566311))

(declare-fun m!566313 () Bool)

(assert (=> b!588240 m!566313))

(declare-fun m!566315 () Bool)

(assert (=> b!588244 m!566315))

(declare-fun m!566317 () Bool)

(assert (=> start!53910 m!566317))

(declare-fun m!566319 () Bool)

(assert (=> start!53910 m!566319))

(check-sat (not b!588237) (not start!53910) (not b!588239) (not b!588242) (not b!588245) (not b!588244) (not b!588238) (not b!588243) (not b!588247) (not b!588240))
(check-sat)
