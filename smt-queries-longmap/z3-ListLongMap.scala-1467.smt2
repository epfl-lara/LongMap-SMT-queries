; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28184 () Bool)

(assert start!28184)

(declare-fun res!150143 () Bool)

(declare-fun e!182635 () Bool)

(assert (=> start!28184 (=> (not res!150143) (not e!182635))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28184 (= res!150143 (validMask!0 mask!3809))))

(assert (=> start!28184 e!182635))

(assert (=> start!28184 true))

(declare-datatypes ((array!14491 0))(
  ( (array!14492 (arr!6873 (Array (_ BitVec 32) (_ BitVec 64))) (size!7226 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14491)

(declare-fun array_inv!4845 (array!14491) Bool)

(assert (=> start!28184 (array_inv!4845 a!3312)))

(declare-fun b!288466 () Bool)

(declare-fun res!150145 () Bool)

(assert (=> b!288466 (=> (not res!150145) (not e!182635))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14491 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!288466 (= res!150145 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!288467 () Bool)

(declare-fun res!150148 () Bool)

(assert (=> b!288467 (=> (not res!150148) (not e!182635))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!288467 (= res!150148 (and (= (size!7226 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7226 a!3312))))))

(declare-fun b!288468 () Bool)

(declare-fun e!182633 () Bool)

(assert (=> b!288468 (= e!182633 (not true))))

(declare-datatypes ((SeekEntryResult!2021 0))(
  ( (MissingZero!2021 (index!10254 (_ BitVec 32))) (Found!2021 (index!10255 (_ BitVec 32))) (Intermediate!2021 (undefined!2833 Bool) (index!10256 (_ BitVec 32)) (x!28489 (_ BitVec 32))) (Undefined!2021) (MissingVacant!2021 (index!10257 (_ BitVec 32))) )
))
(declare-fun lt!142030 () SeekEntryResult!2021)

(assert (=> b!288468 (and (= (select (arr!6873 a!3312) (index!10256 lt!142030)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10256 lt!142030) i!1256))))

(declare-fun b!288469 () Bool)

(declare-fun res!150142 () Bool)

(declare-fun e!182636 () Bool)

(assert (=> b!288469 (=> (not res!150142) (not e!182636))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14491 (_ BitVec 32)) Bool)

(assert (=> b!288469 (= res!150142 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!288470 () Bool)

(declare-fun e!182634 () Bool)

(assert (=> b!288470 (= e!182634 e!182633)))

(declare-fun res!150147 () Bool)

(assert (=> b!288470 (=> (not res!150147) (not e!182633))))

(declare-fun lt!142033 () Bool)

(assert (=> b!288470 (= res!150147 (and (or lt!142033 (not (undefined!2833 lt!142030))) (or lt!142033 (not (= (select (arr!6873 a!3312) (index!10256 lt!142030)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!142033 (not (= (select (arr!6873 a!3312) (index!10256 lt!142030)) k0!2524))) (not lt!142033)))))

(get-info :version)

(assert (=> b!288470 (= lt!142033 (not ((_ is Intermediate!2021) lt!142030)))))

(declare-fun b!288471 () Bool)

(assert (=> b!288471 (= e!182635 e!182636)))

(declare-fun res!150144 () Bool)

(assert (=> b!288471 (=> (not res!150144) (not e!182636))))

(declare-fun lt!142031 () Bool)

(declare-fun lt!142035 () SeekEntryResult!2021)

(assert (=> b!288471 (= res!150144 (or lt!142031 (= lt!142035 (MissingVacant!2021 i!1256))))))

(assert (=> b!288471 (= lt!142031 (= lt!142035 (MissingZero!2021 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14491 (_ BitVec 32)) SeekEntryResult!2021)

(assert (=> b!288471 (= lt!142035 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!288472 () Bool)

(declare-fun res!150146 () Bool)

(assert (=> b!288472 (=> (not res!150146) (not e!182635))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!288472 (= res!150146 (validKeyInArray!0 k0!2524))))

(declare-fun b!288473 () Bool)

(assert (=> b!288473 (= e!182636 e!182634)))

(declare-fun res!150141 () Bool)

(assert (=> b!288473 (=> (not res!150141) (not e!182634))))

(assert (=> b!288473 (= res!150141 lt!142031)))

(declare-fun lt!142034 () (_ BitVec 32))

(declare-fun lt!142032 () SeekEntryResult!2021)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14491 (_ BitVec 32)) SeekEntryResult!2021)

(assert (=> b!288473 (= lt!142032 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142034 k0!2524 (array!14492 (store (arr!6873 a!3312) i!1256 k0!2524) (size!7226 a!3312)) mask!3809))))

(assert (=> b!288473 (= lt!142030 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142034 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!288473 (= lt!142034 (toIndex!0 k0!2524 mask!3809))))

(assert (= (and start!28184 res!150143) b!288467))

(assert (= (and b!288467 res!150148) b!288472))

(assert (= (and b!288472 res!150146) b!288466))

(assert (= (and b!288466 res!150145) b!288471))

(assert (= (and b!288471 res!150144) b!288469))

(assert (= (and b!288469 res!150142) b!288473))

(assert (= (and b!288473 res!150141) b!288470))

(assert (= (and b!288470 res!150147) b!288468))

(declare-fun m!302237 () Bool)

(assert (=> b!288472 m!302237))

(declare-fun m!302239 () Bool)

(assert (=> b!288468 m!302239))

(assert (=> b!288470 m!302239))

(declare-fun m!302241 () Bool)

(assert (=> b!288469 m!302241))

(declare-fun m!302243 () Bool)

(assert (=> start!28184 m!302243))

(declare-fun m!302245 () Bool)

(assert (=> start!28184 m!302245))

(declare-fun m!302247 () Bool)

(assert (=> b!288466 m!302247))

(declare-fun m!302249 () Bool)

(assert (=> b!288471 m!302249))

(declare-fun m!302251 () Bool)

(assert (=> b!288473 m!302251))

(declare-fun m!302253 () Bool)

(assert (=> b!288473 m!302253))

(declare-fun m!302255 () Bool)

(assert (=> b!288473 m!302255))

(declare-fun m!302257 () Bool)

(assert (=> b!288473 m!302257))

(check-sat (not b!288471) (not b!288472) (not b!288473) (not start!28184) (not b!288466) (not b!288469))
(check-sat)
