; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86526 () Bool)

(assert start!86526)

(declare-fun b!1002573 () Bool)

(declare-fun res!672065 () Bool)

(declare-fun e!564795 () Bool)

(assert (=> b!1002573 (=> (not res!672065) (not e!564795))))

(declare-datatypes ((array!63327 0))(
  ( (array!63328 (arr!30489 (Array (_ BitVec 32) (_ BitVec 64))) (size!30991 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63327)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1002573 (= res!672065 (validKeyInArray!0 (select (arr!30489 a!3219) j!170)))))

(declare-fun b!1002574 () Bool)

(declare-fun res!672061 () Bool)

(declare-fun e!564790 () Bool)

(assert (=> b!1002574 (=> (not res!672061) (not e!564790))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun lt!443242 () (_ BitVec 64))

(declare-fun lt!443243 () array!63327)

(declare-datatypes ((SeekEntryResult!9421 0))(
  ( (MissingZero!9421 (index!40055 (_ BitVec 32))) (Found!9421 (index!40056 (_ BitVec 32))) (Intermediate!9421 (undefined!10233 Bool) (index!40057 (_ BitVec 32)) (x!87465 (_ BitVec 32))) (Undefined!9421) (MissingVacant!9421 (index!40058 (_ BitVec 32))) )
))
(declare-fun lt!443248 () SeekEntryResult!9421)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63327 (_ BitVec 32)) SeekEntryResult!9421)

(assert (=> b!1002574 (= res!672061 (not (= lt!443248 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!443242 lt!443243 mask!3464))))))

(declare-fun b!1002575 () Bool)

(declare-fun e!564791 () Bool)

(assert (=> b!1002575 (= e!564791 false)))

(declare-fun lt!443247 () (_ BitVec 32))

(declare-fun lt!443245 () SeekEntryResult!9421)

(assert (=> b!1002575 (= lt!443245 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443247 lt!443242 lt!443243 mask!3464))))

(declare-fun b!1002576 () Bool)

(declare-fun e!564793 () Bool)

(assert (=> b!1002576 (= e!564793 e!564790)))

(declare-fun res!672062 () Bool)

(assert (=> b!1002576 (=> (not res!672062) (not e!564790))))

(declare-fun lt!443246 () SeekEntryResult!9421)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1002576 (= res!672062 (not (= lt!443246 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!443242 mask!3464) lt!443242 lt!443243 mask!3464))))))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun k!2224 () (_ BitVec 64))

(assert (=> b!1002576 (= lt!443242 (select (store (arr!30489 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1002576 (= lt!443243 (array!63328 (store (arr!30489 a!3219) i!1194 k!2224) (size!30991 a!3219)))))

(declare-fun b!1002577 () Bool)

(declare-fun e!564794 () Bool)

(assert (=> b!1002577 (= e!564794 e!564793)))

(declare-fun res!672060 () Bool)

(assert (=> b!1002577 (=> (not res!672060) (not e!564793))))

(declare-fun lt!443244 () SeekEntryResult!9421)

(assert (=> b!1002577 (= res!672060 (= lt!443248 lt!443244))))

(assert (=> b!1002577 (= lt!443248 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30489 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1002578 () Bool)

(declare-fun res!672058 () Bool)

(assert (=> b!1002578 (=> (not res!672058) (not e!564790))))

(declare-fun resIndex!38 () (_ BitVec 32))

(assert (=> b!1002578 (= res!672058 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1002579 () Bool)

(declare-fun res!672056 () Bool)

(declare-fun e!564796 () Bool)

(assert (=> b!1002579 (=> (not res!672056) (not e!564796))))

(declare-datatypes ((List!21165 0))(
  ( (Nil!21162) (Cons!21161 (h!22338 (_ BitVec 64)) (t!30166 List!21165)) )
))
(declare-fun arrayNoDuplicates!0 (array!63327 (_ BitVec 32) List!21165) Bool)

(assert (=> b!1002579 (= res!672056 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21162))))

(declare-fun b!1002580 () Bool)

(assert (=> b!1002580 (= e!564790 e!564791)))

(declare-fun res!672052 () Bool)

(assert (=> b!1002580 (=> (not res!672052) (not e!564791))))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1002580 (= res!672052 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!443247 #b00000000000000000000000000000000) (bvslt lt!443247 (size!30991 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1002580 (= lt!443247 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1002581 () Bool)

(declare-fun res!672066 () Bool)

(assert (=> b!1002581 (=> (not res!672066) (not e!564796))))

(assert (=> b!1002581 (= res!672066 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30991 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30991 a!3219))))))

(declare-fun b!1002583 () Bool)

(assert (=> b!1002583 (= e!564796 e!564794)))

(declare-fun res!672057 () Bool)

(assert (=> b!1002583 (=> (not res!672057) (not e!564794))))

(assert (=> b!1002583 (= res!672057 (= lt!443246 lt!443244))))

(assert (=> b!1002583 (= lt!443244 (Intermediate!9421 false resIndex!38 resX!38))))

(assert (=> b!1002583 (= lt!443246 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30489 a!3219) j!170) mask!3464) (select (arr!30489 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1002584 () Bool)

(declare-fun res!672051 () Bool)

(assert (=> b!1002584 (=> (not res!672051) (not e!564795))))

(assert (=> b!1002584 (= res!672051 (validKeyInArray!0 k!2224))))

(declare-fun b!1002585 () Bool)

(declare-fun res!672063 () Bool)

(assert (=> b!1002585 (=> (not res!672063) (not e!564796))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63327 (_ BitVec 32)) Bool)

(assert (=> b!1002585 (= res!672063 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1002586 () Bool)

(declare-fun res!672059 () Bool)

(assert (=> b!1002586 (=> (not res!672059) (not e!564795))))

(declare-fun arrayContainsKey!0 (array!63327 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1002586 (= res!672059 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1002582 () Bool)

(declare-fun res!672054 () Bool)

(assert (=> b!1002582 (=> (not res!672054) (not e!564791))))

(assert (=> b!1002582 (= res!672054 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443247 (select (arr!30489 a!3219) j!170) a!3219 mask!3464) lt!443244))))

(declare-fun res!672064 () Bool)

(assert (=> start!86526 (=> (not res!672064) (not e!564795))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86526 (= res!672064 (validMask!0 mask!3464))))

(assert (=> start!86526 e!564795))

(declare-fun array_inv!23613 (array!63327) Bool)

(assert (=> start!86526 (array_inv!23613 a!3219)))

(assert (=> start!86526 true))

(declare-fun b!1002587 () Bool)

(assert (=> b!1002587 (= e!564795 e!564796)))

(declare-fun res!672055 () Bool)

(assert (=> b!1002587 (=> (not res!672055) (not e!564796))))

(declare-fun lt!443249 () SeekEntryResult!9421)

(assert (=> b!1002587 (= res!672055 (or (= lt!443249 (MissingVacant!9421 i!1194)) (= lt!443249 (MissingZero!9421 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63327 (_ BitVec 32)) SeekEntryResult!9421)

(assert (=> b!1002587 (= lt!443249 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1002588 () Bool)

(declare-fun res!672053 () Bool)

(assert (=> b!1002588 (=> (not res!672053) (not e!564795))))

(assert (=> b!1002588 (= res!672053 (and (= (size!30991 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30991 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30991 a!3219)) (not (= i!1194 j!170))))))

(assert (= (and start!86526 res!672064) b!1002588))

(assert (= (and b!1002588 res!672053) b!1002573))

(assert (= (and b!1002573 res!672065) b!1002584))

(assert (= (and b!1002584 res!672051) b!1002586))

(assert (= (and b!1002586 res!672059) b!1002587))

(assert (= (and b!1002587 res!672055) b!1002585))

(assert (= (and b!1002585 res!672063) b!1002579))

(assert (= (and b!1002579 res!672056) b!1002581))

(assert (= (and b!1002581 res!672066) b!1002583))

(assert (= (and b!1002583 res!672057) b!1002577))

(assert (= (and b!1002577 res!672060) b!1002576))

(assert (= (and b!1002576 res!672062) b!1002574))

(assert (= (and b!1002574 res!672061) b!1002578))

(assert (= (and b!1002578 res!672058) b!1002580))

(assert (= (and b!1002580 res!672052) b!1002582))

(assert (= (and b!1002582 res!672054) b!1002575))

(declare-fun m!928429 () Bool)

(assert (=> b!1002577 m!928429))

(assert (=> b!1002577 m!928429))

(declare-fun m!928431 () Bool)

(assert (=> b!1002577 m!928431))

(assert (=> b!1002573 m!928429))

(assert (=> b!1002573 m!928429))

(declare-fun m!928433 () Bool)

(assert (=> b!1002573 m!928433))

(declare-fun m!928435 () Bool)

(assert (=> b!1002576 m!928435))

(assert (=> b!1002576 m!928435))

(declare-fun m!928437 () Bool)

(assert (=> b!1002576 m!928437))

(declare-fun m!928439 () Bool)

(assert (=> b!1002576 m!928439))

(declare-fun m!928441 () Bool)

(assert (=> b!1002576 m!928441))

(declare-fun m!928443 () Bool)

(assert (=> b!1002574 m!928443))

(declare-fun m!928445 () Bool)

(assert (=> start!86526 m!928445))

(declare-fun m!928447 () Bool)

(assert (=> start!86526 m!928447))

(declare-fun m!928449 () Bool)

(assert (=> b!1002586 m!928449))

(declare-fun m!928451 () Bool)

(assert (=> b!1002587 m!928451))

(declare-fun m!928453 () Bool)

(assert (=> b!1002575 m!928453))

(assert (=> b!1002583 m!928429))

(assert (=> b!1002583 m!928429))

(declare-fun m!928455 () Bool)

(assert (=> b!1002583 m!928455))

(assert (=> b!1002583 m!928455))

(assert (=> b!1002583 m!928429))

(declare-fun m!928457 () Bool)

(assert (=> b!1002583 m!928457))

(declare-fun m!928459 () Bool)

(assert (=> b!1002579 m!928459))

(declare-fun m!928461 () Bool)

(assert (=> b!1002584 m!928461))

(declare-fun m!928463 () Bool)

(assert (=> b!1002585 m!928463))

(assert (=> b!1002582 m!928429))

(assert (=> b!1002582 m!928429))

(declare-fun m!928465 () Bool)

(assert (=> b!1002582 m!928465))

(declare-fun m!928467 () Bool)

(assert (=> b!1002580 m!928467))

(push 1)

