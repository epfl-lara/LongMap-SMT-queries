; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124552 () Bool)

(assert start!124552)

(declare-fun b!1442039 () Bool)

(declare-fun res!974406 () Bool)

(declare-fun e!812782 () Bool)

(assert (=> b!1442039 (=> (not res!974406) (not e!812782))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!97978 0))(
  ( (array!97979 (arr!47278 (Array (_ BitVec 32) (_ BitVec 64))) (size!47830 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97978)

(assert (=> b!1442039 (= res!974406 (and (= (size!47830 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47830 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47830 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1442040 () Bool)

(declare-fun e!812779 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1442040 (= e!812779 (not (or (not (= (select (arr!47278 a!2862) index!646) (select (store (arr!47278 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47278 a!2862) index!646) (select (arr!47278 a!2862) j!93))) (bvsge mask!2687 #b00000000000000000000000000000000))))))

(declare-fun e!812781 () Bool)

(assert (=> b!1442040 e!812781))

(declare-fun res!974411 () Bool)

(assert (=> b!1442040 (=> (not res!974411) (not e!812781))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97978 (_ BitVec 32)) Bool)

(assert (=> b!1442040 (= res!974411 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48447 0))(
  ( (Unit!48448) )
))
(declare-fun lt!633269 () Unit!48447)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97978 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48447)

(assert (=> b!1442040 (= lt!633269 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1442041 () Bool)

(declare-fun res!974412 () Bool)

(assert (=> b!1442041 (=> (not res!974412) (not e!812781))))

(declare-datatypes ((SeekEntryResult!11555 0))(
  ( (MissingZero!11555 (index!48612 (_ BitVec 32))) (Found!11555 (index!48613 (_ BitVec 32))) (Intermediate!11555 (undefined!12367 Bool) (index!48614 (_ BitVec 32)) (x!130319 (_ BitVec 32))) (Undefined!11555) (MissingVacant!11555 (index!48615 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97978 (_ BitVec 32)) SeekEntryResult!11555)

(assert (=> b!1442041 (= res!974412 (= (seekEntryOrOpen!0 (select (arr!47278 a!2862) j!93) a!2862 mask!2687) (Found!11555 j!93)))))

(declare-fun b!1442042 () Bool)

(declare-fun res!974404 () Bool)

(assert (=> b!1442042 (=> (not res!974404) (not e!812782))))

(declare-datatypes ((List!33857 0))(
  ( (Nil!33854) (Cons!33853 (h!35203 (_ BitVec 64)) (t!48543 List!33857)) )
))
(declare-fun arrayNoDuplicates!0 (array!97978 (_ BitVec 32) List!33857) Bool)

(assert (=> b!1442042 (= res!974404 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33854))))

(declare-fun res!974402 () Bool)

(assert (=> start!124552 (=> (not res!974402) (not e!812782))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124552 (= res!974402 (validMask!0 mask!2687))))

(assert (=> start!124552 e!812782))

(assert (=> start!124552 true))

(declare-fun array_inv!36511 (array!97978) Bool)

(assert (=> start!124552 (array_inv!36511 a!2862)))

(declare-fun b!1442043 () Bool)

(declare-fun res!974405 () Bool)

(assert (=> b!1442043 (=> (not res!974405) (not e!812779))))

(declare-fun e!812780 () Bool)

(assert (=> b!1442043 (= res!974405 e!812780)))

(declare-fun c!133333 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1442043 (= c!133333 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1442044 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1442044 (= e!812781 (or (= (select (arr!47278 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47278 a!2862) intermediateBeforeIndex!19) (select (arr!47278 a!2862) j!93))))))

(declare-fun b!1442045 () Bool)

(declare-fun e!812784 () Bool)

(assert (=> b!1442045 (= e!812784 e!812779)))

(declare-fun res!974401 () Bool)

(assert (=> b!1442045 (=> (not res!974401) (not e!812779))))

(declare-fun lt!633266 () SeekEntryResult!11555)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1442045 (= res!974401 (= lt!633266 (Intermediate!11555 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!633267 () array!97978)

(declare-fun lt!633270 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97978 (_ BitVec 32)) SeekEntryResult!11555)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1442045 (= lt!633266 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633270 mask!2687) lt!633270 lt!633267 mask!2687))))

(assert (=> b!1442045 (= lt!633270 (select (store (arr!47278 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1442046 () Bool)

(declare-fun res!974413 () Bool)

(assert (=> b!1442046 (=> (not res!974413) (not e!812779))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1442046 (= res!974413 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1442047 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97978 (_ BitVec 32)) SeekEntryResult!11555)

(assert (=> b!1442047 (= e!812780 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633270 lt!633267 mask!2687) (seekEntryOrOpen!0 lt!633270 lt!633267 mask!2687)))))

(declare-fun b!1442048 () Bool)

(declare-fun e!812783 () Bool)

(assert (=> b!1442048 (= e!812783 e!812784)))

(declare-fun res!974409 () Bool)

(assert (=> b!1442048 (=> (not res!974409) (not e!812784))))

(declare-fun lt!633268 () SeekEntryResult!11555)

(assert (=> b!1442048 (= res!974409 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47278 a!2862) j!93) mask!2687) (select (arr!47278 a!2862) j!93) a!2862 mask!2687) lt!633268))))

(assert (=> b!1442048 (= lt!633268 (Intermediate!11555 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1442049 () Bool)

(assert (=> b!1442049 (= e!812782 e!812783)))

(declare-fun res!974407 () Bool)

(assert (=> b!1442049 (=> (not res!974407) (not e!812783))))

(assert (=> b!1442049 (= res!974407 (= (select (store (arr!47278 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1442049 (= lt!633267 (array!97979 (store (arr!47278 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47830 a!2862)))))

(declare-fun b!1442050 () Bool)

(declare-fun res!974400 () Bool)

(assert (=> b!1442050 (=> (not res!974400) (not e!812782))))

(assert (=> b!1442050 (= res!974400 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47830 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47830 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47830 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1442051 () Bool)

(declare-fun res!974408 () Bool)

(assert (=> b!1442051 (=> (not res!974408) (not e!812782))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1442051 (= res!974408 (validKeyInArray!0 (select (arr!47278 a!2862) j!93)))))

(declare-fun b!1442052 () Bool)

(assert (=> b!1442052 (= e!812780 (= lt!633266 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633270 lt!633267 mask!2687)))))

(declare-fun b!1442053 () Bool)

(declare-fun res!974403 () Bool)

(assert (=> b!1442053 (=> (not res!974403) (not e!812782))))

(assert (=> b!1442053 (= res!974403 (validKeyInArray!0 (select (arr!47278 a!2862) i!1006)))))

(declare-fun b!1442054 () Bool)

(declare-fun res!974410 () Bool)

(assert (=> b!1442054 (=> (not res!974410) (not e!812782))))

(assert (=> b!1442054 (= res!974410 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1442055 () Bool)

(declare-fun res!974399 () Bool)

(assert (=> b!1442055 (=> (not res!974399) (not e!812784))))

(assert (=> b!1442055 (= res!974399 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47278 a!2862) j!93) a!2862 mask!2687) lt!633268))))

(assert (= (and start!124552 res!974402) b!1442039))

(assert (= (and b!1442039 res!974406) b!1442053))

(assert (= (and b!1442053 res!974403) b!1442051))

(assert (= (and b!1442051 res!974408) b!1442054))

(assert (= (and b!1442054 res!974410) b!1442042))

(assert (= (and b!1442042 res!974404) b!1442050))

(assert (= (and b!1442050 res!974400) b!1442049))

(assert (= (and b!1442049 res!974407) b!1442048))

(assert (= (and b!1442048 res!974409) b!1442055))

(assert (= (and b!1442055 res!974399) b!1442045))

(assert (= (and b!1442045 res!974401) b!1442043))

(assert (= (and b!1442043 c!133333) b!1442052))

(assert (= (and b!1442043 (not c!133333)) b!1442047))

(assert (= (and b!1442043 res!974405) b!1442046))

(assert (= (and b!1442046 res!974413) b!1442040))

(assert (= (and b!1442040 res!974411) b!1442041))

(assert (= (and b!1442041 res!974412) b!1442044))

(declare-fun m!1330719 () Bool)

(assert (=> b!1442049 m!1330719))

(declare-fun m!1330721 () Bool)

(assert (=> b!1442049 m!1330721))

(declare-fun m!1330723 () Bool)

(assert (=> b!1442048 m!1330723))

(assert (=> b!1442048 m!1330723))

(declare-fun m!1330725 () Bool)

(assert (=> b!1442048 m!1330725))

(assert (=> b!1442048 m!1330725))

(assert (=> b!1442048 m!1330723))

(declare-fun m!1330727 () Bool)

(assert (=> b!1442048 m!1330727))

(assert (=> b!1442041 m!1330723))

(assert (=> b!1442041 m!1330723))

(declare-fun m!1330729 () Bool)

(assert (=> b!1442041 m!1330729))

(declare-fun m!1330731 () Bool)

(assert (=> b!1442047 m!1330731))

(declare-fun m!1330733 () Bool)

(assert (=> b!1442047 m!1330733))

(declare-fun m!1330735 () Bool)

(assert (=> b!1442040 m!1330735))

(assert (=> b!1442040 m!1330719))

(declare-fun m!1330737 () Bool)

(assert (=> b!1442040 m!1330737))

(declare-fun m!1330739 () Bool)

(assert (=> b!1442040 m!1330739))

(declare-fun m!1330741 () Bool)

(assert (=> b!1442040 m!1330741))

(assert (=> b!1442040 m!1330723))

(declare-fun m!1330743 () Bool)

(assert (=> start!124552 m!1330743))

(declare-fun m!1330745 () Bool)

(assert (=> start!124552 m!1330745))

(declare-fun m!1330747 () Bool)

(assert (=> b!1442054 m!1330747))

(declare-fun m!1330749 () Bool)

(assert (=> b!1442053 m!1330749))

(assert (=> b!1442053 m!1330749))

(declare-fun m!1330751 () Bool)

(assert (=> b!1442053 m!1330751))

(declare-fun m!1330753 () Bool)

(assert (=> b!1442042 m!1330753))

(assert (=> b!1442055 m!1330723))

(assert (=> b!1442055 m!1330723))

(declare-fun m!1330755 () Bool)

(assert (=> b!1442055 m!1330755))

(declare-fun m!1330757 () Bool)

(assert (=> b!1442052 m!1330757))

(assert (=> b!1442051 m!1330723))

(assert (=> b!1442051 m!1330723))

(declare-fun m!1330759 () Bool)

(assert (=> b!1442051 m!1330759))

(declare-fun m!1330761 () Bool)

(assert (=> b!1442045 m!1330761))

(assert (=> b!1442045 m!1330761))

(declare-fun m!1330763 () Bool)

(assert (=> b!1442045 m!1330763))

(assert (=> b!1442045 m!1330719))

(declare-fun m!1330765 () Bool)

(assert (=> b!1442045 m!1330765))

(declare-fun m!1330767 () Bool)

(assert (=> b!1442044 m!1330767))

(assert (=> b!1442044 m!1330723))

(check-sat (not b!1442047) (not b!1442040) (not b!1442045) (not b!1442042) (not b!1442041) (not b!1442052) (not b!1442048) (not start!124552) (not b!1442054) (not b!1442055) (not b!1442051) (not b!1442053))
(check-sat)
