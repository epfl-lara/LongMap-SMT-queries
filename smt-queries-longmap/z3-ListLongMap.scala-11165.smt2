; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130534 () Bool)

(assert start!130534)

(declare-fun b!1531873 () Bool)

(declare-fun e!853550 () Bool)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101713 0))(
  ( (array!101714 (arr!49077 (Array (_ BitVec 32) (_ BitVec 64))) (size!49627 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101713)

(declare-datatypes ((SeekEntryResult!13242 0))(
  ( (MissingZero!13242 (index!55363 (_ BitVec 32))) (Found!13242 (index!55364 (_ BitVec 32))) (Intermediate!13242 (undefined!14054 Bool) (index!55365 (_ BitVec 32)) (x!137060 (_ BitVec 32))) (Undefined!13242) (MissingVacant!13242 (index!55366 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101713 (_ BitVec 32)) SeekEntryResult!13242)

(assert (=> b!1531873 (= e!853550 (= (seekEntry!0 (select (arr!49077 a!2804) j!70) a!2804 mask!2512) (Found!13242 j!70)))))

(declare-fun b!1531874 () Bool)

(declare-fun e!853551 () Bool)

(assert (=> b!1531874 (= e!853551 true)))

(declare-fun lt!663423 () array!101713)

(declare-fun lt!663421 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101713 (_ BitVec 32)) SeekEntryResult!13242)

(assert (=> b!1531874 (= (seekEntryOrOpen!0 (select (arr!49077 a!2804) j!70) a!2804 mask!2512) (seekEntryOrOpen!0 lt!663421 lt!663423 mask!2512))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((Unit!51268 0))(
  ( (Unit!51269) )
))
(declare-fun lt!663425 () Unit!51268)

(declare-fun lt!663427 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!101713 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51268)

(assert (=> b!1531874 (= lt!663425 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2804 i!961 j!70 (bvadd #b00000000000000000000000000000001 x!534) lt!663427 resX!21 resIndex!21 mask!2512))))

(declare-fun res!1049022 () Bool)

(declare-fun e!853547 () Bool)

(assert (=> start!130534 (=> (not res!1049022) (not e!853547))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130534 (= res!1049022 (validMask!0 mask!2512))))

(assert (=> start!130534 e!853547))

(assert (=> start!130534 true))

(declare-fun array_inv!38105 (array!101713) Bool)

(assert (=> start!130534 (array_inv!38105 a!2804)))

(declare-fun b!1531875 () Bool)

(declare-fun e!853548 () Bool)

(declare-fun e!853552 () Bool)

(assert (=> b!1531875 (= e!853548 e!853552)))

(declare-fun res!1049018 () Bool)

(assert (=> b!1531875 (=> (not res!1049018) (not e!853552))))

(declare-fun lt!663424 () SeekEntryResult!13242)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101713 (_ BitVec 32)) SeekEntryResult!13242)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1531875 (= res!1049018 (= lt!663424 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!663421 mask!2512) lt!663421 lt!663423 mask!2512)))))

(assert (=> b!1531875 (= lt!663421 (select (store (arr!49077 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1531875 (= lt!663423 (array!101714 (store (arr!49077 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49627 a!2804)))))

(declare-fun b!1531876 () Bool)

(declare-fun res!1049015 () Bool)

(assert (=> b!1531876 (=> (not res!1049015) (not e!853548))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun lt!663426 () SeekEntryResult!13242)

(assert (=> b!1531876 (= res!1049015 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49077 a!2804) j!70) a!2804 mask!2512) lt!663426))))

(declare-fun b!1531877 () Bool)

(declare-fun res!1049014 () Bool)

(assert (=> b!1531877 (=> (not res!1049014) (not e!853547))))

(assert (=> b!1531877 (= res!1049014 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49627 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49627 a!2804))))))

(declare-fun b!1531878 () Bool)

(declare-fun e!853549 () Bool)

(assert (=> b!1531878 (= e!853549 e!853551)))

(declare-fun res!1049017 () Bool)

(assert (=> b!1531878 (=> res!1049017 e!853551)))

(assert (=> b!1531878 (= res!1049017 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!663427 #b00000000000000000000000000000000) (bvsge lt!663427 (size!49627 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1531878 (= lt!663427 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1531879 () Bool)

(assert (=> b!1531879 (= e!853547 e!853548)))

(declare-fun res!1049024 () Bool)

(assert (=> b!1531879 (=> (not res!1049024) (not e!853548))))

(assert (=> b!1531879 (= res!1049024 (= lt!663424 lt!663426))))

(assert (=> b!1531879 (= lt!663426 (Intermediate!13242 false resIndex!21 resX!21))))

(assert (=> b!1531879 (= lt!663424 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49077 a!2804) j!70) mask!2512) (select (arr!49077 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1531880 () Bool)

(declare-fun res!1049026 () Bool)

(assert (=> b!1531880 (=> res!1049026 e!853551)))

(assert (=> b!1531880 (= res!1049026 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!663427 (select (arr!49077 a!2804) j!70) a!2804 mask!2512) lt!663426)))))

(declare-fun b!1531881 () Bool)

(declare-fun res!1049013 () Bool)

(assert (=> b!1531881 (=> (not res!1049013) (not e!853547))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1531881 (= res!1049013 (validKeyInArray!0 (select (arr!49077 a!2804) i!961)))))

(declare-fun b!1531882 () Bool)

(declare-fun res!1049020 () Bool)

(assert (=> b!1531882 (=> (not res!1049020) (not e!853547))))

(declare-datatypes ((List!35560 0))(
  ( (Nil!35557) (Cons!35556 (h!37001 (_ BitVec 64)) (t!50254 List!35560)) )
))
(declare-fun arrayNoDuplicates!0 (array!101713 (_ BitVec 32) List!35560) Bool)

(assert (=> b!1531882 (= res!1049020 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35557))))

(declare-fun b!1531883 () Bool)

(declare-fun res!1049016 () Bool)

(assert (=> b!1531883 (=> (not res!1049016) (not e!853547))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101713 (_ BitVec 32)) Bool)

(assert (=> b!1531883 (= res!1049016 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1531884 () Bool)

(assert (=> b!1531884 (= e!853552 (not e!853549))))

(declare-fun res!1049025 () Bool)

(assert (=> b!1531884 (=> res!1049025 e!853549)))

(assert (=> b!1531884 (= res!1049025 (or (not (= (select (arr!49077 a!2804) j!70) lt!663421)) (= x!534 resX!21)))))

(assert (=> b!1531884 e!853550))

(declare-fun res!1049019 () Bool)

(assert (=> b!1531884 (=> (not res!1049019) (not e!853550))))

(assert (=> b!1531884 (= res!1049019 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-fun lt!663422 () Unit!51268)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101713 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51268)

(assert (=> b!1531884 (= lt!663422 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1531885 () Bool)

(declare-fun res!1049023 () Bool)

(assert (=> b!1531885 (=> (not res!1049023) (not e!853547))))

(assert (=> b!1531885 (= res!1049023 (and (= (size!49627 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49627 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49627 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1531886 () Bool)

(declare-fun res!1049021 () Bool)

(assert (=> b!1531886 (=> (not res!1049021) (not e!853547))))

(assert (=> b!1531886 (= res!1049021 (validKeyInArray!0 (select (arr!49077 a!2804) j!70)))))

(assert (= (and start!130534 res!1049022) b!1531885))

(assert (= (and b!1531885 res!1049023) b!1531881))

(assert (= (and b!1531881 res!1049013) b!1531886))

(assert (= (and b!1531886 res!1049021) b!1531883))

(assert (= (and b!1531883 res!1049016) b!1531882))

(assert (= (and b!1531882 res!1049020) b!1531877))

(assert (= (and b!1531877 res!1049014) b!1531879))

(assert (= (and b!1531879 res!1049024) b!1531876))

(assert (= (and b!1531876 res!1049015) b!1531875))

(assert (= (and b!1531875 res!1049018) b!1531884))

(assert (= (and b!1531884 res!1049019) b!1531873))

(assert (= (and b!1531884 (not res!1049025)) b!1531878))

(assert (= (and b!1531878 (not res!1049017)) b!1531880))

(assert (= (and b!1531880 (not res!1049026)) b!1531874))

(declare-fun m!1414543 () Bool)

(assert (=> b!1531875 m!1414543))

(assert (=> b!1531875 m!1414543))

(declare-fun m!1414545 () Bool)

(assert (=> b!1531875 m!1414545))

(declare-fun m!1414547 () Bool)

(assert (=> b!1531875 m!1414547))

(declare-fun m!1414549 () Bool)

(assert (=> b!1531875 m!1414549))

(declare-fun m!1414551 () Bool)

(assert (=> b!1531873 m!1414551))

(assert (=> b!1531873 m!1414551))

(declare-fun m!1414553 () Bool)

(assert (=> b!1531873 m!1414553))

(declare-fun m!1414555 () Bool)

(assert (=> b!1531881 m!1414555))

(assert (=> b!1531881 m!1414555))

(declare-fun m!1414557 () Bool)

(assert (=> b!1531881 m!1414557))

(assert (=> b!1531874 m!1414551))

(assert (=> b!1531874 m!1414551))

(declare-fun m!1414559 () Bool)

(assert (=> b!1531874 m!1414559))

(declare-fun m!1414561 () Bool)

(assert (=> b!1531874 m!1414561))

(declare-fun m!1414563 () Bool)

(assert (=> b!1531874 m!1414563))

(assert (=> b!1531876 m!1414551))

(assert (=> b!1531876 m!1414551))

(declare-fun m!1414565 () Bool)

(assert (=> b!1531876 m!1414565))

(assert (=> b!1531886 m!1414551))

(assert (=> b!1531886 m!1414551))

(declare-fun m!1414567 () Bool)

(assert (=> b!1531886 m!1414567))

(assert (=> b!1531880 m!1414551))

(assert (=> b!1531880 m!1414551))

(declare-fun m!1414569 () Bool)

(assert (=> b!1531880 m!1414569))

(declare-fun m!1414571 () Bool)

(assert (=> b!1531882 m!1414571))

(declare-fun m!1414573 () Bool)

(assert (=> start!130534 m!1414573))

(declare-fun m!1414575 () Bool)

(assert (=> start!130534 m!1414575))

(assert (=> b!1531884 m!1414551))

(declare-fun m!1414577 () Bool)

(assert (=> b!1531884 m!1414577))

(declare-fun m!1414579 () Bool)

(assert (=> b!1531884 m!1414579))

(assert (=> b!1531879 m!1414551))

(assert (=> b!1531879 m!1414551))

(declare-fun m!1414581 () Bool)

(assert (=> b!1531879 m!1414581))

(assert (=> b!1531879 m!1414581))

(assert (=> b!1531879 m!1414551))

(declare-fun m!1414583 () Bool)

(assert (=> b!1531879 m!1414583))

(declare-fun m!1414585 () Bool)

(assert (=> b!1531878 m!1414585))

(declare-fun m!1414587 () Bool)

(assert (=> b!1531883 m!1414587))

(check-sat (not b!1531883) (not b!1531876) (not b!1531881) (not b!1531873) (not b!1531879) (not b!1531880) (not b!1531886) (not start!130534) (not b!1531882) (not b!1531874) (not b!1531875) (not b!1531884) (not b!1531878))
(check-sat)
