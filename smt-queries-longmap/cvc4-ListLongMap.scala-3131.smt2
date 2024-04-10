; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44086 () Bool)

(assert start!44086)

(declare-fun b!485857 () Bool)

(declare-fun res!289463 () Bool)

(declare-fun e!286023 () Bool)

(assert (=> b!485857 (=> (not res!289463) (not e!286023))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!485857 (= res!289463 (validKeyInArray!0 k!2280))))

(declare-fun res!289459 () Bool)

(assert (=> start!44086 (=> (not res!289459) (not e!286023))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44086 (= res!289459 (validMask!0 mask!3524))))

(assert (=> start!44086 e!286023))

(assert (=> start!44086 true))

(declare-datatypes ((array!31454 0))(
  ( (array!31455 (arr!15125 (Array (_ BitVec 32) (_ BitVec 64))) (size!15489 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31454)

(declare-fun array_inv!10921 (array!31454) Bool)

(assert (=> start!44086 (array_inv!10921 a!3235)))

(declare-fun b!485858 () Bool)

(declare-fun res!289462 () Bool)

(assert (=> b!485858 (=> (not res!289462) (not e!286023))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!485858 (= res!289462 (validKeyInArray!0 (select (arr!15125 a!3235) j!176)))))

(declare-fun b!485859 () Bool)

(declare-fun res!289461 () Bool)

(assert (=> b!485859 (=> (not res!289461) (not e!286023))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!485859 (= res!289461 (and (= (size!15489 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15489 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15489 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!485860 () Bool)

(assert (=> b!485860 (= e!286023 false)))

(declare-datatypes ((SeekEntryResult!3592 0))(
  ( (MissingZero!3592 (index!16547 (_ BitVec 32))) (Found!3592 (index!16548 (_ BitVec 32))) (Intermediate!3592 (undefined!4404 Bool) (index!16549 (_ BitVec 32)) (x!45684 (_ BitVec 32))) (Undefined!3592) (MissingVacant!3592 (index!16550 (_ BitVec 32))) )
))
(declare-fun lt!219583 () SeekEntryResult!3592)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31454 (_ BitVec 32)) SeekEntryResult!3592)

(assert (=> b!485860 (= lt!219583 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!485861 () Bool)

(declare-fun res!289460 () Bool)

(assert (=> b!485861 (=> (not res!289460) (not e!286023))))

(declare-fun arrayContainsKey!0 (array!31454 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!485861 (= res!289460 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!44086 res!289459) b!485859))

(assert (= (and b!485859 res!289461) b!485858))

(assert (= (and b!485858 res!289462) b!485857))

(assert (= (and b!485857 res!289463) b!485861))

(assert (= (and b!485861 res!289460) b!485860))

(declare-fun m!465925 () Bool)

(assert (=> start!44086 m!465925))

(declare-fun m!465927 () Bool)

(assert (=> start!44086 m!465927))

(declare-fun m!465929 () Bool)

(assert (=> b!485857 m!465929))

(declare-fun m!465931 () Bool)

(assert (=> b!485860 m!465931))

(declare-fun m!465933 () Bool)

(assert (=> b!485861 m!465933))

(declare-fun m!465935 () Bool)

(assert (=> b!485858 m!465935))

(assert (=> b!485858 m!465935))

(declare-fun m!465937 () Bool)

(assert (=> b!485858 m!465937))

(push 1)

(assert (not b!485861))

(assert (not b!485860))

(assert (not b!485858))

(assert (not start!44086))

(assert (not b!485857))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

