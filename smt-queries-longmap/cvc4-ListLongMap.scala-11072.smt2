; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129268 () Bool)

(assert start!129268)

(declare-fun b!1517981 () Bool)

(declare-fun res!1037888 () Bool)

(declare-fun e!846864 () Bool)

(assert (=> b!1517981 (=> (not res!1037888) (not e!846864))))

(declare-datatypes ((SeekEntryResult!12970 0))(
  ( (MissingZero!12970 (index!54275 (_ BitVec 32))) (Found!12970 (index!54276 (_ BitVec 32))) (Intermediate!12970 (undefined!13782 Bool) (index!54277 (_ BitVec 32)) (x!135952 (_ BitVec 32))) (Undefined!12970) (MissingVacant!12970 (index!54278 (_ BitVec 32))) )
))
(declare-fun lt!657996 () SeekEntryResult!12970)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!101124 0))(
  ( (array!101125 (arr!48799 (Array (_ BitVec 32) (_ BitVec 64))) (size!49349 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101124)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101124 (_ BitVec 32)) SeekEntryResult!12970)

(assert (=> b!1517981 (= res!1037888 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48799 a!2804) j!70) a!2804 mask!2512) lt!657996))))

(declare-fun b!1517982 () Bool)

(declare-fun res!1037885 () Bool)

(declare-fun e!846868 () Bool)

(assert (=> b!1517982 (=> (not res!1037885) (not e!846868))))

(declare-datatypes ((List!35282 0))(
  ( (Nil!35279) (Cons!35278 (h!36690 (_ BitVec 64)) (t!49976 List!35282)) )
))
(declare-fun arrayNoDuplicates!0 (array!101124 (_ BitVec 32) List!35282) Bool)

(assert (=> b!1517982 (= res!1037885 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35279))))

(declare-fun e!846867 () Bool)

(declare-fun b!1517983 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101124 (_ BitVec 32)) SeekEntryResult!12970)

(assert (=> b!1517983 (= e!846867 (= (seekEntry!0 (select (arr!48799 a!2804) j!70) a!2804 mask!2512) (Found!12970 j!70)))))

(declare-fun b!1517984 () Bool)

(declare-fun res!1037892 () Bool)

(assert (=> b!1517984 (=> (not res!1037892) (not e!846864))))

(declare-fun lt!657993 () SeekEntryResult!12970)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1517984 (= res!1037892 (= lt!657993 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48799 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48799 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101125 (store (arr!48799 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49349 a!2804)) mask!2512)))))

(declare-fun b!1517985 () Bool)

(declare-fun res!1037895 () Bool)

(assert (=> b!1517985 (=> (not res!1037895) (not e!846868))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1517985 (= res!1037895 (validKeyInArray!0 (select (arr!48799 a!2804) j!70)))))

(declare-fun b!1517986 () Bool)

(declare-fun e!846865 () Bool)

(assert (=> b!1517986 (= e!846864 (not e!846865))))

(declare-fun res!1037889 () Bool)

(assert (=> b!1517986 (=> res!1037889 e!846865)))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1517986 (= res!1037889 (or (not (= (select (arr!48799 a!2804) j!70) (select (store (arr!48799 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(assert (=> b!1517986 e!846867))

(declare-fun res!1037896 () Bool)

(assert (=> b!1517986 (=> (not res!1037896) (not e!846867))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101124 (_ BitVec 32)) Bool)

(assert (=> b!1517986 (= res!1037896 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50808 0))(
  ( (Unit!50809) )
))
(declare-fun lt!657997 () Unit!50808)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101124 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50808)

(assert (=> b!1517986 (= lt!657997 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1517987 () Bool)

(declare-fun res!1037887 () Bool)

(assert (=> b!1517987 (=> (not res!1037887) (not e!846868))))

(assert (=> b!1517987 (= res!1037887 (and (= (size!49349 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49349 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49349 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1037890 () Bool)

(assert (=> start!129268 (=> (not res!1037890) (not e!846868))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129268 (= res!1037890 (validMask!0 mask!2512))))

(assert (=> start!129268 e!846868))

(assert (=> start!129268 true))

(declare-fun array_inv!37827 (array!101124) Bool)

(assert (=> start!129268 (array_inv!37827 a!2804)))

(declare-fun b!1517988 () Bool)

(declare-fun res!1037886 () Bool)

(assert (=> b!1517988 (=> (not res!1037886) (not e!846868))))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1517988 (= res!1037886 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49349 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49349 a!2804))))))

(declare-fun b!1517989 () Bool)

(declare-fun e!846866 () Bool)

(assert (=> b!1517989 (= e!846865 e!846866)))

(declare-fun res!1037891 () Bool)

(assert (=> b!1517989 (=> res!1037891 e!846866)))

(declare-fun lt!657995 () (_ BitVec 32))

(assert (=> b!1517989 (= res!1037891 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!657995 #b00000000000000000000000000000000) (bvsge lt!657995 (size!49349 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1517989 (= lt!657995 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1517990 () Bool)

(declare-fun res!1037894 () Bool)

(assert (=> b!1517990 (=> (not res!1037894) (not e!846868))))

(assert (=> b!1517990 (= res!1037894 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1517991 () Bool)

(assert (=> b!1517991 (= e!846868 e!846864)))

(declare-fun res!1037884 () Bool)

(assert (=> b!1517991 (=> (not res!1037884) (not e!846864))))

(assert (=> b!1517991 (= res!1037884 (= lt!657993 lt!657996))))

(assert (=> b!1517991 (= lt!657996 (Intermediate!12970 false resIndex!21 resX!21))))

(assert (=> b!1517991 (= lt!657993 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48799 a!2804) j!70) mask!2512) (select (arr!48799 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1517992 () Bool)

(assert (=> b!1517992 (= e!846866 true)))

(declare-fun lt!657994 () SeekEntryResult!12970)

(assert (=> b!1517992 (= lt!657994 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!657995 (select (arr!48799 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1517993 () Bool)

(declare-fun res!1037893 () Bool)

(assert (=> b!1517993 (=> (not res!1037893) (not e!846868))))

(assert (=> b!1517993 (= res!1037893 (validKeyInArray!0 (select (arr!48799 a!2804) i!961)))))

(assert (= (and start!129268 res!1037890) b!1517987))

(assert (= (and b!1517987 res!1037887) b!1517993))

(assert (= (and b!1517993 res!1037893) b!1517985))

(assert (= (and b!1517985 res!1037895) b!1517990))

(assert (= (and b!1517990 res!1037894) b!1517982))

(assert (= (and b!1517982 res!1037885) b!1517988))

(assert (= (and b!1517988 res!1037886) b!1517991))

(assert (= (and b!1517991 res!1037884) b!1517981))

(assert (= (and b!1517981 res!1037888) b!1517984))

(assert (= (and b!1517984 res!1037892) b!1517986))

(assert (= (and b!1517986 res!1037896) b!1517983))

(assert (= (and b!1517986 (not res!1037889)) b!1517989))

(assert (= (and b!1517989 (not res!1037891)) b!1517992))

(declare-fun m!1401285 () Bool)

(assert (=> b!1517991 m!1401285))

(assert (=> b!1517991 m!1401285))

(declare-fun m!1401287 () Bool)

(assert (=> b!1517991 m!1401287))

(assert (=> b!1517991 m!1401287))

(assert (=> b!1517991 m!1401285))

(declare-fun m!1401289 () Bool)

(assert (=> b!1517991 m!1401289))

(assert (=> b!1517986 m!1401285))

(declare-fun m!1401291 () Bool)

(assert (=> b!1517986 m!1401291))

(declare-fun m!1401293 () Bool)

(assert (=> b!1517986 m!1401293))

(declare-fun m!1401295 () Bool)

(assert (=> b!1517986 m!1401295))

(declare-fun m!1401297 () Bool)

(assert (=> b!1517986 m!1401297))

(assert (=> b!1517984 m!1401293))

(assert (=> b!1517984 m!1401295))

(assert (=> b!1517984 m!1401295))

(declare-fun m!1401299 () Bool)

(assert (=> b!1517984 m!1401299))

(assert (=> b!1517984 m!1401299))

(assert (=> b!1517984 m!1401295))

(declare-fun m!1401301 () Bool)

(assert (=> b!1517984 m!1401301))

(declare-fun m!1401303 () Bool)

(assert (=> b!1517993 m!1401303))

(assert (=> b!1517993 m!1401303))

(declare-fun m!1401305 () Bool)

(assert (=> b!1517993 m!1401305))

(declare-fun m!1401307 () Bool)

(assert (=> b!1517982 m!1401307))

(assert (=> b!1517983 m!1401285))

(assert (=> b!1517983 m!1401285))

(declare-fun m!1401309 () Bool)

(assert (=> b!1517983 m!1401309))

(assert (=> b!1517992 m!1401285))

(assert (=> b!1517992 m!1401285))

(declare-fun m!1401311 () Bool)

(assert (=> b!1517992 m!1401311))

(declare-fun m!1401313 () Bool)

(assert (=> b!1517990 m!1401313))

(assert (=> b!1517985 m!1401285))

(assert (=> b!1517985 m!1401285))

(declare-fun m!1401315 () Bool)

(assert (=> b!1517985 m!1401315))

(declare-fun m!1401317 () Bool)

(assert (=> b!1517989 m!1401317))

(assert (=> b!1517981 m!1401285))

(assert (=> b!1517981 m!1401285))

(declare-fun m!1401319 () Bool)

(assert (=> b!1517981 m!1401319))

(declare-fun m!1401321 () Bool)

(assert (=> start!129268 m!1401321))

(declare-fun m!1401323 () Bool)

(assert (=> start!129268 m!1401323))

(push 1)

(assert (not b!1517985))

(assert (not b!1517981))

(assert (not b!1517992))

