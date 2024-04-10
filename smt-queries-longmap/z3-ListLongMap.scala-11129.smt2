; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130072 () Bool)

(assert start!130072)

(declare-fun b!1526398 () Bool)

(declare-fun res!1044437 () Bool)

(declare-fun e!850814 () Bool)

(assert (=> b!1526398 (=> (not res!1044437) (not e!850814))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!101485 0))(
  ( (array!101486 (arr!48969 (Array (_ BitVec 32) (_ BitVec 64))) (size!49519 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101485)

(declare-datatypes ((SeekEntryResult!13134 0))(
  ( (MissingZero!13134 (index!54931 (_ BitVec 32))) (Found!13134 (index!54932 (_ BitVec 32))) (Intermediate!13134 (undefined!13946 Bool) (index!54933 (_ BitVec 32)) (x!136628 (_ BitVec 32))) (Undefined!13134) (MissingVacant!13134 (index!54934 (_ BitVec 32))) )
))
(declare-fun lt!661062 () SeekEntryResult!13134)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101485 (_ BitVec 32)) SeekEntryResult!13134)

(assert (=> b!1526398 (= res!1044437 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48969 a!2804) j!70) a!2804 mask!2512) lt!661062))))

(declare-fun b!1526399 () Bool)

(declare-fun e!850810 () Bool)

(assert (=> b!1526399 (= e!850810 (not true))))

(declare-fun e!850813 () Bool)

(assert (=> b!1526399 e!850813))

(declare-fun res!1044436 () Bool)

(assert (=> b!1526399 (=> (not res!1044436) (not e!850813))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101485 (_ BitVec 32)) Bool)

(assert (=> b!1526399 (= res!1044436 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51052 0))(
  ( (Unit!51053) )
))
(declare-fun lt!661063 () Unit!51052)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101485 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51052)

(assert (=> b!1526399 (= lt!661063 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun res!1044440 () Bool)

(declare-fun e!850812 () Bool)

(assert (=> start!130072 (=> (not res!1044440) (not e!850812))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130072 (= res!1044440 (validMask!0 mask!2512))))

(assert (=> start!130072 e!850812))

(assert (=> start!130072 true))

(declare-fun array_inv!37997 (array!101485) Bool)

(assert (=> start!130072 (array_inv!37997 a!2804)))

(declare-fun b!1526400 () Bool)

(declare-fun res!1044441 () Bool)

(assert (=> b!1526400 (=> (not res!1044441) (not e!850812))))

(assert (=> b!1526400 (= res!1044441 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1526401 () Bool)

(declare-fun res!1044444 () Bool)

(assert (=> b!1526401 (=> (not res!1044444) (not e!850812))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1526401 (= res!1044444 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49519 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49519 a!2804))))))

(declare-fun b!1526402 () Bool)

(declare-fun e!850811 () Bool)

(declare-fun e!850816 () Bool)

(assert (=> b!1526402 (= e!850811 e!850816)))

(declare-fun res!1044438 () Bool)

(assert (=> b!1526402 (=> (not res!1044438) (not e!850816))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101485 (_ BitVec 32)) SeekEntryResult!13134)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101485 (_ BitVec 32)) SeekEntryResult!13134)

(assert (=> b!1526402 (= res!1044438 (= (seekEntryOrOpen!0 (select (arr!48969 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48969 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1526403 () Bool)

(assert (=> b!1526403 (= e!850813 e!850811)))

(declare-fun res!1044433 () Bool)

(assert (=> b!1526403 (=> res!1044433 e!850811)))

(declare-fun lt!661060 () (_ BitVec 64))

(assert (=> b!1526403 (= res!1044433 (or (not (= (select (arr!48969 a!2804) j!70) lt!661060)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48969 a!2804) index!487) (select (arr!48969 a!2804) j!70)) (not (= (select (arr!48969 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1526404 () Bool)

(declare-fun res!1044439 () Bool)

(assert (=> b!1526404 (=> (not res!1044439) (not e!850812))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1526404 (= res!1044439 (and (= (size!49519 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49519 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49519 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1526405 () Bool)

(assert (=> b!1526405 (= e!850812 e!850814)))

(declare-fun res!1044443 () Bool)

(assert (=> b!1526405 (=> (not res!1044443) (not e!850814))))

(declare-fun lt!661059 () SeekEntryResult!13134)

(assert (=> b!1526405 (= res!1044443 (= lt!661059 lt!661062))))

(assert (=> b!1526405 (= lt!661062 (Intermediate!13134 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1526405 (= lt!661059 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48969 a!2804) j!70) mask!2512) (select (arr!48969 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1526406 () Bool)

(declare-fun lt!661061 () array!101485)

(assert (=> b!1526406 (= e!850816 (= (seekEntryOrOpen!0 lt!661060 lt!661061 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!661060 lt!661061 mask!2512)))))

(declare-fun b!1526407 () Bool)

(declare-fun res!1044445 () Bool)

(assert (=> b!1526407 (=> (not res!1044445) (not e!850812))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1526407 (= res!1044445 (validKeyInArray!0 (select (arr!48969 a!2804) i!961)))))

(declare-fun b!1526408 () Bool)

(declare-fun res!1044432 () Bool)

(assert (=> b!1526408 (=> (not res!1044432) (not e!850812))))

(declare-datatypes ((List!35452 0))(
  ( (Nil!35449) (Cons!35448 (h!36881 (_ BitVec 64)) (t!50146 List!35452)) )
))
(declare-fun arrayNoDuplicates!0 (array!101485 (_ BitVec 32) List!35452) Bool)

(assert (=> b!1526408 (= res!1044432 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35449))))

(declare-fun b!1526409 () Bool)

(declare-fun res!1044442 () Bool)

(assert (=> b!1526409 (=> (not res!1044442) (not e!850813))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!101485 (_ BitVec 32)) SeekEntryResult!13134)

(assert (=> b!1526409 (= res!1044442 (= (seekEntry!0 (select (arr!48969 a!2804) j!70) a!2804 mask!2512) (Found!13134 j!70)))))

(declare-fun b!1526410 () Bool)

(assert (=> b!1526410 (= e!850814 e!850810)))

(declare-fun res!1044434 () Bool)

(assert (=> b!1526410 (=> (not res!1044434) (not e!850810))))

(assert (=> b!1526410 (= res!1044434 (= lt!661059 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!661060 mask!2512) lt!661060 lt!661061 mask!2512)))))

(assert (=> b!1526410 (= lt!661060 (select (store (arr!48969 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1526410 (= lt!661061 (array!101486 (store (arr!48969 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49519 a!2804)))))

(declare-fun b!1526411 () Bool)

(declare-fun res!1044435 () Bool)

(assert (=> b!1526411 (=> (not res!1044435) (not e!850812))))

(assert (=> b!1526411 (= res!1044435 (validKeyInArray!0 (select (arr!48969 a!2804) j!70)))))

(assert (= (and start!130072 res!1044440) b!1526404))

(assert (= (and b!1526404 res!1044439) b!1526407))

(assert (= (and b!1526407 res!1044445) b!1526411))

(assert (= (and b!1526411 res!1044435) b!1526400))

(assert (= (and b!1526400 res!1044441) b!1526408))

(assert (= (and b!1526408 res!1044432) b!1526401))

(assert (= (and b!1526401 res!1044444) b!1526405))

(assert (= (and b!1526405 res!1044443) b!1526398))

(assert (= (and b!1526398 res!1044437) b!1526410))

(assert (= (and b!1526410 res!1044434) b!1526399))

(assert (= (and b!1526399 res!1044436) b!1526409))

(assert (= (and b!1526409 res!1044442) b!1526403))

(assert (= (and b!1526403 (not res!1044433)) b!1526402))

(assert (= (and b!1526402 res!1044438) b!1526406))

(declare-fun m!1409197 () Bool)

(assert (=> b!1526409 m!1409197))

(assert (=> b!1526409 m!1409197))

(declare-fun m!1409199 () Bool)

(assert (=> b!1526409 m!1409199))

(assert (=> b!1526402 m!1409197))

(assert (=> b!1526402 m!1409197))

(declare-fun m!1409201 () Bool)

(assert (=> b!1526402 m!1409201))

(assert (=> b!1526402 m!1409197))

(declare-fun m!1409203 () Bool)

(assert (=> b!1526402 m!1409203))

(declare-fun m!1409205 () Bool)

(assert (=> b!1526410 m!1409205))

(assert (=> b!1526410 m!1409205))

(declare-fun m!1409207 () Bool)

(assert (=> b!1526410 m!1409207))

(declare-fun m!1409209 () Bool)

(assert (=> b!1526410 m!1409209))

(declare-fun m!1409211 () Bool)

(assert (=> b!1526410 m!1409211))

(declare-fun m!1409213 () Bool)

(assert (=> b!1526408 m!1409213))

(assert (=> b!1526411 m!1409197))

(assert (=> b!1526411 m!1409197))

(declare-fun m!1409215 () Bool)

(assert (=> b!1526411 m!1409215))

(declare-fun m!1409217 () Bool)

(assert (=> start!130072 m!1409217))

(declare-fun m!1409219 () Bool)

(assert (=> start!130072 m!1409219))

(assert (=> b!1526405 m!1409197))

(assert (=> b!1526405 m!1409197))

(declare-fun m!1409221 () Bool)

(assert (=> b!1526405 m!1409221))

(assert (=> b!1526405 m!1409221))

(assert (=> b!1526405 m!1409197))

(declare-fun m!1409223 () Bool)

(assert (=> b!1526405 m!1409223))

(declare-fun m!1409225 () Bool)

(assert (=> b!1526407 m!1409225))

(assert (=> b!1526407 m!1409225))

(declare-fun m!1409227 () Bool)

(assert (=> b!1526407 m!1409227))

(assert (=> b!1526403 m!1409197))

(declare-fun m!1409229 () Bool)

(assert (=> b!1526403 m!1409229))

(declare-fun m!1409231 () Bool)

(assert (=> b!1526400 m!1409231))

(declare-fun m!1409233 () Bool)

(assert (=> b!1526406 m!1409233))

(declare-fun m!1409235 () Bool)

(assert (=> b!1526406 m!1409235))

(declare-fun m!1409237 () Bool)

(assert (=> b!1526399 m!1409237))

(declare-fun m!1409239 () Bool)

(assert (=> b!1526399 m!1409239))

(assert (=> b!1526398 m!1409197))

(assert (=> b!1526398 m!1409197))

(declare-fun m!1409241 () Bool)

(assert (=> b!1526398 m!1409241))

(check-sat (not b!1526398) (not b!1526409) (not b!1526405) (not b!1526402) (not b!1526411) (not b!1526410) (not b!1526400) (not b!1526407) (not start!130072) (not b!1526399) (not b!1526408) (not b!1526406))
(check-sat)
