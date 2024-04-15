; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68060 () Bool)

(assert start!68060)

(declare-fun b!791722 () Bool)

(declare-fun res!536601 () Bool)

(declare-fun e!439906 () Bool)

(assert (=> b!791722 (=> (not res!536601) (not e!439906))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!791722 (= res!536601 (validKeyInArray!0 k0!2044))))

(declare-fun b!791723 () Bool)

(declare-fun res!536598 () Bool)

(assert (=> b!791723 (=> (not res!536598) (not e!439906))))

(declare-datatypes ((array!42982 0))(
  ( (array!42983 (arr!20576 (Array (_ BitVec 32) (_ BitVec 64))) (size!20997 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!42982)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!791723 (= res!536598 (validKeyInArray!0 (select (arr!20576 a!3170) j!153)))))

(declare-fun res!536597 () Bool)

(assert (=> start!68060 (=> (not res!536597) (not e!439906))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68060 (= res!536597 (validMask!0 mask!3266))))

(assert (=> start!68060 e!439906))

(assert (=> start!68060 true))

(declare-fun array_inv!16459 (array!42982) Bool)

(assert (=> start!68060 (array_inv!16459 a!3170)))

(declare-fun b!791724 () Bool)

(declare-fun res!536599 () Bool)

(assert (=> b!791724 (=> (not res!536599) (not e!439906))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!791724 (= res!536599 (and (= (size!20997 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!20997 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!20997 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!791725 () Bool)

(declare-fun res!536600 () Bool)

(assert (=> b!791725 (=> (not res!536600) (not e!439906))))

(declare-fun arrayContainsKey!0 (array!42982 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!791725 (= res!536600 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-datatypes ((SeekEntryResult!8164 0))(
  ( (MissingZero!8164 (index!35024 (_ BitVec 32))) (Found!8164 (index!35025 (_ BitVec 32))) (Intermediate!8164 (undefined!8976 Bool) (index!35026 (_ BitVec 32)) (x!65989 (_ BitVec 32))) (Undefined!8164) (MissingVacant!8164 (index!35027 (_ BitVec 32))) )
))
(declare-fun lt!353102 () SeekEntryResult!8164)

(declare-fun b!791726 () Bool)

(assert (=> b!791726 (= e!439906 (and (or (= lt!353102 (MissingZero!8164 i!1163)) (= lt!353102 (MissingVacant!8164 i!1163))) (bvsgt #b00000000000000000000000000000000 (size!20997 a!3170))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42982 (_ BitVec 32)) SeekEntryResult!8164)

(assert (=> b!791726 (= lt!353102 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(assert (= (and start!68060 res!536597) b!791724))

(assert (= (and b!791724 res!536599) b!791723))

(assert (= (and b!791723 res!536598) b!791722))

(assert (= (and b!791722 res!536601) b!791725))

(assert (= (and b!791725 res!536600) b!791726))

(declare-fun m!731913 () Bool)

(assert (=> b!791723 m!731913))

(assert (=> b!791723 m!731913))

(declare-fun m!731915 () Bool)

(assert (=> b!791723 m!731915))

(declare-fun m!731917 () Bool)

(assert (=> b!791726 m!731917))

(declare-fun m!731919 () Bool)

(assert (=> start!68060 m!731919))

(declare-fun m!731921 () Bool)

(assert (=> start!68060 m!731921))

(declare-fun m!731923 () Bool)

(assert (=> b!791722 m!731923))

(declare-fun m!731925 () Bool)

(assert (=> b!791725 m!731925))

(check-sat (not start!68060) (not b!791723) (not b!791722) (not b!791725) (not b!791726))
(check-sat)
