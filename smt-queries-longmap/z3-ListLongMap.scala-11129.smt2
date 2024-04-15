; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130020 () Bool)

(assert start!130020)

(declare-fun res!1044270 () Bool)

(declare-fun e!850593 () Bool)

(assert (=> start!130020 (=> (not res!1044270) (not e!850593))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130020 (= res!1044270 (validMask!0 mask!2512))))

(assert (=> start!130020 e!850593))

(assert (=> start!130020 true))

(declare-datatypes ((array!101431 0))(
  ( (array!101432 (arr!48943 (Array (_ BitVec 32) (_ BitVec 64))) (size!49495 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101431)

(declare-fun array_inv!38176 (array!101431) Bool)

(assert (=> start!130020 (array_inv!38176 a!2804)))

(declare-fun b!1526043 () Bool)

(declare-fun res!1044265 () Bool)

(assert (=> b!1526043 (=> (not res!1044265) (not e!850593))))

(declare-datatypes ((List!35504 0))(
  ( (Nil!35501) (Cons!35500 (h!36934 (_ BitVec 64)) (t!50190 List!35504)) )
))
(declare-fun arrayNoDuplicates!0 (array!101431 (_ BitVec 32) List!35504) Bool)

(assert (=> b!1526043 (= res!1044265 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35501))))

(declare-fun b!1526044 () Bool)

(declare-fun res!1044272 () Bool)

(declare-fun e!850592 () Bool)

(assert (=> b!1526044 (=> (not res!1044272) (not e!850592))))

(declare-datatypes ((SeekEntryResult!13131 0))(
  ( (MissingZero!13131 (index!54919 (_ BitVec 32))) (Found!13131 (index!54920 (_ BitVec 32))) (Intermediate!13131 (undefined!13943 Bool) (index!54921 (_ BitVec 32)) (x!136620 (_ BitVec 32))) (Undefined!13131) (MissingVacant!13131 (index!54922 (_ BitVec 32))) )
))
(declare-fun lt!660761 () SeekEntryResult!13131)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101431 (_ BitVec 32)) SeekEntryResult!13131)

(assert (=> b!1526044 (= res!1044272 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48943 a!2804) j!70) a!2804 mask!2512) lt!660761))))

(declare-fun b!1526045 () Bool)

(declare-fun e!850597 () Bool)

(assert (=> b!1526045 (= e!850592 e!850597)))

(declare-fun res!1044273 () Bool)

(assert (=> b!1526045 (=> (not res!1044273) (not e!850597))))

(declare-fun lt!660759 () (_ BitVec 64))

(declare-fun lt!660758 () array!101431)

(declare-fun lt!660762 () SeekEntryResult!13131)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1526045 (= res!1044273 (= lt!660762 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!660759 mask!2512) lt!660759 lt!660758 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1526045 (= lt!660759 (select (store (arr!48943 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1526045 (= lt!660758 (array!101432 (store (arr!48943 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49495 a!2804)))))

(declare-fun b!1526046 () Bool)

(declare-fun e!850591 () Bool)

(declare-fun e!850595 () Bool)

(assert (=> b!1526046 (= e!850591 e!850595)))

(declare-fun res!1044267 () Bool)

(assert (=> b!1526046 (=> (not res!1044267) (not e!850595))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101431 (_ BitVec 32)) SeekEntryResult!13131)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101431 (_ BitVec 32)) SeekEntryResult!13131)

(assert (=> b!1526046 (= res!1044267 (= (seekEntryOrOpen!0 (select (arr!48943 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48943 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1526047 () Bool)

(declare-fun res!1044271 () Bool)

(assert (=> b!1526047 (=> (not res!1044271) (not e!850593))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1526047 (= res!1044271 (validKeyInArray!0 (select (arr!48943 a!2804) j!70)))))

(declare-fun b!1526048 () Bool)

(assert (=> b!1526048 (= e!850595 (= (seekEntryOrOpen!0 lt!660759 lt!660758 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!660759 lt!660758 mask!2512)))))

(declare-fun b!1526049 () Bool)

(declare-fun res!1044262 () Bool)

(assert (=> b!1526049 (=> (not res!1044262) (not e!850593))))

(assert (=> b!1526049 (= res!1044262 (and (= (size!49495 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49495 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49495 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1526050 () Bool)

(declare-fun res!1044266 () Bool)

(declare-fun e!850596 () Bool)

(assert (=> b!1526050 (=> (not res!1044266) (not e!850596))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!101431 (_ BitVec 32)) SeekEntryResult!13131)

(assert (=> b!1526050 (= res!1044266 (= (seekEntry!0 (select (arr!48943 a!2804) j!70) a!2804 mask!2512) (Found!13131 j!70)))))

(declare-fun b!1526051 () Bool)

(assert (=> b!1526051 (= e!850596 e!850591)))

(declare-fun res!1044261 () Bool)

(assert (=> b!1526051 (=> res!1044261 e!850591)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1526051 (= res!1044261 (or (not (= (select (arr!48943 a!2804) j!70) lt!660759)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48943 a!2804) index!487) (select (arr!48943 a!2804) j!70)) (not (= (select (arr!48943 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1526052 () Bool)

(declare-fun res!1044274 () Bool)

(assert (=> b!1526052 (=> (not res!1044274) (not e!850593))))

(assert (=> b!1526052 (= res!1044274 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49495 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49495 a!2804))))))

(declare-fun b!1526053 () Bool)

(declare-fun res!1044268 () Bool)

(assert (=> b!1526053 (=> (not res!1044268) (not e!850593))))

(assert (=> b!1526053 (= res!1044268 (validKeyInArray!0 (select (arr!48943 a!2804) i!961)))))

(declare-fun b!1526054 () Bool)

(assert (=> b!1526054 (= e!850593 e!850592)))

(declare-fun res!1044269 () Bool)

(assert (=> b!1526054 (=> (not res!1044269) (not e!850592))))

(assert (=> b!1526054 (= res!1044269 (= lt!660762 lt!660761))))

(assert (=> b!1526054 (= lt!660761 (Intermediate!13131 false resIndex!21 resX!21))))

(assert (=> b!1526054 (= lt!660762 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48943 a!2804) j!70) mask!2512) (select (arr!48943 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1526055 () Bool)

(assert (=> b!1526055 (= e!850597 (not true))))

(assert (=> b!1526055 e!850596))

(declare-fun res!1044263 () Bool)

(assert (=> b!1526055 (=> (not res!1044263) (not e!850596))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101431 (_ BitVec 32)) Bool)

(assert (=> b!1526055 (= res!1044263 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50885 0))(
  ( (Unit!50886) )
))
(declare-fun lt!660760 () Unit!50885)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101431 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50885)

(assert (=> b!1526055 (= lt!660760 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1526056 () Bool)

(declare-fun res!1044264 () Bool)

(assert (=> b!1526056 (=> (not res!1044264) (not e!850593))))

(assert (=> b!1526056 (= res!1044264 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(assert (= (and start!130020 res!1044270) b!1526049))

(assert (= (and b!1526049 res!1044262) b!1526053))

(assert (= (and b!1526053 res!1044268) b!1526047))

(assert (= (and b!1526047 res!1044271) b!1526056))

(assert (= (and b!1526056 res!1044264) b!1526043))

(assert (= (and b!1526043 res!1044265) b!1526052))

(assert (= (and b!1526052 res!1044274) b!1526054))

(assert (= (and b!1526054 res!1044269) b!1526044))

(assert (= (and b!1526044 res!1044272) b!1526045))

(assert (= (and b!1526045 res!1044273) b!1526055))

(assert (= (and b!1526055 res!1044263) b!1526050))

(assert (= (and b!1526050 res!1044266) b!1526051))

(assert (= (and b!1526051 (not res!1044261)) b!1526046))

(assert (= (and b!1526046 res!1044267) b!1526048))

(declare-fun m!1408259 () Bool)

(assert (=> b!1526047 m!1408259))

(assert (=> b!1526047 m!1408259))

(declare-fun m!1408261 () Bool)

(assert (=> b!1526047 m!1408261))

(declare-fun m!1408263 () Bool)

(assert (=> start!130020 m!1408263))

(declare-fun m!1408265 () Bool)

(assert (=> start!130020 m!1408265))

(declare-fun m!1408267 () Bool)

(assert (=> b!1526056 m!1408267))

(declare-fun m!1408269 () Bool)

(assert (=> b!1526055 m!1408269))

(declare-fun m!1408271 () Bool)

(assert (=> b!1526055 m!1408271))

(assert (=> b!1526054 m!1408259))

(assert (=> b!1526054 m!1408259))

(declare-fun m!1408273 () Bool)

(assert (=> b!1526054 m!1408273))

(assert (=> b!1526054 m!1408273))

(assert (=> b!1526054 m!1408259))

(declare-fun m!1408275 () Bool)

(assert (=> b!1526054 m!1408275))

(declare-fun m!1408277 () Bool)

(assert (=> b!1526043 m!1408277))

(assert (=> b!1526046 m!1408259))

(assert (=> b!1526046 m!1408259))

(declare-fun m!1408279 () Bool)

(assert (=> b!1526046 m!1408279))

(assert (=> b!1526046 m!1408259))

(declare-fun m!1408281 () Bool)

(assert (=> b!1526046 m!1408281))

(assert (=> b!1526051 m!1408259))

(declare-fun m!1408283 () Bool)

(assert (=> b!1526051 m!1408283))

(declare-fun m!1408285 () Bool)

(assert (=> b!1526048 m!1408285))

(declare-fun m!1408287 () Bool)

(assert (=> b!1526048 m!1408287))

(assert (=> b!1526044 m!1408259))

(assert (=> b!1526044 m!1408259))

(declare-fun m!1408289 () Bool)

(assert (=> b!1526044 m!1408289))

(assert (=> b!1526050 m!1408259))

(assert (=> b!1526050 m!1408259))

(declare-fun m!1408291 () Bool)

(assert (=> b!1526050 m!1408291))

(declare-fun m!1408293 () Bool)

(assert (=> b!1526045 m!1408293))

(assert (=> b!1526045 m!1408293))

(declare-fun m!1408295 () Bool)

(assert (=> b!1526045 m!1408295))

(declare-fun m!1408297 () Bool)

(assert (=> b!1526045 m!1408297))

(declare-fun m!1408299 () Bool)

(assert (=> b!1526045 m!1408299))

(declare-fun m!1408301 () Bool)

(assert (=> b!1526053 m!1408301))

(assert (=> b!1526053 m!1408301))

(declare-fun m!1408303 () Bool)

(assert (=> b!1526053 m!1408303))

(check-sat (not b!1526044) (not b!1526050) (not b!1526055) (not b!1526048) (not b!1526056) (not b!1526045) (not b!1526043) (not start!130020) (not b!1526046) (not b!1526053) (not b!1526054) (not b!1526047))
(check-sat)
