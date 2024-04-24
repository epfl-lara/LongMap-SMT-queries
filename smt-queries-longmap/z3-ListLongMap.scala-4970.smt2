; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68454 () Bool)

(assert start!68454)

(declare-fun b!794512 () Bool)

(declare-fun res!538665 () Bool)

(declare-fun e!441330 () Bool)

(assert (=> b!794512 (=> (not res!538665) (not e!441330))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!794512 (= res!538665 (validKeyInArray!0 k0!2044))))

(declare-fun b!794513 () Bool)

(declare-fun e!441331 () Bool)

(assert (=> b!794513 (= e!441330 e!441331)))

(declare-fun res!538657 () Bool)

(assert (=> b!794513 (=> (not res!538657) (not e!441331))))

(declare-datatypes ((SeekEntryResult!8182 0))(
  ( (MissingZero!8182 (index!35096 (_ BitVec 32))) (Found!8182 (index!35097 (_ BitVec 32))) (Intermediate!8182 (undefined!8994 Bool) (index!35098 (_ BitVec 32)) (x!66191 (_ BitVec 32))) (Undefined!8182) (MissingVacant!8182 (index!35099 (_ BitVec 32))) )
))
(declare-fun lt!354160 () SeekEntryResult!8182)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!794513 (= res!538657 (or (= lt!354160 (MissingZero!8182 i!1163)) (= lt!354160 (MissingVacant!8182 i!1163))))))

(declare-datatypes ((array!43118 0))(
  ( (array!43119 (arr!20635 (Array (_ BitVec 32) (_ BitVec 64))) (size!21055 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43118)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43118 (_ BitVec 32)) SeekEntryResult!8182)

(assert (=> b!794513 (= lt!354160 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!794514 () Bool)

(declare-fun res!538663 () Bool)

(assert (=> b!794514 (=> (not res!538663) (not e!441330))))

(declare-fun arrayContainsKey!0 (array!43118 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!794514 (= res!538663 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!794515 () Bool)

(declare-fun res!538661 () Bool)

(assert (=> b!794515 (=> (not res!538661) (not e!441331))))

(declare-datatypes ((List!14505 0))(
  ( (Nil!14502) (Cons!14501 (h!15636 (_ BitVec 64)) (t!20812 List!14505)) )
))
(declare-fun arrayNoDuplicates!0 (array!43118 (_ BitVec 32) List!14505) Bool)

(assert (=> b!794515 (= res!538661 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14502))))

(declare-fun b!794516 () Bool)

(declare-fun res!538664 () Bool)

(assert (=> b!794516 (=> (not res!538664) (not e!441331))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43118 (_ BitVec 32)) Bool)

(assert (=> b!794516 (= res!538664 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!794517 () Bool)

(declare-fun res!538662 () Bool)

(assert (=> b!794517 (=> (not res!538662) (not e!441330))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!794517 (= res!538662 (validKeyInArray!0 (select (arr!20635 a!3170) j!153)))))

(declare-fun b!794519 () Bool)

(declare-fun res!538659 () Bool)

(assert (=> b!794519 (=> (not res!538659) (not e!441331))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!794519 (= res!538659 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21055 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20635 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21055 a!3170)) (= (select (arr!20635 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!794520 () Bool)

(declare-fun res!538660 () Bool)

(assert (=> b!794520 (=> (not res!538660) (not e!441330))))

(assert (=> b!794520 (= res!538660 (and (= (size!21055 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21055 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21055 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!794518 () Bool)

(assert (=> b!794518 (= e!441331 false)))

(declare-fun lt!354156 () (_ BitVec 64))

(declare-fun lt!354158 () SeekEntryResult!8182)

(declare-fun lt!354157 () array!43118)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43118 (_ BitVec 32)) SeekEntryResult!8182)

(assert (=> b!794518 (= lt!354158 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354156 lt!354157 mask!3266))))

(declare-fun lt!354159 () SeekEntryResult!8182)

(assert (=> b!794518 (= lt!354159 (seekEntryOrOpen!0 lt!354156 lt!354157 mask!3266))))

(assert (=> b!794518 (= lt!354156 (select (store (arr!20635 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!794518 (= lt!354157 (array!43119 (store (arr!20635 a!3170) i!1163 k0!2044) (size!21055 a!3170)))))

(declare-fun res!538658 () Bool)

(assert (=> start!68454 (=> (not res!538658) (not e!441330))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68454 (= res!538658 (validMask!0 mask!3266))))

(assert (=> start!68454 e!441330))

(assert (=> start!68454 true))

(declare-fun array_inv!16494 (array!43118) Bool)

(assert (=> start!68454 (array_inv!16494 a!3170)))

(assert (= (and start!68454 res!538658) b!794520))

(assert (= (and b!794520 res!538660) b!794517))

(assert (= (and b!794517 res!538662) b!794512))

(assert (= (and b!794512 res!538665) b!794514))

(assert (= (and b!794514 res!538663) b!794513))

(assert (= (and b!794513 res!538657) b!794516))

(assert (= (and b!794516 res!538664) b!794515))

(assert (= (and b!794515 res!538661) b!794519))

(assert (= (and b!794519 res!538659) b!794518))

(declare-fun m!735443 () Bool)

(assert (=> start!68454 m!735443))

(declare-fun m!735445 () Bool)

(assert (=> start!68454 m!735445))

(declare-fun m!735447 () Bool)

(assert (=> b!794516 m!735447))

(declare-fun m!735449 () Bool)

(assert (=> b!794519 m!735449))

(declare-fun m!735451 () Bool)

(assert (=> b!794519 m!735451))

(declare-fun m!735453 () Bool)

(assert (=> b!794512 m!735453))

(declare-fun m!735455 () Bool)

(assert (=> b!794513 m!735455))

(declare-fun m!735457 () Bool)

(assert (=> b!794518 m!735457))

(declare-fun m!735459 () Bool)

(assert (=> b!794518 m!735459))

(declare-fun m!735461 () Bool)

(assert (=> b!794518 m!735461))

(declare-fun m!735463 () Bool)

(assert (=> b!794518 m!735463))

(declare-fun m!735465 () Bool)

(assert (=> b!794517 m!735465))

(assert (=> b!794517 m!735465))

(declare-fun m!735467 () Bool)

(assert (=> b!794517 m!735467))

(declare-fun m!735469 () Bool)

(assert (=> b!794514 m!735469))

(declare-fun m!735471 () Bool)

(assert (=> b!794515 m!735471))

(check-sat (not b!794515) (not b!794514) (not b!794517) (not start!68454) (not b!794518) (not b!794512) (not b!794513) (not b!794516))
(check-sat)
