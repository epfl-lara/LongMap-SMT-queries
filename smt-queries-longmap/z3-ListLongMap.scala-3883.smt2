; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53292 () Bool)

(assert start!53292)

(declare-fun b!579401 () Bool)

(declare-fun e!332903 () Bool)

(declare-fun e!332904 () Bool)

(assert (=> b!579401 (= e!332903 e!332904)))

(declare-fun res!367362 () Bool)

(assert (=> b!579401 (=> (not res!367362) (not e!332904))))

(declare-datatypes ((SeekEntryResult!5815 0))(
  ( (MissingZero!5815 (index!25487 (_ BitVec 32))) (Found!5815 (index!25488 (_ BitVec 32))) (Intermediate!5815 (undefined!6627 Bool) (index!25489 (_ BitVec 32)) (x!54383 (_ BitVec 32))) (Undefined!5815) (MissingVacant!5815 (index!25490 (_ BitVec 32))) )
))
(declare-fun lt!264300 () SeekEntryResult!5815)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!579401 (= res!367362 (or (= lt!264300 (MissingZero!5815 i!1108)) (= lt!264300 (MissingVacant!5815 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!36207 0))(
  ( (array!36208 (arr!17378 (Array (_ BitVec 32) (_ BitVec 64))) (size!17743 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36207)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36207 (_ BitVec 32)) SeekEntryResult!5815)

(assert (=> b!579401 (= lt!264300 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!579402 () Bool)

(declare-fun res!367366 () Bool)

(assert (=> b!579402 (=> (not res!367366) (not e!332903))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!579402 (= res!367366 (and (= (size!17743 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17743 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17743 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!367363 () Bool)

(assert (=> start!53292 (=> (not res!367363) (not e!332903))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53292 (= res!367363 (validMask!0 mask!3053))))

(assert (=> start!53292 e!332903))

(assert (=> start!53292 true))

(declare-fun array_inv!13261 (array!36207) Bool)

(assert (=> start!53292 (array_inv!13261 a!2986)))

(declare-fun b!579403 () Bool)

(declare-fun res!367360 () Bool)

(assert (=> b!579403 (=> (not res!367360) (not e!332903))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!579403 (= res!367360 (validKeyInArray!0 (select (arr!17378 a!2986) j!136)))))

(declare-fun b!579404 () Bool)

(declare-fun res!367367 () Bool)

(assert (=> b!579404 (=> (not res!367367) (not e!332904))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36207 (_ BitVec 32)) Bool)

(assert (=> b!579404 (= res!367367 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!579405 () Bool)

(declare-fun res!367365 () Bool)

(assert (=> b!579405 (=> (not res!367365) (not e!332903))))

(assert (=> b!579405 (= res!367365 (validKeyInArray!0 k0!1786))))

(declare-fun b!579406 () Bool)

(declare-fun res!367364 () Bool)

(assert (=> b!579406 (=> (not res!367364) (not e!332904))))

(declare-datatypes ((List!11458 0))(
  ( (Nil!11455) (Cons!11454 (h!12499 (_ BitVec 64)) (t!17677 List!11458)) )
))
(declare-fun arrayNoDuplicates!0 (array!36207 (_ BitVec 32) List!11458) Bool)

(assert (=> b!579406 (= res!367364 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11455))))

(declare-fun b!579407 () Bool)

(declare-fun res!367359 () Bool)

(assert (=> b!579407 (=> (not res!367359) (not e!332903))))

(declare-fun arrayContainsKey!0 (array!36207 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!579407 (= res!367359 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!579408 () Bool)

(assert (=> b!579408 (= e!332904 false)))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!264301 () SeekEntryResult!5815)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36207 (_ BitVec 32)) SeekEntryResult!5815)

(assert (=> b!579408 (= lt!264301 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17378 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!579409 () Bool)

(declare-fun res!367361 () Bool)

(assert (=> b!579409 (=> (not res!367361) (not e!332904))))

(assert (=> b!579409 (= res!367361 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17378 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17378 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!53292 res!367363) b!579402))

(assert (= (and b!579402 res!367366) b!579403))

(assert (= (and b!579403 res!367360) b!579405))

(assert (= (and b!579405 res!367365) b!579407))

(assert (= (and b!579407 res!367359) b!579401))

(assert (= (and b!579401 res!367362) b!579404))

(assert (= (and b!579404 res!367367) b!579406))

(assert (= (and b!579406 res!367364) b!579409))

(assert (= (and b!579409 res!367361) b!579408))

(declare-fun m!557497 () Bool)

(assert (=> b!579403 m!557497))

(assert (=> b!579403 m!557497))

(declare-fun m!557499 () Bool)

(assert (=> b!579403 m!557499))

(declare-fun m!557501 () Bool)

(assert (=> b!579405 m!557501))

(declare-fun m!557503 () Bool)

(assert (=> b!579404 m!557503))

(declare-fun m!557505 () Bool)

(assert (=> b!579401 m!557505))

(declare-fun m!557507 () Bool)

(assert (=> b!579406 m!557507))

(declare-fun m!557509 () Bool)

(assert (=> b!579407 m!557509))

(declare-fun m!557511 () Bool)

(assert (=> start!53292 m!557511))

(declare-fun m!557513 () Bool)

(assert (=> start!53292 m!557513))

(declare-fun m!557515 () Bool)

(assert (=> b!579409 m!557515))

(declare-fun m!557517 () Bool)

(assert (=> b!579409 m!557517))

(declare-fun m!557519 () Bool)

(assert (=> b!579409 m!557519))

(assert (=> b!579408 m!557497))

(assert (=> b!579408 m!557497))

(declare-fun m!557521 () Bool)

(assert (=> b!579408 m!557521))

(check-sat (not b!579406) (not start!53292) (not b!579401) (not b!579404) (not b!579403) (not b!579408) (not b!579407) (not b!579405))
(check-sat)
