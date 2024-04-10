; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30750 () Bool)

(assert start!30750)

(declare-fun res!165111 () Bool)

(declare-fun e!192898 () Bool)

(assert (=> start!30750 (=> (not res!165111) (not e!192898))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30750 (= res!165111 (validMask!0 mask!3709))))

(assert (=> start!30750 e!192898))

(declare-datatypes ((array!15703 0))(
  ( (array!15704 (arr!7435 (Array (_ BitVec 32) (_ BitVec 64))) (size!7787 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15703)

(declare-fun array_inv!5398 (array!15703) Bool)

(assert (=> start!30750 (array_inv!5398 a!3293)))

(assert (=> start!30750 true))

(declare-fun b!308498 () Bool)

(declare-fun res!165114 () Bool)

(assert (=> b!308498 (=> (not res!165114) (not e!192898))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2575 0))(
  ( (MissingZero!2575 (index!12476 (_ BitVec 32))) (Found!2575 (index!12477 (_ BitVec 32))) (Intermediate!2575 (undefined!3387 Bool) (index!12478 (_ BitVec 32)) (x!30715 (_ BitVec 32))) (Undefined!2575) (MissingVacant!2575 (index!12479 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15703 (_ BitVec 32)) SeekEntryResult!2575)

(assert (=> b!308498 (= res!165114 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2575 i!1240)))))

(declare-fun b!308499 () Bool)

(declare-fun res!165118 () Bool)

(assert (=> b!308499 (=> (not res!165118) (not e!192898))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!308499 (= res!165118 (validKeyInArray!0 k!2441))))

(declare-fun b!308500 () Bool)

(declare-fun e!192896 () Bool)

(assert (=> b!308500 (= e!192898 e!192896)))

(declare-fun res!165115 () Bool)

(assert (=> b!308500 (=> (not res!165115) (not e!192896))))

(declare-fun lt!151380 () SeekEntryResult!2575)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15703 (_ BitVec 32)) SeekEntryResult!2575)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308500 (= res!165115 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!151380))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!308500 (= lt!151380 (Intermediate!2575 false resIndex!52 resX!52))))

(declare-fun b!308501 () Bool)

(declare-fun res!165116 () Bool)

(assert (=> b!308501 (=> (not res!165116) (not e!192896))))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!308501 (= res!165116 (and (= (select (arr!7435 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7787 a!3293))))))

(declare-fun b!308502 () Bool)

(declare-fun res!165119 () Bool)

(assert (=> b!308502 (=> (not res!165119) (not e!192896))))

(assert (=> b!308502 (= res!165119 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7435 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(declare-fun b!308503 () Bool)

(declare-fun res!165112 () Bool)

(assert (=> b!308503 (=> (not res!165112) (not e!192896))))

(assert (=> b!308503 (= res!165112 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!151380))))

(declare-fun b!308504 () Bool)

(declare-fun res!165120 () Bool)

(assert (=> b!308504 (=> (not res!165120) (not e!192898))))

(assert (=> b!308504 (= res!165120 (and (= (size!7787 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7787 a!3293))))))

(declare-fun b!308505 () Bool)

(assert (=> b!308505 (= e!192896 false)))

(declare-fun lt!151379 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308505 (= lt!151379 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!308506 () Bool)

(declare-fun res!165117 () Bool)

(assert (=> b!308506 (=> (not res!165117) (not e!192898))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15703 (_ BitVec 32)) Bool)

(assert (=> b!308506 (= res!165117 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!308507 () Bool)

(declare-fun res!165113 () Bool)

(assert (=> b!308507 (=> (not res!165113) (not e!192898))))

(declare-fun arrayContainsKey!0 (array!15703 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!308507 (= res!165113 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(assert (= (and start!30750 res!165111) b!308504))

(assert (= (and b!308504 res!165120) b!308499))

(assert (= (and b!308499 res!165118) b!308507))

(assert (= (and b!308507 res!165113) b!308498))

(assert (= (and b!308498 res!165114) b!308506))

(assert (= (and b!308506 res!165117) b!308500))

(assert (= (and b!308500 res!165115) b!308501))

(assert (= (and b!308501 res!165116) b!308503))

(assert (= (and b!308503 res!165112) b!308502))

(assert (= (and b!308502 res!165119) b!308505))

(declare-fun m!318539 () Bool)

(assert (=> b!308506 m!318539))

(declare-fun m!318541 () Bool)

(assert (=> b!308507 m!318541))

(declare-fun m!318543 () Bool)

(assert (=> b!308505 m!318543))

(declare-fun m!318545 () Bool)

(assert (=> b!308498 m!318545))

(declare-fun m!318547 () Bool)

(assert (=> b!308503 m!318547))

(declare-fun m!318549 () Bool)

(assert (=> b!308501 m!318549))

(declare-fun m!318551 () Bool)

(assert (=> b!308500 m!318551))

(assert (=> b!308500 m!318551))

(declare-fun m!318553 () Bool)

(assert (=> b!308500 m!318553))

(declare-fun m!318555 () Bool)

(assert (=> b!308502 m!318555))

(declare-fun m!318557 () Bool)

(assert (=> b!308499 m!318557))

(declare-fun m!318559 () Bool)

(assert (=> start!30750 m!318559))

(declare-fun m!318561 () Bool)

(assert (=> start!30750 m!318561))

(push 1)

(assert (not b!308499))

