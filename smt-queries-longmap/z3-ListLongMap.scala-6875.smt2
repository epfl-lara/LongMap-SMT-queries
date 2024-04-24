; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86734 () Bool)

(assert start!86734)

(declare-fun b!1003291 () Bool)

(declare-fun e!565367 () Bool)

(declare-fun e!565368 () Bool)

(assert (=> b!1003291 (= e!565367 e!565368)))

(declare-fun res!672008 () Bool)

(assert (=> b!1003291 (=> (not res!672008) (not e!565368))))

(declare-datatypes ((SeekEntryResult!9364 0))(
  ( (MissingZero!9364 (index!39827 (_ BitVec 32))) (Found!9364 (index!39828 (_ BitVec 32))) (Intermediate!9364 (undefined!10176 Bool) (index!39829 (_ BitVec 32)) (x!87404 (_ BitVec 32))) (Undefined!9364) (MissingVacant!9364 (index!39830 (_ BitVec 32))) )
))
(declare-fun lt!443465 () SeekEntryResult!9364)

(declare-fun lt!443464 () SeekEntryResult!9364)

(assert (=> b!1003291 (= res!672008 (= lt!443465 lt!443464))))

(declare-datatypes ((array!63354 0))(
  ( (array!63355 (arr!30496 (Array (_ BitVec 32) (_ BitVec 64))) (size!30999 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63354)

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63354 (_ BitVec 32)) SeekEntryResult!9364)

(assert (=> b!1003291 (= lt!443465 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30496 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1003292 () Bool)

(declare-fun res!672009 () Bool)

(declare-fun e!565366 () Bool)

(assert (=> b!1003292 (=> (not res!672009) (not e!565366))))

(declare-fun lt!443460 () array!63354)

(declare-fun lt!443463 () (_ BitVec 64))

(assert (=> b!1003292 (= res!672009 (not (= lt!443465 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!443463 lt!443460 mask!3464))))))

(declare-fun b!1003293 () Bool)

(declare-fun res!672021 () Bool)

(declare-fun e!565362 () Bool)

(assert (=> b!1003293 (=> (not res!672021) (not e!565362))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63354 (_ BitVec 32)) Bool)

(assert (=> b!1003293 (= res!672021 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1003294 () Bool)

(declare-fun res!672010 () Bool)

(assert (=> b!1003294 (=> (not res!672010) (not e!565362))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1003294 (= res!672010 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30999 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30999 a!3219))))))

(declare-fun b!1003295 () Bool)

(declare-fun res!672012 () Bool)

(declare-fun e!565363 () Bool)

(assert (=> b!1003295 (=> (not res!672012) (not e!565363))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1003295 (= res!672012 (and (= (size!30999 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30999 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30999 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1003296 () Bool)

(declare-fun res!672011 () Bool)

(assert (=> b!1003296 (=> (not res!672011) (not e!565366))))

(assert (=> b!1003296 (= res!672011 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun res!672020 () Bool)

(assert (=> start!86734 (=> (not res!672020) (not e!565363))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86734 (= res!672020 (validMask!0 mask!3464))))

(assert (=> start!86734 e!565363))

(declare-fun array_inv!23632 (array!63354) Bool)

(assert (=> start!86734 (array_inv!23632 a!3219)))

(assert (=> start!86734 true))

(declare-fun b!1003297 () Bool)

(declare-fun e!565365 () Bool)

(assert (=> b!1003297 (= e!565366 e!565365)))

(declare-fun res!672023 () Bool)

(assert (=> b!1003297 (=> (not res!672023) (not e!565365))))

(declare-fun lt!443458 () (_ BitVec 32))

(assert (=> b!1003297 (= res!672023 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!443458 #b00000000000000000000000000000000) (bvslt lt!443458 (size!30999 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1003297 (= lt!443458 (nextIndex!0 index!1507 (bvadd #b00000000000000000000000000000001 x!1245) mask!3464))))

(declare-fun b!1003298 () Bool)

(assert (=> b!1003298 (= e!565368 e!565366)))

(declare-fun res!672015 () Bool)

(assert (=> b!1003298 (=> (not res!672015) (not e!565366))))

(declare-fun lt!443462 () SeekEntryResult!9364)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1003298 (= res!672015 (not (= lt!443462 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!443463 mask!3464) lt!443463 lt!443460 mask!3464))))))

(declare-fun k0!2224 () (_ BitVec 64))

(assert (=> b!1003298 (= lt!443463 (select (store (arr!30496 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1003298 (= lt!443460 (array!63355 (store (arr!30496 a!3219) i!1194 k0!2224) (size!30999 a!3219)))))

(declare-fun b!1003299 () Bool)

(declare-fun res!672013 () Bool)

(assert (=> b!1003299 (=> (not res!672013) (not e!565363))))

(declare-fun arrayContainsKey!0 (array!63354 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1003299 (= res!672013 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1003300 () Bool)

(assert (=> b!1003300 (= e!565363 e!565362)))

(declare-fun res!672014 () Bool)

(assert (=> b!1003300 (=> (not res!672014) (not e!565362))))

(declare-fun lt!443461 () SeekEntryResult!9364)

(assert (=> b!1003300 (= res!672014 (or (= lt!443461 (MissingVacant!9364 i!1194)) (= lt!443461 (MissingZero!9364 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63354 (_ BitVec 32)) SeekEntryResult!9364)

(assert (=> b!1003300 (= lt!443461 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1003301 () Bool)

(assert (=> b!1003301 (= e!565365 false)))

(declare-fun lt!443459 () SeekEntryResult!9364)

(assert (=> b!1003301 (= lt!443459 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443458 lt!443463 lt!443460 mask!3464))))

(declare-fun b!1003302 () Bool)

(declare-fun res!672017 () Bool)

(assert (=> b!1003302 (=> (not res!672017) (not e!565363))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1003302 (= res!672017 (validKeyInArray!0 k0!2224))))

(declare-fun b!1003303 () Bool)

(declare-fun res!672022 () Bool)

(assert (=> b!1003303 (=> (not res!672022) (not e!565362))))

(declare-datatypes ((List!21143 0))(
  ( (Nil!21140) (Cons!21139 (h!22325 (_ BitVec 64)) (t!30136 List!21143)) )
))
(declare-fun arrayNoDuplicates!0 (array!63354 (_ BitVec 32) List!21143) Bool)

(assert (=> b!1003303 (= res!672022 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21140))))

(declare-fun b!1003304 () Bool)

(declare-fun res!672018 () Bool)

(assert (=> b!1003304 (=> (not res!672018) (not e!565363))))

(assert (=> b!1003304 (= res!672018 (validKeyInArray!0 (select (arr!30496 a!3219) j!170)))))

(declare-fun b!1003305 () Bool)

(declare-fun res!672019 () Bool)

(assert (=> b!1003305 (=> (not res!672019) (not e!565365))))

(assert (=> b!1003305 (= res!672019 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443458 (select (arr!30496 a!3219) j!170) a!3219 mask!3464) lt!443464))))

(declare-fun b!1003306 () Bool)

(assert (=> b!1003306 (= e!565362 e!565367)))

(declare-fun res!672016 () Bool)

(assert (=> b!1003306 (=> (not res!672016) (not e!565367))))

(assert (=> b!1003306 (= res!672016 (= lt!443462 lt!443464))))

(assert (=> b!1003306 (= lt!443464 (Intermediate!9364 false resIndex!38 resX!38))))

(assert (=> b!1003306 (= lt!443462 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30496 a!3219) j!170) mask!3464) (select (arr!30496 a!3219) j!170) a!3219 mask!3464))))

(assert (= (and start!86734 res!672020) b!1003295))

(assert (= (and b!1003295 res!672012) b!1003304))

(assert (= (and b!1003304 res!672018) b!1003302))

(assert (= (and b!1003302 res!672017) b!1003299))

(assert (= (and b!1003299 res!672013) b!1003300))

(assert (= (and b!1003300 res!672014) b!1003293))

(assert (= (and b!1003293 res!672021) b!1003303))

(assert (= (and b!1003303 res!672022) b!1003294))

(assert (= (and b!1003294 res!672010) b!1003306))

(assert (= (and b!1003306 res!672016) b!1003291))

(assert (= (and b!1003291 res!672008) b!1003298))

(assert (= (and b!1003298 res!672015) b!1003292))

(assert (= (and b!1003292 res!672009) b!1003296))

(assert (= (and b!1003296 res!672011) b!1003297))

(assert (= (and b!1003297 res!672023) b!1003305))

(assert (= (and b!1003305 res!672019) b!1003301))

(declare-fun m!929513 () Bool)

(assert (=> b!1003306 m!929513))

(assert (=> b!1003306 m!929513))

(declare-fun m!929515 () Bool)

(assert (=> b!1003306 m!929515))

(assert (=> b!1003306 m!929515))

(assert (=> b!1003306 m!929513))

(declare-fun m!929517 () Bool)

(assert (=> b!1003306 m!929517))

(assert (=> b!1003291 m!929513))

(assert (=> b!1003291 m!929513))

(declare-fun m!929519 () Bool)

(assert (=> b!1003291 m!929519))

(assert (=> b!1003304 m!929513))

(assert (=> b!1003304 m!929513))

(declare-fun m!929521 () Bool)

(assert (=> b!1003304 m!929521))

(declare-fun m!929523 () Bool)

(assert (=> b!1003300 m!929523))

(declare-fun m!929525 () Bool)

(assert (=> b!1003303 m!929525))

(declare-fun m!929527 () Bool)

(assert (=> b!1003301 m!929527))

(declare-fun m!929529 () Bool)

(assert (=> b!1003292 m!929529))

(declare-fun m!929531 () Bool)

(assert (=> b!1003293 m!929531))

(declare-fun m!929533 () Bool)

(assert (=> start!86734 m!929533))

(declare-fun m!929535 () Bool)

(assert (=> start!86734 m!929535))

(declare-fun m!929537 () Bool)

(assert (=> b!1003297 m!929537))

(declare-fun m!929539 () Bool)

(assert (=> b!1003298 m!929539))

(assert (=> b!1003298 m!929539))

(declare-fun m!929541 () Bool)

(assert (=> b!1003298 m!929541))

(declare-fun m!929543 () Bool)

(assert (=> b!1003298 m!929543))

(declare-fun m!929545 () Bool)

(assert (=> b!1003298 m!929545))

(declare-fun m!929547 () Bool)

(assert (=> b!1003299 m!929547))

(declare-fun m!929549 () Bool)

(assert (=> b!1003302 m!929549))

(assert (=> b!1003305 m!929513))

(assert (=> b!1003305 m!929513))

(declare-fun m!929551 () Bool)

(assert (=> b!1003305 m!929551))

(check-sat (not b!1003298) (not b!1003291) (not b!1003306) (not b!1003297) (not b!1003305) (not b!1003300) (not b!1003293) (not b!1003299) (not b!1003303) (not start!86734) (not b!1003301) (not b!1003304) (not b!1003292) (not b!1003302))
(check-sat)
