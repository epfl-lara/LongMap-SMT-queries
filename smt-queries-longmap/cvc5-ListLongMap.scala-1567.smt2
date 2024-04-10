; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29890 () Bool)

(assert start!29890)

(declare-fun b!300520 () Bool)

(declare-fun e!189761 () Bool)

(declare-fun e!189762 () Bool)

(assert (=> b!300520 (= e!189761 e!189762)))

(declare-fun res!158415 () Bool)

(assert (=> b!300520 (=> (not res!158415) (not e!189762))))

(declare-datatypes ((SeekEntryResult!2327 0))(
  ( (MissingZero!2327 (index!11484 (_ BitVec 32))) (Found!2327 (index!11485 (_ BitVec 32))) (Intermediate!2327 (undefined!3139 Bool) (index!11486 (_ BitVec 32)) (x!29745 (_ BitVec 32))) (Undefined!2327) (MissingVacant!2327 (index!11487 (_ BitVec 32))) )
))
(declare-fun lt!149488 () SeekEntryResult!2327)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!300520 (= res!158415 (or (= lt!149488 (MissingZero!2327 i!1256)) (= lt!149488 (MissingVacant!2327 i!1256))))))

(declare-datatypes ((array!15168 0))(
  ( (array!15169 (arr!7178 (Array (_ BitVec 32) (_ BitVec 64))) (size!7530 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15168)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15168 (_ BitVec 32)) SeekEntryResult!2327)

(assert (=> b!300520 (= lt!149488 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!300521 () Bool)

(assert (=> b!300521 (= e!189762 false)))

(declare-fun lt!149487 () (_ BitVec 32))

(declare-fun lt!149489 () SeekEntryResult!2327)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15168 (_ BitVec 32)) SeekEntryResult!2327)

(assert (=> b!300521 (= lt!149489 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149487 k!2524 (array!15169 (store (arr!7178 a!3312) i!1256 k!2524) (size!7530 a!3312)) mask!3809))))

(declare-fun lt!149490 () SeekEntryResult!2327)

(assert (=> b!300521 (= lt!149490 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149487 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!300521 (= lt!149487 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!300522 () Bool)

(declare-fun res!158413 () Bool)

(assert (=> b!300522 (=> (not res!158413) (not e!189761))))

(assert (=> b!300522 (= res!158413 (and (= (size!7530 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7530 a!3312))))))

(declare-fun b!300523 () Bool)

(declare-fun res!158414 () Bool)

(assert (=> b!300523 (=> (not res!158414) (not e!189761))))

(declare-fun arrayContainsKey!0 (array!15168 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!300523 (= res!158414 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!300524 () Bool)

(declare-fun res!158411 () Bool)

(assert (=> b!300524 (=> (not res!158411) (not e!189761))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!300524 (= res!158411 (validKeyInArray!0 k!2524))))

(declare-fun res!158410 () Bool)

(assert (=> start!29890 (=> (not res!158410) (not e!189761))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29890 (= res!158410 (validMask!0 mask!3809))))

(assert (=> start!29890 e!189761))

(assert (=> start!29890 true))

(declare-fun array_inv!5141 (array!15168) Bool)

(assert (=> start!29890 (array_inv!5141 a!3312)))

(declare-fun b!300519 () Bool)

(declare-fun res!158412 () Bool)

(assert (=> b!300519 (=> (not res!158412) (not e!189762))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15168 (_ BitVec 32)) Bool)

(assert (=> b!300519 (= res!158412 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(assert (= (and start!29890 res!158410) b!300522))

(assert (= (and b!300522 res!158413) b!300524))

(assert (= (and b!300524 res!158411) b!300523))

(assert (= (and b!300523 res!158414) b!300520))

(assert (= (and b!300520 res!158415) b!300519))

(assert (= (and b!300519 res!158412) b!300521))

(declare-fun m!312489 () Bool)

(assert (=> b!300519 m!312489))

(declare-fun m!312491 () Bool)

(assert (=> start!29890 m!312491))

(declare-fun m!312493 () Bool)

(assert (=> start!29890 m!312493))

(declare-fun m!312495 () Bool)

(assert (=> b!300524 m!312495))

(declare-fun m!312497 () Bool)

(assert (=> b!300523 m!312497))

(declare-fun m!312499 () Bool)

(assert (=> b!300521 m!312499))

(declare-fun m!312501 () Bool)

(assert (=> b!300521 m!312501))

(declare-fun m!312503 () Bool)

(assert (=> b!300521 m!312503))

(declare-fun m!312505 () Bool)

(assert (=> b!300521 m!312505))

(declare-fun m!312507 () Bool)

(assert (=> b!300520 m!312507))

(push 1)

