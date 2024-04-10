; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30792 () Bool)

(assert start!30792)

(declare-fun b!309066 () Bool)

(declare-fun e!193147 () Bool)

(declare-fun e!193149 () Bool)

(assert (=> b!309066 (= e!193147 e!193149)))

(declare-fun res!165684 () Bool)

(assert (=> b!309066 (=> (not res!165684) (not e!193149))))

(declare-datatypes ((array!15745 0))(
  ( (array!15746 (arr!7456 (Array (_ BitVec 32) (_ BitVec 64))) (size!7808 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15745)

(declare-datatypes ((SeekEntryResult!2596 0))(
  ( (MissingZero!2596 (index!12560 (_ BitVec 32))) (Found!2596 (index!12561 (_ BitVec 32))) (Intermediate!2596 (undefined!3408 Bool) (index!12562 (_ BitVec 32)) (x!30792 (_ BitVec 32))) (Undefined!2596) (MissingVacant!2596 (index!12563 (_ BitVec 32))) )
))
(declare-fun lt!151505 () SeekEntryResult!2596)

(declare-fun lt!151506 () SeekEntryResult!2596)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!309066 (= res!165684 (and (= lt!151506 lt!151505) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7456 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15745 (_ BitVec 32)) SeekEntryResult!2596)

(assert (=> b!309066 (= lt!151506 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!309067 () Bool)

(declare-fun res!165686 () Bool)

(declare-fun e!193148 () Bool)

(assert (=> b!309067 (=> (not res!165686) (not e!193148))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!309067 (= res!165686 (and (= (size!7808 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7808 a!3293))))))

(declare-fun b!309069 () Bool)

(declare-fun res!165682 () Bool)

(assert (=> b!309069 (=> (not res!165682) (not e!193148))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15745 (_ BitVec 32)) Bool)

(assert (=> b!309069 (= res!165682 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!309070 () Bool)

(declare-fun res!165681 () Bool)

(assert (=> b!309070 (=> (not res!165681) (not e!193147))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!309070 (= res!165681 (and (= (select (arr!7456 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7808 a!3293))))))

(declare-fun b!309071 () Bool)

(assert (=> b!309071 (= e!193148 e!193147)))

(declare-fun res!165687 () Bool)

(assert (=> b!309071 (=> (not res!165687) (not e!193147))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309071 (= res!165687 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!151505))))

(assert (=> b!309071 (= lt!151505 (Intermediate!2596 false resIndex!52 resX!52))))

(declare-fun b!309072 () Bool)

(declare-fun res!165679 () Bool)

(assert (=> b!309072 (=> (not res!165679) (not e!193148))))

(declare-fun arrayContainsKey!0 (array!15745 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!309072 (= res!165679 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!309068 () Bool)

(declare-fun res!165680 () Bool)

(assert (=> b!309068 (=> (not res!165680) (not e!193148))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!309068 (= res!165680 (validKeyInArray!0 k!2441))))

(declare-fun res!165683 () Bool)

(assert (=> start!30792 (=> (not res!165683) (not e!193148))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30792 (= res!165683 (validMask!0 mask!3709))))

(assert (=> start!30792 e!193148))

(declare-fun array_inv!5419 (array!15745) Bool)

(assert (=> start!30792 (array_inv!5419 a!3293)))

(assert (=> start!30792 true))

(declare-fun b!309073 () Bool)

(assert (=> b!309073 (= e!193149 (not true))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309073 (= lt!151506 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!309074 () Bool)

(declare-fun res!165685 () Bool)

(assert (=> b!309074 (=> (not res!165685) (not e!193148))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15745 (_ BitVec 32)) SeekEntryResult!2596)

(assert (=> b!309074 (= res!165685 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2596 i!1240)))))

(assert (= (and start!30792 res!165683) b!309067))

(assert (= (and b!309067 res!165686) b!309068))

(assert (= (and b!309068 res!165680) b!309072))

(assert (= (and b!309072 res!165679) b!309074))

(assert (= (and b!309074 res!165685) b!309069))

(assert (= (and b!309069 res!165682) b!309071))

(assert (= (and b!309071 res!165687) b!309070))

(assert (= (and b!309070 res!165681) b!309066))

(assert (= (and b!309066 res!165684) b!309073))

(declare-fun m!319083 () Bool)

(assert (=> b!309073 m!319083))

(assert (=> b!309073 m!319083))

(declare-fun m!319085 () Bool)

(assert (=> b!309073 m!319085))

(declare-fun m!319087 () Bool)

(assert (=> b!309070 m!319087))

(declare-fun m!319089 () Bool)

(assert (=> b!309068 m!319089))

(declare-fun m!319091 () Bool)

(assert (=> b!309074 m!319091))

(declare-fun m!319093 () Bool)

(assert (=> start!30792 m!319093))

(declare-fun m!319095 () Bool)

(assert (=> start!30792 m!319095))

(declare-fun m!319097 () Bool)

(assert (=> b!309066 m!319097))

(declare-fun m!319099 () Bool)

(assert (=> b!309066 m!319099))

(declare-fun m!319101 () Bool)

(assert (=> b!309069 m!319101))

(declare-fun m!319103 () Bool)

(assert (=> b!309072 m!319103))

(declare-fun m!319105 () Bool)

(assert (=> b!309071 m!319105))

(assert (=> b!309071 m!319105))

(declare-fun m!319107 () Bool)

(assert (=> b!309071 m!319107))

(push 1)

(assert (not b!309074))

(assert (not start!30792))

(assert (not b!309071))

