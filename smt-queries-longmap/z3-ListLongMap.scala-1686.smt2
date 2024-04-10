; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31006 () Bool)

(assert start!31006)

(declare-fun b!311627 () Bool)

(declare-fun res!168083 () Bool)

(declare-fun e!194412 () Bool)

(assert (=> b!311627 (=> (not res!168083) (not e!194412))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((array!15908 0))(
  ( (array!15909 (arr!7536 (Array (_ BitVec 32) (_ BitVec 64))) (size!7888 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15908)

(assert (=> b!311627 (= res!168083 (and (= (size!7888 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7888 a!3293))))))

(declare-fun b!311628 () Bool)

(declare-fun res!168082 () Bool)

(assert (=> b!311628 (=> (not res!168082) (not e!194412))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15908 (_ BitVec 32)) Bool)

(assert (=> b!311628 (= res!168082 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!311629 () Bool)

(declare-fun e!194413 () Bool)

(declare-fun e!194415 () Bool)

(assert (=> b!311629 (= e!194413 e!194415)))

(declare-fun res!168081 () Bool)

(assert (=> b!311629 (=> (not res!168081) (not e!194415))))

(declare-datatypes ((SeekEntryResult!2676 0))(
  ( (MissingZero!2676 (index!12880 (_ BitVec 32))) (Found!2676 (index!12881 (_ BitVec 32))) (Intermediate!2676 (undefined!3488 Bool) (index!12882 (_ BitVec 32)) (x!31097 (_ BitVec 32))) (Undefined!2676) (MissingVacant!2676 (index!12883 (_ BitVec 32))) )
))
(declare-fun lt!152432 () SeekEntryResult!2676)

(declare-fun lt!152431 () SeekEntryResult!2676)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!311629 (= res!168081 (and (= lt!152432 lt!152431) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7536 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15908 (_ BitVec 32)) SeekEntryResult!2676)

(assert (=> b!311629 (= lt!152432 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun res!168085 () Bool)

(assert (=> start!31006 (=> (not res!168085) (not e!194412))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31006 (= res!168085 (validMask!0 mask!3709))))

(assert (=> start!31006 e!194412))

(declare-fun array_inv!5499 (array!15908) Bool)

(assert (=> start!31006 (array_inv!5499 a!3293)))

(assert (=> start!31006 true))

(declare-fun lt!152430 () array!15908)

(declare-fun lt!152433 () (_ BitVec 32))

(declare-fun b!311630 () Bool)

(declare-fun e!194416 () Bool)

(assert (=> b!311630 (= e!194416 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!152430 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152433 k0!2441 lt!152430 mask!3709)))))

(assert (=> b!311630 (= lt!152430 (array!15909 (store (arr!7536 a!3293) i!1240 k0!2441) (size!7888 a!3293)))))

(declare-fun b!311631 () Bool)

(declare-fun res!168084 () Bool)

(assert (=> b!311631 (=> (not res!168084) (not e!194413))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!311631 (= res!168084 (and (= (select (arr!7536 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7888 a!3293))))))

(declare-fun b!311632 () Bool)

(assert (=> b!311632 (= e!194415 (not true))))

(assert (=> b!311632 e!194416))

(declare-fun res!168088 () Bool)

(assert (=> b!311632 (=> (not res!168088) (not e!194416))))

(assert (=> b!311632 (= res!168088 (= lt!152432 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152433 k0!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311632 (= lt!152433 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!311633 () Bool)

(declare-fun res!168086 () Bool)

(assert (=> b!311633 (=> (not res!168086) (not e!194412))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15908 (_ BitVec 32)) SeekEntryResult!2676)

(assert (=> b!311633 (= res!168086 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2676 i!1240)))))

(declare-fun b!311634 () Bool)

(declare-fun res!168089 () Bool)

(assert (=> b!311634 (=> (not res!168089) (not e!194412))))

(declare-fun arrayContainsKey!0 (array!15908 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!311634 (= res!168089 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!311635 () Bool)

(assert (=> b!311635 (= e!194412 e!194413)))

(declare-fun res!168090 () Bool)

(assert (=> b!311635 (=> (not res!168090) (not e!194413))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311635 (= res!168090 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!152431))))

(assert (=> b!311635 (= lt!152431 (Intermediate!2676 false resIndex!52 resX!52))))

(declare-fun b!311636 () Bool)

(declare-fun res!168087 () Bool)

(assert (=> b!311636 (=> (not res!168087) (not e!194412))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!311636 (= res!168087 (validKeyInArray!0 k0!2441))))

(assert (= (and start!31006 res!168085) b!311627))

(assert (= (and b!311627 res!168083) b!311636))

(assert (= (and b!311636 res!168087) b!311634))

(assert (= (and b!311634 res!168089) b!311633))

(assert (= (and b!311633 res!168086) b!311628))

(assert (= (and b!311628 res!168082) b!311635))

(assert (= (and b!311635 res!168090) b!311631))

(assert (= (and b!311631 res!168084) b!311629))

(assert (= (and b!311629 res!168081) b!311632))

(assert (= (and b!311632 res!168088) b!311630))

(declare-fun m!321613 () Bool)

(assert (=> b!311635 m!321613))

(assert (=> b!311635 m!321613))

(declare-fun m!321615 () Bool)

(assert (=> b!311635 m!321615))

(declare-fun m!321617 () Bool)

(assert (=> b!311636 m!321617))

(declare-fun m!321619 () Bool)

(assert (=> b!311634 m!321619))

(declare-fun m!321621 () Bool)

(assert (=> b!311630 m!321621))

(declare-fun m!321623 () Bool)

(assert (=> b!311630 m!321623))

(declare-fun m!321625 () Bool)

(assert (=> b!311630 m!321625))

(declare-fun m!321627 () Bool)

(assert (=> b!311631 m!321627))

(declare-fun m!321629 () Bool)

(assert (=> b!311633 m!321629))

(declare-fun m!321631 () Bool)

(assert (=> b!311629 m!321631))

(declare-fun m!321633 () Bool)

(assert (=> b!311629 m!321633))

(declare-fun m!321635 () Bool)

(assert (=> b!311632 m!321635))

(declare-fun m!321637 () Bool)

(assert (=> b!311632 m!321637))

(declare-fun m!321639 () Bool)

(assert (=> start!31006 m!321639))

(declare-fun m!321641 () Bool)

(assert (=> start!31006 m!321641))

(declare-fun m!321643 () Bool)

(assert (=> b!311628 m!321643))

(check-sat (not b!311628) (not b!311632) (not start!31006) (not b!311636) (not b!311629) (not b!311635) (not b!311634) (not b!311633) (not b!311630))
(check-sat)
