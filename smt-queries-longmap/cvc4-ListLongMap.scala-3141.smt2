; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44272 () Bool)

(assert start!44272)

(declare-fun b!486851 () Bool)

(declare-fun res!290238 () Bool)

(declare-fun e!286550 () Bool)

(assert (=> b!486851 (=> (not res!290238) (not e!286550))))

(declare-datatypes ((array!31523 0))(
  ( (array!31524 (arr!15155 (Array (_ BitVec 32) (_ BitVec 64))) (size!15519 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31523)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31523 (_ BitVec 32)) Bool)

(assert (=> b!486851 (= res!290238 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!486852 () Bool)

(assert (=> b!486852 (= e!286550 false)))

(declare-fun lt!219874 () Bool)

(declare-datatypes ((List!9313 0))(
  ( (Nil!9310) (Cons!9309 (h!10165 (_ BitVec 64)) (t!15541 List!9313)) )
))
(declare-fun arrayNoDuplicates!0 (array!31523 (_ BitVec 32) List!9313) Bool)

(assert (=> b!486852 (= lt!219874 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9310))))

(declare-fun b!486853 () Bool)

(declare-fun res!290242 () Bool)

(declare-fun e!286549 () Bool)

(assert (=> b!486853 (=> (not res!290242) (not e!286549))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!486853 (= res!290242 (validKeyInArray!0 k!2280))))

(declare-fun b!486854 () Bool)

(assert (=> b!486854 (= e!286549 e!286550)))

(declare-fun res!290243 () Bool)

(assert (=> b!486854 (=> (not res!290243) (not e!286550))))

(declare-datatypes ((SeekEntryResult!3622 0))(
  ( (MissingZero!3622 (index!16667 (_ BitVec 32))) (Found!3622 (index!16668 (_ BitVec 32))) (Intermediate!3622 (undefined!4434 Bool) (index!16669 (_ BitVec 32)) (x!45794 (_ BitVec 32))) (Undefined!3622) (MissingVacant!3622 (index!16670 (_ BitVec 32))) )
))
(declare-fun lt!219873 () SeekEntryResult!3622)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!486854 (= res!290243 (or (= lt!219873 (MissingZero!3622 i!1204)) (= lt!219873 (MissingVacant!3622 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31523 (_ BitVec 32)) SeekEntryResult!3622)

(assert (=> b!486854 (= lt!219873 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!486855 () Bool)

(declare-fun res!290239 () Bool)

(assert (=> b!486855 (=> (not res!290239) (not e!286549))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!486855 (= res!290239 (and (= (size!15519 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15519 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15519 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!486856 () Bool)

(declare-fun res!290241 () Bool)

(assert (=> b!486856 (=> (not res!290241) (not e!286549))))

(assert (=> b!486856 (= res!290241 (validKeyInArray!0 (select (arr!15155 a!3235) j!176)))))

(declare-fun b!486857 () Bool)

(declare-fun res!290240 () Bool)

(assert (=> b!486857 (=> (not res!290240) (not e!286549))))

(declare-fun arrayContainsKey!0 (array!31523 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!486857 (= res!290240 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun res!290237 () Bool)

(assert (=> start!44272 (=> (not res!290237) (not e!286549))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44272 (= res!290237 (validMask!0 mask!3524))))

(assert (=> start!44272 e!286549))

(assert (=> start!44272 true))

(declare-fun array_inv!10951 (array!31523) Bool)

(assert (=> start!44272 (array_inv!10951 a!3235)))

(assert (= (and start!44272 res!290237) b!486855))

(assert (= (and b!486855 res!290239) b!486856))

(assert (= (and b!486856 res!290241) b!486853))

(assert (= (and b!486853 res!290242) b!486857))

(assert (= (and b!486857 res!290240) b!486854))

(assert (= (and b!486854 res!290243) b!486851))

(assert (= (and b!486851 res!290238) b!486852))

(declare-fun m!466731 () Bool)

(assert (=> b!486854 m!466731))

(declare-fun m!466733 () Bool)

(assert (=> b!486857 m!466733))

(declare-fun m!466735 () Bool)

(assert (=> b!486852 m!466735))

(declare-fun m!466737 () Bool)

(assert (=> b!486851 m!466737))

(declare-fun m!466739 () Bool)

(assert (=> b!486856 m!466739))

(assert (=> b!486856 m!466739))

(declare-fun m!466741 () Bool)

(assert (=> b!486856 m!466741))

(declare-fun m!466743 () Bool)

(assert (=> b!486853 m!466743))

(declare-fun m!466745 () Bool)

(assert (=> start!44272 m!466745))

(declare-fun m!466747 () Bool)

(assert (=> start!44272 m!466747))

(push 1)

(assert (not start!44272))

(assert (not b!486852))

(assert (not b!486854))

(assert (not b!486851))

(assert (not b!486853))

