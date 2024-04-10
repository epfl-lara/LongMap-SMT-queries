; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124160 () Bool)

(assert start!124160)

(declare-fun b!1437340 () Bool)

(declare-fun e!810916 () Bool)

(declare-fun e!810917 () Bool)

(assert (=> b!1437340 (= e!810916 e!810917)))

(declare-fun res!970227 () Bool)

(assert (=> b!1437340 (=> (not res!970227) (not e!810917))))

(declare-datatypes ((SeekEntryResult!11428 0))(
  ( (MissingZero!11428 (index!48104 (_ BitVec 32))) (Found!11428 (index!48105 (_ BitVec 32))) (Intermediate!11428 (undefined!12240 Bool) (index!48106 (_ BitVec 32)) (x!129829 (_ BitVec 32))) (Undefined!11428) (MissingVacant!11428 (index!48107 (_ BitVec 32))) )
))
(declare-fun lt!632265 () SeekEntryResult!11428)

(declare-datatypes ((array!97764 0))(
  ( (array!97765 (arr!47176 (Array (_ BitVec 32) (_ BitVec 64))) (size!47726 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97764)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97764 (_ BitVec 32)) SeekEntryResult!11428)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1437340 (= res!970227 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47176 a!2862) j!93) mask!2687) (select (arr!47176 a!2862) j!93) a!2862 mask!2687) lt!632265))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1437340 (= lt!632265 (Intermediate!11428 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1437341 () Bool)

(declare-fun res!970224 () Bool)

(assert (=> b!1437341 (=> (not res!970224) (not e!810916))))

(declare-datatypes ((List!33677 0))(
  ( (Nil!33674) (Cons!33673 (h!35011 (_ BitVec 64)) (t!48371 List!33677)) )
))
(declare-fun arrayNoDuplicates!0 (array!97764 (_ BitVec 32) List!33677) Bool)

(assert (=> b!1437341 (= res!970224 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33674))))

(declare-fun b!1437342 () Bool)

(declare-fun res!970230 () Bool)

(assert (=> b!1437342 (=> (not res!970230) (not e!810916))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1437342 (= res!970230 (validKeyInArray!0 (select (arr!47176 a!2862) j!93)))))

(declare-fun b!1437343 () Bool)

(declare-fun res!970228 () Bool)

(assert (=> b!1437343 (=> (not res!970228) (not e!810917))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1437343 (= res!970228 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47176 a!2862) j!93) a!2862 mask!2687) lt!632265))))

(declare-fun b!1437344 () Bool)

(assert (=> b!1437344 (= e!810917 (and (bvsge mask!2687 #b00000000000000000000000000000000) (bvsgt mask!2687 #b00111111111111111111111111111111)))))

(declare-fun res!970226 () Bool)

(assert (=> start!124160 (=> (not res!970226) (not e!810916))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124160 (= res!970226 (validMask!0 mask!2687))))

(assert (=> start!124160 e!810916))

(assert (=> start!124160 true))

(declare-fun array_inv!36204 (array!97764) Bool)

(assert (=> start!124160 (array_inv!36204 a!2862)))

(declare-fun b!1437345 () Bool)

(declare-fun res!970225 () Bool)

(assert (=> b!1437345 (=> (not res!970225) (not e!810916))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1437345 (= res!970225 (and (= (size!47726 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47726 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47726 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1437346 () Bool)

(declare-fun res!970223 () Bool)

(assert (=> b!1437346 (=> (not res!970223) (not e!810916))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97764 (_ BitVec 32)) Bool)

(assert (=> b!1437346 (= res!970223 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1437347 () Bool)

(declare-fun res!970231 () Bool)

(assert (=> b!1437347 (=> (not res!970231) (not e!810916))))

(assert (=> b!1437347 (= res!970231 (validKeyInArray!0 (select (arr!47176 a!2862) i!1006)))))

(declare-fun b!1437348 () Bool)

(declare-fun res!970229 () Bool)

(assert (=> b!1437348 (=> (not res!970229) (not e!810916))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1437348 (= res!970229 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47726 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47726 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47726 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47176 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!124160 res!970226) b!1437345))

(assert (= (and b!1437345 res!970225) b!1437347))

(assert (= (and b!1437347 res!970231) b!1437342))

(assert (= (and b!1437342 res!970230) b!1437346))

(assert (= (and b!1437346 res!970223) b!1437341))

(assert (= (and b!1437341 res!970224) b!1437348))

(assert (= (and b!1437348 res!970229) b!1437340))

(assert (= (and b!1437340 res!970227) b!1437343))

(assert (= (and b!1437343 res!970228) b!1437344))

(declare-fun m!1326659 () Bool)

(assert (=> b!1437346 m!1326659))

(declare-fun m!1326661 () Bool)

(assert (=> b!1437340 m!1326661))

(assert (=> b!1437340 m!1326661))

(declare-fun m!1326663 () Bool)

(assert (=> b!1437340 m!1326663))

(assert (=> b!1437340 m!1326663))

(assert (=> b!1437340 m!1326661))

(declare-fun m!1326665 () Bool)

(assert (=> b!1437340 m!1326665))

(assert (=> b!1437342 m!1326661))

(assert (=> b!1437342 m!1326661))

(declare-fun m!1326667 () Bool)

(assert (=> b!1437342 m!1326667))

(declare-fun m!1326669 () Bool)

(assert (=> start!124160 m!1326669))

(declare-fun m!1326671 () Bool)

(assert (=> start!124160 m!1326671))

(declare-fun m!1326673 () Bool)

(assert (=> b!1437341 m!1326673))

(assert (=> b!1437343 m!1326661))

(assert (=> b!1437343 m!1326661))

(declare-fun m!1326675 () Bool)

(assert (=> b!1437343 m!1326675))

(declare-fun m!1326677 () Bool)

(assert (=> b!1437348 m!1326677))

(declare-fun m!1326679 () Bool)

(assert (=> b!1437348 m!1326679))

(declare-fun m!1326681 () Bool)

(assert (=> b!1437347 m!1326681))

(assert (=> b!1437347 m!1326681))

(declare-fun m!1326683 () Bool)

(assert (=> b!1437347 m!1326683))

(push 1)

(assert (not start!124160))

(assert (not b!1437347))

(assert (not b!1437346))

(assert (not b!1437341))

(assert (not b!1437342))

(assert (not b!1437340))

(assert (not b!1437343))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1437415 () Bool)

(declare-fun lt!632293 () SeekEntryResult!11428)

(assert (=> b!1437415 (and (bvsge (index!48106 lt!632293) #b00000000000000000000000000000000) (bvslt (index!48106 lt!632293) (size!47726 a!2862)))))

(declare-fun e!810960 () Bool)

(assert (=> b!1437415 (= e!810960 (= (select (arr!47176 a!2862) (index!48106 lt!632293)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1437416 () Bool)

(declare-fun e!810959 () Bool)

(declare-fun e!810957 () Bool)

(assert (=> b!1437416 (= e!810959 e!810957)))

(declare-fun res!970257 () Bool)

(assert (=> b!1437416 (= res!970257 (and (is-Intermediate!11428 lt!632293) (not (undefined!12240 lt!632293)) (bvslt (x!129829 lt!632293) #b01111111111111111111111111111110) (bvsge (x!129829 lt!632293) #b00000000000000000000000000000000) (bvsge (x!129829 lt!632293) x!665)))))

(assert (=> b!1437416 (=> (not res!970257) (not e!810957))))

(declare-fun b!1437417 () Bool)

(assert (=> b!1437417 (= e!810959 (bvsge (x!129829 lt!632293) #b01111111111111111111111111111110))))

(declare-fun b!1437418 () Bool)

(assert (=> b!1437418 (and (bvsge (index!48106 lt!632293) #b00000000000000000000000000000000) (bvslt (index!48106 lt!632293) (size!47726 a!2862)))))

(declare-fun res!970259 () Bool)

(assert (=> b!1437418 (= res!970259 (= (select (arr!47176 a!2862) (index!48106 lt!632293)) (select (arr!47176 a!2862) j!93)))))

(assert (=> b!1437418 (=> res!970259 e!810960)))

(assert (=> b!1437418 (= e!810957 e!810960)))

(declare-fun b!1437419 () Bool)

(declare-fun e!810958 () SeekEntryResult!11428)

(declare-fun e!810961 () SeekEntryResult!11428)

(assert (=> b!1437419 (= e!810958 e!810961)))

(declare-fun c!133086 () Bool)

(declare-fun lt!632294 () (_ BitVec 64))

(assert (=> b!1437419 (= c!133086 (or (= lt!632294 (select (arr!47176 a!2862) j!93)) (= (bvadd lt!632294 lt!632294) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1437420 () Bool)

(assert (=> b!1437420 (= e!810958 (Intermediate!11428 true index!646 x!665))))

(declare-fun b!1437421 () Bool)

(assert (=> b!1437421 (and (bvsge (index!48106 lt!632293) #b00000000000000000000000000000000) (bvslt (index!48106 lt!632293) (size!47726 a!2862)))))

(declare-fun res!970258 () Bool)

(assert (=> b!1437421 (= res!970258 (= (select (arr!47176 a!2862) (index!48106 lt!632293)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1437421 (=> res!970258 e!810960)))

(declare-fun b!1437422 () Bool)

(assert (=> b!1437422 (= e!810961 (Intermediate!11428 false index!646 x!665))))

(declare-fun b!1437423 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1437423 (= e!810961 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) (select (arr!47176 a!2862) j!93) a!2862 mask!2687))))

(declare-fun d!154645 () Bool)

(assert (=> d!154645 e!810959))

(declare-fun c!133085 () Bool)

(assert (=> d!154645 (= c!133085 (and (is-Intermediate!11428 lt!632293) (undefined!12240 lt!632293)))))

(assert (=> d!154645 (= lt!632293 e!810958)))

(declare-fun c!133084 () Bool)

(assert (=> d!154645 (= c!133084 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!154645 (= lt!632294 (select (arr!47176 a!2862) index!646))))

(assert (=> d!154645 (validMask!0 mask!2687)))

(assert (=> d!154645 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47176 a!2862) j!93) a!2862 mask!2687) lt!632293)))

(assert (= (and d!154645 c!133084) b!1437420))

(assert (= (and d!154645 (not c!133084)) b!1437419))

(assert (= (and b!1437419 c!133086) b!1437422))

(assert (= (and b!1437419 (not c!133086)) b!1437423))

(assert (= (and d!154645 c!133085) b!1437417))

(assert (= (and d!154645 (not c!133085)) b!1437416))

(assert (= (and b!1437416 res!970257) b!1437418))

(assert (= (and b!1437418 (not res!970259)) b!1437421))

(assert (= (and b!1437421 (not res!970258)) b!1437415))

(declare-fun m!1326713 () Bool)

(assert (=> b!1437415 m!1326713))

(declare-fun m!1326715 () Bool)

(assert (=> b!1437423 m!1326715))

(assert (=> b!1437423 m!1326715))

(assert (=> b!1437423 m!1326661))

(declare-fun m!1326717 () Bool)

(assert (=> b!1437423 m!1326717))

(assert (=> b!1437421 m!1326713))

(declare-fun m!1326719 () Bool)

(assert (=> d!154645 m!1326719))

(assert (=> d!154645 m!1326669))

(assert (=> b!1437418 m!1326713))

(assert (=> b!1437343 d!154645))

(declare-fun b!1437432 () Bool)

(declare-fun lt!632299 () SeekEntryResult!11428)

(assert (=> b!1437432 (and (bvsge (index!48106 lt!632299) #b00000000000000000000000000000000) (bvslt (index!48106 lt!632299) (size!47726 a!2862)))))

(declare-fun e!810969 () Bool)

(assert (=> b!1437432 (= e!810969 (= (select (arr!47176 a!2862) (index!48106 lt!632299)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1437433 () Bool)

(declare-fun e!810968 () Bool)

(declare-fun e!810966 () Bool)

(assert (=> b!1437433 (= e!810968 e!810966)))

(declare-fun res!970260 () Bool)

(assert (=> b!1437433 (= res!970260 (and (is-Intermediate!11428 lt!632299) (not (undefined!12240 lt!632299)) (bvslt (x!129829 lt!632299) #b01111111111111111111111111111110) (bvsge (x!129829 lt!632299) #b00000000000000000000000000000000) (bvsge (x!129829 lt!632299) #b00000000000000000000000000000000)))))

(assert (=> b!1437433 (=> (not res!970260) (not e!810966))))

(declare-fun b!1437434 () Bool)

(assert (=> b!1437434 (= e!810968 (bvsge (x!129829 lt!632299) #b01111111111111111111111111111110))))

(declare-fun b!1437435 () Bool)

(assert (=> b!1437435 (and (bvsge (index!48106 lt!632299) #b00000000000000000000000000000000) (bvslt (index!48106 lt!632299) (size!47726 a!2862)))))

(declare-fun res!970262 () Bool)

(assert (=> b!1437435 (= res!970262 (= (select (arr!47176 a!2862) (index!48106 lt!632299)) (select (arr!47176 a!2862) j!93)))))

(assert (=> b!1437435 (=> res!970262 e!810969)))

(assert (=> b!1437435 (= e!810966 e!810969)))

(declare-fun b!1437436 () Bool)

(declare-fun e!810967 () SeekEntryResult!11428)

(declare-fun e!810970 () SeekEntryResult!11428)

(assert (=> b!1437436 (= e!810967 e!810970)))

(declare-fun lt!632300 () (_ BitVec 64))

(declare-fun c!133093 () Bool)

(assert (=> b!1437436 (= c!133093 (or (= lt!632300 (select (arr!47176 a!2862) j!93)) (= (bvadd lt!632300 lt!632300) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1437437 () Bool)

(assert (=> b!1437437 (= e!810967 (Intermediate!11428 true (toIndex!0 (select (arr!47176 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1437438 () Bool)

(assert (=> b!1437438 (and (bvsge (index!48106 lt!632299) #b00000000000000000000000000000000) (bvslt (index!48106 lt!632299) (size!47726 a!2862)))))

(declare-fun res!970261 () Bool)

(assert (=> b!1437438 (= res!970261 (= (select (arr!47176 a!2862) (index!48106 lt!632299)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1437438 (=> res!970261 e!810969)))

(declare-fun b!1437439 () Bool)

(assert (=> b!1437439 (= e!810970 (Intermediate!11428 false (toIndex!0 (select (arr!47176 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1437440 () Bool)

(assert (=> b!1437440 (= e!810970 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47176 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (select (arr!47176 a!2862) j!93) a!2862 mask!2687))))

(declare-fun d!154659 () Bool)

(assert (=> d!154659 e!810968))

(declare-fun c!133092 () Bool)

(assert (=> d!154659 (= c!133092 (and (is-Intermediate!11428 lt!632299) (undefined!12240 lt!632299)))))

(assert (=> d!154659 (= lt!632299 e!810967)))

(declare-fun c!133091 () Bool)

(assert (=> d!154659 (= c!133091 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!154659 (= lt!632300 (select (arr!47176 a!2862) (toIndex!0 (select (arr!47176 a!2862) j!93) mask!2687)))))

(assert (=> d!154659 (validMask!0 mask!2687)))

(assert (=> d!154659 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47176 a!2862) j!93) mask!2687) (select (arr!47176 a!2862) j!93) a!2862 mask!2687) lt!632299)))

(assert (= (and d!154659 c!133091) b!1437437))

(assert (= (and d!154659 (not c!133091)) b!1437436))

(assert (= (and b!1437436 c!133093) b!1437439))

(assert (= (and b!1437436 (not c!133093)) b!1437440))

(assert (= (and d!154659 c!133092) b!1437434))

(assert (= (and d!154659 (not c!133092)) b!1437433))

(assert (= (and b!1437433 res!970260) b!1437435))

(assert (= (and b!1437435 (not res!970262)) b!1437438))

(assert (= (and b!1437438 (not res!970261)) b!1437432))

(declare-fun m!1326721 () Bool)

(assert (=> b!1437432 m!1326721))

(assert (=> b!1437440 m!1326663))

(declare-fun m!1326723 () Bool)

(assert (=> b!1437440 m!1326723))

(assert (=> b!1437440 m!1326723))

(assert (=> b!1437440 m!1326661))

(declare-fun m!1326725 () Bool)

(assert (=> b!1437440 m!1326725))

(assert (=> b!1437438 m!1326721))

(assert (=> d!154659 m!1326663))

(declare-fun m!1326727 () Bool)

(assert (=> d!154659 m!1326727))

(assert (=> d!154659 m!1326669))

(assert (=> b!1437435 m!1326721))

(assert (=> b!1437340 d!154659))

(declare-fun d!154661 () Bool)

(declare-fun lt!632308 () (_ BitVec 32))

(declare-fun lt!632307 () (_ BitVec 32))

(assert (=> d!154661 (= lt!632308 (bvmul (bvxor lt!632307 (bvlshr lt!632307 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!154661 (= lt!632307 ((_ extract 31 0) (bvand (bvxor (select (arr!47176 a!2862) j!93) (bvlshr (select (arr!47176 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!154661 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!970269 (let ((h!35013 ((_ extract 31 0) (bvand (bvxor (select (arr!47176 a!2862) j!93) (bvlshr (select (arr!47176 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129834 (bvmul (bvxor h!35013 (bvlshr h!35013 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129834 (bvlshr x!129834 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!970269 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!970269 #b00000000000000000000000000000000))))))

