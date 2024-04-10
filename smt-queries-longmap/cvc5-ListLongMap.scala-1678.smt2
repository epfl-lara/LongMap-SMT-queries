; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30956 () Bool)

(assert start!30956)

(declare-fun b!310877 () Bool)

(declare-fun e!194041 () Bool)

(assert (=> b!310877 (= e!194041 (not true))))

(declare-fun e!194039 () Bool)

(assert (=> b!310877 e!194039))

(declare-fun res!167333 () Bool)

(assert (=> b!310877 (=> (not res!167333) (not e!194039))))

(declare-datatypes ((array!15858 0))(
  ( (array!15859 (arr!7511 (Array (_ BitVec 32) (_ BitVec 64))) (size!7863 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15858)

(declare-datatypes ((SeekEntryResult!2651 0))(
  ( (MissingZero!2651 (index!12780 (_ BitVec 32))) (Found!2651 (index!12781 (_ BitVec 32))) (Intermediate!2651 (undefined!3463 Bool) (index!12782 (_ BitVec 32)) (x!31008 (_ BitVec 32))) (Undefined!2651) (MissingVacant!2651 (index!12783 (_ BitVec 32))) )
))
(declare-fun lt!152133 () SeekEntryResult!2651)

(declare-fun lt!152130 () (_ BitVec 32))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15858 (_ BitVec 32)) SeekEntryResult!2651)

(assert (=> b!310877 (= res!167333 (= lt!152133 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152130 k!2441 a!3293 mask!3709)))))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310877 (= lt!152130 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!310878 () Bool)

(declare-fun res!167331 () Bool)

(declare-fun e!194038 () Bool)

(assert (=> b!310878 (=> (not res!167331) (not e!194038))))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!310878 (= res!167331 (and (= (select (arr!7511 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7863 a!3293))))))

(declare-fun b!310879 () Bool)

(declare-fun res!167334 () Bool)

(declare-fun e!194040 () Bool)

(assert (=> b!310879 (=> (not res!167334) (not e!194040))))

(declare-fun arrayContainsKey!0 (array!15858 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!310879 (= res!167334 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!310880 () Bool)

(assert (=> b!310880 (= e!194040 e!194038)))

(declare-fun res!167340 () Bool)

(assert (=> b!310880 (=> (not res!167340) (not e!194038))))

(declare-fun lt!152131 () SeekEntryResult!2651)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310880 (= res!167340 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!152131))))

(assert (=> b!310880 (= lt!152131 (Intermediate!2651 false resIndex!52 resX!52))))

(declare-fun b!310881 () Bool)

(declare-fun res!167336 () Bool)

(assert (=> b!310881 (=> (not res!167336) (not e!194040))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!310881 (= res!167336 (validKeyInArray!0 k!2441))))

(declare-fun b!310882 () Bool)

(assert (=> b!310882 (= e!194038 e!194041)))

(declare-fun res!167332 () Bool)

(assert (=> b!310882 (=> (not res!167332) (not e!194041))))

(assert (=> b!310882 (= res!167332 (and (= lt!152133 lt!152131) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7511 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!310882 (= lt!152133 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!310883 () Bool)

(declare-fun res!167339 () Bool)

(assert (=> b!310883 (=> (not res!167339) (not e!194040))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15858 (_ BitVec 32)) SeekEntryResult!2651)

(assert (=> b!310883 (= res!167339 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2651 i!1240)))))

(declare-fun res!167338 () Bool)

(assert (=> start!30956 (=> (not res!167338) (not e!194040))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30956 (= res!167338 (validMask!0 mask!3709))))

(assert (=> start!30956 e!194040))

(declare-fun array_inv!5474 (array!15858) Bool)

(assert (=> start!30956 (array_inv!5474 a!3293)))

(assert (=> start!30956 true))

(declare-fun b!310884 () Bool)

(declare-fun res!167337 () Bool)

(assert (=> b!310884 (=> (not res!167337) (not e!194040))))

(assert (=> b!310884 (= res!167337 (and (= (size!7863 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7863 a!3293))))))

(declare-fun lt!152132 () array!15858)

(declare-fun b!310885 () Bool)

(assert (=> b!310885 (= e!194039 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!152132 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152130 k!2441 lt!152132 mask!3709)))))

(assert (=> b!310885 (= lt!152132 (array!15859 (store (arr!7511 a!3293) i!1240 k!2441) (size!7863 a!3293)))))

(declare-fun b!310886 () Bool)

(declare-fun res!167335 () Bool)

(assert (=> b!310886 (=> (not res!167335) (not e!194040))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15858 (_ BitVec 32)) Bool)

(assert (=> b!310886 (= res!167335 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(assert (= (and start!30956 res!167338) b!310884))

(assert (= (and b!310884 res!167337) b!310881))

(assert (= (and b!310881 res!167336) b!310879))

(assert (= (and b!310879 res!167334) b!310883))

(assert (= (and b!310883 res!167339) b!310886))

(assert (= (and b!310886 res!167335) b!310880))

(assert (= (and b!310880 res!167340) b!310878))

(assert (= (and b!310878 res!167331) b!310882))

(assert (= (and b!310882 res!167332) b!310877))

(assert (= (and b!310877 res!167333) b!310885))

(declare-fun m!320813 () Bool)

(assert (=> b!310886 m!320813))

(declare-fun m!320815 () Bool)

(assert (=> b!310882 m!320815))

(declare-fun m!320817 () Bool)

(assert (=> b!310882 m!320817))

(declare-fun m!320819 () Bool)

(assert (=> start!30956 m!320819))

(declare-fun m!320821 () Bool)

(assert (=> start!30956 m!320821))

(declare-fun m!320823 () Bool)

(assert (=> b!310878 m!320823))

(declare-fun m!320825 () Bool)

(assert (=> b!310885 m!320825))

(declare-fun m!320827 () Bool)

(assert (=> b!310885 m!320827))

(declare-fun m!320829 () Bool)

(assert (=> b!310885 m!320829))

(declare-fun m!320831 () Bool)

(assert (=> b!310883 m!320831))

(declare-fun m!320833 () Bool)

(assert (=> b!310881 m!320833))

(declare-fun m!320835 () Bool)

(assert (=> b!310880 m!320835))

(assert (=> b!310880 m!320835))

(declare-fun m!320837 () Bool)

(assert (=> b!310880 m!320837))

(declare-fun m!320839 () Bool)

(assert (=> b!310877 m!320839))

(declare-fun m!320841 () Bool)

(assert (=> b!310877 m!320841))

(declare-fun m!320843 () Bool)

(assert (=> b!310879 m!320843))

(push 1)

