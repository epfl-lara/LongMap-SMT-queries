; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129076 () Bool)

(assert start!129076)

(declare-fun b!1514245 () Bool)

(declare-fun res!1034155 () Bool)

(declare-fun e!845075 () Bool)

(assert (=> b!1514245 (=> (not res!1034155) (not e!845075))))

(declare-datatypes ((SeekEntryResult!12874 0))(
  ( (MissingZero!12874 (index!53891 (_ BitVec 32))) (Found!12874 (index!53892 (_ BitVec 32))) (Intermediate!12874 (undefined!13686 Bool) (index!53893 (_ BitVec 32)) (x!135600 (_ BitVec 32))) (Undefined!12874) (MissingVacant!12874 (index!53894 (_ BitVec 32))) )
))
(declare-fun lt!656267 () SeekEntryResult!12874)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100932 0))(
  ( (array!100933 (arr!48703 (Array (_ BitVec 32) (_ BitVec 64))) (size!49253 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100932)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100932 (_ BitVec 32)) SeekEntryResult!12874)

(assert (=> b!1514245 (= res!1034155 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48703 a!2804) j!70) a!2804 mask!2512) lt!656267))))

(declare-fun b!1514246 () Bool)

(declare-fun e!845072 () Bool)

(declare-fun e!845071 () Bool)

(assert (=> b!1514246 (= e!845072 e!845071)))

(declare-fun res!1034161 () Bool)

(assert (=> b!1514246 (=> res!1034161 e!845071)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun lt!656269 () (_ BitVec 64))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1514246 (= res!1034161 (or (not (= (select (arr!48703 a!2804) j!70) lt!656269)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48703 a!2804) index!487) (select (arr!48703 a!2804) j!70)) (not (= (select (arr!48703 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1514247 () Bool)

(declare-fun res!1034148 () Bool)

(declare-fun e!845076 () Bool)

(assert (=> b!1514247 (=> (not res!1034148) (not e!845076))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1514247 (= res!1034148 (validKeyInArray!0 (select (arr!48703 a!2804) i!961)))))

(declare-fun b!1514248 () Bool)

(declare-fun e!845073 () Bool)

(declare-fun lt!656266 () array!100932)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100932 (_ BitVec 32)) SeekEntryResult!12874)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100932 (_ BitVec 32)) SeekEntryResult!12874)

(assert (=> b!1514248 (= e!845073 (= (seekEntryOrOpen!0 lt!656269 lt!656266 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!656269 lt!656266 mask!2512)))))

(declare-fun b!1514249 () Bool)

(declare-fun e!845077 () Bool)

(assert (=> b!1514249 (= e!845075 e!845077)))

(declare-fun res!1034158 () Bool)

(assert (=> b!1514249 (=> (not res!1034158) (not e!845077))))

(declare-fun lt!656265 () SeekEntryResult!12874)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1514249 (= res!1034158 (= lt!656265 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!656269 mask!2512) lt!656269 lt!656266 mask!2512)))))

(assert (=> b!1514249 (= lt!656269 (select (store (arr!48703 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1514249 (= lt!656266 (array!100933 (store (arr!48703 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49253 a!2804)))))

(declare-fun res!1034156 () Bool)

(assert (=> start!129076 (=> (not res!1034156) (not e!845076))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129076 (= res!1034156 (validMask!0 mask!2512))))

(assert (=> start!129076 e!845076))

(assert (=> start!129076 true))

(declare-fun array_inv!37731 (array!100932) Bool)

(assert (=> start!129076 (array_inv!37731 a!2804)))

(declare-fun b!1514250 () Bool)

(declare-fun res!1034153 () Bool)

(assert (=> b!1514250 (=> (not res!1034153) (not e!845072))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100932 (_ BitVec 32)) SeekEntryResult!12874)

(assert (=> b!1514250 (= res!1034153 (= (seekEntry!0 (select (arr!48703 a!2804) j!70) a!2804 mask!2512) (Found!12874 j!70)))))

(declare-fun b!1514251 () Bool)

(declare-fun res!1034160 () Bool)

(assert (=> b!1514251 (=> (not res!1034160) (not e!845076))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100932 (_ BitVec 32)) Bool)

(assert (=> b!1514251 (= res!1034160 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1514252 () Bool)

(declare-fun res!1034152 () Bool)

(assert (=> b!1514252 (=> (not res!1034152) (not e!845076))))

(assert (=> b!1514252 (= res!1034152 (validKeyInArray!0 (select (arr!48703 a!2804) j!70)))))

(declare-fun b!1514253 () Bool)

(declare-fun res!1034149 () Bool)

(assert (=> b!1514253 (=> (not res!1034149) (not e!845076))))

(assert (=> b!1514253 (= res!1034149 (and (= (size!49253 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49253 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49253 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1514254 () Bool)

(declare-fun res!1034150 () Bool)

(assert (=> b!1514254 (=> (not res!1034150) (not e!845076))))

(assert (=> b!1514254 (= res!1034150 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49253 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49253 a!2804))))))

(declare-fun b!1514255 () Bool)

(assert (=> b!1514255 (= e!845071 e!845073)))

(declare-fun res!1034157 () Bool)

(assert (=> b!1514255 (=> (not res!1034157) (not e!845073))))

(assert (=> b!1514255 (= res!1034157 (= (seekEntryOrOpen!0 (select (arr!48703 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48703 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1514256 () Bool)

(assert (=> b!1514256 (= e!845077 (not true))))

(assert (=> b!1514256 e!845072))

(declare-fun res!1034154 () Bool)

(assert (=> b!1514256 (=> (not res!1034154) (not e!845072))))

(assert (=> b!1514256 (= res!1034154 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50616 0))(
  ( (Unit!50617) )
))
(declare-fun lt!656268 () Unit!50616)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100932 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50616)

(assert (=> b!1514256 (= lt!656268 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1514257 () Bool)

(assert (=> b!1514257 (= e!845076 e!845075)))

(declare-fun res!1034159 () Bool)

(assert (=> b!1514257 (=> (not res!1034159) (not e!845075))))

(assert (=> b!1514257 (= res!1034159 (= lt!656265 lt!656267))))

(assert (=> b!1514257 (= lt!656267 (Intermediate!12874 false resIndex!21 resX!21))))

(assert (=> b!1514257 (= lt!656265 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48703 a!2804) j!70) mask!2512) (select (arr!48703 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1514258 () Bool)

(declare-fun res!1034151 () Bool)

(assert (=> b!1514258 (=> (not res!1034151) (not e!845076))))

(declare-datatypes ((List!35186 0))(
  ( (Nil!35183) (Cons!35182 (h!36594 (_ BitVec 64)) (t!49880 List!35186)) )
))
(declare-fun arrayNoDuplicates!0 (array!100932 (_ BitVec 32) List!35186) Bool)

(assert (=> b!1514258 (= res!1034151 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35183))))

(assert (= (and start!129076 res!1034156) b!1514253))

(assert (= (and b!1514253 res!1034149) b!1514247))

(assert (= (and b!1514247 res!1034148) b!1514252))

(assert (= (and b!1514252 res!1034152) b!1514251))

(assert (= (and b!1514251 res!1034160) b!1514258))

(assert (= (and b!1514258 res!1034151) b!1514254))

(assert (= (and b!1514254 res!1034150) b!1514257))

(assert (= (and b!1514257 res!1034159) b!1514245))

(assert (= (and b!1514245 res!1034155) b!1514249))

(assert (= (and b!1514249 res!1034158) b!1514256))

(assert (= (and b!1514256 res!1034154) b!1514250))

(assert (= (and b!1514250 res!1034153) b!1514246))

(assert (= (and b!1514246 (not res!1034161)) b!1514255))

(assert (= (and b!1514255 res!1034157) b!1514248))

(declare-fun m!1397181 () Bool)

(assert (=> b!1514256 m!1397181))

(declare-fun m!1397183 () Bool)

(assert (=> b!1514256 m!1397183))

(declare-fun m!1397185 () Bool)

(assert (=> start!129076 m!1397185))

(declare-fun m!1397187 () Bool)

(assert (=> start!129076 m!1397187))

(declare-fun m!1397189 () Bool)

(assert (=> b!1514250 m!1397189))

(assert (=> b!1514250 m!1397189))

(declare-fun m!1397191 () Bool)

(assert (=> b!1514250 m!1397191))

(assert (=> b!1514255 m!1397189))

(assert (=> b!1514255 m!1397189))

(declare-fun m!1397193 () Bool)

(assert (=> b!1514255 m!1397193))

(assert (=> b!1514255 m!1397189))

(declare-fun m!1397195 () Bool)

(assert (=> b!1514255 m!1397195))

(declare-fun m!1397197 () Bool)

(assert (=> b!1514247 m!1397197))

(assert (=> b!1514247 m!1397197))

(declare-fun m!1397199 () Bool)

(assert (=> b!1514247 m!1397199))

(assert (=> b!1514246 m!1397189))

(declare-fun m!1397201 () Bool)

(assert (=> b!1514246 m!1397201))

(declare-fun m!1397203 () Bool)

(assert (=> b!1514249 m!1397203))

(assert (=> b!1514249 m!1397203))

(declare-fun m!1397205 () Bool)

(assert (=> b!1514249 m!1397205))

(declare-fun m!1397207 () Bool)

(assert (=> b!1514249 m!1397207))

(declare-fun m!1397209 () Bool)

(assert (=> b!1514249 m!1397209))

(assert (=> b!1514257 m!1397189))

(assert (=> b!1514257 m!1397189))

(declare-fun m!1397211 () Bool)

(assert (=> b!1514257 m!1397211))

(assert (=> b!1514257 m!1397211))

(assert (=> b!1514257 m!1397189))

(declare-fun m!1397213 () Bool)

(assert (=> b!1514257 m!1397213))

(assert (=> b!1514252 m!1397189))

(assert (=> b!1514252 m!1397189))

(declare-fun m!1397215 () Bool)

(assert (=> b!1514252 m!1397215))

(declare-fun m!1397217 () Bool)

(assert (=> b!1514248 m!1397217))

(declare-fun m!1397219 () Bool)

(assert (=> b!1514248 m!1397219))

(declare-fun m!1397221 () Bool)

(assert (=> b!1514251 m!1397221))

(declare-fun m!1397223 () Bool)

(assert (=> b!1514258 m!1397223))

(assert (=> b!1514245 m!1397189))

(assert (=> b!1514245 m!1397189))

(declare-fun m!1397225 () Bool)

(assert (=> b!1514245 m!1397225))

(push 1)

