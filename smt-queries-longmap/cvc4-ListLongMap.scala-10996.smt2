; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128812 () Bool)

(assert start!128812)

(declare-fun b!1509398 () Bool)

(declare-fun res!1029302 () Bool)

(declare-fun e!843087 () Bool)

(assert (=> b!1509398 (=> (not res!1029302) (not e!843087))))

(declare-datatypes ((array!100668 0))(
  ( (array!100669 (arr!48571 (Array (_ BitVec 32) (_ BitVec 64))) (size!49121 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100668)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1509398 (= res!1029302 (validKeyInArray!0 (select (arr!48571 a!2804) i!961)))))

(declare-fun res!1029306 () Bool)

(assert (=> start!128812 (=> (not res!1029306) (not e!843087))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128812 (= res!1029306 (validMask!0 mask!2512))))

(assert (=> start!128812 e!843087))

(assert (=> start!128812 true))

(declare-fun array_inv!37599 (array!100668) Bool)

(assert (=> start!128812 (array_inv!37599 a!2804)))

(declare-fun b!1509399 () Bool)

(declare-fun res!1029307 () Bool)

(assert (=> b!1509399 (=> (not res!1029307) (not e!843087))))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1509399 (= res!1029307 (and (= (size!49121 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49121 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49121 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1509400 () Bool)

(declare-fun res!1029309 () Bool)

(assert (=> b!1509400 (=> (not res!1029309) (not e!843087))))

(declare-datatypes ((List!35054 0))(
  ( (Nil!35051) (Cons!35050 (h!36462 (_ BitVec 64)) (t!49748 List!35054)) )
))
(declare-fun arrayNoDuplicates!0 (array!100668 (_ BitVec 32) List!35054) Bool)

(assert (=> b!1509400 (= res!1029309 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35051))))

(declare-fun b!1509401 () Bool)

(declare-fun res!1029308 () Bool)

(assert (=> b!1509401 (=> (not res!1029308) (not e!843087))))

(assert (=> b!1509401 (= res!1029308 (validKeyInArray!0 (select (arr!48571 a!2804) j!70)))))

(declare-fun b!1509402 () Bool)

(declare-fun res!1029304 () Bool)

(declare-fun e!843088 () Bool)

(assert (=> b!1509402 (=> (not res!1029304) (not e!843088))))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12742 0))(
  ( (MissingZero!12742 (index!53363 (_ BitVec 32))) (Found!12742 (index!53364 (_ BitVec 32))) (Intermediate!12742 (undefined!13554 Bool) (index!53365 (_ BitVec 32)) (x!135116 (_ BitVec 32))) (Undefined!12742) (MissingVacant!12742 (index!53366 (_ BitVec 32))) )
))
(declare-fun lt!654883 () SeekEntryResult!12742)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100668 (_ BitVec 32)) SeekEntryResult!12742)

(assert (=> b!1509402 (= res!1029304 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48571 a!2804) j!70) a!2804 mask!2512) lt!654883))))

(declare-fun b!1509403 () Bool)

(declare-fun res!1029303 () Bool)

(assert (=> b!1509403 (=> (not res!1029303) (not e!843087))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100668 (_ BitVec 32)) Bool)

(assert (=> b!1509403 (= res!1029303 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1509404 () Bool)

(assert (=> b!1509404 (= e!843087 e!843088)))

(declare-fun res!1029301 () Bool)

(assert (=> b!1509404 (=> (not res!1029301) (not e!843088))))

(declare-fun lt!654881 () SeekEntryResult!12742)

(assert (=> b!1509404 (= res!1029301 (= lt!654881 lt!654883))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1509404 (= lt!654883 (Intermediate!12742 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1509404 (= lt!654881 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48571 a!2804) j!70) mask!2512) (select (arr!48571 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1509405 () Bool)

(assert (=> b!1509405 (= e!843088 (not true))))

(assert (=> b!1509405 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(declare-datatypes ((Unit!50352 0))(
  ( (Unit!50353) )
))
(declare-fun lt!654882 () Unit!50352)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100668 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50352)

(assert (=> b!1509405 (= lt!654882 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1509406 () Bool)

(declare-fun res!1029305 () Bool)

(assert (=> b!1509406 (=> (not res!1029305) (not e!843087))))

(assert (=> b!1509406 (= res!1029305 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49121 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49121 a!2804))))))

(declare-fun b!1509407 () Bool)

(declare-fun res!1029310 () Bool)

(assert (=> b!1509407 (=> (not res!1029310) (not e!843088))))

(assert (=> b!1509407 (= res!1029310 (= lt!654881 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48571 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48571 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100669 (store (arr!48571 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49121 a!2804)) mask!2512)))))

(assert (= (and start!128812 res!1029306) b!1509399))

(assert (= (and b!1509399 res!1029307) b!1509398))

(assert (= (and b!1509398 res!1029302) b!1509401))

(assert (= (and b!1509401 res!1029308) b!1509403))

(assert (= (and b!1509403 res!1029303) b!1509400))

(assert (= (and b!1509400 res!1029309) b!1509406))

(assert (= (and b!1509406 res!1029305) b!1509404))

(assert (= (and b!1509404 res!1029301) b!1509402))

(assert (= (and b!1509402 res!1029304) b!1509407))

(assert (= (and b!1509407 res!1029310) b!1509405))

(declare-fun m!1391871 () Bool)

(assert (=> b!1509403 m!1391871))

(declare-fun m!1391873 () Bool)

(assert (=> b!1509400 m!1391873))

(declare-fun m!1391875 () Bool)

(assert (=> b!1509401 m!1391875))

(assert (=> b!1509401 m!1391875))

(declare-fun m!1391877 () Bool)

(assert (=> b!1509401 m!1391877))

(declare-fun m!1391879 () Bool)

(assert (=> b!1509407 m!1391879))

(declare-fun m!1391881 () Bool)

(assert (=> b!1509407 m!1391881))

(assert (=> b!1509407 m!1391881))

(declare-fun m!1391883 () Bool)

(assert (=> b!1509407 m!1391883))

(assert (=> b!1509407 m!1391883))

(assert (=> b!1509407 m!1391881))

(declare-fun m!1391885 () Bool)

(assert (=> b!1509407 m!1391885))

(assert (=> b!1509402 m!1391875))

(assert (=> b!1509402 m!1391875))

(declare-fun m!1391887 () Bool)

(assert (=> b!1509402 m!1391887))

(declare-fun m!1391889 () Bool)

(assert (=> start!128812 m!1391889))

(declare-fun m!1391891 () Bool)

(assert (=> start!128812 m!1391891))

(declare-fun m!1391893 () Bool)

(assert (=> b!1509405 m!1391893))

(declare-fun m!1391895 () Bool)

(assert (=> b!1509405 m!1391895))

(declare-fun m!1391897 () Bool)

(assert (=> b!1509398 m!1391897))

(assert (=> b!1509398 m!1391897))

(declare-fun m!1391899 () Bool)

(assert (=> b!1509398 m!1391899))

(assert (=> b!1509404 m!1391875))

(assert (=> b!1509404 m!1391875))

(declare-fun m!1391901 () Bool)

(assert (=> b!1509404 m!1391901))

(assert (=> b!1509404 m!1391901))

(assert (=> b!1509404 m!1391875))

(declare-fun m!1391903 () Bool)

(assert (=> b!1509404 m!1391903))

(push 1)

