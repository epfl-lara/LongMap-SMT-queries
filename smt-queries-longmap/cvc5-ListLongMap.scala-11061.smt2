; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129198 () Bool)

(assert start!129198)

(declare-fun b!1516616 () Bool)

(declare-fun res!1036523 () Bool)

(declare-fun e!846236 () Bool)

(assert (=> b!1516616 (=> (not res!1036523) (not e!846236))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101054 0))(
  ( (array!101055 (arr!48764 (Array (_ BitVec 32) (_ BitVec 64))) (size!49314 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101054)

(assert (=> b!1516616 (= res!1036523 (and (= (size!49314 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49314 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49314 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1516617 () Bool)

(declare-fun res!1036525 () Bool)

(assert (=> b!1516617 (=> (not res!1036525) (not e!846236))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1516617 (= res!1036525 (validKeyInArray!0 (select (arr!48764 a!2804) i!961)))))

(declare-fun b!1516618 () Bool)

(declare-fun res!1036522 () Bool)

(assert (=> b!1516618 (=> (not res!1036522) (not e!846236))))

(assert (=> b!1516618 (= res!1036522 (validKeyInArray!0 (select (arr!48764 a!2804) j!70)))))

(declare-fun b!1516620 () Bool)

(declare-fun e!846235 () Bool)

(declare-fun e!846233 () Bool)

(assert (=> b!1516620 (= e!846235 (not e!846233))))

(declare-fun res!1036526 () Bool)

(assert (=> b!1516620 (=> res!1036526 e!846233)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1516620 (= res!1036526 (or (not (= (select (arr!48764 a!2804) j!70) (select (store (arr!48764 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!846238 () Bool)

(assert (=> b!1516620 e!846238))

(declare-fun res!1036527 () Bool)

(assert (=> b!1516620 (=> (not res!1036527) (not e!846238))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101054 (_ BitVec 32)) Bool)

(assert (=> b!1516620 (= res!1036527 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50738 0))(
  ( (Unit!50739) )
))
(declare-fun lt!657472 () Unit!50738)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101054 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50738)

(assert (=> b!1516620 (= lt!657472 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1516621 () Bool)

(declare-fun e!846234 () Bool)

(assert (=> b!1516621 (= e!846234 true)))

(declare-fun lt!657468 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12935 0))(
  ( (MissingZero!12935 (index!54135 (_ BitVec 32))) (Found!12935 (index!54136 (_ BitVec 32))) (Intermediate!12935 (undefined!13747 Bool) (index!54137 (_ BitVec 32)) (x!135829 (_ BitVec 32))) (Undefined!12935) (MissingVacant!12935 (index!54138 (_ BitVec 32))) )
))
(declare-fun lt!657469 () SeekEntryResult!12935)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101054 (_ BitVec 32)) SeekEntryResult!12935)

(assert (=> b!1516621 (= lt!657469 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!657468 (select (arr!48764 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1516622 () Bool)

(declare-fun res!1036521 () Bool)

(assert (=> b!1516622 (=> (not res!1036521) (not e!846236))))

(declare-datatypes ((List!35247 0))(
  ( (Nil!35244) (Cons!35243 (h!36655 (_ BitVec 64)) (t!49941 List!35247)) )
))
(declare-fun arrayNoDuplicates!0 (array!101054 (_ BitVec 32) List!35247) Bool)

(assert (=> b!1516622 (= res!1036521 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35244))))

(declare-fun b!1516623 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101054 (_ BitVec 32)) SeekEntryResult!12935)

(assert (=> b!1516623 (= e!846238 (= (seekEntry!0 (select (arr!48764 a!2804) j!70) a!2804 mask!2512) (Found!12935 j!70)))))

(declare-fun b!1516624 () Bool)

(declare-fun res!1036531 () Bool)

(assert (=> b!1516624 (=> (not res!1036531) (not e!846236))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(assert (=> b!1516624 (= res!1036531 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49314 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49314 a!2804))))))

(declare-fun b!1516625 () Bool)

(declare-fun res!1036519 () Bool)

(assert (=> b!1516625 (=> (not res!1036519) (not e!846235))))

(declare-fun lt!657470 () SeekEntryResult!12935)

(assert (=> b!1516625 (= res!1036519 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48764 a!2804) j!70) a!2804 mask!2512) lt!657470))))

(declare-fun b!1516626 () Bool)

(declare-fun res!1036524 () Bool)

(assert (=> b!1516626 (=> (not res!1036524) (not e!846235))))

(declare-fun lt!657471 () SeekEntryResult!12935)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1516626 (= res!1036524 (= lt!657471 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48764 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48764 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101055 (store (arr!48764 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49314 a!2804)) mask!2512)))))

(declare-fun b!1516627 () Bool)

(assert (=> b!1516627 (= e!846236 e!846235)))

(declare-fun res!1036530 () Bool)

(assert (=> b!1516627 (=> (not res!1036530) (not e!846235))))

(assert (=> b!1516627 (= res!1036530 (= lt!657471 lt!657470))))

(assert (=> b!1516627 (= lt!657470 (Intermediate!12935 false resIndex!21 resX!21))))

(assert (=> b!1516627 (= lt!657471 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48764 a!2804) j!70) mask!2512) (select (arr!48764 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1516628 () Bool)

(declare-fun res!1036528 () Bool)

(assert (=> b!1516628 (=> (not res!1036528) (not e!846236))))

(assert (=> b!1516628 (= res!1036528 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1036529 () Bool)

(assert (=> start!129198 (=> (not res!1036529) (not e!846236))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129198 (= res!1036529 (validMask!0 mask!2512))))

(assert (=> start!129198 e!846236))

(assert (=> start!129198 true))

(declare-fun array_inv!37792 (array!101054) Bool)

(assert (=> start!129198 (array_inv!37792 a!2804)))

(declare-fun b!1516619 () Bool)

(assert (=> b!1516619 (= e!846233 e!846234)))

(declare-fun res!1036520 () Bool)

(assert (=> b!1516619 (=> res!1036520 e!846234)))

(assert (=> b!1516619 (= res!1036520 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!657468 #b00000000000000000000000000000000) (bvsge lt!657468 (size!49314 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1516619 (= lt!657468 (nextIndex!0 index!487 x!534 mask!2512))))

(assert (= (and start!129198 res!1036529) b!1516616))

(assert (= (and b!1516616 res!1036523) b!1516617))

(assert (= (and b!1516617 res!1036525) b!1516618))

(assert (= (and b!1516618 res!1036522) b!1516628))

(assert (= (and b!1516628 res!1036528) b!1516622))

(assert (= (and b!1516622 res!1036521) b!1516624))

(assert (= (and b!1516624 res!1036531) b!1516627))

(assert (= (and b!1516627 res!1036530) b!1516625))

(assert (= (and b!1516625 res!1036519) b!1516626))

(assert (= (and b!1516626 res!1036524) b!1516620))

(assert (= (and b!1516620 res!1036527) b!1516623))

(assert (= (and b!1516620 (not res!1036526)) b!1516619))

(assert (= (and b!1516619 (not res!1036520)) b!1516621))

(declare-fun m!1399885 () Bool)

(assert (=> b!1516619 m!1399885))

(declare-fun m!1399887 () Bool)

(assert (=> b!1516628 m!1399887))

(declare-fun m!1399889 () Bool)

(assert (=> b!1516621 m!1399889))

(assert (=> b!1516621 m!1399889))

(declare-fun m!1399891 () Bool)

(assert (=> b!1516621 m!1399891))

(assert (=> b!1516618 m!1399889))

(assert (=> b!1516618 m!1399889))

(declare-fun m!1399893 () Bool)

(assert (=> b!1516618 m!1399893))

(assert (=> b!1516627 m!1399889))

(assert (=> b!1516627 m!1399889))

(declare-fun m!1399895 () Bool)

(assert (=> b!1516627 m!1399895))

(assert (=> b!1516627 m!1399895))

(assert (=> b!1516627 m!1399889))

(declare-fun m!1399897 () Bool)

(assert (=> b!1516627 m!1399897))

(declare-fun m!1399899 () Bool)

(assert (=> b!1516626 m!1399899))

(declare-fun m!1399901 () Bool)

(assert (=> b!1516626 m!1399901))

(assert (=> b!1516626 m!1399901))

(declare-fun m!1399903 () Bool)

(assert (=> b!1516626 m!1399903))

(assert (=> b!1516626 m!1399903))

(assert (=> b!1516626 m!1399901))

(declare-fun m!1399905 () Bool)

(assert (=> b!1516626 m!1399905))

(declare-fun m!1399907 () Bool)

(assert (=> b!1516622 m!1399907))

(declare-fun m!1399909 () Bool)

(assert (=> start!129198 m!1399909))

(declare-fun m!1399911 () Bool)

(assert (=> start!129198 m!1399911))

(assert (=> b!1516620 m!1399889))

(declare-fun m!1399913 () Bool)

(assert (=> b!1516620 m!1399913))

(assert (=> b!1516620 m!1399899))

(assert (=> b!1516620 m!1399901))

(declare-fun m!1399915 () Bool)

(assert (=> b!1516620 m!1399915))

(assert (=> b!1516625 m!1399889))

(assert (=> b!1516625 m!1399889))

(declare-fun m!1399917 () Bool)

(assert (=> b!1516625 m!1399917))

(declare-fun m!1399919 () Bool)

(assert (=> b!1516617 m!1399919))

(assert (=> b!1516617 m!1399919))

(declare-fun m!1399921 () Bool)

(assert (=> b!1516617 m!1399921))

(assert (=> b!1516623 m!1399889))

(assert (=> b!1516623 m!1399889))

(declare-fun m!1399923 () Bool)

(assert (=> b!1516623 m!1399923))

(push 1)

