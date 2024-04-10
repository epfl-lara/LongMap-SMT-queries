; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68058 () Bool)

(assert start!68058)

(declare-fun b!791792 () Bool)

(declare-fun res!536527 () Bool)

(declare-fun e!439988 () Bool)

(assert (=> b!791792 (=> (not res!536527) (not e!439988))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!42961 0))(
  ( (array!42962 (arr!20565 (Array (_ BitVec 32) (_ BitVec 64))) (size!20986 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!42961)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!791792 (= res!536527 (and (= (size!20986 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!20986 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!20986 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!791793 () Bool)

(declare-fun res!536529 () Bool)

(assert (=> b!791793 (=> (not res!536529) (not e!439988))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42961 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!791793 (= res!536529 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!791794 () Bool)

(declare-fun res!536531 () Bool)

(assert (=> b!791794 (=> (not res!536531) (not e!439988))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!791794 (= res!536531 (validKeyInArray!0 k!2044))))

(declare-fun b!791795 () Bool)

(declare-fun res!536530 () Bool)

(assert (=> b!791795 (=> (not res!536530) (not e!439988))))

(assert (=> b!791795 (= res!536530 (validKeyInArray!0 (select (arr!20565 a!3170) j!153)))))

(declare-fun res!536528 () Bool)

(assert (=> start!68058 (=> (not res!536528) (not e!439988))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68058 (= res!536528 (validMask!0 mask!3266))))

(assert (=> start!68058 e!439988))

(assert (=> start!68058 true))

(declare-fun array_inv!16361 (array!42961) Bool)

(assert (=> start!68058 (array_inv!16361 a!3170)))

(declare-fun b!791796 () Bool)

(assert (=> b!791796 (= e!439988 false)))

(declare-datatypes ((SeekEntryResult!8156 0))(
  ( (MissingZero!8156 (index!34992 (_ BitVec 32))) (Found!8156 (index!34993 (_ BitVec 32))) (Intermediate!8156 (undefined!8968 Bool) (index!34994 (_ BitVec 32)) (x!65954 (_ BitVec 32))) (Undefined!8156) (MissingVacant!8156 (index!34995 (_ BitVec 32))) )
))
(declare-fun lt!353306 () SeekEntryResult!8156)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42961 (_ BitVec 32)) SeekEntryResult!8156)

(assert (=> b!791796 (= lt!353306 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(assert (= (and start!68058 res!536528) b!791792))

(assert (= (and b!791792 res!536527) b!791795))

(assert (= (and b!791795 res!536530) b!791794))

(assert (= (and b!791794 res!536531) b!791793))

(assert (= (and b!791793 res!536529) b!791796))

(declare-fun m!732503 () Bool)

(assert (=> b!791793 m!732503))

(declare-fun m!732505 () Bool)

(assert (=> b!791795 m!732505))

(assert (=> b!791795 m!732505))

(declare-fun m!732507 () Bool)

(assert (=> b!791795 m!732507))

(declare-fun m!732509 () Bool)

(assert (=> start!68058 m!732509))

(declare-fun m!732511 () Bool)

(assert (=> start!68058 m!732511))

(declare-fun m!732513 () Bool)

(assert (=> b!791794 m!732513))

(declare-fun m!732515 () Bool)

(assert (=> b!791796 m!732515))

(push 1)

(assert (not b!791795))

(assert (not b!791796))

(assert (not start!68058))

(assert (not b!791793))

(assert (not b!791794))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

