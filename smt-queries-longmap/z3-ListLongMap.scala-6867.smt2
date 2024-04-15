; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86448 () Bool)

(assert start!86448)

(declare-fun b!1000750 () Bool)

(declare-fun res!670355 () Bool)

(declare-fun e!563951 () Bool)

(assert (=> b!1000750 (=> (not res!670355) (not e!563951))))

(declare-datatypes ((array!63196 0))(
  ( (array!63197 (arr!30423 (Array (_ BitVec 32) (_ BitVec 64))) (size!30927 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63196)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1000750 (= res!670355 (validKeyInArray!0 (select (arr!30423 a!3219) j!170)))))

(declare-fun b!1000751 () Bool)

(declare-fun e!563949 () Bool)

(declare-fun e!563953 () Bool)

(assert (=> b!1000751 (= e!563949 e!563953)))

(declare-fun res!670363 () Bool)

(assert (=> b!1000751 (=> (not res!670363) (not e!563953))))

(declare-datatypes ((SeekEntryResult!9380 0))(
  ( (MissingZero!9380 (index!39891 (_ BitVec 32))) (Found!9380 (index!39892 (_ BitVec 32))) (Intermediate!9380 (undefined!10192 Bool) (index!39893 (_ BitVec 32)) (x!87331 (_ BitVec 32))) (Undefined!9380) (MissingVacant!9380 (index!39894 (_ BitVec 32))) )
))
(declare-fun lt!442221 () SeekEntryResult!9380)

(declare-fun lt!442224 () SeekEntryResult!9380)

(assert (=> b!1000751 (= res!670363 (= lt!442221 lt!442224))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1000751 (= lt!442224 (Intermediate!9380 false resIndex!38 resX!38))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63196 (_ BitVec 32)) SeekEntryResult!9380)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1000751 (= lt!442221 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30423 a!3219) j!170) mask!3464) (select (arr!30423 a!3219) j!170) a!3219 mask!3464))))

(declare-fun res!670352 () Bool)

(assert (=> start!86448 (=> (not res!670352) (not e!563951))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86448 (= res!670352 (validMask!0 mask!3464))))

(assert (=> start!86448 e!563951))

(declare-fun array_inv!23566 (array!63196) Bool)

(assert (=> start!86448 (array_inv!23566 a!3219)))

(assert (=> start!86448 true))

(declare-fun b!1000752 () Bool)

(declare-fun res!670359 () Bool)

(assert (=> b!1000752 (=> (not res!670359) (not e!563949))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63196 (_ BitVec 32)) Bool)

(assert (=> b!1000752 (= res!670359 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1000753 () Bool)

(declare-fun e!563952 () Bool)

(assert (=> b!1000753 (= e!563953 e!563952)))

(declare-fun res!670362 () Bool)

(assert (=> b!1000753 (=> (not res!670362) (not e!563952))))

(declare-fun lt!442223 () SeekEntryResult!9380)

(assert (=> b!1000753 (= res!670362 (= lt!442223 lt!442224))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!1000753 (= lt!442223 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30423 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1000754 () Bool)

(assert (=> b!1000754 (= e!563951 e!563949)))

(declare-fun res!670361 () Bool)

(assert (=> b!1000754 (=> (not res!670361) (not e!563949))))

(declare-fun lt!442222 () SeekEntryResult!9380)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1000754 (= res!670361 (or (= lt!442222 (MissingVacant!9380 i!1194)) (= lt!442222 (MissingZero!9380 i!1194))))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63196 (_ BitVec 32)) SeekEntryResult!9380)

(assert (=> b!1000754 (= lt!442222 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1000755 () Bool)

(declare-fun res!670354 () Bool)

(assert (=> b!1000755 (=> (not res!670354) (not e!563949))))

(assert (=> b!1000755 (= res!670354 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30927 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30927 a!3219))))))

(declare-fun b!1000756 () Bool)

(declare-fun res!670364 () Bool)

(declare-fun e!563950 () Bool)

(assert (=> b!1000756 (=> (not res!670364) (not e!563950))))

(declare-fun lt!442225 () array!63196)

(declare-fun lt!442220 () (_ BitVec 64))

(assert (=> b!1000756 (= res!670364 (not (= lt!442223 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!442220 lt!442225 mask!3464))))))

(declare-fun b!1000757 () Bool)

(declare-fun res!670360 () Bool)

(assert (=> b!1000757 (=> (not res!670360) (not e!563951))))

(declare-fun arrayContainsKey!0 (array!63196 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1000757 (= res!670360 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1000758 () Bool)

(assert (=> b!1000758 (= e!563950 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194)) (bvslt mask!3464 #b00000000000000000000000000000000)))))

(declare-fun b!1000759 () Bool)

(declare-fun res!670358 () Bool)

(assert (=> b!1000759 (=> (not res!670358) (not e!563949))))

(declare-datatypes ((List!21165 0))(
  ( (Nil!21162) (Cons!21161 (h!22338 (_ BitVec 64)) (t!30157 List!21165)) )
))
(declare-fun arrayNoDuplicates!0 (array!63196 (_ BitVec 32) List!21165) Bool)

(assert (=> b!1000759 (= res!670358 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21162))))

(declare-fun b!1000760 () Bool)

(declare-fun res!670353 () Bool)

(assert (=> b!1000760 (=> (not res!670353) (not e!563951))))

(assert (=> b!1000760 (= res!670353 (and (= (size!30927 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30927 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30927 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1000761 () Bool)

(declare-fun res!670356 () Bool)

(assert (=> b!1000761 (=> (not res!670356) (not e!563951))))

(assert (=> b!1000761 (= res!670356 (validKeyInArray!0 k0!2224))))

(declare-fun b!1000762 () Bool)

(assert (=> b!1000762 (= e!563952 e!563950)))

(declare-fun res!670357 () Bool)

(assert (=> b!1000762 (=> (not res!670357) (not e!563950))))

(assert (=> b!1000762 (= res!670357 (not (= lt!442221 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!442220 mask!3464) lt!442220 lt!442225 mask!3464))))))

(assert (=> b!1000762 (= lt!442220 (select (store (arr!30423 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1000762 (= lt!442225 (array!63197 (store (arr!30423 a!3219) i!1194 k0!2224) (size!30927 a!3219)))))

(assert (= (and start!86448 res!670352) b!1000760))

(assert (= (and b!1000760 res!670353) b!1000750))

(assert (= (and b!1000750 res!670355) b!1000761))

(assert (= (and b!1000761 res!670356) b!1000757))

(assert (= (and b!1000757 res!670360) b!1000754))

(assert (= (and b!1000754 res!670361) b!1000752))

(assert (= (and b!1000752 res!670359) b!1000759))

(assert (= (and b!1000759 res!670358) b!1000755))

(assert (= (and b!1000755 res!670354) b!1000751))

(assert (= (and b!1000751 res!670363) b!1000753))

(assert (= (and b!1000753 res!670362) b!1000762))

(assert (= (and b!1000762 res!670357) b!1000756))

(assert (= (and b!1000756 res!670364) b!1000758))

(declare-fun m!926353 () Bool)

(assert (=> b!1000754 m!926353))

(declare-fun m!926355 () Bool)

(assert (=> b!1000751 m!926355))

(assert (=> b!1000751 m!926355))

(declare-fun m!926357 () Bool)

(assert (=> b!1000751 m!926357))

(assert (=> b!1000751 m!926357))

(assert (=> b!1000751 m!926355))

(declare-fun m!926359 () Bool)

(assert (=> b!1000751 m!926359))

(declare-fun m!926361 () Bool)

(assert (=> b!1000757 m!926361))

(declare-fun m!926363 () Bool)

(assert (=> b!1000756 m!926363))

(declare-fun m!926365 () Bool)

(assert (=> start!86448 m!926365))

(declare-fun m!926367 () Bool)

(assert (=> start!86448 m!926367))

(declare-fun m!926369 () Bool)

(assert (=> b!1000752 m!926369))

(declare-fun m!926371 () Bool)

(assert (=> b!1000762 m!926371))

(assert (=> b!1000762 m!926371))

(declare-fun m!926373 () Bool)

(assert (=> b!1000762 m!926373))

(declare-fun m!926375 () Bool)

(assert (=> b!1000762 m!926375))

(declare-fun m!926377 () Bool)

(assert (=> b!1000762 m!926377))

(assert (=> b!1000753 m!926355))

(assert (=> b!1000753 m!926355))

(declare-fun m!926379 () Bool)

(assert (=> b!1000753 m!926379))

(declare-fun m!926381 () Bool)

(assert (=> b!1000759 m!926381))

(declare-fun m!926383 () Bool)

(assert (=> b!1000761 m!926383))

(assert (=> b!1000750 m!926355))

(assert (=> b!1000750 m!926355))

(declare-fun m!926385 () Bool)

(assert (=> b!1000750 m!926385))

(check-sat (not b!1000761) (not start!86448) (not b!1000762) (not b!1000750) (not b!1000751) (not b!1000753) (not b!1000756) (not b!1000754) (not b!1000752) (not b!1000757) (not b!1000759))
(check-sat)
