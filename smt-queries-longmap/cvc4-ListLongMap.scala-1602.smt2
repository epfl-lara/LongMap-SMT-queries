; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30288 () Bool)

(assert start!30288)

(declare-fun b!303180 () Bool)

(declare-fun e!190885 () Bool)

(declare-fun e!190884 () Bool)

(assert (=> b!303180 (= e!190885 e!190884)))

(declare-fun res!160670 () Bool)

(assert (=> b!303180 (=> (not res!160670) (not e!190884))))

(declare-datatypes ((array!15394 0))(
  ( (array!15395 (arr!7285 (Array (_ BitVec 32) (_ BitVec 64))) (size!7637 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15394)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2425 0))(
  ( (MissingZero!2425 (index!11876 (_ BitVec 32))) (Found!2425 (index!11877 (_ BitVec 32))) (Intermediate!2425 (undefined!3237 Bool) (index!11878 (_ BitVec 32)) (x!30138 (_ BitVec 32))) (Undefined!2425) (MissingVacant!2425 (index!11879 (_ BitVec 32))) )
))
(declare-fun lt!150177 () SeekEntryResult!2425)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15394 (_ BitVec 32)) SeekEntryResult!2425)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!303180 (= res!160670 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!150177))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!303180 (= lt!150177 (Intermediate!2425 false resIndex!52 resX!52))))

(declare-fun b!303181 () Bool)

(declare-fun res!160667 () Bool)

(assert (=> b!303181 (=> (not res!160667) (not e!190885))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15394 (_ BitVec 32)) SeekEntryResult!2425)

(assert (=> b!303181 (= res!160667 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2425 i!1240)))))

(declare-fun b!303182 () Bool)

(declare-fun res!160671 () Bool)

(assert (=> b!303182 (=> (not res!160671) (not e!190885))))

(assert (=> b!303182 (= res!160671 (and (= (size!7637 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7637 a!3293))))))

(declare-fun b!303183 () Bool)

(declare-fun res!160672 () Bool)

(assert (=> b!303183 (=> (not res!160672) (not e!190884))))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!303183 (= res!160672 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!150177))))

(declare-fun b!303184 () Bool)

(declare-fun res!160673 () Bool)

(assert (=> b!303184 (=> (not res!160673) (not e!190885))))

(declare-fun arrayContainsKey!0 (array!15394 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!303184 (= res!160673 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!303186 () Bool)

(declare-fun res!160666 () Bool)

(assert (=> b!303186 (=> (not res!160666) (not e!190885))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!303186 (= res!160666 (validKeyInArray!0 k!2441))))

(declare-fun b!303187 () Bool)

(declare-fun res!160668 () Bool)

(assert (=> b!303187 (=> (not res!160668) (not e!190884))))

(assert (=> b!303187 (= res!160668 (and (= (select (arr!7285 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7637 a!3293))))))

(declare-fun b!303188 () Bool)

(assert (=> b!303188 (= e!190884 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7285 a!3293) index!1781) k!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7285 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7285 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3709 #b00000000000000000000000000000000) (bvsge index!1781 (bvadd #b00000000000000000000000000000001 mask!3709))))))

(declare-fun b!303185 () Bool)

(declare-fun res!160674 () Bool)

(assert (=> b!303185 (=> (not res!160674) (not e!190885))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15394 (_ BitVec 32)) Bool)

(assert (=> b!303185 (= res!160674 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun res!160669 () Bool)

(assert (=> start!30288 (=> (not res!160669) (not e!190885))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30288 (= res!160669 (validMask!0 mask!3709))))

(assert (=> start!30288 e!190885))

(declare-fun array_inv!5248 (array!15394) Bool)

(assert (=> start!30288 (array_inv!5248 a!3293)))

(assert (=> start!30288 true))

(assert (= (and start!30288 res!160669) b!303182))

(assert (= (and b!303182 res!160671) b!303186))

(assert (= (and b!303186 res!160666) b!303184))

(assert (= (and b!303184 res!160673) b!303181))

(assert (= (and b!303181 res!160667) b!303185))

(assert (= (and b!303185 res!160674) b!303180))

(assert (= (and b!303180 res!160670) b!303187))

(assert (= (and b!303187 res!160668) b!303183))

(assert (= (and b!303183 res!160672) b!303188))

(declare-fun m!314575 () Bool)

(assert (=> b!303184 m!314575))

(declare-fun m!314577 () Bool)

(assert (=> b!303180 m!314577))

(assert (=> b!303180 m!314577))

(declare-fun m!314579 () Bool)

(assert (=> b!303180 m!314579))

(declare-fun m!314581 () Bool)

(assert (=> b!303185 m!314581))

(declare-fun m!314583 () Bool)

(assert (=> start!30288 m!314583))

(declare-fun m!314585 () Bool)

(assert (=> start!30288 m!314585))

(declare-fun m!314587 () Bool)

(assert (=> b!303186 m!314587))

(declare-fun m!314589 () Bool)

(assert (=> b!303188 m!314589))

(declare-fun m!314591 () Bool)

(assert (=> b!303183 m!314591))

(declare-fun m!314593 () Bool)

(assert (=> b!303181 m!314593))

(declare-fun m!314595 () Bool)

(assert (=> b!303187 m!314595))

(push 1)

(assert (not b!303181))

(assert (not b!303184))

(assert (not start!30288))

(assert (not b!303180))

(assert (not b!303185))

(assert (not b!303183))

(assert (not b!303186))

(check-sat)

(pop 1)

(push 1)

(check-sat)

