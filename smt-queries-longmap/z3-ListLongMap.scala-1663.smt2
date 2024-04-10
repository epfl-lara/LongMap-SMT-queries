; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30814 () Bool)

(assert start!30814)

(declare-fun b!309364 () Bool)

(declare-fun e!193279 () Bool)

(assert (=> b!309364 (= e!193279 (not true))))

(declare-datatypes ((array!15767 0))(
  ( (array!15768 (arr!7467 (Array (_ BitVec 32) (_ BitVec 64))) (size!7819 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15767)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2607 0))(
  ( (MissingZero!2607 (index!12604 (_ BitVec 32))) (Found!2607 (index!12605 (_ BitVec 32))) (Intermediate!2607 (undefined!3419 Bool) (index!12606 (_ BitVec 32)) (x!30835 (_ BitVec 32))) (Undefined!2607) (MissingVacant!2607 (index!12607 (_ BitVec 32))) )
))
(declare-fun lt!151571 () SeekEntryResult!2607)

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15767 (_ BitVec 32)) SeekEntryResult!2607)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309364 (= lt!151571 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!309365 () Bool)

(declare-fun e!193280 () Bool)

(declare-fun e!193282 () Bool)

(assert (=> b!309365 (= e!193280 e!193282)))

(declare-fun res!165981 () Bool)

(assert (=> b!309365 (=> (not res!165981) (not e!193282))))

(declare-fun lt!151572 () SeekEntryResult!2607)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309365 (= res!165981 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151572))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!309365 (= lt!151572 (Intermediate!2607 false resIndex!52 resX!52))))

(declare-fun b!309366 () Bool)

(declare-fun res!165977 () Bool)

(assert (=> b!309366 (=> (not res!165977) (not e!193280))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!309366 (= res!165977 (validKeyInArray!0 k0!2441))))

(declare-fun b!309367 () Bool)

(declare-fun res!165984 () Bool)

(assert (=> b!309367 (=> (not res!165984) (not e!193282))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!309367 (= res!165984 (and (= (select (arr!7467 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7819 a!3293))))))

(declare-fun b!309368 () Bool)

(assert (=> b!309368 (= e!193282 e!193279)))

(declare-fun res!165978 () Bool)

(assert (=> b!309368 (=> (not res!165978) (not e!193279))))

(assert (=> b!309368 (= res!165978 (and (= lt!151571 lt!151572) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7467 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!309368 (= lt!151571 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!309369 () Bool)

(declare-fun res!165980 () Bool)

(assert (=> b!309369 (=> (not res!165980) (not e!193280))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15767 (_ BitVec 32)) SeekEntryResult!2607)

(assert (=> b!309369 (= res!165980 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2607 i!1240)))))

(declare-fun b!309370 () Bool)

(declare-fun res!165982 () Bool)

(assert (=> b!309370 (=> (not res!165982) (not e!193280))))

(assert (=> b!309370 (= res!165982 (and (= (size!7819 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7819 a!3293))))))

(declare-fun b!309371 () Bool)

(declare-fun res!165976 () Bool)

(assert (=> b!309371 (=> (not res!165976) (not e!193280))))

(declare-fun arrayContainsKey!0 (array!15767 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!309371 (= res!165976 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!309363 () Bool)

(declare-fun res!165983 () Bool)

(assert (=> b!309363 (=> (not res!165983) (not e!193280))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15767 (_ BitVec 32)) Bool)

(assert (=> b!309363 (= res!165983 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun res!165979 () Bool)

(assert (=> start!30814 (=> (not res!165979) (not e!193280))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30814 (= res!165979 (validMask!0 mask!3709))))

(assert (=> start!30814 e!193280))

(declare-fun array_inv!5430 (array!15767) Bool)

(assert (=> start!30814 (array_inv!5430 a!3293)))

(assert (=> start!30814 true))

(assert (= (and start!30814 res!165979) b!309370))

(assert (= (and b!309370 res!165982) b!309366))

(assert (= (and b!309366 res!165977) b!309371))

(assert (= (and b!309371 res!165976) b!309369))

(assert (= (and b!309369 res!165980) b!309363))

(assert (= (and b!309363 res!165983) b!309365))

(assert (= (and b!309365 res!165981) b!309367))

(assert (= (and b!309367 res!165984) b!309368))

(assert (= (and b!309368 res!165978) b!309364))

(declare-fun m!319369 () Bool)

(assert (=> b!309371 m!319369))

(declare-fun m!319371 () Bool)

(assert (=> b!309367 m!319371))

(declare-fun m!319373 () Bool)

(assert (=> start!30814 m!319373))

(declare-fun m!319375 () Bool)

(assert (=> start!30814 m!319375))

(declare-fun m!319377 () Bool)

(assert (=> b!309365 m!319377))

(assert (=> b!309365 m!319377))

(declare-fun m!319379 () Bool)

(assert (=> b!309365 m!319379))

(declare-fun m!319381 () Bool)

(assert (=> b!309368 m!319381))

(declare-fun m!319383 () Bool)

(assert (=> b!309368 m!319383))

(declare-fun m!319385 () Bool)

(assert (=> b!309366 m!319385))

(declare-fun m!319387 () Bool)

(assert (=> b!309369 m!319387))

(declare-fun m!319389 () Bool)

(assert (=> b!309364 m!319389))

(assert (=> b!309364 m!319389))

(declare-fun m!319391 () Bool)

(assert (=> b!309364 m!319391))

(declare-fun m!319393 () Bool)

(assert (=> b!309363 m!319393))

(check-sat (not b!309366) (not b!309363) (not b!309364) (not start!30814) (not b!309368) (not b!309371) (not b!309369) (not b!309365))
(check-sat)
