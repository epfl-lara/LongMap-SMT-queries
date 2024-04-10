; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128908 () Bool)

(assert start!128908)

(declare-fun b!1510972 () Bool)

(declare-fun e!843652 () Bool)

(declare-fun e!843653 () Bool)

(assert (=> b!1510972 (= e!843652 e!843653)))

(declare-fun res!1030885 () Bool)

(assert (=> b!1510972 (=> (not res!1030885) (not e!843653))))

(declare-datatypes ((SeekEntryResult!12790 0))(
  ( (MissingZero!12790 (index!53555 (_ BitVec 32))) (Found!12790 (index!53556 (_ BitVec 32))) (Intermediate!12790 (undefined!13602 Bool) (index!53557 (_ BitVec 32)) (x!135292 (_ BitVec 32))) (Undefined!12790) (MissingVacant!12790 (index!53558 (_ BitVec 32))) )
))
(declare-fun lt!655313 () SeekEntryResult!12790)

(declare-fun lt!655314 () SeekEntryResult!12790)

(assert (=> b!1510972 (= res!1030885 (= lt!655313 lt!655314))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1510972 (= lt!655314 (Intermediate!12790 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100764 0))(
  ( (array!100765 (arr!48619 (Array (_ BitVec 32) (_ BitVec 64))) (size!49169 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100764)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100764 (_ BitVec 32)) SeekEntryResult!12790)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1510972 (= lt!655313 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48619 a!2804) j!70) mask!2512) (select (arr!48619 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1510973 () Bool)

(declare-fun res!1030882 () Bool)

(assert (=> b!1510973 (=> (not res!1030882) (not e!843653))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1510973 (= res!1030882 (= lt!655313 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48619 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48619 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100765 (store (arr!48619 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49169 a!2804)) mask!2512)))))

(declare-fun b!1510974 () Bool)

(declare-fun res!1030875 () Bool)

(assert (=> b!1510974 (=> (not res!1030875) (not e!843652))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100764 (_ BitVec 32)) Bool)

(assert (=> b!1510974 (= res!1030875 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1510975 () Bool)

(declare-fun res!1030878 () Bool)

(assert (=> b!1510975 (=> (not res!1030878) (not e!843652))))

(declare-datatypes ((List!35102 0))(
  ( (Nil!35099) (Cons!35098 (h!36510 (_ BitVec 64)) (t!49796 List!35102)) )
))
(declare-fun arrayNoDuplicates!0 (array!100764 (_ BitVec 32) List!35102) Bool)

(assert (=> b!1510975 (= res!1030878 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35099))))

(declare-fun b!1510976 () Bool)

(declare-fun res!1030881 () Bool)

(assert (=> b!1510976 (=> (not res!1030881) (not e!843652))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1510976 (= res!1030881 (validKeyInArray!0 (select (arr!48619 a!2804) j!70)))))

(declare-fun b!1510977 () Bool)

(declare-fun res!1030876 () Bool)

(assert (=> b!1510977 (=> (not res!1030876) (not e!843652))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1510977 (= res!1030876 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49169 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49169 a!2804))))))

(declare-fun b!1510978 () Bool)

(assert (=> b!1510978 (= e!843653 (not (or (not (= (select (arr!48619 a!2804) j!70) (select (store (arr!48619 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48619 a!2804) index!487) (select (arr!48619 a!2804) j!70)) (not (= (select (arr!48619 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!2512 #b00000000000000000000000000000000))))))

(declare-fun e!843655 () Bool)

(assert (=> b!1510978 e!843655))

(declare-fun res!1030877 () Bool)

(assert (=> b!1510978 (=> (not res!1030877) (not e!843655))))

(assert (=> b!1510978 (= res!1030877 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50448 0))(
  ( (Unit!50449) )
))
(declare-fun lt!655315 () Unit!50448)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100764 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50448)

(assert (=> b!1510978 (= lt!655315 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun res!1030884 () Bool)

(assert (=> start!128908 (=> (not res!1030884) (not e!843652))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128908 (= res!1030884 (validMask!0 mask!2512))))

(assert (=> start!128908 e!843652))

(assert (=> start!128908 true))

(declare-fun array_inv!37647 (array!100764) Bool)

(assert (=> start!128908 (array_inv!37647 a!2804)))

(declare-fun b!1510979 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100764 (_ BitVec 32)) SeekEntryResult!12790)

(assert (=> b!1510979 (= e!843655 (= (seekEntry!0 (select (arr!48619 a!2804) j!70) a!2804 mask!2512) (Found!12790 j!70)))))

(declare-fun b!1510980 () Bool)

(declare-fun res!1030880 () Bool)

(assert (=> b!1510980 (=> (not res!1030880) (not e!843652))))

(assert (=> b!1510980 (= res!1030880 (and (= (size!49169 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49169 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49169 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1510981 () Bool)

(declare-fun res!1030879 () Bool)

(assert (=> b!1510981 (=> (not res!1030879) (not e!843652))))

(assert (=> b!1510981 (= res!1030879 (validKeyInArray!0 (select (arr!48619 a!2804) i!961)))))

(declare-fun b!1510982 () Bool)

(declare-fun res!1030883 () Bool)

(assert (=> b!1510982 (=> (not res!1030883) (not e!843653))))

(assert (=> b!1510982 (= res!1030883 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48619 a!2804) j!70) a!2804 mask!2512) lt!655314))))

(assert (= (and start!128908 res!1030884) b!1510980))

(assert (= (and b!1510980 res!1030880) b!1510981))

(assert (= (and b!1510981 res!1030879) b!1510976))

(assert (= (and b!1510976 res!1030881) b!1510974))

(assert (= (and b!1510974 res!1030875) b!1510975))

(assert (= (and b!1510975 res!1030878) b!1510977))

(assert (= (and b!1510977 res!1030876) b!1510972))

(assert (= (and b!1510972 res!1030885) b!1510982))

(assert (= (and b!1510982 res!1030883) b!1510973))

(assert (= (and b!1510973 res!1030882) b!1510978))

(assert (= (and b!1510978 res!1030877) b!1510979))

(declare-fun m!1393619 () Bool)

(assert (=> b!1510981 m!1393619))

(assert (=> b!1510981 m!1393619))

(declare-fun m!1393621 () Bool)

(assert (=> b!1510981 m!1393621))

(declare-fun m!1393623 () Bool)

(assert (=> b!1510972 m!1393623))

(assert (=> b!1510972 m!1393623))

(declare-fun m!1393625 () Bool)

(assert (=> b!1510972 m!1393625))

(assert (=> b!1510972 m!1393625))

(assert (=> b!1510972 m!1393623))

(declare-fun m!1393627 () Bool)

(assert (=> b!1510972 m!1393627))

(declare-fun m!1393629 () Bool)

(assert (=> start!128908 m!1393629))

(declare-fun m!1393631 () Bool)

(assert (=> start!128908 m!1393631))

(assert (=> b!1510982 m!1393623))

(assert (=> b!1510982 m!1393623))

(declare-fun m!1393633 () Bool)

(assert (=> b!1510982 m!1393633))

(declare-fun m!1393635 () Bool)

(assert (=> b!1510973 m!1393635))

(declare-fun m!1393637 () Bool)

(assert (=> b!1510973 m!1393637))

(assert (=> b!1510973 m!1393637))

(declare-fun m!1393639 () Bool)

(assert (=> b!1510973 m!1393639))

(assert (=> b!1510973 m!1393639))

(assert (=> b!1510973 m!1393637))

(declare-fun m!1393641 () Bool)

(assert (=> b!1510973 m!1393641))

(declare-fun m!1393643 () Bool)

(assert (=> b!1510974 m!1393643))

(assert (=> b!1510978 m!1393623))

(declare-fun m!1393645 () Bool)

(assert (=> b!1510978 m!1393645))

(assert (=> b!1510978 m!1393635))

(declare-fun m!1393647 () Bool)

(assert (=> b!1510978 m!1393647))

(assert (=> b!1510978 m!1393637))

(declare-fun m!1393649 () Bool)

(assert (=> b!1510978 m!1393649))

(assert (=> b!1510976 m!1393623))

(assert (=> b!1510976 m!1393623))

(declare-fun m!1393651 () Bool)

(assert (=> b!1510976 m!1393651))

(assert (=> b!1510979 m!1393623))

(assert (=> b!1510979 m!1393623))

(declare-fun m!1393653 () Bool)

(assert (=> b!1510979 m!1393653))

(declare-fun m!1393655 () Bool)

(assert (=> b!1510975 m!1393655))

(push 1)

(assert (not b!1510982))

(assert (not b!1510975))

(assert (not b!1510974))

(assert (not b!1510973))

(assert (not b!1510972))

