; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30066 () Bool)

(assert start!30066)

(declare-fun b!301519 () Bool)

(declare-fun res!159249 () Bool)

(declare-fun e!190263 () Bool)

(assert (=> b!301519 (=> (not res!159249) (not e!190263))))

(declare-datatypes ((array!15269 0))(
  ( (array!15270 (arr!7225 (Array (_ BitVec 32) (_ BitVec 64))) (size!7577 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15269)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15269 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!301519 (= res!159249 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!301520 () Bool)

(declare-fun res!159252 () Bool)

(assert (=> b!301520 (=> (not res!159252) (not e!190263))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15269 (_ BitVec 32)) Bool)

(assert (=> b!301520 (= res!159252 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!301521 () Bool)

(assert (=> b!301521 (= e!190263 false)))

(declare-fun lt!149883 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!301521 (= lt!149883 (toIndex!0 k0!2441 mask!3709))))

(declare-fun res!159248 () Bool)

(assert (=> start!30066 (=> (not res!159248) (not e!190263))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30066 (= res!159248 (validMask!0 mask!3709))))

(assert (=> start!30066 e!190263))

(assert (=> start!30066 true))

(declare-fun array_inv!5175 (array!15269) Bool)

(assert (=> start!30066 (array_inv!5175 a!3293)))

(declare-fun b!301522 () Bool)

(declare-fun res!159250 () Bool)

(assert (=> b!301522 (=> (not res!159250) (not e!190263))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!301522 (= res!159250 (validKeyInArray!0 k0!2441))))

(declare-fun b!301523 () Bool)

(declare-fun res!159247 () Bool)

(assert (=> b!301523 (=> (not res!159247) (not e!190263))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!301523 (= res!159247 (and (= (size!7577 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7577 a!3293))))))

(declare-fun b!301524 () Bool)

(declare-fun res!159251 () Bool)

(assert (=> b!301524 (=> (not res!159251) (not e!190263))))

(declare-datatypes ((SeekEntryResult!2330 0))(
  ( (MissingZero!2330 (index!11496 (_ BitVec 32))) (Found!2330 (index!11497 (_ BitVec 32))) (Intermediate!2330 (undefined!3142 Bool) (index!11498 (_ BitVec 32)) (x!29879 (_ BitVec 32))) (Undefined!2330) (MissingVacant!2330 (index!11499 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15269 (_ BitVec 32)) SeekEntryResult!2330)

(assert (=> b!301524 (= res!159251 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2330 i!1240)))))

(assert (= (and start!30066 res!159248) b!301523))

(assert (= (and b!301523 res!159247) b!301522))

(assert (= (and b!301522 res!159250) b!301519))

(assert (= (and b!301519 res!159249) b!301524))

(assert (= (and b!301524 res!159251) b!301520))

(assert (= (and b!301520 res!159252) b!301521))

(declare-fun m!313429 () Bool)

(assert (=> b!301524 m!313429))

(declare-fun m!313431 () Bool)

(assert (=> b!301522 m!313431))

(declare-fun m!313433 () Bool)

(assert (=> b!301521 m!313433))

(declare-fun m!313435 () Bool)

(assert (=> start!30066 m!313435))

(declare-fun m!313437 () Bool)

(assert (=> start!30066 m!313437))

(declare-fun m!313439 () Bool)

(assert (=> b!301520 m!313439))

(declare-fun m!313441 () Bool)

(assert (=> b!301519 m!313441))

(check-sat (not b!301521) (not b!301520) (not b!301524) (not b!301519) (not start!30066) (not b!301522))
(check-sat)
