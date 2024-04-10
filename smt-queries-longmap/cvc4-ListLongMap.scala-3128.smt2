; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44068 () Bool)

(assert start!44068)

(declare-fun res!289324 () Bool)

(declare-fun e!285969 () Bool)

(assert (=> start!44068 (=> (not res!289324) (not e!285969))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44068 (= res!289324 (validMask!0 mask!3524))))

(assert (=> start!44068 e!285969))

(assert (=> start!44068 true))

(declare-datatypes ((array!31436 0))(
  ( (array!31437 (arr!15116 (Array (_ BitVec 32) (_ BitVec 64))) (size!15480 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31436)

(declare-fun array_inv!10912 (array!31436) Bool)

(assert (=> start!44068 (array_inv!10912 a!3235)))

(declare-fun b!485721 () Bool)

(declare-fun res!289328 () Bool)

(assert (=> b!485721 (=> (not res!289328) (not e!285969))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31436 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!485721 (= res!289328 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!485722 () Bool)

(declare-fun res!289327 () Bool)

(assert (=> b!485722 (=> (not res!289327) (not e!285969))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!485722 (= res!289327 (validKeyInArray!0 (select (arr!15116 a!3235) j!176)))))

(declare-fun b!485723 () Bool)

(declare-fun res!289325 () Bool)

(assert (=> b!485723 (=> (not res!289325) (not e!285969))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!485723 (= res!289325 (and (= (size!15480 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15480 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15480 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!485724 () Bool)

(assert (=> b!485724 (= e!285969 (bvslt mask!3524 #b00000000000000000000000000000000))))

(declare-fun b!485725 () Bool)

(declare-fun res!289323 () Bool)

(assert (=> b!485725 (=> (not res!289323) (not e!285969))))

(declare-datatypes ((SeekEntryResult!3583 0))(
  ( (MissingZero!3583 (index!16511 (_ BitVec 32))) (Found!3583 (index!16512 (_ BitVec 32))) (Intermediate!3583 (undefined!4395 Bool) (index!16513 (_ BitVec 32)) (x!45651 (_ BitVec 32))) (Undefined!3583) (MissingVacant!3583 (index!16514 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31436 (_ BitVec 32)) SeekEntryResult!3583)

(assert (=> b!485725 (= res!289323 (not (= (seekEntryOrOpen!0 k!2280 a!3235 mask!3524) (MissingZero!3583 i!1204))))))

(declare-fun b!485726 () Bool)

(declare-fun res!289326 () Bool)

(assert (=> b!485726 (=> (not res!289326) (not e!285969))))

(assert (=> b!485726 (= res!289326 (validKeyInArray!0 k!2280))))

(assert (= (and start!44068 res!289324) b!485723))

(assert (= (and b!485723 res!289325) b!485722))

(assert (= (and b!485722 res!289327) b!485726))

(assert (= (and b!485726 res!289326) b!485721))

(assert (= (and b!485721 res!289328) b!485725))

(assert (= (and b!485725 res!289323) b!485724))

(declare-fun m!465799 () Bool)

(assert (=> b!485726 m!465799))

(declare-fun m!465801 () Bool)

(assert (=> b!485722 m!465801))

(assert (=> b!485722 m!465801))

(declare-fun m!465803 () Bool)

(assert (=> b!485722 m!465803))

(declare-fun m!465805 () Bool)

(assert (=> b!485721 m!465805))

(declare-fun m!465807 () Bool)

(assert (=> start!44068 m!465807))

(declare-fun m!465809 () Bool)

(assert (=> start!44068 m!465809))

(declare-fun m!465811 () Bool)

(assert (=> b!485725 m!465811))

(push 1)

(assert (not start!44068))

(assert (not b!485721))

(assert (not b!485725))

(assert (not b!485722))

(assert (not b!485726))

(check-sat)

(pop 1)

(push 1)

(check-sat)

