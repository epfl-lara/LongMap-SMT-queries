; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68200 () Bool)

(assert start!68200)

(declare-fun res!536966 () Bool)

(declare-fun e!440470 () Bool)

(assert (=> start!68200 (=> (not res!536966) (not e!440470))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68200 (= res!536966 (validMask!0 mask!3266))))

(assert (=> start!68200 e!440470))

(assert (=> start!68200 true))

(declare-datatypes ((array!42981 0))(
  ( (array!42982 (arr!20571 (Array (_ BitVec 32) (_ BitVec 64))) (size!20991 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!42981)

(declare-fun array_inv!16430 (array!42981) Bool)

(assert (=> start!68200 (array_inv!16430 a!3170)))

(declare-fun b!792602 () Bool)

(declare-fun res!536967 () Bool)

(assert (=> b!792602 (=> (not res!536967) (not e!440470))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!792602 (= res!536967 (and (= (size!20991 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!20991 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!20991 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!792603 () Bool)

(declare-fun res!536964 () Bool)

(assert (=> b!792603 (=> (not res!536964) (not e!440470))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42981 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!792603 (= res!536964 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!792604 () Bool)

(declare-fun res!536965 () Bool)

(assert (=> b!792604 (=> (not res!536965) (not e!440470))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!792604 (= res!536965 (validKeyInArray!0 k!2044))))

(declare-fun b!792605 () Bool)

(assert (=> b!792605 (= e!440470 false)))

(declare-datatypes ((SeekEntryResult!8118 0))(
  ( (MissingZero!8118 (index!34840 (_ BitVec 32))) (Found!8118 (index!34841 (_ BitVec 32))) (Intermediate!8118 (undefined!8930 Bool) (index!34842 (_ BitVec 32)) (x!65951 (_ BitVec 32))) (Undefined!8118) (MissingVacant!8118 (index!34843 (_ BitVec 32))) )
))
(declare-fun lt!353611 () SeekEntryResult!8118)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42981 (_ BitVec 32)) SeekEntryResult!8118)

(assert (=> b!792605 (= lt!353611 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!792606 () Bool)

(declare-fun res!536963 () Bool)

(assert (=> b!792606 (=> (not res!536963) (not e!440470))))

(assert (=> b!792606 (= res!536963 (validKeyInArray!0 (select (arr!20571 a!3170) j!153)))))

(assert (= (and start!68200 res!536966) b!792602))

(assert (= (and b!792602 res!536967) b!792606))

(assert (= (and b!792606 res!536963) b!792604))

(assert (= (and b!792604 res!536965) b!792603))

(assert (= (and b!792603 res!536964) b!792605))

(declare-fun m!733719 () Bool)

(assert (=> b!792603 m!733719))

(declare-fun m!733721 () Bool)

(assert (=> start!68200 m!733721))

(declare-fun m!733723 () Bool)

(assert (=> start!68200 m!733723))

(declare-fun m!733725 () Bool)

(assert (=> b!792606 m!733725))

(assert (=> b!792606 m!733725))

(declare-fun m!733727 () Bool)

(assert (=> b!792606 m!733727))

(declare-fun m!733729 () Bool)

(assert (=> b!792605 m!733729))

(declare-fun m!733731 () Bool)

(assert (=> b!792604 m!733731))

(push 1)

(assert (not b!792603))

(assert (not b!792604))

(assert (not b!792606))

(assert (not start!68200))

(assert (not b!792605))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

