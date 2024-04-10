; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129022 () Bool)

(assert start!129022)

(declare-fun b!1513111 () Bool)

(declare-fun res!1033017 () Bool)

(declare-fun e!844505 () Bool)

(assert (=> b!1513111 (=> (not res!1033017) (not e!844505))))

(declare-datatypes ((array!100878 0))(
  ( (array!100879 (arr!48676 (Array (_ BitVec 32) (_ BitVec 64))) (size!49226 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100878)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100878 (_ BitVec 32)) Bool)

(assert (=> b!1513111 (= res!1033017 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1513113 () Bool)

(declare-fun res!1033021 () Bool)

(declare-fun e!844506 () Bool)

(assert (=> b!1513113 (=> (not res!1033021) (not e!844506))))

(declare-datatypes ((SeekEntryResult!12847 0))(
  ( (MissingZero!12847 (index!53783 (_ BitVec 32))) (Found!12847 (index!53784 (_ BitVec 32))) (Intermediate!12847 (undefined!13659 Bool) (index!53785 (_ BitVec 32)) (x!135501 (_ BitVec 32))) (Undefined!12847) (MissingVacant!12847 (index!53786 (_ BitVec 32))) )
))
(declare-fun lt!655864 () SeekEntryResult!12847)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100878 (_ BitVec 32)) SeekEntryResult!12847)

(assert (=> b!1513113 (= res!1033021 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48676 a!2804) j!70) a!2804 mask!2512) lt!655864))))

(declare-fun b!1513114 () Bool)

(declare-fun e!844508 () Bool)

(declare-fun e!844509 () Bool)

(assert (=> b!1513114 (= e!844508 e!844509)))

(declare-fun res!1033020 () Bool)

(assert (=> b!1513114 (=> (not res!1033020) (not e!844509))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100878 (_ BitVec 32)) SeekEntryResult!12847)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100878 (_ BitVec 32)) SeekEntryResult!12847)

(assert (=> b!1513114 (= res!1033020 (= (seekEntryOrOpen!0 (select (arr!48676 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48676 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1513115 () Bool)

(declare-fun res!1033022 () Bool)

(assert (=> b!1513115 (=> (not res!1033022) (not e!844505))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1513115 (= res!1033022 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49226 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49226 a!2804))))))

(declare-fun b!1513116 () Bool)

(declare-fun e!844504 () Bool)

(assert (=> b!1513116 (= e!844506 e!844504)))

(declare-fun res!1033015 () Bool)

(assert (=> b!1513116 (=> (not res!1033015) (not e!844504))))

(declare-fun lt!655863 () SeekEntryResult!12847)

(declare-fun lt!655862 () (_ BitVec 64))

(declare-fun lt!655860 () array!100878)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1513116 (= res!1033015 (= lt!655863 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!655862 mask!2512) lt!655862 lt!655860 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1513116 (= lt!655862 (select (store (arr!48676 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1513116 (= lt!655860 (array!100879 (store (arr!48676 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49226 a!2804)))))

(declare-fun b!1513117 () Bool)

(declare-fun res!1033027 () Bool)

(assert (=> b!1513117 (=> (not res!1033027) (not e!844505))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1513117 (= res!1033027 (validKeyInArray!0 (select (arr!48676 a!2804) i!961)))))

(declare-fun b!1513112 () Bool)

(declare-fun res!1033023 () Bool)

(assert (=> b!1513112 (=> (not res!1033023) (not e!844505))))

(assert (=> b!1513112 (= res!1033023 (validKeyInArray!0 (select (arr!48676 a!2804) j!70)))))

(declare-fun res!1033025 () Bool)

(assert (=> start!129022 (=> (not res!1033025) (not e!844505))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129022 (= res!1033025 (validMask!0 mask!2512))))

(assert (=> start!129022 e!844505))

(assert (=> start!129022 true))

(declare-fun array_inv!37704 (array!100878) Bool)

(assert (=> start!129022 (array_inv!37704 a!2804)))

(declare-fun b!1513118 () Bool)

(assert (=> b!1513118 (= e!844505 e!844506)))

(declare-fun res!1033016 () Bool)

(assert (=> b!1513118 (=> (not res!1033016) (not e!844506))))

(assert (=> b!1513118 (= res!1033016 (= lt!655863 lt!655864))))

(assert (=> b!1513118 (= lt!655864 (Intermediate!12847 false resIndex!21 resX!21))))

(assert (=> b!1513118 (= lt!655863 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48676 a!2804) j!70) mask!2512) (select (arr!48676 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1513119 () Bool)

(declare-fun res!1033018 () Bool)

(assert (=> b!1513119 (=> (not res!1033018) (not e!844505))))

(assert (=> b!1513119 (= res!1033018 (and (= (size!49226 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49226 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49226 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1513120 () Bool)

(declare-fun res!1033014 () Bool)

(assert (=> b!1513120 (=> (not res!1033014) (not e!844505))))

(declare-datatypes ((List!35159 0))(
  ( (Nil!35156) (Cons!35155 (h!36567 (_ BitVec 64)) (t!49853 List!35159)) )
))
(declare-fun arrayNoDuplicates!0 (array!100878 (_ BitVec 32) List!35159) Bool)

(assert (=> b!1513120 (= res!1033014 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35156))))

(declare-fun b!1513121 () Bool)

(declare-fun res!1033019 () Bool)

(declare-fun e!844507 () Bool)

(assert (=> b!1513121 (=> (not res!1033019) (not e!844507))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100878 (_ BitVec 32)) SeekEntryResult!12847)

(assert (=> b!1513121 (= res!1033019 (= (seekEntry!0 (select (arr!48676 a!2804) j!70) a!2804 mask!2512) (Found!12847 j!70)))))

(declare-fun b!1513122 () Bool)

(assert (=> b!1513122 (= e!844509 (= (seekEntryOrOpen!0 lt!655862 lt!655860 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!655862 lt!655860 mask!2512)))))

(declare-fun b!1513123 () Bool)

(assert (=> b!1513123 (= e!844504 (not true))))

(assert (=> b!1513123 e!844507))

(declare-fun res!1033024 () Bool)

(assert (=> b!1513123 (=> (not res!1033024) (not e!844507))))

(assert (=> b!1513123 (= res!1033024 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50562 0))(
  ( (Unit!50563) )
))
(declare-fun lt!655861 () Unit!50562)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100878 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50562)

(assert (=> b!1513123 (= lt!655861 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1513124 () Bool)

(assert (=> b!1513124 (= e!844507 e!844508)))

(declare-fun res!1033026 () Bool)

(assert (=> b!1513124 (=> res!1033026 e!844508)))

(assert (=> b!1513124 (= res!1033026 (or (not (= (select (arr!48676 a!2804) j!70) lt!655862)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48676 a!2804) index!487) (select (arr!48676 a!2804) j!70)) (not (= (select (arr!48676 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!129022 res!1033025) b!1513119))

(assert (= (and b!1513119 res!1033018) b!1513117))

(assert (= (and b!1513117 res!1033027) b!1513112))

(assert (= (and b!1513112 res!1033023) b!1513111))

(assert (= (and b!1513111 res!1033017) b!1513120))

(assert (= (and b!1513120 res!1033014) b!1513115))

(assert (= (and b!1513115 res!1033022) b!1513118))

(assert (= (and b!1513118 res!1033016) b!1513113))

(assert (= (and b!1513113 res!1033021) b!1513116))

(assert (= (and b!1513116 res!1033015) b!1513123))

(assert (= (and b!1513123 res!1033024) b!1513121))

(assert (= (and b!1513121 res!1033019) b!1513124))

(assert (= (and b!1513124 (not res!1033026)) b!1513114))

(assert (= (and b!1513114 res!1033020) b!1513122))

(declare-fun m!1395939 () Bool)

(assert (=> b!1513118 m!1395939))

(assert (=> b!1513118 m!1395939))

(declare-fun m!1395941 () Bool)

(assert (=> b!1513118 m!1395941))

(assert (=> b!1513118 m!1395941))

(assert (=> b!1513118 m!1395939))

(declare-fun m!1395943 () Bool)

(assert (=> b!1513118 m!1395943))

(declare-fun m!1395945 () Bool)

(assert (=> b!1513117 m!1395945))

(assert (=> b!1513117 m!1395945))

(declare-fun m!1395947 () Bool)

(assert (=> b!1513117 m!1395947))

(declare-fun m!1395949 () Bool)

(assert (=> start!129022 m!1395949))

(declare-fun m!1395951 () Bool)

(assert (=> start!129022 m!1395951))

(declare-fun m!1395953 () Bool)

(assert (=> b!1513111 m!1395953))

(assert (=> b!1513112 m!1395939))

(assert (=> b!1513112 m!1395939))

(declare-fun m!1395955 () Bool)

(assert (=> b!1513112 m!1395955))

(assert (=> b!1513124 m!1395939))

(declare-fun m!1395957 () Bool)

(assert (=> b!1513124 m!1395957))

(assert (=> b!1513113 m!1395939))

(assert (=> b!1513113 m!1395939))

(declare-fun m!1395959 () Bool)

(assert (=> b!1513113 m!1395959))

(declare-fun m!1395961 () Bool)

(assert (=> b!1513120 m!1395961))

(assert (=> b!1513121 m!1395939))

(assert (=> b!1513121 m!1395939))

(declare-fun m!1395963 () Bool)

(assert (=> b!1513121 m!1395963))

(declare-fun m!1395965 () Bool)

(assert (=> b!1513122 m!1395965))

(declare-fun m!1395967 () Bool)

(assert (=> b!1513122 m!1395967))

(assert (=> b!1513114 m!1395939))

(assert (=> b!1513114 m!1395939))

(declare-fun m!1395969 () Bool)

(assert (=> b!1513114 m!1395969))

(assert (=> b!1513114 m!1395939))

(declare-fun m!1395971 () Bool)

(assert (=> b!1513114 m!1395971))

(declare-fun m!1395973 () Bool)

(assert (=> b!1513116 m!1395973))

(assert (=> b!1513116 m!1395973))

(declare-fun m!1395975 () Bool)

(assert (=> b!1513116 m!1395975))

(declare-fun m!1395977 () Bool)

(assert (=> b!1513116 m!1395977))

(declare-fun m!1395979 () Bool)

(assert (=> b!1513116 m!1395979))

(declare-fun m!1395981 () Bool)

(assert (=> b!1513123 m!1395981))

(declare-fun m!1395983 () Bool)

(assert (=> b!1513123 m!1395983))

(push 1)

