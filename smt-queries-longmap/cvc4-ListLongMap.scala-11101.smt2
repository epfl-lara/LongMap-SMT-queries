; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129632 () Bool)

(assert start!129632)

(declare-fun b!1521840 () Bool)

(declare-fun res!1041064 () Bool)

(declare-fun e!848662 () Bool)

(assert (=> b!1521840 (=> (not res!1041064) (not e!848662))))

(declare-datatypes ((array!101307 0))(
  ( (array!101308 (arr!48886 (Array (_ BitVec 32) (_ BitVec 64))) (size!49436 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101307)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101307 (_ BitVec 32)) Bool)

(assert (=> b!1521840 (= res!1041064 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1521841 () Bool)

(declare-fun res!1041069 () Bool)

(assert (=> b!1521841 (=> (not res!1041069) (not e!848662))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1521841 (= res!1041069 (validKeyInArray!0 (select (arr!48886 a!2804) j!70)))))

(declare-fun b!1521842 () Bool)

(declare-fun e!848660 () Bool)

(assert (=> b!1521842 (= e!848660 false)))

(declare-fun i!961 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13051 0))(
  ( (MissingZero!13051 (index!54599 (_ BitVec 32))) (Found!13051 (index!54600 (_ BitVec 32))) (Intermediate!13051 (undefined!13863 Bool) (index!54601 (_ BitVec 32)) (x!136287 (_ BitVec 32))) (Undefined!13051) (MissingVacant!13051 (index!54602 (_ BitVec 32))) )
))
(declare-fun lt!659440 () SeekEntryResult!13051)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101307 (_ BitVec 32)) SeekEntryResult!13051)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1521842 (= lt!659440 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48886 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48886 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101308 (store (arr!48886 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49436 a!2804)) mask!2512))))

(declare-fun b!1521843 () Bool)

(assert (=> b!1521843 (= e!848662 e!848660)))

(declare-fun res!1041067 () Bool)

(assert (=> b!1521843 (=> (not res!1041067) (not e!848660))))

(declare-fun lt!659439 () SeekEntryResult!13051)

(assert (=> b!1521843 (= res!1041067 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48886 a!2804) j!70) mask!2512) (select (arr!48886 a!2804) j!70) a!2804 mask!2512) lt!659439))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1521843 (= lt!659439 (Intermediate!13051 false resIndex!21 resX!21))))

(declare-fun b!1521844 () Bool)

(declare-fun res!1041068 () Bool)

(assert (=> b!1521844 (=> (not res!1041068) (not e!848662))))

(assert (=> b!1521844 (= res!1041068 (validKeyInArray!0 (select (arr!48886 a!2804) i!961)))))

(declare-fun b!1521846 () Bool)

(declare-fun res!1041065 () Bool)

(assert (=> b!1521846 (=> (not res!1041065) (not e!848662))))

(declare-datatypes ((List!35369 0))(
  ( (Nil!35366) (Cons!35365 (h!36786 (_ BitVec 64)) (t!50063 List!35369)) )
))
(declare-fun arrayNoDuplicates!0 (array!101307 (_ BitVec 32) List!35369) Bool)

(assert (=> b!1521846 (= res!1041065 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35366))))

(declare-fun b!1521847 () Bool)

(declare-fun res!1041070 () Bool)

(assert (=> b!1521847 (=> (not res!1041070) (not e!848660))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1521847 (= res!1041070 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48886 a!2804) j!70) a!2804 mask!2512) lt!659439))))

(declare-fun b!1521848 () Bool)

(declare-fun res!1041063 () Bool)

(assert (=> b!1521848 (=> (not res!1041063) (not e!848662))))

(assert (=> b!1521848 (= res!1041063 (and (= (size!49436 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49436 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49436 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1521845 () Bool)

(declare-fun res!1041066 () Bool)

(assert (=> b!1521845 (=> (not res!1041066) (not e!848662))))

(assert (=> b!1521845 (= res!1041066 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49436 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49436 a!2804))))))

(declare-fun res!1041062 () Bool)

(assert (=> start!129632 (=> (not res!1041062) (not e!848662))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129632 (= res!1041062 (validMask!0 mask!2512))))

(assert (=> start!129632 e!848662))

(assert (=> start!129632 true))

(declare-fun array_inv!37914 (array!101307) Bool)

(assert (=> start!129632 (array_inv!37914 a!2804)))

(assert (= (and start!129632 res!1041062) b!1521848))

(assert (= (and b!1521848 res!1041063) b!1521844))

(assert (= (and b!1521844 res!1041068) b!1521841))

(assert (= (and b!1521841 res!1041069) b!1521840))

(assert (= (and b!1521840 res!1041064) b!1521846))

(assert (= (and b!1521846 res!1041065) b!1521845))

(assert (= (and b!1521845 res!1041066) b!1521843))

(assert (= (and b!1521843 res!1041067) b!1521847))

(assert (= (and b!1521847 res!1041070) b!1521842))

(declare-fun m!1404959 () Bool)

(assert (=> b!1521844 m!1404959))

(assert (=> b!1521844 m!1404959))

(declare-fun m!1404961 () Bool)

(assert (=> b!1521844 m!1404961))

(declare-fun m!1404963 () Bool)

(assert (=> b!1521843 m!1404963))

(assert (=> b!1521843 m!1404963))

(declare-fun m!1404965 () Bool)

(assert (=> b!1521843 m!1404965))

(assert (=> b!1521843 m!1404965))

(assert (=> b!1521843 m!1404963))

(declare-fun m!1404967 () Bool)

(assert (=> b!1521843 m!1404967))

(declare-fun m!1404969 () Bool)

(assert (=> b!1521846 m!1404969))

(assert (=> b!1521847 m!1404963))

(assert (=> b!1521847 m!1404963))

(declare-fun m!1404971 () Bool)

(assert (=> b!1521847 m!1404971))

(assert (=> b!1521841 m!1404963))

(assert (=> b!1521841 m!1404963))

(declare-fun m!1404973 () Bool)

(assert (=> b!1521841 m!1404973))

(declare-fun m!1404975 () Bool)

(assert (=> b!1521842 m!1404975))

(declare-fun m!1404977 () Bool)

(assert (=> b!1521842 m!1404977))

(assert (=> b!1521842 m!1404977))

(declare-fun m!1404979 () Bool)

(assert (=> b!1521842 m!1404979))

(assert (=> b!1521842 m!1404979))

(assert (=> b!1521842 m!1404977))

(declare-fun m!1404981 () Bool)

(assert (=> b!1521842 m!1404981))

(declare-fun m!1404983 () Bool)

(assert (=> b!1521840 m!1404983))

(declare-fun m!1404985 () Bool)

(assert (=> start!129632 m!1404985))

(declare-fun m!1404987 () Bool)

(assert (=> start!129632 m!1404987))

(push 1)

(assert (not b!1521842))

(assert (not b!1521844))

(assert (not b!1521843))

(assert (not start!129632))

(assert (not b!1521841))

(assert (not b!1521847))

