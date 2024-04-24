; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44054 () Bool)

(assert start!44054)

(declare-fun b!485624 () Bool)

(declare-fun res!289281 () Bool)

(declare-fun e!285918 () Bool)

(assert (=> b!485624 (=> (not res!289281) (not e!285918))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!485624 (= res!289281 (validKeyInArray!0 k0!2280))))

(declare-fun b!485625 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(assert (=> b!485625 (= e!285918 (bvslt mask!3524 #b00000000000000000000000000000000))))

(declare-fun res!289284 () Bool)

(assert (=> start!44054 (=> (not res!289284) (not e!285918))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44054 (= res!289284 (validMask!0 mask!3524))))

(assert (=> start!44054 e!285918))

(assert (=> start!44054 true))

(declare-datatypes ((array!31423 0))(
  ( (array!31424 (arr!15109 (Array (_ BitVec 32) (_ BitVec 64))) (size!15473 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31423)

(declare-fun array_inv!10968 (array!31423) Bool)

(assert (=> start!44054 (array_inv!10968 a!3235)))

(declare-fun b!485626 () Bool)

(declare-fun res!289283 () Bool)

(assert (=> b!485626 (=> (not res!289283) (not e!285918))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!485626 (= res!289283 (and (= (size!15473 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15473 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15473 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!485627 () Bool)

(declare-fun res!289280 () Bool)

(assert (=> b!485627 (=> (not res!289280) (not e!285918))))

(declare-fun arrayContainsKey!0 (array!31423 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!485627 (= res!289280 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!485628 () Bool)

(declare-fun res!289282 () Bool)

(assert (=> b!485628 (=> (not res!289282) (not e!285918))))

(declare-datatypes ((SeekEntryResult!3532 0))(
  ( (MissingZero!3532 (index!16307 (_ BitVec 32))) (Found!3532 (index!16308 (_ BitVec 32))) (Intermediate!3532 (undefined!4344 Bool) (index!16309 (_ BitVec 32)) (x!45597 (_ BitVec 32))) (Undefined!3532) (MissingVacant!3532 (index!16310 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31423 (_ BitVec 32)) SeekEntryResult!3532)

(assert (=> b!485628 (= res!289282 (not (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) (MissingZero!3532 i!1204))))))

(declare-fun b!485629 () Bool)

(declare-fun res!289285 () Bool)

(assert (=> b!485629 (=> (not res!289285) (not e!285918))))

(assert (=> b!485629 (= res!289285 (validKeyInArray!0 (select (arr!15109 a!3235) j!176)))))

(assert (= (and start!44054 res!289284) b!485626))

(assert (= (and b!485626 res!289283) b!485629))

(assert (= (and b!485629 res!289285) b!485624))

(assert (= (and b!485624 res!289281) b!485627))

(assert (= (and b!485627 res!289280) b!485628))

(assert (= (and b!485628 res!289282) b!485625))

(declare-fun m!465955 () Bool)

(assert (=> start!44054 m!465955))

(declare-fun m!465957 () Bool)

(assert (=> start!44054 m!465957))

(declare-fun m!465959 () Bool)

(assert (=> b!485624 m!465959))

(declare-fun m!465961 () Bool)

(assert (=> b!485628 m!465961))

(declare-fun m!465963 () Bool)

(assert (=> b!485629 m!465963))

(assert (=> b!485629 m!465963))

(declare-fun m!465965 () Bool)

(assert (=> b!485629 m!465965))

(declare-fun m!465967 () Bool)

(assert (=> b!485627 m!465967))

(check-sat (not b!485629) (not b!485628) (not start!44054) (not b!485624) (not b!485627))
(check-sat)
