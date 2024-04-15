; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86556 () Bool)

(assert start!86556)

(declare-fun b!1003267 () Bool)

(declare-fun res!672883 () Bool)

(declare-fun e!565061 () Bool)

(assert (=> b!1003267 (=> (not res!672883) (not e!565061))))

(declare-datatypes ((array!63304 0))(
  ( (array!63305 (arr!30477 (Array (_ BitVec 32) (_ BitVec 64))) (size!30981 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63304)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1003267 (= res!672883 (validKeyInArray!0 (select (arr!30477 a!3219) j!170)))))

(declare-fun b!1003268 () Bool)

(declare-fun res!672874 () Bool)

(declare-fun e!565062 () Bool)

(assert (=> b!1003268 (=> (not res!672874) (not e!565062))))

(declare-fun lt!443470 () array!63304)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9434 0))(
  ( (MissingZero!9434 (index!40107 (_ BitVec 32))) (Found!9434 (index!40108 (_ BitVec 32))) (Intermediate!9434 (undefined!10246 Bool) (index!40109 (_ BitVec 32)) (x!87529 (_ BitVec 32))) (Undefined!9434) (MissingVacant!9434 (index!40110 (_ BitVec 32))) )
))
(declare-fun lt!443467 () SeekEntryResult!9434)

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun lt!443469 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63304 (_ BitVec 32)) SeekEntryResult!9434)

(assert (=> b!1003268 (= res!672874 (not (= lt!443467 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!443469 lt!443470 mask!3464))))))

(declare-fun res!672881 () Bool)

(assert (=> start!86556 (=> (not res!672881) (not e!565061))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86556 (= res!672881 (validMask!0 mask!3464))))

(assert (=> start!86556 e!565061))

(declare-fun array_inv!23620 (array!63304) Bool)

(assert (=> start!86556 (array_inv!23620 a!3219)))

(assert (=> start!86556 true))

(declare-fun b!1003269 () Bool)

(declare-fun res!672884 () Bool)

(assert (=> b!1003269 (=> (not res!672884) (not e!565061))))

(declare-fun k0!2224 () (_ BitVec 64))

(assert (=> b!1003269 (= res!672884 (validKeyInArray!0 k0!2224))))

(declare-fun b!1003270 () Bool)

(declare-fun res!672875 () Bool)

(assert (=> b!1003270 (=> (not res!672875) (not e!565061))))

(declare-fun arrayContainsKey!0 (array!63304 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1003270 (= res!672875 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1003271 () Bool)

(declare-fun res!672876 () Bool)

(declare-fun e!565058 () Bool)

(assert (=> b!1003271 (=> (not res!672876) (not e!565058))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1003271 (= res!672876 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30981 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30981 a!3219))))))

(declare-fun b!1003272 () Bool)

(declare-fun res!672879 () Bool)

(declare-fun e!565064 () Bool)

(assert (=> b!1003272 (=> (not res!672879) (not e!565064))))

(declare-fun lt!443472 () SeekEntryResult!9434)

(declare-fun lt!443471 () (_ BitVec 32))

(assert (=> b!1003272 (= res!672879 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443471 (select (arr!30477 a!3219) j!170) a!3219 mask!3464) lt!443472))))

(declare-fun b!1003273 () Bool)

(declare-fun e!565059 () Bool)

(assert (=> b!1003273 (= e!565058 e!565059)))

(declare-fun res!672882 () Bool)

(assert (=> b!1003273 (=> (not res!672882) (not e!565059))))

(declare-fun lt!443473 () SeekEntryResult!9434)

(assert (=> b!1003273 (= res!672882 (= lt!443473 lt!443472))))

(assert (=> b!1003273 (= lt!443472 (Intermediate!9434 false resIndex!38 resX!38))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1003273 (= lt!443473 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30477 a!3219) j!170) mask!3464) (select (arr!30477 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1003274 () Bool)

(declare-fun res!672872 () Bool)

(assert (=> b!1003274 (=> (not res!672872) (not e!565061))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1003274 (= res!672872 (and (= (size!30981 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30981 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30981 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1003275 () Bool)

(declare-fun res!672869 () Bool)

(assert (=> b!1003275 (=> (not res!672869) (not e!565058))))

(declare-datatypes ((List!21219 0))(
  ( (Nil!21216) (Cons!21215 (h!22392 (_ BitVec 64)) (t!30211 List!21219)) )
))
(declare-fun arrayNoDuplicates!0 (array!63304 (_ BitVec 32) List!21219) Bool)

(assert (=> b!1003275 (= res!672869 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21216))))

(declare-fun b!1003276 () Bool)

(declare-fun res!672878 () Bool)

(assert (=> b!1003276 (=> (not res!672878) (not e!565062))))

(assert (=> b!1003276 (= res!672878 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1003277 () Bool)

(declare-fun e!565063 () Bool)

(assert (=> b!1003277 (= e!565059 e!565063)))

(declare-fun res!672871 () Bool)

(assert (=> b!1003277 (=> (not res!672871) (not e!565063))))

(assert (=> b!1003277 (= res!672871 (= lt!443467 lt!443472))))

(assert (=> b!1003277 (= lt!443467 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30477 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1003278 () Bool)

(assert (=> b!1003278 (= e!565064 false)))

(declare-fun lt!443466 () SeekEntryResult!9434)

(assert (=> b!1003278 (= lt!443466 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443471 lt!443469 lt!443470 mask!3464))))

(declare-fun b!1003279 () Bool)

(assert (=> b!1003279 (= e!565063 e!565062)))

(declare-fun res!672870 () Bool)

(assert (=> b!1003279 (=> (not res!672870) (not e!565062))))

(assert (=> b!1003279 (= res!672870 (not (= lt!443473 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!443469 mask!3464) lt!443469 lt!443470 mask!3464))))))

(assert (=> b!1003279 (= lt!443469 (select (store (arr!30477 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1003279 (= lt!443470 (array!63305 (store (arr!30477 a!3219) i!1194 k0!2224) (size!30981 a!3219)))))

(declare-fun b!1003280 () Bool)

(declare-fun res!672873 () Bool)

(assert (=> b!1003280 (=> (not res!672873) (not e!565058))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63304 (_ BitVec 32)) Bool)

(assert (=> b!1003280 (= res!672873 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1003281 () Bool)

(assert (=> b!1003281 (= e!565061 e!565058)))

(declare-fun res!672880 () Bool)

(assert (=> b!1003281 (=> (not res!672880) (not e!565058))))

(declare-fun lt!443468 () SeekEntryResult!9434)

(assert (=> b!1003281 (= res!672880 (or (= lt!443468 (MissingVacant!9434 i!1194)) (= lt!443468 (MissingZero!9434 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63304 (_ BitVec 32)) SeekEntryResult!9434)

(assert (=> b!1003281 (= lt!443468 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1003282 () Bool)

(assert (=> b!1003282 (= e!565062 e!565064)))

(declare-fun res!672877 () Bool)

(assert (=> b!1003282 (=> (not res!672877) (not e!565064))))

(assert (=> b!1003282 (= res!672877 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!443471 #b00000000000000000000000000000000) (bvslt lt!443471 (size!30981 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1003282 (= lt!443471 (nextIndex!0 index!1507 x!1245 mask!3464))))

(assert (= (and start!86556 res!672881) b!1003274))

(assert (= (and b!1003274 res!672872) b!1003267))

(assert (= (and b!1003267 res!672883) b!1003269))

(assert (= (and b!1003269 res!672884) b!1003270))

(assert (= (and b!1003270 res!672875) b!1003281))

(assert (= (and b!1003281 res!672880) b!1003280))

(assert (= (and b!1003280 res!672873) b!1003275))

(assert (= (and b!1003275 res!672869) b!1003271))

(assert (= (and b!1003271 res!672876) b!1003273))

(assert (= (and b!1003273 res!672882) b!1003277))

(assert (= (and b!1003277 res!672871) b!1003279))

(assert (= (and b!1003279 res!672870) b!1003268))

(assert (= (and b!1003268 res!672874) b!1003276))

(assert (= (and b!1003276 res!672878) b!1003282))

(assert (= (and b!1003282 res!672877) b!1003272))

(assert (= (and b!1003272 res!672879) b!1003278))

(declare-fun m!928459 () Bool)

(assert (=> b!1003275 m!928459))

(declare-fun m!928461 () Bool)

(assert (=> start!86556 m!928461))

(declare-fun m!928463 () Bool)

(assert (=> start!86556 m!928463))

(declare-fun m!928465 () Bool)

(assert (=> b!1003280 m!928465))

(declare-fun m!928467 () Bool)

(assert (=> b!1003268 m!928467))

(declare-fun m!928469 () Bool)

(assert (=> b!1003277 m!928469))

(assert (=> b!1003277 m!928469))

(declare-fun m!928471 () Bool)

(assert (=> b!1003277 m!928471))

(declare-fun m!928473 () Bool)

(assert (=> b!1003281 m!928473))

(declare-fun m!928475 () Bool)

(assert (=> b!1003269 m!928475))

(declare-fun m!928477 () Bool)

(assert (=> b!1003270 m!928477))

(assert (=> b!1003272 m!928469))

(assert (=> b!1003272 m!928469))

(declare-fun m!928479 () Bool)

(assert (=> b!1003272 m!928479))

(assert (=> b!1003273 m!928469))

(assert (=> b!1003273 m!928469))

(declare-fun m!928481 () Bool)

(assert (=> b!1003273 m!928481))

(assert (=> b!1003273 m!928481))

(assert (=> b!1003273 m!928469))

(declare-fun m!928483 () Bool)

(assert (=> b!1003273 m!928483))

(assert (=> b!1003267 m!928469))

(assert (=> b!1003267 m!928469))

(declare-fun m!928485 () Bool)

(assert (=> b!1003267 m!928485))

(declare-fun m!928487 () Bool)

(assert (=> b!1003279 m!928487))

(assert (=> b!1003279 m!928487))

(declare-fun m!928489 () Bool)

(assert (=> b!1003279 m!928489))

(declare-fun m!928491 () Bool)

(assert (=> b!1003279 m!928491))

(declare-fun m!928493 () Bool)

(assert (=> b!1003279 m!928493))

(declare-fun m!928495 () Bool)

(assert (=> b!1003278 m!928495))

(declare-fun m!928497 () Bool)

(assert (=> b!1003282 m!928497))

(check-sat (not b!1003267) (not b!1003277) (not b!1003272) (not b!1003282) (not b!1003275) (not b!1003268) (not b!1003278) (not b!1003281) (not start!86556) (not b!1003279) (not b!1003273) (not b!1003269) (not b!1003280) (not b!1003270))
(check-sat)
