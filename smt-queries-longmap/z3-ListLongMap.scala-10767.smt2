; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125922 () Bool)

(assert start!125922)

(declare-fun b!1474568 () Bool)

(declare-fun e!827327 () Bool)

(declare-fun e!827328 () Bool)

(assert (=> b!1474568 (= e!827327 e!827328)))

(declare-fun res!1001764 () Bool)

(assert (=> b!1474568 (=> (not res!1001764) (not e!827328))))

(declare-datatypes ((SeekEntryResult!12123 0))(
  ( (MissingZero!12123 (index!50884 (_ BitVec 32))) (Found!12123 (index!50885 (_ BitVec 32))) (Intermediate!12123 (undefined!12935 Bool) (index!50886 (_ BitVec 32)) (x!132463 (_ BitVec 32))) (Undefined!12123) (MissingVacant!12123 (index!50887 (_ BitVec 32))) )
))
(declare-fun lt!644290 () SeekEntryResult!12123)

(declare-datatypes ((array!99199 0))(
  ( (array!99200 (arr!47883 (Array (_ BitVec 32) (_ BitVec 64))) (size!48433 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99199)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99199 (_ BitVec 32)) SeekEntryResult!12123)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1474568 (= res!1001764 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47883 a!2862) j!93) mask!2687) (select (arr!47883 a!2862) j!93) a!2862 mask!2687) lt!644290))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1474568 (= lt!644290 (Intermediate!12123 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1474569 () Bool)

(declare-fun res!1001765 () Bool)

(declare-fun e!827326 () Bool)

(assert (=> b!1474569 (=> (not res!1001765) (not e!827326))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99199 (_ BitVec 32)) SeekEntryResult!12123)

(assert (=> b!1474569 (= res!1001765 (= (seekEntryOrOpen!0 (select (arr!47883 a!2862) j!93) a!2862 mask!2687) (Found!12123 j!93)))))

(declare-fun b!1474570 () Bool)

(declare-fun e!827330 () Bool)

(assert (=> b!1474570 (= e!827330 (not true))))

(assert (=> b!1474570 e!827326))

(declare-fun res!1001758 () Bool)

(assert (=> b!1474570 (=> (not res!1001758) (not e!827326))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99199 (_ BitVec 32)) Bool)

(assert (=> b!1474570 (= res!1001758 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49586 0))(
  ( (Unit!49587) )
))
(declare-fun lt!644291 () Unit!49586)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99199 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49586)

(assert (=> b!1474570 (= lt!644291 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!644289 () array!99199)

(declare-fun b!1474571 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!644292 () (_ BitVec 64))

(declare-fun e!827324 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99199 (_ BitVec 32)) SeekEntryResult!12123)

(assert (=> b!1474571 (= e!827324 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!644292 lt!644289 mask!2687) (seekEntryOrOpen!0 lt!644292 lt!644289 mask!2687)))))

(declare-fun b!1474572 () Bool)

(declare-fun res!1001770 () Bool)

(declare-fun e!827329 () Bool)

(assert (=> b!1474572 (=> (not res!1001770) (not e!827329))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1474572 (= res!1001770 (validKeyInArray!0 (select (arr!47883 a!2862) i!1006)))))

(declare-fun b!1474573 () Bool)

(declare-fun res!1001766 () Bool)

(assert (=> b!1474573 (=> (not res!1001766) (not e!827330))))

(assert (=> b!1474573 (= res!1001766 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1474574 () Bool)

(declare-fun res!1001761 () Bool)

(assert (=> b!1474574 (=> (not res!1001761) (not e!827329))))

(assert (=> b!1474574 (= res!1001761 (and (= (size!48433 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48433 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48433 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1474575 () Bool)

(assert (=> b!1474575 (= e!827326 (or (= (select (arr!47883 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47883 a!2862) intermediateBeforeIndex!19) (select (arr!47883 a!2862) j!93))))))

(declare-fun b!1474576 () Bool)

(assert (=> b!1474576 (= e!827329 e!827327)))

(declare-fun res!1001759 () Bool)

(assert (=> b!1474576 (=> (not res!1001759) (not e!827327))))

(assert (=> b!1474576 (= res!1001759 (= (select (store (arr!47883 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1474576 (= lt!644289 (array!99200 (store (arr!47883 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48433 a!2862)))))

(declare-fun b!1474577 () Bool)

(declare-fun res!1001762 () Bool)

(assert (=> b!1474577 (=> (not res!1001762) (not e!827329))))

(assert (=> b!1474577 (= res!1001762 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1474578 () Bool)

(declare-fun res!1001768 () Bool)

(assert (=> b!1474578 (=> (not res!1001768) (not e!827329))))

(declare-datatypes ((List!34384 0))(
  ( (Nil!34381) (Cons!34380 (h!35739 (_ BitVec 64)) (t!49078 List!34384)) )
))
(declare-fun arrayNoDuplicates!0 (array!99199 (_ BitVec 32) List!34384) Bool)

(assert (=> b!1474578 (= res!1001768 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34381))))

(declare-fun b!1474580 () Bool)

(assert (=> b!1474580 (= e!827328 e!827330)))

(declare-fun res!1001769 () Bool)

(assert (=> b!1474580 (=> (not res!1001769) (not e!827330))))

(declare-fun lt!644288 () SeekEntryResult!12123)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1474580 (= res!1001769 (= lt!644288 (Intermediate!12123 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1474580 (= lt!644288 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!644292 mask!2687) lt!644292 lt!644289 mask!2687))))

(assert (=> b!1474580 (= lt!644292 (select (store (arr!47883 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1474581 () Bool)

(declare-fun res!1001757 () Bool)

(assert (=> b!1474581 (=> (not res!1001757) (not e!827328))))

(assert (=> b!1474581 (= res!1001757 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47883 a!2862) j!93) a!2862 mask!2687) lt!644290))))

(declare-fun b!1474582 () Bool)

(declare-fun res!1001767 () Bool)

(assert (=> b!1474582 (=> (not res!1001767) (not e!827329))))

(assert (=> b!1474582 (= res!1001767 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48433 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48433 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48433 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1474583 () Bool)

(declare-fun res!1001756 () Bool)

(assert (=> b!1474583 (=> (not res!1001756) (not e!827329))))

(assert (=> b!1474583 (= res!1001756 (validKeyInArray!0 (select (arr!47883 a!2862) j!93)))))

(declare-fun b!1474584 () Bool)

(declare-fun res!1001763 () Bool)

(assert (=> b!1474584 (=> (not res!1001763) (not e!827330))))

(assert (=> b!1474584 (= res!1001763 e!827324)))

(declare-fun c!135921 () Bool)

(assert (=> b!1474584 (= c!135921 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1474579 () Bool)

(assert (=> b!1474579 (= e!827324 (= lt!644288 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!644292 lt!644289 mask!2687)))))

(declare-fun res!1001760 () Bool)

(assert (=> start!125922 (=> (not res!1001760) (not e!827329))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125922 (= res!1001760 (validMask!0 mask!2687))))

(assert (=> start!125922 e!827329))

(assert (=> start!125922 true))

(declare-fun array_inv!36911 (array!99199) Bool)

(assert (=> start!125922 (array_inv!36911 a!2862)))

(assert (= (and start!125922 res!1001760) b!1474574))

(assert (= (and b!1474574 res!1001761) b!1474572))

(assert (= (and b!1474572 res!1001770) b!1474583))

(assert (= (and b!1474583 res!1001756) b!1474577))

(assert (= (and b!1474577 res!1001762) b!1474578))

(assert (= (and b!1474578 res!1001768) b!1474582))

(assert (= (and b!1474582 res!1001767) b!1474576))

(assert (= (and b!1474576 res!1001759) b!1474568))

(assert (= (and b!1474568 res!1001764) b!1474581))

(assert (= (and b!1474581 res!1001757) b!1474580))

(assert (= (and b!1474580 res!1001769) b!1474584))

(assert (= (and b!1474584 c!135921) b!1474579))

(assert (= (and b!1474584 (not c!135921)) b!1474571))

(assert (= (and b!1474584 res!1001763) b!1474573))

(assert (= (and b!1474573 res!1001766) b!1474570))

(assert (= (and b!1474570 res!1001758) b!1474569))

(assert (= (and b!1474569 res!1001765) b!1474575))

(declare-fun m!1361003 () Bool)

(assert (=> b!1474580 m!1361003))

(assert (=> b!1474580 m!1361003))

(declare-fun m!1361005 () Bool)

(assert (=> b!1474580 m!1361005))

(declare-fun m!1361007 () Bool)

(assert (=> b!1474580 m!1361007))

(declare-fun m!1361009 () Bool)

(assert (=> b!1474580 m!1361009))

(declare-fun m!1361011 () Bool)

(assert (=> b!1474583 m!1361011))

(assert (=> b!1474583 m!1361011))

(declare-fun m!1361013 () Bool)

(assert (=> b!1474583 m!1361013))

(declare-fun m!1361015 () Bool)

(assert (=> b!1474575 m!1361015))

(assert (=> b!1474575 m!1361011))

(declare-fun m!1361017 () Bool)

(assert (=> b!1474572 m!1361017))

(assert (=> b!1474572 m!1361017))

(declare-fun m!1361019 () Bool)

(assert (=> b!1474572 m!1361019))

(declare-fun m!1361021 () Bool)

(assert (=> b!1474571 m!1361021))

(declare-fun m!1361023 () Bool)

(assert (=> b!1474571 m!1361023))

(assert (=> b!1474576 m!1361007))

(declare-fun m!1361025 () Bool)

(assert (=> b!1474576 m!1361025))

(assert (=> b!1474581 m!1361011))

(assert (=> b!1474581 m!1361011))

(declare-fun m!1361027 () Bool)

(assert (=> b!1474581 m!1361027))

(declare-fun m!1361029 () Bool)

(assert (=> b!1474578 m!1361029))

(declare-fun m!1361031 () Bool)

(assert (=> b!1474579 m!1361031))

(declare-fun m!1361033 () Bool)

(assert (=> b!1474577 m!1361033))

(assert (=> b!1474568 m!1361011))

(assert (=> b!1474568 m!1361011))

(declare-fun m!1361035 () Bool)

(assert (=> b!1474568 m!1361035))

(assert (=> b!1474568 m!1361035))

(assert (=> b!1474568 m!1361011))

(declare-fun m!1361037 () Bool)

(assert (=> b!1474568 m!1361037))

(declare-fun m!1361039 () Bool)

(assert (=> b!1474570 m!1361039))

(declare-fun m!1361041 () Bool)

(assert (=> b!1474570 m!1361041))

(declare-fun m!1361043 () Bool)

(assert (=> start!125922 m!1361043))

(declare-fun m!1361045 () Bool)

(assert (=> start!125922 m!1361045))

(assert (=> b!1474569 m!1361011))

(assert (=> b!1474569 m!1361011))

(declare-fun m!1361047 () Bool)

(assert (=> b!1474569 m!1361047))

(check-sat (not b!1474568) (not b!1474569) (not b!1474581) (not start!125922) (not b!1474570) (not b!1474571) (not b!1474579) (not b!1474578) (not b!1474580) (not b!1474572) (not b!1474583) (not b!1474577))
(check-sat)
