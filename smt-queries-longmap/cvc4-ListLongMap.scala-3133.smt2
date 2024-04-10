; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44098 () Bool)

(assert start!44098)

(declare-fun b!485947 () Bool)

(declare-fun res!289553 () Bool)

(declare-fun e!286059 () Bool)

(assert (=> b!485947 (=> (not res!289553) (not e!286059))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!485947 (= res!289553 (validKeyInArray!0 k!2280))))

(declare-fun b!485948 () Bool)

(declare-fun res!289549 () Bool)

(assert (=> b!485948 (=> (not res!289549) (not e!286059))))

(declare-datatypes ((array!31466 0))(
  ( (array!31467 (arr!15131 (Array (_ BitVec 32) (_ BitVec 64))) (size!15495 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31466)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!485948 (= res!289549 (validKeyInArray!0 (select (arr!15131 a!3235) j!176)))))

(declare-fun b!485949 () Bool)

(assert (=> b!485949 (= e!286059 false)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3598 0))(
  ( (MissingZero!3598 (index!16571 (_ BitVec 32))) (Found!3598 (index!16572 (_ BitVec 32))) (Intermediate!3598 (undefined!4410 Bool) (index!16573 (_ BitVec 32)) (x!45706 (_ BitVec 32))) (Undefined!3598) (MissingVacant!3598 (index!16574 (_ BitVec 32))) )
))
(declare-fun lt!219601 () SeekEntryResult!3598)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31466 (_ BitVec 32)) SeekEntryResult!3598)

(assert (=> b!485949 (= lt!219601 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!485950 () Bool)

(declare-fun res!289552 () Bool)

(assert (=> b!485950 (=> (not res!289552) (not e!286059))))

(declare-fun arrayContainsKey!0 (array!31466 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!485950 (= res!289552 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!485951 () Bool)

(declare-fun res!289551 () Bool)

(assert (=> b!485951 (=> (not res!289551) (not e!286059))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!485951 (= res!289551 (and (= (size!15495 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15495 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15495 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!289550 () Bool)

(assert (=> start!44098 (=> (not res!289550) (not e!286059))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44098 (= res!289550 (validMask!0 mask!3524))))

(assert (=> start!44098 e!286059))

(assert (=> start!44098 true))

(declare-fun array_inv!10927 (array!31466) Bool)

(assert (=> start!44098 (array_inv!10927 a!3235)))

(assert (= (and start!44098 res!289550) b!485951))

(assert (= (and b!485951 res!289551) b!485948))

(assert (= (and b!485948 res!289549) b!485947))

(assert (= (and b!485947 res!289553) b!485950))

(assert (= (and b!485950 res!289552) b!485949))

(declare-fun m!466009 () Bool)

(assert (=> b!485950 m!466009))

(declare-fun m!466011 () Bool)

(assert (=> b!485948 m!466011))

(assert (=> b!485948 m!466011))

(declare-fun m!466013 () Bool)

(assert (=> b!485948 m!466013))

(declare-fun m!466015 () Bool)

(assert (=> b!485949 m!466015))

(declare-fun m!466017 () Bool)

(assert (=> b!485947 m!466017))

(declare-fun m!466019 () Bool)

(assert (=> start!44098 m!466019))

(declare-fun m!466021 () Bool)

(assert (=> start!44098 m!466021))

(push 1)

(assert (not b!485947))

(assert (not start!44098))

(assert (not b!485950))

(assert (not b!485948))

(assert (not b!485949))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

