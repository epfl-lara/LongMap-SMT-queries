; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29512 () Bool)

(assert start!29512)

(declare-fun b!298418 () Bool)

(declare-fun res!157357 () Bool)

(declare-fun e!188534 () Bool)

(assert (=> b!298418 (=> (not res!157357) (not e!188534))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!15087 0))(
  ( (array!15088 (arr!7147 (Array (_ BitVec 32) (_ BitVec 64))) (size!7499 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15087)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!298418 (= res!157357 (and (= (size!7499 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7499 a!3312))))))

(declare-fun b!298419 () Bool)

(declare-fun res!157361 () Bool)

(assert (=> b!298419 (=> (not res!157361) (not e!188534))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!298419 (= res!157361 (validKeyInArray!0 k0!2524))))

(declare-fun b!298420 () Bool)

(declare-fun e!188532 () Bool)

(assert (=> b!298420 (= e!188534 e!188532)))

(declare-fun res!157359 () Bool)

(assert (=> b!298420 (=> (not res!157359) (not e!188532))))

(declare-datatypes ((SeekEntryResult!2261 0))(
  ( (MissingZero!2261 (index!11217 (_ BitVec 32))) (Found!2261 (index!11218 (_ BitVec 32))) (Intermediate!2261 (undefined!3073 Bool) (index!11219 (_ BitVec 32)) (x!29555 (_ BitVec 32))) (Undefined!2261) (MissingVacant!2261 (index!11220 (_ BitVec 32))) )
))
(declare-fun lt!148383 () SeekEntryResult!2261)

(assert (=> b!298420 (= res!157359 (or (= lt!148383 (MissingZero!2261 i!1256)) (= lt!148383 (MissingVacant!2261 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15087 (_ BitVec 32)) SeekEntryResult!2261)

(assert (=> b!298420 (= lt!148383 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!298421 () Bool)

(declare-fun res!157360 () Bool)

(assert (=> b!298421 (=> (not res!157360) (not e!188532))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15087 (_ BitVec 32)) Bool)

(assert (=> b!298421 (= res!157360 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!157358 () Bool)

(assert (=> start!29512 (=> (not res!157358) (not e!188534))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29512 (= res!157358 (validMask!0 mask!3809))))

(assert (=> start!29512 e!188534))

(assert (=> start!29512 true))

(declare-fun array_inv!5097 (array!15087) Bool)

(assert (=> start!29512 (array_inv!5097 a!3312)))

(declare-fun b!298422 () Bool)

(assert (=> b!298422 (= e!188532 false)))

(declare-fun lt!148385 () (_ BitVec 32))

(declare-fun lt!148386 () SeekEntryResult!2261)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15087 (_ BitVec 32)) SeekEntryResult!2261)

(assert (=> b!298422 (= lt!148386 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148385 k0!2524 (array!15088 (store (arr!7147 a!3312) i!1256 k0!2524) (size!7499 a!3312)) mask!3809))))

(declare-fun lt!148384 () SeekEntryResult!2261)

(assert (=> b!298422 (= lt!148384 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148385 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!298422 (= lt!148385 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!298423 () Bool)

(declare-fun res!157362 () Bool)

(assert (=> b!298423 (=> (not res!157362) (not e!188534))))

(declare-fun arrayContainsKey!0 (array!15087 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!298423 (= res!157362 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!29512 res!157358) b!298418))

(assert (= (and b!298418 res!157357) b!298419))

(assert (= (and b!298419 res!157361) b!298423))

(assert (= (and b!298423 res!157362) b!298420))

(assert (= (and b!298420 res!157359) b!298421))

(assert (= (and b!298421 res!157360) b!298422))

(declare-fun m!311099 () Bool)

(assert (=> b!298423 m!311099))

(declare-fun m!311101 () Bool)

(assert (=> b!298421 m!311101))

(declare-fun m!311103 () Bool)

(assert (=> start!29512 m!311103))

(declare-fun m!311105 () Bool)

(assert (=> start!29512 m!311105))

(declare-fun m!311107 () Bool)

(assert (=> b!298419 m!311107))

(declare-fun m!311109 () Bool)

(assert (=> b!298422 m!311109))

(declare-fun m!311111 () Bool)

(assert (=> b!298422 m!311111))

(declare-fun m!311113 () Bool)

(assert (=> b!298422 m!311113))

(declare-fun m!311115 () Bool)

(assert (=> b!298422 m!311115))

(declare-fun m!311117 () Bool)

(assert (=> b!298420 m!311117))

(check-sat (not start!29512) (not b!298422) (not b!298421) (not b!298420) (not b!298419) (not b!298423))
(check-sat)
