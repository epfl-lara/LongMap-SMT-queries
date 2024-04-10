; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129178 () Bool)

(assert start!129178)

(declare-fun b!1516246 () Bool)

(declare-fun res!1036153 () Bool)

(declare-fun e!846073 () Bool)

(assert (=> b!1516246 (=> (not res!1036153) (not e!846073))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-datatypes ((array!101034 0))(
  ( (array!101035 (arr!48754 (Array (_ BitVec 32) (_ BitVec 64))) (size!49304 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101034)

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1516246 (= res!1036153 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49304 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49304 a!2804))))))

(declare-fun b!1516247 () Bool)

(declare-fun res!1036154 () Bool)

(assert (=> b!1516247 (=> (not res!1036154) (not e!846073))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101034 (_ BitVec 32)) Bool)

(assert (=> b!1516247 (= res!1036154 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1516248 () Bool)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun e!846074 () Bool)

(declare-datatypes ((SeekEntryResult!12925 0))(
  ( (MissingZero!12925 (index!54095 (_ BitVec 32))) (Found!12925 (index!54096 (_ BitVec 32))) (Intermediate!12925 (undefined!13737 Bool) (index!54097 (_ BitVec 32)) (x!135787 (_ BitVec 32))) (Undefined!12925) (MissingVacant!12925 (index!54098 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101034 (_ BitVec 32)) SeekEntryResult!12925)

(assert (=> b!1516248 (= e!846074 (= (seekEntry!0 (select (arr!48754 a!2804) j!70) a!2804 mask!2512) (Found!12925 j!70)))))

(declare-fun b!1516249 () Bool)

(declare-fun res!1036158 () Bool)

(declare-fun e!846075 () Bool)

(assert (=> b!1516249 (=> (not res!1036158) (not e!846075))))

(declare-fun lt!657339 () SeekEntryResult!12925)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101034 (_ BitVec 32)) SeekEntryResult!12925)

(assert (=> b!1516249 (= res!1036158 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48754 a!2804) j!70) a!2804 mask!2512) lt!657339))))

(declare-fun b!1516250 () Bool)

(assert (=> b!1516250 (= e!846073 e!846075)))

(declare-fun res!1036156 () Bool)

(assert (=> b!1516250 (=> (not res!1036156) (not e!846075))))

(declare-fun lt!657338 () SeekEntryResult!12925)

(assert (=> b!1516250 (= res!1036156 (= lt!657338 lt!657339))))

(assert (=> b!1516250 (= lt!657339 (Intermediate!12925 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1516250 (= lt!657338 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48754 a!2804) j!70) mask!2512) (select (arr!48754 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1516251 () Bool)

(declare-fun res!1036157 () Bool)

(assert (=> b!1516251 (=> (not res!1036157) (not e!846073))))

(declare-datatypes ((List!35237 0))(
  ( (Nil!35234) (Cons!35233 (h!36645 (_ BitVec 64)) (t!49931 List!35237)) )
))
(declare-fun arrayNoDuplicates!0 (array!101034 (_ BitVec 32) List!35237) Bool)

(assert (=> b!1516251 (= res!1036157 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35234))))

(declare-fun b!1516252 () Bool)

(declare-fun res!1036159 () Bool)

(assert (=> b!1516252 (=> (not res!1036159) (not e!846075))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1516252 (= res!1036159 (= lt!657338 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48754 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48754 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101035 (store (arr!48754 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49304 a!2804)) mask!2512)))))

(declare-fun res!1036152 () Bool)

(assert (=> start!129178 (=> (not res!1036152) (not e!846073))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129178 (= res!1036152 (validMask!0 mask!2512))))

(assert (=> start!129178 e!846073))

(assert (=> start!129178 true))

(declare-fun array_inv!37782 (array!101034) Bool)

(assert (=> start!129178 (array_inv!37782 a!2804)))

(declare-fun b!1516253 () Bool)

(declare-fun res!1036150 () Bool)

(assert (=> b!1516253 (=> (not res!1036150) (not e!846073))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1516253 (= res!1036150 (validKeyInArray!0 (select (arr!48754 a!2804) j!70)))))

(declare-fun b!1516254 () Bool)

(declare-fun res!1036155 () Bool)

(assert (=> b!1516254 (=> (not res!1036155) (not e!846073))))

(assert (=> b!1516254 (= res!1036155 (validKeyInArray!0 (select (arr!48754 a!2804) i!961)))))

(declare-fun b!1516255 () Bool)

(assert (=> b!1516255 (= e!846075 (not (or (not (= (select (arr!48754 a!2804) j!70) (select (store (arr!48754 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21) (bvslt mask!2512 #b00000000000000000000000000000000) (bvslt index!487 (bvadd #b00000000000000000000000000000001 mask!2512)))))))

(assert (=> b!1516255 e!846074))

(declare-fun res!1036151 () Bool)

(assert (=> b!1516255 (=> (not res!1036151) (not e!846074))))

(assert (=> b!1516255 (= res!1036151 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50718 0))(
  ( (Unit!50719) )
))
(declare-fun lt!657340 () Unit!50718)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101034 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50718)

(assert (=> b!1516255 (= lt!657340 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1516256 () Bool)

(declare-fun res!1036149 () Bool)

(assert (=> b!1516256 (=> (not res!1036149) (not e!846073))))

(assert (=> b!1516256 (= res!1036149 (and (= (size!49304 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49304 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49304 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!129178 res!1036152) b!1516256))

(assert (= (and b!1516256 res!1036149) b!1516254))

(assert (= (and b!1516254 res!1036155) b!1516253))

(assert (= (and b!1516253 res!1036150) b!1516247))

(assert (= (and b!1516247 res!1036154) b!1516251))

(assert (= (and b!1516251 res!1036157) b!1516246))

(assert (= (and b!1516246 res!1036153) b!1516250))

(assert (= (and b!1516250 res!1036156) b!1516249))

(assert (= (and b!1516249 res!1036158) b!1516252))

(assert (= (and b!1516252 res!1036159) b!1516255))

(assert (= (and b!1516255 res!1036151) b!1516248))

(declare-fun m!1399501 () Bool)

(assert (=> b!1516251 m!1399501))

(declare-fun m!1399503 () Bool)

(assert (=> start!129178 m!1399503))

(declare-fun m!1399505 () Bool)

(assert (=> start!129178 m!1399505))

(declare-fun m!1399507 () Bool)

(assert (=> b!1516250 m!1399507))

(assert (=> b!1516250 m!1399507))

(declare-fun m!1399509 () Bool)

(assert (=> b!1516250 m!1399509))

(assert (=> b!1516250 m!1399509))

(assert (=> b!1516250 m!1399507))

(declare-fun m!1399511 () Bool)

(assert (=> b!1516250 m!1399511))

(declare-fun m!1399513 () Bool)

(assert (=> b!1516247 m!1399513))

(assert (=> b!1516255 m!1399507))

(declare-fun m!1399515 () Bool)

(assert (=> b!1516255 m!1399515))

(declare-fun m!1399517 () Bool)

(assert (=> b!1516255 m!1399517))

(declare-fun m!1399519 () Bool)

(assert (=> b!1516255 m!1399519))

(declare-fun m!1399521 () Bool)

(assert (=> b!1516255 m!1399521))

(declare-fun m!1399523 () Bool)

(assert (=> b!1516254 m!1399523))

(assert (=> b!1516254 m!1399523))

(declare-fun m!1399525 () Bool)

(assert (=> b!1516254 m!1399525))

(assert (=> b!1516252 m!1399517))

(assert (=> b!1516252 m!1399519))

(assert (=> b!1516252 m!1399519))

(declare-fun m!1399527 () Bool)

(assert (=> b!1516252 m!1399527))

(assert (=> b!1516252 m!1399527))

(assert (=> b!1516252 m!1399519))

(declare-fun m!1399529 () Bool)

(assert (=> b!1516252 m!1399529))

(assert (=> b!1516253 m!1399507))

(assert (=> b!1516253 m!1399507))

(declare-fun m!1399531 () Bool)

(assert (=> b!1516253 m!1399531))

(assert (=> b!1516249 m!1399507))

(assert (=> b!1516249 m!1399507))

(declare-fun m!1399533 () Bool)

(assert (=> b!1516249 m!1399533))

(assert (=> b!1516248 m!1399507))

(assert (=> b!1516248 m!1399507))

(declare-fun m!1399535 () Bool)

(assert (=> b!1516248 m!1399535))

(push 1)

(assert (not b!1516255))

(assert (not b!1516251))

(assert (not b!1516247))

(assert (not b!1516254))

(assert (not b!1516252))

(assert (not start!129178))

(assert (not b!1516249))

(assert (not b!1516250))

(assert (not b!1516248))

(assert (not b!1516253))

(check-sat)

(pop 1)

(push 1)

(check-sat)

