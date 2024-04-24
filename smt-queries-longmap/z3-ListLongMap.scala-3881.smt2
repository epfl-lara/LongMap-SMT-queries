; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53346 () Bool)

(assert start!53346)

(declare-fun b!579710 () Bool)

(declare-fun res!367428 () Bool)

(declare-fun e!333151 () Bool)

(assert (=> b!579710 (=> (not res!367428) (not e!333151))))

(declare-datatypes ((array!36192 0))(
  ( (array!36193 (arr!17368 (Array (_ BitVec 32) (_ BitVec 64))) (size!17732 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36192)

(declare-datatypes ((List!11316 0))(
  ( (Nil!11313) (Cons!11312 (h!12360 (_ BitVec 64)) (t!17536 List!11316)) )
))
(declare-fun arrayNoDuplicates!0 (array!36192 (_ BitVec 32) List!11316) Bool)

(assert (=> b!579710 (= res!367428 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11313))))

(declare-fun b!579711 () Bool)

(assert (=> b!579711 (= e!333151 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5764 0))(
  ( (MissingZero!5764 (index!25283 (_ BitVec 32))) (Found!5764 (index!25284 (_ BitVec 32))) (Intermediate!5764 (undefined!6576 Bool) (index!25285 (_ BitVec 32)) (x!54324 (_ BitVec 32))) (Undefined!5764) (MissingVacant!5764 (index!25286 (_ BitVec 32))) )
))
(declare-fun lt!264610 () SeekEntryResult!5764)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36192 (_ BitVec 32)) SeekEntryResult!5764)

(assert (=> b!579711 (= lt!264610 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17368 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!579712 () Bool)

(declare-fun res!367429 () Bool)

(declare-fun e!333152 () Bool)

(assert (=> b!579712 (=> (not res!367429) (not e!333152))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!579712 (= res!367429 (validKeyInArray!0 k0!1786))))

(declare-fun b!579714 () Bool)

(declare-fun res!367424 () Bool)

(assert (=> b!579714 (=> (not res!367424) (not e!333151))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36192 (_ BitVec 32)) Bool)

(assert (=> b!579714 (= res!367424 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!579715 () Bool)

(assert (=> b!579715 (= e!333152 e!333151)))

(declare-fun res!367425 () Bool)

(assert (=> b!579715 (=> (not res!367425) (not e!333151))))

(declare-fun lt!264609 () SeekEntryResult!5764)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!579715 (= res!367425 (or (= lt!264609 (MissingZero!5764 i!1108)) (= lt!264609 (MissingVacant!5764 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36192 (_ BitVec 32)) SeekEntryResult!5764)

(assert (=> b!579715 (= lt!264609 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!579716 () Bool)

(declare-fun res!367422 () Bool)

(assert (=> b!579716 (=> (not res!367422) (not e!333152))))

(assert (=> b!579716 (= res!367422 (and (= (size!17732 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17732 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17732 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!579717 () Bool)

(declare-fun res!367426 () Bool)

(assert (=> b!579717 (=> (not res!367426) (not e!333152))))

(assert (=> b!579717 (= res!367426 (validKeyInArray!0 (select (arr!17368 a!2986) j!136)))))

(declare-fun b!579718 () Bool)

(declare-fun res!367421 () Bool)

(assert (=> b!579718 (=> (not res!367421) (not e!333152))))

(declare-fun arrayContainsKey!0 (array!36192 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!579718 (= res!367421 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!367423 () Bool)

(assert (=> start!53346 (=> (not res!367423) (not e!333152))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53346 (= res!367423 (validMask!0 mask!3053))))

(assert (=> start!53346 e!333152))

(assert (=> start!53346 true))

(declare-fun array_inv!13227 (array!36192) Bool)

(assert (=> start!53346 (array_inv!13227 a!2986)))

(declare-fun b!579713 () Bool)

(declare-fun res!367427 () Bool)

(assert (=> b!579713 (=> (not res!367427) (not e!333151))))

(assert (=> b!579713 (= res!367427 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17368 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17368 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!53346 res!367423) b!579716))

(assert (= (and b!579716 res!367422) b!579717))

(assert (= (and b!579717 res!367426) b!579712))

(assert (= (and b!579712 res!367429) b!579718))

(assert (= (and b!579718 res!367421) b!579715))

(assert (= (and b!579715 res!367425) b!579714))

(assert (= (and b!579714 res!367424) b!579710))

(assert (= (and b!579710 res!367428) b!579713))

(assert (= (and b!579713 res!367427) b!579711))

(declare-fun m!558479 () Bool)

(assert (=> b!579713 m!558479))

(declare-fun m!558481 () Bool)

(assert (=> b!579713 m!558481))

(declare-fun m!558483 () Bool)

(assert (=> b!579713 m!558483))

(declare-fun m!558485 () Bool)

(assert (=> b!579717 m!558485))

(assert (=> b!579717 m!558485))

(declare-fun m!558487 () Bool)

(assert (=> b!579717 m!558487))

(declare-fun m!558489 () Bool)

(assert (=> b!579718 m!558489))

(declare-fun m!558491 () Bool)

(assert (=> b!579710 m!558491))

(assert (=> b!579711 m!558485))

(assert (=> b!579711 m!558485))

(declare-fun m!558493 () Bool)

(assert (=> b!579711 m!558493))

(declare-fun m!558495 () Bool)

(assert (=> b!579714 m!558495))

(declare-fun m!558497 () Bool)

(assert (=> start!53346 m!558497))

(declare-fun m!558499 () Bool)

(assert (=> start!53346 m!558499))

(declare-fun m!558501 () Bool)

(assert (=> b!579712 m!558501))

(declare-fun m!558503 () Bool)

(assert (=> b!579715 m!558503))

(check-sat (not b!579717) (not b!579711) (not b!579714) (not start!53346) (not b!579718) (not b!579715) (not b!579712) (not b!579710))
(check-sat)
