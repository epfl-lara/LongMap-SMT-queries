; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30624 () Bool)

(assert start!30624)

(declare-fun b!307275 () Bool)

(declare-fun res!164037 () Bool)

(declare-fun e!192459 () Bool)

(assert (=> b!307275 (=> (not res!164037) (not e!192459))))

(declare-datatypes ((array!15628 0))(
  ( (array!15629 (arr!7399 (Array (_ BitVec 32) (_ BitVec 64))) (size!7751 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15628)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15628 (_ BitVec 32)) Bool)

(assert (=> b!307275 (= res!164037 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun res!164029 () Bool)

(assert (=> start!30624 (=> (not res!164029) (not e!192459))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30624 (= res!164029 (validMask!0 mask!3709))))

(assert (=> start!30624 e!192459))

(declare-fun array_inv!5362 (array!15628) Bool)

(assert (=> start!30624 (array_inv!5362 a!3293)))

(assert (=> start!30624 true))

(declare-fun b!307276 () Bool)

(declare-fun res!164032 () Bool)

(assert (=> b!307276 (=> (not res!164032) (not e!192459))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!307276 (= res!164032 (and (= (size!7751 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7751 a!3293))))))

(declare-fun b!307277 () Bool)

(declare-fun e!192458 () Bool)

(assert (=> b!307277 (= e!192459 e!192458)))

(declare-fun res!164030 () Bool)

(assert (=> b!307277 (=> (not res!164030) (not e!192458))))

(declare-datatypes ((SeekEntryResult!2539 0))(
  ( (MissingZero!2539 (index!12332 (_ BitVec 32))) (Found!2539 (index!12333 (_ BitVec 32))) (Intermediate!2539 (undefined!3351 Bool) (index!12334 (_ BitVec 32)) (x!30574 (_ BitVec 32))) (Undefined!2539) (MissingVacant!2539 (index!12335 (_ BitVec 32))) )
))
(declare-fun lt!151113 () SeekEntryResult!2539)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15628 (_ BitVec 32)) SeekEntryResult!2539)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!307277 (= res!164030 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!151113))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!307277 (= lt!151113 (Intermediate!2539 false resIndex!52 resX!52))))

(declare-fun b!307278 () Bool)

(declare-fun res!164036 () Bool)

(assert (=> b!307278 (=> (not res!164036) (not e!192458))))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!307278 (= res!164036 (and (= (select (arr!7399 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7751 a!3293))))))

(declare-fun b!307279 () Bool)

(declare-fun res!164035 () Bool)

(assert (=> b!307279 (=> (not res!164035) (not e!192459))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!307279 (= res!164035 (validKeyInArray!0 k!2441))))

(declare-fun b!307280 () Bool)

(declare-fun res!164034 () Bool)

(assert (=> b!307280 (=> (not res!164034) (not e!192459))))

(declare-fun arrayContainsKey!0 (array!15628 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!307280 (= res!164034 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!307281 () Bool)

(assert (=> b!307281 (= e!192458 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7399 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52)) (bvsge mask!3709 #b00000000000000000000000000000000) (bvsge index!1781 (bvadd #b00000000000000000000000000000001 mask!3709))))))

(declare-fun b!307282 () Bool)

(declare-fun res!164031 () Bool)

(assert (=> b!307282 (=> (not res!164031) (not e!192458))))

(assert (=> b!307282 (= res!164031 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!151113))))

(declare-fun b!307283 () Bool)

(declare-fun res!164033 () Bool)

(assert (=> b!307283 (=> (not res!164033) (not e!192459))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15628 (_ BitVec 32)) SeekEntryResult!2539)

(assert (=> b!307283 (= res!164033 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2539 i!1240)))))

(assert (= (and start!30624 res!164029) b!307276))

(assert (= (and b!307276 res!164032) b!307279))

(assert (= (and b!307279 res!164035) b!307280))

(assert (= (and b!307280 res!164034) b!307283))

(assert (= (and b!307283 res!164033) b!307275))

(assert (= (and b!307275 res!164037) b!307277))

(assert (= (and b!307277 res!164030) b!307278))

(assert (= (and b!307278 res!164036) b!307282))

(assert (= (and b!307282 res!164031) b!307281))

(declare-fun m!317611 () Bool)

(assert (=> start!30624 m!317611))

(declare-fun m!317613 () Bool)

(assert (=> start!30624 m!317613))

(declare-fun m!317615 () Bool)

(assert (=> b!307282 m!317615))

(declare-fun m!317617 () Bool)

(assert (=> b!307277 m!317617))

(assert (=> b!307277 m!317617))

(declare-fun m!317619 () Bool)

(assert (=> b!307277 m!317619))

(declare-fun m!317621 () Bool)

(assert (=> b!307279 m!317621))

(declare-fun m!317623 () Bool)

(assert (=> b!307275 m!317623))

(declare-fun m!317625 () Bool)

(assert (=> b!307281 m!317625))

(declare-fun m!317627 () Bool)

(assert (=> b!307278 m!317627))

(declare-fun m!317629 () Bool)

(assert (=> b!307280 m!317629))

(declare-fun m!317631 () Bool)

(assert (=> b!307283 m!317631))

(push 1)

(assert (not b!307275))

(assert (not b!307282))

(assert (not b!307277))

(assert (not b!307283))

(assert (not b!307280))

(assert (not start!30624))

(assert (not b!307279))

(check-sat)

(pop 1)

(push 1)

(check-sat)

