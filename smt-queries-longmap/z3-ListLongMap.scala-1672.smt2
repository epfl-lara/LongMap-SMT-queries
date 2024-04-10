; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30922 () Bool)

(assert start!30922)

(declare-fun b!310367 () Bool)

(declare-fun res!166829 () Bool)

(declare-fun e!193786 () Bool)

(assert (=> b!310367 (=> (not res!166829) (not e!193786))))

(declare-datatypes ((array!15824 0))(
  ( (array!15825 (arr!7494 (Array (_ BitVec 32) (_ BitVec 64))) (size!7846 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15824)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!310367 (= res!166829 (and (= (size!7846 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7846 a!3293))))))

(declare-fun res!166830 () Bool)

(assert (=> start!30922 (=> (not res!166830) (not e!193786))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30922 (= res!166830 (validMask!0 mask!3709))))

(assert (=> start!30922 e!193786))

(declare-fun array_inv!5457 (array!15824) Bool)

(assert (=> start!30922 (array_inv!5457 a!3293)))

(assert (=> start!30922 true))

(declare-fun b!310368 () Bool)

(declare-fun e!193782 () Bool)

(assert (=> b!310368 (= e!193786 e!193782)))

(declare-fun res!166828 () Bool)

(assert (=> b!310368 (=> (not res!166828) (not e!193782))))

(declare-datatypes ((SeekEntryResult!2634 0))(
  ( (MissingZero!2634 (index!12712 (_ BitVec 32))) (Found!2634 (index!12713 (_ BitVec 32))) (Intermediate!2634 (undefined!3446 Bool) (index!12714 (_ BitVec 32)) (x!30943 (_ BitVec 32))) (Undefined!2634) (MissingVacant!2634 (index!12715 (_ BitVec 32))) )
))
(declare-fun lt!151926 () SeekEntryResult!2634)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15824 (_ BitVec 32)) SeekEntryResult!2634)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310368 (= res!166828 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151926))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!310368 (= lt!151926 (Intermediate!2634 false resIndex!52 resX!52))))

(declare-fun b!310369 () Bool)

(declare-fun res!166826 () Bool)

(assert (=> b!310369 (=> (not res!166826) (not e!193786))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!310369 (= res!166826 (validKeyInArray!0 k0!2441))))

(declare-fun b!310370 () Bool)

(declare-fun res!166824 () Bool)

(assert (=> b!310370 (=> (not res!166824) (not e!193786))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15824 (_ BitVec 32)) Bool)

(assert (=> b!310370 (= res!166824 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun e!193783 () Bool)

(declare-fun lt!151927 () array!15824)

(declare-fun lt!151929 () (_ BitVec 32))

(declare-fun b!310371 () Bool)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!310371 (= e!193783 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!151927 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!151929 k0!2441 lt!151927 mask!3709)))))

(assert (=> b!310371 (= lt!151927 (array!15825 (store (arr!7494 a!3293) i!1240 k0!2441) (size!7846 a!3293)))))

(declare-fun b!310372 () Bool)

(declare-fun e!193784 () Bool)

(assert (=> b!310372 (= e!193782 e!193784)))

(declare-fun res!166822 () Bool)

(assert (=> b!310372 (=> (not res!166822) (not e!193784))))

(declare-fun lt!151928 () SeekEntryResult!2634)

(assert (=> b!310372 (= res!166822 (and (= lt!151928 lt!151926) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7494 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!310372 (= lt!151928 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!310373 () Bool)

(declare-fun res!166825 () Bool)

(assert (=> b!310373 (=> (not res!166825) (not e!193786))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15824 (_ BitVec 32)) SeekEntryResult!2634)

(assert (=> b!310373 (= res!166825 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2634 i!1240)))))

(declare-fun b!310374 () Bool)

(declare-fun res!166823 () Bool)

(assert (=> b!310374 (=> (not res!166823) (not e!193782))))

(assert (=> b!310374 (= res!166823 (and (= (select (arr!7494 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7846 a!3293))))))

(declare-fun b!310375 () Bool)

(declare-fun res!166827 () Bool)

(assert (=> b!310375 (=> (not res!166827) (not e!193786))))

(declare-fun arrayContainsKey!0 (array!15824 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!310375 (= res!166827 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!310376 () Bool)

(assert (=> b!310376 (= e!193784 (not (or (bvslt mask!3709 #b00000000000000000000000000000000) (bvsge index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsle x!1427 #b01111111111111111111111111111110))))))

(assert (=> b!310376 e!193783))

(declare-fun res!166821 () Bool)

(assert (=> b!310376 (=> (not res!166821) (not e!193783))))

(assert (=> b!310376 (= res!166821 (= lt!151928 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!151929 k0!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310376 (= lt!151929 (nextIndex!0 index!1781 x!1427 mask!3709))))

(assert (= (and start!30922 res!166830) b!310367))

(assert (= (and b!310367 res!166829) b!310369))

(assert (= (and b!310369 res!166826) b!310375))

(assert (= (and b!310375 res!166827) b!310373))

(assert (= (and b!310373 res!166825) b!310370))

(assert (= (and b!310370 res!166824) b!310368))

(assert (= (and b!310368 res!166828) b!310374))

(assert (= (and b!310374 res!166823) b!310372))

(assert (= (and b!310372 res!166822) b!310376))

(assert (= (and b!310376 res!166821) b!310371))

(declare-fun m!320269 () Bool)

(assert (=> b!310376 m!320269))

(declare-fun m!320271 () Bool)

(assert (=> b!310376 m!320271))

(declare-fun m!320273 () Bool)

(assert (=> b!310369 m!320273))

(declare-fun m!320275 () Bool)

(assert (=> b!310373 m!320275))

(declare-fun m!320277 () Bool)

(assert (=> start!30922 m!320277))

(declare-fun m!320279 () Bool)

(assert (=> start!30922 m!320279))

(declare-fun m!320281 () Bool)

(assert (=> b!310374 m!320281))

(declare-fun m!320283 () Bool)

(assert (=> b!310370 m!320283))

(declare-fun m!320285 () Bool)

(assert (=> b!310368 m!320285))

(assert (=> b!310368 m!320285))

(declare-fun m!320287 () Bool)

(assert (=> b!310368 m!320287))

(declare-fun m!320289 () Bool)

(assert (=> b!310371 m!320289))

(declare-fun m!320291 () Bool)

(assert (=> b!310371 m!320291))

(declare-fun m!320293 () Bool)

(assert (=> b!310371 m!320293))

(declare-fun m!320295 () Bool)

(assert (=> b!310375 m!320295))

(declare-fun m!320297 () Bool)

(assert (=> b!310372 m!320297))

(declare-fun m!320299 () Bool)

(assert (=> b!310372 m!320299))

(check-sat (not start!30922) (not b!310376) (not b!310368) (not b!310369) (not b!310370) (not b!310372) (not b!310371) (not b!310375) (not b!310373))
(check-sat)
