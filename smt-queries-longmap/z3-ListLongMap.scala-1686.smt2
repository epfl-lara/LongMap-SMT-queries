; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30990 () Bool)

(assert start!30990)

(declare-fun b!311544 () Bool)

(declare-fun res!168054 () Bool)

(declare-fun e!194363 () Bool)

(assert (=> b!311544 (=> (not res!168054) (not e!194363))))

(declare-datatypes ((array!15905 0))(
  ( (array!15906 (arr!7534 (Array (_ BitVec 32) (_ BitVec 64))) (size!7886 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15905)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15905 (_ BitVec 32)) Bool)

(assert (=> b!311544 (= res!168054 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun res!168052 () Bool)

(assert (=> start!30990 (=> (not res!168052) (not e!194363))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30990 (= res!168052 (validMask!0 mask!3709))))

(assert (=> start!30990 e!194363))

(declare-fun array_inv!5484 (array!15905) Bool)

(assert (=> start!30990 (array_inv!5484 a!3293)))

(assert (=> start!30990 true))

(declare-fun lt!152439 () array!15905)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun e!194366 () Bool)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun lt!152438 () (_ BitVec 32))

(declare-fun b!311545 () Bool)

(declare-fun index!1781 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2639 0))(
  ( (MissingZero!2639 (index!12732 (_ BitVec 32))) (Found!2639 (index!12733 (_ BitVec 32))) (Intermediate!2639 (undefined!3451 Bool) (index!12734 (_ BitVec 32)) (x!31057 (_ BitVec 32))) (Undefined!2639) (MissingVacant!2639 (index!12735 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15905 (_ BitVec 32)) SeekEntryResult!2639)

(assert (=> b!311545 (= e!194366 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!152439 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152438 k0!2441 lt!152439 mask!3709)))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!311545 (= lt!152439 (array!15906 (store (arr!7534 a!3293) i!1240 k0!2441) (size!7886 a!3293)))))

(declare-fun b!311546 () Bool)

(declare-fun e!194364 () Bool)

(assert (=> b!311546 (= e!194363 e!194364)))

(declare-fun res!168055 () Bool)

(assert (=> b!311546 (=> (not res!168055) (not e!194364))))

(declare-fun lt!152436 () SeekEntryResult!2639)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311546 (= res!168055 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!152436))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!311546 (= lt!152436 (Intermediate!2639 false resIndex!52 resX!52))))

(declare-fun b!311547 () Bool)

(declare-fun e!194367 () Bool)

(assert (=> b!311547 (= e!194364 e!194367)))

(declare-fun res!168048 () Bool)

(assert (=> b!311547 (=> (not res!168048) (not e!194367))))

(declare-fun lt!152437 () SeekEntryResult!2639)

(assert (=> b!311547 (= res!168048 (and (= lt!152437 lt!152436) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7534 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!311547 (= lt!152437 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!311548 () Bool)

(declare-fun res!168051 () Bool)

(assert (=> b!311548 (=> (not res!168051) (not e!194363))))

(declare-fun arrayContainsKey!0 (array!15905 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!311548 (= res!168051 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!311549 () Bool)

(assert (=> b!311549 (= e!194367 (not true))))

(assert (=> b!311549 e!194366))

(declare-fun res!168056 () Bool)

(assert (=> b!311549 (=> (not res!168056) (not e!194366))))

(assert (=> b!311549 (= res!168056 (= lt!152437 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152438 k0!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311549 (= lt!152438 (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709))))

(declare-fun b!311550 () Bool)

(declare-fun res!168049 () Bool)

(assert (=> b!311550 (=> (not res!168049) (not e!194363))))

(assert (=> b!311550 (= res!168049 (and (= (size!7886 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7886 a!3293))))))

(declare-fun b!311551 () Bool)

(declare-fun res!168053 () Bool)

(assert (=> b!311551 (=> (not res!168053) (not e!194364))))

(assert (=> b!311551 (= res!168053 (and (= (select (arr!7534 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7886 a!3293))))))

(declare-fun b!311552 () Bool)

(declare-fun res!168050 () Bool)

(assert (=> b!311552 (=> (not res!168050) (not e!194363))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!311552 (= res!168050 (validKeyInArray!0 k0!2441))))

(declare-fun b!311553 () Bool)

(declare-fun res!168057 () Bool)

(assert (=> b!311553 (=> (not res!168057) (not e!194363))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15905 (_ BitVec 32)) SeekEntryResult!2639)

(assert (=> b!311553 (= res!168057 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2639 i!1240)))))

(assert (= (and start!30990 res!168052) b!311550))

(assert (= (and b!311550 res!168049) b!311552))

(assert (= (and b!311552 res!168050) b!311548))

(assert (= (and b!311548 res!168051) b!311553))

(assert (= (and b!311553 res!168057) b!311544))

(assert (= (and b!311544 res!168054) b!311546))

(assert (= (and b!311546 res!168055) b!311551))

(assert (= (and b!311551 res!168053) b!311547))

(assert (= (and b!311547 res!168048) b!311549))

(assert (= (and b!311549 res!168056) b!311545))

(declare-fun m!321715 () Bool)

(assert (=> b!311549 m!321715))

(declare-fun m!321717 () Bool)

(assert (=> b!311549 m!321717))

(declare-fun m!321719 () Bool)

(assert (=> b!311547 m!321719))

(declare-fun m!321721 () Bool)

(assert (=> b!311547 m!321721))

(declare-fun m!321723 () Bool)

(assert (=> b!311548 m!321723))

(declare-fun m!321725 () Bool)

(assert (=> b!311545 m!321725))

(declare-fun m!321727 () Bool)

(assert (=> b!311545 m!321727))

(declare-fun m!321729 () Bool)

(assert (=> b!311545 m!321729))

(declare-fun m!321731 () Bool)

(assert (=> b!311551 m!321731))

(declare-fun m!321733 () Bool)

(assert (=> b!311544 m!321733))

(declare-fun m!321735 () Bool)

(assert (=> b!311553 m!321735))

(declare-fun m!321737 () Bool)

(assert (=> b!311552 m!321737))

(declare-fun m!321739 () Bool)

(assert (=> b!311546 m!321739))

(assert (=> b!311546 m!321739))

(declare-fun m!321741 () Bool)

(assert (=> b!311546 m!321741))

(declare-fun m!321743 () Bool)

(assert (=> start!30990 m!321743))

(declare-fun m!321745 () Bool)

(assert (=> start!30990 m!321745))

(check-sat (not b!311544) (not start!30990) (not b!311549) (not b!311548) (not b!311547) (not b!311553) (not b!311546) (not b!311552) (not b!311545))
(check-sat)
