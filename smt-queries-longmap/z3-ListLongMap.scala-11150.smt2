; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130212 () Bool)

(assert start!130212)

(declare-fun b!1528967 () Bool)

(declare-fun res!1046865 () Bool)

(declare-fun e!852069 () Bool)

(assert (=> b!1528967 (=> (not res!1046865) (not e!852069))))

(declare-datatypes ((array!101560 0))(
  ( (array!101561 (arr!49006 (Array (_ BitVec 32) (_ BitVec 64))) (size!49558 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101560)

(declare-datatypes ((List!35567 0))(
  ( (Nil!35564) (Cons!35563 (h!37000 (_ BitVec 64)) (t!50253 List!35567)) )
))
(declare-fun arrayNoDuplicates!0 (array!101560 (_ BitVec 32) List!35567) Bool)

(assert (=> b!1528967 (= res!1046865 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35564))))

(declare-fun b!1528968 () Bool)

(declare-fun e!852067 () Bool)

(assert (=> b!1528968 (= e!852069 e!852067)))

(declare-fun res!1046868 () Bool)

(assert (=> b!1528968 (=> (not res!1046868) (not e!852067))))

(declare-datatypes ((SeekEntryResult!13194 0))(
  ( (MissingZero!13194 (index!55171 (_ BitVec 32))) (Found!13194 (index!55172 (_ BitVec 32))) (Intermediate!13194 (undefined!14006 Bool) (index!55173 (_ BitVec 32)) (x!136860 (_ BitVec 32))) (Undefined!13194) (MissingVacant!13194 (index!55174 (_ BitVec 32))) )
))
(declare-fun lt!662096 () SeekEntryResult!13194)

(declare-fun lt!662097 () SeekEntryResult!13194)

(assert (=> b!1528968 (= res!1046868 (= lt!662096 lt!662097))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1528968 (= lt!662097 (Intermediate!13194 false resIndex!21 resX!21))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101560 (_ BitVec 32)) SeekEntryResult!13194)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1528968 (= lt!662096 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49006 a!2804) j!70) mask!2512) (select (arr!49006 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1528969 () Bool)

(declare-fun res!1046869 () Bool)

(assert (=> b!1528969 (=> (not res!1046869) (not e!852069))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1528969 (= res!1046869 (validKeyInArray!0 (select (arr!49006 a!2804) i!961)))))

(declare-fun b!1528970 () Bool)

(declare-fun e!852066 () Bool)

(assert (=> b!1528970 (= e!852067 (not e!852066))))

(declare-fun res!1046860 () Bool)

(assert (=> b!1528970 (=> res!1046860 e!852066)))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1528970 (= res!1046860 (or (not (= (select (arr!49006 a!2804) j!70) (select (store (arr!49006 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!852068 () Bool)

(assert (=> b!1528970 e!852068))

(declare-fun res!1046858 () Bool)

(assert (=> b!1528970 (=> (not res!1046858) (not e!852068))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101560 (_ BitVec 32)) Bool)

(assert (=> b!1528970 (= res!1046858 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51011 0))(
  ( (Unit!51012) )
))
(declare-fun lt!662094 () Unit!51011)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101560 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51011)

(assert (=> b!1528970 (= lt!662094 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun res!1046859 () Bool)

(assert (=> start!130212 (=> (not res!1046859) (not e!852069))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130212 (= res!1046859 (validMask!0 mask!2512))))

(assert (=> start!130212 e!852069))

(assert (=> start!130212 true))

(declare-fun array_inv!38239 (array!101560) Bool)

(assert (=> start!130212 (array_inv!38239 a!2804)))

(declare-fun b!1528971 () Bool)

(declare-fun res!1046864 () Bool)

(assert (=> b!1528971 (=> (not res!1046864) (not e!852069))))

(assert (=> b!1528971 (= res!1046864 (and (= (size!49558 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49558 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49558 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1528972 () Bool)

(declare-fun res!1046863 () Bool)

(assert (=> b!1528972 (=> (not res!1046863) (not e!852067))))

(declare-fun index!487 () (_ BitVec 32))

(assert (=> b!1528972 (= res!1046863 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49006 a!2804) j!70) a!2804 mask!2512) lt!662097))))

(declare-fun b!1528973 () Bool)

(declare-fun res!1046866 () Bool)

(assert (=> b!1528973 (=> (not res!1046866) (not e!852067))))

(assert (=> b!1528973 (= res!1046866 (= lt!662096 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49006 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49006 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101561 (store (arr!49006 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49558 a!2804)) mask!2512)))))

(declare-fun b!1528974 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101560 (_ BitVec 32)) SeekEntryResult!13194)

(assert (=> b!1528974 (= e!852068 (= (seekEntry!0 (select (arr!49006 a!2804) j!70) a!2804 mask!2512) (Found!13194 j!70)))))

(declare-fun b!1528975 () Bool)

(declare-fun res!1046862 () Bool)

(assert (=> b!1528975 (=> (not res!1046862) (not e!852069))))

(assert (=> b!1528975 (= res!1046862 (validKeyInArray!0 (select (arr!49006 a!2804) j!70)))))

(declare-fun b!1528976 () Bool)

(declare-fun res!1046867 () Bool)

(assert (=> b!1528976 (=> (not res!1046867) (not e!852069))))

(assert (=> b!1528976 (= res!1046867 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49558 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49558 a!2804))))))

(declare-fun b!1528977 () Bool)

(declare-fun res!1046861 () Bool)

(assert (=> b!1528977 (=> (not res!1046861) (not e!852069))))

(assert (=> b!1528977 (= res!1046861 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1528978 () Bool)

(assert (=> b!1528978 (= e!852066 true)))

(declare-fun lt!662095 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1528978 (= lt!662095 (nextIndex!0 index!487 x!534 mask!2512))))

(assert (= (and start!130212 res!1046859) b!1528971))

(assert (= (and b!1528971 res!1046864) b!1528969))

(assert (= (and b!1528969 res!1046869) b!1528975))

(assert (= (and b!1528975 res!1046862) b!1528977))

(assert (= (and b!1528977 res!1046861) b!1528967))

(assert (= (and b!1528967 res!1046865) b!1528976))

(assert (= (and b!1528976 res!1046867) b!1528968))

(assert (= (and b!1528968 res!1046868) b!1528972))

(assert (= (and b!1528972 res!1046863) b!1528973))

(assert (= (and b!1528973 res!1046866) b!1528970))

(assert (= (and b!1528970 res!1046858) b!1528974))

(assert (= (and b!1528970 (not res!1046860)) b!1528978))

(declare-fun m!1411325 () Bool)

(assert (=> b!1528978 m!1411325))

(declare-fun m!1411327 () Bool)

(assert (=> b!1528975 m!1411327))

(assert (=> b!1528975 m!1411327))

(declare-fun m!1411329 () Bool)

(assert (=> b!1528975 m!1411329))

(assert (=> b!1528974 m!1411327))

(assert (=> b!1528974 m!1411327))

(declare-fun m!1411331 () Bool)

(assert (=> b!1528974 m!1411331))

(assert (=> b!1528970 m!1411327))

(declare-fun m!1411333 () Bool)

(assert (=> b!1528970 m!1411333))

(declare-fun m!1411335 () Bool)

(assert (=> b!1528970 m!1411335))

(declare-fun m!1411337 () Bool)

(assert (=> b!1528970 m!1411337))

(declare-fun m!1411339 () Bool)

(assert (=> b!1528970 m!1411339))

(declare-fun m!1411341 () Bool)

(assert (=> b!1528977 m!1411341))

(assert (=> b!1528973 m!1411335))

(assert (=> b!1528973 m!1411337))

(assert (=> b!1528973 m!1411337))

(declare-fun m!1411343 () Bool)

(assert (=> b!1528973 m!1411343))

(assert (=> b!1528973 m!1411343))

(assert (=> b!1528973 m!1411337))

(declare-fun m!1411345 () Bool)

(assert (=> b!1528973 m!1411345))

(assert (=> b!1528972 m!1411327))

(assert (=> b!1528972 m!1411327))

(declare-fun m!1411347 () Bool)

(assert (=> b!1528972 m!1411347))

(assert (=> b!1528968 m!1411327))

(assert (=> b!1528968 m!1411327))

(declare-fun m!1411349 () Bool)

(assert (=> b!1528968 m!1411349))

(assert (=> b!1528968 m!1411349))

(assert (=> b!1528968 m!1411327))

(declare-fun m!1411351 () Bool)

(assert (=> b!1528968 m!1411351))

(declare-fun m!1411353 () Bool)

(assert (=> b!1528969 m!1411353))

(assert (=> b!1528969 m!1411353))

(declare-fun m!1411355 () Bool)

(assert (=> b!1528969 m!1411355))

(declare-fun m!1411357 () Bool)

(assert (=> start!130212 m!1411357))

(declare-fun m!1411359 () Bool)

(assert (=> start!130212 m!1411359))

(declare-fun m!1411361 () Bool)

(assert (=> b!1528967 m!1411361))

(check-sat (not start!130212) (not b!1528978) (not b!1528975) (not b!1528972) (not b!1528969) (not b!1528967) (not b!1528977) (not b!1528974) (not b!1528968) (not b!1528970) (not b!1528973))
(check-sat)
