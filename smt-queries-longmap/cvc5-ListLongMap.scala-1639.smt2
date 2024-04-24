; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30604 () Bool)

(assert start!30604)

(declare-fun res!163953 () Bool)

(declare-fun e!192398 () Bool)

(assert (=> start!30604 (=> (not res!163953) (not e!192398))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30604 (= res!163953 (validMask!0 mask!3709))))

(assert (=> start!30604 e!192398))

(declare-datatypes ((array!15621 0))(
  ( (array!15622 (arr!7395 (Array (_ BitVec 32) (_ BitVec 64))) (size!7747 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15621)

(declare-fun array_inv!5345 (array!15621) Bool)

(assert (=> start!30604 (array_inv!5345 a!3293)))

(assert (=> start!30604 true))

(declare-fun b!307142 () Bool)

(declare-fun res!163949 () Bool)

(assert (=> b!307142 (=> (not res!163949) (not e!192398))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15621 (_ BitVec 32)) Bool)

(assert (=> b!307142 (= res!163949 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!307143 () Bool)

(declare-fun res!163950 () Bool)

(assert (=> b!307143 (=> (not res!163950) (not e!192398))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2500 0))(
  ( (MissingZero!2500 (index!12176 (_ BitVec 32))) (Found!2500 (index!12177 (_ BitVec 32))) (Intermediate!2500 (undefined!3312 Bool) (index!12178 (_ BitVec 32)) (x!30524 (_ BitVec 32))) (Undefined!2500) (MissingVacant!2500 (index!12179 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15621 (_ BitVec 32)) SeekEntryResult!2500)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!307143 (= res!163950 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) (Intermediate!2500 false resIndex!52 resX!52)))))

(declare-fun b!307144 () Bool)

(declare-fun res!163946 () Bool)

(assert (=> b!307144 (=> (not res!163946) (not e!192398))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!307144 (= res!163946 (and (= (select (arr!7395 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7747 a!3293))))))

(declare-fun b!307145 () Bool)

(declare-fun res!163952 () Bool)

(assert (=> b!307145 (=> (not res!163952) (not e!192398))))

(assert (=> b!307145 (= res!163952 (and (= (size!7747 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7747 a!3293))))))

(declare-fun b!307146 () Bool)

(declare-fun res!163951 () Bool)

(assert (=> b!307146 (=> (not res!163951) (not e!192398))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15621 (_ BitVec 32)) SeekEntryResult!2500)

(assert (=> b!307146 (= res!163951 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2500 i!1240)))))

(declare-fun b!307147 () Bool)

(declare-fun res!163948 () Bool)

(assert (=> b!307147 (=> (not res!163948) (not e!192398))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!307147 (= res!163948 (validKeyInArray!0 k!2441))))

(declare-fun b!307148 () Bool)

(assert (=> b!307148 (= e!192398 false)))

(declare-fun lt!151122 () SeekEntryResult!2500)

(assert (=> b!307148 (= lt!151122 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!307149 () Bool)

(declare-fun res!163947 () Bool)

(assert (=> b!307149 (=> (not res!163947) (not e!192398))))

(declare-fun arrayContainsKey!0 (array!15621 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!307149 (= res!163947 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(assert (= (and start!30604 res!163953) b!307145))

(assert (= (and b!307145 res!163952) b!307147))

(assert (= (and b!307147 res!163948) b!307149))

(assert (= (and b!307149 res!163947) b!307146))

(assert (= (and b!307146 res!163951) b!307142))

(assert (= (and b!307142 res!163949) b!307143))

(assert (= (and b!307143 res!163950) b!307144))

(assert (= (and b!307144 res!163946) b!307148))

(declare-fun m!317669 () Bool)

(assert (=> b!307147 m!317669))

(declare-fun m!317671 () Bool)

(assert (=> start!30604 m!317671))

(declare-fun m!317673 () Bool)

(assert (=> start!30604 m!317673))

(declare-fun m!317675 () Bool)

(assert (=> b!307143 m!317675))

(assert (=> b!307143 m!317675))

(declare-fun m!317677 () Bool)

(assert (=> b!307143 m!317677))

(declare-fun m!317679 () Bool)

(assert (=> b!307144 m!317679))

(declare-fun m!317681 () Bool)

(assert (=> b!307148 m!317681))

(declare-fun m!317683 () Bool)

(assert (=> b!307149 m!317683))

(declare-fun m!317685 () Bool)

(assert (=> b!307146 m!317685))

(declare-fun m!317687 () Bool)

(assert (=> b!307142 m!317687))

(push 1)

(assert (not b!307148))

(assert (not b!307149))

(assert (not start!30604))

(assert (not b!307142))

(assert (not b!307143))

(assert (not b!307147))

(assert (not b!307146))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

