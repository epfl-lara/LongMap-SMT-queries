; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86922 () Bool)

(assert start!86922)

(declare-fun b!1008087 () Bool)

(declare-fun e!567229 () Bool)

(assert (=> b!1008087 (= e!567229 false)))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun lt!445403 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1008087 (= lt!445403 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1008088 () Bool)

(declare-fun res!677106 () Bool)

(declare-fun e!567226 () Bool)

(assert (=> b!1008088 (=> (not res!677106) (not e!567226))))

(declare-datatypes ((array!63517 0))(
  ( (array!63518 (arr!30579 (Array (_ BitVec 32) (_ BitVec 64))) (size!31083 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63517)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1008088 (= res!677106 (validKeyInArray!0 (select (arr!30579 a!3219) j!170)))))

(declare-fun b!1008089 () Bool)

(declare-fun res!677117 () Bool)

(assert (=> b!1008089 (=> (not res!677117) (not e!567226))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63517 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1008089 (= res!677117 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1008090 () Bool)

(declare-fun res!677116 () Bool)

(assert (=> b!1008090 (=> (not res!677116) (not e!567226))))

(assert (=> b!1008090 (= res!677116 (validKeyInArray!0 k0!2224))))

(declare-fun res!677107 () Bool)

(assert (=> start!86922 (=> (not res!677107) (not e!567226))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86922 (= res!677107 (validMask!0 mask!3464))))

(assert (=> start!86922 e!567226))

(declare-fun array_inv!23722 (array!63517) Bool)

(assert (=> start!86922 (array_inv!23722 a!3219)))

(assert (=> start!86922 true))

(declare-fun b!1008091 () Bool)

(declare-fun e!567225 () Bool)

(declare-fun e!567227 () Bool)

(assert (=> b!1008091 (= e!567225 e!567227)))

(declare-fun res!677115 () Bool)

(assert (=> b!1008091 (=> (not res!677115) (not e!567227))))

(declare-datatypes ((SeekEntryResult!9536 0))(
  ( (MissingZero!9536 (index!40515 (_ BitVec 32))) (Found!9536 (index!40516 (_ BitVec 32))) (Intermediate!9536 (undefined!10348 Bool) (index!40517 (_ BitVec 32)) (x!87921 (_ BitVec 32))) (Undefined!9536) (MissingVacant!9536 (index!40518 (_ BitVec 32))) )
))
(declare-fun lt!445399 () SeekEntryResult!9536)

(declare-fun lt!445405 () SeekEntryResult!9536)

(assert (=> b!1008091 (= res!677115 (= lt!445399 lt!445405))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1008091 (= lt!445405 (Intermediate!9536 false resIndex!38 resX!38))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63517 (_ BitVec 32)) SeekEntryResult!9536)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1008091 (= lt!445399 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30579 a!3219) j!170) mask!3464) (select (arr!30579 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1008092 () Bool)

(declare-fun res!677104 () Bool)

(assert (=> b!1008092 (=> (not res!677104) (not e!567226))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1008092 (= res!677104 (and (= (size!31083 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31083 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31083 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1008093 () Bool)

(declare-fun res!677112 () Bool)

(assert (=> b!1008093 (=> (not res!677112) (not e!567229))))

(assert (=> b!1008093 (= res!677112 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1008094 () Bool)

(declare-fun res!677105 () Bool)

(assert (=> b!1008094 (=> (not res!677105) (not e!567229))))

(declare-fun lt!445404 () array!63517)

(declare-fun lt!445401 () (_ BitVec 64))

(declare-fun lt!445400 () SeekEntryResult!9536)

(assert (=> b!1008094 (= res!677105 (not (= lt!445400 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!445401 lt!445404 mask!3464))))))

(declare-fun b!1008095 () Bool)

(declare-fun res!677114 () Bool)

(assert (=> b!1008095 (=> (not res!677114) (not e!567225))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63517 (_ BitVec 32)) Bool)

(assert (=> b!1008095 (= res!677114 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1008096 () Bool)

(declare-fun res!677113 () Bool)

(assert (=> b!1008096 (=> (not res!677113) (not e!567225))))

(declare-datatypes ((List!21321 0))(
  ( (Nil!21318) (Cons!21317 (h!22503 (_ BitVec 64)) (t!30313 List!21321)) )
))
(declare-fun arrayNoDuplicates!0 (array!63517 (_ BitVec 32) List!21321) Bool)

(assert (=> b!1008096 (= res!677113 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21318))))

(declare-fun b!1008097 () Bool)

(declare-fun e!567230 () Bool)

(assert (=> b!1008097 (= e!567230 e!567229)))

(declare-fun res!677108 () Bool)

(assert (=> b!1008097 (=> (not res!677108) (not e!567229))))

(assert (=> b!1008097 (= res!677108 (not (= lt!445399 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!445401 mask!3464) lt!445401 lt!445404 mask!3464))))))

(assert (=> b!1008097 (= lt!445401 (select (store (arr!30579 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1008097 (= lt!445404 (array!63518 (store (arr!30579 a!3219) i!1194 k0!2224) (size!31083 a!3219)))))

(declare-fun b!1008098 () Bool)

(declare-fun res!677110 () Bool)

(assert (=> b!1008098 (=> (not res!677110) (not e!567225))))

(assert (=> b!1008098 (= res!677110 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31083 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31083 a!3219))))))

(declare-fun b!1008099 () Bool)

(assert (=> b!1008099 (= e!567227 e!567230)))

(declare-fun res!677111 () Bool)

(assert (=> b!1008099 (=> (not res!677111) (not e!567230))))

(assert (=> b!1008099 (= res!677111 (= lt!445400 lt!445405))))

(assert (=> b!1008099 (= lt!445400 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30579 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1008100 () Bool)

(assert (=> b!1008100 (= e!567226 e!567225)))

(declare-fun res!677109 () Bool)

(assert (=> b!1008100 (=> (not res!677109) (not e!567225))))

(declare-fun lt!445402 () SeekEntryResult!9536)

(assert (=> b!1008100 (= res!677109 (or (= lt!445402 (MissingVacant!9536 i!1194)) (= lt!445402 (MissingZero!9536 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63517 (_ BitVec 32)) SeekEntryResult!9536)

(assert (=> b!1008100 (= lt!445402 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(assert (= (and start!86922 res!677107) b!1008092))

(assert (= (and b!1008092 res!677104) b!1008088))

(assert (= (and b!1008088 res!677106) b!1008090))

(assert (= (and b!1008090 res!677116) b!1008089))

(assert (= (and b!1008089 res!677117) b!1008100))

(assert (= (and b!1008100 res!677109) b!1008095))

(assert (= (and b!1008095 res!677114) b!1008096))

(assert (= (and b!1008096 res!677113) b!1008098))

(assert (= (and b!1008098 res!677110) b!1008091))

(assert (= (and b!1008091 res!677115) b!1008099))

(assert (= (and b!1008099 res!677111) b!1008097))

(assert (= (and b!1008097 res!677108) b!1008094))

(assert (= (and b!1008094 res!677105) b!1008093))

(assert (= (and b!1008093 res!677112) b!1008087))

(declare-fun m!932341 () Bool)

(assert (=> b!1008088 m!932341))

(assert (=> b!1008088 m!932341))

(declare-fun m!932343 () Bool)

(assert (=> b!1008088 m!932343))

(declare-fun m!932345 () Bool)

(assert (=> b!1008094 m!932345))

(declare-fun m!932347 () Bool)

(assert (=> start!86922 m!932347))

(declare-fun m!932349 () Bool)

(assert (=> start!86922 m!932349))

(declare-fun m!932351 () Bool)

(assert (=> b!1008097 m!932351))

(assert (=> b!1008097 m!932351))

(declare-fun m!932353 () Bool)

(assert (=> b!1008097 m!932353))

(declare-fun m!932355 () Bool)

(assert (=> b!1008097 m!932355))

(declare-fun m!932357 () Bool)

(assert (=> b!1008097 m!932357))

(declare-fun m!932359 () Bool)

(assert (=> b!1008090 m!932359))

(declare-fun m!932361 () Bool)

(assert (=> b!1008100 m!932361))

(declare-fun m!932363 () Bool)

(assert (=> b!1008087 m!932363))

(declare-fun m!932365 () Bool)

(assert (=> b!1008089 m!932365))

(assert (=> b!1008099 m!932341))

(assert (=> b!1008099 m!932341))

(declare-fun m!932367 () Bool)

(assert (=> b!1008099 m!932367))

(declare-fun m!932369 () Bool)

(assert (=> b!1008096 m!932369))

(assert (=> b!1008091 m!932341))

(assert (=> b!1008091 m!932341))

(declare-fun m!932371 () Bool)

(assert (=> b!1008091 m!932371))

(assert (=> b!1008091 m!932371))

(assert (=> b!1008091 m!932341))

(declare-fun m!932373 () Bool)

(assert (=> b!1008091 m!932373))

(declare-fun m!932375 () Bool)

(assert (=> b!1008095 m!932375))

(check-sat (not b!1008091) (not b!1008087) (not start!86922) (not b!1008100) (not b!1008088) (not b!1008090) (not b!1008089) (not b!1008094) (not b!1008096) (not b!1008095) (not b!1008097) (not b!1008099))
(check-sat)
