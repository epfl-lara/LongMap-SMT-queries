; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68188 () Bool)

(assert start!68188)

(declare-fun res!536877 () Bool)

(declare-fun e!440434 () Bool)

(assert (=> start!68188 (=> (not res!536877) (not e!440434))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68188 (= res!536877 (validMask!0 mask!3266))))

(assert (=> start!68188 e!440434))

(assert (=> start!68188 true))

(declare-datatypes ((array!42969 0))(
  ( (array!42970 (arr!20565 (Array (_ BitVec 32) (_ BitVec 64))) (size!20985 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!42969)

(declare-fun array_inv!16424 (array!42969) Bool)

(assert (=> start!68188 (array_inv!16424 a!3170)))

(declare-fun b!792512 () Bool)

(assert (=> b!792512 (= e!440434 false)))

(declare-fun k!2044 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!8112 0))(
  ( (MissingZero!8112 (index!34816 (_ BitVec 32))) (Found!8112 (index!34817 (_ BitVec 32))) (Intermediate!8112 (undefined!8924 Bool) (index!34818 (_ BitVec 32)) (x!65929 (_ BitVec 32))) (Undefined!8112) (MissingVacant!8112 (index!34819 (_ BitVec 32))) )
))
(declare-fun lt!353593 () SeekEntryResult!8112)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42969 (_ BitVec 32)) SeekEntryResult!8112)

(assert (=> b!792512 (= lt!353593 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!792513 () Bool)

(declare-fun res!536875 () Bool)

(assert (=> b!792513 (=> (not res!536875) (not e!440434))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!792513 (= res!536875 (validKeyInArray!0 k!2044))))

(declare-fun b!792514 () Bool)

(declare-fun res!536874 () Bool)

(assert (=> b!792514 (=> (not res!536874) (not e!440434))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!792514 (= res!536874 (and (= (size!20985 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!20985 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!20985 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!792515 () Bool)

(declare-fun res!536876 () Bool)

(assert (=> b!792515 (=> (not res!536876) (not e!440434))))

(declare-fun arrayContainsKey!0 (array!42969 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!792515 (= res!536876 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!792516 () Bool)

(declare-fun res!536873 () Bool)

(assert (=> b!792516 (=> (not res!536873) (not e!440434))))

(assert (=> b!792516 (= res!536873 (validKeyInArray!0 (select (arr!20565 a!3170) j!153)))))

(assert (= (and start!68188 res!536877) b!792514))

(assert (= (and b!792514 res!536874) b!792516))

(assert (= (and b!792516 res!536873) b!792513))

(assert (= (and b!792513 res!536875) b!792515))

(assert (= (and b!792515 res!536876) b!792512))

(declare-fun m!733635 () Bool)

(assert (=> b!792513 m!733635))

(declare-fun m!733637 () Bool)

(assert (=> b!792516 m!733637))

(assert (=> b!792516 m!733637))

(declare-fun m!733639 () Bool)

(assert (=> b!792516 m!733639))

(declare-fun m!733641 () Bool)

(assert (=> b!792512 m!733641))

(declare-fun m!733643 () Bool)

(assert (=> start!68188 m!733643))

(declare-fun m!733645 () Bool)

(assert (=> start!68188 m!733645))

(declare-fun m!733647 () Bool)

(assert (=> b!792515 m!733647))

(push 1)

(assert (not b!792516))

(assert (not b!792512))

(assert (not b!792515))

(assert (not start!68188))

(assert (not b!792513))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

