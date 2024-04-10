; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86504 () Bool)

(assert start!86504)

(declare-fun b!1002045 () Bool)

(declare-fun res!671524 () Bool)

(declare-fun e!564563 () Bool)

(assert (=> b!1002045 (=> (not res!671524) (not e!564563))))

(declare-datatypes ((array!63305 0))(
  ( (array!63306 (arr!30478 (Array (_ BitVec 32) (_ BitVec 64))) (size!30980 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63305)

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63305 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1002045 (= res!671524 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1002046 () Bool)

(declare-fun res!671525 () Bool)

(declare-fun e!564564 () Bool)

(assert (=> b!1002046 (=> (not res!671525) (not e!564564))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1002046 (= res!671525 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1002047 () Bool)

(declare-fun res!671537 () Bool)

(assert (=> b!1002047 (=> (not res!671537) (not e!564564))))

(declare-fun lt!442983 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!9410 0))(
  ( (MissingZero!9410 (index!40011 (_ BitVec 32))) (Found!9410 (index!40012 (_ BitVec 32))) (Intermediate!9410 (undefined!10222 Bool) (index!40013 (_ BitVec 32)) (x!87430 (_ BitVec 32))) (Undefined!9410) (MissingVacant!9410 (index!40014 (_ BitVec 32))) )
))
(declare-fun lt!442979 () SeekEntryResult!9410)

(declare-fun lt!442978 () array!63305)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63305 (_ BitVec 32)) SeekEntryResult!9410)

(assert (=> b!1002047 (= res!671537 (not (= lt!442979 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!442983 lt!442978 mask!3464))))))

(declare-fun b!1002048 () Bool)

(declare-fun res!671528 () Bool)

(assert (=> b!1002048 (=> (not res!671528) (not e!564563))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1002048 (= res!671528 (validKeyInArray!0 (select (arr!30478 a!3219) j!170)))))

(declare-fun b!1002049 () Bool)

(declare-fun e!564560 () Bool)

(assert (=> b!1002049 (= e!564564 e!564560)))

(declare-fun res!671535 () Bool)

(assert (=> b!1002049 (=> (not res!671535) (not e!564560))))

(declare-fun resX!38 () (_ BitVec 32))

(declare-fun lt!442980 () (_ BitVec 32))

(assert (=> b!1002049 (= res!671535 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!442980 #b00000000000000000000000000000000) (bvslt lt!442980 (size!30980 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1002049 (= lt!442980 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1002050 () Bool)

(declare-fun e!564565 () Bool)

(assert (=> b!1002050 (= e!564563 e!564565)))

(declare-fun res!671533 () Bool)

(assert (=> b!1002050 (=> (not res!671533) (not e!564565))))

(declare-fun lt!442985 () SeekEntryResult!9410)

(assert (=> b!1002050 (= res!671533 (or (= lt!442985 (MissingVacant!9410 i!1194)) (= lt!442985 (MissingZero!9410 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63305 (_ BitVec 32)) SeekEntryResult!9410)

(assert (=> b!1002050 (= lt!442985 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1002051 () Bool)

(declare-fun res!671529 () Bool)

(assert (=> b!1002051 (=> (not res!671529) (not e!564565))))

(declare-datatypes ((List!21154 0))(
  ( (Nil!21151) (Cons!21150 (h!22327 (_ BitVec 64)) (t!30155 List!21154)) )
))
(declare-fun arrayNoDuplicates!0 (array!63305 (_ BitVec 32) List!21154) Bool)

(assert (=> b!1002051 (= res!671529 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21151))))

(declare-fun b!1002052 () Bool)

(declare-fun res!671531 () Bool)

(assert (=> b!1002052 (=> (not res!671531) (not e!564565))))

(assert (=> b!1002052 (= res!671531 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30980 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30980 a!3219))))))

(declare-fun b!1002053 () Bool)

(declare-fun res!671536 () Bool)

(assert (=> b!1002053 (=> (not res!671536) (not e!564563))))

(assert (=> b!1002053 (= res!671536 (validKeyInArray!0 k!2224))))

(declare-fun b!1002054 () Bool)

(declare-fun e!564559 () Bool)

(assert (=> b!1002054 (= e!564559 e!564564)))

(declare-fun res!671532 () Bool)

(assert (=> b!1002054 (=> (not res!671532) (not e!564564))))

(declare-fun lt!442982 () SeekEntryResult!9410)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1002054 (= res!671532 (not (= lt!442982 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!442983 mask!3464) lt!442983 lt!442978 mask!3464))))))

(assert (=> b!1002054 (= lt!442983 (select (store (arr!30478 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1002054 (= lt!442978 (array!63306 (store (arr!30478 a!3219) i!1194 k!2224) (size!30980 a!3219)))))

(declare-fun res!671526 () Bool)

(assert (=> start!86504 (=> (not res!671526) (not e!564563))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86504 (= res!671526 (validMask!0 mask!3464))))

(assert (=> start!86504 e!564563))

(declare-fun array_inv!23602 (array!63305) Bool)

(assert (=> start!86504 (array_inv!23602 a!3219)))

(assert (=> start!86504 true))

(declare-fun b!1002055 () Bool)

(assert (=> b!1002055 (= e!564560 false)))

(declare-fun lt!442981 () SeekEntryResult!9410)

(assert (=> b!1002055 (= lt!442981 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!442980 lt!442983 lt!442978 mask!3464))))

(declare-fun b!1002056 () Bool)

(declare-fun e!564561 () Bool)

(assert (=> b!1002056 (= e!564561 e!564559)))

(declare-fun res!671538 () Bool)

(assert (=> b!1002056 (=> (not res!671538) (not e!564559))))

(declare-fun lt!442984 () SeekEntryResult!9410)

(assert (=> b!1002056 (= res!671538 (= lt!442979 lt!442984))))

(assert (=> b!1002056 (= lt!442979 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30478 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1002057 () Bool)

(declare-fun res!671527 () Bool)

(assert (=> b!1002057 (=> (not res!671527) (not e!564560))))

(assert (=> b!1002057 (= res!671527 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!442980 (select (arr!30478 a!3219) j!170) a!3219 mask!3464) lt!442984))))

(declare-fun b!1002058 () Bool)

(declare-fun res!671530 () Bool)

(assert (=> b!1002058 (=> (not res!671530) (not e!564565))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63305 (_ BitVec 32)) Bool)

(assert (=> b!1002058 (= res!671530 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1002059 () Bool)

(assert (=> b!1002059 (= e!564565 e!564561)))

(declare-fun res!671534 () Bool)

(assert (=> b!1002059 (=> (not res!671534) (not e!564561))))

(assert (=> b!1002059 (= res!671534 (= lt!442982 lt!442984))))

(assert (=> b!1002059 (= lt!442984 (Intermediate!9410 false resIndex!38 resX!38))))

(assert (=> b!1002059 (= lt!442982 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30478 a!3219) j!170) mask!3464) (select (arr!30478 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1002060 () Bool)

(declare-fun res!671523 () Bool)

(assert (=> b!1002060 (=> (not res!671523) (not e!564563))))

(assert (=> b!1002060 (= res!671523 (and (= (size!30980 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30980 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30980 a!3219)) (not (= i!1194 j!170))))))

(assert (= (and start!86504 res!671526) b!1002060))

(assert (= (and b!1002060 res!671523) b!1002048))

(assert (= (and b!1002048 res!671528) b!1002053))

(assert (= (and b!1002053 res!671536) b!1002045))

(assert (= (and b!1002045 res!671524) b!1002050))

(assert (= (and b!1002050 res!671533) b!1002058))

(assert (= (and b!1002058 res!671530) b!1002051))

(assert (= (and b!1002051 res!671529) b!1002052))

(assert (= (and b!1002052 res!671531) b!1002059))

(assert (= (and b!1002059 res!671534) b!1002056))

(assert (= (and b!1002056 res!671538) b!1002054))

(assert (= (and b!1002054 res!671532) b!1002047))

(assert (= (and b!1002047 res!671537) b!1002046))

(assert (= (and b!1002046 res!671525) b!1002049))

(assert (= (and b!1002049 res!671535) b!1002057))

(assert (= (and b!1002057 res!671527) b!1002055))

(declare-fun m!927989 () Bool)

(assert (=> b!1002047 m!927989))

(declare-fun m!927991 () Bool)

(assert (=> b!1002055 m!927991))

(declare-fun m!927993 () Bool)

(assert (=> b!1002053 m!927993))

(declare-fun m!927995 () Bool)

(assert (=> b!1002058 m!927995))

(declare-fun m!927997 () Bool)

(assert (=> b!1002051 m!927997))

(declare-fun m!927999 () Bool)

(assert (=> b!1002050 m!927999))

(declare-fun m!928001 () Bool)

(assert (=> b!1002049 m!928001))

(declare-fun m!928003 () Bool)

(assert (=> b!1002048 m!928003))

(assert (=> b!1002048 m!928003))

(declare-fun m!928005 () Bool)

(assert (=> b!1002048 m!928005))

(declare-fun m!928007 () Bool)

(assert (=> b!1002054 m!928007))

(assert (=> b!1002054 m!928007))

(declare-fun m!928009 () Bool)

(assert (=> b!1002054 m!928009))

(declare-fun m!928011 () Bool)

(assert (=> b!1002054 m!928011))

(declare-fun m!928013 () Bool)

(assert (=> b!1002054 m!928013))

(declare-fun m!928015 () Bool)

(assert (=> start!86504 m!928015))

(declare-fun m!928017 () Bool)

(assert (=> start!86504 m!928017))

(assert (=> b!1002057 m!928003))

(assert (=> b!1002057 m!928003))

(declare-fun m!928019 () Bool)

(assert (=> b!1002057 m!928019))

(declare-fun m!928021 () Bool)

(assert (=> b!1002045 m!928021))

(assert (=> b!1002056 m!928003))

(assert (=> b!1002056 m!928003))

(declare-fun m!928023 () Bool)

(assert (=> b!1002056 m!928023))

(assert (=> b!1002059 m!928003))

(assert (=> b!1002059 m!928003))

(declare-fun m!928025 () Bool)

(assert (=> b!1002059 m!928025))

(assert (=> b!1002059 m!928025))

(assert (=> b!1002059 m!928003))

(declare-fun m!928027 () Bool)

(assert (=> b!1002059 m!928027))

(push 1)

