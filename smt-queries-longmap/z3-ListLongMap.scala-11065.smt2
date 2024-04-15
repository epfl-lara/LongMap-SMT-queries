; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129170 () Bool)

(assert start!129170)

(declare-fun b!1516744 () Bool)

(declare-fun e!846239 () Bool)

(declare-fun e!846237 () Bool)

(assert (=> b!1516744 (= e!846239 e!846237)))

(declare-fun res!1036859 () Bool)

(assert (=> b!1516744 (=> (not res!1036859) (not e!846237))))

(declare-datatypes ((SeekEntryResult!12945 0))(
  ( (MissingZero!12945 (index!54175 (_ BitVec 32))) (Found!12945 (index!54176 (_ BitVec 32))) (Intermediate!12945 (undefined!13757 Bool) (index!54177 (_ BitVec 32)) (x!135865 (_ BitVec 32))) (Undefined!12945) (MissingVacant!12945 (index!54178 (_ BitVec 32))) )
))
(declare-fun lt!657353 () SeekEntryResult!12945)

(declare-fun lt!657354 () SeekEntryResult!12945)

(assert (=> b!1516744 (= res!1036859 (= lt!657353 lt!657354))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1516744 (= lt!657354 (Intermediate!12945 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101026 0))(
  ( (array!101027 (arr!48751 (Array (_ BitVec 32) (_ BitVec 64))) (size!49303 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101026)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101026 (_ BitVec 32)) SeekEntryResult!12945)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1516744 (= lt!657353 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48751 a!2804) j!70) mask!2512) (select (arr!48751 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1516745 () Bool)

(declare-fun res!1036862 () Bool)

(assert (=> b!1516745 (=> (not res!1036862) (not e!846237))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1516745 (= res!1036862 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48751 a!2804) j!70) a!2804 mask!2512) lt!657354))))

(declare-fun b!1516746 () Bool)

(declare-fun res!1036853 () Bool)

(assert (=> b!1516746 (=> (not res!1036853) (not e!846239))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1516746 (= res!1036853 (and (= (size!49303 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49303 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49303 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1516747 () Bool)

(declare-fun e!846240 () Bool)

(assert (=> b!1516747 (= e!846240 true)))

(declare-fun lt!657355 () (_ BitVec 32))

(declare-fun lt!657356 () SeekEntryResult!12945)

(assert (=> b!1516747 (= lt!657356 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!657355 (select (arr!48751 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1516748 () Bool)

(declare-fun res!1036863 () Bool)

(assert (=> b!1516748 (=> (not res!1036863) (not e!846239))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1516748 (= res!1036863 (validKeyInArray!0 (select (arr!48751 a!2804) i!961)))))

(declare-fun b!1516750 () Bool)

(declare-fun res!1036854 () Bool)

(assert (=> b!1516750 (=> (not res!1036854) (not e!846239))))

(declare-datatypes ((List!35312 0))(
  ( (Nil!35309) (Cons!35308 (h!36721 (_ BitVec 64)) (t!49998 List!35312)) )
))
(declare-fun arrayNoDuplicates!0 (array!101026 (_ BitVec 32) List!35312) Bool)

(assert (=> b!1516750 (= res!1036854 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35309))))

(declare-fun b!1516751 () Bool)

(declare-fun e!846236 () Bool)

(assert (=> b!1516751 (= e!846236 e!846240)))

(declare-fun res!1036860 () Bool)

(assert (=> b!1516751 (=> res!1036860 e!846240)))

(assert (=> b!1516751 (= res!1036860 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!657355 #b00000000000000000000000000000000) (bvsge lt!657355 (size!49303 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1516751 (= lt!657355 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1516752 () Bool)

(declare-fun res!1036865 () Bool)

(assert (=> b!1516752 (=> (not res!1036865) (not e!846239))))

(assert (=> b!1516752 (= res!1036865 (validKeyInArray!0 (select (arr!48751 a!2804) j!70)))))

(declare-fun b!1516749 () Bool)

(declare-fun res!1036856 () Bool)

(assert (=> b!1516749 (=> (not res!1036856) (not e!846239))))

(assert (=> b!1516749 (= res!1036856 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49303 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49303 a!2804))))))

(declare-fun res!1036857 () Bool)

(assert (=> start!129170 (=> (not res!1036857) (not e!846239))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129170 (= res!1036857 (validMask!0 mask!2512))))

(assert (=> start!129170 e!846239))

(assert (=> start!129170 true))

(declare-fun array_inv!37984 (array!101026) Bool)

(assert (=> start!129170 (array_inv!37984 a!2804)))

(declare-fun b!1516753 () Bool)

(declare-fun res!1036861 () Bool)

(assert (=> b!1516753 (=> (not res!1036861) (not e!846239))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101026 (_ BitVec 32)) Bool)

(assert (=> b!1516753 (= res!1036861 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1516754 () Bool)

(assert (=> b!1516754 (= e!846237 (not e!846236))))

(declare-fun res!1036864 () Bool)

(assert (=> b!1516754 (=> res!1036864 e!846236)))

(assert (=> b!1516754 (= res!1036864 (or (not (= (select (arr!48751 a!2804) j!70) (select (store (arr!48751 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!846238 () Bool)

(assert (=> b!1516754 e!846238))

(declare-fun res!1036855 () Bool)

(assert (=> b!1516754 (=> (not res!1036855) (not e!846238))))

(assert (=> b!1516754 (= res!1036855 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50597 0))(
  ( (Unit!50598) )
))
(declare-fun lt!657357 () Unit!50597)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101026 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50597)

(assert (=> b!1516754 (= lt!657357 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1516755 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101026 (_ BitVec 32)) SeekEntryResult!12945)

(assert (=> b!1516755 (= e!846238 (= (seekEntry!0 (select (arr!48751 a!2804) j!70) a!2804 mask!2512) (Found!12945 j!70)))))

(declare-fun b!1516756 () Bool)

(declare-fun res!1036858 () Bool)

(assert (=> b!1516756 (=> (not res!1036858) (not e!846237))))

(assert (=> b!1516756 (= res!1036858 (= lt!657353 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48751 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48751 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101027 (store (arr!48751 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49303 a!2804)) mask!2512)))))

(assert (= (and start!129170 res!1036857) b!1516746))

(assert (= (and b!1516746 res!1036853) b!1516748))

(assert (= (and b!1516748 res!1036863) b!1516752))

(assert (= (and b!1516752 res!1036865) b!1516753))

(assert (= (and b!1516753 res!1036861) b!1516750))

(assert (= (and b!1516750 res!1036854) b!1516749))

(assert (= (and b!1516749 res!1036856) b!1516744))

(assert (= (and b!1516744 res!1036859) b!1516745))

(assert (= (and b!1516745 res!1036862) b!1516756))

(assert (= (and b!1516756 res!1036858) b!1516754))

(assert (= (and b!1516754 res!1036855) b!1516755))

(assert (= (and b!1516754 (not res!1036864)) b!1516751))

(assert (= (and b!1516751 (not res!1036860)) b!1516747))

(declare-fun m!1399457 () Bool)

(assert (=> b!1516754 m!1399457))

(declare-fun m!1399459 () Bool)

(assert (=> b!1516754 m!1399459))

(declare-fun m!1399461 () Bool)

(assert (=> b!1516754 m!1399461))

(declare-fun m!1399463 () Bool)

(assert (=> b!1516754 m!1399463))

(declare-fun m!1399465 () Bool)

(assert (=> b!1516754 m!1399465))

(declare-fun m!1399467 () Bool)

(assert (=> b!1516753 m!1399467))

(assert (=> b!1516744 m!1399457))

(assert (=> b!1516744 m!1399457))

(declare-fun m!1399469 () Bool)

(assert (=> b!1516744 m!1399469))

(assert (=> b!1516744 m!1399469))

(assert (=> b!1516744 m!1399457))

(declare-fun m!1399471 () Bool)

(assert (=> b!1516744 m!1399471))

(declare-fun m!1399473 () Bool)

(assert (=> b!1516750 m!1399473))

(assert (=> b!1516747 m!1399457))

(assert (=> b!1516747 m!1399457))

(declare-fun m!1399475 () Bool)

(assert (=> b!1516747 m!1399475))

(assert (=> b!1516752 m!1399457))

(assert (=> b!1516752 m!1399457))

(declare-fun m!1399477 () Bool)

(assert (=> b!1516752 m!1399477))

(assert (=> b!1516755 m!1399457))

(assert (=> b!1516755 m!1399457))

(declare-fun m!1399479 () Bool)

(assert (=> b!1516755 m!1399479))

(declare-fun m!1399481 () Bool)

(assert (=> start!129170 m!1399481))

(declare-fun m!1399483 () Bool)

(assert (=> start!129170 m!1399483))

(assert (=> b!1516745 m!1399457))

(assert (=> b!1516745 m!1399457))

(declare-fun m!1399485 () Bool)

(assert (=> b!1516745 m!1399485))

(assert (=> b!1516756 m!1399461))

(assert (=> b!1516756 m!1399463))

(assert (=> b!1516756 m!1399463))

(declare-fun m!1399487 () Bool)

(assert (=> b!1516756 m!1399487))

(assert (=> b!1516756 m!1399487))

(assert (=> b!1516756 m!1399463))

(declare-fun m!1399489 () Bool)

(assert (=> b!1516756 m!1399489))

(declare-fun m!1399491 () Bool)

(assert (=> b!1516751 m!1399491))

(declare-fun m!1399493 () Bool)

(assert (=> b!1516748 m!1399493))

(assert (=> b!1516748 m!1399493))

(declare-fun m!1399495 () Bool)

(assert (=> b!1516748 m!1399495))

(check-sat (not b!1516756) (not b!1516754) (not b!1516748) (not b!1516745) (not b!1516752) (not b!1516755) (not b!1516753) (not start!129170) (not b!1516751) (not b!1516747) (not b!1516744) (not b!1516750))
(check-sat)
