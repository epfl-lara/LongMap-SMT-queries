; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86802 () Bool)

(assert start!86802)

(declare-fun b!1006402 () Bool)

(declare-fun res!675622 () Bool)

(declare-fun e!566435 () Bool)

(assert (=> b!1006402 (=> (not res!675622) (not e!566435))))

(declare-datatypes ((array!63448 0))(
  ( (array!63449 (arr!30546 (Array (_ BitVec 32) (_ BitVec 64))) (size!31050 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63448)

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63448 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1006402 (= res!675622 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1006403 () Bool)

(declare-fun res!675615 () Bool)

(declare-fun e!566437 () Bool)

(assert (=> b!1006403 (=> (not res!675615) (not e!566437))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun lt!444610 () array!63448)

(declare-datatypes ((SeekEntryResult!9503 0))(
  ( (MissingZero!9503 (index!40383 (_ BitVec 32))) (Found!9503 (index!40384 (_ BitVec 32))) (Intermediate!9503 (undefined!10315 Bool) (index!40385 (_ BitVec 32)) (x!87794 (_ BitVec 32))) (Undefined!9503) (MissingVacant!9503 (index!40386 (_ BitVec 32))) )
))
(declare-fun lt!444613 () SeekEntryResult!9503)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun lt!444611 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63448 (_ BitVec 32)) SeekEntryResult!9503)

(assert (=> b!1006403 (= res!675615 (not (= lt!444613 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!444611 lt!444610 mask!3464))))))

(declare-fun b!1006404 () Bool)

(declare-fun res!675623 () Bool)

(declare-fun e!566438 () Bool)

(assert (=> b!1006404 (=> (not res!675623) (not e!566438))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1006404 (= res!675623 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31050 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31050 a!3219))))))

(declare-fun res!675620 () Bool)

(assert (=> start!86802 (=> (not res!675620) (not e!566435))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86802 (= res!675620 (validMask!0 mask!3464))))

(assert (=> start!86802 e!566435))

(declare-fun array_inv!23689 (array!63448) Bool)

(assert (=> start!86802 (array_inv!23689 a!3219)))

(assert (=> start!86802 true))

(declare-fun b!1006405 () Bool)

(declare-fun res!675619 () Bool)

(assert (=> b!1006405 (=> (not res!675619) (not e!566435))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1006405 (= res!675619 (validKeyInArray!0 k0!2224))))

(declare-fun b!1006406 () Bool)

(declare-fun res!675626 () Bool)

(assert (=> b!1006406 (=> (not res!675626) (not e!566438))))

(declare-datatypes ((List!21288 0))(
  ( (Nil!21285) (Cons!21284 (h!22467 (_ BitVec 64)) (t!30280 List!21288)) )
))
(declare-fun arrayNoDuplicates!0 (array!63448 (_ BitVec 32) List!21288) Bool)

(assert (=> b!1006406 (= res!675626 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21285))))

(declare-fun b!1006407 () Bool)

(declare-fun res!675618 () Bool)

(assert (=> b!1006407 (=> (not res!675618) (not e!566435))))

(declare-fun j!170 () (_ BitVec 32))

(assert (=> b!1006407 (= res!675618 (validKeyInArray!0 (select (arr!30546 a!3219) j!170)))))

(declare-fun b!1006408 () Bool)

(assert (=> b!1006408 (= e!566437 (bvslt (bvsub #b01111111111111111111111111111110 x!1245) #b00000000000000000000000000000000))))

(declare-fun b!1006409 () Bool)

(declare-fun e!566436 () Bool)

(assert (=> b!1006409 (= e!566436 e!566437)))

(declare-fun res!675614 () Bool)

(assert (=> b!1006409 (=> (not res!675614) (not e!566437))))

(declare-fun lt!444612 () SeekEntryResult!9503)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1006409 (= res!675614 (not (= lt!444612 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!444611 mask!3464) lt!444611 lt!444610 mask!3464))))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1006409 (= lt!444611 (select (store (arr!30546 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1006409 (= lt!444610 (array!63449 (store (arr!30546 a!3219) i!1194 k0!2224) (size!31050 a!3219)))))

(declare-fun b!1006410 () Bool)

(declare-fun res!675616 () Bool)

(assert (=> b!1006410 (=> (not res!675616) (not e!566438))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63448 (_ BitVec 32)) Bool)

(assert (=> b!1006410 (= res!675616 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1006411 () Bool)

(assert (=> b!1006411 (= e!566435 e!566438)))

(declare-fun res!675624 () Bool)

(assert (=> b!1006411 (=> (not res!675624) (not e!566438))))

(declare-fun lt!444609 () SeekEntryResult!9503)

(assert (=> b!1006411 (= res!675624 (or (= lt!444609 (MissingVacant!9503 i!1194)) (= lt!444609 (MissingZero!9503 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63448 (_ BitVec 32)) SeekEntryResult!9503)

(assert (=> b!1006411 (= lt!444609 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1006412 () Bool)

(declare-fun e!566434 () Bool)

(assert (=> b!1006412 (= e!566434 e!566436)))

(declare-fun res!675617 () Bool)

(assert (=> b!1006412 (=> (not res!675617) (not e!566436))))

(declare-fun lt!444608 () SeekEntryResult!9503)

(assert (=> b!1006412 (= res!675617 (= lt!444613 lt!444608))))

(assert (=> b!1006412 (= lt!444613 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30546 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1006413 () Bool)

(assert (=> b!1006413 (= e!566438 e!566434)))

(declare-fun res!675625 () Bool)

(assert (=> b!1006413 (=> (not res!675625) (not e!566434))))

(assert (=> b!1006413 (= res!675625 (= lt!444612 lt!444608))))

(assert (=> b!1006413 (= lt!444608 (Intermediate!9503 false resIndex!38 resX!38))))

(assert (=> b!1006413 (= lt!444612 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30546 a!3219) j!170) mask!3464) (select (arr!30546 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1006414 () Bool)

(declare-fun res!675621 () Bool)

(assert (=> b!1006414 (=> (not res!675621) (not e!566435))))

(assert (=> b!1006414 (= res!675621 (and (= (size!31050 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31050 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31050 a!3219)) (not (= i!1194 j!170))))))

(assert (= (and start!86802 res!675620) b!1006414))

(assert (= (and b!1006414 res!675621) b!1006407))

(assert (= (and b!1006407 res!675618) b!1006405))

(assert (= (and b!1006405 res!675619) b!1006402))

(assert (= (and b!1006402 res!675622) b!1006411))

(assert (= (and b!1006411 res!675624) b!1006410))

(assert (= (and b!1006410 res!675616) b!1006406))

(assert (= (and b!1006406 res!675626) b!1006404))

(assert (= (and b!1006404 res!675623) b!1006413))

(assert (= (and b!1006413 res!675625) b!1006412))

(assert (= (and b!1006412 res!675617) b!1006409))

(assert (= (and b!1006409 res!675614) b!1006403))

(assert (= (and b!1006403 res!675615) b!1006408))

(declare-fun m!930979 () Bool)

(assert (=> b!1006413 m!930979))

(assert (=> b!1006413 m!930979))

(declare-fun m!930981 () Bool)

(assert (=> b!1006413 m!930981))

(assert (=> b!1006413 m!930981))

(assert (=> b!1006413 m!930979))

(declare-fun m!930983 () Bool)

(assert (=> b!1006413 m!930983))

(declare-fun m!930985 () Bool)

(assert (=> b!1006403 m!930985))

(declare-fun m!930987 () Bool)

(assert (=> b!1006409 m!930987))

(assert (=> b!1006409 m!930987))

(declare-fun m!930989 () Bool)

(assert (=> b!1006409 m!930989))

(declare-fun m!930991 () Bool)

(assert (=> b!1006409 m!930991))

(declare-fun m!930993 () Bool)

(assert (=> b!1006409 m!930993))

(declare-fun m!930995 () Bool)

(assert (=> b!1006405 m!930995))

(declare-fun m!930997 () Bool)

(assert (=> start!86802 m!930997))

(declare-fun m!930999 () Bool)

(assert (=> start!86802 m!930999))

(assert (=> b!1006412 m!930979))

(assert (=> b!1006412 m!930979))

(declare-fun m!931001 () Bool)

(assert (=> b!1006412 m!931001))

(declare-fun m!931003 () Bool)

(assert (=> b!1006406 m!931003))

(declare-fun m!931005 () Bool)

(assert (=> b!1006411 m!931005))

(declare-fun m!931007 () Bool)

(assert (=> b!1006410 m!931007))

(declare-fun m!931009 () Bool)

(assert (=> b!1006402 m!931009))

(assert (=> b!1006407 m!930979))

(assert (=> b!1006407 m!930979))

(declare-fun m!931011 () Bool)

(assert (=> b!1006407 m!931011))

(check-sat (not b!1006412) (not b!1006413) (not b!1006409) (not b!1006402) (not b!1006403) (not b!1006406) (not b!1006410) (not start!86802) (not b!1006405) (not b!1006407) (not b!1006411))
(check-sat)
