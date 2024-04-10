; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130264 () Bool)

(assert start!130264)

(declare-fun b!1529316 () Bool)

(declare-fun res!1047031 () Bool)

(declare-fun e!852281 () Bool)

(assert (=> b!1529316 (=> (not res!1047031) (not e!852281))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!101614 0))(
  ( (array!101615 (arr!49032 (Array (_ BitVec 32) (_ BitVec 64))) (size!49582 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101614)

(declare-datatypes ((SeekEntryResult!13197 0))(
  ( (MissingZero!13197 (index!55183 (_ BitVec 32))) (Found!13197 (index!55184 (_ BitVec 32))) (Intermediate!13197 (undefined!14009 Bool) (index!55185 (_ BitVec 32)) (x!136868 (_ BitVec 32))) (Undefined!13197) (MissingVacant!13197 (index!55186 (_ BitVec 32))) )
))
(declare-fun lt!662394 () SeekEntryResult!13197)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101614 (_ BitVec 32)) SeekEntryResult!13197)

(assert (=> b!1529316 (= res!1047031 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49032 a!2804) j!70) a!2804 mask!2512) lt!662394))))

(declare-fun b!1529317 () Bool)

(declare-fun res!1047032 () Bool)

(declare-fun e!852283 () Bool)

(assert (=> b!1529317 (=> (not res!1047032) (not e!852283))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101614 (_ BitVec 32)) Bool)

(assert (=> b!1529317 (= res!1047032 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1529318 () Bool)

(declare-fun res!1047027 () Bool)

(assert (=> b!1529318 (=> (not res!1047027) (not e!852281))))

(declare-fun lt!662393 () SeekEntryResult!13197)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1529318 (= res!1047027 (= lt!662393 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49032 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49032 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101615 (store (arr!49032 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49582 a!2804)) mask!2512)))))

(declare-fun res!1047024 () Bool)

(assert (=> start!130264 (=> (not res!1047024) (not e!852283))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130264 (= res!1047024 (validMask!0 mask!2512))))

(assert (=> start!130264 e!852283))

(assert (=> start!130264 true))

(declare-fun array_inv!38060 (array!101614) Bool)

(assert (=> start!130264 (array_inv!38060 a!2804)))

(declare-fun b!1529319 () Bool)

(declare-fun res!1047030 () Bool)

(assert (=> b!1529319 (=> (not res!1047030) (not e!852283))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1529319 (= res!1047030 (validKeyInArray!0 (select (arr!49032 a!2804) i!961)))))

(declare-fun e!852282 () Bool)

(declare-fun b!1529320 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101614 (_ BitVec 32)) SeekEntryResult!13197)

(assert (=> b!1529320 (= e!852282 (= (seekEntry!0 (select (arr!49032 a!2804) j!70) a!2804 mask!2512) (Found!13197 j!70)))))

(declare-fun b!1529321 () Bool)

(declare-fun e!852279 () Bool)

(assert (=> b!1529321 (= e!852281 (not e!852279))))

(declare-fun res!1047023 () Bool)

(assert (=> b!1529321 (=> res!1047023 e!852279)))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1529321 (= res!1047023 (or (not (= (select (arr!49032 a!2804) j!70) (select (store (arr!49032 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(assert (=> b!1529321 e!852282))

(declare-fun res!1047028 () Bool)

(assert (=> b!1529321 (=> (not res!1047028) (not e!852282))))

(assert (=> b!1529321 (= res!1047028 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51178 0))(
  ( (Unit!51179) )
))
(declare-fun lt!662395 () Unit!51178)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101614 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51178)

(assert (=> b!1529321 (= lt!662395 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1529322 () Bool)

(declare-fun res!1047026 () Bool)

(assert (=> b!1529322 (=> (not res!1047026) (not e!852283))))

(declare-datatypes ((List!35515 0))(
  ( (Nil!35512) (Cons!35511 (h!36947 (_ BitVec 64)) (t!50209 List!35515)) )
))
(declare-fun arrayNoDuplicates!0 (array!101614 (_ BitVec 32) List!35515) Bool)

(assert (=> b!1529322 (= res!1047026 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35512))))

(declare-fun b!1529323 () Bool)

(assert (=> b!1529323 (= e!852283 e!852281)))

(declare-fun res!1047034 () Bool)

(assert (=> b!1529323 (=> (not res!1047034) (not e!852281))))

(assert (=> b!1529323 (= res!1047034 (= lt!662393 lt!662394))))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1529323 (= lt!662394 (Intermediate!13197 false resIndex!21 resX!21))))

(assert (=> b!1529323 (= lt!662393 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49032 a!2804) j!70) mask!2512) (select (arr!49032 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1529324 () Bool)

(declare-fun res!1047033 () Bool)

(assert (=> b!1529324 (=> (not res!1047033) (not e!852283))))

(assert (=> b!1529324 (= res!1047033 (and (= (size!49582 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49582 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49582 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1529325 () Bool)

(declare-fun res!1047025 () Bool)

(assert (=> b!1529325 (=> (not res!1047025) (not e!852283))))

(assert (=> b!1529325 (= res!1047025 (validKeyInArray!0 (select (arr!49032 a!2804) j!70)))))

(declare-fun b!1529326 () Bool)

(assert (=> b!1529326 (= e!852279 true)))

(declare-fun lt!662392 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1529326 (= lt!662392 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1529327 () Bool)

(declare-fun res!1047029 () Bool)

(assert (=> b!1529327 (=> (not res!1047029) (not e!852283))))

(assert (=> b!1529327 (= res!1047029 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49582 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49582 a!2804))))))

(assert (= (and start!130264 res!1047024) b!1529324))

(assert (= (and b!1529324 res!1047033) b!1529319))

(assert (= (and b!1529319 res!1047030) b!1529325))

(assert (= (and b!1529325 res!1047025) b!1529317))

(assert (= (and b!1529317 res!1047032) b!1529322))

(assert (= (and b!1529322 res!1047026) b!1529327))

(assert (= (and b!1529327 res!1047029) b!1529323))

(assert (= (and b!1529323 res!1047034) b!1529316))

(assert (= (and b!1529316 res!1047031) b!1529318))

(assert (= (and b!1529318 res!1047027) b!1529321))

(assert (= (and b!1529321 res!1047028) b!1529320))

(assert (= (and b!1529321 (not res!1047023)) b!1529326))

(declare-fun m!1412255 () Bool)

(assert (=> b!1529321 m!1412255))

(declare-fun m!1412257 () Bool)

(assert (=> b!1529321 m!1412257))

(declare-fun m!1412259 () Bool)

(assert (=> b!1529321 m!1412259))

(declare-fun m!1412261 () Bool)

(assert (=> b!1529321 m!1412261))

(declare-fun m!1412263 () Bool)

(assert (=> b!1529321 m!1412263))

(assert (=> b!1529316 m!1412255))

(assert (=> b!1529316 m!1412255))

(declare-fun m!1412265 () Bool)

(assert (=> b!1529316 m!1412265))

(assert (=> b!1529320 m!1412255))

(assert (=> b!1529320 m!1412255))

(declare-fun m!1412267 () Bool)

(assert (=> b!1529320 m!1412267))

(assert (=> b!1529323 m!1412255))

(assert (=> b!1529323 m!1412255))

(declare-fun m!1412269 () Bool)

(assert (=> b!1529323 m!1412269))

(assert (=> b!1529323 m!1412269))

(assert (=> b!1529323 m!1412255))

(declare-fun m!1412271 () Bool)

(assert (=> b!1529323 m!1412271))

(declare-fun m!1412273 () Bool)

(assert (=> b!1529319 m!1412273))

(assert (=> b!1529319 m!1412273))

(declare-fun m!1412275 () Bool)

(assert (=> b!1529319 m!1412275))

(declare-fun m!1412277 () Bool)

(assert (=> b!1529322 m!1412277))

(declare-fun m!1412279 () Bool)

(assert (=> b!1529317 m!1412279))

(declare-fun m!1412281 () Bool)

(assert (=> start!130264 m!1412281))

(declare-fun m!1412283 () Bool)

(assert (=> start!130264 m!1412283))

(assert (=> b!1529325 m!1412255))

(assert (=> b!1529325 m!1412255))

(declare-fun m!1412285 () Bool)

(assert (=> b!1529325 m!1412285))

(assert (=> b!1529318 m!1412259))

(assert (=> b!1529318 m!1412261))

(assert (=> b!1529318 m!1412261))

(declare-fun m!1412287 () Bool)

(assert (=> b!1529318 m!1412287))

(assert (=> b!1529318 m!1412287))

(assert (=> b!1529318 m!1412261))

(declare-fun m!1412289 () Bool)

(assert (=> b!1529318 m!1412289))

(declare-fun m!1412291 () Bool)

(assert (=> b!1529326 m!1412291))

(check-sat (not b!1529318) (not b!1529317) (not b!1529316) (not b!1529321) (not b!1529322) (not b!1529326) (not b!1529323) (not b!1529319) (not b!1529325) (not b!1529320) (not start!130264))
(check-sat)
