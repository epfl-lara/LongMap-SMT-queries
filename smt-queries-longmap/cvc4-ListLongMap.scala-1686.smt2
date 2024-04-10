; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31008 () Bool)

(assert start!31008)

(declare-fun b!311657 () Bool)

(declare-fun res!168118 () Bool)

(declare-fun e!194431 () Bool)

(assert (=> b!311657 (=> (not res!168118) (not e!194431))))

(declare-datatypes ((array!15910 0))(
  ( (array!15911 (arr!7537 (Array (_ BitVec 32) (_ BitVec 64))) (size!7889 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15910)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!311657 (= res!168118 (and (= (select (arr!7537 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7889 a!3293))))))

(declare-fun b!311658 () Bool)

(declare-fun res!168112 () Bool)

(declare-fun e!194428 () Bool)

(assert (=> b!311658 (=> (not res!168112) (not e!194428))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15910 (_ BitVec 32)) Bool)

(assert (=> b!311658 (= res!168112 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!311659 () Bool)

(assert (=> b!311659 (= e!194428 e!194431)))

(declare-fun res!168119 () Bool)

(assert (=> b!311659 (=> (not res!168119) (not e!194431))))

(declare-datatypes ((SeekEntryResult!2677 0))(
  ( (MissingZero!2677 (index!12884 (_ BitVec 32))) (Found!2677 (index!12885 (_ BitVec 32))) (Intermediate!2677 (undefined!3489 Bool) (index!12886 (_ BitVec 32)) (x!31098 (_ BitVec 32))) (Undefined!2677) (MissingVacant!2677 (index!12887 (_ BitVec 32))) )
))
(declare-fun lt!152442 () SeekEntryResult!2677)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15910 (_ BitVec 32)) SeekEntryResult!2677)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311659 (= res!168119 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!152442))))

(assert (=> b!311659 (= lt!152442 (Intermediate!2677 false resIndex!52 resX!52))))

(declare-fun b!311660 () Bool)

(declare-fun res!168111 () Bool)

(assert (=> b!311660 (=> (not res!168111) (not e!194428))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15910 (_ BitVec 32)) SeekEntryResult!2677)

(assert (=> b!311660 (= res!168111 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2677 i!1240)))))

(declare-fun b!311661 () Bool)

(declare-fun res!168115 () Bool)

(assert (=> b!311661 (=> (not res!168115) (not e!194428))))

(declare-fun arrayContainsKey!0 (array!15910 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!311661 (= res!168115 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun res!168120 () Bool)

(assert (=> start!31008 (=> (not res!168120) (not e!194428))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31008 (= res!168120 (validMask!0 mask!3709))))

(assert (=> start!31008 e!194428))

(declare-fun array_inv!5500 (array!15910) Bool)

(assert (=> start!31008 (array_inv!5500 a!3293)))

(assert (=> start!31008 true))

(declare-fun b!311662 () Bool)

(declare-fun e!194430 () Bool)

(assert (=> b!311662 (= e!194431 e!194430)))

(declare-fun res!168113 () Bool)

(assert (=> b!311662 (=> (not res!168113) (not e!194430))))

(declare-fun lt!152445 () SeekEntryResult!2677)

(assert (=> b!311662 (= res!168113 (and (= lt!152445 lt!152442) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7537 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!311662 (= lt!152445 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!311663 () Bool)

(assert (=> b!311663 (= e!194430 (not true))))

(declare-fun e!194429 () Bool)

(assert (=> b!311663 e!194429))

(declare-fun res!168114 () Bool)

(assert (=> b!311663 (=> (not res!168114) (not e!194429))))

(declare-fun lt!152443 () (_ BitVec 32))

(assert (=> b!311663 (= res!168114 (= lt!152445 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152443 k!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311663 (= lt!152443 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun lt!152444 () array!15910)

(declare-fun b!311664 () Bool)

(assert (=> b!311664 (= e!194429 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!152444 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152443 k!2441 lt!152444 mask!3709)))))

(assert (=> b!311664 (= lt!152444 (array!15911 (store (arr!7537 a!3293) i!1240 k!2441) (size!7889 a!3293)))))

(declare-fun b!311665 () Bool)

(declare-fun res!168116 () Bool)

(assert (=> b!311665 (=> (not res!168116) (not e!194428))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!311665 (= res!168116 (validKeyInArray!0 k!2441))))

(declare-fun b!311666 () Bool)

(declare-fun res!168117 () Bool)

(assert (=> b!311666 (=> (not res!168117) (not e!194428))))

(assert (=> b!311666 (= res!168117 (and (= (size!7889 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7889 a!3293))))))

(assert (= (and start!31008 res!168120) b!311666))

(assert (= (and b!311666 res!168117) b!311665))

(assert (= (and b!311665 res!168116) b!311661))

(assert (= (and b!311661 res!168115) b!311660))

(assert (= (and b!311660 res!168111) b!311658))

(assert (= (and b!311658 res!168112) b!311659))

(assert (= (and b!311659 res!168119) b!311657))

(assert (= (and b!311657 res!168118) b!311662))

(assert (= (and b!311662 res!168113) b!311663))

(assert (= (and b!311663 res!168114) b!311664))

(declare-fun m!321645 () Bool)

(assert (=> b!311665 m!321645))

(declare-fun m!321647 () Bool)

(assert (=> b!311658 m!321647))

(declare-fun m!321649 () Bool)

(assert (=> b!311659 m!321649))

(assert (=> b!311659 m!321649))

(declare-fun m!321651 () Bool)

(assert (=> b!311659 m!321651))

(declare-fun m!321653 () Bool)

(assert (=> b!311664 m!321653))

(declare-fun m!321655 () Bool)

(assert (=> b!311664 m!321655))

(declare-fun m!321657 () Bool)

(assert (=> b!311664 m!321657))

(declare-fun m!321659 () Bool)

(assert (=> b!311661 m!321659))

(declare-fun m!321661 () Bool)

(assert (=> b!311662 m!321661))

(declare-fun m!321663 () Bool)

(assert (=> b!311662 m!321663))

(declare-fun m!321665 () Bool)

(assert (=> start!31008 m!321665))

(declare-fun m!321667 () Bool)

(assert (=> start!31008 m!321667))

(declare-fun m!321669 () Bool)

(assert (=> b!311663 m!321669))

(declare-fun m!321671 () Bool)

(assert (=> b!311663 m!321671))

(declare-fun m!321673 () Bool)

(assert (=> b!311660 m!321673))

(declare-fun m!321675 () Bool)

(assert (=> b!311657 m!321675))

(push 1)

(assert (not b!311659))

(assert (not b!311664))

(assert (not b!311658))

