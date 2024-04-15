; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128894 () Bool)

(assert start!128894)

(declare-fun b!1511263 () Bool)

(declare-fun res!1031376 () Bool)

(declare-fun e!843670 () Bool)

(assert (=> b!1511263 (=> (not res!1031376) (not e!843670))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100750 0))(
  ( (array!100751 (arr!48613 (Array (_ BitVec 32) (_ BitVec 64))) (size!49165 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100750)

(declare-datatypes ((SeekEntryResult!12807 0))(
  ( (MissingZero!12807 (index!53623 (_ BitVec 32))) (Found!12807 (index!53624 (_ BitVec 32))) (Intermediate!12807 (undefined!13619 Bool) (index!53625 (_ BitVec 32)) (x!135359 (_ BitVec 32))) (Undefined!12807) (MissingVacant!12807 (index!53626 (_ BitVec 32))) )
))
(declare-fun lt!655190 () SeekEntryResult!12807)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100750 (_ BitVec 32)) SeekEntryResult!12807)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1511263 (= res!1031376 (= lt!655190 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48613 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48613 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100751 (store (arr!48613 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49165 a!2804)) mask!2512)))))

(declare-fun b!1511264 () Bool)

(declare-fun res!1031378 () Bool)

(declare-fun e!843671 () Bool)

(assert (=> b!1511264 (=> (not res!1031378) (not e!843671))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1511264 (= res!1031378 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49165 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49165 a!2804))))))

(declare-fun b!1511265 () Bool)

(declare-fun e!843672 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100750 (_ BitVec 32)) SeekEntryResult!12807)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100750 (_ BitVec 32)) SeekEntryResult!12807)

(assert (=> b!1511265 (= e!843672 (= (seekEntryOrOpen!0 (select (arr!48613 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48613 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1511266 () Bool)

(declare-fun res!1031384 () Bool)

(assert (=> b!1511266 (=> (not res!1031384) (not e!843671))))

(assert (=> b!1511266 (= res!1031384 (and (= (size!49165 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49165 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49165 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1511267 () Bool)

(assert (=> b!1511267 (= e!843670 (not true))))

(declare-fun e!843669 () Bool)

(assert (=> b!1511267 e!843669))

(declare-fun res!1031374 () Bool)

(assert (=> b!1511267 (=> (not res!1031374) (not e!843669))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100750 (_ BitVec 32)) Bool)

(assert (=> b!1511267 (= res!1031374 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50321 0))(
  ( (Unit!50322) )
))
(declare-fun lt!655189 () Unit!50321)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100750 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50321)

(assert (=> b!1511267 (= lt!655189 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1511268 () Bool)

(declare-fun res!1031381 () Bool)

(assert (=> b!1511268 (=> (not res!1031381) (not e!843671))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1511268 (= res!1031381 (validKeyInArray!0 (select (arr!48613 a!2804) j!70)))))

(declare-fun b!1511269 () Bool)

(assert (=> b!1511269 (= e!843671 e!843670)))

(declare-fun res!1031375 () Bool)

(assert (=> b!1511269 (=> (not res!1031375) (not e!843670))))

(declare-fun lt!655191 () SeekEntryResult!12807)

(assert (=> b!1511269 (= res!1031375 (= lt!655190 lt!655191))))

(assert (=> b!1511269 (= lt!655191 (Intermediate!12807 false resIndex!21 resX!21))))

(assert (=> b!1511269 (= lt!655190 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48613 a!2804) j!70) mask!2512) (select (arr!48613 a!2804) j!70) a!2804 mask!2512))))

(declare-fun res!1031382 () Bool)

(assert (=> start!128894 (=> (not res!1031382) (not e!843671))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128894 (= res!1031382 (validMask!0 mask!2512))))

(assert (=> start!128894 e!843671))

(assert (=> start!128894 true))

(declare-fun array_inv!37846 (array!100750) Bool)

(assert (=> start!128894 (array_inv!37846 a!2804)))

(declare-fun b!1511270 () Bool)

(assert (=> b!1511270 (= e!843669 e!843672)))

(declare-fun res!1031380 () Bool)

(assert (=> b!1511270 (=> res!1031380 e!843672)))

(assert (=> b!1511270 (= res!1031380 (or (not (= (select (arr!48613 a!2804) j!70) (select (store (arr!48613 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48613 a!2804) index!487) (select (arr!48613 a!2804) j!70)) (not (= (select (arr!48613 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1511271 () Bool)

(declare-fun res!1031372 () Bool)

(assert (=> b!1511271 (=> (not res!1031372) (not e!843670))))

(assert (=> b!1511271 (= res!1031372 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48613 a!2804) j!70) a!2804 mask!2512) lt!655191))))

(declare-fun b!1511272 () Bool)

(declare-fun res!1031383 () Bool)

(assert (=> b!1511272 (=> (not res!1031383) (not e!843671))))

(assert (=> b!1511272 (= res!1031383 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1511273 () Bool)

(declare-fun res!1031377 () Bool)

(assert (=> b!1511273 (=> (not res!1031377) (not e!843671))))

(declare-datatypes ((List!35174 0))(
  ( (Nil!35171) (Cons!35170 (h!36583 (_ BitVec 64)) (t!49860 List!35174)) )
))
(declare-fun arrayNoDuplicates!0 (array!100750 (_ BitVec 32) List!35174) Bool)

(assert (=> b!1511273 (= res!1031377 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35171))))

(declare-fun b!1511274 () Bool)

(declare-fun res!1031373 () Bool)

(assert (=> b!1511274 (=> (not res!1031373) (not e!843671))))

(assert (=> b!1511274 (= res!1031373 (validKeyInArray!0 (select (arr!48613 a!2804) i!961)))))

(declare-fun b!1511275 () Bool)

(declare-fun res!1031379 () Bool)

(assert (=> b!1511275 (=> (not res!1031379) (not e!843669))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100750 (_ BitVec 32)) SeekEntryResult!12807)

(assert (=> b!1511275 (= res!1031379 (= (seekEntry!0 (select (arr!48613 a!2804) j!70) a!2804 mask!2512) (Found!12807 j!70)))))

(assert (= (and start!128894 res!1031382) b!1511266))

(assert (= (and b!1511266 res!1031384) b!1511274))

(assert (= (and b!1511274 res!1031373) b!1511268))

(assert (= (and b!1511268 res!1031381) b!1511272))

(assert (= (and b!1511272 res!1031383) b!1511273))

(assert (= (and b!1511273 res!1031377) b!1511264))

(assert (= (and b!1511264 res!1031378) b!1511269))

(assert (= (and b!1511269 res!1031375) b!1511271))

(assert (= (and b!1511271 res!1031372) b!1511263))

(assert (= (and b!1511263 res!1031376) b!1511267))

(assert (= (and b!1511267 res!1031374) b!1511275))

(assert (= (and b!1511275 res!1031379) b!1511270))

(assert (= (and b!1511270 (not res!1031380)) b!1511265))

(declare-fun m!1393403 () Bool)

(assert (=> b!1511263 m!1393403))

(declare-fun m!1393405 () Bool)

(assert (=> b!1511263 m!1393405))

(assert (=> b!1511263 m!1393405))

(declare-fun m!1393407 () Bool)

(assert (=> b!1511263 m!1393407))

(assert (=> b!1511263 m!1393407))

(assert (=> b!1511263 m!1393405))

(declare-fun m!1393409 () Bool)

(assert (=> b!1511263 m!1393409))

(declare-fun m!1393411 () Bool)

(assert (=> b!1511270 m!1393411))

(assert (=> b!1511270 m!1393403))

(assert (=> b!1511270 m!1393405))

(declare-fun m!1393413 () Bool)

(assert (=> b!1511270 m!1393413))

(assert (=> b!1511269 m!1393411))

(assert (=> b!1511269 m!1393411))

(declare-fun m!1393415 () Bool)

(assert (=> b!1511269 m!1393415))

(assert (=> b!1511269 m!1393415))

(assert (=> b!1511269 m!1393411))

(declare-fun m!1393417 () Bool)

(assert (=> b!1511269 m!1393417))

(declare-fun m!1393419 () Bool)

(assert (=> b!1511267 m!1393419))

(declare-fun m!1393421 () Bool)

(assert (=> b!1511267 m!1393421))

(declare-fun m!1393423 () Bool)

(assert (=> start!128894 m!1393423))

(declare-fun m!1393425 () Bool)

(assert (=> start!128894 m!1393425))

(assert (=> b!1511271 m!1393411))

(assert (=> b!1511271 m!1393411))

(declare-fun m!1393427 () Bool)

(assert (=> b!1511271 m!1393427))

(assert (=> b!1511268 m!1393411))

(assert (=> b!1511268 m!1393411))

(declare-fun m!1393429 () Bool)

(assert (=> b!1511268 m!1393429))

(declare-fun m!1393431 () Bool)

(assert (=> b!1511274 m!1393431))

(assert (=> b!1511274 m!1393431))

(declare-fun m!1393433 () Bool)

(assert (=> b!1511274 m!1393433))

(assert (=> b!1511275 m!1393411))

(assert (=> b!1511275 m!1393411))

(declare-fun m!1393435 () Bool)

(assert (=> b!1511275 m!1393435))

(declare-fun m!1393437 () Bool)

(assert (=> b!1511272 m!1393437))

(assert (=> b!1511265 m!1393411))

(assert (=> b!1511265 m!1393411))

(declare-fun m!1393439 () Bool)

(assert (=> b!1511265 m!1393439))

(assert (=> b!1511265 m!1393411))

(declare-fun m!1393441 () Bool)

(assert (=> b!1511265 m!1393441))

(declare-fun m!1393443 () Bool)

(assert (=> b!1511273 m!1393443))

(check-sat (not b!1511272) (not b!1511271) (not b!1511265) (not b!1511274) (not b!1511273) (not b!1511275) (not b!1511268) (not b!1511267) (not start!128894) (not b!1511269) (not b!1511263))
(check-sat)
