; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44070 () Bool)

(assert start!44070)

(declare-fun b!485751 () Bool)

(declare-fun res!289411 () Bool)

(declare-fun e!285965 () Bool)

(assert (=> b!485751 (=> (not res!289411) (not e!285965))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!485751 (= res!289411 (validKeyInArray!0 k!2280))))

(declare-fun b!485752 () Bool)

(declare-fun res!289410 () Bool)

(assert (=> b!485752 (=> (not res!289410) (not e!285965))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!31439 0))(
  ( (array!31440 (arr!15117 (Array (_ BitVec 32) (_ BitVec 64))) (size!15481 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31439)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!485752 (= res!289410 (and (= (size!15481 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15481 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15481 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!485753 () Bool)

(declare-fun res!289407 () Bool)

(assert (=> b!485753 (=> (not res!289407) (not e!285965))))

(declare-fun arrayContainsKey!0 (array!31439 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!485753 (= res!289407 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!485754 () Bool)

(declare-fun res!289408 () Bool)

(assert (=> b!485754 (=> (not res!289408) (not e!285965))))

(assert (=> b!485754 (= res!289408 (validKeyInArray!0 (select (arr!15117 a!3235) j!176)))))

(declare-fun b!485755 () Bool)

(assert (=> b!485755 (= e!285965 false)))

(declare-datatypes ((SeekEntryResult!3540 0))(
  ( (MissingZero!3540 (index!16339 (_ BitVec 32))) (Found!3540 (index!16340 (_ BitVec 32))) (Intermediate!3540 (undefined!4352 Bool) (index!16341 (_ BitVec 32)) (x!45621 (_ BitVec 32))) (Undefined!3540) (MissingVacant!3540 (index!16342 (_ BitVec 32))) )
))
(declare-fun lt!219586 () SeekEntryResult!3540)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31439 (_ BitVec 32)) SeekEntryResult!3540)

(assert (=> b!485755 (= lt!219586 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun res!289409 () Bool)

(assert (=> start!44070 (=> (not res!289409) (not e!285965))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44070 (= res!289409 (validMask!0 mask!3524))))

(assert (=> start!44070 e!285965))

(assert (=> start!44070 true))

(declare-fun array_inv!10976 (array!31439) Bool)

(assert (=> start!44070 (array_inv!10976 a!3235)))

(assert (= (and start!44070 res!289409) b!485752))

(assert (= (and b!485752 res!289410) b!485754))

(assert (= (and b!485754 res!289408) b!485751))

(assert (= (and b!485751 res!289411) b!485753))

(assert (= (and b!485753 res!289407) b!485755))

(declare-fun m!466067 () Bool)

(assert (=> start!44070 m!466067))

(declare-fun m!466069 () Bool)

(assert (=> start!44070 m!466069))

(declare-fun m!466071 () Bool)

(assert (=> b!485753 m!466071))

(declare-fun m!466073 () Bool)

(assert (=> b!485755 m!466073))

(declare-fun m!466075 () Bool)

(assert (=> b!485751 m!466075))

(declare-fun m!466077 () Bool)

(assert (=> b!485754 m!466077))

(assert (=> b!485754 m!466077))

(declare-fun m!466079 () Bool)

(assert (=> b!485754 m!466079))

(push 1)

(assert (not b!485753))

(assert (not b!485751))

(assert (not b!485755))

(assert (not b!485754))

(assert (not start!44070))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

