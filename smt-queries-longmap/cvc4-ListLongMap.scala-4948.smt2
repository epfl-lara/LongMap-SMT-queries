; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68080 () Bool)

(assert start!68080)

(declare-fun b!791957 () Bool)

(declare-fun res!536694 () Bool)

(declare-fun e!440053 () Bool)

(assert (=> b!791957 (=> (not res!536694) (not e!440053))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!791957 (= res!536694 (validKeyInArray!0 k!2044))))

(declare-fun b!791958 () Bool)

(declare-fun res!536692 () Bool)

(assert (=> b!791958 (=> (not res!536692) (not e!440053))))

(declare-datatypes ((array!42983 0))(
  ( (array!42984 (arr!20576 (Array (_ BitVec 32) (_ BitVec 64))) (size!20997 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!42983)

(declare-fun arrayContainsKey!0 (array!42983 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!791958 (= res!536692 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!791959 () Bool)

(declare-fun res!536693 () Bool)

(assert (=> b!791959 (=> (not res!536693) (not e!440053))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!791959 (= res!536693 (validKeyInArray!0 (select (arr!20576 a!3170) j!153)))))

(declare-fun res!536695 () Bool)

(assert (=> start!68080 (=> (not res!536695) (not e!440053))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68080 (= res!536695 (validMask!0 mask!3266))))

(assert (=> start!68080 e!440053))

(assert (=> start!68080 true))

(declare-fun array_inv!16372 (array!42983) Bool)

(assert (=> start!68080 (array_inv!16372 a!3170)))

(declare-fun b!791960 () Bool)

(assert (=> b!791960 (= e!440053 false)))

(declare-datatypes ((SeekEntryResult!8167 0))(
  ( (MissingZero!8167 (index!35036 (_ BitVec 32))) (Found!8167 (index!35037 (_ BitVec 32))) (Intermediate!8167 (undefined!8979 Bool) (index!35038 (_ BitVec 32)) (x!65989 (_ BitVec 32))) (Undefined!8167) (MissingVacant!8167 (index!35039 (_ BitVec 32))) )
))
(declare-fun lt!353339 () SeekEntryResult!8167)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42983 (_ BitVec 32)) SeekEntryResult!8167)

(assert (=> b!791960 (= lt!353339 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!791961 () Bool)

(declare-fun res!536696 () Bool)

(assert (=> b!791961 (=> (not res!536696) (not e!440053))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!791961 (= res!536696 (and (= (size!20997 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!20997 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!20997 a!3170)) (not (= i!1163 j!153))))))

(assert (= (and start!68080 res!536695) b!791961))

(assert (= (and b!791961 res!536696) b!791959))

(assert (= (and b!791959 res!536693) b!791957))

(assert (= (and b!791957 res!536694) b!791958))

(assert (= (and b!791958 res!536692) b!791960))

(declare-fun m!732657 () Bool)

(assert (=> b!791958 m!732657))

(declare-fun m!732659 () Bool)

(assert (=> b!791957 m!732659))

(declare-fun m!732661 () Bool)

(assert (=> start!68080 m!732661))

(declare-fun m!732663 () Bool)

(assert (=> start!68080 m!732663))

(declare-fun m!732665 () Bool)

(assert (=> b!791960 m!732665))

(declare-fun m!732667 () Bool)

(assert (=> b!791959 m!732667))

(assert (=> b!791959 m!732667))

(declare-fun m!732669 () Bool)

(assert (=> b!791959 m!732669))

(push 1)

(assert (not b!791957))

(assert (not start!68080))

(assert (not b!791959))

(assert (not b!791960))

(assert (not b!791958))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

