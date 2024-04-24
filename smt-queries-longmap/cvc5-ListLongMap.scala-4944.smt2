; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68176 () Bool)

(assert start!68176)

(declare-fun res!536785 () Bool)

(declare-fun e!440397 () Bool)

(assert (=> start!68176 (=> (not res!536785) (not e!440397))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68176 (= res!536785 (validMask!0 mask!3266))))

(assert (=> start!68176 e!440397))

(assert (=> start!68176 true))

(declare-datatypes ((array!42957 0))(
  ( (array!42958 (arr!20559 (Array (_ BitVec 32) (_ BitVec 64))) (size!20979 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!42957)

(declare-fun array_inv!16418 (array!42957) Bool)

(assert (=> start!68176 (array_inv!16418 a!3170)))

(declare-fun b!792422 () Bool)

(declare-fun res!536783 () Bool)

(assert (=> b!792422 (=> (not res!536783) (not e!440397))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!792422 (= res!536783 (validKeyInArray!0 (select (arr!20559 a!3170) j!153)))))

(declare-fun b!792423 () Bool)

(declare-fun res!536784 () Bool)

(assert (=> b!792423 (=> (not res!536784) (not e!440397))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42957 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!792423 (= res!536784 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!792424 () Bool)

(declare-fun res!536786 () Bool)

(assert (=> b!792424 (=> (not res!536786) (not e!440397))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!792424 (= res!536786 (and (= (size!20979 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!20979 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!20979 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!792425 () Bool)

(assert (=> b!792425 (= e!440397 false)))

(declare-datatypes ((SeekEntryResult!8106 0))(
  ( (MissingZero!8106 (index!34792 (_ BitVec 32))) (Found!8106 (index!34793 (_ BitVec 32))) (Intermediate!8106 (undefined!8918 Bool) (index!34794 (_ BitVec 32)) (x!65907 (_ BitVec 32))) (Undefined!8106) (MissingVacant!8106 (index!34795 (_ BitVec 32))) )
))
(declare-fun lt!353575 () SeekEntryResult!8106)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42957 (_ BitVec 32)) SeekEntryResult!8106)

(assert (=> b!792425 (= lt!353575 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!792426 () Bool)

(declare-fun res!536787 () Bool)

(assert (=> b!792426 (=> (not res!536787) (not e!440397))))

(assert (=> b!792426 (= res!536787 (validKeyInArray!0 k!2044))))

(assert (= (and start!68176 res!536785) b!792424))

(assert (= (and b!792424 res!536786) b!792422))

(assert (= (and b!792422 res!536783) b!792426))

(assert (= (and b!792426 res!536787) b!792423))

(assert (= (and b!792423 res!536784) b!792425))

(declare-fun m!733551 () Bool)

(assert (=> b!792422 m!733551))

(assert (=> b!792422 m!733551))

(declare-fun m!733553 () Bool)

(assert (=> b!792422 m!733553))

(declare-fun m!733555 () Bool)

(assert (=> start!68176 m!733555))

(declare-fun m!733557 () Bool)

(assert (=> start!68176 m!733557))

(declare-fun m!733559 () Bool)

(assert (=> b!792426 m!733559))

(declare-fun m!733561 () Bool)

(assert (=> b!792425 m!733561))

(declare-fun m!733563 () Bool)

(assert (=> b!792423 m!733563))

(push 1)

(assert (not start!68176))

(assert (not b!792426))

(assert (not b!792422))

(assert (not b!792423))

(assert (not b!792425))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

