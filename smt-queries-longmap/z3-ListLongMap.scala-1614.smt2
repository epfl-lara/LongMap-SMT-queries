; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30396 () Bool)

(assert start!30396)

(declare-fun b!304068 () Bool)

(declare-fun res!161568 () Bool)

(declare-fun e!191128 () Bool)

(assert (=> b!304068 (=> (not res!161568) (not e!191128))))

(declare-datatypes ((array!15455 0))(
  ( (array!15456 (arr!7314 (Array (_ BitVec 32) (_ BitVec 64))) (size!7667 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15455)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!304068 (= res!161568 (and (= (size!7667 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7667 a!3293))))))

(declare-fun b!304069 () Bool)

(declare-fun res!161564 () Bool)

(assert (=> b!304069 (=> (not res!161564) (not e!191128))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2453 0))(
  ( (MissingZero!2453 (index!11988 (_ BitVec 32))) (Found!2453 (index!11989 (_ BitVec 32))) (Intermediate!2453 (undefined!3265 Bool) (index!11990 (_ BitVec 32)) (x!30266 (_ BitVec 32))) (Undefined!2453) (MissingVacant!2453 (index!11991 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15455 (_ BitVec 32)) SeekEntryResult!2453)

(assert (=> b!304069 (= res!161564 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2453 i!1240)))))

(declare-fun res!161565 () Bool)

(assert (=> start!30396 (=> (not res!161565) (not e!191128))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30396 (= res!161565 (validMask!0 mask!3709))))

(assert (=> start!30396 e!191128))

(declare-fun array_inv!5286 (array!15455) Bool)

(assert (=> start!30396 (array_inv!5286 a!3293)))

(assert (=> start!30396 true))

(declare-fun b!304070 () Bool)

(declare-fun res!161562 () Bool)

(assert (=> b!304070 (=> (not res!161562) (not e!191128))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15455 (_ BitVec 32)) Bool)

(assert (=> b!304070 (= res!161562 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!304071 () Bool)

(declare-fun res!161567 () Bool)

(assert (=> b!304071 (=> (not res!161567) (not e!191128))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!304071 (= res!161567 (validKeyInArray!0 k0!2441))))

(declare-fun b!304072 () Bool)

(declare-fun e!191129 () Bool)

(assert (=> b!304072 (= e!191129 false)))

(declare-fun lt!150196 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304072 (= lt!150196 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!304073 () Bool)

(declare-fun res!161561 () Bool)

(assert (=> b!304073 (=> (not res!161561) (not e!191129))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!304073 (= res!161561 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7314 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7314 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7314 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!304074 () Bool)

(declare-fun res!161566 () Bool)

(assert (=> b!304074 (=> (not res!161566) (not e!191128))))

(declare-fun arrayContainsKey!0 (array!15455 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!304074 (= res!161566 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!304075 () Bool)

(assert (=> b!304075 (= e!191128 e!191129)))

(declare-fun res!161559 () Bool)

(assert (=> b!304075 (=> (not res!161559) (not e!191129))))

(declare-fun lt!150197 () SeekEntryResult!2453)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15455 (_ BitVec 32)) SeekEntryResult!2453)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304075 (= res!161559 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150197))))

(assert (=> b!304075 (= lt!150197 (Intermediate!2453 false resIndex!52 resX!52))))

(declare-fun b!304076 () Bool)

(declare-fun res!161563 () Bool)

(assert (=> b!304076 (=> (not res!161563) (not e!191129))))

(assert (=> b!304076 (= res!161563 (and (= (select (arr!7314 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7667 a!3293))))))

(declare-fun b!304077 () Bool)

(declare-fun res!161560 () Bool)

(assert (=> b!304077 (=> (not res!161560) (not e!191129))))

(assert (=> b!304077 (= res!161560 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!150197))))

(assert (= (and start!30396 res!161565) b!304068))

(assert (= (and b!304068 res!161568) b!304071))

(assert (= (and b!304071 res!161567) b!304074))

(assert (= (and b!304074 res!161566) b!304069))

(assert (= (and b!304069 res!161564) b!304070))

(assert (= (and b!304070 res!161562) b!304075))

(assert (= (and b!304075 res!161559) b!304076))

(assert (= (and b!304076 res!161563) b!304077))

(assert (= (and b!304077 res!161560) b!304073))

(assert (= (and b!304073 res!161561) b!304072))

(declare-fun m!314725 () Bool)

(assert (=> b!304072 m!314725))

(declare-fun m!314727 () Bool)

(assert (=> b!304071 m!314727))

(declare-fun m!314729 () Bool)

(assert (=> b!304075 m!314729))

(assert (=> b!304075 m!314729))

(declare-fun m!314731 () Bool)

(assert (=> b!304075 m!314731))

(declare-fun m!314733 () Bool)

(assert (=> b!304076 m!314733))

(declare-fun m!314735 () Bool)

(assert (=> b!304074 m!314735))

(declare-fun m!314737 () Bool)

(assert (=> b!304070 m!314737))

(declare-fun m!314739 () Bool)

(assert (=> b!304069 m!314739))

(declare-fun m!314741 () Bool)

(assert (=> b!304073 m!314741))

(declare-fun m!314743 () Bool)

(assert (=> b!304077 m!314743))

(declare-fun m!314745 () Bool)

(assert (=> start!30396 m!314745))

(declare-fun m!314747 () Bool)

(assert (=> start!30396 m!314747))

(check-sat (not b!304074) (not b!304077) (not b!304072) (not b!304071) (not b!304069) (not start!30396) (not b!304070) (not b!304075))
(check-sat)
