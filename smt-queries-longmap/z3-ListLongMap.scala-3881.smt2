; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53298 () Bool)

(assert start!53298)

(declare-fun res!367359 () Bool)

(declare-fun e!333032 () Bool)

(assert (=> start!53298 (=> (not res!367359) (not e!333032))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53298 (= res!367359 (validMask!0 mask!3053))))

(assert (=> start!53298 e!333032))

(assert (=> start!53298 true))

(declare-datatypes ((array!36199 0))(
  ( (array!36200 (arr!17374 (Array (_ BitVec 32) (_ BitVec 64))) (size!17738 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36199)

(declare-fun array_inv!13170 (array!36199) Bool)

(assert (=> start!53298 (array_inv!13170 a!2986)))

(declare-fun b!579537 () Bool)

(declare-fun res!367354 () Bool)

(assert (=> b!579537 (=> (not res!367354) (not e!333032))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!579537 (= res!367354 (and (= (size!17738 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17738 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17738 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!579538 () Bool)

(declare-fun res!367353 () Bool)

(declare-fun e!333033 () Bool)

(assert (=> b!579538 (=> (not res!367353) (not e!333033))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!579538 (= res!367353 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17374 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17374 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!579539 () Bool)

(declare-fun res!367356 () Bool)

(assert (=> b!579539 (=> (not res!367356) (not e!333033))))

(declare-datatypes ((List!11415 0))(
  ( (Nil!11412) (Cons!11411 (h!12456 (_ BitVec 64)) (t!17643 List!11415)) )
))
(declare-fun arrayNoDuplicates!0 (array!36199 (_ BitVec 32) List!11415) Bool)

(assert (=> b!579539 (= res!367356 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11412))))

(declare-fun b!579540 () Bool)

(declare-fun res!367357 () Bool)

(assert (=> b!579540 (=> (not res!367357) (not e!333032))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!579540 (= res!367357 (validKeyInArray!0 k0!1786))))

(declare-fun b!579541 () Bool)

(assert (=> b!579541 (= e!333032 e!333033)))

(declare-fun res!367358 () Bool)

(assert (=> b!579541 (=> (not res!367358) (not e!333033))))

(declare-datatypes ((SeekEntryResult!5814 0))(
  ( (MissingZero!5814 (index!25483 (_ BitVec 32))) (Found!5814 (index!25484 (_ BitVec 32))) (Intermediate!5814 (undefined!6626 Bool) (index!25485 (_ BitVec 32)) (x!54371 (_ BitVec 32))) (Undefined!5814) (MissingVacant!5814 (index!25486 (_ BitVec 32))) )
))
(declare-fun lt!264504 () SeekEntryResult!5814)

(assert (=> b!579541 (= res!367358 (or (= lt!264504 (MissingZero!5814 i!1108)) (= lt!264504 (MissingVacant!5814 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36199 (_ BitVec 32)) SeekEntryResult!5814)

(assert (=> b!579541 (= lt!264504 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!579542 () Bool)

(declare-fun res!367360 () Bool)

(assert (=> b!579542 (=> (not res!367360) (not e!333032))))

(assert (=> b!579542 (= res!367360 (validKeyInArray!0 (select (arr!17374 a!2986) j!136)))))

(declare-fun b!579543 () Bool)

(assert (=> b!579543 (= e!333033 false)))

(declare-fun lt!264505 () SeekEntryResult!5814)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36199 (_ BitVec 32)) SeekEntryResult!5814)

(assert (=> b!579543 (= lt!264505 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17374 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!579544 () Bool)

(declare-fun res!367361 () Bool)

(assert (=> b!579544 (=> (not res!367361) (not e!333033))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36199 (_ BitVec 32)) Bool)

(assert (=> b!579544 (= res!367361 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!579545 () Bool)

(declare-fun res!367355 () Bool)

(assert (=> b!579545 (=> (not res!367355) (not e!333032))))

(declare-fun arrayContainsKey!0 (array!36199 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!579545 (= res!367355 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!53298 res!367359) b!579537))

(assert (= (and b!579537 res!367354) b!579542))

(assert (= (and b!579542 res!367360) b!579540))

(assert (= (and b!579540 res!367357) b!579545))

(assert (= (and b!579545 res!367355) b!579541))

(assert (= (and b!579541 res!367358) b!579544))

(assert (= (and b!579544 res!367361) b!579539))

(assert (= (and b!579539 res!367356) b!579538))

(assert (= (and b!579538 res!367353) b!579543))

(declare-fun m!558153 () Bool)

(assert (=> b!579543 m!558153))

(assert (=> b!579543 m!558153))

(declare-fun m!558155 () Bool)

(assert (=> b!579543 m!558155))

(assert (=> b!579542 m!558153))

(assert (=> b!579542 m!558153))

(declare-fun m!558157 () Bool)

(assert (=> b!579542 m!558157))

(declare-fun m!558159 () Bool)

(assert (=> b!579540 m!558159))

(declare-fun m!558161 () Bool)

(assert (=> b!579544 m!558161))

(declare-fun m!558163 () Bool)

(assert (=> start!53298 m!558163))

(declare-fun m!558165 () Bool)

(assert (=> start!53298 m!558165))

(declare-fun m!558167 () Bool)

(assert (=> b!579545 m!558167))

(declare-fun m!558169 () Bool)

(assert (=> b!579538 m!558169))

(declare-fun m!558171 () Bool)

(assert (=> b!579538 m!558171))

(declare-fun m!558173 () Bool)

(assert (=> b!579538 m!558173))

(declare-fun m!558175 () Bool)

(assert (=> b!579539 m!558175))

(declare-fun m!558177 () Bool)

(assert (=> b!579541 m!558177))

(check-sat (not b!579542) (not b!579540) (not b!579543) (not start!53298) (not b!579544) (not b!579541) (not b!579545) (not b!579539))
