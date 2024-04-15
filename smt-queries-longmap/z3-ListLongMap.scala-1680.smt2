; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30954 () Bool)

(assert start!30954)

(declare-fun b!310782 () Bool)

(declare-fun e!193955 () Bool)

(declare-fun e!193951 () Bool)

(assert (=> b!310782 (= e!193955 e!193951)))

(declare-fun res!167386 () Bool)

(assert (=> b!310782 (=> (not res!167386) (not e!193951))))

(declare-datatypes ((SeekEntryResult!2651 0))(
  ( (MissingZero!2651 (index!12780 (_ BitVec 32))) (Found!2651 (index!12781 (_ BitVec 32))) (Intermediate!2651 (undefined!3463 Bool) (index!12782 (_ BitVec 32)) (x!31019 (_ BitVec 32))) (Undefined!2651) (MissingVacant!2651 (index!12783 (_ BitVec 32))) )
))
(declare-fun lt!151970 () SeekEntryResult!2651)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-datatypes ((array!15860 0))(
  ( (array!15861 (arr!7512 (Array (_ BitVec 32) (_ BitVec 64))) (size!7865 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15860)

(declare-fun lt!151969 () SeekEntryResult!2651)

(assert (=> b!310782 (= res!167386 (and (= lt!151969 lt!151970) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7512 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15860 (_ BitVec 32)) SeekEntryResult!2651)

(assert (=> b!310782 (= lt!151969 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!310783 () Bool)

(declare-fun res!167388 () Bool)

(assert (=> b!310783 (=> (not res!167388) (not e!193955))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!310783 (= res!167388 (and (= (select (arr!7512 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7865 a!3293))))))

(declare-fun b!310784 () Bool)

(declare-fun res!167384 () Bool)

(declare-fun e!193952 () Bool)

(assert (=> b!310784 (=> (not res!167384) (not e!193952))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!310784 (= res!167384 (validKeyInArray!0 k0!2441))))

(declare-fun b!310785 () Bool)

(declare-fun res!167387 () Bool)

(assert (=> b!310785 (=> (not res!167387) (not e!193952))))

(assert (=> b!310785 (= res!167387 (and (= (size!7865 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7865 a!3293))))))

(declare-fun res!167391 () Bool)

(assert (=> start!30954 (=> (not res!167391) (not e!193952))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30954 (= res!167391 (validMask!0 mask!3709))))

(assert (=> start!30954 e!193952))

(declare-fun array_inv!5484 (array!15860) Bool)

(assert (=> start!30954 (array_inv!5484 a!3293)))

(assert (=> start!30954 true))

(declare-fun lt!151968 () array!15860)

(declare-fun b!310786 () Bool)

(declare-fun e!193953 () Bool)

(declare-fun lt!151967 () (_ BitVec 32))

(assert (=> b!310786 (= e!193953 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!151968 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!151967 k0!2441 lt!151968 mask!3709)))))

(assert (=> b!310786 (= lt!151968 (array!15861 (store (arr!7512 a!3293) i!1240 k0!2441) (size!7865 a!3293)))))

(declare-fun b!310787 () Bool)

(assert (=> b!310787 (= e!193952 e!193955)))

(declare-fun res!167383 () Bool)

(assert (=> b!310787 (=> (not res!167383) (not e!193955))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310787 (= res!167383 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151970))))

(assert (=> b!310787 (= lt!151970 (Intermediate!2651 false resIndex!52 resX!52))))

(declare-fun b!310788 () Bool)

(declare-fun res!167389 () Bool)

(assert (=> b!310788 (=> (not res!167389) (not e!193952))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15860 (_ BitVec 32)) SeekEntryResult!2651)

(assert (=> b!310788 (= res!167389 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2651 i!1240)))))

(declare-fun b!310789 () Bool)

(declare-fun res!167382 () Bool)

(assert (=> b!310789 (=> (not res!167382) (not e!193952))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15860 (_ BitVec 32)) Bool)

(assert (=> b!310789 (= res!167382 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!310790 () Bool)

(assert (=> b!310790 (= e!193951 (not true))))

(assert (=> b!310790 e!193953))

(declare-fun res!167385 () Bool)

(assert (=> b!310790 (=> (not res!167385) (not e!193953))))

(assert (=> b!310790 (= res!167385 (= lt!151969 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!151967 k0!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310790 (= lt!151967 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!310791 () Bool)

(declare-fun res!167390 () Bool)

(assert (=> b!310791 (=> (not res!167390) (not e!193952))))

(declare-fun arrayContainsKey!0 (array!15860 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!310791 (= res!167390 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(assert (= (and start!30954 res!167391) b!310785))

(assert (= (and b!310785 res!167387) b!310784))

(assert (= (and b!310784 res!167384) b!310791))

(assert (= (and b!310791 res!167390) b!310788))

(assert (= (and b!310788 res!167389) b!310789))

(assert (= (and b!310789 res!167382) b!310787))

(assert (= (and b!310787 res!167383) b!310783))

(assert (= (and b!310783 res!167388) b!310782))

(assert (= (and b!310782 res!167386) b!310790))

(assert (= (and b!310790 res!167385) b!310786))

(declare-fun m!320275 () Bool)

(assert (=> b!310789 m!320275))

(declare-fun m!320277 () Bool)

(assert (=> b!310786 m!320277))

(declare-fun m!320279 () Bool)

(assert (=> b!310786 m!320279))

(declare-fun m!320281 () Bool)

(assert (=> b!310786 m!320281))

(declare-fun m!320283 () Bool)

(assert (=> b!310790 m!320283))

(declare-fun m!320285 () Bool)

(assert (=> b!310790 m!320285))

(declare-fun m!320287 () Bool)

(assert (=> start!30954 m!320287))

(declare-fun m!320289 () Bool)

(assert (=> start!30954 m!320289))

(declare-fun m!320291 () Bool)

(assert (=> b!310783 m!320291))

(declare-fun m!320293 () Bool)

(assert (=> b!310787 m!320293))

(assert (=> b!310787 m!320293))

(declare-fun m!320295 () Bool)

(assert (=> b!310787 m!320295))

(declare-fun m!320297 () Bool)

(assert (=> b!310788 m!320297))

(declare-fun m!320299 () Bool)

(assert (=> b!310791 m!320299))

(declare-fun m!320301 () Bool)

(assert (=> b!310782 m!320301))

(declare-fun m!320303 () Bool)

(assert (=> b!310782 m!320303))

(declare-fun m!320305 () Bool)

(assert (=> b!310784 m!320305))

(check-sat (not b!310787) (not b!310782) (not b!310789) (not b!310784) (not b!310788) (not b!310791) (not start!30954) (not b!310790) (not b!310786))
(check-sat)
