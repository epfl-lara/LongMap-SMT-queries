; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68182 () Bool)

(assert start!68182)

(declare-fun b!792468 () Bool)

(declare-fun res!536832 () Bool)

(declare-fun e!440415 () Bool)

(assert (=> b!792468 (=> (not res!536832) (not e!440415))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!792468 (= res!536832 (validKeyInArray!0 k!2044))))

(declare-fun b!792469 () Bool)

(declare-fun res!536828 () Bool)

(assert (=> b!792469 (=> (not res!536828) (not e!440415))))

(declare-datatypes ((array!42963 0))(
  ( (array!42964 (arr!20562 (Array (_ BitVec 32) (_ BitVec 64))) (size!20982 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!42963)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!792469 (= res!536828 (validKeyInArray!0 (select (arr!20562 a!3170) j!153)))))

(declare-fun b!792470 () Bool)

(declare-fun res!536830 () Bool)

(assert (=> b!792470 (=> (not res!536830) (not e!440415))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!792470 (= res!536830 (and (= (size!20982 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!20982 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!20982 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!792471 () Bool)

(declare-fun res!536831 () Bool)

(assert (=> b!792471 (=> (not res!536831) (not e!440415))))

(declare-fun arrayContainsKey!0 (array!42963 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!792471 (= res!536831 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun res!536829 () Bool)

(assert (=> start!68182 (=> (not res!536829) (not e!440415))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68182 (= res!536829 (validMask!0 mask!3266))))

(assert (=> start!68182 e!440415))

(assert (=> start!68182 true))

(declare-fun array_inv!16421 (array!42963) Bool)

(assert (=> start!68182 (array_inv!16421 a!3170)))

(declare-fun b!792467 () Bool)

(assert (=> b!792467 (= e!440415 false)))

(declare-datatypes ((SeekEntryResult!8109 0))(
  ( (MissingZero!8109 (index!34804 (_ BitVec 32))) (Found!8109 (index!34805 (_ BitVec 32))) (Intermediate!8109 (undefined!8921 Bool) (index!34806 (_ BitVec 32)) (x!65918 (_ BitVec 32))) (Undefined!8109) (MissingVacant!8109 (index!34807 (_ BitVec 32))) )
))
(declare-fun lt!353584 () SeekEntryResult!8109)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42963 (_ BitVec 32)) SeekEntryResult!8109)

(assert (=> b!792467 (= lt!353584 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(assert (= (and start!68182 res!536829) b!792470))

(assert (= (and b!792470 res!536830) b!792469))

(assert (= (and b!792469 res!536828) b!792468))

(assert (= (and b!792468 res!536832) b!792471))

(assert (= (and b!792471 res!536831) b!792467))

(declare-fun m!733593 () Bool)

(assert (=> b!792471 m!733593))

(declare-fun m!733595 () Bool)

(assert (=> start!68182 m!733595))

(declare-fun m!733597 () Bool)

(assert (=> start!68182 m!733597))

(declare-fun m!733599 () Bool)

(assert (=> b!792467 m!733599))

(declare-fun m!733601 () Bool)

(assert (=> b!792469 m!733601))

(assert (=> b!792469 m!733601))

(declare-fun m!733603 () Bool)

(assert (=> b!792469 m!733603))

(declare-fun m!733605 () Bool)

(assert (=> b!792468 m!733605))

(push 1)

(assert (not b!792469))

(assert (not b!792467))

(assert (not b!792471))

(assert (not start!68182))

(assert (not b!792468))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

