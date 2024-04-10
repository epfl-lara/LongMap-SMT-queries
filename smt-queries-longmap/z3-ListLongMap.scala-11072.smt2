; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129266 () Bool)

(assert start!129266)

(declare-fun b!1517942 () Bool)

(declare-fun e!846846 () Bool)

(declare-fun e!846847 () Bool)

(assert (=> b!1517942 (= e!846846 e!846847)))

(declare-fun res!1037849 () Bool)

(assert (=> b!1517942 (=> res!1037849 e!846847)))

(declare-fun lt!657980 () (_ BitVec 32))

(declare-datatypes ((array!101122 0))(
  ( (array!101123 (arr!48798 (Array (_ BitVec 32) (_ BitVec 64))) (size!49348 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101122)

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1517942 (= res!1037849 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!657980 #b00000000000000000000000000000000) (bvsge lt!657980 (size!49348 a!2804))))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1517942 (= lt!657980 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun e!846845 () Bool)

(declare-fun b!1517943 () Bool)

(declare-datatypes ((SeekEntryResult!12969 0))(
  ( (MissingZero!12969 (index!54271 (_ BitVec 32))) (Found!12969 (index!54272 (_ BitVec 32))) (Intermediate!12969 (undefined!13781 Bool) (index!54273 (_ BitVec 32)) (x!135951 (_ BitVec 32))) (Undefined!12969) (MissingVacant!12969 (index!54274 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101122 (_ BitVec 32)) SeekEntryResult!12969)

(assert (=> b!1517943 (= e!846845 (= (seekEntry!0 (select (arr!48798 a!2804) j!70) a!2804 mask!2512) (Found!12969 j!70)))))

(declare-fun b!1517944 () Bool)

(declare-fun res!1037845 () Bool)

(declare-fun e!846850 () Bool)

(assert (=> b!1517944 (=> (not res!1037845) (not e!846850))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1517944 (= res!1037845 (validKeyInArray!0 (select (arr!48798 a!2804) j!70)))))

(declare-fun b!1517945 () Bool)

(declare-fun e!846849 () Bool)

(assert (=> b!1517945 (= e!846849 (not e!846846))))

(declare-fun res!1037852 () Bool)

(assert (=> b!1517945 (=> res!1037852 e!846846)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1517945 (= res!1037852 (or (not (= (select (arr!48798 a!2804) j!70) (select (store (arr!48798 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(assert (=> b!1517945 e!846845))

(declare-fun res!1037846 () Bool)

(assert (=> b!1517945 (=> (not res!1037846) (not e!846845))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101122 (_ BitVec 32)) Bool)

(assert (=> b!1517945 (= res!1037846 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50806 0))(
  ( (Unit!50807) )
))
(declare-fun lt!657978 () Unit!50806)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101122 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50806)

(assert (=> b!1517945 (= lt!657978 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1517946 () Bool)

(declare-fun res!1037847 () Bool)

(assert (=> b!1517946 (=> (not res!1037847) (not e!846850))))

(assert (=> b!1517946 (= res!1037847 (validKeyInArray!0 (select (arr!48798 a!2804) i!961)))))

(declare-fun b!1517947 () Bool)

(declare-fun res!1037851 () Bool)

(assert (=> b!1517947 (=> (not res!1037851) (not e!846849))))

(declare-fun lt!657981 () SeekEntryResult!12969)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101122 (_ BitVec 32)) SeekEntryResult!12969)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1517947 (= res!1037851 (= lt!657981 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48798 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48798 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101123 (store (arr!48798 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49348 a!2804)) mask!2512)))))

(declare-fun res!1037853 () Bool)

(assert (=> start!129266 (=> (not res!1037853) (not e!846850))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129266 (= res!1037853 (validMask!0 mask!2512))))

(assert (=> start!129266 e!846850))

(assert (=> start!129266 true))

(declare-fun array_inv!37826 (array!101122) Bool)

(assert (=> start!129266 (array_inv!37826 a!2804)))

(declare-fun b!1517948 () Bool)

(declare-fun res!1037855 () Bool)

(assert (=> b!1517948 (=> (not res!1037855) (not e!846850))))

(assert (=> b!1517948 (= res!1037855 (and (= (size!49348 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49348 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49348 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1517949 () Bool)

(declare-fun res!1037856 () Bool)

(assert (=> b!1517949 (=> (not res!1037856) (not e!846849))))

(declare-fun lt!657979 () SeekEntryResult!12969)

(assert (=> b!1517949 (= res!1037856 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48798 a!2804) j!70) a!2804 mask!2512) lt!657979))))

(declare-fun b!1517950 () Bool)

(declare-fun res!1037857 () Bool)

(assert (=> b!1517950 (=> (not res!1037857) (not e!846850))))

(declare-datatypes ((List!35281 0))(
  ( (Nil!35278) (Cons!35277 (h!36689 (_ BitVec 64)) (t!49975 List!35281)) )
))
(declare-fun arrayNoDuplicates!0 (array!101122 (_ BitVec 32) List!35281) Bool)

(assert (=> b!1517950 (= res!1037857 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35278))))

(declare-fun b!1517951 () Bool)

(declare-fun res!1037848 () Bool)

(assert (=> b!1517951 (=> (not res!1037848) (not e!846850))))

(assert (=> b!1517951 (= res!1037848 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1517952 () Bool)

(assert (=> b!1517952 (= e!846850 e!846849)))

(declare-fun res!1037854 () Bool)

(assert (=> b!1517952 (=> (not res!1037854) (not e!846849))))

(assert (=> b!1517952 (= res!1037854 (= lt!657981 lt!657979))))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1517952 (= lt!657979 (Intermediate!12969 false resIndex!21 resX!21))))

(assert (=> b!1517952 (= lt!657981 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48798 a!2804) j!70) mask!2512) (select (arr!48798 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1517953 () Bool)

(assert (=> b!1517953 (= e!846847 true)))

(declare-fun lt!657982 () SeekEntryResult!12969)

(assert (=> b!1517953 (= lt!657982 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!657980 (select (arr!48798 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1517954 () Bool)

(declare-fun res!1037850 () Bool)

(assert (=> b!1517954 (=> (not res!1037850) (not e!846850))))

(assert (=> b!1517954 (= res!1037850 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49348 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49348 a!2804))))))

(assert (= (and start!129266 res!1037853) b!1517948))

(assert (= (and b!1517948 res!1037855) b!1517946))

(assert (= (and b!1517946 res!1037847) b!1517944))

(assert (= (and b!1517944 res!1037845) b!1517951))

(assert (= (and b!1517951 res!1037848) b!1517950))

(assert (= (and b!1517950 res!1037857) b!1517954))

(assert (= (and b!1517954 res!1037850) b!1517952))

(assert (= (and b!1517952 res!1037854) b!1517949))

(assert (= (and b!1517949 res!1037856) b!1517947))

(assert (= (and b!1517947 res!1037851) b!1517945))

(assert (= (and b!1517945 res!1037846) b!1517943))

(assert (= (and b!1517945 (not res!1037852)) b!1517942))

(assert (= (and b!1517942 (not res!1037849)) b!1517953))

(declare-fun m!1401245 () Bool)

(assert (=> b!1517946 m!1401245))

(assert (=> b!1517946 m!1401245))

(declare-fun m!1401247 () Bool)

(assert (=> b!1517946 m!1401247))

(declare-fun m!1401249 () Bool)

(assert (=> b!1517952 m!1401249))

(assert (=> b!1517952 m!1401249))

(declare-fun m!1401251 () Bool)

(assert (=> b!1517952 m!1401251))

(assert (=> b!1517952 m!1401251))

(assert (=> b!1517952 m!1401249))

(declare-fun m!1401253 () Bool)

(assert (=> b!1517952 m!1401253))

(assert (=> b!1517943 m!1401249))

(assert (=> b!1517943 m!1401249))

(declare-fun m!1401255 () Bool)

(assert (=> b!1517943 m!1401255))

(declare-fun m!1401257 () Bool)

(assert (=> start!129266 m!1401257))

(declare-fun m!1401259 () Bool)

(assert (=> start!129266 m!1401259))

(assert (=> b!1517944 m!1401249))

(assert (=> b!1517944 m!1401249))

(declare-fun m!1401261 () Bool)

(assert (=> b!1517944 m!1401261))

(assert (=> b!1517945 m!1401249))

(declare-fun m!1401263 () Bool)

(assert (=> b!1517945 m!1401263))

(declare-fun m!1401265 () Bool)

(assert (=> b!1517945 m!1401265))

(declare-fun m!1401267 () Bool)

(assert (=> b!1517945 m!1401267))

(declare-fun m!1401269 () Bool)

(assert (=> b!1517945 m!1401269))

(declare-fun m!1401271 () Bool)

(assert (=> b!1517951 m!1401271))

(declare-fun m!1401273 () Bool)

(assert (=> b!1517950 m!1401273))

(assert (=> b!1517949 m!1401249))

(assert (=> b!1517949 m!1401249))

(declare-fun m!1401275 () Bool)

(assert (=> b!1517949 m!1401275))

(assert (=> b!1517947 m!1401265))

(assert (=> b!1517947 m!1401267))

(assert (=> b!1517947 m!1401267))

(declare-fun m!1401277 () Bool)

(assert (=> b!1517947 m!1401277))

(assert (=> b!1517947 m!1401277))

(assert (=> b!1517947 m!1401267))

(declare-fun m!1401279 () Bool)

(assert (=> b!1517947 m!1401279))

(assert (=> b!1517953 m!1401249))

(assert (=> b!1517953 m!1401249))

(declare-fun m!1401281 () Bool)

(assert (=> b!1517953 m!1401281))

(declare-fun m!1401283 () Bool)

(assert (=> b!1517942 m!1401283))

(check-sat (not b!1517944) (not b!1517943) (not b!1517945) (not b!1517951) (not b!1517952) (not start!129266) (not b!1517953) (not b!1517942) (not b!1517947) (not b!1517949) (not b!1517946) (not b!1517950))
(check-sat)
