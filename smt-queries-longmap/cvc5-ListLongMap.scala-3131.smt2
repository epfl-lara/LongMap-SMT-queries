; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44076 () Bool)

(assert start!44076)

(declare-fun b!485797 () Bool)

(declare-fun res!289454 () Bool)

(declare-fun e!285984 () Bool)

(assert (=> b!485797 (=> (not res!289454) (not e!285984))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!31445 0))(
  ( (array!31446 (arr!15120 (Array (_ BitVec 32) (_ BitVec 64))) (size!15484 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31445)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!485797 (= res!289454 (and (= (size!15484 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15484 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15484 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!485798 () Bool)

(declare-fun res!289453 () Bool)

(assert (=> b!485798 (=> (not res!289453) (not e!285984))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!485798 (= res!289453 (validKeyInArray!0 (select (arr!15120 a!3235) j!176)))))

(declare-fun b!485799 () Bool)

(declare-fun res!289456 () Bool)

(assert (=> b!485799 (=> (not res!289456) (not e!285984))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!485799 (= res!289456 (validKeyInArray!0 k!2280))))

(declare-fun b!485800 () Bool)

(declare-fun res!289455 () Bool)

(assert (=> b!485800 (=> (not res!289455) (not e!285984))))

(declare-fun arrayContainsKey!0 (array!31445 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!485800 (= res!289455 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun res!289452 () Bool)

(assert (=> start!44076 (=> (not res!289452) (not e!285984))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44076 (= res!289452 (validMask!0 mask!3524))))

(assert (=> start!44076 e!285984))

(assert (=> start!44076 true))

(declare-fun array_inv!10979 (array!31445) Bool)

(assert (=> start!44076 (array_inv!10979 a!3235)))

(declare-fun b!485796 () Bool)

(assert (=> b!485796 (= e!285984 false)))

(declare-datatypes ((SeekEntryResult!3543 0))(
  ( (MissingZero!3543 (index!16351 (_ BitVec 32))) (Found!3543 (index!16352 (_ BitVec 32))) (Intermediate!3543 (undefined!4355 Bool) (index!16353 (_ BitVec 32)) (x!45632 (_ BitVec 32))) (Undefined!3543) (MissingVacant!3543 (index!16354 (_ BitVec 32))) )
))
(declare-fun lt!219595 () SeekEntryResult!3543)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31445 (_ BitVec 32)) SeekEntryResult!3543)

(assert (=> b!485796 (= lt!219595 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(assert (= (and start!44076 res!289452) b!485797))

(assert (= (and b!485797 res!289454) b!485798))

(assert (= (and b!485798 res!289453) b!485799))

(assert (= (and b!485799 res!289456) b!485800))

(assert (= (and b!485800 res!289455) b!485796))

(declare-fun m!466109 () Bool)

(assert (=> start!44076 m!466109))

(declare-fun m!466111 () Bool)

(assert (=> start!44076 m!466111))

(declare-fun m!466113 () Bool)

(assert (=> b!485796 m!466113))

(declare-fun m!466115 () Bool)

(assert (=> b!485798 m!466115))

(assert (=> b!485798 m!466115))

(declare-fun m!466117 () Bool)

(assert (=> b!485798 m!466117))

(declare-fun m!466119 () Bool)

(assert (=> b!485799 m!466119))

(declare-fun m!466121 () Bool)

(assert (=> b!485800 m!466121))

(push 1)

(assert (not start!44076))

(assert (not b!485798))

(assert (not b!485799))

(assert (not b!485800))

(assert (not b!485796))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

