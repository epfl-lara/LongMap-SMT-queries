; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68520 () Bool)

(assert start!68520)

(declare-fun b!795470 () Bool)

(declare-fun e!441683 () Bool)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!795470 (= e!441683 (and (bvsge mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266))))))

(declare-fun b!795471 () Bool)

(declare-fun res!539619 () Bool)

(declare-fun e!441685 () Bool)

(assert (=> b!795471 (=> (not res!539619) (not e!441685))))

(declare-datatypes ((array!43184 0))(
  ( (array!43185 (arr!20668 (Array (_ BitVec 32) (_ BitVec 64))) (size!21088 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43184)

(declare-datatypes ((List!14538 0))(
  ( (Nil!14535) (Cons!14534 (h!15669 (_ BitVec 64)) (t!20845 List!14538)) )
))
(declare-fun arrayNoDuplicates!0 (array!43184 (_ BitVec 32) List!14538) Bool)

(assert (=> b!795471 (= res!539619 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14535))))

(declare-fun b!795472 () Bool)

(declare-fun res!539616 () Bool)

(declare-fun e!441684 () Bool)

(assert (=> b!795472 (=> (not res!539616) (not e!441684))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43184 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!795472 (= res!539616 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!795473 () Bool)

(declare-fun res!539615 () Bool)

(assert (=> b!795473 (=> (not res!539615) (not e!441685))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43184 (_ BitVec 32)) Bool)

(assert (=> b!795473 (= res!539615 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!539621 () Bool)

(assert (=> start!68520 (=> (not res!539621) (not e!441684))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68520 (= res!539621 (validMask!0 mask!3266))))

(assert (=> start!68520 e!441684))

(assert (=> start!68520 true))

(declare-fun array_inv!16527 (array!43184) Bool)

(assert (=> start!68520 (array_inv!16527 a!3170)))

(declare-fun b!795474 () Bool)

(declare-fun res!539618 () Bool)

(assert (=> b!795474 (=> (not res!539618) (not e!441683))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8215 0))(
  ( (MissingZero!8215 (index!35228 (_ BitVec 32))) (Found!8215 (index!35229 (_ BitVec 32))) (Intermediate!8215 (undefined!9027 Bool) (index!35230 (_ BitVec 32)) (x!66312 (_ BitVec 32))) (Undefined!8215) (MissingVacant!8215 (index!35231 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43184 (_ BitVec 32)) SeekEntryResult!8215)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43184 (_ BitVec 32)) SeekEntryResult!8215)

(assert (=> b!795474 (= res!539618 (= (seekEntryOrOpen!0 (select (arr!20668 a!3170) j!153) a!3170 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20668 a!3170) j!153) a!3170 mask!3266)))))

(declare-fun b!795475 () Bool)

(declare-fun res!539624 () Bool)

(assert (=> b!795475 (=> (not res!539624) (not e!441684))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!795475 (= res!539624 (and (= (size!21088 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21088 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21088 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!795476 () Bool)

(declare-fun res!539625 () Bool)

(assert (=> b!795476 (=> (not res!539625) (not e!441685))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(assert (=> b!795476 (= res!539625 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21088 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20668 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21088 a!3170)) (= (select (arr!20668 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!795477 () Bool)

(assert (=> b!795477 (= e!441685 e!441683)))

(declare-fun res!539617 () Bool)

(assert (=> b!795477 (=> (not res!539617) (not e!441683))))

(declare-fun lt!354575 () array!43184)

(declare-fun lt!354577 () (_ BitVec 64))

(assert (=> b!795477 (= res!539617 (= (seekEntryOrOpen!0 lt!354577 lt!354575 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354577 lt!354575 mask!3266)))))

(assert (=> b!795477 (= lt!354577 (select (store (arr!20668 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!795477 (= lt!354575 (array!43185 (store (arr!20668 a!3170) i!1163 k0!2044) (size!21088 a!3170)))))

(declare-fun b!795478 () Bool)

(assert (=> b!795478 (= e!441684 e!441685)))

(declare-fun res!539623 () Bool)

(assert (=> b!795478 (=> (not res!539623) (not e!441685))))

(declare-fun lt!354576 () SeekEntryResult!8215)

(assert (=> b!795478 (= res!539623 (or (= lt!354576 (MissingZero!8215 i!1163)) (= lt!354576 (MissingVacant!8215 i!1163))))))

(assert (=> b!795478 (= lt!354576 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!795479 () Bool)

(declare-fun res!539620 () Bool)

(assert (=> b!795479 (=> (not res!539620) (not e!441684))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!795479 (= res!539620 (validKeyInArray!0 (select (arr!20668 a!3170) j!153)))))

(declare-fun b!795480 () Bool)

(declare-fun res!539622 () Bool)

(assert (=> b!795480 (=> (not res!539622) (not e!441684))))

(assert (=> b!795480 (= res!539622 (validKeyInArray!0 k0!2044))))

(assert (= (and start!68520 res!539621) b!795475))

(assert (= (and b!795475 res!539624) b!795479))

(assert (= (and b!795479 res!539620) b!795480))

(assert (= (and b!795480 res!539622) b!795472))

(assert (= (and b!795472 res!539616) b!795478))

(assert (= (and b!795478 res!539623) b!795473))

(assert (= (and b!795473 res!539615) b!795471))

(assert (= (and b!795471 res!539619) b!795476))

(assert (= (and b!795476 res!539625) b!795477))

(assert (= (and b!795477 res!539617) b!795474))

(assert (= (and b!795474 res!539618) b!795470))

(declare-fun m!736469 () Bool)

(assert (=> b!795472 m!736469))

(declare-fun m!736471 () Bool)

(assert (=> b!795479 m!736471))

(assert (=> b!795479 m!736471))

(declare-fun m!736473 () Bool)

(assert (=> b!795479 m!736473))

(declare-fun m!736475 () Bool)

(assert (=> b!795473 m!736475))

(declare-fun m!736477 () Bool)

(assert (=> b!795471 m!736477))

(declare-fun m!736479 () Bool)

(assert (=> b!795477 m!736479))

(declare-fun m!736481 () Bool)

(assert (=> b!795477 m!736481))

(declare-fun m!736483 () Bool)

(assert (=> b!795477 m!736483))

(declare-fun m!736485 () Bool)

(assert (=> b!795477 m!736485))

(declare-fun m!736487 () Bool)

(assert (=> start!68520 m!736487))

(declare-fun m!736489 () Bool)

(assert (=> start!68520 m!736489))

(declare-fun m!736491 () Bool)

(assert (=> b!795476 m!736491))

(declare-fun m!736493 () Bool)

(assert (=> b!795476 m!736493))

(declare-fun m!736495 () Bool)

(assert (=> b!795480 m!736495))

(assert (=> b!795474 m!736471))

(assert (=> b!795474 m!736471))

(declare-fun m!736497 () Bool)

(assert (=> b!795474 m!736497))

(assert (=> b!795474 m!736471))

(declare-fun m!736499 () Bool)

(assert (=> b!795474 m!736499))

(declare-fun m!736501 () Bool)

(assert (=> b!795478 m!736501))

(check-sat (not b!795473) (not b!795478) (not b!795477) (not b!795474) (not b!795479) (not start!68520) (not b!795471) (not b!795480) (not b!795472))
(check-sat)
