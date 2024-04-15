; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129200 () Bool)

(assert start!129200)

(declare-fun b!1517329 () Bool)

(declare-fun res!1037440 () Bool)

(declare-fun e!846506 () Bool)

(assert (=> b!1517329 (=> (not res!1037440) (not e!846506))))

(declare-datatypes ((array!101056 0))(
  ( (array!101057 (arr!48766 (Array (_ BitVec 32) (_ BitVec 64))) (size!49318 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101056)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1517329 (= res!1037440 (validKeyInArray!0 (select (arr!48766 a!2804) i!961)))))

(declare-fun b!1517330 () Bool)

(declare-fun res!1037442 () Bool)

(assert (=> b!1517330 (=> (not res!1037442) (not e!846506))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101056 (_ BitVec 32)) Bool)

(assert (=> b!1517330 (= res!1037442 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1517331 () Bool)

(declare-fun res!1037446 () Bool)

(assert (=> b!1517331 (=> (not res!1037446) (not e!846506))))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1517331 (= res!1037446 (validKeyInArray!0 (select (arr!48766 a!2804) j!70)))))

(declare-fun b!1517332 () Bool)

(declare-fun e!846509 () Bool)

(declare-fun e!846507 () Bool)

(assert (=> b!1517332 (= e!846509 e!846507)))

(declare-fun res!1037438 () Bool)

(assert (=> b!1517332 (=> res!1037438 e!846507)))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun lt!657581 () (_ BitVec 32))

(assert (=> b!1517332 (= res!1037438 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!657581 #b00000000000000000000000000000000) (bvsge lt!657581 (size!49318 a!2804))))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1517332 (= lt!657581 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1517333 () Bool)

(declare-fun res!1037444 () Bool)

(assert (=> b!1517333 (=> (not res!1037444) (not e!846506))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1517333 (= res!1037444 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49318 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49318 a!2804))))))

(declare-fun b!1517334 () Bool)

(declare-fun res!1037445 () Bool)

(declare-fun e!846505 () Bool)

(assert (=> b!1517334 (=> (not res!1037445) (not e!846505))))

(declare-datatypes ((SeekEntryResult!12960 0))(
  ( (MissingZero!12960 (index!54235 (_ BitVec 32))) (Found!12960 (index!54236 (_ BitVec 32))) (Intermediate!12960 (undefined!13772 Bool) (index!54237 (_ BitVec 32)) (x!135920 (_ BitVec 32))) (Undefined!12960) (MissingVacant!12960 (index!54238 (_ BitVec 32))) )
))
(declare-fun lt!657578 () SeekEntryResult!12960)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101056 (_ BitVec 32)) SeekEntryResult!12960)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1517334 (= res!1037445 (= lt!657578 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48766 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48766 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101057 (store (arr!48766 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49318 a!2804)) mask!2512)))))

(declare-fun b!1517335 () Bool)

(assert (=> b!1517335 (= e!846507 true)))

(declare-fun lt!657582 () SeekEntryResult!12960)

(assert (=> b!1517335 (= lt!657582 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!657581 (select (arr!48766 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1517336 () Bool)

(declare-fun res!1037441 () Bool)

(assert (=> b!1517336 (=> (not res!1037441) (not e!846506))))

(assert (=> b!1517336 (= res!1037441 (and (= (size!49318 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49318 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49318 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1517337 () Bool)

(assert (=> b!1517337 (= e!846506 e!846505)))

(declare-fun res!1037448 () Bool)

(assert (=> b!1517337 (=> (not res!1037448) (not e!846505))))

(declare-fun lt!657579 () SeekEntryResult!12960)

(assert (=> b!1517337 (= res!1037448 (= lt!657578 lt!657579))))

(assert (=> b!1517337 (= lt!657579 (Intermediate!12960 false resIndex!21 resX!21))))

(assert (=> b!1517337 (= lt!657578 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48766 a!2804) j!70) mask!2512) (select (arr!48766 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1517338 () Bool)

(declare-fun res!1037443 () Bool)

(assert (=> b!1517338 (=> (not res!1037443) (not e!846505))))

(assert (=> b!1517338 (= res!1037443 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48766 a!2804) j!70) a!2804 mask!2512) lt!657579))))

(declare-fun b!1517339 () Bool)

(declare-fun e!846508 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101056 (_ BitVec 32)) SeekEntryResult!12960)

(assert (=> b!1517339 (= e!846508 (= (seekEntry!0 (select (arr!48766 a!2804) j!70) a!2804 mask!2512) (Found!12960 j!70)))))

(declare-fun b!1517340 () Bool)

(declare-fun res!1037447 () Bool)

(assert (=> b!1517340 (=> (not res!1037447) (not e!846506))))

(declare-datatypes ((List!35327 0))(
  ( (Nil!35324) (Cons!35323 (h!36736 (_ BitVec 64)) (t!50013 List!35327)) )
))
(declare-fun arrayNoDuplicates!0 (array!101056 (_ BitVec 32) List!35327) Bool)

(assert (=> b!1517340 (= res!1037447 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35324))))

(declare-fun b!1517341 () Bool)

(assert (=> b!1517341 (= e!846505 (not e!846509))))

(declare-fun res!1037439 () Bool)

(assert (=> b!1517341 (=> res!1037439 e!846509)))

(assert (=> b!1517341 (= res!1037439 (or (not (= (select (arr!48766 a!2804) j!70) (select (store (arr!48766 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(assert (=> b!1517341 e!846508))

(declare-fun res!1037449 () Bool)

(assert (=> b!1517341 (=> (not res!1037449) (not e!846508))))

(assert (=> b!1517341 (= res!1037449 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50627 0))(
  ( (Unit!50628) )
))
(declare-fun lt!657580 () Unit!50627)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101056 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50627)

(assert (=> b!1517341 (= lt!657580 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun res!1037450 () Bool)

(assert (=> start!129200 (=> (not res!1037450) (not e!846506))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129200 (= res!1037450 (validMask!0 mask!2512))))

(assert (=> start!129200 e!846506))

(assert (=> start!129200 true))

(declare-fun array_inv!37999 (array!101056) Bool)

(assert (=> start!129200 (array_inv!37999 a!2804)))

(assert (= (and start!129200 res!1037450) b!1517336))

(assert (= (and b!1517336 res!1037441) b!1517329))

(assert (= (and b!1517329 res!1037440) b!1517331))

(assert (= (and b!1517331 res!1037446) b!1517330))

(assert (= (and b!1517330 res!1037442) b!1517340))

(assert (= (and b!1517340 res!1037447) b!1517333))

(assert (= (and b!1517333 res!1037444) b!1517337))

(assert (= (and b!1517337 res!1037448) b!1517338))

(assert (= (and b!1517338 res!1037443) b!1517334))

(assert (= (and b!1517334 res!1037445) b!1517341))

(assert (= (and b!1517341 res!1037449) b!1517339))

(assert (= (and b!1517341 (not res!1037439)) b!1517332))

(assert (= (and b!1517332 (not res!1037438)) b!1517335))

(declare-fun m!1400057 () Bool)

(assert (=> start!129200 m!1400057))

(declare-fun m!1400059 () Bool)

(assert (=> start!129200 m!1400059))

(declare-fun m!1400061 () Bool)

(assert (=> b!1517334 m!1400061))

(declare-fun m!1400063 () Bool)

(assert (=> b!1517334 m!1400063))

(assert (=> b!1517334 m!1400063))

(declare-fun m!1400065 () Bool)

(assert (=> b!1517334 m!1400065))

(assert (=> b!1517334 m!1400065))

(assert (=> b!1517334 m!1400063))

(declare-fun m!1400067 () Bool)

(assert (=> b!1517334 m!1400067))

(declare-fun m!1400069 () Bool)

(assert (=> b!1517335 m!1400069))

(assert (=> b!1517335 m!1400069))

(declare-fun m!1400071 () Bool)

(assert (=> b!1517335 m!1400071))

(assert (=> b!1517338 m!1400069))

(assert (=> b!1517338 m!1400069))

(declare-fun m!1400073 () Bool)

(assert (=> b!1517338 m!1400073))

(declare-fun m!1400075 () Bool)

(assert (=> b!1517332 m!1400075))

(assert (=> b!1517341 m!1400069))

(declare-fun m!1400077 () Bool)

(assert (=> b!1517341 m!1400077))

(assert (=> b!1517341 m!1400061))

(assert (=> b!1517341 m!1400063))

(declare-fun m!1400079 () Bool)

(assert (=> b!1517341 m!1400079))

(declare-fun m!1400081 () Bool)

(assert (=> b!1517330 m!1400081))

(assert (=> b!1517331 m!1400069))

(assert (=> b!1517331 m!1400069))

(declare-fun m!1400083 () Bool)

(assert (=> b!1517331 m!1400083))

(assert (=> b!1517339 m!1400069))

(assert (=> b!1517339 m!1400069))

(declare-fun m!1400085 () Bool)

(assert (=> b!1517339 m!1400085))

(declare-fun m!1400087 () Bool)

(assert (=> b!1517340 m!1400087))

(assert (=> b!1517337 m!1400069))

(assert (=> b!1517337 m!1400069))

(declare-fun m!1400089 () Bool)

(assert (=> b!1517337 m!1400089))

(assert (=> b!1517337 m!1400089))

(assert (=> b!1517337 m!1400069))

(declare-fun m!1400091 () Bool)

(assert (=> b!1517337 m!1400091))

(declare-fun m!1400093 () Bool)

(assert (=> b!1517329 m!1400093))

(assert (=> b!1517329 m!1400093))

(declare-fun m!1400095 () Bool)

(assert (=> b!1517329 m!1400095))

(check-sat (not b!1517332) (not b!1517335) (not b!1517339) (not b!1517341) (not b!1517331) (not b!1517340) (not b!1517338) (not start!129200) (not b!1517334) (not b!1517330) (not b!1517329) (not b!1517337))
(check-sat)
