; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129202 () Bool)

(assert start!129202)

(declare-fun b!1516694 () Bool)

(declare-fun res!1036598 () Bool)

(declare-fun e!846273 () Bool)

(assert (=> b!1516694 (=> (not res!1036598) (not e!846273))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!101058 0))(
  ( (array!101059 (arr!48766 (Array (_ BitVec 32) (_ BitVec 64))) (size!49316 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101058)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1516694 (= res!1036598 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49316 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49316 a!2804))))))

(declare-fun b!1516695 () Bool)

(declare-fun e!846270 () Bool)

(assert (=> b!1516695 (= e!846270 true)))

(declare-fun lt!657502 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12937 0))(
  ( (MissingZero!12937 (index!54143 (_ BitVec 32))) (Found!12937 (index!54144 (_ BitVec 32))) (Intermediate!12937 (undefined!13749 Bool) (index!54145 (_ BitVec 32)) (x!135831 (_ BitVec 32))) (Undefined!12937) (MissingVacant!12937 (index!54146 (_ BitVec 32))) )
))
(declare-fun lt!657499 () SeekEntryResult!12937)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101058 (_ BitVec 32)) SeekEntryResult!12937)

(assert (=> b!1516695 (= lt!657499 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!657502 (select (arr!48766 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1516696 () Bool)

(declare-fun res!1036605 () Bool)

(assert (=> b!1516696 (=> (not res!1036605) (not e!846273))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1516696 (= res!1036605 (and (= (size!49316 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49316 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49316 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1516697 () Bool)

(declare-fun res!1036601 () Bool)

(assert (=> b!1516697 (=> (not res!1036601) (not e!846273))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101058 (_ BitVec 32)) Bool)

(assert (=> b!1516697 (= res!1036601 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1516698 () Bool)

(declare-fun res!1036603 () Bool)

(declare-fun e!846272 () Bool)

(assert (=> b!1516698 (=> (not res!1036603) (not e!846272))))

(declare-fun lt!657501 () SeekEntryResult!12937)

(assert (=> b!1516698 (= res!1036603 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48766 a!2804) j!70) a!2804 mask!2512) lt!657501))))

(declare-fun res!1036607 () Bool)

(assert (=> start!129202 (=> (not res!1036607) (not e!846273))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129202 (= res!1036607 (validMask!0 mask!2512))))

(assert (=> start!129202 e!846273))

(assert (=> start!129202 true))

(declare-fun array_inv!37794 (array!101058) Bool)

(assert (=> start!129202 (array_inv!37794 a!2804)))

(declare-fun b!1516699 () Bool)

(declare-fun res!1036608 () Bool)

(assert (=> b!1516699 (=> (not res!1036608) (not e!846273))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1516699 (= res!1036608 (validKeyInArray!0 (select (arr!48766 a!2804) i!961)))))

(declare-fun b!1516700 () Bool)

(declare-fun e!846271 () Bool)

(assert (=> b!1516700 (= e!846272 (not e!846271))))

(declare-fun res!1036602 () Bool)

(assert (=> b!1516700 (=> res!1036602 e!846271)))

(assert (=> b!1516700 (= res!1036602 (or (not (= (select (arr!48766 a!2804) j!70) (select (store (arr!48766 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!846274 () Bool)

(assert (=> b!1516700 e!846274))

(declare-fun res!1036599 () Bool)

(assert (=> b!1516700 (=> (not res!1036599) (not e!846274))))

(assert (=> b!1516700 (= res!1036599 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50742 0))(
  ( (Unit!50743) )
))
(declare-fun lt!657500 () Unit!50742)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101058 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50742)

(assert (=> b!1516700 (= lt!657500 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1516701 () Bool)

(assert (=> b!1516701 (= e!846271 e!846270)))

(declare-fun res!1036600 () Bool)

(assert (=> b!1516701 (=> res!1036600 e!846270)))

(assert (=> b!1516701 (= res!1036600 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!657502 #b00000000000000000000000000000000) (bvsge lt!657502 (size!49316 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1516701 (= lt!657502 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1516702 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101058 (_ BitVec 32)) SeekEntryResult!12937)

(assert (=> b!1516702 (= e!846274 (= (seekEntry!0 (select (arr!48766 a!2804) j!70) a!2804 mask!2512) (Found!12937 j!70)))))

(declare-fun b!1516703 () Bool)

(declare-fun res!1036609 () Bool)

(assert (=> b!1516703 (=> (not res!1036609) (not e!846273))))

(declare-datatypes ((List!35249 0))(
  ( (Nil!35246) (Cons!35245 (h!36657 (_ BitVec 64)) (t!49943 List!35249)) )
))
(declare-fun arrayNoDuplicates!0 (array!101058 (_ BitVec 32) List!35249) Bool)

(assert (=> b!1516703 (= res!1036609 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35246))))

(declare-fun b!1516704 () Bool)

(assert (=> b!1516704 (= e!846273 e!846272)))

(declare-fun res!1036597 () Bool)

(assert (=> b!1516704 (=> (not res!1036597) (not e!846272))))

(declare-fun lt!657498 () SeekEntryResult!12937)

(assert (=> b!1516704 (= res!1036597 (= lt!657498 lt!657501))))

(assert (=> b!1516704 (= lt!657501 (Intermediate!12937 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1516704 (= lt!657498 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48766 a!2804) j!70) mask!2512) (select (arr!48766 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1516705 () Bool)

(declare-fun res!1036604 () Bool)

(assert (=> b!1516705 (=> (not res!1036604) (not e!846273))))

(assert (=> b!1516705 (= res!1036604 (validKeyInArray!0 (select (arr!48766 a!2804) j!70)))))

(declare-fun b!1516706 () Bool)

(declare-fun res!1036606 () Bool)

(assert (=> b!1516706 (=> (not res!1036606) (not e!846272))))

(assert (=> b!1516706 (= res!1036606 (= lt!657498 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48766 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48766 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101059 (store (arr!48766 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49316 a!2804)) mask!2512)))))

(assert (= (and start!129202 res!1036607) b!1516696))

(assert (= (and b!1516696 res!1036605) b!1516699))

(assert (= (and b!1516699 res!1036608) b!1516705))

(assert (= (and b!1516705 res!1036604) b!1516697))

(assert (= (and b!1516697 res!1036601) b!1516703))

(assert (= (and b!1516703 res!1036609) b!1516694))

(assert (= (and b!1516694 res!1036598) b!1516704))

(assert (= (and b!1516704 res!1036597) b!1516698))

(assert (= (and b!1516698 res!1036603) b!1516706))

(assert (= (and b!1516706 res!1036606) b!1516700))

(assert (= (and b!1516700 res!1036599) b!1516702))

(assert (= (and b!1516700 (not res!1036602)) b!1516701))

(assert (= (and b!1516701 (not res!1036600)) b!1516695))

(declare-fun m!1399965 () Bool)

(assert (=> b!1516697 m!1399965))

(declare-fun m!1399967 () Bool)

(assert (=> b!1516698 m!1399967))

(assert (=> b!1516698 m!1399967))

(declare-fun m!1399969 () Bool)

(assert (=> b!1516698 m!1399969))

(declare-fun m!1399971 () Bool)

(assert (=> start!129202 m!1399971))

(declare-fun m!1399973 () Bool)

(assert (=> start!129202 m!1399973))

(assert (=> b!1516702 m!1399967))

(assert (=> b!1516702 m!1399967))

(declare-fun m!1399975 () Bool)

(assert (=> b!1516702 m!1399975))

(declare-fun m!1399977 () Bool)

(assert (=> b!1516699 m!1399977))

(assert (=> b!1516699 m!1399977))

(declare-fun m!1399979 () Bool)

(assert (=> b!1516699 m!1399979))

(assert (=> b!1516704 m!1399967))

(assert (=> b!1516704 m!1399967))

(declare-fun m!1399981 () Bool)

(assert (=> b!1516704 m!1399981))

(assert (=> b!1516704 m!1399981))

(assert (=> b!1516704 m!1399967))

(declare-fun m!1399983 () Bool)

(assert (=> b!1516704 m!1399983))

(declare-fun m!1399985 () Bool)

(assert (=> b!1516701 m!1399985))

(assert (=> b!1516700 m!1399967))

(declare-fun m!1399987 () Bool)

(assert (=> b!1516700 m!1399987))

(declare-fun m!1399989 () Bool)

(assert (=> b!1516700 m!1399989))

(declare-fun m!1399991 () Bool)

(assert (=> b!1516700 m!1399991))

(declare-fun m!1399993 () Bool)

(assert (=> b!1516700 m!1399993))

(declare-fun m!1399995 () Bool)

(assert (=> b!1516703 m!1399995))

(assert (=> b!1516695 m!1399967))

(assert (=> b!1516695 m!1399967))

(declare-fun m!1399997 () Bool)

(assert (=> b!1516695 m!1399997))

(assert (=> b!1516705 m!1399967))

(assert (=> b!1516705 m!1399967))

(declare-fun m!1399999 () Bool)

(assert (=> b!1516705 m!1399999))

(assert (=> b!1516706 m!1399989))

(assert (=> b!1516706 m!1399991))

(assert (=> b!1516706 m!1399991))

(declare-fun m!1400001 () Bool)

(assert (=> b!1516706 m!1400001))

(assert (=> b!1516706 m!1400001))

(assert (=> b!1516706 m!1399991))

(declare-fun m!1400003 () Bool)

(assert (=> b!1516706 m!1400003))

(push 1)

(assert (not b!1516695))

