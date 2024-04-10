; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30770 () Bool)

(assert start!30770)

(declare-fun b!308769 () Bool)

(declare-fun e!193015 () Bool)

(declare-fun e!193016 () Bool)

(assert (=> b!308769 (= e!193015 e!193016)))

(declare-fun res!165389 () Bool)

(assert (=> b!308769 (=> (not res!165389) (not e!193016))))

(declare-datatypes ((array!15723 0))(
  ( (array!15724 (arr!7445 (Array (_ BitVec 32) (_ BitVec 64))) (size!7797 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15723)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2585 0))(
  ( (MissingZero!2585 (index!12516 (_ BitVec 32))) (Found!2585 (index!12517 (_ BitVec 32))) (Intermediate!2585 (undefined!3397 Bool) (index!12518 (_ BitVec 32)) (x!30757 (_ BitVec 32))) (Undefined!2585) (MissingVacant!2585 (index!12519 (_ BitVec 32))) )
))
(declare-fun lt!151440 () SeekEntryResult!2585)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15723 (_ BitVec 32)) SeekEntryResult!2585)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308769 (= res!165389 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!151440))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!308769 (= lt!151440 (Intermediate!2585 false resIndex!52 resX!52))))

(declare-fun b!308770 () Bool)

(declare-fun res!165385 () Bool)

(assert (=> b!308770 (=> (not res!165385) (not e!193015))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15723 (_ BitVec 32)) SeekEntryResult!2585)

(assert (=> b!308770 (= res!165385 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2585 i!1240)))))

(declare-fun b!308771 () Bool)

(declare-fun e!193018 () Bool)

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!308771 (= e!193018 (not (or (bvslt mask!3709 #b00000000000000000000000000000000) (bvslt index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)))))))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun lt!151439 () SeekEntryResult!2585)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308771 (= lt!151439 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!308772 () Bool)

(declare-fun res!165383 () Bool)

(assert (=> b!308772 (=> (not res!165383) (not e!193015))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!308772 (= res!165383 (validKeyInArray!0 k!2441))))

(declare-fun b!308773 () Bool)

(declare-fun res!165388 () Bool)

(assert (=> b!308773 (=> (not res!165388) (not e!193015))))

(assert (=> b!308773 (= res!165388 (and (= (size!7797 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7797 a!3293))))))

(declare-fun b!308774 () Bool)

(declare-fun res!165382 () Bool)

(assert (=> b!308774 (=> (not res!165382) (not e!193015))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15723 (_ BitVec 32)) Bool)

(assert (=> b!308774 (= res!165382 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!308775 () Bool)

(declare-fun res!165386 () Bool)

(assert (=> b!308775 (=> (not res!165386) (not e!193016))))

(assert (=> b!308775 (= res!165386 (and (= (select (arr!7445 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7797 a!3293))))))

(declare-fun b!308776 () Bool)

(assert (=> b!308776 (= e!193016 e!193018)))

(declare-fun res!165384 () Bool)

(assert (=> b!308776 (=> (not res!165384) (not e!193018))))

(assert (=> b!308776 (= res!165384 (and (= lt!151439 lt!151440) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7445 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!308776 (= lt!151439 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun res!165387 () Bool)

(assert (=> start!30770 (=> (not res!165387) (not e!193015))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30770 (= res!165387 (validMask!0 mask!3709))))

(assert (=> start!30770 e!193015))

(declare-fun array_inv!5408 (array!15723) Bool)

(assert (=> start!30770 (array_inv!5408 a!3293)))

(assert (=> start!30770 true))

(declare-fun b!308777 () Bool)

(declare-fun res!165390 () Bool)

(assert (=> b!308777 (=> (not res!165390) (not e!193015))))

(declare-fun arrayContainsKey!0 (array!15723 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!308777 (= res!165390 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(assert (= (and start!30770 res!165387) b!308773))

(assert (= (and b!308773 res!165388) b!308772))

(assert (= (and b!308772 res!165383) b!308777))

(assert (= (and b!308777 res!165390) b!308770))

(assert (= (and b!308770 res!165385) b!308774))

(assert (= (and b!308774 res!165382) b!308769))

(assert (= (and b!308769 res!165389) b!308775))

(assert (= (and b!308775 res!165386) b!308776))

(assert (= (and b!308776 res!165384) b!308771))

(declare-fun m!318797 () Bool)

(assert (=> start!30770 m!318797))

(declare-fun m!318799 () Bool)

(assert (=> start!30770 m!318799))

(declare-fun m!318801 () Bool)

(assert (=> b!308776 m!318801))

(declare-fun m!318803 () Bool)

(assert (=> b!308776 m!318803))

(declare-fun m!318805 () Bool)

(assert (=> b!308775 m!318805))

(declare-fun m!318807 () Bool)

(assert (=> b!308770 m!318807))

(declare-fun m!318809 () Bool)

(assert (=> b!308777 m!318809))

(declare-fun m!318811 () Bool)

(assert (=> b!308769 m!318811))

(assert (=> b!308769 m!318811))

(declare-fun m!318813 () Bool)

(assert (=> b!308769 m!318813))

(declare-fun m!318815 () Bool)

(assert (=> b!308771 m!318815))

(assert (=> b!308771 m!318815))

(declare-fun m!318817 () Bool)

(assert (=> b!308771 m!318817))

(declare-fun m!318819 () Bool)

(assert (=> b!308774 m!318819))

(declare-fun m!318821 () Bool)

(assert (=> b!308772 m!318821))

(push 1)

(assert (not b!308777))

(assert (not b!308772))

(assert (not b!308771))

(assert (not b!308770))

(assert (not b!308769))

(assert (not b!308774))

(assert (not b!308776))

(assert (not start!30770))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

