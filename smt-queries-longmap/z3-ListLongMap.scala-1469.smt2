; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28196 () Bool)

(assert start!28196)

(declare-fun b!288610 () Bool)

(declare-fun e!182723 () Bool)

(assert (=> b!288610 (= e!182723 (not true))))

(declare-datatypes ((array!14503 0))(
  ( (array!14504 (arr!6879 (Array (_ BitVec 32) (_ BitVec 64))) (size!7232 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14503)

(declare-datatypes ((SeekEntryResult!2027 0))(
  ( (MissingZero!2027 (index!10278 (_ BitVec 32))) (Found!2027 (index!10279 (_ BitVec 32))) (Intermediate!2027 (undefined!2839 Bool) (index!10280 (_ BitVec 32)) (x!28511 (_ BitVec 32))) (Undefined!2027) (MissingVacant!2027 (index!10281 (_ BitVec 32))) )
))
(declare-fun lt!142139 () SeekEntryResult!2027)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!288610 (and (= (select (arr!6879 a!3312) (index!10280 lt!142139)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10280 lt!142139) i!1256))))

(declare-fun b!288611 () Bool)

(declare-fun res!150290 () Bool)

(declare-fun e!182726 () Bool)

(assert (=> b!288611 (=> (not res!150290) (not e!182726))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14503 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!288611 (= res!150290 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!288612 () Bool)

(declare-fun e!182727 () Bool)

(assert (=> b!288612 (= e!182727 e!182723)))

(declare-fun res!150291 () Bool)

(assert (=> b!288612 (=> (not res!150291) (not e!182723))))

(declare-fun lt!142142 () Bool)

(assert (=> b!288612 (= res!150291 (and (or lt!142142 (not (undefined!2839 lt!142139))) (or lt!142142 (not (= (select (arr!6879 a!3312) (index!10280 lt!142139)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!142142 (not (= (select (arr!6879 a!3312) (index!10280 lt!142139)) k0!2524))) (not lt!142142)))))

(get-info :version)

(assert (=> b!288612 (= lt!142142 (not ((_ is Intermediate!2027) lt!142139)))))

(declare-fun b!288613 () Bool)

(declare-fun e!182725 () Bool)

(assert (=> b!288613 (= e!182726 e!182725)))

(declare-fun res!150292 () Bool)

(assert (=> b!288613 (=> (not res!150292) (not e!182725))))

(declare-fun lt!142143 () Bool)

(declare-fun lt!142141 () SeekEntryResult!2027)

(assert (=> b!288613 (= res!150292 (or lt!142143 (= lt!142141 (MissingVacant!2027 i!1256))))))

(assert (=> b!288613 (= lt!142143 (= lt!142141 (MissingZero!2027 i!1256)))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14503 (_ BitVec 32)) SeekEntryResult!2027)

(assert (=> b!288613 (= lt!142141 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!288614 () Bool)

(assert (=> b!288614 (= e!182725 e!182727)))

(declare-fun res!150285 () Bool)

(assert (=> b!288614 (=> (not res!150285) (not e!182727))))

(assert (=> b!288614 (= res!150285 lt!142143)))

(declare-fun lt!142138 () (_ BitVec 32))

(declare-fun lt!142140 () SeekEntryResult!2027)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14503 (_ BitVec 32)) SeekEntryResult!2027)

(assert (=> b!288614 (= lt!142140 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142138 k0!2524 (array!14504 (store (arr!6879 a!3312) i!1256 k0!2524) (size!7232 a!3312)) mask!3809))))

(assert (=> b!288614 (= lt!142139 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142138 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!288614 (= lt!142138 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!288615 () Bool)

(declare-fun res!150289 () Bool)

(assert (=> b!288615 (=> (not res!150289) (not e!182725))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14503 (_ BitVec 32)) Bool)

(assert (=> b!288615 (= res!150289 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!288616 () Bool)

(declare-fun res!150287 () Bool)

(assert (=> b!288616 (=> (not res!150287) (not e!182726))))

(assert (=> b!288616 (= res!150287 (and (= (size!7232 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7232 a!3312))))))

(declare-fun res!150288 () Bool)

(assert (=> start!28196 (=> (not res!150288) (not e!182726))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28196 (= res!150288 (validMask!0 mask!3809))))

(assert (=> start!28196 e!182726))

(assert (=> start!28196 true))

(declare-fun array_inv!4851 (array!14503) Bool)

(assert (=> start!28196 (array_inv!4851 a!3312)))

(declare-fun b!288617 () Bool)

(declare-fun res!150286 () Bool)

(assert (=> b!288617 (=> (not res!150286) (not e!182726))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!288617 (= res!150286 (validKeyInArray!0 k0!2524))))

(assert (= (and start!28196 res!150288) b!288616))

(assert (= (and b!288616 res!150287) b!288617))

(assert (= (and b!288617 res!150286) b!288611))

(assert (= (and b!288611 res!150290) b!288613))

(assert (= (and b!288613 res!150292) b!288615))

(assert (= (and b!288615 res!150289) b!288614))

(assert (= (and b!288614 res!150285) b!288612))

(assert (= (and b!288612 res!150291) b!288610))

(declare-fun m!302369 () Bool)

(assert (=> start!28196 m!302369))

(declare-fun m!302371 () Bool)

(assert (=> start!28196 m!302371))

(declare-fun m!302373 () Bool)

(assert (=> b!288612 m!302373))

(declare-fun m!302375 () Bool)

(assert (=> b!288614 m!302375))

(declare-fun m!302377 () Bool)

(assert (=> b!288614 m!302377))

(declare-fun m!302379 () Bool)

(assert (=> b!288614 m!302379))

(declare-fun m!302381 () Bool)

(assert (=> b!288614 m!302381))

(declare-fun m!302383 () Bool)

(assert (=> b!288617 m!302383))

(declare-fun m!302385 () Bool)

(assert (=> b!288615 m!302385))

(declare-fun m!302387 () Bool)

(assert (=> b!288613 m!302387))

(assert (=> b!288610 m!302373))

(declare-fun m!302389 () Bool)

(assert (=> b!288611 m!302389))

(check-sat (not b!288611) (not start!28196) (not b!288613) (not b!288614) (not b!288615) (not b!288617))
(check-sat)
