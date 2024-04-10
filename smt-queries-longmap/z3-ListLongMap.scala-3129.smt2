; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44072 () Bool)

(assert start!44072)

(declare-fun b!485752 () Bool)

(declare-fun e!285980 () Bool)

(assert (=> b!485752 (= e!285980 false)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!31440 0))(
  ( (array!31441 (arr!15118 (Array (_ BitVec 32) (_ BitVec 64))) (size!15482 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31440)

(declare-datatypes ((SeekEntryResult!3585 0))(
  ( (MissingZero!3585 (index!16519 (_ BitVec 32))) (Found!3585 (index!16520 (_ BitVec 32))) (Intermediate!3585 (undefined!4397 Bool) (index!16521 (_ BitVec 32)) (x!45661 (_ BitVec 32))) (Undefined!3585) (MissingVacant!3585 (index!16522 (_ BitVec 32))) )
))
(declare-fun lt!219562 () SeekEntryResult!3585)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31440 (_ BitVec 32)) SeekEntryResult!3585)

(assert (=> b!485752 (= lt!219562 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!289356 () Bool)

(assert (=> start!44072 (=> (not res!289356) (not e!285980))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44072 (= res!289356 (validMask!0 mask!3524))))

(assert (=> start!44072 e!285980))

(assert (=> start!44072 true))

(declare-fun array_inv!10914 (array!31440) Bool)

(assert (=> start!44072 (array_inv!10914 a!3235)))

(declare-fun b!485753 () Bool)

(declare-fun res!289354 () Bool)

(assert (=> b!485753 (=> (not res!289354) (not e!285980))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!485753 (= res!289354 (validKeyInArray!0 (select (arr!15118 a!3235) j!176)))))

(declare-fun b!485754 () Bool)

(declare-fun res!289358 () Bool)

(assert (=> b!485754 (=> (not res!289358) (not e!285980))))

(declare-fun arrayContainsKey!0 (array!31440 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!485754 (= res!289358 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!485755 () Bool)

(declare-fun res!289357 () Bool)

(assert (=> b!485755 (=> (not res!289357) (not e!285980))))

(assert (=> b!485755 (= res!289357 (validKeyInArray!0 k0!2280))))

(declare-fun b!485756 () Bool)

(declare-fun res!289355 () Bool)

(assert (=> b!485756 (=> (not res!289355) (not e!285980))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!485756 (= res!289355 (and (= (size!15482 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15482 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15482 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!44072 res!289356) b!485756))

(assert (= (and b!485756 res!289355) b!485753))

(assert (= (and b!485753 res!289354) b!485755))

(assert (= (and b!485755 res!289357) b!485754))

(assert (= (and b!485754 res!289358) b!485752))

(declare-fun m!465827 () Bool)

(assert (=> start!44072 m!465827))

(declare-fun m!465829 () Bool)

(assert (=> start!44072 m!465829))

(declare-fun m!465831 () Bool)

(assert (=> b!485755 m!465831))

(declare-fun m!465833 () Bool)

(assert (=> b!485752 m!465833))

(declare-fun m!465835 () Bool)

(assert (=> b!485754 m!465835))

(declare-fun m!465837 () Bool)

(assert (=> b!485753 m!465837))

(assert (=> b!485753 m!465837))

(declare-fun m!465839 () Bool)

(assert (=> b!485753 m!465839))

(check-sat (not b!485755) (not start!44072) (not b!485753) (not b!485754) (not b!485752))
