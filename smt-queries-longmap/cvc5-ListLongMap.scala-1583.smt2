; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30080 () Bool)

(assert start!30080)

(declare-fun b!301572 () Bool)

(declare-fun res!159253 () Bool)

(declare-fun e!190297 () Bool)

(assert (=> b!301572 (=> (not res!159253) (not e!190297))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!301572 (= res!159253 (validKeyInArray!0 k!2441))))

(declare-fun b!301573 () Bool)

(assert (=> b!301573 (= e!190297 false)))

(declare-fun lt!149865 () (_ BitVec 32))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!301573 (= lt!149865 (toIndex!0 k!2441 mask!3709))))

(declare-fun res!159255 () Bool)

(assert (=> start!30080 (=> (not res!159255) (not e!190297))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30080 (= res!159255 (validMask!0 mask!3709))))

(assert (=> start!30080 e!190297))

(assert (=> start!30080 true))

(declare-datatypes ((array!15270 0))(
  ( (array!15271 (arr!7226 (Array (_ BitVec 32) (_ BitVec 64))) (size!7578 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15270)

(declare-fun array_inv!5189 (array!15270) Bool)

(assert (=> start!30080 (array_inv!5189 a!3293)))

(declare-fun b!301574 () Bool)

(declare-fun res!159252 () Bool)

(assert (=> b!301574 (=> (not res!159252) (not e!190297))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15270 (_ BitVec 32)) Bool)

(assert (=> b!301574 (= res!159252 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!301575 () Bool)

(declare-fun res!159250 () Bool)

(assert (=> b!301575 (=> (not res!159250) (not e!190297))))

(declare-fun arrayContainsKey!0 (array!15270 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!301575 (= res!159250 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!301576 () Bool)

(declare-fun res!159254 () Bool)

(assert (=> b!301576 (=> (not res!159254) (not e!190297))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2366 0))(
  ( (MissingZero!2366 (index!11640 (_ BitVec 32))) (Found!2366 (index!11641 (_ BitVec 32))) (Intermediate!2366 (undefined!3178 Bool) (index!11642 (_ BitVec 32)) (x!29918 (_ BitVec 32))) (Undefined!2366) (MissingVacant!2366 (index!11643 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15270 (_ BitVec 32)) SeekEntryResult!2366)

(assert (=> b!301576 (= res!159254 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2366 i!1240)))))

(declare-fun b!301577 () Bool)

(declare-fun res!159251 () Bool)

(assert (=> b!301577 (=> (not res!159251) (not e!190297))))

(assert (=> b!301577 (= res!159251 (and (= (size!7578 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7578 a!3293))))))

(assert (= (and start!30080 res!159255) b!301577))

(assert (= (and b!301577 res!159251) b!301572))

(assert (= (and b!301572 res!159253) b!301575))

(assert (= (and b!301575 res!159250) b!301576))

(assert (= (and b!301576 res!159254) b!301574))

(assert (= (and b!301574 res!159252) b!301573))

(declare-fun m!313319 () Bool)

(assert (=> start!30080 m!313319))

(declare-fun m!313321 () Bool)

(assert (=> start!30080 m!313321))

(declare-fun m!313323 () Bool)

(assert (=> b!301575 m!313323))

(declare-fun m!313325 () Bool)

(assert (=> b!301572 m!313325))

(declare-fun m!313327 () Bool)

(assert (=> b!301574 m!313327))

(declare-fun m!313329 () Bool)

(assert (=> b!301576 m!313329))

(declare-fun m!313331 () Bool)

(assert (=> b!301573 m!313331))

(push 1)

(assert (not b!301573))

(assert (not b!301574))

(assert (not start!30080))

(assert (not b!301572))

(assert (not b!301575))

(assert (not b!301576))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

