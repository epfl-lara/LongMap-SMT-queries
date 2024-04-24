; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126846 () Bool)

(assert start!126846)

(declare-fun b!1487390 () Bool)

(declare-fun e!833938 () Bool)

(declare-fun e!833933 () Bool)

(assert (=> b!1487390 (= e!833938 (not e!833933))))

(declare-fun res!1010968 () Bool)

(assert (=> b!1487390 (=> res!1010968 e!833933)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99646 0))(
  ( (array!99647 (arr!48094 (Array (_ BitVec 32) (_ BitVec 64))) (size!48645 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99646)

(assert (=> b!1487390 (= res!1010968 (or (and (= (select (arr!48094 a!2862) index!646) (select (store (arr!48094 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48094 a!2862) index!646) (select (arr!48094 a!2862) j!93))) (= (select (arr!48094 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun e!833939 () Bool)

(assert (=> b!1487390 e!833939))

(declare-fun res!1010957 () Bool)

(assert (=> b!1487390 (=> (not res!1010957) (not e!833939))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99646 (_ BitVec 32)) Bool)

(assert (=> b!1487390 (= res!1010957 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49835 0))(
  ( (Unit!49836) )
))
(declare-fun lt!648815 () Unit!49835)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99646 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49835)

(assert (=> b!1487390 (= lt!648815 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun res!1010959 () Bool)

(declare-fun e!833940 () Bool)

(assert (=> start!126846 (=> (not res!1010959) (not e!833940))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126846 (= res!1010959 (validMask!0 mask!2687))))

(assert (=> start!126846 e!833940))

(assert (=> start!126846 true))

(declare-fun array_inv!37375 (array!99646) Bool)

(assert (=> start!126846 (array_inv!37375 a!2862)))

(declare-fun b!1487391 () Bool)

(declare-fun e!833932 () Bool)

(declare-fun e!833936 () Bool)

(assert (=> b!1487391 (= e!833932 e!833936)))

(declare-fun res!1010956 () Bool)

(assert (=> b!1487391 (=> (not res!1010956) (not e!833936))))

(declare-datatypes ((SeekEntryResult!12231 0))(
  ( (MissingZero!12231 (index!51316 (_ BitVec 32))) (Found!12231 (index!51317 (_ BitVec 32))) (Intermediate!12231 (undefined!13043 Bool) (index!51318 (_ BitVec 32)) (x!133076 (_ BitVec 32))) (Undefined!12231) (MissingVacant!12231 (index!51319 (_ BitVec 32))) )
))
(declare-fun lt!648812 () SeekEntryResult!12231)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99646 (_ BitVec 32)) SeekEntryResult!12231)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1487391 (= res!1010956 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48094 a!2862) j!93) mask!2687) (select (arr!48094 a!2862) j!93) a!2862 mask!2687) lt!648812))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1487391 (= lt!648812 (Intermediate!12231 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1487392 () Bool)

(assert (=> b!1487392 (= e!833936 e!833938)))

(declare-fun res!1010967 () Bool)

(assert (=> b!1487392 (=> (not res!1010967) (not e!833938))))

(declare-fun lt!648811 () SeekEntryResult!12231)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1487392 (= res!1010967 (= lt!648811 (Intermediate!12231 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!648816 () (_ BitVec 64))

(declare-fun lt!648813 () array!99646)

(assert (=> b!1487392 (= lt!648811 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!648816 mask!2687) lt!648816 lt!648813 mask!2687))))

(assert (=> b!1487392 (= lt!648816 (select (store (arr!48094 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1487393 () Bool)

(declare-fun res!1010963 () Bool)

(assert (=> b!1487393 (=> (not res!1010963) (not e!833940))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1487393 (= res!1010963 (validKeyInArray!0 (select (arr!48094 a!2862) i!1006)))))

(declare-fun b!1487394 () Bool)

(declare-fun res!1010965 () Bool)

(assert (=> b!1487394 (=> (not res!1010965) (not e!833940))))

(declare-datatypes ((List!34582 0))(
  ( (Nil!34579) (Cons!34578 (h!35966 (_ BitVec 64)) (t!49268 List!34582)) )
))
(declare-fun arrayNoDuplicates!0 (array!99646 (_ BitVec 32) List!34582) Bool)

(assert (=> b!1487394 (= res!1010965 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34579))))

(declare-fun b!1487395 () Bool)

(declare-fun res!1010954 () Bool)

(assert (=> b!1487395 (=> (not res!1010954) (not e!833940))))

(assert (=> b!1487395 (= res!1010954 (and (= (size!48645 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48645 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48645 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1487396 () Bool)

(declare-fun e!833935 () Bool)

(declare-fun e!833937 () Bool)

(assert (=> b!1487396 (= e!833935 e!833937)))

(declare-fun res!1010961 () Bool)

(assert (=> b!1487396 (=> (not res!1010961) (not e!833937))))

(declare-fun lt!648817 () (_ BitVec 64))

(assert (=> b!1487396 (= res!1010961 (and (= index!646 intermediateAfterIndex!19) (= lt!648817 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1487397 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99646 (_ BitVec 32)) SeekEntryResult!12231)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99646 (_ BitVec 32)) SeekEntryResult!12231)

(assert (=> b!1487397 (= e!833937 (= (seekEntryOrOpen!0 lt!648816 lt!648813 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648816 lt!648813 mask!2687)))))

(declare-fun b!1487398 () Bool)

(declare-fun lt!648814 () (_ BitVec 32))

(assert (=> b!1487398 (= e!833933 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (and (bvsge lt!648814 #b00000000000000000000000000000000) (bvslt lt!648814 (size!48645 a!2862)))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1487398 (= lt!648814 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun b!1487399 () Bool)

(assert (=> b!1487399 (= e!833940 e!833932)))

(declare-fun res!1010958 () Bool)

(assert (=> b!1487399 (=> (not res!1010958) (not e!833932))))

(assert (=> b!1487399 (= res!1010958 (= (select (store (arr!48094 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1487399 (= lt!648813 (array!99647 (store (arr!48094 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48645 a!2862)))))

(declare-fun b!1487400 () Bool)

(assert (=> b!1487400 (= e!833939 e!833935)))

(declare-fun res!1010962 () Bool)

(assert (=> b!1487400 (=> res!1010962 e!833935)))

(assert (=> b!1487400 (= res!1010962 (or (and (= (select (arr!48094 a!2862) index!646) lt!648817) (= (select (arr!48094 a!2862) index!646) (select (arr!48094 a!2862) j!93))) (= (select (arr!48094 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1487400 (= lt!648817 (select (store (arr!48094 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1487401 () Bool)

(declare-fun e!833931 () Bool)

(assert (=> b!1487401 (= e!833931 (= lt!648811 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!648816 lt!648813 mask!2687)))))

(declare-fun b!1487402 () Bool)

(declare-fun res!1010966 () Bool)

(assert (=> b!1487402 (=> (not res!1010966) (not e!833938))))

(assert (=> b!1487402 (= res!1010966 e!833931)))

(declare-fun c!137752 () Bool)

(assert (=> b!1487402 (= c!137752 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1487403 () Bool)

(declare-fun res!1010964 () Bool)

(assert (=> b!1487403 (=> (not res!1010964) (not e!833936))))

(assert (=> b!1487403 (= res!1010964 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48094 a!2862) j!93) a!2862 mask!2687) lt!648812))))

(declare-fun b!1487404 () Bool)

(declare-fun res!1010951 () Bool)

(assert (=> b!1487404 (=> (not res!1010951) (not e!833940))))

(assert (=> b!1487404 (= res!1010951 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1487405 () Bool)

(declare-fun res!1010960 () Bool)

(assert (=> b!1487405 (=> (not res!1010960) (not e!833938))))

(assert (=> b!1487405 (= res!1010960 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1487406 () Bool)

(declare-fun res!1010953 () Bool)

(assert (=> b!1487406 (=> (not res!1010953) (not e!833939))))

(assert (=> b!1487406 (= res!1010953 (or (= (select (arr!48094 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48094 a!2862) intermediateBeforeIndex!19) (select (arr!48094 a!2862) j!93))))))

(declare-fun b!1487407 () Bool)

(declare-fun res!1010952 () Bool)

(assert (=> b!1487407 (=> (not res!1010952) (not e!833940))))

(assert (=> b!1487407 (= res!1010952 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48645 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48645 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48645 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1487408 () Bool)

(assert (=> b!1487408 (= e!833931 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648816 lt!648813 mask!2687) (seekEntryOrOpen!0 lt!648816 lt!648813 mask!2687)))))

(declare-fun b!1487409 () Bool)

(declare-fun res!1010969 () Bool)

(assert (=> b!1487409 (=> (not res!1010969) (not e!833940))))

(assert (=> b!1487409 (= res!1010969 (validKeyInArray!0 (select (arr!48094 a!2862) j!93)))))

(declare-fun b!1487410 () Bool)

(declare-fun res!1010955 () Bool)

(assert (=> b!1487410 (=> (not res!1010955) (not e!833939))))

(assert (=> b!1487410 (= res!1010955 (= (seekEntryOrOpen!0 (select (arr!48094 a!2862) j!93) a!2862 mask!2687) (Found!12231 j!93)))))

(assert (= (and start!126846 res!1010959) b!1487395))

(assert (= (and b!1487395 res!1010954) b!1487393))

(assert (= (and b!1487393 res!1010963) b!1487409))

(assert (= (and b!1487409 res!1010969) b!1487404))

(assert (= (and b!1487404 res!1010951) b!1487394))

(assert (= (and b!1487394 res!1010965) b!1487407))

(assert (= (and b!1487407 res!1010952) b!1487399))

(assert (= (and b!1487399 res!1010958) b!1487391))

(assert (= (and b!1487391 res!1010956) b!1487403))

(assert (= (and b!1487403 res!1010964) b!1487392))

(assert (= (and b!1487392 res!1010967) b!1487402))

(assert (= (and b!1487402 c!137752) b!1487401))

(assert (= (and b!1487402 (not c!137752)) b!1487408))

(assert (= (and b!1487402 res!1010966) b!1487405))

(assert (= (and b!1487405 res!1010960) b!1487390))

(assert (= (and b!1487390 res!1010957) b!1487410))

(assert (= (and b!1487410 res!1010955) b!1487406))

(assert (= (and b!1487406 res!1010953) b!1487400))

(assert (= (and b!1487400 (not res!1010962)) b!1487396))

(assert (= (and b!1487396 res!1010961) b!1487397))

(assert (= (and b!1487390 (not res!1010968)) b!1487398))

(declare-fun m!1372459 () Bool)

(assert (=> b!1487401 m!1372459))

(declare-fun m!1372461 () Bool)

(assert (=> b!1487403 m!1372461))

(assert (=> b!1487403 m!1372461))

(declare-fun m!1372463 () Bool)

(assert (=> b!1487403 m!1372463))

(declare-fun m!1372465 () Bool)

(assert (=> b!1487393 m!1372465))

(assert (=> b!1487393 m!1372465))

(declare-fun m!1372467 () Bool)

(assert (=> b!1487393 m!1372467))

(declare-fun m!1372469 () Bool)

(assert (=> b!1487397 m!1372469))

(declare-fun m!1372471 () Bool)

(assert (=> b!1487397 m!1372471))

(declare-fun m!1372473 () Bool)

(assert (=> b!1487394 m!1372473))

(declare-fun m!1372475 () Bool)

(assert (=> b!1487400 m!1372475))

(assert (=> b!1487400 m!1372461))

(declare-fun m!1372477 () Bool)

(assert (=> b!1487400 m!1372477))

(declare-fun m!1372479 () Bool)

(assert (=> b!1487400 m!1372479))

(assert (=> b!1487399 m!1372477))

(declare-fun m!1372481 () Bool)

(assert (=> b!1487399 m!1372481))

(assert (=> b!1487409 m!1372461))

(assert (=> b!1487409 m!1372461))

(declare-fun m!1372483 () Bool)

(assert (=> b!1487409 m!1372483))

(assert (=> b!1487408 m!1372471))

(assert (=> b!1487408 m!1372469))

(assert (=> b!1487410 m!1372461))

(assert (=> b!1487410 m!1372461))

(declare-fun m!1372485 () Bool)

(assert (=> b!1487410 m!1372485))

(declare-fun m!1372487 () Bool)

(assert (=> b!1487406 m!1372487))

(assert (=> b!1487406 m!1372461))

(declare-fun m!1372489 () Bool)

(assert (=> b!1487404 m!1372489))

(declare-fun m!1372491 () Bool)

(assert (=> b!1487390 m!1372491))

(assert (=> b!1487390 m!1372477))

(assert (=> b!1487390 m!1372479))

(assert (=> b!1487390 m!1372475))

(declare-fun m!1372493 () Bool)

(assert (=> b!1487390 m!1372493))

(assert (=> b!1487390 m!1372461))

(assert (=> b!1487391 m!1372461))

(assert (=> b!1487391 m!1372461))

(declare-fun m!1372495 () Bool)

(assert (=> b!1487391 m!1372495))

(assert (=> b!1487391 m!1372495))

(assert (=> b!1487391 m!1372461))

(declare-fun m!1372497 () Bool)

(assert (=> b!1487391 m!1372497))

(declare-fun m!1372499 () Bool)

(assert (=> start!126846 m!1372499))

(declare-fun m!1372501 () Bool)

(assert (=> start!126846 m!1372501))

(declare-fun m!1372503 () Bool)

(assert (=> b!1487392 m!1372503))

(assert (=> b!1487392 m!1372503))

(declare-fun m!1372505 () Bool)

(assert (=> b!1487392 m!1372505))

(assert (=> b!1487392 m!1372477))

(declare-fun m!1372507 () Bool)

(assert (=> b!1487392 m!1372507))

(declare-fun m!1372509 () Bool)

(assert (=> b!1487398 m!1372509))

(check-sat (not b!1487397) (not b!1487391) (not b!1487409) (not b!1487390) (not b!1487393) (not b!1487398) (not b!1487394) (not b!1487410) (not b!1487404) (not b!1487403) (not b!1487401) (not start!126846) (not b!1487392) (not b!1487408))
(check-sat)
(get-model)

(declare-fun b!1487555 () Bool)

(declare-fun e!834014 () SeekEntryResult!12231)

(declare-fun e!834015 () SeekEntryResult!12231)

(assert (=> b!1487555 (= e!834014 e!834015)))

(declare-fun lt!648864 () (_ BitVec 64))

(declare-fun c!137765 () Bool)

(assert (=> b!1487555 (= c!137765 (or (= lt!648864 (select (arr!48094 a!2862) j!93)) (= (bvadd lt!648864 lt!648864) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1487556 () Bool)

(assert (=> b!1487556 (= e!834014 (Intermediate!12231 true (toIndex!0 (select (arr!48094 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun d!156905 () Bool)

(declare-fun e!834011 () Bool)

(assert (=> d!156905 e!834011))

(declare-fun c!137767 () Bool)

(declare-fun lt!648865 () SeekEntryResult!12231)

(get-info :version)

(assert (=> d!156905 (= c!137767 (and ((_ is Intermediate!12231) lt!648865) (undefined!13043 lt!648865)))))

(assert (=> d!156905 (= lt!648865 e!834014)))

(declare-fun c!137766 () Bool)

(assert (=> d!156905 (= c!137766 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!156905 (= lt!648864 (select (arr!48094 a!2862) (toIndex!0 (select (arr!48094 a!2862) j!93) mask!2687)))))

(assert (=> d!156905 (validMask!0 mask!2687)))

(assert (=> d!156905 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48094 a!2862) j!93) mask!2687) (select (arr!48094 a!2862) j!93) a!2862 mask!2687) lt!648865)))

(declare-fun b!1487557 () Bool)

(assert (=> b!1487557 (= e!834011 (bvsge (x!133076 lt!648865) #b01111111111111111111111111111110))))

(declare-fun b!1487558 () Bool)

(assert (=> b!1487558 (= e!834015 (Intermediate!12231 false (toIndex!0 (select (arr!48094 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1487559 () Bool)

(assert (=> b!1487559 (and (bvsge (index!51318 lt!648865) #b00000000000000000000000000000000) (bvslt (index!51318 lt!648865) (size!48645 a!2862)))))

(declare-fun res!1011090 () Bool)

(assert (=> b!1487559 (= res!1011090 (= (select (arr!48094 a!2862) (index!51318 lt!648865)) (select (arr!48094 a!2862) j!93)))))

(declare-fun e!834012 () Bool)

(assert (=> b!1487559 (=> res!1011090 e!834012)))

(declare-fun e!834013 () Bool)

(assert (=> b!1487559 (= e!834013 e!834012)))

(declare-fun b!1487560 () Bool)

(assert (=> b!1487560 (and (bvsge (index!51318 lt!648865) #b00000000000000000000000000000000) (bvslt (index!51318 lt!648865) (size!48645 a!2862)))))

(assert (=> b!1487560 (= e!834012 (= (select (arr!48094 a!2862) (index!51318 lt!648865)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1487561 () Bool)

(assert (=> b!1487561 (= e!834011 e!834013)))

(declare-fun res!1011092 () Bool)

(assert (=> b!1487561 (= res!1011092 (and ((_ is Intermediate!12231) lt!648865) (not (undefined!13043 lt!648865)) (bvslt (x!133076 lt!648865) #b01111111111111111111111111111110) (bvsge (x!133076 lt!648865) #b00000000000000000000000000000000) (bvsge (x!133076 lt!648865) #b00000000000000000000000000000000)))))

(assert (=> b!1487561 (=> (not res!1011092) (not e!834013))))

(declare-fun b!1487562 () Bool)

(assert (=> b!1487562 (and (bvsge (index!51318 lt!648865) #b00000000000000000000000000000000) (bvslt (index!51318 lt!648865) (size!48645 a!2862)))))

(declare-fun res!1011091 () Bool)

(assert (=> b!1487562 (= res!1011091 (= (select (arr!48094 a!2862) (index!51318 lt!648865)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1487562 (=> res!1011091 e!834012)))

(declare-fun b!1487563 () Bool)

(assert (=> b!1487563 (= e!834015 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48094 a!2862) j!93) mask!2687) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2687) (select (arr!48094 a!2862) j!93) a!2862 mask!2687))))

(assert (= (and d!156905 c!137766) b!1487556))

(assert (= (and d!156905 (not c!137766)) b!1487555))

(assert (= (and b!1487555 c!137765) b!1487558))

(assert (= (and b!1487555 (not c!137765)) b!1487563))

(assert (= (and d!156905 c!137767) b!1487557))

(assert (= (and d!156905 (not c!137767)) b!1487561))

(assert (= (and b!1487561 res!1011092) b!1487559))

(assert (= (and b!1487559 (not res!1011090)) b!1487562))

(assert (= (and b!1487562 (not res!1011091)) b!1487560))

(assert (=> d!156905 m!1372495))

(declare-fun m!1372615 () Bool)

(assert (=> d!156905 m!1372615))

(assert (=> d!156905 m!1372499))

(declare-fun m!1372617 () Bool)

(assert (=> b!1487559 m!1372617))

(assert (=> b!1487562 m!1372617))

(assert (=> b!1487560 m!1372617))

(assert (=> b!1487563 m!1372495))

(declare-fun m!1372619 () Bool)

(assert (=> b!1487563 m!1372619))

(assert (=> b!1487563 m!1372619))

(assert (=> b!1487563 m!1372461))

(declare-fun m!1372621 () Bool)

(assert (=> b!1487563 m!1372621))

(assert (=> b!1487391 d!156905))

(declare-fun d!156907 () Bool)

(declare-fun lt!648871 () (_ BitVec 32))

(declare-fun lt!648870 () (_ BitVec 32))

(assert (=> d!156907 (= lt!648871 (bvmul (bvxor lt!648870 (bvlshr lt!648870 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!156907 (= lt!648870 ((_ extract 31 0) (bvand (bvxor (select (arr!48094 a!2862) j!93) (bvlshr (select (arr!48094 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!156907 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1011093 (let ((h!35969 ((_ extract 31 0) (bvand (bvxor (select (arr!48094 a!2862) j!93) (bvlshr (select (arr!48094 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!133080 (bvmul (bvxor h!35969 (bvlshr h!35969 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!133080 (bvlshr x!133080 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1011093 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1011093 #b00000000000000000000000000000000))))))

(assert (=> d!156907 (= (toIndex!0 (select (arr!48094 a!2862) j!93) mask!2687) (bvand (bvxor lt!648871 (bvlshr lt!648871 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1487391 d!156907))

(declare-fun b!1487564 () Bool)

(declare-fun e!834019 () SeekEntryResult!12231)

(declare-fun e!834020 () SeekEntryResult!12231)

(assert (=> b!1487564 (= e!834019 e!834020)))

(declare-fun c!137768 () Bool)

(declare-fun lt!648872 () (_ BitVec 64))

(assert (=> b!1487564 (= c!137768 (or (= lt!648872 lt!648816) (= (bvadd lt!648872 lt!648872) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1487565 () Bool)

(assert (=> b!1487565 (= e!834019 (Intermediate!12231 true index!646 x!665))))

(declare-fun d!156909 () Bool)

(declare-fun e!834016 () Bool)

(assert (=> d!156909 e!834016))

(declare-fun c!137770 () Bool)

(declare-fun lt!648873 () SeekEntryResult!12231)

(assert (=> d!156909 (= c!137770 (and ((_ is Intermediate!12231) lt!648873) (undefined!13043 lt!648873)))))

(assert (=> d!156909 (= lt!648873 e!834019)))

(declare-fun c!137769 () Bool)

(assert (=> d!156909 (= c!137769 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!156909 (= lt!648872 (select (arr!48094 lt!648813) index!646))))

(assert (=> d!156909 (validMask!0 mask!2687)))

(assert (=> d!156909 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!648816 lt!648813 mask!2687) lt!648873)))

(declare-fun b!1487566 () Bool)

(assert (=> b!1487566 (= e!834016 (bvsge (x!133076 lt!648873) #b01111111111111111111111111111110))))

(declare-fun b!1487567 () Bool)

(assert (=> b!1487567 (= e!834020 (Intermediate!12231 false index!646 x!665))))

(declare-fun b!1487568 () Bool)

(assert (=> b!1487568 (and (bvsge (index!51318 lt!648873) #b00000000000000000000000000000000) (bvslt (index!51318 lt!648873) (size!48645 lt!648813)))))

(declare-fun res!1011094 () Bool)

(assert (=> b!1487568 (= res!1011094 (= (select (arr!48094 lt!648813) (index!51318 lt!648873)) lt!648816))))

(declare-fun e!834017 () Bool)

(assert (=> b!1487568 (=> res!1011094 e!834017)))

(declare-fun e!834018 () Bool)

(assert (=> b!1487568 (= e!834018 e!834017)))

(declare-fun b!1487569 () Bool)

(assert (=> b!1487569 (and (bvsge (index!51318 lt!648873) #b00000000000000000000000000000000) (bvslt (index!51318 lt!648873) (size!48645 lt!648813)))))

(assert (=> b!1487569 (= e!834017 (= (select (arr!48094 lt!648813) (index!51318 lt!648873)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1487570 () Bool)

(assert (=> b!1487570 (= e!834016 e!834018)))

(declare-fun res!1011096 () Bool)

(assert (=> b!1487570 (= res!1011096 (and ((_ is Intermediate!12231) lt!648873) (not (undefined!13043 lt!648873)) (bvslt (x!133076 lt!648873) #b01111111111111111111111111111110) (bvsge (x!133076 lt!648873) #b00000000000000000000000000000000) (bvsge (x!133076 lt!648873) x!665)))))

(assert (=> b!1487570 (=> (not res!1011096) (not e!834018))))

(declare-fun b!1487571 () Bool)

(assert (=> b!1487571 (and (bvsge (index!51318 lt!648873) #b00000000000000000000000000000000) (bvslt (index!51318 lt!648873) (size!48645 lt!648813)))))

(declare-fun res!1011095 () Bool)

(assert (=> b!1487571 (= res!1011095 (= (select (arr!48094 lt!648813) (index!51318 lt!648873)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1487571 (=> res!1011095 e!834017)))

(declare-fun b!1487572 () Bool)

(assert (=> b!1487572 (= e!834020 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 (bvadd x!665 #b00000000000000000000000000000001) mask!2687) lt!648816 lt!648813 mask!2687))))

(assert (= (and d!156909 c!137769) b!1487565))

(assert (= (and d!156909 (not c!137769)) b!1487564))

(assert (= (and b!1487564 c!137768) b!1487567))

(assert (= (and b!1487564 (not c!137768)) b!1487572))

(assert (= (and d!156909 c!137770) b!1487566))

(assert (= (and d!156909 (not c!137770)) b!1487570))

(assert (= (and b!1487570 res!1011096) b!1487568))

(assert (= (and b!1487568 (not res!1011094)) b!1487571))

(assert (= (and b!1487571 (not res!1011095)) b!1487569))

(declare-fun m!1372623 () Bool)

(assert (=> d!156909 m!1372623))

(assert (=> d!156909 m!1372499))

(declare-fun m!1372625 () Bool)

(assert (=> b!1487568 m!1372625))

(assert (=> b!1487571 m!1372625))

(assert (=> b!1487569 m!1372625))

(declare-fun m!1372627 () Bool)

(assert (=> b!1487572 m!1372627))

(assert (=> b!1487572 m!1372627))

(declare-fun m!1372629 () Bool)

(assert (=> b!1487572 m!1372629))

(assert (=> b!1487401 d!156909))

(declare-fun b!1487581 () Bool)

(declare-fun e!834029 () Bool)

(declare-fun call!67968 () Bool)

(assert (=> b!1487581 (= e!834029 call!67968)))

(declare-fun b!1487582 () Bool)

(declare-fun e!834027 () Bool)

(assert (=> b!1487582 (= e!834029 e!834027)))

(declare-fun lt!648881 () (_ BitVec 64))

(assert (=> b!1487582 (= lt!648881 (select (arr!48094 a!2862) j!93))))

(declare-fun lt!648880 () Unit!49835)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99646 (_ BitVec 64) (_ BitVec 32)) Unit!49835)

(assert (=> b!1487582 (= lt!648880 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!648881 j!93))))

(declare-fun arrayContainsKey!0 (array!99646 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1487582 (arrayContainsKey!0 a!2862 lt!648881 #b00000000000000000000000000000000)))

(declare-fun lt!648882 () Unit!49835)

(assert (=> b!1487582 (= lt!648882 lt!648880)))

(declare-fun res!1011102 () Bool)

(assert (=> b!1487582 (= res!1011102 (= (seekEntryOrOpen!0 (select (arr!48094 a!2862) j!93) a!2862 mask!2687) (Found!12231 j!93)))))

(assert (=> b!1487582 (=> (not res!1011102) (not e!834027))))

(declare-fun bm!67965 () Bool)

(assert (=> bm!67965 (= call!67968 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!93 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun d!156911 () Bool)

(declare-fun res!1011101 () Bool)

(declare-fun e!834028 () Bool)

(assert (=> d!156911 (=> res!1011101 e!834028)))

(assert (=> d!156911 (= res!1011101 (bvsge j!93 (size!48645 a!2862)))))

(assert (=> d!156911 (= (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687) e!834028)))

(declare-fun b!1487583 () Bool)

(assert (=> b!1487583 (= e!834027 call!67968)))

(declare-fun b!1487584 () Bool)

(assert (=> b!1487584 (= e!834028 e!834029)))

(declare-fun c!137773 () Bool)

(assert (=> b!1487584 (= c!137773 (validKeyInArray!0 (select (arr!48094 a!2862) j!93)))))

(assert (= (and d!156911 (not res!1011101)) b!1487584))

(assert (= (and b!1487584 c!137773) b!1487582))

(assert (= (and b!1487584 (not c!137773)) b!1487581))

(assert (= (and b!1487582 res!1011102) b!1487583))

(assert (= (or b!1487583 b!1487581) bm!67965))

(assert (=> b!1487582 m!1372461))

(declare-fun m!1372631 () Bool)

(assert (=> b!1487582 m!1372631))

(declare-fun m!1372633 () Bool)

(assert (=> b!1487582 m!1372633))

(assert (=> b!1487582 m!1372461))

(assert (=> b!1487582 m!1372485))

(declare-fun m!1372635 () Bool)

(assert (=> bm!67965 m!1372635))

(assert (=> b!1487584 m!1372461))

(assert (=> b!1487584 m!1372461))

(assert (=> b!1487584 m!1372483))

(assert (=> b!1487390 d!156911))

(declare-fun d!156913 () Bool)

(assert (=> d!156913 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!648885 () Unit!49835)

(declare-fun choose!38 (array!99646 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49835)

(assert (=> d!156913 (= lt!648885 (choose!38 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (=> d!156913 (validMask!0 mask!2687)))

(assert (=> d!156913 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93) lt!648885)))

(declare-fun bs!42763 () Bool)

(assert (= bs!42763 d!156913))

(assert (=> bs!42763 m!1372493))

(declare-fun m!1372637 () Bool)

(assert (=> bs!42763 m!1372637))

(assert (=> bs!42763 m!1372499))

(assert (=> b!1487390 d!156913))

(declare-fun b!1487595 () Bool)

(declare-fun e!834040 () Bool)

(declare-fun contains!9964 (List!34582 (_ BitVec 64)) Bool)

(assert (=> b!1487595 (= e!834040 (contains!9964 Nil!34579 (select (arr!48094 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1487596 () Bool)

(declare-fun e!834041 () Bool)

(declare-fun call!67971 () Bool)

(assert (=> b!1487596 (= e!834041 call!67971)))

(declare-fun d!156915 () Bool)

(declare-fun res!1011110 () Bool)

(declare-fun e!834038 () Bool)

(assert (=> d!156915 (=> res!1011110 e!834038)))

(assert (=> d!156915 (= res!1011110 (bvsge #b00000000000000000000000000000000 (size!48645 a!2862)))))

(assert (=> d!156915 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34579) e!834038)))

(declare-fun bm!67968 () Bool)

(declare-fun c!137776 () Bool)

(assert (=> bm!67968 (= call!67971 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!137776 (Cons!34578 (select (arr!48094 a!2862) #b00000000000000000000000000000000) Nil!34579) Nil!34579)))))

(declare-fun b!1487597 () Bool)

(declare-fun e!834039 () Bool)

(assert (=> b!1487597 (= e!834038 e!834039)))

(declare-fun res!1011111 () Bool)

(assert (=> b!1487597 (=> (not res!1011111) (not e!834039))))

(assert (=> b!1487597 (= res!1011111 (not e!834040))))

(declare-fun res!1011109 () Bool)

(assert (=> b!1487597 (=> (not res!1011109) (not e!834040))))

(assert (=> b!1487597 (= res!1011109 (validKeyInArray!0 (select (arr!48094 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1487598 () Bool)

(assert (=> b!1487598 (= e!834041 call!67971)))

(declare-fun b!1487599 () Bool)

(assert (=> b!1487599 (= e!834039 e!834041)))

(assert (=> b!1487599 (= c!137776 (validKeyInArray!0 (select (arr!48094 a!2862) #b00000000000000000000000000000000)))))

(assert (= (and d!156915 (not res!1011110)) b!1487597))

(assert (= (and b!1487597 res!1011109) b!1487595))

(assert (= (and b!1487597 res!1011111) b!1487599))

(assert (= (and b!1487599 c!137776) b!1487598))

(assert (= (and b!1487599 (not c!137776)) b!1487596))

(assert (= (or b!1487598 b!1487596) bm!67968))

(declare-fun m!1372639 () Bool)

(assert (=> b!1487595 m!1372639))

(assert (=> b!1487595 m!1372639))

(declare-fun m!1372641 () Bool)

(assert (=> b!1487595 m!1372641))

(assert (=> bm!67968 m!1372639))

(declare-fun m!1372643 () Bool)

(assert (=> bm!67968 m!1372643))

(assert (=> b!1487597 m!1372639))

(assert (=> b!1487597 m!1372639))

(declare-fun m!1372645 () Bool)

(assert (=> b!1487597 m!1372645))

(assert (=> b!1487599 m!1372639))

(assert (=> b!1487599 m!1372639))

(assert (=> b!1487599 m!1372645))

(assert (=> b!1487394 d!156915))

(declare-fun b!1487600 () Bool)

(declare-fun e!834044 () Bool)

(declare-fun call!67972 () Bool)

(assert (=> b!1487600 (= e!834044 call!67972)))

(declare-fun b!1487601 () Bool)

(declare-fun e!834042 () Bool)

(assert (=> b!1487601 (= e!834044 e!834042)))

(declare-fun lt!648887 () (_ BitVec 64))

(assert (=> b!1487601 (= lt!648887 (select (arr!48094 a!2862) #b00000000000000000000000000000000))))

(declare-fun lt!648886 () Unit!49835)

(assert (=> b!1487601 (= lt!648886 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!648887 #b00000000000000000000000000000000))))

(assert (=> b!1487601 (arrayContainsKey!0 a!2862 lt!648887 #b00000000000000000000000000000000)))

(declare-fun lt!648888 () Unit!49835)

(assert (=> b!1487601 (= lt!648888 lt!648886)))

(declare-fun res!1011113 () Bool)

(assert (=> b!1487601 (= res!1011113 (= (seekEntryOrOpen!0 (select (arr!48094 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!12231 #b00000000000000000000000000000000)))))

(assert (=> b!1487601 (=> (not res!1011113) (not e!834042))))

(declare-fun bm!67969 () Bool)

(assert (=> bm!67969 (= call!67972 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun d!156921 () Bool)

(declare-fun res!1011112 () Bool)

(declare-fun e!834043 () Bool)

(assert (=> d!156921 (=> res!1011112 e!834043)))

(assert (=> d!156921 (= res!1011112 (bvsge #b00000000000000000000000000000000 (size!48645 a!2862)))))

(assert (=> d!156921 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!834043)))

(declare-fun b!1487602 () Bool)

(assert (=> b!1487602 (= e!834042 call!67972)))

(declare-fun b!1487603 () Bool)

(assert (=> b!1487603 (= e!834043 e!834044)))

(declare-fun c!137777 () Bool)

(assert (=> b!1487603 (= c!137777 (validKeyInArray!0 (select (arr!48094 a!2862) #b00000000000000000000000000000000)))))

(assert (= (and d!156921 (not res!1011112)) b!1487603))

(assert (= (and b!1487603 c!137777) b!1487601))

(assert (= (and b!1487603 (not c!137777)) b!1487600))

(assert (= (and b!1487601 res!1011113) b!1487602))

(assert (= (or b!1487602 b!1487600) bm!67969))

(assert (=> b!1487601 m!1372639))

(declare-fun m!1372647 () Bool)

(assert (=> b!1487601 m!1372647))

(declare-fun m!1372649 () Bool)

(assert (=> b!1487601 m!1372649))

(assert (=> b!1487601 m!1372639))

(declare-fun m!1372651 () Bool)

(assert (=> b!1487601 m!1372651))

(declare-fun m!1372653 () Bool)

(assert (=> bm!67969 m!1372653))

(assert (=> b!1487603 m!1372639))

(assert (=> b!1487603 m!1372639))

(assert (=> b!1487603 m!1372645))

(assert (=> b!1487404 d!156921))

(declare-fun d!156923 () Bool)

(assert (=> d!156923 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!126846 d!156923))

(declare-fun d!156927 () Bool)

(assert (=> d!156927 (= (array_inv!37375 a!2862) (bvsge (size!48645 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!126846 d!156927))

(declare-fun d!156929 () Bool)

(assert (=> d!156929 (= (validKeyInArray!0 (select (arr!48094 a!2862) i!1006)) (and (not (= (select (arr!48094 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48094 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1487393 d!156929))

(declare-fun b!1487622 () Bool)

(declare-fun e!834057 () SeekEntryResult!12231)

(declare-fun e!834058 () SeekEntryResult!12231)

(assert (=> b!1487622 (= e!834057 e!834058)))

(declare-fun c!137787 () Bool)

(declare-fun lt!648895 () (_ BitVec 64))

(assert (=> b!1487622 (= c!137787 (or (= lt!648895 (select (arr!48094 a!2862) j!93)) (= (bvadd lt!648895 lt!648895) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1487623 () Bool)

(assert (=> b!1487623 (= e!834057 (Intermediate!12231 true index!646 x!665))))

(declare-fun d!156931 () Bool)

(declare-fun e!834054 () Bool)

(assert (=> d!156931 e!834054))

(declare-fun c!137789 () Bool)

(declare-fun lt!648896 () SeekEntryResult!12231)

(assert (=> d!156931 (= c!137789 (and ((_ is Intermediate!12231) lt!648896) (undefined!13043 lt!648896)))))

(assert (=> d!156931 (= lt!648896 e!834057)))

(declare-fun c!137788 () Bool)

(assert (=> d!156931 (= c!137788 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!156931 (= lt!648895 (select (arr!48094 a!2862) index!646))))

(assert (=> d!156931 (validMask!0 mask!2687)))

(assert (=> d!156931 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48094 a!2862) j!93) a!2862 mask!2687) lt!648896)))

(declare-fun b!1487624 () Bool)

(assert (=> b!1487624 (= e!834054 (bvsge (x!133076 lt!648896) #b01111111111111111111111111111110))))

(declare-fun b!1487625 () Bool)

(assert (=> b!1487625 (= e!834058 (Intermediate!12231 false index!646 x!665))))

(declare-fun b!1487626 () Bool)

(assert (=> b!1487626 (and (bvsge (index!51318 lt!648896) #b00000000000000000000000000000000) (bvslt (index!51318 lt!648896) (size!48645 a!2862)))))

(declare-fun res!1011114 () Bool)

(assert (=> b!1487626 (= res!1011114 (= (select (arr!48094 a!2862) (index!51318 lt!648896)) (select (arr!48094 a!2862) j!93)))))

(declare-fun e!834055 () Bool)

(assert (=> b!1487626 (=> res!1011114 e!834055)))

(declare-fun e!834056 () Bool)

(assert (=> b!1487626 (= e!834056 e!834055)))

(declare-fun b!1487627 () Bool)

(assert (=> b!1487627 (and (bvsge (index!51318 lt!648896) #b00000000000000000000000000000000) (bvslt (index!51318 lt!648896) (size!48645 a!2862)))))

(assert (=> b!1487627 (= e!834055 (= (select (arr!48094 a!2862) (index!51318 lt!648896)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1487628 () Bool)

(assert (=> b!1487628 (= e!834054 e!834056)))

(declare-fun res!1011116 () Bool)

(assert (=> b!1487628 (= res!1011116 (and ((_ is Intermediate!12231) lt!648896) (not (undefined!13043 lt!648896)) (bvslt (x!133076 lt!648896) #b01111111111111111111111111111110) (bvsge (x!133076 lt!648896) #b00000000000000000000000000000000) (bvsge (x!133076 lt!648896) x!665)))))

(assert (=> b!1487628 (=> (not res!1011116) (not e!834056))))

(declare-fun b!1487629 () Bool)

(assert (=> b!1487629 (and (bvsge (index!51318 lt!648896) #b00000000000000000000000000000000) (bvslt (index!51318 lt!648896) (size!48645 a!2862)))))

(declare-fun res!1011115 () Bool)

(assert (=> b!1487629 (= res!1011115 (= (select (arr!48094 a!2862) (index!51318 lt!648896)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1487629 (=> res!1011115 e!834055)))

(declare-fun b!1487630 () Bool)

(assert (=> b!1487630 (= e!834058 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 (bvadd x!665 #b00000000000000000000000000000001) mask!2687) (select (arr!48094 a!2862) j!93) a!2862 mask!2687))))

(assert (= (and d!156931 c!137788) b!1487623))

(assert (= (and d!156931 (not c!137788)) b!1487622))

(assert (= (and b!1487622 c!137787) b!1487625))

(assert (= (and b!1487622 (not c!137787)) b!1487630))

(assert (= (and d!156931 c!137789) b!1487624))

(assert (= (and d!156931 (not c!137789)) b!1487628))

(assert (= (and b!1487628 res!1011116) b!1487626))

(assert (= (and b!1487626 (not res!1011114)) b!1487629))

(assert (= (and b!1487629 (not res!1011115)) b!1487627))

(assert (=> d!156931 m!1372475))

(assert (=> d!156931 m!1372499))

(declare-fun m!1372665 () Bool)

(assert (=> b!1487626 m!1372665))

(assert (=> b!1487629 m!1372665))

(assert (=> b!1487627 m!1372665))

(assert (=> b!1487630 m!1372627))

(assert (=> b!1487630 m!1372627))

(assert (=> b!1487630 m!1372461))

(declare-fun m!1372667 () Bool)

(assert (=> b!1487630 m!1372667))

(assert (=> b!1487403 d!156931))

(declare-fun b!1487631 () Bool)

(declare-fun e!834062 () SeekEntryResult!12231)

(declare-fun e!834063 () SeekEntryResult!12231)

(assert (=> b!1487631 (= e!834062 e!834063)))

(declare-fun c!137790 () Bool)

(declare-fun lt!648897 () (_ BitVec 64))

(assert (=> b!1487631 (= c!137790 (or (= lt!648897 lt!648816) (= (bvadd lt!648897 lt!648897) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1487632 () Bool)

(assert (=> b!1487632 (= e!834062 (Intermediate!12231 true (toIndex!0 lt!648816 mask!2687) #b00000000000000000000000000000000))))

(declare-fun d!156935 () Bool)

(declare-fun e!834059 () Bool)

(assert (=> d!156935 e!834059))

(declare-fun c!137792 () Bool)

(declare-fun lt!648898 () SeekEntryResult!12231)

(assert (=> d!156935 (= c!137792 (and ((_ is Intermediate!12231) lt!648898) (undefined!13043 lt!648898)))))

(assert (=> d!156935 (= lt!648898 e!834062)))

(declare-fun c!137791 () Bool)

(assert (=> d!156935 (= c!137791 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!156935 (= lt!648897 (select (arr!48094 lt!648813) (toIndex!0 lt!648816 mask!2687)))))

(assert (=> d!156935 (validMask!0 mask!2687)))

(assert (=> d!156935 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!648816 mask!2687) lt!648816 lt!648813 mask!2687) lt!648898)))

(declare-fun b!1487633 () Bool)

(assert (=> b!1487633 (= e!834059 (bvsge (x!133076 lt!648898) #b01111111111111111111111111111110))))

(declare-fun b!1487634 () Bool)

(assert (=> b!1487634 (= e!834063 (Intermediate!12231 false (toIndex!0 lt!648816 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1487635 () Bool)

(assert (=> b!1487635 (and (bvsge (index!51318 lt!648898) #b00000000000000000000000000000000) (bvslt (index!51318 lt!648898) (size!48645 lt!648813)))))

(declare-fun res!1011117 () Bool)

(assert (=> b!1487635 (= res!1011117 (= (select (arr!48094 lt!648813) (index!51318 lt!648898)) lt!648816))))

(declare-fun e!834060 () Bool)

(assert (=> b!1487635 (=> res!1011117 e!834060)))

(declare-fun e!834061 () Bool)

(assert (=> b!1487635 (= e!834061 e!834060)))

(declare-fun b!1487636 () Bool)

(assert (=> b!1487636 (and (bvsge (index!51318 lt!648898) #b00000000000000000000000000000000) (bvslt (index!51318 lt!648898) (size!48645 lt!648813)))))

(assert (=> b!1487636 (= e!834060 (= (select (arr!48094 lt!648813) (index!51318 lt!648898)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1487637 () Bool)

(assert (=> b!1487637 (= e!834059 e!834061)))

(declare-fun res!1011119 () Bool)

(assert (=> b!1487637 (= res!1011119 (and ((_ is Intermediate!12231) lt!648898) (not (undefined!13043 lt!648898)) (bvslt (x!133076 lt!648898) #b01111111111111111111111111111110) (bvsge (x!133076 lt!648898) #b00000000000000000000000000000000) (bvsge (x!133076 lt!648898) #b00000000000000000000000000000000)))))

(assert (=> b!1487637 (=> (not res!1011119) (not e!834061))))

(declare-fun b!1487638 () Bool)

(assert (=> b!1487638 (and (bvsge (index!51318 lt!648898) #b00000000000000000000000000000000) (bvslt (index!51318 lt!648898) (size!48645 lt!648813)))))

(declare-fun res!1011118 () Bool)

(assert (=> b!1487638 (= res!1011118 (= (select (arr!48094 lt!648813) (index!51318 lt!648898)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1487638 (=> res!1011118 e!834060)))

(declare-fun b!1487639 () Bool)

(assert (=> b!1487639 (= e!834063 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!648816 mask!2687) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2687) lt!648816 lt!648813 mask!2687))))

(assert (= (and d!156935 c!137791) b!1487632))

(assert (= (and d!156935 (not c!137791)) b!1487631))

(assert (= (and b!1487631 c!137790) b!1487634))

(assert (= (and b!1487631 (not c!137790)) b!1487639))

(assert (= (and d!156935 c!137792) b!1487633))

(assert (= (and d!156935 (not c!137792)) b!1487637))

(assert (= (and b!1487637 res!1011119) b!1487635))

(assert (= (and b!1487635 (not res!1011117)) b!1487638))

(assert (= (and b!1487638 (not res!1011118)) b!1487636))

(assert (=> d!156935 m!1372503))

(declare-fun m!1372669 () Bool)

(assert (=> d!156935 m!1372669))

(assert (=> d!156935 m!1372499))

(declare-fun m!1372671 () Bool)

(assert (=> b!1487635 m!1372671))

(assert (=> b!1487638 m!1372671))

(assert (=> b!1487636 m!1372671))

(assert (=> b!1487639 m!1372503))

(declare-fun m!1372673 () Bool)

(assert (=> b!1487639 m!1372673))

(assert (=> b!1487639 m!1372673))

(declare-fun m!1372675 () Bool)

(assert (=> b!1487639 m!1372675))

(assert (=> b!1487392 d!156935))

(declare-fun d!156937 () Bool)

(declare-fun lt!648900 () (_ BitVec 32))

(declare-fun lt!648899 () (_ BitVec 32))

(assert (=> d!156937 (= lt!648900 (bvmul (bvxor lt!648899 (bvlshr lt!648899 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!156937 (= lt!648899 ((_ extract 31 0) (bvand (bvxor lt!648816 (bvlshr lt!648816 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!156937 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1011093 (let ((h!35969 ((_ extract 31 0) (bvand (bvxor lt!648816 (bvlshr lt!648816 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!133080 (bvmul (bvxor h!35969 (bvlshr h!35969 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!133080 (bvlshr x!133080 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1011093 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1011093 #b00000000000000000000000000000000))))))

(assert (=> d!156937 (= (toIndex!0 lt!648816 mask!2687) (bvand (bvxor lt!648900 (bvlshr lt!648900 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1487392 d!156937))

(declare-fun b!1487685 () Bool)

(declare-fun e!834092 () SeekEntryResult!12231)

(assert (=> b!1487685 (= e!834092 Undefined!12231)))

(declare-fun b!1487687 () Bool)

(declare-fun e!834091 () SeekEntryResult!12231)

(declare-fun lt!648918 () SeekEntryResult!12231)

(assert (=> b!1487687 (= e!834091 (Found!12231 (index!51318 lt!648918)))))

(declare-fun b!1487688 () Bool)

(declare-fun e!834093 () SeekEntryResult!12231)

(assert (=> b!1487688 (= e!834093 (MissingZero!12231 (index!51318 lt!648918)))))

(declare-fun b!1487689 () Bool)

(assert (=> b!1487689 (= e!834092 e!834091)))

(declare-fun lt!648916 () (_ BitVec 64))

(assert (=> b!1487689 (= lt!648916 (select (arr!48094 lt!648813) (index!51318 lt!648918)))))

(declare-fun c!137811 () Bool)

(assert (=> b!1487689 (= c!137811 (= lt!648916 lt!648816))))

(declare-fun b!1487690 () Bool)

(declare-fun c!137812 () Bool)

(assert (=> b!1487690 (= c!137812 (= lt!648916 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1487690 (= e!834091 e!834093)))

(declare-fun b!1487686 () Bool)

(assert (=> b!1487686 (= e!834093 (seekKeyOrZeroReturnVacant!0 (x!133076 lt!648918) (index!51318 lt!648918) (index!51318 lt!648918) lt!648816 lt!648813 mask!2687))))

(declare-fun d!156939 () Bool)

(declare-fun lt!648917 () SeekEntryResult!12231)

(assert (=> d!156939 (and (or ((_ is Undefined!12231) lt!648917) (not ((_ is Found!12231) lt!648917)) (and (bvsge (index!51317 lt!648917) #b00000000000000000000000000000000) (bvslt (index!51317 lt!648917) (size!48645 lt!648813)))) (or ((_ is Undefined!12231) lt!648917) ((_ is Found!12231) lt!648917) (not ((_ is MissingZero!12231) lt!648917)) (and (bvsge (index!51316 lt!648917) #b00000000000000000000000000000000) (bvslt (index!51316 lt!648917) (size!48645 lt!648813)))) (or ((_ is Undefined!12231) lt!648917) ((_ is Found!12231) lt!648917) ((_ is MissingZero!12231) lt!648917) (not ((_ is MissingVacant!12231) lt!648917)) (and (bvsge (index!51319 lt!648917) #b00000000000000000000000000000000) (bvslt (index!51319 lt!648917) (size!48645 lt!648813)))) (or ((_ is Undefined!12231) lt!648917) (ite ((_ is Found!12231) lt!648917) (= (select (arr!48094 lt!648813) (index!51317 lt!648917)) lt!648816) (ite ((_ is MissingZero!12231) lt!648917) (= (select (arr!48094 lt!648813) (index!51316 lt!648917)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12231) lt!648917) (= (select (arr!48094 lt!648813) (index!51319 lt!648917)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!156939 (= lt!648917 e!834092)))

(declare-fun c!137813 () Bool)

(assert (=> d!156939 (= c!137813 (and ((_ is Intermediate!12231) lt!648918) (undefined!13043 lt!648918)))))

(assert (=> d!156939 (= lt!648918 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!648816 mask!2687) lt!648816 lt!648813 mask!2687))))

(assert (=> d!156939 (validMask!0 mask!2687)))

(assert (=> d!156939 (= (seekEntryOrOpen!0 lt!648816 lt!648813 mask!2687) lt!648917)))

(assert (= (and d!156939 c!137813) b!1487685))

(assert (= (and d!156939 (not c!137813)) b!1487689))

(assert (= (and b!1487689 c!137811) b!1487687))

(assert (= (and b!1487689 (not c!137811)) b!1487690))

(assert (= (and b!1487690 c!137812) b!1487688))

(assert (= (and b!1487690 (not c!137812)) b!1487686))

(declare-fun m!1372695 () Bool)

(assert (=> b!1487689 m!1372695))

(declare-fun m!1372697 () Bool)

(assert (=> b!1487686 m!1372697))

(declare-fun m!1372699 () Bool)

(assert (=> d!156939 m!1372699))

(assert (=> d!156939 m!1372503))

(declare-fun m!1372701 () Bool)

(assert (=> d!156939 m!1372701))

(declare-fun m!1372703 () Bool)

(assert (=> d!156939 m!1372703))

(assert (=> d!156939 m!1372499))

(assert (=> d!156939 m!1372503))

(assert (=> d!156939 m!1372505))

(assert (=> b!1487397 d!156939))

(declare-fun b!1487727 () Bool)

(declare-fun e!834120 () SeekEntryResult!12231)

(assert (=> b!1487727 (= e!834120 (MissingVacant!12231 intermediateAfterIndex!19))))

(declare-fun b!1487728 () Bool)

(assert (=> b!1487728 (= e!834120 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 (bvadd x!665 #b00000000000000000000000000000001) mask!2687) intermediateAfterIndex!19 lt!648816 lt!648813 mask!2687))))

(declare-fun b!1487729 () Bool)

(declare-fun e!834119 () SeekEntryResult!12231)

(assert (=> b!1487729 (= e!834119 (Found!12231 index!646))))

(declare-fun b!1487730 () Bool)

(declare-fun e!834118 () SeekEntryResult!12231)

(assert (=> b!1487730 (= e!834118 e!834119)))

(declare-fun c!137826 () Bool)

(declare-fun lt!648948 () (_ BitVec 64))

(assert (=> b!1487730 (= c!137826 (= lt!648948 lt!648816))))

(declare-fun d!156949 () Bool)

(declare-fun lt!648947 () SeekEntryResult!12231)

(assert (=> d!156949 (and (or ((_ is Undefined!12231) lt!648947) (not ((_ is Found!12231) lt!648947)) (and (bvsge (index!51317 lt!648947) #b00000000000000000000000000000000) (bvslt (index!51317 lt!648947) (size!48645 lt!648813)))) (or ((_ is Undefined!12231) lt!648947) ((_ is Found!12231) lt!648947) (not ((_ is MissingVacant!12231) lt!648947)) (not (= (index!51319 lt!648947) intermediateAfterIndex!19)) (and (bvsge (index!51319 lt!648947) #b00000000000000000000000000000000) (bvslt (index!51319 lt!648947) (size!48645 lt!648813)))) (or ((_ is Undefined!12231) lt!648947) (ite ((_ is Found!12231) lt!648947) (= (select (arr!48094 lt!648813) (index!51317 lt!648947)) lt!648816) (and ((_ is MissingVacant!12231) lt!648947) (= (index!51319 lt!648947) intermediateAfterIndex!19) (= (select (arr!48094 lt!648813) (index!51319 lt!648947)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!156949 (= lt!648947 e!834118)))

(declare-fun c!137827 () Bool)

(assert (=> d!156949 (= c!137827 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!156949 (= lt!648948 (select (arr!48094 lt!648813) index!646))))

(assert (=> d!156949 (validMask!0 mask!2687)))

(assert (=> d!156949 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648816 lt!648813 mask!2687) lt!648947)))

(declare-fun b!1487731 () Bool)

(declare-fun c!137828 () Bool)

(assert (=> b!1487731 (= c!137828 (= lt!648948 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1487731 (= e!834119 e!834120)))

(declare-fun b!1487732 () Bool)

(assert (=> b!1487732 (= e!834118 Undefined!12231)))

(assert (= (and d!156949 c!137827) b!1487732))

(assert (= (and d!156949 (not c!137827)) b!1487730))

(assert (= (and b!1487730 c!137826) b!1487729))

(assert (= (and b!1487730 (not c!137826)) b!1487731))

(assert (= (and b!1487731 c!137828) b!1487727))

(assert (= (and b!1487731 (not c!137828)) b!1487728))

(assert (=> b!1487728 m!1372627))

(assert (=> b!1487728 m!1372627))

(declare-fun m!1372723 () Bool)

(assert (=> b!1487728 m!1372723))

(declare-fun m!1372725 () Bool)

(assert (=> d!156949 m!1372725))

(declare-fun m!1372727 () Bool)

(assert (=> d!156949 m!1372727))

(assert (=> d!156949 m!1372623))

(assert (=> d!156949 m!1372499))

(assert (=> b!1487397 d!156949))

(declare-fun b!1487733 () Bool)

(declare-fun e!834122 () SeekEntryResult!12231)

(assert (=> b!1487733 (= e!834122 Undefined!12231)))

(declare-fun b!1487735 () Bool)

(declare-fun e!834121 () SeekEntryResult!12231)

(declare-fun lt!648951 () SeekEntryResult!12231)

(assert (=> b!1487735 (= e!834121 (Found!12231 (index!51318 lt!648951)))))

(declare-fun b!1487736 () Bool)

(declare-fun e!834123 () SeekEntryResult!12231)

(assert (=> b!1487736 (= e!834123 (MissingZero!12231 (index!51318 lt!648951)))))

(declare-fun b!1487737 () Bool)

(assert (=> b!1487737 (= e!834122 e!834121)))

(declare-fun lt!648949 () (_ BitVec 64))

(assert (=> b!1487737 (= lt!648949 (select (arr!48094 a!2862) (index!51318 lt!648951)))))

(declare-fun c!137829 () Bool)

(assert (=> b!1487737 (= c!137829 (= lt!648949 (select (arr!48094 a!2862) j!93)))))

(declare-fun b!1487738 () Bool)

(declare-fun c!137830 () Bool)

(assert (=> b!1487738 (= c!137830 (= lt!648949 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1487738 (= e!834121 e!834123)))

(declare-fun b!1487734 () Bool)

(assert (=> b!1487734 (= e!834123 (seekKeyOrZeroReturnVacant!0 (x!133076 lt!648951) (index!51318 lt!648951) (index!51318 lt!648951) (select (arr!48094 a!2862) j!93) a!2862 mask!2687))))

(declare-fun d!156959 () Bool)

(declare-fun lt!648950 () SeekEntryResult!12231)

(assert (=> d!156959 (and (or ((_ is Undefined!12231) lt!648950) (not ((_ is Found!12231) lt!648950)) (and (bvsge (index!51317 lt!648950) #b00000000000000000000000000000000) (bvslt (index!51317 lt!648950) (size!48645 a!2862)))) (or ((_ is Undefined!12231) lt!648950) ((_ is Found!12231) lt!648950) (not ((_ is MissingZero!12231) lt!648950)) (and (bvsge (index!51316 lt!648950) #b00000000000000000000000000000000) (bvslt (index!51316 lt!648950) (size!48645 a!2862)))) (or ((_ is Undefined!12231) lt!648950) ((_ is Found!12231) lt!648950) ((_ is MissingZero!12231) lt!648950) (not ((_ is MissingVacant!12231) lt!648950)) (and (bvsge (index!51319 lt!648950) #b00000000000000000000000000000000) (bvslt (index!51319 lt!648950) (size!48645 a!2862)))) (or ((_ is Undefined!12231) lt!648950) (ite ((_ is Found!12231) lt!648950) (= (select (arr!48094 a!2862) (index!51317 lt!648950)) (select (arr!48094 a!2862) j!93)) (ite ((_ is MissingZero!12231) lt!648950) (= (select (arr!48094 a!2862) (index!51316 lt!648950)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12231) lt!648950) (= (select (arr!48094 a!2862) (index!51319 lt!648950)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!156959 (= lt!648950 e!834122)))

(declare-fun c!137831 () Bool)

(assert (=> d!156959 (= c!137831 (and ((_ is Intermediate!12231) lt!648951) (undefined!13043 lt!648951)))))

(assert (=> d!156959 (= lt!648951 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48094 a!2862) j!93) mask!2687) (select (arr!48094 a!2862) j!93) a!2862 mask!2687))))

(assert (=> d!156959 (validMask!0 mask!2687)))

(assert (=> d!156959 (= (seekEntryOrOpen!0 (select (arr!48094 a!2862) j!93) a!2862 mask!2687) lt!648950)))

(assert (= (and d!156959 c!137831) b!1487733))

(assert (= (and d!156959 (not c!137831)) b!1487737))

(assert (= (and b!1487737 c!137829) b!1487735))

(assert (= (and b!1487737 (not c!137829)) b!1487738))

(assert (= (and b!1487738 c!137830) b!1487736))

(assert (= (and b!1487738 (not c!137830)) b!1487734))

(declare-fun m!1372729 () Bool)

(assert (=> b!1487737 m!1372729))

(assert (=> b!1487734 m!1372461))

(declare-fun m!1372731 () Bool)

(assert (=> b!1487734 m!1372731))

(declare-fun m!1372733 () Bool)

(assert (=> d!156959 m!1372733))

(assert (=> d!156959 m!1372461))

(assert (=> d!156959 m!1372495))

(declare-fun m!1372735 () Bool)

(assert (=> d!156959 m!1372735))

(declare-fun m!1372737 () Bool)

(assert (=> d!156959 m!1372737))

(assert (=> d!156959 m!1372499))

(assert (=> d!156959 m!1372495))

(assert (=> d!156959 m!1372461))

(assert (=> d!156959 m!1372497))

(assert (=> b!1487410 d!156959))

(declare-fun d!156961 () Bool)

(assert (=> d!156961 (= (validKeyInArray!0 (select (arr!48094 a!2862) j!93)) (and (not (= (select (arr!48094 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48094 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1487409 d!156961))

(declare-fun d!156963 () Bool)

(declare-fun lt!648954 () (_ BitVec 32))

(assert (=> d!156963 (and (bvsge lt!648954 #b00000000000000000000000000000000) (bvslt lt!648954 (bvadd mask!2687 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!156963 (= lt!648954 (choose!52 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(assert (=> d!156963 (validMask!0 mask!2687)))

(assert (=> d!156963 (= (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687) lt!648954)))

(declare-fun bs!42766 () Bool)

(assert (= bs!42766 d!156963))

(declare-fun m!1372739 () Bool)

(assert (=> bs!42766 m!1372739))

(assert (=> bs!42766 m!1372499))

(assert (=> b!1487398 d!156963))

(assert (=> b!1487408 d!156949))

(assert (=> b!1487408 d!156939))

(check-sat (not d!156939) (not d!156931) (not d!156949) (not b!1487597) (not d!156905) (not b!1487595) (not b!1487630) (not b!1487572) (not d!156963) (not b!1487584) (not d!156959) (not b!1487728) (not d!156909) (not b!1487686) (not b!1487603) (not b!1487601) (not b!1487734) (not b!1487582) (not b!1487599) (not b!1487639) (not bm!67969) (not b!1487563) (not d!156935) (not bm!67965) (not d!156913) (not bm!67968))
(check-sat)
