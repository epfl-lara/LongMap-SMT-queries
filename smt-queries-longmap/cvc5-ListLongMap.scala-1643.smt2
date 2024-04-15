; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30628 () Bool)

(assert start!30628)

(declare-fun b!307226 () Bool)

(declare-fun res!164127 () Bool)

(declare-fun e!192347 () Bool)

(assert (=> b!307226 (=> (not res!164127) (not e!192347))))

(declare-datatypes ((array!15636 0))(
  ( (array!15637 (arr!7403 (Array (_ BitVec 32) (_ BitVec 64))) (size!7756 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15636)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2542 0))(
  ( (MissingZero!2542 (index!12344 (_ BitVec 32))) (Found!2542 (index!12345 (_ BitVec 32))) (Intermediate!2542 (undefined!3354 Bool) (index!12346 (_ BitVec 32)) (x!30596 (_ BitVec 32))) (Undefined!2542) (MissingVacant!2542 (index!12347 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15636 (_ BitVec 32)) SeekEntryResult!2542)

(assert (=> b!307226 (= res!164127 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2542 i!1240)))))

(declare-fun b!307227 () Bool)

(declare-fun res!164131 () Bool)

(assert (=> b!307227 (=> (not res!164131) (not e!192347))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!307227 (= res!164131 (and (= (select (arr!7403 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7756 a!3293))))))

(declare-fun b!307228 () Bool)

(declare-fun res!164133 () Bool)

(assert (=> b!307228 (=> (not res!164133) (not e!192347))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15636 (_ BitVec 32)) Bool)

(assert (=> b!307228 (= res!164133 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!307229 () Bool)

(declare-fun res!164126 () Bool)

(assert (=> b!307229 (=> (not res!164126) (not e!192347))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!307229 (= res!164126 (validKeyInArray!0 k!2441))))

(declare-fun b!307230 () Bool)

(declare-fun res!164130 () Bool)

(assert (=> b!307230 (=> (not res!164130) (not e!192347))))

(assert (=> b!307230 (= res!164130 (and (= (size!7756 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7756 a!3293))))))

(declare-fun b!307231 () Bool)

(declare-fun res!164129 () Bool)

(assert (=> b!307231 (=> (not res!164129) (not e!192347))))

(declare-fun arrayContainsKey!0 (array!15636 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!307231 (= res!164129 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun res!164128 () Bool)

(assert (=> start!30628 (=> (not res!164128) (not e!192347))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30628 (= res!164128 (validMask!0 mask!3709))))

(assert (=> start!30628 e!192347))

(declare-fun array_inv!5375 (array!15636) Bool)

(assert (=> start!30628 (array_inv!5375 a!3293)))

(assert (=> start!30628 true))

(declare-fun b!307232 () Bool)

(declare-fun res!164132 () Bool)

(assert (=> b!307232 (=> (not res!164132) (not e!192347))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15636 (_ BitVec 32)) SeekEntryResult!2542)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!307232 (= res!164132 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) (Intermediate!2542 false resIndex!52 resX!52)))))

(declare-fun b!307233 () Bool)

(assert (=> b!307233 (= e!192347 false)))

(declare-fun lt!150905 () SeekEntryResult!2542)

(assert (=> b!307233 (= lt!150905 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(assert (= (and start!30628 res!164128) b!307230))

(assert (= (and b!307230 res!164130) b!307229))

(assert (= (and b!307229 res!164126) b!307231))

(assert (= (and b!307231 res!164129) b!307226))

(assert (= (and b!307226 res!164127) b!307228))

(assert (= (and b!307228 res!164133) b!307232))

(assert (= (and b!307232 res!164132) b!307227))

(assert (= (and b!307227 res!164131) b!307233))

(declare-fun m!317069 () Bool)

(assert (=> b!307226 m!317069))

(declare-fun m!317071 () Bool)

(assert (=> b!307231 m!317071))

(declare-fun m!317073 () Bool)

(assert (=> b!307232 m!317073))

(assert (=> b!307232 m!317073))

(declare-fun m!317075 () Bool)

(assert (=> b!307232 m!317075))

(declare-fun m!317077 () Bool)

(assert (=> b!307229 m!317077))

(declare-fun m!317079 () Bool)

(assert (=> start!30628 m!317079))

(declare-fun m!317081 () Bool)

(assert (=> start!30628 m!317081))

(declare-fun m!317083 () Bool)

(assert (=> b!307233 m!317083))

(declare-fun m!317085 () Bool)

(assert (=> b!307227 m!317085))

(declare-fun m!317087 () Bool)

(assert (=> b!307228 m!317087))

(push 1)

(assert (not b!307232))

(assert (not b!307233))

(assert (not b!307231))

(assert (not b!307226))

(assert (not b!307229))

(assert (not start!30628))

(assert (not b!307228))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

