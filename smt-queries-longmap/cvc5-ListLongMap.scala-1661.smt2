; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30790 () Bool)

(assert start!30790)

(declare-fun b!309175 () Bool)

(declare-fun res!165846 () Bool)

(declare-fun e!193185 () Bool)

(assert (=> b!309175 (=> (not res!165846) (not e!193185))))

(declare-datatypes ((array!15756 0))(
  ( (array!15757 (arr!7461 (Array (_ BitVec 32) (_ BitVec 64))) (size!7813 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15756)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15756 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!309175 (= res!165846 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!309176 () Bool)

(declare-fun res!165841 () Bool)

(assert (=> b!309176 (=> (not res!165841) (not e!193185))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2566 0))(
  ( (MissingZero!2566 (index!12440 (_ BitVec 32))) (Found!2566 (index!12441 (_ BitVec 32))) (Intermediate!2566 (undefined!3378 Bool) (index!12442 (_ BitVec 32)) (x!30775 (_ BitVec 32))) (Undefined!2566) (MissingVacant!2566 (index!12443 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15756 (_ BitVec 32)) SeekEntryResult!2566)

(assert (=> b!309176 (= res!165841 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2566 i!1240)))))

(declare-fun b!309177 () Bool)

(declare-fun res!165840 () Bool)

(assert (=> b!309177 (=> (not res!165840) (not e!193185))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15756 (_ BitVec 32)) Bool)

(assert (=> b!309177 (= res!165840 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!309178 () Bool)

(declare-fun e!193188 () Bool)

(assert (=> b!309178 (= e!193185 e!193188)))

(declare-fun res!165839 () Bool)

(assert (=> b!309178 (=> (not res!165839) (not e!193188))))

(declare-fun lt!151559 () SeekEntryResult!2566)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15756 (_ BitVec 32)) SeekEntryResult!2566)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309178 (= res!165839 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!151559))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!309178 (= lt!151559 (Intermediate!2566 false resIndex!52 resX!52))))

(declare-fun b!309179 () Bool)

(declare-fun res!165842 () Bool)

(assert (=> b!309179 (=> (not res!165842) (not e!193185))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!309179 (= res!165842 (validKeyInArray!0 k!2441))))

(declare-fun b!309181 () Bool)

(declare-fun e!193187 () Bool)

(assert (=> b!309181 (= e!193188 e!193187)))

(declare-fun res!165845 () Bool)

(assert (=> b!309181 (=> (not res!165845) (not e!193187))))

(declare-fun lt!151560 () SeekEntryResult!2566)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!309181 (= res!165845 (and (= lt!151560 lt!151559) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7461 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!309181 (= lt!151560 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!309182 () Bool)

(declare-fun res!165838 () Bool)

(assert (=> b!309182 (=> (not res!165838) (not e!193185))))

(assert (=> b!309182 (= res!165838 (and (= (size!7813 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7813 a!3293))))))

(declare-fun b!309183 () Bool)

(declare-fun res!165844 () Bool)

(assert (=> b!309183 (=> (not res!165844) (not e!193188))))

(assert (=> b!309183 (= res!165844 (and (= (select (arr!7461 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7813 a!3293))))))

(declare-fun res!165843 () Bool)

(assert (=> start!30790 (=> (not res!165843) (not e!193185))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30790 (= res!165843 (validMask!0 mask!3709))))

(assert (=> start!30790 e!193185))

(declare-fun array_inv!5411 (array!15756) Bool)

(assert (=> start!30790 (array_inv!5411 a!3293)))

(assert (=> start!30790 true))

(declare-fun b!309180 () Bool)

(assert (=> b!309180 (= e!193187 (not (or (bvslt mask!3709 #b00000000000000000000000000000000) (bvslt index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309180 (= lt!151560 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k!2441 a!3293 mask!3709))))

(assert (= (and start!30790 res!165843) b!309182))

(assert (= (and b!309182 res!165838) b!309179))

(assert (= (and b!309179 res!165842) b!309175))

(assert (= (and b!309175 res!165846) b!309176))

(assert (= (and b!309176 res!165841) b!309177))

(assert (= (and b!309177 res!165840) b!309178))

(assert (= (and b!309178 res!165839) b!309183))

(assert (= (and b!309183 res!165844) b!309181))

(assert (= (and b!309181 res!165845) b!309180))

(declare-fun m!319367 () Bool)

(assert (=> b!309183 m!319367))

(declare-fun m!319369 () Bool)

(assert (=> b!309180 m!319369))

(assert (=> b!309180 m!319369))

(declare-fun m!319371 () Bool)

(assert (=> b!309180 m!319371))

(declare-fun m!319373 () Bool)

(assert (=> b!309178 m!319373))

(assert (=> b!309178 m!319373))

(declare-fun m!319375 () Bool)

(assert (=> b!309178 m!319375))

(declare-fun m!319377 () Bool)

(assert (=> start!30790 m!319377))

(declare-fun m!319379 () Bool)

(assert (=> start!30790 m!319379))

(declare-fun m!319381 () Bool)

(assert (=> b!309179 m!319381))

(declare-fun m!319383 () Bool)

(assert (=> b!309175 m!319383))

(declare-fun m!319385 () Bool)

(assert (=> b!309176 m!319385))

(declare-fun m!319387 () Bool)

(assert (=> b!309177 m!319387))

(declare-fun m!319389 () Bool)

(assert (=> b!309181 m!319389))

(declare-fun m!319391 () Bool)

(assert (=> b!309181 m!319391))

(push 1)

(assert (not b!309177))

(assert (not b!309180))

(assert (not start!30790))

(assert (not b!309176))

(assert (not b!309175))

(assert (not b!309181))

(assert (not b!309179))

(assert (not b!309178))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

