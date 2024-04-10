; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86792 () Bool)

(assert start!86792)

(declare-fun b!1006319 () Bool)

(declare-fun res!675413 () Bool)

(declare-fun e!566452 () Bool)

(assert (=> b!1006319 (=> (not res!675413) (not e!566452))))

(declare-datatypes ((array!63491 0))(
  ( (array!63492 (arr!30568 (Array (_ BitVec 32) (_ BitVec 64))) (size!31070 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63491)

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63491 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1006319 (= res!675413 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1006320 () Bool)

(declare-fun res!675408 () Bool)

(assert (=> b!1006320 (=> (not res!675408) (not e!566452))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1006320 (= res!675408 (and (= (size!31070 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31070 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31070 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1006321 () Bool)

(declare-fun e!566453 () Bool)

(assert (=> b!1006321 (= e!566453 false)))

(declare-datatypes ((SeekEntryResult!9500 0))(
  ( (MissingZero!9500 (index!40371 (_ BitVec 32))) (Found!9500 (index!40372 (_ BitVec 32))) (Intermediate!9500 (undefined!10312 Bool) (index!40373 (_ BitVec 32)) (x!87772 (_ BitVec 32))) (Undefined!9500) (MissingVacant!9500 (index!40374 (_ BitVec 32))) )
))
(declare-fun lt!444754 () SeekEntryResult!9500)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63491 (_ BitVec 32)) SeekEntryResult!9500)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1006321 (= lt!444754 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!30568 a!3219) i!1194 k!2224) j!170) mask!3464) (select (store (arr!30568 a!3219) i!1194 k!2224) j!170) (array!63492 (store (arr!30568 a!3219) i!1194 k!2224) (size!31070 a!3219)) mask!3464))))

(declare-fun b!1006322 () Bool)

(declare-fun res!675410 () Bool)

(declare-fun e!566455 () Bool)

(assert (=> b!1006322 (=> (not res!675410) (not e!566455))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1006322 (= res!675410 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31070 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31070 a!3219))))))

(declare-fun b!1006323 () Bool)

(declare-fun res!675415 () Bool)

(assert (=> b!1006323 (=> (not res!675415) (not e!566453))))

(declare-fun lt!444755 () SeekEntryResult!9500)

(assert (=> b!1006323 (= res!675415 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30568 a!3219) j!170) a!3219 mask!3464) lt!444755))))

(declare-fun b!1006324 () Bool)

(declare-fun res!675412 () Bool)

(assert (=> b!1006324 (=> (not res!675412) (not e!566455))))

(declare-datatypes ((List!21244 0))(
  ( (Nil!21241) (Cons!21240 (h!22423 (_ BitVec 64)) (t!30245 List!21244)) )
))
(declare-fun arrayNoDuplicates!0 (array!63491 (_ BitVec 32) List!21244) Bool)

(assert (=> b!1006324 (= res!675412 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21241))))

(declare-fun b!1006325 () Bool)

(assert (=> b!1006325 (= e!566452 e!566455)))

(declare-fun res!675417 () Bool)

(assert (=> b!1006325 (=> (not res!675417) (not e!566455))))

(declare-fun lt!444753 () SeekEntryResult!9500)

(assert (=> b!1006325 (= res!675417 (or (= lt!444753 (MissingVacant!9500 i!1194)) (= lt!444753 (MissingZero!9500 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63491 (_ BitVec 32)) SeekEntryResult!9500)

(assert (=> b!1006325 (= lt!444753 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1006326 () Bool)

(declare-fun res!675411 () Bool)

(assert (=> b!1006326 (=> (not res!675411) (not e!566452))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1006326 (= res!675411 (validKeyInArray!0 k!2224))))

(declare-fun b!1006327 () Bool)

(declare-fun res!675409 () Bool)

(assert (=> b!1006327 (=> (not res!675409) (not e!566452))))

(assert (=> b!1006327 (= res!675409 (validKeyInArray!0 (select (arr!30568 a!3219) j!170)))))

(declare-fun b!1006328 () Bool)

(declare-fun res!675416 () Bool)

(assert (=> b!1006328 (=> (not res!675416) (not e!566455))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63491 (_ BitVec 32)) Bool)

(assert (=> b!1006328 (= res!675416 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun res!675414 () Bool)

(assert (=> start!86792 (=> (not res!675414) (not e!566452))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86792 (= res!675414 (validMask!0 mask!3464))))

(assert (=> start!86792 e!566452))

(declare-fun array_inv!23692 (array!63491) Bool)

(assert (=> start!86792 (array_inv!23692 a!3219)))

(assert (=> start!86792 true))

(declare-fun b!1006329 () Bool)

(assert (=> b!1006329 (= e!566455 e!566453)))

(declare-fun res!675407 () Bool)

(assert (=> b!1006329 (=> (not res!675407) (not e!566453))))

(assert (=> b!1006329 (= res!675407 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30568 a!3219) j!170) mask!3464) (select (arr!30568 a!3219) j!170) a!3219 mask!3464) lt!444755))))

(assert (=> b!1006329 (= lt!444755 (Intermediate!9500 false resIndex!38 resX!38))))

(assert (= (and start!86792 res!675414) b!1006320))

(assert (= (and b!1006320 res!675408) b!1006327))

(assert (= (and b!1006327 res!675409) b!1006326))

(assert (= (and b!1006326 res!675411) b!1006319))

(assert (= (and b!1006319 res!675413) b!1006325))

(assert (= (and b!1006325 res!675417) b!1006328))

(assert (= (and b!1006328 res!675416) b!1006324))

(assert (= (and b!1006324 res!675412) b!1006322))

(assert (= (and b!1006322 res!675410) b!1006329))

(assert (= (and b!1006329 res!675407) b!1006323))

(assert (= (and b!1006323 res!675415) b!1006321))

(declare-fun m!931421 () Bool)

(assert (=> b!1006321 m!931421))

(declare-fun m!931423 () Bool)

(assert (=> b!1006321 m!931423))

(assert (=> b!1006321 m!931423))

(declare-fun m!931425 () Bool)

(assert (=> b!1006321 m!931425))

(assert (=> b!1006321 m!931425))

(assert (=> b!1006321 m!931423))

(declare-fun m!931427 () Bool)

(assert (=> b!1006321 m!931427))

(declare-fun m!931429 () Bool)

(assert (=> b!1006327 m!931429))

(assert (=> b!1006327 m!931429))

(declare-fun m!931431 () Bool)

(assert (=> b!1006327 m!931431))

(declare-fun m!931433 () Bool)

(assert (=> b!1006328 m!931433))

(declare-fun m!931435 () Bool)

(assert (=> b!1006324 m!931435))

(declare-fun m!931437 () Bool)

(assert (=> b!1006325 m!931437))

(declare-fun m!931439 () Bool)

(assert (=> start!86792 m!931439))

(declare-fun m!931441 () Bool)

(assert (=> start!86792 m!931441))

(assert (=> b!1006323 m!931429))

(assert (=> b!1006323 m!931429))

(declare-fun m!931443 () Bool)

(assert (=> b!1006323 m!931443))

(declare-fun m!931445 () Bool)

(assert (=> b!1006319 m!931445))

(assert (=> b!1006329 m!931429))

(assert (=> b!1006329 m!931429))

(declare-fun m!931447 () Bool)

(assert (=> b!1006329 m!931447))

(assert (=> b!1006329 m!931447))

(assert (=> b!1006329 m!931429))

(declare-fun m!931449 () Bool)

(assert (=> b!1006329 m!931449))

(declare-fun m!931451 () Bool)

(assert (=> b!1006326 m!931451))

(push 1)

