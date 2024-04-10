; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128778 () Bool)

(assert start!128778)

(declare-fun b!1508931 () Bool)

(declare-fun res!1028835 () Bool)

(declare-fun e!842935 () Bool)

(assert (=> b!1508931 (=> (not res!1028835) (not e!842935))))

(declare-datatypes ((SeekEntryResult!12725 0))(
  ( (MissingZero!12725 (index!53295 (_ BitVec 32))) (Found!12725 (index!53296 (_ BitVec 32))) (Intermediate!12725 (undefined!13537 Bool) (index!53297 (_ BitVec 32)) (x!135059 (_ BitVec 32))) (Undefined!12725) (MissingVacant!12725 (index!53298 (_ BitVec 32))) )
))
(declare-fun lt!654772 () SeekEntryResult!12725)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100634 0))(
  ( (array!100635 (arr!48554 (Array (_ BitVec 32) (_ BitVec 64))) (size!49104 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100634)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100634 (_ BitVec 32)) SeekEntryResult!12725)

(assert (=> b!1508931 (= res!1028835 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48554 a!2804) j!70) a!2804 mask!2512) lt!654772))))

(declare-fun res!1028837 () Bool)

(declare-fun e!842933 () Bool)

(assert (=> start!128778 (=> (not res!1028837) (not e!842933))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128778 (= res!1028837 (validMask!0 mask!2512))))

(assert (=> start!128778 e!842933))

(assert (=> start!128778 true))

(declare-fun array_inv!37582 (array!100634) Bool)

(assert (=> start!128778 (array_inv!37582 a!2804)))

(declare-fun b!1508932 () Bool)

(declare-fun res!1028842 () Bool)

(assert (=> b!1508932 (=> (not res!1028842) (not e!842933))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1508932 (= res!1028842 (and (= (size!49104 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49104 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49104 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1508933 () Bool)

(declare-fun res!1028840 () Bool)

(assert (=> b!1508933 (=> (not res!1028840) (not e!842933))))

(declare-datatypes ((List!35037 0))(
  ( (Nil!35034) (Cons!35033 (h!36445 (_ BitVec 64)) (t!49731 List!35037)) )
))
(declare-fun arrayNoDuplicates!0 (array!100634 (_ BitVec 32) List!35037) Bool)

(assert (=> b!1508933 (= res!1028840 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35034))))

(declare-fun b!1508934 () Bool)

(declare-fun res!1028838 () Bool)

(assert (=> b!1508934 (=> (not res!1028838) (not e!842933))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1508934 (= res!1028838 (validKeyInArray!0 (select (arr!48554 a!2804) j!70)))))

(declare-fun b!1508935 () Bool)

(declare-fun res!1028834 () Bool)

(assert (=> b!1508935 (=> (not res!1028834) (not e!842933))))

(assert (=> b!1508935 (= res!1028834 (validKeyInArray!0 (select (arr!48554 a!2804) i!961)))))

(declare-fun b!1508936 () Bool)

(declare-fun res!1028839 () Bool)

(assert (=> b!1508936 (=> (not res!1028839) (not e!842933))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100634 (_ BitVec 32)) Bool)

(assert (=> b!1508936 (= res!1028839 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1508937 () Bool)

(assert (=> b!1508937 (= e!842933 e!842935)))

(declare-fun res!1028841 () Bool)

(assert (=> b!1508937 (=> (not res!1028841) (not e!842935))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1508937 (= res!1028841 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48554 a!2804) j!70) mask!2512) (select (arr!48554 a!2804) j!70) a!2804 mask!2512) lt!654772))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1508937 (= lt!654772 (Intermediate!12725 false resIndex!21 resX!21))))

(declare-fun b!1508938 () Bool)

(assert (=> b!1508938 (= e!842935 false)))

(declare-fun lt!654771 () SeekEntryResult!12725)

(assert (=> b!1508938 (= lt!654771 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48554 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48554 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100635 (store (arr!48554 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49104 a!2804)) mask!2512))))

(declare-fun b!1508939 () Bool)

(declare-fun res!1028836 () Bool)

(assert (=> b!1508939 (=> (not res!1028836) (not e!842933))))

(assert (=> b!1508939 (= res!1028836 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49104 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49104 a!2804))))))

(assert (= (and start!128778 res!1028837) b!1508932))

(assert (= (and b!1508932 res!1028842) b!1508935))

(assert (= (and b!1508935 res!1028834) b!1508934))

(assert (= (and b!1508934 res!1028838) b!1508936))

(assert (= (and b!1508936 res!1028839) b!1508933))

(assert (= (and b!1508933 res!1028840) b!1508939))

(assert (= (and b!1508939 res!1028836) b!1508937))

(assert (= (and b!1508937 res!1028841) b!1508931))

(assert (= (and b!1508931 res!1028835) b!1508938))

(declare-fun m!1391353 () Bool)

(assert (=> b!1508935 m!1391353))

(assert (=> b!1508935 m!1391353))

(declare-fun m!1391355 () Bool)

(assert (=> b!1508935 m!1391355))

(declare-fun m!1391357 () Bool)

(assert (=> start!128778 m!1391357))

(declare-fun m!1391359 () Bool)

(assert (=> start!128778 m!1391359))

(declare-fun m!1391361 () Bool)

(assert (=> b!1508938 m!1391361))

(declare-fun m!1391363 () Bool)

(assert (=> b!1508938 m!1391363))

(assert (=> b!1508938 m!1391363))

(declare-fun m!1391365 () Bool)

(assert (=> b!1508938 m!1391365))

(assert (=> b!1508938 m!1391365))

(assert (=> b!1508938 m!1391363))

(declare-fun m!1391367 () Bool)

(assert (=> b!1508938 m!1391367))

(declare-fun m!1391369 () Bool)

(assert (=> b!1508937 m!1391369))

(assert (=> b!1508937 m!1391369))

(declare-fun m!1391371 () Bool)

(assert (=> b!1508937 m!1391371))

(assert (=> b!1508937 m!1391371))

(assert (=> b!1508937 m!1391369))

(declare-fun m!1391373 () Bool)

(assert (=> b!1508937 m!1391373))

(declare-fun m!1391375 () Bool)

(assert (=> b!1508933 m!1391375))

(declare-fun m!1391377 () Bool)

(assert (=> b!1508936 m!1391377))

(assert (=> b!1508931 m!1391369))

(assert (=> b!1508931 m!1391369))

(declare-fun m!1391379 () Bool)

(assert (=> b!1508931 m!1391379))

(assert (=> b!1508934 m!1391369))

(assert (=> b!1508934 m!1391369))

(declare-fun m!1391381 () Bool)

(assert (=> b!1508934 m!1391381))

(push 1)

