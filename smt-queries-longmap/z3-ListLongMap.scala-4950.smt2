; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68090 () Bool)

(assert start!68090)

(declare-fun b!792042 () Bool)

(declare-fun e!440090 () Bool)

(declare-datatypes ((array!42993 0))(
  ( (array!42994 (arr!20581 (Array (_ BitVec 32) (_ BitVec 64))) (size!21002 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!42993)

(assert (=> b!792042 (= e!440090 (bvsgt #b00000000000000000000000000000000 (size!21002 a!3170)))))

(declare-fun res!536778 () Bool)

(declare-fun e!440089 () Bool)

(assert (=> start!68090 (=> (not res!536778) (not e!440089))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68090 (= res!536778 (validMask!0 mask!3266))))

(assert (=> start!68090 e!440089))

(assert (=> start!68090 true))

(declare-fun array_inv!16377 (array!42993) Bool)

(assert (=> start!68090 (array_inv!16377 a!3170)))

(declare-fun b!792043 () Bool)

(declare-fun res!536777 () Bool)

(assert (=> b!792043 (=> (not res!536777) (not e!440089))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!792043 (= res!536777 (validKeyInArray!0 (select (arr!20581 a!3170) j!153)))))

(declare-fun b!792044 () Bool)

(declare-fun res!536779 () Bool)

(assert (=> b!792044 (=> (not res!536779) (not e!440090))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42993 (_ BitVec 32)) Bool)

(assert (=> b!792044 (= res!536779 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!792045 () Bool)

(assert (=> b!792045 (= e!440089 e!440090)))

(declare-fun res!536780 () Bool)

(assert (=> b!792045 (=> (not res!536780) (not e!440090))))

(declare-datatypes ((SeekEntryResult!8172 0))(
  ( (MissingZero!8172 (index!35056 (_ BitVec 32))) (Found!8172 (index!35057 (_ BitVec 32))) (Intermediate!8172 (undefined!8984 Bool) (index!35058 (_ BitVec 32)) (x!66010 (_ BitVec 32))) (Undefined!8172) (MissingVacant!8172 (index!35059 (_ BitVec 32))) )
))
(declare-fun lt!353354 () SeekEntryResult!8172)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!792045 (= res!536780 (or (= lt!353354 (MissingZero!8172 i!1163)) (= lt!353354 (MissingVacant!8172 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42993 (_ BitVec 32)) SeekEntryResult!8172)

(assert (=> b!792045 (= lt!353354 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!792046 () Bool)

(declare-fun res!536782 () Bool)

(assert (=> b!792046 (=> (not res!536782) (not e!440089))))

(declare-fun arrayContainsKey!0 (array!42993 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!792046 (= res!536782 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!792047 () Bool)

(declare-fun res!536781 () Bool)

(assert (=> b!792047 (=> (not res!536781) (not e!440089))))

(assert (=> b!792047 (= res!536781 (validKeyInArray!0 k0!2044))))

(declare-fun b!792048 () Bool)

(declare-fun res!536783 () Bool)

(assert (=> b!792048 (=> (not res!536783) (not e!440089))))

(assert (=> b!792048 (= res!536783 (and (= (size!21002 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21002 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21002 a!3170)) (not (= i!1163 j!153))))))

(assert (= (and start!68090 res!536778) b!792048))

(assert (= (and b!792048 res!536783) b!792043))

(assert (= (and b!792043 res!536777) b!792047))

(assert (= (and b!792047 res!536781) b!792046))

(assert (= (and b!792046 res!536782) b!792045))

(assert (= (and b!792045 res!536780) b!792044))

(assert (= (and b!792044 res!536779) b!792042))

(declare-fun m!732729 () Bool)

(assert (=> b!792044 m!732729))

(declare-fun m!732731 () Bool)

(assert (=> b!792045 m!732731))

(declare-fun m!732733 () Bool)

(assert (=> b!792047 m!732733))

(declare-fun m!732735 () Bool)

(assert (=> b!792043 m!732735))

(assert (=> b!792043 m!732735))

(declare-fun m!732737 () Bool)

(assert (=> b!792043 m!732737))

(declare-fun m!732739 () Bool)

(assert (=> b!792046 m!732739))

(declare-fun m!732741 () Bool)

(assert (=> start!68090 m!732741))

(declare-fun m!732743 () Bool)

(assert (=> start!68090 m!732743))

(check-sat (not b!792043) (not b!792046) (not b!792045) (not b!792047) (not b!792044) (not start!68090))
(check-sat)
