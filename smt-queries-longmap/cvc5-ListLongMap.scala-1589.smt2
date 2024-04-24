; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30148 () Bool)

(assert start!30148)

(declare-fun b!301996 () Bool)

(declare-fun e!190454 () Bool)

(assert (=> b!301996 (= e!190454 false)))

(declare-datatypes ((array!15312 0))(
  ( (array!15313 (arr!7245 (Array (_ BitVec 32) (_ BitVec 64))) (size!7597 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15312)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2350 0))(
  ( (MissingZero!2350 (index!11576 (_ BitVec 32))) (Found!2350 (index!11577 (_ BitVec 32))) (Intermediate!2350 (undefined!3162 Bool) (index!11578 (_ BitVec 32)) (x!29950 (_ BitVec 32))) (Undefined!2350) (MissingVacant!2350 (index!11579 (_ BitVec 32))) )
))
(declare-fun lt!150006 () SeekEntryResult!2350)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15312 (_ BitVec 32)) SeekEntryResult!2350)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!301996 (= lt!150006 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!301997 () Bool)

(declare-fun res!159657 () Bool)

(assert (=> b!301997 (=> (not res!159657) (not e!190454))))

(declare-fun arrayContainsKey!0 (array!15312 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!301997 (= res!159657 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!301999 () Bool)

(declare-fun res!159659 () Bool)

(assert (=> b!301999 (=> (not res!159659) (not e!190454))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15312 (_ BitVec 32)) SeekEntryResult!2350)

(assert (=> b!301999 (= res!159659 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2350 i!1240)))))

(declare-fun b!302000 () Bool)

(declare-fun res!159656 () Bool)

(assert (=> b!302000 (=> (not res!159656) (not e!190454))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15312 (_ BitVec 32)) Bool)

(assert (=> b!302000 (= res!159656 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!302001 () Bool)

(declare-fun res!159658 () Bool)

(assert (=> b!302001 (=> (not res!159658) (not e!190454))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!302001 (= res!159658 (validKeyInArray!0 k!2441))))

(declare-fun res!159655 () Bool)

(assert (=> start!30148 (=> (not res!159655) (not e!190454))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30148 (= res!159655 (validMask!0 mask!3709))))

(assert (=> start!30148 e!190454))

(assert (=> start!30148 true))

(declare-fun array_inv!5195 (array!15312) Bool)

(assert (=> start!30148 (array_inv!5195 a!3293)))

(declare-fun b!301998 () Bool)

(declare-fun res!159660 () Bool)

(assert (=> b!301998 (=> (not res!159660) (not e!190454))))

(assert (=> b!301998 (= res!159660 (and (= (size!7597 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7597 a!3293))))))

(assert (= (and start!30148 res!159655) b!301998))

(assert (= (and b!301998 res!159660) b!302001))

(assert (= (and b!302001 res!159658) b!301997))

(assert (= (and b!301997 res!159657) b!301999))

(assert (= (and b!301999 res!159659) b!302000))

(assert (= (and b!302000 res!159656) b!301996))

(declare-fun m!313809 () Bool)

(assert (=> start!30148 m!313809))

(declare-fun m!313811 () Bool)

(assert (=> start!30148 m!313811))

(declare-fun m!313813 () Bool)

(assert (=> b!301997 m!313813))

(declare-fun m!313815 () Bool)

(assert (=> b!301999 m!313815))

(declare-fun m!313817 () Bool)

(assert (=> b!302001 m!313817))

(declare-fun m!313819 () Bool)

(assert (=> b!301996 m!313819))

(assert (=> b!301996 m!313819))

(declare-fun m!313821 () Bool)

(assert (=> b!301996 m!313821))

(declare-fun m!313823 () Bool)

(assert (=> b!302000 m!313823))

(push 1)

(assert (not b!301999))

(assert (not b!302001))

(assert (not b!301997))

(assert (not b!302000))

(assert (not start!30148))

(assert (not b!301996))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

