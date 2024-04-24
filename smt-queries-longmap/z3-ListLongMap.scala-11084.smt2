; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129692 () Bool)

(assert start!129692)

(declare-fun b!1521488 () Bool)

(declare-fun e!848856 () Bool)

(declare-fun e!848854 () Bool)

(assert (=> b!1521488 (= e!848856 (not e!848854))))

(declare-fun res!1040037 () Bool)

(assert (=> b!1521488 (=> res!1040037 e!848854)))

(declare-fun lt!659434 () (_ BitVec 64))

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((array!101311 0))(
  ( (array!101312 (arr!48886 (Array (_ BitVec 32) (_ BitVec 64))) (size!49437 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101311)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1521488 (= res!1040037 (or (not (= (select (arr!48886 a!2804) j!70) lt!659434)) (= x!534 resX!21)))))

(declare-fun e!848859 () Bool)

(assert (=> b!1521488 e!848859))

(declare-fun res!1040044 () Bool)

(assert (=> b!1521488 (=> (not res!1040044) (not e!848859))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101311 (_ BitVec 32)) Bool)

(assert (=> b!1521488 (= res!1040044 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50803 0))(
  ( (Unit!50804) )
))
(declare-fun lt!659436 () Unit!50803)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101311 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50803)

(assert (=> b!1521488 (= lt!659436 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1521489 () Bool)

(declare-fun res!1040035 () Bool)

(declare-fun e!848858 () Bool)

(assert (=> b!1521489 (=> (not res!1040035) (not e!848858))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1521489 (= res!1040035 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49437 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49437 a!2804))))))

(declare-fun b!1521491 () Bool)

(declare-fun e!848853 () Bool)

(assert (=> b!1521491 (= e!848854 e!848853)))

(declare-fun res!1040033 () Bool)

(assert (=> b!1521491 (=> res!1040033 e!848853)))

(declare-fun lt!659435 () (_ BitVec 32))

(assert (=> b!1521491 (= res!1040033 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!659435 #b00000000000000000000000000000000) (bvsge lt!659435 (size!49437 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1521491 (= lt!659435 (nextIndex!0 index!487 (bvadd #b00000000000000000000000000000001 x!534) mask!2512))))

(declare-fun b!1521492 () Bool)

(declare-fun e!848852 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1521492 (= e!848852 (validKeyInArray!0 lt!659434))))

(declare-fun b!1521493 () Bool)

(declare-fun e!848855 () Bool)

(assert (=> b!1521493 (= e!848855 e!848856)))

(declare-fun res!1040032 () Bool)

(assert (=> b!1521493 (=> (not res!1040032) (not e!848856))))

(declare-datatypes ((SeekEntryResult!12950 0))(
  ( (MissingZero!12950 (index!54195 (_ BitVec 32))) (Found!12950 (index!54196 (_ BitVec 32))) (Intermediate!12950 (undefined!13762 Bool) (index!54197 (_ BitVec 32)) (x!136071 (_ BitVec 32))) (Undefined!12950) (MissingVacant!12950 (index!54198 (_ BitVec 32))) )
))
(declare-fun lt!659433 () SeekEntryResult!12950)

(declare-fun lt!659432 () array!101311)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101311 (_ BitVec 32)) SeekEntryResult!12950)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1521493 (= res!1040032 (= lt!659433 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!659434 mask!2512) lt!659434 lt!659432 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1521493 (= lt!659434 (select (store (arr!48886 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1521493 (= lt!659432 (array!101312 (store (arr!48886 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49437 a!2804)))))

(declare-fun b!1521494 () Bool)

(assert (=> b!1521494 (= e!848853 e!848852)))

(declare-fun res!1040039 () Bool)

(assert (=> b!1521494 (=> res!1040039 e!848852)))

(assert (=> b!1521494 (= res!1040039 (bvslt mask!2512 #b00000000000000000000000000000000))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101311 (_ BitVec 32)) SeekEntryResult!12950)

(assert (=> b!1521494 (= (seekEntryOrOpen!0 (select (arr!48886 a!2804) j!70) a!2804 mask!2512) (seekEntryOrOpen!0 lt!659434 lt!659432 mask!2512))))

(declare-fun lt!659437 () Unit!50803)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!101311 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50803)

(assert (=> b!1521494 (= lt!659437 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2804 i!961 j!70 (bvadd #b00000000000000000000000000000001 x!534) lt!659435 resX!21 resIndex!21 mask!2512))))

(declare-fun b!1521495 () Bool)

(declare-fun res!1040031 () Bool)

(assert (=> b!1521495 (=> (not res!1040031) (not e!848855))))

(declare-fun lt!659431 () SeekEntryResult!12950)

(assert (=> b!1521495 (= res!1040031 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48886 a!2804) j!70) a!2804 mask!2512) lt!659431))))

(declare-fun b!1521496 () Bool)

(declare-fun res!1040042 () Bool)

(assert (=> b!1521496 (=> (not res!1040042) (not e!848858))))

(assert (=> b!1521496 (= res!1040042 (and (= (size!49437 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49437 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49437 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1521497 () Bool)

(declare-fun res!1040036 () Bool)

(assert (=> b!1521497 (=> (not res!1040036) (not e!848858))))

(declare-datatypes ((List!35356 0))(
  ( (Nil!35353) (Cons!35352 (h!36782 (_ BitVec 64)) (t!50042 List!35356)) )
))
(declare-fun arrayNoDuplicates!0 (array!101311 (_ BitVec 32) List!35356) Bool)

(assert (=> b!1521497 (= res!1040036 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35353))))

(declare-fun b!1521498 () Bool)

(declare-fun res!1040043 () Bool)

(assert (=> b!1521498 (=> (not res!1040043) (not e!848858))))

(assert (=> b!1521498 (= res!1040043 (validKeyInArray!0 (select (arr!48886 a!2804) j!70)))))

(declare-fun b!1521490 () Bool)

(assert (=> b!1521490 (= e!848858 e!848855)))

(declare-fun res!1040040 () Bool)

(assert (=> b!1521490 (=> (not res!1040040) (not e!848855))))

(assert (=> b!1521490 (= res!1040040 (= lt!659433 lt!659431))))

(assert (=> b!1521490 (= lt!659431 (Intermediate!12950 false resIndex!21 resX!21))))

(assert (=> b!1521490 (= lt!659433 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48886 a!2804) j!70) mask!2512) (select (arr!48886 a!2804) j!70) a!2804 mask!2512))))

(declare-fun res!1040041 () Bool)

(assert (=> start!129692 (=> (not res!1040041) (not e!848858))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129692 (= res!1040041 (validMask!0 mask!2512))))

(assert (=> start!129692 e!848858))

(assert (=> start!129692 true))

(declare-fun array_inv!38167 (array!101311) Bool)

(assert (=> start!129692 (array_inv!38167 a!2804)))

(declare-fun b!1521499 () Bool)

(declare-fun res!1040034 () Bool)

(assert (=> b!1521499 (=> (not res!1040034) (not e!848858))))

(assert (=> b!1521499 (= res!1040034 (validKeyInArray!0 (select (arr!48886 a!2804) i!961)))))

(declare-fun b!1521500 () Bool)

(declare-fun res!1040045 () Bool)

(assert (=> b!1521500 (=> (not res!1040045) (not e!848858))))

(assert (=> b!1521500 (= res!1040045 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1521501 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101311 (_ BitVec 32)) SeekEntryResult!12950)

(assert (=> b!1521501 (= e!848859 (= (seekEntry!0 (select (arr!48886 a!2804) j!70) a!2804 mask!2512) (Found!12950 j!70)))))

(declare-fun b!1521502 () Bool)

(declare-fun res!1040038 () Bool)

(assert (=> b!1521502 (=> res!1040038 e!848853)))

(assert (=> b!1521502 (= res!1040038 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!659435 (select (arr!48886 a!2804) j!70) a!2804 mask!2512) lt!659431)))))

(assert (= (and start!129692 res!1040041) b!1521496))

(assert (= (and b!1521496 res!1040042) b!1521499))

(assert (= (and b!1521499 res!1040034) b!1521498))

(assert (= (and b!1521498 res!1040043) b!1521500))

(assert (= (and b!1521500 res!1040045) b!1521497))

(assert (= (and b!1521497 res!1040036) b!1521489))

(assert (= (and b!1521489 res!1040035) b!1521490))

(assert (= (and b!1521490 res!1040040) b!1521495))

(assert (= (and b!1521495 res!1040031) b!1521493))

(assert (= (and b!1521493 res!1040032) b!1521488))

(assert (= (and b!1521488 res!1040044) b!1521501))

(assert (= (and b!1521488 (not res!1040037)) b!1521491))

(assert (= (and b!1521491 (not res!1040033)) b!1521502))

(assert (= (and b!1521502 (not res!1040038)) b!1521494))

(assert (= (and b!1521494 (not res!1040039)) b!1521492))

(declare-fun m!1404735 () Bool)

(assert (=> b!1521501 m!1404735))

(assert (=> b!1521501 m!1404735))

(declare-fun m!1404737 () Bool)

(assert (=> b!1521501 m!1404737))

(assert (=> b!1521495 m!1404735))

(assert (=> b!1521495 m!1404735))

(declare-fun m!1404739 () Bool)

(assert (=> b!1521495 m!1404739))

(declare-fun m!1404741 () Bool)

(assert (=> b!1521492 m!1404741))

(declare-fun m!1404743 () Bool)

(assert (=> b!1521500 m!1404743))

(declare-fun m!1404745 () Bool)

(assert (=> b!1521491 m!1404745))

(assert (=> b!1521494 m!1404735))

(assert (=> b!1521494 m!1404735))

(declare-fun m!1404747 () Bool)

(assert (=> b!1521494 m!1404747))

(declare-fun m!1404749 () Bool)

(assert (=> b!1521494 m!1404749))

(declare-fun m!1404751 () Bool)

(assert (=> b!1521494 m!1404751))

(declare-fun m!1404753 () Bool)

(assert (=> b!1521497 m!1404753))

(assert (=> b!1521488 m!1404735))

(declare-fun m!1404755 () Bool)

(assert (=> b!1521488 m!1404755))

(declare-fun m!1404757 () Bool)

(assert (=> b!1521488 m!1404757))

(declare-fun m!1404759 () Bool)

(assert (=> start!129692 m!1404759))

(declare-fun m!1404761 () Bool)

(assert (=> start!129692 m!1404761))

(assert (=> b!1521498 m!1404735))

(assert (=> b!1521498 m!1404735))

(declare-fun m!1404763 () Bool)

(assert (=> b!1521498 m!1404763))

(assert (=> b!1521490 m!1404735))

(assert (=> b!1521490 m!1404735))

(declare-fun m!1404765 () Bool)

(assert (=> b!1521490 m!1404765))

(assert (=> b!1521490 m!1404765))

(assert (=> b!1521490 m!1404735))

(declare-fun m!1404767 () Bool)

(assert (=> b!1521490 m!1404767))

(declare-fun m!1404769 () Bool)

(assert (=> b!1521499 m!1404769))

(assert (=> b!1521499 m!1404769))

(declare-fun m!1404771 () Bool)

(assert (=> b!1521499 m!1404771))

(declare-fun m!1404773 () Bool)

(assert (=> b!1521493 m!1404773))

(assert (=> b!1521493 m!1404773))

(declare-fun m!1404775 () Bool)

(assert (=> b!1521493 m!1404775))

(declare-fun m!1404777 () Bool)

(assert (=> b!1521493 m!1404777))

(declare-fun m!1404779 () Bool)

(assert (=> b!1521493 m!1404779))

(assert (=> b!1521502 m!1404735))

(assert (=> b!1521502 m!1404735))

(declare-fun m!1404781 () Bool)

(assert (=> b!1521502 m!1404781))

(check-sat (not b!1521500) (not b!1521498) (not b!1521492) (not b!1521488) (not b!1521491) (not b!1521494) (not b!1521502) (not b!1521497) (not b!1521499) (not b!1521501) (not b!1521495) (not b!1521490) (not b!1521493) (not start!129692))
(check-sat)
