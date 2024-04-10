; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68044 () Bool)

(assert start!68044)

(declare-fun b!791678 () Bool)

(declare-fun res!536417 () Bool)

(declare-fun e!439945 () Bool)

(assert (=> b!791678 (=> (not res!536417) (not e!439945))))

(declare-datatypes ((array!42947 0))(
  ( (array!42948 (arr!20558 (Array (_ BitVec 32) (_ BitVec 64))) (size!20979 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!42947)

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42947 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!791678 (= res!536417 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!791679 () Bool)

(declare-fun res!536415 () Bool)

(assert (=> b!791679 (=> (not res!536415) (not e!439945))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!791679 (= res!536415 (and (= (size!20979 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!20979 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!20979 a!3170)) (not (= i!1163 j!153))))))

(declare-fun res!536413 () Bool)

(assert (=> start!68044 (=> (not res!536413) (not e!439945))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68044 (= res!536413 (validMask!0 mask!3266))))

(assert (=> start!68044 e!439945))

(assert (=> start!68044 true))

(declare-fun array_inv!16354 (array!42947) Bool)

(assert (=> start!68044 (array_inv!16354 a!3170)))

(declare-fun b!791680 () Bool)

(assert (=> b!791680 (= e!439945 false)))

(declare-datatypes ((SeekEntryResult!8149 0))(
  ( (MissingZero!8149 (index!34964 (_ BitVec 32))) (Found!8149 (index!34965 (_ BitVec 32))) (Intermediate!8149 (undefined!8961 Bool) (index!34966 (_ BitVec 32)) (x!65923 (_ BitVec 32))) (Undefined!8149) (MissingVacant!8149 (index!34967 (_ BitVec 32))) )
))
(declare-fun lt!353294 () SeekEntryResult!8149)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42947 (_ BitVec 32)) SeekEntryResult!8149)

(assert (=> b!791680 (= lt!353294 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!791681 () Bool)

(declare-fun res!536414 () Bool)

(assert (=> b!791681 (=> (not res!536414) (not e!439945))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!791681 (= res!536414 (validKeyInArray!0 (select (arr!20558 a!3170) j!153)))))

(declare-fun b!791682 () Bool)

(declare-fun res!536416 () Bool)

(assert (=> b!791682 (=> (not res!536416) (not e!439945))))

(assert (=> b!791682 (= res!536416 (validKeyInArray!0 k!2044))))

(assert (= (and start!68044 res!536413) b!791679))

(assert (= (and b!791679 res!536415) b!791681))

(assert (= (and b!791681 res!536414) b!791682))

(assert (= (and b!791682 res!536416) b!791678))

(assert (= (and b!791678 res!536417) b!791680))

(declare-fun m!732405 () Bool)

(assert (=> b!791678 m!732405))

(declare-fun m!732407 () Bool)

(assert (=> b!791681 m!732407))

(assert (=> b!791681 m!732407))

(declare-fun m!732409 () Bool)

(assert (=> b!791681 m!732409))

(declare-fun m!732411 () Bool)

(assert (=> b!791682 m!732411))

(declare-fun m!732413 () Bool)

(assert (=> b!791680 m!732413))

(declare-fun m!732415 () Bool)

(assert (=> start!68044 m!732415))

(declare-fun m!732417 () Bool)

(assert (=> start!68044 m!732417))

(push 1)

(assert (not b!791681))

(assert (not b!791678))

(assert (not b!791682))

(assert (not start!68044))

(assert (not b!791680))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

