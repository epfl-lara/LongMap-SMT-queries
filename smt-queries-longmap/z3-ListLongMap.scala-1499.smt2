; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28424 () Bool)

(assert start!28424)

(declare-fun b!290950 () Bool)

(declare-fun e!184100 () Bool)

(declare-fun e!184097 () Bool)

(assert (=> b!290950 (= e!184100 e!184097)))

(declare-fun res!152341 () Bool)

(assert (=> b!290950 (=> (not res!152341) (not e!184097))))

(declare-datatypes ((SeekEntryResult!2117 0))(
  ( (MissingZero!2117 (index!10638 (_ BitVec 32))) (Found!2117 (index!10639 (_ BitVec 32))) (Intermediate!2117 (undefined!2929 Bool) (index!10640 (_ BitVec 32)) (x!28847 (_ BitVec 32))) (Undefined!2117) (MissingVacant!2117 (index!10641 (_ BitVec 32))) )
))
(declare-fun lt!143760 () SeekEntryResult!2117)

(declare-fun lt!143757 () Bool)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!290950 (= res!152341 (or lt!143757 (= lt!143760 (MissingVacant!2117 i!1256))))))

(assert (=> b!290950 (= lt!143757 (= lt!143760 (MissingZero!2117 i!1256)))))

(declare-datatypes ((array!14686 0))(
  ( (array!14687 (arr!6969 (Array (_ BitVec 32) (_ BitVec 64))) (size!7322 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14686)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14686 (_ BitVec 32)) SeekEntryResult!2117)

(assert (=> b!290950 (= lt!143760 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!290951 () Bool)

(declare-fun res!152342 () Bool)

(assert (=> b!290951 (=> (not res!152342) (not e!184100))))

(assert (=> b!290951 (= res!152342 (and (= (size!7322 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7322 a!3312))))))

(declare-fun b!290952 () Bool)

(declare-fun res!152347 () Bool)

(assert (=> b!290952 (=> (not res!152347) (not e!184100))))

(declare-fun arrayContainsKey!0 (array!14686 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!290952 (= res!152347 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!290953 () Bool)

(declare-fun res!152340 () Bool)

(assert (=> b!290953 (=> (not res!152340) (not e!184097))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14686 (_ BitVec 32)) Bool)

(assert (=> b!290953 (= res!152340 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!152344 () Bool)

(assert (=> start!28424 (=> (not res!152344) (not e!184100))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28424 (= res!152344 (validMask!0 mask!3809))))

(assert (=> start!28424 e!184100))

(assert (=> start!28424 true))

(declare-fun array_inv!4941 (array!14686) Bool)

(assert (=> start!28424 (array_inv!4941 a!3312)))

(declare-fun b!290954 () Bool)

(declare-fun e!184101 () Bool)

(declare-fun e!184098 () Bool)

(assert (=> b!290954 (= e!184101 e!184098)))

(declare-fun res!152345 () Bool)

(assert (=> b!290954 (=> (not res!152345) (not e!184098))))

(declare-fun lt!143759 () Bool)

(declare-fun lt!143756 () SeekEntryResult!2117)

(assert (=> b!290954 (= res!152345 (and (or lt!143759 (not (undefined!2929 lt!143756))) (not lt!143759) (= (select (arr!6969 a!3312) (index!10640 lt!143756)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(get-info :version)

(assert (=> b!290954 (= lt!143759 (not ((_ is Intermediate!2117) lt!143756)))))

(declare-fun b!290955 () Bool)

(declare-fun res!152346 () Bool)

(assert (=> b!290955 (=> (not res!152346) (not e!184100))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!290955 (= res!152346 (validKeyInArray!0 k0!2524))))

(declare-fun b!290956 () Bool)

(assert (=> b!290956 (= e!184097 e!184101)))

(declare-fun res!152343 () Bool)

(assert (=> b!290956 (=> (not res!152343) (not e!184101))))

(assert (=> b!290956 (= res!152343 (and (not lt!143757) (= lt!143760 (MissingVacant!2117 i!1256))))))

(declare-fun lt!143755 () (_ BitVec 32))

(declare-fun lt!143758 () SeekEntryResult!2117)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14686 (_ BitVec 32)) SeekEntryResult!2117)

(assert (=> b!290956 (= lt!143758 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143755 k0!2524 (array!14687 (store (arr!6969 a!3312) i!1256 k0!2524) (size!7322 a!3312)) mask!3809))))

(assert (=> b!290956 (= lt!143756 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143755 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!290956 (= lt!143755 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!290957 () Bool)

(assert (=> b!290957 (= e!184098 (not true))))

(assert (=> b!290957 (= (index!10640 lt!143756) i!1256)))

(assert (= (and start!28424 res!152344) b!290951))

(assert (= (and b!290951 res!152342) b!290955))

(assert (= (and b!290955 res!152346) b!290952))

(assert (= (and b!290952 res!152347) b!290950))

(assert (= (and b!290950 res!152341) b!290953))

(assert (= (and b!290953 res!152340) b!290956))

(assert (= (and b!290956 res!152343) b!290954))

(assert (= (and b!290954 res!152345) b!290957))

(declare-fun m!304469 () Bool)

(assert (=> b!290955 m!304469))

(declare-fun m!304471 () Bool)

(assert (=> b!290956 m!304471))

(declare-fun m!304473 () Bool)

(assert (=> b!290956 m!304473))

(declare-fun m!304475 () Bool)

(assert (=> b!290956 m!304475))

(declare-fun m!304477 () Bool)

(assert (=> b!290956 m!304477))

(declare-fun m!304479 () Bool)

(assert (=> b!290950 m!304479))

(declare-fun m!304481 () Bool)

(assert (=> b!290954 m!304481))

(declare-fun m!304483 () Bool)

(assert (=> b!290952 m!304483))

(declare-fun m!304485 () Bool)

(assert (=> b!290953 m!304485))

(declare-fun m!304487 () Bool)

(assert (=> start!28424 m!304487))

(declare-fun m!304489 () Bool)

(assert (=> start!28424 m!304489))

(check-sat (not b!290952) (not start!28424) (not b!290950) (not b!290955) (not b!290953) (not b!290956))
(check-sat)
