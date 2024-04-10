; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129278 () Bool)

(assert start!129278)

(declare-fun b!1518176 () Bool)

(declare-fun e!846954 () Bool)

(assert (=> b!1518176 (= e!846954 true)))

(declare-fun lt!658072 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12975 0))(
  ( (MissingZero!12975 (index!54295 (_ BitVec 32))) (Found!12975 (index!54296 (_ BitVec 32))) (Intermediate!12975 (undefined!13787 Bool) (index!54297 (_ BitVec 32)) (x!135973 (_ BitVec 32))) (Undefined!12975) (MissingVacant!12975 (index!54298 (_ BitVec 32))) )
))
(declare-fun lt!658069 () SeekEntryResult!12975)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101134 0))(
  ( (array!101135 (arr!48804 (Array (_ BitVec 32) (_ BitVec 64))) (size!49354 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101134)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101134 (_ BitVec 32)) SeekEntryResult!12975)

(assert (=> b!1518176 (= lt!658069 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!658072 (select (arr!48804 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1518177 () Bool)

(declare-fun res!1038089 () Bool)

(declare-fun e!846957 () Bool)

(assert (=> b!1518177 (=> (not res!1038089) (not e!846957))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1518177 (= res!1038089 (validKeyInArray!0 (select (arr!48804 a!2804) i!961)))))

(declare-fun b!1518178 () Bool)

(declare-fun res!1038091 () Bool)

(assert (=> b!1518178 (=> (not res!1038091) (not e!846957))))

(declare-datatypes ((List!35287 0))(
  ( (Nil!35284) (Cons!35283 (h!36695 (_ BitVec 64)) (t!49981 List!35287)) )
))
(declare-fun arrayNoDuplicates!0 (array!101134 (_ BitVec 32) List!35287) Bool)

(assert (=> b!1518178 (= res!1038091 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35284))))

(declare-fun b!1518179 () Bool)

(declare-fun e!846956 () Bool)

(assert (=> b!1518179 (= e!846956 e!846954)))

(declare-fun res!1038088 () Bool)

(assert (=> b!1518179 (=> res!1038088 e!846954)))

(assert (=> b!1518179 (= res!1038088 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!658072 #b00000000000000000000000000000000) (bvsge lt!658072 (size!49354 a!2804))))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1518179 (= lt!658072 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1518181 () Bool)

(declare-fun e!846955 () Bool)

(assert (=> b!1518181 (= e!846957 e!846955)))

(declare-fun res!1038084 () Bool)

(assert (=> b!1518181 (=> (not res!1038084) (not e!846955))))

(declare-fun lt!658070 () SeekEntryResult!12975)

(declare-fun lt!658071 () SeekEntryResult!12975)

(assert (=> b!1518181 (= res!1038084 (= lt!658070 lt!658071))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1518181 (= lt!658071 (Intermediate!12975 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1518181 (= lt!658070 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48804 a!2804) j!70) mask!2512) (select (arr!48804 a!2804) j!70) a!2804 mask!2512))))

(declare-fun e!846953 () Bool)

(declare-fun b!1518182 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101134 (_ BitVec 32)) SeekEntryResult!12975)

(assert (=> b!1518182 (= e!846953 (= (seekEntry!0 (select (arr!48804 a!2804) j!70) a!2804 mask!2512) (Found!12975 j!70)))))

(declare-fun b!1518183 () Bool)

(declare-fun res!1038081 () Bool)

(assert (=> b!1518183 (=> (not res!1038081) (not e!846957))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101134 (_ BitVec 32)) Bool)

(assert (=> b!1518183 (= res!1038081 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1518184 () Bool)

(assert (=> b!1518184 (= e!846955 (not e!846956))))

(declare-fun res!1038086 () Bool)

(assert (=> b!1518184 (=> res!1038086 e!846956)))

(assert (=> b!1518184 (= res!1038086 (or (not (= (select (arr!48804 a!2804) j!70) (select (store (arr!48804 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(assert (=> b!1518184 e!846953))

(declare-fun res!1038085 () Bool)

(assert (=> b!1518184 (=> (not res!1038085) (not e!846953))))

(assert (=> b!1518184 (= res!1038085 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50818 0))(
  ( (Unit!50819) )
))
(declare-fun lt!658068 () Unit!50818)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101134 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50818)

(assert (=> b!1518184 (= lt!658068 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1518180 () Bool)

(declare-fun res!1038079 () Bool)

(assert (=> b!1518180 (=> (not res!1038079) (not e!846955))))

(assert (=> b!1518180 (= res!1038079 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48804 a!2804) j!70) a!2804 mask!2512) lt!658071))))

(declare-fun res!1038080 () Bool)

(assert (=> start!129278 (=> (not res!1038080) (not e!846957))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129278 (= res!1038080 (validMask!0 mask!2512))))

(assert (=> start!129278 e!846957))

(assert (=> start!129278 true))

(declare-fun array_inv!37832 (array!101134) Bool)

(assert (=> start!129278 (array_inv!37832 a!2804)))

(declare-fun b!1518185 () Bool)

(declare-fun res!1038090 () Bool)

(assert (=> b!1518185 (=> (not res!1038090) (not e!846957))))

(assert (=> b!1518185 (= res!1038090 (and (= (size!49354 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49354 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49354 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1518186 () Bool)

(declare-fun res!1038082 () Bool)

(assert (=> b!1518186 (=> (not res!1038082) (not e!846957))))

(assert (=> b!1518186 (= res!1038082 (validKeyInArray!0 (select (arr!48804 a!2804) j!70)))))

(declare-fun b!1518187 () Bool)

(declare-fun res!1038087 () Bool)

(assert (=> b!1518187 (=> (not res!1038087) (not e!846955))))

(assert (=> b!1518187 (= res!1038087 (= lt!658070 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48804 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48804 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101135 (store (arr!48804 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49354 a!2804)) mask!2512)))))

(declare-fun b!1518188 () Bool)

(declare-fun res!1038083 () Bool)

(assert (=> b!1518188 (=> (not res!1038083) (not e!846957))))

(assert (=> b!1518188 (= res!1038083 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49354 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49354 a!2804))))))

(assert (= (and start!129278 res!1038080) b!1518185))

(assert (= (and b!1518185 res!1038090) b!1518177))

(assert (= (and b!1518177 res!1038089) b!1518186))

(assert (= (and b!1518186 res!1038082) b!1518183))

(assert (= (and b!1518183 res!1038081) b!1518178))

(assert (= (and b!1518178 res!1038091) b!1518188))

(assert (= (and b!1518188 res!1038083) b!1518181))

(assert (= (and b!1518181 res!1038084) b!1518180))

(assert (= (and b!1518180 res!1038079) b!1518187))

(assert (= (and b!1518187 res!1038087) b!1518184))

(assert (= (and b!1518184 res!1038085) b!1518182))

(assert (= (and b!1518184 (not res!1038086)) b!1518179))

(assert (= (and b!1518179 (not res!1038088)) b!1518176))

(declare-fun m!1401485 () Bool)

(assert (=> start!129278 m!1401485))

(declare-fun m!1401487 () Bool)

(assert (=> start!129278 m!1401487))

(declare-fun m!1401489 () Bool)

(assert (=> b!1518179 m!1401489))

(declare-fun m!1401491 () Bool)

(assert (=> b!1518180 m!1401491))

(assert (=> b!1518180 m!1401491))

(declare-fun m!1401493 () Bool)

(assert (=> b!1518180 m!1401493))

(assert (=> b!1518181 m!1401491))

(assert (=> b!1518181 m!1401491))

(declare-fun m!1401495 () Bool)

(assert (=> b!1518181 m!1401495))

(assert (=> b!1518181 m!1401495))

(assert (=> b!1518181 m!1401491))

(declare-fun m!1401497 () Bool)

(assert (=> b!1518181 m!1401497))

(assert (=> b!1518182 m!1401491))

(assert (=> b!1518182 m!1401491))

(declare-fun m!1401499 () Bool)

(assert (=> b!1518182 m!1401499))

(declare-fun m!1401501 () Bool)

(assert (=> b!1518183 m!1401501))

(declare-fun m!1401503 () Bool)

(assert (=> b!1518178 m!1401503))

(assert (=> b!1518176 m!1401491))

(assert (=> b!1518176 m!1401491))

(declare-fun m!1401505 () Bool)

(assert (=> b!1518176 m!1401505))

(declare-fun m!1401507 () Bool)

(assert (=> b!1518177 m!1401507))

(assert (=> b!1518177 m!1401507))

(declare-fun m!1401509 () Bool)

(assert (=> b!1518177 m!1401509))

(assert (=> b!1518184 m!1401491))

(declare-fun m!1401511 () Bool)

(assert (=> b!1518184 m!1401511))

(declare-fun m!1401513 () Bool)

(assert (=> b!1518184 m!1401513))

(declare-fun m!1401515 () Bool)

(assert (=> b!1518184 m!1401515))

(declare-fun m!1401517 () Bool)

(assert (=> b!1518184 m!1401517))

(assert (=> b!1518187 m!1401513))

(assert (=> b!1518187 m!1401515))

(assert (=> b!1518187 m!1401515))

(declare-fun m!1401519 () Bool)

(assert (=> b!1518187 m!1401519))

(assert (=> b!1518187 m!1401519))

(assert (=> b!1518187 m!1401515))

(declare-fun m!1401521 () Bool)

(assert (=> b!1518187 m!1401521))

(assert (=> b!1518186 m!1401491))

(assert (=> b!1518186 m!1401491))

(declare-fun m!1401523 () Bool)

(assert (=> b!1518186 m!1401523))

(check-sat (not b!1518178) (not b!1518179) (not b!1518180) (not b!1518177) (not b!1518184) (not b!1518176) (not start!129278) (not b!1518186) (not b!1518182) (not b!1518181) (not b!1518183) (not b!1518187))
(check-sat)
