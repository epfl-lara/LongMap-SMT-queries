; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124540 () Bool)

(assert start!124540)

(declare-fun b!1441299 () Bool)

(declare-fun res!973674 () Bool)

(declare-fun e!812509 () Bool)

(assert (=> b!1441299 (=> (not res!973674) (not e!812509))))

(declare-datatypes ((array!97988 0))(
  ( (array!97989 (arr!47282 (Array (_ BitVec 32) (_ BitVec 64))) (size!47832 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97988)

(declare-datatypes ((List!33783 0))(
  ( (Nil!33780) (Cons!33779 (h!35129 (_ BitVec 64)) (t!48477 List!33783)) )
))
(declare-fun arrayNoDuplicates!0 (array!97988 (_ BitVec 32) List!33783) Bool)

(assert (=> b!1441299 (= res!973674 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33780))))

(declare-fun b!1441300 () Bool)

(declare-fun res!973671 () Bool)

(declare-fun e!812507 () Bool)

(assert (=> b!1441300 (=> (not res!973671) (not e!812507))))

(declare-datatypes ((SeekEntryResult!11534 0))(
  ( (MissingZero!11534 (index!48528 (_ BitVec 32))) (Found!11534 (index!48529 (_ BitVec 32))) (Intermediate!11534 (undefined!12346 Bool) (index!48530 (_ BitVec 32)) (x!130247 (_ BitVec 32))) (Undefined!11534) (MissingVacant!11534 (index!48531 (_ BitVec 32))) )
))
(declare-fun lt!633186 () SeekEntryResult!11534)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97988 (_ BitVec 32)) SeekEntryResult!11534)

(assert (=> b!1441300 (= res!973671 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47282 a!2862) j!93) a!2862 mask!2687) lt!633186))))

(declare-fun res!973676 () Bool)

(assert (=> start!124540 (=> (not res!973676) (not e!812509))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124540 (= res!973676 (validMask!0 mask!2687))))

(assert (=> start!124540 e!812509))

(assert (=> start!124540 true))

(declare-fun array_inv!36310 (array!97988) Bool)

(assert (=> start!124540 (array_inv!36310 a!2862)))

(declare-fun b!1441301 () Bool)

(declare-fun res!973669 () Bool)

(assert (=> b!1441301 (=> (not res!973669) (not e!812509))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1441301 (= res!973669 (validKeyInArray!0 (select (arr!47282 a!2862) i!1006)))))

(declare-fun b!1441302 () Bool)

(declare-fun res!973675 () Bool)

(assert (=> b!1441302 (=> (not res!973675) (not e!812509))))

(assert (=> b!1441302 (= res!973675 (and (= (size!47832 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47832 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47832 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1441303 () Bool)

(declare-fun e!812506 () Bool)

(assert (=> b!1441303 (= e!812506 e!812507)))

(declare-fun res!973668 () Bool)

(assert (=> b!1441303 (=> (not res!973668) (not e!812507))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1441303 (= res!973668 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47282 a!2862) j!93) mask!2687) (select (arr!47282 a!2862) j!93) a!2862 mask!2687) lt!633186))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1441303 (= lt!633186 (Intermediate!11534 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1441304 () Bool)

(declare-fun res!973677 () Bool)

(assert (=> b!1441304 (=> (not res!973677) (not e!812509))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1441304 (= res!973677 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47832 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47832 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47832 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun lt!633188 () (_ BitVec 64))

(declare-fun lt!633185 () SeekEntryResult!11534)

(declare-fun e!812505 () Bool)

(declare-fun lt!633189 () array!97988)

(declare-fun b!1441305 () Bool)

(assert (=> b!1441305 (= e!812505 (not (= lt!633185 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633188 lt!633189 mask!2687))))))

(declare-fun b!1441306 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97988 (_ BitVec 32)) SeekEntryResult!11534)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97988 (_ BitVec 32)) SeekEntryResult!11534)

(assert (=> b!1441306 (= e!812505 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633188 lt!633189 mask!2687) (seekEntryOrOpen!0 lt!633188 lt!633189 mask!2687))))))

(declare-fun b!1441307 () Bool)

(assert (=> b!1441307 (= e!812509 e!812506)))

(declare-fun res!973673 () Bool)

(assert (=> b!1441307 (=> (not res!973673) (not e!812506))))

(assert (=> b!1441307 (= res!973673 (= (select (store (arr!47282 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1441307 (= lt!633189 (array!97989 (store (arr!47282 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47832 a!2862)))))

(declare-fun b!1441308 () Bool)

(declare-fun res!973672 () Bool)

(assert (=> b!1441308 (=> (not res!973672) (not e!812509))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97988 (_ BitVec 32)) Bool)

(assert (=> b!1441308 (= res!973672 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1441309 () Bool)

(declare-fun e!812510 () Bool)

(assert (=> b!1441309 (= e!812507 e!812510)))

(declare-fun res!973678 () Bool)

(assert (=> b!1441309 (=> (not res!973678) (not e!812510))))

(assert (=> b!1441309 (= res!973678 (= lt!633185 (Intermediate!11534 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1441309 (= lt!633185 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633188 mask!2687) lt!633188 lt!633189 mask!2687))))

(assert (=> b!1441309 (= lt!633188 (select (store (arr!47282 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1441310 () Bool)

(declare-fun res!973670 () Bool)

(assert (=> b!1441310 (=> (not res!973670) (not e!812509))))

(assert (=> b!1441310 (= res!973670 (validKeyInArray!0 (select (arr!47282 a!2862) j!93)))))

(declare-fun b!1441311 () Bool)

(assert (=> b!1441311 (= e!812510 false)))

(declare-fun lt!633187 () Bool)

(assert (=> b!1441311 (= lt!633187 e!812505)))

(declare-fun c!133326 () Bool)

(assert (=> b!1441311 (= c!133326 (bvsle x!665 intermediateAfterX!19))))

(assert (= (and start!124540 res!973676) b!1441302))

(assert (= (and b!1441302 res!973675) b!1441301))

(assert (= (and b!1441301 res!973669) b!1441310))

(assert (= (and b!1441310 res!973670) b!1441308))

(assert (= (and b!1441308 res!973672) b!1441299))

(assert (= (and b!1441299 res!973674) b!1441304))

(assert (= (and b!1441304 res!973677) b!1441307))

(assert (= (and b!1441307 res!973673) b!1441303))

(assert (= (and b!1441303 res!973668) b!1441300))

(assert (= (and b!1441300 res!973671) b!1441309))

(assert (= (and b!1441309 res!973678) b!1441311))

(assert (= (and b!1441311 c!133326) b!1441305))

(assert (= (and b!1441311 (not c!133326)) b!1441306))

(declare-fun m!1330525 () Bool)

(assert (=> b!1441307 m!1330525))

(declare-fun m!1330527 () Bool)

(assert (=> b!1441307 m!1330527))

(declare-fun m!1330529 () Bool)

(assert (=> b!1441310 m!1330529))

(assert (=> b!1441310 m!1330529))

(declare-fun m!1330531 () Bool)

(assert (=> b!1441310 m!1330531))

(declare-fun m!1330533 () Bool)

(assert (=> b!1441305 m!1330533))

(assert (=> b!1441303 m!1330529))

(assert (=> b!1441303 m!1330529))

(declare-fun m!1330535 () Bool)

(assert (=> b!1441303 m!1330535))

(assert (=> b!1441303 m!1330535))

(assert (=> b!1441303 m!1330529))

(declare-fun m!1330537 () Bool)

(assert (=> b!1441303 m!1330537))

(declare-fun m!1330539 () Bool)

(assert (=> b!1441308 m!1330539))

(declare-fun m!1330541 () Bool)

(assert (=> b!1441301 m!1330541))

(assert (=> b!1441301 m!1330541))

(declare-fun m!1330543 () Bool)

(assert (=> b!1441301 m!1330543))

(declare-fun m!1330545 () Bool)

(assert (=> start!124540 m!1330545))

(declare-fun m!1330547 () Bool)

(assert (=> start!124540 m!1330547))

(declare-fun m!1330549 () Bool)

(assert (=> b!1441306 m!1330549))

(declare-fun m!1330551 () Bool)

(assert (=> b!1441306 m!1330551))

(declare-fun m!1330553 () Bool)

(assert (=> b!1441299 m!1330553))

(declare-fun m!1330555 () Bool)

(assert (=> b!1441309 m!1330555))

(assert (=> b!1441309 m!1330555))

(declare-fun m!1330557 () Bool)

(assert (=> b!1441309 m!1330557))

(assert (=> b!1441309 m!1330525))

(declare-fun m!1330559 () Bool)

(assert (=> b!1441309 m!1330559))

(assert (=> b!1441300 m!1330529))

(assert (=> b!1441300 m!1330529))

(declare-fun m!1330561 () Bool)

(assert (=> b!1441300 m!1330561))

(push 1)

