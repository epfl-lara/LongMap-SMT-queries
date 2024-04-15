; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30582 () Bool)

(assert start!30582)

(declare-fun res!163537 () Bool)

(declare-fun e!192164 () Bool)

(assert (=> start!30582 (=> (not res!163537) (not e!192164))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30582 (= res!163537 (validMask!0 mask!3709))))

(assert (=> start!30582 e!192164))

(declare-datatypes ((array!15590 0))(
  ( (array!15591 (arr!7380 (Array (_ BitVec 32) (_ BitVec 64))) (size!7733 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15590)

(declare-fun array_inv!5352 (array!15590) Bool)

(assert (=> start!30582 (array_inv!5352 a!3293)))

(assert (=> start!30582 true))

(declare-fun b!306605 () Bool)

(declare-fun res!163542 () Bool)

(assert (=> b!306605 (=> (not res!163542) (not e!192164))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!306605 (= res!163542 (and (= (size!7733 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7733 a!3293))))))

(declare-fun b!306606 () Bool)

(declare-datatypes ((Unit!9526 0))(
  ( (Unit!9527) )
))
(declare-fun e!192163 () Unit!9526)

(declare-fun e!192161 () Unit!9526)

(assert (=> b!306606 (= e!192163 e!192161)))

(declare-fun c!49139 () Bool)

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!306606 (= c!49139 (or (= (select (arr!7380 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7380 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!306607 () Bool)

(declare-fun res!163536 () Bool)

(assert (=> b!306607 (=> (not res!163536) (not e!192164))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15590 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!306607 (= res!163536 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!306608 () Bool)

(declare-fun res!163534 () Bool)

(declare-fun e!192160 () Bool)

(assert (=> b!306608 (=> (not res!163534) (not e!192160))))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(assert (=> b!306608 (= res!163534 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7380 a!3293) index!1781) k0!2441)) (= x!1427 resX!52)))))

(declare-fun b!306609 () Bool)

(assert (=> b!306609 false))

(declare-fun Unit!9528 () Unit!9526)

(assert (=> b!306609 (= e!192161 Unit!9528)))

(declare-fun b!306610 () Bool)

(declare-fun res!163539 () Bool)

(assert (=> b!306610 (=> (not res!163539) (not e!192164))))

(declare-datatypes ((SeekEntryResult!2519 0))(
  ( (MissingZero!2519 (index!12252 (_ BitVec 32))) (Found!2519 (index!12253 (_ BitVec 32))) (Intermediate!2519 (undefined!3331 Bool) (index!12254 (_ BitVec 32)) (x!30517 (_ BitVec 32))) (Undefined!2519) (MissingVacant!2519 (index!12255 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15590 (_ BitVec 32)) SeekEntryResult!2519)

(assert (=> b!306610 (= res!163539 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2519 i!1240)))))

(declare-fun b!306611 () Bool)

(declare-fun res!163535 () Bool)

(assert (=> b!306611 (=> (not res!163535) (not e!192164))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15590 (_ BitVec 32)) Bool)

(assert (=> b!306611 (= res!163535 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!306612 () Bool)

(assert (=> b!306612 (= e!192164 e!192160)))

(declare-fun res!163541 () Bool)

(assert (=> b!306612 (=> (not res!163541) (not e!192160))))

(declare-fun lt!150822 () SeekEntryResult!2519)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15590 (_ BitVec 32)) SeekEntryResult!2519)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!306612 (= res!163541 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150822))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!306612 (= lt!150822 (Intermediate!2519 false resIndex!52 resX!52))))

(declare-fun b!306613 () Bool)

(assert (=> b!306613 (= e!192160 (not true))))

(assert (=> b!306613 (= index!1781 resIndex!52)))

(declare-fun lt!150823 () Unit!9526)

(assert (=> b!306613 (= lt!150823 e!192163)))

(declare-fun c!49138 () Bool)

(assert (=> b!306613 (= c!49138 (not (= resIndex!52 index!1781)))))

(declare-fun b!306614 () Bool)

(declare-fun res!163533 () Bool)

(assert (=> b!306614 (=> (not res!163533) (not e!192160))))

(assert (=> b!306614 (= res!163533 (and (= (select (arr!7380 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7733 a!3293))))))

(declare-fun b!306615 () Bool)

(declare-fun Unit!9529 () Unit!9526)

(assert (=> b!306615 (= e!192163 Unit!9529)))

(declare-fun b!306616 () Bool)

(assert (=> b!306616 false))

(declare-fun lt!150824 () SeekEntryResult!2519)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!306616 (= lt!150824 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun Unit!9530 () Unit!9526)

(assert (=> b!306616 (= e!192161 Unit!9530)))

(declare-fun b!306617 () Bool)

(declare-fun res!163538 () Bool)

(assert (=> b!306617 (=> (not res!163538) (not e!192164))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!306617 (= res!163538 (validKeyInArray!0 k0!2441))))

(declare-fun b!306618 () Bool)

(declare-fun res!163540 () Bool)

(assert (=> b!306618 (=> (not res!163540) (not e!192160))))

(assert (=> b!306618 (= res!163540 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!150822))))

(assert (= (and start!30582 res!163537) b!306605))

(assert (= (and b!306605 res!163542) b!306617))

(assert (= (and b!306617 res!163538) b!306607))

(assert (= (and b!306607 res!163536) b!306610))

(assert (= (and b!306610 res!163539) b!306611))

(assert (= (and b!306611 res!163535) b!306612))

(assert (= (and b!306612 res!163541) b!306614))

(assert (= (and b!306614 res!163533) b!306618))

(assert (= (and b!306618 res!163540) b!306608))

(assert (= (and b!306608 res!163534) b!306613))

(assert (= (and b!306613 c!49138) b!306606))

(assert (= (and b!306613 (not c!49138)) b!306615))

(assert (= (and b!306606 c!49139) b!306609))

(assert (= (and b!306606 (not c!49139)) b!306616))

(declare-fun m!316573 () Bool)

(assert (=> b!306611 m!316573))

(declare-fun m!316575 () Bool)

(assert (=> b!306616 m!316575))

(assert (=> b!306616 m!316575))

(declare-fun m!316577 () Bool)

(assert (=> b!306616 m!316577))

(declare-fun m!316579 () Bool)

(assert (=> b!306606 m!316579))

(declare-fun m!316581 () Bool)

(assert (=> start!30582 m!316581))

(declare-fun m!316583 () Bool)

(assert (=> start!30582 m!316583))

(declare-fun m!316585 () Bool)

(assert (=> b!306610 m!316585))

(assert (=> b!306608 m!316579))

(declare-fun m!316587 () Bool)

(assert (=> b!306607 m!316587))

(declare-fun m!316589 () Bool)

(assert (=> b!306614 m!316589))

(declare-fun m!316591 () Bool)

(assert (=> b!306617 m!316591))

(declare-fun m!316593 () Bool)

(assert (=> b!306612 m!316593))

(assert (=> b!306612 m!316593))

(declare-fun m!316595 () Bool)

(assert (=> b!306612 m!316595))

(declare-fun m!316597 () Bool)

(assert (=> b!306618 m!316597))

(check-sat (not b!306618) (not b!306611) (not b!306607) (not b!306610) (not start!30582) (not b!306617) (not b!306612) (not b!306616))
(check-sat)
