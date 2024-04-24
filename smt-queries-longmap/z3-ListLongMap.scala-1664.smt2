; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30804 () Bool)

(assert start!30804)

(declare-fun b!309364 () Bool)

(declare-fun e!193269 () Bool)

(declare-fun e!193271 () Bool)

(assert (=> b!309364 (= e!193269 e!193271)))

(declare-fun res!166027 () Bool)

(assert (=> b!309364 (=> (not res!166027) (not e!193271))))

(declare-datatypes ((SeekEntryResult!2573 0))(
  ( (MissingZero!2573 (index!12468 (_ BitVec 32))) (Found!2573 (index!12469 (_ BitVec 32))) (Intermediate!2573 (undefined!3385 Bool) (index!12470 (_ BitVec 32)) (x!30806 (_ BitVec 32))) (Undefined!2573) (MissingVacant!2573 (index!12471 (_ BitVec 32))) )
))
(declare-fun lt!151601 () SeekEntryResult!2573)

(declare-datatypes ((array!15770 0))(
  ( (array!15771 (arr!7468 (Array (_ BitVec 32) (_ BitVec 64))) (size!7820 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15770)

(declare-fun lt!151602 () SeekEntryResult!2573)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!309364 (= res!166027 (and (= lt!151601 lt!151602) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7468 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15770 (_ BitVec 32)) SeekEntryResult!2573)

(assert (=> b!309364 (= lt!151601 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!309365 () Bool)

(declare-fun res!166034 () Bool)

(declare-fun e!193272 () Bool)

(assert (=> b!309365 (=> (not res!166034) (not e!193272))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!309365 (= res!166034 (validKeyInArray!0 k0!2441))))

(declare-fun b!309366 () Bool)

(assert (=> b!309366 (= e!193272 e!193269)))

(declare-fun res!166028 () Bool)

(assert (=> b!309366 (=> (not res!166028) (not e!193269))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309366 (= res!166028 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151602))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!309366 (= lt!151602 (Intermediate!2573 false resIndex!52 resX!52))))

(declare-fun res!166030 () Bool)

(assert (=> start!30804 (=> (not res!166030) (not e!193272))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30804 (= res!166030 (validMask!0 mask!3709))))

(assert (=> start!30804 e!193272))

(declare-fun array_inv!5418 (array!15770) Bool)

(assert (=> start!30804 (array_inv!5418 a!3293)))

(assert (=> start!30804 true))

(declare-fun b!309367 () Bool)

(declare-fun res!166032 () Bool)

(assert (=> b!309367 (=> (not res!166032) (not e!193272))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15770 (_ BitVec 32)) Bool)

(assert (=> b!309367 (= res!166032 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!309368 () Bool)

(declare-fun res!166029 () Bool)

(assert (=> b!309368 (=> (not res!166029) (not e!193269))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!309368 (= res!166029 (and (= (select (arr!7468 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7820 a!3293))))))

(declare-fun b!309369 () Bool)

(declare-fun res!166031 () Bool)

(assert (=> b!309369 (=> (not res!166031) (not e!193272))))

(assert (=> b!309369 (= res!166031 (and (= (size!7820 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7820 a!3293))))))

(declare-fun b!309370 () Bool)

(assert (=> b!309370 (= e!193271 (not (bvsge mask!3709 #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309370 (= lt!151601 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!309371 () Bool)

(declare-fun res!166035 () Bool)

(assert (=> b!309371 (=> (not res!166035) (not e!193272))))

(declare-fun arrayContainsKey!0 (array!15770 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!309371 (= res!166035 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!309372 () Bool)

(declare-fun res!166033 () Bool)

(assert (=> b!309372 (=> (not res!166033) (not e!193272))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15770 (_ BitVec 32)) SeekEntryResult!2573)

(assert (=> b!309372 (= res!166033 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2573 i!1240)))))

(assert (= (and start!30804 res!166030) b!309369))

(assert (= (and b!309369 res!166031) b!309365))

(assert (= (and b!309365 res!166034) b!309371))

(assert (= (and b!309371 res!166035) b!309372))

(assert (= (and b!309372 res!166033) b!309367))

(assert (= (and b!309367 res!166032) b!309366))

(assert (= (and b!309366 res!166028) b!309368))

(assert (= (and b!309368 res!166029) b!309364))

(assert (= (and b!309364 res!166027) b!309370))

(declare-fun m!319549 () Bool)

(assert (=> b!309367 m!319549))

(declare-fun m!319551 () Bool)

(assert (=> b!309372 m!319551))

(declare-fun m!319553 () Bool)

(assert (=> b!309364 m!319553))

(declare-fun m!319555 () Bool)

(assert (=> b!309364 m!319555))

(declare-fun m!319557 () Bool)

(assert (=> b!309365 m!319557))

(declare-fun m!319559 () Bool)

(assert (=> b!309366 m!319559))

(assert (=> b!309366 m!319559))

(declare-fun m!319561 () Bool)

(assert (=> b!309366 m!319561))

(declare-fun m!319563 () Bool)

(assert (=> start!30804 m!319563))

(declare-fun m!319565 () Bool)

(assert (=> start!30804 m!319565))

(declare-fun m!319567 () Bool)

(assert (=> b!309368 m!319567))

(declare-fun m!319569 () Bool)

(assert (=> b!309371 m!319569))

(declare-fun m!319571 () Bool)

(assert (=> b!309370 m!319571))

(assert (=> b!309370 m!319571))

(declare-fun m!319573 () Bool)

(assert (=> b!309370 m!319573))

(check-sat (not b!309366) (not b!309364) (not b!309370) (not b!309372) (not start!30804) (not b!309365) (not b!309371) (not b!309367))
(check-sat)
