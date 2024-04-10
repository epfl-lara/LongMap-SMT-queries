; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30654 () Bool)

(assert start!30654)

(declare-fun res!164421 () Bool)

(declare-fun e!192575 () Bool)

(assert (=> start!30654 (=> (not res!164421) (not e!192575))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30654 (= res!164421 (validMask!0 mask!3709))))

(assert (=> start!30654 e!192575))

(declare-datatypes ((array!15658 0))(
  ( (array!15659 (arr!7414 (Array (_ BitVec 32) (_ BitVec 64))) (size!7766 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15658)

(declare-fun array_inv!5377 (array!15658) Bool)

(assert (=> start!30654 (array_inv!5377 a!3293)))

(assert (=> start!30654 true))

(declare-fun b!307662 () Bool)

(declare-fun res!164424 () Bool)

(assert (=> b!307662 (=> (not res!164424) (not e!192575))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!307662 (= res!164424 (and (= (size!7766 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7766 a!3293))))))

(declare-fun b!307663 () Bool)

(declare-fun res!164422 () Bool)

(assert (=> b!307663 (=> (not res!164422) (not e!192575))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!307663 (= res!164422 (validKeyInArray!0 k!2441))))

(declare-fun b!307664 () Bool)

(declare-fun res!164416 () Bool)

(assert (=> b!307664 (=> (not res!164416) (not e!192575))))

(declare-fun arrayContainsKey!0 (array!15658 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!307664 (= res!164416 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!307665 () Bool)

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun e!192577 () Bool)

(assert (=> b!307665 (= e!192577 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7414 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52)) (bvsge mask!3709 #b00000000000000000000000000000000) (bvsge index!1781 (bvadd #b00000000000000000000000000000001 mask!3709))))))

(declare-fun b!307666 () Bool)

(declare-fun res!164419 () Bool)

(assert (=> b!307666 (=> (not res!164419) (not e!192575))))

(declare-datatypes ((SeekEntryResult!2554 0))(
  ( (MissingZero!2554 (index!12392 (_ BitVec 32))) (Found!2554 (index!12393 (_ BitVec 32))) (Intermediate!2554 (undefined!3366 Bool) (index!12394 (_ BitVec 32)) (x!30629 (_ BitVec 32))) (Undefined!2554) (MissingVacant!2554 (index!12395 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15658 (_ BitVec 32)) SeekEntryResult!2554)

(assert (=> b!307666 (= res!164419 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2554 i!1240)))))

(declare-fun b!307667 () Bool)

(declare-fun res!164418 () Bool)

(assert (=> b!307667 (=> (not res!164418) (not e!192577))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!307667 (= res!164418 (and (= (select (arr!7414 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7766 a!3293))))))

(declare-fun b!307668 () Bool)

(assert (=> b!307668 (= e!192575 e!192577)))

(declare-fun res!164417 () Bool)

(assert (=> b!307668 (=> (not res!164417) (not e!192577))))

(declare-fun lt!151158 () SeekEntryResult!2554)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15658 (_ BitVec 32)) SeekEntryResult!2554)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!307668 (= res!164417 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!151158))))

(assert (=> b!307668 (= lt!151158 (Intermediate!2554 false resIndex!52 resX!52))))

(declare-fun b!307669 () Bool)

(declare-fun res!164423 () Bool)

(assert (=> b!307669 (=> (not res!164423) (not e!192575))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15658 (_ BitVec 32)) Bool)

(assert (=> b!307669 (= res!164423 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!307670 () Bool)

(declare-fun res!164420 () Bool)

(assert (=> b!307670 (=> (not res!164420) (not e!192577))))

(assert (=> b!307670 (= res!164420 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!151158))))

(assert (= (and start!30654 res!164421) b!307662))

(assert (= (and b!307662 res!164424) b!307663))

(assert (= (and b!307663 res!164422) b!307664))

(assert (= (and b!307664 res!164416) b!307666))

(assert (= (and b!307666 res!164419) b!307669))

(assert (= (and b!307669 res!164423) b!307668))

(assert (= (and b!307668 res!164417) b!307667))

(assert (= (and b!307667 res!164418) b!307670))

(assert (= (and b!307670 res!164420) b!307665))

(declare-fun m!317929 () Bool)

(assert (=> b!307664 m!317929))

(declare-fun m!317931 () Bool)

(assert (=> b!307670 m!317931))

(declare-fun m!317933 () Bool)

(assert (=> b!307667 m!317933))

(declare-fun m!317935 () Bool)

(assert (=> b!307668 m!317935))

(assert (=> b!307668 m!317935))

(declare-fun m!317937 () Bool)

(assert (=> b!307668 m!317937))

(declare-fun m!317939 () Bool)

(assert (=> b!307669 m!317939))

(declare-fun m!317941 () Bool)

(assert (=> b!307665 m!317941))

(declare-fun m!317943 () Bool)

(assert (=> b!307663 m!317943))

(declare-fun m!317945 () Bool)

(assert (=> start!30654 m!317945))

(declare-fun m!317947 () Bool)

(assert (=> start!30654 m!317947))

(declare-fun m!317949 () Bool)

(assert (=> b!307666 m!317949))

(push 1)

(assert (not b!307666))

(assert (not b!307669))

(assert (not b!307663))

(assert (not start!30654))

(assert (not b!307664))

(assert (not b!307668))

(assert (not b!307670))

(check-sat)

(pop 1)

(push 1)

(check-sat)

