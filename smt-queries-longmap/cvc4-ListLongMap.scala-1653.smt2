; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30756 () Bool)

(assert start!30756)

(declare-fun b!308580 () Bool)

(declare-fun e!192932 () Bool)

(declare-fun e!192931 () Bool)

(assert (=> b!308580 (= e!192932 e!192931)))

(declare-fun res!165193 () Bool)

(assert (=> b!308580 (=> (not res!165193) (not e!192931))))

(declare-datatypes ((array!15709 0))(
  ( (array!15710 (arr!7438 (Array (_ BitVec 32) (_ BitVec 64))) (size!7790 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15709)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2578 0))(
  ( (MissingZero!2578 (index!12488 (_ BitVec 32))) (Found!2578 (index!12489 (_ BitVec 32))) (Intermediate!2578 (undefined!3390 Bool) (index!12490 (_ BitVec 32)) (x!30726 (_ BitVec 32))) (Undefined!2578) (MissingVacant!2578 (index!12491 (_ BitVec 32))) )
))
(declare-fun lt!151398 () SeekEntryResult!2578)

(declare-fun lt!151397 () SeekEntryResult!2578)

(assert (=> b!308580 (= res!165193 (and (= lt!151398 lt!151397) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7438 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15709 (_ BitVec 32)) SeekEntryResult!2578)

(assert (=> b!308580 (= lt!151398 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun res!165195 () Bool)

(declare-fun e!192933 () Bool)

(assert (=> start!30756 (=> (not res!165195) (not e!192933))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30756 (= res!165195 (validMask!0 mask!3709))))

(assert (=> start!30756 e!192933))

(declare-fun array_inv!5401 (array!15709) Bool)

(assert (=> start!30756 (array_inv!5401 a!3293)))

(assert (=> start!30756 true))

(declare-fun b!308581 () Bool)

(declare-fun res!165194 () Bool)

(assert (=> b!308581 (=> (not res!165194) (not e!192932))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!308581 (= res!165194 (and (= (select (arr!7438 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7790 a!3293))))))

(declare-fun b!308582 () Bool)

(declare-fun res!165196 () Bool)

(assert (=> b!308582 (=> (not res!165196) (not e!192933))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15709 (_ BitVec 32)) Bool)

(assert (=> b!308582 (= res!165196 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!308583 () Bool)

(declare-fun res!165199 () Bool)

(assert (=> b!308583 (=> (not res!165199) (not e!192933))))

(assert (=> b!308583 (= res!165199 (and (= (size!7790 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7790 a!3293))))))

(declare-fun b!308584 () Bool)

(declare-fun res!165201 () Bool)

(assert (=> b!308584 (=> (not res!165201) (not e!192933))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15709 (_ BitVec 32)) SeekEntryResult!2578)

(assert (=> b!308584 (= res!165201 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2578 i!1240)))))

(declare-fun b!308585 () Bool)

(assert (=> b!308585 (= e!192933 e!192932)))

(declare-fun res!165198 () Bool)

(assert (=> b!308585 (=> (not res!165198) (not e!192932))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308585 (= res!165198 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!151397))))

(assert (=> b!308585 (= lt!151397 (Intermediate!2578 false resIndex!52 resX!52))))

(declare-fun b!308586 () Bool)

(declare-fun res!165197 () Bool)

(assert (=> b!308586 (=> (not res!165197) (not e!192933))))

(declare-fun arrayContainsKey!0 (array!15709 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!308586 (= res!165197 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!308587 () Bool)

(declare-fun res!165200 () Bool)

(assert (=> b!308587 (=> (not res!165200) (not e!192933))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!308587 (= res!165200 (validKeyInArray!0 k!2441))))

(declare-fun b!308588 () Bool)

(assert (=> b!308588 (= e!192931 (not true))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308588 (= lt!151398 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(assert (= (and start!30756 res!165195) b!308583))

(assert (= (and b!308583 res!165199) b!308587))

(assert (= (and b!308587 res!165200) b!308586))

(assert (= (and b!308586 res!165197) b!308584))

(assert (= (and b!308584 res!165201) b!308582))

(assert (= (and b!308582 res!165196) b!308585))

(assert (= (and b!308585 res!165198) b!308581))

(assert (= (and b!308581 res!165194) b!308580))

(assert (= (and b!308580 res!165193) b!308588))

(declare-fun m!318615 () Bool)

(assert (=> b!308586 m!318615))

(declare-fun m!318617 () Bool)

(assert (=> b!308580 m!318617))

(declare-fun m!318619 () Bool)

(assert (=> b!308580 m!318619))

(declare-fun m!318621 () Bool)

(assert (=> b!308585 m!318621))

(assert (=> b!308585 m!318621))

(declare-fun m!318623 () Bool)

(assert (=> b!308585 m!318623))

(declare-fun m!318625 () Bool)

(assert (=> b!308581 m!318625))

(declare-fun m!318627 () Bool)

(assert (=> b!308584 m!318627))

(declare-fun m!318629 () Bool)

(assert (=> b!308587 m!318629))

(declare-fun m!318631 () Bool)

(assert (=> b!308582 m!318631))

(declare-fun m!318633 () Bool)

(assert (=> b!308588 m!318633))

(assert (=> b!308588 m!318633))

(declare-fun m!318635 () Bool)

(assert (=> b!308588 m!318635))

(declare-fun m!318637 () Bool)

(assert (=> start!30756 m!318637))

(declare-fun m!318639 () Bool)

(assert (=> start!30756 m!318639))

(push 1)

(assert (not b!308588))

(assert (not b!308585))

(assert (not b!308582))

(assert (not b!308584))

(assert (not b!308587))

(assert (not b!308586))

(assert (not b!308580))

