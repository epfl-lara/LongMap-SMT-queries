; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30912 () Bool)

(assert start!30912)

(declare-fun b!310217 () Bool)

(declare-fun res!166672 () Bool)

(declare-fun e!193711 () Bool)

(assert (=> b!310217 (=> (not res!166672) (not e!193711))))

(declare-datatypes ((array!15814 0))(
  ( (array!15815 (arr!7489 (Array (_ BitVec 32) (_ BitVec 64))) (size!7841 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15814)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2629 0))(
  ( (MissingZero!2629 (index!12692 (_ BitVec 32))) (Found!2629 (index!12693 (_ BitVec 32))) (Intermediate!2629 (undefined!3441 Bool) (index!12694 (_ BitVec 32)) (x!30922 (_ BitVec 32))) (Undefined!2629) (MissingVacant!2629 (index!12695 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15814 (_ BitVec 32)) SeekEntryResult!2629)

(assert (=> b!310217 (= res!166672 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2629 i!1240)))))

(declare-fun b!310218 () Bool)

(declare-fun e!193708 () Bool)

(assert (=> b!310218 (= e!193711 e!193708)))

(declare-fun res!166676 () Bool)

(assert (=> b!310218 (=> (not res!166676) (not e!193708))))

(declare-fun lt!151868 () SeekEntryResult!2629)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15814 (_ BitVec 32)) SeekEntryResult!2629)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310218 (= res!166676 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!151868))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!310218 (= lt!151868 (Intermediate!2629 false resIndex!52 resX!52))))

(declare-fun b!310219 () Bool)

(declare-fun res!166671 () Bool)

(assert (=> b!310219 (=> (not res!166671) (not e!193711))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15814 (_ BitVec 32)) Bool)

(assert (=> b!310219 (= res!166671 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun e!193707 () Bool)

(declare-fun b!310220 () Bool)

(declare-fun lt!151866 () array!15814)

(declare-fun lt!151867 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!310220 (= e!193707 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!151866 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!151867 k!2441 lt!151866 mask!3709)))))

(assert (=> b!310220 (= lt!151866 (array!15815 (store (arr!7489 a!3293) i!1240 k!2441) (size!7841 a!3293)))))

(declare-fun b!310221 () Bool)

(declare-fun e!193710 () Bool)

(assert (=> b!310221 (= e!193708 e!193710)))

(declare-fun res!166680 () Bool)

(assert (=> b!310221 (=> (not res!166680) (not e!193710))))

(declare-fun lt!151869 () SeekEntryResult!2629)

(assert (=> b!310221 (= res!166680 (and (= lt!151869 lt!151868) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7489 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!310221 (= lt!151869 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!310222 () Bool)

(declare-fun res!166678 () Bool)

(assert (=> b!310222 (=> (not res!166678) (not e!193711))))

(assert (=> b!310222 (= res!166678 (and (= (size!7841 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7841 a!3293))))))

(declare-fun b!310223 () Bool)

(declare-fun res!166677 () Bool)

(assert (=> b!310223 (=> (not res!166677) (not e!193711))))

(declare-fun arrayContainsKey!0 (array!15814 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!310223 (= res!166677 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!310224 () Bool)

(declare-fun res!166673 () Bool)

(assert (=> b!310224 (=> (not res!166673) (not e!193708))))

(assert (=> b!310224 (= res!166673 (and (= (select (arr!7489 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7841 a!3293))))))

(declare-fun res!166674 () Bool)

(assert (=> start!30912 (=> (not res!166674) (not e!193711))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30912 (= res!166674 (validMask!0 mask!3709))))

(assert (=> start!30912 e!193711))

(declare-fun array_inv!5452 (array!15814) Bool)

(assert (=> start!30912 (array_inv!5452 a!3293)))

(assert (=> start!30912 true))

(declare-fun b!310225 () Bool)

(assert (=> b!310225 (= e!193710 (not (bvsge mask!3709 #b00000000000000000000000000000000)))))

(assert (=> b!310225 e!193707))

(declare-fun res!166675 () Bool)

(assert (=> b!310225 (=> (not res!166675) (not e!193707))))

(assert (=> b!310225 (= res!166675 (= lt!151869 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!151867 k!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310225 (= lt!151867 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!310226 () Bool)

(declare-fun res!166679 () Bool)

(assert (=> b!310226 (=> (not res!166679) (not e!193711))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!310226 (= res!166679 (validKeyInArray!0 k!2441))))

(assert (= (and start!30912 res!166674) b!310222))

(assert (= (and b!310222 res!166678) b!310226))

(assert (= (and b!310226 res!166679) b!310223))

(assert (= (and b!310223 res!166677) b!310217))

(assert (= (and b!310217 res!166672) b!310219))

(assert (= (and b!310219 res!166671) b!310218))

(assert (= (and b!310218 res!166676) b!310224))

(assert (= (and b!310224 res!166673) b!310221))

(assert (= (and b!310221 res!166680) b!310225))

(assert (= (and b!310225 res!166675) b!310220))

(declare-fun m!320109 () Bool)

(assert (=> b!310221 m!320109))

(declare-fun m!320111 () Bool)

(assert (=> b!310221 m!320111))

(declare-fun m!320113 () Bool)

(assert (=> b!310225 m!320113))

(declare-fun m!320115 () Bool)

(assert (=> b!310225 m!320115))

(declare-fun m!320117 () Bool)

(assert (=> b!310220 m!320117))

(declare-fun m!320119 () Bool)

(assert (=> b!310220 m!320119))

(declare-fun m!320121 () Bool)

(assert (=> b!310220 m!320121))

(declare-fun m!320123 () Bool)

(assert (=> b!310217 m!320123))

(declare-fun m!320125 () Bool)

(assert (=> start!30912 m!320125))

(declare-fun m!320127 () Bool)

(assert (=> start!30912 m!320127))

(declare-fun m!320129 () Bool)

(assert (=> b!310226 m!320129))

(declare-fun m!320131 () Bool)

(assert (=> b!310219 m!320131))

(declare-fun m!320133 () Bool)

(assert (=> b!310223 m!320133))

(declare-fun m!320135 () Bool)

(assert (=> b!310224 m!320135))

(declare-fun m!320137 () Bool)

(assert (=> b!310218 m!320137))

(assert (=> b!310218 m!320137))

(declare-fun m!320139 () Bool)

(assert (=> b!310218 m!320139))

(push 1)

(assert (not b!310225))

(assert (not b!310219))

(assert (not b!310223))

(assert (not b!310226))

(assert (not b!310220))

(assert (not b!310217))

(assert (not b!310218))

(assert (not start!30912))

(assert (not b!310221))

(check-sat)

