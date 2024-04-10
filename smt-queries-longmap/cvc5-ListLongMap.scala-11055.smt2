; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129162 () Bool)

(assert start!129162)

(declare-fun res!1035893 () Bool)

(declare-fun e!845980 () Bool)

(assert (=> start!129162 (=> (not res!1035893) (not e!845980))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129162 (= res!1035893 (validMask!0 mask!2512))))

(assert (=> start!129162 e!845980))

(assert (=> start!129162 true))

(declare-datatypes ((array!101018 0))(
  ( (array!101019 (arr!48746 (Array (_ BitVec 32) (_ BitVec 64))) (size!49296 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101018)

(declare-fun array_inv!37774 (array!101018) Bool)

(assert (=> start!129162 (array_inv!37774 a!2804)))

(declare-fun b!1515982 () Bool)

(declare-fun res!1035891 () Bool)

(assert (=> b!1515982 (=> (not res!1035891) (not e!845980))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101018 (_ BitVec 32)) Bool)

(assert (=> b!1515982 (= res!1035891 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1515983 () Bool)

(declare-fun res!1035888 () Bool)

(declare-fun e!845977 () Bool)

(assert (=> b!1515983 (=> (not res!1035888) (not e!845977))))

(declare-datatypes ((SeekEntryResult!12917 0))(
  ( (MissingZero!12917 (index!54063 (_ BitVec 32))) (Found!12917 (index!54064 (_ BitVec 32))) (Intermediate!12917 (undefined!13729 Bool) (index!54065 (_ BitVec 32)) (x!135763 (_ BitVec 32))) (Undefined!12917) (MissingVacant!12917 (index!54066 (_ BitVec 32))) )
))
(declare-fun lt!657266 () SeekEntryResult!12917)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101018 (_ BitVec 32)) SeekEntryResult!12917)

(assert (=> b!1515983 (= res!1035888 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48746 a!2804) j!70) a!2804 mask!2512) lt!657266))))

(declare-fun b!1515984 () Bool)

(declare-fun res!1035887 () Bool)

(assert (=> b!1515984 (=> (not res!1035887) (not e!845980))))

(declare-datatypes ((List!35229 0))(
  ( (Nil!35226) (Cons!35225 (h!36637 (_ BitVec 64)) (t!49923 List!35229)) )
))
(declare-fun arrayNoDuplicates!0 (array!101018 (_ BitVec 32) List!35229) Bool)

(assert (=> b!1515984 (= res!1035887 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35226))))

(declare-fun b!1515985 () Bool)

(declare-fun res!1035892 () Bool)

(assert (=> b!1515985 (=> (not res!1035892) (not e!845980))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1515985 (= res!1035892 (validKeyInArray!0 (select (arr!48746 a!2804) j!70)))))

(declare-fun b!1515986 () Bool)

(declare-fun res!1035885 () Bool)

(assert (=> b!1515986 (=> (not res!1035885) (not e!845977))))

(declare-fun lt!657267 () SeekEntryResult!12917)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1515986 (= res!1035885 (= lt!657267 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48746 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48746 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101019 (store (arr!48746 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49296 a!2804)) mask!2512)))))

(declare-fun b!1515987 () Bool)

(assert (=> b!1515987 (= e!845980 e!845977)))

(declare-fun res!1035894 () Bool)

(assert (=> b!1515987 (=> (not res!1035894) (not e!845977))))

(assert (=> b!1515987 (= res!1035894 (= lt!657267 lt!657266))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1515987 (= lt!657266 (Intermediate!12917 false resIndex!21 resX!21))))

(assert (=> b!1515987 (= lt!657267 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48746 a!2804) j!70) mask!2512) (select (arr!48746 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1515988 () Bool)

(declare-fun e!845978 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101018 (_ BitVec 32)) SeekEntryResult!12917)

(assert (=> b!1515988 (= e!845978 (= (seekEntry!0 (select (arr!48746 a!2804) j!70) a!2804 mask!2512) (Found!12917 j!70)))))

(declare-fun b!1515989 () Bool)

(declare-fun res!1035886 () Bool)

(assert (=> b!1515989 (=> (not res!1035886) (not e!845980))))

(assert (=> b!1515989 (= res!1035886 (validKeyInArray!0 (select (arr!48746 a!2804) i!961)))))

(declare-fun b!1515990 () Bool)

(declare-fun res!1035895 () Bool)

(assert (=> b!1515990 (=> (not res!1035895) (not e!845980))))

(assert (=> b!1515990 (= res!1035895 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49296 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49296 a!2804))))))

(declare-fun b!1515991 () Bool)

(assert (=> b!1515991 (= e!845977 (not true))))

(assert (=> b!1515991 e!845978))

(declare-fun res!1035890 () Bool)

(assert (=> b!1515991 (=> (not res!1035890) (not e!845978))))

(assert (=> b!1515991 (= res!1035890 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50702 0))(
  ( (Unit!50703) )
))
(declare-fun lt!657268 () Unit!50702)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101018 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50702)

(assert (=> b!1515991 (= lt!657268 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1515992 () Bool)

(declare-fun res!1035889 () Bool)

(assert (=> b!1515992 (=> (not res!1035889) (not e!845980))))

(assert (=> b!1515992 (= res!1035889 (and (= (size!49296 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49296 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49296 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!129162 res!1035893) b!1515992))

(assert (= (and b!1515992 res!1035889) b!1515989))

(assert (= (and b!1515989 res!1035886) b!1515985))

(assert (= (and b!1515985 res!1035892) b!1515982))

(assert (= (and b!1515982 res!1035891) b!1515984))

(assert (= (and b!1515984 res!1035887) b!1515990))

(assert (= (and b!1515990 res!1035895) b!1515987))

(assert (= (and b!1515987 res!1035894) b!1515983))

(assert (= (and b!1515983 res!1035888) b!1515986))

(assert (= (and b!1515986 res!1035885) b!1515991))

(assert (= (and b!1515991 res!1035890) b!1515988))

(declare-fun m!1399213 () Bool)

(assert (=> b!1515987 m!1399213))

(assert (=> b!1515987 m!1399213))

(declare-fun m!1399215 () Bool)

(assert (=> b!1515987 m!1399215))

(assert (=> b!1515987 m!1399215))

(assert (=> b!1515987 m!1399213))

(declare-fun m!1399217 () Bool)

(assert (=> b!1515987 m!1399217))

(assert (=> b!1515983 m!1399213))

(assert (=> b!1515983 m!1399213))

(declare-fun m!1399219 () Bool)

(assert (=> b!1515983 m!1399219))

(declare-fun m!1399221 () Bool)

(assert (=> start!129162 m!1399221))

(declare-fun m!1399223 () Bool)

(assert (=> start!129162 m!1399223))

(assert (=> b!1515988 m!1399213))

(assert (=> b!1515988 m!1399213))

(declare-fun m!1399225 () Bool)

(assert (=> b!1515988 m!1399225))

(declare-fun m!1399227 () Bool)

(assert (=> b!1515982 m!1399227))

(declare-fun m!1399229 () Bool)

(assert (=> b!1515984 m!1399229))

(declare-fun m!1399231 () Bool)

(assert (=> b!1515989 m!1399231))

(assert (=> b!1515989 m!1399231))

(declare-fun m!1399233 () Bool)

(assert (=> b!1515989 m!1399233))

(declare-fun m!1399235 () Bool)

(assert (=> b!1515991 m!1399235))

(declare-fun m!1399237 () Bool)

(assert (=> b!1515991 m!1399237))

(declare-fun m!1399239 () Bool)

(assert (=> b!1515986 m!1399239))

(declare-fun m!1399241 () Bool)

(assert (=> b!1515986 m!1399241))

(assert (=> b!1515986 m!1399241))

(declare-fun m!1399243 () Bool)

(assert (=> b!1515986 m!1399243))

(assert (=> b!1515986 m!1399243))

(assert (=> b!1515986 m!1399241))

(declare-fun m!1399245 () Bool)

(assert (=> b!1515986 m!1399245))

(assert (=> b!1515985 m!1399213))

(assert (=> b!1515985 m!1399213))

(declare-fun m!1399247 () Bool)

(assert (=> b!1515985 m!1399247))

(push 1)

