; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68076 () Bool)

(assert start!68076)

(declare-fun b!791927 () Bool)

(declare-fun res!536663 () Bool)

(declare-fun e!440041 () Bool)

(assert (=> b!791927 (=> (not res!536663) (not e!440041))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!42979 0))(
  ( (array!42980 (arr!20574 (Array (_ BitVec 32) (_ BitVec 64))) (size!20995 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!42979)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!791927 (= res!536663 (and (= (size!20995 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!20995 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!20995 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!791928 () Bool)

(declare-fun res!536666 () Bool)

(assert (=> b!791928 (=> (not res!536666) (not e!440041))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42979 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!791928 (= res!536666 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!791929 () Bool)

(assert (=> b!791929 (= e!440041 false)))

(declare-datatypes ((SeekEntryResult!8165 0))(
  ( (MissingZero!8165 (index!35028 (_ BitVec 32))) (Found!8165 (index!35029 (_ BitVec 32))) (Intermediate!8165 (undefined!8977 Bool) (index!35030 (_ BitVec 32)) (x!65987 (_ BitVec 32))) (Undefined!8165) (MissingVacant!8165 (index!35031 (_ BitVec 32))) )
))
(declare-fun lt!353333 () SeekEntryResult!8165)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42979 (_ BitVec 32)) SeekEntryResult!8165)

(assert (=> b!791929 (= lt!353333 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun res!536665 () Bool)

(assert (=> start!68076 (=> (not res!536665) (not e!440041))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68076 (= res!536665 (validMask!0 mask!3266))))

(assert (=> start!68076 e!440041))

(assert (=> start!68076 true))

(declare-fun array_inv!16370 (array!42979) Bool)

(assert (=> start!68076 (array_inv!16370 a!3170)))

(declare-fun b!791930 () Bool)

(declare-fun res!536662 () Bool)

(assert (=> b!791930 (=> (not res!536662) (not e!440041))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!791930 (= res!536662 (validKeyInArray!0 (select (arr!20574 a!3170) j!153)))))

(declare-fun b!791931 () Bool)

(declare-fun res!536664 () Bool)

(assert (=> b!791931 (=> (not res!536664) (not e!440041))))

(assert (=> b!791931 (= res!536664 (validKeyInArray!0 k!2044))))

(assert (= (and start!68076 res!536665) b!791927))

(assert (= (and b!791927 res!536663) b!791930))

(assert (= (and b!791930 res!536662) b!791931))

(assert (= (and b!791931 res!536664) b!791928))

(assert (= (and b!791928 res!536666) b!791929))

(declare-fun m!732629 () Bool)

(assert (=> b!791931 m!732629))

(declare-fun m!732631 () Bool)

(assert (=> b!791929 m!732631))

(declare-fun m!732633 () Bool)

(assert (=> start!68076 m!732633))

(declare-fun m!732635 () Bool)

(assert (=> start!68076 m!732635))

(declare-fun m!732637 () Bool)

(assert (=> b!791928 m!732637))

(declare-fun m!732639 () Bool)

(assert (=> b!791930 m!732639))

(assert (=> b!791930 m!732639))

(declare-fun m!732641 () Bool)

(assert (=> b!791930 m!732641))

(push 1)

(assert (not b!791929))

(assert (not b!791930))

(assert (not b!791928))

(assert (not b!791931))

(assert (not start!68076))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

