; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130062 () Bool)

(assert start!130062)

(declare-fun b!1526188 () Bool)

(declare-fun res!1044230 () Bool)

(declare-fun e!850707 () Bool)

(assert (=> b!1526188 (=> (not res!1044230) (not e!850707))))

(declare-datatypes ((array!101475 0))(
  ( (array!101476 (arr!48964 (Array (_ BitVec 32) (_ BitVec 64))) (size!49514 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101475)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1526188 (= res!1044230 (validKeyInArray!0 (select (arr!48964 a!2804) j!70)))))

(declare-fun res!1044222 () Bool)

(assert (=> start!130062 (=> (not res!1044222) (not e!850707))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130062 (= res!1044222 (validMask!0 mask!2512))))

(assert (=> start!130062 e!850707))

(assert (=> start!130062 true))

(declare-fun array_inv!37992 (array!101475) Bool)

(assert (=> start!130062 (array_inv!37992 a!2804)))

(declare-fun b!1526189 () Bool)

(declare-fun e!850708 () Bool)

(declare-fun e!850710 () Bool)

(assert (=> b!1526189 (= e!850708 e!850710)))

(declare-fun res!1044228 () Bool)

(assert (=> b!1526189 (=> (not res!1044228) (not e!850710))))

(declare-datatypes ((SeekEntryResult!13129 0))(
  ( (MissingZero!13129 (index!54911 (_ BitVec 32))) (Found!13129 (index!54912 (_ BitVec 32))) (Intermediate!13129 (undefined!13941 Bool) (index!54913 (_ BitVec 32)) (x!136607 (_ BitVec 32))) (Undefined!13129) (MissingVacant!13129 (index!54914 (_ BitVec 32))) )
))
(declare-fun lt!660988 () SeekEntryResult!13129)

(declare-fun lt!660984 () (_ BitVec 64))

(declare-fun lt!660986 () array!101475)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101475 (_ BitVec 32)) SeekEntryResult!13129)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1526189 (= res!1044228 (= lt!660988 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!660984 mask!2512) lt!660984 lt!660986 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1526189 (= lt!660984 (select (store (arr!48964 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1526189 (= lt!660986 (array!101476 (store (arr!48964 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49514 a!2804)))))

(declare-fun b!1526190 () Bool)

(assert (=> b!1526190 (= e!850707 e!850708)))

(declare-fun res!1044224 () Bool)

(assert (=> b!1526190 (=> (not res!1044224) (not e!850708))))

(declare-fun lt!660987 () SeekEntryResult!13129)

(assert (=> b!1526190 (= res!1044224 (= lt!660988 lt!660987))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1526190 (= lt!660987 (Intermediate!13129 false resIndex!21 resX!21))))

(assert (=> b!1526190 (= lt!660988 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48964 a!2804) j!70) mask!2512) (select (arr!48964 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1526191 () Bool)

(declare-fun res!1044231 () Bool)

(declare-fun e!850709 () Bool)

(assert (=> b!1526191 (=> (not res!1044231) (not e!850709))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!101475 (_ BitVec 32)) SeekEntryResult!13129)

(assert (=> b!1526191 (= res!1044231 (= (seekEntry!0 (select (arr!48964 a!2804) j!70) a!2804 mask!2512) (Found!13129 j!70)))))

(declare-fun b!1526192 () Bool)

(declare-fun e!850705 () Bool)

(assert (=> b!1526192 (= e!850709 e!850705)))

(declare-fun res!1044235 () Bool)

(assert (=> b!1526192 (=> res!1044235 e!850705)))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1526192 (= res!1044235 (or (not (= (select (arr!48964 a!2804) j!70) lt!660984)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48964 a!2804) index!487) (select (arr!48964 a!2804) j!70)) (not (= (select (arr!48964 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1526193 () Bool)

(assert (=> b!1526193 (= e!850710 (not true))))

(assert (=> b!1526193 e!850709))

(declare-fun res!1044225 () Bool)

(assert (=> b!1526193 (=> (not res!1044225) (not e!850709))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101475 (_ BitVec 32)) Bool)

(assert (=> b!1526193 (= res!1044225 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51042 0))(
  ( (Unit!51043) )
))
(declare-fun lt!660985 () Unit!51042)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101475 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51042)

(assert (=> b!1526193 (= lt!660985 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1526194 () Bool)

(declare-fun e!850711 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101475 (_ BitVec 32)) SeekEntryResult!13129)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101475 (_ BitVec 32)) SeekEntryResult!13129)

(assert (=> b!1526194 (= e!850711 (= (seekEntryOrOpen!0 lt!660984 lt!660986 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!660984 lt!660986 mask!2512)))))

(declare-fun b!1526195 () Bool)

(assert (=> b!1526195 (= e!850705 e!850711)))

(declare-fun res!1044223 () Bool)

(assert (=> b!1526195 (=> (not res!1044223) (not e!850711))))

(assert (=> b!1526195 (= res!1044223 (= (seekEntryOrOpen!0 (select (arr!48964 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48964 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1526196 () Bool)

(declare-fun res!1044233 () Bool)

(assert (=> b!1526196 (=> (not res!1044233) (not e!850707))))

(assert (=> b!1526196 (= res!1044233 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1526197 () Bool)

(declare-fun res!1044234 () Bool)

(assert (=> b!1526197 (=> (not res!1044234) (not e!850707))))

(assert (=> b!1526197 (= res!1044234 (and (= (size!49514 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49514 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49514 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1526198 () Bool)

(declare-fun res!1044232 () Bool)

(assert (=> b!1526198 (=> (not res!1044232) (not e!850707))))

(declare-datatypes ((List!35447 0))(
  ( (Nil!35444) (Cons!35443 (h!36876 (_ BitVec 64)) (t!50141 List!35447)) )
))
(declare-fun arrayNoDuplicates!0 (array!101475 (_ BitVec 32) List!35447) Bool)

(assert (=> b!1526198 (= res!1044232 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35444))))

(declare-fun b!1526199 () Bool)

(declare-fun res!1044229 () Bool)

(assert (=> b!1526199 (=> (not res!1044229) (not e!850708))))

(assert (=> b!1526199 (= res!1044229 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48964 a!2804) j!70) a!2804 mask!2512) lt!660987))))

(declare-fun b!1526200 () Bool)

(declare-fun res!1044227 () Bool)

(assert (=> b!1526200 (=> (not res!1044227) (not e!850707))))

(assert (=> b!1526200 (= res!1044227 (validKeyInArray!0 (select (arr!48964 a!2804) i!961)))))

(declare-fun b!1526201 () Bool)

(declare-fun res!1044226 () Bool)

(assert (=> b!1526201 (=> (not res!1044226) (not e!850707))))

(assert (=> b!1526201 (= res!1044226 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49514 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49514 a!2804))))))

(assert (= (and start!130062 res!1044222) b!1526197))

(assert (= (and b!1526197 res!1044234) b!1526200))

(assert (= (and b!1526200 res!1044227) b!1526188))

(assert (= (and b!1526188 res!1044230) b!1526196))

(assert (= (and b!1526196 res!1044233) b!1526198))

(assert (= (and b!1526198 res!1044232) b!1526201))

(assert (= (and b!1526201 res!1044226) b!1526190))

(assert (= (and b!1526190 res!1044224) b!1526199))

(assert (= (and b!1526199 res!1044229) b!1526189))

(assert (= (and b!1526189 res!1044228) b!1526193))

(assert (= (and b!1526193 res!1044225) b!1526191))

(assert (= (and b!1526191 res!1044231) b!1526192))

(assert (= (and b!1526192 (not res!1044235)) b!1526195))

(assert (= (and b!1526195 res!1044223) b!1526194))

(declare-fun m!1408967 () Bool)

(assert (=> b!1526199 m!1408967))

(assert (=> b!1526199 m!1408967))

(declare-fun m!1408969 () Bool)

(assert (=> b!1526199 m!1408969))

(declare-fun m!1408971 () Bool)

(assert (=> b!1526196 m!1408971))

(assert (=> b!1526191 m!1408967))

(assert (=> b!1526191 m!1408967))

(declare-fun m!1408973 () Bool)

(assert (=> b!1526191 m!1408973))

(assert (=> b!1526190 m!1408967))

(assert (=> b!1526190 m!1408967))

(declare-fun m!1408975 () Bool)

(assert (=> b!1526190 m!1408975))

(assert (=> b!1526190 m!1408975))

(assert (=> b!1526190 m!1408967))

(declare-fun m!1408977 () Bool)

(assert (=> b!1526190 m!1408977))

(declare-fun m!1408979 () Bool)

(assert (=> b!1526198 m!1408979))

(declare-fun m!1408981 () Bool)

(assert (=> b!1526194 m!1408981))

(declare-fun m!1408983 () Bool)

(assert (=> b!1526194 m!1408983))

(assert (=> b!1526188 m!1408967))

(assert (=> b!1526188 m!1408967))

(declare-fun m!1408985 () Bool)

(assert (=> b!1526188 m!1408985))

(declare-fun m!1408987 () Bool)

(assert (=> b!1526200 m!1408987))

(assert (=> b!1526200 m!1408987))

(declare-fun m!1408989 () Bool)

(assert (=> b!1526200 m!1408989))

(declare-fun m!1408991 () Bool)

(assert (=> start!130062 m!1408991))

(declare-fun m!1408993 () Bool)

(assert (=> start!130062 m!1408993))

(declare-fun m!1408995 () Bool)

(assert (=> b!1526193 m!1408995))

(declare-fun m!1408997 () Bool)

(assert (=> b!1526193 m!1408997))

(assert (=> b!1526195 m!1408967))

(assert (=> b!1526195 m!1408967))

(declare-fun m!1408999 () Bool)

(assert (=> b!1526195 m!1408999))

(assert (=> b!1526195 m!1408967))

(declare-fun m!1409001 () Bool)

(assert (=> b!1526195 m!1409001))

(declare-fun m!1409003 () Bool)

(assert (=> b!1526189 m!1409003))

(assert (=> b!1526189 m!1409003))

(declare-fun m!1409005 () Bool)

(assert (=> b!1526189 m!1409005))

(declare-fun m!1409007 () Bool)

(assert (=> b!1526189 m!1409007))

(declare-fun m!1409009 () Bool)

(assert (=> b!1526189 m!1409009))

(assert (=> b!1526192 m!1408967))

(declare-fun m!1409011 () Bool)

(assert (=> b!1526192 m!1409011))

(push 1)

