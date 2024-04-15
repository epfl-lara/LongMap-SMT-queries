; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129158 () Bool)

(assert start!129158)

(declare-fun b!1516510 () Bool)

(declare-fun res!1036620 () Bool)

(declare-fun e!846128 () Bool)

(assert (=> b!1516510 (=> (not res!1036620) (not e!846128))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!101014 0))(
  ( (array!101015 (arr!48745 (Array (_ BitVec 32) (_ BitVec 64))) (size!49297 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101014)

(declare-datatypes ((SeekEntryResult!12939 0))(
  ( (MissingZero!12939 (index!54151 (_ BitVec 32))) (Found!12939 (index!54152 (_ BitVec 32))) (Intermediate!12939 (undefined!13751 Bool) (index!54153 (_ BitVec 32)) (x!135843 (_ BitVec 32))) (Undefined!12939) (MissingVacant!12939 (index!54154 (_ BitVec 32))) )
))
(declare-fun lt!657263 () SeekEntryResult!12939)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101014 (_ BitVec 32)) SeekEntryResult!12939)

(assert (=> b!1516510 (= res!1036620 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48745 a!2804) j!70) a!2804 mask!2512) lt!657263))))

(declare-fun b!1516511 () Bool)

(declare-fun e!846130 () Bool)

(assert (=> b!1516511 (= e!846128 (not e!846130))))

(declare-fun res!1036623 () Bool)

(assert (=> b!1516511 (=> res!1036623 e!846130)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1516511 (= res!1036623 (or (not (= (select (arr!48745 a!2804) j!70) (select (store (arr!48745 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!846131 () Bool)

(assert (=> b!1516511 e!846131))

(declare-fun res!1036626 () Bool)

(assert (=> b!1516511 (=> (not res!1036626) (not e!846131))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101014 (_ BitVec 32)) Bool)

(assert (=> b!1516511 (= res!1036626 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50585 0))(
  ( (Unit!50586) )
))
(declare-fun lt!657266 () Unit!50585)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101014 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50585)

(assert (=> b!1516511 (= lt!657266 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1516512 () Bool)

(declare-fun res!1036624 () Bool)

(assert (=> b!1516512 (=> (not res!1036624) (not e!846128))))

(declare-fun lt!657265 () SeekEntryResult!12939)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1516512 (= res!1036624 (= lt!657265 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48745 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48745 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101015 (store (arr!48745 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49297 a!2804)) mask!2512)))))

(declare-fun b!1516513 () Bool)

(declare-fun e!846127 () Bool)

(assert (=> b!1516513 (= e!846127 e!846128)))

(declare-fun res!1036622 () Bool)

(assert (=> b!1516513 (=> (not res!1036622) (not e!846128))))

(assert (=> b!1516513 (= res!1036622 (= lt!657265 lt!657263))))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1516513 (= lt!657263 (Intermediate!12939 false resIndex!21 resX!21))))

(assert (=> b!1516513 (= lt!657265 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48745 a!2804) j!70) mask!2512) (select (arr!48745 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1516514 () Bool)

(declare-fun res!1036619 () Bool)

(assert (=> b!1516514 (=> (not res!1036619) (not e!846127))))

(assert (=> b!1516514 (= res!1036619 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49297 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49297 a!2804))))))

(declare-fun b!1516515 () Bool)

(declare-fun res!1036628 () Bool)

(assert (=> b!1516515 (=> (not res!1036628) (not e!846127))))

(declare-datatypes ((List!35306 0))(
  ( (Nil!35303) (Cons!35302 (h!36715 (_ BitVec 64)) (t!49992 List!35306)) )
))
(declare-fun arrayNoDuplicates!0 (array!101014 (_ BitVec 32) List!35306) Bool)

(assert (=> b!1516515 (= res!1036628 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35303))))

(declare-fun b!1516516 () Bool)

(declare-fun res!1036625 () Bool)

(assert (=> b!1516516 (=> (not res!1036625) (not e!846127))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1516516 (= res!1036625 (validKeyInArray!0 (select (arr!48745 a!2804) i!961)))))

(declare-fun b!1516517 () Bool)

(declare-fun e!846129 () Bool)

(assert (=> b!1516517 (= e!846130 e!846129)))

(declare-fun res!1036631 () Bool)

(assert (=> b!1516517 (=> res!1036631 e!846129)))

(declare-fun lt!657267 () (_ BitVec 32))

(assert (=> b!1516517 (= res!1036631 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!657267 #b00000000000000000000000000000000) (bvsge lt!657267 (size!49297 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1516517 (= lt!657267 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1516518 () Bool)

(declare-fun res!1036621 () Bool)

(assert (=> b!1516518 (=> (not res!1036621) (not e!846127))))

(assert (=> b!1516518 (= res!1036621 (validKeyInArray!0 (select (arr!48745 a!2804) j!70)))))

(declare-fun b!1516520 () Bool)

(assert (=> b!1516520 (= e!846129 true)))

(declare-fun lt!657264 () SeekEntryResult!12939)

(assert (=> b!1516520 (= lt!657264 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!657267 (select (arr!48745 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1516521 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101014 (_ BitVec 32)) SeekEntryResult!12939)

(assert (=> b!1516521 (= e!846131 (= (seekEntry!0 (select (arr!48745 a!2804) j!70) a!2804 mask!2512) (Found!12939 j!70)))))

(declare-fun b!1516522 () Bool)

(declare-fun res!1036627 () Bool)

(assert (=> b!1516522 (=> (not res!1036627) (not e!846127))))

(assert (=> b!1516522 (= res!1036627 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1036630 () Bool)

(assert (=> start!129158 (=> (not res!1036630) (not e!846127))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129158 (= res!1036630 (validMask!0 mask!2512))))

(assert (=> start!129158 e!846127))

(assert (=> start!129158 true))

(declare-fun array_inv!37978 (array!101014) Bool)

(assert (=> start!129158 (array_inv!37978 a!2804)))

(declare-fun b!1516519 () Bool)

(declare-fun res!1036629 () Bool)

(assert (=> b!1516519 (=> (not res!1036629) (not e!846127))))

(assert (=> b!1516519 (= res!1036629 (and (= (size!49297 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49297 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49297 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!129158 res!1036630) b!1516519))

(assert (= (and b!1516519 res!1036629) b!1516516))

(assert (= (and b!1516516 res!1036625) b!1516518))

(assert (= (and b!1516518 res!1036621) b!1516522))

(assert (= (and b!1516522 res!1036627) b!1516515))

(assert (= (and b!1516515 res!1036628) b!1516514))

(assert (= (and b!1516514 res!1036619) b!1516513))

(assert (= (and b!1516513 res!1036622) b!1516510))

(assert (= (and b!1516510 res!1036620) b!1516512))

(assert (= (and b!1516512 res!1036624) b!1516511))

(assert (= (and b!1516511 res!1036626) b!1516521))

(assert (= (and b!1516511 (not res!1036623)) b!1516517))

(assert (= (and b!1516517 (not res!1036631)) b!1516520))

(declare-fun m!1399217 () Bool)

(assert (=> start!129158 m!1399217))

(declare-fun m!1399219 () Bool)

(assert (=> start!129158 m!1399219))

(declare-fun m!1399221 () Bool)

(assert (=> b!1516520 m!1399221))

(assert (=> b!1516520 m!1399221))

(declare-fun m!1399223 () Bool)

(assert (=> b!1516520 m!1399223))

(assert (=> b!1516513 m!1399221))

(assert (=> b!1516513 m!1399221))

(declare-fun m!1399225 () Bool)

(assert (=> b!1516513 m!1399225))

(assert (=> b!1516513 m!1399225))

(assert (=> b!1516513 m!1399221))

(declare-fun m!1399227 () Bool)

(assert (=> b!1516513 m!1399227))

(declare-fun m!1399229 () Bool)

(assert (=> b!1516522 m!1399229))

(declare-fun m!1399231 () Bool)

(assert (=> b!1516516 m!1399231))

(assert (=> b!1516516 m!1399231))

(declare-fun m!1399233 () Bool)

(assert (=> b!1516516 m!1399233))

(assert (=> b!1516518 m!1399221))

(assert (=> b!1516518 m!1399221))

(declare-fun m!1399235 () Bool)

(assert (=> b!1516518 m!1399235))

(assert (=> b!1516521 m!1399221))

(assert (=> b!1516521 m!1399221))

(declare-fun m!1399237 () Bool)

(assert (=> b!1516521 m!1399237))

(assert (=> b!1516511 m!1399221))

(declare-fun m!1399239 () Bool)

(assert (=> b!1516511 m!1399239))

(declare-fun m!1399241 () Bool)

(assert (=> b!1516511 m!1399241))

(declare-fun m!1399243 () Bool)

(assert (=> b!1516511 m!1399243))

(declare-fun m!1399245 () Bool)

(assert (=> b!1516511 m!1399245))

(declare-fun m!1399247 () Bool)

(assert (=> b!1516515 m!1399247))

(assert (=> b!1516510 m!1399221))

(assert (=> b!1516510 m!1399221))

(declare-fun m!1399249 () Bool)

(assert (=> b!1516510 m!1399249))

(declare-fun m!1399251 () Bool)

(assert (=> b!1516517 m!1399251))

(assert (=> b!1516512 m!1399241))

(assert (=> b!1516512 m!1399243))

(assert (=> b!1516512 m!1399243))

(declare-fun m!1399253 () Bool)

(assert (=> b!1516512 m!1399253))

(assert (=> b!1516512 m!1399253))

(assert (=> b!1516512 m!1399243))

(declare-fun m!1399255 () Bool)

(assert (=> b!1516512 m!1399255))

(check-sat (not b!1516511) (not b!1516512) (not start!129158) (not b!1516510) (not b!1516522) (not b!1516521) (not b!1516516) (not b!1516513) (not b!1516515) (not b!1516518) (not b!1516517) (not b!1516520))
(check-sat)
