; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30798 () Bool)

(assert start!30798)

(declare-fun b!309147 () Bool)

(declare-fun res!165760 () Bool)

(declare-fun e!193183 () Bool)

(assert (=> b!309147 (=> (not res!165760) (not e!193183))))

(declare-datatypes ((array!15751 0))(
  ( (array!15752 (arr!7459 (Array (_ BitVec 32) (_ BitVec 64))) (size!7811 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15751)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15751 (_ BitVec 32)) Bool)

(assert (=> b!309147 (= res!165760 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!309148 () Bool)

(declare-fun res!165767 () Bool)

(assert (=> b!309148 (=> (not res!165767) (not e!193183))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!309148 (= res!165767 (validKeyInArray!0 k!2441))))

(declare-fun b!309149 () Bool)

(declare-fun e!193185 () Bool)

(declare-fun e!193184 () Bool)

(assert (=> b!309149 (= e!193185 e!193184)))

(declare-fun res!165768 () Bool)

(assert (=> b!309149 (=> (not res!165768) (not e!193184))))

(declare-datatypes ((SeekEntryResult!2599 0))(
  ( (MissingZero!2599 (index!12572 (_ BitVec 32))) (Found!2599 (index!12573 (_ BitVec 32))) (Intermediate!2599 (undefined!3411 Bool) (index!12574 (_ BitVec 32)) (x!30803 (_ BitVec 32))) (Undefined!2599) (MissingVacant!2599 (index!12575 (_ BitVec 32))) )
))
(declare-fun lt!151524 () SeekEntryResult!2599)

(declare-fun lt!151523 () SeekEntryResult!2599)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!309149 (= res!165768 (and (= lt!151523 lt!151524) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7459 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15751 (_ BitVec 32)) SeekEntryResult!2599)

(assert (=> b!309149 (= lt!151523 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!309150 () Bool)

(declare-fun res!165766 () Bool)

(assert (=> b!309150 (=> (not res!165766) (not e!193183))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!309150 (= res!165766 (and (= (size!7811 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7811 a!3293))))))

(declare-fun res!165764 () Bool)

(assert (=> start!30798 (=> (not res!165764) (not e!193183))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30798 (= res!165764 (validMask!0 mask!3709))))

(assert (=> start!30798 e!193183))

(declare-fun array_inv!5422 (array!15751) Bool)

(assert (=> start!30798 (array_inv!5422 a!3293)))

(assert (=> start!30798 true))

(declare-fun b!309151 () Bool)

(assert (=> b!309151 (= e!193184 (not (bvsge mask!3709 #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309151 (= lt!151523 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!309152 () Bool)

(declare-fun res!165762 () Bool)

(assert (=> b!309152 (=> (not res!165762) (not e!193183))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15751 (_ BitVec 32)) SeekEntryResult!2599)

(assert (=> b!309152 (= res!165762 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2599 i!1240)))))

(declare-fun b!309153 () Bool)

(declare-fun res!165761 () Bool)

(assert (=> b!309153 (=> (not res!165761) (not e!193183))))

(declare-fun arrayContainsKey!0 (array!15751 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!309153 (= res!165761 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!309154 () Bool)

(assert (=> b!309154 (= e!193183 e!193185)))

(declare-fun res!165763 () Bool)

(assert (=> b!309154 (=> (not res!165763) (not e!193185))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309154 (= res!165763 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!151524))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!309154 (= lt!151524 (Intermediate!2599 false resIndex!52 resX!52))))

(declare-fun b!309155 () Bool)

(declare-fun res!165765 () Bool)

(assert (=> b!309155 (=> (not res!165765) (not e!193185))))

(assert (=> b!309155 (= res!165765 (and (= (select (arr!7459 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7811 a!3293))))))

(assert (= (and start!30798 res!165764) b!309150))

(assert (= (and b!309150 res!165766) b!309148))

(assert (= (and b!309148 res!165767) b!309153))

(assert (= (and b!309153 res!165761) b!309152))

(assert (= (and b!309152 res!165762) b!309147))

(assert (= (and b!309147 res!165760) b!309154))

(assert (= (and b!309154 res!165763) b!309155))

(assert (= (and b!309155 res!165765) b!309149))

(assert (= (and b!309149 res!165768) b!309151))

(declare-fun m!319161 () Bool)

(assert (=> b!309154 m!319161))

(assert (=> b!309154 m!319161))

(declare-fun m!319163 () Bool)

(assert (=> b!309154 m!319163))

(declare-fun m!319165 () Bool)

(assert (=> b!309155 m!319165))

(declare-fun m!319167 () Bool)

(assert (=> b!309153 m!319167))

(declare-fun m!319169 () Bool)

(assert (=> b!309149 m!319169))

(declare-fun m!319171 () Bool)

(assert (=> b!309149 m!319171))

(declare-fun m!319173 () Bool)

(assert (=> b!309151 m!319173))

(assert (=> b!309151 m!319173))

(declare-fun m!319175 () Bool)

(assert (=> b!309151 m!319175))

(declare-fun m!319177 () Bool)

(assert (=> start!30798 m!319177))

(declare-fun m!319179 () Bool)

(assert (=> start!30798 m!319179))

(declare-fun m!319181 () Bool)

(assert (=> b!309152 m!319181))

(declare-fun m!319183 () Bool)

(assert (=> b!309147 m!319183))

(declare-fun m!319185 () Bool)

(assert (=> b!309148 m!319185))

(push 1)

(assert (not start!30798))

(assert (not b!309151))

(assert (not b!309148))

(assert (not b!309154))

(assert (not b!309149))

(assert (not b!309153))

(assert (not b!309147))

(assert (not b!309152))

(check-sat)

(pop 1)

(push 1)

(check-sat)

