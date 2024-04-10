; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53952 () Bool)

(assert start!53952)

(declare-fun b!589039 () Bool)

(declare-datatypes ((Unit!18362 0))(
  ( (Unit!18363) )
))
(declare-fun e!336322 () Unit!18362)

(declare-fun Unit!18364 () Unit!18362)

(assert (=> b!589039 (= e!336322 Unit!18364)))

(assert (=> b!589039 false))

(declare-fun b!589040 () Bool)

(declare-fun res!376612 () Bool)

(declare-fun e!336320 () Bool)

(assert (=> b!589040 (=> (not res!376612) (not e!336320))))

(declare-datatypes ((array!36796 0))(
  ( (array!36797 (arr!17671 (Array (_ BitVec 32) (_ BitVec 64))) (size!18035 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36796)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36796 (_ BitVec 32)) Bool)

(assert (=> b!589040 (= res!376612 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!589041 () Bool)

(declare-fun res!376620 () Bool)

(declare-fun e!336318 () Bool)

(assert (=> b!589041 (=> (not res!376620) (not e!336318))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!589041 (= res!376620 (and (= (size!18035 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18035 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18035 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!376618 () Bool)

(assert (=> start!53952 (=> (not res!376618) (not e!336318))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53952 (= res!376618 (validMask!0 mask!3053))))

(assert (=> start!53952 e!336318))

(assert (=> start!53952 true))

(declare-fun array_inv!13467 (array!36796) Bool)

(assert (=> start!53952 (array_inv!13467 a!2986)))

(declare-fun b!589042 () Bool)

(declare-fun e!336323 () Bool)

(assert (=> b!589042 (= e!336323 (not true))))

(declare-fun lt!267115 () Unit!18362)

(assert (=> b!589042 (= lt!267115 e!336322)))

(declare-fun lt!267116 () array!36796)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun c!66581 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lt!267114 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!6111 0))(
  ( (MissingZero!6111 (index!26674 (_ BitVec 32))) (Found!6111 (index!26675 (_ BitVec 32))) (Intermediate!6111 (undefined!6923 Bool) (index!26676 (_ BitVec 32)) (x!55469 (_ BitVec 32))) (Undefined!6111) (MissingVacant!6111 (index!26677 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36796 (_ BitVec 32)) SeekEntryResult!6111)

(assert (=> b!589042 (= c!66581 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!267114 lt!267116 mask!3053) Undefined!6111))))

(declare-fun e!336319 () Bool)

(assert (=> b!589042 e!336319))

(declare-fun res!376615 () Bool)

(assert (=> b!589042 (=> (not res!376615) (not e!336319))))

(declare-fun lt!267118 () (_ BitVec 32))

(declare-fun lt!267117 () SeekEntryResult!6111)

(assert (=> b!589042 (= res!376615 (= lt!267117 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267118 vacantSpotIndex!68 lt!267114 lt!267116 mask!3053)))))

(assert (=> b!589042 (= lt!267117 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267118 vacantSpotIndex!68 (select (arr!17671 a!2986) j!136) a!2986 mask!3053))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!589042 (= lt!267114 (select (store (arr!17671 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!267113 () Unit!18362)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36796 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18362)

(assert (=> b!589042 (= lt!267113 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!267118 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!589042 (= lt!267118 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!589043 () Bool)

(declare-fun res!376613 () Bool)

(assert (=> b!589043 (=> (not res!376613) (not e!336320))))

(declare-datatypes ((List!11712 0))(
  ( (Nil!11709) (Cons!11708 (h!12753 (_ BitVec 64)) (t!17940 List!11712)) )
))
(declare-fun arrayNoDuplicates!0 (array!36796 (_ BitVec 32) List!11712) Bool)

(assert (=> b!589043 (= res!376613 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11709))))

(declare-fun b!589044 () Bool)

(declare-fun lt!267111 () SeekEntryResult!6111)

(assert (=> b!589044 (= e!336319 (= lt!267111 lt!267117))))

(declare-fun b!589045 () Bool)

(declare-fun res!376616 () Bool)

(assert (=> b!589045 (=> (not res!376616) (not e!336318))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!589045 (= res!376616 (validKeyInArray!0 (select (arr!17671 a!2986) j!136)))))

(declare-fun b!589046 () Bool)

(declare-fun e!336324 () Bool)

(assert (=> b!589046 (= e!336320 e!336324)))

(declare-fun res!376619 () Bool)

(assert (=> b!589046 (=> (not res!376619) (not e!336324))))

(assert (=> b!589046 (= res!376619 (= (select (store (arr!17671 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!589046 (= lt!267116 (array!36797 (store (arr!17671 a!2986) i!1108 k0!1786) (size!18035 a!2986)))))

(declare-fun b!589047 () Bool)

(assert (=> b!589047 (= e!336318 e!336320)))

(declare-fun res!376621 () Bool)

(assert (=> b!589047 (=> (not res!376621) (not e!336320))))

(declare-fun lt!267112 () SeekEntryResult!6111)

(assert (=> b!589047 (= res!376621 (or (= lt!267112 (MissingZero!6111 i!1108)) (= lt!267112 (MissingVacant!6111 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36796 (_ BitVec 32)) SeekEntryResult!6111)

(assert (=> b!589047 (= lt!267112 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!589048 () Bool)

(assert (=> b!589048 (= e!336324 e!336323)))

(declare-fun res!376611 () Bool)

(assert (=> b!589048 (=> (not res!376611) (not e!336323))))

(assert (=> b!589048 (= res!376611 (and (= lt!267111 (Found!6111 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17671 a!2986) index!984) (select (arr!17671 a!2986) j!136))) (not (= (select (arr!17671 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!589048 (= lt!267111 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17671 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!589049 () Bool)

(declare-fun res!376614 () Bool)

(assert (=> b!589049 (=> (not res!376614) (not e!336318))))

(assert (=> b!589049 (= res!376614 (validKeyInArray!0 k0!1786))))

(declare-fun b!589050 () Bool)

(declare-fun res!376622 () Bool)

(assert (=> b!589050 (=> (not res!376622) (not e!336318))))

(declare-fun arrayContainsKey!0 (array!36796 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!589050 (= res!376622 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!589051 () Bool)

(declare-fun Unit!18365 () Unit!18362)

(assert (=> b!589051 (= e!336322 Unit!18365)))

(declare-fun b!589052 () Bool)

(declare-fun res!376617 () Bool)

(assert (=> b!589052 (=> (not res!376617) (not e!336320))))

(assert (=> b!589052 (= res!376617 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17671 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!53952 res!376618) b!589041))

(assert (= (and b!589041 res!376620) b!589045))

(assert (= (and b!589045 res!376616) b!589049))

(assert (= (and b!589049 res!376614) b!589050))

(assert (= (and b!589050 res!376622) b!589047))

(assert (= (and b!589047 res!376621) b!589040))

(assert (= (and b!589040 res!376612) b!589043))

(assert (= (and b!589043 res!376613) b!589052))

(assert (= (and b!589052 res!376617) b!589046))

(assert (= (and b!589046 res!376619) b!589048))

(assert (= (and b!589048 res!376611) b!589042))

(assert (= (and b!589042 res!376615) b!589044))

(assert (= (and b!589042 c!66581) b!589039))

(assert (= (and b!589042 (not c!66581)) b!589051))

(declare-fun m!567587 () Bool)

(assert (=> b!589049 m!567587))

(declare-fun m!567589 () Bool)

(assert (=> start!53952 m!567589))

(declare-fun m!567591 () Bool)

(assert (=> start!53952 m!567591))

(declare-fun m!567593 () Bool)

(assert (=> b!589047 m!567593))

(declare-fun m!567595 () Bool)

(assert (=> b!589045 m!567595))

(assert (=> b!589045 m!567595))

(declare-fun m!567597 () Bool)

(assert (=> b!589045 m!567597))

(declare-fun m!567599 () Bool)

(assert (=> b!589043 m!567599))

(declare-fun m!567601 () Bool)

(assert (=> b!589042 m!567601))

(declare-fun m!567603 () Bool)

(assert (=> b!589042 m!567603))

(assert (=> b!589042 m!567595))

(declare-fun m!567605 () Bool)

(assert (=> b!589042 m!567605))

(assert (=> b!589042 m!567595))

(declare-fun m!567607 () Bool)

(assert (=> b!589042 m!567607))

(declare-fun m!567609 () Bool)

(assert (=> b!589042 m!567609))

(declare-fun m!567611 () Bool)

(assert (=> b!589042 m!567611))

(declare-fun m!567613 () Bool)

(assert (=> b!589042 m!567613))

(assert (=> b!589046 m!567607))

(declare-fun m!567615 () Bool)

(assert (=> b!589046 m!567615))

(declare-fun m!567617 () Bool)

(assert (=> b!589050 m!567617))

(declare-fun m!567619 () Bool)

(assert (=> b!589048 m!567619))

(assert (=> b!589048 m!567595))

(assert (=> b!589048 m!567595))

(declare-fun m!567621 () Bool)

(assert (=> b!589048 m!567621))

(declare-fun m!567623 () Bool)

(assert (=> b!589052 m!567623))

(declare-fun m!567625 () Bool)

(assert (=> b!589040 m!567625))

(check-sat (not b!589043) (not b!589050) (not b!589049) (not b!589048) (not b!589040) (not b!589045) (not b!589047) (not start!53952) (not b!589042))
(check-sat)
