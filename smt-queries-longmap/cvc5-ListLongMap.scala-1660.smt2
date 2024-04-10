; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30794 () Bool)

(assert start!30794)

(declare-fun b!309093 () Bool)

(declare-fun res!165713 () Bool)

(declare-fun e!193159 () Bool)

(assert (=> b!309093 (=> (not res!165713) (not e!193159))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!309093 (= res!165713 (validKeyInArray!0 k!2441))))

(declare-fun b!309094 () Bool)

(declare-fun res!165706 () Bool)

(assert (=> b!309094 (=> (not res!165706) (not e!193159))))

(declare-datatypes ((array!15747 0))(
  ( (array!15748 (arr!7457 (Array (_ BitVec 32) (_ BitVec 64))) (size!7809 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15747)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2597 0))(
  ( (MissingZero!2597 (index!12564 (_ BitVec 32))) (Found!2597 (index!12565 (_ BitVec 32))) (Intermediate!2597 (undefined!3409 Bool) (index!12566 (_ BitVec 32)) (x!30801 (_ BitVec 32))) (Undefined!2597) (MissingVacant!2597 (index!12567 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15747 (_ BitVec 32)) SeekEntryResult!2597)

(assert (=> b!309094 (= res!165706 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2597 i!1240)))))

(declare-fun b!309095 () Bool)

(declare-fun res!165709 () Bool)

(assert (=> b!309095 (=> (not res!165709) (not e!193159))))

(declare-fun arrayContainsKey!0 (array!15747 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!309095 (= res!165709 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!309096 () Bool)

(declare-fun e!193161 () Bool)

(declare-fun e!193162 () Bool)

(assert (=> b!309096 (= e!193161 e!193162)))

(declare-fun res!165711 () Bool)

(assert (=> b!309096 (=> (not res!165711) (not e!193162))))

(declare-fun lt!151511 () SeekEntryResult!2597)

(declare-fun lt!151512 () SeekEntryResult!2597)

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!309096 (= res!165711 (and (= lt!151512 lt!151511) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7457 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15747 (_ BitVec 32)) SeekEntryResult!2597)

(assert (=> b!309096 (= lt!151512 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!309098 () Bool)

(declare-fun res!165712 () Bool)

(assert (=> b!309098 (=> (not res!165712) (not e!193161))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!309098 (= res!165712 (and (= (select (arr!7457 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7809 a!3293))))))

(declare-fun b!309099 () Bool)

(declare-fun res!165708 () Bool)

(assert (=> b!309099 (=> (not res!165708) (not e!193159))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15747 (_ BitVec 32)) Bool)

(assert (=> b!309099 (= res!165708 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!309100 () Bool)

(declare-fun res!165707 () Bool)

(assert (=> b!309100 (=> (not res!165707) (not e!193159))))

(assert (=> b!309100 (= res!165707 (and (= (size!7809 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7809 a!3293))))))

(declare-fun b!309101 () Bool)

(assert (=> b!309101 (= e!193162 (not (bvsge mask!3709 #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309101 (= lt!151512 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun res!165714 () Bool)

(assert (=> start!30794 (=> (not res!165714) (not e!193159))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30794 (= res!165714 (validMask!0 mask!3709))))

(assert (=> start!30794 e!193159))

(declare-fun array_inv!5420 (array!15747) Bool)

(assert (=> start!30794 (array_inv!5420 a!3293)))

(assert (=> start!30794 true))

(declare-fun b!309097 () Bool)

(assert (=> b!309097 (= e!193159 e!193161)))

(declare-fun res!165710 () Bool)

(assert (=> b!309097 (=> (not res!165710) (not e!193161))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309097 (= res!165710 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!151511))))

(assert (=> b!309097 (= lt!151511 (Intermediate!2597 false resIndex!52 resX!52))))

(assert (= (and start!30794 res!165714) b!309100))

(assert (= (and b!309100 res!165707) b!309093))

(assert (= (and b!309093 res!165713) b!309095))

(assert (= (and b!309095 res!165709) b!309094))

(assert (= (and b!309094 res!165706) b!309099))

(assert (= (and b!309099 res!165708) b!309097))

(assert (= (and b!309097 res!165710) b!309098))

(assert (= (and b!309098 res!165712) b!309096))

(assert (= (and b!309096 res!165711) b!309101))

(declare-fun m!319109 () Bool)

(assert (=> b!309101 m!319109))

(assert (=> b!309101 m!319109))

(declare-fun m!319111 () Bool)

(assert (=> b!309101 m!319111))

(declare-fun m!319113 () Bool)

(assert (=> b!309099 m!319113))

(declare-fun m!319115 () Bool)

(assert (=> b!309098 m!319115))

(declare-fun m!319117 () Bool)

(assert (=> b!309095 m!319117))

(declare-fun m!319119 () Bool)

(assert (=> b!309096 m!319119))

(declare-fun m!319121 () Bool)

(assert (=> b!309096 m!319121))

(declare-fun m!319123 () Bool)

(assert (=> start!30794 m!319123))

(declare-fun m!319125 () Bool)

(assert (=> start!30794 m!319125))

(declare-fun m!319127 () Bool)

(assert (=> b!309094 m!319127))

(declare-fun m!319129 () Bool)

(assert (=> b!309097 m!319129))

(assert (=> b!309097 m!319129))

(declare-fun m!319131 () Bool)

(assert (=> b!309097 m!319131))

(declare-fun m!319133 () Bool)

(assert (=> b!309093 m!319133))

(push 1)

(assert (not b!309097))

(assert (not b!309093))

(assert (not start!30794))

(assert (not b!309096))

(assert (not b!309094))

(assert (not b!309095))

(assert (not b!309101))

(assert (not b!309099))

(check-sat)

(pop 1)

