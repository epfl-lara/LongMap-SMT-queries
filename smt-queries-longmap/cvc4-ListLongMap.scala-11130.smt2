; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130080 () Bool)

(assert start!130080)

(declare-fun b!1526566 () Bool)

(declare-fun e!850899 () Bool)

(declare-fun e!850896 () Bool)

(assert (=> b!1526566 (= e!850899 e!850896)))

(declare-fun res!1044611 () Bool)

(assert (=> b!1526566 (=> (not res!1044611) (not e!850896))))

(declare-datatypes ((array!101493 0))(
  ( (array!101494 (arr!48973 (Array (_ BitVec 32) (_ BitVec 64))) (size!49523 (_ BitVec 32))) )
))
(declare-fun lt!661122 () array!101493)

(declare-fun lt!661119 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!13138 0))(
  ( (MissingZero!13138 (index!54947 (_ BitVec 32))) (Found!13138 (index!54948 (_ BitVec 32))) (Intermediate!13138 (undefined!13950 Bool) (index!54949 (_ BitVec 32)) (x!136640 (_ BitVec 32))) (Undefined!13138) (MissingVacant!13138 (index!54950 (_ BitVec 32))) )
))
(declare-fun lt!661121 () SeekEntryResult!13138)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101493 (_ BitVec 32)) SeekEntryResult!13138)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1526566 (= res!1044611 (= lt!661121 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!661119 mask!2512) lt!661119 lt!661122 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun a!2804 () array!101493)

(assert (=> b!1526566 (= lt!661119 (select (store (arr!48973 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1526566 (= lt!661122 (array!101494 (store (arr!48973 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49523 a!2804)))))

(declare-fun e!850894 () Bool)

(declare-fun b!1526567 () Bool)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101493 (_ BitVec 32)) SeekEntryResult!13138)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101493 (_ BitVec 32)) SeekEntryResult!13138)

(assert (=> b!1526567 (= e!850894 (= (seekEntryOrOpen!0 lt!661119 lt!661122 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!661119 lt!661122 mask!2512)))))

(declare-fun b!1526568 () Bool)

(declare-fun res!1044602 () Bool)

(declare-fun e!850898 () Bool)

(assert (=> b!1526568 (=> (not res!1044602) (not e!850898))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1526568 (= res!1044602 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49523 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49523 a!2804))))))

(declare-fun b!1526569 () Bool)

(declare-fun res!1044609 () Bool)

(assert (=> b!1526569 (=> (not res!1044609) (not e!850898))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1526569 (= res!1044609 (validKeyInArray!0 (select (arr!48973 a!2804) i!961)))))

(declare-fun b!1526570 () Bool)

(assert (=> b!1526570 (= e!850898 e!850899)))

(declare-fun res!1044610 () Bool)

(assert (=> b!1526570 (=> (not res!1044610) (not e!850899))))

(declare-fun lt!661123 () SeekEntryResult!13138)

(assert (=> b!1526570 (= res!1044610 (= lt!661121 lt!661123))))

(assert (=> b!1526570 (= lt!661123 (Intermediate!13138 false resIndex!21 resX!21))))

(assert (=> b!1526570 (= lt!661121 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48973 a!2804) j!70) mask!2512) (select (arr!48973 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1526571 () Bool)

(declare-fun res!1044601 () Bool)

(assert (=> b!1526571 (=> (not res!1044601) (not e!850898))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101493 (_ BitVec 32)) Bool)

(assert (=> b!1526571 (= res!1044601 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1526572 () Bool)

(declare-fun res!1044603 () Bool)

(declare-fun e!850897 () Bool)

(assert (=> b!1526572 (=> (not res!1044603) (not e!850897))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!101493 (_ BitVec 32)) SeekEntryResult!13138)

(assert (=> b!1526572 (= res!1044603 (= (seekEntry!0 (select (arr!48973 a!2804) j!70) a!2804 mask!2512) (Found!13138 j!70)))))

(declare-fun b!1526573 () Bool)

(declare-fun e!850895 () Bool)

(assert (=> b!1526573 (= e!850897 e!850895)))

(declare-fun res!1044608 () Bool)

(assert (=> b!1526573 (=> res!1044608 e!850895)))

(assert (=> b!1526573 (= res!1044608 (or (not (= (select (arr!48973 a!2804) j!70) lt!661119)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48973 a!2804) index!487) (select (arr!48973 a!2804) j!70)) (not (= (select (arr!48973 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1526574 () Bool)

(declare-fun res!1044604 () Bool)

(assert (=> b!1526574 (=> (not res!1044604) (not e!850898))))

(declare-datatypes ((List!35456 0))(
  ( (Nil!35453) (Cons!35452 (h!36885 (_ BitVec 64)) (t!50150 List!35456)) )
))
(declare-fun arrayNoDuplicates!0 (array!101493 (_ BitVec 32) List!35456) Bool)

(assert (=> b!1526574 (= res!1044604 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35453))))

(declare-fun b!1526575 () Bool)

(assert (=> b!1526575 (= e!850895 e!850894)))

(declare-fun res!1044613 () Bool)

(assert (=> b!1526575 (=> (not res!1044613) (not e!850894))))

(assert (=> b!1526575 (= res!1044613 (= (seekEntryOrOpen!0 (select (arr!48973 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48973 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1526576 () Bool)

(declare-fun res!1044612 () Bool)

(assert (=> b!1526576 (=> (not res!1044612) (not e!850898))))

(assert (=> b!1526576 (= res!1044612 (and (= (size!49523 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49523 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49523 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1526577 () Bool)

(assert (=> b!1526577 (= e!850896 (not true))))

(assert (=> b!1526577 e!850897))

(declare-fun res!1044606 () Bool)

(assert (=> b!1526577 (=> (not res!1044606) (not e!850897))))

(assert (=> b!1526577 (= res!1044606 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51060 0))(
  ( (Unit!51061) )
))
(declare-fun lt!661120 () Unit!51060)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101493 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51060)

(assert (=> b!1526577 (= lt!661120 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1526578 () Bool)

(declare-fun res!1044605 () Bool)

(assert (=> b!1526578 (=> (not res!1044605) (not e!850898))))

(assert (=> b!1526578 (= res!1044605 (validKeyInArray!0 (select (arr!48973 a!2804) j!70)))))

(declare-fun res!1044600 () Bool)

(assert (=> start!130080 (=> (not res!1044600) (not e!850898))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130080 (= res!1044600 (validMask!0 mask!2512))))

(assert (=> start!130080 e!850898))

(assert (=> start!130080 true))

(declare-fun array_inv!38001 (array!101493) Bool)

(assert (=> start!130080 (array_inv!38001 a!2804)))

(declare-fun b!1526579 () Bool)

(declare-fun res!1044607 () Bool)

(assert (=> b!1526579 (=> (not res!1044607) (not e!850899))))

(assert (=> b!1526579 (= res!1044607 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48973 a!2804) j!70) a!2804 mask!2512) lt!661123))))

(assert (= (and start!130080 res!1044600) b!1526576))

(assert (= (and b!1526576 res!1044612) b!1526569))

(assert (= (and b!1526569 res!1044609) b!1526578))

(assert (= (and b!1526578 res!1044605) b!1526571))

(assert (= (and b!1526571 res!1044601) b!1526574))

(assert (= (and b!1526574 res!1044604) b!1526568))

(assert (= (and b!1526568 res!1044602) b!1526570))

(assert (= (and b!1526570 res!1044610) b!1526579))

(assert (= (and b!1526579 res!1044607) b!1526566))

(assert (= (and b!1526566 res!1044611) b!1526577))

(assert (= (and b!1526577 res!1044606) b!1526572))

(assert (= (and b!1526572 res!1044603) b!1526573))

(assert (= (and b!1526573 (not res!1044608)) b!1526575))

(assert (= (and b!1526575 res!1044613) b!1526567))

(declare-fun m!1409381 () Bool)

(assert (=> b!1526567 m!1409381))

(declare-fun m!1409383 () Bool)

(assert (=> b!1526567 m!1409383))

(declare-fun m!1409385 () Bool)

(assert (=> b!1526570 m!1409385))

(assert (=> b!1526570 m!1409385))

(declare-fun m!1409387 () Bool)

(assert (=> b!1526570 m!1409387))

(assert (=> b!1526570 m!1409387))

(assert (=> b!1526570 m!1409385))

(declare-fun m!1409389 () Bool)

(assert (=> b!1526570 m!1409389))

(declare-fun m!1409391 () Bool)

(assert (=> b!1526571 m!1409391))

(assert (=> b!1526578 m!1409385))

(assert (=> b!1526578 m!1409385))

(declare-fun m!1409393 () Bool)

(assert (=> b!1526578 m!1409393))

(assert (=> b!1526572 m!1409385))

(assert (=> b!1526572 m!1409385))

(declare-fun m!1409395 () Bool)

(assert (=> b!1526572 m!1409395))

(assert (=> b!1526575 m!1409385))

(assert (=> b!1526575 m!1409385))

(declare-fun m!1409397 () Bool)

(assert (=> b!1526575 m!1409397))

(assert (=> b!1526575 m!1409385))

(declare-fun m!1409399 () Bool)

(assert (=> b!1526575 m!1409399))

(declare-fun m!1409401 () Bool)

(assert (=> b!1526574 m!1409401))

(declare-fun m!1409403 () Bool)

(assert (=> b!1526569 m!1409403))

(assert (=> b!1526569 m!1409403))

(declare-fun m!1409405 () Bool)

(assert (=> b!1526569 m!1409405))

(declare-fun m!1409407 () Bool)

(assert (=> start!130080 m!1409407))

(declare-fun m!1409409 () Bool)

(assert (=> start!130080 m!1409409))

(assert (=> b!1526573 m!1409385))

(declare-fun m!1409411 () Bool)

(assert (=> b!1526573 m!1409411))

(assert (=> b!1526579 m!1409385))

(assert (=> b!1526579 m!1409385))

(declare-fun m!1409413 () Bool)

(assert (=> b!1526579 m!1409413))

(declare-fun m!1409415 () Bool)

(assert (=> b!1526577 m!1409415))

(declare-fun m!1409417 () Bool)

(assert (=> b!1526577 m!1409417))

(declare-fun m!1409419 () Bool)

(assert (=> b!1526566 m!1409419))

(assert (=> b!1526566 m!1409419))

(declare-fun m!1409421 () Bool)

(assert (=> b!1526566 m!1409421))

(declare-fun m!1409423 () Bool)

(assert (=> b!1526566 m!1409423))

(declare-fun m!1409425 () Bool)

(assert (=> b!1526566 m!1409425))

(push 1)

