; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30758 () Bool)

(assert start!30758)

(declare-fun b!308607 () Bool)

(declare-fun e!192945 () Bool)

(declare-fun e!192946 () Bool)

(assert (=> b!308607 (= e!192945 e!192946)))

(declare-fun res!165224 () Bool)

(assert (=> b!308607 (=> (not res!165224) (not e!192946))))

(declare-datatypes ((SeekEntryResult!2579 0))(
  ( (MissingZero!2579 (index!12492 (_ BitVec 32))) (Found!2579 (index!12493 (_ BitVec 32))) (Intermediate!2579 (undefined!3391 Bool) (index!12494 (_ BitVec 32)) (x!30735 (_ BitVec 32))) (Undefined!2579) (MissingVacant!2579 (index!12495 (_ BitVec 32))) )
))
(declare-fun lt!151404 () SeekEntryResult!2579)

(declare-datatypes ((array!15711 0))(
  ( (array!15712 (arr!7439 (Array (_ BitVec 32) (_ BitVec 64))) (size!7791 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15711)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15711 (_ BitVec 32)) SeekEntryResult!2579)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308607 (= res!165224 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!151404))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!308607 (= lt!151404 (Intermediate!2579 false resIndex!52 resX!52))))

(declare-fun b!308608 () Bool)

(declare-fun res!165225 () Bool)

(assert (=> b!308608 (=> (not res!165225) (not e!192945))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!308608 (= res!165225 (and (= (size!7791 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7791 a!3293))))))

(declare-fun b!308609 () Bool)

(declare-fun res!165220 () Bool)

(assert (=> b!308609 (=> (not res!165220) (not e!192945))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15711 (_ BitVec 32)) Bool)

(assert (=> b!308609 (= res!165220 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!308610 () Bool)

(declare-fun res!165221 () Bool)

(assert (=> b!308610 (=> (not res!165221) (not e!192945))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!308610 (= res!165221 (validKeyInArray!0 k!2441))))

(declare-fun b!308611 () Bool)

(declare-fun res!165227 () Bool)

(assert (=> b!308611 (=> (not res!165227) (not e!192946))))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!308611 (= res!165227 (and (= (select (arr!7439 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7791 a!3293))))))

(declare-fun b!308612 () Bool)

(declare-fun res!165223 () Bool)

(assert (=> b!308612 (=> (not res!165223) (not e!192945))))

(declare-fun arrayContainsKey!0 (array!15711 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!308612 (= res!165223 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun res!165228 () Bool)

(assert (=> start!30758 (=> (not res!165228) (not e!192945))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30758 (= res!165228 (validMask!0 mask!3709))))

(assert (=> start!30758 e!192945))

(declare-fun array_inv!5402 (array!15711) Bool)

(assert (=> start!30758 (array_inv!5402 a!3293)))

(assert (=> start!30758 true))

(declare-fun b!308613 () Bool)

(declare-fun e!192944 () Bool)

(assert (=> b!308613 (= e!192944 (not (bvsge mask!3709 #b00000000000000000000000000000000)))))

(declare-fun lt!151403 () SeekEntryResult!2579)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308613 (= lt!151403 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!308614 () Bool)

(declare-fun res!165222 () Bool)

(assert (=> b!308614 (=> (not res!165222) (not e!192945))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15711 (_ BitVec 32)) SeekEntryResult!2579)

(assert (=> b!308614 (= res!165222 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2579 i!1240)))))

(declare-fun b!308615 () Bool)

(assert (=> b!308615 (= e!192946 e!192944)))

(declare-fun res!165226 () Bool)

(assert (=> b!308615 (=> (not res!165226) (not e!192944))))

(assert (=> b!308615 (= res!165226 (and (= lt!151403 lt!151404) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7439 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!308615 (= lt!151403 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(assert (= (and start!30758 res!165228) b!308608))

(assert (= (and b!308608 res!165225) b!308610))

(assert (= (and b!308610 res!165221) b!308612))

(assert (= (and b!308612 res!165223) b!308614))

(assert (= (and b!308614 res!165222) b!308609))

(assert (= (and b!308609 res!165220) b!308607))

(assert (= (and b!308607 res!165224) b!308611))

(assert (= (and b!308611 res!165227) b!308615))

(assert (= (and b!308615 res!165226) b!308613))

(declare-fun m!318641 () Bool)

(assert (=> b!308611 m!318641))

(declare-fun m!318643 () Bool)

(assert (=> b!308610 m!318643))

(declare-fun m!318645 () Bool)

(assert (=> b!308613 m!318645))

(assert (=> b!308613 m!318645))

(declare-fun m!318647 () Bool)

(assert (=> b!308613 m!318647))

(declare-fun m!318649 () Bool)

(assert (=> b!308612 m!318649))

(declare-fun m!318651 () Bool)

(assert (=> b!308607 m!318651))

(assert (=> b!308607 m!318651))

(declare-fun m!318653 () Bool)

(assert (=> b!308607 m!318653))

(declare-fun m!318655 () Bool)

(assert (=> start!30758 m!318655))

(declare-fun m!318657 () Bool)

(assert (=> start!30758 m!318657))

(declare-fun m!318659 () Bool)

(assert (=> b!308609 m!318659))

(declare-fun m!318661 () Bool)

(assert (=> b!308614 m!318661))

(declare-fun m!318663 () Bool)

(assert (=> b!308615 m!318663))

(declare-fun m!318665 () Bool)

(assert (=> b!308615 m!318665))

(push 1)

