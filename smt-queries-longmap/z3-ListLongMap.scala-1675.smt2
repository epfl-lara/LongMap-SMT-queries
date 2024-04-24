; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30924 () Bool)

(assert start!30924)

(declare-fun b!310554 () Bool)

(declare-fun res!167059 () Bool)

(declare-fun e!193872 () Bool)

(assert (=> b!310554 (=> (not res!167059) (not e!193872))))

(declare-datatypes ((array!15839 0))(
  ( (array!15840 (arr!7501 (Array (_ BitVec 32) (_ BitVec 64))) (size!7853 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15839)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2606 0))(
  ( (MissingZero!2606 (index!12600 (_ BitVec 32))) (Found!2606 (index!12601 (_ BitVec 32))) (Intermediate!2606 (undefined!3418 Bool) (index!12602 (_ BitVec 32)) (x!30936 (_ BitVec 32))) (Undefined!2606) (MissingVacant!2606 (index!12603 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15839 (_ BitVec 32)) SeekEntryResult!2606)

(assert (=> b!310554 (= res!167059 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2606 i!1240)))))

(declare-fun b!310555 () Bool)

(declare-fun e!193871 () Bool)

(assert (=> b!310555 (= e!193871 (not true))))

(declare-fun e!193869 () Bool)

(assert (=> b!310555 e!193869))

(declare-fun res!167061 () Bool)

(assert (=> b!310555 (=> (not res!167061) (not e!193869))))

(declare-fun lt!152042 () SeekEntryResult!2606)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun lt!152041 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15839 (_ BitVec 32)) SeekEntryResult!2606)

(assert (=> b!310555 (= res!167061 (= lt!152042 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152041 k0!2441 a!3293 mask!3709)))))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310555 (= lt!152041 (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709))))

(declare-fun b!310556 () Bool)

(declare-fun res!167065 () Bool)

(assert (=> b!310556 (=> (not res!167065) (not e!193872))))

(declare-fun arrayContainsKey!0 (array!15839 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!310556 (= res!167065 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!310557 () Bool)

(declare-fun e!193868 () Bool)

(assert (=> b!310557 (= e!193868 e!193871)))

(declare-fun res!167067 () Bool)

(assert (=> b!310557 (=> (not res!167067) (not e!193871))))

(declare-fun lt!152043 () SeekEntryResult!2606)

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!310557 (= res!167067 (and (= lt!152042 lt!152043) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7501 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!310557 (= lt!152042 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!310558 () Bool)

(declare-fun res!167063 () Bool)

(assert (=> b!310558 (=> (not res!167063) (not e!193872))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15839 (_ BitVec 32)) Bool)

(assert (=> b!310558 (= res!167063 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!310559 () Bool)

(declare-fun res!167064 () Bool)

(assert (=> b!310559 (=> (not res!167064) (not e!193872))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!310559 (= res!167064 (validKeyInArray!0 k0!2441))))

(declare-fun b!310560 () Bool)

(declare-fun res!167058 () Bool)

(assert (=> b!310560 (=> (not res!167058) (not e!193868))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!310560 (= res!167058 (and (= (select (arr!7501 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7853 a!3293))))))

(declare-fun b!310561 () Bool)

(assert (=> b!310561 (= e!193872 e!193868)))

(declare-fun res!167066 () Bool)

(assert (=> b!310561 (=> (not res!167066) (not e!193868))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310561 (= res!167066 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!152043))))

(assert (=> b!310561 (= lt!152043 (Intermediate!2606 false resIndex!52 resX!52))))

(declare-fun res!167060 () Bool)

(assert (=> start!30924 (=> (not res!167060) (not e!193872))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30924 (= res!167060 (validMask!0 mask!3709))))

(assert (=> start!30924 e!193872))

(declare-fun array_inv!5451 (array!15839) Bool)

(assert (=> start!30924 (array_inv!5451 a!3293)))

(assert (=> start!30924 true))

(declare-fun b!310562 () Bool)

(declare-fun res!167062 () Bool)

(assert (=> b!310562 (=> (not res!167062) (not e!193872))))

(assert (=> b!310562 (= res!167062 (and (= (size!7853 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7853 a!3293))))))

(declare-fun lt!152040 () array!15839)

(declare-fun b!310563 () Bool)

(assert (=> b!310563 (= e!193869 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!152040 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152041 k0!2441 lt!152040 mask!3709)))))

(assert (=> b!310563 (= lt!152040 (array!15840 (store (arr!7501 a!3293) i!1240 k0!2441) (size!7853 a!3293)))))

(assert (= (and start!30924 res!167060) b!310562))

(assert (= (and b!310562 res!167062) b!310559))

(assert (= (and b!310559 res!167064) b!310556))

(assert (= (and b!310556 res!167065) b!310554))

(assert (= (and b!310554 res!167059) b!310558))

(assert (= (and b!310558 res!167063) b!310561))

(assert (= (and b!310561 res!167066) b!310560))

(assert (= (and b!310560 res!167058) b!310557))

(assert (= (and b!310557 res!167067) b!310555))

(assert (= (and b!310555 res!167061) b!310563))

(declare-fun m!320659 () Bool)

(assert (=> b!310558 m!320659))

(declare-fun m!320661 () Bool)

(assert (=> b!310556 m!320661))

(declare-fun m!320663 () Bool)

(assert (=> b!310557 m!320663))

(declare-fun m!320665 () Bool)

(assert (=> b!310557 m!320665))

(declare-fun m!320667 () Bool)

(assert (=> b!310559 m!320667))

(declare-fun m!320669 () Bool)

(assert (=> b!310560 m!320669))

(declare-fun m!320671 () Bool)

(assert (=> b!310555 m!320671))

(declare-fun m!320673 () Bool)

(assert (=> b!310555 m!320673))

(declare-fun m!320675 () Bool)

(assert (=> b!310554 m!320675))

(declare-fun m!320677 () Bool)

(assert (=> b!310561 m!320677))

(assert (=> b!310561 m!320677))

(declare-fun m!320679 () Bool)

(assert (=> b!310561 m!320679))

(declare-fun m!320681 () Bool)

(assert (=> start!30924 m!320681))

(declare-fun m!320683 () Bool)

(assert (=> start!30924 m!320683))

(declare-fun m!320685 () Bool)

(assert (=> b!310563 m!320685))

(declare-fun m!320687 () Bool)

(assert (=> b!310563 m!320687))

(declare-fun m!320689 () Bool)

(assert (=> b!310563 m!320689))

(check-sat (not b!310555) (not b!310558) (not b!310559) (not b!310554) (not start!30924) (not b!310556) (not b!310563) (not b!310561) (not b!310557))
(check-sat)
