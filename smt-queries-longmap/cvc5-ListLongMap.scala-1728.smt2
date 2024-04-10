; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31820 () Bool)

(assert start!31820)

(declare-fun b!317942 () Bool)

(declare-fun res!172529 () Bool)

(declare-fun e!197617 () Bool)

(assert (=> b!317942 (=> (not res!172529) (not e!197617))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!317942 (= res!172529 (validKeyInArray!0 k!2441))))

(declare-fun b!317943 () Bool)

(declare-fun res!172522 () Bool)

(assert (=> b!317943 (=> (not res!172522) (not e!197617))))

(declare-datatypes ((array!16191 0))(
  ( (array!16192 (arr!7661 (Array (_ BitVec 32) (_ BitVec 64))) (size!8013 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16191)

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2801 0))(
  ( (MissingZero!2801 (index!13380 (_ BitVec 32))) (Found!2801 (index!13381 (_ BitVec 32))) (Intermediate!2801 (undefined!3613 Bool) (index!13382 (_ BitVec 32)) (x!31642 (_ BitVec 32))) (Undefined!2801) (MissingVacant!2801 (index!13383 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16191 (_ BitVec 32)) SeekEntryResult!2801)

(assert (=> b!317943 (= res!172522 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2801 i!1240)))))

(declare-fun b!317944 () Bool)

(declare-fun e!197618 () Bool)

(assert (=> b!317944 (= e!197618 (not true))))

(declare-fun e!197620 () Bool)

(assert (=> b!317944 e!197620))

(declare-fun res!172530 () Bool)

(assert (=> b!317944 (=> (not res!172530) (not e!197620))))

(declare-fun lt!155153 () SeekEntryResult!2801)

(declare-fun lt!155152 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16191 (_ BitVec 32)) SeekEntryResult!2801)

(assert (=> b!317944 (= res!172530 (= lt!155153 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155152 k!2441 a!3293 mask!3709)))))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!317944 (= lt!155152 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!317945 () Bool)

(declare-fun res!172525 () Bool)

(declare-fun e!197616 () Bool)

(assert (=> b!317945 (=> (not res!172525) (not e!197616))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!317945 (= res!172525 (and (= (select (arr!7661 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!8013 a!3293))))))

(declare-fun b!317946 () Bool)

(declare-fun res!172526 () Bool)

(assert (=> b!317946 (=> (not res!172526) (not e!197617))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16191 (_ BitVec 32)) Bool)

(assert (=> b!317946 (= res!172526 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!317947 () Bool)

(declare-fun res!172521 () Bool)

(assert (=> b!317947 (=> (not res!172521) (not e!197617))))

(assert (=> b!317947 (= res!172521 (and (= (size!8013 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!8013 a!3293))))))

(declare-fun res!172523 () Bool)

(assert (=> start!31820 (=> (not res!172523) (not e!197617))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31820 (= res!172523 (validMask!0 mask!3709))))

(assert (=> start!31820 e!197617))

(declare-fun array_inv!5624 (array!16191) Bool)

(assert (=> start!31820 (array_inv!5624 a!3293)))

(assert (=> start!31820 true))

(declare-fun b!317948 () Bool)

(assert (=> b!317948 (= e!197617 e!197616)))

(declare-fun res!172524 () Bool)

(assert (=> b!317948 (=> (not res!172524) (not e!197616))))

(declare-fun lt!155154 () SeekEntryResult!2801)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!317948 (= res!172524 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!155154))))

(assert (=> b!317948 (= lt!155154 (Intermediate!2801 false resIndex!52 resX!52))))

(declare-fun b!317949 () Bool)

(assert (=> b!317949 (= e!197616 e!197618)))

(declare-fun res!172527 () Bool)

(assert (=> b!317949 (=> (not res!172527) (not e!197618))))

(assert (=> b!317949 (= res!172527 (and (= lt!155153 lt!155154) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7661 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!317949 (= lt!155153 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!317950 () Bool)

(declare-fun lt!155151 () array!16191)

(assert (=> b!317950 (= e!197620 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!155151 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155152 k!2441 lt!155151 mask!3709)))))

(assert (=> b!317950 (= lt!155151 (array!16192 (store (arr!7661 a!3293) i!1240 k!2441) (size!8013 a!3293)))))

(declare-fun b!317951 () Bool)

(declare-fun res!172528 () Bool)

(assert (=> b!317951 (=> (not res!172528) (not e!197617))))

(declare-fun arrayContainsKey!0 (array!16191 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!317951 (= res!172528 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(assert (= (and start!31820 res!172523) b!317947))

(assert (= (and b!317947 res!172521) b!317942))

(assert (= (and b!317942 res!172529) b!317951))

(assert (= (and b!317951 res!172528) b!317943))

(assert (= (and b!317943 res!172522) b!317946))

(assert (= (and b!317946 res!172526) b!317948))

(assert (= (and b!317948 res!172524) b!317945))

(assert (= (and b!317945 res!172525) b!317949))

(assert (= (and b!317949 res!172527) b!317944))

(assert (= (and b!317944 res!172530) b!317950))

(declare-fun m!326609 () Bool)

(assert (=> b!317944 m!326609))

(declare-fun m!326611 () Bool)

(assert (=> b!317944 m!326611))

(declare-fun m!326613 () Bool)

(assert (=> b!317949 m!326613))

(declare-fun m!326615 () Bool)

(assert (=> b!317949 m!326615))

(declare-fun m!326617 () Bool)

(assert (=> b!317945 m!326617))

(declare-fun m!326619 () Bool)

(assert (=> start!31820 m!326619))

(declare-fun m!326621 () Bool)

(assert (=> start!31820 m!326621))

(declare-fun m!326623 () Bool)

(assert (=> b!317948 m!326623))

(assert (=> b!317948 m!326623))

(declare-fun m!326625 () Bool)

(assert (=> b!317948 m!326625))

(declare-fun m!326627 () Bool)

(assert (=> b!317946 m!326627))

(declare-fun m!326629 () Bool)

(assert (=> b!317943 m!326629))

(declare-fun m!326631 () Bool)

(assert (=> b!317950 m!326631))

(declare-fun m!326633 () Bool)

(assert (=> b!317950 m!326633))

(declare-fun m!326635 () Bool)

(assert (=> b!317950 m!326635))

(declare-fun m!326637 () Bool)

(assert (=> b!317951 m!326637))

(declare-fun m!326639 () Bool)

(assert (=> b!317942 m!326639))

(push 1)

