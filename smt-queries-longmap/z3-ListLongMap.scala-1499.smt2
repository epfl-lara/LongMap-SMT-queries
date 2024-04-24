; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28420 () Bool)

(assert start!28420)

(declare-fun b!291144 () Bool)

(declare-fun e!184222 () Bool)

(assert (=> b!291144 (= e!184222 (not true))))

(declare-datatypes ((SeekEntryResult!2087 0))(
  ( (MissingZero!2087 (index!10518 (_ BitVec 32))) (Found!2087 (index!10519 (_ BitVec 32))) (Intermediate!2087 (undefined!2899 Bool) (index!10520 (_ BitVec 32)) (x!28818 (_ BitVec 32))) (Undefined!2087) (MissingVacant!2087 (index!10521 (_ BitVec 32))) )
))
(declare-fun lt!143995 () SeekEntryResult!2087)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!291144 (= (index!10520 lt!143995) i!1256)))

(declare-fun b!291145 () Bool)

(declare-fun res!152456 () Bool)

(declare-fun e!184225 () Bool)

(assert (=> b!291145 (=> (not res!152456) (not e!184225))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!291145 (= res!152456 (validKeyInArray!0 k0!2524))))

(declare-fun b!291146 () Bool)

(declare-fun e!184224 () Bool)

(assert (=> b!291146 (= e!184224 e!184222)))

(declare-fun res!152457 () Bool)

(assert (=> b!291146 (=> (not res!152457) (not e!184222))))

(declare-fun lt!143997 () Bool)

(declare-datatypes ((array!14694 0))(
  ( (array!14695 (arr!6973 (Array (_ BitVec 32) (_ BitVec 64))) (size!7325 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14694)

(assert (=> b!291146 (= res!152457 (and (or lt!143997 (not (undefined!2899 lt!143995))) (not lt!143997) (= (select (arr!6973 a!3312) (index!10520 lt!143995)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(get-info :version)

(assert (=> b!291146 (= lt!143997 (not ((_ is Intermediate!2087) lt!143995)))))

(declare-fun b!291147 () Bool)

(declare-fun res!152459 () Bool)

(assert (=> b!291147 (=> (not res!152459) (not e!184225))))

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!291147 (= res!152459 (and (= (size!7325 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7325 a!3312))))))

(declare-fun b!291148 () Bool)

(declare-fun e!184226 () Bool)

(assert (=> b!291148 (= e!184225 e!184226)))

(declare-fun res!152458 () Bool)

(assert (=> b!291148 (=> (not res!152458) (not e!184226))))

(declare-fun lt!143996 () Bool)

(declare-fun lt!143998 () SeekEntryResult!2087)

(assert (=> b!291148 (= res!152458 (or lt!143996 (= lt!143998 (MissingVacant!2087 i!1256))))))

(assert (=> b!291148 (= lt!143996 (= lt!143998 (MissingZero!2087 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14694 (_ BitVec 32)) SeekEntryResult!2087)

(assert (=> b!291148 (= lt!143998 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!291149 () Bool)

(assert (=> b!291149 (= e!184226 e!184224)))

(declare-fun res!152461 () Bool)

(assert (=> b!291149 (=> (not res!152461) (not e!184224))))

(assert (=> b!291149 (= res!152461 (and (not lt!143996) (= lt!143998 (MissingVacant!2087 i!1256))))))

(declare-fun lt!143999 () SeekEntryResult!2087)

(declare-fun lt!144000 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14694 (_ BitVec 32)) SeekEntryResult!2087)

(assert (=> b!291149 (= lt!143999 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144000 k0!2524 (array!14695 (store (arr!6973 a!3312) i!1256 k0!2524) (size!7325 a!3312)) mask!3809))))

(assert (=> b!291149 (= lt!143995 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144000 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!291149 (= lt!144000 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!291150 () Bool)

(declare-fun res!152462 () Bool)

(assert (=> b!291150 (=> (not res!152462) (not e!184225))))

(declare-fun arrayContainsKey!0 (array!14694 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!291150 (= res!152462 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!291151 () Bool)

(declare-fun res!152463 () Bool)

(assert (=> b!291151 (=> (not res!152463) (not e!184226))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14694 (_ BitVec 32)) Bool)

(assert (=> b!291151 (= res!152463 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!152460 () Bool)

(assert (=> start!28420 (=> (not res!152460) (not e!184225))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28420 (= res!152460 (validMask!0 mask!3809))))

(assert (=> start!28420 e!184225))

(assert (=> start!28420 true))

(declare-fun array_inv!4923 (array!14694) Bool)

(assert (=> start!28420 (array_inv!4923 a!3312)))

(assert (= (and start!28420 res!152460) b!291147))

(assert (= (and b!291147 res!152459) b!291145))

(assert (= (and b!291145 res!152456) b!291150))

(assert (= (and b!291150 res!152462) b!291148))

(assert (= (and b!291148 res!152458) b!291151))

(assert (= (and b!291151 res!152463) b!291149))

(assert (= (and b!291149 res!152461) b!291146))

(assert (= (and b!291146 res!152457) b!291144))

(declare-fun m!305267 () Bool)

(assert (=> b!291145 m!305267))

(declare-fun m!305269 () Bool)

(assert (=> b!291151 m!305269))

(declare-fun m!305271 () Bool)

(assert (=> start!28420 m!305271))

(declare-fun m!305273 () Bool)

(assert (=> start!28420 m!305273))

(declare-fun m!305275 () Bool)

(assert (=> b!291148 m!305275))

(declare-fun m!305277 () Bool)

(assert (=> b!291149 m!305277))

(declare-fun m!305279 () Bool)

(assert (=> b!291149 m!305279))

(declare-fun m!305281 () Bool)

(assert (=> b!291149 m!305281))

(declare-fun m!305283 () Bool)

(assert (=> b!291149 m!305283))

(declare-fun m!305285 () Bool)

(assert (=> b!291150 m!305285))

(declare-fun m!305287 () Bool)

(assert (=> b!291146 m!305287))

(check-sat (not b!291151) (not start!28420) (not b!291145) (not b!291150) (not b!291148) (not b!291149))
(check-sat)
