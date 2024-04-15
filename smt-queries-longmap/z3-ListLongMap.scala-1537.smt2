; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29138 () Bool)

(assert start!29138)

(declare-fun b!295527 () Bool)

(declare-fun e!186787 () Bool)

(declare-fun e!186784 () Bool)

(assert (=> b!295527 (= e!186787 e!186784)))

(declare-fun res!155465 () Bool)

(assert (=> b!295527 (=> (not res!155465) (not e!186784))))

(declare-fun lt!146496 () Bool)

(assert (=> b!295527 (= res!155465 lt!146496)))

(declare-datatypes ((SeekEntryResult!2231 0))(
  ( (MissingZero!2231 (index!11094 (_ BitVec 32))) (Found!2231 (index!11095 (_ BitVec 32))) (Intermediate!2231 (undefined!3043 Bool) (index!11096 (_ BitVec 32)) (x!29327 (_ BitVec 32))) (Undefined!2231) (MissingVacant!2231 (index!11097 (_ BitVec 32))) )
))
(declare-fun lt!146498 () SeekEntryResult!2231)

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14944 0))(
  ( (array!14945 (arr!7083 (Array (_ BitVec 32) (_ BitVec 64))) (size!7436 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14944)

(declare-fun lt!146495 () (_ BitVec 32))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14944 (_ BitVec 32)) SeekEntryResult!2231)

(assert (=> b!295527 (= lt!146498 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146495 k0!2524 (array!14945 (store (arr!7083 a!3312) i!1256 k0!2524) (size!7436 a!3312)) mask!3809))))

(declare-fun lt!146497 () SeekEntryResult!2231)

(assert (=> b!295527 (= lt!146497 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146495 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!295527 (= lt!146495 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!295528 () Bool)

(declare-fun res!155470 () Bool)

(assert (=> b!295528 (=> (not res!155470) (not e!186787))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14944 (_ BitVec 32)) Bool)

(assert (=> b!295528 (= res!155470 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!295529 () Bool)

(declare-fun e!186785 () Bool)

(assert (=> b!295529 (= e!186785 (not true))))

(assert (=> b!295529 (and (= (select (arr!7083 a!3312) (index!11096 lt!146497)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11096 lt!146497) i!1256))))

(declare-fun b!295530 () Bool)

(declare-fun res!155464 () Bool)

(declare-fun e!186783 () Bool)

(assert (=> b!295530 (=> (not res!155464) (not e!186783))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!295530 (= res!155464 (validKeyInArray!0 k0!2524))))

(declare-fun b!295531 () Bool)

(declare-fun res!155463 () Bool)

(assert (=> b!295531 (=> (not res!155463) (not e!186783))))

(assert (=> b!295531 (= res!155463 (and (= (size!7436 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7436 a!3312))))))

(declare-fun b!295532 () Bool)

(assert (=> b!295532 (= e!186783 e!186787)))

(declare-fun res!155468 () Bool)

(assert (=> b!295532 (=> (not res!155468) (not e!186787))))

(declare-fun lt!146499 () SeekEntryResult!2231)

(assert (=> b!295532 (= res!155468 (or lt!146496 (= lt!146499 (MissingVacant!2231 i!1256))))))

(assert (=> b!295532 (= lt!146496 (= lt!146499 (MissingZero!2231 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14944 (_ BitVec 32)) SeekEntryResult!2231)

(assert (=> b!295532 (= lt!146499 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!295533 () Bool)

(declare-fun res!155467 () Bool)

(assert (=> b!295533 (=> (not res!155467) (not e!186783))))

(declare-fun arrayContainsKey!0 (array!14944 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!295533 (= res!155467 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun res!155466 () Bool)

(assert (=> start!29138 (=> (not res!155466) (not e!186783))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29138 (= res!155466 (validMask!0 mask!3809))))

(assert (=> start!29138 e!186783))

(assert (=> start!29138 true))

(declare-fun array_inv!5055 (array!14944) Bool)

(assert (=> start!29138 (array_inv!5055 a!3312)))

(declare-fun b!295534 () Bool)

(assert (=> b!295534 (= e!186784 e!186785)))

(declare-fun res!155469 () Bool)

(assert (=> b!295534 (=> (not res!155469) (not e!186785))))

(declare-fun lt!146494 () Bool)

(assert (=> b!295534 (= res!155469 (and (or lt!146494 (not (undefined!3043 lt!146497))) (or lt!146494 (not (= (select (arr!7083 a!3312) (index!11096 lt!146497)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!146494 (not (= (select (arr!7083 a!3312) (index!11096 lt!146497)) k0!2524))) (not lt!146494)))))

(get-info :version)

(assert (=> b!295534 (= lt!146494 (not ((_ is Intermediate!2231) lt!146497)))))

(assert (= (and start!29138 res!155466) b!295531))

(assert (= (and b!295531 res!155463) b!295530))

(assert (= (and b!295530 res!155464) b!295533))

(assert (= (and b!295533 res!155467) b!295532))

(assert (= (and b!295532 res!155468) b!295528))

(assert (= (and b!295528 res!155470) b!295527))

(assert (= (and b!295527 res!155465) b!295534))

(assert (= (and b!295534 res!155469) b!295529))

(declare-fun m!308157 () Bool)

(assert (=> start!29138 m!308157))

(declare-fun m!308159 () Bool)

(assert (=> start!29138 m!308159))

(declare-fun m!308161 () Bool)

(assert (=> b!295534 m!308161))

(declare-fun m!308163 () Bool)

(assert (=> b!295533 m!308163))

(declare-fun m!308165 () Bool)

(assert (=> b!295532 m!308165))

(declare-fun m!308167 () Bool)

(assert (=> b!295527 m!308167))

(declare-fun m!308169 () Bool)

(assert (=> b!295527 m!308169))

(declare-fun m!308171 () Bool)

(assert (=> b!295527 m!308171))

(declare-fun m!308173 () Bool)

(assert (=> b!295527 m!308173))

(declare-fun m!308175 () Bool)

(assert (=> b!295528 m!308175))

(assert (=> b!295529 m!308161))

(declare-fun m!308177 () Bool)

(assert (=> b!295530 m!308177))

(check-sat (not b!295527) (not b!295533) (not start!29138) (not b!295530) (not b!295528) (not b!295532))
(check-sat)
