; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68060 () Bool)

(assert start!68060)

(declare-fun b!791807 () Bool)

(declare-fun res!536545 () Bool)

(declare-fun e!439994 () Bool)

(assert (=> b!791807 (=> (not res!536545) (not e!439994))))

(declare-datatypes ((array!42963 0))(
  ( (array!42964 (arr!20566 (Array (_ BitVec 32) (_ BitVec 64))) (size!20987 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!42963)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!791807 (= res!536545 (validKeyInArray!0 (select (arr!20566 a!3170) j!153)))))

(declare-fun res!536544 () Bool)

(assert (=> start!68060 (=> (not res!536544) (not e!439994))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68060 (= res!536544 (validMask!0 mask!3266))))

(assert (=> start!68060 e!439994))

(assert (=> start!68060 true))

(declare-fun array_inv!16362 (array!42963) Bool)

(assert (=> start!68060 (array_inv!16362 a!3170)))

(declare-fun b!791808 () Bool)

(assert (=> b!791808 (= e!439994 false)))

(declare-datatypes ((SeekEntryResult!8157 0))(
  ( (MissingZero!8157 (index!34996 (_ BitVec 32))) (Found!8157 (index!34997 (_ BitVec 32))) (Intermediate!8157 (undefined!8969 Bool) (index!34998 (_ BitVec 32)) (x!65955 (_ BitVec 32))) (Undefined!8157) (MissingVacant!8157 (index!34999 (_ BitVec 32))) )
))
(declare-fun lt!353309 () SeekEntryResult!8157)

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42963 (_ BitVec 32)) SeekEntryResult!8157)

(assert (=> b!791808 (= lt!353309 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!791809 () Bool)

(declare-fun res!536546 () Bool)

(assert (=> b!791809 (=> (not res!536546) (not e!439994))))

(declare-fun arrayContainsKey!0 (array!42963 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!791809 (= res!536546 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!791810 () Bool)

(declare-fun res!536542 () Bool)

(assert (=> b!791810 (=> (not res!536542) (not e!439994))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!791810 (= res!536542 (and (= (size!20987 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!20987 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!20987 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!791811 () Bool)

(declare-fun res!536543 () Bool)

(assert (=> b!791811 (=> (not res!536543) (not e!439994))))

(assert (=> b!791811 (= res!536543 (validKeyInArray!0 k0!2044))))

(assert (= (and start!68060 res!536544) b!791810))

(assert (= (and b!791810 res!536542) b!791807))

(assert (= (and b!791807 res!536545) b!791811))

(assert (= (and b!791811 res!536543) b!791809))

(assert (= (and b!791809 res!536546) b!791808))

(declare-fun m!732517 () Bool)

(assert (=> b!791811 m!732517))

(declare-fun m!732519 () Bool)

(assert (=> b!791807 m!732519))

(assert (=> b!791807 m!732519))

(declare-fun m!732521 () Bool)

(assert (=> b!791807 m!732521))

(declare-fun m!732523 () Bool)

(assert (=> b!791809 m!732523))

(declare-fun m!732525 () Bool)

(assert (=> b!791808 m!732525))

(declare-fun m!732527 () Bool)

(assert (=> start!68060 m!732527))

(declare-fun m!732529 () Bool)

(assert (=> start!68060 m!732529))

(check-sat (not b!791807) (not b!791811) (not b!791808) (not start!68060) (not b!791809))
