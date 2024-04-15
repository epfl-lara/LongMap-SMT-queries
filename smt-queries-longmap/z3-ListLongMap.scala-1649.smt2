; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30660 () Bool)

(assert start!30660)

(declare-fun res!164579 () Bool)

(declare-fun e!192490 () Bool)

(assert (=> start!30660 (=> (not res!164579) (not e!192490))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30660 (= res!164579 (validMask!0 mask!3709))))

(assert (=> start!30660 e!192490))

(declare-datatypes ((array!15668 0))(
  ( (array!15669 (arr!7419 (Array (_ BitVec 32) (_ BitVec 64))) (size!7772 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15668)

(declare-fun array_inv!5391 (array!15668) Bool)

(assert (=> start!30660 (array_inv!5391 a!3293)))

(assert (=> start!30660 true))

(declare-fun b!307677 () Bool)

(declare-fun res!164586 () Bool)

(declare-fun e!192489 () Bool)

(assert (=> b!307677 (=> (not res!164586) (not e!192489))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!307677 (= res!164586 (and (= (select (arr!7419 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7772 a!3293))))))

(declare-fun b!307678 () Bool)

(assert (=> b!307678 (= e!192490 e!192489)))

(declare-fun res!164583 () Bool)

(assert (=> b!307678 (=> (not res!164583) (not e!192489))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2558 0))(
  ( (MissingZero!2558 (index!12408 (_ BitVec 32))) (Found!2558 (index!12409 (_ BitVec 32))) (Intermediate!2558 (undefined!3370 Bool) (index!12410 (_ BitVec 32)) (x!30660 (_ BitVec 32))) (Undefined!2558) (MissingVacant!2558 (index!12411 (_ BitVec 32))) )
))
(declare-fun lt!150974 () SeekEntryResult!2558)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15668 (_ BitVec 32)) SeekEntryResult!2558)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!307678 (= res!164583 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150974))))

(assert (=> b!307678 (= lt!150974 (Intermediate!2558 false resIndex!52 resX!52))))

(declare-fun b!307679 () Bool)

(declare-fun res!164581 () Bool)

(assert (=> b!307679 (=> (not res!164581) (not e!192490))))

(declare-fun arrayContainsKey!0 (array!15668 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!307679 (= res!164581 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!307680 () Bool)

(declare-fun res!164582 () Bool)

(assert (=> b!307680 (=> (not res!164582) (not e!192489))))

(assert (=> b!307680 (= res!164582 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!150974))))

(declare-fun b!307681 () Bool)

(declare-fun res!164577 () Bool)

(assert (=> b!307681 (=> (not res!164577) (not e!192489))))

(assert (=> b!307681 (= res!164577 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7419 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(declare-fun b!307682 () Bool)

(declare-fun res!164580 () Bool)

(assert (=> b!307682 (=> (not res!164580) (not e!192490))))

(assert (=> b!307682 (= res!164580 (and (= (size!7772 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7772 a!3293))))))

(declare-fun b!307683 () Bool)

(assert (=> b!307683 (= e!192489 false)))

(declare-fun lt!150973 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!307683 (= lt!150973 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!307684 () Bool)

(declare-fun res!164584 () Bool)

(assert (=> b!307684 (=> (not res!164584) (not e!192490))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15668 (_ BitVec 32)) SeekEntryResult!2558)

(assert (=> b!307684 (= res!164584 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2558 i!1240)))))

(declare-fun b!307685 () Bool)

(declare-fun res!164585 () Bool)

(assert (=> b!307685 (=> (not res!164585) (not e!192490))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15668 (_ BitVec 32)) Bool)

(assert (=> b!307685 (= res!164585 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!307686 () Bool)

(declare-fun res!164578 () Bool)

(assert (=> b!307686 (=> (not res!164578) (not e!192490))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!307686 (= res!164578 (validKeyInArray!0 k0!2441))))

(assert (= (and start!30660 res!164579) b!307682))

(assert (= (and b!307682 res!164580) b!307686))

(assert (= (and b!307686 res!164578) b!307679))

(assert (= (and b!307679 res!164581) b!307684))

(assert (= (and b!307684 res!164584) b!307685))

(assert (= (and b!307685 res!164585) b!307678))

(assert (= (and b!307678 res!164583) b!307677))

(assert (= (and b!307677 res!164586) b!307680))

(assert (= (and b!307680 res!164582) b!307681))

(assert (= (and b!307681 res!164577) b!307683))

(declare-fun m!317431 () Bool)

(assert (=> b!307684 m!317431))

(declare-fun m!317433 () Bool)

(assert (=> b!307678 m!317433))

(assert (=> b!307678 m!317433))

(declare-fun m!317435 () Bool)

(assert (=> b!307678 m!317435))

(declare-fun m!317437 () Bool)

(assert (=> start!30660 m!317437))

(declare-fun m!317439 () Bool)

(assert (=> start!30660 m!317439))

(declare-fun m!317441 () Bool)

(assert (=> b!307677 m!317441))

(declare-fun m!317443 () Bool)

(assert (=> b!307681 m!317443))

(declare-fun m!317445 () Bool)

(assert (=> b!307685 m!317445))

(declare-fun m!317447 () Bool)

(assert (=> b!307679 m!317447))

(declare-fun m!317449 () Bool)

(assert (=> b!307686 m!317449))

(declare-fun m!317451 () Bool)

(assert (=> b!307683 m!317451))

(declare-fun m!317453 () Bool)

(assert (=> b!307680 m!317453))

(check-sat (not b!307683) (not b!307686) (not start!30660) (not b!307684) (not b!307680) (not b!307685) (not b!307678) (not b!307679))
(check-sat)
