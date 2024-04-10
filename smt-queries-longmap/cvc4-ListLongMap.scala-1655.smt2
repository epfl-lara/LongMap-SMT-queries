; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30768 () Bool)

(assert start!30768)

(declare-fun b!308742 () Bool)

(declare-fun e!193005 () Bool)

(assert (=> b!308742 (= e!193005 (not true))))

(declare-datatypes ((array!15721 0))(
  ( (array!15722 (arr!7444 (Array (_ BitVec 32) (_ BitVec 64))) (size!7796 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15721)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2584 0))(
  ( (MissingZero!2584 (index!12512 (_ BitVec 32))) (Found!2584 (index!12513 (_ BitVec 32))) (Intermediate!2584 (undefined!3396 Bool) (index!12514 (_ BitVec 32)) (x!30748 (_ BitVec 32))) (Undefined!2584) (MissingVacant!2584 (index!12515 (_ BitVec 32))) )
))
(declare-fun lt!151433 () SeekEntryResult!2584)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15721 (_ BitVec 32)) SeekEntryResult!2584)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308742 (= lt!151433 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun res!165361 () Bool)

(declare-fun e!193006 () Bool)

(assert (=> start!30768 (=> (not res!165361) (not e!193006))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30768 (= res!165361 (validMask!0 mask!3709))))

(assert (=> start!30768 e!193006))

(declare-fun array_inv!5407 (array!15721) Bool)

(assert (=> start!30768 (array_inv!5407 a!3293)))

(assert (=> start!30768 true))

(declare-fun b!308743 () Bool)

(declare-fun res!165358 () Bool)

(assert (=> b!308743 (=> (not res!165358) (not e!193006))))

(declare-fun arrayContainsKey!0 (array!15721 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!308743 (= res!165358 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!308744 () Bool)

(declare-fun e!193003 () Bool)

(assert (=> b!308744 (= e!193006 e!193003)))

(declare-fun res!165363 () Bool)

(assert (=> b!308744 (=> (not res!165363) (not e!193003))))

(declare-fun lt!151434 () SeekEntryResult!2584)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308744 (= res!165363 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!151434))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!308744 (= lt!151434 (Intermediate!2584 false resIndex!52 resX!52))))

(declare-fun b!308745 () Bool)

(declare-fun res!165356 () Bool)

(assert (=> b!308745 (=> (not res!165356) (not e!193006))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!308745 (= res!165356 (and (= (size!7796 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7796 a!3293))))))

(declare-fun b!308746 () Bool)

(declare-fun res!165360 () Bool)

(assert (=> b!308746 (=> (not res!165360) (not e!193003))))

(assert (=> b!308746 (= res!165360 (and (= (select (arr!7444 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7796 a!3293))))))

(declare-fun b!308747 () Bool)

(assert (=> b!308747 (= e!193003 e!193005)))

(declare-fun res!165355 () Bool)

(assert (=> b!308747 (=> (not res!165355) (not e!193005))))

(assert (=> b!308747 (= res!165355 (and (= lt!151433 lt!151434) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7444 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!308747 (= lt!151433 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!308748 () Bool)

(declare-fun res!165359 () Bool)

(assert (=> b!308748 (=> (not res!165359) (not e!193006))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15721 (_ BitVec 32)) SeekEntryResult!2584)

(assert (=> b!308748 (= res!165359 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2584 i!1240)))))

(declare-fun b!308749 () Bool)

(declare-fun res!165357 () Bool)

(assert (=> b!308749 (=> (not res!165357) (not e!193006))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!308749 (= res!165357 (validKeyInArray!0 k!2441))))

(declare-fun b!308750 () Bool)

(declare-fun res!165362 () Bool)

(assert (=> b!308750 (=> (not res!165362) (not e!193006))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15721 (_ BitVec 32)) Bool)

(assert (=> b!308750 (= res!165362 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(assert (= (and start!30768 res!165361) b!308745))

(assert (= (and b!308745 res!165356) b!308749))

(assert (= (and b!308749 res!165357) b!308743))

(assert (= (and b!308743 res!165358) b!308748))

(assert (= (and b!308748 res!165359) b!308750))

(assert (= (and b!308750 res!165362) b!308744))

(assert (= (and b!308744 res!165363) b!308746))

(assert (= (and b!308746 res!165360) b!308747))

(assert (= (and b!308747 res!165355) b!308742))

(declare-fun m!318771 () Bool)

(assert (=> b!308744 m!318771))

(assert (=> b!308744 m!318771))

(declare-fun m!318773 () Bool)

(assert (=> b!308744 m!318773))

(declare-fun m!318775 () Bool)

(assert (=> b!308747 m!318775))

(declare-fun m!318777 () Bool)

(assert (=> b!308747 m!318777))

(declare-fun m!318779 () Bool)

(assert (=> b!308746 m!318779))

(declare-fun m!318781 () Bool)

(assert (=> b!308742 m!318781))

(assert (=> b!308742 m!318781))

(declare-fun m!318783 () Bool)

(assert (=> b!308742 m!318783))

(declare-fun m!318785 () Bool)

(assert (=> b!308748 m!318785))

(declare-fun m!318787 () Bool)

(assert (=> b!308750 m!318787))

(declare-fun m!318789 () Bool)

(assert (=> start!30768 m!318789))

(declare-fun m!318791 () Bool)

(assert (=> start!30768 m!318791))

(declare-fun m!318793 () Bool)

(assert (=> b!308743 m!318793))

(declare-fun m!318795 () Bool)

(assert (=> b!308749 m!318795))

(push 1)

(assert (not b!308749))

(assert (not b!308750))

(assert (not b!308748))

