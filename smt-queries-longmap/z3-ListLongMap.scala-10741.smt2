; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125586 () Bool)

(assert start!125586)

(declare-fun b!1469558 () Bool)

(declare-fun res!998037 () Bool)

(declare-fun e!825007 () Bool)

(assert (=> b!1469558 (=> (not res!998037) (not e!825007))))

(declare-datatypes ((array!99034 0))(
  ( (array!99035 (arr!47805 (Array (_ BitVec 32) (_ BitVec 64))) (size!48355 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99034)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1469558 (= res!998037 (validKeyInArray!0 (select (arr!47805 a!2862) j!93)))))

(declare-fun b!1469559 () Bool)

(declare-fun res!998034 () Bool)

(assert (=> b!1469559 (=> (not res!998034) (not e!825007))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99034 (_ BitVec 32)) Bool)

(assert (=> b!1469559 (= res!998034 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1469560 () Bool)

(declare-fun res!998039 () Bool)

(declare-fun e!825010 () Bool)

(assert (=> b!1469560 (=> (not res!998039) (not e!825010))))

(declare-datatypes ((SeekEntryResult!12045 0))(
  ( (MissingZero!12045 (index!50572 (_ BitVec 32))) (Found!12045 (index!50573 (_ BitVec 32))) (Intermediate!12045 (undefined!12857 Bool) (index!50574 (_ BitVec 32)) (x!132150 (_ BitVec 32))) (Undefined!12045) (MissingVacant!12045 (index!50575 (_ BitVec 32))) )
))
(declare-fun lt!642602 () SeekEntryResult!12045)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99034 (_ BitVec 32)) SeekEntryResult!12045)

(assert (=> b!1469560 (= res!998039 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47805 a!2862) j!93) a!2862 mask!2687) lt!642602))))

(declare-fun b!1469561 () Bool)

(declare-fun res!998040 () Bool)

(assert (=> b!1469561 (=> (not res!998040) (not e!825007))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1469561 (= res!998040 (validKeyInArray!0 (select (arr!47805 a!2862) i!1006)))))

(declare-fun e!825011 () Bool)

(declare-fun lt!642603 () SeekEntryResult!12045)

(declare-fun b!1469562 () Bool)

(declare-fun lt!642600 () array!99034)

(declare-fun lt!642601 () (_ BitVec 64))

(assert (=> b!1469562 (= e!825011 (= lt!642603 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!642601 lt!642600 mask!2687)))))

(declare-fun b!1469563 () Bool)

(declare-fun e!825008 () Bool)

(assert (=> b!1469563 (= e!825010 e!825008)))

(declare-fun res!998035 () Bool)

(assert (=> b!1469563 (=> (not res!998035) (not e!825008))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1469563 (= res!998035 (= lt!642603 (Intermediate!12045 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1469563 (= lt!642603 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!642601 mask!2687) lt!642601 lt!642600 mask!2687))))

(assert (=> b!1469563 (= lt!642601 (select (store (arr!47805 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1469564 () Bool)

(declare-fun res!998033 () Bool)

(assert (=> b!1469564 (=> (not res!998033) (not e!825007))))

(declare-datatypes ((List!34306 0))(
  ( (Nil!34303) (Cons!34302 (h!35652 (_ BitVec 64)) (t!49000 List!34306)) )
))
(declare-fun arrayNoDuplicates!0 (array!99034 (_ BitVec 32) List!34306) Bool)

(assert (=> b!1469564 (= res!998033 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34303))))

(declare-fun res!998043 () Bool)

(assert (=> start!125586 (=> (not res!998043) (not e!825007))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125586 (= res!998043 (validMask!0 mask!2687))))

(assert (=> start!125586 e!825007))

(assert (=> start!125586 true))

(declare-fun array_inv!36833 (array!99034) Bool)

(assert (=> start!125586 (array_inv!36833 a!2862)))

(declare-fun b!1469565 () Bool)

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1469565 (= e!825008 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006) (bvsgt #b00000000000000000000000000000000 (size!48355 a!2862))))))

(declare-fun b!1469566 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99034 (_ BitVec 32)) SeekEntryResult!12045)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99034 (_ BitVec 32)) SeekEntryResult!12045)

(assert (=> b!1469566 (= e!825011 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!642601 lt!642600 mask!2687) (seekEntryOrOpen!0 lt!642601 lt!642600 mask!2687)))))

(declare-fun b!1469567 () Bool)

(declare-fun res!998042 () Bool)

(assert (=> b!1469567 (=> (not res!998042) (not e!825007))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1469567 (= res!998042 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48355 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48355 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48355 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1469568 () Bool)

(declare-fun e!825009 () Bool)

(assert (=> b!1469568 (= e!825009 e!825010)))

(declare-fun res!998038 () Bool)

(assert (=> b!1469568 (=> (not res!998038) (not e!825010))))

(assert (=> b!1469568 (= res!998038 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47805 a!2862) j!93) mask!2687) (select (arr!47805 a!2862) j!93) a!2862 mask!2687) lt!642602))))

(assert (=> b!1469568 (= lt!642602 (Intermediate!12045 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1469569 () Bool)

(declare-fun res!998044 () Bool)

(assert (=> b!1469569 (=> (not res!998044) (not e!825008))))

(assert (=> b!1469569 (= res!998044 e!825011)))

(declare-fun c!135273 () Bool)

(assert (=> b!1469569 (= c!135273 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1469570 () Bool)

(assert (=> b!1469570 (= e!825007 e!825009)))

(declare-fun res!998041 () Bool)

(assert (=> b!1469570 (=> (not res!998041) (not e!825009))))

(assert (=> b!1469570 (= res!998041 (= (select (store (arr!47805 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1469570 (= lt!642600 (array!99035 (store (arr!47805 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48355 a!2862)))))

(declare-fun b!1469571 () Bool)

(declare-fun res!998036 () Bool)

(assert (=> b!1469571 (=> (not res!998036) (not e!825007))))

(assert (=> b!1469571 (= res!998036 (and (= (size!48355 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48355 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48355 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!125586 res!998043) b!1469571))

(assert (= (and b!1469571 res!998036) b!1469561))

(assert (= (and b!1469561 res!998040) b!1469558))

(assert (= (and b!1469558 res!998037) b!1469559))

(assert (= (and b!1469559 res!998034) b!1469564))

(assert (= (and b!1469564 res!998033) b!1469567))

(assert (= (and b!1469567 res!998042) b!1469570))

(assert (= (and b!1469570 res!998041) b!1469568))

(assert (= (and b!1469568 res!998038) b!1469560))

(assert (= (and b!1469560 res!998039) b!1469563))

(assert (= (and b!1469563 res!998035) b!1469569))

(assert (= (and b!1469569 c!135273) b!1469562))

(assert (= (and b!1469569 (not c!135273)) b!1469566))

(assert (= (and b!1469569 res!998044) b!1469565))

(declare-fun m!1356729 () Bool)

(assert (=> b!1469558 m!1356729))

(assert (=> b!1469558 m!1356729))

(declare-fun m!1356731 () Bool)

(assert (=> b!1469558 m!1356731))

(assert (=> b!1469568 m!1356729))

(assert (=> b!1469568 m!1356729))

(declare-fun m!1356733 () Bool)

(assert (=> b!1469568 m!1356733))

(assert (=> b!1469568 m!1356733))

(assert (=> b!1469568 m!1356729))

(declare-fun m!1356735 () Bool)

(assert (=> b!1469568 m!1356735))

(declare-fun m!1356737 () Bool)

(assert (=> start!125586 m!1356737))

(declare-fun m!1356739 () Bool)

(assert (=> start!125586 m!1356739))

(declare-fun m!1356741 () Bool)

(assert (=> b!1469563 m!1356741))

(assert (=> b!1469563 m!1356741))

(declare-fun m!1356743 () Bool)

(assert (=> b!1469563 m!1356743))

(declare-fun m!1356745 () Bool)

(assert (=> b!1469563 m!1356745))

(declare-fun m!1356747 () Bool)

(assert (=> b!1469563 m!1356747))

(declare-fun m!1356749 () Bool)

(assert (=> b!1469561 m!1356749))

(assert (=> b!1469561 m!1356749))

(declare-fun m!1356751 () Bool)

(assert (=> b!1469561 m!1356751))

(assert (=> b!1469570 m!1356745))

(declare-fun m!1356753 () Bool)

(assert (=> b!1469570 m!1356753))

(assert (=> b!1469560 m!1356729))

(assert (=> b!1469560 m!1356729))

(declare-fun m!1356755 () Bool)

(assert (=> b!1469560 m!1356755))

(declare-fun m!1356757 () Bool)

(assert (=> b!1469559 m!1356757))

(declare-fun m!1356759 () Bool)

(assert (=> b!1469566 m!1356759))

(declare-fun m!1356761 () Bool)

(assert (=> b!1469566 m!1356761))

(declare-fun m!1356763 () Bool)

(assert (=> b!1469562 m!1356763))

(declare-fun m!1356765 () Bool)

(assert (=> b!1469564 m!1356765))

(check-sat (not b!1469562) (not b!1469559) (not b!1469568) (not b!1469560) (not b!1469558) (not start!125586) (not b!1469566) (not b!1469564) (not b!1469563) (not b!1469561))
(check-sat)
