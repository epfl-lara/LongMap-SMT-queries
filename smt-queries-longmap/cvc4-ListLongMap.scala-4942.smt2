; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68020 () Bool)

(assert start!68020)

(declare-fun b!791413 () Bool)

(declare-fun e!439786 () Bool)

(assert (=> b!791413 (= e!439786 false)))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8144 0))(
  ( (MissingZero!8144 (index!34944 (_ BitVec 32))) (Found!8144 (index!34945 (_ BitVec 32))) (Intermediate!8144 (undefined!8956 Bool) (index!34946 (_ BitVec 32)) (x!65913 (_ BitVec 32))) (Undefined!8144) (MissingVacant!8144 (index!34947 (_ BitVec 32))) )
))
(declare-fun lt!353051 () SeekEntryResult!8144)

(declare-datatypes ((array!42942 0))(
  ( (array!42943 (arr!20556 (Array (_ BitVec 32) (_ BitVec 64))) (size!20977 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!42942)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42942 (_ BitVec 32)) SeekEntryResult!8144)

(assert (=> b!791413 (= lt!353051 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!791414 () Bool)

(declare-fun res!536290 () Bool)

(assert (=> b!791414 (=> (not res!536290) (not e!439786))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!791414 (= res!536290 (and (= (size!20977 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!20977 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!20977 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!791415 () Bool)

(declare-fun res!536292 () Bool)

(assert (=> b!791415 (=> (not res!536292) (not e!439786))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!791415 (= res!536292 (validKeyInArray!0 (select (arr!20556 a!3170) j!153)))))

(declare-fun b!791417 () Bool)

(declare-fun res!536288 () Bool)

(assert (=> b!791417 (=> (not res!536288) (not e!439786))))

(declare-fun arrayContainsKey!0 (array!42942 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!791417 (= res!536288 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!791416 () Bool)

(declare-fun res!536289 () Bool)

(assert (=> b!791416 (=> (not res!536289) (not e!439786))))

(assert (=> b!791416 (= res!536289 (validKeyInArray!0 k!2044))))

(declare-fun res!536291 () Bool)

(assert (=> start!68020 (=> (not res!536291) (not e!439786))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68020 (= res!536291 (validMask!0 mask!3266))))

(assert (=> start!68020 e!439786))

(assert (=> start!68020 true))

(declare-fun array_inv!16439 (array!42942) Bool)

(assert (=> start!68020 (array_inv!16439 a!3170)))

(assert (= (and start!68020 res!536291) b!791414))

(assert (= (and b!791414 res!536290) b!791415))

(assert (= (and b!791415 res!536292) b!791416))

(assert (= (and b!791416 res!536289) b!791417))

(assert (= (and b!791417 res!536288) b!791413))

(declare-fun m!731633 () Bool)

(assert (=> b!791416 m!731633))

(declare-fun m!731635 () Bool)

(assert (=> b!791417 m!731635))

(declare-fun m!731637 () Bool)

(assert (=> b!791413 m!731637))

(declare-fun m!731639 () Bool)

(assert (=> start!68020 m!731639))

(declare-fun m!731641 () Bool)

(assert (=> start!68020 m!731641))

(declare-fun m!731643 () Bool)

(assert (=> b!791415 m!731643))

(assert (=> b!791415 m!731643))

(declare-fun m!731645 () Bool)

(assert (=> b!791415 m!731645))

(push 1)

(assert (not b!791415))

(assert (not b!791413))

(assert (not start!68020))

(assert (not b!791417))

(assert (not b!791416))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

