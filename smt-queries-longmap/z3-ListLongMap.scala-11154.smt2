; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130236 () Bool)

(assert start!130236)

(declare-fun res!1047293 () Bool)

(declare-fun e!852249 () Bool)

(assert (=> start!130236 (=> (not res!1047293) (not e!852249))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130236 (= res!1047293 (validMask!0 mask!2512))))

(assert (=> start!130236 e!852249))

(assert (=> start!130236 true))

(declare-datatypes ((array!101584 0))(
  ( (array!101585 (arr!49018 (Array (_ BitVec 32) (_ BitVec 64))) (size!49570 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101584)

(declare-fun array_inv!38251 (array!101584) Bool)

(assert (=> start!130236 (array_inv!38251 a!2804)))

(declare-fun b!1529399 () Bool)

(declare-fun res!1047297 () Bool)

(declare-fun e!852248 () Bool)

(assert (=> b!1529399 (=> (not res!1047297) (not e!852248))))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13206 0))(
  ( (MissingZero!13206 (index!55219 (_ BitVec 32))) (Found!13206 (index!55220 (_ BitVec 32))) (Intermediate!13206 (undefined!14018 Bool) (index!55221 (_ BitVec 32)) (x!136904 (_ BitVec 32))) (Undefined!13206) (MissingVacant!13206 (index!55222 (_ BitVec 32))) )
))
(declare-fun lt!662240 () SeekEntryResult!13206)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101584 (_ BitVec 32)) SeekEntryResult!13206)

(assert (=> b!1529399 (= res!1047297 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49018 a!2804) j!70) a!2804 mask!2512) lt!662240))))

(declare-fun b!1529400 () Bool)

(declare-fun e!852246 () Bool)

(assert (=> b!1529400 (= e!852248 (not e!852246))))

(declare-fun res!1047301 () Bool)

(assert (=> b!1529400 (=> res!1047301 e!852246)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1529400 (= res!1047301 (or (not (= (select (arr!49018 a!2804) j!70) (select (store (arr!49018 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!852250 () Bool)

(assert (=> b!1529400 e!852250))

(declare-fun res!1047290 () Bool)

(assert (=> b!1529400 (=> (not res!1047290) (not e!852250))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101584 (_ BitVec 32)) Bool)

(assert (=> b!1529400 (= res!1047290 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51035 0))(
  ( (Unit!51036) )
))
(declare-fun lt!662238 () Unit!51035)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101584 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51035)

(assert (=> b!1529400 (= lt!662238 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1529401 () Bool)

(declare-fun res!1047292 () Bool)

(assert (=> b!1529401 (=> (not res!1047292) (not e!852249))))

(assert (=> b!1529401 (= res!1047292 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1529402 () Bool)

(assert (=> b!1529402 (= e!852249 e!852248)))

(declare-fun res!1047296 () Bool)

(assert (=> b!1529402 (=> (not res!1047296) (not e!852248))))

(declare-fun lt!662239 () SeekEntryResult!13206)

(assert (=> b!1529402 (= res!1047296 (= lt!662239 lt!662240))))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1529402 (= lt!662240 (Intermediate!13206 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1529402 (= lt!662239 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49018 a!2804) j!70) mask!2512) (select (arr!49018 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1529403 () Bool)

(declare-fun res!1047294 () Bool)

(assert (=> b!1529403 (=> (not res!1047294) (not e!852249))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1529403 (= res!1047294 (validKeyInArray!0 (select (arr!49018 a!2804) i!961)))))

(declare-fun b!1529404 () Bool)

(declare-fun res!1047295 () Bool)

(assert (=> b!1529404 (=> (not res!1047295) (not e!852249))))

(assert (=> b!1529404 (= res!1047295 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49570 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49570 a!2804))))))

(declare-fun b!1529405 () Bool)

(declare-fun res!1047291 () Bool)

(assert (=> b!1529405 (=> (not res!1047291) (not e!852248))))

(assert (=> b!1529405 (= res!1047291 (= lt!662239 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49018 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49018 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101585 (store (arr!49018 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49570 a!2804)) mask!2512)))))

(declare-fun b!1529406 () Bool)

(declare-fun res!1047299 () Bool)

(assert (=> b!1529406 (=> (not res!1047299) (not e!852249))))

(declare-datatypes ((List!35579 0))(
  ( (Nil!35576) (Cons!35575 (h!37012 (_ BitVec 64)) (t!50265 List!35579)) )
))
(declare-fun arrayNoDuplicates!0 (array!101584 (_ BitVec 32) List!35579) Bool)

(assert (=> b!1529406 (= res!1047299 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35576))))

(declare-fun b!1529407 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101584 (_ BitVec 32)) SeekEntryResult!13206)

(assert (=> b!1529407 (= e!852250 (= (seekEntry!0 (select (arr!49018 a!2804) j!70) a!2804 mask!2512) (Found!13206 j!70)))))

(declare-fun b!1529408 () Bool)

(declare-fun res!1047300 () Bool)

(assert (=> b!1529408 (=> (not res!1047300) (not e!852249))))

(assert (=> b!1529408 (= res!1047300 (and (= (size!49570 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49570 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49570 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1529409 () Bool)

(assert (=> b!1529409 (= e!852246 true)))

(declare-fun lt!662241 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1529409 (= lt!662241 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1529410 () Bool)

(declare-fun res!1047298 () Bool)

(assert (=> b!1529410 (=> (not res!1047298) (not e!852249))))

(assert (=> b!1529410 (= res!1047298 (validKeyInArray!0 (select (arr!49018 a!2804) j!70)))))

(assert (= (and start!130236 res!1047293) b!1529408))

(assert (= (and b!1529408 res!1047300) b!1529403))

(assert (= (and b!1529403 res!1047294) b!1529410))

(assert (= (and b!1529410 res!1047298) b!1529401))

(assert (= (and b!1529401 res!1047292) b!1529406))

(assert (= (and b!1529406 res!1047299) b!1529404))

(assert (= (and b!1529404 res!1047295) b!1529402))

(assert (= (and b!1529402 res!1047296) b!1529399))

(assert (= (and b!1529399 res!1047297) b!1529405))

(assert (= (and b!1529405 res!1047291) b!1529400))

(assert (= (and b!1529400 res!1047290) b!1529407))

(assert (= (and b!1529400 (not res!1047301)) b!1529409))

(declare-fun m!1411781 () Bool)

(assert (=> b!1529401 m!1411781))

(declare-fun m!1411783 () Bool)

(assert (=> start!130236 m!1411783))

(declare-fun m!1411785 () Bool)

(assert (=> start!130236 m!1411785))

(declare-fun m!1411787 () Bool)

(assert (=> b!1529409 m!1411787))

(declare-fun m!1411789 () Bool)

(assert (=> b!1529407 m!1411789))

(assert (=> b!1529407 m!1411789))

(declare-fun m!1411791 () Bool)

(assert (=> b!1529407 m!1411791))

(assert (=> b!1529399 m!1411789))

(assert (=> b!1529399 m!1411789))

(declare-fun m!1411793 () Bool)

(assert (=> b!1529399 m!1411793))

(declare-fun m!1411795 () Bool)

(assert (=> b!1529405 m!1411795))

(declare-fun m!1411797 () Bool)

(assert (=> b!1529405 m!1411797))

(assert (=> b!1529405 m!1411797))

(declare-fun m!1411799 () Bool)

(assert (=> b!1529405 m!1411799))

(assert (=> b!1529405 m!1411799))

(assert (=> b!1529405 m!1411797))

(declare-fun m!1411801 () Bool)

(assert (=> b!1529405 m!1411801))

(declare-fun m!1411803 () Bool)

(assert (=> b!1529406 m!1411803))

(assert (=> b!1529402 m!1411789))

(assert (=> b!1529402 m!1411789))

(declare-fun m!1411805 () Bool)

(assert (=> b!1529402 m!1411805))

(assert (=> b!1529402 m!1411805))

(assert (=> b!1529402 m!1411789))

(declare-fun m!1411807 () Bool)

(assert (=> b!1529402 m!1411807))

(assert (=> b!1529400 m!1411789))

(declare-fun m!1411809 () Bool)

(assert (=> b!1529400 m!1411809))

(assert (=> b!1529400 m!1411795))

(assert (=> b!1529400 m!1411797))

(declare-fun m!1411811 () Bool)

(assert (=> b!1529400 m!1411811))

(declare-fun m!1411813 () Bool)

(assert (=> b!1529403 m!1411813))

(assert (=> b!1529403 m!1411813))

(declare-fun m!1411815 () Bool)

(assert (=> b!1529403 m!1411815))

(assert (=> b!1529410 m!1411789))

(assert (=> b!1529410 m!1411789))

(declare-fun m!1411817 () Bool)

(assert (=> b!1529410 m!1411817))

(check-sat (not b!1529403) (not b!1529400) (not b!1529399) (not b!1529406) (not b!1529401) (not b!1529407) (not start!130236) (not b!1529409) (not b!1529405) (not b!1529402) (not b!1529410))
(check-sat)
