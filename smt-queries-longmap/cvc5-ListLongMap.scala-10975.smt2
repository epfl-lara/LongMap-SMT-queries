; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128514 () Bool)

(assert start!128514)

(declare-fun b!1506906 () Bool)

(declare-fun res!1027230 () Bool)

(declare-fun e!842038 () Bool)

(assert (=> b!1506906 (=> (not res!1027230) (not e!842038))))

(declare-datatypes ((array!100526 0))(
  ( (array!100527 (arr!48506 (Array (_ BitVec 32) (_ BitVec 64))) (size!49056 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100526)

(declare-datatypes ((List!34989 0))(
  ( (Nil!34986) (Cons!34985 (h!36385 (_ BitVec 64)) (t!49683 List!34989)) )
))
(declare-fun arrayNoDuplicates!0 (array!100526 (_ BitVec 32) List!34989) Bool)

(assert (=> b!1506906 (= res!1027230 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!34986))))

(declare-fun b!1506907 () Bool)

(declare-fun res!1027232 () Bool)

(assert (=> b!1506907 (=> (not res!1027232) (not e!842038))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(assert (=> b!1506907 (= res!1027232 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49056 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49056 a!2804))))))

(declare-fun b!1506908 () Bool)

(declare-fun res!1027234 () Bool)

(declare-fun e!842037 () Bool)

(assert (=> b!1506908 (=> (not res!1027234) (not e!842037))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12677 0))(
  ( (MissingZero!12677 (index!53103 (_ BitVec 32))) (Found!12677 (index!53104 (_ BitVec 32))) (Intermediate!12677 (undefined!13489 Bool) (index!53105 (_ BitVec 32)) (x!134859 (_ BitVec 32))) (Undefined!12677) (MissingVacant!12677 (index!53106 (_ BitVec 32))) )
))
(declare-fun lt!654280 () SeekEntryResult!12677)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100526 (_ BitVec 32)) SeekEntryResult!12677)

(assert (=> b!1506908 (= res!1027234 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48506 a!2804) j!70) a!2804 mask!2512) lt!654280))))

(declare-fun res!1027231 () Bool)

(assert (=> start!128514 (=> (not res!1027231) (not e!842038))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128514 (= res!1027231 (validMask!0 mask!2512))))

(assert (=> start!128514 e!842038))

(assert (=> start!128514 true))

(declare-fun array_inv!37534 (array!100526) Bool)

(assert (=> start!128514 (array_inv!37534 a!2804)))

(declare-fun b!1506909 () Bool)

(declare-fun res!1027233 () Bool)

(assert (=> b!1506909 (=> (not res!1027233) (not e!842038))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1506909 (= res!1027233 (and (= (size!49056 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49056 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49056 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1506910 () Bool)

(assert (=> b!1506910 (= e!842038 e!842037)))

(declare-fun res!1027237 () Bool)

(assert (=> b!1506910 (=> (not res!1027237) (not e!842037))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1506910 (= res!1027237 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48506 a!2804) j!70) mask!2512) (select (arr!48506 a!2804) j!70) a!2804 mask!2512) lt!654280))))

(assert (=> b!1506910 (= lt!654280 (Intermediate!12677 false resIndex!21 resX!21))))

(declare-fun b!1506911 () Bool)

(declare-fun res!1027236 () Bool)

(assert (=> b!1506911 (=> (not res!1027236) (not e!842038))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100526 (_ BitVec 32)) Bool)

(assert (=> b!1506911 (= res!1027236 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1506912 () Bool)

(declare-fun res!1027235 () Bool)

(assert (=> b!1506912 (=> (not res!1027235) (not e!842038))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1506912 (= res!1027235 (validKeyInArray!0 (select (arr!48506 a!2804) i!961)))))

(declare-fun b!1506913 () Bool)

(declare-fun res!1027229 () Bool)

(assert (=> b!1506913 (=> (not res!1027229) (not e!842038))))

(assert (=> b!1506913 (= res!1027229 (validKeyInArray!0 (select (arr!48506 a!2804) j!70)))))

(declare-fun b!1506914 () Bool)

(assert (=> b!1506914 (= e!842037 (bvslt mask!2512 #b00000000000000000000000000000000))))

(assert (= (and start!128514 res!1027231) b!1506909))

(assert (= (and b!1506909 res!1027233) b!1506912))

(assert (= (and b!1506912 res!1027235) b!1506913))

(assert (= (and b!1506913 res!1027229) b!1506911))

(assert (= (and b!1506911 res!1027236) b!1506906))

(assert (= (and b!1506906 res!1027230) b!1506907))

(assert (= (and b!1506907 res!1027232) b!1506910))

(assert (= (and b!1506910 res!1027237) b!1506908))

(assert (= (and b!1506908 res!1027234) b!1506914))

(declare-fun m!1389799 () Bool)

(assert (=> b!1506912 m!1389799))

(assert (=> b!1506912 m!1389799))

(declare-fun m!1389801 () Bool)

(assert (=> b!1506912 m!1389801))

(declare-fun m!1389803 () Bool)

(assert (=> start!128514 m!1389803))

(declare-fun m!1389805 () Bool)

(assert (=> start!128514 m!1389805))

(declare-fun m!1389807 () Bool)

(assert (=> b!1506908 m!1389807))

(assert (=> b!1506908 m!1389807))

(declare-fun m!1389809 () Bool)

(assert (=> b!1506908 m!1389809))

(declare-fun m!1389811 () Bool)

(assert (=> b!1506911 m!1389811))

(assert (=> b!1506913 m!1389807))

(assert (=> b!1506913 m!1389807))

(declare-fun m!1389813 () Bool)

(assert (=> b!1506913 m!1389813))

(declare-fun m!1389815 () Bool)

(assert (=> b!1506906 m!1389815))

(assert (=> b!1506910 m!1389807))

(assert (=> b!1506910 m!1389807))

(declare-fun m!1389817 () Bool)

(assert (=> b!1506910 m!1389817))

(assert (=> b!1506910 m!1389817))

(assert (=> b!1506910 m!1389807))

(declare-fun m!1389819 () Bool)

(assert (=> b!1506910 m!1389819))

(push 1)

(assert (not b!1506910))

(assert (not b!1506906))

(assert (not b!1506911))

(assert (not b!1506908))

(assert (not b!1506912))

(assert (not b!1506913))

(assert (not start!128514))

(check-sat)

(pop 1)

(push 1)

(check-sat)

