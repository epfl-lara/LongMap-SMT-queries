; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68044 () Bool)

(assert start!68044)

(declare-fun b!791602 () Bool)

(declare-fun res!536478 () Bool)

(declare-fun e!439858 () Bool)

(assert (=> b!791602 (=> (not res!536478) (not e!439858))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!791602 (= res!536478 (validKeyInArray!0 k!2044))))

(declare-fun b!791603 () Bool)

(declare-fun res!536479 () Bool)

(assert (=> b!791603 (=> (not res!536479) (not e!439858))))

(declare-datatypes ((array!42966 0))(
  ( (array!42967 (arr!20568 (Array (_ BitVec 32) (_ BitVec 64))) (size!20989 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!42966)

(declare-fun arrayContainsKey!0 (array!42966 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!791603 (= res!536479 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!791604 () Bool)

(declare-fun res!536481 () Bool)

(assert (=> b!791604 (=> (not res!536481) (not e!439858))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!791604 (= res!536481 (and (= (size!20989 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!20989 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!20989 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!791605 () Bool)

(declare-fun res!536480 () Bool)

(assert (=> b!791605 (=> (not res!536480) (not e!439858))))

(assert (=> b!791605 (= res!536480 (validKeyInArray!0 (select (arr!20568 a!3170) j!153)))))

(declare-fun b!791606 () Bool)

(assert (=> b!791606 (= e!439858 false)))

(declare-datatypes ((SeekEntryResult!8156 0))(
  ( (MissingZero!8156 (index!34992 (_ BitVec 32))) (Found!8156 (index!34993 (_ BitVec 32))) (Intermediate!8156 (undefined!8968 Bool) (index!34994 (_ BitVec 32)) (x!65957 (_ BitVec 32))) (Undefined!8156) (MissingVacant!8156 (index!34995 (_ BitVec 32))) )
))
(declare-fun lt!353078 () SeekEntryResult!8156)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42966 (_ BitVec 32)) SeekEntryResult!8156)

(assert (=> b!791606 (= lt!353078 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun res!536477 () Bool)

(assert (=> start!68044 (=> (not res!536477) (not e!439858))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68044 (= res!536477 (validMask!0 mask!3266))))

(assert (=> start!68044 e!439858))

(assert (=> start!68044 true))

(declare-fun array_inv!16451 (array!42966) Bool)

(assert (=> start!68044 (array_inv!16451 a!3170)))

(assert (= (and start!68044 res!536477) b!791604))

(assert (= (and b!791604 res!536481) b!791605))

(assert (= (and b!791605 res!536480) b!791602))

(assert (= (and b!791602 res!536478) b!791603))

(assert (= (and b!791603 res!536479) b!791606))

(declare-fun m!731801 () Bool)

(assert (=> b!791603 m!731801))

(declare-fun m!731803 () Bool)

(assert (=> b!791602 m!731803))

(declare-fun m!731805 () Bool)

(assert (=> start!68044 m!731805))

(declare-fun m!731807 () Bool)

(assert (=> start!68044 m!731807))

(declare-fun m!731809 () Bool)

(assert (=> b!791606 m!731809))

(declare-fun m!731811 () Bool)

(assert (=> b!791605 m!731811))

(assert (=> b!791605 m!731811))

(declare-fun m!731813 () Bool)

(assert (=> b!791605 m!731813))

(push 1)

(assert (not start!68044))

(assert (not b!791605))

(assert (not b!791606))

(assert (not b!791602))

(assert (not b!791603))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

