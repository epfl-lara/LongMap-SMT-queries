; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68092 () Bool)

(assert start!68092)

(declare-fun b!792063 () Bool)

(declare-fun res!536803 () Bool)

(declare-fun e!440097 () Bool)

(assert (=> b!792063 (=> (not res!536803) (not e!440097))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!792063 (= res!536803 (validKeyInArray!0 k!2044))))

(declare-fun b!792064 () Bool)

(declare-fun e!440099 () Bool)

(declare-datatypes ((array!42995 0))(
  ( (array!42996 (arr!20582 (Array (_ BitVec 32) (_ BitVec 64))) (size!21003 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!42995)

(assert (=> b!792064 (= e!440099 (bvsgt #b00000000000000000000000000000000 (size!21003 a!3170)))))

(declare-fun res!536804 () Bool)

(assert (=> start!68092 (=> (not res!536804) (not e!440097))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68092 (= res!536804 (validMask!0 mask!3266))))

(assert (=> start!68092 e!440097))

(assert (=> start!68092 true))

(declare-fun array_inv!16378 (array!42995) Bool)

(assert (=> start!68092 (array_inv!16378 a!3170)))

(declare-fun b!792065 () Bool)

(assert (=> b!792065 (= e!440097 e!440099)))

(declare-fun res!536802 () Bool)

(assert (=> b!792065 (=> (not res!536802) (not e!440099))))

(declare-datatypes ((SeekEntryResult!8173 0))(
  ( (MissingZero!8173 (index!35060 (_ BitVec 32))) (Found!8173 (index!35061 (_ BitVec 32))) (Intermediate!8173 (undefined!8985 Bool) (index!35062 (_ BitVec 32)) (x!66011 (_ BitVec 32))) (Undefined!8173) (MissingVacant!8173 (index!35063 (_ BitVec 32))) )
))
(declare-fun lt!353357 () SeekEntryResult!8173)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!792065 (= res!536802 (or (= lt!353357 (MissingZero!8173 i!1163)) (= lt!353357 (MissingVacant!8173 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42995 (_ BitVec 32)) SeekEntryResult!8173)

(assert (=> b!792065 (= lt!353357 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!792066 () Bool)

(declare-fun res!536801 () Bool)

(assert (=> b!792066 (=> (not res!536801) (not e!440097))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!792066 (= res!536801 (and (= (size!21003 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21003 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21003 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!792067 () Bool)

(declare-fun res!536800 () Bool)

(assert (=> b!792067 (=> (not res!536800) (not e!440099))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42995 (_ BitVec 32)) Bool)

(assert (=> b!792067 (= res!536800 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!792068 () Bool)

(declare-fun res!536798 () Bool)

(assert (=> b!792068 (=> (not res!536798) (not e!440097))))

(assert (=> b!792068 (= res!536798 (validKeyInArray!0 (select (arr!20582 a!3170) j!153)))))

(declare-fun b!792069 () Bool)

(declare-fun res!536799 () Bool)

(assert (=> b!792069 (=> (not res!536799) (not e!440097))))

(declare-fun arrayContainsKey!0 (array!42995 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!792069 (= res!536799 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(assert (= (and start!68092 res!536804) b!792066))

(assert (= (and b!792066 res!536801) b!792068))

(assert (= (and b!792068 res!536798) b!792063))

(assert (= (and b!792063 res!536803) b!792069))

(assert (= (and b!792069 res!536799) b!792065))

(assert (= (and b!792065 res!536802) b!792067))

(assert (= (and b!792067 res!536800) b!792064))

(declare-fun m!732745 () Bool)

(assert (=> start!68092 m!732745))

(declare-fun m!732747 () Bool)

(assert (=> start!68092 m!732747))

(declare-fun m!732749 () Bool)

(assert (=> b!792063 m!732749))

(declare-fun m!732751 () Bool)

(assert (=> b!792069 m!732751))

(declare-fun m!732753 () Bool)

(assert (=> b!792067 m!732753))

(declare-fun m!732755 () Bool)

(assert (=> b!792065 m!732755))

(declare-fun m!732757 () Bool)

(assert (=> b!792068 m!732757))

(assert (=> b!792068 m!732757))

(declare-fun m!732759 () Bool)

(assert (=> b!792068 m!732759))

(push 1)

