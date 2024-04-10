; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129638 () Bool)

(assert start!129638)

(declare-fun b!1521929 () Bool)

(declare-fun res!1041155 () Bool)

(declare-fun e!848689 () Bool)

(assert (=> b!1521929 (=> (not res!1041155) (not e!848689))))

(declare-datatypes ((array!101313 0))(
  ( (array!101314 (arr!48889 (Array (_ BitVec 32) (_ BitVec 64))) (size!49439 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101313)

(declare-datatypes ((List!35372 0))(
  ( (Nil!35369) (Cons!35368 (h!36789 (_ BitVec 64)) (t!50066 List!35372)) )
))
(declare-fun arrayNoDuplicates!0 (array!101313 (_ BitVec 32) List!35372) Bool)

(assert (=> b!1521929 (= res!1041155 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35369))))

(declare-fun b!1521930 () Bool)

(declare-fun res!1041153 () Bool)

(declare-fun e!848687 () Bool)

(assert (=> b!1521930 (=> (not res!1041153) (not e!848687))))

(declare-datatypes ((SeekEntryResult!13054 0))(
  ( (MissingZero!13054 (index!54611 (_ BitVec 32))) (Found!13054 (index!54612 (_ BitVec 32))) (Intermediate!13054 (undefined!13866 Bool) (index!54613 (_ BitVec 32)) (x!136298 (_ BitVec 32))) (Undefined!13054) (MissingVacant!13054 (index!54614 (_ BitVec 32))) )
))
(declare-fun lt!659458 () SeekEntryResult!13054)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101313 (_ BitVec 32)) SeekEntryResult!13054)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1521930 (= res!1041153 (= lt!659458 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48889 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48889 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101314 (store (arr!48889 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49439 a!2804)) mask!2512)))))

(declare-fun b!1521931 () Bool)

(assert (=> b!1521931 (= e!848687 (bvsgt #b00000000000000000000000000000000 (size!49439 a!2804)))))

(declare-fun res!1041156 () Bool)

(assert (=> start!129638 (=> (not res!1041156) (not e!848689))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129638 (= res!1041156 (validMask!0 mask!2512))))

(assert (=> start!129638 e!848689))

(assert (=> start!129638 true))

(declare-fun array_inv!37917 (array!101313) Bool)

(assert (=> start!129638 (array_inv!37917 a!2804)))

(declare-fun b!1521932 () Bool)

(declare-fun res!1041154 () Bool)

(assert (=> b!1521932 (=> (not res!1041154) (not e!848689))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1521932 (= res!1041154 (validKeyInArray!0 (select (arr!48889 a!2804) i!961)))))

(declare-fun b!1521933 () Bool)

(declare-fun res!1041160 () Bool)

(assert (=> b!1521933 (=> (not res!1041160) (not e!848689))))

(assert (=> b!1521933 (= res!1041160 (and (= (size!49439 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49439 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49439 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1521934 () Bool)

(declare-fun res!1041157 () Bool)

(assert (=> b!1521934 (=> (not res!1041157) (not e!848687))))

(declare-fun lt!659457 () SeekEntryResult!13054)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1521934 (= res!1041157 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48889 a!2804) j!70) a!2804 mask!2512) lt!659457))))

(declare-fun b!1521935 () Bool)

(declare-fun res!1041152 () Bool)

(assert (=> b!1521935 (=> (not res!1041152) (not e!848689))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101313 (_ BitVec 32)) Bool)

(assert (=> b!1521935 (= res!1041152 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1521936 () Bool)

(declare-fun res!1041151 () Bool)

(assert (=> b!1521936 (=> (not res!1041151) (not e!848689))))

(assert (=> b!1521936 (= res!1041151 (validKeyInArray!0 (select (arr!48889 a!2804) j!70)))))

(declare-fun b!1521937 () Bool)

(declare-fun res!1041158 () Bool)

(assert (=> b!1521937 (=> (not res!1041158) (not e!848689))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1521937 (= res!1041158 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49439 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49439 a!2804))))))

(declare-fun b!1521938 () Bool)

(assert (=> b!1521938 (= e!848689 e!848687)))

(declare-fun res!1041159 () Bool)

(assert (=> b!1521938 (=> (not res!1041159) (not e!848687))))

(assert (=> b!1521938 (= res!1041159 (= lt!659458 lt!659457))))

(assert (=> b!1521938 (= lt!659457 (Intermediate!13054 false resIndex!21 resX!21))))

(assert (=> b!1521938 (= lt!659458 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48889 a!2804) j!70) mask!2512) (select (arr!48889 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and start!129638 res!1041156) b!1521933))

(assert (= (and b!1521933 res!1041160) b!1521932))

(assert (= (and b!1521932 res!1041154) b!1521936))

(assert (= (and b!1521936 res!1041151) b!1521935))

(assert (= (and b!1521935 res!1041152) b!1521929))

(assert (= (and b!1521929 res!1041155) b!1521937))

(assert (= (and b!1521937 res!1041158) b!1521938))

(assert (= (and b!1521938 res!1041159) b!1521934))

(assert (= (and b!1521934 res!1041157) b!1521930))

(assert (= (and b!1521930 res!1041153) b!1521931))

(declare-fun m!1405049 () Bool)

(assert (=> b!1521930 m!1405049))

(declare-fun m!1405051 () Bool)

(assert (=> b!1521930 m!1405051))

(assert (=> b!1521930 m!1405051))

(declare-fun m!1405053 () Bool)

(assert (=> b!1521930 m!1405053))

(assert (=> b!1521930 m!1405053))

(assert (=> b!1521930 m!1405051))

(declare-fun m!1405055 () Bool)

(assert (=> b!1521930 m!1405055))

(declare-fun m!1405057 () Bool)

(assert (=> b!1521932 m!1405057))

(assert (=> b!1521932 m!1405057))

(declare-fun m!1405059 () Bool)

(assert (=> b!1521932 m!1405059))

(declare-fun m!1405061 () Bool)

(assert (=> b!1521929 m!1405061))

(declare-fun m!1405063 () Bool)

(assert (=> b!1521934 m!1405063))

(assert (=> b!1521934 m!1405063))

(declare-fun m!1405065 () Bool)

(assert (=> b!1521934 m!1405065))

(declare-fun m!1405067 () Bool)

(assert (=> start!129638 m!1405067))

(declare-fun m!1405069 () Bool)

(assert (=> start!129638 m!1405069))

(declare-fun m!1405071 () Bool)

(assert (=> b!1521935 m!1405071))

(assert (=> b!1521938 m!1405063))

(assert (=> b!1521938 m!1405063))

(declare-fun m!1405073 () Bool)

(assert (=> b!1521938 m!1405073))

(assert (=> b!1521938 m!1405073))

(assert (=> b!1521938 m!1405063))

(declare-fun m!1405075 () Bool)

(assert (=> b!1521938 m!1405075))

(assert (=> b!1521936 m!1405063))

(assert (=> b!1521936 m!1405063))

(declare-fun m!1405077 () Bool)

(assert (=> b!1521936 m!1405077))

(push 1)

(assert (not b!1521936))

(assert (not b!1521935))

(assert (not b!1521932))

(assert (not start!129638))

(assert (not b!1521929))

