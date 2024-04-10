; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30934 () Bool)

(assert start!30934)

(declare-fun b!310547 () Bool)

(declare-fun res!167010 () Bool)

(declare-fun e!193874 () Bool)

(assert (=> b!310547 (=> (not res!167010) (not e!193874))))

(declare-datatypes ((array!15836 0))(
  ( (array!15837 (arr!7500 (Array (_ BitVec 32) (_ BitVec 64))) (size!7852 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15836)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15836 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!310547 (= res!167010 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun res!167007 () Bool)

(assert (=> start!30934 (=> (not res!167007) (not e!193874))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30934 (= res!167007 (validMask!0 mask!3709))))

(assert (=> start!30934 e!193874))

(declare-fun array_inv!5463 (array!15836) Bool)

(assert (=> start!30934 (array_inv!5463 a!3293)))

(assert (=> start!30934 true))

(declare-fun b!310548 () Bool)

(declare-fun e!193872 () Bool)

(assert (=> b!310548 (= e!193874 e!193872)))

(declare-fun res!167009 () Bool)

(assert (=> b!310548 (=> (not res!167009) (not e!193872))))

(declare-datatypes ((SeekEntryResult!2640 0))(
  ( (MissingZero!2640 (index!12736 (_ BitVec 32))) (Found!2640 (index!12737 (_ BitVec 32))) (Intermediate!2640 (undefined!3452 Bool) (index!12738 (_ BitVec 32)) (x!30965 (_ BitVec 32))) (Undefined!2640) (MissingVacant!2640 (index!12739 (_ BitVec 32))) )
))
(declare-fun lt!152000 () SeekEntryResult!2640)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15836 (_ BitVec 32)) SeekEntryResult!2640)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310548 (= res!167009 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!152000))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!310548 (= lt!152000 (Intermediate!2640 false resIndex!52 resX!52))))

(declare-fun b!310549 () Bool)

(declare-fun res!167002 () Bool)

(assert (=> b!310549 (=> (not res!167002) (not e!193874))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15836 (_ BitVec 32)) SeekEntryResult!2640)

(assert (=> b!310549 (= res!167002 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2640 i!1240)))))

(declare-fun b!310550 () Bool)

(declare-fun res!167001 () Bool)

(assert (=> b!310550 (=> (not res!167001) (not e!193874))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15836 (_ BitVec 32)) Bool)

(assert (=> b!310550 (= res!167001 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!310551 () Bool)

(declare-fun res!167004 () Bool)

(assert (=> b!310551 (=> (not res!167004) (not e!193874))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!310551 (= res!167004 (validKeyInArray!0 k0!2441))))

(declare-fun b!310552 () Bool)

(declare-fun res!167006 () Bool)

(assert (=> b!310552 (=> (not res!167006) (not e!193872))))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!310552 (= res!167006 (and (= (select (arr!7500 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7852 a!3293))))))

(declare-fun e!193873 () Bool)

(declare-fun b!310553 () Bool)

(declare-fun lt!151999 () (_ BitVec 32))

(declare-fun lt!151998 () array!15836)

(assert (=> b!310553 (= e!193873 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!151998 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!151999 k0!2441 lt!151998 mask!3709)))))

(assert (=> b!310553 (= lt!151998 (array!15837 (store (arr!7500 a!3293) i!1240 k0!2441) (size!7852 a!3293)))))

(declare-fun b!310554 () Bool)

(declare-fun e!193875 () Bool)

(assert (=> b!310554 (= e!193875 (not true))))

(assert (=> b!310554 e!193873))

(declare-fun res!167005 () Bool)

(assert (=> b!310554 (=> (not res!167005) (not e!193873))))

(declare-fun lt!152001 () SeekEntryResult!2640)

(assert (=> b!310554 (= res!167005 (= lt!152001 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!151999 k0!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310554 (= lt!151999 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!310555 () Bool)

(declare-fun res!167008 () Bool)

(assert (=> b!310555 (=> (not res!167008) (not e!193874))))

(assert (=> b!310555 (= res!167008 (and (= (size!7852 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7852 a!3293))))))

(declare-fun b!310556 () Bool)

(assert (=> b!310556 (= e!193872 e!193875)))

(declare-fun res!167003 () Bool)

(assert (=> b!310556 (=> (not res!167003) (not e!193875))))

(assert (=> b!310556 (= res!167003 (and (= lt!152001 lt!152000) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7500 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!310556 (= lt!152001 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(assert (= (and start!30934 res!167007) b!310555))

(assert (= (and b!310555 res!167008) b!310551))

(assert (= (and b!310551 res!167004) b!310547))

(assert (= (and b!310547 res!167010) b!310549))

(assert (= (and b!310549 res!167002) b!310550))

(assert (= (and b!310550 res!167001) b!310548))

(assert (= (and b!310548 res!167009) b!310552))

(assert (= (and b!310552 res!167006) b!310556))

(assert (= (and b!310556 res!167003) b!310554))

(assert (= (and b!310554 res!167005) b!310553))

(declare-fun m!320461 () Bool)

(assert (=> b!310550 m!320461))

(declare-fun m!320463 () Bool)

(assert (=> start!30934 m!320463))

(declare-fun m!320465 () Bool)

(assert (=> start!30934 m!320465))

(declare-fun m!320467 () Bool)

(assert (=> b!310551 m!320467))

(declare-fun m!320469 () Bool)

(assert (=> b!310556 m!320469))

(declare-fun m!320471 () Bool)

(assert (=> b!310556 m!320471))

(declare-fun m!320473 () Bool)

(assert (=> b!310548 m!320473))

(assert (=> b!310548 m!320473))

(declare-fun m!320475 () Bool)

(assert (=> b!310548 m!320475))

(declare-fun m!320477 () Bool)

(assert (=> b!310552 m!320477))

(declare-fun m!320479 () Bool)

(assert (=> b!310554 m!320479))

(declare-fun m!320481 () Bool)

(assert (=> b!310554 m!320481))

(declare-fun m!320483 () Bool)

(assert (=> b!310553 m!320483))

(declare-fun m!320485 () Bool)

(assert (=> b!310553 m!320485))

(declare-fun m!320487 () Bool)

(assert (=> b!310553 m!320487))

(declare-fun m!320489 () Bool)

(assert (=> b!310549 m!320489))

(declare-fun m!320491 () Bool)

(assert (=> b!310547 m!320491))

(check-sat (not b!310551) (not b!310554) (not b!310548) (not b!310547) (not b!310550) (not start!30934) (not b!310556) (not b!310549) (not b!310553))
(check-sat)
