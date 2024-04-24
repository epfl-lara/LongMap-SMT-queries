; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129998 () Bool)

(assert start!129998)

(declare-fun b!1523996 () Bool)

(declare-fun res!1041800 () Bool)

(declare-fun e!850012 () Bool)

(assert (=> b!1523996 (=> (not res!1041800) (not e!850012))))

(declare-datatypes ((array!101422 0))(
  ( (array!101423 (arr!48937 (Array (_ BitVec 32) (_ BitVec 64))) (size!49488 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101422)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1523996 (= res!1041800 (validKeyInArray!0 (select (arr!48937 a!2804) i!961)))))

(declare-fun b!1523997 () Bool)

(declare-fun res!1041795 () Bool)

(assert (=> b!1523997 (=> (not res!1041795) (not e!850012))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101422 (_ BitVec 32)) Bool)

(assert (=> b!1523997 (= res!1041795 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1523999 () Bool)

(declare-fun res!1041796 () Bool)

(declare-fun e!850013 () Bool)

(assert (=> b!1523999 (=> (not res!1041796) (not e!850013))))

(declare-datatypes ((SeekEntryResult!12995 0))(
  ( (MissingZero!12995 (index!54375 (_ BitVec 32))) (Found!12995 (index!54376 (_ BitVec 32))) (Intermediate!12995 (undefined!13807 Bool) (index!54377 (_ BitVec 32)) (x!136276 (_ BitVec 32))) (Undefined!12995) (MissingVacant!12995 (index!54378 (_ BitVec 32))) )
))
(declare-fun lt!660267 () SeekEntryResult!12995)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101422 (_ BitVec 32)) SeekEntryResult!12995)

(assert (=> b!1523999 (= res!1041796 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48937 a!2804) j!70) a!2804 mask!2512) lt!660267))))

(declare-fun b!1524000 () Bool)

(declare-fun res!1041799 () Bool)

(assert (=> b!1524000 (=> (not res!1041799) (not e!850012))))

(assert (=> b!1524000 (= res!1041799 (and (= (size!49488 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49488 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49488 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1524001 () Bool)

(assert (=> b!1524001 (= e!850013 false)))

(declare-fun lt!660268 () SeekEntryResult!12995)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1524001 (= lt!660268 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48937 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48937 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101423 (store (arr!48937 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49488 a!2804)) mask!2512))))

(declare-fun b!1524002 () Bool)

(declare-fun res!1041793 () Bool)

(assert (=> b!1524002 (=> (not res!1041793) (not e!850012))))

(assert (=> b!1524002 (= res!1041793 (validKeyInArray!0 (select (arr!48937 a!2804) j!70)))))

(declare-fun b!1524003 () Bool)

(declare-fun res!1041798 () Bool)

(assert (=> b!1524003 (=> (not res!1041798) (not e!850012))))

(declare-datatypes ((List!35407 0))(
  ( (Nil!35404) (Cons!35403 (h!36842 (_ BitVec 64)) (t!50093 List!35407)) )
))
(declare-fun arrayNoDuplicates!0 (array!101422 (_ BitVec 32) List!35407) Bool)

(assert (=> b!1524003 (= res!1041798 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35404))))

(declare-fun b!1524004 () Bool)

(declare-fun res!1041797 () Bool)

(assert (=> b!1524004 (=> (not res!1041797) (not e!850012))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1524004 (= res!1041797 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49488 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49488 a!2804))))))

(declare-fun res!1041794 () Bool)

(assert (=> start!129998 (=> (not res!1041794) (not e!850012))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129998 (= res!1041794 (validMask!0 mask!2512))))

(assert (=> start!129998 e!850012))

(assert (=> start!129998 true))

(declare-fun array_inv!38218 (array!101422) Bool)

(assert (=> start!129998 (array_inv!38218 a!2804)))

(declare-fun b!1523998 () Bool)

(assert (=> b!1523998 (= e!850012 e!850013)))

(declare-fun res!1041792 () Bool)

(assert (=> b!1523998 (=> (not res!1041792) (not e!850013))))

(assert (=> b!1523998 (= res!1041792 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48937 a!2804) j!70) mask!2512) (select (arr!48937 a!2804) j!70) a!2804 mask!2512) lt!660267))))

(assert (=> b!1523998 (= lt!660267 (Intermediate!12995 false resIndex!21 resX!21))))

(assert (= (and start!129998 res!1041794) b!1524000))

(assert (= (and b!1524000 res!1041799) b!1523996))

(assert (= (and b!1523996 res!1041800) b!1524002))

(assert (= (and b!1524002 res!1041793) b!1523997))

(assert (= (and b!1523997 res!1041795) b!1524003))

(assert (= (and b!1524003 res!1041798) b!1524004))

(assert (= (and b!1524004 res!1041797) b!1523998))

(assert (= (and b!1523998 res!1041792) b!1523999))

(assert (= (and b!1523999 res!1041796) b!1524001))

(declare-fun m!1406967 () Bool)

(assert (=> b!1523997 m!1406967))

(declare-fun m!1406969 () Bool)

(assert (=> b!1524002 m!1406969))

(assert (=> b!1524002 m!1406969))

(declare-fun m!1406971 () Bool)

(assert (=> b!1524002 m!1406971))

(declare-fun m!1406973 () Bool)

(assert (=> b!1523996 m!1406973))

(assert (=> b!1523996 m!1406973))

(declare-fun m!1406975 () Bool)

(assert (=> b!1523996 m!1406975))

(declare-fun m!1406977 () Bool)

(assert (=> b!1524001 m!1406977))

(declare-fun m!1406979 () Bool)

(assert (=> b!1524001 m!1406979))

(assert (=> b!1524001 m!1406979))

(declare-fun m!1406981 () Bool)

(assert (=> b!1524001 m!1406981))

(assert (=> b!1524001 m!1406981))

(assert (=> b!1524001 m!1406979))

(declare-fun m!1406983 () Bool)

(assert (=> b!1524001 m!1406983))

(declare-fun m!1406985 () Bool)

(assert (=> b!1524003 m!1406985))

(assert (=> b!1523999 m!1406969))

(assert (=> b!1523999 m!1406969))

(declare-fun m!1406987 () Bool)

(assert (=> b!1523999 m!1406987))

(assert (=> b!1523998 m!1406969))

(assert (=> b!1523998 m!1406969))

(declare-fun m!1406989 () Bool)

(assert (=> b!1523998 m!1406989))

(assert (=> b!1523998 m!1406989))

(assert (=> b!1523998 m!1406969))

(declare-fun m!1406991 () Bool)

(assert (=> b!1523998 m!1406991))

(declare-fun m!1406993 () Bool)

(assert (=> start!129998 m!1406993))

(declare-fun m!1406995 () Bool)

(assert (=> start!129998 m!1406995))

(check-sat (not b!1524003) (not b!1524002) (not b!1523997) (not start!129998) (not b!1524001) (not b!1523998) (not b!1523999) (not b!1523996))
(check-sat)
