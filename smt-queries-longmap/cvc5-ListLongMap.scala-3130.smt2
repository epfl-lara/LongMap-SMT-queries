; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44068 () Bool)

(assert start!44068)

(declare-fun b!485541 () Bool)

(declare-fun res!289289 () Bool)

(declare-fun e!285831 () Bool)

(assert (=> b!485541 (=> (not res!289289) (not e!285831))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!485541 (= res!289289 (validKeyInArray!0 k!2280))))

(declare-fun b!485542 () Bool)

(assert (=> b!485542 (= e!285831 false)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!31446 0))(
  ( (array!31447 (arr!15121 (Array (_ BitVec 32) (_ BitVec 64))) (size!15486 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31446)

(declare-datatypes ((SeekEntryResult!3585 0))(
  ( (MissingZero!3585 (index!16519 (_ BitVec 32))) (Found!3585 (index!16520 (_ BitVec 32))) (Intermediate!3585 (undefined!4397 Bool) (index!16521 (_ BitVec 32)) (x!45664 (_ BitVec 32))) (Undefined!3585) (MissingVacant!3585 (index!16522 (_ BitVec 32))) )
))
(declare-fun lt!219340 () SeekEntryResult!3585)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31446 (_ BitVec 32)) SeekEntryResult!3585)

(assert (=> b!485542 (= lt!219340 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!485543 () Bool)

(declare-fun res!289288 () Bool)

(assert (=> b!485543 (=> (not res!289288) (not e!285831))))

(declare-fun arrayContainsKey!0 (array!31446 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!485543 (= res!289288 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun res!289287 () Bool)

(assert (=> start!44068 (=> (not res!289287) (not e!285831))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44068 (= res!289287 (validMask!0 mask!3524))))

(assert (=> start!44068 e!285831))

(assert (=> start!44068 true))

(declare-fun array_inv!11004 (array!31446) Bool)

(assert (=> start!44068 (array_inv!11004 a!3235)))

(declare-fun b!485544 () Bool)

(declare-fun res!289285 () Bool)

(assert (=> b!485544 (=> (not res!289285) (not e!285831))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!485544 (= res!289285 (validKeyInArray!0 (select (arr!15121 a!3235) j!176)))))

(declare-fun b!485545 () Bool)

(declare-fun res!289286 () Bool)

(assert (=> b!485545 (=> (not res!289286) (not e!285831))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!485545 (= res!289286 (and (= (size!15486 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15486 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15486 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!44068 res!289287) b!485545))

(assert (= (and b!485545 res!289286) b!485544))

(assert (= (and b!485544 res!289285) b!485541))

(assert (= (and b!485541 res!289289) b!485543))

(assert (= (and b!485543 res!289288) b!485542))

(declare-fun m!465151 () Bool)

(assert (=> b!485542 m!465151))

(declare-fun m!465153 () Bool)

(assert (=> start!44068 m!465153))

(declare-fun m!465155 () Bool)

(assert (=> start!44068 m!465155))

(declare-fun m!465157 () Bool)

(assert (=> b!485541 m!465157))

(declare-fun m!465159 () Bool)

(assert (=> b!485543 m!465159))

(declare-fun m!465161 () Bool)

(assert (=> b!485544 m!465161))

(assert (=> b!485544 m!465161))

(declare-fun m!465163 () Bool)

(assert (=> b!485544 m!465163))

(push 1)

(assert (not b!485543))

(assert (not b!485541))

(assert (not start!44068))

(assert (not b!485542))

(assert (not b!485544))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

