; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128838 () Bool)

(assert start!128838)

(declare-fun b!1509808 () Bool)

(declare-fun res!1029714 () Bool)

(declare-fun e!843225 () Bool)

(assert (=> b!1509808 (=> (not res!1029714) (not e!843225))))

(declare-datatypes ((array!100694 0))(
  ( (array!100695 (arr!48584 (Array (_ BitVec 32) (_ BitVec 64))) (size!49134 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100694)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1509808 (= res!1029714 (validKeyInArray!0 (select (arr!48584 a!2804) i!961)))))

(declare-fun b!1509809 () Bool)

(declare-fun res!1029718 () Bool)

(assert (=> b!1509809 (=> (not res!1029718) (not e!843225))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1509809 (= res!1029718 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49134 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49134 a!2804))))))

(declare-fun b!1509810 () Bool)

(declare-fun res!1029713 () Bool)

(assert (=> b!1509810 (=> (not res!1029713) (not e!843225))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(assert (=> b!1509810 (= res!1029713 (and (= (size!49134 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49134 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49134 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1509811 () Bool)

(declare-fun e!843226 () Bool)

(declare-datatypes ((SeekEntryResult!12755 0))(
  ( (MissingZero!12755 (index!53415 (_ BitVec 32))) (Found!12755 (index!53416 (_ BitVec 32))) (Intermediate!12755 (undefined!13567 Bool) (index!53417 (_ BitVec 32)) (x!135169 (_ BitVec 32))) (Undefined!12755) (MissingVacant!12755 (index!53418 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!100694 (_ BitVec 32)) SeekEntryResult!12755)

(assert (=> b!1509811 (= e!843226 (= (seekEntry!0 (select (arr!48584 a!2804) j!70) a!2804 mask!2512) (Found!12755 j!70)))))

(declare-fun b!1509812 () Bool)

(declare-fun res!1029715 () Bool)

(assert (=> b!1509812 (=> (not res!1029715) (not e!843225))))

(assert (=> b!1509812 (= res!1029715 (validKeyInArray!0 (select (arr!48584 a!2804) j!70)))))

(declare-fun b!1509813 () Bool)

(declare-fun res!1029716 () Bool)

(assert (=> b!1509813 (=> (not res!1029716) (not e!843225))))

(declare-datatypes ((List!35067 0))(
  ( (Nil!35064) (Cons!35063 (h!36475 (_ BitVec 64)) (t!49761 List!35067)) )
))
(declare-fun arrayNoDuplicates!0 (array!100694 (_ BitVec 32) List!35067) Bool)

(assert (=> b!1509813 (= res!1029716 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35064))))

(declare-fun res!1029720 () Bool)

(assert (=> start!128838 (=> (not res!1029720) (not e!843225))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128838 (= res!1029720 (validMask!0 mask!2512))))

(assert (=> start!128838 e!843225))

(assert (=> start!128838 true))

(declare-fun array_inv!37612 (array!100694) Bool)

(assert (=> start!128838 (array_inv!37612 a!2804)))

(declare-fun b!1509814 () Bool)

(declare-fun e!843223 () Bool)

(assert (=> b!1509814 (= e!843223 (not true))))

(assert (=> b!1509814 e!843226))

(declare-fun res!1029717 () Bool)

(assert (=> b!1509814 (=> (not res!1029717) (not e!843226))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100694 (_ BitVec 32)) Bool)

(assert (=> b!1509814 (= res!1029717 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50378 0))(
  ( (Unit!50379) )
))
(declare-fun lt!654999 () Unit!50378)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100694 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50378)

(assert (=> b!1509814 (= lt!654999 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1509815 () Bool)

(declare-fun res!1029711 () Bool)

(assert (=> b!1509815 (=> (not res!1029711) (not e!843225))))

(assert (=> b!1509815 (= res!1029711 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1509816 () Bool)

(assert (=> b!1509816 (= e!843225 e!843223)))

(declare-fun res!1029719 () Bool)

(assert (=> b!1509816 (=> (not res!1029719) (not e!843223))))

(declare-fun lt!655000 () SeekEntryResult!12755)

(declare-fun lt!654998 () SeekEntryResult!12755)

(assert (=> b!1509816 (= res!1029719 (= lt!655000 lt!654998))))

(assert (=> b!1509816 (= lt!654998 (Intermediate!12755 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100694 (_ BitVec 32)) SeekEntryResult!12755)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1509816 (= lt!655000 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48584 a!2804) j!70) mask!2512) (select (arr!48584 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1509817 () Bool)

(declare-fun res!1029721 () Bool)

(assert (=> b!1509817 (=> (not res!1029721) (not e!843223))))

(assert (=> b!1509817 (= res!1029721 (= lt!655000 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48584 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48584 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100695 (store (arr!48584 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49134 a!2804)) mask!2512)))))

(declare-fun b!1509818 () Bool)

(declare-fun res!1029712 () Bool)

(assert (=> b!1509818 (=> (not res!1029712) (not e!843223))))

(assert (=> b!1509818 (= res!1029712 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48584 a!2804) j!70) a!2804 mask!2512) lt!654998))))

(assert (= (and start!128838 res!1029720) b!1509810))

(assert (= (and b!1509810 res!1029713) b!1509808))

(assert (= (and b!1509808 res!1029714) b!1509812))

(assert (= (and b!1509812 res!1029715) b!1509815))

(assert (= (and b!1509815 res!1029711) b!1509813))

(assert (= (and b!1509813 res!1029716) b!1509809))

(assert (= (and b!1509809 res!1029718) b!1509816))

(assert (= (and b!1509816 res!1029719) b!1509818))

(assert (= (and b!1509818 res!1029712) b!1509817))

(assert (= (and b!1509817 res!1029721) b!1509814))

(assert (= (and b!1509814 res!1029717) b!1509811))

(declare-fun m!1392331 () Bool)

(assert (=> b!1509818 m!1392331))

(assert (=> b!1509818 m!1392331))

(declare-fun m!1392333 () Bool)

(assert (=> b!1509818 m!1392333))

(assert (=> b!1509811 m!1392331))

(assert (=> b!1509811 m!1392331))

(declare-fun m!1392335 () Bool)

(assert (=> b!1509811 m!1392335))

(assert (=> b!1509812 m!1392331))

(assert (=> b!1509812 m!1392331))

(declare-fun m!1392337 () Bool)

(assert (=> b!1509812 m!1392337))

(assert (=> b!1509816 m!1392331))

(assert (=> b!1509816 m!1392331))

(declare-fun m!1392339 () Bool)

(assert (=> b!1509816 m!1392339))

(assert (=> b!1509816 m!1392339))

(assert (=> b!1509816 m!1392331))

(declare-fun m!1392341 () Bool)

(assert (=> b!1509816 m!1392341))

(declare-fun m!1392343 () Bool)

(assert (=> b!1509808 m!1392343))

(assert (=> b!1509808 m!1392343))

(declare-fun m!1392345 () Bool)

(assert (=> b!1509808 m!1392345))

(declare-fun m!1392347 () Bool)

(assert (=> b!1509817 m!1392347))

(declare-fun m!1392349 () Bool)

(assert (=> b!1509817 m!1392349))

(assert (=> b!1509817 m!1392349))

(declare-fun m!1392351 () Bool)

(assert (=> b!1509817 m!1392351))

(assert (=> b!1509817 m!1392351))

(assert (=> b!1509817 m!1392349))

(declare-fun m!1392353 () Bool)

(assert (=> b!1509817 m!1392353))

(declare-fun m!1392355 () Bool)

(assert (=> b!1509814 m!1392355))

(declare-fun m!1392357 () Bool)

(assert (=> b!1509814 m!1392357))

(declare-fun m!1392359 () Bool)

(assert (=> b!1509815 m!1392359))

(declare-fun m!1392361 () Bool)

(assert (=> start!128838 m!1392361))

(declare-fun m!1392363 () Bool)

(assert (=> start!128838 m!1392363))

(declare-fun m!1392365 () Bool)

(assert (=> b!1509813 m!1392365))

(push 1)

