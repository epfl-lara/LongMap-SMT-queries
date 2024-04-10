; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68056 () Bool)

(assert start!68056)

(declare-fun b!791777 () Bool)

(declare-fun res!536514 () Bool)

(declare-fun e!439981 () Bool)

(assert (=> b!791777 (=> (not res!536514) (not e!439981))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-datatypes ((array!42959 0))(
  ( (array!42960 (arr!20564 (Array (_ BitVec 32) (_ BitVec 64))) (size!20985 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!42959)

(assert (=> b!791777 (= res!536514 (and (= (size!20985 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!20985 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!20985 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!791778 () Bool)

(assert (=> b!791778 (= e!439981 false)))

(declare-fun k!2044 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!8155 0))(
  ( (MissingZero!8155 (index!34988 (_ BitVec 32))) (Found!8155 (index!34989 (_ BitVec 32))) (Intermediate!8155 (undefined!8967 Bool) (index!34990 (_ BitVec 32)) (x!65945 (_ BitVec 32))) (Undefined!8155) (MissingVacant!8155 (index!34991 (_ BitVec 32))) )
))
(declare-fun lt!353303 () SeekEntryResult!8155)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42959 (_ BitVec 32)) SeekEntryResult!8155)

(assert (=> b!791778 (= lt!353303 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!791779 () Bool)

(declare-fun res!536513 () Bool)

(assert (=> b!791779 (=> (not res!536513) (not e!439981))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!791779 (= res!536513 (validKeyInArray!0 (select (arr!20564 a!3170) j!153)))))

(declare-fun b!791780 () Bool)

(declare-fun res!536512 () Bool)

(assert (=> b!791780 (=> (not res!536512) (not e!439981))))

(assert (=> b!791780 (= res!536512 (validKeyInArray!0 k!2044))))

(declare-fun res!536516 () Bool)

(assert (=> start!68056 (=> (not res!536516) (not e!439981))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68056 (= res!536516 (validMask!0 mask!3266))))

(assert (=> start!68056 e!439981))

(assert (=> start!68056 true))

(declare-fun array_inv!16360 (array!42959) Bool)

(assert (=> start!68056 (array_inv!16360 a!3170)))

(declare-fun b!791781 () Bool)

(declare-fun res!536515 () Bool)

(assert (=> b!791781 (=> (not res!536515) (not e!439981))))

(declare-fun arrayContainsKey!0 (array!42959 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!791781 (= res!536515 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(assert (= (and start!68056 res!536516) b!791777))

(assert (= (and b!791777 res!536514) b!791779))

(assert (= (and b!791779 res!536513) b!791780))

(assert (= (and b!791780 res!536512) b!791781))

(assert (= (and b!791781 res!536515) b!791778))

(declare-fun m!732489 () Bool)

(assert (=> b!791778 m!732489))

(declare-fun m!732491 () Bool)

(assert (=> start!68056 m!732491))

(declare-fun m!732493 () Bool)

(assert (=> start!68056 m!732493))

(declare-fun m!732495 () Bool)

(assert (=> b!791781 m!732495))

(declare-fun m!732497 () Bool)

(assert (=> b!791780 m!732497))

(declare-fun m!732499 () Bool)

(assert (=> b!791779 m!732499))

(assert (=> b!791779 m!732499))

(declare-fun m!732501 () Bool)

(assert (=> b!791779 m!732501))

(push 1)

(assert (not b!791780))

(assert (not b!791779))

(assert (not b!791778))

(assert (not start!68056))

(assert (not b!791781))

(check-sat)

(pop 1)

