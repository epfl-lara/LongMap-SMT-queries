; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53970 () Bool)

(assert start!53970)

(declare-fun b!588615 () Bool)

(declare-fun e!336134 () Bool)

(declare-fun e!336137 () Bool)

(assert (=> b!588615 (= e!336134 e!336137)))

(declare-fun res!376154 () Bool)

(assert (=> b!588615 (=> (not res!376154) (not e!336137))))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6046 0))(
  ( (MissingZero!6046 (index!26414 (_ BitVec 32))) (Found!6046 (index!26415 (_ BitVec 32))) (Intermediate!6046 (undefined!6858 Bool) (index!26416 (_ BitVec 32)) (x!55367 (_ BitVec 32))) (Undefined!6046) (MissingVacant!6046 (index!26417 (_ BitVec 32))) )
))
(declare-fun lt!266877 () SeekEntryResult!6046)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36759 0))(
  ( (array!36760 (arr!17650 (Array (_ BitVec 32) (_ BitVec 64))) (size!18014 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36759)

(assert (=> b!588615 (= res!376154 (and (= lt!266877 (Found!6046 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17650 a!2986) index!984) (select (arr!17650 a!2986) j!136))) (not (= (select (arr!17650 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36759 (_ BitVec 32)) SeekEntryResult!6046)

(assert (=> b!588615 (= lt!266877 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17650 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!588616 () Bool)

(assert (=> b!588616 (= e!336137 (not true))))

(declare-fun e!336138 () Bool)

(assert (=> b!588616 e!336138))

(declare-fun res!376148 () Bool)

(assert (=> b!588616 (=> (not res!376148) (not e!336138))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lt!266879 () (_ BitVec 32))

(declare-fun lt!266878 () SeekEntryResult!6046)

(assert (=> b!588616 (= res!376148 (= lt!266878 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266879 vacantSpotIndex!68 (select (store (arr!17650 a!2986) i!1108 k0!1786) j!136) (array!36760 (store (arr!17650 a!2986) i!1108 k0!1786) (size!18014 a!2986)) mask!3053)))))

(assert (=> b!588616 (= lt!266878 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266879 vacantSpotIndex!68 (select (arr!17650 a!2986) j!136) a!2986 mask!3053))))

(declare-datatypes ((Unit!18289 0))(
  ( (Unit!18290) )
))
(declare-fun lt!266880 () Unit!18289)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36759 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18289)

(assert (=> b!588616 (= lt!266880 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266879 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!588616 (= lt!266879 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!588617 () Bool)

(declare-fun res!376149 () Bool)

(assert (=> b!588617 (=> (not res!376149) (not e!336134))))

(declare-datatypes ((List!11598 0))(
  ( (Nil!11595) (Cons!11594 (h!12642 (_ BitVec 64)) (t!17818 List!11598)) )
))
(declare-fun arrayNoDuplicates!0 (array!36759 (_ BitVec 32) List!11598) Bool)

(assert (=> b!588617 (= res!376149 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11595))))

(declare-fun b!588618 () Bool)

(declare-fun res!376146 () Bool)

(declare-fun e!336135 () Bool)

(assert (=> b!588618 (=> (not res!376146) (not e!336135))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!588618 (= res!376146 (validKeyInArray!0 k0!1786))))

(declare-fun res!376152 () Bool)

(assert (=> start!53970 (=> (not res!376152) (not e!336135))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53970 (= res!376152 (validMask!0 mask!3053))))

(assert (=> start!53970 e!336135))

(assert (=> start!53970 true))

(declare-fun array_inv!13509 (array!36759) Bool)

(assert (=> start!53970 (array_inv!13509 a!2986)))

(declare-fun b!588619 () Bool)

(assert (=> b!588619 (= e!336135 e!336134)))

(declare-fun res!376147 () Bool)

(assert (=> b!588619 (=> (not res!376147) (not e!336134))))

(declare-fun lt!266881 () SeekEntryResult!6046)

(assert (=> b!588619 (= res!376147 (or (= lt!266881 (MissingZero!6046 i!1108)) (= lt!266881 (MissingVacant!6046 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36759 (_ BitVec 32)) SeekEntryResult!6046)

(assert (=> b!588619 (= lt!266881 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!588620 () Bool)

(declare-fun res!376153 () Bool)

(assert (=> b!588620 (=> (not res!376153) (not e!336134))))

(assert (=> b!588620 (= res!376153 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17650 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17650 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!588621 () Bool)

(declare-fun res!376151 () Bool)

(assert (=> b!588621 (=> (not res!376151) (not e!336134))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36759 (_ BitVec 32)) Bool)

(assert (=> b!588621 (= res!376151 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!588622 () Bool)

(assert (=> b!588622 (= e!336138 (= lt!266877 lt!266878))))

(declare-fun b!588623 () Bool)

(declare-fun res!376150 () Bool)

(assert (=> b!588623 (=> (not res!376150) (not e!336135))))

(assert (=> b!588623 (= res!376150 (validKeyInArray!0 (select (arr!17650 a!2986) j!136)))))

(declare-fun b!588624 () Bool)

(declare-fun res!376156 () Bool)

(assert (=> b!588624 (=> (not res!376156) (not e!336135))))

(assert (=> b!588624 (= res!376156 (and (= (size!18014 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18014 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18014 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!588625 () Bool)

(declare-fun res!376155 () Bool)

(assert (=> b!588625 (=> (not res!376155) (not e!336135))))

(declare-fun arrayContainsKey!0 (array!36759 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!588625 (= res!376155 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!53970 res!376152) b!588624))

(assert (= (and b!588624 res!376156) b!588623))

(assert (= (and b!588623 res!376150) b!588618))

(assert (= (and b!588618 res!376146) b!588625))

(assert (= (and b!588625 res!376155) b!588619))

(assert (= (and b!588619 res!376147) b!588621))

(assert (= (and b!588621 res!376151) b!588617))

(assert (= (and b!588617 res!376149) b!588620))

(assert (= (and b!588620 res!376153) b!588615))

(assert (= (and b!588615 res!376154) b!588616))

(assert (= (and b!588616 res!376148) b!588622))

(declare-fun m!567317 () Bool)

(assert (=> b!588617 m!567317))

(declare-fun m!567319 () Bool)

(assert (=> b!588623 m!567319))

(assert (=> b!588623 m!567319))

(declare-fun m!567321 () Bool)

(assert (=> b!588623 m!567321))

(declare-fun m!567323 () Bool)

(assert (=> b!588621 m!567323))

(declare-fun m!567325 () Bool)

(assert (=> b!588619 m!567325))

(declare-fun m!567327 () Bool)

(assert (=> b!588616 m!567327))

(declare-fun m!567329 () Bool)

(assert (=> b!588616 m!567329))

(assert (=> b!588616 m!567319))

(declare-fun m!567331 () Bool)

(assert (=> b!588616 m!567331))

(declare-fun m!567333 () Bool)

(assert (=> b!588616 m!567333))

(assert (=> b!588616 m!567329))

(declare-fun m!567335 () Bool)

(assert (=> b!588616 m!567335))

(assert (=> b!588616 m!567319))

(declare-fun m!567337 () Bool)

(assert (=> b!588616 m!567337))

(declare-fun m!567339 () Bool)

(assert (=> b!588625 m!567339))

(declare-fun m!567341 () Bool)

(assert (=> start!53970 m!567341))

(declare-fun m!567343 () Bool)

(assert (=> start!53970 m!567343))

(declare-fun m!567345 () Bool)

(assert (=> b!588620 m!567345))

(assert (=> b!588620 m!567331))

(declare-fun m!567347 () Bool)

(assert (=> b!588620 m!567347))

(declare-fun m!567349 () Bool)

(assert (=> b!588615 m!567349))

(assert (=> b!588615 m!567319))

(assert (=> b!588615 m!567319))

(declare-fun m!567351 () Bool)

(assert (=> b!588615 m!567351))

(declare-fun m!567353 () Bool)

(assert (=> b!588618 m!567353))

(check-sat (not b!588617) (not b!588623) (not b!588625) (not b!588618) (not b!588621) (not b!588619) (not start!53970) (not b!588615) (not b!588616))
(check-sat)
