; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44086 () Bool)

(assert start!44086)

(declare-fun b!485871 () Bool)

(declare-fun res!289527 () Bool)

(declare-fun e!286013 () Bool)

(assert (=> b!485871 (=> (not res!289527) (not e!286013))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!31455 0))(
  ( (array!31456 (arr!15125 (Array (_ BitVec 32) (_ BitVec 64))) (size!15489 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31455)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!485871 (= res!289527 (and (= (size!15489 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15489 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15489 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!485872 () Bool)

(assert (=> b!485872 (= e!286013 false)))

(declare-fun k!2280 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3548 0))(
  ( (MissingZero!3548 (index!16371 (_ BitVec 32))) (Found!3548 (index!16372 (_ BitVec 32))) (Intermediate!3548 (undefined!4360 Bool) (index!16373 (_ BitVec 32)) (x!45653 (_ BitVec 32))) (Undefined!3548) (MissingVacant!3548 (index!16374 (_ BitVec 32))) )
))
(declare-fun lt!219610 () SeekEntryResult!3548)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31455 (_ BitVec 32)) SeekEntryResult!3548)

(assert (=> b!485872 (= lt!219610 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!485873 () Bool)

(declare-fun res!289528 () Bool)

(assert (=> b!485873 (=> (not res!289528) (not e!286013))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!485873 (= res!289528 (validKeyInArray!0 (select (arr!15125 a!3235) j!176)))))

(declare-fun res!289529 () Bool)

(assert (=> start!44086 (=> (not res!289529) (not e!286013))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44086 (= res!289529 (validMask!0 mask!3524))))

(assert (=> start!44086 e!286013))

(assert (=> start!44086 true))

(declare-fun array_inv!10984 (array!31455) Bool)

(assert (=> start!44086 (array_inv!10984 a!3235)))

(declare-fun b!485874 () Bool)

(declare-fun res!289530 () Bool)

(assert (=> b!485874 (=> (not res!289530) (not e!286013))))

(assert (=> b!485874 (= res!289530 (validKeyInArray!0 k!2280))))

(declare-fun b!485875 () Bool)

(declare-fun res!289531 () Bool)

(assert (=> b!485875 (=> (not res!289531) (not e!286013))))

(declare-fun arrayContainsKey!0 (array!31455 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!485875 (= res!289531 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!44086 res!289529) b!485871))

(assert (= (and b!485871 res!289527) b!485873))

(assert (= (and b!485873 res!289528) b!485874))

(assert (= (and b!485874 res!289530) b!485875))

(assert (= (and b!485875 res!289531) b!485872))

(declare-fun m!466179 () Bool)

(assert (=> b!485872 m!466179))

(declare-fun m!466181 () Bool)

(assert (=> b!485875 m!466181))

(declare-fun m!466183 () Bool)

(assert (=> b!485874 m!466183))

(declare-fun m!466185 () Bool)

(assert (=> start!44086 m!466185))

(declare-fun m!466187 () Bool)

(assert (=> start!44086 m!466187))

(declare-fun m!466189 () Bool)

(assert (=> b!485873 m!466189))

(assert (=> b!485873 m!466189))

(declare-fun m!466191 () Bool)

(assert (=> b!485873 m!466191))

(push 1)

(assert (not b!485875))

(assert (not b!485873))

(assert (not start!44086))

(assert (not b!485872))

(assert (not b!485874))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

