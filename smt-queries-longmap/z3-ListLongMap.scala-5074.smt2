; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68934 () Bool)

(assert start!68934)

(declare-fun b!804119 () Bool)

(declare-fun res!548784 () Bool)

(declare-fun e!445471 () Bool)

(assert (=> b!804119 (=> (not res!548784) (not e!445471))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43741 0))(
  ( (array!43742 (arr!20951 (Array (_ BitVec 32) (_ BitVec 64))) (size!21372 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43741)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!804119 (= res!548784 (and (= (size!21372 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21372 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21372 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!804120 () Bool)

(declare-fun res!548781 () Bool)

(declare-fun e!445470 () Bool)

(assert (=> b!804120 (=> (not res!548781) (not e!445470))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43741 (_ BitVec 32)) Bool)

(assert (=> b!804120 (= res!548781 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!804121 () Bool)

(assert (=> b!804121 (= e!445471 e!445470)))

(declare-fun res!548780 () Bool)

(assert (=> b!804121 (=> (not res!548780) (not e!445470))))

(declare-datatypes ((SeekEntryResult!8539 0))(
  ( (MissingZero!8539 (index!36524 (_ BitVec 32))) (Found!8539 (index!36525 (_ BitVec 32))) (Intermediate!8539 (undefined!9351 Bool) (index!36526 (_ BitVec 32)) (x!67364 (_ BitVec 32))) (Undefined!8539) (MissingVacant!8539 (index!36527 (_ BitVec 32))) )
))
(declare-fun lt!359894 () SeekEntryResult!8539)

(assert (=> b!804121 (= res!548780 (or (= lt!359894 (MissingZero!8539 i!1163)) (= lt!359894 (MissingVacant!8539 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43741 (_ BitVec 32)) SeekEntryResult!8539)

(assert (=> b!804121 (= lt!359894 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!804122 () Bool)

(declare-fun res!548783 () Bool)

(assert (=> b!804122 (=> (not res!548783) (not e!445471))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!804122 (= res!548783 (validKeyInArray!0 k0!2044))))

(declare-fun b!804123 () Bool)

(declare-fun res!548782 () Bool)

(assert (=> b!804123 (=> (not res!548782) (not e!445471))))

(assert (=> b!804123 (= res!548782 (validKeyInArray!0 (select (arr!20951 a!3170) j!153)))))

(declare-fun b!804124 () Bool)

(assert (=> b!804124 (= e!445470 false)))

(declare-fun lt!359893 () Bool)

(declare-datatypes ((List!14953 0))(
  ( (Nil!14950) (Cons!14949 (h!16078 (_ BitVec 64)) (t!21259 List!14953)) )
))
(declare-fun arrayNoDuplicates!0 (array!43741 (_ BitVec 32) List!14953) Bool)

(assert (=> b!804124 (= lt!359893 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14950))))

(declare-fun res!548779 () Bool)

(assert (=> start!68934 (=> (not res!548779) (not e!445471))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68934 (= res!548779 (validMask!0 mask!3266))))

(assert (=> start!68934 e!445471))

(assert (=> start!68934 true))

(declare-fun array_inv!16834 (array!43741) Bool)

(assert (=> start!68934 (array_inv!16834 a!3170)))

(declare-fun b!804125 () Bool)

(declare-fun res!548778 () Bool)

(assert (=> b!804125 (=> (not res!548778) (not e!445471))))

(declare-fun arrayContainsKey!0 (array!43741 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!804125 (= res!548778 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(assert (= (and start!68934 res!548779) b!804119))

(assert (= (and b!804119 res!548784) b!804123))

(assert (= (and b!804123 res!548782) b!804122))

(assert (= (and b!804122 res!548783) b!804125))

(assert (= (and b!804125 res!548778) b!804121))

(assert (= (and b!804121 res!548780) b!804120))

(assert (= (and b!804120 res!548781) b!804124))

(declare-fun m!745513 () Bool)

(assert (=> b!804123 m!745513))

(assert (=> b!804123 m!745513))

(declare-fun m!745515 () Bool)

(assert (=> b!804123 m!745515))

(declare-fun m!745517 () Bool)

(assert (=> b!804124 m!745517))

(declare-fun m!745519 () Bool)

(assert (=> b!804122 m!745519))

(declare-fun m!745521 () Bool)

(assert (=> b!804120 m!745521))

(declare-fun m!745523 () Bool)

(assert (=> b!804125 m!745523))

(declare-fun m!745525 () Bool)

(assert (=> b!804121 m!745525))

(declare-fun m!745527 () Bool)

(assert (=> start!68934 m!745527))

(declare-fun m!745529 () Bool)

(assert (=> start!68934 m!745529))

(check-sat (not b!804123) (not b!804120) (not b!804125) (not b!804121) (not b!804122) (not b!804124) (not start!68934))
(check-sat)
