; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129296 () Bool)

(assert start!129296)

(declare-fun b!1514380 () Bool)

(declare-fun res!1033108 () Bool)

(declare-fun e!845388 () Bool)

(assert (=> b!1514380 (=> (not res!1033108) (not e!845388))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100966 0))(
  ( (array!100967 (arr!48715 (Array (_ BitVec 32) (_ BitVec 64))) (size!49266 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100966)

(declare-datatypes ((SeekEntryResult!12779 0))(
  ( (MissingZero!12779 (index!53511 (_ BitVec 32))) (Found!12779 (index!53512 (_ BitVec 32))) (Intermediate!12779 (undefined!13591 Bool) (index!53513 (_ BitVec 32)) (x!135438 (_ BitVec 32))) (Undefined!12779) (MissingVacant!12779 (index!53514 (_ BitVec 32))) )
))
(declare-fun lt!656363 () SeekEntryResult!12779)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100966 (_ BitVec 32)) SeekEntryResult!12779)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1514380 (= res!1033108 (= lt!656363 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48715 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48715 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100967 (store (arr!48715 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49266 a!2804)) mask!2512)))))

(declare-fun e!845390 () Bool)

(declare-fun b!1514381 () Bool)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100966 (_ BitVec 32)) SeekEntryResult!12779)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100966 (_ BitVec 32)) SeekEntryResult!12779)

(assert (=> b!1514381 (= e!845390 (= (seekEntryOrOpen!0 (select (arr!48715 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48715 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1514383 () Bool)

(declare-fun res!1033118 () Bool)

(declare-fun e!845389 () Bool)

(assert (=> b!1514383 (=> (not res!1033118) (not e!845389))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100966 (_ BitVec 32)) SeekEntryResult!12779)

(assert (=> b!1514383 (= res!1033118 (= (seekEntry!0 (select (arr!48715 a!2804) j!70) a!2804 mask!2512) (Found!12779 j!70)))))

(declare-fun b!1514384 () Bool)

(declare-fun res!1033116 () Bool)

(declare-fun e!845391 () Bool)

(assert (=> b!1514384 (=> (not res!1033116) (not e!845391))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1514384 (= res!1033116 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49266 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49266 a!2804))))))

(declare-fun b!1514385 () Bool)

(assert (=> b!1514385 (= e!845389 e!845390)))

(declare-fun res!1033109 () Bool)

(assert (=> b!1514385 (=> res!1033109 e!845390)))

(assert (=> b!1514385 (= res!1033109 (or (not (= (select (arr!48715 a!2804) j!70) (select (store (arr!48715 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48715 a!2804) index!487) (select (arr!48715 a!2804) j!70)) (not (= (select (arr!48715 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1514386 () Bool)

(assert (=> b!1514386 (= e!845391 e!845388)))

(declare-fun res!1033117 () Bool)

(assert (=> b!1514386 (=> (not res!1033117) (not e!845388))))

(declare-fun lt!656364 () SeekEntryResult!12779)

(assert (=> b!1514386 (= res!1033117 (= lt!656363 lt!656364))))

(assert (=> b!1514386 (= lt!656364 (Intermediate!12779 false resIndex!21 resX!21))))

(assert (=> b!1514386 (= lt!656363 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48715 a!2804) j!70) mask!2512) (select (arr!48715 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1514387 () Bool)

(declare-fun res!1033107 () Bool)

(assert (=> b!1514387 (=> (not res!1033107) (not e!845391))))

(declare-datatypes ((List!35185 0))(
  ( (Nil!35182) (Cons!35181 (h!36608 (_ BitVec 64)) (t!49871 List!35185)) )
))
(declare-fun arrayNoDuplicates!0 (array!100966 (_ BitVec 32) List!35185) Bool)

(assert (=> b!1514387 (= res!1033107 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35182))))

(declare-fun b!1514388 () Bool)

(assert (=> b!1514388 (= e!845388 (not true))))

(assert (=> b!1514388 e!845389))

(declare-fun res!1033110 () Bool)

(assert (=> b!1514388 (=> (not res!1033110) (not e!845389))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100966 (_ BitVec 32)) Bool)

(assert (=> b!1514388 (= res!1033110 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50461 0))(
  ( (Unit!50462) )
))
(declare-fun lt!656365 () Unit!50461)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100966 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50461)

(assert (=> b!1514388 (= lt!656365 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1514389 () Bool)

(declare-fun res!1033111 () Bool)

(assert (=> b!1514389 (=> (not res!1033111) (not e!845388))))

(assert (=> b!1514389 (= res!1033111 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48715 a!2804) j!70) a!2804 mask!2512) lt!656364))))

(declare-fun b!1514390 () Bool)

(declare-fun res!1033106 () Bool)

(assert (=> b!1514390 (=> (not res!1033106) (not e!845391))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1514390 (= res!1033106 (validKeyInArray!0 (select (arr!48715 a!2804) i!961)))))

(declare-fun res!1033115 () Bool)

(assert (=> start!129296 (=> (not res!1033115) (not e!845391))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129296 (= res!1033115 (validMask!0 mask!2512))))

(assert (=> start!129296 e!845391))

(assert (=> start!129296 true))

(declare-fun array_inv!37996 (array!100966) Bool)

(assert (=> start!129296 (array_inv!37996 a!2804)))

(declare-fun b!1514382 () Bool)

(declare-fun res!1033112 () Bool)

(assert (=> b!1514382 (=> (not res!1033112) (not e!845391))))

(assert (=> b!1514382 (= res!1033112 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1514391 () Bool)

(declare-fun res!1033114 () Bool)

(assert (=> b!1514391 (=> (not res!1033114) (not e!845391))))

(assert (=> b!1514391 (= res!1033114 (validKeyInArray!0 (select (arr!48715 a!2804) j!70)))))

(declare-fun b!1514392 () Bool)

(declare-fun res!1033113 () Bool)

(assert (=> b!1514392 (=> (not res!1033113) (not e!845391))))

(assert (=> b!1514392 (= res!1033113 (and (= (size!49266 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49266 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49266 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!129296 res!1033115) b!1514392))

(assert (= (and b!1514392 res!1033113) b!1514390))

(assert (= (and b!1514390 res!1033106) b!1514391))

(assert (= (and b!1514391 res!1033114) b!1514382))

(assert (= (and b!1514382 res!1033112) b!1514387))

(assert (= (and b!1514387 res!1033107) b!1514384))

(assert (= (and b!1514384 res!1033116) b!1514386))

(assert (= (and b!1514386 res!1033117) b!1514389))

(assert (= (and b!1514389 res!1033111) b!1514380))

(assert (= (and b!1514380 res!1033108) b!1514388))

(assert (= (and b!1514388 res!1033110) b!1514383))

(assert (= (and b!1514383 res!1033118) b!1514385))

(assert (= (and b!1514385 (not res!1033109)) b!1514381))

(declare-fun m!1397121 () Bool)

(assert (=> b!1514382 m!1397121))

(declare-fun m!1397123 () Bool)

(assert (=> b!1514386 m!1397123))

(assert (=> b!1514386 m!1397123))

(declare-fun m!1397125 () Bool)

(assert (=> b!1514386 m!1397125))

(assert (=> b!1514386 m!1397125))

(assert (=> b!1514386 m!1397123))

(declare-fun m!1397127 () Bool)

(assert (=> b!1514386 m!1397127))

(declare-fun m!1397129 () Bool)

(assert (=> b!1514388 m!1397129))

(declare-fun m!1397131 () Bool)

(assert (=> b!1514388 m!1397131))

(declare-fun m!1397133 () Bool)

(assert (=> b!1514380 m!1397133))

(declare-fun m!1397135 () Bool)

(assert (=> b!1514380 m!1397135))

(assert (=> b!1514380 m!1397135))

(declare-fun m!1397137 () Bool)

(assert (=> b!1514380 m!1397137))

(assert (=> b!1514380 m!1397137))

(assert (=> b!1514380 m!1397135))

(declare-fun m!1397139 () Bool)

(assert (=> b!1514380 m!1397139))

(assert (=> b!1514391 m!1397123))

(assert (=> b!1514391 m!1397123))

(declare-fun m!1397141 () Bool)

(assert (=> b!1514391 m!1397141))

(declare-fun m!1397143 () Bool)

(assert (=> b!1514390 m!1397143))

(assert (=> b!1514390 m!1397143))

(declare-fun m!1397145 () Bool)

(assert (=> b!1514390 m!1397145))

(assert (=> b!1514389 m!1397123))

(assert (=> b!1514389 m!1397123))

(declare-fun m!1397147 () Bool)

(assert (=> b!1514389 m!1397147))

(assert (=> b!1514383 m!1397123))

(assert (=> b!1514383 m!1397123))

(declare-fun m!1397149 () Bool)

(assert (=> b!1514383 m!1397149))

(assert (=> b!1514381 m!1397123))

(assert (=> b!1514381 m!1397123))

(declare-fun m!1397151 () Bool)

(assert (=> b!1514381 m!1397151))

(assert (=> b!1514381 m!1397123))

(declare-fun m!1397153 () Bool)

(assert (=> b!1514381 m!1397153))

(declare-fun m!1397155 () Bool)

(assert (=> start!129296 m!1397155))

(declare-fun m!1397157 () Bool)

(assert (=> start!129296 m!1397157))

(assert (=> b!1514385 m!1397123))

(assert (=> b!1514385 m!1397133))

(assert (=> b!1514385 m!1397135))

(declare-fun m!1397159 () Bool)

(assert (=> b!1514385 m!1397159))

(declare-fun m!1397161 () Bool)

(assert (=> b!1514387 m!1397161))

(check-sat (not b!1514383) (not b!1514388) (not b!1514387) (not b!1514389) (not b!1514386) (not b!1514391) (not b!1514381) (not b!1514380) (not start!129296) (not b!1514382) (not b!1514390))
(check-sat)
