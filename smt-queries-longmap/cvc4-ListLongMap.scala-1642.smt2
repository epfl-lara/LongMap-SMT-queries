; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30636 () Bool)

(assert start!30636)

(declare-fun b!307429 () Bool)

(declare-fun e!192505 () Bool)

(assert (=> b!307429 (= e!192505 false)))

(declare-datatypes ((array!15640 0))(
  ( (array!15641 (arr!7405 (Array (_ BitVec 32) (_ BitVec 64))) (size!7757 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15640)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2545 0))(
  ( (MissingZero!2545 (index!12356 (_ BitVec 32))) (Found!2545 (index!12357 (_ BitVec 32))) (Intermediate!2545 (undefined!3357 Bool) (index!12358 (_ BitVec 32)) (x!30596 (_ BitVec 32))) (Undefined!2545) (MissingVacant!2545 (index!12359 (_ BitVec 32))) )
))
(declare-fun lt!151131 () SeekEntryResult!2545)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15640 (_ BitVec 32)) SeekEntryResult!2545)

(assert (=> b!307429 (= lt!151131 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!307430 () Bool)

(declare-fun res!164184 () Bool)

(assert (=> b!307430 (=> (not res!164184) (not e!192505))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!307430 (= res!164184 (and (= (size!7757 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7757 a!3293))))))

(declare-fun b!307431 () Bool)

(declare-fun res!164187 () Bool)

(assert (=> b!307431 (=> (not res!164187) (not e!192505))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!307431 (= res!164187 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) (Intermediate!2545 false resIndex!52 resX!52)))))

(declare-fun b!307432 () Bool)

(declare-fun res!164188 () Bool)

(assert (=> b!307432 (=> (not res!164188) (not e!192505))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15640 (_ BitVec 32)) Bool)

(assert (=> b!307432 (= res!164188 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!307433 () Bool)

(declare-fun res!164186 () Bool)

(assert (=> b!307433 (=> (not res!164186) (not e!192505))))

(declare-fun arrayContainsKey!0 (array!15640 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!307433 (= res!164186 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!307434 () Bool)

(declare-fun res!164183 () Bool)

(assert (=> b!307434 (=> (not res!164183) (not e!192505))))

(assert (=> b!307434 (= res!164183 (and (= (select (arr!7405 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7757 a!3293))))))

(declare-fun res!164185 () Bool)

(assert (=> start!30636 (=> (not res!164185) (not e!192505))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30636 (= res!164185 (validMask!0 mask!3709))))

(assert (=> start!30636 e!192505))

(declare-fun array_inv!5368 (array!15640) Bool)

(assert (=> start!30636 (array_inv!5368 a!3293)))

(assert (=> start!30636 true))

(declare-fun b!307435 () Bool)

(declare-fun res!164190 () Bool)

(assert (=> b!307435 (=> (not res!164190) (not e!192505))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!307435 (= res!164190 (validKeyInArray!0 k!2441))))

(declare-fun b!307436 () Bool)

(declare-fun res!164189 () Bool)

(assert (=> b!307436 (=> (not res!164189) (not e!192505))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15640 (_ BitVec 32)) SeekEntryResult!2545)

(assert (=> b!307436 (= res!164189 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2545 i!1240)))))

(assert (= (and start!30636 res!164185) b!307430))

(assert (= (and b!307430 res!164184) b!307435))

(assert (= (and b!307435 res!164190) b!307433))

(assert (= (and b!307433 res!164186) b!307436))

(assert (= (and b!307436 res!164189) b!307432))

(assert (= (and b!307432 res!164188) b!307431))

(assert (= (and b!307431 res!164187) b!307434))

(assert (= (and b!307434 res!164183) b!307429))

(declare-fun m!317739 () Bool)

(assert (=> b!307433 m!317739))

(declare-fun m!317741 () Bool)

(assert (=> b!307434 m!317741))

(declare-fun m!317743 () Bool)

(assert (=> b!307432 m!317743))

(declare-fun m!317745 () Bool)

(assert (=> b!307436 m!317745))

(declare-fun m!317747 () Bool)

(assert (=> b!307435 m!317747))

(declare-fun m!317749 () Bool)

(assert (=> b!307431 m!317749))

(assert (=> b!307431 m!317749))

(declare-fun m!317751 () Bool)

(assert (=> b!307431 m!317751))

(declare-fun m!317753 () Bool)

(assert (=> b!307429 m!317753))

(declare-fun m!317755 () Bool)

(assert (=> start!30636 m!317755))

(declare-fun m!317757 () Bool)

(assert (=> start!30636 m!317757))

(push 1)

(assert (not start!30636))

(assert (not b!307429))

(assert (not b!307435))

(assert (not b!307436))

(assert (not b!307431))

(assert (not b!307433))

(assert (not b!307432))

(check-sat)

