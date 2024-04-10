; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125884 () Bool)

(assert start!125884)

(declare-fun res!1000878 () Bool)

(declare-fun e!826897 () Bool)

(assert (=> start!125884 (=> (not res!1000878) (not e!826897))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125884 (= res!1000878 (validMask!0 mask!2687))))

(assert (=> start!125884 e!826897))

(assert (=> start!125884 true))

(declare-datatypes ((array!99161 0))(
  ( (array!99162 (arr!47864 (Array (_ BitVec 32) (_ BitVec 64))) (size!48414 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99161)

(declare-fun array_inv!36892 (array!99161) Bool)

(assert (=> start!125884 (array_inv!36892 a!2862)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!826898 () Bool)

(declare-fun b!1473565 () Bool)

(declare-fun lt!643972 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!12104 0))(
  ( (MissingZero!12104 (index!50808 (_ BitVec 32))) (Found!12104 (index!50809 (_ BitVec 32))) (Intermediate!12104 (undefined!12916 Bool) (index!50810 (_ BitVec 32)) (x!132396 (_ BitVec 32))) (Undefined!12104) (MissingVacant!12104 (index!50811 (_ BitVec 32))) )
))
(declare-fun lt!643970 () SeekEntryResult!12104)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!643971 () array!99161)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99161 (_ BitVec 32)) SeekEntryResult!12104)

(assert (=> b!1473565 (= e!826898 (= lt!643970 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!643972 lt!643971 mask!2687)))))

(declare-fun b!1473566 () Bool)

(declare-fun e!826893 () Bool)

(assert (=> b!1473566 (= e!826897 e!826893)))

(declare-fun res!1000869 () Bool)

(assert (=> b!1473566 (=> (not res!1000869) (not e!826893))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1473566 (= res!1000869 (= (select (store (arr!47864 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1473566 (= lt!643971 (array!99162 (store (arr!47864 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48414 a!2862)))))

(declare-fun b!1473567 () Bool)

(declare-fun e!826896 () Bool)

(declare-fun e!826892 () Bool)

(assert (=> b!1473567 (= e!826896 e!826892)))

(declare-fun res!1000881 () Bool)

(assert (=> b!1473567 (=> (not res!1000881) (not e!826892))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1473567 (= res!1000881 (= lt!643970 (Intermediate!12104 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1473567 (= lt!643970 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643972 mask!2687) lt!643972 lt!643971 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1473567 (= lt!643972 (select (store (arr!47864 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1473568 () Bool)

(declare-fun res!1000868 () Bool)

(assert (=> b!1473568 (=> (not res!1000868) (not e!826892))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1473568 (= res!1000868 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1473569 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99161 (_ BitVec 32)) SeekEntryResult!12104)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99161 (_ BitVec 32)) SeekEntryResult!12104)

(assert (=> b!1473569 (= e!826898 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!643972 lt!643971 mask!2687) (seekEntryOrOpen!0 lt!643972 lt!643971 mask!2687)))))

(declare-fun b!1473570 () Bool)

(declare-fun res!1000867 () Bool)

(assert (=> b!1473570 (=> (not res!1000867) (not e!826897))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1473570 (= res!1000867 (validKeyInArray!0 (select (arr!47864 a!2862) j!93)))))

(declare-fun b!1473571 () Bool)

(assert (=> b!1473571 (= e!826893 e!826896)))

(declare-fun res!1000872 () Bool)

(assert (=> b!1473571 (=> (not res!1000872) (not e!826896))))

(declare-fun lt!643973 () SeekEntryResult!12104)

(assert (=> b!1473571 (= res!1000872 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47864 a!2862) j!93) mask!2687) (select (arr!47864 a!2862) j!93) a!2862 mask!2687) lt!643973))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1473571 (= lt!643973 (Intermediate!12104 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1473572 () Bool)

(declare-fun e!826895 () Bool)

(assert (=> b!1473572 (= e!826892 (not e!826895))))

(declare-fun res!1000875 () Bool)

(assert (=> b!1473572 (=> res!1000875 e!826895)))

(assert (=> b!1473572 (= res!1000875 (or (not (= (select (arr!47864 a!2862) index!646) (select (store (arr!47864 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47864 a!2862) index!646) (select (arr!47864 a!2862) j!93)))))))

(declare-fun e!826891 () Bool)

(assert (=> b!1473572 e!826891))

(declare-fun res!1000876 () Bool)

(assert (=> b!1473572 (=> (not res!1000876) (not e!826891))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99161 (_ BitVec 32)) Bool)

(assert (=> b!1473572 (= res!1000876 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49548 0))(
  ( (Unit!49549) )
))
(declare-fun lt!643969 () Unit!49548)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99161 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49548)

(assert (=> b!1473572 (= lt!643969 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1473573 () Bool)

(declare-fun res!1000880 () Bool)

(assert (=> b!1473573 (=> (not res!1000880) (not e!826896))))

(assert (=> b!1473573 (= res!1000880 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47864 a!2862) j!93) a!2862 mask!2687) lt!643973))))

(declare-fun b!1473574 () Bool)

(declare-fun res!1000871 () Bool)

(assert (=> b!1473574 (=> (not res!1000871) (not e!826897))))

(declare-datatypes ((List!34365 0))(
  ( (Nil!34362) (Cons!34361 (h!35720 (_ BitVec 64)) (t!49059 List!34365)) )
))
(declare-fun arrayNoDuplicates!0 (array!99161 (_ BitVec 32) List!34365) Bool)

(assert (=> b!1473574 (= res!1000871 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34362))))

(declare-fun b!1473575 () Bool)

(declare-fun res!1000877 () Bool)

(assert (=> b!1473575 (=> (not res!1000877) (not e!826897))))

(assert (=> b!1473575 (= res!1000877 (and (= (size!48414 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48414 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48414 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1473576 () Bool)

(declare-fun res!1000882 () Bool)

(assert (=> b!1473576 (=> (not res!1000882) (not e!826897))))

(assert (=> b!1473576 (= res!1000882 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48414 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48414 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48414 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1473577 () Bool)

(declare-fun res!1000873 () Bool)

(assert (=> b!1473577 (=> (not res!1000873) (not e!826891))))

(assert (=> b!1473577 (= res!1000873 (= (seekEntryOrOpen!0 (select (arr!47864 a!2862) j!93) a!2862 mask!2687) (Found!12104 j!93)))))

(declare-fun b!1473578 () Bool)

(declare-fun res!1000874 () Bool)

(assert (=> b!1473578 (=> (not res!1000874) (not e!826897))))

(assert (=> b!1473578 (= res!1000874 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1473579 () Bool)

(assert (=> b!1473579 (= e!826891 (or (= (select (arr!47864 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47864 a!2862) intermediateBeforeIndex!19) (select (arr!47864 a!2862) j!93))))))

(declare-fun b!1473580 () Bool)

(assert (=> b!1473580 (= e!826895 true)))

(declare-fun lt!643974 () SeekEntryResult!12104)

(assert (=> b!1473580 (= lt!643974 (seekEntryOrOpen!0 lt!643972 lt!643971 mask!2687))))

(declare-fun b!1473581 () Bool)

(declare-fun res!1000870 () Bool)

(assert (=> b!1473581 (=> (not res!1000870) (not e!826892))))

(assert (=> b!1473581 (= res!1000870 e!826898)))

(declare-fun c!135864 () Bool)

(assert (=> b!1473581 (= c!135864 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1473582 () Bool)

(declare-fun res!1000879 () Bool)

(assert (=> b!1473582 (=> (not res!1000879) (not e!826897))))

(assert (=> b!1473582 (= res!1000879 (validKeyInArray!0 (select (arr!47864 a!2862) i!1006)))))

(assert (= (and start!125884 res!1000878) b!1473575))

(assert (= (and b!1473575 res!1000877) b!1473582))

(assert (= (and b!1473582 res!1000879) b!1473570))

(assert (= (and b!1473570 res!1000867) b!1473578))

(assert (= (and b!1473578 res!1000874) b!1473574))

(assert (= (and b!1473574 res!1000871) b!1473576))

(assert (= (and b!1473576 res!1000882) b!1473566))

(assert (= (and b!1473566 res!1000869) b!1473571))

(assert (= (and b!1473571 res!1000872) b!1473573))

(assert (= (and b!1473573 res!1000880) b!1473567))

(assert (= (and b!1473567 res!1000881) b!1473581))

(assert (= (and b!1473581 c!135864) b!1473565))

(assert (= (and b!1473581 (not c!135864)) b!1473569))

(assert (= (and b!1473581 res!1000870) b!1473568))

(assert (= (and b!1473568 res!1000868) b!1473572))

(assert (= (and b!1473572 res!1000876) b!1473577))

(assert (= (and b!1473577 res!1000873) b!1473579))

(assert (= (and b!1473572 (not res!1000875)) b!1473580))

(declare-fun m!1360081 () Bool)

(assert (=> b!1473565 m!1360081))

(declare-fun m!1360083 () Bool)

(assert (=> b!1473569 m!1360083))

(declare-fun m!1360085 () Bool)

(assert (=> b!1473569 m!1360085))

(declare-fun m!1360087 () Bool)

(assert (=> b!1473573 m!1360087))

(assert (=> b!1473573 m!1360087))

(declare-fun m!1360089 () Bool)

(assert (=> b!1473573 m!1360089))

(declare-fun m!1360091 () Bool)

(assert (=> b!1473566 m!1360091))

(declare-fun m!1360093 () Bool)

(assert (=> b!1473566 m!1360093))

(declare-fun m!1360095 () Bool)

(assert (=> b!1473578 m!1360095))

(declare-fun m!1360097 () Bool)

(assert (=> b!1473579 m!1360097))

(assert (=> b!1473579 m!1360087))

(assert (=> b!1473571 m!1360087))

(assert (=> b!1473571 m!1360087))

(declare-fun m!1360099 () Bool)

(assert (=> b!1473571 m!1360099))

(assert (=> b!1473571 m!1360099))

(assert (=> b!1473571 m!1360087))

(declare-fun m!1360101 () Bool)

(assert (=> b!1473571 m!1360101))

(declare-fun m!1360103 () Bool)

(assert (=> b!1473574 m!1360103))

(declare-fun m!1360105 () Bool)

(assert (=> b!1473572 m!1360105))

(assert (=> b!1473572 m!1360091))

(declare-fun m!1360107 () Bool)

(assert (=> b!1473572 m!1360107))

(declare-fun m!1360109 () Bool)

(assert (=> b!1473572 m!1360109))

(declare-fun m!1360111 () Bool)

(assert (=> b!1473572 m!1360111))

(assert (=> b!1473572 m!1360087))

(declare-fun m!1360113 () Bool)

(assert (=> start!125884 m!1360113))

(declare-fun m!1360115 () Bool)

(assert (=> start!125884 m!1360115))

(declare-fun m!1360117 () Bool)

(assert (=> b!1473582 m!1360117))

(assert (=> b!1473582 m!1360117))

(declare-fun m!1360119 () Bool)

(assert (=> b!1473582 m!1360119))

(assert (=> b!1473577 m!1360087))

(assert (=> b!1473577 m!1360087))

(declare-fun m!1360121 () Bool)

(assert (=> b!1473577 m!1360121))

(declare-fun m!1360123 () Bool)

(assert (=> b!1473567 m!1360123))

(assert (=> b!1473567 m!1360123))

(declare-fun m!1360125 () Bool)

(assert (=> b!1473567 m!1360125))

(assert (=> b!1473567 m!1360091))

(declare-fun m!1360127 () Bool)

(assert (=> b!1473567 m!1360127))

(assert (=> b!1473580 m!1360085))

(assert (=> b!1473570 m!1360087))

(assert (=> b!1473570 m!1360087))

(declare-fun m!1360129 () Bool)

(assert (=> b!1473570 m!1360129))

(push 1)

