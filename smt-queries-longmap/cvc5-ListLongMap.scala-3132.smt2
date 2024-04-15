; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44080 () Bool)

(assert start!44080)

(declare-fun b!485631 () Bool)

(declare-fun res!289378 () Bool)

(declare-fun e!285866 () Bool)

(assert (=> b!485631 (=> (not res!289378) (not e!285866))))

(declare-datatypes ((array!31458 0))(
  ( (array!31459 (arr!15127 (Array (_ BitVec 32) (_ BitVec 64))) (size!15492 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31458)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31458 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!485631 (= res!289378 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!485632 () Bool)

(declare-fun res!289379 () Bool)

(assert (=> b!485632 (=> (not res!289379) (not e!285866))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!485632 (= res!289379 (and (= (size!15492 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15492 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15492 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!485633 () Bool)

(declare-fun res!289377 () Bool)

(assert (=> b!485633 (=> (not res!289377) (not e!285866))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!485633 (= res!289377 (validKeyInArray!0 (select (arr!15127 a!3235) j!176)))))

(declare-fun res!289376 () Bool)

(assert (=> start!44080 (=> (not res!289376) (not e!285866))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44080 (= res!289376 (validMask!0 mask!3524))))

(assert (=> start!44080 e!285866))

(assert (=> start!44080 true))

(declare-fun array_inv!11010 (array!31458) Bool)

(assert (=> start!44080 (array_inv!11010 a!3235)))

(declare-fun b!485634 () Bool)

(assert (=> b!485634 (= e!285866 false)))

(declare-datatypes ((SeekEntryResult!3591 0))(
  ( (MissingZero!3591 (index!16543 (_ BitVec 32))) (Found!3591 (index!16544 (_ BitVec 32))) (Intermediate!3591 (undefined!4403 Bool) (index!16545 (_ BitVec 32)) (x!45686 (_ BitVec 32))) (Undefined!3591) (MissingVacant!3591 (index!16546 (_ BitVec 32))) )
))
(declare-fun lt!219358 () SeekEntryResult!3591)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31458 (_ BitVec 32)) SeekEntryResult!3591)

(assert (=> b!485634 (= lt!219358 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!485635 () Bool)

(declare-fun res!289375 () Bool)

(assert (=> b!485635 (=> (not res!289375) (not e!285866))))

(assert (=> b!485635 (= res!289375 (validKeyInArray!0 k!2280))))

(assert (= (and start!44080 res!289376) b!485632))

(assert (= (and b!485632 res!289379) b!485633))

(assert (= (and b!485633 res!289377) b!485635))

(assert (= (and b!485635 res!289375) b!485631))

(assert (= (and b!485631 res!289378) b!485634))

(declare-fun m!465235 () Bool)

(assert (=> start!44080 m!465235))

(declare-fun m!465237 () Bool)

(assert (=> start!44080 m!465237))

(declare-fun m!465239 () Bool)

(assert (=> b!485635 m!465239))

(declare-fun m!465241 () Bool)

(assert (=> b!485631 m!465241))

(declare-fun m!465243 () Bool)

(assert (=> b!485633 m!465243))

(assert (=> b!485633 m!465243))

(declare-fun m!465245 () Bool)

(assert (=> b!485633 m!465245))

(declare-fun m!465247 () Bool)

(assert (=> b!485634 m!465247))

(push 1)

(assert (not start!44080))

(assert (not b!485633))

(assert (not b!485631))

(assert (not b!485634))

(assert (not b!485635))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

