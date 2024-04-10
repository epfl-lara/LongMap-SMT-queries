; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44076 () Bool)

(assert start!44076)

(declare-fun b!485782 () Bool)

(declare-fun res!289384 () Bool)

(declare-fun e!285992 () Bool)

(assert (=> b!485782 (=> (not res!289384) (not e!285992))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!31444 0))(
  ( (array!31445 (arr!15120 (Array (_ BitVec 32) (_ BitVec 64))) (size!15484 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31444)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!485782 (= res!289384 (and (= (size!15484 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15484 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15484 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!485783 () Bool)

(declare-fun res!289387 () Bool)

(assert (=> b!485783 (=> (not res!289387) (not e!285992))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!485783 (= res!289387 (validKeyInArray!0 (select (arr!15120 a!3235) j!176)))))

(declare-fun b!485784 () Bool)

(declare-fun res!289386 () Bool)

(assert (=> b!485784 (=> (not res!289386) (not e!285992))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!485784 (= res!289386 (validKeyInArray!0 k!2280))))

(declare-fun b!485786 () Bool)

(declare-fun res!289385 () Bool)

(assert (=> b!485786 (=> (not res!289385) (not e!285992))))

(declare-fun arrayContainsKey!0 (array!31444 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!485786 (= res!289385 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!485785 () Bool)

(assert (=> b!485785 (= e!285992 false)))

(declare-datatypes ((SeekEntryResult!3587 0))(
  ( (MissingZero!3587 (index!16527 (_ BitVec 32))) (Found!3587 (index!16528 (_ BitVec 32))) (Intermediate!3587 (undefined!4399 Bool) (index!16529 (_ BitVec 32)) (x!45671 (_ BitVec 32))) (Undefined!3587) (MissingVacant!3587 (index!16530 (_ BitVec 32))) )
))
(declare-fun lt!219568 () SeekEntryResult!3587)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31444 (_ BitVec 32)) SeekEntryResult!3587)

(assert (=> b!485785 (= lt!219568 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun res!289388 () Bool)

(assert (=> start!44076 (=> (not res!289388) (not e!285992))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44076 (= res!289388 (validMask!0 mask!3524))))

(assert (=> start!44076 e!285992))

(assert (=> start!44076 true))

(declare-fun array_inv!10916 (array!31444) Bool)

(assert (=> start!44076 (array_inv!10916 a!3235)))

(assert (= (and start!44076 res!289388) b!485782))

(assert (= (and b!485782 res!289384) b!485783))

(assert (= (and b!485783 res!289387) b!485784))

(assert (= (and b!485784 res!289386) b!485786))

(assert (= (and b!485786 res!289385) b!485785))

(declare-fun m!465855 () Bool)

(assert (=> start!44076 m!465855))

(declare-fun m!465857 () Bool)

(assert (=> start!44076 m!465857))

(declare-fun m!465859 () Bool)

(assert (=> b!485786 m!465859))

(declare-fun m!465861 () Bool)

(assert (=> b!485784 m!465861))

(declare-fun m!465863 () Bool)

(assert (=> b!485783 m!465863))

(assert (=> b!485783 m!465863))

(declare-fun m!465865 () Bool)

(assert (=> b!485783 m!465865))

(declare-fun m!465867 () Bool)

(assert (=> b!485785 m!465867))

(push 1)

(assert (not b!485783))

(assert (not b!485785))

(assert (not start!44076))

(assert (not b!485784))

(assert (not b!485786))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

