; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29248 () Bool)

(assert start!29248)

(declare-fun b!296567 () Bool)

(declare-fun e!187434 () Bool)

(declare-fun e!187435 () Bool)

(assert (=> b!296567 (= e!187434 e!187435)))

(declare-fun res!156237 () Bool)

(assert (=> b!296567 (=> (not res!156237) (not e!187435))))

(declare-fun lt!147247 () Bool)

(declare-datatypes ((array!15006 0))(
  ( (array!15007 (arr!7112 (Array (_ BitVec 32) (_ BitVec 64))) (size!7464 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15006)

(declare-fun k!2524 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2261 0))(
  ( (MissingZero!2261 (index!11214 (_ BitVec 32))) (Found!2261 (index!11215 (_ BitVec 32))) (Intermediate!2261 (undefined!3073 Bool) (index!11216 (_ BitVec 32)) (x!29431 (_ BitVec 32))) (Undefined!2261) (MissingVacant!2261 (index!11217 (_ BitVec 32))) )
))
(declare-fun lt!147249 () SeekEntryResult!2261)

(assert (=> b!296567 (= res!156237 (and (or lt!147247 (not (undefined!3073 lt!147249))) (or lt!147247 (not (= (select (arr!7112 a!3312) (index!11216 lt!147249)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!147247 (not (= (select (arr!7112 a!3312) (index!11216 lt!147249)) k!2524))) (not lt!147247)))))

(assert (=> b!296567 (= lt!147247 (not (is-Intermediate!2261 lt!147249)))))

(declare-fun b!296568 () Bool)

(declare-fun e!187437 () Bool)

(declare-fun e!187436 () Bool)

(assert (=> b!296568 (= e!187437 e!187436)))

(declare-fun res!156236 () Bool)

(assert (=> b!296568 (=> (not res!156236) (not e!187436))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!147245 () SeekEntryResult!2261)

(declare-fun lt!147248 () Bool)

(assert (=> b!296568 (= res!156236 (or lt!147248 (= lt!147245 (MissingVacant!2261 i!1256))))))

(assert (=> b!296568 (= lt!147248 (= lt!147245 (MissingZero!2261 i!1256)))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15006 (_ BitVec 32)) SeekEntryResult!2261)

(assert (=> b!296568 (= lt!147245 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!296569 () Bool)

(declare-fun res!156234 () Bool)

(assert (=> b!296569 (=> (not res!156234) (not e!187436))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15006 (_ BitVec 32)) Bool)

(assert (=> b!296569 (= res!156234 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!296570 () Bool)

(assert (=> b!296570 (= e!187435 (not true))))

(assert (=> b!296570 (and (= (select (arr!7112 a!3312) (index!11216 lt!147249)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11216 lt!147249) i!1256))))

(declare-fun b!296571 () Bool)

(assert (=> b!296571 (= e!187436 e!187434)))

(declare-fun res!156235 () Bool)

(assert (=> b!296571 (=> (not res!156235) (not e!187434))))

(assert (=> b!296571 (= res!156235 lt!147248)))

(declare-fun lt!147246 () (_ BitVec 32))

(declare-fun lt!147244 () SeekEntryResult!2261)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15006 (_ BitVec 32)) SeekEntryResult!2261)

(assert (=> b!296571 (= lt!147244 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147246 k!2524 (array!15007 (store (arr!7112 a!3312) i!1256 k!2524) (size!7464 a!3312)) mask!3809))))

(assert (=> b!296571 (= lt!147249 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147246 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!296571 (= lt!147246 (toIndex!0 k!2524 mask!3809))))

(declare-fun res!156233 () Bool)

(assert (=> start!29248 (=> (not res!156233) (not e!187437))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29248 (= res!156233 (validMask!0 mask!3809))))

(assert (=> start!29248 e!187437))

(assert (=> start!29248 true))

(declare-fun array_inv!5075 (array!15006) Bool)

(assert (=> start!29248 (array_inv!5075 a!3312)))

(declare-fun b!296566 () Bool)

(declare-fun res!156238 () Bool)

(assert (=> b!296566 (=> (not res!156238) (not e!187437))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!296566 (= res!156238 (validKeyInArray!0 k!2524))))

(declare-fun b!296572 () Bool)

(declare-fun res!156240 () Bool)

(assert (=> b!296572 (=> (not res!156240) (not e!187437))))

(assert (=> b!296572 (= res!156240 (and (= (size!7464 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7464 a!3312))))))

(declare-fun b!296573 () Bool)

(declare-fun res!156239 () Bool)

(assert (=> b!296573 (=> (not res!156239) (not e!187437))))

(declare-fun arrayContainsKey!0 (array!15006 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!296573 (= res!156239 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!29248 res!156233) b!296572))

(assert (= (and b!296572 res!156240) b!296566))

(assert (= (and b!296566 res!156238) b!296573))

(assert (= (and b!296573 res!156239) b!296568))

(assert (= (and b!296568 res!156236) b!296569))

(assert (= (and b!296569 res!156234) b!296571))

(assert (= (and b!296571 res!156235) b!296567))

(assert (= (and b!296567 res!156237) b!296570))

(declare-fun m!309501 () Bool)

(assert (=> b!296570 m!309501))

(declare-fun m!309503 () Bool)

(assert (=> b!296569 m!309503))

(assert (=> b!296567 m!309501))

(declare-fun m!309505 () Bool)

(assert (=> b!296566 m!309505))

(declare-fun m!309507 () Bool)

(assert (=> b!296573 m!309507))

(declare-fun m!309509 () Bool)

(assert (=> b!296571 m!309509))

(declare-fun m!309511 () Bool)

(assert (=> b!296571 m!309511))

(declare-fun m!309513 () Bool)

(assert (=> b!296571 m!309513))

(declare-fun m!309515 () Bool)

(assert (=> b!296571 m!309515))

(declare-fun m!309517 () Bool)

(assert (=> b!296568 m!309517))

(declare-fun m!309519 () Bool)

(assert (=> start!29248 m!309519))

(declare-fun m!309521 () Bool)

(assert (=> start!29248 m!309521))

(push 1)

