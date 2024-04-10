; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30764 () Bool)

(assert start!30764)

(declare-fun b!308688 () Bool)

(declare-fun e!192981 () Bool)

(declare-fun e!192979 () Bool)

(assert (=> b!308688 (= e!192981 e!192979)))

(declare-fun res!165307 () Bool)

(assert (=> b!308688 (=> (not res!165307) (not e!192979))))

(declare-datatypes ((SeekEntryResult!2582 0))(
  ( (MissingZero!2582 (index!12504 (_ BitVec 32))) (Found!2582 (index!12505 (_ BitVec 32))) (Intermediate!2582 (undefined!3394 Bool) (index!12506 (_ BitVec 32)) (x!30746 (_ BitVec 32))) (Undefined!2582) (MissingVacant!2582 (index!12507 (_ BitVec 32))) )
))
(declare-fun lt!151422 () SeekEntryResult!2582)

(declare-datatypes ((array!15717 0))(
  ( (array!15718 (arr!7442 (Array (_ BitVec 32) (_ BitVec 64))) (size!7794 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15717)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15717 (_ BitVec 32)) SeekEntryResult!2582)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308688 (= res!165307 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!151422))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!308688 (= lt!151422 (Intermediate!2582 false resIndex!52 resX!52))))

(declare-fun b!308689 () Bool)

(declare-fun res!165303 () Bool)

(assert (=> b!308689 (=> (not res!165303) (not e!192981))))

(declare-fun arrayContainsKey!0 (array!15717 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!308689 (= res!165303 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!308690 () Bool)

(declare-fun res!165308 () Bool)

(assert (=> b!308690 (=> (not res!165308) (not e!192981))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15717 (_ BitVec 32)) Bool)

(assert (=> b!308690 (= res!165308 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!308691 () Bool)

(declare-fun e!192982 () Bool)

(assert (=> b!308691 (= e!192982 (not true))))

(declare-fun lt!151421 () SeekEntryResult!2582)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308691 (= lt!151421 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!308692 () Bool)

(declare-fun res!165302 () Bool)

(assert (=> b!308692 (=> (not res!165302) (not e!192979))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!308692 (= res!165302 (and (= (select (arr!7442 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7794 a!3293))))))

(declare-fun b!308694 () Bool)

(declare-fun res!165306 () Bool)

(assert (=> b!308694 (=> (not res!165306) (not e!192981))))

(assert (=> b!308694 (= res!165306 (and (= (size!7794 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7794 a!3293))))))

(declare-fun b!308695 () Bool)

(assert (=> b!308695 (= e!192979 e!192982)))

(declare-fun res!165309 () Bool)

(assert (=> b!308695 (=> (not res!165309) (not e!192982))))

(assert (=> b!308695 (= res!165309 (and (= lt!151421 lt!151422) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7442 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!308695 (= lt!151421 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!308696 () Bool)

(declare-fun res!165304 () Bool)

(assert (=> b!308696 (=> (not res!165304) (not e!192981))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!308696 (= res!165304 (validKeyInArray!0 k!2441))))

(declare-fun res!165305 () Bool)

(assert (=> start!30764 (=> (not res!165305) (not e!192981))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30764 (= res!165305 (validMask!0 mask!3709))))

(assert (=> start!30764 e!192981))

(declare-fun array_inv!5405 (array!15717) Bool)

(assert (=> start!30764 (array_inv!5405 a!3293)))

(assert (=> start!30764 true))

(declare-fun b!308693 () Bool)

(declare-fun res!165301 () Bool)

(assert (=> b!308693 (=> (not res!165301) (not e!192981))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15717 (_ BitVec 32)) SeekEntryResult!2582)

(assert (=> b!308693 (= res!165301 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2582 i!1240)))))

(assert (= (and start!30764 res!165305) b!308694))

(assert (= (and b!308694 res!165306) b!308696))

(assert (= (and b!308696 res!165304) b!308689))

(assert (= (and b!308689 res!165303) b!308693))

(assert (= (and b!308693 res!165301) b!308690))

(assert (= (and b!308690 res!165308) b!308688))

(assert (= (and b!308688 res!165307) b!308692))

(assert (= (and b!308692 res!165302) b!308695))

(assert (= (and b!308695 res!165309) b!308691))

(declare-fun m!318719 () Bool)

(assert (=> b!308693 m!318719))

(declare-fun m!318721 () Bool)

(assert (=> b!308691 m!318721))

(assert (=> b!308691 m!318721))

(declare-fun m!318723 () Bool)

(assert (=> b!308691 m!318723))

(declare-fun m!318725 () Bool)

(assert (=> b!308696 m!318725))

(declare-fun m!318727 () Bool)

(assert (=> start!30764 m!318727))

(declare-fun m!318729 () Bool)

(assert (=> start!30764 m!318729))

(declare-fun m!318731 () Bool)

(assert (=> b!308690 m!318731))

(declare-fun m!318733 () Bool)

(assert (=> b!308692 m!318733))

(declare-fun m!318735 () Bool)

(assert (=> b!308695 m!318735))

(declare-fun m!318737 () Bool)

(assert (=> b!308695 m!318737))

(declare-fun m!318739 () Bool)

(assert (=> b!308688 m!318739))

(assert (=> b!308688 m!318739))

(declare-fun m!318741 () Bool)

(assert (=> b!308688 m!318741))

(declare-fun m!318743 () Bool)

(assert (=> b!308689 m!318743))

(push 1)

