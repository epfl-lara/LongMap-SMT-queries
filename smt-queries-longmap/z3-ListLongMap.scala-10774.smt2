; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126112 () Bool)

(assert start!126112)

(declare-fun b!1476619 () Bool)

(declare-fun e!828419 () Bool)

(declare-fun e!828422 () Bool)

(assert (=> b!1476619 (= e!828419 e!828422)))

(declare-fun res!1002941 () Bool)

(assert (=> b!1476619 (=> (not res!1002941) (not e!828422))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12143 0))(
  ( (MissingZero!12143 (index!50964 (_ BitVec 32))) (Found!12143 (index!50965 (_ BitVec 32))) (Intermediate!12143 (undefined!12955 Bool) (index!50966 (_ BitVec 32)) (x!132561 (_ BitVec 32))) (Undefined!12143) (MissingVacant!12143 (index!50967 (_ BitVec 32))) )
))
(declare-fun lt!644909 () SeekEntryResult!12143)

(declare-datatypes ((array!99196 0))(
  ( (array!99197 (arr!47878 (Array (_ BitVec 32) (_ BitVec 64))) (size!48430 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99196)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99196 (_ BitVec 32)) SeekEntryResult!12143)

(assert (=> b!1476619 (= res!1002941 (= lt!644909 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47878 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1476620 () Bool)

(declare-fun res!1002938 () Bool)

(declare-fun e!828423 () Bool)

(assert (=> b!1476620 (=> (not res!1002938) (not e!828423))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99196 (_ BitVec 32)) Bool)

(assert (=> b!1476620 (= res!1002938 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1476621 () Bool)

(declare-fun e!828416 () Bool)

(assert (=> b!1476621 (= e!828416 e!828419)))

(declare-fun res!1002945 () Bool)

(assert (=> b!1476621 (=> res!1002945 e!828419)))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1476621 (= res!1002945 (or (and (= (select (arr!47878 a!2862) index!646) (select (store (arr!47878 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47878 a!2862) index!646) (select (arr!47878 a!2862) j!93))) (not (= (select (arr!47878 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1476623 () Bool)

(declare-fun res!1002936 () Bool)

(assert (=> b!1476623 (=> (not res!1002936) (not e!828423))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1476623 (= res!1002936 (validKeyInArray!0 (select (arr!47878 a!2862) i!1006)))))

(declare-fun b!1476624 () Bool)

(declare-fun e!828420 () Bool)

(declare-fun lt!644907 () SeekEntryResult!12143)

(declare-fun lt!644905 () (_ BitVec 64))

(declare-fun lt!644910 () array!99196)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99196 (_ BitVec 32)) SeekEntryResult!12143)

(assert (=> b!1476624 (= e!828420 (= lt!644907 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!644905 lt!644910 mask!2687)))))

(declare-fun b!1476625 () Bool)

(declare-fun res!1002935 () Bool)

(assert (=> b!1476625 (=> (not res!1002935) (not e!828423))))

(assert (=> b!1476625 (= res!1002935 (and (= (size!48430 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48430 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48430 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1476626 () Bool)

(declare-fun res!1002934 () Bool)

(assert (=> b!1476626 (=> (not res!1002934) (not e!828423))))

(declare-datatypes ((List!34457 0))(
  ( (Nil!34454) (Cons!34453 (h!35821 (_ BitVec 64)) (t!49143 List!34457)) )
))
(declare-fun arrayNoDuplicates!0 (array!99196 (_ BitVec 32) List!34457) Bool)

(assert (=> b!1476626 (= res!1002934 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34454))))

(declare-fun b!1476627 () Bool)

(declare-fun res!1002944 () Bool)

(assert (=> b!1476627 (=> (not res!1002944) (not e!828423))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1476627 (= res!1002944 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48430 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48430 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48430 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1476628 () Bool)

(declare-fun e!828418 () Bool)

(declare-fun e!828415 () Bool)

(assert (=> b!1476628 (= e!828418 e!828415)))

(declare-fun res!1002943 () Bool)

(assert (=> b!1476628 (=> (not res!1002943) (not e!828415))))

(assert (=> b!1476628 (= res!1002943 (= lt!644907 (Intermediate!12143 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1476628 (= lt!644907 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!644905 mask!2687) lt!644905 lt!644910 mask!2687))))

(assert (=> b!1476628 (= lt!644905 (select (store (arr!47878 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1476629 () Bool)

(declare-fun e!828421 () Bool)

(assert (=> b!1476629 (= e!828423 e!828421)))

(declare-fun res!1002942 () Bool)

(assert (=> b!1476629 (=> (not res!1002942) (not e!828421))))

(assert (=> b!1476629 (= res!1002942 (= (select (store (arr!47878 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1476629 (= lt!644910 (array!99197 (store (arr!47878 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48430 a!2862)))))

(declare-fun b!1476630 () Bool)

(declare-fun res!1002931 () Bool)

(assert (=> b!1476630 (=> (not res!1002931) (not e!828423))))

(assert (=> b!1476630 (= res!1002931 (validKeyInArray!0 (select (arr!47878 a!2862) j!93)))))

(declare-fun b!1476622 () Bool)

(declare-fun res!1002937 () Bool)

(assert (=> b!1476622 (=> (not res!1002937) (not e!828415))))

(assert (=> b!1476622 (= res!1002937 e!828420)))

(declare-fun c!136366 () Bool)

(assert (=> b!1476622 (= c!136366 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!1002946 () Bool)

(assert (=> start!126112 (=> (not res!1002946) (not e!828423))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126112 (= res!1002946 (validMask!0 mask!2687))))

(assert (=> start!126112 e!828423))

(assert (=> start!126112 true))

(declare-fun array_inv!37111 (array!99196) Bool)

(assert (=> start!126112 (array_inv!37111 a!2862)))

(declare-fun b!1476631 () Bool)

(declare-fun res!1002932 () Bool)

(assert (=> b!1476631 (=> (not res!1002932) (not e!828415))))

(assert (=> b!1476631 (= res!1002932 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1476632 () Bool)

(assert (=> b!1476632 (= e!828421 e!828418)))

(declare-fun res!1002940 () Bool)

(assert (=> b!1476632 (=> (not res!1002940) (not e!828418))))

(declare-fun lt!644908 () SeekEntryResult!12143)

(assert (=> b!1476632 (= res!1002940 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47878 a!2862) j!93) mask!2687) (select (arr!47878 a!2862) j!93) a!2862 mask!2687) lt!644908))))

(assert (=> b!1476632 (= lt!644908 (Intermediate!12143 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1476633 () Bool)

(declare-fun res!1002939 () Bool)

(assert (=> b!1476633 (=> (not res!1002939) (not e!828418))))

(assert (=> b!1476633 (= res!1002939 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47878 a!2862) j!93) a!2862 mask!2687) lt!644908))))

(declare-fun b!1476634 () Bool)

(assert (=> b!1476634 (= e!828422 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1476635 () Bool)

(assert (=> b!1476635 (= e!828415 (not true))))

(assert (=> b!1476635 e!828416))

(declare-fun res!1002933 () Bool)

(assert (=> b!1476635 (=> (not res!1002933) (not e!828416))))

(assert (=> b!1476635 (= res!1002933 (and (= lt!644909 (Found!12143 j!93)) (or (= (select (arr!47878 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47878 a!2862) intermediateBeforeIndex!19) (select (arr!47878 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99196 (_ BitVec 32)) SeekEntryResult!12143)

(assert (=> b!1476635 (= lt!644909 (seekEntryOrOpen!0 (select (arr!47878 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1476635 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49467 0))(
  ( (Unit!49468) )
))
(declare-fun lt!644906 () Unit!49467)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99196 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49467)

(assert (=> b!1476635 (= lt!644906 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1476636 () Bool)

(assert (=> b!1476636 (= e!828420 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!644905 lt!644910 mask!2687) (seekEntryOrOpen!0 lt!644905 lt!644910 mask!2687)))))

(assert (= (and start!126112 res!1002946) b!1476625))

(assert (= (and b!1476625 res!1002935) b!1476623))

(assert (= (and b!1476623 res!1002936) b!1476630))

(assert (= (and b!1476630 res!1002931) b!1476620))

(assert (= (and b!1476620 res!1002938) b!1476626))

(assert (= (and b!1476626 res!1002934) b!1476627))

(assert (= (and b!1476627 res!1002944) b!1476629))

(assert (= (and b!1476629 res!1002942) b!1476632))

(assert (= (and b!1476632 res!1002940) b!1476633))

(assert (= (and b!1476633 res!1002939) b!1476628))

(assert (= (and b!1476628 res!1002943) b!1476622))

(assert (= (and b!1476622 c!136366) b!1476624))

(assert (= (and b!1476622 (not c!136366)) b!1476636))

(assert (= (and b!1476622 res!1002937) b!1476631))

(assert (= (and b!1476631 res!1002932) b!1476635))

(assert (= (and b!1476635 res!1002933) b!1476621))

(assert (= (and b!1476621 (not res!1002945)) b!1476619))

(assert (= (and b!1476619 res!1002941) b!1476634))

(declare-fun m!1362111 () Bool)

(assert (=> b!1476620 m!1362111))

(declare-fun m!1362113 () Bool)

(assert (=> b!1476619 m!1362113))

(assert (=> b!1476619 m!1362113))

(declare-fun m!1362115 () Bool)

(assert (=> b!1476619 m!1362115))

(declare-fun m!1362117 () Bool)

(assert (=> b!1476623 m!1362117))

(assert (=> b!1476623 m!1362117))

(declare-fun m!1362119 () Bool)

(assert (=> b!1476623 m!1362119))

(declare-fun m!1362121 () Bool)

(assert (=> b!1476635 m!1362121))

(declare-fun m!1362123 () Bool)

(assert (=> b!1476635 m!1362123))

(assert (=> b!1476635 m!1362113))

(declare-fun m!1362125 () Bool)

(assert (=> b!1476635 m!1362125))

(declare-fun m!1362127 () Bool)

(assert (=> b!1476635 m!1362127))

(assert (=> b!1476635 m!1362113))

(declare-fun m!1362129 () Bool)

(assert (=> b!1476636 m!1362129))

(declare-fun m!1362131 () Bool)

(assert (=> b!1476636 m!1362131))

(declare-fun m!1362133 () Bool)

(assert (=> b!1476624 m!1362133))

(declare-fun m!1362135 () Bool)

(assert (=> b!1476626 m!1362135))

(declare-fun m!1362137 () Bool)

(assert (=> start!126112 m!1362137))

(declare-fun m!1362139 () Bool)

(assert (=> start!126112 m!1362139))

(assert (=> b!1476632 m!1362113))

(assert (=> b!1476632 m!1362113))

(declare-fun m!1362141 () Bool)

(assert (=> b!1476632 m!1362141))

(assert (=> b!1476632 m!1362141))

(assert (=> b!1476632 m!1362113))

(declare-fun m!1362143 () Bool)

(assert (=> b!1476632 m!1362143))

(assert (=> b!1476630 m!1362113))

(assert (=> b!1476630 m!1362113))

(declare-fun m!1362145 () Bool)

(assert (=> b!1476630 m!1362145))

(declare-fun m!1362147 () Bool)

(assert (=> b!1476629 m!1362147))

(declare-fun m!1362149 () Bool)

(assert (=> b!1476629 m!1362149))

(declare-fun m!1362151 () Bool)

(assert (=> b!1476621 m!1362151))

(assert (=> b!1476621 m!1362147))

(declare-fun m!1362153 () Bool)

(assert (=> b!1476621 m!1362153))

(assert (=> b!1476621 m!1362113))

(assert (=> b!1476633 m!1362113))

(assert (=> b!1476633 m!1362113))

(declare-fun m!1362155 () Bool)

(assert (=> b!1476633 m!1362155))

(declare-fun m!1362157 () Bool)

(assert (=> b!1476628 m!1362157))

(assert (=> b!1476628 m!1362157))

(declare-fun m!1362159 () Bool)

(assert (=> b!1476628 m!1362159))

(assert (=> b!1476628 m!1362147))

(declare-fun m!1362161 () Bool)

(assert (=> b!1476628 m!1362161))

(check-sat (not b!1476619) (not b!1476624) (not b!1476632) (not b!1476630) (not b!1476620) (not b!1476636) (not b!1476623) (not b!1476628) (not b!1476633) (not start!126112) (not b!1476626) (not b!1476635))
(check-sat)
