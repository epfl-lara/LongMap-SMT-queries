; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68674 () Bool)

(assert start!68674)

(declare-fun b!799470 () Bool)

(declare-fun e!443348 () Bool)

(declare-fun e!443347 () Bool)

(assert (=> b!799470 (= e!443348 e!443347)))

(declare-fun res!543993 () Bool)

(assert (=> b!799470 (=> (not res!543993) (not e!443347))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!357017 () (_ BitVec 64))

(declare-datatypes ((array!43464 0))(
  ( (array!43465 (arr!20812 (Array (_ BitVec 32) (_ BitVec 64))) (size!21233 (_ BitVec 32))) )
))
(declare-fun lt!357015 () array!43464)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8403 0))(
  ( (MissingZero!8403 (index!35980 (_ BitVec 32))) (Found!8403 (index!35981 (_ BitVec 32))) (Intermediate!8403 (undefined!9215 Bool) (index!35982 (_ BitVec 32)) (x!66857 (_ BitVec 32))) (Undefined!8403) (MissingVacant!8403 (index!35983 (_ BitVec 32))) )
))
(declare-fun lt!357013 () SeekEntryResult!8403)

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43464 (_ BitVec 32)) SeekEntryResult!8403)

(assert (=> b!799470 (= res!543993 (= lt!357013 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!357017 lt!357015 mask!3266)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43464 (_ BitVec 32)) SeekEntryResult!8403)

(assert (=> b!799470 (= lt!357013 (seekEntryOrOpen!0 lt!357017 lt!357015 mask!3266))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun a!3170 () array!43464)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!799470 (= lt!357017 (select (store (arr!20812 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!799470 (= lt!357015 (array!43465 (store (arr!20812 a!3170) i!1163 k0!2044) (size!21233 a!3170)))))

(declare-fun b!799471 () Bool)

(declare-fun e!443345 () Bool)

(assert (=> b!799471 (= e!443347 e!443345)))

(declare-fun res!543990 () Bool)

(assert (=> b!799471 (=> (not res!543990) (not e!443345))))

(declare-fun lt!357010 () SeekEntryResult!8403)

(declare-fun lt!357012 () SeekEntryResult!8403)

(assert (=> b!799471 (= res!543990 (and (= lt!357010 lt!357012) (= lt!357012 (Found!8403 j!153)) (not (= (select (arr!20812 a!3170) index!1236) (select (arr!20812 a!3170) j!153)))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!799471 (= lt!357012 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20812 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!799471 (= lt!357010 (seekEntryOrOpen!0 (select (arr!20812 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!799472 () Bool)

(declare-fun res!543995 () Bool)

(assert (=> b!799472 (=> (not res!543995) (not e!443348))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43464 (_ BitVec 32)) Bool)

(assert (=> b!799472 (= res!543995 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!799473 () Bool)

(declare-fun e!443343 () Bool)

(assert (=> b!799473 (= e!443343 e!443348)))

(declare-fun res!543996 () Bool)

(assert (=> b!799473 (=> (not res!543996) (not e!443348))))

(declare-fun lt!357011 () SeekEntryResult!8403)

(assert (=> b!799473 (= res!543996 (or (= lt!357011 (MissingZero!8403 i!1163)) (= lt!357011 (MissingVacant!8403 i!1163))))))

(assert (=> b!799473 (= lt!357011 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!799474 () Bool)

(declare-fun res!543992 () Bool)

(assert (=> b!799474 (=> (not res!543992) (not e!443348))))

(declare-datatypes ((List!14775 0))(
  ( (Nil!14772) (Cons!14771 (h!15900 (_ BitVec 64)) (t!21090 List!14775)) )
))
(declare-fun arrayNoDuplicates!0 (array!43464 (_ BitVec 32) List!14775) Bool)

(assert (=> b!799474 (= res!543992 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14772))))

(declare-fun b!799475 () Bool)

(declare-fun res!543994 () Bool)

(assert (=> b!799475 (=> (not res!543994) (not e!443343))))

(assert (=> b!799475 (= res!543994 (and (= (size!21233 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21233 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21233 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!799476 () Bool)

(declare-fun res!544001 () Bool)

(assert (=> b!799476 (=> (not res!544001) (not e!443343))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!799476 (= res!544001 (validKeyInArray!0 k0!2044))))

(declare-fun b!799477 () Bool)

(declare-fun e!443344 () Bool)

(assert (=> b!799477 (= e!443344 false)))

(declare-fun lt!357016 () SeekEntryResult!8403)

(declare-fun lt!357014 () (_ BitVec 32))

(assert (=> b!799477 (= lt!357016 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357014 vacantBefore!23 (select (arr!20812 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!799478 () Bool)

(declare-fun res!543998 () Bool)

(assert (=> b!799478 (=> (not res!543998) (not e!443348))))

(assert (=> b!799478 (= res!543998 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21233 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20812 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21233 a!3170)) (= (select (arr!20812 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!799479 () Bool)

(assert (=> b!799479 (= e!443345 e!443344)))

(declare-fun res!544000 () Bool)

(assert (=> b!799479 (=> (not res!544000) (not e!443344))))

(assert (=> b!799479 (= res!544000 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!357014 #b00000000000000000000000000000000) (bvslt lt!357014 (size!21233 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!799479 (= lt!357014 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun res!543997 () Bool)

(assert (=> start!68674 (=> (not res!543997) (not e!443343))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68674 (= res!543997 (validMask!0 mask!3266))))

(assert (=> start!68674 e!443343))

(assert (=> start!68674 true))

(declare-fun array_inv!16608 (array!43464) Bool)

(assert (=> start!68674 (array_inv!16608 a!3170)))

(declare-fun b!799480 () Bool)

(declare-fun res!543999 () Bool)

(assert (=> b!799480 (=> (not res!543999) (not e!443344))))

(assert (=> b!799480 (= res!543999 (= lt!357013 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357014 vacantAfter!23 lt!357017 lt!357015 mask!3266)))))

(declare-fun b!799481 () Bool)

(declare-fun res!543991 () Bool)

(assert (=> b!799481 (=> (not res!543991) (not e!443343))))

(declare-fun arrayContainsKey!0 (array!43464 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!799481 (= res!543991 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!799482 () Bool)

(declare-fun res!543989 () Bool)

(assert (=> b!799482 (=> (not res!543989) (not e!443343))))

(assert (=> b!799482 (= res!543989 (validKeyInArray!0 (select (arr!20812 a!3170) j!153)))))

(assert (= (and start!68674 res!543997) b!799475))

(assert (= (and b!799475 res!543994) b!799482))

(assert (= (and b!799482 res!543989) b!799476))

(assert (= (and b!799476 res!544001) b!799481))

(assert (= (and b!799481 res!543991) b!799473))

(assert (= (and b!799473 res!543996) b!799472))

(assert (= (and b!799472 res!543995) b!799474))

(assert (= (and b!799474 res!543992) b!799478))

(assert (= (and b!799478 res!543998) b!799470))

(assert (= (and b!799470 res!543993) b!799471))

(assert (= (and b!799471 res!543990) b!799479))

(assert (= (and b!799479 res!544000) b!799480))

(assert (= (and b!799480 res!543999) b!799477))

(declare-fun m!740483 () Bool)

(assert (=> b!799474 m!740483))

(declare-fun m!740485 () Bool)

(assert (=> b!799477 m!740485))

(assert (=> b!799477 m!740485))

(declare-fun m!740487 () Bool)

(assert (=> b!799477 m!740487))

(declare-fun m!740489 () Bool)

(assert (=> b!799481 m!740489))

(declare-fun m!740491 () Bool)

(assert (=> b!799470 m!740491))

(declare-fun m!740493 () Bool)

(assert (=> b!799470 m!740493))

(declare-fun m!740495 () Bool)

(assert (=> b!799470 m!740495))

(declare-fun m!740497 () Bool)

(assert (=> b!799470 m!740497))

(declare-fun m!740499 () Bool)

(assert (=> b!799471 m!740499))

(assert (=> b!799471 m!740485))

(assert (=> b!799471 m!740485))

(declare-fun m!740501 () Bool)

(assert (=> b!799471 m!740501))

(assert (=> b!799471 m!740485))

(declare-fun m!740503 () Bool)

(assert (=> b!799471 m!740503))

(declare-fun m!740505 () Bool)

(assert (=> start!68674 m!740505))

(declare-fun m!740507 () Bool)

(assert (=> start!68674 m!740507))

(declare-fun m!740509 () Bool)

(assert (=> b!799480 m!740509))

(declare-fun m!740511 () Bool)

(assert (=> b!799476 m!740511))

(declare-fun m!740513 () Bool)

(assert (=> b!799479 m!740513))

(declare-fun m!740515 () Bool)

(assert (=> b!799473 m!740515))

(declare-fun m!740517 () Bool)

(assert (=> b!799478 m!740517))

(declare-fun m!740519 () Bool)

(assert (=> b!799478 m!740519))

(assert (=> b!799482 m!740485))

(assert (=> b!799482 m!740485))

(declare-fun m!740521 () Bool)

(assert (=> b!799482 m!740521))

(declare-fun m!740523 () Bool)

(assert (=> b!799472 m!740523))

(check-sat (not b!799480) (not b!799477) (not b!799482) (not start!68674) (not b!799470) (not b!799473) (not b!799476) (not b!799481) (not b!799472) (not b!799479) (not b!799474) (not b!799471))
(check-sat)
