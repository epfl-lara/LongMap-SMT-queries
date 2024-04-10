; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28166 () Bool)

(assert start!28166)

(declare-fun b!288349 () Bool)

(declare-fun res!149979 () Bool)

(declare-fun e!182570 () Bool)

(assert (=> b!288349 (=> (not res!149979) (not e!182570))))

(declare-datatypes ((array!14480 0))(
  ( (array!14481 (arr!6867 (Array (_ BitVec 32) (_ BitVec 64))) (size!7219 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14480)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14480 (_ BitVec 32)) Bool)

(assert (=> b!288349 (= res!149979 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!288350 () Bool)

(declare-fun e!182573 () Bool)

(declare-fun e!182569 () Bool)

(assert (=> b!288350 (= e!182573 e!182569)))

(declare-fun res!149974 () Bool)

(assert (=> b!288350 (=> (not res!149974) (not e!182569))))

(declare-fun lt!142016 () Bool)

(declare-datatypes ((SeekEntryResult!2016 0))(
  ( (MissingZero!2016 (index!10234 (_ BitVec 32))) (Found!2016 (index!10235 (_ BitVec 32))) (Intermediate!2016 (undefined!2828 Bool) (index!10236 (_ BitVec 32)) (x!28453 (_ BitVec 32))) (Undefined!2016) (MissingVacant!2016 (index!10237 (_ BitVec 32))) )
))
(declare-fun lt!142018 () SeekEntryResult!2016)

(declare-fun k0!2524 () (_ BitVec 64))

(assert (=> b!288350 (= res!149974 (and (or lt!142016 (not (undefined!2828 lt!142018))) (or lt!142016 (not (= (select (arr!6867 a!3312) (index!10236 lt!142018)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!142016 (not (= (select (arr!6867 a!3312) (index!10236 lt!142018)) k0!2524))) (not lt!142016)))))

(get-info :version)

(assert (=> b!288350 (= lt!142016 (not ((_ is Intermediate!2016) lt!142018)))))

(declare-fun b!288351 () Bool)

(assert (=> b!288351 (= e!182569 (not true))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!288351 (and (= (select (arr!6867 a!3312) (index!10236 lt!142018)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10236 lt!142018) i!1256))))

(declare-fun b!288352 () Bool)

(declare-fun res!149973 () Bool)

(declare-fun e!182571 () Bool)

(assert (=> b!288352 (=> (not res!149973) (not e!182571))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!288352 (= res!149973 (validKeyInArray!0 k0!2524))))

(declare-fun b!288353 () Bool)

(declare-fun res!149977 () Bool)

(assert (=> b!288353 (=> (not res!149977) (not e!182571))))

(declare-fun arrayContainsKey!0 (array!14480 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!288353 (= res!149977 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun res!149972 () Bool)

(assert (=> start!28166 (=> (not res!149972) (not e!182571))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28166 (= res!149972 (validMask!0 mask!3809))))

(assert (=> start!28166 e!182571))

(assert (=> start!28166 true))

(declare-fun array_inv!4830 (array!14480) Bool)

(assert (=> start!28166 (array_inv!4830 a!3312)))

(declare-fun b!288354 () Bool)

(assert (=> b!288354 (= e!182570 e!182573)))

(declare-fun res!149978 () Bool)

(assert (=> b!288354 (=> (not res!149978) (not e!182573))))

(declare-fun lt!142014 () Bool)

(assert (=> b!288354 (= res!149978 lt!142014)))

(declare-fun lt!142017 () (_ BitVec 32))

(declare-fun lt!142013 () SeekEntryResult!2016)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14480 (_ BitVec 32)) SeekEntryResult!2016)

(assert (=> b!288354 (= lt!142013 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142017 k0!2524 (array!14481 (store (arr!6867 a!3312) i!1256 k0!2524) (size!7219 a!3312)) mask!3809))))

(assert (=> b!288354 (= lt!142018 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142017 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!288354 (= lt!142017 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!288355 () Bool)

(declare-fun res!149976 () Bool)

(assert (=> b!288355 (=> (not res!149976) (not e!182571))))

(assert (=> b!288355 (= res!149976 (and (= (size!7219 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7219 a!3312))))))

(declare-fun b!288356 () Bool)

(assert (=> b!288356 (= e!182571 e!182570)))

(declare-fun res!149975 () Bool)

(assert (=> b!288356 (=> (not res!149975) (not e!182570))))

(declare-fun lt!142015 () SeekEntryResult!2016)

(assert (=> b!288356 (= res!149975 (or lt!142014 (= lt!142015 (MissingVacant!2016 i!1256))))))

(assert (=> b!288356 (= lt!142014 (= lt!142015 (MissingZero!2016 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14480 (_ BitVec 32)) SeekEntryResult!2016)

(assert (=> b!288356 (= lt!142015 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(assert (= (and start!28166 res!149972) b!288355))

(assert (= (and b!288355 res!149976) b!288352))

(assert (= (and b!288352 res!149973) b!288353))

(assert (= (and b!288353 res!149977) b!288356))

(assert (= (and b!288356 res!149975) b!288349))

(assert (= (and b!288349 res!149979) b!288354))

(assert (= (and b!288354 res!149978) b!288350))

(assert (= (and b!288350 res!149974) b!288351))

(declare-fun m!302587 () Bool)

(assert (=> start!28166 m!302587))

(declare-fun m!302589 () Bool)

(assert (=> start!28166 m!302589))

(declare-fun m!302591 () Bool)

(assert (=> b!288349 m!302591))

(declare-fun m!302593 () Bool)

(assert (=> b!288356 m!302593))

(declare-fun m!302595 () Bool)

(assert (=> b!288350 m!302595))

(declare-fun m!302597 () Bool)

(assert (=> b!288352 m!302597))

(declare-fun m!302599 () Bool)

(assert (=> b!288354 m!302599))

(declare-fun m!302601 () Bool)

(assert (=> b!288354 m!302601))

(declare-fun m!302603 () Bool)

(assert (=> b!288354 m!302603))

(declare-fun m!302605 () Bool)

(assert (=> b!288354 m!302605))

(declare-fun m!302607 () Bool)

(assert (=> b!288353 m!302607))

(assert (=> b!288351 m!302595))

(check-sat (not b!288353) (not start!28166) (not b!288354) (not b!288349) (not b!288356) (not b!288352))
(check-sat)
