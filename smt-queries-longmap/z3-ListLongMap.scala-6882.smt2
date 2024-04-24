; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86776 () Bool)

(assert start!86776)

(declare-fun b!1004299 () Bool)

(declare-fun e!565809 () Bool)

(declare-fun e!565804 () Bool)

(assert (=> b!1004299 (= e!565809 e!565804)))

(declare-fun res!673018 () Bool)

(assert (=> b!1004299 (=> (not res!673018) (not e!565804))))

(declare-datatypes ((SeekEntryResult!9385 0))(
  ( (MissingZero!9385 (index!39911 (_ BitVec 32))) (Found!9385 (index!39912 (_ BitVec 32))) (Intermediate!9385 (undefined!10197 Bool) (index!39913 (_ BitVec 32)) (x!87481 (_ BitVec 32))) (Undefined!9385) (MissingVacant!9385 (index!39914 (_ BitVec 32))) )
))
(declare-fun lt!443969 () SeekEntryResult!9385)

(declare-fun lt!443963 () SeekEntryResult!9385)

(assert (=> b!1004299 (= res!673018 (= lt!443969 lt!443963))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1004299 (= lt!443963 (Intermediate!9385 false resIndex!38 resX!38))))

(declare-datatypes ((array!63396 0))(
  ( (array!63397 (arr!30517 (Array (_ BitVec 32) (_ BitVec 64))) (size!31020 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63396)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63396 (_ BitVec 32)) SeekEntryResult!9385)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1004299 (= lt!443969 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30517 a!3219) j!170) mask!3464) (select (arr!30517 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1004301 () Bool)

(declare-fun e!565808 () Bool)

(declare-fun e!565807 () Bool)

(assert (=> b!1004301 (= e!565808 e!565807)))

(declare-fun res!673026 () Bool)

(assert (=> b!1004301 (=> (not res!673026) (not e!565807))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun lt!443968 () (_ BitVec 32))

(assert (=> b!1004301 (= res!673026 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!443968 #b00000000000000000000000000000000) (bvslt lt!443968 (size!31020 a!3219))))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1004301 (= lt!443968 (nextIndex!0 index!1507 (bvadd #b00000000000000000000000000000001 x!1245) mask!3464))))

(declare-fun b!1004302 () Bool)

(assert (=> b!1004302 (= e!565807 false)))

(declare-fun lt!443966 () array!63396)

(declare-fun lt!443965 () (_ BitVec 64))

(declare-fun lt!443962 () SeekEntryResult!9385)

(assert (=> b!1004302 (= lt!443962 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443968 lt!443965 lt!443966 mask!3464))))

(declare-fun b!1004303 () Bool)

(declare-fun res!673020 () Bool)

(assert (=> b!1004303 (=> (not res!673020) (not e!565808))))

(declare-fun lt!443967 () SeekEntryResult!9385)

(assert (=> b!1004303 (= res!673020 (not (= lt!443967 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!443965 lt!443966 mask!3464))))))

(declare-fun b!1004304 () Bool)

(declare-fun res!673023 () Bool)

(declare-fun e!565803 () Bool)

(assert (=> b!1004304 (=> (not res!673023) (not e!565803))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63396 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1004304 (= res!673023 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1004305 () Bool)

(declare-fun e!565806 () Bool)

(assert (=> b!1004305 (= e!565804 e!565806)))

(declare-fun res!673029 () Bool)

(assert (=> b!1004305 (=> (not res!673029) (not e!565806))))

(assert (=> b!1004305 (= res!673029 (= lt!443967 lt!443963))))

(assert (=> b!1004305 (= lt!443967 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30517 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1004306 () Bool)

(assert (=> b!1004306 (= e!565806 e!565808)))

(declare-fun res!673024 () Bool)

(assert (=> b!1004306 (=> (not res!673024) (not e!565808))))

(assert (=> b!1004306 (= res!673024 (not (= lt!443969 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!443965 mask!3464) lt!443965 lt!443966 mask!3464))))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1004306 (= lt!443965 (select (store (arr!30517 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1004306 (= lt!443966 (array!63397 (store (arr!30517 a!3219) i!1194 k0!2224) (size!31020 a!3219)))))

(declare-fun b!1004307 () Bool)

(declare-fun res!673027 () Bool)

(assert (=> b!1004307 (=> (not res!673027) (not e!565808))))

(assert (=> b!1004307 (= res!673027 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1004308 () Bool)

(declare-fun res!673016 () Bool)

(assert (=> b!1004308 (=> (not res!673016) (not e!565803))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1004308 (= res!673016 (validKeyInArray!0 k0!2224))))

(declare-fun b!1004309 () Bool)

(declare-fun res!673022 () Bool)

(assert (=> b!1004309 (=> (not res!673022) (not e!565803))))

(assert (=> b!1004309 (= res!673022 (and (= (size!31020 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31020 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31020 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1004310 () Bool)

(declare-fun res!673028 () Bool)

(assert (=> b!1004310 (=> (not res!673028) (not e!565803))))

(assert (=> b!1004310 (= res!673028 (validKeyInArray!0 (select (arr!30517 a!3219) j!170)))))

(declare-fun b!1004300 () Bool)

(declare-fun res!673030 () Bool)

(assert (=> b!1004300 (=> (not res!673030) (not e!565807))))

(assert (=> b!1004300 (= res!673030 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443968 (select (arr!30517 a!3219) j!170) a!3219 mask!3464) lt!443963))))

(declare-fun res!673019 () Bool)

(assert (=> start!86776 (=> (not res!673019) (not e!565803))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86776 (= res!673019 (validMask!0 mask!3464))))

(assert (=> start!86776 e!565803))

(declare-fun array_inv!23653 (array!63396) Bool)

(assert (=> start!86776 (array_inv!23653 a!3219)))

(assert (=> start!86776 true))

(declare-fun b!1004311 () Bool)

(declare-fun res!673021 () Bool)

(assert (=> b!1004311 (=> (not res!673021) (not e!565809))))

(assert (=> b!1004311 (= res!673021 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31020 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31020 a!3219))))))

(declare-fun b!1004312 () Bool)

(assert (=> b!1004312 (= e!565803 e!565809)))

(declare-fun res!673031 () Bool)

(assert (=> b!1004312 (=> (not res!673031) (not e!565809))))

(declare-fun lt!443964 () SeekEntryResult!9385)

(assert (=> b!1004312 (= res!673031 (or (= lt!443964 (MissingVacant!9385 i!1194)) (= lt!443964 (MissingZero!9385 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63396 (_ BitVec 32)) SeekEntryResult!9385)

(assert (=> b!1004312 (= lt!443964 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1004313 () Bool)

(declare-fun res!673025 () Bool)

(assert (=> b!1004313 (=> (not res!673025) (not e!565809))))

(declare-datatypes ((List!21164 0))(
  ( (Nil!21161) (Cons!21160 (h!22346 (_ BitVec 64)) (t!30157 List!21164)) )
))
(declare-fun arrayNoDuplicates!0 (array!63396 (_ BitVec 32) List!21164) Bool)

(assert (=> b!1004313 (= res!673025 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21161))))

(declare-fun b!1004314 () Bool)

(declare-fun res!673017 () Bool)

(assert (=> b!1004314 (=> (not res!673017) (not e!565809))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63396 (_ BitVec 32)) Bool)

(assert (=> b!1004314 (= res!673017 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(assert (= (and start!86776 res!673019) b!1004309))

(assert (= (and b!1004309 res!673022) b!1004310))

(assert (= (and b!1004310 res!673028) b!1004308))

(assert (= (and b!1004308 res!673016) b!1004304))

(assert (= (and b!1004304 res!673023) b!1004312))

(assert (= (and b!1004312 res!673031) b!1004314))

(assert (= (and b!1004314 res!673017) b!1004313))

(assert (= (and b!1004313 res!673025) b!1004311))

(assert (= (and b!1004311 res!673021) b!1004299))

(assert (= (and b!1004299 res!673018) b!1004305))

(assert (= (and b!1004305 res!673029) b!1004306))

(assert (= (and b!1004306 res!673024) b!1004303))

(assert (= (and b!1004303 res!673020) b!1004307))

(assert (= (and b!1004307 res!673027) b!1004301))

(assert (= (and b!1004301 res!673026) b!1004300))

(assert (= (and b!1004300 res!673030) b!1004302))

(declare-fun m!930353 () Bool)

(assert (=> b!1004314 m!930353))

(declare-fun m!930355 () Bool)

(assert (=> b!1004299 m!930355))

(assert (=> b!1004299 m!930355))

(declare-fun m!930357 () Bool)

(assert (=> b!1004299 m!930357))

(assert (=> b!1004299 m!930357))

(assert (=> b!1004299 m!930355))

(declare-fun m!930359 () Bool)

(assert (=> b!1004299 m!930359))

(declare-fun m!930361 () Bool)

(assert (=> b!1004302 m!930361))

(declare-fun m!930363 () Bool)

(assert (=> b!1004308 m!930363))

(assert (=> b!1004300 m!930355))

(assert (=> b!1004300 m!930355))

(declare-fun m!930365 () Bool)

(assert (=> b!1004300 m!930365))

(declare-fun m!930367 () Bool)

(assert (=> b!1004312 m!930367))

(declare-fun m!930369 () Bool)

(assert (=> b!1004313 m!930369))

(declare-fun m!930371 () Bool)

(assert (=> b!1004304 m!930371))

(assert (=> b!1004305 m!930355))

(assert (=> b!1004305 m!930355))

(declare-fun m!930373 () Bool)

(assert (=> b!1004305 m!930373))

(declare-fun m!930375 () Bool)

(assert (=> start!86776 m!930375))

(declare-fun m!930377 () Bool)

(assert (=> start!86776 m!930377))

(declare-fun m!930379 () Bool)

(assert (=> b!1004303 m!930379))

(declare-fun m!930381 () Bool)

(assert (=> b!1004306 m!930381))

(assert (=> b!1004306 m!930381))

(declare-fun m!930383 () Bool)

(assert (=> b!1004306 m!930383))

(declare-fun m!930385 () Bool)

(assert (=> b!1004306 m!930385))

(declare-fun m!930387 () Bool)

(assert (=> b!1004306 m!930387))

(assert (=> b!1004310 m!930355))

(assert (=> b!1004310 m!930355))

(declare-fun m!930389 () Bool)

(assert (=> b!1004310 m!930389))

(declare-fun m!930391 () Bool)

(assert (=> b!1004301 m!930391))

(check-sat (not b!1004302) (not b!1004312) (not b!1004305) (not b!1004313) (not b!1004304) (not b!1004310) (not b!1004299) (not start!86776) (not b!1004301) (not b!1004306) (not b!1004314) (not b!1004308) (not b!1004303) (not b!1004300))
(check-sat)
