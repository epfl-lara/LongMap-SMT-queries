; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68202 () Bool)

(assert start!68202)

(declare-fun b!792617 () Bool)

(declare-fun res!536980 () Bool)

(declare-fun e!440475 () Bool)

(assert (=> b!792617 (=> (not res!536980) (not e!440475))))

(declare-datatypes ((array!42983 0))(
  ( (array!42984 (arr!20572 (Array (_ BitVec 32) (_ BitVec 64))) (size!20992 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!42983)

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42983 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!792617 (= res!536980 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!792618 () Bool)

(declare-fun res!536981 () Bool)

(assert (=> b!792618 (=> (not res!536981) (not e!440475))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!792618 (= res!536981 (validKeyInArray!0 k0!2044))))

(declare-fun b!792619 () Bool)

(declare-fun res!536979 () Bool)

(assert (=> b!792619 (=> (not res!536979) (not e!440475))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!792619 (= res!536979 (validKeyInArray!0 (select (arr!20572 a!3170) j!153)))))

(declare-fun res!536978 () Bool)

(assert (=> start!68202 (=> (not res!536978) (not e!440475))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68202 (= res!536978 (validMask!0 mask!3266))))

(assert (=> start!68202 e!440475))

(assert (=> start!68202 true))

(declare-fun array_inv!16431 (array!42983) Bool)

(assert (=> start!68202 (array_inv!16431 a!3170)))

(declare-datatypes ((SeekEntryResult!8119 0))(
  ( (MissingZero!8119 (index!34844 (_ BitVec 32))) (Found!8119 (index!34845 (_ BitVec 32))) (Intermediate!8119 (undefined!8931 Bool) (index!34846 (_ BitVec 32)) (x!65960 (_ BitVec 32))) (Undefined!8119) (MissingVacant!8119 (index!34847 (_ BitVec 32))) )
))
(declare-fun lt!353614 () SeekEntryResult!8119)

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun b!792620 () Bool)

(assert (=> b!792620 (= e!440475 (and (or (= lt!353614 (MissingZero!8119 i!1163)) (= lt!353614 (MissingVacant!8119 i!1163))) (bvsgt #b00000000000000000000000000000000 (size!20992 a!3170))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42983 (_ BitVec 32)) SeekEntryResult!8119)

(assert (=> b!792620 (= lt!353614 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!792621 () Bool)

(declare-fun res!536982 () Bool)

(assert (=> b!792621 (=> (not res!536982) (not e!440475))))

(assert (=> b!792621 (= res!536982 (and (= (size!20992 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!20992 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!20992 a!3170)) (not (= i!1163 j!153))))))

(assert (= (and start!68202 res!536978) b!792621))

(assert (= (and b!792621 res!536982) b!792619))

(assert (= (and b!792619 res!536979) b!792618))

(assert (= (and b!792618 res!536981) b!792617))

(assert (= (and b!792617 res!536980) b!792620))

(declare-fun m!733733 () Bool)

(assert (=> b!792618 m!733733))

(declare-fun m!733735 () Bool)

(assert (=> start!68202 m!733735))

(declare-fun m!733737 () Bool)

(assert (=> start!68202 m!733737))

(declare-fun m!733739 () Bool)

(assert (=> b!792617 m!733739))

(declare-fun m!733741 () Bool)

(assert (=> b!792619 m!733741))

(assert (=> b!792619 m!733741))

(declare-fun m!733743 () Bool)

(assert (=> b!792619 m!733743))

(declare-fun m!733745 () Bool)

(assert (=> b!792620 m!733745))

(check-sat (not b!792619) (not start!68202) (not b!792618) (not b!792620) (not b!792617))
(check-sat)
