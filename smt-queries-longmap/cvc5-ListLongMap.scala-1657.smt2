; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30776 () Bool)

(assert start!30776)

(declare-fun b!308850 () Bool)

(declare-fun e!193053 () Bool)

(declare-fun e!193054 () Bool)

(assert (=> b!308850 (= e!193053 e!193054)))

(declare-fun res!165466 () Bool)

(assert (=> b!308850 (=> (not res!165466) (not e!193054))))

(declare-datatypes ((array!15729 0))(
  ( (array!15730 (arr!7448 (Array (_ BitVec 32) (_ BitVec 64))) (size!7800 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15729)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2588 0))(
  ( (MissingZero!2588 (index!12528 (_ BitVec 32))) (Found!2588 (index!12529 (_ BitVec 32))) (Intermediate!2588 (undefined!3400 Bool) (index!12530 (_ BitVec 32)) (x!30768 (_ BitVec 32))) (Undefined!2588) (MissingVacant!2588 (index!12531 (_ BitVec 32))) )
))
(declare-fun lt!151457 () SeekEntryResult!2588)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15729 (_ BitVec 32)) SeekEntryResult!2588)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308850 (= res!165466 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!151457))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!308850 (= lt!151457 (Intermediate!2588 false resIndex!52 resX!52))))

(declare-fun b!308851 () Bool)

(declare-fun res!165469 () Bool)

(assert (=> b!308851 (=> (not res!165469) (not e!193053))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15729 (_ BitVec 32)) Bool)

(assert (=> b!308851 (= res!165469 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!308852 () Bool)

(declare-fun res!165465 () Bool)

(assert (=> b!308852 (=> (not res!165465) (not e!193053))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15729 (_ BitVec 32)) SeekEntryResult!2588)

(assert (=> b!308852 (= res!165465 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2588 i!1240)))))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun e!193051 () Bool)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun b!308853 () Bool)

(assert (=> b!308853 (= e!193051 (not (or (bvslt mask!3709 #b00000000000000000000000000000000) (bvsge index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsle x!1427 #b01111111111111111111111111111110))))))

(declare-fun lt!151458 () SeekEntryResult!2588)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308853 (= lt!151458 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!308854 () Bool)

(declare-fun res!165463 () Bool)

(assert (=> b!308854 (=> (not res!165463) (not e!193053))))

(declare-fun arrayContainsKey!0 (array!15729 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!308854 (= res!165463 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!308855 () Bool)

(declare-fun res!165468 () Bool)

(assert (=> b!308855 (=> (not res!165468) (not e!193054))))

(assert (=> b!308855 (= res!165468 (and (= (select (arr!7448 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7800 a!3293))))))

(declare-fun b!308857 () Bool)

(declare-fun res!165467 () Bool)

(assert (=> b!308857 (=> (not res!165467) (not e!193053))))

(assert (=> b!308857 (= res!165467 (and (= (size!7800 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7800 a!3293))))))

(declare-fun b!308858 () Bool)

(assert (=> b!308858 (= e!193054 e!193051)))

(declare-fun res!165471 () Bool)

(assert (=> b!308858 (=> (not res!165471) (not e!193051))))

(assert (=> b!308858 (= res!165471 (and (= lt!151458 lt!151457) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7448 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!308858 (= lt!151458 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!308856 () Bool)

(declare-fun res!165464 () Bool)

(assert (=> b!308856 (=> (not res!165464) (not e!193053))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!308856 (= res!165464 (validKeyInArray!0 k!2441))))

(declare-fun res!165470 () Bool)

(assert (=> start!30776 (=> (not res!165470) (not e!193053))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30776 (= res!165470 (validMask!0 mask!3709))))

(assert (=> start!30776 e!193053))

(declare-fun array_inv!5411 (array!15729) Bool)

(assert (=> start!30776 (array_inv!5411 a!3293)))

(assert (=> start!30776 true))

(assert (= (and start!30776 res!165470) b!308857))

(assert (= (and b!308857 res!165467) b!308856))

(assert (= (and b!308856 res!165464) b!308854))

(assert (= (and b!308854 res!165463) b!308852))

(assert (= (and b!308852 res!165465) b!308851))

(assert (= (and b!308851 res!165469) b!308850))

(assert (= (and b!308850 res!165466) b!308855))

(assert (= (and b!308855 res!165468) b!308858))

(assert (= (and b!308858 res!165471) b!308853))

(declare-fun m!318875 () Bool)

(assert (=> b!308855 m!318875))

(declare-fun m!318877 () Bool)

(assert (=> b!308850 m!318877))

(assert (=> b!308850 m!318877))

(declare-fun m!318879 () Bool)

(assert (=> b!308850 m!318879))

(declare-fun m!318881 () Bool)

(assert (=> b!308856 m!318881))

(declare-fun m!318883 () Bool)

(assert (=> b!308858 m!318883))

(declare-fun m!318885 () Bool)

(assert (=> b!308858 m!318885))

(declare-fun m!318887 () Bool)

(assert (=> b!308854 m!318887))

(declare-fun m!318889 () Bool)

(assert (=> b!308852 m!318889))

(declare-fun m!318891 () Bool)

(assert (=> start!30776 m!318891))

(declare-fun m!318893 () Bool)

(assert (=> start!30776 m!318893))

(declare-fun m!318895 () Bool)

(assert (=> b!308851 m!318895))

(declare-fun m!318897 () Bool)

(assert (=> b!308853 m!318897))

(assert (=> b!308853 m!318897))

(declare-fun m!318899 () Bool)

(assert (=> b!308853 m!318899))

(push 1)

