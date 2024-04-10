; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86790 () Bool)

(assert start!86790)

(declare-fun res!675381 () Bool)

(declare-fun e!566440 () Bool)

(assert (=> start!86790 (=> (not res!675381) (not e!566440))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86790 (= res!675381 (validMask!0 mask!3464))))

(assert (=> start!86790 e!566440))

(declare-datatypes ((array!63489 0))(
  ( (array!63490 (arr!30567 (Array (_ BitVec 32) (_ BitVec 64))) (size!31069 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63489)

(declare-fun array_inv!23691 (array!63489) Bool)

(assert (=> start!86790 (array_inv!23691 a!3219)))

(assert (=> start!86790 true))

(declare-fun b!1006286 () Bool)

(declare-fun res!675379 () Bool)

(declare-fun e!566441 () Bool)

(assert (=> b!1006286 (=> (not res!675379) (not e!566441))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1006286 (= res!675379 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31069 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31069 a!3219))))))

(declare-fun b!1006287 () Bool)

(declare-fun res!675376 () Bool)

(assert (=> b!1006287 (=> (not res!675376) (not e!566441))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63489 (_ BitVec 32)) Bool)

(assert (=> b!1006287 (= res!675376 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1006288 () Bool)

(declare-fun res!675382 () Bool)

(assert (=> b!1006288 (=> (not res!675382) (not e!566440))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63489 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1006288 (= res!675382 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1006289 () Bool)

(declare-fun res!675377 () Bool)

(assert (=> b!1006289 (=> (not res!675377) (not e!566440))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1006289 (= res!675377 (validKeyInArray!0 k!2224))))

(declare-fun b!1006290 () Bool)

(declare-fun e!566442 () Bool)

(assert (=> b!1006290 (= e!566442 false)))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9499 0))(
  ( (MissingZero!9499 (index!40367 (_ BitVec 32))) (Found!9499 (index!40368 (_ BitVec 32))) (Intermediate!9499 (undefined!10311 Bool) (index!40369 (_ BitVec 32)) (x!87763 (_ BitVec 32))) (Undefined!9499) (MissingVacant!9499 (index!40370 (_ BitVec 32))) )
))
(declare-fun lt!444746 () SeekEntryResult!9499)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63489 (_ BitVec 32)) SeekEntryResult!9499)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1006290 (= lt!444746 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!30567 a!3219) i!1194 k!2224) j!170) mask!3464) (select (store (arr!30567 a!3219) i!1194 k!2224) j!170) (array!63490 (store (arr!30567 a!3219) i!1194 k!2224) (size!31069 a!3219)) mask!3464))))

(declare-fun b!1006291 () Bool)

(declare-fun res!675380 () Bool)

(assert (=> b!1006291 (=> (not res!675380) (not e!566440))))

(assert (=> b!1006291 (= res!675380 (and (= (size!31069 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31069 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31069 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1006292 () Bool)

(declare-fun res!675378 () Bool)

(assert (=> b!1006292 (=> (not res!675378) (not e!566441))))

(declare-datatypes ((List!21243 0))(
  ( (Nil!21240) (Cons!21239 (h!22422 (_ BitVec 64)) (t!30244 List!21243)) )
))
(declare-fun arrayNoDuplicates!0 (array!63489 (_ BitVec 32) List!21243) Bool)

(assert (=> b!1006292 (= res!675378 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21240))))

(declare-fun b!1006293 () Bool)

(declare-fun res!675384 () Bool)

(assert (=> b!1006293 (=> (not res!675384) (not e!566442))))

(declare-fun lt!444744 () SeekEntryResult!9499)

(assert (=> b!1006293 (= res!675384 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30567 a!3219) j!170) a!3219 mask!3464) lt!444744))))

(declare-fun b!1006294 () Bool)

(assert (=> b!1006294 (= e!566440 e!566441)))

(declare-fun res!675383 () Bool)

(assert (=> b!1006294 (=> (not res!675383) (not e!566441))))

(declare-fun lt!444745 () SeekEntryResult!9499)

(assert (=> b!1006294 (= res!675383 (or (= lt!444745 (MissingVacant!9499 i!1194)) (= lt!444745 (MissingZero!9499 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63489 (_ BitVec 32)) SeekEntryResult!9499)

(assert (=> b!1006294 (= lt!444745 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1006295 () Bool)

(assert (=> b!1006295 (= e!566441 e!566442)))

(declare-fun res!675375 () Bool)

(assert (=> b!1006295 (=> (not res!675375) (not e!566442))))

(assert (=> b!1006295 (= res!675375 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30567 a!3219) j!170) mask!3464) (select (arr!30567 a!3219) j!170) a!3219 mask!3464) lt!444744))))

(assert (=> b!1006295 (= lt!444744 (Intermediate!9499 false resIndex!38 resX!38))))

(declare-fun b!1006296 () Bool)

(declare-fun res!675374 () Bool)

(assert (=> b!1006296 (=> (not res!675374) (not e!566440))))

(assert (=> b!1006296 (= res!675374 (validKeyInArray!0 (select (arr!30567 a!3219) j!170)))))

(assert (= (and start!86790 res!675381) b!1006291))

(assert (= (and b!1006291 res!675380) b!1006296))

(assert (= (and b!1006296 res!675374) b!1006289))

(assert (= (and b!1006289 res!675377) b!1006288))

(assert (= (and b!1006288 res!675382) b!1006294))

(assert (= (and b!1006294 res!675383) b!1006287))

(assert (= (and b!1006287 res!675376) b!1006292))

(assert (= (and b!1006292 res!675378) b!1006286))

(assert (= (and b!1006286 res!675379) b!1006295))

(assert (= (and b!1006295 res!675375) b!1006293))

(assert (= (and b!1006293 res!675384) b!1006290))

(declare-fun m!931389 () Bool)

(assert (=> b!1006296 m!931389))

(assert (=> b!1006296 m!931389))

(declare-fun m!931391 () Bool)

(assert (=> b!1006296 m!931391))

(declare-fun m!931393 () Bool)

(assert (=> start!86790 m!931393))

(declare-fun m!931395 () Bool)

(assert (=> start!86790 m!931395))

(declare-fun m!931397 () Bool)

(assert (=> b!1006292 m!931397))

(declare-fun m!931399 () Bool)

(assert (=> b!1006290 m!931399))

(declare-fun m!931401 () Bool)

(assert (=> b!1006290 m!931401))

(assert (=> b!1006290 m!931401))

(declare-fun m!931403 () Bool)

(assert (=> b!1006290 m!931403))

(assert (=> b!1006290 m!931403))

(assert (=> b!1006290 m!931401))

(declare-fun m!931405 () Bool)

(assert (=> b!1006290 m!931405))

(declare-fun m!931407 () Bool)

(assert (=> b!1006287 m!931407))

(declare-fun m!931409 () Bool)

(assert (=> b!1006294 m!931409))

(assert (=> b!1006295 m!931389))

(assert (=> b!1006295 m!931389))

(declare-fun m!931411 () Bool)

(assert (=> b!1006295 m!931411))

(assert (=> b!1006295 m!931411))

(assert (=> b!1006295 m!931389))

(declare-fun m!931413 () Bool)

(assert (=> b!1006295 m!931413))

(assert (=> b!1006293 m!931389))

(assert (=> b!1006293 m!931389))

(declare-fun m!931415 () Bool)

(assert (=> b!1006293 m!931415))

(declare-fun m!931417 () Bool)

(assert (=> b!1006288 m!931417))

(declare-fun m!931419 () Bool)

(assert (=> b!1006289 m!931419))

(push 1)

(assert (not b!1006290))

(assert (not start!86790))

(assert (not b!1006293))

(assert (not b!1006289))

