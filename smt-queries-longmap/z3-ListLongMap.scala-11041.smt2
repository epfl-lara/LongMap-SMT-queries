; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129026 () Bool)

(assert start!129026)

(declare-fun res!1034067 () Bool)

(declare-fun e!844879 () Bool)

(assert (=> start!129026 (=> (not res!1034067) (not e!844879))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129026 (= res!1034067 (validMask!0 mask!2512))))

(assert (=> start!129026 e!844879))

(assert (=> start!129026 true))

(declare-datatypes ((array!100882 0))(
  ( (array!100883 (arr!48679 (Array (_ BitVec 32) (_ BitVec 64))) (size!49231 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100882)

(declare-fun array_inv!37912 (array!100882) Bool)

(assert (=> start!129026 (array_inv!37912 a!2804)))

(declare-fun e!844882 () Bool)

(declare-fun b!1513947 () Bool)

(declare-fun lt!655986 () array!100882)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun lt!655989 () (_ BitVec 64))

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12873 0))(
  ( (MissingZero!12873 (index!53887 (_ BitVec 32))) (Found!12873 (index!53888 (_ BitVec 32))) (Intermediate!12873 (undefined!13685 Bool) (index!53889 (_ BitVec 32)) (x!135601 (_ BitVec 32))) (Undefined!12873) (MissingVacant!12873 (index!53890 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100882 (_ BitVec 32)) SeekEntryResult!12873)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100882 (_ BitVec 32)) SeekEntryResult!12873)

(assert (=> b!1513947 (= e!844882 (= (seekEntryOrOpen!0 lt!655989 lt!655986 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!655989 lt!655986 mask!2512)))))

(declare-fun b!1513948 () Bool)

(declare-fun e!844881 () Bool)

(declare-fun e!844884 () Bool)

(assert (=> b!1513948 (= e!844881 e!844884)))

(declare-fun res!1034057 () Bool)

(assert (=> b!1513948 (=> (not res!1034057) (not e!844884))))

(declare-fun lt!655985 () SeekEntryResult!12873)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100882 (_ BitVec 32)) SeekEntryResult!12873)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1513948 (= res!1034057 (= lt!655985 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!655989 mask!2512) lt!655989 lt!655986 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1513948 (= lt!655989 (select (store (arr!48679 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1513948 (= lt!655986 (array!100883 (store (arr!48679 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49231 a!2804)))))

(declare-fun b!1513949 () Bool)

(declare-fun res!1034062 () Bool)

(assert (=> b!1513949 (=> (not res!1034062) (not e!844879))))

(declare-datatypes ((List!35240 0))(
  ( (Nil!35237) (Cons!35236 (h!36649 (_ BitVec 64)) (t!49926 List!35240)) )
))
(declare-fun arrayNoDuplicates!0 (array!100882 (_ BitVec 32) List!35240) Bool)

(assert (=> b!1513949 (= res!1034062 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35237))))

(declare-fun b!1513950 () Bool)

(assert (=> b!1513950 (= e!844884 (not true))))

(declare-fun e!844878 () Bool)

(assert (=> b!1513950 e!844878))

(declare-fun res!1034065 () Bool)

(assert (=> b!1513950 (=> (not res!1034065) (not e!844878))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100882 (_ BitVec 32)) Bool)

(assert (=> b!1513950 (= res!1034065 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50453 0))(
  ( (Unit!50454) )
))
(declare-fun lt!655987 () Unit!50453)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100882 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50453)

(assert (=> b!1513950 (= lt!655987 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1513951 () Bool)

(declare-fun res!1034059 () Bool)

(assert (=> b!1513951 (=> (not res!1034059) (not e!844879))))

(assert (=> b!1513951 (= res!1034059 (and (= (size!49231 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49231 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49231 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1513952 () Bool)

(assert (=> b!1513952 (= e!844879 e!844881)))

(declare-fun res!1034060 () Bool)

(assert (=> b!1513952 (=> (not res!1034060) (not e!844881))))

(declare-fun lt!655988 () SeekEntryResult!12873)

(assert (=> b!1513952 (= res!1034060 (= lt!655985 lt!655988))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1513952 (= lt!655988 (Intermediate!12873 false resIndex!21 resX!21))))

(assert (=> b!1513952 (= lt!655985 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48679 a!2804) j!70) mask!2512) (select (arr!48679 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1513953 () Bool)

(declare-fun e!844883 () Bool)

(assert (=> b!1513953 (= e!844878 e!844883)))

(declare-fun res!1034061 () Bool)

(assert (=> b!1513953 (=> res!1034061 e!844883)))

(assert (=> b!1513953 (= res!1034061 (or (not (= (select (arr!48679 a!2804) j!70) lt!655989)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48679 a!2804) index!487) (select (arr!48679 a!2804) j!70)) (not (= (select (arr!48679 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1513954 () Bool)

(declare-fun res!1034058 () Bool)

(assert (=> b!1513954 (=> (not res!1034058) (not e!844879))))

(assert (=> b!1513954 (= res!1034058 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49231 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49231 a!2804))))))

(declare-fun b!1513955 () Bool)

(declare-fun res!1034068 () Bool)

(assert (=> b!1513955 (=> (not res!1034068) (not e!844879))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1513955 (= res!1034068 (validKeyInArray!0 (select (arr!48679 a!2804) i!961)))))

(declare-fun b!1513956 () Bool)

(declare-fun res!1034056 () Bool)

(assert (=> b!1513956 (=> (not res!1034056) (not e!844879))))

(assert (=> b!1513956 (= res!1034056 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1513957 () Bool)

(declare-fun res!1034064 () Bool)

(assert (=> b!1513957 (=> (not res!1034064) (not e!844878))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100882 (_ BitVec 32)) SeekEntryResult!12873)

(assert (=> b!1513957 (= res!1034064 (= (seekEntry!0 (select (arr!48679 a!2804) j!70) a!2804 mask!2512) (Found!12873 j!70)))))

(declare-fun b!1513958 () Bool)

(declare-fun res!1034069 () Bool)

(assert (=> b!1513958 (=> (not res!1034069) (not e!844879))))

(assert (=> b!1513958 (= res!1034069 (validKeyInArray!0 (select (arr!48679 a!2804) j!70)))))

(declare-fun b!1513959 () Bool)

(declare-fun res!1034066 () Bool)

(assert (=> b!1513959 (=> (not res!1034066) (not e!844881))))

(assert (=> b!1513959 (= res!1034066 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48679 a!2804) j!70) a!2804 mask!2512) lt!655988))))

(declare-fun b!1513960 () Bool)

(assert (=> b!1513960 (= e!844883 e!844882)))

(declare-fun res!1034063 () Bool)

(assert (=> b!1513960 (=> (not res!1034063) (not e!844882))))

(assert (=> b!1513960 (= res!1034063 (= (seekEntryOrOpen!0 (select (arr!48679 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48679 a!2804) j!70) a!2804 mask!2512)))))

(assert (= (and start!129026 res!1034067) b!1513951))

(assert (= (and b!1513951 res!1034059) b!1513955))

(assert (= (and b!1513955 res!1034068) b!1513958))

(assert (= (and b!1513958 res!1034069) b!1513956))

(assert (= (and b!1513956 res!1034056) b!1513949))

(assert (= (and b!1513949 res!1034062) b!1513954))

(assert (= (and b!1513954 res!1034058) b!1513952))

(assert (= (and b!1513952 res!1034060) b!1513959))

(assert (= (and b!1513959 res!1034066) b!1513948))

(assert (= (and b!1513948 res!1034057) b!1513950))

(assert (= (and b!1513950 res!1034065) b!1513957))

(assert (= (and b!1513957 res!1034064) b!1513953))

(assert (= (and b!1513953 (not res!1034061)) b!1513960))

(assert (= (and b!1513960 res!1034063) b!1513947))

(declare-fun m!1396319 () Bool)

(assert (=> b!1513956 m!1396319))

(declare-fun m!1396321 () Bool)

(assert (=> b!1513955 m!1396321))

(assert (=> b!1513955 m!1396321))

(declare-fun m!1396323 () Bool)

(assert (=> b!1513955 m!1396323))

(declare-fun m!1396325 () Bool)

(assert (=> b!1513949 m!1396325))

(declare-fun m!1396327 () Bool)

(assert (=> b!1513958 m!1396327))

(assert (=> b!1513958 m!1396327))

(declare-fun m!1396329 () Bool)

(assert (=> b!1513958 m!1396329))

(declare-fun m!1396331 () Bool)

(assert (=> b!1513947 m!1396331))

(declare-fun m!1396333 () Bool)

(assert (=> b!1513947 m!1396333))

(assert (=> b!1513952 m!1396327))

(assert (=> b!1513952 m!1396327))

(declare-fun m!1396335 () Bool)

(assert (=> b!1513952 m!1396335))

(assert (=> b!1513952 m!1396335))

(assert (=> b!1513952 m!1396327))

(declare-fun m!1396337 () Bool)

(assert (=> b!1513952 m!1396337))

(declare-fun m!1396339 () Bool)

(assert (=> b!1513948 m!1396339))

(assert (=> b!1513948 m!1396339))

(declare-fun m!1396341 () Bool)

(assert (=> b!1513948 m!1396341))

(declare-fun m!1396343 () Bool)

(assert (=> b!1513948 m!1396343))

(declare-fun m!1396345 () Bool)

(assert (=> b!1513948 m!1396345))

(declare-fun m!1396347 () Bool)

(assert (=> start!129026 m!1396347))

(declare-fun m!1396349 () Bool)

(assert (=> start!129026 m!1396349))

(declare-fun m!1396351 () Bool)

(assert (=> b!1513950 m!1396351))

(declare-fun m!1396353 () Bool)

(assert (=> b!1513950 m!1396353))

(assert (=> b!1513960 m!1396327))

(assert (=> b!1513960 m!1396327))

(declare-fun m!1396355 () Bool)

(assert (=> b!1513960 m!1396355))

(assert (=> b!1513960 m!1396327))

(declare-fun m!1396357 () Bool)

(assert (=> b!1513960 m!1396357))

(assert (=> b!1513959 m!1396327))

(assert (=> b!1513959 m!1396327))

(declare-fun m!1396359 () Bool)

(assert (=> b!1513959 m!1396359))

(assert (=> b!1513957 m!1396327))

(assert (=> b!1513957 m!1396327))

(declare-fun m!1396361 () Bool)

(assert (=> b!1513957 m!1396361))

(assert (=> b!1513953 m!1396327))

(declare-fun m!1396363 () Bool)

(assert (=> b!1513953 m!1396363))

(check-sat (not b!1513950) (not b!1513958) (not b!1513956) (not b!1513949) (not start!129026) (not b!1513955) (not b!1513952) (not b!1513947) (not b!1513960) (not b!1513948) (not b!1513957) (not b!1513959))
(check-sat)
