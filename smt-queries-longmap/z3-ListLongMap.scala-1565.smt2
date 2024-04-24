; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29812 () Bool)

(assert start!29812)

(declare-fun b!300142 () Bool)

(declare-fun e!189542 () Bool)

(assert (=> b!300142 (= e!189542 false)))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2285 0))(
  ( (MissingZero!2285 (index!11316 (_ BitVec 32))) (Found!2285 (index!11317 (_ BitVec 32))) (Intermediate!2285 (undefined!3097 Bool) (index!11318 (_ BitVec 32)) (x!29678 (_ BitVec 32))) (Undefined!2285) (MissingVacant!2285 (index!11319 (_ BitVec 32))) )
))
(declare-fun lt!149328 () SeekEntryResult!2285)

(declare-datatypes ((array!15150 0))(
  ( (array!15151 (arr!7171 (Array (_ BitVec 32) (_ BitVec 64))) (size!7523 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15150)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun lt!149330 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15150 (_ BitVec 32)) SeekEntryResult!2285)

(assert (=> b!300142 (= lt!149328 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149330 k0!2524 (array!15151 (store (arr!7171 a!3312) i!1256 k0!2524) (size!7523 a!3312)) mask!3809))))

(declare-fun lt!149329 () SeekEntryResult!2285)

(assert (=> b!300142 (= lt!149329 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149330 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!300142 (= lt!149330 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!300143 () Bool)

(declare-fun res!158225 () Bool)

(declare-fun e!189541 () Bool)

(assert (=> b!300143 (=> (not res!158225) (not e!189541))))

(assert (=> b!300143 (= res!158225 (and (= (size!7523 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7523 a!3312))))))

(declare-fun b!300144 () Bool)

(declare-fun res!158229 () Bool)

(assert (=> b!300144 (=> (not res!158229) (not e!189541))))

(declare-fun arrayContainsKey!0 (array!15150 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!300144 (= res!158229 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun res!158228 () Bool)

(assert (=> start!29812 (=> (not res!158228) (not e!189541))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29812 (= res!158228 (validMask!0 mask!3809))))

(assert (=> start!29812 e!189541))

(assert (=> start!29812 true))

(declare-fun array_inv!5121 (array!15150) Bool)

(assert (=> start!29812 (array_inv!5121 a!3312)))

(declare-fun b!300145 () Bool)

(declare-fun res!158227 () Bool)

(assert (=> b!300145 (=> (not res!158227) (not e!189541))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!300145 (= res!158227 (validKeyInArray!0 k0!2524))))

(declare-fun b!300146 () Bool)

(declare-fun res!158224 () Bool)

(assert (=> b!300146 (=> (not res!158224) (not e!189542))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15150 (_ BitVec 32)) Bool)

(assert (=> b!300146 (= res!158224 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!300147 () Bool)

(assert (=> b!300147 (= e!189541 e!189542)))

(declare-fun res!158226 () Bool)

(assert (=> b!300147 (=> (not res!158226) (not e!189542))))

(declare-fun lt!149331 () SeekEntryResult!2285)

(assert (=> b!300147 (= res!158226 (or (= lt!149331 (MissingZero!2285 i!1256)) (= lt!149331 (MissingVacant!2285 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15150 (_ BitVec 32)) SeekEntryResult!2285)

(assert (=> b!300147 (= lt!149331 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(assert (= (and start!29812 res!158228) b!300143))

(assert (= (and b!300143 res!158225) b!300145))

(assert (= (and b!300145 res!158227) b!300144))

(assert (= (and b!300144 res!158229) b!300147))

(assert (= (and b!300147 res!158226) b!300146))

(assert (= (and b!300146 res!158224) b!300142))

(declare-fun m!312345 () Bool)

(assert (=> b!300145 m!312345))

(declare-fun m!312347 () Bool)

(assert (=> b!300144 m!312347))

(declare-fun m!312349 () Bool)

(assert (=> start!29812 m!312349))

(declare-fun m!312351 () Bool)

(assert (=> start!29812 m!312351))

(declare-fun m!312353 () Bool)

(assert (=> b!300142 m!312353))

(declare-fun m!312355 () Bool)

(assert (=> b!300142 m!312355))

(declare-fun m!312357 () Bool)

(assert (=> b!300142 m!312357))

(declare-fun m!312359 () Bool)

(assert (=> b!300142 m!312359))

(declare-fun m!312361 () Bool)

(assert (=> b!300147 m!312361))

(declare-fun m!312363 () Bool)

(assert (=> b!300146 m!312363))

(check-sat (not b!300146) (not start!29812) (not b!300144) (not b!300147) (not b!300142) (not b!300145))
(check-sat)
