; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30804 () Bool)

(assert start!30804)

(declare-fun b!309228 () Bool)

(declare-fun res!165848 () Bool)

(declare-fun e!193221 () Bool)

(assert (=> b!309228 (=> (not res!165848) (not e!193221))))

(declare-datatypes ((array!15757 0))(
  ( (array!15758 (arr!7462 (Array (_ BitVec 32) (_ BitVec 64))) (size!7814 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15757)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2602 0))(
  ( (MissingZero!2602 (index!12584 (_ BitVec 32))) (Found!2602 (index!12585 (_ BitVec 32))) (Intermediate!2602 (undefined!3414 Bool) (index!12586 (_ BitVec 32)) (x!30814 (_ BitVec 32))) (Undefined!2602) (MissingVacant!2602 (index!12587 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15757 (_ BitVec 32)) SeekEntryResult!2602)

(assert (=> b!309228 (= res!165848 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2602 i!1240)))))

(declare-fun b!309229 () Bool)

(declare-fun res!165841 () Bool)

(assert (=> b!309229 (=> (not res!165841) (not e!193221))))

(assert (=> b!309229 (= res!165841 (and (= (size!7814 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7814 a!3293))))))

(declare-fun res!165845 () Bool)

(assert (=> start!30804 (=> (not res!165845) (not e!193221))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30804 (= res!165845 (validMask!0 mask!3709))))

(assert (=> start!30804 e!193221))

(declare-fun array_inv!5425 (array!15757) Bool)

(assert (=> start!30804 (array_inv!5425 a!3293)))

(assert (=> start!30804 true))

(declare-fun b!309230 () Bool)

(declare-fun res!165846 () Bool)

(assert (=> b!309230 (=> (not res!165846) (not e!193221))))

(declare-fun arrayContainsKey!0 (array!15757 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!309230 (= res!165846 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!309231 () Bool)

(declare-fun res!165842 () Bool)

(assert (=> b!309231 (=> (not res!165842) (not e!193221))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!309231 (= res!165842 (validKeyInArray!0 k!2441))))

(declare-fun b!309232 () Bool)

(declare-fun e!193222 () Bool)

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!309232 (= e!193222 (not (or (bvslt mask!3709 #b00000000000000000000000000000000) (bvslt index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)))))))

(declare-fun lt!151542 () SeekEntryResult!2602)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15757 (_ BitVec 32)) SeekEntryResult!2602)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309232 (= lt!151542 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!309233 () Bool)

(declare-fun e!193219 () Bool)

(assert (=> b!309233 (= e!193219 e!193222)))

(declare-fun res!165847 () Bool)

(assert (=> b!309233 (=> (not res!165847) (not e!193222))))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun lt!151541 () SeekEntryResult!2602)

(assert (=> b!309233 (= res!165847 (and (= lt!151542 lt!151541) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7462 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!309233 (= lt!151542 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!309234 () Bool)

(declare-fun res!165844 () Bool)

(assert (=> b!309234 (=> (not res!165844) (not e!193221))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15757 (_ BitVec 32)) Bool)

(assert (=> b!309234 (= res!165844 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!309235 () Bool)

(assert (=> b!309235 (= e!193221 e!193219)))

(declare-fun res!165843 () Bool)

(assert (=> b!309235 (=> (not res!165843) (not e!193219))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309235 (= res!165843 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!151541))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!309235 (= lt!151541 (Intermediate!2602 false resIndex!52 resX!52))))

(declare-fun b!309236 () Bool)

(declare-fun res!165849 () Bool)

(assert (=> b!309236 (=> (not res!165849) (not e!193219))))

(assert (=> b!309236 (= res!165849 (and (= (select (arr!7462 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7814 a!3293))))))

(assert (= (and start!30804 res!165845) b!309229))

(assert (= (and b!309229 res!165841) b!309231))

(assert (= (and b!309231 res!165842) b!309230))

(assert (= (and b!309230 res!165846) b!309228))

(assert (= (and b!309228 res!165848) b!309234))

(assert (= (and b!309234 res!165844) b!309235))

(assert (= (and b!309235 res!165843) b!309236))

(assert (= (and b!309236 res!165849) b!309233))

(assert (= (and b!309233 res!165847) b!309232))

(declare-fun m!319239 () Bool)

(assert (=> b!309236 m!319239))

(declare-fun m!319241 () Bool)

(assert (=> b!309232 m!319241))

(assert (=> b!309232 m!319241))

(declare-fun m!319243 () Bool)

(assert (=> b!309232 m!319243))

(declare-fun m!319245 () Bool)

(assert (=> b!309228 m!319245))

(declare-fun m!319247 () Bool)

(assert (=> b!309230 m!319247))

(declare-fun m!319249 () Bool)

(assert (=> b!309235 m!319249))

(assert (=> b!309235 m!319249))

(declare-fun m!319251 () Bool)

(assert (=> b!309235 m!319251))

(declare-fun m!319253 () Bool)

(assert (=> b!309233 m!319253))

(declare-fun m!319255 () Bool)

(assert (=> b!309233 m!319255))

(declare-fun m!319257 () Bool)

(assert (=> b!309234 m!319257))

(declare-fun m!319259 () Bool)

(assert (=> b!309231 m!319259))

(declare-fun m!319261 () Bool)

(assert (=> start!30804 m!319261))

(declare-fun m!319263 () Bool)

(assert (=> start!30804 m!319263))

(push 1)

(assert (not b!309230))

(assert (not b!309228))

(assert (not b!309233))

(assert (not b!309235))

(assert (not start!30804))

(assert (not b!309234))

(assert (not b!309231))

(assert (not b!309232))

(check-sat)

(pop 1)

(push 1)

(check-sat)

