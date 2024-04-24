; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30650 () Bool)

(assert start!30650)

(declare-fun b!307749 () Bool)

(declare-fun res!164556 () Bool)

(declare-fun e!192587 () Bool)

(assert (=> b!307749 (=> (not res!164556) (not e!192587))))

(declare-datatypes ((array!15667 0))(
  ( (array!15668 (arr!7418 (Array (_ BitVec 32) (_ BitVec 64))) (size!7770 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15667)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!307749 (= res!164556 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7418 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(declare-fun b!307750 () Bool)

(assert (=> b!307750 (= e!192587 false)))

(declare-fun lt!151196 () (_ BitVec 32))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!307750 (= lt!151196 (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709))))

(declare-fun b!307751 () Bool)

(declare-fun res!164557 () Bool)

(declare-fun e!192586 () Bool)

(assert (=> b!307751 (=> (not res!164557) (not e!192586))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!307751 (= res!164557 (and (= (size!7770 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7770 a!3293))))))

(declare-fun b!307752 () Bool)

(declare-fun res!164561 () Bool)

(assert (=> b!307752 (=> (not res!164561) (not e!192587))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!307752 (= res!164561 (and (= (select (arr!7418 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7770 a!3293))))))

(declare-fun b!307753 () Bool)

(declare-fun res!164560 () Bool)

(assert (=> b!307753 (=> (not res!164560) (not e!192586))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15667 (_ BitVec 32)) Bool)

(assert (=> b!307753 (= res!164560 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun res!164558 () Bool)

(assert (=> start!30650 (=> (not res!164558) (not e!192586))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30650 (= res!164558 (validMask!0 mask!3709))))

(assert (=> start!30650 e!192586))

(declare-fun array_inv!5368 (array!15667) Bool)

(assert (=> start!30650 (array_inv!5368 a!3293)))

(assert (=> start!30650 true))

(declare-fun b!307754 () Bool)

(declare-fun res!164559 () Bool)

(assert (=> b!307754 (=> (not res!164559) (not e!192587))))

(declare-datatypes ((SeekEntryResult!2523 0))(
  ( (MissingZero!2523 (index!12268 (_ BitVec 32))) (Found!2523 (index!12269 (_ BitVec 32))) (Intermediate!2523 (undefined!3335 Bool) (index!12270 (_ BitVec 32)) (x!30611 (_ BitVec 32))) (Undefined!2523) (MissingVacant!2523 (index!12271 (_ BitVec 32))) )
))
(declare-fun lt!151197 () SeekEntryResult!2523)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15667 (_ BitVec 32)) SeekEntryResult!2523)

(assert (=> b!307754 (= res!164559 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!151197))))

(declare-fun b!307755 () Bool)

(declare-fun res!164553 () Bool)

(assert (=> b!307755 (=> (not res!164553) (not e!192586))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15667 (_ BitVec 32)) SeekEntryResult!2523)

(assert (=> b!307755 (= res!164553 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2523 i!1240)))))

(declare-fun b!307756 () Bool)

(assert (=> b!307756 (= e!192586 e!192587)))

(declare-fun res!164562 () Bool)

(assert (=> b!307756 (=> (not res!164562) (not e!192587))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!307756 (= res!164562 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!151197))))

(assert (=> b!307756 (= lt!151197 (Intermediate!2523 false resIndex!52 resX!52))))

(declare-fun b!307757 () Bool)

(declare-fun res!164555 () Bool)

(assert (=> b!307757 (=> (not res!164555) (not e!192586))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!307757 (= res!164555 (validKeyInArray!0 k!2441))))

(declare-fun b!307758 () Bool)

(declare-fun res!164554 () Bool)

(assert (=> b!307758 (=> (not res!164554) (not e!192586))))

(declare-fun arrayContainsKey!0 (array!15667 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!307758 (= res!164554 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(assert (= (and start!30650 res!164558) b!307751))

(assert (= (and b!307751 res!164557) b!307757))

(assert (= (and b!307757 res!164555) b!307758))

(assert (= (and b!307758 res!164554) b!307755))

(assert (= (and b!307755 res!164553) b!307753))

(assert (= (and b!307753 res!164560) b!307756))

(assert (= (and b!307756 res!164562) b!307752))

(assert (= (and b!307752 res!164561) b!307754))

(assert (= (and b!307754 res!164559) b!307749))

(assert (= (and b!307749 res!164556) b!307750))

(declare-fun m!318163 () Bool)

(assert (=> start!30650 m!318163))

(declare-fun m!318165 () Bool)

(assert (=> start!30650 m!318165))

(declare-fun m!318167 () Bool)

(assert (=> b!307755 m!318167))

(declare-fun m!318169 () Bool)

(assert (=> b!307756 m!318169))

(assert (=> b!307756 m!318169))

(declare-fun m!318171 () Bool)

(assert (=> b!307756 m!318171))

(declare-fun m!318173 () Bool)

(assert (=> b!307757 m!318173))

(declare-fun m!318175 () Bool)

(assert (=> b!307753 m!318175))

(declare-fun m!318177 () Bool)

(assert (=> b!307758 m!318177))

(declare-fun m!318179 () Bool)

(assert (=> b!307749 m!318179))

(declare-fun m!318181 () Bool)

(assert (=> b!307752 m!318181))

(declare-fun m!318183 () Bool)

(assert (=> b!307754 m!318183))

(declare-fun m!318185 () Bool)

(assert (=> b!307750 m!318185))

(push 1)

(assert (not b!307750))

(assert (not b!307757))

(assert (not start!30650))

(assert (not b!307756))

(assert (not b!307758))

(assert (not b!307755))

(assert (not b!307753))

(assert (not b!307754))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

