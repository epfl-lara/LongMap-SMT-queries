; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129280 () Bool)

(assert start!129280)

(declare-fun b!1518215 () Bool)

(declare-fun e!846976 () Bool)

(declare-fun e!846973 () Bool)

(assert (=> b!1518215 (= e!846976 e!846973)))

(declare-fun res!1038124 () Bool)

(assert (=> b!1518215 (=> (not res!1038124) (not e!846973))))

(declare-datatypes ((SeekEntryResult!12976 0))(
  ( (MissingZero!12976 (index!54299 (_ BitVec 32))) (Found!12976 (index!54300 (_ BitVec 32))) (Intermediate!12976 (undefined!13788 Bool) (index!54301 (_ BitVec 32)) (x!135974 (_ BitVec 32))) (Undefined!12976) (MissingVacant!12976 (index!54302 (_ BitVec 32))) )
))
(declare-fun lt!658084 () SeekEntryResult!12976)

(declare-fun lt!658086 () SeekEntryResult!12976)

(assert (=> b!1518215 (= res!1038124 (= lt!658084 lt!658086))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1518215 (= lt!658086 (Intermediate!12976 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101136 0))(
  ( (array!101137 (arr!48805 (Array (_ BitVec 32) (_ BitVec 64))) (size!49355 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101136)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101136 (_ BitVec 32)) SeekEntryResult!12976)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1518215 (= lt!658084 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48805 a!2804) j!70) mask!2512) (select (arr!48805 a!2804) j!70) a!2804 mask!2512))))

(declare-fun res!1038122 () Bool)

(assert (=> start!129280 (=> (not res!1038122) (not e!846976))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129280 (= res!1038122 (validMask!0 mask!2512))))

(assert (=> start!129280 e!846976))

(assert (=> start!129280 true))

(declare-fun array_inv!37833 (array!101136) Bool)

(assert (=> start!129280 (array_inv!37833 a!2804)))

(declare-fun b!1518216 () Bool)

(declare-fun res!1038126 () Bool)

(assert (=> b!1518216 (=> (not res!1038126) (not e!846976))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101136 (_ BitVec 32)) Bool)

(assert (=> b!1518216 (= res!1038126 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1518217 () Bool)

(declare-fun e!846974 () Bool)

(declare-fun e!846972 () Bool)

(assert (=> b!1518217 (= e!846974 e!846972)))

(declare-fun res!1038119 () Bool)

(assert (=> b!1518217 (=> res!1038119 e!846972)))

(declare-fun lt!658087 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1518217 (= res!1038119 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!658087 #b00000000000000000000000000000000) (bvsge lt!658087 (size!49355 a!2804))))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1518217 (= lt!658087 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1518218 () Bool)

(declare-fun res!1038130 () Bool)

(assert (=> b!1518218 (=> (not res!1038130) (not e!846976))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1518218 (= res!1038130 (and (= (size!49355 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49355 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49355 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1518219 () Bool)

(assert (=> b!1518219 (= e!846973 (not e!846974))))

(declare-fun res!1038123 () Bool)

(assert (=> b!1518219 (=> res!1038123 e!846974)))

(assert (=> b!1518219 (= res!1038123 (or (not (= (select (arr!48805 a!2804) j!70) (select (store (arr!48805 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!846975 () Bool)

(assert (=> b!1518219 e!846975))

(declare-fun res!1038120 () Bool)

(assert (=> b!1518219 (=> (not res!1038120) (not e!846975))))

(assert (=> b!1518219 (= res!1038120 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50820 0))(
  ( (Unit!50821) )
))
(declare-fun lt!658085 () Unit!50820)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101136 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50820)

(assert (=> b!1518219 (= lt!658085 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1518220 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101136 (_ BitVec 32)) SeekEntryResult!12976)

(assert (=> b!1518220 (= e!846975 (= (seekEntry!0 (select (arr!48805 a!2804) j!70) a!2804 mask!2512) (Found!12976 j!70)))))

(declare-fun b!1518221 () Bool)

(declare-fun res!1038118 () Bool)

(assert (=> b!1518221 (=> (not res!1038118) (not e!846973))))

(assert (=> b!1518221 (= res!1038118 (= lt!658084 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48805 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48805 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101137 (store (arr!48805 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49355 a!2804)) mask!2512)))))

(declare-fun b!1518222 () Bool)

(declare-fun res!1038125 () Bool)

(assert (=> b!1518222 (=> (not res!1038125) (not e!846976))))

(assert (=> b!1518222 (= res!1038125 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49355 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49355 a!2804))))))

(declare-fun b!1518223 () Bool)

(assert (=> b!1518223 (= e!846972 true)))

(declare-fun lt!658083 () SeekEntryResult!12976)

(assert (=> b!1518223 (= lt!658083 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!658087 (select (arr!48805 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1518224 () Bool)

(declare-fun res!1038121 () Bool)

(assert (=> b!1518224 (=> (not res!1038121) (not e!846976))))

(declare-datatypes ((List!35288 0))(
  ( (Nil!35285) (Cons!35284 (h!36696 (_ BitVec 64)) (t!49982 List!35288)) )
))
(declare-fun arrayNoDuplicates!0 (array!101136 (_ BitVec 32) List!35288) Bool)

(assert (=> b!1518224 (= res!1038121 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35285))))

(declare-fun b!1518225 () Bool)

(declare-fun res!1038129 () Bool)

(assert (=> b!1518225 (=> (not res!1038129) (not e!846976))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1518225 (= res!1038129 (validKeyInArray!0 (select (arr!48805 a!2804) i!961)))))

(declare-fun b!1518226 () Bool)

(declare-fun res!1038127 () Bool)

(assert (=> b!1518226 (=> (not res!1038127) (not e!846976))))

(assert (=> b!1518226 (= res!1038127 (validKeyInArray!0 (select (arr!48805 a!2804) j!70)))))

(declare-fun b!1518227 () Bool)

(declare-fun res!1038128 () Bool)

(assert (=> b!1518227 (=> (not res!1038128) (not e!846973))))

(assert (=> b!1518227 (= res!1038128 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48805 a!2804) j!70) a!2804 mask!2512) lt!658086))))

(assert (= (and start!129280 res!1038122) b!1518218))

(assert (= (and b!1518218 res!1038130) b!1518225))

(assert (= (and b!1518225 res!1038129) b!1518226))

(assert (= (and b!1518226 res!1038127) b!1518216))

(assert (= (and b!1518216 res!1038126) b!1518224))

(assert (= (and b!1518224 res!1038121) b!1518222))

(assert (= (and b!1518222 res!1038125) b!1518215))

(assert (= (and b!1518215 res!1038124) b!1518227))

(assert (= (and b!1518227 res!1038128) b!1518221))

(assert (= (and b!1518221 res!1038118) b!1518219))

(assert (= (and b!1518219 res!1038120) b!1518220))

(assert (= (and b!1518219 (not res!1038123)) b!1518217))

(assert (= (and b!1518217 (not res!1038119)) b!1518223))

(declare-fun m!1401525 () Bool)

(assert (=> b!1518226 m!1401525))

(assert (=> b!1518226 m!1401525))

(declare-fun m!1401527 () Bool)

(assert (=> b!1518226 m!1401527))

(assert (=> b!1518227 m!1401525))

(assert (=> b!1518227 m!1401525))

(declare-fun m!1401529 () Bool)

(assert (=> b!1518227 m!1401529))

(assert (=> b!1518215 m!1401525))

(assert (=> b!1518215 m!1401525))

(declare-fun m!1401531 () Bool)

(assert (=> b!1518215 m!1401531))

(assert (=> b!1518215 m!1401531))

(assert (=> b!1518215 m!1401525))

(declare-fun m!1401533 () Bool)

(assert (=> b!1518215 m!1401533))

(declare-fun m!1401535 () Bool)

(assert (=> b!1518224 m!1401535))

(declare-fun m!1401537 () Bool)

(assert (=> b!1518221 m!1401537))

(declare-fun m!1401539 () Bool)

(assert (=> b!1518221 m!1401539))

(assert (=> b!1518221 m!1401539))

(declare-fun m!1401541 () Bool)

(assert (=> b!1518221 m!1401541))

(assert (=> b!1518221 m!1401541))

(assert (=> b!1518221 m!1401539))

(declare-fun m!1401543 () Bool)

(assert (=> b!1518221 m!1401543))

(declare-fun m!1401545 () Bool)

(assert (=> start!129280 m!1401545))

(declare-fun m!1401547 () Bool)

(assert (=> start!129280 m!1401547))

(declare-fun m!1401549 () Bool)

(assert (=> b!1518225 m!1401549))

(assert (=> b!1518225 m!1401549))

(declare-fun m!1401551 () Bool)

(assert (=> b!1518225 m!1401551))

(assert (=> b!1518219 m!1401525))

(declare-fun m!1401553 () Bool)

(assert (=> b!1518219 m!1401553))

(assert (=> b!1518219 m!1401537))

(assert (=> b!1518219 m!1401539))

(declare-fun m!1401555 () Bool)

(assert (=> b!1518219 m!1401555))

(assert (=> b!1518223 m!1401525))

(assert (=> b!1518223 m!1401525))

(declare-fun m!1401557 () Bool)

(assert (=> b!1518223 m!1401557))

(assert (=> b!1518220 m!1401525))

(assert (=> b!1518220 m!1401525))

(declare-fun m!1401559 () Bool)

(assert (=> b!1518220 m!1401559))

(declare-fun m!1401561 () Bool)

(assert (=> b!1518217 m!1401561))

(declare-fun m!1401563 () Bool)

(assert (=> b!1518216 m!1401563))

(push 1)

(assert (not b!1518216))

(assert (not b!1518220))

