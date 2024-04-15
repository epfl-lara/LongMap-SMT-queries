; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68050 () Bool)

(assert start!68050)

(declare-fun b!791647 () Bool)

(declare-fun res!536525 () Bool)

(declare-fun e!439875 () Bool)

(assert (=> b!791647 (=> (not res!536525) (not e!439875))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!42972 0))(
  ( (array!42973 (arr!20571 (Array (_ BitVec 32) (_ BitVec 64))) (size!20992 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!42972)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!791647 (= res!536525 (and (= (size!20992 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!20992 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!20992 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!791648 () Bool)

(assert (=> b!791648 (= e!439875 false)))

(declare-fun k!2044 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!8159 0))(
  ( (MissingZero!8159 (index!35004 (_ BitVec 32))) (Found!8159 (index!35005 (_ BitVec 32))) (Intermediate!8159 (undefined!8971 Bool) (index!35006 (_ BitVec 32)) (x!65968 (_ BitVec 32))) (Undefined!8159) (MissingVacant!8159 (index!35007 (_ BitVec 32))) )
))
(declare-fun lt!353087 () SeekEntryResult!8159)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42972 (_ BitVec 32)) SeekEntryResult!8159)

(assert (=> b!791648 (= lt!353087 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!791649 () Bool)

(declare-fun res!536523 () Bool)

(assert (=> b!791649 (=> (not res!536523) (not e!439875))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!791649 (= res!536523 (validKeyInArray!0 k!2044))))

(declare-fun b!791651 () Bool)

(declare-fun res!536524 () Bool)

(assert (=> b!791651 (=> (not res!536524) (not e!439875))))

(assert (=> b!791651 (= res!536524 (validKeyInArray!0 (select (arr!20571 a!3170) j!153)))))

(declare-fun b!791650 () Bool)

(declare-fun res!536526 () Bool)

(assert (=> b!791650 (=> (not res!536526) (not e!439875))))

(declare-fun arrayContainsKey!0 (array!42972 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!791650 (= res!536526 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun res!536522 () Bool)

(assert (=> start!68050 (=> (not res!536522) (not e!439875))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68050 (= res!536522 (validMask!0 mask!3266))))

(assert (=> start!68050 e!439875))

(assert (=> start!68050 true))

(declare-fun array_inv!16454 (array!42972) Bool)

(assert (=> start!68050 (array_inv!16454 a!3170)))

(assert (= (and start!68050 res!536522) b!791647))

(assert (= (and b!791647 res!536525) b!791651))

(assert (= (and b!791651 res!536524) b!791649))

(assert (= (and b!791649 res!536523) b!791650))

(assert (= (and b!791650 res!536526) b!791648))

(declare-fun m!731843 () Bool)

(assert (=> start!68050 m!731843))

(declare-fun m!731845 () Bool)

(assert (=> start!68050 m!731845))

(declare-fun m!731847 () Bool)

(assert (=> b!791648 m!731847))

(declare-fun m!731849 () Bool)

(assert (=> b!791650 m!731849))

(declare-fun m!731851 () Bool)

(assert (=> b!791651 m!731851))

(assert (=> b!791651 m!731851))

(declare-fun m!731853 () Bool)

(assert (=> b!791651 m!731853))

(declare-fun m!731855 () Bool)

(assert (=> b!791649 m!731855))

(push 1)

(assert (not b!791649))

(assert (not b!791651))

(assert (not b!791650))

(assert (not start!68050))

(assert (not b!791648))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

