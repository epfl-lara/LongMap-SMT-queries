; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30756 () Bool)

(assert start!30756)

(declare-fun b!308716 () Bool)

(declare-fun res!165384 () Bool)

(declare-fun e!192981 () Bool)

(assert (=> b!308716 (=> (not res!165384) (not e!192981))))

(declare-datatypes ((array!15722 0))(
  ( (array!15723 (arr!7444 (Array (_ BitVec 32) (_ BitVec 64))) (size!7796 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15722)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15722 (_ BitVec 32)) Bool)

(assert (=> b!308716 (= res!165384 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!308717 () Bool)

(declare-fun res!165381 () Bool)

(assert (=> b!308717 (=> (not res!165381) (not e!192981))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!308717 (= res!165381 (and (= (size!7796 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7796 a!3293))))))

(declare-fun b!308718 () Bool)

(declare-fun e!192982 () Bool)

(declare-fun e!192983 () Bool)

(assert (=> b!308718 (= e!192982 e!192983)))

(declare-fun res!165382 () Bool)

(assert (=> b!308718 (=> (not res!165382) (not e!192983))))

(declare-datatypes ((SeekEntryResult!2549 0))(
  ( (MissingZero!2549 (index!12372 (_ BitVec 32))) (Found!2549 (index!12373 (_ BitVec 32))) (Intermediate!2549 (undefined!3361 Bool) (index!12374 (_ BitVec 32)) (x!30718 (_ BitVec 32))) (Undefined!2549) (MissingVacant!2549 (index!12375 (_ BitVec 32))) )
))
(declare-fun lt!151457 () SeekEntryResult!2549)

(declare-fun lt!151458 () SeekEntryResult!2549)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!308718 (= res!165382 (and (= lt!151457 lt!151458) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7444 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15722 (_ BitVec 32)) SeekEntryResult!2549)

(assert (=> b!308718 (= lt!151457 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!308719 () Bool)

(assert (=> b!308719 (= e!192981 e!192982)))

(declare-fun res!165387 () Bool)

(assert (=> b!308719 (=> (not res!165387) (not e!192982))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308719 (= res!165387 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151458))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!308719 (= lt!151458 (Intermediate!2549 false resIndex!52 resX!52))))

(declare-fun b!308720 () Bool)

(declare-fun res!165380 () Bool)

(assert (=> b!308720 (=> (not res!165380) (not e!192982))))

(assert (=> b!308720 (= res!165380 (and (= (select (arr!7444 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7796 a!3293))))))

(declare-fun b!308721 () Bool)

(declare-fun res!165386 () Bool)

(assert (=> b!308721 (=> (not res!165386) (not e!192981))))

(declare-fun arrayContainsKey!0 (array!15722 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!308721 (= res!165386 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!308722 () Bool)

(declare-fun res!165379 () Bool)

(assert (=> b!308722 (=> (not res!165379) (not e!192981))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15722 (_ BitVec 32)) SeekEntryResult!2549)

(assert (=> b!308722 (= res!165379 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2549 i!1240)))))

(declare-fun res!165383 () Bool)

(assert (=> start!30756 (=> (not res!165383) (not e!192981))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30756 (= res!165383 (validMask!0 mask!3709))))

(assert (=> start!30756 e!192981))

(declare-fun array_inv!5394 (array!15722) Bool)

(assert (=> start!30756 (array_inv!5394 a!3293)))

(assert (=> start!30756 true))

(declare-fun b!308723 () Bool)

(declare-fun res!165385 () Bool)

(assert (=> b!308723 (=> (not res!165385) (not e!192981))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!308723 (= res!165385 (validKeyInArray!0 k0!2441))))

(declare-fun b!308724 () Bool)

(assert (=> b!308724 (= e!192983 (not (or (bvslt mask!3709 #b00000000000000000000000000000000) (bvslt index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308724 (= lt!151457 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k0!2441 a!3293 mask!3709))))

(assert (= (and start!30756 res!165383) b!308717))

(assert (= (and b!308717 res!165381) b!308723))

(assert (= (and b!308723 res!165385) b!308721))

(assert (= (and b!308721 res!165386) b!308722))

(assert (= (and b!308722 res!165379) b!308716))

(assert (= (and b!308716 res!165384) b!308719))

(assert (= (and b!308719 res!165387) b!308720))

(assert (= (and b!308720 res!165380) b!308718))

(assert (= (and b!308718 res!165382) b!308724))

(declare-fun m!318925 () Bool)

(assert (=> b!308718 m!318925))

(declare-fun m!318927 () Bool)

(assert (=> b!308718 m!318927))

(declare-fun m!318929 () Bool)

(assert (=> b!308719 m!318929))

(assert (=> b!308719 m!318929))

(declare-fun m!318931 () Bool)

(assert (=> b!308719 m!318931))

(declare-fun m!318933 () Bool)

(assert (=> start!30756 m!318933))

(declare-fun m!318935 () Bool)

(assert (=> start!30756 m!318935))

(declare-fun m!318937 () Bool)

(assert (=> b!308723 m!318937))

(declare-fun m!318939 () Bool)

(assert (=> b!308720 m!318939))

(declare-fun m!318941 () Bool)

(assert (=> b!308721 m!318941))

(declare-fun m!318943 () Bool)

(assert (=> b!308724 m!318943))

(assert (=> b!308724 m!318943))

(declare-fun m!318945 () Bool)

(assert (=> b!308724 m!318945))

(declare-fun m!318947 () Bool)

(assert (=> b!308716 m!318947))

(declare-fun m!318949 () Bool)

(assert (=> b!308722 m!318949))

(check-sat (not b!308716) (not b!308724) (not b!308722) (not b!308721) (not start!30756) (not b!308719) (not b!308718) (not b!308723))
(check-sat)
