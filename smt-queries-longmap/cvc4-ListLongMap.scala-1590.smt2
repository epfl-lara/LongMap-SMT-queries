; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30168 () Bool)

(assert start!30168)

(declare-fun b!302111 () Bool)

(declare-fun res!159722 () Bool)

(declare-fun e!190506 () Bool)

(assert (=> b!302111 (=> (not res!159722) (not e!190506))))

(declare-datatypes ((array!15319 0))(
  ( (array!15320 (arr!7249 (Array (_ BitVec 32) (_ BitVec 64))) (size!7601 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15319)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!302111 (= res!159722 (and (= (size!7601 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7601 a!3293))))))

(declare-fun b!302112 () Bool)

(declare-fun res!159723 () Bool)

(assert (=> b!302112 (=> (not res!159723) (not e!190506))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!302112 (= res!159723 (validKeyInArray!0 k!2441))))

(declare-fun b!302113 () Bool)

(declare-fun res!159724 () Bool)

(assert (=> b!302113 (=> (not res!159724) (not e!190506))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15319 (_ BitVec 32)) Bool)

(assert (=> b!302113 (= res!159724 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun res!159720 () Bool)

(assert (=> start!30168 (=> (not res!159720) (not e!190506))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30168 (= res!159720 (validMask!0 mask!3709))))

(assert (=> start!30168 e!190506))

(declare-fun array_inv!5212 (array!15319) Bool)

(assert (=> start!30168 (array_inv!5212 a!3293)))

(assert (=> start!30168 true))

(declare-fun b!302114 () Bool)

(declare-fun res!159725 () Bool)

(assert (=> b!302114 (=> (not res!159725) (not e!190506))))

(declare-fun arrayContainsKey!0 (array!15319 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!302114 (= res!159725 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!302115 () Bool)

(declare-fun res!159721 () Bool)

(assert (=> b!302115 (=> (not res!159721) (not e!190506))))

(declare-datatypes ((SeekEntryResult!2389 0))(
  ( (MissingZero!2389 (index!11732 (_ BitVec 32))) (Found!2389 (index!11733 (_ BitVec 32))) (Intermediate!2389 (undefined!3201 Bool) (index!11734 (_ BitVec 32)) (x!30000 (_ BitVec 32))) (Undefined!2389) (MissingVacant!2389 (index!11735 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15319 (_ BitVec 32)) SeekEntryResult!2389)

(assert (=> b!302115 (= res!159721 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2389 i!1240)))))

(declare-fun b!302116 () Bool)

(declare-fun res!159726 () Bool)

(assert (=> b!302116 (=> (not res!159726) (not e!190506))))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15319 (_ BitVec 32)) SeekEntryResult!2389)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!302116 (= res!159726 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) (Intermediate!2389 false resIndex!52 resX!52)))))

(declare-fun b!302117 () Bool)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!302117 (= e!190506 (and (= (select (arr!7249 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7601 a!3293)) (bvsge mask!3709 #b00000000000000000000000000000000) (bvsge index!1781 (bvadd #b00000000000000000000000000000001 mask!3709))))))

(assert (= (and start!30168 res!159720) b!302111))

(assert (= (and b!302111 res!159722) b!302112))

(assert (= (and b!302112 res!159723) b!302114))

(assert (= (and b!302114 res!159725) b!302115))

(assert (= (and b!302115 res!159721) b!302113))

(assert (= (and b!302113 res!159724) b!302116))

(assert (= (and b!302116 res!159726) b!302117))

(declare-fun m!313751 () Bool)

(assert (=> b!302117 m!313751))

(declare-fun m!313753 () Bool)

(assert (=> b!302113 m!313753))

(declare-fun m!313755 () Bool)

(assert (=> b!302112 m!313755))

(declare-fun m!313757 () Bool)

(assert (=> b!302114 m!313757))

(declare-fun m!313759 () Bool)

(assert (=> start!30168 m!313759))

(declare-fun m!313761 () Bool)

(assert (=> start!30168 m!313761))

(declare-fun m!313763 () Bool)

(assert (=> b!302116 m!313763))

(assert (=> b!302116 m!313763))

(declare-fun m!313765 () Bool)

(assert (=> b!302116 m!313765))

(declare-fun m!313767 () Bool)

(assert (=> b!302115 m!313767))

(push 1)

(assert (not b!302113))

(assert (not b!302115))

(assert (not b!302114))

(assert (not b!302116))

(assert (not start!30168))

(assert (not b!302112))

(check-sat)

(pop 1)

(push 1)

(check-sat)

