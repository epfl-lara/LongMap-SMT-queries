; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68052 () Bool)

(assert start!68052)

(declare-fun b!791747 () Bool)

(declare-fun res!536483 () Bool)

(declare-fun e!439969 () Bool)

(assert (=> b!791747 (=> (not res!536483) (not e!439969))))

(declare-datatypes ((array!42955 0))(
  ( (array!42956 (arr!20562 (Array (_ BitVec 32) (_ BitVec 64))) (size!20983 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!42955)

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42955 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!791747 (= res!536483 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!791748 () Bool)

(declare-fun res!536482 () Bool)

(assert (=> b!791748 (=> (not res!536482) (not e!439969))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!791748 (= res!536482 (and (= (size!20983 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!20983 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!20983 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!791749 () Bool)

(assert (=> b!791749 (= e!439969 false)))

(declare-datatypes ((SeekEntryResult!8153 0))(
  ( (MissingZero!8153 (index!34980 (_ BitVec 32))) (Found!8153 (index!34981 (_ BitVec 32))) (Intermediate!8153 (undefined!8965 Bool) (index!34982 (_ BitVec 32)) (x!65943 (_ BitVec 32))) (Undefined!8153) (MissingVacant!8153 (index!34983 (_ BitVec 32))) )
))
(declare-fun lt!353297 () SeekEntryResult!8153)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42955 (_ BitVec 32)) SeekEntryResult!8153)

(assert (=> b!791749 (= lt!353297 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun res!536485 () Bool)

(assert (=> start!68052 (=> (not res!536485) (not e!439969))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68052 (= res!536485 (validMask!0 mask!3266))))

(assert (=> start!68052 e!439969))

(assert (=> start!68052 true))

(declare-fun array_inv!16358 (array!42955) Bool)

(assert (=> start!68052 (array_inv!16358 a!3170)))

(declare-fun b!791750 () Bool)

(declare-fun res!536486 () Bool)

(assert (=> b!791750 (=> (not res!536486) (not e!439969))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!791750 (= res!536486 (validKeyInArray!0 k!2044))))

(declare-fun b!791751 () Bool)

(declare-fun res!536484 () Bool)

(assert (=> b!791751 (=> (not res!536484) (not e!439969))))

(assert (=> b!791751 (= res!536484 (validKeyInArray!0 (select (arr!20562 a!3170) j!153)))))

(assert (= (and start!68052 res!536485) b!791748))

(assert (= (and b!791748 res!536482) b!791751))

(assert (= (and b!791751 res!536484) b!791750))

(assert (= (and b!791750 res!536486) b!791747))

(assert (= (and b!791747 res!536483) b!791749))

(declare-fun m!732461 () Bool)

(assert (=> start!68052 m!732461))

(declare-fun m!732463 () Bool)

(assert (=> start!68052 m!732463))

(declare-fun m!732465 () Bool)

(assert (=> b!791751 m!732465))

(assert (=> b!791751 m!732465))

(declare-fun m!732467 () Bool)

(assert (=> b!791751 m!732467))

(declare-fun m!732469 () Bool)

(assert (=> b!791749 m!732469))

(declare-fun m!732471 () Bool)

(assert (=> b!791750 m!732471))

(declare-fun m!732473 () Bool)

(assert (=> b!791747 m!732473))

(push 1)

(assert (not b!791751))

(assert (not b!791750))

(assert (not b!791749))

(assert (not b!791747))

(assert (not start!68052))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

