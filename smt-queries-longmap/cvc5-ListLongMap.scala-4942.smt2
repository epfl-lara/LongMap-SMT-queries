; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68040 () Bool)

(assert start!68040)

(declare-fun res!536384 () Bool)

(declare-fun e!439933 () Bool)

(assert (=> start!68040 (=> (not res!536384) (not e!439933))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68040 (= res!536384 (validMask!0 mask!3266))))

(assert (=> start!68040 e!439933))

(assert (=> start!68040 true))

(declare-datatypes ((array!42943 0))(
  ( (array!42944 (arr!20556 (Array (_ BitVec 32) (_ BitVec 64))) (size!20977 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!42943)

(declare-fun array_inv!16352 (array!42943) Bool)

(assert (=> start!68040 (array_inv!16352 a!3170)))

(declare-fun b!791648 () Bool)

(declare-fun res!536387 () Bool)

(assert (=> b!791648 (=> (not res!536387) (not e!439933))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!791648 (= res!536387 (validKeyInArray!0 k!2044))))

(declare-fun b!791649 () Bool)

(declare-fun res!536383 () Bool)

(assert (=> b!791649 (=> (not res!536383) (not e!439933))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!791649 (= res!536383 (validKeyInArray!0 (select (arr!20556 a!3170) j!153)))))

(declare-fun b!791650 () Bool)

(declare-fun res!536386 () Bool)

(assert (=> b!791650 (=> (not res!536386) (not e!439933))))

(declare-fun arrayContainsKey!0 (array!42943 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!791650 (= res!536386 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!791651 () Bool)

(assert (=> b!791651 (= e!439933 false)))

(declare-datatypes ((SeekEntryResult!8147 0))(
  ( (MissingZero!8147 (index!34956 (_ BitVec 32))) (Found!8147 (index!34957 (_ BitVec 32))) (Intermediate!8147 (undefined!8959 Bool) (index!34958 (_ BitVec 32)) (x!65921 (_ BitVec 32))) (Undefined!8147) (MissingVacant!8147 (index!34959 (_ BitVec 32))) )
))
(declare-fun lt!353288 () SeekEntryResult!8147)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42943 (_ BitVec 32)) SeekEntryResult!8147)

(assert (=> b!791651 (= lt!353288 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!791652 () Bool)

(declare-fun res!536385 () Bool)

(assert (=> b!791652 (=> (not res!536385) (not e!439933))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!791652 (= res!536385 (and (= (size!20977 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!20977 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!20977 a!3170)) (not (= i!1163 j!153))))))

(assert (= (and start!68040 res!536384) b!791652))

(assert (= (and b!791652 res!536385) b!791649))

(assert (= (and b!791649 res!536383) b!791648))

(assert (= (and b!791648 res!536387) b!791650))

(assert (= (and b!791650 res!536386) b!791651))

(declare-fun m!732377 () Bool)

(assert (=> b!791649 m!732377))

(assert (=> b!791649 m!732377))

(declare-fun m!732379 () Bool)

(assert (=> b!791649 m!732379))

(declare-fun m!732381 () Bool)

(assert (=> b!791651 m!732381))

(declare-fun m!732383 () Bool)

(assert (=> b!791650 m!732383))

(declare-fun m!732385 () Bool)

(assert (=> b!791648 m!732385))

(declare-fun m!732387 () Bool)

(assert (=> start!68040 m!732387))

(declare-fun m!732389 () Bool)

(assert (=> start!68040 m!732389))

(push 1)

(assert (not b!791651))

(assert (not b!791649))

(assert (not b!791648))

(assert (not start!68040))

(assert (not b!791650))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

