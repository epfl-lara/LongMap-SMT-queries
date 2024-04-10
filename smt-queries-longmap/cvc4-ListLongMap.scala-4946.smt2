; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68068 () Bool)

(assert start!68068)

(declare-fun b!791867 () Bool)

(declare-fun res!536604 () Bool)

(declare-fun e!440018 () Bool)

(assert (=> b!791867 (=> (not res!536604) (not e!440018))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!791867 (= res!536604 (validKeyInArray!0 k!2044))))

(declare-fun b!791868 () Bool)

(declare-fun res!536603 () Bool)

(assert (=> b!791868 (=> (not res!536603) (not e!440018))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!42971 0))(
  ( (array!42972 (arr!20570 (Array (_ BitVec 32) (_ BitVec 64))) (size!20991 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!42971)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!791868 (= res!536603 (and (= (size!20991 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!20991 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!20991 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!791869 () Bool)

(assert (=> b!791869 (= e!440018 false)))

(declare-datatypes ((SeekEntryResult!8161 0))(
  ( (MissingZero!8161 (index!35012 (_ BitVec 32))) (Found!8161 (index!35013 (_ BitVec 32))) (Intermediate!8161 (undefined!8973 Bool) (index!35014 (_ BitVec 32)) (x!65967 (_ BitVec 32))) (Undefined!8161) (MissingVacant!8161 (index!35015 (_ BitVec 32))) )
))
(declare-fun lt!353321 () SeekEntryResult!8161)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42971 (_ BitVec 32)) SeekEntryResult!8161)

(assert (=> b!791869 (= lt!353321 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!791870 () Bool)

(declare-fun res!536605 () Bool)

(assert (=> b!791870 (=> (not res!536605) (not e!440018))))

(declare-fun arrayContainsKey!0 (array!42971 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!791870 (= res!536605 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!791871 () Bool)

(declare-fun res!536606 () Bool)

(assert (=> b!791871 (=> (not res!536606) (not e!440018))))

(assert (=> b!791871 (= res!536606 (validKeyInArray!0 (select (arr!20570 a!3170) j!153)))))

(declare-fun res!536602 () Bool)

(assert (=> start!68068 (=> (not res!536602) (not e!440018))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68068 (= res!536602 (validMask!0 mask!3266))))

(assert (=> start!68068 e!440018))

(assert (=> start!68068 true))

(declare-fun array_inv!16366 (array!42971) Bool)

(assert (=> start!68068 (array_inv!16366 a!3170)))

(assert (= (and start!68068 res!536602) b!791868))

(assert (= (and b!791868 res!536603) b!791871))

(assert (= (and b!791871 res!536606) b!791867))

(assert (= (and b!791867 res!536604) b!791870))

(assert (= (and b!791870 res!536605) b!791869))

(declare-fun m!732573 () Bool)

(assert (=> b!791867 m!732573))

(declare-fun m!732575 () Bool)

(assert (=> b!791871 m!732575))

(assert (=> b!791871 m!732575))

(declare-fun m!732577 () Bool)

(assert (=> b!791871 m!732577))

(declare-fun m!732579 () Bool)

(assert (=> start!68068 m!732579))

(declare-fun m!732581 () Bool)

(assert (=> start!68068 m!732581))

(declare-fun m!732583 () Bool)

(assert (=> b!791870 m!732583))

(declare-fun m!732585 () Bool)

(assert (=> b!791869 m!732585))

(push 1)

(assert (not start!68068))

(assert (not b!791869))

(assert (not b!791870))

(assert (not b!791871))

(assert (not b!791867))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

