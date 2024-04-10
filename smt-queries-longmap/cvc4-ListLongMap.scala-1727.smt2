; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31818 () Bool)

(assert start!31818)

(declare-fun b!317912 () Bool)

(declare-fun e!197604 () Bool)

(assert (=> b!317912 (= e!197604 (not true))))

(declare-fun e!197603 () Bool)

(assert (=> b!317912 e!197603))

(declare-fun res!172492 () Bool)

(assert (=> b!317912 (=> (not res!172492) (not e!197603))))

(declare-datatypes ((array!16189 0))(
  ( (array!16190 (arr!7660 (Array (_ BitVec 32) (_ BitVec 64))) (size!8012 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16189)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun lt!155142 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun x!1427 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2800 0))(
  ( (MissingZero!2800 (index!13376 (_ BitVec 32))) (Found!2800 (index!13377 (_ BitVec 32))) (Intermediate!2800 (undefined!3612 Bool) (index!13378 (_ BitVec 32)) (x!31633 (_ BitVec 32))) (Undefined!2800) (MissingVacant!2800 (index!13379 (_ BitVec 32))) )
))
(declare-fun lt!155140 () SeekEntryResult!2800)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16189 (_ BitVec 32)) SeekEntryResult!2800)

(assert (=> b!317912 (= res!172492 (= lt!155140 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155142 k!2441 a!3293 mask!3709)))))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!317912 (= lt!155142 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!317913 () Bool)

(declare-fun res!172493 () Bool)

(declare-fun e!197605 () Bool)

(assert (=> b!317913 (=> (not res!172493) (not e!197605))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!317913 (= res!172493 (and (= (size!8012 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!8012 a!3293))))))

(declare-fun b!317914 () Bool)

(declare-fun e!197602 () Bool)

(assert (=> b!317914 (= e!197605 e!197602)))

(declare-fun res!172498 () Bool)

(assert (=> b!317914 (=> (not res!172498) (not e!197602))))

(declare-fun lt!155141 () SeekEntryResult!2800)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!317914 (= res!172498 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!155141))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!317914 (= lt!155141 (Intermediate!2800 false resIndex!52 resX!52))))

(declare-fun b!317915 () Bool)

(declare-fun res!172499 () Bool)

(assert (=> b!317915 (=> (not res!172499) (not e!197605))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!317915 (= res!172499 (validKeyInArray!0 k!2441))))

(declare-fun res!172497 () Bool)

(assert (=> start!31818 (=> (not res!172497) (not e!197605))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31818 (= res!172497 (validMask!0 mask!3709))))

(assert (=> start!31818 e!197605))

(declare-fun array_inv!5623 (array!16189) Bool)

(assert (=> start!31818 (array_inv!5623 a!3293)))

(assert (=> start!31818 true))

(declare-fun b!317916 () Bool)

(assert (=> b!317916 (= e!197602 e!197604)))

(declare-fun res!172494 () Bool)

(assert (=> b!317916 (=> (not res!172494) (not e!197604))))

(assert (=> b!317916 (= res!172494 (and (= lt!155140 lt!155141) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7660 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!317916 (= lt!155140 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!317917 () Bool)

(declare-fun res!172500 () Bool)

(assert (=> b!317917 (=> (not res!172500) (not e!197605))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16189 (_ BitVec 32)) SeekEntryResult!2800)

(assert (=> b!317917 (= res!172500 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2800 i!1240)))))

(declare-fun b!317918 () Bool)

(declare-fun res!172496 () Bool)

(assert (=> b!317918 (=> (not res!172496) (not e!197605))))

(declare-fun arrayContainsKey!0 (array!16189 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!317918 (= res!172496 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun lt!155139 () array!16189)

(declare-fun b!317919 () Bool)

(assert (=> b!317919 (= e!197603 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!155139 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155142 k!2441 lt!155139 mask!3709)))))

(assert (=> b!317919 (= lt!155139 (array!16190 (store (arr!7660 a!3293) i!1240 k!2441) (size!8012 a!3293)))))

(declare-fun b!317920 () Bool)

(declare-fun res!172495 () Bool)

(assert (=> b!317920 (=> (not res!172495) (not e!197602))))

(assert (=> b!317920 (= res!172495 (and (= (select (arr!7660 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!8012 a!3293))))))

(declare-fun b!317921 () Bool)

(declare-fun res!172491 () Bool)

(assert (=> b!317921 (=> (not res!172491) (not e!197605))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16189 (_ BitVec 32)) Bool)

(assert (=> b!317921 (= res!172491 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(assert (= (and start!31818 res!172497) b!317913))

(assert (= (and b!317913 res!172493) b!317915))

(assert (= (and b!317915 res!172499) b!317918))

(assert (= (and b!317918 res!172496) b!317917))

(assert (= (and b!317917 res!172500) b!317921))

(assert (= (and b!317921 res!172491) b!317914))

(assert (= (and b!317914 res!172498) b!317920))

(assert (= (and b!317920 res!172495) b!317916))

(assert (= (and b!317916 res!172494) b!317912))

(assert (= (and b!317912 res!172492) b!317919))

(declare-fun m!326577 () Bool)

(assert (=> b!317919 m!326577))

(declare-fun m!326579 () Bool)

(assert (=> b!317919 m!326579))

(declare-fun m!326581 () Bool)

(assert (=> b!317919 m!326581))

(declare-fun m!326583 () Bool)

(assert (=> b!317920 m!326583))

(declare-fun m!326585 () Bool)

(assert (=> b!317921 m!326585))

(declare-fun m!326587 () Bool)

(assert (=> b!317915 m!326587))

(declare-fun m!326589 () Bool)

(assert (=> start!31818 m!326589))

(declare-fun m!326591 () Bool)

(assert (=> start!31818 m!326591))

(declare-fun m!326593 () Bool)

(assert (=> b!317912 m!326593))

(declare-fun m!326595 () Bool)

(assert (=> b!317912 m!326595))

(declare-fun m!326597 () Bool)

(assert (=> b!317914 m!326597))

(assert (=> b!317914 m!326597))

(declare-fun m!326599 () Bool)

(assert (=> b!317914 m!326599))

(declare-fun m!326601 () Bool)

(assert (=> b!317917 m!326601))

(declare-fun m!326603 () Bool)

(assert (=> b!317918 m!326603))

(declare-fun m!326605 () Bool)

(assert (=> b!317916 m!326605))

(declare-fun m!326607 () Bool)

(assert (=> b!317916 m!326607))

(push 1)

(assert (not b!317918))

(assert (not b!317919))

(assert (not b!317915))

(assert (not b!317916))

(assert (not b!317917))

(assert (not b!317921))

(assert (not start!31818))

(assert (not b!317912))

(assert (not b!317914))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

