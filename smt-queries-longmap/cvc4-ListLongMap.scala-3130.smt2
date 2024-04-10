; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44080 () Bool)

(assert start!44080)

(declare-fun b!485812 () Bool)

(declare-fun res!289418 () Bool)

(declare-fun e!286005 () Bool)

(assert (=> b!485812 (=> (not res!289418) (not e!286005))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!31448 0))(
  ( (array!31449 (arr!15122 (Array (_ BitVec 32) (_ BitVec 64))) (size!15486 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31448)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!485812 (= res!289418 (and (= (size!15486 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15486 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15486 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!485813 () Bool)

(declare-fun res!289417 () Bool)

(assert (=> b!485813 (=> (not res!289417) (not e!286005))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!485813 (= res!289417 (validKeyInArray!0 (select (arr!15122 a!3235) j!176)))))

(declare-fun b!485814 () Bool)

(assert (=> b!485814 (= e!286005 false)))

(declare-fun k!2280 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3589 0))(
  ( (MissingZero!3589 (index!16535 (_ BitVec 32))) (Found!3589 (index!16536 (_ BitVec 32))) (Intermediate!3589 (undefined!4401 Bool) (index!16537 (_ BitVec 32)) (x!45673 (_ BitVec 32))) (Undefined!3589) (MissingVacant!3589 (index!16538 (_ BitVec 32))) )
))
(declare-fun lt!219574 () SeekEntryResult!3589)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31448 (_ BitVec 32)) SeekEntryResult!3589)

(assert (=> b!485814 (= lt!219574 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun res!289415 () Bool)

(assert (=> start!44080 (=> (not res!289415) (not e!286005))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44080 (= res!289415 (validMask!0 mask!3524))))

(assert (=> start!44080 e!286005))

(assert (=> start!44080 true))

(declare-fun array_inv!10918 (array!31448) Bool)

(assert (=> start!44080 (array_inv!10918 a!3235)))

(declare-fun b!485815 () Bool)

(declare-fun res!289414 () Bool)

(assert (=> b!485815 (=> (not res!289414) (not e!286005))))

(declare-fun arrayContainsKey!0 (array!31448 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!485815 (= res!289414 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!485816 () Bool)

(declare-fun res!289416 () Bool)

(assert (=> b!485816 (=> (not res!289416) (not e!286005))))

(assert (=> b!485816 (= res!289416 (validKeyInArray!0 k!2280))))

(assert (= (and start!44080 res!289415) b!485812))

(assert (= (and b!485812 res!289418) b!485813))

(assert (= (and b!485813 res!289417) b!485816))

(assert (= (and b!485816 res!289416) b!485815))

(assert (= (and b!485815 res!289414) b!485814))

(declare-fun m!465883 () Bool)

(assert (=> b!485813 m!465883))

(assert (=> b!485813 m!465883))

(declare-fun m!465885 () Bool)

(assert (=> b!485813 m!465885))

(declare-fun m!465887 () Bool)

(assert (=> start!44080 m!465887))

(declare-fun m!465889 () Bool)

(assert (=> start!44080 m!465889))

(declare-fun m!465891 () Bool)

(assert (=> b!485815 m!465891))

(declare-fun m!465893 () Bool)

(assert (=> b!485814 m!465893))

(declare-fun m!465895 () Bool)

(assert (=> b!485816 m!465895))

(push 1)

(assert (not b!485815))

(assert (not b!485816))

(assert (not b!485814))

(assert (not start!44080))

(assert (not b!485813))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

