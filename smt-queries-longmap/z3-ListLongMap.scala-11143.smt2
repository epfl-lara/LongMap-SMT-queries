; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130602 () Bool)

(assert start!130602)

(declare-fun b!1530800 () Bool)

(declare-fun e!853340 () Bool)

(assert (=> b!1530800 (= e!853340 true)))

(declare-datatypes ((SeekEntryResult!13121 0))(
  ( (MissingZero!13121 (index!54879 (_ BitVec 32))) (Found!13121 (index!54880 (_ BitVec 32))) (Intermediate!13121 (undefined!13933 Bool) (index!54881 (_ BitVec 32)) (x!136783 (_ BitVec 32))) (Undefined!13121) (MissingVacant!13121 (index!54882 (_ BitVec 32))) )
))
(declare-fun lt!662916 () SeekEntryResult!13121)

(declare-fun lt!662911 () SeekEntryResult!13121)

(assert (=> b!1530800 (= lt!662916 lt!662911)))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!101689 0))(
  ( (array!101690 (arr!49063 (Array (_ BitVec 32) (_ BitVec 64))) (size!49614 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101689)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((Unit!51061 0))(
  ( (Unit!51062) )
))
(declare-fun lt!662915 () Unit!51061)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!101689 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51061)

(assert (=> b!1530800 (= lt!662915 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2804 i!961 j!70 x!534 index!487 index!487 mask!2512))))

(declare-fun b!1530801 () Bool)

(declare-fun res!1047029 () Bool)

(declare-fun e!853339 () Bool)

(assert (=> b!1530801 (=> (not res!1047029) (not e!853339))))

(declare-fun lt!662909 () SeekEntryResult!13121)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101689 (_ BitVec 32)) SeekEntryResult!13121)

(assert (=> b!1530801 (= res!1047029 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49063 a!2804) j!70) a!2804 mask!2512) lt!662909))))

(declare-fun b!1530802 () Bool)

(declare-fun e!853338 () Bool)

(assert (=> b!1530802 (= e!853339 e!853338)))

(declare-fun res!1047026 () Bool)

(assert (=> b!1530802 (=> (not res!1047026) (not e!853338))))

(declare-fun lt!662908 () (_ BitVec 64))

(declare-fun lt!662910 () SeekEntryResult!13121)

(declare-fun lt!662907 () array!101689)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1530802 (= res!1047026 (= lt!662910 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!662908 mask!2512) lt!662908 lt!662907 mask!2512)))))

(assert (=> b!1530802 (= lt!662908 (select (store (arr!49063 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1530802 (= lt!662907 (array!101690 (store (arr!49063 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49614 a!2804)))))

(declare-fun res!1047024 () Bool)

(declare-fun e!853336 () Bool)

(assert (=> start!130602 (=> (not res!1047024) (not e!853336))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130602 (= res!1047024 (validMask!0 mask!2512))))

(assert (=> start!130602 e!853336))

(assert (=> start!130602 true))

(declare-fun array_inv!38344 (array!101689) Bool)

(assert (=> start!130602 (array_inv!38344 a!2804)))

(declare-fun b!1530803 () Bool)

(declare-fun e!853341 () Bool)

(assert (=> b!1530803 (= e!853338 (not e!853341))))

(declare-fun res!1047030 () Bool)

(assert (=> b!1530803 (=> res!1047030 e!853341)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1530803 (= res!1047030 (or (not (= (select (arr!49063 a!2804) j!70) lt!662908)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!49063 a!2804) index!487) (select (arr!49063 a!2804) j!70)) (not (= (select (arr!49063 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!853342 () Bool)

(assert (=> b!1530803 e!853342))

(declare-fun res!1047021 () Bool)

(assert (=> b!1530803 (=> (not res!1047021) (not e!853342))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101689 (_ BitVec 32)) Bool)

(assert (=> b!1530803 (= res!1047021 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-fun lt!662913 () Unit!51061)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101689 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51061)

(assert (=> b!1530803 (= lt!662913 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1530804 () Bool)

(declare-fun res!1047022 () Bool)

(assert (=> b!1530804 (=> (not res!1047022) (not e!853336))))

(declare-datatypes ((List!35533 0))(
  ( (Nil!35530) (Cons!35529 (h!36983 (_ BitVec 64)) (t!50219 List!35533)) )
))
(declare-fun arrayNoDuplicates!0 (array!101689 (_ BitVec 32) List!35533) Bool)

(assert (=> b!1530804 (= res!1047022 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35530))))

(declare-fun b!1530805 () Bool)

(declare-fun res!1047031 () Bool)

(assert (=> b!1530805 (=> (not res!1047031) (not e!853336))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1530805 (= res!1047031 (validKeyInArray!0 (select (arr!49063 a!2804) j!70)))))

(declare-fun b!1530806 () Bool)

(assert (=> b!1530806 (= e!853341 e!853340)))

(declare-fun res!1047025 () Bool)

(assert (=> b!1530806 (=> res!1047025 e!853340)))

(assert (=> b!1530806 (= res!1047025 (not (= lt!662911 (Found!13121 j!70))))))

(declare-fun lt!662914 () SeekEntryResult!13121)

(assert (=> b!1530806 (= lt!662914 lt!662916)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101689 (_ BitVec 32)) SeekEntryResult!13121)

(assert (=> b!1530806 (= lt!662916 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!662908 lt!662907 mask!2512))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101689 (_ BitVec 32)) SeekEntryResult!13121)

(assert (=> b!1530806 (= lt!662914 (seekEntryOrOpen!0 lt!662908 lt!662907 mask!2512))))

(declare-fun lt!662912 () SeekEntryResult!13121)

(assert (=> b!1530806 (= lt!662912 lt!662911)))

(assert (=> b!1530806 (= lt!662911 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!49063 a!2804) j!70) a!2804 mask!2512))))

(assert (=> b!1530806 (= lt!662912 (seekEntryOrOpen!0 (select (arr!49063 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1530807 () Bool)

(declare-fun res!1047027 () Bool)

(assert (=> b!1530807 (=> (not res!1047027) (not e!853336))))

(assert (=> b!1530807 (= res!1047027 (validKeyInArray!0 (select (arr!49063 a!2804) i!961)))))

(declare-fun b!1530808 () Bool)

(declare-fun res!1047028 () Bool)

(assert (=> b!1530808 (=> (not res!1047028) (not e!853336))))

(assert (=> b!1530808 (= res!1047028 (and (= (size!49614 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49614 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49614 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1530809 () Bool)

(assert (=> b!1530809 (= e!853336 e!853339)))

(declare-fun res!1047033 () Bool)

(assert (=> b!1530809 (=> (not res!1047033) (not e!853339))))

(assert (=> b!1530809 (= res!1047033 (= lt!662910 lt!662909))))

(assert (=> b!1530809 (= lt!662909 (Intermediate!13121 false resIndex!21 resX!21))))

(assert (=> b!1530809 (= lt!662910 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49063 a!2804) j!70) mask!2512) (select (arr!49063 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1530810 () Bool)

(declare-fun res!1047023 () Bool)

(assert (=> b!1530810 (=> (not res!1047023) (not e!853336))))

(assert (=> b!1530810 (= res!1047023 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49614 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49614 a!2804))))))

(declare-fun b!1530811 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101689 (_ BitVec 32)) SeekEntryResult!13121)

(assert (=> b!1530811 (= e!853342 (= (seekEntry!0 (select (arr!49063 a!2804) j!70) a!2804 mask!2512) (Found!13121 j!70)))))

(declare-fun b!1530812 () Bool)

(declare-fun res!1047032 () Bool)

(assert (=> b!1530812 (=> (not res!1047032) (not e!853336))))

(assert (=> b!1530812 (= res!1047032 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(assert (= (and start!130602 res!1047024) b!1530808))

(assert (= (and b!1530808 res!1047028) b!1530807))

(assert (= (and b!1530807 res!1047027) b!1530805))

(assert (= (and b!1530805 res!1047031) b!1530812))

(assert (= (and b!1530812 res!1047032) b!1530804))

(assert (= (and b!1530804 res!1047022) b!1530810))

(assert (= (and b!1530810 res!1047023) b!1530809))

(assert (= (and b!1530809 res!1047033) b!1530801))

(assert (= (and b!1530801 res!1047029) b!1530802))

(assert (= (and b!1530802 res!1047026) b!1530803))

(assert (= (and b!1530803 res!1047021) b!1530811))

(assert (= (and b!1530803 (not res!1047030)) b!1530806))

(assert (= (and b!1530806 (not res!1047025)) b!1530800))

(declare-fun m!1413499 () Bool)

(assert (=> b!1530806 m!1413499))

(declare-fun m!1413501 () Bool)

(assert (=> b!1530806 m!1413501))

(assert (=> b!1530806 m!1413499))

(declare-fun m!1413503 () Bool)

(assert (=> b!1530806 m!1413503))

(declare-fun m!1413505 () Bool)

(assert (=> b!1530806 m!1413505))

(assert (=> b!1530806 m!1413499))

(declare-fun m!1413507 () Bool)

(assert (=> b!1530806 m!1413507))

(declare-fun m!1413509 () Bool)

(assert (=> start!130602 m!1413509))

(declare-fun m!1413511 () Bool)

(assert (=> start!130602 m!1413511))

(assert (=> b!1530809 m!1413499))

(assert (=> b!1530809 m!1413499))

(declare-fun m!1413513 () Bool)

(assert (=> b!1530809 m!1413513))

(assert (=> b!1530809 m!1413513))

(assert (=> b!1530809 m!1413499))

(declare-fun m!1413515 () Bool)

(assert (=> b!1530809 m!1413515))

(declare-fun m!1413517 () Bool)

(assert (=> b!1530802 m!1413517))

(assert (=> b!1530802 m!1413517))

(declare-fun m!1413519 () Bool)

(assert (=> b!1530802 m!1413519))

(declare-fun m!1413521 () Bool)

(assert (=> b!1530802 m!1413521))

(declare-fun m!1413523 () Bool)

(assert (=> b!1530802 m!1413523))

(declare-fun m!1413525 () Bool)

(assert (=> b!1530800 m!1413525))

(declare-fun m!1413527 () Bool)

(assert (=> b!1530807 m!1413527))

(assert (=> b!1530807 m!1413527))

(declare-fun m!1413529 () Bool)

(assert (=> b!1530807 m!1413529))

(assert (=> b!1530803 m!1413499))

(declare-fun m!1413531 () Bool)

(assert (=> b!1530803 m!1413531))

(declare-fun m!1413533 () Bool)

(assert (=> b!1530803 m!1413533))

(declare-fun m!1413535 () Bool)

(assert (=> b!1530803 m!1413535))

(assert (=> b!1530805 m!1413499))

(assert (=> b!1530805 m!1413499))

(declare-fun m!1413537 () Bool)

(assert (=> b!1530805 m!1413537))

(assert (=> b!1530801 m!1413499))

(assert (=> b!1530801 m!1413499))

(declare-fun m!1413539 () Bool)

(assert (=> b!1530801 m!1413539))

(declare-fun m!1413541 () Bool)

(assert (=> b!1530812 m!1413541))

(assert (=> b!1530811 m!1413499))

(assert (=> b!1530811 m!1413499))

(declare-fun m!1413543 () Bool)

(assert (=> b!1530811 m!1413543))

(declare-fun m!1413545 () Bool)

(assert (=> b!1530804 m!1413545))

(check-sat (not b!1530811) (not b!1530812) (not b!1530804) (not b!1530807) (not b!1530805) (not b!1530806) (not b!1530809) (not b!1530800) (not start!130602) (not b!1530801) (not b!1530802) (not b!1530803))
(check-sat)
