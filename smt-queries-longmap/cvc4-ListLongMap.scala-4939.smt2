; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68014 () Bool)

(assert start!68014)

(declare-fun b!791554 () Bool)

(declare-fun res!536288 () Bool)

(declare-fun e!439891 () Bool)

(assert (=> b!791554 (=> (not res!536288) (not e!439891))))

(declare-datatypes ((array!42928 0))(
  ( (array!42929 (arr!20549 (Array (_ BitVec 32) (_ BitVec 64))) (size!20970 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!42928)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!791554 (= res!536288 (validKeyInArray!0 (select (arr!20549 a!3170) j!153)))))

(declare-fun b!791555 () Bool)

(declare-fun res!536290 () Bool)

(assert (=> b!791555 (=> (not res!536290) (not e!439891))))

(declare-fun k!2044 () (_ BitVec 64))

(assert (=> b!791555 (= res!536290 (validKeyInArray!0 k!2044))))

(declare-fun res!536291 () Bool)

(assert (=> start!68014 (=> (not res!536291) (not e!439891))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68014 (= res!536291 (validMask!0 mask!3266))))

(assert (=> start!68014 e!439891))

(assert (=> start!68014 true))

(declare-fun array_inv!16345 (array!42928) Bool)

(assert (=> start!68014 (array_inv!16345 a!3170)))

(declare-fun b!791553 () Bool)

(declare-fun res!536289 () Bool)

(assert (=> b!791553 (=> (not res!536289) (not e!439891))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!791553 (= res!536289 (and (= (size!20970 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!20970 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!20970 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!791556 () Bool)

(assert (=> b!791556 (= e!439891 (bvsge #b00000000000000000000000000000000 (size!20970 a!3170)))))

(assert (= (and start!68014 res!536291) b!791553))

(assert (= (and b!791553 res!536289) b!791554))

(assert (= (and b!791554 res!536288) b!791555))

(assert (= (and b!791555 res!536290) b!791556))

(declare-fun m!732301 () Bool)

(assert (=> b!791554 m!732301))

(assert (=> b!791554 m!732301))

(declare-fun m!732303 () Bool)

(assert (=> b!791554 m!732303))

(declare-fun m!732305 () Bool)

(assert (=> b!791555 m!732305))

(declare-fun m!732307 () Bool)

(assert (=> start!68014 m!732307))

(declare-fun m!732309 () Bool)

(assert (=> start!68014 m!732309))

(push 1)

(assert (not start!68014))

(assert (not b!791554))

(assert (not b!791555))

(check-sat)

(pop 1)

(push 1)

(check-sat)

