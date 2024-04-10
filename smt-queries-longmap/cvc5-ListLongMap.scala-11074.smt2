; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129276 () Bool)

(assert start!129276)

(declare-fun b!1518137 () Bool)

(declare-fun e!846935 () Bool)

(assert (=> b!1518137 (= e!846935 true)))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12974 0))(
  ( (MissingZero!12974 (index!54291 (_ BitVec 32))) (Found!12974 (index!54292 (_ BitVec 32))) (Intermediate!12974 (undefined!13786 Bool) (index!54293 (_ BitVec 32)) (x!135972 (_ BitVec 32))) (Undefined!12974) (MissingVacant!12974 (index!54294 (_ BitVec 32))) )
))
(declare-fun lt!658054 () SeekEntryResult!12974)

(declare-datatypes ((array!101132 0))(
  ( (array!101133 (arr!48803 (Array (_ BitVec 32) (_ BitVec 64))) (size!49353 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101132)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun lt!658057 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101132 (_ BitVec 32)) SeekEntryResult!12974)

(assert (=> b!1518137 (= lt!658054 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!658057 (select (arr!48803 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1518138 () Bool)

(declare-fun res!1038047 () Bool)

(declare-fun e!846938 () Bool)

(assert (=> b!1518138 (=> (not res!1038047) (not e!846938))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101132 (_ BitVec 32)) Bool)

(assert (=> b!1518138 (= res!1038047 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun e!846936 () Bool)

(declare-fun b!1518139 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101132 (_ BitVec 32)) SeekEntryResult!12974)

(assert (=> b!1518139 (= e!846936 (= (seekEntry!0 (select (arr!48803 a!2804) j!70) a!2804 mask!2512) (Found!12974 j!70)))))

(declare-fun b!1518140 () Bool)

(declare-fun e!846937 () Bool)

(declare-fun e!846940 () Bool)

(assert (=> b!1518140 (= e!846937 (not e!846940))))

(declare-fun res!1038052 () Bool)

(assert (=> b!1518140 (=> res!1038052 e!846940)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1518140 (= res!1038052 (or (not (= (select (arr!48803 a!2804) j!70) (select (store (arr!48803 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(assert (=> b!1518140 e!846936))

(declare-fun res!1038046 () Bool)

(assert (=> b!1518140 (=> (not res!1038046) (not e!846936))))

(assert (=> b!1518140 (= res!1038046 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50816 0))(
  ( (Unit!50817) )
))
(declare-fun lt!658053 () Unit!50816)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101132 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50816)

(assert (=> b!1518140 (= lt!658053 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1518141 () Bool)

(assert (=> b!1518141 (= e!846938 e!846937)))

(declare-fun res!1038051 () Bool)

(assert (=> b!1518141 (=> (not res!1038051) (not e!846937))))

(declare-fun lt!658056 () SeekEntryResult!12974)

(declare-fun lt!658055 () SeekEntryResult!12974)

(assert (=> b!1518141 (= res!1038051 (= lt!658056 lt!658055))))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1518141 (= lt!658055 (Intermediate!12974 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1518141 (= lt!658056 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48803 a!2804) j!70) mask!2512) (select (arr!48803 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1518142 () Bool)

(declare-fun res!1038041 () Bool)

(assert (=> b!1518142 (=> (not res!1038041) (not e!846938))))

(declare-fun index!487 () (_ BitVec 32))

(assert (=> b!1518142 (= res!1038041 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49353 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49353 a!2804))))))

(declare-fun res!1038044 () Bool)

(assert (=> start!129276 (=> (not res!1038044) (not e!846938))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129276 (= res!1038044 (validMask!0 mask!2512))))

(assert (=> start!129276 e!846938))

(assert (=> start!129276 true))

(declare-fun array_inv!37831 (array!101132) Bool)

(assert (=> start!129276 (array_inv!37831 a!2804)))

(declare-fun b!1518143 () Bool)

(declare-fun res!1038040 () Bool)

(assert (=> b!1518143 (=> (not res!1038040) (not e!846938))))

(declare-datatypes ((List!35286 0))(
  ( (Nil!35283) (Cons!35282 (h!36694 (_ BitVec 64)) (t!49980 List!35286)) )
))
(declare-fun arrayNoDuplicates!0 (array!101132 (_ BitVec 32) List!35286) Bool)

(assert (=> b!1518143 (= res!1038040 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35283))))

(declare-fun b!1518144 () Bool)

(declare-fun res!1038042 () Bool)

(assert (=> b!1518144 (=> (not res!1038042) (not e!846938))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1518144 (= res!1038042 (validKeyInArray!0 (select (arr!48803 a!2804) j!70)))))

(declare-fun b!1518145 () Bool)

(assert (=> b!1518145 (= e!846940 e!846935)))

(declare-fun res!1038045 () Bool)

(assert (=> b!1518145 (=> res!1038045 e!846935)))

(assert (=> b!1518145 (= res!1038045 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!658057 #b00000000000000000000000000000000) (bvsge lt!658057 (size!49353 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1518145 (= lt!658057 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1518146 () Bool)

(declare-fun res!1038049 () Bool)

(assert (=> b!1518146 (=> (not res!1038049) (not e!846937))))

(assert (=> b!1518146 (= res!1038049 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48803 a!2804) j!70) a!2804 mask!2512) lt!658055))))

(declare-fun b!1518147 () Bool)

(declare-fun res!1038048 () Bool)

(assert (=> b!1518147 (=> (not res!1038048) (not e!846938))))

(assert (=> b!1518147 (= res!1038048 (and (= (size!49353 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49353 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49353 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1518148 () Bool)

(declare-fun res!1038050 () Bool)

(assert (=> b!1518148 (=> (not res!1038050) (not e!846938))))

(assert (=> b!1518148 (= res!1038050 (validKeyInArray!0 (select (arr!48803 a!2804) i!961)))))

(declare-fun b!1518149 () Bool)

(declare-fun res!1038043 () Bool)

(assert (=> b!1518149 (=> (not res!1038043) (not e!846937))))

(assert (=> b!1518149 (= res!1038043 (= lt!658056 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48803 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48803 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101133 (store (arr!48803 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49353 a!2804)) mask!2512)))))

(assert (= (and start!129276 res!1038044) b!1518147))

(assert (= (and b!1518147 res!1038048) b!1518148))

(assert (= (and b!1518148 res!1038050) b!1518144))

(assert (= (and b!1518144 res!1038042) b!1518138))

(assert (= (and b!1518138 res!1038047) b!1518143))

(assert (= (and b!1518143 res!1038040) b!1518142))

(assert (= (and b!1518142 res!1038041) b!1518141))

(assert (= (and b!1518141 res!1038051) b!1518146))

(assert (= (and b!1518146 res!1038049) b!1518149))

(assert (= (and b!1518149 res!1038043) b!1518140))

(assert (= (and b!1518140 res!1038046) b!1518139))

(assert (= (and b!1518140 (not res!1038052)) b!1518145))

(assert (= (and b!1518145 (not res!1038045)) b!1518137))

(declare-fun m!1401445 () Bool)

(assert (=> b!1518149 m!1401445))

(declare-fun m!1401447 () Bool)

(assert (=> b!1518149 m!1401447))

(assert (=> b!1518149 m!1401447))

(declare-fun m!1401449 () Bool)

(assert (=> b!1518149 m!1401449))

(assert (=> b!1518149 m!1401449))

(assert (=> b!1518149 m!1401447))

(declare-fun m!1401451 () Bool)

(assert (=> b!1518149 m!1401451))

(declare-fun m!1401453 () Bool)

(assert (=> b!1518138 m!1401453))

(declare-fun m!1401455 () Bool)

(assert (=> start!129276 m!1401455))

(declare-fun m!1401457 () Bool)

(assert (=> start!129276 m!1401457))

(declare-fun m!1401459 () Bool)

(assert (=> b!1518146 m!1401459))

(assert (=> b!1518146 m!1401459))

(declare-fun m!1401461 () Bool)

(assert (=> b!1518146 m!1401461))

(assert (=> b!1518139 m!1401459))

(assert (=> b!1518139 m!1401459))

(declare-fun m!1401463 () Bool)

(assert (=> b!1518139 m!1401463))

(declare-fun m!1401465 () Bool)

(assert (=> b!1518145 m!1401465))

(declare-fun m!1401467 () Bool)

(assert (=> b!1518143 m!1401467))

(assert (=> b!1518144 m!1401459))

(assert (=> b!1518144 m!1401459))

(declare-fun m!1401469 () Bool)

(assert (=> b!1518144 m!1401469))

(declare-fun m!1401471 () Bool)

(assert (=> b!1518148 m!1401471))

(assert (=> b!1518148 m!1401471))

(declare-fun m!1401473 () Bool)

(assert (=> b!1518148 m!1401473))

(assert (=> b!1518137 m!1401459))

(assert (=> b!1518137 m!1401459))

(declare-fun m!1401475 () Bool)

(assert (=> b!1518137 m!1401475))

(assert (=> b!1518140 m!1401459))

(declare-fun m!1401477 () Bool)

(assert (=> b!1518140 m!1401477))

(assert (=> b!1518140 m!1401445))

(assert (=> b!1518140 m!1401447))

(declare-fun m!1401479 () Bool)

(assert (=> b!1518140 m!1401479))

(assert (=> b!1518141 m!1401459))

(assert (=> b!1518141 m!1401459))

(declare-fun m!1401481 () Bool)

(assert (=> b!1518141 m!1401481))

(assert (=> b!1518141 m!1401481))

(assert (=> b!1518141 m!1401459))

(declare-fun m!1401483 () Bool)

(assert (=> b!1518141 m!1401483))

(push 1)

