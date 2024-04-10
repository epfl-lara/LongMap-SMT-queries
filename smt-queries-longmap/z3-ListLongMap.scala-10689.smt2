; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125274 () Bool)

(assert start!125274)

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((array!98722 0))(
  ( (array!98723 (arr!47649 (Array (_ BitVec 32) (_ BitVec 64))) (size!48199 (_ BitVec 32))) )
))
(declare-fun lt!640476 () array!98722)

(declare-fun lt!640474 () (_ BitVec 64))

(declare-fun e!822106 () Bool)

(declare-datatypes ((SeekEntryResult!11901 0))(
  ( (MissingZero!11901 (index!49996 (_ BitVec 32))) (Found!11901 (index!49997 (_ BitVec 32))) (Intermediate!11901 (undefined!12713 Bool) (index!49998 (_ BitVec 32)) (x!131590 (_ BitVec 32))) (Undefined!11901) (MissingVacant!11901 (index!49999 (_ BitVec 32))) )
))
(declare-fun lt!640477 () SeekEntryResult!11901)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1462515 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98722 (_ BitVec 32)) SeekEntryResult!11901)

(assert (=> b!1462515 (= e!822106 (= lt!640477 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!640474 lt!640476 mask!2687)))))

(declare-fun b!1462516 () Bool)

(declare-fun res!991945 () Bool)

(declare-fun e!822101 () Bool)

(assert (=> b!1462516 (=> res!991945 e!822101)))

(declare-fun lt!640475 () SeekEntryResult!11901)

(declare-fun a!2862 () array!98722)

(declare-fun lt!640473 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1462516 (= res!991945 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640473 (select (arr!47649 a!2862) j!93) a!2862 mask!2687) lt!640475)))))

(declare-fun b!1462517 () Bool)

(declare-fun res!991946 () Bool)

(declare-fun e!822103 () Bool)

(assert (=> b!1462517 (=> (not res!991946) (not e!822103))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1462517 (= res!991946 (validKeyInArray!0 (select (arr!47649 a!2862) i!1006)))))

(declare-fun b!1462518 () Bool)

(declare-fun res!991939 () Bool)

(assert (=> b!1462518 (=> (not res!991939) (not e!822103))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98722 (_ BitVec 32)) Bool)

(assert (=> b!1462518 (= res!991939 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1462519 () Bool)

(declare-fun e!822109 () Bool)

(assert (=> b!1462519 (= e!822109 (not (= lt!640477 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640473 lt!640474 lt!640476 mask!2687))))))

(declare-fun b!1462520 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98722 (_ BitVec 32)) SeekEntryResult!11901)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98722 (_ BitVec 32)) SeekEntryResult!11901)

(assert (=> b!1462520 (= e!822106 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!640474 lt!640476 mask!2687) (seekEntryOrOpen!0 lt!640474 lt!640476 mask!2687)))))

(declare-fun b!1462521 () Bool)

(declare-fun e!822102 () Bool)

(declare-fun e!822108 () Bool)

(assert (=> b!1462521 (= e!822102 (not e!822108))))

(declare-fun res!991949 () Bool)

(assert (=> b!1462521 (=> res!991949 e!822108)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1462521 (= res!991949 (or (and (= (select (arr!47649 a!2862) index!646) (select (store (arr!47649 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47649 a!2862) index!646) (select (arr!47649 a!2862) j!93))) (= (select (arr!47649 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!822110 () Bool)

(assert (=> b!1462521 e!822110))

(declare-fun res!991935 () Bool)

(assert (=> b!1462521 (=> (not res!991935) (not e!822110))))

(assert (=> b!1462521 (= res!991935 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49298 0))(
  ( (Unit!49299) )
))
(declare-fun lt!640478 () Unit!49298)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98722 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49298)

(assert (=> b!1462521 (= lt!640478 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1462522 () Bool)

(assert (=> b!1462522 (= e!822101 true)))

(declare-fun lt!640479 () Bool)

(assert (=> b!1462522 (= lt!640479 e!822109)))

(declare-fun c!134802 () Bool)

(assert (=> b!1462522 (= c!134802 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1462523 () Bool)

(declare-fun e!822107 () Bool)

(declare-fun e!822104 () Bool)

(assert (=> b!1462523 (= e!822107 e!822104)))

(declare-fun res!991938 () Bool)

(assert (=> b!1462523 (=> (not res!991938) (not e!822104))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1462523 (= res!991938 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47649 a!2862) j!93) mask!2687) (select (arr!47649 a!2862) j!93) a!2862 mask!2687) lt!640475))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1462523 (= lt!640475 (Intermediate!11901 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1462524 () Bool)

(declare-fun res!991948 () Bool)

(assert (=> b!1462524 (=> (not res!991948) (not e!822103))))

(assert (=> b!1462524 (= res!991948 (validKeyInArray!0 (select (arr!47649 a!2862) j!93)))))

(declare-fun b!1462525 () Bool)

(declare-fun res!991940 () Bool)

(assert (=> b!1462525 (=> (not res!991940) (not e!822102))))

(assert (=> b!1462525 (= res!991940 e!822106)))

(declare-fun c!134801 () Bool)

(assert (=> b!1462525 (= c!134801 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1462526 () Bool)

(assert (=> b!1462526 (= e!822108 e!822101)))

(declare-fun res!991950 () Bool)

(assert (=> b!1462526 (=> res!991950 e!822101)))

(assert (=> b!1462526 (= res!991950 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!640473 #b00000000000000000000000000000000) (bvsge lt!640473 (size!48199 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1462526 (= lt!640473 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1462527 () Bool)

(declare-fun res!991942 () Bool)

(assert (=> b!1462527 (=> (not res!991942) (not e!822103))))

(declare-datatypes ((List!34150 0))(
  ( (Nil!34147) (Cons!34146 (h!35496 (_ BitVec 64)) (t!48844 List!34150)) )
))
(declare-fun arrayNoDuplicates!0 (array!98722 (_ BitVec 32) List!34150) Bool)

(assert (=> b!1462527 (= res!991942 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34147))))

(declare-fun b!1462528 () Bool)

(declare-fun res!991943 () Bool)

(assert (=> b!1462528 (=> (not res!991943) (not e!822102))))

(assert (=> b!1462528 (= res!991943 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1462529 () Bool)

(assert (=> b!1462529 (= e!822110 (or (= (select (arr!47649 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47649 a!2862) intermediateBeforeIndex!19) (select (arr!47649 a!2862) j!93))))))

(declare-fun b!1462530 () Bool)

(assert (=> b!1462530 (= e!822103 e!822107)))

(declare-fun res!991934 () Bool)

(assert (=> b!1462530 (=> (not res!991934) (not e!822107))))

(assert (=> b!1462530 (= res!991934 (= (select (store (arr!47649 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1462530 (= lt!640476 (array!98723 (store (arr!47649 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48199 a!2862)))))

(declare-fun res!991941 () Bool)

(assert (=> start!125274 (=> (not res!991941) (not e!822103))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125274 (= res!991941 (validMask!0 mask!2687))))

(assert (=> start!125274 e!822103))

(assert (=> start!125274 true))

(declare-fun array_inv!36677 (array!98722) Bool)

(assert (=> start!125274 (array_inv!36677 a!2862)))

(declare-fun b!1462531 () Bool)

(declare-fun res!991947 () Bool)

(assert (=> b!1462531 (=> (not res!991947) (not e!822103))))

(assert (=> b!1462531 (= res!991947 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48199 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48199 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48199 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1462532 () Bool)

(declare-fun res!991951 () Bool)

(assert (=> b!1462532 (=> (not res!991951) (not e!822110))))

(assert (=> b!1462532 (= res!991951 (= (seekEntryOrOpen!0 (select (arr!47649 a!2862) j!93) a!2862 mask!2687) (Found!11901 j!93)))))

(declare-fun b!1462533 () Bool)

(assert (=> b!1462533 (= e!822104 e!822102)))

(declare-fun res!991936 () Bool)

(assert (=> b!1462533 (=> (not res!991936) (not e!822102))))

(assert (=> b!1462533 (= res!991936 (= lt!640477 (Intermediate!11901 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1462533 (= lt!640477 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!640474 mask!2687) lt!640474 lt!640476 mask!2687))))

(assert (=> b!1462533 (= lt!640474 (select (store (arr!47649 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1462534 () Bool)

(assert (=> b!1462534 (= e!822109 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640473 intermediateAfterIndex!19 lt!640474 lt!640476 mask!2687) (seekEntryOrOpen!0 lt!640474 lt!640476 mask!2687))))))

(declare-fun b!1462535 () Bool)

(declare-fun res!991944 () Bool)

(assert (=> b!1462535 (=> (not res!991944) (not e!822104))))

(assert (=> b!1462535 (= res!991944 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47649 a!2862) j!93) a!2862 mask!2687) lt!640475))))

(declare-fun b!1462536 () Bool)

(declare-fun res!991937 () Bool)

(assert (=> b!1462536 (=> (not res!991937) (not e!822103))))

(assert (=> b!1462536 (= res!991937 (and (= (size!48199 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48199 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48199 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!125274 res!991941) b!1462536))

(assert (= (and b!1462536 res!991937) b!1462517))

(assert (= (and b!1462517 res!991946) b!1462524))

(assert (= (and b!1462524 res!991948) b!1462518))

(assert (= (and b!1462518 res!991939) b!1462527))

(assert (= (and b!1462527 res!991942) b!1462531))

(assert (= (and b!1462531 res!991947) b!1462530))

(assert (= (and b!1462530 res!991934) b!1462523))

(assert (= (and b!1462523 res!991938) b!1462535))

(assert (= (and b!1462535 res!991944) b!1462533))

(assert (= (and b!1462533 res!991936) b!1462525))

(assert (= (and b!1462525 c!134801) b!1462515))

(assert (= (and b!1462525 (not c!134801)) b!1462520))

(assert (= (and b!1462525 res!991940) b!1462528))

(assert (= (and b!1462528 res!991943) b!1462521))

(assert (= (and b!1462521 res!991935) b!1462532))

(assert (= (and b!1462532 res!991951) b!1462529))

(assert (= (and b!1462521 (not res!991949)) b!1462526))

(assert (= (and b!1462526 (not res!991950)) b!1462516))

(assert (= (and b!1462516 (not res!991945)) b!1462522))

(assert (= (and b!1462522 c!134802) b!1462519))

(assert (= (and b!1462522 (not c!134802)) b!1462534))

(declare-fun m!1349963 () Bool)

(assert (=> b!1462534 m!1349963))

(declare-fun m!1349965 () Bool)

(assert (=> b!1462534 m!1349965))

(declare-fun m!1349967 () Bool)

(assert (=> b!1462520 m!1349967))

(assert (=> b!1462520 m!1349965))

(declare-fun m!1349969 () Bool)

(assert (=> b!1462526 m!1349969))

(declare-fun m!1349971 () Bool)

(assert (=> b!1462518 m!1349971))

(declare-fun m!1349973 () Bool)

(assert (=> b!1462532 m!1349973))

(assert (=> b!1462532 m!1349973))

(declare-fun m!1349975 () Bool)

(assert (=> b!1462532 m!1349975))

(declare-fun m!1349977 () Bool)

(assert (=> b!1462530 m!1349977))

(declare-fun m!1349979 () Bool)

(assert (=> b!1462530 m!1349979))

(declare-fun m!1349981 () Bool)

(assert (=> b!1462519 m!1349981))

(declare-fun m!1349983 () Bool)

(assert (=> b!1462527 m!1349983))

(declare-fun m!1349985 () Bool)

(assert (=> b!1462529 m!1349985))

(assert (=> b!1462529 m!1349973))

(assert (=> b!1462535 m!1349973))

(assert (=> b!1462535 m!1349973))

(declare-fun m!1349987 () Bool)

(assert (=> b!1462535 m!1349987))

(assert (=> b!1462524 m!1349973))

(assert (=> b!1462524 m!1349973))

(declare-fun m!1349989 () Bool)

(assert (=> b!1462524 m!1349989))

(declare-fun m!1349991 () Bool)

(assert (=> start!125274 m!1349991))

(declare-fun m!1349993 () Bool)

(assert (=> start!125274 m!1349993))

(assert (=> b!1462516 m!1349973))

(assert (=> b!1462516 m!1349973))

(declare-fun m!1349995 () Bool)

(assert (=> b!1462516 m!1349995))

(declare-fun m!1349997 () Bool)

(assert (=> b!1462533 m!1349997))

(assert (=> b!1462533 m!1349997))

(declare-fun m!1349999 () Bool)

(assert (=> b!1462533 m!1349999))

(assert (=> b!1462533 m!1349977))

(declare-fun m!1350001 () Bool)

(assert (=> b!1462533 m!1350001))

(declare-fun m!1350003 () Bool)

(assert (=> b!1462517 m!1350003))

(assert (=> b!1462517 m!1350003))

(declare-fun m!1350005 () Bool)

(assert (=> b!1462517 m!1350005))

(declare-fun m!1350007 () Bool)

(assert (=> b!1462521 m!1350007))

(assert (=> b!1462521 m!1349977))

(declare-fun m!1350009 () Bool)

(assert (=> b!1462521 m!1350009))

(declare-fun m!1350011 () Bool)

(assert (=> b!1462521 m!1350011))

(declare-fun m!1350013 () Bool)

(assert (=> b!1462521 m!1350013))

(assert (=> b!1462521 m!1349973))

(assert (=> b!1462523 m!1349973))

(assert (=> b!1462523 m!1349973))

(declare-fun m!1350015 () Bool)

(assert (=> b!1462523 m!1350015))

(assert (=> b!1462523 m!1350015))

(assert (=> b!1462523 m!1349973))

(declare-fun m!1350017 () Bool)

(assert (=> b!1462523 m!1350017))

(declare-fun m!1350019 () Bool)

(assert (=> b!1462515 m!1350019))

(check-sat (not b!1462532) (not b!1462535) (not b!1462526) (not b!1462527) (not b!1462523) (not b!1462515) (not b!1462520) (not b!1462519) (not b!1462517) (not b!1462521) (not b!1462533) (not b!1462524) (not start!125274) (not b!1462534) (not b!1462518) (not b!1462516))
(check-sat)
