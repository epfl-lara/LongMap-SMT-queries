; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28586 () Bool)

(assert start!28586)

(declare-fun b!292273 () Bool)

(declare-fun e!184927 () Bool)

(declare-fun e!184928 () Bool)

(assert (=> b!292273 (= e!184927 e!184928)))

(declare-fun res!153331 () Bool)

(assert (=> b!292273 (=> (not res!153331) (not e!184928))))

(declare-datatypes ((SeekEntryResult!2154 0))(
  ( (MissingZero!2154 (index!10786 (_ BitVec 32))) (Found!2154 (index!10787 (_ BitVec 32))) (Intermediate!2154 (undefined!2966 Bool) (index!10788 (_ BitVec 32)) (x!28977 (_ BitVec 32))) (Undefined!2154) (MissingVacant!2154 (index!10789 (_ BitVec 32))) )
))
(declare-fun lt!144712 () SeekEntryResult!2154)

(declare-fun lt!144715 () Bool)

(declare-datatypes ((array!14765 0))(
  ( (array!14766 (arr!7005 (Array (_ BitVec 32) (_ BitVec 64))) (size!7357 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14765)

(assert (=> b!292273 (= res!153331 (and (or lt!144715 (not (undefined!2966 lt!144712))) (not lt!144715) (= (select (arr!7005 a!3312) (index!10788 lt!144712)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(get-info :version)

(assert (=> b!292273 (= lt!144715 (not ((_ is Intermediate!2154) lt!144712)))))

(declare-fun b!292274 () Bool)

(declare-fun res!153336 () Bool)

(declare-fun e!184930 () Bool)

(assert (=> b!292274 (=> (not res!153336) (not e!184930))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!292274 (= res!153336 (validKeyInArray!0 k0!2524))))

(declare-fun b!292275 () Bool)

(declare-fun e!184931 () Bool)

(assert (=> b!292275 (= e!184930 e!184931)))

(declare-fun res!153330 () Bool)

(assert (=> b!292275 (=> (not res!153330) (not e!184931))))

(declare-fun lt!144711 () SeekEntryResult!2154)

(declare-fun lt!144710 () Bool)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!292275 (= res!153330 (or lt!144710 (= lt!144711 (MissingVacant!2154 i!1256))))))

(assert (=> b!292275 (= lt!144710 (= lt!144711 (MissingZero!2154 i!1256)))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14765 (_ BitVec 32)) SeekEntryResult!2154)

(assert (=> b!292275 (= lt!144711 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun res!153333 () Bool)

(assert (=> start!28586 (=> (not res!153333) (not e!184930))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28586 (= res!153333 (validMask!0 mask!3809))))

(assert (=> start!28586 e!184930))

(assert (=> start!28586 true))

(declare-fun array_inv!4968 (array!14765) Bool)

(assert (=> start!28586 (array_inv!4968 a!3312)))

(declare-fun b!292276 () Bool)

(declare-fun res!153329 () Bool)

(assert (=> b!292276 (=> (not res!153329) (not e!184930))))

(assert (=> b!292276 (= res!153329 (and (= (size!7357 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7357 a!3312))))))

(declare-fun b!292277 () Bool)

(declare-fun res!153335 () Bool)

(assert (=> b!292277 (=> (not res!153335) (not e!184931))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14765 (_ BitVec 32)) Bool)

(assert (=> b!292277 (= res!153335 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!292278 () Bool)

(assert (=> b!292278 (= e!184931 e!184927)))

(declare-fun res!153334 () Bool)

(assert (=> b!292278 (=> (not res!153334) (not e!184927))))

(assert (=> b!292278 (= res!153334 (and (not lt!144710) (= lt!144711 (MissingVacant!2154 i!1256))))))

(declare-fun lt!144709 () SeekEntryResult!2154)

(declare-fun lt!144714 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14765 (_ BitVec 32)) SeekEntryResult!2154)

(assert (=> b!292278 (= lt!144709 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144714 k0!2524 (array!14766 (store (arr!7005 a!3312) i!1256 k0!2524) (size!7357 a!3312)) mask!3809))))

(assert (=> b!292278 (= lt!144712 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144714 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!292278 (= lt!144714 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!292279 () Bool)

(assert (=> b!292279 (= e!184928 (not true))))

(declare-datatypes ((Unit!9170 0))(
  ( (Unit!9171) )
))
(declare-fun lt!144713 () Unit!9170)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!14765 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9170)

(assert (=> b!292279 (= lt!144713 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3312 i!1256 k0!2524 #b00000000000000000000000000000000 lt!144714 (index!10788 lt!144712) (x!28977 lt!144712) mask!3809))))

(assert (=> b!292279 (= (index!10788 lt!144712) i!1256)))

(declare-fun b!292280 () Bool)

(declare-fun res!153332 () Bool)

(assert (=> b!292280 (=> (not res!153332) (not e!184930))))

(declare-fun arrayContainsKey!0 (array!14765 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!292280 (= res!153332 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!28586 res!153333) b!292276))

(assert (= (and b!292276 res!153329) b!292274))

(assert (= (and b!292274 res!153336) b!292280))

(assert (= (and b!292280 res!153332) b!292275))

(assert (= (and b!292275 res!153330) b!292277))

(assert (= (and b!292277 res!153335) b!292278))

(assert (= (and b!292278 res!153334) b!292273))

(assert (= (and b!292273 res!153331) b!292279))

(declare-fun m!305997 () Bool)

(assert (=> b!292279 m!305997))

(declare-fun m!305999 () Bool)

(assert (=> b!292280 m!305999))

(declare-fun m!306001 () Bool)

(assert (=> b!292275 m!306001))

(declare-fun m!306003 () Bool)

(assert (=> b!292278 m!306003))

(declare-fun m!306005 () Bool)

(assert (=> b!292278 m!306005))

(declare-fun m!306007 () Bool)

(assert (=> b!292278 m!306007))

(declare-fun m!306009 () Bool)

(assert (=> b!292278 m!306009))

(declare-fun m!306011 () Bool)

(assert (=> b!292274 m!306011))

(declare-fun m!306013 () Bool)

(assert (=> b!292277 m!306013))

(declare-fun m!306015 () Bool)

(assert (=> start!28586 m!306015))

(declare-fun m!306017 () Bool)

(assert (=> start!28586 m!306017))

(declare-fun m!306019 () Bool)

(assert (=> b!292273 m!306019))

(check-sat (not start!28586) (not b!292280) (not b!292278) (not b!292274) (not b!292275) (not b!292277) (not b!292279))
(check-sat)
