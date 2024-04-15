; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128840 () Bool)

(assert start!128840)

(declare-fun b!1510368 () Bool)

(declare-fun res!1030479 () Bool)

(declare-fun e!843344 () Bool)

(assert (=> b!1510368 (=> (not res!1030479) (not e!843344))))

(declare-datatypes ((array!100696 0))(
  ( (array!100697 (arr!48586 (Array (_ BitVec 32) (_ BitVec 64))) (size!49138 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100696)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100696 (_ BitVec 32)) Bool)

(assert (=> b!1510368 (= res!1030479 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1510369 () Bool)

(declare-fun res!1030482 () Bool)

(assert (=> b!1510369 (=> (not res!1030482) (not e!843344))))

(declare-datatypes ((List!35147 0))(
  ( (Nil!35144) (Cons!35143 (h!36556 (_ BitVec 64)) (t!49833 List!35147)) )
))
(declare-fun arrayNoDuplicates!0 (array!100696 (_ BitVec 32) List!35147) Bool)

(assert (=> b!1510369 (= res!1030482 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35144))))

(declare-fun b!1510370 () Bool)

(declare-fun e!843343 () Bool)

(assert (=> b!1510370 (= e!843344 e!843343)))

(declare-fun res!1030486 () Bool)

(assert (=> b!1510370 (=> (not res!1030486) (not e!843343))))

(declare-datatypes ((SeekEntryResult!12780 0))(
  ( (MissingZero!12780 (index!53515 (_ BitVec 32))) (Found!12780 (index!53516 (_ BitVec 32))) (Intermediate!12780 (undefined!13592 Bool) (index!53517 (_ BitVec 32)) (x!135260 (_ BitVec 32))) (Undefined!12780) (MissingVacant!12780 (index!53518 (_ BitVec 32))) )
))
(declare-fun lt!654947 () SeekEntryResult!12780)

(declare-fun lt!654948 () SeekEntryResult!12780)

(assert (=> b!1510370 (= res!1030486 (= lt!654947 lt!654948))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1510370 (= lt!654948 (Intermediate!12780 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100696 (_ BitVec 32)) SeekEntryResult!12780)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1510370 (= lt!654947 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48586 a!2804) j!70) mask!2512) (select (arr!48586 a!2804) j!70) a!2804 mask!2512))))

(declare-fun res!1030487 () Bool)

(assert (=> start!128840 (=> (not res!1030487) (not e!843344))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128840 (= res!1030487 (validMask!0 mask!2512))))

(assert (=> start!128840 e!843344))

(assert (=> start!128840 true))

(declare-fun array_inv!37819 (array!100696) Bool)

(assert (=> start!128840 (array_inv!37819 a!2804)))

(declare-fun b!1510371 () Bool)

(declare-fun res!1030481 () Bool)

(assert (=> b!1510371 (=> (not res!1030481) (not e!843343))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1510371 (= res!1030481 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48586 a!2804) j!70) a!2804 mask!2512) lt!654948))))

(declare-fun e!843345 () Bool)

(declare-fun b!1510372 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100696 (_ BitVec 32)) SeekEntryResult!12780)

(assert (=> b!1510372 (= e!843345 (= (seekEntry!0 (select (arr!48586 a!2804) j!70) a!2804 mask!2512) (Found!12780 j!70)))))

(declare-fun b!1510373 () Bool)

(declare-fun res!1030484 () Bool)

(assert (=> b!1510373 (=> (not res!1030484) (not e!843344))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1510373 (= res!1030484 (validKeyInArray!0 (select (arr!48586 a!2804) j!70)))))

(declare-fun b!1510374 () Bool)

(declare-fun res!1030477 () Bool)

(assert (=> b!1510374 (=> (not res!1030477) (not e!843344))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1510374 (= res!1030477 (validKeyInArray!0 (select (arr!48586 a!2804) i!961)))))

(declare-fun b!1510375 () Bool)

(declare-fun res!1030485 () Bool)

(assert (=> b!1510375 (=> (not res!1030485) (not e!843344))))

(assert (=> b!1510375 (= res!1030485 (and (= (size!49138 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49138 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49138 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1510376 () Bool)

(declare-fun res!1030483 () Bool)

(assert (=> b!1510376 (=> (not res!1030483) (not e!843343))))

(assert (=> b!1510376 (= res!1030483 (= lt!654947 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48586 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48586 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100697 (store (arr!48586 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49138 a!2804)) mask!2512)))))

(declare-fun b!1510377 () Bool)

(assert (=> b!1510377 (= e!843343 (not true))))

(assert (=> b!1510377 e!843345))

(declare-fun res!1030480 () Bool)

(assert (=> b!1510377 (=> (not res!1030480) (not e!843345))))

(assert (=> b!1510377 (= res!1030480 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50267 0))(
  ( (Unit!50268) )
))
(declare-fun lt!654946 () Unit!50267)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100696 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50267)

(assert (=> b!1510377 (= lt!654946 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1510378 () Bool)

(declare-fun res!1030478 () Bool)

(assert (=> b!1510378 (=> (not res!1030478) (not e!843344))))

(assert (=> b!1510378 (= res!1030478 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49138 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49138 a!2804))))))

(assert (= (and start!128840 res!1030487) b!1510375))

(assert (= (and b!1510375 res!1030485) b!1510374))

(assert (= (and b!1510374 res!1030477) b!1510373))

(assert (= (and b!1510373 res!1030484) b!1510368))

(assert (= (and b!1510368 res!1030479) b!1510369))

(assert (= (and b!1510369 res!1030482) b!1510378))

(assert (= (and b!1510378 res!1030478) b!1510370))

(assert (= (and b!1510370 res!1030486) b!1510371))

(assert (= (and b!1510371 res!1030481) b!1510376))

(assert (= (and b!1510376 res!1030483) b!1510377))

(assert (= (and b!1510377 res!1030480) b!1510372))

(declare-fun m!1392419 () Bool)

(assert (=> b!1510372 m!1392419))

(assert (=> b!1510372 m!1392419))

(declare-fun m!1392421 () Bool)

(assert (=> b!1510372 m!1392421))

(declare-fun m!1392423 () Bool)

(assert (=> start!128840 m!1392423))

(declare-fun m!1392425 () Bool)

(assert (=> start!128840 m!1392425))

(declare-fun m!1392427 () Bool)

(assert (=> b!1510369 m!1392427))

(assert (=> b!1510371 m!1392419))

(assert (=> b!1510371 m!1392419))

(declare-fun m!1392429 () Bool)

(assert (=> b!1510371 m!1392429))

(declare-fun m!1392431 () Bool)

(assert (=> b!1510377 m!1392431))

(declare-fun m!1392433 () Bool)

(assert (=> b!1510377 m!1392433))

(assert (=> b!1510370 m!1392419))

(assert (=> b!1510370 m!1392419))

(declare-fun m!1392435 () Bool)

(assert (=> b!1510370 m!1392435))

(assert (=> b!1510370 m!1392435))

(assert (=> b!1510370 m!1392419))

(declare-fun m!1392437 () Bool)

(assert (=> b!1510370 m!1392437))

(declare-fun m!1392439 () Bool)

(assert (=> b!1510368 m!1392439))

(declare-fun m!1392441 () Bool)

(assert (=> b!1510374 m!1392441))

(assert (=> b!1510374 m!1392441))

(declare-fun m!1392443 () Bool)

(assert (=> b!1510374 m!1392443))

(assert (=> b!1510373 m!1392419))

(assert (=> b!1510373 m!1392419))

(declare-fun m!1392445 () Bool)

(assert (=> b!1510373 m!1392445))

(declare-fun m!1392447 () Bool)

(assert (=> b!1510376 m!1392447))

(declare-fun m!1392449 () Bool)

(assert (=> b!1510376 m!1392449))

(assert (=> b!1510376 m!1392449))

(declare-fun m!1392451 () Bool)

(assert (=> b!1510376 m!1392451))

(assert (=> b!1510376 m!1392451))

(assert (=> b!1510376 m!1392449))

(declare-fun m!1392453 () Bool)

(assert (=> b!1510376 m!1392453))

(check-sat (not b!1510370) (not b!1510373) (not b!1510368) (not b!1510371) (not b!1510377) (not b!1510372) (not b!1510376) (not b!1510374) (not start!128840) (not b!1510369))
(check-sat)
