; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68042 () Bool)

(assert start!68042)

(declare-fun res!536401 () Bool)

(declare-fun e!439940 () Bool)

(assert (=> start!68042 (=> (not res!536401) (not e!439940))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68042 (= res!536401 (validMask!0 mask!3266))))

(assert (=> start!68042 e!439940))

(assert (=> start!68042 true))

(declare-datatypes ((array!42945 0))(
  ( (array!42946 (arr!20557 (Array (_ BitVec 32) (_ BitVec 64))) (size!20978 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!42945)

(declare-fun array_inv!16353 (array!42945) Bool)

(assert (=> start!68042 (array_inv!16353 a!3170)))

(declare-fun b!791663 () Bool)

(declare-fun res!536399 () Bool)

(assert (=> b!791663 (=> (not res!536399) (not e!439940))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!791663 (= res!536399 (validKeyInArray!0 (select (arr!20557 a!3170) j!153)))))

(declare-fun b!791664 () Bool)

(declare-fun res!536398 () Bool)

(assert (=> b!791664 (=> (not res!536398) (not e!439940))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!791664 (= res!536398 (validKeyInArray!0 k0!2044))))

(declare-fun b!791665 () Bool)

(assert (=> b!791665 (= e!439940 false)))

(declare-datatypes ((SeekEntryResult!8148 0))(
  ( (MissingZero!8148 (index!34960 (_ BitVec 32))) (Found!8148 (index!34961 (_ BitVec 32))) (Intermediate!8148 (undefined!8960 Bool) (index!34962 (_ BitVec 32)) (x!65922 (_ BitVec 32))) (Undefined!8148) (MissingVacant!8148 (index!34963 (_ BitVec 32))) )
))
(declare-fun lt!353291 () SeekEntryResult!8148)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42945 (_ BitVec 32)) SeekEntryResult!8148)

(assert (=> b!791665 (= lt!353291 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!791666 () Bool)

(declare-fun res!536402 () Bool)

(assert (=> b!791666 (=> (not res!536402) (not e!439940))))

(declare-fun arrayContainsKey!0 (array!42945 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!791666 (= res!536402 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!791667 () Bool)

(declare-fun res!536400 () Bool)

(assert (=> b!791667 (=> (not res!536400) (not e!439940))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!791667 (= res!536400 (and (= (size!20978 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!20978 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!20978 a!3170)) (not (= i!1163 j!153))))))

(assert (= (and start!68042 res!536401) b!791667))

(assert (= (and b!791667 res!536400) b!791663))

(assert (= (and b!791663 res!536399) b!791664))

(assert (= (and b!791664 res!536398) b!791666))

(assert (= (and b!791666 res!536402) b!791665))

(declare-fun m!732391 () Bool)

(assert (=> b!791666 m!732391))

(declare-fun m!732393 () Bool)

(assert (=> start!68042 m!732393))

(declare-fun m!732395 () Bool)

(assert (=> start!68042 m!732395))

(declare-fun m!732397 () Bool)

(assert (=> b!791663 m!732397))

(assert (=> b!791663 m!732397))

(declare-fun m!732399 () Bool)

(assert (=> b!791663 m!732399))

(declare-fun m!732401 () Bool)

(assert (=> b!791665 m!732401))

(declare-fun m!732403 () Bool)

(assert (=> b!791664 m!732403))

(check-sat (not b!791666) (not b!791665) (not start!68042) (not b!791664) (not b!791663))
