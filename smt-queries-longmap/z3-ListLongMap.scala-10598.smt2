; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124696 () Bool)

(assert start!124696)

(declare-fun b!1445774 () Bool)

(declare-fun res!977702 () Bool)

(declare-fun e!814350 () Bool)

(assert (=> b!1445774 (=> (not res!977702) (not e!814350))))

(declare-datatypes ((array!98122 0))(
  ( (array!98123 (arr!47350 (Array (_ BitVec 32) (_ BitVec 64))) (size!47902 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98122)

(declare-datatypes ((List!33929 0))(
  ( (Nil!33926) (Cons!33925 (h!35275 (_ BitVec 64)) (t!48615 List!33929)) )
))
(declare-fun arrayNoDuplicates!0 (array!98122 (_ BitVec 32) List!33929) Bool)

(assert (=> b!1445774 (= res!977702 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33926))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!814348 () Bool)

(declare-fun b!1445775 () Bool)

(declare-fun lt!634419 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!634420 () array!98122)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11627 0))(
  ( (MissingZero!11627 (index!48900 (_ BitVec 32))) (Found!11627 (index!48901 (_ BitVec 32))) (Intermediate!11627 (undefined!12439 Bool) (index!48902 (_ BitVec 32)) (x!130583 (_ BitVec 32))) (Undefined!11627) (MissingVacant!11627 (index!48903 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98122 (_ BitVec 32)) SeekEntryResult!11627)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98122 (_ BitVec 32)) SeekEntryResult!11627)

(assert (=> b!1445775 (= e!814348 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634419 lt!634420 mask!2687) (seekEntryOrOpen!0 lt!634419 lt!634420 mask!2687)))))

(declare-fun b!1445776 () Bool)

(declare-fun res!977712 () Bool)

(declare-fun e!814346 () Bool)

(assert (=> b!1445776 (=> (not res!977712) (not e!814346))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1445776 (= res!977712 (= (seekEntryOrOpen!0 (select (arr!47350 a!2862) j!93) a!2862 mask!2687) (Found!11627 j!93)))))

(declare-fun b!1445777 () Bool)

(declare-fun res!977708 () Bool)

(assert (=> b!1445777 (=> (not res!977708) (not e!814350))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1445777 (= res!977708 (and (= (size!47902 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47902 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47902 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1445778 () Bool)

(declare-fun e!814345 () Bool)

(declare-fun e!814344 () Bool)

(assert (=> b!1445778 (= e!814345 e!814344)))

(declare-fun res!977711 () Bool)

(assert (=> b!1445778 (=> (not res!977711) (not e!814344))))

(declare-fun lt!634422 () SeekEntryResult!11627)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98122 (_ BitVec 32)) SeekEntryResult!11627)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1445778 (= res!977711 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47350 a!2862) j!93) mask!2687) (select (arr!47350 a!2862) j!93) a!2862 mask!2687) lt!634422))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1445778 (= lt!634422 (Intermediate!11627 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1445779 () Bool)

(declare-fun res!977715 () Bool)

(assert (=> b!1445779 (=> (not res!977715) (not e!814350))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1445779 (= res!977715 (validKeyInArray!0 (select (arr!47350 a!2862) i!1006)))))

(declare-fun b!1445781 () Bool)

(declare-fun res!977705 () Bool)

(declare-fun e!814349 () Bool)

(assert (=> b!1445781 (=> (not res!977705) (not e!814349))))

(assert (=> b!1445781 (= res!977705 e!814348)))

(declare-fun c!133549 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1445781 (= c!133549 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1445782 () Bool)

(declare-fun res!977714 () Bool)

(assert (=> b!1445782 (=> (not res!977714) (not e!814350))))

(assert (=> b!1445782 (= res!977714 (validKeyInArray!0 (select (arr!47350 a!2862) j!93)))))

(declare-fun b!1445783 () Bool)

(declare-fun res!977710 () Bool)

(assert (=> b!1445783 (=> (not res!977710) (not e!814349))))

(assert (=> b!1445783 (= res!977710 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1445784 () Bool)

(assert (=> b!1445784 (= e!814350 e!814345)))

(declare-fun res!977707 () Bool)

(assert (=> b!1445784 (=> (not res!977707) (not e!814345))))

(assert (=> b!1445784 (= res!977707 (= (select (store (arr!47350 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1445784 (= lt!634420 (array!98123 (store (arr!47350 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47902 a!2862)))))

(declare-fun b!1445785 () Bool)

(declare-fun res!977709 () Bool)

(assert (=> b!1445785 (=> (not res!977709) (not e!814344))))

(assert (=> b!1445785 (= res!977709 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47350 a!2862) j!93) a!2862 mask!2687) lt!634422))))

(declare-fun b!1445780 () Bool)

(declare-fun lt!634421 () SeekEntryResult!11627)

(assert (=> b!1445780 (= e!814348 (= lt!634421 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634419 lt!634420 mask!2687)))))

(declare-fun res!977703 () Bool)

(assert (=> start!124696 (=> (not res!977703) (not e!814350))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124696 (= res!977703 (validMask!0 mask!2687))))

(assert (=> start!124696 e!814350))

(assert (=> start!124696 true))

(declare-fun array_inv!36583 (array!98122) Bool)

(assert (=> start!124696 (array_inv!36583 a!2862)))

(declare-fun b!1445786 () Bool)

(assert (=> b!1445786 (= e!814344 e!814349)))

(declare-fun res!977713 () Bool)

(assert (=> b!1445786 (=> (not res!977713) (not e!814349))))

(assert (=> b!1445786 (= res!977713 (= lt!634421 (Intermediate!11627 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1445786 (= lt!634421 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634419 mask!2687) lt!634419 lt!634420 mask!2687))))

(assert (=> b!1445786 (= lt!634419 (select (store (arr!47350 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1445787 () Bool)

(declare-fun res!977716 () Bool)

(assert (=> b!1445787 (=> (not res!977716) (not e!814350))))

(assert (=> b!1445787 (= res!977716 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47902 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47902 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47902 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1445788 () Bool)

(assert (=> b!1445788 (= e!814346 (or (= (select (arr!47350 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47350 a!2862) intermediateBeforeIndex!19) (select (arr!47350 a!2862) j!93))))))

(declare-fun b!1445789 () Bool)

(assert (=> b!1445789 (= e!814349 (not true))))

(assert (=> b!1445789 e!814346))

(declare-fun res!977704 () Bool)

(assert (=> b!1445789 (=> (not res!977704) (not e!814346))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98122 (_ BitVec 32)) Bool)

(assert (=> b!1445789 (= res!977704 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48591 0))(
  ( (Unit!48592) )
))
(declare-fun lt!634418 () Unit!48591)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98122 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48591)

(assert (=> b!1445789 (= lt!634418 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1445790 () Bool)

(declare-fun res!977706 () Bool)

(assert (=> b!1445790 (=> (not res!977706) (not e!814350))))

(assert (=> b!1445790 (= res!977706 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!124696 res!977703) b!1445777))

(assert (= (and b!1445777 res!977708) b!1445779))

(assert (= (and b!1445779 res!977715) b!1445782))

(assert (= (and b!1445782 res!977714) b!1445790))

(assert (= (and b!1445790 res!977706) b!1445774))

(assert (= (and b!1445774 res!977702) b!1445787))

(assert (= (and b!1445787 res!977716) b!1445784))

(assert (= (and b!1445784 res!977707) b!1445778))

(assert (= (and b!1445778 res!977711) b!1445785))

(assert (= (and b!1445785 res!977709) b!1445786))

(assert (= (and b!1445786 res!977713) b!1445781))

(assert (= (and b!1445781 c!133549) b!1445780))

(assert (= (and b!1445781 (not c!133549)) b!1445775))

(assert (= (and b!1445781 res!977705) b!1445783))

(assert (= (and b!1445783 res!977710) b!1445789))

(assert (= (and b!1445789 res!977704) b!1445776))

(assert (= (and b!1445776 res!977712) b!1445788))

(declare-fun m!1334211 () Bool)

(assert (=> b!1445789 m!1334211))

(declare-fun m!1334213 () Bool)

(assert (=> b!1445789 m!1334213))

(declare-fun m!1334215 () Bool)

(assert (=> b!1445790 m!1334215))

(declare-fun m!1334217 () Bool)

(assert (=> b!1445774 m!1334217))

(declare-fun m!1334219 () Bool)

(assert (=> b!1445784 m!1334219))

(declare-fun m!1334221 () Bool)

(assert (=> b!1445784 m!1334221))

(declare-fun m!1334223 () Bool)

(assert (=> b!1445782 m!1334223))

(assert (=> b!1445782 m!1334223))

(declare-fun m!1334225 () Bool)

(assert (=> b!1445782 m!1334225))

(declare-fun m!1334227 () Bool)

(assert (=> b!1445775 m!1334227))

(declare-fun m!1334229 () Bool)

(assert (=> b!1445775 m!1334229))

(declare-fun m!1334231 () Bool)

(assert (=> b!1445779 m!1334231))

(assert (=> b!1445779 m!1334231))

(declare-fun m!1334233 () Bool)

(assert (=> b!1445779 m!1334233))

(declare-fun m!1334235 () Bool)

(assert (=> b!1445780 m!1334235))

(assert (=> b!1445776 m!1334223))

(assert (=> b!1445776 m!1334223))

(declare-fun m!1334237 () Bool)

(assert (=> b!1445776 m!1334237))

(assert (=> b!1445778 m!1334223))

(assert (=> b!1445778 m!1334223))

(declare-fun m!1334239 () Bool)

(assert (=> b!1445778 m!1334239))

(assert (=> b!1445778 m!1334239))

(assert (=> b!1445778 m!1334223))

(declare-fun m!1334241 () Bool)

(assert (=> b!1445778 m!1334241))

(declare-fun m!1334243 () Bool)

(assert (=> start!124696 m!1334243))

(declare-fun m!1334245 () Bool)

(assert (=> start!124696 m!1334245))

(assert (=> b!1445785 m!1334223))

(assert (=> b!1445785 m!1334223))

(declare-fun m!1334247 () Bool)

(assert (=> b!1445785 m!1334247))

(declare-fun m!1334249 () Bool)

(assert (=> b!1445788 m!1334249))

(assert (=> b!1445788 m!1334223))

(declare-fun m!1334251 () Bool)

(assert (=> b!1445786 m!1334251))

(assert (=> b!1445786 m!1334251))

(declare-fun m!1334253 () Bool)

(assert (=> b!1445786 m!1334253))

(assert (=> b!1445786 m!1334219))

(declare-fun m!1334255 () Bool)

(assert (=> b!1445786 m!1334255))

(check-sat (not b!1445782) (not b!1445779) (not b!1445778) (not start!124696) (not b!1445776) (not b!1445786) (not b!1445789) (not b!1445785) (not b!1445780) (not b!1445775) (not b!1445774) (not b!1445790))
(check-sat)
