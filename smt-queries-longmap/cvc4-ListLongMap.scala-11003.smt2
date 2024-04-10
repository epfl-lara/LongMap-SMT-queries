; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128854 () Bool)

(assert start!128854)

(declare-fun b!1510072 () Bool)

(declare-fun res!1029976 () Bool)

(declare-fun e!843320 () Bool)

(assert (=> b!1510072 (=> (not res!1029976) (not e!843320))))

(declare-datatypes ((array!100710 0))(
  ( (array!100711 (arr!48592 (Array (_ BitVec 32) (_ BitVec 64))) (size!49142 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100710)

(declare-datatypes ((List!35075 0))(
  ( (Nil!35072) (Cons!35071 (h!36483 (_ BitVec 64)) (t!49769 List!35075)) )
))
(declare-fun arrayNoDuplicates!0 (array!100710 (_ BitVec 32) List!35075) Bool)

(assert (=> b!1510072 (= res!1029976 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35072))))

(declare-fun b!1510073 () Bool)

(declare-fun res!1029975 () Bool)

(declare-fun e!843322 () Bool)

(assert (=> b!1510073 (=> (not res!1029975) (not e!843322))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12763 0))(
  ( (MissingZero!12763 (index!53447 (_ BitVec 32))) (Found!12763 (index!53448 (_ BitVec 32))) (Intermediate!12763 (undefined!13575 Bool) (index!53449 (_ BitVec 32)) (x!135193 (_ BitVec 32))) (Undefined!12763) (MissingVacant!12763 (index!53450 (_ BitVec 32))) )
))
(declare-fun lt!655072 () SeekEntryResult!12763)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100710 (_ BitVec 32)) SeekEntryResult!12763)

(assert (=> b!1510073 (= res!1029975 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48592 a!2804) j!70) a!2804 mask!2512) lt!655072))))

(declare-fun b!1510074 () Bool)

(declare-fun res!1029979 () Bool)

(assert (=> b!1510074 (=> (not res!1029979) (not e!843322))))

(declare-fun lt!655070 () SeekEntryResult!12763)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1510074 (= res!1029979 (= lt!655070 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48592 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48592 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100711 (store (arr!48592 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49142 a!2804)) mask!2512)))))

(declare-fun b!1510075 () Bool)

(declare-fun res!1029977 () Bool)

(assert (=> b!1510075 (=> (not res!1029977) (not e!843320))))

(assert (=> b!1510075 (= res!1029977 (and (= (size!49142 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49142 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49142 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1510076 () Bool)

(assert (=> b!1510076 (= e!843322 (not true))))

(declare-fun e!843319 () Bool)

(assert (=> b!1510076 e!843319))

(declare-fun res!1029981 () Bool)

(assert (=> b!1510076 (=> (not res!1029981) (not e!843319))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100710 (_ BitVec 32)) Bool)

(assert (=> b!1510076 (= res!1029981 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50394 0))(
  ( (Unit!50395) )
))
(declare-fun lt!655071 () Unit!50394)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100710 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50394)

(assert (=> b!1510076 (= lt!655071 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1510077 () Bool)

(assert (=> b!1510077 (= e!843320 e!843322)))

(declare-fun res!1029985 () Bool)

(assert (=> b!1510077 (=> (not res!1029985) (not e!843322))))

(assert (=> b!1510077 (= res!1029985 (= lt!655070 lt!655072))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1510077 (= lt!655072 (Intermediate!12763 false resIndex!21 resX!21))))

(assert (=> b!1510077 (= lt!655070 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48592 a!2804) j!70) mask!2512) (select (arr!48592 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1510078 () Bool)

(declare-fun res!1029980 () Bool)

(assert (=> b!1510078 (=> (not res!1029980) (not e!843320))))

(assert (=> b!1510078 (= res!1029980 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49142 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49142 a!2804))))))

(declare-fun b!1510079 () Bool)

(declare-fun res!1029984 () Bool)

(assert (=> b!1510079 (=> (not res!1029984) (not e!843320))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1510079 (= res!1029984 (validKeyInArray!0 (select (arr!48592 a!2804) j!70)))))

(declare-fun res!1029978 () Bool)

(assert (=> start!128854 (=> (not res!1029978) (not e!843320))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128854 (= res!1029978 (validMask!0 mask!2512))))

(assert (=> start!128854 e!843320))

(assert (=> start!128854 true))

(declare-fun array_inv!37620 (array!100710) Bool)

(assert (=> start!128854 (array_inv!37620 a!2804)))

(declare-fun b!1510080 () Bool)

(declare-fun res!1029983 () Bool)

(assert (=> b!1510080 (=> (not res!1029983) (not e!843320))))

(assert (=> b!1510080 (= res!1029983 (validKeyInArray!0 (select (arr!48592 a!2804) i!961)))))

(declare-fun b!1510081 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100710 (_ BitVec 32)) SeekEntryResult!12763)

(assert (=> b!1510081 (= e!843319 (= (seekEntry!0 (select (arr!48592 a!2804) j!70) a!2804 mask!2512) (Found!12763 j!70)))))

(declare-fun b!1510082 () Bool)

(declare-fun res!1029982 () Bool)

(assert (=> b!1510082 (=> (not res!1029982) (not e!843320))))

(assert (=> b!1510082 (= res!1029982 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(assert (= (and start!128854 res!1029978) b!1510075))

(assert (= (and b!1510075 res!1029977) b!1510080))

(assert (= (and b!1510080 res!1029983) b!1510079))

(assert (= (and b!1510079 res!1029984) b!1510082))

(assert (= (and b!1510082 res!1029982) b!1510072))

(assert (= (and b!1510072 res!1029976) b!1510078))

(assert (= (and b!1510078 res!1029980) b!1510077))

(assert (= (and b!1510077 res!1029985) b!1510073))

(assert (= (and b!1510073 res!1029975) b!1510074))

(assert (= (and b!1510074 res!1029979) b!1510076))

(assert (= (and b!1510076 res!1029981) b!1510081))

(declare-fun m!1392619 () Bool)

(assert (=> b!1510080 m!1392619))

(assert (=> b!1510080 m!1392619))

(declare-fun m!1392621 () Bool)

(assert (=> b!1510080 m!1392621))

(declare-fun m!1392623 () Bool)

(assert (=> b!1510074 m!1392623))

(declare-fun m!1392625 () Bool)

(assert (=> b!1510074 m!1392625))

(assert (=> b!1510074 m!1392625))

(declare-fun m!1392627 () Bool)

(assert (=> b!1510074 m!1392627))

(assert (=> b!1510074 m!1392627))

(assert (=> b!1510074 m!1392625))

(declare-fun m!1392629 () Bool)

(assert (=> b!1510074 m!1392629))

(declare-fun m!1392631 () Bool)

(assert (=> b!1510073 m!1392631))

(assert (=> b!1510073 m!1392631))

(declare-fun m!1392633 () Bool)

(assert (=> b!1510073 m!1392633))

(assert (=> b!1510079 m!1392631))

(assert (=> b!1510079 m!1392631))

(declare-fun m!1392635 () Bool)

(assert (=> b!1510079 m!1392635))

(assert (=> b!1510077 m!1392631))

(assert (=> b!1510077 m!1392631))

(declare-fun m!1392637 () Bool)

(assert (=> b!1510077 m!1392637))

(assert (=> b!1510077 m!1392637))

(assert (=> b!1510077 m!1392631))

(declare-fun m!1392639 () Bool)

(assert (=> b!1510077 m!1392639))

(declare-fun m!1392641 () Bool)

(assert (=> b!1510082 m!1392641))

(declare-fun m!1392643 () Bool)

(assert (=> b!1510076 m!1392643))

(declare-fun m!1392645 () Bool)

(assert (=> b!1510076 m!1392645))

(declare-fun m!1392647 () Bool)

(assert (=> start!128854 m!1392647))

(declare-fun m!1392649 () Bool)

(assert (=> start!128854 m!1392649))

(declare-fun m!1392651 () Bool)

(assert (=> b!1510072 m!1392651))

(assert (=> b!1510081 m!1392631))

(assert (=> b!1510081 m!1392631))

(declare-fun m!1392653 () Bool)

(assert (=> b!1510081 m!1392653))

(push 1)

(assert (not b!1510079))

(assert (not b!1510074))

(assert (not b!1510082))

