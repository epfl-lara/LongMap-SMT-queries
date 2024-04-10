; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68084 () Bool)

(assert start!68084)

(declare-fun b!791987 () Bool)

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!42987 0))(
  ( (array!42988 (arr!20578 (Array (_ BitVec 32) (_ BitVec 64))) (size!20999 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!42987)

(declare-fun e!440065 () Bool)

(declare-datatypes ((SeekEntryResult!8169 0))(
  ( (MissingZero!8169 (index!35044 (_ BitVec 32))) (Found!8169 (index!35045 (_ BitVec 32))) (Intermediate!8169 (undefined!8981 Bool) (index!35046 (_ BitVec 32)) (x!65999 (_ BitVec 32))) (Undefined!8169) (MissingVacant!8169 (index!35047 (_ BitVec 32))) )
))
(declare-fun lt!353345 () SeekEntryResult!8169)

(assert (=> b!791987 (= e!440065 (and (or (= lt!353345 (MissingZero!8169 i!1163)) (= lt!353345 (MissingVacant!8169 i!1163))) (bvsgt #b00000000000000000000000000000000 (size!20999 a!3170))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42987 (_ BitVec 32)) SeekEntryResult!8169)

(assert (=> b!791987 (= lt!353345 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!791988 () Bool)

(declare-fun res!536724 () Bool)

(assert (=> b!791988 (=> (not res!536724) (not e!440065))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!791988 (= res!536724 (validKeyInArray!0 k0!2044))))

(declare-fun b!791989 () Bool)

(declare-fun res!536723 () Bool)

(assert (=> b!791989 (=> (not res!536723) (not e!440065))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!791989 (= res!536723 (and (= (size!20999 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!20999 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!20999 a!3170)) (not (= i!1163 j!153))))))

(declare-fun res!536722 () Bool)

(assert (=> start!68084 (=> (not res!536722) (not e!440065))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68084 (= res!536722 (validMask!0 mask!3266))))

(assert (=> start!68084 e!440065))

(assert (=> start!68084 true))

(declare-fun array_inv!16374 (array!42987) Bool)

(assert (=> start!68084 (array_inv!16374 a!3170)))

(declare-fun b!791990 () Bool)

(declare-fun res!536725 () Bool)

(assert (=> b!791990 (=> (not res!536725) (not e!440065))))

(assert (=> b!791990 (= res!536725 (validKeyInArray!0 (select (arr!20578 a!3170) j!153)))))

(declare-fun b!791991 () Bool)

(declare-fun res!536726 () Bool)

(assert (=> b!791991 (=> (not res!536726) (not e!440065))))

(declare-fun arrayContainsKey!0 (array!42987 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!791991 (= res!536726 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(assert (= (and start!68084 res!536722) b!791989))

(assert (= (and b!791989 res!536723) b!791990))

(assert (= (and b!791990 res!536725) b!791988))

(assert (= (and b!791988 res!536724) b!791991))

(assert (= (and b!791991 res!536726) b!791987))

(declare-fun m!732685 () Bool)

(assert (=> b!791988 m!732685))

(declare-fun m!732687 () Bool)

(assert (=> start!68084 m!732687))

(declare-fun m!732689 () Bool)

(assert (=> start!68084 m!732689))

(declare-fun m!732691 () Bool)

(assert (=> b!791991 m!732691))

(declare-fun m!732693 () Bool)

(assert (=> b!791990 m!732693))

(assert (=> b!791990 m!732693))

(declare-fun m!732695 () Bool)

(assert (=> b!791990 m!732695))

(declare-fun m!732697 () Bool)

(assert (=> b!791987 m!732697))

(check-sat (not start!68084) (not b!791991) (not b!791987) (not b!791988) (not b!791990))
(check-sat)
