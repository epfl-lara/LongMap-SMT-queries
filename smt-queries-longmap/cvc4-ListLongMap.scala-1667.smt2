; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30894 () Bool)

(assert start!30894)

(declare-fun b!309957 () Bool)

(declare-fun res!166415 () Bool)

(declare-fun e!193585 () Bool)

(assert (=> b!309957 (=> (not res!166415) (not e!193585))))

(declare-datatypes ((array!15796 0))(
  ( (array!15797 (arr!7480 (Array (_ BitVec 32) (_ BitVec 64))) (size!7832 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15796)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!309957 (= res!166415 (and (= (select (arr!7480 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7832 a!3293))))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun lt!151779 () (_ BitVec 32))

(declare-fun e!193583 () Bool)

(declare-fun b!309958 () Bool)

(assert (=> b!309958 (= e!193583 (not (or (bvslt mask!3709 #b00000000000000000000000000000000) (bvslt lt!151779 #b00000000000000000000000000000000) (bvsge lt!151779 (bvadd #b00000000000000000000000000000001 mask!3709)) (and (bvsle (bvadd #b00000000000000000000000000000001 x!1427) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000)))))))

(declare-datatypes ((SeekEntryResult!2620 0))(
  ( (MissingZero!2620 (index!12656 (_ BitVec 32))) (Found!2620 (index!12657 (_ BitVec 32))) (Intermediate!2620 (undefined!3432 Bool) (index!12658 (_ BitVec 32)) (x!30889 (_ BitVec 32))) (Undefined!2620) (MissingVacant!2620 (index!12659 (_ BitVec 32))) )
))
(declare-fun lt!151777 () SeekEntryResult!2620)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15796 (_ BitVec 32)) SeekEntryResult!2620)

(assert (=> b!309958 (= lt!151777 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!151779 k!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309958 (= lt!151779 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!309959 () Bool)

(assert (=> b!309959 (= e!193585 e!193583)))

(declare-fun res!166413 () Bool)

(assert (=> b!309959 (=> (not res!166413) (not e!193583))))

(declare-fun lt!151778 () SeekEntryResult!2620)

(assert (=> b!309959 (= res!166413 (and (= lt!151777 lt!151778) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7480 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!309959 (= lt!151777 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!309960 () Bool)

(declare-fun res!166411 () Bool)

(declare-fun e!193584 () Bool)

(assert (=> b!309960 (=> (not res!166411) (not e!193584))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15796 (_ BitVec 32)) SeekEntryResult!2620)

(assert (=> b!309960 (= res!166411 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2620 i!1240)))))

(declare-fun res!166418 () Bool)

(assert (=> start!30894 (=> (not res!166418) (not e!193584))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30894 (= res!166418 (validMask!0 mask!3709))))

(assert (=> start!30894 e!193584))

(declare-fun array_inv!5443 (array!15796) Bool)

(assert (=> start!30894 (array_inv!5443 a!3293)))

(assert (=> start!30894 true))

(declare-fun b!309961 () Bool)

(declare-fun res!166419 () Bool)

(assert (=> b!309961 (=> (not res!166419) (not e!193584))))

(assert (=> b!309961 (= res!166419 (and (= (size!7832 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7832 a!3293))))))

(declare-fun b!309962 () Bool)

(declare-fun res!166412 () Bool)

(assert (=> b!309962 (=> (not res!166412) (not e!193584))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!309962 (= res!166412 (validKeyInArray!0 k!2441))))

(declare-fun b!309963 () Bool)

(assert (=> b!309963 (= e!193584 e!193585)))

(declare-fun res!166416 () Bool)

(assert (=> b!309963 (=> (not res!166416) (not e!193585))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309963 (= res!166416 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!151778))))

(assert (=> b!309963 (= lt!151778 (Intermediate!2620 false resIndex!52 resX!52))))

(declare-fun b!309964 () Bool)

(declare-fun res!166417 () Bool)

(assert (=> b!309964 (=> (not res!166417) (not e!193584))))

(declare-fun arrayContainsKey!0 (array!15796 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!309964 (= res!166417 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!309965 () Bool)

(declare-fun res!166414 () Bool)

(assert (=> b!309965 (=> (not res!166414) (not e!193584))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15796 (_ BitVec 32)) Bool)

(assert (=> b!309965 (= res!166414 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(assert (= (and start!30894 res!166418) b!309961))

(assert (= (and b!309961 res!166419) b!309962))

(assert (= (and b!309962 res!166412) b!309964))

(assert (= (and b!309964 res!166417) b!309960))

(assert (= (and b!309960 res!166411) b!309965))

(assert (= (and b!309965 res!166414) b!309963))

(assert (= (and b!309963 res!166416) b!309957))

(assert (= (and b!309957 res!166415) b!309959))

(assert (= (and b!309959 res!166413) b!309958))

(declare-fun m!319845 () Bool)

(assert (=> start!30894 m!319845))

(declare-fun m!319847 () Bool)

(assert (=> start!30894 m!319847))

(declare-fun m!319849 () Bool)

(assert (=> b!309964 m!319849))

(declare-fun m!319851 () Bool)

(assert (=> b!309960 m!319851))

(declare-fun m!319853 () Bool)

(assert (=> b!309965 m!319853))

(declare-fun m!319855 () Bool)

(assert (=> b!309959 m!319855))

(declare-fun m!319857 () Bool)

(assert (=> b!309959 m!319857))

(declare-fun m!319859 () Bool)

(assert (=> b!309962 m!319859))

(declare-fun m!319861 () Bool)

(assert (=> b!309957 m!319861))

(declare-fun m!319863 () Bool)

(assert (=> b!309963 m!319863))

(assert (=> b!309963 m!319863))

(declare-fun m!319865 () Bool)

(assert (=> b!309963 m!319865))

(declare-fun m!319867 () Bool)

(assert (=> b!309958 m!319867))

(declare-fun m!319869 () Bool)

(assert (=> b!309958 m!319869))

(push 1)

(assert (not b!309959))

(assert (not b!309965))

(assert (not b!309964))

(assert (not b!309962))

(assert (not b!309963))

(assert (not b!309960))

(assert (not start!30894))

(assert (not b!309958))

(check-sat)

(pop 1)

(push 1)

(check-sat)

