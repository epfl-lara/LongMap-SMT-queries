; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86528 () Bool)

(assert start!86528)

(declare-fun b!1002621 () Bool)

(declare-fun res!672100 () Bool)

(declare-fun e!564814 () Bool)

(assert (=> b!1002621 (=> (not res!672100) (not e!564814))))

(declare-datatypes ((array!63329 0))(
  ( (array!63330 (arr!30490 (Array (_ BitVec 32) (_ BitVec 64))) (size!30992 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63329)

(declare-datatypes ((List!21166 0))(
  ( (Nil!21163) (Cons!21162 (h!22339 (_ BitVec 64)) (t!30167 List!21166)) )
))
(declare-fun arrayNoDuplicates!0 (array!63329 (_ BitVec 32) List!21166) Bool)

(assert (=> b!1002621 (= res!672100 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21163))))

(declare-fun res!672105 () Bool)

(declare-fun e!564815 () Bool)

(assert (=> start!86528 (=> (not res!672105) (not e!564815))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86528 (= res!672105 (validMask!0 mask!3464))))

(assert (=> start!86528 e!564815))

(declare-fun array_inv!23614 (array!63329) Bool)

(assert (=> start!86528 (array_inv!23614 a!3219)))

(assert (=> start!86528 true))

(declare-fun b!1002622 () Bool)

(declare-fun e!564812 () Bool)

(assert (=> b!1002622 (= e!564812 false)))

(declare-fun lt!443271 () array!63329)

(declare-fun lt!443267 () (_ BitVec 64))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun lt!443273 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9422 0))(
  ( (MissingZero!9422 (index!40059 (_ BitVec 32))) (Found!9422 (index!40060 (_ BitVec 32))) (Intermediate!9422 (undefined!10234 Bool) (index!40061 (_ BitVec 32)) (x!87474 (_ BitVec 32))) (Undefined!9422) (MissingVacant!9422 (index!40062 (_ BitVec 32))) )
))
(declare-fun lt!443272 () SeekEntryResult!9422)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63329 (_ BitVec 32)) SeekEntryResult!9422)

(assert (=> b!1002622 (= lt!443272 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443273 lt!443267 lt!443271 mask!3464))))

(declare-fun b!1002623 () Bool)

(declare-fun res!672102 () Bool)

(assert (=> b!1002623 (=> (not res!672102) (not e!564814))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63329 (_ BitVec 32)) Bool)

(assert (=> b!1002623 (= res!672102 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1002624 () Bool)

(declare-fun e!564813 () Bool)

(declare-fun e!564811 () Bool)

(assert (=> b!1002624 (= e!564813 e!564811)))

(declare-fun res!672107 () Bool)

(assert (=> b!1002624 (=> (not res!672107) (not e!564811))))

(declare-fun lt!443269 () SeekEntryResult!9422)

(declare-fun lt!443266 () SeekEntryResult!9422)

(assert (=> b!1002624 (= res!672107 (= lt!443269 lt!443266))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!1002624 (= lt!443269 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30490 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1002625 () Bool)

(assert (=> b!1002625 (= e!564814 e!564813)))

(declare-fun res!672110 () Bool)

(assert (=> b!1002625 (=> (not res!672110) (not e!564813))))

(declare-fun lt!443270 () SeekEntryResult!9422)

(assert (=> b!1002625 (= res!672110 (= lt!443270 lt!443266))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1002625 (= lt!443266 (Intermediate!9422 false resIndex!38 resX!38))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1002625 (= lt!443270 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30490 a!3219) j!170) mask!3464) (select (arr!30490 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1002626 () Bool)

(declare-fun res!672114 () Bool)

(assert (=> b!1002626 (=> (not res!672114) (not e!564815))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1002626 (= res!672114 (validKeyInArray!0 k!2224))))

(declare-fun b!1002627 () Bool)

(declare-fun res!672109 () Bool)

(assert (=> b!1002627 (=> (not res!672109) (not e!564815))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1002627 (= res!672109 (and (= (size!30992 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30992 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30992 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1002628 () Bool)

(declare-fun e!564817 () Bool)

(assert (=> b!1002628 (= e!564811 e!564817)))

(declare-fun res!672101 () Bool)

(assert (=> b!1002628 (=> (not res!672101) (not e!564817))))

(assert (=> b!1002628 (= res!672101 (not (= lt!443270 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!443267 mask!3464) lt!443267 lt!443271 mask!3464))))))

(assert (=> b!1002628 (= lt!443267 (select (store (arr!30490 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1002628 (= lt!443271 (array!63330 (store (arr!30490 a!3219) i!1194 k!2224) (size!30992 a!3219)))))

(declare-fun b!1002629 () Bool)

(declare-fun res!672104 () Bool)

(assert (=> b!1002629 (=> (not res!672104) (not e!564814))))

(assert (=> b!1002629 (= res!672104 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30992 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30992 a!3219))))))

(declare-fun b!1002630 () Bool)

(assert (=> b!1002630 (= e!564817 e!564812)))

(declare-fun res!672111 () Bool)

(assert (=> b!1002630 (=> (not res!672111) (not e!564812))))

(assert (=> b!1002630 (= res!672111 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!443273 #b00000000000000000000000000000000) (bvslt lt!443273 (size!30992 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1002630 (= lt!443273 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1002631 () Bool)

(declare-fun res!672103 () Bool)

(assert (=> b!1002631 (=> (not res!672103) (not e!564815))))

(assert (=> b!1002631 (= res!672103 (validKeyInArray!0 (select (arr!30490 a!3219) j!170)))))

(declare-fun b!1002632 () Bool)

(declare-fun res!672108 () Bool)

(assert (=> b!1002632 (=> (not res!672108) (not e!564817))))

(assert (=> b!1002632 (= res!672108 (not (= lt!443269 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!443267 lt!443271 mask!3464))))))

(declare-fun b!1002633 () Bool)

(declare-fun res!672112 () Bool)

(assert (=> b!1002633 (=> (not res!672112) (not e!564812))))

(assert (=> b!1002633 (= res!672112 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443273 (select (arr!30490 a!3219) j!170) a!3219 mask!3464) lt!443266))))

(declare-fun b!1002634 () Bool)

(declare-fun res!672099 () Bool)

(assert (=> b!1002634 (=> (not res!672099) (not e!564817))))

(assert (=> b!1002634 (= res!672099 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1002635 () Bool)

(declare-fun res!672106 () Bool)

(assert (=> b!1002635 (=> (not res!672106) (not e!564815))))

(declare-fun arrayContainsKey!0 (array!63329 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1002635 (= res!672106 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1002636 () Bool)

(assert (=> b!1002636 (= e!564815 e!564814)))

(declare-fun res!672113 () Bool)

(assert (=> b!1002636 (=> (not res!672113) (not e!564814))))

(declare-fun lt!443268 () SeekEntryResult!9422)

(assert (=> b!1002636 (= res!672113 (or (= lt!443268 (MissingVacant!9422 i!1194)) (= lt!443268 (MissingZero!9422 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63329 (_ BitVec 32)) SeekEntryResult!9422)

(assert (=> b!1002636 (= lt!443268 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(assert (= (and start!86528 res!672105) b!1002627))

(assert (= (and b!1002627 res!672109) b!1002631))

(assert (= (and b!1002631 res!672103) b!1002626))

(assert (= (and b!1002626 res!672114) b!1002635))

(assert (= (and b!1002635 res!672106) b!1002636))

(assert (= (and b!1002636 res!672113) b!1002623))

(assert (= (and b!1002623 res!672102) b!1002621))

(assert (= (and b!1002621 res!672100) b!1002629))

(assert (= (and b!1002629 res!672104) b!1002625))

(assert (= (and b!1002625 res!672110) b!1002624))

(assert (= (and b!1002624 res!672107) b!1002628))

(assert (= (and b!1002628 res!672101) b!1002632))

(assert (= (and b!1002632 res!672108) b!1002634))

(assert (= (and b!1002634 res!672099) b!1002630))

(assert (= (and b!1002630 res!672111) b!1002633))

(assert (= (and b!1002633 res!672112) b!1002622))

(declare-fun m!928469 () Bool)

(assert (=> b!1002630 m!928469))

(declare-fun m!928471 () Bool)

(assert (=> b!1002635 m!928471))

(declare-fun m!928473 () Bool)

(assert (=> b!1002628 m!928473))

(assert (=> b!1002628 m!928473))

(declare-fun m!928475 () Bool)

(assert (=> b!1002628 m!928475))

(declare-fun m!928477 () Bool)

(assert (=> b!1002628 m!928477))

(declare-fun m!928479 () Bool)

(assert (=> b!1002628 m!928479))

(declare-fun m!928481 () Bool)

(assert (=> b!1002625 m!928481))

(assert (=> b!1002625 m!928481))

(declare-fun m!928483 () Bool)

(assert (=> b!1002625 m!928483))

(assert (=> b!1002625 m!928483))

(assert (=> b!1002625 m!928481))

(declare-fun m!928485 () Bool)

(assert (=> b!1002625 m!928485))

(declare-fun m!928487 () Bool)

(assert (=> b!1002632 m!928487))

(declare-fun m!928489 () Bool)

(assert (=> b!1002623 m!928489))

(declare-fun m!928491 () Bool)

(assert (=> b!1002622 m!928491))

(declare-fun m!928493 () Bool)

(assert (=> b!1002626 m!928493))

(assert (=> b!1002624 m!928481))

(assert (=> b!1002624 m!928481))

(declare-fun m!928495 () Bool)

(assert (=> b!1002624 m!928495))

(assert (=> b!1002633 m!928481))

(assert (=> b!1002633 m!928481))

(declare-fun m!928497 () Bool)

(assert (=> b!1002633 m!928497))

(declare-fun m!928499 () Bool)

(assert (=> b!1002636 m!928499))

(assert (=> b!1002631 m!928481))

(assert (=> b!1002631 m!928481))

(declare-fun m!928501 () Bool)

(assert (=> b!1002631 m!928501))

(declare-fun m!928503 () Bool)

(assert (=> b!1002621 m!928503))

(declare-fun m!928505 () Bool)

(assert (=> start!86528 m!928505))

(declare-fun m!928507 () Bool)

(assert (=> start!86528 m!928507))

(push 1)

