; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68038 () Bool)

(assert start!68038)

(declare-fun b!791633 () Bool)

(declare-fun res!536371 () Bool)

(declare-fun e!439927 () Bool)

(assert (=> b!791633 (=> (not res!536371) (not e!439927))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!791633 (= res!536371 (validKeyInArray!0 k!2044))))

(declare-fun b!791634 () Bool)

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!791634 (= e!439927 (bvslt mask!3266 #b00000000000000000000000000000000))))

(declare-fun b!791635 () Bool)

(declare-fun res!536370 () Bool)

(assert (=> b!791635 (=> (not res!536370) (not e!439927))))

(declare-datatypes ((array!42941 0))(
  ( (array!42942 (arr!20555 (Array (_ BitVec 32) (_ BitVec 64))) (size!20976 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!42941)

(declare-fun arrayContainsKey!0 (array!42941 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!791635 (= res!536370 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!791636 () Bool)

(declare-fun res!536368 () Bool)

(assert (=> b!791636 (=> (not res!536368) (not e!439927))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!791636 (= res!536368 (and (= (size!20976 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!20976 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!20976 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!791637 () Bool)

(declare-fun res!536369 () Bool)

(assert (=> b!791637 (=> (not res!536369) (not e!439927))))

(assert (=> b!791637 (= res!536369 (validKeyInArray!0 (select (arr!20555 a!3170) j!153)))))

(declare-fun res!536372 () Bool)

(assert (=> start!68038 (=> (not res!536372) (not e!439927))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68038 (= res!536372 (validMask!0 mask!3266))))

(assert (=> start!68038 e!439927))

(assert (=> start!68038 true))

(declare-fun array_inv!16351 (array!42941) Bool)

(assert (=> start!68038 (array_inv!16351 a!3170)))

(assert (= (and start!68038 res!536372) b!791636))

(assert (= (and b!791636 res!536368) b!791637))

(assert (= (and b!791637 res!536369) b!791633))

(assert (= (and b!791633 res!536371) b!791635))

(assert (= (and b!791635 res!536370) b!791634))

(declare-fun m!732365 () Bool)

(assert (=> b!791633 m!732365))

(declare-fun m!732367 () Bool)

(assert (=> b!791635 m!732367))

(declare-fun m!732369 () Bool)

(assert (=> b!791637 m!732369))

(assert (=> b!791637 m!732369))

(declare-fun m!732371 () Bool)

(assert (=> b!791637 m!732371))

(declare-fun m!732373 () Bool)

(assert (=> start!68038 m!732373))

(declare-fun m!732375 () Bool)

(assert (=> start!68038 m!732375))

(push 1)

(assert (not b!791633))

(assert (not start!68038))

(assert (not b!791635))

(assert (not b!791637))

(check-sat)

(pop 1)

(push 1)

(check-sat)

