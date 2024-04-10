; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30144 () Bool)

(assert start!30144)

(declare-fun b!301878 () Bool)

(declare-fun res!159490 () Bool)

(declare-fun e!190435 () Bool)

(assert (=> b!301878 (=> (not res!159490) (not e!190435))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!301878 (= res!159490 (validKeyInArray!0 k!2441))))

(declare-fun res!159488 () Bool)

(assert (=> start!30144 (=> (not res!159488) (not e!190435))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30144 (= res!159488 (validMask!0 mask!3709))))

(assert (=> start!30144 e!190435))

(assert (=> start!30144 true))

(declare-datatypes ((array!15295 0))(
  ( (array!15296 (arr!7237 (Array (_ BitVec 32) (_ BitVec 64))) (size!7589 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15295)

(declare-fun array_inv!5200 (array!15295) Bool)

(assert (=> start!30144 (array_inv!5200 a!3293)))

(declare-fun b!301879 () Bool)

(declare-fun res!159492 () Bool)

(assert (=> b!301879 (=> (not res!159492) (not e!190435))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15295 (_ BitVec 32)) Bool)

(assert (=> b!301879 (= res!159492 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!301880 () Bool)

(declare-fun res!159489 () Bool)

(assert (=> b!301880 (=> (not res!159489) (not e!190435))))

(declare-fun arrayContainsKey!0 (array!15295 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!301880 (= res!159489 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!301881 () Bool)

(assert (=> b!301881 (= e!190435 false)))

(declare-fun lt!149970 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!301881 (= lt!149970 (toIndex!0 k!2441 mask!3709))))

(declare-fun b!301882 () Bool)

(declare-fun res!159491 () Bool)

(assert (=> b!301882 (=> (not res!159491) (not e!190435))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!301882 (= res!159491 (and (= (size!7589 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7589 a!3293))))))

(declare-fun b!301883 () Bool)

(declare-fun res!159487 () Bool)

(assert (=> b!301883 (=> (not res!159487) (not e!190435))))

(declare-datatypes ((SeekEntryResult!2377 0))(
  ( (MissingZero!2377 (index!11684 (_ BitVec 32))) (Found!2377 (index!11685 (_ BitVec 32))) (Intermediate!2377 (undefined!3189 Bool) (index!11686 (_ BitVec 32)) (x!29956 (_ BitVec 32))) (Undefined!2377) (MissingVacant!2377 (index!11687 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15295 (_ BitVec 32)) SeekEntryResult!2377)

(assert (=> b!301883 (= res!159487 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2377 i!1240)))))

(assert (= (and start!30144 res!159488) b!301882))

(assert (= (and b!301882 res!159491) b!301878))

(assert (= (and b!301878 res!159490) b!301880))

(assert (= (and b!301880 res!159489) b!301883))

(assert (= (and b!301883 res!159487) b!301879))

(assert (= (and b!301879 res!159492) b!301881))

(declare-fun m!313551 () Bool)

(assert (=> start!30144 m!313551))

(declare-fun m!313553 () Bool)

(assert (=> start!30144 m!313553))

(declare-fun m!313555 () Bool)

(assert (=> b!301878 m!313555))

(declare-fun m!313557 () Bool)

(assert (=> b!301883 m!313557))

(declare-fun m!313559 () Bool)

(assert (=> b!301881 m!313559))

(declare-fun m!313561 () Bool)

(assert (=> b!301880 m!313561))

(declare-fun m!313563 () Bool)

(assert (=> b!301879 m!313563))

(push 1)

(assert (not b!301878))

(assert (not b!301879))

(assert (not b!301880))

(assert (not b!301881))

(assert (not b!301883))

(assert (not start!30144))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

