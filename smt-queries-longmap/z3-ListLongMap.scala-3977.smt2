; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53934 () Bool)

(assert start!53934)

(declare-fun b!588661 () Bool)

(declare-datatypes ((Unit!18326 0))(
  ( (Unit!18327) )
))
(declare-fun e!336134 () Unit!18326)

(declare-fun Unit!18328 () Unit!18326)

(assert (=> b!588661 (= e!336134 Unit!18328)))

(declare-fun b!588662 () Bool)

(declare-fun res!376293 () Bool)

(declare-fun e!336131 () Bool)

(assert (=> b!588662 (=> (not res!376293) (not e!336131))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36778 0))(
  ( (array!36779 (arr!17662 (Array (_ BitVec 32) (_ BitVec 64))) (size!18026 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36778)

(assert (=> b!588662 (= res!376293 (and (= (size!18026 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18026 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18026 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!588663 () Bool)

(declare-fun e!336130 () Bool)

(declare-fun e!336132 () Bool)

(assert (=> b!588663 (= e!336130 e!336132)))

(declare-fun res!376298 () Bool)

(assert (=> b!588663 (=> (not res!376298) (not e!336132))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!588663 (= res!376298 (= (select (store (arr!17662 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!266902 () array!36778)

(assert (=> b!588663 (= lt!266902 (array!36779 (store (arr!17662 a!2986) i!1108 k0!1786) (size!18026 a!2986)))))

(declare-fun b!588665 () Bool)

(declare-fun e!336135 () Bool)

(assert (=> b!588665 (= e!336135 (not true))))

(declare-fun lt!266895 () Unit!18326)

(assert (=> b!588665 (= lt!266895 e!336134)))

(declare-fun c!66554 () Bool)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lt!266896 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!6102 0))(
  ( (MissingZero!6102 (index!26638 (_ BitVec 32))) (Found!6102 (index!26639 (_ BitVec 32))) (Intermediate!6102 (undefined!6914 Bool) (index!26640 (_ BitVec 32)) (x!55436 (_ BitVec 32))) (Undefined!6102) (MissingVacant!6102 (index!26641 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36778 (_ BitVec 32)) SeekEntryResult!6102)

(assert (=> b!588665 (= c!66554 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!266896 lt!266902 mask!3053) Undefined!6102))))

(declare-fun e!336133 () Bool)

(assert (=> b!588665 e!336133))

(declare-fun res!376288 () Bool)

(assert (=> b!588665 (=> (not res!376288) (not e!336133))))

(declare-fun lt!266899 () SeekEntryResult!6102)

(declare-fun lt!266898 () (_ BitVec 32))

(assert (=> b!588665 (= res!376288 (= lt!266899 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266898 vacantSpotIndex!68 lt!266896 lt!266902 mask!3053)))))

(assert (=> b!588665 (= lt!266899 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266898 vacantSpotIndex!68 (select (arr!17662 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!588665 (= lt!266896 (select (store (arr!17662 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!266901 () Unit!18326)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36778 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18326)

(assert (=> b!588665 (= lt!266901 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266898 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!588665 (= lt!266898 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!588666 () Bool)

(assert (=> b!588666 (= e!336132 e!336135)))

(declare-fun res!376287 () Bool)

(assert (=> b!588666 (=> (not res!376287) (not e!336135))))

(declare-fun lt!266900 () SeekEntryResult!6102)

(assert (=> b!588666 (= res!376287 (and (= lt!266900 (Found!6102 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17662 a!2986) index!984) (select (arr!17662 a!2986) j!136))) (not (= (select (arr!17662 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!588666 (= lt!266900 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17662 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!588667 () Bool)

(declare-fun res!376291 () Bool)

(assert (=> b!588667 (=> (not res!376291) (not e!336130))))

(assert (=> b!588667 (= res!376291 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17662 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!588668 () Bool)

(declare-fun Unit!18329 () Unit!18326)

(assert (=> b!588668 (= e!336134 Unit!18329)))

(assert (=> b!588668 false))

(declare-fun b!588669 () Bool)

(declare-fun res!376296 () Bool)

(assert (=> b!588669 (=> (not res!376296) (not e!336131))))

(declare-fun arrayContainsKey!0 (array!36778 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!588669 (= res!376296 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!588670 () Bool)

(assert (=> b!588670 (= e!336131 e!336130)))

(declare-fun res!376290 () Bool)

(assert (=> b!588670 (=> (not res!376290) (not e!336130))))

(declare-fun lt!266897 () SeekEntryResult!6102)

(assert (=> b!588670 (= res!376290 (or (= lt!266897 (MissingZero!6102 i!1108)) (= lt!266897 (MissingVacant!6102 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36778 (_ BitVec 32)) SeekEntryResult!6102)

(assert (=> b!588670 (= lt!266897 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!588671 () Bool)

(assert (=> b!588671 (= e!336133 (= lt!266900 lt!266899))))

(declare-fun b!588672 () Bool)

(declare-fun res!376297 () Bool)

(assert (=> b!588672 (=> (not res!376297) (not e!336131))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!588672 (= res!376297 (validKeyInArray!0 (select (arr!17662 a!2986) j!136)))))

(declare-fun res!376294 () Bool)

(assert (=> start!53934 (=> (not res!376294) (not e!336131))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53934 (= res!376294 (validMask!0 mask!3053))))

(assert (=> start!53934 e!336131))

(assert (=> start!53934 true))

(declare-fun array_inv!13458 (array!36778) Bool)

(assert (=> start!53934 (array_inv!13458 a!2986)))

(declare-fun b!588664 () Bool)

(declare-fun res!376295 () Bool)

(assert (=> b!588664 (=> (not res!376295) (not e!336131))))

(assert (=> b!588664 (= res!376295 (validKeyInArray!0 k0!1786))))

(declare-fun b!588673 () Bool)

(declare-fun res!376292 () Bool)

(assert (=> b!588673 (=> (not res!376292) (not e!336130))))

(declare-datatypes ((List!11703 0))(
  ( (Nil!11700) (Cons!11699 (h!12744 (_ BitVec 64)) (t!17931 List!11703)) )
))
(declare-fun arrayNoDuplicates!0 (array!36778 (_ BitVec 32) List!11703) Bool)

(assert (=> b!588673 (= res!376292 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11700))))

(declare-fun b!588674 () Bool)

(declare-fun res!376289 () Bool)

(assert (=> b!588674 (=> (not res!376289) (not e!336130))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36778 (_ BitVec 32)) Bool)

(assert (=> b!588674 (= res!376289 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!53934 res!376294) b!588662))

(assert (= (and b!588662 res!376293) b!588672))

(assert (= (and b!588672 res!376297) b!588664))

(assert (= (and b!588664 res!376295) b!588669))

(assert (= (and b!588669 res!376296) b!588670))

(assert (= (and b!588670 res!376290) b!588674))

(assert (= (and b!588674 res!376289) b!588673))

(assert (= (and b!588673 res!376292) b!588667))

(assert (= (and b!588667 res!376291) b!588663))

(assert (= (and b!588663 res!376298) b!588666))

(assert (= (and b!588666 res!376287) b!588665))

(assert (= (and b!588665 res!376288) b!588671))

(assert (= (and b!588665 c!66554) b!588668))

(assert (= (and b!588665 (not c!66554)) b!588661))

(declare-fun m!567227 () Bool)

(assert (=> b!588667 m!567227))

(declare-fun m!567229 () Bool)

(assert (=> b!588672 m!567229))

(assert (=> b!588672 m!567229))

(declare-fun m!567231 () Bool)

(assert (=> b!588672 m!567231))

(declare-fun m!567233 () Bool)

(assert (=> b!588674 m!567233))

(declare-fun m!567235 () Bool)

(assert (=> b!588665 m!567235))

(declare-fun m!567237 () Bool)

(assert (=> b!588665 m!567237))

(assert (=> b!588665 m!567229))

(declare-fun m!567239 () Bool)

(assert (=> b!588665 m!567239))

(assert (=> b!588665 m!567229))

(declare-fun m!567241 () Bool)

(assert (=> b!588665 m!567241))

(declare-fun m!567243 () Bool)

(assert (=> b!588665 m!567243))

(declare-fun m!567245 () Bool)

(assert (=> b!588665 m!567245))

(declare-fun m!567247 () Bool)

(assert (=> b!588665 m!567247))

(declare-fun m!567249 () Bool)

(assert (=> start!53934 m!567249))

(declare-fun m!567251 () Bool)

(assert (=> start!53934 m!567251))

(declare-fun m!567253 () Bool)

(assert (=> b!588669 m!567253))

(declare-fun m!567255 () Bool)

(assert (=> b!588670 m!567255))

(assert (=> b!588663 m!567239))

(declare-fun m!567257 () Bool)

(assert (=> b!588663 m!567257))

(declare-fun m!567259 () Bool)

(assert (=> b!588673 m!567259))

(declare-fun m!567261 () Bool)

(assert (=> b!588664 m!567261))

(declare-fun m!567263 () Bool)

(assert (=> b!588666 m!567263))

(assert (=> b!588666 m!567229))

(assert (=> b!588666 m!567229))

(declare-fun m!567265 () Bool)

(assert (=> b!588666 m!567265))

(check-sat (not b!588674) (not start!53934) (not b!588664) (not b!588673) (not b!588672) (not b!588665) (not b!588670) (not b!588669) (not b!588666))
(check-sat)
