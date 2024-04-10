; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28424 () Bool)

(assert start!28424)

(declare-fun b!291049 () Bool)

(declare-fun e!184169 () Bool)

(declare-fun e!184172 () Bool)

(assert (=> b!291049 (= e!184169 e!184172)))

(declare-fun res!152387 () Bool)

(assert (=> b!291049 (=> (not res!152387) (not e!184172))))

(declare-datatypes ((SeekEntryResult!2121 0))(
  ( (MissingZero!2121 (index!10654 (_ BitVec 32))) (Found!2121 (index!10655 (_ BitVec 32))) (Intermediate!2121 (undefined!2933 Bool) (index!10656 (_ BitVec 32)) (x!28844 (_ BitVec 32))) (Undefined!2121) (MissingVacant!2121 (index!10657 (_ BitVec 32))) )
))
(declare-fun lt!143905 () SeekEntryResult!2121)

(declare-fun lt!143901 () Bool)

(declare-datatypes ((array!14693 0))(
  ( (array!14694 (arr!6972 (Array (_ BitVec 32) (_ BitVec 64))) (size!7324 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14693)

(assert (=> b!291049 (= res!152387 (and (or lt!143901 (not (undefined!2933 lt!143905))) (not lt!143901) (= (select (arr!6972 a!3312) (index!10656 lt!143905)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(get-info :version)

(assert (=> b!291049 (= lt!143901 (not ((_ is Intermediate!2121) lt!143905)))))

(declare-fun b!291050 () Bool)

(declare-fun e!184170 () Bool)

(declare-fun e!184171 () Bool)

(assert (=> b!291050 (= e!184170 e!184171)))

(declare-fun res!152389 () Bool)

(assert (=> b!291050 (=> (not res!152389) (not e!184171))))

(declare-fun lt!143902 () SeekEntryResult!2121)

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!143904 () Bool)

(assert (=> b!291050 (= res!152389 (or lt!143904 (= lt!143902 (MissingVacant!2121 i!1256))))))

(assert (=> b!291050 (= lt!143904 (= lt!143902 (MissingZero!2121 i!1256)))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14693 (_ BitVec 32)) SeekEntryResult!2121)

(assert (=> b!291050 (= lt!143902 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!291051 () Bool)

(declare-fun res!152390 () Bool)

(assert (=> b!291051 (=> (not res!152390) (not e!184170))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!291051 (= res!152390 (validKeyInArray!0 k0!2524))))

(declare-fun b!291052 () Bool)

(declare-fun res!152391 () Bool)

(assert (=> b!291052 (=> (not res!152391) (not e!184170))))

(assert (=> b!291052 (= res!152391 (and (= (size!7324 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7324 a!3312))))))

(declare-fun res!152388 () Bool)

(assert (=> start!28424 (=> (not res!152388) (not e!184170))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28424 (= res!152388 (validMask!0 mask!3809))))

(assert (=> start!28424 e!184170))

(assert (=> start!28424 true))

(declare-fun array_inv!4935 (array!14693) Bool)

(assert (=> start!28424 (array_inv!4935 a!3312)))

(declare-fun b!291053 () Bool)

(declare-fun res!152392 () Bool)

(assert (=> b!291053 (=> (not res!152392) (not e!184170))))

(declare-fun arrayContainsKey!0 (array!14693 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!291053 (= res!152392 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!291054 () Bool)

(assert (=> b!291054 (= e!184171 e!184169)))

(declare-fun res!152394 () Bool)

(assert (=> b!291054 (=> (not res!152394) (not e!184169))))

(assert (=> b!291054 (= res!152394 (and (not lt!143904) (= lt!143902 (MissingVacant!2121 i!1256))))))

(declare-fun lt!143903 () (_ BitVec 32))

(declare-fun lt!143900 () SeekEntryResult!2121)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14693 (_ BitVec 32)) SeekEntryResult!2121)

(assert (=> b!291054 (= lt!143900 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143903 k0!2524 (array!14694 (store (arr!6972 a!3312) i!1256 k0!2524) (size!7324 a!3312)) mask!3809))))

(assert (=> b!291054 (= lt!143905 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143903 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!291054 (= lt!143903 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!291055 () Bool)

(declare-fun res!152393 () Bool)

(assert (=> b!291055 (=> (not res!152393) (not e!184171))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14693 (_ BitVec 32)) Bool)

(assert (=> b!291055 (= res!152393 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!291056 () Bool)

(assert (=> b!291056 (= e!184172 (not true))))

(assert (=> b!291056 (= (index!10656 lt!143905) i!1256)))

(assert (= (and start!28424 res!152388) b!291052))

(assert (= (and b!291052 res!152391) b!291051))

(assert (= (and b!291051 res!152390) b!291053))

(assert (= (and b!291053 res!152392) b!291050))

(assert (= (and b!291050 res!152389) b!291055))

(assert (= (and b!291055 res!152393) b!291054))

(assert (= (and b!291054 res!152394) b!291049))

(assert (= (and b!291049 res!152387) b!291056))

(declare-fun m!305017 () Bool)

(assert (=> b!291054 m!305017))

(declare-fun m!305019 () Bool)

(assert (=> b!291054 m!305019))

(declare-fun m!305021 () Bool)

(assert (=> b!291054 m!305021))

(declare-fun m!305023 () Bool)

(assert (=> b!291054 m!305023))

(declare-fun m!305025 () Bool)

(assert (=> b!291051 m!305025))

(declare-fun m!305027 () Bool)

(assert (=> b!291055 m!305027))

(declare-fun m!305029 () Bool)

(assert (=> b!291049 m!305029))

(declare-fun m!305031 () Bool)

(assert (=> b!291050 m!305031))

(declare-fun m!305033 () Bool)

(assert (=> start!28424 m!305033))

(declare-fun m!305035 () Bool)

(assert (=> start!28424 m!305035))

(declare-fun m!305037 () Bool)

(assert (=> b!291053 m!305037))

(check-sat (not b!291051) (not start!28424) (not b!291053) (not b!291055) (not b!291054) (not b!291050))
(check-sat)
