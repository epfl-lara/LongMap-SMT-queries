; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126238 () Bool)

(assert start!126238)

(declare-fun b!1480118 () Bool)

(declare-fun res!1006063 () Bool)

(declare-fun e!830169 () Bool)

(assert (=> b!1480118 (=> (not res!1006063) (not e!830169))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1480118 (= res!1006063 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1480119 () Bool)

(declare-fun res!1006057 () Bool)

(declare-fun e!830167 () Bool)

(assert (=> b!1480119 (=> (not res!1006057) (not e!830167))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((array!99322 0))(
  ( (array!99323 (arr!47941 (Array (_ BitVec 32) (_ BitVec 64))) (size!48493 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99322)

(assert (=> b!1480119 (= res!1006057 (and (= (size!48493 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48493 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48493 a!2862)) (not (= i!1006 j!93))))))

(declare-fun e!830172 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!646136 () array!99322)

(declare-fun lt!646137 () (_ BitVec 64))

(declare-fun b!1480120 () Bool)

(declare-datatypes ((SeekEntryResult!12206 0))(
  ( (MissingZero!12206 (index!51216 (_ BitVec 32))) (Found!12206 (index!51217 (_ BitVec 32))) (Intermediate!12206 (undefined!13018 Bool) (index!51218 (_ BitVec 32)) (x!132792 (_ BitVec 32))) (Undefined!12206) (MissingVacant!12206 (index!51219 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99322 (_ BitVec 32)) SeekEntryResult!12206)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99322 (_ BitVec 32)) SeekEntryResult!12206)

(assert (=> b!1480120 (= e!830172 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646137 lt!646136 mask!2687) (seekEntryOrOpen!0 lt!646137 lt!646136 mask!2687)))))

(declare-fun b!1480121 () Bool)

(declare-fun res!1006058 () Bool)

(declare-fun e!830170 () Bool)

(assert (=> b!1480121 (=> (not res!1006058) (not e!830170))))

(declare-fun lt!646138 () SeekEntryResult!12206)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99322 (_ BitVec 32)) SeekEntryResult!12206)

(assert (=> b!1480121 (= res!1006058 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47941 a!2862) j!93) a!2862 mask!2687) lt!646138))))

(declare-fun b!1480122 () Bool)

(declare-fun res!1006061 () Bool)

(assert (=> b!1480122 (=> (not res!1006061) (not e!830167))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1480122 (= res!1006061 (validKeyInArray!0 (select (arr!47941 a!2862) j!93)))))

(declare-fun b!1480123 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1480123 (= e!830169 (not (or (and (= (select (arr!47941 a!2862) index!646) (select (store (arr!47941 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47941 a!2862) index!646) (select (arr!47941 a!2862) j!93))) (= (select (arr!47941 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (= index!646 intermediateAfterIndex!19))))))

(declare-fun e!830171 () Bool)

(assert (=> b!1480123 e!830171))

(declare-fun res!1006052 () Bool)

(assert (=> b!1480123 (=> (not res!1006052) (not e!830171))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99322 (_ BitVec 32)) Bool)

(assert (=> b!1480123 (= res!1006052 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49593 0))(
  ( (Unit!49594) )
))
(declare-fun lt!646140 () Unit!49593)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99322 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49593)

(assert (=> b!1480123 (= lt!646140 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1480124 () Bool)

(declare-fun res!1006062 () Bool)

(assert (=> b!1480124 (=> (not res!1006062) (not e!830167))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1480124 (= res!1006062 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48493 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48493 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48493 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1480125 () Bool)

(declare-fun e!830168 () Bool)

(assert (=> b!1480125 (= e!830167 e!830168)))

(declare-fun res!1006053 () Bool)

(assert (=> b!1480125 (=> (not res!1006053) (not e!830168))))

(assert (=> b!1480125 (= res!1006053 (= (select (store (arr!47941 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1480125 (= lt!646136 (array!99323 (store (arr!47941 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48493 a!2862)))))

(declare-fun b!1480126 () Bool)

(declare-fun res!1006064 () Bool)

(assert (=> b!1480126 (=> (not res!1006064) (not e!830171))))

(assert (=> b!1480126 (= res!1006064 (= (seekEntryOrOpen!0 (select (arr!47941 a!2862) j!93) a!2862 mask!2687) (Found!12206 j!93)))))

(declare-fun res!1006056 () Bool)

(assert (=> start!126238 (=> (not res!1006056) (not e!830167))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126238 (= res!1006056 (validMask!0 mask!2687))))

(assert (=> start!126238 e!830167))

(assert (=> start!126238 true))

(declare-fun array_inv!37174 (array!99322) Bool)

(assert (=> start!126238 (array_inv!37174 a!2862)))

(declare-fun b!1480127 () Bool)

(assert (=> b!1480127 (= e!830170 e!830169)))

(declare-fun res!1006060 () Bool)

(assert (=> b!1480127 (=> (not res!1006060) (not e!830169))))

(declare-fun lt!646139 () SeekEntryResult!12206)

(assert (=> b!1480127 (= res!1006060 (= lt!646139 (Intermediate!12206 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1480127 (= lt!646139 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!646137 mask!2687) lt!646137 lt!646136 mask!2687))))

(assert (=> b!1480127 (= lt!646137 (select (store (arr!47941 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1480128 () Bool)

(assert (=> b!1480128 (= e!830168 e!830170)))

(declare-fun res!1006055 () Bool)

(assert (=> b!1480128 (=> (not res!1006055) (not e!830170))))

(assert (=> b!1480128 (= res!1006055 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47941 a!2862) j!93) mask!2687) (select (arr!47941 a!2862) j!93) a!2862 mask!2687) lt!646138))))

(assert (=> b!1480128 (= lt!646138 (Intermediate!12206 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1480129 () Bool)

(declare-fun res!1006066 () Bool)

(assert (=> b!1480129 (=> (not res!1006066) (not e!830167))))

(declare-datatypes ((List!34520 0))(
  ( (Nil!34517) (Cons!34516 (h!35884 (_ BitVec 64)) (t!49206 List!34520)) )
))
(declare-fun arrayNoDuplicates!0 (array!99322 (_ BitVec 32) List!34520) Bool)

(assert (=> b!1480129 (= res!1006066 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34517))))

(declare-fun b!1480130 () Bool)

(assert (=> b!1480130 (= e!830172 (= lt!646139 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!646137 lt!646136 mask!2687)))))

(declare-fun b!1480131 () Bool)

(declare-fun res!1006054 () Bool)

(assert (=> b!1480131 (=> (not res!1006054) (not e!830167))))

(assert (=> b!1480131 (= res!1006054 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1480132 () Bool)

(declare-fun res!1006065 () Bool)

(assert (=> b!1480132 (=> (not res!1006065) (not e!830167))))

(assert (=> b!1480132 (= res!1006065 (validKeyInArray!0 (select (arr!47941 a!2862) i!1006)))))

(declare-fun b!1480133 () Bool)

(declare-fun res!1006059 () Bool)

(assert (=> b!1480133 (=> (not res!1006059) (not e!830169))))

(assert (=> b!1480133 (= res!1006059 e!830172)))

(declare-fun c!136555 () Bool)

(assert (=> b!1480133 (= c!136555 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1480134 () Bool)

(assert (=> b!1480134 (= e!830171 (or (= (select (arr!47941 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47941 a!2862) intermediateBeforeIndex!19) (select (arr!47941 a!2862) j!93))))))

(assert (= (and start!126238 res!1006056) b!1480119))

(assert (= (and b!1480119 res!1006057) b!1480132))

(assert (= (and b!1480132 res!1006065) b!1480122))

(assert (= (and b!1480122 res!1006061) b!1480131))

(assert (= (and b!1480131 res!1006054) b!1480129))

(assert (= (and b!1480129 res!1006066) b!1480124))

(assert (= (and b!1480124 res!1006062) b!1480125))

(assert (= (and b!1480125 res!1006053) b!1480128))

(assert (= (and b!1480128 res!1006055) b!1480121))

(assert (= (and b!1480121 res!1006058) b!1480127))

(assert (= (and b!1480127 res!1006060) b!1480133))

(assert (= (and b!1480133 c!136555) b!1480130))

(assert (= (and b!1480133 (not c!136555)) b!1480120))

(assert (= (and b!1480133 res!1006059) b!1480118))

(assert (= (and b!1480118 res!1006063) b!1480123))

(assert (= (and b!1480123 res!1006052) b!1480126))

(assert (= (and b!1480126 res!1006064) b!1480134))

(declare-fun m!1365453 () Bool)

(assert (=> b!1480127 m!1365453))

(assert (=> b!1480127 m!1365453))

(declare-fun m!1365455 () Bool)

(assert (=> b!1480127 m!1365455))

(declare-fun m!1365457 () Bool)

(assert (=> b!1480127 m!1365457))

(declare-fun m!1365459 () Bool)

(assert (=> b!1480127 m!1365459))

(declare-fun m!1365461 () Bool)

(assert (=> b!1480134 m!1365461))

(declare-fun m!1365463 () Bool)

(assert (=> b!1480134 m!1365463))

(declare-fun m!1365465 () Bool)

(assert (=> b!1480123 m!1365465))

(assert (=> b!1480123 m!1365457))

(declare-fun m!1365467 () Bool)

(assert (=> b!1480123 m!1365467))

(declare-fun m!1365469 () Bool)

(assert (=> b!1480123 m!1365469))

(declare-fun m!1365471 () Bool)

(assert (=> b!1480123 m!1365471))

(assert (=> b!1480123 m!1365463))

(declare-fun m!1365473 () Bool)

(assert (=> b!1480130 m!1365473))

(declare-fun m!1365475 () Bool)

(assert (=> b!1480131 m!1365475))

(declare-fun m!1365477 () Bool)

(assert (=> b!1480132 m!1365477))

(assert (=> b!1480132 m!1365477))

(declare-fun m!1365479 () Bool)

(assert (=> b!1480132 m!1365479))

(assert (=> b!1480125 m!1365457))

(declare-fun m!1365481 () Bool)

(assert (=> b!1480125 m!1365481))

(declare-fun m!1365483 () Bool)

(assert (=> b!1480120 m!1365483))

(declare-fun m!1365485 () Bool)

(assert (=> b!1480120 m!1365485))

(assert (=> b!1480121 m!1365463))

(assert (=> b!1480121 m!1365463))

(declare-fun m!1365487 () Bool)

(assert (=> b!1480121 m!1365487))

(declare-fun m!1365489 () Bool)

(assert (=> b!1480129 m!1365489))

(assert (=> b!1480126 m!1365463))

(assert (=> b!1480126 m!1365463))

(declare-fun m!1365491 () Bool)

(assert (=> b!1480126 m!1365491))

(assert (=> b!1480122 m!1365463))

(assert (=> b!1480122 m!1365463))

(declare-fun m!1365493 () Bool)

(assert (=> b!1480122 m!1365493))

(assert (=> b!1480128 m!1365463))

(assert (=> b!1480128 m!1365463))

(declare-fun m!1365495 () Bool)

(assert (=> b!1480128 m!1365495))

(assert (=> b!1480128 m!1365495))

(assert (=> b!1480128 m!1365463))

(declare-fun m!1365497 () Bool)

(assert (=> b!1480128 m!1365497))

(declare-fun m!1365499 () Bool)

(assert (=> start!126238 m!1365499))

(declare-fun m!1365501 () Bool)

(assert (=> start!126238 m!1365501))

(check-sat (not b!1480131) (not b!1480127) (not b!1480130) (not start!126238) (not b!1480121) (not b!1480126) (not b!1480132) (not b!1480122) (not b!1480129) (not b!1480120) (not b!1480123) (not b!1480128))
(check-sat)
(get-model)

(declare-fun b!1480255 () Bool)

(declare-fun e!830225 () SeekEntryResult!12206)

(declare-fun e!830228 () SeekEntryResult!12206)

(assert (=> b!1480255 (= e!830225 e!830228)))

(declare-fun lt!646176 () (_ BitVec 64))

(declare-fun c!136569 () Bool)

(assert (=> b!1480255 (= c!136569 (or (= lt!646176 (select (arr!47941 a!2862) j!93)) (= (bvadd lt!646176 lt!646176) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1480256 () Bool)

(declare-fun lt!646175 () SeekEntryResult!12206)

(assert (=> b!1480256 (and (bvsge (index!51218 lt!646175) #b00000000000000000000000000000000) (bvslt (index!51218 lt!646175) (size!48493 a!2862)))))

(declare-fun e!830229 () Bool)

(assert (=> b!1480256 (= e!830229 (= (select (arr!47941 a!2862) (index!51218 lt!646175)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1480257 () Bool)

(assert (=> b!1480257 (= e!830225 (Intermediate!12206 true (toIndex!0 (select (arr!47941 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1480258 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1480258 (= e!830228 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47941 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (select (arr!47941 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1480259 () Bool)

(declare-fun e!830227 () Bool)

(assert (=> b!1480259 (= e!830227 (bvsge (x!132792 lt!646175) #b01111111111111111111111111111110))))

(declare-fun b!1480260 () Bool)

(assert (=> b!1480260 (and (bvsge (index!51218 lt!646175) #b00000000000000000000000000000000) (bvslt (index!51218 lt!646175) (size!48493 a!2862)))))

(declare-fun res!1006165 () Bool)

(assert (=> b!1480260 (= res!1006165 (= (select (arr!47941 a!2862) (index!51218 lt!646175)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1480260 (=> res!1006165 e!830229)))

(declare-fun b!1480261 () Bool)

(assert (=> b!1480261 (= e!830228 (Intermediate!12206 false (toIndex!0 (select (arr!47941 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1480262 () Bool)

(assert (=> b!1480262 (and (bvsge (index!51218 lt!646175) #b00000000000000000000000000000000) (bvslt (index!51218 lt!646175) (size!48493 a!2862)))))

(declare-fun res!1006163 () Bool)

(assert (=> b!1480262 (= res!1006163 (= (select (arr!47941 a!2862) (index!51218 lt!646175)) (select (arr!47941 a!2862) j!93)))))

(assert (=> b!1480262 (=> res!1006163 e!830229)))

(declare-fun e!830226 () Bool)

(assert (=> b!1480262 (= e!830226 e!830229)))

(declare-fun b!1480263 () Bool)

(assert (=> b!1480263 (= e!830227 e!830226)))

(declare-fun res!1006164 () Bool)

(get-info :version)

(assert (=> b!1480263 (= res!1006164 (and ((_ is Intermediate!12206) lt!646175) (not (undefined!13018 lt!646175)) (bvslt (x!132792 lt!646175) #b01111111111111111111111111111110) (bvsge (x!132792 lt!646175) #b00000000000000000000000000000000) (bvsge (x!132792 lt!646175) #b00000000000000000000000000000000)))))

(assert (=> b!1480263 (=> (not res!1006164) (not e!830226))))

(declare-fun d!155859 () Bool)

(assert (=> d!155859 e!830227))

(declare-fun c!136568 () Bool)

(assert (=> d!155859 (= c!136568 (and ((_ is Intermediate!12206) lt!646175) (undefined!13018 lt!646175)))))

(assert (=> d!155859 (= lt!646175 e!830225)))

(declare-fun c!136570 () Bool)

(assert (=> d!155859 (= c!136570 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!155859 (= lt!646176 (select (arr!47941 a!2862) (toIndex!0 (select (arr!47941 a!2862) j!93) mask!2687)))))

(assert (=> d!155859 (validMask!0 mask!2687)))

(assert (=> d!155859 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47941 a!2862) j!93) mask!2687) (select (arr!47941 a!2862) j!93) a!2862 mask!2687) lt!646175)))

(assert (= (and d!155859 c!136570) b!1480257))

(assert (= (and d!155859 (not c!136570)) b!1480255))

(assert (= (and b!1480255 c!136569) b!1480261))

(assert (= (and b!1480255 (not c!136569)) b!1480258))

(assert (= (and d!155859 c!136568) b!1480259))

(assert (= (and d!155859 (not c!136568)) b!1480263))

(assert (= (and b!1480263 res!1006164) b!1480262))

(assert (= (and b!1480262 (not res!1006163)) b!1480260))

(assert (= (and b!1480260 (not res!1006165)) b!1480256))

(declare-fun m!1365603 () Bool)

(assert (=> b!1480262 m!1365603))

(assert (=> b!1480260 m!1365603))

(assert (=> b!1480258 m!1365495))

(declare-fun m!1365605 () Bool)

(assert (=> b!1480258 m!1365605))

(assert (=> b!1480258 m!1365605))

(assert (=> b!1480258 m!1365463))

(declare-fun m!1365607 () Bool)

(assert (=> b!1480258 m!1365607))

(assert (=> b!1480256 m!1365603))

(assert (=> d!155859 m!1365495))

(declare-fun m!1365609 () Bool)

(assert (=> d!155859 m!1365609))

(assert (=> d!155859 m!1365499))

(assert (=> b!1480128 d!155859))

(declare-fun d!155861 () Bool)

(declare-fun lt!646182 () (_ BitVec 32))

(declare-fun lt!646181 () (_ BitVec 32))

(assert (=> d!155861 (= lt!646182 (bvmul (bvxor lt!646181 (bvlshr lt!646181 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!155861 (= lt!646181 ((_ extract 31 0) (bvand (bvxor (select (arr!47941 a!2862) j!93) (bvlshr (select (arr!47941 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!155861 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1006166 (let ((h!35887 ((_ extract 31 0) (bvand (bvxor (select (arr!47941 a!2862) j!93) (bvlshr (select (arr!47941 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!132796 (bvmul (bvxor h!35887 (bvlshr h!35887 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!132796 (bvlshr x!132796 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1006166 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1006166 #b00000000000000000000000000000000))))))

(assert (=> d!155861 (= (toIndex!0 (select (arr!47941 a!2862) j!93) mask!2687) (bvand (bvxor lt!646182 (bvlshr lt!646182 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1480128 d!155861))

(declare-fun b!1480274 () Bool)

(declare-fun e!830238 () Bool)

(declare-fun call!67796 () Bool)

(assert (=> b!1480274 (= e!830238 call!67796)))

(declare-fun b!1480275 () Bool)

(declare-fun e!830239 () Bool)

(declare-fun contains!9878 (List!34520 (_ BitVec 64)) Bool)

(assert (=> b!1480275 (= e!830239 (contains!9878 Nil!34517 (select (arr!47941 a!2862) #b00000000000000000000000000000000)))))

(declare-fun bm!67793 () Bool)

(declare-fun c!136573 () Bool)

(assert (=> bm!67793 (= call!67796 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!136573 (Cons!34516 (select (arr!47941 a!2862) #b00000000000000000000000000000000) Nil!34517) Nil!34517)))))

(declare-fun b!1480276 () Bool)

(declare-fun e!830240 () Bool)

(assert (=> b!1480276 (= e!830240 e!830238)))

(assert (=> b!1480276 (= c!136573 (validKeyInArray!0 (select (arr!47941 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1480277 () Bool)

(declare-fun e!830241 () Bool)

(assert (=> b!1480277 (= e!830241 e!830240)))

(declare-fun res!1006174 () Bool)

(assert (=> b!1480277 (=> (not res!1006174) (not e!830240))))

(assert (=> b!1480277 (= res!1006174 (not e!830239))))

(declare-fun res!1006173 () Bool)

(assert (=> b!1480277 (=> (not res!1006173) (not e!830239))))

(assert (=> b!1480277 (= res!1006173 (validKeyInArray!0 (select (arr!47941 a!2862) #b00000000000000000000000000000000)))))

(declare-fun d!155863 () Bool)

(declare-fun res!1006175 () Bool)

(assert (=> d!155863 (=> res!1006175 e!830241)))

(assert (=> d!155863 (= res!1006175 (bvsge #b00000000000000000000000000000000 (size!48493 a!2862)))))

(assert (=> d!155863 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34517) e!830241)))

(declare-fun b!1480278 () Bool)

(assert (=> b!1480278 (= e!830238 call!67796)))

(assert (= (and d!155863 (not res!1006175)) b!1480277))

(assert (= (and b!1480277 res!1006173) b!1480275))

(assert (= (and b!1480277 res!1006174) b!1480276))

(assert (= (and b!1480276 c!136573) b!1480278))

(assert (= (and b!1480276 (not c!136573)) b!1480274))

(assert (= (or b!1480278 b!1480274) bm!67793))

(declare-fun m!1365611 () Bool)

(assert (=> b!1480275 m!1365611))

(assert (=> b!1480275 m!1365611))

(declare-fun m!1365613 () Bool)

(assert (=> b!1480275 m!1365613))

(assert (=> bm!67793 m!1365611))

(declare-fun m!1365615 () Bool)

(assert (=> bm!67793 m!1365615))

(assert (=> b!1480276 m!1365611))

(assert (=> b!1480276 m!1365611))

(declare-fun m!1365617 () Bool)

(assert (=> b!1480276 m!1365617))

(assert (=> b!1480277 m!1365611))

(assert (=> b!1480277 m!1365611))

(assert (=> b!1480277 m!1365617))

(assert (=> b!1480129 d!155863))

(declare-fun b!1480336 () Bool)

(declare-fun e!830273 () SeekEntryResult!12206)

(declare-fun e!830275 () SeekEntryResult!12206)

(assert (=> b!1480336 (= e!830273 e!830275)))

(declare-fun lt!646200 () (_ BitVec 64))

(declare-fun lt!646199 () SeekEntryResult!12206)

(assert (=> b!1480336 (= lt!646200 (select (arr!47941 a!2862) (index!51218 lt!646199)))))

(declare-fun c!136596 () Bool)

(assert (=> b!1480336 (= c!136596 (= lt!646200 (select (arr!47941 a!2862) j!93)))))

(declare-fun b!1480337 () Bool)

(assert (=> b!1480337 (= e!830275 (Found!12206 (index!51218 lt!646199)))))

(declare-fun b!1480338 () Bool)

(assert (=> b!1480338 (= e!830273 Undefined!12206)))

(declare-fun e!830274 () SeekEntryResult!12206)

(declare-fun b!1480339 () Bool)

(assert (=> b!1480339 (= e!830274 (seekKeyOrZeroReturnVacant!0 (x!132792 lt!646199) (index!51218 lt!646199) (index!51218 lt!646199) (select (arr!47941 a!2862) j!93) a!2862 mask!2687))))

(declare-fun d!155867 () Bool)

(declare-fun lt!646201 () SeekEntryResult!12206)

(assert (=> d!155867 (and (or ((_ is Undefined!12206) lt!646201) (not ((_ is Found!12206) lt!646201)) (and (bvsge (index!51217 lt!646201) #b00000000000000000000000000000000) (bvslt (index!51217 lt!646201) (size!48493 a!2862)))) (or ((_ is Undefined!12206) lt!646201) ((_ is Found!12206) lt!646201) (not ((_ is MissingZero!12206) lt!646201)) (and (bvsge (index!51216 lt!646201) #b00000000000000000000000000000000) (bvslt (index!51216 lt!646201) (size!48493 a!2862)))) (or ((_ is Undefined!12206) lt!646201) ((_ is Found!12206) lt!646201) ((_ is MissingZero!12206) lt!646201) (not ((_ is MissingVacant!12206) lt!646201)) (and (bvsge (index!51219 lt!646201) #b00000000000000000000000000000000) (bvslt (index!51219 lt!646201) (size!48493 a!2862)))) (or ((_ is Undefined!12206) lt!646201) (ite ((_ is Found!12206) lt!646201) (= (select (arr!47941 a!2862) (index!51217 lt!646201)) (select (arr!47941 a!2862) j!93)) (ite ((_ is MissingZero!12206) lt!646201) (= (select (arr!47941 a!2862) (index!51216 lt!646201)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12206) lt!646201) (= (select (arr!47941 a!2862) (index!51219 lt!646201)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!155867 (= lt!646201 e!830273)))

(declare-fun c!136595 () Bool)

(assert (=> d!155867 (= c!136595 (and ((_ is Intermediate!12206) lt!646199) (undefined!13018 lt!646199)))))

(assert (=> d!155867 (= lt!646199 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47941 a!2862) j!93) mask!2687) (select (arr!47941 a!2862) j!93) a!2862 mask!2687))))

(assert (=> d!155867 (validMask!0 mask!2687)))

(assert (=> d!155867 (= (seekEntryOrOpen!0 (select (arr!47941 a!2862) j!93) a!2862 mask!2687) lt!646201)))

(declare-fun b!1480340 () Bool)

(assert (=> b!1480340 (= e!830274 (MissingZero!12206 (index!51218 lt!646199)))))

(declare-fun b!1480341 () Bool)

(declare-fun c!136597 () Bool)

(assert (=> b!1480341 (= c!136597 (= lt!646200 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1480341 (= e!830275 e!830274)))

(assert (= (and d!155867 c!136595) b!1480338))

(assert (= (and d!155867 (not c!136595)) b!1480336))

(assert (= (and b!1480336 c!136596) b!1480337))

(assert (= (and b!1480336 (not c!136596)) b!1480341))

(assert (= (and b!1480341 c!136597) b!1480340))

(assert (= (and b!1480341 (not c!136597)) b!1480339))

(declare-fun m!1365625 () Bool)

(assert (=> b!1480336 m!1365625))

(assert (=> b!1480339 m!1365463))

(declare-fun m!1365627 () Bool)

(assert (=> b!1480339 m!1365627))

(declare-fun m!1365629 () Bool)

(assert (=> d!155867 m!1365629))

(declare-fun m!1365631 () Bool)

(assert (=> d!155867 m!1365631))

(assert (=> d!155867 m!1365499))

(assert (=> d!155867 m!1365463))

(assert (=> d!155867 m!1365495))

(assert (=> d!155867 m!1365495))

(assert (=> d!155867 m!1365463))

(assert (=> d!155867 m!1365497))

(declare-fun m!1365633 () Bool)

(assert (=> d!155867 m!1365633))

(assert (=> b!1480126 d!155867))

(declare-fun d!155875 () Bool)

(assert (=> d!155875 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!126238 d!155875))

(declare-fun d!155879 () Bool)

(assert (=> d!155879 (= (array_inv!37174 a!2862) (bvsge (size!48493 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!126238 d!155879))

(declare-fun b!1480351 () Bool)

(declare-fun e!830281 () SeekEntryResult!12206)

(declare-fun e!830284 () SeekEntryResult!12206)

(assert (=> b!1480351 (= e!830281 e!830284)))

(declare-fun c!136602 () Bool)

(declare-fun lt!646205 () (_ BitVec 64))

(assert (=> b!1480351 (= c!136602 (or (= lt!646205 lt!646137) (= (bvadd lt!646205 lt!646205) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1480352 () Bool)

(declare-fun lt!646204 () SeekEntryResult!12206)

(assert (=> b!1480352 (and (bvsge (index!51218 lt!646204) #b00000000000000000000000000000000) (bvslt (index!51218 lt!646204) (size!48493 lt!646136)))))

(declare-fun e!830285 () Bool)

(assert (=> b!1480352 (= e!830285 (= (select (arr!47941 lt!646136) (index!51218 lt!646204)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1480353 () Bool)

(assert (=> b!1480353 (= e!830281 (Intermediate!12206 true (toIndex!0 lt!646137 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1480354 () Bool)

(assert (=> b!1480354 (= e!830284 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!646137 mask!2687) #b00000000000000000000000000000000 mask!2687) lt!646137 lt!646136 mask!2687))))

(declare-fun b!1480355 () Bool)

(declare-fun e!830283 () Bool)

(assert (=> b!1480355 (= e!830283 (bvsge (x!132792 lt!646204) #b01111111111111111111111111111110))))

(declare-fun b!1480356 () Bool)

(assert (=> b!1480356 (and (bvsge (index!51218 lt!646204) #b00000000000000000000000000000000) (bvslt (index!51218 lt!646204) (size!48493 lt!646136)))))

(declare-fun res!1006196 () Bool)

(assert (=> b!1480356 (= res!1006196 (= (select (arr!47941 lt!646136) (index!51218 lt!646204)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1480356 (=> res!1006196 e!830285)))

(declare-fun b!1480357 () Bool)

(assert (=> b!1480357 (= e!830284 (Intermediate!12206 false (toIndex!0 lt!646137 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1480358 () Bool)

(assert (=> b!1480358 (and (bvsge (index!51218 lt!646204) #b00000000000000000000000000000000) (bvslt (index!51218 lt!646204) (size!48493 lt!646136)))))

(declare-fun res!1006194 () Bool)

(assert (=> b!1480358 (= res!1006194 (= (select (arr!47941 lt!646136) (index!51218 lt!646204)) lt!646137))))

(assert (=> b!1480358 (=> res!1006194 e!830285)))

(declare-fun e!830282 () Bool)

(assert (=> b!1480358 (= e!830282 e!830285)))

(declare-fun b!1480359 () Bool)

(assert (=> b!1480359 (= e!830283 e!830282)))

(declare-fun res!1006195 () Bool)

(assert (=> b!1480359 (= res!1006195 (and ((_ is Intermediate!12206) lt!646204) (not (undefined!13018 lt!646204)) (bvslt (x!132792 lt!646204) #b01111111111111111111111111111110) (bvsge (x!132792 lt!646204) #b00000000000000000000000000000000) (bvsge (x!132792 lt!646204) #b00000000000000000000000000000000)))))

(assert (=> b!1480359 (=> (not res!1006195) (not e!830282))))

(declare-fun d!155881 () Bool)

(assert (=> d!155881 e!830283))

(declare-fun c!136601 () Bool)

(assert (=> d!155881 (= c!136601 (and ((_ is Intermediate!12206) lt!646204) (undefined!13018 lt!646204)))))

(assert (=> d!155881 (= lt!646204 e!830281)))

(declare-fun c!136603 () Bool)

(assert (=> d!155881 (= c!136603 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!155881 (= lt!646205 (select (arr!47941 lt!646136) (toIndex!0 lt!646137 mask!2687)))))

(assert (=> d!155881 (validMask!0 mask!2687)))

(assert (=> d!155881 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!646137 mask!2687) lt!646137 lt!646136 mask!2687) lt!646204)))

(assert (= (and d!155881 c!136603) b!1480353))

(assert (= (and d!155881 (not c!136603)) b!1480351))

(assert (= (and b!1480351 c!136602) b!1480357))

(assert (= (and b!1480351 (not c!136602)) b!1480354))

(assert (= (and d!155881 c!136601) b!1480355))

(assert (= (and d!155881 (not c!136601)) b!1480359))

(assert (= (and b!1480359 res!1006195) b!1480358))

(assert (= (and b!1480358 (not res!1006194)) b!1480356))

(assert (= (and b!1480356 (not res!1006196)) b!1480352))

(declare-fun m!1365641 () Bool)

(assert (=> b!1480358 m!1365641))

(assert (=> b!1480356 m!1365641))

(assert (=> b!1480354 m!1365453))

(declare-fun m!1365643 () Bool)

(assert (=> b!1480354 m!1365643))

(assert (=> b!1480354 m!1365643))

(declare-fun m!1365645 () Bool)

(assert (=> b!1480354 m!1365645))

(assert (=> b!1480352 m!1365641))

(assert (=> d!155881 m!1365453))

(declare-fun m!1365647 () Bool)

(assert (=> d!155881 m!1365647))

(assert (=> d!155881 m!1365499))

(assert (=> b!1480127 d!155881))

(declare-fun d!155883 () Bool)

(declare-fun lt!646211 () (_ BitVec 32))

(declare-fun lt!646210 () (_ BitVec 32))

(assert (=> d!155883 (= lt!646211 (bvmul (bvxor lt!646210 (bvlshr lt!646210 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!155883 (= lt!646210 ((_ extract 31 0) (bvand (bvxor lt!646137 (bvlshr lt!646137 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!155883 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1006166 (let ((h!35887 ((_ extract 31 0) (bvand (bvxor lt!646137 (bvlshr lt!646137 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!132796 (bvmul (bvxor h!35887 (bvlshr h!35887 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!132796 (bvlshr x!132796 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1006166 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1006166 #b00000000000000000000000000000000))))))

(assert (=> d!155883 (= (toIndex!0 lt!646137 mask!2687) (bvand (bvxor lt!646211 (bvlshr lt!646211 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1480127 d!155883))

(declare-fun d!155885 () Bool)

(assert (=> d!155885 (= (validKeyInArray!0 (select (arr!47941 a!2862) j!93)) (and (not (= (select (arr!47941 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47941 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1480122 d!155885))

(declare-fun b!1480398 () Bool)

(declare-fun e!830309 () Bool)

(declare-fun e!830307 () Bool)

(assert (=> b!1480398 (= e!830309 e!830307)))

(declare-fun c!136621 () Bool)

(assert (=> b!1480398 (= c!136621 (validKeyInArray!0 (select (arr!47941 a!2862) j!93)))))

(declare-fun b!1480399 () Bool)

(declare-fun call!67799 () Bool)

(assert (=> b!1480399 (= e!830307 call!67799)))

(declare-fun b!1480400 () Bool)

(declare-fun e!830308 () Bool)

(assert (=> b!1480400 (= e!830307 e!830308)))

(declare-fun lt!646228 () (_ BitVec 64))

(assert (=> b!1480400 (= lt!646228 (select (arr!47941 a!2862) j!93))))

(declare-fun lt!646227 () Unit!49593)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99322 (_ BitVec 64) (_ BitVec 32)) Unit!49593)

(assert (=> b!1480400 (= lt!646227 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!646228 j!93))))

(declare-fun arrayContainsKey!0 (array!99322 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1480400 (arrayContainsKey!0 a!2862 lt!646228 #b00000000000000000000000000000000)))

(declare-fun lt!646226 () Unit!49593)

(assert (=> b!1480400 (= lt!646226 lt!646227)))

(declare-fun res!1006202 () Bool)

(assert (=> b!1480400 (= res!1006202 (= (seekEntryOrOpen!0 (select (arr!47941 a!2862) j!93) a!2862 mask!2687) (Found!12206 j!93)))))

(assert (=> b!1480400 (=> (not res!1006202) (not e!830308))))

(declare-fun b!1480401 () Bool)

(assert (=> b!1480401 (= e!830308 call!67799)))

(declare-fun bm!67796 () Bool)

(assert (=> bm!67796 (= call!67799 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!93 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun d!155887 () Bool)

(declare-fun res!1006201 () Bool)

(assert (=> d!155887 (=> res!1006201 e!830309)))

(assert (=> d!155887 (= res!1006201 (bvsge j!93 (size!48493 a!2862)))))

(assert (=> d!155887 (= (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687) e!830309)))

(assert (= (and d!155887 (not res!1006201)) b!1480398))

(assert (= (and b!1480398 c!136621) b!1480400))

(assert (= (and b!1480398 (not c!136621)) b!1480399))

(assert (= (and b!1480400 res!1006202) b!1480401))

(assert (= (or b!1480401 b!1480399) bm!67796))

(assert (=> b!1480398 m!1365463))

(assert (=> b!1480398 m!1365463))

(assert (=> b!1480398 m!1365493))

(assert (=> b!1480400 m!1365463))

(declare-fun m!1365657 () Bool)

(assert (=> b!1480400 m!1365657))

(declare-fun m!1365659 () Bool)

(assert (=> b!1480400 m!1365659))

(assert (=> b!1480400 m!1365463))

(assert (=> b!1480400 m!1365491))

(declare-fun m!1365661 () Bool)

(assert (=> bm!67796 m!1365661))

(assert (=> b!1480123 d!155887))

(declare-fun d!155891 () Bool)

(assert (=> d!155891 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!646234 () Unit!49593)

(declare-fun choose!38 (array!99322 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49593)

(assert (=> d!155891 (= lt!646234 (choose!38 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (=> d!155891 (validMask!0 mask!2687)))

(assert (=> d!155891 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93) lt!646234)))

(declare-fun bs!42625 () Bool)

(assert (= bs!42625 d!155891))

(assert (=> bs!42625 m!1365471))

(declare-fun m!1365673 () Bool)

(assert (=> bs!42625 m!1365673))

(assert (=> bs!42625 m!1365499))

(assert (=> b!1480123 d!155891))

(declare-fun b!1480408 () Bool)

(declare-fun e!830313 () SeekEntryResult!12206)

(declare-fun e!830316 () SeekEntryResult!12206)

(assert (=> b!1480408 (= e!830313 e!830316)))

(declare-fun c!136626 () Bool)

(declare-fun lt!646236 () (_ BitVec 64))

(assert (=> b!1480408 (= c!136626 (or (= lt!646236 lt!646137) (= (bvadd lt!646236 lt!646236) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1480409 () Bool)

(declare-fun lt!646235 () SeekEntryResult!12206)

(assert (=> b!1480409 (and (bvsge (index!51218 lt!646235) #b00000000000000000000000000000000) (bvslt (index!51218 lt!646235) (size!48493 lt!646136)))))

(declare-fun e!830317 () Bool)

(assert (=> b!1480409 (= e!830317 (= (select (arr!47941 lt!646136) (index!51218 lt!646235)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1480410 () Bool)

(assert (=> b!1480410 (= e!830313 (Intermediate!12206 true index!646 x!665))))

(declare-fun b!1480411 () Bool)

(assert (=> b!1480411 (= e!830316 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) lt!646137 lt!646136 mask!2687))))

(declare-fun b!1480412 () Bool)

(declare-fun e!830315 () Bool)

(assert (=> b!1480412 (= e!830315 (bvsge (x!132792 lt!646235) #b01111111111111111111111111111110))))

(declare-fun b!1480413 () Bool)

(assert (=> b!1480413 (and (bvsge (index!51218 lt!646235) #b00000000000000000000000000000000) (bvslt (index!51218 lt!646235) (size!48493 lt!646136)))))

(declare-fun res!1006205 () Bool)

(assert (=> b!1480413 (= res!1006205 (= (select (arr!47941 lt!646136) (index!51218 lt!646235)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1480413 (=> res!1006205 e!830317)))

(declare-fun b!1480414 () Bool)

(assert (=> b!1480414 (= e!830316 (Intermediate!12206 false index!646 x!665))))

(declare-fun b!1480415 () Bool)

(assert (=> b!1480415 (and (bvsge (index!51218 lt!646235) #b00000000000000000000000000000000) (bvslt (index!51218 lt!646235) (size!48493 lt!646136)))))

(declare-fun res!1006203 () Bool)

(assert (=> b!1480415 (= res!1006203 (= (select (arr!47941 lt!646136) (index!51218 lt!646235)) lt!646137))))

(assert (=> b!1480415 (=> res!1006203 e!830317)))

(declare-fun e!830314 () Bool)

(assert (=> b!1480415 (= e!830314 e!830317)))

(declare-fun b!1480416 () Bool)

(assert (=> b!1480416 (= e!830315 e!830314)))

(declare-fun res!1006204 () Bool)

(assert (=> b!1480416 (= res!1006204 (and ((_ is Intermediate!12206) lt!646235) (not (undefined!13018 lt!646235)) (bvslt (x!132792 lt!646235) #b01111111111111111111111111111110) (bvsge (x!132792 lt!646235) #b00000000000000000000000000000000) (bvsge (x!132792 lt!646235) x!665)))))

(assert (=> b!1480416 (=> (not res!1006204) (not e!830314))))

(declare-fun d!155895 () Bool)

(assert (=> d!155895 e!830315))

(declare-fun c!136625 () Bool)

(assert (=> d!155895 (= c!136625 (and ((_ is Intermediate!12206) lt!646235) (undefined!13018 lt!646235)))))

(assert (=> d!155895 (= lt!646235 e!830313)))

(declare-fun c!136627 () Bool)

(assert (=> d!155895 (= c!136627 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!155895 (= lt!646236 (select (arr!47941 lt!646136) index!646))))

(assert (=> d!155895 (validMask!0 mask!2687)))

(assert (=> d!155895 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!646137 lt!646136 mask!2687) lt!646235)))

(assert (= (and d!155895 c!136627) b!1480410))

(assert (= (and d!155895 (not c!136627)) b!1480408))

(assert (= (and b!1480408 c!136626) b!1480414))

(assert (= (and b!1480408 (not c!136626)) b!1480411))

(assert (= (and d!155895 c!136625) b!1480412))

(assert (= (and d!155895 (not c!136625)) b!1480416))

(assert (= (and b!1480416 res!1006204) b!1480415))

(assert (= (and b!1480415 (not res!1006203)) b!1480413))

(assert (= (and b!1480413 (not res!1006205)) b!1480409))

(declare-fun m!1365675 () Bool)

(assert (=> b!1480415 m!1365675))

(assert (=> b!1480413 m!1365675))

(declare-fun m!1365677 () Bool)

(assert (=> b!1480411 m!1365677))

(assert (=> b!1480411 m!1365677))

(declare-fun m!1365679 () Bool)

(assert (=> b!1480411 m!1365679))

(assert (=> b!1480409 m!1365675))

(declare-fun m!1365681 () Bool)

(assert (=> d!155895 m!1365681))

(assert (=> d!155895 m!1365499))

(assert (=> b!1480130 d!155895))

(declare-fun b!1480483 () Bool)

(declare-fun e!830360 () SeekEntryResult!12206)

(assert (=> b!1480483 (= e!830360 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) intermediateAfterIndex!19 lt!646137 lt!646136 mask!2687))))

(declare-fun b!1480484 () Bool)

(declare-fun e!830361 () SeekEntryResult!12206)

(declare-fun e!830362 () SeekEntryResult!12206)

(assert (=> b!1480484 (= e!830361 e!830362)))

(declare-fun c!136653 () Bool)

(declare-fun lt!646266 () (_ BitVec 64))

(assert (=> b!1480484 (= c!136653 (= lt!646266 lt!646137))))

(declare-fun b!1480485 () Bool)

(declare-fun c!136651 () Bool)

(assert (=> b!1480485 (= c!136651 (= lt!646266 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1480485 (= e!830362 e!830360)))

(declare-fun lt!646265 () SeekEntryResult!12206)

(declare-fun d!155897 () Bool)

(assert (=> d!155897 (and (or ((_ is Undefined!12206) lt!646265) (not ((_ is Found!12206) lt!646265)) (and (bvsge (index!51217 lt!646265) #b00000000000000000000000000000000) (bvslt (index!51217 lt!646265) (size!48493 lt!646136)))) (or ((_ is Undefined!12206) lt!646265) ((_ is Found!12206) lt!646265) (not ((_ is MissingVacant!12206) lt!646265)) (not (= (index!51219 lt!646265) intermediateAfterIndex!19)) (and (bvsge (index!51219 lt!646265) #b00000000000000000000000000000000) (bvslt (index!51219 lt!646265) (size!48493 lt!646136)))) (or ((_ is Undefined!12206) lt!646265) (ite ((_ is Found!12206) lt!646265) (= (select (arr!47941 lt!646136) (index!51217 lt!646265)) lt!646137) (and ((_ is MissingVacant!12206) lt!646265) (= (index!51219 lt!646265) intermediateAfterIndex!19) (= (select (arr!47941 lt!646136) (index!51219 lt!646265)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!155897 (= lt!646265 e!830361)))

(declare-fun c!136652 () Bool)

(assert (=> d!155897 (= c!136652 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!155897 (= lt!646266 (select (arr!47941 lt!646136) index!646))))

(assert (=> d!155897 (validMask!0 mask!2687)))

(assert (=> d!155897 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646137 lt!646136 mask!2687) lt!646265)))

(declare-fun b!1480482 () Bool)

(assert (=> b!1480482 (= e!830362 (Found!12206 index!646))))

(declare-fun b!1480486 () Bool)

(assert (=> b!1480486 (= e!830361 Undefined!12206)))

(declare-fun b!1480487 () Bool)

(assert (=> b!1480487 (= e!830360 (MissingVacant!12206 intermediateAfterIndex!19))))

(assert (= (and d!155897 c!136652) b!1480486))

(assert (= (and d!155897 (not c!136652)) b!1480484))

(assert (= (and b!1480484 c!136653) b!1480482))

(assert (= (and b!1480484 (not c!136653)) b!1480485))

(assert (= (and b!1480485 c!136651) b!1480487))

(assert (= (and b!1480485 (not c!136651)) b!1480483))

(assert (=> b!1480483 m!1365677))

(assert (=> b!1480483 m!1365677))

(declare-fun m!1365709 () Bool)

(assert (=> b!1480483 m!1365709))

(declare-fun m!1365711 () Bool)

(assert (=> d!155897 m!1365711))

(declare-fun m!1365713 () Bool)

(assert (=> d!155897 m!1365713))

(assert (=> d!155897 m!1365681))

(assert (=> d!155897 m!1365499))

(assert (=> b!1480120 d!155897))

(declare-fun b!1480488 () Bool)

(declare-fun e!830363 () SeekEntryResult!12206)

(declare-fun e!830365 () SeekEntryResult!12206)

(assert (=> b!1480488 (= e!830363 e!830365)))

(declare-fun lt!646268 () (_ BitVec 64))

(declare-fun lt!646267 () SeekEntryResult!12206)

(assert (=> b!1480488 (= lt!646268 (select (arr!47941 lt!646136) (index!51218 lt!646267)))))

(declare-fun c!136655 () Bool)

(assert (=> b!1480488 (= c!136655 (= lt!646268 lt!646137))))

(declare-fun b!1480489 () Bool)

(assert (=> b!1480489 (= e!830365 (Found!12206 (index!51218 lt!646267)))))

(declare-fun b!1480490 () Bool)

(assert (=> b!1480490 (= e!830363 Undefined!12206)))

(declare-fun e!830364 () SeekEntryResult!12206)

(declare-fun b!1480491 () Bool)

(assert (=> b!1480491 (= e!830364 (seekKeyOrZeroReturnVacant!0 (x!132792 lt!646267) (index!51218 lt!646267) (index!51218 lt!646267) lt!646137 lt!646136 mask!2687))))

(declare-fun d!155905 () Bool)

(declare-fun lt!646269 () SeekEntryResult!12206)

(assert (=> d!155905 (and (or ((_ is Undefined!12206) lt!646269) (not ((_ is Found!12206) lt!646269)) (and (bvsge (index!51217 lt!646269) #b00000000000000000000000000000000) (bvslt (index!51217 lt!646269) (size!48493 lt!646136)))) (or ((_ is Undefined!12206) lt!646269) ((_ is Found!12206) lt!646269) (not ((_ is MissingZero!12206) lt!646269)) (and (bvsge (index!51216 lt!646269) #b00000000000000000000000000000000) (bvslt (index!51216 lt!646269) (size!48493 lt!646136)))) (or ((_ is Undefined!12206) lt!646269) ((_ is Found!12206) lt!646269) ((_ is MissingZero!12206) lt!646269) (not ((_ is MissingVacant!12206) lt!646269)) (and (bvsge (index!51219 lt!646269) #b00000000000000000000000000000000) (bvslt (index!51219 lt!646269) (size!48493 lt!646136)))) (or ((_ is Undefined!12206) lt!646269) (ite ((_ is Found!12206) lt!646269) (= (select (arr!47941 lt!646136) (index!51217 lt!646269)) lt!646137) (ite ((_ is MissingZero!12206) lt!646269) (= (select (arr!47941 lt!646136) (index!51216 lt!646269)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12206) lt!646269) (= (select (arr!47941 lt!646136) (index!51219 lt!646269)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!155905 (= lt!646269 e!830363)))

(declare-fun c!136654 () Bool)

(assert (=> d!155905 (= c!136654 (and ((_ is Intermediate!12206) lt!646267) (undefined!13018 lt!646267)))))

(assert (=> d!155905 (= lt!646267 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!646137 mask!2687) lt!646137 lt!646136 mask!2687))))

(assert (=> d!155905 (validMask!0 mask!2687)))

(assert (=> d!155905 (= (seekEntryOrOpen!0 lt!646137 lt!646136 mask!2687) lt!646269)))

(declare-fun b!1480492 () Bool)

(assert (=> b!1480492 (= e!830364 (MissingZero!12206 (index!51218 lt!646267)))))

(declare-fun b!1480493 () Bool)

(declare-fun c!136656 () Bool)

(assert (=> b!1480493 (= c!136656 (= lt!646268 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1480493 (= e!830365 e!830364)))

(assert (= (and d!155905 c!136654) b!1480490))

(assert (= (and d!155905 (not c!136654)) b!1480488))

(assert (= (and b!1480488 c!136655) b!1480489))

(assert (= (and b!1480488 (not c!136655)) b!1480493))

(assert (= (and b!1480493 c!136656) b!1480492))

(assert (= (and b!1480493 (not c!136656)) b!1480491))

(declare-fun m!1365715 () Bool)

(assert (=> b!1480488 m!1365715))

(declare-fun m!1365717 () Bool)

(assert (=> b!1480491 m!1365717))

(declare-fun m!1365719 () Bool)

(assert (=> d!155905 m!1365719))

(declare-fun m!1365721 () Bool)

(assert (=> d!155905 m!1365721))

(assert (=> d!155905 m!1365499))

(assert (=> d!155905 m!1365453))

(assert (=> d!155905 m!1365453))

(assert (=> d!155905 m!1365455))

(declare-fun m!1365723 () Bool)

(assert (=> d!155905 m!1365723))

(assert (=> b!1480120 d!155905))

(declare-fun b!1480494 () Bool)

(declare-fun e!830368 () Bool)

(declare-fun e!830366 () Bool)

(assert (=> b!1480494 (= e!830368 e!830366)))

(declare-fun c!136657 () Bool)

(assert (=> b!1480494 (= c!136657 (validKeyInArray!0 (select (arr!47941 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1480495 () Bool)

(declare-fun call!67808 () Bool)

(assert (=> b!1480495 (= e!830366 call!67808)))

(declare-fun b!1480496 () Bool)

(declare-fun e!830367 () Bool)

(assert (=> b!1480496 (= e!830366 e!830367)))

(declare-fun lt!646272 () (_ BitVec 64))

(assert (=> b!1480496 (= lt!646272 (select (arr!47941 a!2862) #b00000000000000000000000000000000))))

(declare-fun lt!646271 () Unit!49593)

(assert (=> b!1480496 (= lt!646271 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!646272 #b00000000000000000000000000000000))))

(assert (=> b!1480496 (arrayContainsKey!0 a!2862 lt!646272 #b00000000000000000000000000000000)))

(declare-fun lt!646270 () Unit!49593)

(assert (=> b!1480496 (= lt!646270 lt!646271)))

(declare-fun res!1006226 () Bool)

(assert (=> b!1480496 (= res!1006226 (= (seekEntryOrOpen!0 (select (arr!47941 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!12206 #b00000000000000000000000000000000)))))

(assert (=> b!1480496 (=> (not res!1006226) (not e!830367))))

(declare-fun b!1480497 () Bool)

(assert (=> b!1480497 (= e!830367 call!67808)))

(declare-fun bm!67805 () Bool)

(assert (=> bm!67805 (= call!67808 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun d!155907 () Bool)

(declare-fun res!1006225 () Bool)

(assert (=> d!155907 (=> res!1006225 e!830368)))

(assert (=> d!155907 (= res!1006225 (bvsge #b00000000000000000000000000000000 (size!48493 a!2862)))))

(assert (=> d!155907 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!830368)))

(assert (= (and d!155907 (not res!1006225)) b!1480494))

(assert (= (and b!1480494 c!136657) b!1480496))

(assert (= (and b!1480494 (not c!136657)) b!1480495))

(assert (= (and b!1480496 res!1006226) b!1480497))

(assert (= (or b!1480497 b!1480495) bm!67805))

(assert (=> b!1480494 m!1365611))

(assert (=> b!1480494 m!1365611))

(assert (=> b!1480494 m!1365617))

(assert (=> b!1480496 m!1365611))

(declare-fun m!1365725 () Bool)

(assert (=> b!1480496 m!1365725))

(declare-fun m!1365727 () Bool)

(assert (=> b!1480496 m!1365727))

(assert (=> b!1480496 m!1365611))

(declare-fun m!1365731 () Bool)

(assert (=> b!1480496 m!1365731))

(declare-fun m!1365735 () Bool)

(assert (=> bm!67805 m!1365735))

(assert (=> b!1480131 d!155907))

(declare-fun b!1480502 () Bool)

(declare-fun e!830372 () SeekEntryResult!12206)

(declare-fun e!830375 () SeekEntryResult!12206)

(assert (=> b!1480502 (= e!830372 e!830375)))

(declare-fun c!136660 () Bool)

(declare-fun lt!646277 () (_ BitVec 64))

(assert (=> b!1480502 (= c!136660 (or (= lt!646277 (select (arr!47941 a!2862) j!93)) (= (bvadd lt!646277 lt!646277) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1480503 () Bool)

(declare-fun lt!646276 () SeekEntryResult!12206)

(assert (=> b!1480503 (and (bvsge (index!51218 lt!646276) #b00000000000000000000000000000000) (bvslt (index!51218 lt!646276) (size!48493 a!2862)))))

(declare-fun e!830376 () Bool)

(assert (=> b!1480503 (= e!830376 (= (select (arr!47941 a!2862) (index!51218 lt!646276)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1480504 () Bool)

(assert (=> b!1480504 (= e!830372 (Intermediate!12206 true index!646 x!665))))

(declare-fun b!1480505 () Bool)

(assert (=> b!1480505 (= e!830375 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) (select (arr!47941 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1480506 () Bool)

(declare-fun e!830374 () Bool)

(assert (=> b!1480506 (= e!830374 (bvsge (x!132792 lt!646276) #b01111111111111111111111111111110))))

(declare-fun b!1480507 () Bool)

(assert (=> b!1480507 (and (bvsge (index!51218 lt!646276) #b00000000000000000000000000000000) (bvslt (index!51218 lt!646276) (size!48493 a!2862)))))

(declare-fun res!1006231 () Bool)

(assert (=> b!1480507 (= res!1006231 (= (select (arr!47941 a!2862) (index!51218 lt!646276)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1480507 (=> res!1006231 e!830376)))

(declare-fun b!1480508 () Bool)

(assert (=> b!1480508 (= e!830375 (Intermediate!12206 false index!646 x!665))))

(declare-fun b!1480509 () Bool)

(assert (=> b!1480509 (and (bvsge (index!51218 lt!646276) #b00000000000000000000000000000000) (bvslt (index!51218 lt!646276) (size!48493 a!2862)))))

(declare-fun res!1006229 () Bool)

(assert (=> b!1480509 (= res!1006229 (= (select (arr!47941 a!2862) (index!51218 lt!646276)) (select (arr!47941 a!2862) j!93)))))

(assert (=> b!1480509 (=> res!1006229 e!830376)))

(declare-fun e!830373 () Bool)

(assert (=> b!1480509 (= e!830373 e!830376)))

(declare-fun b!1480510 () Bool)

(assert (=> b!1480510 (= e!830374 e!830373)))

(declare-fun res!1006230 () Bool)

(assert (=> b!1480510 (= res!1006230 (and ((_ is Intermediate!12206) lt!646276) (not (undefined!13018 lt!646276)) (bvslt (x!132792 lt!646276) #b01111111111111111111111111111110) (bvsge (x!132792 lt!646276) #b00000000000000000000000000000000) (bvsge (x!132792 lt!646276) x!665)))))

(assert (=> b!1480510 (=> (not res!1006230) (not e!830373))))

(declare-fun d!155909 () Bool)

(assert (=> d!155909 e!830374))

(declare-fun c!136659 () Bool)

(assert (=> d!155909 (= c!136659 (and ((_ is Intermediate!12206) lt!646276) (undefined!13018 lt!646276)))))

(assert (=> d!155909 (= lt!646276 e!830372)))

(declare-fun c!136661 () Bool)

(assert (=> d!155909 (= c!136661 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!155909 (= lt!646277 (select (arr!47941 a!2862) index!646))))

(assert (=> d!155909 (validMask!0 mask!2687)))

(assert (=> d!155909 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47941 a!2862) j!93) a!2862 mask!2687) lt!646276)))

(assert (= (and d!155909 c!136661) b!1480504))

(assert (= (and d!155909 (not c!136661)) b!1480502))

(assert (= (and b!1480502 c!136660) b!1480508))

(assert (= (and b!1480502 (not c!136660)) b!1480505))

(assert (= (and d!155909 c!136659) b!1480506))

(assert (= (and d!155909 (not c!136659)) b!1480510))

(assert (= (and b!1480510 res!1006230) b!1480509))

(assert (= (and b!1480509 (not res!1006229)) b!1480507))

(assert (= (and b!1480507 (not res!1006231)) b!1480503))

(declare-fun m!1365739 () Bool)

(assert (=> b!1480509 m!1365739))

(assert (=> b!1480507 m!1365739))

(assert (=> b!1480505 m!1365677))

(assert (=> b!1480505 m!1365677))

(assert (=> b!1480505 m!1365463))

(declare-fun m!1365741 () Bool)

(assert (=> b!1480505 m!1365741))

(assert (=> b!1480503 m!1365739))

(assert (=> d!155909 m!1365469))

(assert (=> d!155909 m!1365499))

(assert (=> b!1480121 d!155909))

(declare-fun d!155913 () Bool)

(assert (=> d!155913 (= (validKeyInArray!0 (select (arr!47941 a!2862) i!1006)) (and (not (= (select (arr!47941 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47941 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1480132 d!155913))

(check-sat (not bm!67805) (not d!155881) (not b!1480505) (not d!155897) (not bm!67796) (not b!1480276) (not b!1480411) (not b!1480491) (not b!1480354) (not b!1480483) (not b!1480400) (not d!155909) (not b!1480258) (not b!1480339) (not b!1480275) (not d!155905) (not bm!67793) (not b!1480496) (not d!155895) (not d!155859) (not b!1480277) (not b!1480494) (not d!155867) (not b!1480398) (not d!155891))
(check-sat)
(get-model)

(assert (=> d!155895 d!155875))

(declare-fun b!1480619 () Bool)

(declare-fun e!830440 () SeekEntryResult!12206)

(assert (=> b!1480619 (= e!830440 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!646 x!665 mask!2687) (bvadd x!665 #b00000000000000000000000000000001) mask!2687) intermediateAfterIndex!19 lt!646137 lt!646136 mask!2687))))

(declare-fun b!1480620 () Bool)

(declare-fun e!830441 () SeekEntryResult!12206)

(declare-fun e!830442 () SeekEntryResult!12206)

(assert (=> b!1480620 (= e!830441 e!830442)))

(declare-fun c!136702 () Bool)

(declare-fun lt!646331 () (_ BitVec 64))

(assert (=> b!1480620 (= c!136702 (= lt!646331 lt!646137))))

(declare-fun b!1480621 () Bool)

(declare-fun c!136700 () Bool)

(assert (=> b!1480621 (= c!136700 (= lt!646331 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1480621 (= e!830442 e!830440)))

(declare-fun lt!646330 () SeekEntryResult!12206)

(declare-fun d!155961 () Bool)

(assert (=> d!155961 (and (or ((_ is Undefined!12206) lt!646330) (not ((_ is Found!12206) lt!646330)) (and (bvsge (index!51217 lt!646330) #b00000000000000000000000000000000) (bvslt (index!51217 lt!646330) (size!48493 lt!646136)))) (or ((_ is Undefined!12206) lt!646330) ((_ is Found!12206) lt!646330) (not ((_ is MissingVacant!12206) lt!646330)) (not (= (index!51219 lt!646330) intermediateAfterIndex!19)) (and (bvsge (index!51219 lt!646330) #b00000000000000000000000000000000) (bvslt (index!51219 lt!646330) (size!48493 lt!646136)))) (or ((_ is Undefined!12206) lt!646330) (ite ((_ is Found!12206) lt!646330) (= (select (arr!47941 lt!646136) (index!51217 lt!646330)) lt!646137) (and ((_ is MissingVacant!12206) lt!646330) (= (index!51219 lt!646330) intermediateAfterIndex!19) (= (select (arr!47941 lt!646136) (index!51219 lt!646330)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!155961 (= lt!646330 e!830441)))

(declare-fun c!136701 () Bool)

(assert (=> d!155961 (= c!136701 (bvsge (bvadd x!665 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!155961 (= lt!646331 (select (arr!47941 lt!646136) (nextIndex!0 index!646 x!665 mask!2687)))))

(assert (=> d!155961 (validMask!0 mask!2687)))

(assert (=> d!155961 (= (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) intermediateAfterIndex!19 lt!646137 lt!646136 mask!2687) lt!646330)))

(declare-fun b!1480618 () Bool)

(assert (=> b!1480618 (= e!830442 (Found!12206 (nextIndex!0 index!646 x!665 mask!2687)))))

(declare-fun b!1480622 () Bool)

(assert (=> b!1480622 (= e!830441 Undefined!12206)))

(declare-fun b!1480623 () Bool)

(assert (=> b!1480623 (= e!830440 (MissingVacant!12206 intermediateAfterIndex!19))))

(assert (= (and d!155961 c!136701) b!1480622))

(assert (= (and d!155961 (not c!136701)) b!1480620))

(assert (= (and b!1480620 c!136702) b!1480618))

(assert (= (and b!1480620 (not c!136702)) b!1480621))

(assert (= (and b!1480621 c!136700) b!1480623))

(assert (= (and b!1480621 (not c!136700)) b!1480619))

(assert (=> b!1480619 m!1365677))

(declare-fun m!1365837 () Bool)

(assert (=> b!1480619 m!1365837))

(assert (=> b!1480619 m!1365837))

(declare-fun m!1365839 () Bool)

(assert (=> b!1480619 m!1365839))

(declare-fun m!1365841 () Bool)

(assert (=> d!155961 m!1365841))

(declare-fun m!1365843 () Bool)

(assert (=> d!155961 m!1365843))

(assert (=> d!155961 m!1365677))

(declare-fun m!1365845 () Bool)

(assert (=> d!155961 m!1365845))

(assert (=> d!155961 m!1365499))

(assert (=> b!1480483 d!155961))

(declare-fun d!155963 () Bool)

(declare-fun lt!646334 () (_ BitVec 32))

(assert (=> d!155963 (and (bvsge lt!646334 #b00000000000000000000000000000000) (bvslt lt!646334 (bvadd mask!2687 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!155963 (= lt!646334 (choose!52 index!646 x!665 mask!2687))))

(assert (=> d!155963 (validMask!0 mask!2687)))

(assert (=> d!155963 (= (nextIndex!0 index!646 x!665 mask!2687) lt!646334)))

(declare-fun bs!42628 () Bool)

(assert (= bs!42628 d!155963))

(declare-fun m!1365847 () Bool)

(assert (=> bs!42628 m!1365847))

(assert (=> bs!42628 m!1365499))

(assert (=> b!1480483 d!155963))

(declare-fun b!1480625 () Bool)

(declare-fun e!830443 () SeekEntryResult!12206)

(assert (=> b!1480625 (= e!830443 (seekKeyOrZeroReturnVacant!0 (bvadd (x!132792 lt!646267) #b00000000000000000000000000000001) (nextIndex!0 (index!51218 lt!646267) (x!132792 lt!646267) mask!2687) (index!51218 lt!646267) lt!646137 lt!646136 mask!2687))))

(declare-fun b!1480626 () Bool)

(declare-fun e!830444 () SeekEntryResult!12206)

(declare-fun e!830445 () SeekEntryResult!12206)

(assert (=> b!1480626 (= e!830444 e!830445)))

(declare-fun c!136705 () Bool)

(declare-fun lt!646336 () (_ BitVec 64))

(assert (=> b!1480626 (= c!136705 (= lt!646336 lt!646137))))

(declare-fun b!1480627 () Bool)

(declare-fun c!136703 () Bool)

(assert (=> b!1480627 (= c!136703 (= lt!646336 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1480627 (= e!830445 e!830443)))

(declare-fun lt!646335 () SeekEntryResult!12206)

(declare-fun d!155965 () Bool)

(assert (=> d!155965 (and (or ((_ is Undefined!12206) lt!646335) (not ((_ is Found!12206) lt!646335)) (and (bvsge (index!51217 lt!646335) #b00000000000000000000000000000000) (bvslt (index!51217 lt!646335) (size!48493 lt!646136)))) (or ((_ is Undefined!12206) lt!646335) ((_ is Found!12206) lt!646335) (not ((_ is MissingVacant!12206) lt!646335)) (not (= (index!51219 lt!646335) (index!51218 lt!646267))) (and (bvsge (index!51219 lt!646335) #b00000000000000000000000000000000) (bvslt (index!51219 lt!646335) (size!48493 lt!646136)))) (or ((_ is Undefined!12206) lt!646335) (ite ((_ is Found!12206) lt!646335) (= (select (arr!47941 lt!646136) (index!51217 lt!646335)) lt!646137) (and ((_ is MissingVacant!12206) lt!646335) (= (index!51219 lt!646335) (index!51218 lt!646267)) (= (select (arr!47941 lt!646136) (index!51219 lt!646335)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!155965 (= lt!646335 e!830444)))

(declare-fun c!136704 () Bool)

(assert (=> d!155965 (= c!136704 (bvsge (x!132792 lt!646267) #b01111111111111111111111111111110))))

(assert (=> d!155965 (= lt!646336 (select (arr!47941 lt!646136) (index!51218 lt!646267)))))

(assert (=> d!155965 (validMask!0 mask!2687)))

(assert (=> d!155965 (= (seekKeyOrZeroReturnVacant!0 (x!132792 lt!646267) (index!51218 lt!646267) (index!51218 lt!646267) lt!646137 lt!646136 mask!2687) lt!646335)))

(declare-fun b!1480624 () Bool)

(assert (=> b!1480624 (= e!830445 (Found!12206 (index!51218 lt!646267)))))

(declare-fun b!1480628 () Bool)

(assert (=> b!1480628 (= e!830444 Undefined!12206)))

(declare-fun b!1480629 () Bool)

(assert (=> b!1480629 (= e!830443 (MissingVacant!12206 (index!51218 lt!646267)))))

(assert (= (and d!155965 c!136704) b!1480628))

(assert (= (and d!155965 (not c!136704)) b!1480626))

(assert (= (and b!1480626 c!136705) b!1480624))

(assert (= (and b!1480626 (not c!136705)) b!1480627))

(assert (= (and b!1480627 c!136703) b!1480629))

(assert (= (and b!1480627 (not c!136703)) b!1480625))

(declare-fun m!1365849 () Bool)

(assert (=> b!1480625 m!1365849))

(assert (=> b!1480625 m!1365849))

(declare-fun m!1365851 () Bool)

(assert (=> b!1480625 m!1365851))

(declare-fun m!1365853 () Bool)

(assert (=> d!155965 m!1365853))

(declare-fun m!1365855 () Bool)

(assert (=> d!155965 m!1365855))

(assert (=> d!155965 m!1365715))

(assert (=> d!155965 m!1365499))

(assert (=> b!1480491 d!155965))

(assert (=> d!155867 d!155859))

(assert (=> d!155867 d!155861))

(assert (=> d!155867 d!155875))

(declare-fun d!155967 () Bool)

(assert (=> d!155967 (arrayContainsKey!0 a!2862 lt!646272 #b00000000000000000000000000000000)))

(declare-fun lt!646339 () Unit!49593)

(declare-fun choose!13 (array!99322 (_ BitVec 64) (_ BitVec 32)) Unit!49593)

(assert (=> d!155967 (= lt!646339 (choose!13 a!2862 lt!646272 #b00000000000000000000000000000000))))

(assert (=> d!155967 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!155967 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!646272 #b00000000000000000000000000000000) lt!646339)))

(declare-fun bs!42629 () Bool)

(assert (= bs!42629 d!155967))

(assert (=> bs!42629 m!1365727))

(declare-fun m!1365857 () Bool)

(assert (=> bs!42629 m!1365857))

(assert (=> b!1480496 d!155967))

(declare-fun d!155969 () Bool)

(declare-fun res!1006269 () Bool)

(declare-fun e!830450 () Bool)

(assert (=> d!155969 (=> res!1006269 e!830450)))

(assert (=> d!155969 (= res!1006269 (= (select (arr!47941 a!2862) #b00000000000000000000000000000000) lt!646272))))

(assert (=> d!155969 (= (arrayContainsKey!0 a!2862 lt!646272 #b00000000000000000000000000000000) e!830450)))

(declare-fun b!1480634 () Bool)

(declare-fun e!830451 () Bool)

(assert (=> b!1480634 (= e!830450 e!830451)))

(declare-fun res!1006270 () Bool)

(assert (=> b!1480634 (=> (not res!1006270) (not e!830451))))

(assert (=> b!1480634 (= res!1006270 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!48493 a!2862)))))

(declare-fun b!1480635 () Bool)

(assert (=> b!1480635 (= e!830451 (arrayContainsKey!0 a!2862 lt!646272 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!155969 (not res!1006269)) b!1480634))

(assert (= (and b!1480634 res!1006270) b!1480635))

(assert (=> d!155969 m!1365611))

(declare-fun m!1365859 () Bool)

(assert (=> b!1480635 m!1365859))

(assert (=> b!1480496 d!155969))

(declare-fun b!1480636 () Bool)

(declare-fun e!830452 () SeekEntryResult!12206)

(declare-fun e!830454 () SeekEntryResult!12206)

(assert (=> b!1480636 (= e!830452 e!830454)))

(declare-fun lt!646341 () (_ BitVec 64))

(declare-fun lt!646340 () SeekEntryResult!12206)

(assert (=> b!1480636 (= lt!646341 (select (arr!47941 a!2862) (index!51218 lt!646340)))))

(declare-fun c!136707 () Bool)

(assert (=> b!1480636 (= c!136707 (= lt!646341 (select (arr!47941 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1480637 () Bool)

(assert (=> b!1480637 (= e!830454 (Found!12206 (index!51218 lt!646340)))))

(declare-fun b!1480638 () Bool)

(assert (=> b!1480638 (= e!830452 Undefined!12206)))

(declare-fun b!1480639 () Bool)

(declare-fun e!830453 () SeekEntryResult!12206)

(assert (=> b!1480639 (= e!830453 (seekKeyOrZeroReturnVacant!0 (x!132792 lt!646340) (index!51218 lt!646340) (index!51218 lt!646340) (select (arr!47941 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687))))

(declare-fun d!155971 () Bool)

(declare-fun lt!646342 () SeekEntryResult!12206)

(assert (=> d!155971 (and (or ((_ is Undefined!12206) lt!646342) (not ((_ is Found!12206) lt!646342)) (and (bvsge (index!51217 lt!646342) #b00000000000000000000000000000000) (bvslt (index!51217 lt!646342) (size!48493 a!2862)))) (or ((_ is Undefined!12206) lt!646342) ((_ is Found!12206) lt!646342) (not ((_ is MissingZero!12206) lt!646342)) (and (bvsge (index!51216 lt!646342) #b00000000000000000000000000000000) (bvslt (index!51216 lt!646342) (size!48493 a!2862)))) (or ((_ is Undefined!12206) lt!646342) ((_ is Found!12206) lt!646342) ((_ is MissingZero!12206) lt!646342) (not ((_ is MissingVacant!12206) lt!646342)) (and (bvsge (index!51219 lt!646342) #b00000000000000000000000000000000) (bvslt (index!51219 lt!646342) (size!48493 a!2862)))) (or ((_ is Undefined!12206) lt!646342) (ite ((_ is Found!12206) lt!646342) (= (select (arr!47941 a!2862) (index!51217 lt!646342)) (select (arr!47941 a!2862) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!12206) lt!646342) (= (select (arr!47941 a!2862) (index!51216 lt!646342)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12206) lt!646342) (= (select (arr!47941 a!2862) (index!51219 lt!646342)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!155971 (= lt!646342 e!830452)))

(declare-fun c!136706 () Bool)

(assert (=> d!155971 (= c!136706 (and ((_ is Intermediate!12206) lt!646340) (undefined!13018 lt!646340)))))

(assert (=> d!155971 (= lt!646340 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47941 a!2862) #b00000000000000000000000000000000) mask!2687) (select (arr!47941 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687))))

(assert (=> d!155971 (validMask!0 mask!2687)))

(assert (=> d!155971 (= (seekEntryOrOpen!0 (select (arr!47941 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) lt!646342)))

(declare-fun b!1480640 () Bool)

(assert (=> b!1480640 (= e!830453 (MissingZero!12206 (index!51218 lt!646340)))))

(declare-fun b!1480641 () Bool)

(declare-fun c!136708 () Bool)

(assert (=> b!1480641 (= c!136708 (= lt!646341 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1480641 (= e!830454 e!830453)))

(assert (= (and d!155971 c!136706) b!1480638))

(assert (= (and d!155971 (not c!136706)) b!1480636))

(assert (= (and b!1480636 c!136707) b!1480637))

(assert (= (and b!1480636 (not c!136707)) b!1480641))

(assert (= (and b!1480641 c!136708) b!1480640))

(assert (= (and b!1480641 (not c!136708)) b!1480639))

(declare-fun m!1365861 () Bool)

(assert (=> b!1480636 m!1365861))

(assert (=> b!1480639 m!1365611))

(declare-fun m!1365863 () Bool)

(assert (=> b!1480639 m!1365863))

(declare-fun m!1365865 () Bool)

(assert (=> d!155971 m!1365865))

(declare-fun m!1365867 () Bool)

(assert (=> d!155971 m!1365867))

(assert (=> d!155971 m!1365499))

(assert (=> d!155971 m!1365611))

(declare-fun m!1365869 () Bool)

(assert (=> d!155971 m!1365869))

(assert (=> d!155971 m!1365869))

(assert (=> d!155971 m!1365611))

(declare-fun m!1365871 () Bool)

(assert (=> d!155971 m!1365871))

(declare-fun m!1365873 () Bool)

(assert (=> d!155971 m!1365873))

(assert (=> b!1480496 d!155971))

(declare-fun d!155973 () Bool)

(assert (=> d!155973 (= (validKeyInArray!0 (select (arr!47941 a!2862) #b00000000000000000000000000000000)) (and (not (= (select (arr!47941 a!2862) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47941 a!2862) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1480494 d!155973))

(assert (=> d!155897 d!155875))

(assert (=> d!155905 d!155881))

(assert (=> d!155905 d!155883))

(assert (=> d!155905 d!155875))

(declare-fun b!1480642 () Bool)

(declare-fun e!830457 () Bool)

(declare-fun e!830455 () Bool)

(assert (=> b!1480642 (= e!830457 e!830455)))

(declare-fun c!136709 () Bool)

(assert (=> b!1480642 (= c!136709 (validKeyInArray!0 (select (arr!47941 a!2862) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1480643 () Bool)

(declare-fun call!67815 () Bool)

(assert (=> b!1480643 (= e!830455 call!67815)))

(declare-fun b!1480644 () Bool)

(declare-fun e!830456 () Bool)

(assert (=> b!1480644 (= e!830455 e!830456)))

(declare-fun lt!646345 () (_ BitVec 64))

(assert (=> b!1480644 (= lt!646345 (select (arr!47941 a!2862) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!646344 () Unit!49593)

(assert (=> b!1480644 (= lt!646344 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!646345 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1480644 (arrayContainsKey!0 a!2862 lt!646345 #b00000000000000000000000000000000)))

(declare-fun lt!646343 () Unit!49593)

(assert (=> b!1480644 (= lt!646343 lt!646344)))

(declare-fun res!1006272 () Bool)

(assert (=> b!1480644 (= res!1006272 (= (seekEntryOrOpen!0 (select (arr!47941 a!2862) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) a!2862 mask!2687) (Found!12206 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1480644 (=> (not res!1006272) (not e!830456))))

(declare-fun b!1480645 () Bool)

(assert (=> b!1480645 (= e!830456 call!67815)))

(declare-fun bm!67812 () Bool)

(assert (=> bm!67812 (= call!67815 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun d!155975 () Bool)

(declare-fun res!1006271 () Bool)

(assert (=> d!155975 (=> res!1006271 e!830457)))

(assert (=> d!155975 (= res!1006271 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!48493 a!2862)))))

(assert (=> d!155975 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687) e!830457)))

(assert (= (and d!155975 (not res!1006271)) b!1480642))

(assert (= (and b!1480642 c!136709) b!1480644))

(assert (= (and b!1480642 (not c!136709)) b!1480643))

(assert (= (and b!1480644 res!1006272) b!1480645))

(assert (= (or b!1480645 b!1480643) bm!67812))

(declare-fun m!1365875 () Bool)

(assert (=> b!1480642 m!1365875))

(assert (=> b!1480642 m!1365875))

(declare-fun m!1365877 () Bool)

(assert (=> b!1480642 m!1365877))

(assert (=> b!1480644 m!1365875))

(declare-fun m!1365879 () Bool)

(assert (=> b!1480644 m!1365879))

(declare-fun m!1365881 () Bool)

(assert (=> b!1480644 m!1365881))

(assert (=> b!1480644 m!1365875))

(declare-fun m!1365883 () Bool)

(assert (=> b!1480644 m!1365883))

(declare-fun m!1365885 () Bool)

(assert (=> bm!67812 m!1365885))

(assert (=> bm!67805 d!155975))

(assert (=> b!1480276 d!155973))

(declare-fun d!155977 () Bool)

(assert (=> d!155977 (arrayContainsKey!0 a!2862 lt!646228 #b00000000000000000000000000000000)))

(declare-fun lt!646346 () Unit!49593)

(assert (=> d!155977 (= lt!646346 (choose!13 a!2862 lt!646228 j!93))))

(assert (=> d!155977 (bvsge j!93 #b00000000000000000000000000000000)))

(assert (=> d!155977 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!646228 j!93) lt!646346)))

(declare-fun bs!42630 () Bool)

(assert (= bs!42630 d!155977))

(assert (=> bs!42630 m!1365659))

(declare-fun m!1365887 () Bool)

(assert (=> bs!42630 m!1365887))

(assert (=> b!1480400 d!155977))

(declare-fun d!155979 () Bool)

(declare-fun res!1006273 () Bool)

(declare-fun e!830458 () Bool)

(assert (=> d!155979 (=> res!1006273 e!830458)))

(assert (=> d!155979 (= res!1006273 (= (select (arr!47941 a!2862) #b00000000000000000000000000000000) lt!646228))))

(assert (=> d!155979 (= (arrayContainsKey!0 a!2862 lt!646228 #b00000000000000000000000000000000) e!830458)))

(declare-fun b!1480646 () Bool)

(declare-fun e!830459 () Bool)

(assert (=> b!1480646 (= e!830458 e!830459)))

(declare-fun res!1006274 () Bool)

(assert (=> b!1480646 (=> (not res!1006274) (not e!830459))))

(assert (=> b!1480646 (= res!1006274 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!48493 a!2862)))))

(declare-fun b!1480647 () Bool)

(assert (=> b!1480647 (= e!830459 (arrayContainsKey!0 a!2862 lt!646228 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!155979 (not res!1006273)) b!1480646))

(assert (= (and b!1480646 res!1006274) b!1480647))

(assert (=> d!155979 m!1365611))

(declare-fun m!1365889 () Bool)

(assert (=> b!1480647 m!1365889))

(assert (=> b!1480400 d!155979))

(assert (=> b!1480400 d!155867))

(declare-fun b!1480648 () Bool)

(declare-fun e!830460 () Bool)

(declare-fun call!67816 () Bool)

(assert (=> b!1480648 (= e!830460 call!67816)))

(declare-fun b!1480649 () Bool)

(declare-fun e!830461 () Bool)

(assert (=> b!1480649 (= e!830461 (contains!9878 (ite c!136573 (Cons!34516 (select (arr!47941 a!2862) #b00000000000000000000000000000000) Nil!34517) Nil!34517) (select (arr!47941 a!2862) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!67813 () Bool)

(declare-fun c!136710 () Bool)

(assert (=> bm!67813 (= call!67816 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!136710 (Cons!34516 (select (arr!47941 a!2862) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!136573 (Cons!34516 (select (arr!47941 a!2862) #b00000000000000000000000000000000) Nil!34517) Nil!34517)) (ite c!136573 (Cons!34516 (select (arr!47941 a!2862) #b00000000000000000000000000000000) Nil!34517) Nil!34517))))))

(declare-fun b!1480650 () Bool)

(declare-fun e!830462 () Bool)

(assert (=> b!1480650 (= e!830462 e!830460)))

(assert (=> b!1480650 (= c!136710 (validKeyInArray!0 (select (arr!47941 a!2862) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1480651 () Bool)

(declare-fun e!830463 () Bool)

(assert (=> b!1480651 (= e!830463 e!830462)))

(declare-fun res!1006276 () Bool)

(assert (=> b!1480651 (=> (not res!1006276) (not e!830462))))

(assert (=> b!1480651 (= res!1006276 (not e!830461))))

(declare-fun res!1006275 () Bool)

(assert (=> b!1480651 (=> (not res!1006275) (not e!830461))))

(assert (=> b!1480651 (= res!1006275 (validKeyInArray!0 (select (arr!47941 a!2862) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!155981 () Bool)

(declare-fun res!1006277 () Bool)

(assert (=> d!155981 (=> res!1006277 e!830463)))

(assert (=> d!155981 (= res!1006277 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!48493 a!2862)))))

(assert (=> d!155981 (= (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!136573 (Cons!34516 (select (arr!47941 a!2862) #b00000000000000000000000000000000) Nil!34517) Nil!34517)) e!830463)))

(declare-fun b!1480652 () Bool)

(assert (=> b!1480652 (= e!830460 call!67816)))

(assert (= (and d!155981 (not res!1006277)) b!1480651))

(assert (= (and b!1480651 res!1006275) b!1480649))

(assert (= (and b!1480651 res!1006276) b!1480650))

(assert (= (and b!1480650 c!136710) b!1480652))

(assert (= (and b!1480650 (not c!136710)) b!1480648))

(assert (= (or b!1480652 b!1480648) bm!67813))

(assert (=> b!1480649 m!1365875))

(assert (=> b!1480649 m!1365875))

(declare-fun m!1365891 () Bool)

(assert (=> b!1480649 m!1365891))

(assert (=> bm!67813 m!1365875))

(declare-fun m!1365893 () Bool)

(assert (=> bm!67813 m!1365893))

(assert (=> b!1480650 m!1365875))

(assert (=> b!1480650 m!1365875))

(assert (=> b!1480650 m!1365877))

(assert (=> b!1480651 m!1365875))

(assert (=> b!1480651 m!1365875))

(assert (=> b!1480651 m!1365877))

(assert (=> bm!67793 d!155981))

(declare-fun d!155983 () Bool)

(declare-fun lt!646349 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!772 (List!34520) (InoxSet (_ BitVec 64)))

(assert (=> d!155983 (= lt!646349 (select (content!772 Nil!34517) (select (arr!47941 a!2862) #b00000000000000000000000000000000)))))

(declare-fun e!830468 () Bool)

(assert (=> d!155983 (= lt!646349 e!830468)))

(declare-fun res!1006282 () Bool)

(assert (=> d!155983 (=> (not res!1006282) (not e!830468))))

(assert (=> d!155983 (= res!1006282 ((_ is Cons!34516) Nil!34517))))

(assert (=> d!155983 (= (contains!9878 Nil!34517 (select (arr!47941 a!2862) #b00000000000000000000000000000000)) lt!646349)))

(declare-fun b!1480657 () Bool)

(declare-fun e!830469 () Bool)

(assert (=> b!1480657 (= e!830468 e!830469)))

(declare-fun res!1006283 () Bool)

(assert (=> b!1480657 (=> res!1006283 e!830469)))

(assert (=> b!1480657 (= res!1006283 (= (h!35884 Nil!34517) (select (arr!47941 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1480658 () Bool)

(assert (=> b!1480658 (= e!830469 (contains!9878 (t!49206 Nil!34517) (select (arr!47941 a!2862) #b00000000000000000000000000000000)))))

(assert (= (and d!155983 res!1006282) b!1480657))

(assert (= (and b!1480657 (not res!1006283)) b!1480658))

(declare-fun m!1365895 () Bool)

(assert (=> d!155983 m!1365895))

(assert (=> d!155983 m!1365611))

(declare-fun m!1365897 () Bool)

(assert (=> d!155983 m!1365897))

(assert (=> b!1480658 m!1365611))

(declare-fun m!1365899 () Bool)

(assert (=> b!1480658 m!1365899))

(assert (=> b!1480275 d!155983))

(assert (=> b!1480398 d!155885))

(declare-fun b!1480659 () Bool)

(declare-fun e!830470 () SeekEntryResult!12206)

(declare-fun e!830473 () SeekEntryResult!12206)

(assert (=> b!1480659 (= e!830470 e!830473)))

(declare-fun c!136712 () Bool)

(declare-fun lt!646351 () (_ BitVec 64))

(assert (=> b!1480659 (= c!136712 (or (= lt!646351 (select (arr!47941 a!2862) j!93)) (= (bvadd lt!646351 lt!646351) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1480660 () Bool)

(declare-fun lt!646350 () SeekEntryResult!12206)

(assert (=> b!1480660 (and (bvsge (index!51218 lt!646350) #b00000000000000000000000000000000) (bvslt (index!51218 lt!646350) (size!48493 a!2862)))))

(declare-fun e!830474 () Bool)

(assert (=> b!1480660 (= e!830474 (= (select (arr!47941 a!2862) (index!51218 lt!646350)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1480661 () Bool)

(assert (=> b!1480661 (= e!830470 (Intermediate!12206 true (nextIndex!0 index!646 x!665 mask!2687) (bvadd x!665 #b00000000000000000000000000000001)))))

(declare-fun b!1480662 () Bool)

(assert (=> b!1480662 (= e!830473 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!646 x!665 mask!2687) (bvadd x!665 #b00000000000000000000000000000001) mask!2687) (select (arr!47941 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1480663 () Bool)

(declare-fun e!830472 () Bool)

(assert (=> b!1480663 (= e!830472 (bvsge (x!132792 lt!646350) #b01111111111111111111111111111110))))

(declare-fun b!1480664 () Bool)

(assert (=> b!1480664 (and (bvsge (index!51218 lt!646350) #b00000000000000000000000000000000) (bvslt (index!51218 lt!646350) (size!48493 a!2862)))))

(declare-fun res!1006286 () Bool)

(assert (=> b!1480664 (= res!1006286 (= (select (arr!47941 a!2862) (index!51218 lt!646350)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1480664 (=> res!1006286 e!830474)))

(declare-fun b!1480665 () Bool)

(assert (=> b!1480665 (= e!830473 (Intermediate!12206 false (nextIndex!0 index!646 x!665 mask!2687) (bvadd x!665 #b00000000000000000000000000000001)))))

(declare-fun b!1480666 () Bool)

(assert (=> b!1480666 (and (bvsge (index!51218 lt!646350) #b00000000000000000000000000000000) (bvslt (index!51218 lt!646350) (size!48493 a!2862)))))

(declare-fun res!1006284 () Bool)

(assert (=> b!1480666 (= res!1006284 (= (select (arr!47941 a!2862) (index!51218 lt!646350)) (select (arr!47941 a!2862) j!93)))))

(assert (=> b!1480666 (=> res!1006284 e!830474)))

(declare-fun e!830471 () Bool)

(assert (=> b!1480666 (= e!830471 e!830474)))

(declare-fun b!1480667 () Bool)

(assert (=> b!1480667 (= e!830472 e!830471)))

(declare-fun res!1006285 () Bool)

(assert (=> b!1480667 (= res!1006285 (and ((_ is Intermediate!12206) lt!646350) (not (undefined!13018 lt!646350)) (bvslt (x!132792 lt!646350) #b01111111111111111111111111111110) (bvsge (x!132792 lt!646350) #b00000000000000000000000000000000) (bvsge (x!132792 lt!646350) (bvadd x!665 #b00000000000000000000000000000001))))))

(assert (=> b!1480667 (=> (not res!1006285) (not e!830471))))

(declare-fun d!155985 () Bool)

(assert (=> d!155985 e!830472))

(declare-fun c!136711 () Bool)

(assert (=> d!155985 (= c!136711 (and ((_ is Intermediate!12206) lt!646350) (undefined!13018 lt!646350)))))

(assert (=> d!155985 (= lt!646350 e!830470)))

(declare-fun c!136713 () Bool)

(assert (=> d!155985 (= c!136713 (bvsge (bvadd x!665 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!155985 (= lt!646351 (select (arr!47941 a!2862) (nextIndex!0 index!646 x!665 mask!2687)))))

(assert (=> d!155985 (validMask!0 mask!2687)))

(assert (=> d!155985 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) (select (arr!47941 a!2862) j!93) a!2862 mask!2687) lt!646350)))

(assert (= (and d!155985 c!136713) b!1480661))

(assert (= (and d!155985 (not c!136713)) b!1480659))

(assert (= (and b!1480659 c!136712) b!1480665))

(assert (= (and b!1480659 (not c!136712)) b!1480662))

(assert (= (and d!155985 c!136711) b!1480663))

(assert (= (and d!155985 (not c!136711)) b!1480667))

(assert (= (and b!1480667 res!1006285) b!1480666))

(assert (= (and b!1480666 (not res!1006284)) b!1480664))

(assert (= (and b!1480664 (not res!1006286)) b!1480660))

(declare-fun m!1365901 () Bool)

(assert (=> b!1480666 m!1365901))

(assert (=> b!1480664 m!1365901))

(assert (=> b!1480662 m!1365677))

(assert (=> b!1480662 m!1365837))

(assert (=> b!1480662 m!1365837))

(assert (=> b!1480662 m!1365463))

(declare-fun m!1365903 () Bool)

(assert (=> b!1480662 m!1365903))

(assert (=> b!1480660 m!1365901))

(assert (=> d!155985 m!1365677))

(declare-fun m!1365905 () Bool)

(assert (=> d!155985 m!1365905))

(assert (=> d!155985 m!1365499))

(assert (=> b!1480505 d!155985))

(assert (=> b!1480505 d!155963))

(declare-fun b!1480668 () Bool)

(declare-fun e!830477 () Bool)

(declare-fun e!830475 () Bool)

(assert (=> b!1480668 (= e!830477 e!830475)))

(declare-fun c!136714 () Bool)

(assert (=> b!1480668 (= c!136714 (validKeyInArray!0 (select (arr!47941 a!2862) (bvadd j!93 #b00000000000000000000000000000001))))))

(declare-fun b!1480669 () Bool)

(declare-fun call!67817 () Bool)

(assert (=> b!1480669 (= e!830475 call!67817)))

(declare-fun b!1480670 () Bool)

(declare-fun e!830476 () Bool)

(assert (=> b!1480670 (= e!830475 e!830476)))

(declare-fun lt!646354 () (_ BitVec 64))

(assert (=> b!1480670 (= lt!646354 (select (arr!47941 a!2862) (bvadd j!93 #b00000000000000000000000000000001)))))

(declare-fun lt!646353 () Unit!49593)

(assert (=> b!1480670 (= lt!646353 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!646354 (bvadd j!93 #b00000000000000000000000000000001)))))

(assert (=> b!1480670 (arrayContainsKey!0 a!2862 lt!646354 #b00000000000000000000000000000000)))

(declare-fun lt!646352 () Unit!49593)

(assert (=> b!1480670 (= lt!646352 lt!646353)))

(declare-fun res!1006288 () Bool)

(assert (=> b!1480670 (= res!1006288 (= (seekEntryOrOpen!0 (select (arr!47941 a!2862) (bvadd j!93 #b00000000000000000000000000000001)) a!2862 mask!2687) (Found!12206 (bvadd j!93 #b00000000000000000000000000000001))))))

(assert (=> b!1480670 (=> (not res!1006288) (not e!830476))))

(declare-fun b!1480671 () Bool)

(assert (=> b!1480671 (= e!830476 call!67817)))

(declare-fun bm!67814 () Bool)

(assert (=> bm!67814 (= call!67817 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!93 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun d!155987 () Bool)

(declare-fun res!1006287 () Bool)

(assert (=> d!155987 (=> res!1006287 e!830477)))

(assert (=> d!155987 (= res!1006287 (bvsge (bvadd j!93 #b00000000000000000000000000000001) (size!48493 a!2862)))))

(assert (=> d!155987 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd j!93 #b00000000000000000000000000000001) a!2862 mask!2687) e!830477)))

(assert (= (and d!155987 (not res!1006287)) b!1480668))

(assert (= (and b!1480668 c!136714) b!1480670))

(assert (= (and b!1480668 (not c!136714)) b!1480669))

(assert (= (and b!1480670 res!1006288) b!1480671))

(assert (= (or b!1480671 b!1480669) bm!67814))

(declare-fun m!1365907 () Bool)

(assert (=> b!1480668 m!1365907))

(assert (=> b!1480668 m!1365907))

(declare-fun m!1365909 () Bool)

(assert (=> b!1480668 m!1365909))

(assert (=> b!1480670 m!1365907))

(declare-fun m!1365911 () Bool)

(assert (=> b!1480670 m!1365911))

(declare-fun m!1365913 () Bool)

(assert (=> b!1480670 m!1365913))

(assert (=> b!1480670 m!1365907))

(declare-fun m!1365915 () Bool)

(assert (=> b!1480670 m!1365915))

(declare-fun m!1365917 () Bool)

(assert (=> bm!67814 m!1365917))

(assert (=> bm!67796 d!155987))

(assert (=> d!155859 d!155875))

(assert (=> b!1480277 d!155973))

(declare-fun b!1480672 () Bool)

(declare-fun e!830478 () SeekEntryResult!12206)

(declare-fun e!830481 () SeekEntryResult!12206)

(assert (=> b!1480672 (= e!830478 e!830481)))

(declare-fun c!136716 () Bool)

(declare-fun lt!646356 () (_ BitVec 64))

(assert (=> b!1480672 (= c!136716 (or (= lt!646356 lt!646137) (= (bvadd lt!646356 lt!646356) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1480673 () Bool)

(declare-fun lt!646355 () SeekEntryResult!12206)

(assert (=> b!1480673 (and (bvsge (index!51218 lt!646355) #b00000000000000000000000000000000) (bvslt (index!51218 lt!646355) (size!48493 lt!646136)))))

(declare-fun e!830482 () Bool)

(assert (=> b!1480673 (= e!830482 (= (select (arr!47941 lt!646136) (index!51218 lt!646355)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1480674 () Bool)

(assert (=> b!1480674 (= e!830478 (Intermediate!12206 true (nextIndex!0 (toIndex!0 lt!646137 mask!2687) #b00000000000000000000000000000000 mask!2687) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!1480675 () Bool)

(assert (=> b!1480675 (= e!830481 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 (toIndex!0 lt!646137 mask!2687) #b00000000000000000000000000000000 mask!2687) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2687) lt!646137 lt!646136 mask!2687))))

(declare-fun b!1480676 () Bool)

(declare-fun e!830480 () Bool)

(assert (=> b!1480676 (= e!830480 (bvsge (x!132792 lt!646355) #b01111111111111111111111111111110))))

(declare-fun b!1480677 () Bool)

(assert (=> b!1480677 (and (bvsge (index!51218 lt!646355) #b00000000000000000000000000000000) (bvslt (index!51218 lt!646355) (size!48493 lt!646136)))))

(declare-fun res!1006291 () Bool)

(assert (=> b!1480677 (= res!1006291 (= (select (arr!47941 lt!646136) (index!51218 lt!646355)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1480677 (=> res!1006291 e!830482)))

(declare-fun b!1480678 () Bool)

(assert (=> b!1480678 (= e!830481 (Intermediate!12206 false (nextIndex!0 (toIndex!0 lt!646137 mask!2687) #b00000000000000000000000000000000 mask!2687) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!1480679 () Bool)

(assert (=> b!1480679 (and (bvsge (index!51218 lt!646355) #b00000000000000000000000000000000) (bvslt (index!51218 lt!646355) (size!48493 lt!646136)))))

(declare-fun res!1006289 () Bool)

(assert (=> b!1480679 (= res!1006289 (= (select (arr!47941 lt!646136) (index!51218 lt!646355)) lt!646137))))

(assert (=> b!1480679 (=> res!1006289 e!830482)))

(declare-fun e!830479 () Bool)

(assert (=> b!1480679 (= e!830479 e!830482)))

(declare-fun b!1480680 () Bool)

(assert (=> b!1480680 (= e!830480 e!830479)))

(declare-fun res!1006290 () Bool)

(assert (=> b!1480680 (= res!1006290 (and ((_ is Intermediate!12206) lt!646355) (not (undefined!13018 lt!646355)) (bvslt (x!132792 lt!646355) #b01111111111111111111111111111110) (bvsge (x!132792 lt!646355) #b00000000000000000000000000000000) (bvsge (x!132792 lt!646355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1480680 (=> (not res!1006290) (not e!830479))))

(declare-fun d!155989 () Bool)

(assert (=> d!155989 e!830480))

(declare-fun c!136715 () Bool)

(assert (=> d!155989 (= c!136715 (and ((_ is Intermediate!12206) lt!646355) (undefined!13018 lt!646355)))))

(assert (=> d!155989 (= lt!646355 e!830478)))

(declare-fun c!136717 () Bool)

(assert (=> d!155989 (= c!136717 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!155989 (= lt!646356 (select (arr!47941 lt!646136) (nextIndex!0 (toIndex!0 lt!646137 mask!2687) #b00000000000000000000000000000000 mask!2687)))))

(assert (=> d!155989 (validMask!0 mask!2687)))

(assert (=> d!155989 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!646137 mask!2687) #b00000000000000000000000000000000 mask!2687) lt!646137 lt!646136 mask!2687) lt!646355)))

(assert (= (and d!155989 c!136717) b!1480674))

(assert (= (and d!155989 (not c!136717)) b!1480672))

(assert (= (and b!1480672 c!136716) b!1480678))

(assert (= (and b!1480672 (not c!136716)) b!1480675))

(assert (= (and d!155989 c!136715) b!1480676))

(assert (= (and d!155989 (not c!136715)) b!1480680))

(assert (= (and b!1480680 res!1006290) b!1480679))

(assert (= (and b!1480679 (not res!1006289)) b!1480677))

(assert (= (and b!1480677 (not res!1006291)) b!1480673))

(declare-fun m!1365919 () Bool)

(assert (=> b!1480679 m!1365919))

(assert (=> b!1480677 m!1365919))

(assert (=> b!1480675 m!1365643))

(declare-fun m!1365921 () Bool)

(assert (=> b!1480675 m!1365921))

(assert (=> b!1480675 m!1365921))

(declare-fun m!1365923 () Bool)

(assert (=> b!1480675 m!1365923))

(assert (=> b!1480673 m!1365919))

(assert (=> d!155989 m!1365643))

(declare-fun m!1365925 () Bool)

(assert (=> d!155989 m!1365925))

(assert (=> d!155989 m!1365499))

(assert (=> b!1480354 d!155989))

(declare-fun d!155991 () Bool)

(declare-fun lt!646357 () (_ BitVec 32))

(assert (=> d!155991 (and (bvsge lt!646357 #b00000000000000000000000000000000) (bvslt lt!646357 (bvadd mask!2687 #b00000000000000000000000000000001)))))

(assert (=> d!155991 (= lt!646357 (choose!52 (toIndex!0 lt!646137 mask!2687) #b00000000000000000000000000000000 mask!2687))))

(assert (=> d!155991 (validMask!0 mask!2687)))

(assert (=> d!155991 (= (nextIndex!0 (toIndex!0 lt!646137 mask!2687) #b00000000000000000000000000000000 mask!2687) lt!646357)))

(declare-fun bs!42631 () Bool)

(assert (= bs!42631 d!155991))

(assert (=> bs!42631 m!1365453))

(declare-fun m!1365927 () Bool)

(assert (=> bs!42631 m!1365927))

(assert (=> bs!42631 m!1365499))

(assert (=> b!1480354 d!155991))

(declare-fun b!1480681 () Bool)

(declare-fun e!830483 () SeekEntryResult!12206)

(declare-fun e!830486 () SeekEntryResult!12206)

(assert (=> b!1480681 (= e!830483 e!830486)))

(declare-fun lt!646359 () (_ BitVec 64))

(declare-fun c!136719 () Bool)

(assert (=> b!1480681 (= c!136719 (or (= lt!646359 (select (arr!47941 a!2862) j!93)) (= (bvadd lt!646359 lt!646359) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1480682 () Bool)

(declare-fun lt!646358 () SeekEntryResult!12206)

(assert (=> b!1480682 (and (bvsge (index!51218 lt!646358) #b00000000000000000000000000000000) (bvslt (index!51218 lt!646358) (size!48493 a!2862)))))

(declare-fun e!830487 () Bool)

(assert (=> b!1480682 (= e!830487 (= (select (arr!47941 a!2862) (index!51218 lt!646358)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1480683 () Bool)

(assert (=> b!1480683 (= e!830483 (Intermediate!12206 true (nextIndex!0 (toIndex!0 (select (arr!47941 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!1480684 () Bool)

(assert (=> b!1480684 (= e!830486 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 (toIndex!0 (select (arr!47941 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2687) (select (arr!47941 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1480685 () Bool)

(declare-fun e!830485 () Bool)

(assert (=> b!1480685 (= e!830485 (bvsge (x!132792 lt!646358) #b01111111111111111111111111111110))))

(declare-fun b!1480686 () Bool)

(assert (=> b!1480686 (and (bvsge (index!51218 lt!646358) #b00000000000000000000000000000000) (bvslt (index!51218 lt!646358) (size!48493 a!2862)))))

(declare-fun res!1006294 () Bool)

(assert (=> b!1480686 (= res!1006294 (= (select (arr!47941 a!2862) (index!51218 lt!646358)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1480686 (=> res!1006294 e!830487)))

(declare-fun b!1480687 () Bool)

(assert (=> b!1480687 (= e!830486 (Intermediate!12206 false (nextIndex!0 (toIndex!0 (select (arr!47941 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!1480688 () Bool)

(assert (=> b!1480688 (and (bvsge (index!51218 lt!646358) #b00000000000000000000000000000000) (bvslt (index!51218 lt!646358) (size!48493 a!2862)))))

(declare-fun res!1006292 () Bool)

(assert (=> b!1480688 (= res!1006292 (= (select (arr!47941 a!2862) (index!51218 lt!646358)) (select (arr!47941 a!2862) j!93)))))

(assert (=> b!1480688 (=> res!1006292 e!830487)))

(declare-fun e!830484 () Bool)

(assert (=> b!1480688 (= e!830484 e!830487)))

(declare-fun b!1480689 () Bool)

(assert (=> b!1480689 (= e!830485 e!830484)))

(declare-fun res!1006293 () Bool)

(assert (=> b!1480689 (= res!1006293 (and ((_ is Intermediate!12206) lt!646358) (not (undefined!13018 lt!646358)) (bvslt (x!132792 lt!646358) #b01111111111111111111111111111110) (bvsge (x!132792 lt!646358) #b00000000000000000000000000000000) (bvsge (x!132792 lt!646358) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1480689 (=> (not res!1006293) (not e!830484))))

(declare-fun d!155993 () Bool)

(assert (=> d!155993 e!830485))

(declare-fun c!136718 () Bool)

(assert (=> d!155993 (= c!136718 (and ((_ is Intermediate!12206) lt!646358) (undefined!13018 lt!646358)))))

(assert (=> d!155993 (= lt!646358 e!830483)))

(declare-fun c!136720 () Bool)

(assert (=> d!155993 (= c!136720 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!155993 (= lt!646359 (select (arr!47941 a!2862) (nextIndex!0 (toIndex!0 (select (arr!47941 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687)))))

(assert (=> d!155993 (validMask!0 mask!2687)))

(assert (=> d!155993 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47941 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (select (arr!47941 a!2862) j!93) a!2862 mask!2687) lt!646358)))

(assert (= (and d!155993 c!136720) b!1480683))

(assert (= (and d!155993 (not c!136720)) b!1480681))

(assert (= (and b!1480681 c!136719) b!1480687))

(assert (= (and b!1480681 (not c!136719)) b!1480684))

(assert (= (and d!155993 c!136718) b!1480685))

(assert (= (and d!155993 (not c!136718)) b!1480689))

(assert (= (and b!1480689 res!1006293) b!1480688))

(assert (= (and b!1480688 (not res!1006292)) b!1480686))

(assert (= (and b!1480686 (not res!1006294)) b!1480682))

(declare-fun m!1365929 () Bool)

(assert (=> b!1480688 m!1365929))

(assert (=> b!1480686 m!1365929))

(assert (=> b!1480684 m!1365605))

(declare-fun m!1365931 () Bool)

(assert (=> b!1480684 m!1365931))

(assert (=> b!1480684 m!1365931))

(assert (=> b!1480684 m!1365463))

(declare-fun m!1365933 () Bool)

(assert (=> b!1480684 m!1365933))

(assert (=> b!1480682 m!1365929))

(assert (=> d!155993 m!1365605))

(declare-fun m!1365935 () Bool)

(assert (=> d!155993 m!1365935))

(assert (=> d!155993 m!1365499))

(assert (=> b!1480258 d!155993))

(declare-fun d!155995 () Bool)

(declare-fun lt!646360 () (_ BitVec 32))

(assert (=> d!155995 (and (bvsge lt!646360 #b00000000000000000000000000000000) (bvslt lt!646360 (bvadd mask!2687 #b00000000000000000000000000000001)))))

(assert (=> d!155995 (= lt!646360 (choose!52 (toIndex!0 (select (arr!47941 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687))))

(assert (=> d!155995 (validMask!0 mask!2687)))

(assert (=> d!155995 (= (nextIndex!0 (toIndex!0 (select (arr!47941 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) lt!646360)))

(declare-fun bs!42632 () Bool)

(assert (= bs!42632 d!155995))

(assert (=> bs!42632 m!1365495))

(declare-fun m!1365937 () Bool)

(assert (=> bs!42632 m!1365937))

(assert (=> bs!42632 m!1365499))

(assert (=> b!1480258 d!155995))

(declare-fun e!830488 () SeekEntryResult!12206)

(declare-fun b!1480691 () Bool)

(assert (=> b!1480691 (= e!830488 (seekKeyOrZeroReturnVacant!0 (bvadd (x!132792 lt!646199) #b00000000000000000000000000000001) (nextIndex!0 (index!51218 lt!646199) (x!132792 lt!646199) mask!2687) (index!51218 lt!646199) (select (arr!47941 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1480692 () Bool)

(declare-fun e!830489 () SeekEntryResult!12206)

(declare-fun e!830490 () SeekEntryResult!12206)

(assert (=> b!1480692 (= e!830489 e!830490)))

(declare-fun lt!646362 () (_ BitVec 64))

(declare-fun c!136723 () Bool)

(assert (=> b!1480692 (= c!136723 (= lt!646362 (select (arr!47941 a!2862) j!93)))))

(declare-fun b!1480693 () Bool)

(declare-fun c!136721 () Bool)

(assert (=> b!1480693 (= c!136721 (= lt!646362 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1480693 (= e!830490 e!830488)))

(declare-fun lt!646361 () SeekEntryResult!12206)

(declare-fun d!155997 () Bool)

(assert (=> d!155997 (and (or ((_ is Undefined!12206) lt!646361) (not ((_ is Found!12206) lt!646361)) (and (bvsge (index!51217 lt!646361) #b00000000000000000000000000000000) (bvslt (index!51217 lt!646361) (size!48493 a!2862)))) (or ((_ is Undefined!12206) lt!646361) ((_ is Found!12206) lt!646361) (not ((_ is MissingVacant!12206) lt!646361)) (not (= (index!51219 lt!646361) (index!51218 lt!646199))) (and (bvsge (index!51219 lt!646361) #b00000000000000000000000000000000) (bvslt (index!51219 lt!646361) (size!48493 a!2862)))) (or ((_ is Undefined!12206) lt!646361) (ite ((_ is Found!12206) lt!646361) (= (select (arr!47941 a!2862) (index!51217 lt!646361)) (select (arr!47941 a!2862) j!93)) (and ((_ is MissingVacant!12206) lt!646361) (= (index!51219 lt!646361) (index!51218 lt!646199)) (= (select (arr!47941 a!2862) (index!51219 lt!646361)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!155997 (= lt!646361 e!830489)))

(declare-fun c!136722 () Bool)

(assert (=> d!155997 (= c!136722 (bvsge (x!132792 lt!646199) #b01111111111111111111111111111110))))

(assert (=> d!155997 (= lt!646362 (select (arr!47941 a!2862) (index!51218 lt!646199)))))

(assert (=> d!155997 (validMask!0 mask!2687)))

(assert (=> d!155997 (= (seekKeyOrZeroReturnVacant!0 (x!132792 lt!646199) (index!51218 lt!646199) (index!51218 lt!646199) (select (arr!47941 a!2862) j!93) a!2862 mask!2687) lt!646361)))

(declare-fun b!1480690 () Bool)

(assert (=> b!1480690 (= e!830490 (Found!12206 (index!51218 lt!646199)))))

(declare-fun b!1480694 () Bool)

(assert (=> b!1480694 (= e!830489 Undefined!12206)))

(declare-fun b!1480695 () Bool)

(assert (=> b!1480695 (= e!830488 (MissingVacant!12206 (index!51218 lt!646199)))))

(assert (= (and d!155997 c!136722) b!1480694))

(assert (= (and d!155997 (not c!136722)) b!1480692))

(assert (= (and b!1480692 c!136723) b!1480690))

(assert (= (and b!1480692 (not c!136723)) b!1480693))

(assert (= (and b!1480693 c!136721) b!1480695))

(assert (= (and b!1480693 (not c!136721)) b!1480691))

(declare-fun m!1365939 () Bool)

(assert (=> b!1480691 m!1365939))

(assert (=> b!1480691 m!1365939))

(assert (=> b!1480691 m!1365463))

(declare-fun m!1365941 () Bool)

(assert (=> b!1480691 m!1365941))

(declare-fun m!1365943 () Bool)

(assert (=> d!155997 m!1365943))

(declare-fun m!1365945 () Bool)

(assert (=> d!155997 m!1365945))

(assert (=> d!155997 m!1365625))

(assert (=> d!155997 m!1365499))

(assert (=> b!1480339 d!155997))

(assert (=> d!155881 d!155875))

(declare-fun b!1480696 () Bool)

(declare-fun e!830491 () SeekEntryResult!12206)

(declare-fun e!830494 () SeekEntryResult!12206)

(assert (=> b!1480696 (= e!830491 e!830494)))

(declare-fun c!136725 () Bool)

(declare-fun lt!646364 () (_ BitVec 64))

(assert (=> b!1480696 (= c!136725 (or (= lt!646364 lt!646137) (= (bvadd lt!646364 lt!646364) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1480697 () Bool)

(declare-fun lt!646363 () SeekEntryResult!12206)

(assert (=> b!1480697 (and (bvsge (index!51218 lt!646363) #b00000000000000000000000000000000) (bvslt (index!51218 lt!646363) (size!48493 lt!646136)))))

(declare-fun e!830495 () Bool)

(assert (=> b!1480697 (= e!830495 (= (select (arr!47941 lt!646136) (index!51218 lt!646363)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1480698 () Bool)

(assert (=> b!1480698 (= e!830491 (Intermediate!12206 true (nextIndex!0 index!646 x!665 mask!2687) (bvadd x!665 #b00000000000000000000000000000001)))))

(declare-fun b!1480699 () Bool)

(assert (=> b!1480699 (= e!830494 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!646 x!665 mask!2687) (bvadd x!665 #b00000000000000000000000000000001) mask!2687) lt!646137 lt!646136 mask!2687))))

(declare-fun b!1480700 () Bool)

(declare-fun e!830493 () Bool)

(assert (=> b!1480700 (= e!830493 (bvsge (x!132792 lt!646363) #b01111111111111111111111111111110))))

(declare-fun b!1480701 () Bool)

(assert (=> b!1480701 (and (bvsge (index!51218 lt!646363) #b00000000000000000000000000000000) (bvslt (index!51218 lt!646363) (size!48493 lt!646136)))))

(declare-fun res!1006297 () Bool)

(assert (=> b!1480701 (= res!1006297 (= (select (arr!47941 lt!646136) (index!51218 lt!646363)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1480701 (=> res!1006297 e!830495)))

(declare-fun b!1480702 () Bool)

(assert (=> b!1480702 (= e!830494 (Intermediate!12206 false (nextIndex!0 index!646 x!665 mask!2687) (bvadd x!665 #b00000000000000000000000000000001)))))

(declare-fun b!1480703 () Bool)

(assert (=> b!1480703 (and (bvsge (index!51218 lt!646363) #b00000000000000000000000000000000) (bvslt (index!51218 lt!646363) (size!48493 lt!646136)))))

(declare-fun res!1006295 () Bool)

(assert (=> b!1480703 (= res!1006295 (= (select (arr!47941 lt!646136) (index!51218 lt!646363)) lt!646137))))

(assert (=> b!1480703 (=> res!1006295 e!830495)))

(declare-fun e!830492 () Bool)

(assert (=> b!1480703 (= e!830492 e!830495)))

(declare-fun b!1480704 () Bool)

(assert (=> b!1480704 (= e!830493 e!830492)))

(declare-fun res!1006296 () Bool)

(assert (=> b!1480704 (= res!1006296 (and ((_ is Intermediate!12206) lt!646363) (not (undefined!13018 lt!646363)) (bvslt (x!132792 lt!646363) #b01111111111111111111111111111110) (bvsge (x!132792 lt!646363) #b00000000000000000000000000000000) (bvsge (x!132792 lt!646363) (bvadd x!665 #b00000000000000000000000000000001))))))

(assert (=> b!1480704 (=> (not res!1006296) (not e!830492))))

(declare-fun d!155999 () Bool)

(assert (=> d!155999 e!830493))

(declare-fun c!136724 () Bool)

(assert (=> d!155999 (= c!136724 (and ((_ is Intermediate!12206) lt!646363) (undefined!13018 lt!646363)))))

(assert (=> d!155999 (= lt!646363 e!830491)))

(declare-fun c!136726 () Bool)

(assert (=> d!155999 (= c!136726 (bvsge (bvadd x!665 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!155999 (= lt!646364 (select (arr!47941 lt!646136) (nextIndex!0 index!646 x!665 mask!2687)))))

(assert (=> d!155999 (validMask!0 mask!2687)))

(assert (=> d!155999 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) lt!646137 lt!646136 mask!2687) lt!646363)))

(assert (= (and d!155999 c!136726) b!1480698))

(assert (= (and d!155999 (not c!136726)) b!1480696))

(assert (= (and b!1480696 c!136725) b!1480702))

(assert (= (and b!1480696 (not c!136725)) b!1480699))

(assert (= (and d!155999 c!136724) b!1480700))

(assert (= (and d!155999 (not c!136724)) b!1480704))

(assert (= (and b!1480704 res!1006296) b!1480703))

(assert (= (and b!1480703 (not res!1006295)) b!1480701))

(assert (= (and b!1480701 (not res!1006297)) b!1480697))

(declare-fun m!1365947 () Bool)

(assert (=> b!1480703 m!1365947))

(assert (=> b!1480701 m!1365947))

(assert (=> b!1480699 m!1365677))

(assert (=> b!1480699 m!1365837))

(assert (=> b!1480699 m!1365837))

(declare-fun m!1365949 () Bool)

(assert (=> b!1480699 m!1365949))

(assert (=> b!1480697 m!1365947))

(assert (=> d!155999 m!1365677))

(assert (=> d!155999 m!1365845))

(assert (=> d!155999 m!1365499))

(assert (=> b!1480411 d!155999))

(assert (=> b!1480411 d!155963))

(assert (=> d!155909 d!155875))

(assert (=> d!155891 d!155887))

(declare-fun d!156001 () Bool)

(assert (=> d!156001 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(assert (=> d!156001 true))

(declare-fun _$72!149 () Unit!49593)

(assert (=> d!156001 (= (choose!38 a!2862 mask!2687 #b00000000000000000000000000000000 j!93) _$72!149)))

(declare-fun bs!42633 () Bool)

(assert (= bs!42633 d!156001))

(assert (=> bs!42633 m!1365471))

(assert (=> d!155891 d!156001))

(assert (=> d!155891 d!155875))

(check-sat (not d!155995) (not b!1480644) (not d!155967) (not bm!67813) (not b!1480670) (not d!155985) (not b!1480675) (not b!1480662) (not d!155989) (not d!155999) (not d!155961) (not b!1480625) (not d!155963) (not b!1480668) (not b!1480691) (not b!1480658) (not d!155991) (not b!1480639) (not b!1480699) (not b!1480651) (not d!155965) (not bm!67812) (not d!155983) (not d!155971) (not d!156001) (not b!1480619) (not d!155993) (not b!1480649) (not b!1480635) (not b!1480642) (not bm!67814) (not b!1480684) (not d!155997) (not b!1480647) (not b!1480650) (not d!155977))
(check-sat)
