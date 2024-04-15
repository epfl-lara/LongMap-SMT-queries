; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130476 () Bool)

(assert start!130476)

(declare-fun res!1048721 () Bool)

(declare-fun e!853265 () Bool)

(assert (=> start!130476 (=> (not res!1048721) (not e!853265))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130476 (= res!1048721 (validMask!0 mask!2512))))

(assert (=> start!130476 e!853265))

(assert (=> start!130476 true))

(declare-datatypes ((array!101653 0))(
  ( (array!101654 (arr!49048 (Array (_ BitVec 32) (_ BitVec 64))) (size!49600 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101653)

(declare-fun array_inv!38281 (array!101653) Bool)

(assert (=> start!130476 (array_inv!38281 a!2804)))

(declare-fun b!1531392 () Bool)

(declare-fun res!1048722 () Bool)

(assert (=> b!1531392 (=> (not res!1048722) (not e!853265))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101653 (_ BitVec 32)) Bool)

(assert (=> b!1531392 (= res!1048722 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1531393 () Bool)

(declare-fun e!853268 () Bool)

(assert (=> b!1531393 (= e!853268 true)))

(declare-fun lt!663057 () array!101653)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun lt!663053 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!13236 0))(
  ( (MissingZero!13236 (index!55339 (_ BitVec 32))) (Found!13236 (index!55340 (_ BitVec 32))) (Intermediate!13236 (undefined!14048 Bool) (index!55341 (_ BitVec 32)) (x!137041 (_ BitVec 32))) (Undefined!13236) (MissingVacant!13236 (index!55342 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101653 (_ BitVec 32)) SeekEntryResult!13236)

(assert (=> b!1531393 (= (seekEntryOrOpen!0 (select (arr!49048 a!2804) j!70) a!2804 mask!2512) (seekEntryOrOpen!0 lt!663053 lt!663057 mask!2512))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-datatypes ((Unit!51095 0))(
  ( (Unit!51096) )
))
(declare-fun lt!663051 () Unit!51095)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun lt!663052 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!101653 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51095)

(assert (=> b!1531393 (= lt!663051 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2804 i!961 j!70 (bvadd #b00000000000000000000000000000001 x!534) lt!663052 resX!21 resIndex!21 mask!2512))))

(declare-fun b!1531394 () Bool)

(declare-fun e!853264 () Bool)

(assert (=> b!1531394 (= e!853264 e!853268)))

(declare-fun res!1048727 () Bool)

(assert (=> b!1531394 (=> res!1048727 e!853268)))

(assert (=> b!1531394 (= res!1048727 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!663052 #b00000000000000000000000000000000) (bvsge lt!663052 (size!49600 a!2804))))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1531394 (= lt!663052 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1531395 () Bool)

(declare-fun res!1048719 () Bool)

(assert (=> b!1531395 (=> (not res!1048719) (not e!853265))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1531395 (= res!1048719 (validKeyInArray!0 (select (arr!49048 a!2804) j!70)))))

(declare-fun e!853270 () Bool)

(declare-fun b!1531396 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101653 (_ BitVec 32)) SeekEntryResult!13236)

(assert (=> b!1531396 (= e!853270 (= (seekEntry!0 (select (arr!49048 a!2804) j!70) a!2804 mask!2512) (Found!13236 j!70)))))

(declare-fun b!1531397 () Bool)

(declare-fun e!853267 () Bool)

(declare-fun e!853269 () Bool)

(assert (=> b!1531397 (= e!853267 e!853269)))

(declare-fun res!1048720 () Bool)

(assert (=> b!1531397 (=> (not res!1048720) (not e!853269))))

(declare-fun lt!663055 () SeekEntryResult!13236)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101653 (_ BitVec 32)) SeekEntryResult!13236)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1531397 (= res!1048720 (= lt!663055 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!663053 mask!2512) lt!663053 lt!663057 mask!2512)))))

(assert (=> b!1531397 (= lt!663053 (select (store (arr!49048 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1531397 (= lt!663057 (array!101654 (store (arr!49048 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49600 a!2804)))))

(declare-fun b!1531398 () Bool)

(declare-fun res!1048716 () Bool)

(assert (=> b!1531398 (=> (not res!1048716) (not e!853265))))

(assert (=> b!1531398 (= res!1048716 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49600 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49600 a!2804))))))

(declare-fun b!1531399 () Bool)

(declare-fun res!1048726 () Bool)

(assert (=> b!1531399 (=> res!1048726 e!853268)))

(declare-fun lt!663054 () SeekEntryResult!13236)

(assert (=> b!1531399 (= res!1048726 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!663052 (select (arr!49048 a!2804) j!70) a!2804 mask!2512) lt!663054)))))

(declare-fun b!1531400 () Bool)

(assert (=> b!1531400 (= e!853265 e!853267)))

(declare-fun res!1048723 () Bool)

(assert (=> b!1531400 (=> (not res!1048723) (not e!853267))))

(assert (=> b!1531400 (= res!1048723 (= lt!663055 lt!663054))))

(assert (=> b!1531400 (= lt!663054 (Intermediate!13236 false resIndex!21 resX!21))))

(assert (=> b!1531400 (= lt!663055 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49048 a!2804) j!70) mask!2512) (select (arr!49048 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1531401 () Bool)

(declare-fun res!1048728 () Bool)

(assert (=> b!1531401 (=> (not res!1048728) (not e!853265))))

(assert (=> b!1531401 (= res!1048728 (validKeyInArray!0 (select (arr!49048 a!2804) i!961)))))

(declare-fun b!1531402 () Bool)

(assert (=> b!1531402 (= e!853269 (not e!853264))))

(declare-fun res!1048724 () Bool)

(assert (=> b!1531402 (=> res!1048724 e!853264)))

(assert (=> b!1531402 (= res!1048724 (or (not (= (select (arr!49048 a!2804) j!70) lt!663053)) (= x!534 resX!21)))))

(assert (=> b!1531402 e!853270))

(declare-fun res!1048717 () Bool)

(assert (=> b!1531402 (=> (not res!1048717) (not e!853270))))

(assert (=> b!1531402 (= res!1048717 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-fun lt!663056 () Unit!51095)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101653 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51095)

(assert (=> b!1531402 (= lt!663056 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1531403 () Bool)

(declare-fun res!1048729 () Bool)

(assert (=> b!1531403 (=> (not res!1048729) (not e!853267))))

(assert (=> b!1531403 (= res!1048729 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49048 a!2804) j!70) a!2804 mask!2512) lt!663054))))

(declare-fun b!1531404 () Bool)

(declare-fun res!1048725 () Bool)

(assert (=> b!1531404 (=> (not res!1048725) (not e!853265))))

(assert (=> b!1531404 (= res!1048725 (and (= (size!49600 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49600 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49600 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1531405 () Bool)

(declare-fun res!1048718 () Bool)

(assert (=> b!1531405 (=> (not res!1048718) (not e!853265))))

(declare-datatypes ((List!35609 0))(
  ( (Nil!35606) (Cons!35605 (h!37051 (_ BitVec 64)) (t!50295 List!35609)) )
))
(declare-fun arrayNoDuplicates!0 (array!101653 (_ BitVec 32) List!35609) Bool)

(assert (=> b!1531405 (= res!1048718 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35606))))

(assert (= (and start!130476 res!1048721) b!1531404))

(assert (= (and b!1531404 res!1048725) b!1531401))

(assert (= (and b!1531401 res!1048728) b!1531395))

(assert (= (and b!1531395 res!1048719) b!1531392))

(assert (= (and b!1531392 res!1048722) b!1531405))

(assert (= (and b!1531405 res!1048718) b!1531398))

(assert (= (and b!1531398 res!1048716) b!1531400))

(assert (= (and b!1531400 res!1048723) b!1531403))

(assert (= (and b!1531403 res!1048729) b!1531397))

(assert (= (and b!1531397 res!1048720) b!1531402))

(assert (= (and b!1531402 res!1048717) b!1531396))

(assert (= (and b!1531402 (not res!1048724)) b!1531394))

(assert (= (and b!1531394 (not res!1048727)) b!1531399))

(assert (= (and b!1531399 (not res!1048726)) b!1531393))

(declare-fun m!1413467 () Bool)

(assert (=> b!1531399 m!1413467))

(assert (=> b!1531399 m!1413467))

(declare-fun m!1413469 () Bool)

(assert (=> b!1531399 m!1413469))

(declare-fun m!1413471 () Bool)

(assert (=> b!1531397 m!1413471))

(assert (=> b!1531397 m!1413471))

(declare-fun m!1413473 () Bool)

(assert (=> b!1531397 m!1413473))

(declare-fun m!1413475 () Bool)

(assert (=> b!1531397 m!1413475))

(declare-fun m!1413477 () Bool)

(assert (=> b!1531397 m!1413477))

(assert (=> b!1531395 m!1413467))

(assert (=> b!1531395 m!1413467))

(declare-fun m!1413479 () Bool)

(assert (=> b!1531395 m!1413479))

(assert (=> b!1531402 m!1413467))

(declare-fun m!1413481 () Bool)

(assert (=> b!1531402 m!1413481))

(declare-fun m!1413483 () Bool)

(assert (=> b!1531402 m!1413483))

(assert (=> b!1531393 m!1413467))

(assert (=> b!1531393 m!1413467))

(declare-fun m!1413485 () Bool)

(assert (=> b!1531393 m!1413485))

(declare-fun m!1413487 () Bool)

(assert (=> b!1531393 m!1413487))

(declare-fun m!1413489 () Bool)

(assert (=> b!1531393 m!1413489))

(declare-fun m!1413491 () Bool)

(assert (=> b!1531392 m!1413491))

(assert (=> b!1531403 m!1413467))

(assert (=> b!1531403 m!1413467))

(declare-fun m!1413493 () Bool)

(assert (=> b!1531403 m!1413493))

(assert (=> b!1531400 m!1413467))

(assert (=> b!1531400 m!1413467))

(declare-fun m!1413495 () Bool)

(assert (=> b!1531400 m!1413495))

(assert (=> b!1531400 m!1413495))

(assert (=> b!1531400 m!1413467))

(declare-fun m!1413497 () Bool)

(assert (=> b!1531400 m!1413497))

(declare-fun m!1413499 () Bool)

(assert (=> b!1531394 m!1413499))

(declare-fun m!1413501 () Bool)

(assert (=> b!1531405 m!1413501))

(assert (=> b!1531396 m!1413467))

(assert (=> b!1531396 m!1413467))

(declare-fun m!1413503 () Bool)

(assert (=> b!1531396 m!1413503))

(declare-fun m!1413505 () Bool)

(assert (=> b!1531401 m!1413505))

(assert (=> b!1531401 m!1413505))

(declare-fun m!1413507 () Bool)

(assert (=> b!1531401 m!1413507))

(declare-fun m!1413509 () Bool)

(assert (=> start!130476 m!1413509))

(declare-fun m!1413511 () Bool)

(assert (=> start!130476 m!1413511))

(check-sat (not b!1531399) (not b!1531392) (not b!1531401) (not start!130476) (not b!1531393) (not b!1531400) (not b!1531396) (not b!1531405) (not b!1531394) (not b!1531395) (not b!1531397) (not b!1531403) (not b!1531402))
(check-sat)
