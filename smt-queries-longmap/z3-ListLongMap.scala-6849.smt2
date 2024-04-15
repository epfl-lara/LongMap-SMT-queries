; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86286 () Bool)

(assert start!86286)

(declare-fun b!998613 () Bool)

(declare-fun res!668382 () Bool)

(declare-fun e!563113 () Bool)

(assert (=> b!998613 (=> (not res!668382) (not e!563113))))

(declare-datatypes ((array!63085 0))(
  ( (array!63086 (arr!30369 (Array (_ BitVec 32) (_ BitVec 64))) (size!30873 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63085)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9326 0))(
  ( (MissingZero!9326 (index!39675 (_ BitVec 32))) (Found!9326 (index!39676 (_ BitVec 32))) (Intermediate!9326 (undefined!10138 Bool) (index!39677 (_ BitVec 32)) (x!87127 (_ BitVec 32))) (Undefined!9326) (MissingVacant!9326 (index!39678 (_ BitVec 32))) )
))
(declare-fun lt!441599 () SeekEntryResult!9326)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63085 (_ BitVec 32)) SeekEntryResult!9326)

(assert (=> b!998613 (= res!668382 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30369 a!3219) j!170) a!3219 mask!3464) lt!441599))))

(declare-fun b!998614 () Bool)

(declare-fun res!668375 () Bool)

(declare-fun e!563112 () Bool)

(assert (=> b!998614 (=> (not res!668375) (not e!563112))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63085 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!998614 (= res!668375 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!998615 () Bool)

(declare-fun e!563111 () Bool)

(assert (=> b!998615 (= e!563111 e!563113)))

(declare-fun res!668383 () Bool)

(assert (=> b!998615 (=> (not res!668383) (not e!563113))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!998615 (= res!668383 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30369 a!3219) j!170) mask!3464) (select (arr!30369 a!3219) j!170) a!3219 mask!3464) lt!441599))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!998615 (= lt!441599 (Intermediate!9326 false resIndex!38 resX!38))))

(declare-fun b!998616 () Bool)

(declare-fun res!668380 () Bool)

(assert (=> b!998616 (=> (not res!668380) (not e!563111))))

(declare-datatypes ((List!21111 0))(
  ( (Nil!21108) (Cons!21107 (h!22281 (_ BitVec 64)) (t!30103 List!21111)) )
))
(declare-fun arrayNoDuplicates!0 (array!63085 (_ BitVec 32) List!21111) Bool)

(assert (=> b!998616 (= res!668380 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21108))))

(declare-fun b!998617 () Bool)

(assert (=> b!998617 (= e!563112 e!563111)))

(declare-fun res!668379 () Bool)

(assert (=> b!998617 (=> (not res!668379) (not e!563111))))

(declare-fun lt!441600 () SeekEntryResult!9326)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!998617 (= res!668379 (or (= lt!441600 (MissingVacant!9326 i!1194)) (= lt!441600 (MissingZero!9326 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63085 (_ BitVec 32)) SeekEntryResult!9326)

(assert (=> b!998617 (= lt!441600 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!998618 () Bool)

(declare-fun res!668381 () Bool)

(assert (=> b!998618 (=> (not res!668381) (not e!563111))))

(assert (=> b!998618 (= res!668381 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30873 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30873 a!3219))))))

(declare-fun b!998619 () Bool)

(declare-fun res!668374 () Bool)

(assert (=> b!998619 (=> (not res!668374) (not e!563112))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!998619 (= res!668374 (validKeyInArray!0 k0!2224))))

(declare-fun res!668384 () Bool)

(assert (=> start!86286 (=> (not res!668384) (not e!563112))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86286 (= res!668384 (validMask!0 mask!3464))))

(assert (=> start!86286 e!563112))

(declare-fun array_inv!23512 (array!63085) Bool)

(assert (=> start!86286 (array_inv!23512 a!3219)))

(assert (=> start!86286 true))

(declare-fun b!998620 () Bool)

(declare-fun res!668377 () Bool)

(assert (=> b!998620 (=> (not res!668377) (not e!563112))))

(assert (=> b!998620 (= res!668377 (and (= (size!30873 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30873 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30873 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!998621 () Bool)

(declare-fun res!668376 () Bool)

(assert (=> b!998621 (=> (not res!668376) (not e!563111))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63085 (_ BitVec 32)) Bool)

(assert (=> b!998621 (= res!668376 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!998622 () Bool)

(assert (=> b!998622 (= e!563113 (bvslt mask!3464 #b00000000000000000000000000000000))))

(declare-fun lt!441601 () (_ BitVec 32))

(assert (=> b!998622 (= lt!441601 (toIndex!0 (select (store (arr!30369 a!3219) i!1194 k0!2224) j!170) mask!3464))))

(declare-fun b!998623 () Bool)

(declare-fun res!668378 () Bool)

(assert (=> b!998623 (=> (not res!668378) (not e!563112))))

(assert (=> b!998623 (= res!668378 (validKeyInArray!0 (select (arr!30369 a!3219) j!170)))))

(assert (= (and start!86286 res!668384) b!998620))

(assert (= (and b!998620 res!668377) b!998623))

(assert (= (and b!998623 res!668378) b!998619))

(assert (= (and b!998619 res!668374) b!998614))

(assert (= (and b!998614 res!668375) b!998617))

(assert (= (and b!998617 res!668379) b!998621))

(assert (= (and b!998621 res!668376) b!998616))

(assert (= (and b!998616 res!668380) b!998618))

(assert (= (and b!998618 res!668381) b!998615))

(assert (= (and b!998615 res!668383) b!998613))

(assert (= (and b!998613 res!668382) b!998622))

(declare-fun m!924493 () Bool)

(assert (=> b!998615 m!924493))

(assert (=> b!998615 m!924493))

(declare-fun m!924495 () Bool)

(assert (=> b!998615 m!924495))

(assert (=> b!998615 m!924495))

(assert (=> b!998615 m!924493))

(declare-fun m!924497 () Bool)

(assert (=> b!998615 m!924497))

(declare-fun m!924499 () Bool)

(assert (=> b!998619 m!924499))

(declare-fun m!924501 () Bool)

(assert (=> b!998617 m!924501))

(declare-fun m!924503 () Bool)

(assert (=> b!998622 m!924503))

(declare-fun m!924505 () Bool)

(assert (=> b!998622 m!924505))

(assert (=> b!998622 m!924505))

(declare-fun m!924507 () Bool)

(assert (=> b!998622 m!924507))

(declare-fun m!924509 () Bool)

(assert (=> b!998621 m!924509))

(declare-fun m!924511 () Bool)

(assert (=> b!998616 m!924511))

(declare-fun m!924513 () Bool)

(assert (=> b!998614 m!924513))

(declare-fun m!924515 () Bool)

(assert (=> start!86286 m!924515))

(declare-fun m!924517 () Bool)

(assert (=> start!86286 m!924517))

(assert (=> b!998613 m!924493))

(assert (=> b!998613 m!924493))

(declare-fun m!924519 () Bool)

(assert (=> b!998613 m!924519))

(assert (=> b!998623 m!924493))

(assert (=> b!998623 m!924493))

(declare-fun m!924521 () Bool)

(assert (=> b!998623 m!924521))

(check-sat (not b!998616) (not b!998621) (not start!86286) (not b!998622) (not b!998613) (not b!998623) (not b!998617) (not b!998615) (not b!998619) (not b!998614))
(check-sat)
