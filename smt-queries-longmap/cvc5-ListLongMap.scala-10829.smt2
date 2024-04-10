; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126820 () Bool)

(assert start!126820)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1488656 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun e!834427 () Bool)

(declare-datatypes ((array!99593 0))(
  ( (array!99594 (arr!48068 (Array (_ BitVec 32) (_ BitVec 64))) (size!48618 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99593)

(assert (=> b!1488656 (= e!834427 (and (or (= (select (arr!48068 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48068 a!2862) intermediateBeforeIndex!19) (select (arr!48068 a!2862) j!93))) (let ((bdg!54653 (select (store (arr!48068 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!48068 a!2862) index!646) bdg!54653) (= (select (arr!48068 a!2862) index!646) (select (arr!48068 a!2862) j!93))) (= (select (arr!48068 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!54653 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1488657 () Bool)

(declare-fun res!1012253 () Bool)

(declare-fun e!834425 () Bool)

(assert (=> b!1488657 (=> (not res!1012253) (not e!834425))))

(declare-datatypes ((SeekEntryResult!12308 0))(
  ( (MissingZero!12308 (index!51624 (_ BitVec 32))) (Found!12308 (index!51625 (_ BitVec 32))) (Intermediate!12308 (undefined!13120 Bool) (index!51626 (_ BitVec 32)) (x!133228 (_ BitVec 32))) (Undefined!12308) (MissingVacant!12308 (index!51627 (_ BitVec 32))) )
))
(declare-fun lt!649281 () SeekEntryResult!12308)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99593 (_ BitVec 32)) SeekEntryResult!12308)

(assert (=> b!1488657 (= res!1012253 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48068 a!2862) j!93) a!2862 mask!2687) lt!649281))))

(declare-fun b!1488658 () Bool)

(declare-fun e!834433 () Bool)

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1488658 (= e!834433 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1488659 () Bool)

(declare-fun res!1012244 () Bool)

(declare-fun e!834426 () Bool)

(assert (=> b!1488659 (=> (not res!1012244) (not e!834426))))

(declare-datatypes ((List!34569 0))(
  ( (Nil!34566) (Cons!34565 (h!35948 (_ BitVec 64)) (t!49263 List!34569)) )
))
(declare-fun arrayNoDuplicates!0 (array!99593 (_ BitVec 32) List!34569) Bool)

(assert (=> b!1488659 (= res!1012244 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34566))))

(declare-fun e!834431 () Bool)

(declare-fun lt!649280 () SeekEntryResult!12308)

(declare-fun b!1488660 () Bool)

(declare-fun lt!649282 () array!99593)

(declare-fun lt!649279 () (_ BitVec 64))

(assert (=> b!1488660 (= e!834431 (= lt!649280 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!649279 lt!649282 mask!2687)))))

(declare-fun b!1488661 () Bool)

(declare-fun e!834430 () Bool)

(assert (=> b!1488661 (= e!834426 e!834430)))

(declare-fun res!1012255 () Bool)

(assert (=> b!1488661 (=> (not res!1012255) (not e!834430))))

(assert (=> b!1488661 (= res!1012255 (= (select (store (arr!48068 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1488661 (= lt!649282 (array!99594 (store (arr!48068 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48618 a!2862)))))

(declare-fun b!1488662 () Bool)

(declare-fun res!1012247 () Bool)

(declare-fun e!834428 () Bool)

(assert (=> b!1488662 (=> (not res!1012247) (not e!834428))))

(assert (=> b!1488662 (= res!1012247 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1488663 () Bool)

(assert (=> b!1488663 (= e!834425 e!834428)))

(declare-fun res!1012257 () Bool)

(assert (=> b!1488663 (=> (not res!1012257) (not e!834428))))

(assert (=> b!1488663 (= res!1012257 (= lt!649280 (Intermediate!12308 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1488663 (= lt!649280 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!649279 mask!2687) lt!649279 lt!649282 mask!2687))))

(assert (=> b!1488663 (= lt!649279 (select (store (arr!48068 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1488664 () Bool)

(declare-fun res!1012243 () Bool)

(assert (=> b!1488664 (=> (not res!1012243) (not e!834426))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99593 (_ BitVec 32)) Bool)

(assert (=> b!1488664 (= res!1012243 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1488665 () Bool)

(declare-fun e!834429 () Bool)

(assert (=> b!1488665 (= e!834428 (not e!834429))))

(declare-fun res!1012254 () Bool)

(assert (=> b!1488665 (=> res!1012254 e!834429)))

(assert (=> b!1488665 (= res!1012254 (or (and (= (select (arr!48068 a!2862) index!646) (select (store (arr!48068 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48068 a!2862) index!646) (select (arr!48068 a!2862) j!93))) (= (select (arr!48068 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1488665 e!834427))

(declare-fun res!1012240 () Bool)

(assert (=> b!1488665 (=> (not res!1012240) (not e!834427))))

(assert (=> b!1488665 (= res!1012240 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49956 0))(
  ( (Unit!49957) )
))
(declare-fun lt!649284 () Unit!49956)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99593 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49956)

(assert (=> b!1488665 (= lt!649284 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1488666 () Bool)

(declare-fun res!1012245 () Bool)

(assert (=> b!1488666 (=> (not res!1012245) (not e!834427))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99593 (_ BitVec 32)) SeekEntryResult!12308)

(assert (=> b!1488666 (= res!1012245 (= (seekEntryOrOpen!0 (select (arr!48068 a!2862) j!93) a!2862 mask!2687) (Found!12308 j!93)))))

(declare-fun b!1488667 () Bool)

(assert (=> b!1488667 (= e!834429 e!834433)))

(declare-fun res!1012249 () Bool)

(assert (=> b!1488667 (=> res!1012249 e!834433)))

(declare-fun lt!649278 () (_ BitVec 32))

(assert (=> b!1488667 (= res!1012249 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!649278 #b00000000000000000000000000000000) (bvsge lt!649278 (size!48618 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1488667 (= lt!649278 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun lt!649283 () SeekEntryResult!12308)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99593 (_ BitVec 32)) SeekEntryResult!12308)

(assert (=> b!1488667 (= lt!649283 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649279 lt!649282 mask!2687))))

(assert (=> b!1488667 (= lt!649283 (seekEntryOrOpen!0 lt!649279 lt!649282 mask!2687))))

(declare-fun b!1488668 () Bool)

(declare-fun res!1012250 () Bool)

(assert (=> b!1488668 (=> (not res!1012250) (not e!834426))))

(assert (=> b!1488668 (= res!1012250 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48618 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48618 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48618 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1488669 () Bool)

(assert (=> b!1488669 (= e!834430 e!834425)))

(declare-fun res!1012242 () Bool)

(assert (=> b!1488669 (=> (not res!1012242) (not e!834425))))

(assert (=> b!1488669 (= res!1012242 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48068 a!2862) j!93) mask!2687) (select (arr!48068 a!2862) j!93) a!2862 mask!2687) lt!649281))))

(assert (=> b!1488669 (= lt!649281 (Intermediate!12308 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1488670 () Bool)

(assert (=> b!1488670 (= e!834431 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649279 lt!649282 mask!2687) (seekEntryOrOpen!0 lt!649279 lt!649282 mask!2687)))))

(declare-fun b!1488671 () Bool)

(declare-fun res!1012256 () Bool)

(assert (=> b!1488671 (=> res!1012256 e!834433)))

(assert (=> b!1488671 (= res!1012256 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649278 (select (arr!48068 a!2862) j!93) a!2862 mask!2687) lt!649281)))))

(declare-fun b!1488672 () Bool)

(declare-fun res!1012246 () Bool)

(assert (=> b!1488672 (=> (not res!1012246) (not e!834426))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1488672 (= res!1012246 (validKeyInArray!0 (select (arr!48068 a!2862) i!1006)))))

(declare-fun b!1488673 () Bool)

(declare-fun res!1012252 () Bool)

(assert (=> b!1488673 (=> (not res!1012252) (not e!834426))))

(assert (=> b!1488673 (= res!1012252 (validKeyInArray!0 (select (arr!48068 a!2862) j!93)))))

(declare-fun res!1012258 () Bool)

(assert (=> start!126820 (=> (not res!1012258) (not e!834426))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126820 (= res!1012258 (validMask!0 mask!2687))))

(assert (=> start!126820 e!834426))

(assert (=> start!126820 true))

(declare-fun array_inv!37096 (array!99593) Bool)

(assert (=> start!126820 (array_inv!37096 a!2862)))

(declare-fun b!1488674 () Bool)

(declare-fun res!1012248 () Bool)

(assert (=> b!1488674 (=> res!1012248 e!834433)))

(declare-fun e!834434 () Bool)

(assert (=> b!1488674 (= res!1012248 e!834434)))

(declare-fun c!137735 () Bool)

(assert (=> b!1488674 (= c!137735 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1488675 () Bool)

(assert (=> b!1488675 (= e!834434 (not (= lt!649280 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649278 lt!649279 lt!649282 mask!2687))))))

(declare-fun b!1488676 () Bool)

(declare-fun res!1012251 () Bool)

(assert (=> b!1488676 (=> (not res!1012251) (not e!834426))))

(assert (=> b!1488676 (= res!1012251 (and (= (size!48618 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48618 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48618 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1488677 () Bool)

(assert (=> b!1488677 (= e!834434 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649278 intermediateAfterIndex!19 lt!649279 lt!649282 mask!2687) lt!649283)))))

(declare-fun b!1488678 () Bool)

(declare-fun res!1012241 () Bool)

(assert (=> b!1488678 (=> (not res!1012241) (not e!834428))))

(assert (=> b!1488678 (= res!1012241 e!834431)))

(declare-fun c!137736 () Bool)

(assert (=> b!1488678 (= c!137736 (bvsle x!665 intermediateAfterX!19))))

(assert (= (and start!126820 res!1012258) b!1488676))

(assert (= (and b!1488676 res!1012251) b!1488672))

(assert (= (and b!1488672 res!1012246) b!1488673))

(assert (= (and b!1488673 res!1012252) b!1488664))

(assert (= (and b!1488664 res!1012243) b!1488659))

(assert (= (and b!1488659 res!1012244) b!1488668))

(assert (= (and b!1488668 res!1012250) b!1488661))

(assert (= (and b!1488661 res!1012255) b!1488669))

(assert (= (and b!1488669 res!1012242) b!1488657))

(assert (= (and b!1488657 res!1012253) b!1488663))

(assert (= (and b!1488663 res!1012257) b!1488678))

(assert (= (and b!1488678 c!137736) b!1488660))

(assert (= (and b!1488678 (not c!137736)) b!1488670))

(assert (= (and b!1488678 res!1012241) b!1488662))

(assert (= (and b!1488662 res!1012247) b!1488665))

(assert (= (and b!1488665 res!1012240) b!1488666))

(assert (= (and b!1488666 res!1012245) b!1488656))

(assert (= (and b!1488665 (not res!1012254)) b!1488667))

(assert (= (and b!1488667 (not res!1012249)) b!1488671))

(assert (= (and b!1488671 (not res!1012256)) b!1488674))

(assert (= (and b!1488674 c!137735) b!1488675))

(assert (= (and b!1488674 (not c!137735)) b!1488677))

(assert (= (and b!1488674 (not res!1012248)) b!1488658))

(declare-fun m!1372993 () Bool)

(assert (=> b!1488665 m!1372993))

(declare-fun m!1372995 () Bool)

(assert (=> b!1488665 m!1372995))

(declare-fun m!1372997 () Bool)

(assert (=> b!1488665 m!1372997))

(declare-fun m!1372999 () Bool)

(assert (=> b!1488665 m!1372999))

(declare-fun m!1373001 () Bool)

(assert (=> b!1488665 m!1373001))

(declare-fun m!1373003 () Bool)

(assert (=> b!1488665 m!1373003))

(assert (=> b!1488666 m!1373003))

(assert (=> b!1488666 m!1373003))

(declare-fun m!1373005 () Bool)

(assert (=> b!1488666 m!1373005))

(declare-fun m!1373007 () Bool)

(assert (=> b!1488663 m!1373007))

(assert (=> b!1488663 m!1373007))

(declare-fun m!1373009 () Bool)

(assert (=> b!1488663 m!1373009))

(assert (=> b!1488663 m!1372995))

(declare-fun m!1373011 () Bool)

(assert (=> b!1488663 m!1373011))

(declare-fun m!1373013 () Bool)

(assert (=> b!1488672 m!1373013))

(assert (=> b!1488672 m!1373013))

(declare-fun m!1373015 () Bool)

(assert (=> b!1488672 m!1373015))

(declare-fun m!1373017 () Bool)

(assert (=> b!1488677 m!1373017))

(declare-fun m!1373019 () Bool)

(assert (=> b!1488675 m!1373019))

(assert (=> b!1488671 m!1373003))

(assert (=> b!1488671 m!1373003))

(declare-fun m!1373021 () Bool)

(assert (=> b!1488671 m!1373021))

(declare-fun m!1373023 () Bool)

(assert (=> b!1488664 m!1373023))

(declare-fun m!1373025 () Bool)

(assert (=> b!1488670 m!1373025))

(declare-fun m!1373027 () Bool)

(assert (=> b!1488670 m!1373027))

(declare-fun m!1373029 () Bool)

(assert (=> start!126820 m!1373029))

(declare-fun m!1373031 () Bool)

(assert (=> start!126820 m!1373031))

(declare-fun m!1373033 () Bool)

(assert (=> b!1488667 m!1373033))

(assert (=> b!1488667 m!1373025))

(assert (=> b!1488667 m!1373027))

(declare-fun m!1373035 () Bool)

(assert (=> b!1488660 m!1373035))

(assert (=> b!1488673 m!1373003))

(assert (=> b!1488673 m!1373003))

(declare-fun m!1373037 () Bool)

(assert (=> b!1488673 m!1373037))

(assert (=> b!1488657 m!1373003))

(assert (=> b!1488657 m!1373003))

(declare-fun m!1373039 () Bool)

(assert (=> b!1488657 m!1373039))

(assert (=> b!1488656 m!1372995))

(declare-fun m!1373041 () Bool)

(assert (=> b!1488656 m!1373041))

(assert (=> b!1488656 m!1372997))

(assert (=> b!1488656 m!1372999))

(assert (=> b!1488656 m!1373003))

(declare-fun m!1373043 () Bool)

(assert (=> b!1488659 m!1373043))

(assert (=> b!1488661 m!1372995))

(declare-fun m!1373045 () Bool)

(assert (=> b!1488661 m!1373045))

(assert (=> b!1488669 m!1373003))

(assert (=> b!1488669 m!1373003))

(declare-fun m!1373047 () Bool)

(assert (=> b!1488669 m!1373047))

(assert (=> b!1488669 m!1373047))

(assert (=> b!1488669 m!1373003))

(declare-fun m!1373049 () Bool)

(assert (=> b!1488669 m!1373049))

(push 1)

(assert (not b!1488677))

(assert (not b!1488666))

(assert (not b!1488669))

(assert (not b!1488657))

(assert (not start!126820))

(assert (not b!1488672))

(assert (not b!1488659))

(assert (not b!1488664))

(assert (not b!1488667))

(assert (not b!1488663))

(assert (not b!1488665))

(assert (not b!1488660))

(assert (not b!1488670))

(assert (not b!1488675))

(assert (not b!1488673))

(assert (not b!1488671))

(check-sat)

(pop 1)

(push 1)

(check-sat)

