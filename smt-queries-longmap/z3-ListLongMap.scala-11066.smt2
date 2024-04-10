; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129230 () Bool)

(assert start!129230)

(declare-fun b!1517240 () Bool)

(declare-fun e!846522 () Bool)

(declare-fun e!846525 () Bool)

(assert (=> b!1517240 (= e!846522 e!846525)))

(declare-fun res!1037149 () Bool)

(assert (=> b!1517240 (=> res!1037149 e!846525)))

(declare-fun lt!657711 () (_ BitVec 32))

(declare-datatypes ((array!101086 0))(
  ( (array!101087 (arr!48780 (Array (_ BitVec 32) (_ BitVec 64))) (size!49330 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101086)

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1517240 (= res!1037149 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!657711 #b00000000000000000000000000000000) (bvsge lt!657711 (size!49330 a!2804))))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1517240 (= lt!657711 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1517241 () Bool)

(declare-fun res!1037151 () Bool)

(declare-fun e!846523 () Bool)

(assert (=> b!1517241 (=> (not res!1037151) (not e!846523))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1517241 (= res!1037151 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49330 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49330 a!2804))))))

(declare-fun b!1517242 () Bool)

(declare-fun res!1037145 () Bool)

(assert (=> b!1517242 (=> (not res!1037145) (not e!846523))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1517242 (= res!1037145 (validKeyInArray!0 (select (arr!48780 a!2804) i!961)))))

(declare-fun b!1517243 () Bool)

(declare-fun e!846526 () Bool)

(assert (=> b!1517243 (= e!846526 (not e!846522))))

(declare-fun res!1037148 () Bool)

(assert (=> b!1517243 (=> res!1037148 e!846522)))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1517243 (= res!1037148 (or (not (= (select (arr!48780 a!2804) j!70) (select (store (arr!48780 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!846524 () Bool)

(assert (=> b!1517243 e!846524))

(declare-fun res!1037155 () Bool)

(assert (=> b!1517243 (=> (not res!1037155) (not e!846524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101086 (_ BitVec 32)) Bool)

(assert (=> b!1517243 (= res!1037155 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50770 0))(
  ( (Unit!50771) )
))
(declare-fun lt!657709 () Unit!50770)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101086 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50770)

(assert (=> b!1517243 (= lt!657709 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1517244 () Bool)

(declare-fun res!1037154 () Bool)

(assert (=> b!1517244 (=> (not res!1037154) (not e!846523))))

(declare-datatypes ((List!35263 0))(
  ( (Nil!35260) (Cons!35259 (h!36671 (_ BitVec 64)) (t!49957 List!35263)) )
))
(declare-fun arrayNoDuplicates!0 (array!101086 (_ BitVec 32) List!35263) Bool)

(assert (=> b!1517244 (= res!1037154 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35260))))

(declare-fun res!1037152 () Bool)

(assert (=> start!129230 (=> (not res!1037152) (not e!846523))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129230 (= res!1037152 (validMask!0 mask!2512))))

(assert (=> start!129230 e!846523))

(assert (=> start!129230 true))

(declare-fun array_inv!37808 (array!101086) Bool)

(assert (=> start!129230 (array_inv!37808 a!2804)))

(declare-fun b!1517245 () Bool)

(assert (=> b!1517245 (= e!846525 true)))

(declare-datatypes ((SeekEntryResult!12951 0))(
  ( (MissingZero!12951 (index!54199 (_ BitVec 32))) (Found!12951 (index!54200 (_ BitVec 32))) (Intermediate!12951 (undefined!13763 Bool) (index!54201 (_ BitVec 32)) (x!135885 (_ BitVec 32))) (Undefined!12951) (MissingVacant!12951 (index!54202 (_ BitVec 32))) )
))
(declare-fun lt!657710 () SeekEntryResult!12951)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101086 (_ BitVec 32)) SeekEntryResult!12951)

(assert (=> b!1517245 (= lt!657710 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!657711 (select (arr!48780 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1517246 () Bool)

(assert (=> b!1517246 (= e!846523 e!846526)))

(declare-fun res!1037146 () Bool)

(assert (=> b!1517246 (=> (not res!1037146) (not e!846526))))

(declare-fun lt!657708 () SeekEntryResult!12951)

(declare-fun lt!657712 () SeekEntryResult!12951)

(assert (=> b!1517246 (= res!1037146 (= lt!657708 lt!657712))))

(assert (=> b!1517246 (= lt!657712 (Intermediate!12951 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1517246 (= lt!657708 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48780 a!2804) j!70) mask!2512) (select (arr!48780 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1517247 () Bool)

(declare-fun res!1037144 () Bool)

(assert (=> b!1517247 (=> (not res!1037144) (not e!846523))))

(assert (=> b!1517247 (= res!1037144 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1517248 () Bool)

(declare-fun res!1037150 () Bool)

(assert (=> b!1517248 (=> (not res!1037150) (not e!846526))))

(assert (=> b!1517248 (= res!1037150 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48780 a!2804) j!70) a!2804 mask!2512) lt!657712))))

(declare-fun b!1517249 () Bool)

(declare-fun res!1037143 () Bool)

(assert (=> b!1517249 (=> (not res!1037143) (not e!846526))))

(assert (=> b!1517249 (= res!1037143 (= lt!657708 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48780 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48780 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101087 (store (arr!48780 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49330 a!2804)) mask!2512)))))

(declare-fun b!1517250 () Bool)

(declare-fun res!1037153 () Bool)

(assert (=> b!1517250 (=> (not res!1037153) (not e!846523))))

(assert (=> b!1517250 (= res!1037153 (validKeyInArray!0 (select (arr!48780 a!2804) j!70)))))

(declare-fun b!1517251 () Bool)

(declare-fun res!1037147 () Bool)

(assert (=> b!1517251 (=> (not res!1037147) (not e!846523))))

(assert (=> b!1517251 (= res!1037147 (and (= (size!49330 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49330 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49330 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1517252 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101086 (_ BitVec 32)) SeekEntryResult!12951)

(assert (=> b!1517252 (= e!846524 (= (seekEntry!0 (select (arr!48780 a!2804) j!70) a!2804 mask!2512) (Found!12951 j!70)))))

(assert (= (and start!129230 res!1037152) b!1517251))

(assert (= (and b!1517251 res!1037147) b!1517242))

(assert (= (and b!1517242 res!1037145) b!1517250))

(assert (= (and b!1517250 res!1037153) b!1517247))

(assert (= (and b!1517247 res!1037144) b!1517244))

(assert (= (and b!1517244 res!1037154) b!1517241))

(assert (= (and b!1517241 res!1037151) b!1517246))

(assert (= (and b!1517246 res!1037146) b!1517248))

(assert (= (and b!1517248 res!1037150) b!1517249))

(assert (= (and b!1517249 res!1037143) b!1517243))

(assert (= (and b!1517243 res!1037155) b!1517252))

(assert (= (and b!1517243 (not res!1037148)) b!1517240))

(assert (= (and b!1517240 (not res!1037149)) b!1517245))

(declare-fun m!1400525 () Bool)

(assert (=> b!1517244 m!1400525))

(declare-fun m!1400527 () Bool)

(assert (=> start!129230 m!1400527))

(declare-fun m!1400529 () Bool)

(assert (=> start!129230 m!1400529))

(declare-fun m!1400531 () Bool)

(assert (=> b!1517242 m!1400531))

(assert (=> b!1517242 m!1400531))

(declare-fun m!1400533 () Bool)

(assert (=> b!1517242 m!1400533))

(declare-fun m!1400535 () Bool)

(assert (=> b!1517240 m!1400535))

(declare-fun m!1400537 () Bool)

(assert (=> b!1517246 m!1400537))

(assert (=> b!1517246 m!1400537))

(declare-fun m!1400539 () Bool)

(assert (=> b!1517246 m!1400539))

(assert (=> b!1517246 m!1400539))

(assert (=> b!1517246 m!1400537))

(declare-fun m!1400541 () Bool)

(assert (=> b!1517246 m!1400541))

(assert (=> b!1517243 m!1400537))

(declare-fun m!1400543 () Bool)

(assert (=> b!1517243 m!1400543))

(declare-fun m!1400545 () Bool)

(assert (=> b!1517243 m!1400545))

(declare-fun m!1400547 () Bool)

(assert (=> b!1517243 m!1400547))

(declare-fun m!1400549 () Bool)

(assert (=> b!1517243 m!1400549))

(assert (=> b!1517249 m!1400545))

(assert (=> b!1517249 m!1400547))

(assert (=> b!1517249 m!1400547))

(declare-fun m!1400551 () Bool)

(assert (=> b!1517249 m!1400551))

(assert (=> b!1517249 m!1400551))

(assert (=> b!1517249 m!1400547))

(declare-fun m!1400553 () Bool)

(assert (=> b!1517249 m!1400553))

(assert (=> b!1517245 m!1400537))

(assert (=> b!1517245 m!1400537))

(declare-fun m!1400555 () Bool)

(assert (=> b!1517245 m!1400555))

(assert (=> b!1517248 m!1400537))

(assert (=> b!1517248 m!1400537))

(declare-fun m!1400557 () Bool)

(assert (=> b!1517248 m!1400557))

(declare-fun m!1400559 () Bool)

(assert (=> b!1517247 m!1400559))

(assert (=> b!1517252 m!1400537))

(assert (=> b!1517252 m!1400537))

(declare-fun m!1400561 () Bool)

(assert (=> b!1517252 m!1400561))

(assert (=> b!1517250 m!1400537))

(assert (=> b!1517250 m!1400537))

(declare-fun m!1400563 () Bool)

(assert (=> b!1517250 m!1400563))

(check-sat (not b!1517244) (not b!1517252) (not b!1517250) (not b!1517240) (not b!1517242) (not b!1517247) (not b!1517249) (not b!1517246) (not b!1517245) (not start!129230) (not b!1517248) (not b!1517243))
(check-sat)
