; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128882 () Bool)

(assert start!128882)

(declare-fun b!1511061 () Bool)

(declare-fun e!843595 () Bool)

(declare-fun e!843594 () Bool)

(assert (=> b!1511061 (= e!843595 e!843594)))

(declare-fun res!1031172 () Bool)

(assert (=> b!1511061 (=> (not res!1031172) (not e!843594))))

(declare-datatypes ((SeekEntryResult!12801 0))(
  ( (MissingZero!12801 (index!53599 (_ BitVec 32))) (Found!12801 (index!53600 (_ BitVec 32))) (Intermediate!12801 (undefined!13613 Bool) (index!53601 (_ BitVec 32)) (x!135337 (_ BitVec 32))) (Undefined!12801) (MissingVacant!12801 (index!53602 (_ BitVec 32))) )
))
(declare-fun lt!655137 () SeekEntryResult!12801)

(declare-fun lt!655135 () SeekEntryResult!12801)

(assert (=> b!1511061 (= res!1031172 (= lt!655137 lt!655135))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1511061 (= lt!655135 (Intermediate!12801 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100738 0))(
  ( (array!100739 (arr!48607 (Array (_ BitVec 32) (_ BitVec 64))) (size!49159 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100738)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100738 (_ BitVec 32)) SeekEntryResult!12801)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1511061 (= lt!655137 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48607 a!2804) j!70) mask!2512) (select (arr!48607 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1511062 () Bool)

(declare-fun res!1031175 () Bool)

(assert (=> b!1511062 (=> (not res!1031175) (not e!843595))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1511062 (= res!1031175 (validKeyInArray!0 (select (arr!48607 a!2804) j!70)))))

(declare-fun b!1511063 () Bool)

(declare-fun res!1031179 () Bool)

(assert (=> b!1511063 (=> (not res!1031179) (not e!843594))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1511063 (= res!1031179 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48607 a!2804) j!70) a!2804 mask!2512) lt!655135))))

(declare-fun b!1511064 () Bool)

(assert (=> b!1511064 (= e!843594 (not true))))

(declare-fun e!843597 () Bool)

(assert (=> b!1511064 e!843597))

(declare-fun res!1031170 () Bool)

(assert (=> b!1511064 (=> (not res!1031170) (not e!843597))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100738 (_ BitVec 32)) Bool)

(assert (=> b!1511064 (= res!1031170 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50309 0))(
  ( (Unit!50310) )
))
(declare-fun lt!655136 () Unit!50309)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100738 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50309)

(assert (=> b!1511064 (= lt!655136 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1511065 () Bool)

(declare-fun res!1031176 () Bool)

(assert (=> b!1511065 (=> (not res!1031176) (not e!843595))))

(assert (=> b!1511065 (= res!1031176 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49159 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49159 a!2804))))))

(declare-fun b!1511066 () Bool)

(declare-fun res!1031174 () Bool)

(assert (=> b!1511066 (=> (not res!1031174) (not e!843594))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1511066 (= res!1031174 (= lt!655137 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48607 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48607 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100739 (store (arr!48607 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49159 a!2804)) mask!2512)))))

(declare-fun b!1511067 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100738 (_ BitVec 32)) SeekEntryResult!12801)

(assert (=> b!1511067 (= e!843597 (= (seekEntry!0 (select (arr!48607 a!2804) j!70) a!2804 mask!2512) (Found!12801 j!70)))))

(declare-fun res!1031178 () Bool)

(assert (=> start!128882 (=> (not res!1031178) (not e!843595))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128882 (= res!1031178 (validMask!0 mask!2512))))

(assert (=> start!128882 e!843595))

(assert (=> start!128882 true))

(declare-fun array_inv!37840 (array!100738) Bool)

(assert (=> start!128882 (array_inv!37840 a!2804)))

(declare-fun b!1511068 () Bool)

(declare-fun res!1031180 () Bool)

(assert (=> b!1511068 (=> (not res!1031180) (not e!843595))))

(assert (=> b!1511068 (= res!1031180 (and (= (size!49159 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49159 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49159 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1511069 () Bool)

(declare-fun res!1031171 () Bool)

(assert (=> b!1511069 (=> (not res!1031171) (not e!843595))))

(declare-datatypes ((List!35168 0))(
  ( (Nil!35165) (Cons!35164 (h!36577 (_ BitVec 64)) (t!49854 List!35168)) )
))
(declare-fun arrayNoDuplicates!0 (array!100738 (_ BitVec 32) List!35168) Bool)

(assert (=> b!1511069 (= res!1031171 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35165))))

(declare-fun b!1511070 () Bool)

(declare-fun res!1031177 () Bool)

(assert (=> b!1511070 (=> (not res!1031177) (not e!843595))))

(assert (=> b!1511070 (= res!1031177 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1511071 () Bool)

(declare-fun res!1031173 () Bool)

(assert (=> b!1511071 (=> (not res!1031173) (not e!843595))))

(assert (=> b!1511071 (= res!1031173 (validKeyInArray!0 (select (arr!48607 a!2804) i!961)))))

(assert (= (and start!128882 res!1031178) b!1511068))

(assert (= (and b!1511068 res!1031180) b!1511071))

(assert (= (and b!1511071 res!1031173) b!1511062))

(assert (= (and b!1511062 res!1031175) b!1511070))

(assert (= (and b!1511070 res!1031177) b!1511069))

(assert (= (and b!1511069 res!1031171) b!1511065))

(assert (= (and b!1511065 res!1031176) b!1511061))

(assert (= (and b!1511061 res!1031172) b!1511063))

(assert (= (and b!1511063 res!1031179) b!1511066))

(assert (= (and b!1511066 res!1031174) b!1511064))

(assert (= (and b!1511064 res!1031170) b!1511067))

(declare-fun m!1393187 () Bool)

(assert (=> b!1511070 m!1393187))

(declare-fun m!1393189 () Bool)

(assert (=> start!128882 m!1393189))

(declare-fun m!1393191 () Bool)

(assert (=> start!128882 m!1393191))

(declare-fun m!1393193 () Bool)

(assert (=> b!1511067 m!1393193))

(assert (=> b!1511067 m!1393193))

(declare-fun m!1393195 () Bool)

(assert (=> b!1511067 m!1393195))

(assert (=> b!1511063 m!1393193))

(assert (=> b!1511063 m!1393193))

(declare-fun m!1393197 () Bool)

(assert (=> b!1511063 m!1393197))

(declare-fun m!1393199 () Bool)

(assert (=> b!1511071 m!1393199))

(assert (=> b!1511071 m!1393199))

(declare-fun m!1393201 () Bool)

(assert (=> b!1511071 m!1393201))

(declare-fun m!1393203 () Bool)

(assert (=> b!1511064 m!1393203))

(declare-fun m!1393205 () Bool)

(assert (=> b!1511064 m!1393205))

(declare-fun m!1393207 () Bool)

(assert (=> b!1511069 m!1393207))

(assert (=> b!1511061 m!1393193))

(assert (=> b!1511061 m!1393193))

(declare-fun m!1393209 () Bool)

(assert (=> b!1511061 m!1393209))

(assert (=> b!1511061 m!1393209))

(assert (=> b!1511061 m!1393193))

(declare-fun m!1393211 () Bool)

(assert (=> b!1511061 m!1393211))

(assert (=> b!1511062 m!1393193))

(assert (=> b!1511062 m!1393193))

(declare-fun m!1393213 () Bool)

(assert (=> b!1511062 m!1393213))

(declare-fun m!1393215 () Bool)

(assert (=> b!1511066 m!1393215))

(declare-fun m!1393217 () Bool)

(assert (=> b!1511066 m!1393217))

(assert (=> b!1511066 m!1393217))

(declare-fun m!1393219 () Bool)

(assert (=> b!1511066 m!1393219))

(assert (=> b!1511066 m!1393219))

(assert (=> b!1511066 m!1393217))

(declare-fun m!1393221 () Bool)

(assert (=> b!1511066 m!1393221))

(check-sat (not b!1511062) (not b!1511063) (not b!1511071) (not b!1511066) (not b!1511064) (not b!1511069) (not b!1511070) (not start!128882) (not b!1511061) (not b!1511067))
(check-sat)
