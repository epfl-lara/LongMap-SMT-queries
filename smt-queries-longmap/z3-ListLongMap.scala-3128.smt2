; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44052 () Bool)

(assert start!44052)

(declare-fun b!485414 () Bool)

(declare-fun res!289160 () Bool)

(declare-fun e!285782 () Bool)

(assert (=> b!485414 (=> (not res!289160) (not e!285782))))

(declare-datatypes ((array!31430 0))(
  ( (array!31431 (arr!15113 (Array (_ BitVec 32) (_ BitVec 64))) (size!15478 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31430)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31430 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!485414 (= res!289160 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!485415 () Bool)

(declare-fun res!289159 () Bool)

(assert (=> b!485415 (=> (not res!289159) (not e!285782))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!485415 (= res!289159 (validKeyInArray!0 k0!2280))))

(declare-fun res!289161 () Bool)

(assert (=> start!44052 (=> (not res!289161) (not e!285782))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44052 (= res!289161 (validMask!0 mask!3524))))

(assert (=> start!44052 e!285782))

(assert (=> start!44052 true))

(declare-fun array_inv!10996 (array!31430) Bool)

(assert (=> start!44052 (array_inv!10996 a!3235)))

(declare-fun b!485416 () Bool)

(assert (=> b!485416 (= e!285782 (bvslt mask!3524 #b00000000000000000000000000000000))))

(declare-fun b!485417 () Bool)

(declare-fun res!289163 () Bool)

(assert (=> b!485417 (=> (not res!289163) (not e!285782))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!485417 (= res!289163 (and (= (size!15478 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15478 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15478 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!485418 () Bool)

(declare-fun res!289162 () Bool)

(assert (=> b!485418 (=> (not res!289162) (not e!285782))))

(assert (=> b!485418 (= res!289162 (validKeyInArray!0 (select (arr!15113 a!3235) j!176)))))

(declare-fun b!485419 () Bool)

(declare-fun res!289158 () Bool)

(assert (=> b!485419 (=> (not res!289158) (not e!285782))))

(declare-datatypes ((SeekEntryResult!3577 0))(
  ( (MissingZero!3577 (index!16487 (_ BitVec 32))) (Found!3577 (index!16488 (_ BitVec 32))) (Intermediate!3577 (undefined!4389 Bool) (index!16489 (_ BitVec 32)) (x!45640 (_ BitVec 32))) (Undefined!3577) (MissingVacant!3577 (index!16490 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31430 (_ BitVec 32)) SeekEntryResult!3577)

(assert (=> b!485419 (= res!289158 (not (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) (MissingZero!3577 i!1204))))))

(assert (= (and start!44052 res!289161) b!485417))

(assert (= (and b!485417 res!289163) b!485418))

(assert (= (and b!485418 res!289162) b!485415))

(assert (= (and b!485415 res!289159) b!485414))

(assert (= (and b!485414 res!289160) b!485419))

(assert (= (and b!485419 res!289158) b!485416))

(declare-fun m!465039 () Bool)

(assert (=> b!485414 m!465039))

(declare-fun m!465041 () Bool)

(assert (=> b!485418 m!465041))

(assert (=> b!485418 m!465041))

(declare-fun m!465043 () Bool)

(assert (=> b!485418 m!465043))

(declare-fun m!465045 () Bool)

(assert (=> b!485415 m!465045))

(declare-fun m!465047 () Bool)

(assert (=> b!485419 m!465047))

(declare-fun m!465049 () Bool)

(assert (=> start!44052 m!465049))

(declare-fun m!465051 () Bool)

(assert (=> start!44052 m!465051))

(check-sat (not start!44052) (not b!485414) (not b!485419) (not b!485415) (not b!485418))
(check-sat)
