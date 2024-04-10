; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30162 () Bool)

(assert start!30162)

(declare-fun res!159662 () Bool)

(declare-fun e!190489 () Bool)

(assert (=> start!30162 (=> (not res!159662) (not e!190489))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30162 (= res!159662 (validMask!0 mask!3709))))

(assert (=> start!30162 e!190489))

(assert (=> start!30162 true))

(declare-datatypes ((array!15313 0))(
  ( (array!15314 (arr!7246 (Array (_ BitVec 32) (_ BitVec 64))) (size!7598 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15313)

(declare-fun array_inv!5209 (array!15313) Bool)

(assert (=> start!30162 (array_inv!5209 a!3293)))

(declare-fun b!302049 () Bool)

(assert (=> b!302049 (= e!190489 false)))

(declare-datatypes ((SeekEntryResult!2386 0))(
  ( (MissingZero!2386 (index!11720 (_ BitVec 32))) (Found!2386 (index!11721 (_ BitVec 32))) (Intermediate!2386 (undefined!3198 Bool) (index!11722 (_ BitVec 32)) (x!29989 (_ BitVec 32))) (Undefined!2386) (MissingVacant!2386 (index!11723 (_ BitVec 32))) )
))
(declare-fun lt!149988 () SeekEntryResult!2386)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15313 (_ BitVec 32)) SeekEntryResult!2386)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!302049 (= lt!149988 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!302050 () Bool)

(declare-fun res!159660 () Bool)

(assert (=> b!302050 (=> (not res!159660) (not e!190489))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!302050 (= res!159660 (validKeyInArray!0 k!2441))))

(declare-fun b!302051 () Bool)

(declare-fun res!159658 () Bool)

(assert (=> b!302051 (=> (not res!159658) (not e!190489))))

(declare-fun arrayContainsKey!0 (array!15313 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!302051 (= res!159658 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!302052 () Bool)

(declare-fun res!159659 () Bool)

(assert (=> b!302052 (=> (not res!159659) (not e!190489))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!302052 (= res!159659 (and (= (size!7598 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7598 a!3293))))))

(declare-fun b!302053 () Bool)

(declare-fun res!159663 () Bool)

(assert (=> b!302053 (=> (not res!159663) (not e!190489))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15313 (_ BitVec 32)) Bool)

(assert (=> b!302053 (= res!159663 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!302054 () Bool)

(declare-fun res!159661 () Bool)

(assert (=> b!302054 (=> (not res!159661) (not e!190489))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15313 (_ BitVec 32)) SeekEntryResult!2386)

(assert (=> b!302054 (= res!159661 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2386 i!1240)))))

(assert (= (and start!30162 res!159662) b!302052))

(assert (= (and b!302052 res!159659) b!302050))

(assert (= (and b!302050 res!159660) b!302051))

(assert (= (and b!302051 res!159658) b!302054))

(assert (= (and b!302054 res!159661) b!302053))

(assert (= (and b!302053 res!159663) b!302049))

(declare-fun m!313699 () Bool)

(assert (=> b!302053 m!313699))

(declare-fun m!313701 () Bool)

(assert (=> b!302051 m!313701))

(declare-fun m!313703 () Bool)

(assert (=> b!302050 m!313703))

(declare-fun m!313705 () Bool)

(assert (=> b!302049 m!313705))

(assert (=> b!302049 m!313705))

(declare-fun m!313707 () Bool)

(assert (=> b!302049 m!313707))

(declare-fun m!313709 () Bool)

(assert (=> start!30162 m!313709))

(declare-fun m!313711 () Bool)

(assert (=> start!30162 m!313711))

(declare-fun m!313713 () Bool)

(assert (=> b!302054 m!313713))

(push 1)

(assert (not b!302054))

(assert (not b!302053))

(assert (not b!302050))

(assert (not start!30162))

(assert (not b!302051))

(assert (not b!302049))

(check-sat)

(pop 1)

(push 1)

