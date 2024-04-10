; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68072 () Bool)

(assert start!68072)

(declare-fun b!791897 () Bool)

(declare-fun e!440030 () Bool)

(assert (=> b!791897 (= e!440030 false)))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-datatypes ((array!42975 0))(
  ( (array!42976 (arr!20572 (Array (_ BitVec 32) (_ BitVec 64))) (size!20993 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!42975)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8163 0))(
  ( (MissingZero!8163 (index!35020 (_ BitVec 32))) (Found!8163 (index!35021 (_ BitVec 32))) (Intermediate!8163 (undefined!8975 Bool) (index!35022 (_ BitVec 32)) (x!65977 (_ BitVec 32))) (Undefined!8163) (MissingVacant!8163 (index!35023 (_ BitVec 32))) )
))
(declare-fun lt!353327 () SeekEntryResult!8163)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42975 (_ BitVec 32)) SeekEntryResult!8163)

(assert (=> b!791897 (= lt!353327 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!791898 () Bool)

(declare-fun res!536634 () Bool)

(assert (=> b!791898 (=> (not res!536634) (not e!440030))))

(declare-fun arrayContainsKey!0 (array!42975 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!791898 (= res!536634 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!791899 () Bool)

(declare-fun res!536635 () Bool)

(assert (=> b!791899 (=> (not res!536635) (not e!440030))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!791899 (= res!536635 (and (= (size!20993 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!20993 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!20993 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!791900 () Bool)

(declare-fun res!536633 () Bool)

(assert (=> b!791900 (=> (not res!536633) (not e!440030))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!791900 (= res!536633 (validKeyInArray!0 (select (arr!20572 a!3170) j!153)))))

(declare-fun b!791901 () Bool)

(declare-fun res!536632 () Bool)

(assert (=> b!791901 (=> (not res!536632) (not e!440030))))

(assert (=> b!791901 (= res!536632 (validKeyInArray!0 k0!2044))))

(declare-fun res!536636 () Bool)

(assert (=> start!68072 (=> (not res!536636) (not e!440030))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68072 (= res!536636 (validMask!0 mask!3266))))

(assert (=> start!68072 e!440030))

(assert (=> start!68072 true))

(declare-fun array_inv!16368 (array!42975) Bool)

(assert (=> start!68072 (array_inv!16368 a!3170)))

(assert (= (and start!68072 res!536636) b!791899))

(assert (= (and b!791899 res!536635) b!791900))

(assert (= (and b!791900 res!536633) b!791901))

(assert (= (and b!791901 res!536632) b!791898))

(assert (= (and b!791898 res!536634) b!791897))

(declare-fun m!732601 () Bool)

(assert (=> b!791897 m!732601))

(declare-fun m!732603 () Bool)

(assert (=> b!791898 m!732603))

(declare-fun m!732605 () Bool)

(assert (=> start!68072 m!732605))

(declare-fun m!732607 () Bool)

(assert (=> start!68072 m!732607))

(declare-fun m!732609 () Bool)

(assert (=> b!791901 m!732609))

(declare-fun m!732611 () Bool)

(assert (=> b!791900 m!732611))

(assert (=> b!791900 m!732611))

(declare-fun m!732613 () Bool)

(assert (=> b!791900 m!732613))

(check-sat (not start!68072) (not b!791901) (not b!791897) (not b!791900) (not b!791898))
