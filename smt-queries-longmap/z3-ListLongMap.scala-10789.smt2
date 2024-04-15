; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126202 () Bool)

(assert start!126202)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12188 0))(
  ( (MissingZero!12188 (index!51144 (_ BitVec 32))) (Found!12188 (index!51145 (_ BitVec 32))) (Intermediate!12188 (undefined!13000 Bool) (index!51146 (_ BitVec 32)) (x!132726 (_ BitVec 32))) (Undefined!12188) (MissingVacant!12188 (index!51147 (_ BitVec 32))) )
))
(declare-fun lt!645719 () SeekEntryResult!12188)

(declare-fun e!829640 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!99286 0))(
  ( (array!99287 (arr!47923 (Array (_ BitVec 32) (_ BitVec 64))) (size!48475 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99286)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun b!1479051 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99286 (_ BitVec 32)) SeekEntryResult!12188)

(assert (=> b!1479051 (= e!829640 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47923 a!2862) j!93) a!2862 mask!2687) lt!645719))))

(declare-fun b!1479052 () Bool)

(declare-fun e!829638 () Bool)

(declare-fun e!829636 () Bool)

(assert (=> b!1479052 (= e!829638 e!829636)))

(declare-fun res!1005103 () Bool)

(assert (=> b!1479052 (=> (not res!1005103) (not e!829636))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1479052 (= res!1005103 (= (select (store (arr!47923 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!645720 () array!99286)

(assert (=> b!1479052 (= lt!645720 (array!99287 (store (arr!47923 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48475 a!2862)))))

(declare-fun b!1479053 () Bool)

(declare-fun e!829632 () Bool)

(declare-fun e!829634 () Bool)

(assert (=> b!1479053 (= e!829632 e!829634)))

(declare-fun res!1005105 () Bool)

(assert (=> b!1479053 (=> (not res!1005105) (not e!829634))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun lt!645718 () SeekEntryResult!12188)

(assert (=> b!1479053 (= res!1005105 (= lt!645718 (Intermediate!12188 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!645717 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99286 (_ BitVec 32)) SeekEntryResult!12188)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1479053 (= lt!645718 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645717 mask!2687) lt!645717 lt!645720 mask!2687))))

(assert (=> b!1479053 (= lt!645717 (select (store (arr!47923 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1479054 () Bool)

(declare-fun res!1005108 () Bool)

(assert (=> b!1479054 (=> (not res!1005108) (not e!829638))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99286 (_ BitVec 32)) Bool)

(assert (=> b!1479054 (= res!1005108 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1479055 () Bool)

(declare-fun res!1005094 () Bool)

(assert (=> b!1479055 (=> (not res!1005094) (not e!829634))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1479055 (= res!1005094 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1479056 () Bool)

(declare-fun res!1005095 () Bool)

(assert (=> b!1479056 (=> (not res!1005095) (not e!829634))))

(declare-fun e!829633 () Bool)

(assert (=> b!1479056 (= res!1005095 e!829633)))

(declare-fun c!136501 () Bool)

(assert (=> b!1479056 (= c!136501 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1479057 () Bool)

(declare-fun res!1005100 () Bool)

(assert (=> b!1479057 (=> (not res!1005100) (not e!829638))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1479057 (= res!1005100 (validKeyInArray!0 (select (arr!47923 a!2862) j!93)))))

(declare-fun b!1479058 () Bool)

(declare-fun res!1005109 () Bool)

(assert (=> b!1479058 (=> (not res!1005109) (not e!829638))))

(declare-datatypes ((List!34502 0))(
  ( (Nil!34499) (Cons!34498 (h!35866 (_ BitVec 64)) (t!49188 List!34502)) )
))
(declare-fun arrayNoDuplicates!0 (array!99286 (_ BitVec 32) List!34502) Bool)

(assert (=> b!1479058 (= res!1005109 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34499))))

(declare-fun res!1005093 () Bool)

(assert (=> start!126202 (=> (not res!1005093) (not e!829638))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126202 (= res!1005093 (validMask!0 mask!2687))))

(assert (=> start!126202 e!829638))

(assert (=> start!126202 true))

(declare-fun array_inv!37156 (array!99286) Bool)

(assert (=> start!126202 (array_inv!37156 a!2862)))

(declare-fun b!1479059 () Bool)

(assert (=> b!1479059 (= e!829634 (not e!829640))))

(declare-fun res!1005097 () Bool)

(assert (=> b!1479059 (=> res!1005097 e!829640)))

(assert (=> b!1479059 (= res!1005097 (or (and (= (select (arr!47923 a!2862) index!646) (select (store (arr!47923 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47923 a!2862) index!646) (select (arr!47923 a!2862) j!93))) (not (= (select (arr!47923 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47923 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!829635 () Bool)

(assert (=> b!1479059 e!829635))

(declare-fun res!1005106 () Bool)

(assert (=> b!1479059 (=> (not res!1005106) (not e!829635))))

(declare-fun lt!645721 () SeekEntryResult!12188)

(assert (=> b!1479059 (= res!1005106 (and (= lt!645721 lt!645719) (or (= (select (arr!47923 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47923 a!2862) intermediateBeforeIndex!19) (select (arr!47923 a!2862) j!93)))))))

(assert (=> b!1479059 (= lt!645719 (Found!12188 j!93))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99286 (_ BitVec 32)) SeekEntryResult!12188)

(assert (=> b!1479059 (= lt!645721 (seekEntryOrOpen!0 (select (arr!47923 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1479059 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49557 0))(
  ( (Unit!49558) )
))
(declare-fun lt!645722 () Unit!49557)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99286 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49557)

(assert (=> b!1479059 (= lt!645722 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1479060 () Bool)

(declare-fun e!829639 () Bool)

(declare-fun e!829641 () Bool)

(assert (=> b!1479060 (= e!829639 e!829641)))

(declare-fun res!1005104 () Bool)

(assert (=> b!1479060 (=> (not res!1005104) (not e!829641))))

(assert (=> b!1479060 (= res!1005104 (= lt!645721 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47923 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1479061 () Bool)

(declare-fun res!1005099 () Bool)

(assert (=> b!1479061 (=> (not res!1005099) (not e!829632))))

(declare-fun lt!645723 () SeekEntryResult!12188)

(assert (=> b!1479061 (= res!1005099 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47923 a!2862) j!93) a!2862 mask!2687) lt!645723))))

(declare-fun b!1479062 () Bool)

(assert (=> b!1479062 (= e!829633 (= lt!645718 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645717 lt!645720 mask!2687)))))

(declare-fun b!1479063 () Bool)

(assert (=> b!1479063 (= e!829641 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1479064 () Bool)

(declare-fun res!1005107 () Bool)

(assert (=> b!1479064 (=> (not res!1005107) (not e!829638))))

(assert (=> b!1479064 (= res!1005107 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48475 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48475 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48475 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1479065 () Bool)

(assert (=> b!1479065 (= e!829636 e!829632)))

(declare-fun res!1005101 () Bool)

(assert (=> b!1479065 (=> (not res!1005101) (not e!829632))))

(assert (=> b!1479065 (= res!1005101 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47923 a!2862) j!93) mask!2687) (select (arr!47923 a!2862) j!93) a!2862 mask!2687) lt!645723))))

(assert (=> b!1479065 (= lt!645723 (Intermediate!12188 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1479066 () Bool)

(declare-fun res!1005096 () Bool)

(assert (=> b!1479066 (=> (not res!1005096) (not e!829638))))

(assert (=> b!1479066 (= res!1005096 (validKeyInArray!0 (select (arr!47923 a!2862) i!1006)))))

(declare-fun b!1479067 () Bool)

(declare-fun res!1005098 () Bool)

(assert (=> b!1479067 (=> (not res!1005098) (not e!829638))))

(assert (=> b!1479067 (= res!1005098 (and (= (size!48475 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48475 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48475 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1479068 () Bool)

(assert (=> b!1479068 (= e!829635 e!829639)))

(declare-fun res!1005102 () Bool)

(assert (=> b!1479068 (=> res!1005102 e!829639)))

(assert (=> b!1479068 (= res!1005102 (or (and (= (select (arr!47923 a!2862) index!646) (select (store (arr!47923 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47923 a!2862) index!646) (select (arr!47923 a!2862) j!93))) (not (= (select (arr!47923 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1479069 () Bool)

(assert (=> b!1479069 (= e!829633 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645717 lt!645720 mask!2687) (seekEntryOrOpen!0 lt!645717 lt!645720 mask!2687)))))

(assert (= (and start!126202 res!1005093) b!1479067))

(assert (= (and b!1479067 res!1005098) b!1479066))

(assert (= (and b!1479066 res!1005096) b!1479057))

(assert (= (and b!1479057 res!1005100) b!1479054))

(assert (= (and b!1479054 res!1005108) b!1479058))

(assert (= (and b!1479058 res!1005109) b!1479064))

(assert (= (and b!1479064 res!1005107) b!1479052))

(assert (= (and b!1479052 res!1005103) b!1479065))

(assert (= (and b!1479065 res!1005101) b!1479061))

(assert (= (and b!1479061 res!1005099) b!1479053))

(assert (= (and b!1479053 res!1005105) b!1479056))

(assert (= (and b!1479056 c!136501) b!1479062))

(assert (= (and b!1479056 (not c!136501)) b!1479069))

(assert (= (and b!1479056 res!1005095) b!1479055))

(assert (= (and b!1479055 res!1005094) b!1479059))

(assert (= (and b!1479059 res!1005106) b!1479068))

(assert (= (and b!1479068 (not res!1005102)) b!1479060))

(assert (= (and b!1479060 res!1005104) b!1479063))

(assert (= (and b!1479059 (not res!1005097)) b!1479051))

(declare-fun m!1364451 () Bool)

(assert (=> b!1479059 m!1364451))

(declare-fun m!1364453 () Bool)

(assert (=> b!1479059 m!1364453))

(declare-fun m!1364455 () Bool)

(assert (=> b!1479059 m!1364455))

(declare-fun m!1364457 () Bool)

(assert (=> b!1479059 m!1364457))

(declare-fun m!1364459 () Bool)

(assert (=> b!1479059 m!1364459))

(declare-fun m!1364461 () Bool)

(assert (=> b!1479059 m!1364461))

(declare-fun m!1364463 () Bool)

(assert (=> b!1479059 m!1364463))

(declare-fun m!1364465 () Bool)

(assert (=> b!1479059 m!1364465))

(assert (=> b!1479059 m!1364461))

(declare-fun m!1364467 () Bool)

(assert (=> b!1479066 m!1364467))

(assert (=> b!1479066 m!1364467))

(declare-fun m!1364469 () Bool)

(assert (=> b!1479066 m!1364469))

(declare-fun m!1364471 () Bool)

(assert (=> start!126202 m!1364471))

(declare-fun m!1364473 () Bool)

(assert (=> start!126202 m!1364473))

(declare-fun m!1364475 () Bool)

(assert (=> b!1479062 m!1364475))

(assert (=> b!1479057 m!1364461))

(assert (=> b!1479057 m!1364461))

(declare-fun m!1364477 () Bool)

(assert (=> b!1479057 m!1364477))

(assert (=> b!1479068 m!1364459))

(assert (=> b!1479068 m!1364453))

(assert (=> b!1479068 m!1364457))

(assert (=> b!1479068 m!1364461))

(assert (=> b!1479051 m!1364461))

(assert (=> b!1479051 m!1364461))

(declare-fun m!1364479 () Bool)

(assert (=> b!1479051 m!1364479))

(declare-fun m!1364481 () Bool)

(assert (=> b!1479053 m!1364481))

(assert (=> b!1479053 m!1364481))

(declare-fun m!1364483 () Bool)

(assert (=> b!1479053 m!1364483))

(assert (=> b!1479053 m!1364453))

(declare-fun m!1364485 () Bool)

(assert (=> b!1479053 m!1364485))

(assert (=> b!1479061 m!1364461))

(assert (=> b!1479061 m!1364461))

(declare-fun m!1364487 () Bool)

(assert (=> b!1479061 m!1364487))

(assert (=> b!1479052 m!1364453))

(declare-fun m!1364489 () Bool)

(assert (=> b!1479052 m!1364489))

(declare-fun m!1364491 () Bool)

(assert (=> b!1479069 m!1364491))

(declare-fun m!1364493 () Bool)

(assert (=> b!1479069 m!1364493))

(declare-fun m!1364495 () Bool)

(assert (=> b!1479054 m!1364495))

(assert (=> b!1479060 m!1364461))

(assert (=> b!1479060 m!1364461))

(declare-fun m!1364497 () Bool)

(assert (=> b!1479060 m!1364497))

(assert (=> b!1479065 m!1364461))

(assert (=> b!1479065 m!1364461))

(declare-fun m!1364499 () Bool)

(assert (=> b!1479065 m!1364499))

(assert (=> b!1479065 m!1364499))

(assert (=> b!1479065 m!1364461))

(declare-fun m!1364501 () Bool)

(assert (=> b!1479065 m!1364501))

(declare-fun m!1364503 () Bool)

(assert (=> b!1479058 m!1364503))

(check-sat (not b!1479060) (not b!1479069) (not b!1479066) (not b!1479062) (not b!1479054) (not b!1479058) (not b!1479059) (not b!1479053) (not b!1479051) (not b!1479065) (not b!1479057) (not b!1479061) (not start!126202))
(check-sat)
