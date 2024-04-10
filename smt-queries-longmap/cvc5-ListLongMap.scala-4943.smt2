; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68046 () Bool)

(assert start!68046)

(declare-fun b!791695 () Bool)

(declare-fun res!536434 () Bool)

(declare-fun e!439952 () Bool)

(assert (=> b!791695 (=> (not res!536434) (not e!439952))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!42949 0))(
  ( (array!42950 (arr!20559 (Array (_ BitVec 32) (_ BitVec 64))) (size!20980 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!42949)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8150 0))(
  ( (MissingZero!8150 (index!34968 (_ BitVec 32))) (Found!8150 (index!34969 (_ BitVec 32))) (Intermediate!8150 (undefined!8962 Bool) (index!34970 (_ BitVec 32)) (x!65932 (_ BitVec 32))) (Undefined!8150) (MissingVacant!8150 (index!34971 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42949 (_ BitVec 32)) SeekEntryResult!8150)

(assert (=> b!791695 (= res!536434 (not (= (seekEntryOrOpen!0 k!2044 a!3170 mask!3266) (MissingZero!8150 i!1163))))))

(declare-fun res!536433 () Bool)

(assert (=> start!68046 (=> (not res!536433) (not e!439952))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68046 (= res!536433 (validMask!0 mask!3266))))

(assert (=> start!68046 e!439952))

(assert (=> start!68046 true))

(declare-fun array_inv!16355 (array!42949) Bool)

(assert (=> start!68046 (array_inv!16355 a!3170)))

(declare-fun b!791696 () Bool)

(declare-fun res!536435 () Bool)

(assert (=> b!791696 (=> (not res!536435) (not e!439952))))

(declare-fun arrayContainsKey!0 (array!42949 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!791696 (= res!536435 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!791697 () Bool)

(declare-fun res!536431 () Bool)

(assert (=> b!791697 (=> (not res!536431) (not e!439952))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!791697 (= res!536431 (and (= (size!20980 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!20980 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!20980 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!791698 () Bool)

(assert (=> b!791698 (= e!439952 (bvslt mask!3266 #b00000000000000000000000000000000))))

(declare-fun b!791699 () Bool)

(declare-fun res!536430 () Bool)

(assert (=> b!791699 (=> (not res!536430) (not e!439952))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!791699 (= res!536430 (validKeyInArray!0 (select (arr!20559 a!3170) j!153)))))

(declare-fun b!791700 () Bool)

(declare-fun res!536432 () Bool)

(assert (=> b!791700 (=> (not res!536432) (not e!439952))))

(assert (=> b!791700 (= res!536432 (validKeyInArray!0 k!2044))))

(assert (= (and start!68046 res!536433) b!791697))

(assert (= (and b!791697 res!536431) b!791699))

(assert (= (and b!791699 res!536430) b!791700))

(assert (= (and b!791700 res!536432) b!791696))

(assert (= (and b!791696 res!536435) b!791695))

(assert (= (and b!791695 res!536434) b!791698))

(declare-fun m!732419 () Bool)

(assert (=> b!791699 m!732419))

(assert (=> b!791699 m!732419))

(declare-fun m!732421 () Bool)

(assert (=> b!791699 m!732421))

(declare-fun m!732423 () Bool)

(assert (=> b!791695 m!732423))

(declare-fun m!732425 () Bool)

(assert (=> start!68046 m!732425))

(declare-fun m!732427 () Bool)

(assert (=> start!68046 m!732427))

(declare-fun m!732429 () Bool)

(assert (=> b!791700 m!732429))

(declare-fun m!732431 () Bool)

(assert (=> b!791696 m!732431))

(push 1)

(assert (not start!68046))

(assert (not b!791695))

(assert (not b!791700))

(assert (not b!791696))

(assert (not b!791699))

(check-sat)

