; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30938 () Bool)

(assert start!30938)

(declare-fun res!167065 () Bool)

(declare-fun e!193902 () Bool)

(assert (=> start!30938 (=> (not res!167065) (not e!193902))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30938 (= res!167065 (validMask!0 mask!3709))))

(assert (=> start!30938 e!193902))

(declare-datatypes ((array!15840 0))(
  ( (array!15841 (arr!7502 (Array (_ BitVec 32) (_ BitVec 64))) (size!7854 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15840)

(declare-fun array_inv!5465 (array!15840) Bool)

(assert (=> start!30938 (array_inv!5465 a!3293)))

(assert (=> start!30938 true))

(declare-fun b!310607 () Bool)

(declare-fun res!167062 () Bool)

(declare-fun e!193905 () Bool)

(assert (=> b!310607 (=> (not res!167062) (not e!193905))))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!310607 (= res!167062 (and (= (select (arr!7502 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7854 a!3293))))))

(declare-fun b!310608 () Bool)

(declare-fun res!167069 () Bool)

(assert (=> b!310608 (=> (not res!167069) (not e!193902))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2642 0))(
  ( (MissingZero!2642 (index!12744 (_ BitVec 32))) (Found!2642 (index!12745 (_ BitVec 32))) (Intermediate!2642 (undefined!3454 Bool) (index!12746 (_ BitVec 32)) (x!30975 (_ BitVec 32))) (Undefined!2642) (MissingVacant!2642 (index!12747 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15840 (_ BitVec 32)) SeekEntryResult!2642)

(assert (=> b!310608 (= res!167069 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2642 i!1240)))))

(declare-fun b!310609 () Bool)

(declare-fun res!167066 () Bool)

(assert (=> b!310609 (=> (not res!167066) (not e!193902))))

(declare-fun arrayContainsKey!0 (array!15840 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!310609 (= res!167066 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!310610 () Bool)

(declare-fun res!167067 () Bool)

(assert (=> b!310610 (=> (not res!167067) (not e!193902))))

(assert (=> b!310610 (= res!167067 (and (= (size!7854 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7854 a!3293))))))

(declare-fun b!310611 () Bool)

(declare-fun res!167068 () Bool)

(assert (=> b!310611 (=> (not res!167068) (not e!193902))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!310611 (= res!167068 (validKeyInArray!0 k!2441))))

(declare-fun b!310612 () Bool)

(declare-fun e!193904 () Bool)

(assert (=> b!310612 (= e!193905 e!193904)))

(declare-fun res!167064 () Bool)

(assert (=> b!310612 (=> (not res!167064) (not e!193904))))

(declare-fun lt!152025 () SeekEntryResult!2642)

(declare-fun lt!152023 () SeekEntryResult!2642)

(assert (=> b!310612 (= res!167064 (and (= lt!152023 lt!152025) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7502 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15840 (_ BitVec 32)) SeekEntryResult!2642)

(assert (=> b!310612 (= lt!152023 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!310613 () Bool)

(assert (=> b!310613 (= e!193904 (not true))))

(declare-fun e!193903 () Bool)

(assert (=> b!310613 e!193903))

(declare-fun res!167061 () Bool)

(assert (=> b!310613 (=> (not res!167061) (not e!193903))))

(declare-fun lt!152022 () (_ BitVec 32))

(assert (=> b!310613 (= res!167061 (= lt!152023 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152022 k!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310613 (= lt!152022 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!310614 () Bool)

(declare-fun res!167063 () Bool)

(assert (=> b!310614 (=> (not res!167063) (not e!193902))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15840 (_ BitVec 32)) Bool)

(assert (=> b!310614 (= res!167063 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun lt!152024 () array!15840)

(declare-fun b!310615 () Bool)

(assert (=> b!310615 (= e!193903 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!152024 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152022 k!2441 lt!152024 mask!3709)))))

(assert (=> b!310615 (= lt!152024 (array!15841 (store (arr!7502 a!3293) i!1240 k!2441) (size!7854 a!3293)))))

(declare-fun b!310616 () Bool)

(assert (=> b!310616 (= e!193902 e!193905)))

(declare-fun res!167070 () Bool)

(assert (=> b!310616 (=> (not res!167070) (not e!193905))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310616 (= res!167070 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!152025))))

(assert (=> b!310616 (= lt!152025 (Intermediate!2642 false resIndex!52 resX!52))))

(assert (= (and start!30938 res!167065) b!310610))

(assert (= (and b!310610 res!167067) b!310611))

(assert (= (and b!310611 res!167068) b!310609))

(assert (= (and b!310609 res!167066) b!310608))

(assert (= (and b!310608 res!167069) b!310614))

(assert (= (and b!310614 res!167063) b!310616))

(assert (= (and b!310616 res!167070) b!310607))

(assert (= (and b!310607 res!167062) b!310612))

(assert (= (and b!310612 res!167064) b!310613))

(assert (= (and b!310613 res!167061) b!310615))

(declare-fun m!320525 () Bool)

(assert (=> b!310615 m!320525))

(declare-fun m!320527 () Bool)

(assert (=> b!310615 m!320527))

(declare-fun m!320529 () Bool)

(assert (=> b!310615 m!320529))

(declare-fun m!320531 () Bool)

(assert (=> b!310616 m!320531))

(assert (=> b!310616 m!320531))

(declare-fun m!320533 () Bool)

(assert (=> b!310616 m!320533))

(declare-fun m!320535 () Bool)

(assert (=> start!30938 m!320535))

(declare-fun m!320537 () Bool)

(assert (=> start!30938 m!320537))

(declare-fun m!320539 () Bool)

(assert (=> b!310614 m!320539))

(declare-fun m!320541 () Bool)

(assert (=> b!310609 m!320541))

(declare-fun m!320543 () Bool)

(assert (=> b!310611 m!320543))

(declare-fun m!320545 () Bool)

(assert (=> b!310607 m!320545))

(declare-fun m!320547 () Bool)

(assert (=> b!310608 m!320547))

(declare-fun m!320549 () Bool)

(assert (=> b!310613 m!320549))

(declare-fun m!320551 () Bool)

(assert (=> b!310613 m!320551))

(declare-fun m!320553 () Bool)

(assert (=> b!310612 m!320553))

(declare-fun m!320555 () Bool)

(assert (=> b!310612 m!320555))

(push 1)

