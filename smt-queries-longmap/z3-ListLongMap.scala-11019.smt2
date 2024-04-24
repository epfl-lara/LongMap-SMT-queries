; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129248 () Bool)

(assert start!129248)

(declare-fun e!845021 () Bool)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100918 0))(
  ( (array!100919 (arr!48691 (Array (_ BitVec 32) (_ BitVec 64))) (size!49242 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100918)

(declare-fun b!1513435 () Bool)

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12755 0))(
  ( (MissingZero!12755 (index!53415 (_ BitVec 32))) (Found!12755 (index!53416 (_ BitVec 32))) (Intermediate!12755 (undefined!13567 Bool) (index!53417 (_ BitVec 32)) (x!135350 (_ BitVec 32))) (Undefined!12755) (MissingVacant!12755 (index!53418 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100918 (_ BitVec 32)) SeekEntryResult!12755)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100918 (_ BitVec 32)) SeekEntryResult!12755)

(assert (=> b!1513435 (= e!845021 (= (seekEntryOrOpen!0 (select (arr!48691 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48691 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1513436 () Bool)

(declare-fun res!1032161 () Bool)

(declare-fun e!845022 () Bool)

(assert (=> b!1513436 (=> (not res!1032161) (not e!845022))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1513436 (= res!1032161 (validKeyInArray!0 (select (arr!48691 a!2804) i!961)))))

(declare-fun res!1032173 () Bool)

(assert (=> start!129248 (=> (not res!1032173) (not e!845022))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129248 (= res!1032173 (validMask!0 mask!2512))))

(assert (=> start!129248 e!845022))

(assert (=> start!129248 true))

(declare-fun array_inv!37972 (array!100918) Bool)

(assert (=> start!129248 (array_inv!37972 a!2804)))

(declare-fun b!1513437 () Bool)

(declare-fun res!1032169 () Bool)

(declare-fun e!845020 () Bool)

(assert (=> b!1513437 (=> (not res!1032169) (not e!845020))))

(declare-fun lt!656149 () SeekEntryResult!12755)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100918 (_ BitVec 32)) SeekEntryResult!12755)

(assert (=> b!1513437 (= res!1032169 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48691 a!2804) j!70) a!2804 mask!2512) lt!656149))))

(declare-fun b!1513438 () Bool)

(declare-fun res!1032165 () Bool)

(declare-fun e!845018 () Bool)

(assert (=> b!1513438 (=> (not res!1032165) (not e!845018))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100918 (_ BitVec 32)) SeekEntryResult!12755)

(assert (=> b!1513438 (= res!1032165 (= (seekEntry!0 (select (arr!48691 a!2804) j!70) a!2804 mask!2512) (Found!12755 j!70)))))

(declare-fun b!1513439 () Bool)

(assert (=> b!1513439 (= e!845018 e!845021)))

(declare-fun res!1032167 () Bool)

(assert (=> b!1513439 (=> res!1032167 e!845021)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1513439 (= res!1032167 (or (not (= (select (arr!48691 a!2804) j!70) (select (store (arr!48691 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48691 a!2804) index!487) (select (arr!48691 a!2804) j!70)) (not (= (select (arr!48691 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1513440 () Bool)

(assert (=> b!1513440 (= e!845022 e!845020)))

(declare-fun res!1032172 () Bool)

(assert (=> b!1513440 (=> (not res!1032172) (not e!845020))))

(declare-fun lt!656147 () SeekEntryResult!12755)

(assert (=> b!1513440 (= res!1032172 (= lt!656147 lt!656149))))

(assert (=> b!1513440 (= lt!656149 (Intermediate!12755 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1513440 (= lt!656147 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48691 a!2804) j!70) mask!2512) (select (arr!48691 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1513441 () Bool)

(declare-fun res!1032166 () Bool)

(assert (=> b!1513441 (=> (not res!1032166) (not e!845022))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100918 (_ BitVec 32)) Bool)

(assert (=> b!1513441 (= res!1032166 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1513442 () Bool)

(declare-fun res!1032171 () Bool)

(assert (=> b!1513442 (=> (not res!1032171) (not e!845022))))

(assert (=> b!1513442 (= res!1032171 (validKeyInArray!0 (select (arr!48691 a!2804) j!70)))))

(declare-fun b!1513443 () Bool)

(declare-fun res!1032163 () Bool)

(assert (=> b!1513443 (=> (not res!1032163) (not e!845020))))

(assert (=> b!1513443 (= res!1032163 (= lt!656147 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48691 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48691 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100919 (store (arr!48691 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49242 a!2804)) mask!2512)))))

(declare-fun b!1513444 () Bool)

(declare-fun res!1032162 () Bool)

(assert (=> b!1513444 (=> (not res!1032162) (not e!845022))))

(declare-datatypes ((List!35161 0))(
  ( (Nil!35158) (Cons!35157 (h!36584 (_ BitVec 64)) (t!49847 List!35161)) )
))
(declare-fun arrayNoDuplicates!0 (array!100918 (_ BitVec 32) List!35161) Bool)

(assert (=> b!1513444 (= res!1032162 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35158))))

(declare-fun b!1513445 () Bool)

(declare-fun res!1032168 () Bool)

(assert (=> b!1513445 (=> (not res!1032168) (not e!845022))))

(assert (=> b!1513445 (= res!1032168 (and (= (size!49242 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49242 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49242 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1513446 () Bool)

(declare-fun res!1032170 () Bool)

(assert (=> b!1513446 (=> (not res!1032170) (not e!845022))))

(assert (=> b!1513446 (= res!1032170 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49242 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49242 a!2804))))))

(declare-fun b!1513447 () Bool)

(assert (=> b!1513447 (= e!845020 (not true))))

(assert (=> b!1513447 e!845018))

(declare-fun res!1032164 () Bool)

(assert (=> b!1513447 (=> (not res!1032164) (not e!845018))))

(assert (=> b!1513447 (= res!1032164 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50413 0))(
  ( (Unit!50414) )
))
(declare-fun lt!656148 () Unit!50413)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100918 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50413)

(assert (=> b!1513447 (= lt!656148 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (= (and start!129248 res!1032173) b!1513445))

(assert (= (and b!1513445 res!1032168) b!1513436))

(assert (= (and b!1513436 res!1032161) b!1513442))

(assert (= (and b!1513442 res!1032171) b!1513441))

(assert (= (and b!1513441 res!1032166) b!1513444))

(assert (= (and b!1513444 res!1032162) b!1513446))

(assert (= (and b!1513446 res!1032170) b!1513440))

(assert (= (and b!1513440 res!1032172) b!1513437))

(assert (= (and b!1513437 res!1032169) b!1513443))

(assert (= (and b!1513443 res!1032163) b!1513447))

(assert (= (and b!1513447 res!1032164) b!1513438))

(assert (= (and b!1513438 res!1032165) b!1513439))

(assert (= (and b!1513439 (not res!1032167)) b!1513435))

(declare-fun m!1396107 () Bool)

(assert (=> b!1513443 m!1396107))

(declare-fun m!1396109 () Bool)

(assert (=> b!1513443 m!1396109))

(assert (=> b!1513443 m!1396109))

(declare-fun m!1396111 () Bool)

(assert (=> b!1513443 m!1396111))

(assert (=> b!1513443 m!1396111))

(assert (=> b!1513443 m!1396109))

(declare-fun m!1396113 () Bool)

(assert (=> b!1513443 m!1396113))

(declare-fun m!1396115 () Bool)

(assert (=> b!1513435 m!1396115))

(assert (=> b!1513435 m!1396115))

(declare-fun m!1396117 () Bool)

(assert (=> b!1513435 m!1396117))

(assert (=> b!1513435 m!1396115))

(declare-fun m!1396119 () Bool)

(assert (=> b!1513435 m!1396119))

(declare-fun m!1396121 () Bool)

(assert (=> b!1513447 m!1396121))

(declare-fun m!1396123 () Bool)

(assert (=> b!1513447 m!1396123))

(declare-fun m!1396125 () Bool)

(assert (=> b!1513444 m!1396125))

(assert (=> b!1513437 m!1396115))

(assert (=> b!1513437 m!1396115))

(declare-fun m!1396127 () Bool)

(assert (=> b!1513437 m!1396127))

(assert (=> b!1513440 m!1396115))

(assert (=> b!1513440 m!1396115))

(declare-fun m!1396129 () Bool)

(assert (=> b!1513440 m!1396129))

(assert (=> b!1513440 m!1396129))

(assert (=> b!1513440 m!1396115))

(declare-fun m!1396131 () Bool)

(assert (=> b!1513440 m!1396131))

(assert (=> b!1513442 m!1396115))

(assert (=> b!1513442 m!1396115))

(declare-fun m!1396133 () Bool)

(assert (=> b!1513442 m!1396133))

(assert (=> b!1513438 m!1396115))

(assert (=> b!1513438 m!1396115))

(declare-fun m!1396135 () Bool)

(assert (=> b!1513438 m!1396135))

(declare-fun m!1396137 () Bool)

(assert (=> b!1513441 m!1396137))

(assert (=> b!1513439 m!1396115))

(assert (=> b!1513439 m!1396107))

(assert (=> b!1513439 m!1396109))

(declare-fun m!1396139 () Bool)

(assert (=> b!1513439 m!1396139))

(declare-fun m!1396141 () Bool)

(assert (=> start!129248 m!1396141))

(declare-fun m!1396143 () Bool)

(assert (=> start!129248 m!1396143))

(declare-fun m!1396145 () Bool)

(assert (=> b!1513436 m!1396145))

(assert (=> b!1513436 m!1396145))

(declare-fun m!1396147 () Bool)

(assert (=> b!1513436 m!1396147))

(check-sat (not start!129248) (not b!1513441) (not b!1513447) (not b!1513436) (not b!1513440) (not b!1513437) (not b!1513443) (not b!1513444) (not b!1513438) (not b!1513435) (not b!1513442))
(check-sat)
