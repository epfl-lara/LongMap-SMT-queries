; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130488 () Bool)

(assert start!130488)

(declare-fun b!1529404 () Bool)

(declare-fun res!1045965 () Bool)

(declare-fun e!852588 () Bool)

(assert (=> b!1529404 (=> (not res!1045965) (not e!852588))))

(declare-datatypes ((array!101638 0))(
  ( (array!101639 (arr!49039 (Array (_ BitVec 32) (_ BitVec 64))) (size!49590 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101638)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1529404 (= res!1045965 (validKeyInArray!0 (select (arr!49039 a!2804) i!961)))))

(declare-fun res!1045954 () Bool)

(assert (=> start!130488 (=> (not res!1045954) (not e!852588))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130488 (= res!1045954 (validMask!0 mask!2512))))

(assert (=> start!130488 e!852588))

(assert (=> start!130488 true))

(declare-fun array_inv!38320 (array!101638) Bool)

(assert (=> start!130488 (array_inv!38320 a!2804)))

(declare-fun b!1529405 () Bool)

(declare-fun e!852586 () Bool)

(assert (=> b!1529405 (= e!852588 e!852586)))

(declare-fun res!1045962 () Bool)

(assert (=> b!1529405 (=> (not res!1045962) (not e!852586))))

(declare-datatypes ((SeekEntryResult!13097 0))(
  ( (MissingZero!13097 (index!54783 (_ BitVec 32))) (Found!13097 (index!54784 (_ BitVec 32))) (Intermediate!13097 (undefined!13909 Bool) (index!54785 (_ BitVec 32)) (x!136686 (_ BitVec 32))) (Undefined!13097) (MissingVacant!13097 (index!54786 (_ BitVec 32))) )
))
(declare-fun lt!662192 () SeekEntryResult!13097)

(declare-fun lt!662190 () SeekEntryResult!13097)

(assert (=> b!1529405 (= res!1045962 (= lt!662192 lt!662190))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1529405 (= lt!662190 (Intermediate!13097 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101638 (_ BitVec 32)) SeekEntryResult!13097)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1529405 (= lt!662192 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49039 a!2804) j!70) mask!2512) (select (arr!49039 a!2804) j!70) a!2804 mask!2512))))

(declare-fun lt!662189 () array!101638)

(declare-fun b!1529406 () Bool)

(declare-fun e!852592 () Bool)

(declare-fun lt!662193 () (_ BitVec 64))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101638 (_ BitVec 32)) SeekEntryResult!13097)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101638 (_ BitVec 32)) SeekEntryResult!13097)

(assert (=> b!1529406 (= e!852592 (= (seekEntryOrOpen!0 lt!662193 lt!662189 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!662193 lt!662189 mask!2512)))))

(declare-fun b!1529407 () Bool)

(declare-fun res!1045959 () Bool)

(assert (=> b!1529407 (=> (not res!1045959) (not e!852588))))

(declare-datatypes ((List!35509 0))(
  ( (Nil!35506) (Cons!35505 (h!36956 (_ BitVec 64)) (t!50195 List!35509)) )
))
(declare-fun arrayNoDuplicates!0 (array!101638 (_ BitVec 32) List!35509) Bool)

(assert (=> b!1529407 (= res!1045959 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35506))))

(declare-fun b!1529408 () Bool)

(declare-fun res!1045952 () Bool)

(declare-fun e!852591 () Bool)

(assert (=> b!1529408 (=> (not res!1045952) (not e!852591))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!101638 (_ BitVec 32)) SeekEntryResult!13097)

(assert (=> b!1529408 (= res!1045952 (= (seekEntry!0 (select (arr!49039 a!2804) j!70) a!2804 mask!2512) (Found!13097 j!70)))))

(declare-fun b!1529409 () Bool)

(declare-fun e!852587 () Bool)

(assert (=> b!1529409 (= e!852587 e!852592)))

(declare-fun res!1045956 () Bool)

(assert (=> b!1529409 (=> (not res!1045956) (not e!852592))))

(assert (=> b!1529409 (= res!1045956 (= (seekEntryOrOpen!0 (select (arr!49039 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!49039 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1529410 () Bool)

(declare-fun res!1045955 () Bool)

(assert (=> b!1529410 (=> (not res!1045955) (not e!852588))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101638 (_ BitVec 32)) Bool)

(assert (=> b!1529410 (= res!1045955 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1529411 () Bool)

(declare-fun res!1045961 () Bool)

(assert (=> b!1529411 (=> (not res!1045961) (not e!852588))))

(assert (=> b!1529411 (= res!1045961 (and (= (size!49590 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49590 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49590 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1529412 () Bool)

(declare-fun res!1045963 () Bool)

(assert (=> b!1529412 (=> (not res!1045963) (not e!852588))))

(assert (=> b!1529412 (= res!1045963 (validKeyInArray!0 (select (arr!49039 a!2804) j!70)))))

(declare-fun b!1529413 () Bool)

(assert (=> b!1529413 (= e!852591 e!852587)))

(declare-fun res!1045960 () Bool)

(assert (=> b!1529413 (=> res!1045960 e!852587)))

(assert (=> b!1529413 (= res!1045960 (or (not (= (select (arr!49039 a!2804) j!70) lt!662193)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!49039 a!2804) index!487) (select (arr!49039 a!2804) j!70)) (not (= (select (arr!49039 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1529414 () Bool)

(declare-fun res!1045957 () Bool)

(assert (=> b!1529414 (=> (not res!1045957) (not e!852588))))

(assert (=> b!1529414 (= res!1045957 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49590 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49590 a!2804))))))

(declare-fun b!1529415 () Bool)

(declare-fun e!852589 () Bool)

(assert (=> b!1529415 (= e!852586 e!852589)))

(declare-fun res!1045964 () Bool)

(assert (=> b!1529415 (=> (not res!1045964) (not e!852589))))

(assert (=> b!1529415 (= res!1045964 (= lt!662192 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!662193 mask!2512) lt!662193 lt!662189 mask!2512)))))

(assert (=> b!1529415 (= lt!662193 (select (store (arr!49039 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1529415 (= lt!662189 (array!101639 (store (arr!49039 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49590 a!2804)))))

(declare-fun b!1529416 () Bool)

(declare-fun res!1045953 () Bool)

(assert (=> b!1529416 (=> (not res!1045953) (not e!852586))))

(assert (=> b!1529416 (= res!1045953 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49039 a!2804) j!70) a!2804 mask!2512) lt!662190))))

(declare-fun b!1529417 () Bool)

(assert (=> b!1529417 (= e!852589 (not true))))

(assert (=> b!1529417 e!852591))

(declare-fun res!1045958 () Bool)

(assert (=> b!1529417 (=> (not res!1045958) (not e!852591))))

(assert (=> b!1529417 (= res!1045958 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51013 0))(
  ( (Unit!51014) )
))
(declare-fun lt!662191 () Unit!51013)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101638 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51013)

(assert (=> b!1529417 (= lt!662191 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (= (and start!130488 res!1045954) b!1529411))

(assert (= (and b!1529411 res!1045961) b!1529404))

(assert (= (and b!1529404 res!1045965) b!1529412))

(assert (= (and b!1529412 res!1045963) b!1529410))

(assert (= (and b!1529410 res!1045955) b!1529407))

(assert (= (and b!1529407 res!1045959) b!1529414))

(assert (= (and b!1529414 res!1045957) b!1529405))

(assert (= (and b!1529405 res!1045962) b!1529416))

(assert (= (and b!1529416 res!1045953) b!1529415))

(assert (= (and b!1529415 res!1045964) b!1529417))

(assert (= (and b!1529417 res!1045958) b!1529408))

(assert (= (and b!1529408 res!1045952) b!1529413))

(assert (= (and b!1529413 (not res!1045960)) b!1529409))

(assert (= (and b!1529409 res!1045956) b!1529406))

(declare-fun m!1412119 () Bool)

(assert (=> b!1529409 m!1412119))

(assert (=> b!1529409 m!1412119))

(declare-fun m!1412121 () Bool)

(assert (=> b!1529409 m!1412121))

(assert (=> b!1529409 m!1412119))

(declare-fun m!1412123 () Bool)

(assert (=> b!1529409 m!1412123))

(assert (=> b!1529412 m!1412119))

(assert (=> b!1529412 m!1412119))

(declare-fun m!1412125 () Bool)

(assert (=> b!1529412 m!1412125))

(assert (=> b!1529416 m!1412119))

(assert (=> b!1529416 m!1412119))

(declare-fun m!1412127 () Bool)

(assert (=> b!1529416 m!1412127))

(assert (=> b!1529413 m!1412119))

(declare-fun m!1412129 () Bool)

(assert (=> b!1529413 m!1412129))

(assert (=> b!1529408 m!1412119))

(assert (=> b!1529408 m!1412119))

(declare-fun m!1412131 () Bool)

(assert (=> b!1529408 m!1412131))

(declare-fun m!1412133 () Bool)

(assert (=> b!1529404 m!1412133))

(assert (=> b!1529404 m!1412133))

(declare-fun m!1412135 () Bool)

(assert (=> b!1529404 m!1412135))

(declare-fun m!1412137 () Bool)

(assert (=> b!1529410 m!1412137))

(declare-fun m!1412139 () Bool)

(assert (=> b!1529406 m!1412139))

(declare-fun m!1412141 () Bool)

(assert (=> b!1529406 m!1412141))

(assert (=> b!1529405 m!1412119))

(assert (=> b!1529405 m!1412119))

(declare-fun m!1412143 () Bool)

(assert (=> b!1529405 m!1412143))

(assert (=> b!1529405 m!1412143))

(assert (=> b!1529405 m!1412119))

(declare-fun m!1412145 () Bool)

(assert (=> b!1529405 m!1412145))

(declare-fun m!1412147 () Bool)

(assert (=> b!1529407 m!1412147))

(declare-fun m!1412149 () Bool)

(assert (=> start!130488 m!1412149))

(declare-fun m!1412151 () Bool)

(assert (=> start!130488 m!1412151))

(declare-fun m!1412153 () Bool)

(assert (=> b!1529417 m!1412153))

(declare-fun m!1412155 () Bool)

(assert (=> b!1529417 m!1412155))

(declare-fun m!1412157 () Bool)

(assert (=> b!1529415 m!1412157))

(assert (=> b!1529415 m!1412157))

(declare-fun m!1412159 () Bool)

(assert (=> b!1529415 m!1412159))

(declare-fun m!1412161 () Bool)

(assert (=> b!1529415 m!1412161))

(declare-fun m!1412163 () Bool)

(assert (=> b!1529415 m!1412163))

(check-sat (not b!1529407) (not b!1529405) (not b!1529406) (not b!1529412) (not b!1529415) (not b!1529409) (not b!1529410) (not b!1529408) (not b!1529417) (not b!1529416) (not start!130488) (not b!1529404))
(check-sat)
