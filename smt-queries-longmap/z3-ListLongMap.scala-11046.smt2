; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129110 () Bool)

(assert start!129110)

(declare-fun b!1514959 () Bool)

(declare-fun res!1034875 () Bool)

(declare-fun e!845428 () Bool)

(assert (=> b!1514959 (=> (not res!1034875) (not e!845428))))

(declare-datatypes ((array!100966 0))(
  ( (array!100967 (arr!48720 (Array (_ BitVec 32) (_ BitVec 64))) (size!49270 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100966)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100966 (_ BitVec 32)) Bool)

(assert (=> b!1514959 (= res!1034875 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1514960 () Bool)

(declare-fun res!1034868 () Bool)

(assert (=> b!1514960 (=> (not res!1034868) (not e!845428))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1514960 (= res!1034868 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49270 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49270 a!2804))))))

(declare-fun b!1514961 () Bool)

(declare-fun res!1034865 () Bool)

(assert (=> b!1514961 (=> (not res!1034865) (not e!845428))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1514961 (= res!1034865 (and (= (size!49270 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49270 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49270 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1514962 () Bool)

(declare-fun e!845430 () Bool)

(assert (=> b!1514962 (= e!845430 (not true))))

(declare-fun e!845434 () Bool)

(assert (=> b!1514962 e!845434))

(declare-fun res!1034864 () Bool)

(assert (=> b!1514962 (=> (not res!1034864) (not e!845434))))

(assert (=> b!1514962 (= res!1034864 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50650 0))(
  ( (Unit!50651) )
))
(declare-fun lt!656520 () Unit!50650)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100966 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50650)

(assert (=> b!1514962 (= lt!656520 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1514963 () Bool)

(declare-fun e!845431 () Bool)

(assert (=> b!1514963 (= e!845434 e!845431)))

(declare-fun res!1034862 () Bool)

(assert (=> b!1514963 (=> res!1034862 e!845431)))

(declare-fun lt!656522 () (_ BitVec 64))

(assert (=> b!1514963 (= res!1034862 (or (not (= (select (arr!48720 a!2804) j!70) lt!656522)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48720 a!2804) index!487) (select (arr!48720 a!2804) j!70)) (not (= (select (arr!48720 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1514964 () Bool)

(declare-fun e!845429 () Bool)

(assert (=> b!1514964 (= e!845429 e!845430)))

(declare-fun res!1034866 () Bool)

(assert (=> b!1514964 (=> (not res!1034866) (not e!845430))))

(declare-fun lt!656524 () array!100966)

(declare-datatypes ((SeekEntryResult!12891 0))(
  ( (MissingZero!12891 (index!53959 (_ BitVec 32))) (Found!12891 (index!53960 (_ BitVec 32))) (Intermediate!12891 (undefined!13703 Bool) (index!53961 (_ BitVec 32)) (x!135665 (_ BitVec 32))) (Undefined!12891) (MissingVacant!12891 (index!53962 (_ BitVec 32))) )
))
(declare-fun lt!656523 () SeekEntryResult!12891)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100966 (_ BitVec 32)) SeekEntryResult!12891)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1514964 (= res!1034866 (= lt!656523 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!656522 mask!2512) lt!656522 lt!656524 mask!2512)))))

(assert (=> b!1514964 (= lt!656522 (select (store (arr!48720 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1514964 (= lt!656524 (array!100967 (store (arr!48720 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49270 a!2804)))))

(declare-fun b!1514965 () Bool)

(declare-fun res!1034874 () Bool)

(assert (=> b!1514965 (=> (not res!1034874) (not e!845428))))

(declare-datatypes ((List!35203 0))(
  ( (Nil!35200) (Cons!35199 (h!36611 (_ BitVec 64)) (t!49897 List!35203)) )
))
(declare-fun arrayNoDuplicates!0 (array!100966 (_ BitVec 32) List!35203) Bool)

(assert (=> b!1514965 (= res!1034874 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35200))))

(declare-fun b!1514966 () Bool)

(declare-fun res!1034867 () Bool)

(assert (=> b!1514966 (=> (not res!1034867) (not e!845428))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1514966 (= res!1034867 (validKeyInArray!0 (select (arr!48720 a!2804) j!70)))))

(declare-fun b!1514967 () Bool)

(declare-fun e!845432 () Bool)

(assert (=> b!1514967 (= e!845431 e!845432)))

(declare-fun res!1034872 () Bool)

(assert (=> b!1514967 (=> (not res!1034872) (not e!845432))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100966 (_ BitVec 32)) SeekEntryResult!12891)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100966 (_ BitVec 32)) SeekEntryResult!12891)

(assert (=> b!1514967 (= res!1034872 (= (seekEntryOrOpen!0 (select (arr!48720 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48720 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1514968 () Bool)

(assert (=> b!1514968 (= e!845428 e!845429)))

(declare-fun res!1034870 () Bool)

(assert (=> b!1514968 (=> (not res!1034870) (not e!845429))))

(declare-fun lt!656521 () SeekEntryResult!12891)

(assert (=> b!1514968 (= res!1034870 (= lt!656523 lt!656521))))

(assert (=> b!1514968 (= lt!656521 (Intermediate!12891 false resIndex!21 resX!21))))

(assert (=> b!1514968 (= lt!656523 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48720 a!2804) j!70) mask!2512) (select (arr!48720 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1514969 () Bool)

(declare-fun res!1034863 () Bool)

(assert (=> b!1514969 (=> (not res!1034863) (not e!845434))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100966 (_ BitVec 32)) SeekEntryResult!12891)

(assert (=> b!1514969 (= res!1034863 (= (seekEntry!0 (select (arr!48720 a!2804) j!70) a!2804 mask!2512) (Found!12891 j!70)))))

(declare-fun b!1514971 () Bool)

(declare-fun res!1034873 () Bool)

(assert (=> b!1514971 (=> (not res!1034873) (not e!845428))))

(assert (=> b!1514971 (= res!1034873 (validKeyInArray!0 (select (arr!48720 a!2804) i!961)))))

(declare-fun b!1514972 () Bool)

(assert (=> b!1514972 (= e!845432 (= (seekEntryOrOpen!0 lt!656522 lt!656524 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!656522 lt!656524 mask!2512)))))

(declare-fun b!1514970 () Bool)

(declare-fun res!1034871 () Bool)

(assert (=> b!1514970 (=> (not res!1034871) (not e!845429))))

(assert (=> b!1514970 (= res!1034871 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48720 a!2804) j!70) a!2804 mask!2512) lt!656521))))

(declare-fun res!1034869 () Bool)

(assert (=> start!129110 (=> (not res!1034869) (not e!845428))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129110 (= res!1034869 (validMask!0 mask!2512))))

(assert (=> start!129110 e!845428))

(assert (=> start!129110 true))

(declare-fun array_inv!37748 (array!100966) Bool)

(assert (=> start!129110 (array_inv!37748 a!2804)))

(assert (= (and start!129110 res!1034869) b!1514961))

(assert (= (and b!1514961 res!1034865) b!1514971))

(assert (= (and b!1514971 res!1034873) b!1514966))

(assert (= (and b!1514966 res!1034867) b!1514959))

(assert (= (and b!1514959 res!1034875) b!1514965))

(assert (= (and b!1514965 res!1034874) b!1514960))

(assert (= (and b!1514960 res!1034868) b!1514968))

(assert (= (and b!1514968 res!1034870) b!1514970))

(assert (= (and b!1514970 res!1034871) b!1514964))

(assert (= (and b!1514964 res!1034866) b!1514962))

(assert (= (and b!1514962 res!1034864) b!1514969))

(assert (= (and b!1514969 res!1034863) b!1514963))

(assert (= (and b!1514963 (not res!1034862)) b!1514967))

(assert (= (and b!1514967 res!1034872) b!1514972))

(declare-fun m!1397963 () Bool)

(assert (=> b!1514968 m!1397963))

(assert (=> b!1514968 m!1397963))

(declare-fun m!1397965 () Bool)

(assert (=> b!1514968 m!1397965))

(assert (=> b!1514968 m!1397965))

(assert (=> b!1514968 m!1397963))

(declare-fun m!1397967 () Bool)

(assert (=> b!1514968 m!1397967))

(declare-fun m!1397969 () Bool)

(assert (=> b!1514972 m!1397969))

(declare-fun m!1397971 () Bool)

(assert (=> b!1514972 m!1397971))

(declare-fun m!1397973 () Bool)

(assert (=> b!1514964 m!1397973))

(assert (=> b!1514964 m!1397973))

(declare-fun m!1397975 () Bool)

(assert (=> b!1514964 m!1397975))

(declare-fun m!1397977 () Bool)

(assert (=> b!1514964 m!1397977))

(declare-fun m!1397979 () Bool)

(assert (=> b!1514964 m!1397979))

(declare-fun m!1397981 () Bool)

(assert (=> start!129110 m!1397981))

(declare-fun m!1397983 () Bool)

(assert (=> start!129110 m!1397983))

(assert (=> b!1514969 m!1397963))

(assert (=> b!1514969 m!1397963))

(declare-fun m!1397985 () Bool)

(assert (=> b!1514969 m!1397985))

(assert (=> b!1514963 m!1397963))

(declare-fun m!1397987 () Bool)

(assert (=> b!1514963 m!1397987))

(declare-fun m!1397989 () Bool)

(assert (=> b!1514959 m!1397989))

(assert (=> b!1514966 m!1397963))

(assert (=> b!1514966 m!1397963))

(declare-fun m!1397991 () Bool)

(assert (=> b!1514966 m!1397991))

(assert (=> b!1514970 m!1397963))

(assert (=> b!1514970 m!1397963))

(declare-fun m!1397993 () Bool)

(assert (=> b!1514970 m!1397993))

(declare-fun m!1397995 () Bool)

(assert (=> b!1514971 m!1397995))

(assert (=> b!1514971 m!1397995))

(declare-fun m!1397997 () Bool)

(assert (=> b!1514971 m!1397997))

(assert (=> b!1514967 m!1397963))

(assert (=> b!1514967 m!1397963))

(declare-fun m!1397999 () Bool)

(assert (=> b!1514967 m!1397999))

(assert (=> b!1514967 m!1397963))

(declare-fun m!1398001 () Bool)

(assert (=> b!1514967 m!1398001))

(declare-fun m!1398003 () Bool)

(assert (=> b!1514962 m!1398003))

(declare-fun m!1398005 () Bool)

(assert (=> b!1514962 m!1398005))

(declare-fun m!1398007 () Bool)

(assert (=> b!1514965 m!1398007))

(check-sat (not b!1514966) (not b!1514968) (not b!1514962) (not start!129110) (not b!1514970) (not b!1514967) (not b!1514964) (not b!1514969) (not b!1514965) (not b!1514959) (not b!1514972) (not b!1514971))
(check-sat)
