; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68194 () Bool)

(assert start!68194)

(declare-fun b!792557 () Bool)

(declare-fun e!440451 () Bool)

(assert (=> b!792557 (= e!440451 false)))

(declare-fun k!2044 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!8115 0))(
  ( (MissingZero!8115 (index!34828 (_ BitVec 32))) (Found!8115 (index!34829 (_ BitVec 32))) (Intermediate!8115 (undefined!8927 Bool) (index!34830 (_ BitVec 32)) (x!65940 (_ BitVec 32))) (Undefined!8115) (MissingVacant!8115 (index!34831 (_ BitVec 32))) )
))
(declare-fun lt!353602 () SeekEntryResult!8115)

(declare-datatypes ((array!42975 0))(
  ( (array!42976 (arr!20568 (Array (_ BitVec 32) (_ BitVec 64))) (size!20988 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!42975)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42975 (_ BitVec 32)) SeekEntryResult!8115)

(assert (=> b!792557 (= lt!353602 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!792558 () Bool)

(declare-fun res!536922 () Bool)

(assert (=> b!792558 (=> (not res!536922) (not e!440451))))

(declare-fun arrayContainsKey!0 (array!42975 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!792558 (= res!536922 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!792559 () Bool)

(declare-fun res!536921 () Bool)

(assert (=> b!792559 (=> (not res!536921) (not e!440451))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!792559 (= res!536921 (validKeyInArray!0 (select (arr!20568 a!3170) j!153)))))

(declare-fun b!792561 () Bool)

(declare-fun res!536920 () Bool)

(assert (=> b!792561 (=> (not res!536920) (not e!440451))))

(assert (=> b!792561 (= res!536920 (validKeyInArray!0 k!2044))))

(declare-fun res!536918 () Bool)

(assert (=> start!68194 (=> (not res!536918) (not e!440451))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68194 (= res!536918 (validMask!0 mask!3266))))

(assert (=> start!68194 e!440451))

(assert (=> start!68194 true))

(declare-fun array_inv!16427 (array!42975) Bool)

(assert (=> start!68194 (array_inv!16427 a!3170)))

(declare-fun b!792560 () Bool)

(declare-fun res!536919 () Bool)

(assert (=> b!792560 (=> (not res!536919) (not e!440451))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!792560 (= res!536919 (and (= (size!20988 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!20988 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!20988 a!3170)) (not (= i!1163 j!153))))))

(assert (= (and start!68194 res!536918) b!792560))

(assert (= (and b!792560 res!536919) b!792559))

(assert (= (and b!792559 res!536921) b!792561))

(assert (= (and b!792561 res!536920) b!792558))

(assert (= (and b!792558 res!536922) b!792557))

(declare-fun m!733677 () Bool)

(assert (=> b!792559 m!733677))

(assert (=> b!792559 m!733677))

(declare-fun m!733679 () Bool)

(assert (=> b!792559 m!733679))

(declare-fun m!733681 () Bool)

(assert (=> start!68194 m!733681))

(declare-fun m!733683 () Bool)

(assert (=> start!68194 m!733683))

(declare-fun m!733685 () Bool)

(assert (=> b!792558 m!733685))

(declare-fun m!733687 () Bool)

(assert (=> b!792557 m!733687))

(declare-fun m!733689 () Bool)

(assert (=> b!792561 m!733689))

(push 1)

(assert (not b!792557))

(assert (not b!792561))

(assert (not b!792559))

(assert (not start!68194))

(assert (not b!792558))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

