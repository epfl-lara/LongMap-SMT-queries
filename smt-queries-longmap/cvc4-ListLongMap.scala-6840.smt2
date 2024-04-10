; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86136 () Bool)

(assert start!86136)

(declare-fun b!997512 () Bool)

(declare-fun res!667467 () Bool)

(declare-fun e!562635 () Bool)

(assert (=> b!997512 (=> (not res!667467) (not e!562635))))

(declare-datatypes ((array!63090 0))(
  ( (array!63091 (arr!30375 (Array (_ BitVec 32) (_ BitVec 64))) (size!30877 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63090)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63090 (_ BitVec 32)) Bool)

(assert (=> b!997512 (= res!667467 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!997513 () Bool)

(declare-fun e!562636 () Bool)

(assert (=> b!997513 (= e!562636 e!562635)))

(declare-fun res!667473 () Bool)

(assert (=> b!997513 (=> (not res!667473) (not e!562635))))

(declare-datatypes ((SeekEntryResult!9307 0))(
  ( (MissingZero!9307 (index!39599 (_ BitVec 32))) (Found!9307 (index!39600 (_ BitVec 32))) (Intermediate!9307 (undefined!10119 Bool) (index!39601 (_ BitVec 32)) (x!87029 (_ BitVec 32))) (Undefined!9307) (MissingVacant!9307 (index!39602 (_ BitVec 32))) )
))
(declare-fun lt!441470 () SeekEntryResult!9307)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!997513 (= res!667473 (or (= lt!441470 (MissingVacant!9307 i!1194)) (= lt!441470 (MissingZero!9307 i!1194))))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63090 (_ BitVec 32)) SeekEntryResult!9307)

(assert (=> b!997513 (= lt!441470 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun res!667475 () Bool)

(assert (=> start!86136 (=> (not res!667475) (not e!562636))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86136 (= res!667475 (validMask!0 mask!3464))))

(assert (=> start!86136 e!562636))

(declare-fun array_inv!23499 (array!63090) Bool)

(assert (=> start!86136 (array_inv!23499 a!3219)))

(assert (=> start!86136 true))

(declare-fun b!997514 () Bool)

(declare-fun res!667472 () Bool)

(assert (=> b!997514 (=> (not res!667472) (not e!562636))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!997514 (= res!667472 (validKeyInArray!0 k!2224))))

(declare-fun b!997515 () Bool)

(declare-fun res!667471 () Bool)

(assert (=> b!997515 (=> (not res!667471) (not e!562635))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(assert (=> b!997515 (= res!667471 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30877 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30877 a!3219))))))

(declare-fun b!997516 () Bool)

(assert (=> b!997516 (= e!562635 false)))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun lt!441469 () SeekEntryResult!9307)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63090 (_ BitVec 32)) SeekEntryResult!9307)

(assert (=> b!997516 (= lt!441469 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30375 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!997517 () Bool)

(declare-fun res!667470 () Bool)

(assert (=> b!997517 (=> (not res!667470) (not e!562636))))

(assert (=> b!997517 (= res!667470 (and (= (size!30877 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30877 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30877 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!997518 () Bool)

(declare-fun res!667476 () Bool)

(assert (=> b!997518 (=> (not res!667476) (not e!562636))))

(assert (=> b!997518 (= res!667476 (validKeyInArray!0 (select (arr!30375 a!3219) j!170)))))

(declare-fun b!997519 () Bool)

(declare-fun res!667468 () Bool)

(assert (=> b!997519 (=> (not res!667468) (not e!562635))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!997519 (= res!667468 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30375 a!3219) j!170) mask!3464) (select (arr!30375 a!3219) j!170) a!3219 mask!3464) (Intermediate!9307 false resIndex!38 resX!38)))))

(declare-fun b!997520 () Bool)

(declare-fun res!667474 () Bool)

(assert (=> b!997520 (=> (not res!667474) (not e!562636))))

(declare-fun arrayContainsKey!0 (array!63090 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!997520 (= res!667474 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!997521 () Bool)

(declare-fun res!667469 () Bool)

(assert (=> b!997521 (=> (not res!667469) (not e!562635))))

(declare-datatypes ((List!21051 0))(
  ( (Nil!21048) (Cons!21047 (h!22215 (_ BitVec 64)) (t!30052 List!21051)) )
))
(declare-fun arrayNoDuplicates!0 (array!63090 (_ BitVec 32) List!21051) Bool)

(assert (=> b!997521 (= res!667469 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21048))))

(assert (= (and start!86136 res!667475) b!997517))

(assert (= (and b!997517 res!667470) b!997518))

(assert (= (and b!997518 res!667476) b!997514))

(assert (= (and b!997514 res!667472) b!997520))

(assert (= (and b!997520 res!667474) b!997513))

(assert (= (and b!997513 res!667473) b!997512))

(assert (= (and b!997512 res!667467) b!997521))

(assert (= (and b!997521 res!667469) b!997515))

(assert (= (and b!997515 res!667471) b!997519))

(assert (= (and b!997519 res!667468) b!997516))

(declare-fun m!924317 () Bool)

(assert (=> start!86136 m!924317))

(declare-fun m!924319 () Bool)

(assert (=> start!86136 m!924319))

(declare-fun m!924321 () Bool)

(assert (=> b!997520 m!924321))

(declare-fun m!924323 () Bool)

(assert (=> b!997513 m!924323))

(declare-fun m!924325 () Bool)

(assert (=> b!997516 m!924325))

(assert (=> b!997516 m!924325))

(declare-fun m!924327 () Bool)

(assert (=> b!997516 m!924327))

(declare-fun m!924329 () Bool)

(assert (=> b!997512 m!924329))

(assert (=> b!997519 m!924325))

(assert (=> b!997519 m!924325))

(declare-fun m!924331 () Bool)

(assert (=> b!997519 m!924331))

(assert (=> b!997519 m!924331))

(assert (=> b!997519 m!924325))

(declare-fun m!924333 () Bool)

(assert (=> b!997519 m!924333))

(declare-fun m!924335 () Bool)

(assert (=> b!997514 m!924335))

(assert (=> b!997518 m!924325))

(assert (=> b!997518 m!924325))

(declare-fun m!924337 () Bool)

(assert (=> b!997518 m!924337))

(declare-fun m!924339 () Bool)

(assert (=> b!997521 m!924339))

(push 1)

(assert (not b!997513))

(assert (not b!997516))

(assert (not b!997520))

(assert (not b!997512))

(assert (not b!997521))

(assert (not b!997518))

(assert (not start!86136))

(assert (not b!997519))

(assert (not b!997514))

(check-sat)

