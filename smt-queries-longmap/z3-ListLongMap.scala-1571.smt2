; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29944 () Bool)

(assert start!29944)

(declare-fun b!300676 () Bool)

(declare-fun e!189825 () Bool)

(declare-fun e!189826 () Bool)

(assert (=> b!300676 (= e!189825 e!189826)))

(declare-fun res!158577 () Bool)

(assert (=> b!300676 (=> (not res!158577) (not e!189826))))

(declare-datatypes ((SeekEntryResult!2333 0))(
  ( (MissingZero!2333 (index!11508 (_ BitVec 32))) (Found!2333 (index!11509 (_ BitVec 32))) (Intermediate!2333 (undefined!3145 Bool) (index!11510 (_ BitVec 32)) (x!29784 (_ BitVec 32))) (Undefined!2333) (MissingVacant!2333 (index!11511 (_ BitVec 32))) )
))
(declare-fun lt!149503 () SeekEntryResult!2333)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!300676 (= res!158577 (or (= lt!149503 (MissingZero!2333 i!1256)) (= lt!149503 (MissingVacant!2333 i!1256))))))

(declare-datatypes ((array!15184 0))(
  ( (array!15185 (arr!7185 (Array (_ BitVec 32) (_ BitVec 64))) (size!7538 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15184)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15184 (_ BitVec 32)) SeekEntryResult!2333)

(assert (=> b!300676 (= lt!149503 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!300677 () Bool)

(declare-fun res!158575 () Bool)

(assert (=> b!300677 (=> (not res!158575) (not e!189825))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!300677 (= res!158575 (validKeyInArray!0 k0!2524))))

(declare-fun b!300678 () Bool)

(declare-fun res!158572 () Bool)

(assert (=> b!300678 (=> (not res!158572) (not e!189825))))

(assert (=> b!300678 (= res!158572 (and (= (size!7538 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7538 a!3312))))))

(declare-fun b!300679 () Bool)

(declare-fun res!158573 () Bool)

(assert (=> b!300679 (=> (not res!158573) (not e!189825))))

(declare-fun arrayContainsKey!0 (array!15184 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!300679 (= res!158573 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun res!158576 () Bool)

(assert (=> start!29944 (=> (not res!158576) (not e!189825))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29944 (= res!158576 (validMask!0 mask!3809))))

(assert (=> start!29944 e!189825))

(assert (=> start!29944 true))

(declare-fun array_inv!5157 (array!15184) Bool)

(assert (=> start!29944 (array_inv!5157 a!3312)))

(declare-fun b!300680 () Bool)

(assert (=> b!300680 (= e!189826 false)))

(declare-fun lt!149502 () SeekEntryResult!2333)

(declare-fun lt!149504 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15184 (_ BitVec 32)) SeekEntryResult!2333)

(assert (=> b!300680 (= lt!149502 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149504 k0!2524 (array!15185 (store (arr!7185 a!3312) i!1256 k0!2524) (size!7538 a!3312)) mask!3809))))

(declare-fun lt!149501 () SeekEntryResult!2333)

(assert (=> b!300680 (= lt!149501 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149504 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!300680 (= lt!149504 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!300681 () Bool)

(declare-fun res!158574 () Bool)

(assert (=> b!300681 (=> (not res!158574) (not e!189826))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15184 (_ BitVec 32)) Bool)

(assert (=> b!300681 (= res!158574 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(assert (= (and start!29944 res!158576) b!300678))

(assert (= (and b!300678 res!158572) b!300677))

(assert (= (and b!300677 res!158575) b!300679))

(assert (= (and b!300679 res!158573) b!300676))

(assert (= (and b!300676 res!158577) b!300681))

(assert (= (and b!300681 res!158574) b!300680))

(declare-fun m!312109 () Bool)

(assert (=> b!300676 m!312109))

(declare-fun m!312111 () Bool)

(assert (=> b!300679 m!312111))

(declare-fun m!312113 () Bool)

(assert (=> b!300677 m!312113))

(declare-fun m!312115 () Bool)

(assert (=> b!300680 m!312115))

(declare-fun m!312117 () Bool)

(assert (=> b!300680 m!312117))

(declare-fun m!312119 () Bool)

(assert (=> b!300680 m!312119))

(declare-fun m!312121 () Bool)

(assert (=> b!300680 m!312121))

(declare-fun m!312123 () Bool)

(assert (=> start!29944 m!312123))

(declare-fun m!312125 () Bool)

(assert (=> start!29944 m!312125))

(declare-fun m!312127 () Bool)

(assert (=> b!300681 m!312127))

(check-sat (not b!300677) (not b!300680) (not start!29944) (not b!300681) (not b!300679) (not b!300676))
(check-sat)
