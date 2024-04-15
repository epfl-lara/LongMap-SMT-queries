; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29938 () Bool)

(assert start!29938)

(declare-fun b!300622 () Bool)

(declare-fun res!158523 () Bool)

(declare-fun e!189798 () Bool)

(assert (=> b!300622 (=> (not res!158523) (not e!189798))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!300622 (= res!158523 (validKeyInArray!0 k0!2524))))

(declare-fun b!300624 () Bool)

(declare-fun e!189800 () Bool)

(assert (=> b!300624 (= e!189800 false)))

(declare-datatypes ((SeekEntryResult!2330 0))(
  ( (MissingZero!2330 (index!11496 (_ BitVec 32))) (Found!2330 (index!11497 (_ BitVec 32))) (Intermediate!2330 (undefined!3142 Bool) (index!11498 (_ BitVec 32)) (x!29773 (_ BitVec 32))) (Undefined!2330) (MissingVacant!2330 (index!11499 (_ BitVec 32))) )
))
(declare-fun lt!149465 () SeekEntryResult!2330)

(declare-fun lt!149467 () (_ BitVec 32))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!15178 0))(
  ( (array!15179 (arr!7182 (Array (_ BitVec 32) (_ BitVec 64))) (size!7535 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15178)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15178 (_ BitVec 32)) SeekEntryResult!2330)

(assert (=> b!300624 (= lt!149465 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149467 k0!2524 (array!15179 (store (arr!7182 a!3312) i!1256 k0!2524) (size!7535 a!3312)) mask!3809))))

(declare-fun lt!149466 () SeekEntryResult!2330)

(assert (=> b!300624 (= lt!149466 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149467 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!300624 (= lt!149467 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!300625 () Bool)

(assert (=> b!300625 (= e!189798 e!189800)))

(declare-fun res!158518 () Bool)

(assert (=> b!300625 (=> (not res!158518) (not e!189800))))

(declare-fun lt!149468 () SeekEntryResult!2330)

(assert (=> b!300625 (= res!158518 (or (= lt!149468 (MissingZero!2330 i!1256)) (= lt!149468 (MissingVacant!2330 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15178 (_ BitVec 32)) SeekEntryResult!2330)

(assert (=> b!300625 (= lt!149468 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!300626 () Bool)

(declare-fun res!158522 () Bool)

(assert (=> b!300626 (=> (not res!158522) (not e!189798))))

(assert (=> b!300626 (= res!158522 (and (= (size!7535 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7535 a!3312))))))

(declare-fun b!300627 () Bool)

(declare-fun res!158519 () Bool)

(assert (=> b!300627 (=> (not res!158519) (not e!189800))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15178 (_ BitVec 32)) Bool)

(assert (=> b!300627 (= res!158519 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!158521 () Bool)

(assert (=> start!29938 (=> (not res!158521) (not e!189798))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29938 (= res!158521 (validMask!0 mask!3809))))

(assert (=> start!29938 e!189798))

(assert (=> start!29938 true))

(declare-fun array_inv!5154 (array!15178) Bool)

(assert (=> start!29938 (array_inv!5154 a!3312)))

(declare-fun b!300623 () Bool)

(declare-fun res!158520 () Bool)

(assert (=> b!300623 (=> (not res!158520) (not e!189798))))

(declare-fun arrayContainsKey!0 (array!15178 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!300623 (= res!158520 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!29938 res!158521) b!300626))

(assert (= (and b!300626 res!158522) b!300622))

(assert (= (and b!300622 res!158523) b!300623))

(assert (= (and b!300623 res!158520) b!300625))

(assert (= (and b!300625 res!158518) b!300627))

(assert (= (and b!300627 res!158519) b!300624))

(declare-fun m!312049 () Bool)

(assert (=> b!300624 m!312049))

(declare-fun m!312051 () Bool)

(assert (=> b!300624 m!312051))

(declare-fun m!312053 () Bool)

(assert (=> b!300624 m!312053))

(declare-fun m!312055 () Bool)

(assert (=> b!300624 m!312055))

(declare-fun m!312057 () Bool)

(assert (=> start!29938 m!312057))

(declare-fun m!312059 () Bool)

(assert (=> start!29938 m!312059))

(declare-fun m!312061 () Bool)

(assert (=> b!300627 m!312061))

(declare-fun m!312063 () Bool)

(assert (=> b!300625 m!312063))

(declare-fun m!312065 () Bool)

(assert (=> b!300622 m!312065))

(declare-fun m!312067 () Bool)

(assert (=> b!300623 m!312067))

(check-sat (not b!300622) (not start!29938) (not b!300623) (not b!300624) (not b!300627) (not b!300625))
(check-sat)
