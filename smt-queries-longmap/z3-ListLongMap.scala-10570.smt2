; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124528 () Bool)

(assert start!124528)

(declare-fun b!1441477 () Bool)

(declare-fun res!973919 () Bool)

(declare-fun e!812552 () Bool)

(assert (=> b!1441477 (=> (not res!973919) (not e!812552))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!97954 0))(
  ( (array!97955 (arr!47266 (Array (_ BitVec 32) (_ BitVec 64))) (size!47818 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97954)

(assert (=> b!1441477 (= res!973919 (and (= (size!47818 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47818 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47818 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1441478 () Bool)

(declare-fun res!973914 () Bool)

(declare-fun e!812551 () Bool)

(assert (=> b!1441478 (=> (not res!973914) (not e!812551))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1441478 (= res!973914 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1441479 () Bool)

(declare-fun res!973910 () Bool)

(assert (=> b!1441479 (=> (not res!973910) (not e!812552))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1441479 (= res!973910 (validKeyInArray!0 (select (arr!47266 a!2862) i!1006)))))

(declare-fun b!1441480 () Bool)

(declare-fun e!812556 () Bool)

(declare-fun e!812555 () Bool)

(assert (=> b!1441480 (= e!812556 e!812555)))

(declare-fun res!973911 () Bool)

(assert (=> b!1441480 (=> (not res!973911) (not e!812555))))

(declare-datatypes ((SeekEntryResult!11543 0))(
  ( (MissingZero!11543 (index!48564 (_ BitVec 32))) (Found!11543 (index!48565 (_ BitVec 32))) (Intermediate!11543 (undefined!12355 Bool) (index!48566 (_ BitVec 32)) (x!130275 (_ BitVec 32))) (Undefined!11543) (MissingVacant!11543 (index!48567 (_ BitVec 32))) )
))
(declare-fun lt!633087 () SeekEntryResult!11543)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97954 (_ BitVec 32)) SeekEntryResult!11543)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1441480 (= res!973911 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47266 a!2862) j!93) mask!2687) (select (arr!47266 a!2862) j!93) a!2862 mask!2687) lt!633087))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1441480 (= lt!633087 (Intermediate!11543 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1441481 () Bool)

(assert (=> b!1441481 (= e!812551 (not (bvsge mask!2687 #b00000000000000000000000000000000)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97954 (_ BitVec 32)) Bool)

(assert (=> b!1441481 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48423 0))(
  ( (Unit!48424) )
))
(declare-fun lt!633086 () Unit!48423)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97954 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48423)

(assert (=> b!1441481 (= lt!633086 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1441482 () Bool)

(assert (=> b!1441482 (= e!812555 e!812551)))

(declare-fun res!973912 () Bool)

(assert (=> b!1441482 (=> (not res!973912) (not e!812551))))

(declare-fun lt!633089 () SeekEntryResult!11543)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1441482 (= res!973912 (= lt!633089 (Intermediate!11543 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!633090 () (_ BitVec 64))

(declare-fun lt!633088 () array!97954)

(assert (=> b!1441482 (= lt!633089 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633090 mask!2687) lt!633090 lt!633088 mask!2687))))

(assert (=> b!1441482 (= lt!633090 (select (store (arr!47266 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1441483 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun e!812553 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97954 (_ BitVec 32)) SeekEntryResult!11543)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97954 (_ BitVec 32)) SeekEntryResult!11543)

(assert (=> b!1441483 (= e!812553 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633090 lt!633088 mask!2687) (seekEntryOrOpen!0 lt!633090 lt!633088 mask!2687)))))

(declare-fun b!1441485 () Bool)

(assert (=> b!1441485 (= e!812553 (= lt!633089 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633090 lt!633088 mask!2687)))))

(declare-fun b!1441486 () Bool)

(declare-fun res!973921 () Bool)

(assert (=> b!1441486 (=> (not res!973921) (not e!812555))))

(assert (=> b!1441486 (= res!973921 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47266 a!2862) j!93) a!2862 mask!2687) lt!633087))))

(declare-fun b!1441487 () Bool)

(declare-fun res!973920 () Bool)

(assert (=> b!1441487 (=> (not res!973920) (not e!812551))))

(assert (=> b!1441487 (= res!973920 e!812553)))

(declare-fun c!133297 () Bool)

(assert (=> b!1441487 (= c!133297 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1441488 () Bool)

(declare-fun res!973918 () Bool)

(assert (=> b!1441488 (=> (not res!973918) (not e!812552))))

(assert (=> b!1441488 (= res!973918 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1441489 () Bool)

(assert (=> b!1441489 (= e!812552 e!812556)))

(declare-fun res!973915 () Bool)

(assert (=> b!1441489 (=> (not res!973915) (not e!812556))))

(assert (=> b!1441489 (= res!973915 (= (select (store (arr!47266 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1441489 (= lt!633088 (array!97955 (store (arr!47266 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47818 a!2862)))))

(declare-fun b!1441484 () Bool)

(declare-fun res!973916 () Bool)

(assert (=> b!1441484 (=> (not res!973916) (not e!812552))))

(assert (=> b!1441484 (= res!973916 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47818 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47818 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47818 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!973913 () Bool)

(assert (=> start!124528 (=> (not res!973913) (not e!812552))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124528 (= res!973913 (validMask!0 mask!2687))))

(assert (=> start!124528 e!812552))

(assert (=> start!124528 true))

(declare-fun array_inv!36499 (array!97954) Bool)

(assert (=> start!124528 (array_inv!36499 a!2862)))

(declare-fun b!1441490 () Bool)

(declare-fun res!973917 () Bool)

(assert (=> b!1441490 (=> (not res!973917) (not e!812552))))

(assert (=> b!1441490 (= res!973917 (validKeyInArray!0 (select (arr!47266 a!2862) j!93)))))

(declare-fun b!1441491 () Bool)

(declare-fun res!973909 () Bool)

(assert (=> b!1441491 (=> (not res!973909) (not e!812552))))

(declare-datatypes ((List!33845 0))(
  ( (Nil!33842) (Cons!33841 (h!35191 (_ BitVec 64)) (t!48531 List!33845)) )
))
(declare-fun arrayNoDuplicates!0 (array!97954 (_ BitVec 32) List!33845) Bool)

(assert (=> b!1441491 (= res!973909 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33842))))

(assert (= (and start!124528 res!973913) b!1441477))

(assert (= (and b!1441477 res!973919) b!1441479))

(assert (= (and b!1441479 res!973910) b!1441490))

(assert (= (and b!1441490 res!973917) b!1441488))

(assert (= (and b!1441488 res!973918) b!1441491))

(assert (= (and b!1441491 res!973909) b!1441484))

(assert (= (and b!1441484 res!973916) b!1441489))

(assert (= (and b!1441489 res!973915) b!1441480))

(assert (= (and b!1441480 res!973911) b!1441486))

(assert (= (and b!1441486 res!973921) b!1441482))

(assert (= (and b!1441482 res!973912) b!1441487))

(assert (= (and b!1441487 c!133297) b!1441485))

(assert (= (and b!1441487 (not c!133297)) b!1441483))

(assert (= (and b!1441487 res!973920) b!1441478))

(assert (= (and b!1441478 res!973914) b!1441481))

(declare-fun m!1330203 () Bool)

(assert (=> b!1441479 m!1330203))

(assert (=> b!1441479 m!1330203))

(declare-fun m!1330205 () Bool)

(assert (=> b!1441479 m!1330205))

(declare-fun m!1330207 () Bool)

(assert (=> b!1441486 m!1330207))

(assert (=> b!1441486 m!1330207))

(declare-fun m!1330209 () Bool)

(assert (=> b!1441486 m!1330209))

(declare-fun m!1330211 () Bool)

(assert (=> b!1441481 m!1330211))

(declare-fun m!1330213 () Bool)

(assert (=> b!1441481 m!1330213))

(declare-fun m!1330215 () Bool)

(assert (=> b!1441485 m!1330215))

(declare-fun m!1330217 () Bool)

(assert (=> b!1441491 m!1330217))

(declare-fun m!1330219 () Bool)

(assert (=> start!124528 m!1330219))

(declare-fun m!1330221 () Bool)

(assert (=> start!124528 m!1330221))

(declare-fun m!1330223 () Bool)

(assert (=> b!1441483 m!1330223))

(declare-fun m!1330225 () Bool)

(assert (=> b!1441483 m!1330225))

(declare-fun m!1330227 () Bool)

(assert (=> b!1441482 m!1330227))

(assert (=> b!1441482 m!1330227))

(declare-fun m!1330229 () Bool)

(assert (=> b!1441482 m!1330229))

(declare-fun m!1330231 () Bool)

(assert (=> b!1441482 m!1330231))

(declare-fun m!1330233 () Bool)

(assert (=> b!1441482 m!1330233))

(assert (=> b!1441490 m!1330207))

(assert (=> b!1441490 m!1330207))

(declare-fun m!1330235 () Bool)

(assert (=> b!1441490 m!1330235))

(assert (=> b!1441480 m!1330207))

(assert (=> b!1441480 m!1330207))

(declare-fun m!1330237 () Bool)

(assert (=> b!1441480 m!1330237))

(assert (=> b!1441480 m!1330237))

(assert (=> b!1441480 m!1330207))

(declare-fun m!1330239 () Bool)

(assert (=> b!1441480 m!1330239))

(assert (=> b!1441489 m!1330231))

(declare-fun m!1330241 () Bool)

(assert (=> b!1441489 m!1330241))

(declare-fun m!1330243 () Bool)

(assert (=> b!1441488 m!1330243))

(check-sat (not b!1441483) (not b!1441480) (not start!124528) (not b!1441490) (not b!1441482) (not b!1441481) (not b!1441488) (not b!1441491) (not b!1441486) (not b!1441479) (not b!1441485))
(check-sat)
