; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30618 () Bool)

(assert start!30618)

(declare-fun b!307195 () Bool)

(declare-fun res!163952 () Bool)

(declare-fun e!192432 () Bool)

(assert (=> b!307195 (=> (not res!163952) (not e!192432))))

(declare-datatypes ((array!15622 0))(
  ( (array!15623 (arr!7396 (Array (_ BitVec 32) (_ BitVec 64))) (size!7748 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15622)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2536 0))(
  ( (MissingZero!2536 (index!12320 (_ BitVec 32))) (Found!2536 (index!12321 (_ BitVec 32))) (Intermediate!2536 (undefined!3348 Bool) (index!12322 (_ BitVec 32)) (x!30563 (_ BitVec 32))) (Undefined!2536) (MissingVacant!2536 (index!12323 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15622 (_ BitVec 32)) SeekEntryResult!2536)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!307195 (= res!163952 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) (Intermediate!2536 false resIndex!52 resX!52)))))

(declare-fun b!307196 () Bool)

(declare-fun res!163951 () Bool)

(assert (=> b!307196 (=> (not res!163951) (not e!192432))))

(declare-fun arrayContainsKey!0 (array!15622 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!307196 (= res!163951 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!307197 () Bool)

(declare-fun res!163949 () Bool)

(assert (=> b!307197 (=> (not res!163949) (not e!192432))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15622 (_ BitVec 32)) SeekEntryResult!2536)

(assert (=> b!307197 (= res!163949 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2536 i!1240)))))

(declare-fun b!307198 () Bool)

(declare-fun res!163955 () Bool)

(assert (=> b!307198 (=> (not res!163955) (not e!192432))))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(assert (=> b!307198 (= res!163955 (and (= (select (arr!7396 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7748 a!3293))))))

(declare-fun b!307199 () Bool)

(declare-fun res!163956 () Bool)

(assert (=> b!307199 (=> (not res!163956) (not e!192432))))

(assert (=> b!307199 (= res!163956 (and (= (size!7748 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7748 a!3293))))))

(declare-fun b!307200 () Bool)

(declare-fun res!163953 () Bool)

(assert (=> b!307200 (=> (not res!163953) (not e!192432))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15622 (_ BitVec 32)) Bool)

(assert (=> b!307200 (= res!163953 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!307201 () Bool)

(assert (=> b!307201 (= e!192432 false)))

(declare-fun lt!151104 () SeekEntryResult!2536)

(assert (=> b!307201 (= lt!151104 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun res!163950 () Bool)

(assert (=> start!30618 (=> (not res!163950) (not e!192432))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30618 (= res!163950 (validMask!0 mask!3709))))

(assert (=> start!30618 e!192432))

(declare-fun array_inv!5359 (array!15622) Bool)

(assert (=> start!30618 (array_inv!5359 a!3293)))

(assert (=> start!30618 true))

(declare-fun b!307202 () Bool)

(declare-fun res!163954 () Bool)

(assert (=> b!307202 (=> (not res!163954) (not e!192432))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!307202 (= res!163954 (validKeyInArray!0 k!2441))))

(assert (= (and start!30618 res!163950) b!307199))

(assert (= (and b!307199 res!163956) b!307202))

(assert (= (and b!307202 res!163954) b!307196))

(assert (= (and b!307196 res!163951) b!307197))

(assert (= (and b!307197 res!163949) b!307200))

(assert (= (and b!307200 res!163953) b!307195))

(assert (= (and b!307195 res!163952) b!307198))

(assert (= (and b!307198 res!163955) b!307201))

(declare-fun m!317547 () Bool)

(assert (=> b!307202 m!317547))

(declare-fun m!317549 () Bool)

(assert (=> b!307197 m!317549))

(declare-fun m!317551 () Bool)

(assert (=> b!307198 m!317551))

(declare-fun m!317553 () Bool)

(assert (=> b!307195 m!317553))

(assert (=> b!307195 m!317553))

(declare-fun m!317555 () Bool)

(assert (=> b!307195 m!317555))

(declare-fun m!317557 () Bool)

(assert (=> b!307201 m!317557))

(declare-fun m!317559 () Bool)

(assert (=> b!307196 m!317559))

(declare-fun m!317561 () Bool)

(assert (=> b!307200 m!317561))

(declare-fun m!317563 () Bool)

(assert (=> start!30618 m!317563))

(declare-fun m!317565 () Bool)

(assert (=> start!30618 m!317565))

(push 1)

(assert (not b!307201))

(assert (not b!307196))

(assert (not b!307200))

(assert (not b!307197))

(assert (not start!30618))

(assert (not b!307202))

(assert (not b!307195))

(check-sat)

