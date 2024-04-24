; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129338 () Bool)

(assert start!129338)

(declare-fun b!1515237 () Bool)

(declare-fun res!1033968 () Bool)

(declare-fun e!845793 () Bool)

(assert (=> b!1515237 (=> (not res!1033968) (not e!845793))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101008 0))(
  ( (array!101009 (arr!48736 (Array (_ BitVec 32) (_ BitVec 64))) (size!49287 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101008)

(declare-datatypes ((SeekEntryResult!12800 0))(
  ( (MissingZero!12800 (index!53595 (_ BitVec 32))) (Found!12800 (index!53596 (_ BitVec 32))) (Intermediate!12800 (undefined!13612 Bool) (index!53597 (_ BitVec 32)) (x!135515 (_ BitVec 32))) (Undefined!12800) (MissingVacant!12800 (index!53598 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101008 (_ BitVec 32)) SeekEntryResult!12800)

(assert (=> b!1515237 (= res!1033968 (= (seekEntry!0 (select (arr!48736 a!2804) j!70) a!2804 mask!2512) (Found!12800 j!70)))))

(declare-fun res!1033974 () Bool)

(declare-fun e!845791 () Bool)

(assert (=> start!129338 (=> (not res!1033974) (not e!845791))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129338 (= res!1033974 (validMask!0 mask!2512))))

(assert (=> start!129338 e!845791))

(assert (=> start!129338 true))

(declare-fun array_inv!38017 (array!101008) Bool)

(assert (=> start!129338 (array_inv!38017 a!2804)))

(declare-fun b!1515238 () Bool)

(declare-fun res!1033971 () Bool)

(declare-fun e!845787 () Bool)

(assert (=> b!1515238 (=> (not res!1033971) (not e!845787))))

(declare-fun lt!656628 () SeekEntryResult!12800)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101008 (_ BitVec 32)) SeekEntryResult!12800)

(assert (=> b!1515238 (= res!1033971 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48736 a!2804) j!70) a!2804 mask!2512) lt!656628))))

(declare-fun b!1515239 () Bool)

(assert (=> b!1515239 (= e!845791 e!845787)))

(declare-fun res!1033969 () Bool)

(assert (=> b!1515239 (=> (not res!1033969) (not e!845787))))

(declare-fun lt!656630 () SeekEntryResult!12800)

(assert (=> b!1515239 (= res!1033969 (= lt!656630 lt!656628))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1515239 (= lt!656628 (Intermediate!12800 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1515239 (= lt!656630 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48736 a!2804) j!70) mask!2512) (select (arr!48736 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1515240 () Bool)

(declare-fun res!1033975 () Bool)

(assert (=> b!1515240 (=> (not res!1033975) (not e!845791))))

(assert (=> b!1515240 (= res!1033975 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49287 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49287 a!2804))))))

(declare-fun b!1515241 () Bool)

(declare-fun e!845788 () Bool)

(declare-fun e!845790 () Bool)

(assert (=> b!1515241 (= e!845788 e!845790)))

(declare-fun res!1033964 () Bool)

(assert (=> b!1515241 (=> (not res!1033964) (not e!845790))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101008 (_ BitVec 32)) SeekEntryResult!12800)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101008 (_ BitVec 32)) SeekEntryResult!12800)

(assert (=> b!1515241 (= res!1033964 (= (seekEntryOrOpen!0 (select (arr!48736 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48736 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1515242 () Bool)

(declare-fun res!1033972 () Bool)

(assert (=> b!1515242 (=> (not res!1033972) (not e!845791))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1515242 (= res!1033972 (and (= (size!49287 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49287 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49287 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1515243 () Bool)

(declare-fun e!845789 () Bool)

(assert (=> b!1515243 (= e!845787 e!845789)))

(declare-fun res!1033966 () Bool)

(assert (=> b!1515243 (=> (not res!1033966) (not e!845789))))

(declare-fun lt!656631 () array!101008)

(declare-fun lt!656632 () (_ BitVec 64))

(assert (=> b!1515243 (= res!1033966 (= lt!656630 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!656632 mask!2512) lt!656632 lt!656631 mask!2512)))))

(assert (=> b!1515243 (= lt!656632 (select (store (arr!48736 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1515243 (= lt!656631 (array!101009 (store (arr!48736 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49287 a!2804)))))

(declare-fun b!1515244 () Bool)

(declare-fun res!1033963 () Bool)

(assert (=> b!1515244 (=> (not res!1033963) (not e!845791))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1515244 (= res!1033963 (validKeyInArray!0 (select (arr!48736 a!2804) j!70)))))

(declare-fun b!1515245 () Bool)

(declare-fun res!1033970 () Bool)

(assert (=> b!1515245 (=> (not res!1033970) (not e!845791))))

(declare-datatypes ((List!35206 0))(
  ( (Nil!35203) (Cons!35202 (h!36629 (_ BitVec 64)) (t!49892 List!35206)) )
))
(declare-fun arrayNoDuplicates!0 (array!101008 (_ BitVec 32) List!35206) Bool)

(assert (=> b!1515245 (= res!1033970 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35203))))

(declare-fun b!1515246 () Bool)

(declare-fun res!1033973 () Bool)

(assert (=> b!1515246 (=> (not res!1033973) (not e!845791))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101008 (_ BitVec 32)) Bool)

(assert (=> b!1515246 (= res!1033973 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1515247 () Bool)

(assert (=> b!1515247 (= e!845793 e!845788)))

(declare-fun res!1033976 () Bool)

(assert (=> b!1515247 (=> res!1033976 e!845788)))

(assert (=> b!1515247 (= res!1033976 (or (not (= (select (arr!48736 a!2804) j!70) lt!656632)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48736 a!2804) index!487) (select (arr!48736 a!2804) j!70)) (not (= (select (arr!48736 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1515248 () Bool)

(declare-fun res!1033965 () Bool)

(assert (=> b!1515248 (=> (not res!1033965) (not e!845791))))

(assert (=> b!1515248 (= res!1033965 (validKeyInArray!0 (select (arr!48736 a!2804) i!961)))))

(declare-fun b!1515249 () Bool)

(assert (=> b!1515249 (= e!845790 (= (seekEntryOrOpen!0 lt!656632 lt!656631 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!656632 lt!656631 mask!2512)))))

(declare-fun b!1515250 () Bool)

(assert (=> b!1515250 (= e!845789 (not true))))

(assert (=> b!1515250 e!845793))

(declare-fun res!1033967 () Bool)

(assert (=> b!1515250 (=> (not res!1033967) (not e!845793))))

(assert (=> b!1515250 (= res!1033967 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50503 0))(
  ( (Unit!50504) )
))
(declare-fun lt!656629 () Unit!50503)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101008 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50503)

(assert (=> b!1515250 (= lt!656629 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (= (and start!129338 res!1033974) b!1515242))

(assert (= (and b!1515242 res!1033972) b!1515248))

(assert (= (and b!1515248 res!1033965) b!1515244))

(assert (= (and b!1515244 res!1033963) b!1515246))

(assert (= (and b!1515246 res!1033973) b!1515245))

(assert (= (and b!1515245 res!1033970) b!1515240))

(assert (= (and b!1515240 res!1033975) b!1515239))

(assert (= (and b!1515239 res!1033969) b!1515238))

(assert (= (and b!1515238 res!1033971) b!1515243))

(assert (= (and b!1515243 res!1033966) b!1515250))

(assert (= (and b!1515250 res!1033967) b!1515237))

(assert (= (and b!1515237 res!1033968) b!1515247))

(assert (= (and b!1515247 (not res!1033976)) b!1515241))

(assert (= (and b!1515241 res!1033964) b!1515249))

(declare-fun m!1398057 () Bool)

(assert (=> b!1515246 m!1398057))

(declare-fun m!1398059 () Bool)

(assert (=> b!1515237 m!1398059))

(assert (=> b!1515237 m!1398059))

(declare-fun m!1398061 () Bool)

(assert (=> b!1515237 m!1398061))

(assert (=> b!1515241 m!1398059))

(assert (=> b!1515241 m!1398059))

(declare-fun m!1398063 () Bool)

(assert (=> b!1515241 m!1398063))

(assert (=> b!1515241 m!1398059))

(declare-fun m!1398065 () Bool)

(assert (=> b!1515241 m!1398065))

(declare-fun m!1398067 () Bool)

(assert (=> b!1515243 m!1398067))

(assert (=> b!1515243 m!1398067))

(declare-fun m!1398069 () Bool)

(assert (=> b!1515243 m!1398069))

(declare-fun m!1398071 () Bool)

(assert (=> b!1515243 m!1398071))

(declare-fun m!1398073 () Bool)

(assert (=> b!1515243 m!1398073))

(declare-fun m!1398075 () Bool)

(assert (=> b!1515248 m!1398075))

(assert (=> b!1515248 m!1398075))

(declare-fun m!1398077 () Bool)

(assert (=> b!1515248 m!1398077))

(assert (=> b!1515244 m!1398059))

(assert (=> b!1515244 m!1398059))

(declare-fun m!1398079 () Bool)

(assert (=> b!1515244 m!1398079))

(assert (=> b!1515247 m!1398059))

(declare-fun m!1398081 () Bool)

(assert (=> b!1515247 m!1398081))

(declare-fun m!1398083 () Bool)

(assert (=> start!129338 m!1398083))

(declare-fun m!1398085 () Bool)

(assert (=> start!129338 m!1398085))

(declare-fun m!1398087 () Bool)

(assert (=> b!1515249 m!1398087))

(declare-fun m!1398089 () Bool)

(assert (=> b!1515249 m!1398089))

(assert (=> b!1515238 m!1398059))

(assert (=> b!1515238 m!1398059))

(declare-fun m!1398091 () Bool)

(assert (=> b!1515238 m!1398091))

(declare-fun m!1398093 () Bool)

(assert (=> b!1515245 m!1398093))

(assert (=> b!1515239 m!1398059))

(assert (=> b!1515239 m!1398059))

(declare-fun m!1398095 () Bool)

(assert (=> b!1515239 m!1398095))

(assert (=> b!1515239 m!1398095))

(assert (=> b!1515239 m!1398059))

(declare-fun m!1398097 () Bool)

(assert (=> b!1515239 m!1398097))

(declare-fun m!1398099 () Bool)

(assert (=> b!1515250 m!1398099))

(declare-fun m!1398101 () Bool)

(assert (=> b!1515250 m!1398101))

(check-sat (not b!1515238) (not b!1515246) (not b!1515243) (not b!1515239) (not b!1515248) (not b!1515241) (not b!1515249) (not start!129338) (not b!1515250) (not b!1515245) (not b!1515237) (not b!1515244))
(check-sat)
