; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30828 () Bool)

(assert start!30828)

(declare-fun b!309552 () Bool)

(declare-fun res!166167 () Bool)

(declare-fun e!193366 () Bool)

(assert (=> b!309552 (=> (not res!166167) (not e!193366))))

(declare-datatypes ((array!15781 0))(
  ( (array!15782 (arr!7474 (Array (_ BitVec 32) (_ BitVec 64))) (size!7826 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15781)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2614 0))(
  ( (MissingZero!2614 (index!12632 (_ BitVec 32))) (Found!2614 (index!12633 (_ BitVec 32))) (Intermediate!2614 (undefined!3426 Bool) (index!12634 (_ BitVec 32)) (x!30858 (_ BitVec 32))) (Undefined!2614) (MissingVacant!2614 (index!12635 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15781 (_ BitVec 32)) SeekEntryResult!2614)

(assert (=> b!309552 (= res!166167 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2614 i!1240)))))

(declare-fun b!309553 () Bool)

(declare-fun e!193363 () Bool)

(declare-fun e!193365 () Bool)

(assert (=> b!309553 (= e!193363 e!193365)))

(declare-fun res!166168 () Bool)

(assert (=> b!309553 (=> (not res!166168) (not e!193365))))

(declare-fun lt!151613 () SeekEntryResult!2614)

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun lt!151614 () SeekEntryResult!2614)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!309553 (= res!166168 (and (= lt!151613 lt!151614) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7474 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15781 (_ BitVec 32)) SeekEntryResult!2614)

(assert (=> b!309553 (= lt!151613 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!309554 () Bool)

(assert (=> b!309554 (= e!193365 (not true))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309554 (= lt!151613 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!309555 () Bool)

(declare-fun res!166171 () Bool)

(assert (=> b!309555 (=> (not res!166171) (not e!193363))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!309555 (= res!166171 (and (= (select (arr!7474 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7826 a!3293))))))

(declare-fun res!166173 () Bool)

(assert (=> start!30828 (=> (not res!166173) (not e!193366))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30828 (= res!166173 (validMask!0 mask!3709))))

(assert (=> start!30828 e!193366))

(declare-fun array_inv!5437 (array!15781) Bool)

(assert (=> start!30828 (array_inv!5437 a!3293)))

(assert (=> start!30828 true))

(declare-fun b!309556 () Bool)

(declare-fun res!166170 () Bool)

(assert (=> b!309556 (=> (not res!166170) (not e!193366))))

(declare-fun arrayContainsKey!0 (array!15781 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!309556 (= res!166170 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!309557 () Bool)

(declare-fun res!166169 () Bool)

(assert (=> b!309557 (=> (not res!166169) (not e!193366))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15781 (_ BitVec 32)) Bool)

(assert (=> b!309557 (= res!166169 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!309558 () Bool)

(declare-fun res!166166 () Bool)

(assert (=> b!309558 (=> (not res!166166) (not e!193366))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!309558 (= res!166166 (validKeyInArray!0 k!2441))))

(declare-fun b!309559 () Bool)

(assert (=> b!309559 (= e!193366 e!193363)))

(declare-fun res!166172 () Bool)

(assert (=> b!309559 (=> (not res!166172) (not e!193363))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309559 (= res!166172 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!151614))))

(assert (=> b!309559 (= lt!151614 (Intermediate!2614 false resIndex!52 resX!52))))

(declare-fun b!309560 () Bool)

(declare-fun res!166165 () Bool)

(assert (=> b!309560 (=> (not res!166165) (not e!193366))))

(assert (=> b!309560 (= res!166165 (and (= (size!7826 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7826 a!3293))))))

(assert (= (and start!30828 res!166173) b!309560))

(assert (= (and b!309560 res!166165) b!309558))

(assert (= (and b!309558 res!166166) b!309556))

(assert (= (and b!309556 res!166170) b!309552))

(assert (= (and b!309552 res!166167) b!309557))

(assert (= (and b!309557 res!166169) b!309559))

(assert (= (and b!309559 res!166172) b!309555))

(assert (= (and b!309555 res!166171) b!309553))

(assert (= (and b!309553 res!166168) b!309554))

(declare-fun m!319551 () Bool)

(assert (=> b!309559 m!319551))

(assert (=> b!309559 m!319551))

(declare-fun m!319553 () Bool)

(assert (=> b!309559 m!319553))

(declare-fun m!319555 () Bool)

(assert (=> b!309554 m!319555))

(assert (=> b!309554 m!319555))

(declare-fun m!319557 () Bool)

(assert (=> b!309554 m!319557))

(declare-fun m!319559 () Bool)

(assert (=> b!309557 m!319559))

(declare-fun m!319561 () Bool)

(assert (=> start!30828 m!319561))

(declare-fun m!319563 () Bool)

(assert (=> start!30828 m!319563))

(declare-fun m!319565 () Bool)

(assert (=> b!309556 m!319565))

(declare-fun m!319567 () Bool)

(assert (=> b!309558 m!319567))

(declare-fun m!319569 () Bool)

(assert (=> b!309552 m!319569))

(declare-fun m!319571 () Bool)

(assert (=> b!309553 m!319571))

(declare-fun m!319573 () Bool)

(assert (=> b!309553 m!319573))

(declare-fun m!319575 () Bool)

(assert (=> b!309555 m!319575))

(push 1)

(assert (not b!309553))

(assert (not b!309556))

(assert (not start!30828))

(assert (not b!309557))

(assert (not b!309554))

