; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30780 () Bool)

(assert start!30780)

(declare-fun b!308904 () Bool)

(declare-fun res!165524 () Bool)

(declare-fun e!193077 () Bool)

(assert (=> b!308904 (=> (not res!165524) (not e!193077))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((array!15733 0))(
  ( (array!15734 (arr!7450 (Array (_ BitVec 32) (_ BitVec 64))) (size!7802 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15733)

(declare-datatypes ((SeekEntryResult!2590 0))(
  ( (MissingZero!2590 (index!12536 (_ BitVec 32))) (Found!2590 (index!12537 (_ BitVec 32))) (Intermediate!2590 (undefined!3402 Bool) (index!12538 (_ BitVec 32)) (x!30770 (_ BitVec 32))) (Undefined!2590) (MissingVacant!2590 (index!12539 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15733 (_ BitVec 32)) SeekEntryResult!2590)

(assert (=> b!308904 (= res!165524 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2590 i!1240)))))

(declare-fun e!193078 () Bool)

(declare-fun b!308905 () Bool)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!308905 (= e!193078 (not (or (bvslt mask!3709 #b00000000000000000000000000000000) (bvsge index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsle x!1427 #b01111111111111111111111111111110))))))

(declare-fun lt!151470 () SeekEntryResult!2590)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15733 (_ BitVec 32)) SeekEntryResult!2590)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308905 (= lt!151470 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!308906 () Bool)

(declare-fun e!193075 () Bool)

(assert (=> b!308906 (= e!193077 e!193075)))

(declare-fun res!165523 () Bool)

(assert (=> b!308906 (=> (not res!165523) (not e!193075))))

(declare-fun lt!151469 () SeekEntryResult!2590)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308906 (= res!165523 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!151469))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!308906 (= lt!151469 (Intermediate!2590 false resIndex!52 resX!52))))

(declare-fun b!308907 () Bool)

(declare-fun res!165525 () Bool)

(assert (=> b!308907 (=> (not res!165525) (not e!193075))))

(assert (=> b!308907 (= res!165525 (and (= (select (arr!7450 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7802 a!3293))))))

(declare-fun b!308908 () Bool)

(declare-fun res!165517 () Bool)

(assert (=> b!308908 (=> (not res!165517) (not e!193077))))

(declare-fun arrayContainsKey!0 (array!15733 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!308908 (= res!165517 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun res!165520 () Bool)

(assert (=> start!30780 (=> (not res!165520) (not e!193077))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30780 (= res!165520 (validMask!0 mask!3709))))

(assert (=> start!30780 e!193077))

(declare-fun array_inv!5413 (array!15733) Bool)

(assert (=> start!30780 (array_inv!5413 a!3293)))

(assert (=> start!30780 true))

(declare-fun b!308909 () Bool)

(declare-fun res!165521 () Bool)

(assert (=> b!308909 (=> (not res!165521) (not e!193077))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!308909 (= res!165521 (validKeyInArray!0 k!2441))))

(declare-fun b!308910 () Bool)

(assert (=> b!308910 (= e!193075 e!193078)))

(declare-fun res!165518 () Bool)

(assert (=> b!308910 (=> (not res!165518) (not e!193078))))

(assert (=> b!308910 (= res!165518 (and (= lt!151470 lt!151469) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7450 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!308910 (= lt!151470 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!308911 () Bool)

(declare-fun res!165519 () Bool)

(assert (=> b!308911 (=> (not res!165519) (not e!193077))))

(assert (=> b!308911 (= res!165519 (and (= (size!7802 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7802 a!3293))))))

(declare-fun b!308912 () Bool)

(declare-fun res!165522 () Bool)

(assert (=> b!308912 (=> (not res!165522) (not e!193077))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15733 (_ BitVec 32)) Bool)

(assert (=> b!308912 (= res!165522 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(assert (= (and start!30780 res!165520) b!308911))

(assert (= (and b!308911 res!165519) b!308909))

(assert (= (and b!308909 res!165521) b!308908))

(assert (= (and b!308908 res!165517) b!308904))

(assert (= (and b!308904 res!165524) b!308912))

(assert (= (and b!308912 res!165522) b!308906))

(assert (= (and b!308906 res!165523) b!308907))

(assert (= (and b!308907 res!165525) b!308910))

(assert (= (and b!308910 res!165518) b!308905))

(declare-fun m!318927 () Bool)

(assert (=> b!308904 m!318927))

(declare-fun m!318929 () Bool)

(assert (=> b!308905 m!318929))

(assert (=> b!308905 m!318929))

(declare-fun m!318931 () Bool)

(assert (=> b!308905 m!318931))

(declare-fun m!318933 () Bool)

(assert (=> b!308908 m!318933))

(declare-fun m!318935 () Bool)

(assert (=> b!308910 m!318935))

(declare-fun m!318937 () Bool)

(assert (=> b!308910 m!318937))

(declare-fun m!318939 () Bool)

(assert (=> b!308912 m!318939))

(declare-fun m!318941 () Bool)

(assert (=> b!308909 m!318941))

(declare-fun m!318943 () Bool)

(assert (=> b!308907 m!318943))

(declare-fun m!318945 () Bool)

(assert (=> start!30780 m!318945))

(declare-fun m!318947 () Bool)

(assert (=> start!30780 m!318947))

(declare-fun m!318949 () Bool)

(assert (=> b!308906 m!318949))

(assert (=> b!308906 m!318949))

(declare-fun m!318951 () Bool)

(assert (=> b!308906 m!318951))

(push 1)

(assert (not b!308906))

(assert (not start!30780))

(assert (not b!308910))

(assert (not b!308904))

(assert (not b!308909))

(assert (not b!308905))

