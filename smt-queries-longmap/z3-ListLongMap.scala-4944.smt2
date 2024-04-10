; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68054 () Bool)

(assert start!68054)

(declare-fun b!791762 () Bool)

(declare-fun res!536500 () Bool)

(declare-fun e!439976 () Bool)

(assert (=> b!791762 (=> (not res!536500) (not e!439976))))

(declare-datatypes ((array!42957 0))(
  ( (array!42958 (arr!20563 (Array (_ BitVec 32) (_ BitVec 64))) (size!20984 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!42957)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!791762 (= res!536500 (validKeyInArray!0 (select (arr!20563 a!3170) j!153)))))

(declare-fun b!791763 () Bool)

(declare-fun res!536498 () Bool)

(assert (=> b!791763 (=> (not res!536498) (not e!439976))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42957 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!791763 (= res!536498 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun res!536501 () Bool)

(assert (=> start!68054 (=> (not res!536501) (not e!439976))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68054 (= res!536501 (validMask!0 mask!3266))))

(assert (=> start!68054 e!439976))

(assert (=> start!68054 true))

(declare-fun array_inv!16359 (array!42957) Bool)

(assert (=> start!68054 (array_inv!16359 a!3170)))

(declare-fun b!791764 () Bool)

(assert (=> b!791764 (= e!439976 false)))

(declare-datatypes ((SeekEntryResult!8154 0))(
  ( (MissingZero!8154 (index!34984 (_ BitVec 32))) (Found!8154 (index!34985 (_ BitVec 32))) (Intermediate!8154 (undefined!8966 Bool) (index!34986 (_ BitVec 32)) (x!65944 (_ BitVec 32))) (Undefined!8154) (MissingVacant!8154 (index!34987 (_ BitVec 32))) )
))
(declare-fun lt!353300 () SeekEntryResult!8154)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42957 (_ BitVec 32)) SeekEntryResult!8154)

(assert (=> b!791764 (= lt!353300 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!791765 () Bool)

(declare-fun res!536497 () Bool)

(assert (=> b!791765 (=> (not res!536497) (not e!439976))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!791765 (= res!536497 (and (= (size!20984 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!20984 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!20984 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!791766 () Bool)

(declare-fun res!536499 () Bool)

(assert (=> b!791766 (=> (not res!536499) (not e!439976))))

(assert (=> b!791766 (= res!536499 (validKeyInArray!0 k0!2044))))

(assert (= (and start!68054 res!536501) b!791765))

(assert (= (and b!791765 res!536497) b!791762))

(assert (= (and b!791762 res!536500) b!791766))

(assert (= (and b!791766 res!536499) b!791763))

(assert (= (and b!791763 res!536498) b!791764))

(declare-fun m!732475 () Bool)

(assert (=> start!68054 m!732475))

(declare-fun m!732477 () Bool)

(assert (=> start!68054 m!732477))

(declare-fun m!732479 () Bool)

(assert (=> b!791762 m!732479))

(assert (=> b!791762 m!732479))

(declare-fun m!732481 () Bool)

(assert (=> b!791762 m!732481))

(declare-fun m!732483 () Bool)

(assert (=> b!791766 m!732483))

(declare-fun m!732485 () Bool)

(assert (=> b!791763 m!732485))

(declare-fun m!732487 () Bool)

(assert (=> b!791764 m!732487))

(check-sat (not start!68054) (not b!791763) (not b!791766) (not b!791764) (not b!791762))
