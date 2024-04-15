; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86730 () Bool)

(assert start!86730)

(declare-fun b!1005269 () Bool)

(declare-fun e!566051 () Bool)

(declare-fun e!566049 () Bool)

(assert (=> b!1005269 (= e!566051 e!566049)))

(declare-fun res!674486 () Bool)

(assert (=> b!1005269 (=> (not res!674486) (not e!566049))))

(declare-datatypes ((SeekEntryResult!9467 0))(
  ( (MissingZero!9467 (index!40239 (_ BitVec 32))) (Found!9467 (index!40240 (_ BitVec 32))) (Intermediate!9467 (undefined!10279 Bool) (index!40241 (_ BitVec 32)) (x!87662 (_ BitVec 32))) (Undefined!9467) (MissingVacant!9467 (index!40242 (_ BitVec 32))) )
))
(declare-fun lt!444330 () SeekEntryResult!9467)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1005269 (= res!674486 (or (= lt!444330 (MissingVacant!9467 i!1194)) (= lt!444330 (MissingZero!9467 i!1194))))))

(declare-datatypes ((array!63376 0))(
  ( (array!63377 (arr!30510 (Array (_ BitVec 32) (_ BitVec 64))) (size!31014 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63376)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63376 (_ BitVec 32)) SeekEntryResult!9467)

(assert (=> b!1005269 (= lt!444330 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1005270 () Bool)

(assert (=> b!1005270 (= e!566049 false)))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun lt!444331 () SeekEntryResult!9467)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63376 (_ BitVec 32)) SeekEntryResult!9467)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1005270 (= lt!444331 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30510 a!3219) j!170) mask!3464) (select (arr!30510 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1005271 () Bool)

(declare-fun res!674488 () Bool)

(assert (=> b!1005271 (=> (not res!674488) (not e!566051))))

(assert (=> b!1005271 (= res!674488 (and (= (size!31014 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31014 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31014 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1005273 () Bool)

(declare-fun res!674489 () Bool)

(assert (=> b!1005273 (=> (not res!674489) (not e!566051))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1005273 (= res!674489 (validKeyInArray!0 k0!2224))))

(declare-fun b!1005274 () Bool)

(declare-fun res!674484 () Bool)

(assert (=> b!1005274 (=> (not res!674484) (not e!566049))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63376 (_ BitVec 32)) Bool)

(assert (=> b!1005274 (= res!674484 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1005275 () Bool)

(declare-fun res!674482 () Bool)

(assert (=> b!1005275 (=> (not res!674482) (not e!566049))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1005275 (= res!674482 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31014 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31014 a!3219))))))

(declare-fun res!674485 () Bool)

(assert (=> start!86730 (=> (not res!674485) (not e!566051))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86730 (= res!674485 (validMask!0 mask!3464))))

(assert (=> start!86730 e!566051))

(declare-fun array_inv!23653 (array!63376) Bool)

(assert (=> start!86730 (array_inv!23653 a!3219)))

(assert (=> start!86730 true))

(declare-fun b!1005272 () Bool)

(declare-fun res!674483 () Bool)

(assert (=> b!1005272 (=> (not res!674483) (not e!566051))))

(assert (=> b!1005272 (= res!674483 (validKeyInArray!0 (select (arr!30510 a!3219) j!170)))))

(declare-fun b!1005276 () Bool)

(declare-fun res!674481 () Bool)

(assert (=> b!1005276 (=> (not res!674481) (not e!566051))))

(declare-fun arrayContainsKey!0 (array!63376 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1005276 (= res!674481 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1005277 () Bool)

(declare-fun res!674487 () Bool)

(assert (=> b!1005277 (=> (not res!674487) (not e!566049))))

(declare-datatypes ((List!21252 0))(
  ( (Nil!21249) (Cons!21248 (h!22431 (_ BitVec 64)) (t!30244 List!21252)) )
))
(declare-fun arrayNoDuplicates!0 (array!63376 (_ BitVec 32) List!21252) Bool)

(assert (=> b!1005277 (= res!674487 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21249))))

(assert (= (and start!86730 res!674485) b!1005271))

(assert (= (and b!1005271 res!674488) b!1005272))

(assert (= (and b!1005272 res!674483) b!1005273))

(assert (= (and b!1005273 res!674489) b!1005276))

(assert (= (and b!1005276 res!674481) b!1005269))

(assert (= (and b!1005269 res!674486) b!1005274))

(assert (= (and b!1005274 res!674484) b!1005277))

(assert (= (and b!1005277 res!674487) b!1005275))

(assert (= (and b!1005275 res!674482) b!1005270))

(declare-fun m!929989 () Bool)

(assert (=> b!1005269 m!929989))

(declare-fun m!929991 () Bool)

(assert (=> b!1005273 m!929991))

(declare-fun m!929993 () Bool)

(assert (=> b!1005276 m!929993))

(declare-fun m!929995 () Bool)

(assert (=> b!1005277 m!929995))

(declare-fun m!929997 () Bool)

(assert (=> b!1005272 m!929997))

(assert (=> b!1005272 m!929997))

(declare-fun m!929999 () Bool)

(assert (=> b!1005272 m!929999))

(declare-fun m!930001 () Bool)

(assert (=> start!86730 m!930001))

(declare-fun m!930003 () Bool)

(assert (=> start!86730 m!930003))

(declare-fun m!930005 () Bool)

(assert (=> b!1005274 m!930005))

(assert (=> b!1005270 m!929997))

(assert (=> b!1005270 m!929997))

(declare-fun m!930007 () Bool)

(assert (=> b!1005270 m!930007))

(assert (=> b!1005270 m!930007))

(assert (=> b!1005270 m!929997))

(declare-fun m!930009 () Bool)

(assert (=> b!1005270 m!930009))

(check-sat (not b!1005272) (not b!1005277) (not b!1005276) (not b!1005274) (not start!86730) (not b!1005273) (not b!1005269) (not b!1005270))
(check-sat)
