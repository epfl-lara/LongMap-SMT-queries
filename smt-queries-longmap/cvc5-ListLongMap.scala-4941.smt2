; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68034 () Bool)

(assert start!68034)

(declare-fun b!791603 () Bool)

(declare-fun res!536339 () Bool)

(declare-fun e!439915 () Bool)

(assert (=> b!791603 (=> (not res!536339) (not e!439915))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!791603 (= res!536339 (validKeyInArray!0 k!2044))))

(declare-fun b!791604 () Bool)

(declare-fun res!536338 () Bool)

(assert (=> b!791604 (=> (not res!536338) (not e!439915))))

(declare-datatypes ((array!42937 0))(
  ( (array!42938 (arr!20553 (Array (_ BitVec 32) (_ BitVec 64))) (size!20974 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!42937)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!791604 (= res!536338 (validKeyInArray!0 (select (arr!20553 a!3170) j!153)))))

(declare-fun b!791605 () Bool)

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!791605 (= e!439915 (bvslt mask!3266 #b00000000000000000000000000000000))))

(declare-fun b!791606 () Bool)

(declare-fun res!536340 () Bool)

(assert (=> b!791606 (=> (not res!536340) (not e!439915))))

(declare-fun arrayContainsKey!0 (array!42937 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!791606 (= res!536340 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!791607 () Bool)

(declare-fun res!536342 () Bool)

(assert (=> b!791607 (=> (not res!536342) (not e!439915))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!791607 (= res!536342 (and (= (size!20974 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!20974 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!20974 a!3170)) (not (= i!1163 j!153))))))

(declare-fun res!536341 () Bool)

(assert (=> start!68034 (=> (not res!536341) (not e!439915))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68034 (= res!536341 (validMask!0 mask!3266))))

(assert (=> start!68034 e!439915))

(assert (=> start!68034 true))

(declare-fun array_inv!16349 (array!42937) Bool)

(assert (=> start!68034 (array_inv!16349 a!3170)))

(assert (= (and start!68034 res!536341) b!791607))

(assert (= (and b!791607 res!536342) b!791604))

(assert (= (and b!791604 res!536338) b!791603))

(assert (= (and b!791603 res!536339) b!791606))

(assert (= (and b!791606 res!536340) b!791605))

(declare-fun m!732341 () Bool)

(assert (=> b!791603 m!732341))

(declare-fun m!732343 () Bool)

(assert (=> b!791604 m!732343))

(assert (=> b!791604 m!732343))

(declare-fun m!732345 () Bool)

(assert (=> b!791604 m!732345))

(declare-fun m!732347 () Bool)

(assert (=> b!791606 m!732347))

(declare-fun m!732349 () Bool)

(assert (=> start!68034 m!732349))

(declare-fun m!732351 () Bool)

(assert (=> start!68034 m!732351))

(push 1)

(assert (not b!791606))

(assert (not b!791603))

(assert (not start!68034))

(assert (not b!791604))

(check-sat)

(pop 1)

(push 1)

(check-sat)

