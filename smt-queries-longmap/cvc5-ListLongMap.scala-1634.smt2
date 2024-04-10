; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30584 () Bool)

(assert start!30584)

(declare-fun b!306628 () Bool)

(declare-fun res!163485 () Bool)

(declare-fun e!192248 () Bool)

(assert (=> b!306628 (=> (not res!163485) (not e!192248))))

(declare-datatypes ((array!15588 0))(
  ( (array!15589 (arr!7379 (Array (_ BitVec 32) (_ BitVec 64))) (size!7731 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15588)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2519 0))(
  ( (MissingZero!2519 (index!12252 (_ BitVec 32))) (Found!2519 (index!12253 (_ BitVec 32))) (Intermediate!2519 (undefined!3331 Bool) (index!12254 (_ BitVec 32)) (x!30506 (_ BitVec 32))) (Undefined!2519) (MissingVacant!2519 (index!12255 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15588 (_ BitVec 32)) SeekEntryResult!2519)

(assert (=> b!306628 (= res!163485 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2519 i!1240)))))

(declare-fun b!306629 () Bool)

(declare-fun res!163486 () Bool)

(assert (=> b!306629 (=> (not res!163486) (not e!192248))))

(declare-fun arrayContainsKey!0 (array!15588 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!306629 (= res!163486 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!306630 () Bool)

(assert (=> b!306630 false))

(declare-datatypes ((Unit!9536 0))(
  ( (Unit!9537) )
))
(declare-fun e!192246 () Unit!9536)

(declare-fun Unit!9538 () Unit!9536)

(assert (=> b!306630 (= e!192246 Unit!9538)))

(declare-fun b!306631 () Bool)

(declare-fun res!163484 () Bool)

(declare-fun e!192247 () Bool)

(assert (=> b!306631 (=> (not res!163484) (not e!192247))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!306631 (= res!163484 (and (= (select (arr!7379 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7731 a!3293))))))

(declare-fun b!306632 () Bool)

(declare-fun res!163482 () Bool)

(assert (=> b!306632 (=> (not res!163482) (not e!192248))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!306632 (= res!163482 (validKeyInArray!0 k!2441))))

(declare-fun b!306633 () Bool)

(declare-fun res!163488 () Bool)

(assert (=> b!306633 (=> (not res!163488) (not e!192247))))

(declare-fun lt!151004 () SeekEntryResult!2519)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15588 (_ BitVec 32)) SeekEntryResult!2519)

(assert (=> b!306633 (= res!163488 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!151004))))

(declare-fun b!306634 () Bool)

(assert (=> b!306634 false))

(declare-fun lt!151003 () SeekEntryResult!2519)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!306634 (= lt!151003 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun Unit!9539 () Unit!9536)

(assert (=> b!306634 (= e!192246 Unit!9539)))

(declare-fun b!306635 () Bool)

(declare-fun res!163491 () Bool)

(assert (=> b!306635 (=> (not res!163491) (not e!192247))))

(assert (=> b!306635 (= res!163491 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7379 a!3293) index!1781) k!2441)) (= x!1427 resX!52)))))

(declare-fun b!306637 () Bool)

(declare-fun res!163489 () Bool)

(assert (=> b!306637 (=> (not res!163489) (not e!192248))))

(assert (=> b!306637 (= res!163489 (and (= (size!7731 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7731 a!3293))))))

(declare-fun b!306638 () Bool)

(declare-fun res!163490 () Bool)

(assert (=> b!306638 (=> (not res!163490) (not e!192248))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15588 (_ BitVec 32)) Bool)

(assert (=> b!306638 (= res!163490 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!306639 () Bool)

(assert (=> b!306639 (= e!192247 (not (or (not (= (select (arr!7379 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!3709 #b00000000000000000000000000000000) (bvslt index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)))))))

(assert (=> b!306639 (= index!1781 resIndex!52)))

(declare-fun lt!151005 () Unit!9536)

(declare-fun e!192249 () Unit!9536)

(assert (=> b!306639 (= lt!151005 e!192249)))

(declare-fun c!49175 () Bool)

(assert (=> b!306639 (= c!49175 (not (= resIndex!52 index!1781)))))

(declare-fun b!306640 () Bool)

(assert (=> b!306640 (= e!192248 e!192247)))

(declare-fun res!163487 () Bool)

(assert (=> b!306640 (=> (not res!163487) (not e!192247))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!306640 (= res!163487 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!151004))))

(assert (=> b!306640 (= lt!151004 (Intermediate!2519 false resIndex!52 resX!52))))

(declare-fun b!306641 () Bool)

(declare-fun Unit!9540 () Unit!9536)

(assert (=> b!306641 (= e!192249 Unit!9540)))

(declare-fun res!163483 () Bool)

(assert (=> start!30584 (=> (not res!163483) (not e!192248))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30584 (= res!163483 (validMask!0 mask!3709))))

(assert (=> start!30584 e!192248))

(declare-fun array_inv!5342 (array!15588) Bool)

(assert (=> start!30584 (array_inv!5342 a!3293)))

(assert (=> start!30584 true))

(declare-fun b!306636 () Bool)

(assert (=> b!306636 (= e!192249 e!192246)))

(declare-fun c!49176 () Bool)

(assert (=> b!306636 (= c!49176 (or (= (select (arr!7379 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7379 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!30584 res!163483) b!306637))

(assert (= (and b!306637 res!163489) b!306632))

(assert (= (and b!306632 res!163482) b!306629))

(assert (= (and b!306629 res!163486) b!306628))

(assert (= (and b!306628 res!163485) b!306638))

(assert (= (and b!306638 res!163490) b!306640))

(assert (= (and b!306640 res!163487) b!306631))

(assert (= (and b!306631 res!163484) b!306633))

(assert (= (and b!306633 res!163488) b!306635))

(assert (= (and b!306635 res!163491) b!306639))

(assert (= (and b!306639 c!49175) b!306636))

(assert (= (and b!306639 (not c!49175)) b!306641))

(assert (= (and b!306636 c!49176) b!306630))

(assert (= (and b!306636 (not c!49176)) b!306634))

(declare-fun m!317147 () Bool)

(assert (=> b!306640 m!317147))

(assert (=> b!306640 m!317147))

(declare-fun m!317149 () Bool)

(assert (=> b!306640 m!317149))

(declare-fun m!317151 () Bool)

(assert (=> b!306636 m!317151))

(declare-fun m!317153 () Bool)

(assert (=> b!306629 m!317153))

(declare-fun m!317155 () Bool)

(assert (=> start!30584 m!317155))

(declare-fun m!317157 () Bool)

(assert (=> start!30584 m!317157))

(declare-fun m!317159 () Bool)

(assert (=> b!306638 m!317159))

(declare-fun m!317161 () Bool)

(assert (=> b!306631 m!317161))

(declare-fun m!317163 () Bool)

(assert (=> b!306634 m!317163))

(assert (=> b!306634 m!317163))

(declare-fun m!317165 () Bool)

(assert (=> b!306634 m!317165))

(declare-fun m!317167 () Bool)

(assert (=> b!306633 m!317167))

(assert (=> b!306639 m!317151))

(declare-fun m!317169 () Bool)

(assert (=> b!306632 m!317169))

(declare-fun m!317171 () Bool)

(assert (=> b!306628 m!317171))

(assert (=> b!306635 m!317151))

(push 1)

(assert (not b!306633))

(assert (not b!306628))

(assert (not start!30584))

(assert (not b!306629))

(assert (not b!306632))

(assert (not b!306634))

(assert (not b!306638))

(assert (not b!306640))

(check-sat)

(pop 1)

(push 1)

(check-sat)

