; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30274 () Bool)

(assert start!30274)

(declare-fun res!160490 () Bool)

(declare-fun e!190829 () Bool)

(assert (=> start!30274 (=> (not res!160490) (not e!190829))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30274 (= res!160490 (validMask!0 mask!3709))))

(assert (=> start!30274 e!190829))

(declare-datatypes ((array!15380 0))(
  ( (array!15381 (arr!7278 (Array (_ BitVec 32) (_ BitVec 64))) (size!7630 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15380)

(declare-fun array_inv!5241 (array!15380) Bool)

(assert (=> start!30274 (array_inv!5241 a!3293)))

(assert (=> start!30274 true))

(declare-fun b!303000 () Bool)

(declare-fun res!160493 () Bool)

(assert (=> b!303000 (=> (not res!160493) (not e!190829))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15380 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!303000 (= res!160493 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!303001 () Bool)

(declare-fun e!190831 () Bool)

(assert (=> b!303001 (= e!190829 e!190831)))

(declare-fun res!160489 () Bool)

(assert (=> b!303001 (=> (not res!160489) (not e!190831))))

(declare-datatypes ((SeekEntryResult!2418 0))(
  ( (MissingZero!2418 (index!11848 (_ BitVec 32))) (Found!2418 (index!11849 (_ BitVec 32))) (Intermediate!2418 (undefined!3230 Bool) (index!11850 (_ BitVec 32)) (x!30115 (_ BitVec 32))) (Undefined!2418) (MissingVacant!2418 (index!11851 (_ BitVec 32))) )
))
(declare-fun lt!150156 () SeekEntryResult!2418)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15380 (_ BitVec 32)) SeekEntryResult!2418)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!303001 (= res!160489 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150156))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!303001 (= lt!150156 (Intermediate!2418 false resIndex!52 resX!52))))

(declare-fun b!303002 () Bool)

(declare-fun res!160486 () Bool)

(assert (=> b!303002 (=> (not res!160486) (not e!190829))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!303002 (= res!160486 (and (= (size!7630 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7630 a!3293))))))

(declare-fun b!303003 () Bool)

(declare-fun res!160488 () Bool)

(assert (=> b!303003 (=> (not res!160488) (not e!190829))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15380 (_ BitVec 32)) SeekEntryResult!2418)

(assert (=> b!303003 (= res!160488 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2418 i!1240)))))

(declare-fun b!303004 () Bool)

(declare-fun res!160494 () Bool)

(assert (=> b!303004 (=> (not res!160494) (not e!190829))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15380 (_ BitVec 32)) Bool)

(assert (=> b!303004 (= res!160494 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!303005 () Bool)

(declare-fun res!160487 () Bool)

(assert (=> b!303005 (=> (not res!160487) (not e!190831))))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!303005 (= res!160487 (and (= (select (arr!7278 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7630 a!3293))))))

(declare-fun b!303006 () Bool)

(declare-fun res!160491 () Bool)

(assert (=> b!303006 (=> (not res!160491) (not e!190829))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!303006 (= res!160491 (validKeyInArray!0 k0!2441))))

(declare-fun b!303007 () Bool)

(declare-fun res!160492 () Bool)

(assert (=> b!303007 (=> (not res!160492) (not e!190831))))

(assert (=> b!303007 (= res!160492 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!150156))))

(declare-fun b!303008 () Bool)

(assert (=> b!303008 (= e!190831 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7278 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7278 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7278 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!3709 #b00000000000000000000000000000000)))))

(assert (= (and start!30274 res!160490) b!303002))

(assert (= (and b!303002 res!160486) b!303006))

(assert (= (and b!303006 res!160491) b!303000))

(assert (= (and b!303000 res!160493) b!303003))

(assert (= (and b!303003 res!160488) b!303004))

(assert (= (and b!303004 res!160494) b!303001))

(assert (= (and b!303001 res!160489) b!303005))

(assert (= (and b!303005 res!160487) b!303007))

(assert (= (and b!303007 res!160492) b!303008))

(declare-fun m!314427 () Bool)

(assert (=> b!303004 m!314427))

(declare-fun m!314429 () Bool)

(assert (=> b!303003 m!314429))

(declare-fun m!314431 () Bool)

(assert (=> b!303001 m!314431))

(assert (=> b!303001 m!314431))

(declare-fun m!314433 () Bool)

(assert (=> b!303001 m!314433))

(declare-fun m!314435 () Bool)

(assert (=> b!303006 m!314435))

(declare-fun m!314437 () Bool)

(assert (=> b!303008 m!314437))

(declare-fun m!314439 () Bool)

(assert (=> b!303007 m!314439))

(declare-fun m!314441 () Bool)

(assert (=> start!30274 m!314441))

(declare-fun m!314443 () Bool)

(assert (=> start!30274 m!314443))

(declare-fun m!314445 () Bool)

(assert (=> b!303000 m!314445))

(declare-fun m!314447 () Bool)

(assert (=> b!303005 m!314447))

(check-sat (not b!303007) (not b!303006) (not start!30274) (not b!303000) (not b!303003) (not b!303001) (not b!303004))
(check-sat)
