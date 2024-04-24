; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129386 () Bool)

(assert start!129386)

(declare-fun b!1516245 () Bool)

(declare-fun e!846294 () Bool)

(declare-fun e!846292 () Bool)

(assert (=> b!1516245 (= e!846294 e!846292)))

(declare-fun res!1034975 () Bool)

(assert (=> b!1516245 (=> (not res!1034975) (not e!846292))))

(declare-fun lt!656992 () (_ BitVec 64))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12824 0))(
  ( (MissingZero!12824 (index!53691 (_ BitVec 32))) (Found!12824 (index!53692 (_ BitVec 32))) (Intermediate!12824 (undefined!13636 Bool) (index!53693 (_ BitVec 32)) (x!135603 (_ BitVec 32))) (Undefined!12824) (MissingVacant!12824 (index!53694 (_ BitVec 32))) )
))
(declare-fun lt!656989 () SeekEntryResult!12824)

(declare-datatypes ((array!101056 0))(
  ( (array!101057 (arr!48760 (Array (_ BitVec 32) (_ BitVec 64))) (size!49311 (_ BitVec 32))) )
))
(declare-fun lt!656988 () array!101056)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101056 (_ BitVec 32)) SeekEntryResult!12824)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1516245 (= res!1034975 (= lt!656989 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!656992 mask!2512) lt!656992 lt!656988 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun a!2804 () array!101056)

(assert (=> b!1516245 (= lt!656992 (select (store (arr!48760 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1516245 (= lt!656988 (array!101057 (store (arr!48760 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49311 a!2804)))))

(declare-fun b!1516246 () Bool)

(declare-fun e!846297 () Bool)

(assert (=> b!1516246 (= e!846297 e!846294)))

(declare-fun res!1034978 () Bool)

(assert (=> b!1516246 (=> (not res!1034978) (not e!846294))))

(declare-fun lt!656991 () SeekEntryResult!12824)

(assert (=> b!1516246 (= res!1034978 (= lt!656989 lt!656991))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1516246 (= lt!656991 (Intermediate!12824 false resIndex!21 resX!21))))

(assert (=> b!1516246 (= lt!656989 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48760 a!2804) j!70) mask!2512) (select (arr!48760 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1516247 () Bool)

(declare-fun res!1034974 () Bool)

(declare-fun e!846295 () Bool)

(assert (=> b!1516247 (=> (not res!1034974) (not e!846295))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!101056 (_ BitVec 32)) SeekEntryResult!12824)

(assert (=> b!1516247 (= res!1034974 (= (seekEntry!0 (select (arr!48760 a!2804) j!70) a!2804 mask!2512) (Found!12824 j!70)))))

(declare-fun b!1516248 () Bool)

(declare-fun e!846296 () Bool)

(declare-fun e!846291 () Bool)

(assert (=> b!1516248 (= e!846296 e!846291)))

(declare-fun res!1034981 () Bool)

(assert (=> b!1516248 (=> (not res!1034981) (not e!846291))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101056 (_ BitVec 32)) SeekEntryResult!12824)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101056 (_ BitVec 32)) SeekEntryResult!12824)

(assert (=> b!1516248 (= res!1034981 (= (seekEntryOrOpen!0 (select (arr!48760 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48760 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1516249 () Bool)

(declare-fun res!1034972 () Bool)

(assert (=> b!1516249 (=> (not res!1034972) (not e!846297))))

(assert (=> b!1516249 (= res!1034972 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49311 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49311 a!2804))))))

(declare-fun res!1034984 () Bool)

(assert (=> start!129386 (=> (not res!1034984) (not e!846297))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129386 (= res!1034984 (validMask!0 mask!2512))))

(assert (=> start!129386 e!846297))

(assert (=> start!129386 true))

(declare-fun array_inv!38041 (array!101056) Bool)

(assert (=> start!129386 (array_inv!38041 a!2804)))

(declare-fun b!1516250 () Bool)

(declare-fun res!1034983 () Bool)

(assert (=> b!1516250 (=> (not res!1034983) (not e!846297))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1516250 (= res!1034983 (validKeyInArray!0 (select (arr!48760 a!2804) i!961)))))

(declare-fun b!1516251 () Bool)

(declare-fun res!1034976 () Bool)

(assert (=> b!1516251 (=> (not res!1034976) (not e!846294))))

(assert (=> b!1516251 (= res!1034976 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48760 a!2804) j!70) a!2804 mask!2512) lt!656991))))

(declare-fun b!1516252 () Bool)

(assert (=> b!1516252 (= e!846295 e!846296)))

(declare-fun res!1034980 () Bool)

(assert (=> b!1516252 (=> res!1034980 e!846296)))

(assert (=> b!1516252 (= res!1034980 (or (not (= (select (arr!48760 a!2804) j!70) lt!656992)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48760 a!2804) index!487) (select (arr!48760 a!2804) j!70)) (not (= (select (arr!48760 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1516253 () Bool)

(assert (=> b!1516253 (= e!846292 (not true))))

(assert (=> b!1516253 e!846295))

(declare-fun res!1034977 () Bool)

(assert (=> b!1516253 (=> (not res!1034977) (not e!846295))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101056 (_ BitVec 32)) Bool)

(assert (=> b!1516253 (= res!1034977 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50551 0))(
  ( (Unit!50552) )
))
(declare-fun lt!656990 () Unit!50551)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101056 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50551)

(assert (=> b!1516253 (= lt!656990 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1516254 () Bool)

(assert (=> b!1516254 (= e!846291 (= (seekEntryOrOpen!0 lt!656992 lt!656988 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!656992 lt!656988 mask!2512)))))

(declare-fun b!1516255 () Bool)

(declare-fun res!1034973 () Bool)

(assert (=> b!1516255 (=> (not res!1034973) (not e!846297))))

(declare-datatypes ((List!35230 0))(
  ( (Nil!35227) (Cons!35226 (h!36653 (_ BitVec 64)) (t!49916 List!35230)) )
))
(declare-fun arrayNoDuplicates!0 (array!101056 (_ BitVec 32) List!35230) Bool)

(assert (=> b!1516255 (= res!1034973 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35227))))

(declare-fun b!1516256 () Bool)

(declare-fun res!1034979 () Bool)

(assert (=> b!1516256 (=> (not res!1034979) (not e!846297))))

(assert (=> b!1516256 (= res!1034979 (validKeyInArray!0 (select (arr!48760 a!2804) j!70)))))

(declare-fun b!1516257 () Bool)

(declare-fun res!1034982 () Bool)

(assert (=> b!1516257 (=> (not res!1034982) (not e!846297))))

(assert (=> b!1516257 (= res!1034982 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1516258 () Bool)

(declare-fun res!1034971 () Bool)

(assert (=> b!1516258 (=> (not res!1034971) (not e!846297))))

(assert (=> b!1516258 (= res!1034971 (and (= (size!49311 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49311 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49311 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!129386 res!1034984) b!1516258))

(assert (= (and b!1516258 res!1034971) b!1516250))

(assert (= (and b!1516250 res!1034983) b!1516256))

(assert (= (and b!1516256 res!1034979) b!1516257))

(assert (= (and b!1516257 res!1034982) b!1516255))

(assert (= (and b!1516255 res!1034973) b!1516249))

(assert (= (and b!1516249 res!1034972) b!1516246))

(assert (= (and b!1516246 res!1034978) b!1516251))

(assert (= (and b!1516251 res!1034976) b!1516245))

(assert (= (and b!1516245 res!1034975) b!1516253))

(assert (= (and b!1516253 res!1034977) b!1516247))

(assert (= (and b!1516247 res!1034974) b!1516252))

(assert (= (and b!1516252 (not res!1034980)) b!1516248))

(assert (= (and b!1516248 res!1034981) b!1516254))

(declare-fun m!1399161 () Bool)

(assert (=> b!1516252 m!1399161))

(declare-fun m!1399163 () Bool)

(assert (=> b!1516252 m!1399163))

(assert (=> b!1516256 m!1399161))

(assert (=> b!1516256 m!1399161))

(declare-fun m!1399165 () Bool)

(assert (=> b!1516256 m!1399165))

(declare-fun m!1399167 () Bool)

(assert (=> b!1516254 m!1399167))

(declare-fun m!1399169 () Bool)

(assert (=> b!1516254 m!1399169))

(declare-fun m!1399171 () Bool)

(assert (=> b!1516255 m!1399171))

(declare-fun m!1399173 () Bool)

(assert (=> b!1516257 m!1399173))

(assert (=> b!1516251 m!1399161))

(assert (=> b!1516251 m!1399161))

(declare-fun m!1399175 () Bool)

(assert (=> b!1516251 m!1399175))

(assert (=> b!1516246 m!1399161))

(assert (=> b!1516246 m!1399161))

(declare-fun m!1399177 () Bool)

(assert (=> b!1516246 m!1399177))

(assert (=> b!1516246 m!1399177))

(assert (=> b!1516246 m!1399161))

(declare-fun m!1399179 () Bool)

(assert (=> b!1516246 m!1399179))

(assert (=> b!1516248 m!1399161))

(assert (=> b!1516248 m!1399161))

(declare-fun m!1399181 () Bool)

(assert (=> b!1516248 m!1399181))

(assert (=> b!1516248 m!1399161))

(declare-fun m!1399183 () Bool)

(assert (=> b!1516248 m!1399183))

(assert (=> b!1516247 m!1399161))

(assert (=> b!1516247 m!1399161))

(declare-fun m!1399185 () Bool)

(assert (=> b!1516247 m!1399185))

(declare-fun m!1399187 () Bool)

(assert (=> b!1516250 m!1399187))

(assert (=> b!1516250 m!1399187))

(declare-fun m!1399189 () Bool)

(assert (=> b!1516250 m!1399189))

(declare-fun m!1399191 () Bool)

(assert (=> start!129386 m!1399191))

(declare-fun m!1399193 () Bool)

(assert (=> start!129386 m!1399193))

(declare-fun m!1399195 () Bool)

(assert (=> b!1516253 m!1399195))

(declare-fun m!1399197 () Bool)

(assert (=> b!1516253 m!1399197))

(declare-fun m!1399199 () Bool)

(assert (=> b!1516245 m!1399199))

(assert (=> b!1516245 m!1399199))

(declare-fun m!1399201 () Bool)

(assert (=> b!1516245 m!1399201))

(declare-fun m!1399203 () Bool)

(assert (=> b!1516245 m!1399203))

(declare-fun m!1399205 () Bool)

(assert (=> b!1516245 m!1399205))

(check-sat (not b!1516253) (not b!1516254) (not b!1516250) (not b!1516255) (not b!1516246) (not b!1516248) (not b!1516251) (not b!1516256) (not b!1516245) (not start!129386) (not b!1516257) (not b!1516247))
(check-sat)
