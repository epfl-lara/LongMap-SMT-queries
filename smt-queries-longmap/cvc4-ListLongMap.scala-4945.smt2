; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68038 () Bool)

(assert start!68038)

(declare-fun b!791557 () Bool)

(declare-fun res!536433 () Bool)

(declare-fun e!439839 () Bool)

(assert (=> b!791557 (=> (not res!536433) (not e!439839))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!791557 (= res!536433 (validKeyInArray!0 k!2044))))

(declare-fun b!791558 () Bool)

(declare-fun res!536435 () Bool)

(assert (=> b!791558 (=> (not res!536435) (not e!439839))))

(declare-datatypes ((array!42960 0))(
  ( (array!42961 (arr!20565 (Array (_ BitVec 32) (_ BitVec 64))) (size!20986 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!42960)

(declare-fun arrayContainsKey!0 (array!42960 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!791558 (= res!536435 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun res!536432 () Bool)

(assert (=> start!68038 (=> (not res!536432) (not e!439839))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68038 (= res!536432 (validMask!0 mask!3266))))

(assert (=> start!68038 e!439839))

(assert (=> start!68038 true))

(declare-fun array_inv!16448 (array!42960) Bool)

(assert (=> start!68038 (array_inv!16448 a!3170)))

(declare-fun b!791559 () Bool)

(assert (=> b!791559 (= e!439839 false)))

(declare-datatypes ((SeekEntryResult!8153 0))(
  ( (MissingZero!8153 (index!34980 (_ BitVec 32))) (Found!8153 (index!34981 (_ BitVec 32))) (Intermediate!8153 (undefined!8965 Bool) (index!34982 (_ BitVec 32)) (x!65946 (_ BitVec 32))) (Undefined!8153) (MissingVacant!8153 (index!34983 (_ BitVec 32))) )
))
(declare-fun lt!353069 () SeekEntryResult!8153)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42960 (_ BitVec 32)) SeekEntryResult!8153)

(assert (=> b!791559 (= lt!353069 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!791560 () Bool)

(declare-fun res!536436 () Bool)

(assert (=> b!791560 (=> (not res!536436) (not e!439839))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!791560 (= res!536436 (validKeyInArray!0 (select (arr!20565 a!3170) j!153)))))

(declare-fun b!791561 () Bool)

(declare-fun res!536434 () Bool)

(assert (=> b!791561 (=> (not res!536434) (not e!439839))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!791561 (= res!536434 (and (= (size!20986 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!20986 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!20986 a!3170)) (not (= i!1163 j!153))))))

(assert (= (and start!68038 res!536432) b!791561))

(assert (= (and b!791561 res!536434) b!791560))

(assert (= (and b!791560 res!536436) b!791557))

(assert (= (and b!791557 res!536433) b!791558))

(assert (= (and b!791558 res!536435) b!791559))

(declare-fun m!731759 () Bool)

(assert (=> start!68038 m!731759))

(declare-fun m!731761 () Bool)

(assert (=> start!68038 m!731761))

(declare-fun m!731763 () Bool)

(assert (=> b!791557 m!731763))

(declare-fun m!731765 () Bool)

(assert (=> b!791558 m!731765))

(declare-fun m!731767 () Bool)

(assert (=> b!791559 m!731767))

(declare-fun m!731769 () Bool)

(assert (=> b!791560 m!731769))

(assert (=> b!791560 m!731769))

(declare-fun m!731771 () Bool)

(assert (=> b!791560 m!731771))

(push 1)

(assert (not b!791559))

(assert (not b!791560))

(assert (not b!791558))

(assert (not b!791557))

(assert (not start!68038))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

