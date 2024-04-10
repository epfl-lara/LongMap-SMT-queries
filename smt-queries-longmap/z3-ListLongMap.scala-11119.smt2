; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129880 () Bool)

(assert start!129880)

(declare-fun b!1524370 () Bool)

(declare-fun e!849773 () Bool)

(declare-fun e!849774 () Bool)

(assert (=> b!1524370 (= e!849773 e!849774)))

(declare-fun res!1043032 () Bool)

(assert (=> b!1524370 (=> (not res!1043032) (not e!849774))))

(declare-datatypes ((SeekEntryResult!13104 0))(
  ( (MissingZero!13104 (index!54811 (_ BitVec 32))) (Found!13104 (index!54812 (_ BitVec 32))) (Intermediate!13104 (undefined!13916 Bool) (index!54813 (_ BitVec 32)) (x!136500 (_ BitVec 32))) (Undefined!13104) (MissingVacant!13104 (index!54814 (_ BitVec 32))) )
))
(declare-fun lt!660296 () SeekEntryResult!13104)

(declare-fun lt!660297 () SeekEntryResult!13104)

(assert (=> b!1524370 (= res!1043032 (= lt!660296 lt!660297))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1524370 (= lt!660297 (Intermediate!13104 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101419 0))(
  ( (array!101420 (arr!48939 (Array (_ BitVec 32) (_ BitVec 64))) (size!49489 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101419)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101419 (_ BitVec 32)) SeekEntryResult!13104)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1524370 (= lt!660296 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48939 a!2804) j!70) mask!2512) (select (arr!48939 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1524371 () Bool)

(declare-fun res!1043022 () Bool)

(assert (=> b!1524371 (=> (not res!1043022) (not e!849774))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1524371 (= res!1043022 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48939 a!2804) j!70) a!2804 mask!2512) lt!660297))))

(declare-fun b!1524372 () Bool)

(assert (=> b!1524372 (= e!849774 (not true))))

(declare-fun e!849772 () Bool)

(assert (=> b!1524372 e!849772))

(declare-fun res!1043026 () Bool)

(assert (=> b!1524372 (=> (not res!1043026) (not e!849772))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101419 (_ BitVec 32)) Bool)

(assert (=> b!1524372 (= res!1043026 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50992 0))(
  ( (Unit!50993) )
))
(declare-fun lt!660298 () Unit!50992)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101419 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50992)

(assert (=> b!1524372 (= lt!660298 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1524373 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101419 (_ BitVec 32)) SeekEntryResult!13104)

(assert (=> b!1524373 (= e!849772 (= (seekEntry!0 (select (arr!48939 a!2804) j!70) a!2804 mask!2512) (Found!13104 j!70)))))

(declare-fun b!1524374 () Bool)

(declare-fun res!1043025 () Bool)

(assert (=> b!1524374 (=> (not res!1043025) (not e!849773))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1524374 (= res!1043025 (validKeyInArray!0 (select (arr!48939 a!2804) i!961)))))

(declare-fun b!1524375 () Bool)

(declare-fun res!1043024 () Bool)

(assert (=> b!1524375 (=> (not res!1043024) (not e!849773))))

(assert (=> b!1524375 (= res!1043024 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1524376 () Bool)

(declare-fun res!1043028 () Bool)

(assert (=> b!1524376 (=> (not res!1043028) (not e!849774))))

(assert (=> b!1524376 (= res!1043028 (= lt!660296 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48939 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48939 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101420 (store (arr!48939 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49489 a!2804)) mask!2512)))))

(declare-fun b!1524377 () Bool)

(declare-fun res!1043023 () Bool)

(assert (=> b!1524377 (=> (not res!1043023) (not e!849773))))

(assert (=> b!1524377 (= res!1043023 (and (= (size!49489 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49489 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49489 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1043031 () Bool)

(assert (=> start!129880 (=> (not res!1043031) (not e!849773))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129880 (= res!1043031 (validMask!0 mask!2512))))

(assert (=> start!129880 e!849773))

(assert (=> start!129880 true))

(declare-fun array_inv!37967 (array!101419) Bool)

(assert (=> start!129880 (array_inv!37967 a!2804)))

(declare-fun b!1524378 () Bool)

(declare-fun res!1043029 () Bool)

(assert (=> b!1524378 (=> (not res!1043029) (not e!849773))))

(assert (=> b!1524378 (= res!1043029 (validKeyInArray!0 (select (arr!48939 a!2804) j!70)))))

(declare-fun b!1524379 () Bool)

(declare-fun res!1043030 () Bool)

(assert (=> b!1524379 (=> (not res!1043030) (not e!849773))))

(declare-datatypes ((List!35422 0))(
  ( (Nil!35419) (Cons!35418 (h!36845 (_ BitVec 64)) (t!50116 List!35422)) )
))
(declare-fun arrayNoDuplicates!0 (array!101419 (_ BitVec 32) List!35422) Bool)

(assert (=> b!1524379 (= res!1043030 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35419))))

(declare-fun b!1524380 () Bool)

(declare-fun res!1043027 () Bool)

(assert (=> b!1524380 (=> (not res!1043027) (not e!849773))))

(assert (=> b!1524380 (= res!1043027 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49489 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49489 a!2804))))))

(assert (= (and start!129880 res!1043031) b!1524377))

(assert (= (and b!1524377 res!1043023) b!1524374))

(assert (= (and b!1524374 res!1043025) b!1524378))

(assert (= (and b!1524378 res!1043029) b!1524375))

(assert (= (and b!1524375 res!1043024) b!1524379))

(assert (= (and b!1524379 res!1043030) b!1524380))

(assert (= (and b!1524380 res!1043027) b!1524370))

(assert (= (and b!1524370 res!1043032) b!1524371))

(assert (= (and b!1524371 res!1043022) b!1524376))

(assert (= (and b!1524376 res!1043028) b!1524372))

(assert (= (and b!1524372 res!1043026) b!1524373))

(declare-fun m!1407411 () Bool)

(assert (=> b!1524374 m!1407411))

(assert (=> b!1524374 m!1407411))

(declare-fun m!1407413 () Bool)

(assert (=> b!1524374 m!1407413))

(declare-fun m!1407415 () Bool)

(assert (=> b!1524378 m!1407415))

(assert (=> b!1524378 m!1407415))

(declare-fun m!1407417 () Bool)

(assert (=> b!1524378 m!1407417))

(declare-fun m!1407419 () Bool)

(assert (=> b!1524375 m!1407419))

(declare-fun m!1407421 () Bool)

(assert (=> b!1524372 m!1407421))

(declare-fun m!1407423 () Bool)

(assert (=> b!1524372 m!1407423))

(declare-fun m!1407425 () Bool)

(assert (=> b!1524379 m!1407425))

(assert (=> b!1524370 m!1407415))

(assert (=> b!1524370 m!1407415))

(declare-fun m!1407427 () Bool)

(assert (=> b!1524370 m!1407427))

(assert (=> b!1524370 m!1407427))

(assert (=> b!1524370 m!1407415))

(declare-fun m!1407429 () Bool)

(assert (=> b!1524370 m!1407429))

(declare-fun m!1407431 () Bool)

(assert (=> start!129880 m!1407431))

(declare-fun m!1407433 () Bool)

(assert (=> start!129880 m!1407433))

(assert (=> b!1524371 m!1407415))

(assert (=> b!1524371 m!1407415))

(declare-fun m!1407435 () Bool)

(assert (=> b!1524371 m!1407435))

(assert (=> b!1524373 m!1407415))

(assert (=> b!1524373 m!1407415))

(declare-fun m!1407437 () Bool)

(assert (=> b!1524373 m!1407437))

(declare-fun m!1407439 () Bool)

(assert (=> b!1524376 m!1407439))

(declare-fun m!1407441 () Bool)

(assert (=> b!1524376 m!1407441))

(assert (=> b!1524376 m!1407441))

(declare-fun m!1407443 () Bool)

(assert (=> b!1524376 m!1407443))

(assert (=> b!1524376 m!1407443))

(assert (=> b!1524376 m!1407441))

(declare-fun m!1407445 () Bool)

(assert (=> b!1524376 m!1407445))

(check-sat (not b!1524376) (not b!1524378) (not b!1524372) (not b!1524371) (not b!1524370) (not b!1524373) (not b!1524374) (not start!129880) (not b!1524379) (not b!1524375))
(check-sat)
