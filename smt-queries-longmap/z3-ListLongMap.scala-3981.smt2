; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53958 () Bool)

(assert start!53958)

(declare-fun b!589165 () Bool)

(declare-fun res!376722 () Bool)

(declare-fun e!336382 () Bool)

(assert (=> b!589165 (=> (not res!376722) (not e!336382))))

(declare-datatypes ((array!36802 0))(
  ( (array!36803 (arr!17674 (Array (_ BitVec 32) (_ BitVec 64))) (size!18038 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36802)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36802 (_ BitVec 32)) Bool)

(assert (=> b!589165 (= res!376722 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!589166 () Bool)

(declare-fun res!376725 () Bool)

(declare-fun e!336385 () Bool)

(assert (=> b!589166 (=> (not res!376725) (not e!336385))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!589166 (= res!376725 (validKeyInArray!0 (select (arr!17674 a!2986) j!136)))))

(declare-fun b!589167 () Bool)

(declare-fun res!376727 () Bool)

(assert (=> b!589167 (=> (not res!376727) (not e!336382))))

(declare-datatypes ((List!11715 0))(
  ( (Nil!11712) (Cons!11711 (h!12756 (_ BitVec 64)) (t!17943 List!11715)) )
))
(declare-fun arrayNoDuplicates!0 (array!36802 (_ BitVec 32) List!11715) Bool)

(assert (=> b!589167 (= res!376727 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11712))))

(declare-fun b!589168 () Bool)

(declare-fun e!336386 () Bool)

(assert (=> b!589168 (= e!336382 e!336386)))

(declare-fun res!376724 () Bool)

(assert (=> b!589168 (=> (not res!376724) (not e!336386))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!589168 (= res!376724 (= (select (store (arr!17674 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!267187 () array!36802)

(assert (=> b!589168 (= lt!267187 (array!36803 (store (arr!17674 a!2986) i!1108 k0!1786) (size!18038 a!2986)))))

(declare-fun res!376730 () Bool)

(assert (=> start!53958 (=> (not res!376730) (not e!336385))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53958 (= res!376730 (validMask!0 mask!3053))))

(assert (=> start!53958 e!336385))

(assert (=> start!53958 true))

(declare-fun array_inv!13470 (array!36802) Bool)

(assert (=> start!53958 (array_inv!13470 a!2986)))

(declare-fun b!589169 () Bool)

(declare-fun res!376729 () Bool)

(assert (=> b!589169 (=> (not res!376729) (not e!336385))))

(assert (=> b!589169 (= res!376729 (validKeyInArray!0 k0!1786))))

(declare-fun b!589170 () Bool)

(declare-datatypes ((Unit!18374 0))(
  ( (Unit!18375) )
))
(declare-fun e!336381 () Unit!18374)

(declare-fun Unit!18376 () Unit!18374)

(assert (=> b!589170 (= e!336381 Unit!18376)))

(assert (=> b!589170 false))

(declare-fun b!589171 () Bool)

(assert (=> b!589171 (= e!336385 e!336382)))

(declare-fun res!376721 () Bool)

(assert (=> b!589171 (=> (not res!376721) (not e!336382))))

(declare-datatypes ((SeekEntryResult!6114 0))(
  ( (MissingZero!6114 (index!26686 (_ BitVec 32))) (Found!6114 (index!26687 (_ BitVec 32))) (Intermediate!6114 (undefined!6926 Bool) (index!26688 (_ BitVec 32)) (x!55480 (_ BitVec 32))) (Undefined!6114) (MissingVacant!6114 (index!26689 (_ BitVec 32))) )
))
(declare-fun lt!267186 () SeekEntryResult!6114)

(assert (=> b!589171 (= res!376721 (or (= lt!267186 (MissingZero!6114 i!1108)) (= lt!267186 (MissingVacant!6114 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36802 (_ BitVec 32)) SeekEntryResult!6114)

(assert (=> b!589171 (= lt!267186 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!589172 () Bool)

(declare-fun res!376723 () Bool)

(assert (=> b!589172 (=> (not res!376723) (not e!336382))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!589172 (= res!376723 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17674 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!589173 () Bool)

(declare-fun e!336387 () Bool)

(declare-fun lt!267183 () SeekEntryResult!6114)

(declare-fun lt!267190 () SeekEntryResult!6114)

(assert (=> b!589173 (= e!336387 (= lt!267183 lt!267190))))

(declare-fun b!589174 () Bool)

(declare-fun e!336383 () Bool)

(assert (=> b!589174 (= e!336383 (not true))))

(declare-fun lt!267184 () Unit!18374)

(assert (=> b!589174 (= lt!267184 e!336381)))

(declare-fun c!66590 () Bool)

(declare-fun lt!267188 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36802 (_ BitVec 32)) SeekEntryResult!6114)

(assert (=> b!589174 (= c!66590 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!267188 lt!267187 mask!3053) Undefined!6114))))

(assert (=> b!589174 e!336387))

(declare-fun res!376728 () Bool)

(assert (=> b!589174 (=> (not res!376728) (not e!336387))))

(declare-fun lt!267189 () (_ BitVec 32))

(assert (=> b!589174 (= res!376728 (= lt!267190 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267189 vacantSpotIndex!68 lt!267188 lt!267187 mask!3053)))))

(assert (=> b!589174 (= lt!267190 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267189 vacantSpotIndex!68 (select (arr!17674 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!589174 (= lt!267188 (select (store (arr!17674 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!267185 () Unit!18374)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36802 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18374)

(assert (=> b!589174 (= lt!267185 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!267189 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!589174 (= lt!267189 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!589175 () Bool)

(declare-fun res!376719 () Bool)

(assert (=> b!589175 (=> (not res!376719) (not e!336385))))

(assert (=> b!589175 (= res!376719 (and (= (size!18038 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18038 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18038 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!589176 () Bool)

(declare-fun res!376720 () Bool)

(assert (=> b!589176 (=> (not res!376720) (not e!336385))))

(declare-fun arrayContainsKey!0 (array!36802 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!589176 (= res!376720 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!589177 () Bool)

(assert (=> b!589177 (= e!336386 e!336383)))

(declare-fun res!376726 () Bool)

(assert (=> b!589177 (=> (not res!376726) (not e!336383))))

(assert (=> b!589177 (= res!376726 (and (= lt!267183 (Found!6114 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17674 a!2986) index!984) (select (arr!17674 a!2986) j!136))) (not (= (select (arr!17674 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!589177 (= lt!267183 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17674 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!589178 () Bool)

(declare-fun Unit!18377 () Unit!18374)

(assert (=> b!589178 (= e!336381 Unit!18377)))

(assert (= (and start!53958 res!376730) b!589175))

(assert (= (and b!589175 res!376719) b!589166))

(assert (= (and b!589166 res!376725) b!589169))

(assert (= (and b!589169 res!376729) b!589176))

(assert (= (and b!589176 res!376720) b!589171))

(assert (= (and b!589171 res!376721) b!589165))

(assert (= (and b!589165 res!376722) b!589167))

(assert (= (and b!589167 res!376727) b!589172))

(assert (= (and b!589172 res!376723) b!589168))

(assert (= (and b!589168 res!376724) b!589177))

(assert (= (and b!589177 res!376726) b!589174))

(assert (= (and b!589174 res!376728) b!589173))

(assert (= (and b!589174 c!66590) b!589170))

(assert (= (and b!589174 (not c!66590)) b!589178))

(declare-fun m!567707 () Bool)

(assert (=> b!589172 m!567707))

(declare-fun m!567709 () Bool)

(assert (=> b!589166 m!567709))

(assert (=> b!589166 m!567709))

(declare-fun m!567711 () Bool)

(assert (=> b!589166 m!567711))

(declare-fun m!567713 () Bool)

(assert (=> start!53958 m!567713))

(declare-fun m!567715 () Bool)

(assert (=> start!53958 m!567715))

(declare-fun m!567717 () Bool)

(assert (=> b!589167 m!567717))

(declare-fun m!567719 () Bool)

(assert (=> b!589174 m!567719))

(declare-fun m!567721 () Bool)

(assert (=> b!589174 m!567721))

(assert (=> b!589174 m!567709))

(assert (=> b!589174 m!567709))

(declare-fun m!567723 () Bool)

(assert (=> b!589174 m!567723))

(declare-fun m!567725 () Bool)

(assert (=> b!589174 m!567725))

(declare-fun m!567727 () Bool)

(assert (=> b!589174 m!567727))

(declare-fun m!567729 () Bool)

(assert (=> b!589174 m!567729))

(declare-fun m!567731 () Bool)

(assert (=> b!589174 m!567731))

(declare-fun m!567733 () Bool)

(assert (=> b!589169 m!567733))

(declare-fun m!567735 () Bool)

(assert (=> b!589177 m!567735))

(assert (=> b!589177 m!567709))

(assert (=> b!589177 m!567709))

(declare-fun m!567737 () Bool)

(assert (=> b!589177 m!567737))

(assert (=> b!589168 m!567731))

(declare-fun m!567739 () Bool)

(assert (=> b!589168 m!567739))

(declare-fun m!567741 () Bool)

(assert (=> b!589171 m!567741))

(declare-fun m!567743 () Bool)

(assert (=> b!589176 m!567743))

(declare-fun m!567745 () Bool)

(assert (=> b!589165 m!567745))

(check-sat (not b!589176) (not b!589171) (not b!589166) (not b!589165) (not start!53958) (not b!589177) (not b!589167) (not b!589169) (not b!589174))
(check-sat)
