; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126828 () Bool)

(assert start!126828)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!834554 () Bool)

(declare-fun b!1488927 () Bool)

(declare-datatypes ((array!99601 0))(
  ( (array!99602 (arr!48072 (Array (_ BitVec 32) (_ BitVec 64))) (size!48622 (_ BitVec 32))) )
))
(declare-fun lt!649372 () array!99601)

(declare-fun lt!649368 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12312 0))(
  ( (MissingZero!12312 (index!51640 (_ BitVec 32))) (Found!12312 (index!51641 (_ BitVec 32))) (Intermediate!12312 (undefined!13124 Bool) (index!51642 (_ BitVec 32)) (x!133240 (_ BitVec 32))) (Undefined!12312) (MissingVacant!12312 (index!51643 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99601 (_ BitVec 32)) SeekEntryResult!12312)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99601 (_ BitVec 32)) SeekEntryResult!12312)

(assert (=> b!1488927 (= e!834554 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649368 lt!649372 mask!2687) (seekEntryOrOpen!0 lt!649368 lt!649372 mask!2687)))))

(declare-fun b!1488928 () Bool)

(declare-fun e!834548 () Bool)

(declare-fun lt!649371 () (_ BitVec 32))

(declare-fun lt!649373 () SeekEntryResult!12312)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99601 (_ BitVec 32)) SeekEntryResult!12312)

(assert (=> b!1488928 (= e!834548 (not (= lt!649373 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649371 lt!649368 lt!649372 mask!2687))))))

(declare-fun b!1488929 () Bool)

(declare-fun res!1012479 () Bool)

(declare-fun e!834549 () Bool)

(assert (=> b!1488929 (=> (not res!1012479) (not e!834549))))

(declare-fun a!2862 () array!99601)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99601 (_ BitVec 32)) Bool)

(assert (=> b!1488929 (= res!1012479 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1488930 () Bool)

(declare-fun res!1012472 () Bool)

(declare-fun e!834551 () Bool)

(assert (=> b!1488930 (=> (not res!1012472) (not e!834551))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1488930 (= res!1012472 (= (seekEntryOrOpen!0 (select (arr!48072 a!2862) j!93) a!2862 mask!2687) (Found!12312 j!93)))))

(declare-fun b!1488931 () Bool)

(declare-fun res!1012464 () Bool)

(assert (=> b!1488931 (=> (not res!1012464) (not e!834549))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1488931 (= res!1012464 (validKeyInArray!0 (select (arr!48072 a!2862) j!93)))))

(declare-fun b!1488932 () Bool)

(declare-fun e!834545 () Bool)

(declare-fun e!834547 () Bool)

(assert (=> b!1488932 (= e!834545 e!834547)))

(declare-fun res!1012463 () Bool)

(assert (=> b!1488932 (=> (not res!1012463) (not e!834547))))

(declare-fun lt!649367 () SeekEntryResult!12312)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1488932 (= res!1012463 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48072 a!2862) j!93) mask!2687) (select (arr!48072 a!2862) j!93) a!2862 mask!2687) lt!649367))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1488932 (= lt!649367 (Intermediate!12312 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1488933 () Bool)

(declare-fun lt!649370 () SeekEntryResult!12312)

(assert (=> b!1488933 (= e!834548 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649371 intermediateAfterIndex!19 lt!649368 lt!649372 mask!2687) lt!649370)))))

(declare-fun b!1488934 () Bool)

(declare-fun res!1012473 () Bool)

(assert (=> b!1488934 (=> (not res!1012473) (not e!834547))))

(assert (=> b!1488934 (= res!1012473 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48072 a!2862) j!93) a!2862 mask!2687) lt!649367))))

(declare-fun b!1488935 () Bool)

(declare-fun res!1012465 () Bool)

(declare-fun e!834546 () Bool)

(assert (=> b!1488935 (=> (not res!1012465) (not e!834546))))

(assert (=> b!1488935 (= res!1012465 e!834554)))

(declare-fun c!137760 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1488935 (= c!137760 (bvsle x!665 intermediateAfterX!19))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun b!1488936 () Bool)

(assert (=> b!1488936 (= e!834551 (and (or (= (select (arr!48072 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48072 a!2862) intermediateBeforeIndex!19) (select (arr!48072 a!2862) j!93))) (let ((bdg!54674 (select (store (arr!48072 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!48072 a!2862) index!646) bdg!54674) (= (select (arr!48072 a!2862) index!646) (select (arr!48072 a!2862) j!93))) (= (select (arr!48072 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!54674 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1488937 () Bool)

(declare-fun res!1012475 () Bool)

(declare-fun e!834552 () Bool)

(assert (=> b!1488937 (=> res!1012475 e!834552)))

(assert (=> b!1488937 (= res!1012475 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649371 (select (arr!48072 a!2862) j!93) a!2862 mask!2687) lt!649367)))))

(declare-fun b!1488938 () Bool)

(declare-fun res!1012467 () Bool)

(assert (=> b!1488938 (=> (not res!1012467) (not e!834549))))

(assert (=> b!1488938 (= res!1012467 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48622 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48622 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48622 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1488939 () Bool)

(assert (=> b!1488939 (= e!834549 e!834545)))

(declare-fun res!1012478 () Bool)

(assert (=> b!1488939 (=> (not res!1012478) (not e!834545))))

(assert (=> b!1488939 (= res!1012478 (= (select (store (arr!48072 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1488939 (= lt!649372 (array!99602 (store (arr!48072 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48622 a!2862)))))

(declare-fun b!1488940 () Bool)

(declare-fun res!1012471 () Bool)

(assert (=> b!1488940 (=> (not res!1012471) (not e!834549))))

(assert (=> b!1488940 (= res!1012471 (validKeyInArray!0 (select (arr!48072 a!2862) i!1006)))))

(declare-fun b!1488941 () Bool)

(declare-fun res!1012470 () Bool)

(assert (=> b!1488941 (=> (not res!1012470) (not e!834546))))

(assert (=> b!1488941 (= res!1012470 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1488942 () Bool)

(declare-fun res!1012469 () Bool)

(assert (=> b!1488942 (=> (not res!1012469) (not e!834549))))

(assert (=> b!1488942 (= res!1012469 (and (= (size!48622 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48622 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48622 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1488943 () Bool)

(assert (=> b!1488943 (= e!834554 (= lt!649373 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!649368 lt!649372 mask!2687)))))

(declare-fun b!1488944 () Bool)

(assert (=> b!1488944 (= e!834552 true)))

(declare-fun lt!649374 () Bool)

(assert (=> b!1488944 (= lt!649374 e!834548)))

(declare-fun c!137759 () Bool)

(assert (=> b!1488944 (= c!137759 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun res!1012466 () Bool)

(assert (=> start!126828 (=> (not res!1012466) (not e!834549))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126828 (= res!1012466 (validMask!0 mask!2687))))

(assert (=> start!126828 e!834549))

(assert (=> start!126828 true))

(declare-fun array_inv!37100 (array!99601) Bool)

(assert (=> start!126828 (array_inv!37100 a!2862)))

(declare-fun b!1488945 () Bool)

(declare-fun e!834550 () Bool)

(assert (=> b!1488945 (= e!834550 e!834552)))

(declare-fun res!1012477 () Bool)

(assert (=> b!1488945 (=> res!1012477 e!834552)))

(assert (=> b!1488945 (= res!1012477 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!649371 #b00000000000000000000000000000000) (bvsge lt!649371 (size!48622 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1488945 (= lt!649371 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1488945 (= lt!649370 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649368 lt!649372 mask!2687))))

(assert (=> b!1488945 (= lt!649370 (seekEntryOrOpen!0 lt!649368 lt!649372 mask!2687))))

(declare-fun b!1488946 () Bool)

(assert (=> b!1488946 (= e!834547 e!834546)))

(declare-fun res!1012476 () Bool)

(assert (=> b!1488946 (=> (not res!1012476) (not e!834546))))

(assert (=> b!1488946 (= res!1012476 (= lt!649373 (Intermediate!12312 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1488946 (= lt!649373 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!649368 mask!2687) lt!649368 lt!649372 mask!2687))))

(assert (=> b!1488946 (= lt!649368 (select (store (arr!48072 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1488947 () Bool)

(assert (=> b!1488947 (= e!834546 (not e!834550))))

(declare-fun res!1012468 () Bool)

(assert (=> b!1488947 (=> res!1012468 e!834550)))

(assert (=> b!1488947 (= res!1012468 (or (and (= (select (arr!48072 a!2862) index!646) (select (store (arr!48072 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48072 a!2862) index!646) (select (arr!48072 a!2862) j!93))) (= (select (arr!48072 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1488947 e!834551))

(declare-fun res!1012480 () Bool)

(assert (=> b!1488947 (=> (not res!1012480) (not e!834551))))

(assert (=> b!1488947 (= res!1012480 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49964 0))(
  ( (Unit!49965) )
))
(declare-fun lt!649369 () Unit!49964)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99601 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49964)

(assert (=> b!1488947 (= lt!649369 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1488948 () Bool)

(declare-fun res!1012474 () Bool)

(assert (=> b!1488948 (=> (not res!1012474) (not e!834549))))

(declare-datatypes ((List!34573 0))(
  ( (Nil!34570) (Cons!34569 (h!35952 (_ BitVec 64)) (t!49267 List!34573)) )
))
(declare-fun arrayNoDuplicates!0 (array!99601 (_ BitVec 32) List!34573) Bool)

(assert (=> b!1488948 (= res!1012474 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34570))))

(assert (= (and start!126828 res!1012466) b!1488942))

(assert (= (and b!1488942 res!1012469) b!1488940))

(assert (= (and b!1488940 res!1012471) b!1488931))

(assert (= (and b!1488931 res!1012464) b!1488929))

(assert (= (and b!1488929 res!1012479) b!1488948))

(assert (= (and b!1488948 res!1012474) b!1488938))

(assert (= (and b!1488938 res!1012467) b!1488939))

(assert (= (and b!1488939 res!1012478) b!1488932))

(assert (= (and b!1488932 res!1012463) b!1488934))

(assert (= (and b!1488934 res!1012473) b!1488946))

(assert (= (and b!1488946 res!1012476) b!1488935))

(assert (= (and b!1488935 c!137760) b!1488943))

(assert (= (and b!1488935 (not c!137760)) b!1488927))

(assert (= (and b!1488935 res!1012465) b!1488941))

(assert (= (and b!1488941 res!1012470) b!1488947))

(assert (= (and b!1488947 res!1012480) b!1488930))

(assert (= (and b!1488930 res!1012472) b!1488936))

(assert (= (and b!1488947 (not res!1012468)) b!1488945))

(assert (= (and b!1488945 (not res!1012477)) b!1488937))

(assert (= (and b!1488937 (not res!1012475)) b!1488944))

(assert (= (and b!1488944 c!137759) b!1488928))

(assert (= (and b!1488944 (not c!137759)) b!1488933))

(declare-fun m!1373225 () Bool)

(assert (=> b!1488936 m!1373225))

(declare-fun m!1373227 () Bool)

(assert (=> b!1488936 m!1373227))

(declare-fun m!1373229 () Bool)

(assert (=> b!1488936 m!1373229))

(declare-fun m!1373231 () Bool)

(assert (=> b!1488936 m!1373231))

(declare-fun m!1373233 () Bool)

(assert (=> b!1488936 m!1373233))

(declare-fun m!1373235 () Bool)

(assert (=> b!1488940 m!1373235))

(assert (=> b!1488940 m!1373235))

(declare-fun m!1373237 () Bool)

(assert (=> b!1488940 m!1373237))

(declare-fun m!1373239 () Bool)

(assert (=> b!1488945 m!1373239))

(declare-fun m!1373241 () Bool)

(assert (=> b!1488945 m!1373241))

(declare-fun m!1373243 () Bool)

(assert (=> b!1488945 m!1373243))

(assert (=> b!1488937 m!1373233))

(assert (=> b!1488937 m!1373233))

(declare-fun m!1373245 () Bool)

(assert (=> b!1488937 m!1373245))

(assert (=> b!1488931 m!1373233))

(assert (=> b!1488931 m!1373233))

(declare-fun m!1373247 () Bool)

(assert (=> b!1488931 m!1373247))

(assert (=> b!1488930 m!1373233))

(assert (=> b!1488930 m!1373233))

(declare-fun m!1373249 () Bool)

(assert (=> b!1488930 m!1373249))

(declare-fun m!1373251 () Bool)

(assert (=> start!126828 m!1373251))

(declare-fun m!1373253 () Bool)

(assert (=> start!126828 m!1373253))

(declare-fun m!1373255 () Bool)

(assert (=> b!1488933 m!1373255))

(declare-fun m!1373257 () Bool)

(assert (=> b!1488947 m!1373257))

(assert (=> b!1488947 m!1373225))

(assert (=> b!1488947 m!1373229))

(assert (=> b!1488947 m!1373231))

(declare-fun m!1373259 () Bool)

(assert (=> b!1488947 m!1373259))

(assert (=> b!1488947 m!1373233))

(assert (=> b!1488932 m!1373233))

(assert (=> b!1488932 m!1373233))

(declare-fun m!1373261 () Bool)

(assert (=> b!1488932 m!1373261))

(assert (=> b!1488932 m!1373261))

(assert (=> b!1488932 m!1373233))

(declare-fun m!1373263 () Bool)

(assert (=> b!1488932 m!1373263))

(declare-fun m!1373265 () Bool)

(assert (=> b!1488948 m!1373265))

(declare-fun m!1373267 () Bool)

(assert (=> b!1488943 m!1373267))

(assert (=> b!1488927 m!1373241))

(assert (=> b!1488927 m!1373243))

(declare-fun m!1373269 () Bool)

(assert (=> b!1488928 m!1373269))

(assert (=> b!1488934 m!1373233))

(assert (=> b!1488934 m!1373233))

(declare-fun m!1373271 () Bool)

(assert (=> b!1488934 m!1373271))

(declare-fun m!1373273 () Bool)

(assert (=> b!1488946 m!1373273))

(assert (=> b!1488946 m!1373273))

(declare-fun m!1373275 () Bool)

(assert (=> b!1488946 m!1373275))

(assert (=> b!1488946 m!1373225))

(declare-fun m!1373277 () Bool)

(assert (=> b!1488946 m!1373277))

(assert (=> b!1488939 m!1373225))

(declare-fun m!1373279 () Bool)

(assert (=> b!1488939 m!1373279))

(declare-fun m!1373281 () Bool)

(assert (=> b!1488929 m!1373281))

(check-sat (not b!1488933) (not b!1488943) (not b!1488930) (not b!1488947) (not b!1488948) (not b!1488940) (not b!1488927) (not b!1488946) (not b!1488945) (not b!1488928) (not b!1488929) (not start!126828) (not b!1488931) (not b!1488932) (not b!1488937) (not b!1488934))
(check-sat)
