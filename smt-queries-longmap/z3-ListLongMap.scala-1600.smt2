; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30258 () Bool)

(assert start!30258)

(declare-fun b!302920 () Bool)

(declare-fun res!160463 () Bool)

(declare-fun e!190786 () Bool)

(assert (=> b!302920 (=> (not res!160463) (not e!190786))))

(declare-datatypes ((array!15377 0))(
  ( (array!15378 (arr!7276 (Array (_ BitVec 32) (_ BitVec 64))) (size!7628 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15377)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15377 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!302920 (= res!160463 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!302921 () Bool)

(declare-fun res!160457 () Bool)

(assert (=> b!302921 (=> (not res!160457) (not e!190786))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!302921 (= res!160457 (and (= (size!7628 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7628 a!3293))))))

(declare-fun b!302922 () Bool)

(declare-fun res!160461 () Bool)

(declare-fun e!190788 () Bool)

(assert (=> b!302922 (=> (not res!160461) (not e!190788))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!302922 (= res!160461 (and (= (select (arr!7276 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7628 a!3293))))))

(declare-fun b!302923 () Bool)

(declare-fun res!160456 () Bool)

(assert (=> b!302923 (=> (not res!160456) (not e!190786))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15377 (_ BitVec 32)) Bool)

(assert (=> b!302923 (= res!160456 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun res!160464 () Bool)

(assert (=> start!30258 (=> (not res!160464) (not e!190786))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30258 (= res!160464 (validMask!0 mask!3709))))

(assert (=> start!30258 e!190786))

(declare-fun array_inv!5226 (array!15377) Bool)

(assert (=> start!30258 (array_inv!5226 a!3293)))

(assert (=> start!30258 true))

(declare-fun b!302924 () Bool)

(assert (=> b!302924 (= e!190786 e!190788)))

(declare-fun res!160462 () Bool)

(assert (=> b!302924 (=> (not res!160462) (not e!190788))))

(declare-datatypes ((SeekEntryResult!2381 0))(
  ( (MissingZero!2381 (index!11700 (_ BitVec 32))) (Found!2381 (index!11701 (_ BitVec 32))) (Intermediate!2381 (undefined!3193 Bool) (index!11702 (_ BitVec 32)) (x!30075 (_ BitVec 32))) (Undefined!2381) (MissingVacant!2381 (index!11703 (_ BitVec 32))) )
))
(declare-fun lt!150171 () SeekEntryResult!2381)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15377 (_ BitVec 32)) SeekEntryResult!2381)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!302924 (= res!160462 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150171))))

(assert (=> b!302924 (= lt!150171 (Intermediate!2381 false resIndex!52 resX!52))))

(declare-fun b!302925 () Bool)

(declare-fun res!160458 () Bool)

(assert (=> b!302925 (=> (not res!160458) (not e!190786))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15377 (_ BitVec 32)) SeekEntryResult!2381)

(assert (=> b!302925 (= res!160458 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2381 i!1240)))))

(declare-fun b!302926 () Bool)

(declare-fun res!160459 () Bool)

(assert (=> b!302926 (=> (not res!160459) (not e!190788))))

(assert (=> b!302926 (= res!160459 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!150171))))

(declare-fun b!302927 () Bool)

(declare-fun res!160460 () Bool)

(assert (=> b!302927 (=> (not res!160460) (not e!190786))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!302927 (= res!160460 (validKeyInArray!0 k0!2441))))

(declare-fun b!302928 () Bool)

(assert (=> b!302928 (= e!190788 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7276 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7276 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7276 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!3709 #b00000000000000000000000000000000)))))

(assert (= (and start!30258 res!160464) b!302921))

(assert (= (and b!302921 res!160457) b!302927))

(assert (= (and b!302927 res!160460) b!302920))

(assert (= (and b!302920 res!160463) b!302925))

(assert (= (and b!302925 res!160458) b!302923))

(assert (= (and b!302923 res!160456) b!302924))

(assert (= (and b!302924 res!160462) b!302922))

(assert (= (and b!302922 res!160461) b!302926))

(assert (= (and b!302926 res!160459) b!302928))

(declare-fun m!314515 () Bool)

(assert (=> b!302928 m!314515))

(declare-fun m!314517 () Bool)

(assert (=> b!302920 m!314517))

(declare-fun m!314519 () Bool)

(assert (=> b!302926 m!314519))

(declare-fun m!314521 () Bool)

(assert (=> b!302923 m!314521))

(declare-fun m!314523 () Bool)

(assert (=> b!302922 m!314523))

(declare-fun m!314525 () Bool)

(assert (=> start!30258 m!314525))

(declare-fun m!314527 () Bool)

(assert (=> start!30258 m!314527))

(declare-fun m!314529 () Bool)

(assert (=> b!302925 m!314529))

(declare-fun m!314531 () Bool)

(assert (=> b!302927 m!314531))

(declare-fun m!314533 () Bool)

(assert (=> b!302924 m!314533))

(assert (=> b!302924 m!314533))

(declare-fun m!314535 () Bool)

(assert (=> b!302924 m!314535))

(check-sat (not b!302925) (not b!302926) (not b!302924) (not b!302920) (not b!302923) (not b!302927) (not start!30258))
(check-sat)
