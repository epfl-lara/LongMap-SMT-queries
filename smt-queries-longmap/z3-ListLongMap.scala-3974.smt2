; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53964 () Bool)

(assert start!53964)

(declare-fun b!588516 () Bool)

(declare-fun e!336090 () Bool)

(declare-datatypes ((SeekEntryResult!6043 0))(
  ( (MissingZero!6043 (index!26402 (_ BitVec 32))) (Found!6043 (index!26403 (_ BitVec 32))) (Intermediate!6043 (undefined!6855 Bool) (index!26404 (_ BitVec 32)) (x!55356 (_ BitVec 32))) (Undefined!6043) (MissingVacant!6043 (index!26405 (_ BitVec 32))) )
))
(declare-fun lt!266835 () SeekEntryResult!6043)

(declare-fun lt!266834 () SeekEntryResult!6043)

(assert (=> b!588516 (= e!336090 (= lt!266835 lt!266834))))

(declare-fun b!588517 () Bool)

(declare-fun res!376047 () Bool)

(declare-fun e!336093 () Bool)

(assert (=> b!588517 (=> (not res!376047) (not e!336093))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!588517 (= res!376047 (validKeyInArray!0 k0!1786))))

(declare-fun b!588518 () Bool)

(declare-fun e!336092 () Bool)

(declare-fun e!336089 () Bool)

(assert (=> b!588518 (= e!336092 e!336089)))

(declare-fun res!376054 () Bool)

(assert (=> b!588518 (=> (not res!376054) (not e!336089))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36753 0))(
  ( (array!36754 (arr!17647 (Array (_ BitVec 32) (_ BitVec 64))) (size!18011 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36753)

(assert (=> b!588518 (= res!376054 (and (= lt!266835 (Found!6043 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17647 a!2986) index!984) (select (arr!17647 a!2986) j!136))) (not (= (select (arr!17647 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36753 (_ BitVec 32)) SeekEntryResult!6043)

(assert (=> b!588518 (= lt!266835 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17647 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!588519 () Bool)

(assert (=> b!588519 (= e!336093 e!336092)))

(declare-fun res!376056 () Bool)

(assert (=> b!588519 (=> (not res!376056) (not e!336092))))

(declare-fun lt!266832 () SeekEntryResult!6043)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!588519 (= res!376056 (or (= lt!266832 (MissingZero!6043 i!1108)) (= lt!266832 (MissingVacant!6043 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36753 (_ BitVec 32)) SeekEntryResult!6043)

(assert (=> b!588519 (= lt!266832 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!588520 () Bool)

(assert (=> b!588520 (= e!336089 (not true))))

(assert (=> b!588520 e!336090))

(declare-fun res!376052 () Bool)

(assert (=> b!588520 (=> (not res!376052) (not e!336090))))

(declare-fun lt!266836 () (_ BitVec 32))

(assert (=> b!588520 (= res!376052 (= lt!266834 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266836 vacantSpotIndex!68 (select (store (arr!17647 a!2986) i!1108 k0!1786) j!136) (array!36754 (store (arr!17647 a!2986) i!1108 k0!1786) (size!18011 a!2986)) mask!3053)))))

(assert (=> b!588520 (= lt!266834 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266836 vacantSpotIndex!68 (select (arr!17647 a!2986) j!136) a!2986 mask!3053))))

(declare-datatypes ((Unit!18283 0))(
  ( (Unit!18284) )
))
(declare-fun lt!266833 () Unit!18283)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36753 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18283)

(assert (=> b!588520 (= lt!266833 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266836 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!588520 (= lt!266836 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!588521 () Bool)

(declare-fun res!376051 () Bool)

(assert (=> b!588521 (=> (not res!376051) (not e!336093))))

(assert (=> b!588521 (= res!376051 (validKeyInArray!0 (select (arr!17647 a!2986) j!136)))))

(declare-fun b!588522 () Bool)

(declare-fun res!376048 () Bool)

(assert (=> b!588522 (=> (not res!376048) (not e!336092))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36753 (_ BitVec 32)) Bool)

(assert (=> b!588522 (= res!376048 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!588523 () Bool)

(declare-fun res!376055 () Bool)

(assert (=> b!588523 (=> (not res!376055) (not e!336092))))

(declare-datatypes ((List!11595 0))(
  ( (Nil!11592) (Cons!11591 (h!12639 (_ BitVec 64)) (t!17815 List!11595)) )
))
(declare-fun arrayNoDuplicates!0 (array!36753 (_ BitVec 32) List!11595) Bool)

(assert (=> b!588523 (= res!376055 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11592))))

(declare-fun b!588524 () Bool)

(declare-fun res!376050 () Bool)

(assert (=> b!588524 (=> (not res!376050) (not e!336092))))

(assert (=> b!588524 (= res!376050 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17647 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17647 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!588525 () Bool)

(declare-fun res!376049 () Bool)

(assert (=> b!588525 (=> (not res!376049) (not e!336093))))

(assert (=> b!588525 (= res!376049 (and (= (size!18011 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18011 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18011 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!588526 () Bool)

(declare-fun res!376053 () Bool)

(assert (=> b!588526 (=> (not res!376053) (not e!336093))))

(declare-fun arrayContainsKey!0 (array!36753 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!588526 (= res!376053 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!376057 () Bool)

(assert (=> start!53964 (=> (not res!376057) (not e!336093))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53964 (= res!376057 (validMask!0 mask!3053))))

(assert (=> start!53964 e!336093))

(assert (=> start!53964 true))

(declare-fun array_inv!13506 (array!36753) Bool)

(assert (=> start!53964 (array_inv!13506 a!2986)))

(assert (= (and start!53964 res!376057) b!588525))

(assert (= (and b!588525 res!376049) b!588521))

(assert (= (and b!588521 res!376051) b!588517))

(assert (= (and b!588517 res!376047) b!588526))

(assert (= (and b!588526 res!376053) b!588519))

(assert (= (and b!588519 res!376056) b!588522))

(assert (= (and b!588522 res!376048) b!588523))

(assert (= (and b!588523 res!376055) b!588524))

(assert (= (and b!588524 res!376050) b!588518))

(assert (= (and b!588518 res!376054) b!588520))

(assert (= (and b!588520 res!376052) b!588516))

(declare-fun m!567203 () Bool)

(assert (=> b!588517 m!567203))

(declare-fun m!567205 () Bool)

(assert (=> start!53964 m!567205))

(declare-fun m!567207 () Bool)

(assert (=> start!53964 m!567207))

(declare-fun m!567209 () Bool)

(assert (=> b!588526 m!567209))

(declare-fun m!567211 () Bool)

(assert (=> b!588520 m!567211))

(declare-fun m!567213 () Bool)

(assert (=> b!588520 m!567213))

(declare-fun m!567215 () Bool)

(assert (=> b!588520 m!567215))

(declare-fun m!567217 () Bool)

(assert (=> b!588520 m!567217))

(declare-fun m!567219 () Bool)

(assert (=> b!588520 m!567219))

(assert (=> b!588520 m!567213))

(declare-fun m!567221 () Bool)

(assert (=> b!588520 m!567221))

(assert (=> b!588520 m!567217))

(declare-fun m!567223 () Bool)

(assert (=> b!588520 m!567223))

(declare-fun m!567225 () Bool)

(assert (=> b!588518 m!567225))

(assert (=> b!588518 m!567217))

(assert (=> b!588518 m!567217))

(declare-fun m!567227 () Bool)

(assert (=> b!588518 m!567227))

(declare-fun m!567229 () Bool)

(assert (=> b!588524 m!567229))

(assert (=> b!588524 m!567219))

(declare-fun m!567231 () Bool)

(assert (=> b!588524 m!567231))

(declare-fun m!567233 () Bool)

(assert (=> b!588519 m!567233))

(assert (=> b!588521 m!567217))

(assert (=> b!588521 m!567217))

(declare-fun m!567235 () Bool)

(assert (=> b!588521 m!567235))

(declare-fun m!567237 () Bool)

(assert (=> b!588523 m!567237))

(declare-fun m!567239 () Bool)

(assert (=> b!588522 m!567239))

(check-sat (not b!588526) (not b!588522) (not b!588520) (not b!588521) (not b!588519) (not b!588518) (not b!588517) (not start!53964) (not b!588523))
(check-sat)
