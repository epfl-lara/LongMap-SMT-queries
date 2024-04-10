; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86138 () Bool)

(assert start!86138)

(declare-fun b!997544 () Bool)

(declare-fun e!562648 () Bool)

(declare-fun mask!3464 () (_ BitVec 32))

(assert (=> b!997544 (= e!562648 (bvslt mask!3464 #b00000000000000000000000000000000))))

(declare-fun b!997545 () Bool)

(declare-fun res!667503 () Bool)

(declare-fun e!562647 () Bool)

(assert (=> b!997545 (=> (not res!667503) (not e!562647))))

(declare-datatypes ((array!63092 0))(
  ( (array!63093 (arr!30376 (Array (_ BitVec 32) (_ BitVec 64))) (size!30878 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63092)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63092 (_ BitVec 32)) Bool)

(assert (=> b!997545 (= res!667503 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!997546 () Bool)

(declare-fun e!562646 () Bool)

(assert (=> b!997546 (= e!562646 e!562647)))

(declare-fun res!667499 () Bool)

(assert (=> b!997546 (=> (not res!667499) (not e!562647))))

(declare-datatypes ((SeekEntryResult!9308 0))(
  ( (MissingZero!9308 (index!39603 (_ BitVec 32))) (Found!9308 (index!39604 (_ BitVec 32))) (Intermediate!9308 (undefined!10120 Bool) (index!39605 (_ BitVec 32)) (x!87038 (_ BitVec 32))) (Undefined!9308) (MissingVacant!9308 (index!39606 (_ BitVec 32))) )
))
(declare-fun lt!441475 () SeekEntryResult!9308)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!997546 (= res!667499 (or (= lt!441475 (MissingVacant!9308 i!1194)) (= lt!441475 (MissingZero!9308 i!1194))))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63092 (_ BitVec 32)) SeekEntryResult!9308)

(assert (=> b!997546 (= lt!441475 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!997547 () Bool)

(declare-fun res!667505 () Bool)

(assert (=> b!997547 (=> (not res!667505) (not e!562647))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!997547 (= res!667505 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30878 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30878 a!3219))))))

(declare-fun b!997548 () Bool)

(declare-fun res!667500 () Bool)

(assert (=> b!997548 (=> (not res!667500) (not e!562646))))

(declare-fun arrayContainsKey!0 (array!63092 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!997548 (= res!667500 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!997549 () Bool)

(assert (=> b!997549 (= e!562647 e!562648)))

(declare-fun res!667507 () Bool)

(assert (=> b!997549 (=> (not res!667507) (not e!562648))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun lt!441476 () SeekEntryResult!9308)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63092 (_ BitVec 32)) SeekEntryResult!9308)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!997549 (= res!667507 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30376 a!3219) j!170) mask!3464) (select (arr!30376 a!3219) j!170) a!3219 mask!3464) lt!441476))))

(assert (=> b!997549 (= lt!441476 (Intermediate!9308 false resIndex!38 resX!38))))

(declare-fun b!997550 () Bool)

(declare-fun res!667504 () Bool)

(assert (=> b!997550 (=> (not res!667504) (not e!562648))))

(assert (=> b!997550 (= res!667504 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30376 a!3219) j!170) a!3219 mask!3464) lt!441476))))

(declare-fun b!997551 () Bool)

(declare-fun res!667506 () Bool)

(assert (=> b!997551 (=> (not res!667506) (not e!562647))))

(declare-datatypes ((List!21052 0))(
  ( (Nil!21049) (Cons!21048 (h!22216 (_ BitVec 64)) (t!30053 List!21052)) )
))
(declare-fun arrayNoDuplicates!0 (array!63092 (_ BitVec 32) List!21052) Bool)

(assert (=> b!997551 (= res!667506 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21049))))

(declare-fun res!667502 () Bool)

(assert (=> start!86138 (=> (not res!667502) (not e!562646))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86138 (= res!667502 (validMask!0 mask!3464))))

(assert (=> start!86138 e!562646))

(declare-fun array_inv!23500 (array!63092) Bool)

(assert (=> start!86138 (array_inv!23500 a!3219)))

(assert (=> start!86138 true))

(declare-fun b!997552 () Bool)

(declare-fun res!667509 () Bool)

(assert (=> b!997552 (=> (not res!667509) (not e!562646))))

(assert (=> b!997552 (= res!667509 (and (= (size!30878 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30878 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30878 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!997553 () Bool)

(declare-fun res!667508 () Bool)

(assert (=> b!997553 (=> (not res!667508) (not e!562646))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!997553 (= res!667508 (validKeyInArray!0 k!2224))))

(declare-fun b!997554 () Bool)

(declare-fun res!667501 () Bool)

(assert (=> b!997554 (=> (not res!667501) (not e!562646))))

(assert (=> b!997554 (= res!667501 (validKeyInArray!0 (select (arr!30376 a!3219) j!170)))))

(assert (= (and start!86138 res!667502) b!997552))

(assert (= (and b!997552 res!667509) b!997554))

(assert (= (and b!997554 res!667501) b!997553))

(assert (= (and b!997553 res!667508) b!997548))

(assert (= (and b!997548 res!667500) b!997546))

(assert (= (and b!997546 res!667499) b!997545))

(assert (= (and b!997545 res!667503) b!997551))

(assert (= (and b!997551 res!667506) b!997547))

(assert (= (and b!997547 res!667505) b!997549))

(assert (= (and b!997549 res!667507) b!997550))

(assert (= (and b!997550 res!667504) b!997544))

(declare-fun m!924341 () Bool)

(assert (=> b!997548 m!924341))

(declare-fun m!924343 () Bool)

(assert (=> b!997546 m!924343))

(declare-fun m!924345 () Bool)

(assert (=> b!997545 m!924345))

(declare-fun m!924347 () Bool)

(assert (=> b!997550 m!924347))

(assert (=> b!997550 m!924347))

(declare-fun m!924349 () Bool)

(assert (=> b!997550 m!924349))

(assert (=> b!997549 m!924347))

(assert (=> b!997549 m!924347))

(declare-fun m!924351 () Bool)

(assert (=> b!997549 m!924351))

(assert (=> b!997549 m!924351))

(assert (=> b!997549 m!924347))

(declare-fun m!924353 () Bool)

(assert (=> b!997549 m!924353))

(assert (=> b!997554 m!924347))

(assert (=> b!997554 m!924347))

(declare-fun m!924355 () Bool)

(assert (=> b!997554 m!924355))

(declare-fun m!924357 () Bool)

(assert (=> b!997553 m!924357))

(declare-fun m!924359 () Bool)

(assert (=> start!86138 m!924359))

(declare-fun m!924361 () Bool)

(assert (=> start!86138 m!924361))

(declare-fun m!924363 () Bool)

(assert (=> b!997551 m!924363))

(push 1)

