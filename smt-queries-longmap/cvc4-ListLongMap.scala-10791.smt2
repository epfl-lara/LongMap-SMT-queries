; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126248 () Bool)

(assert start!126248)

(declare-fun b!1479719 () Bool)

(declare-fun e!829991 () Bool)

(declare-fun e!829993 () Bool)

(assert (=> b!1479719 (= e!829991 e!829993)))

(declare-fun res!1005607 () Bool)

(assert (=> b!1479719 (=> (not res!1005607) (not e!829993))))

(declare-datatypes ((SeekEntryResult!12196 0))(
  ( (MissingZero!12196 (index!51176 (_ BitVec 32))) (Found!12196 (index!51177 (_ BitVec 32))) (Intermediate!12196 (undefined!13008 Bool) (index!51178 (_ BitVec 32)) (x!132755 (_ BitVec 32))) (Undefined!12196) (MissingVacant!12196 (index!51179 (_ BitVec 32))) )
))
(declare-fun lt!646141 () SeekEntryResult!12196)

(declare-datatypes ((array!99354 0))(
  ( (array!99355 (arr!47956 (Array (_ BitVec 32) (_ BitVec 64))) (size!48506 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99354)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99354 (_ BitVec 32)) SeekEntryResult!12196)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1479719 (= res!1005607 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47956 a!2862) j!93) mask!2687) (select (arr!47956 a!2862) j!93) a!2862 mask!2687) lt!646141))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1479719 (= lt!646141 (Intermediate!12196 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1479720 () Bool)

(declare-fun res!1005600 () Bool)

(declare-fun e!829996 () Bool)

(assert (=> b!1479720 (=> (not res!1005600) (not e!829996))))

(declare-datatypes ((List!34457 0))(
  ( (Nil!34454) (Cons!34453 (h!35821 (_ BitVec 64)) (t!49151 List!34457)) )
))
(declare-fun arrayNoDuplicates!0 (array!99354 (_ BitVec 32) List!34457) Bool)

(assert (=> b!1479720 (= res!1005600 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34454))))

(declare-fun b!1479721 () Bool)

(declare-fun res!1005609 () Bool)

(assert (=> b!1479721 (=> (not res!1005609) (not e!829996))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99354 (_ BitVec 32)) Bool)

(assert (=> b!1479721 (= res!1005609 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1479722 () Bool)

(declare-fun e!829988 () Bool)

(assert (=> b!1479722 (= e!829993 e!829988)))

(declare-fun res!1005598 () Bool)

(assert (=> b!1479722 (=> (not res!1005598) (not e!829988))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun lt!646143 () SeekEntryResult!12196)

(assert (=> b!1479722 (= res!1005598 (= lt!646143 (Intermediate!12196 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!646136 () (_ BitVec 64))

(declare-fun lt!646139 () array!99354)

(assert (=> b!1479722 (= lt!646143 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!646136 mask!2687) lt!646136 lt!646139 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1479722 (= lt!646136 (select (store (arr!47956 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1479723 () Bool)

(declare-fun e!829994 () Bool)

(declare-fun e!829997 () Bool)

(assert (=> b!1479723 (= e!829994 e!829997)))

(declare-fun res!1005597 () Bool)

(assert (=> b!1479723 (=> (not res!1005597) (not e!829997))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!646142 () SeekEntryResult!12196)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99354 (_ BitVec 32)) SeekEntryResult!12196)

(assert (=> b!1479723 (= res!1005597 (= lt!646142 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47956 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1479724 () Bool)

(declare-fun res!1005610 () Bool)

(assert (=> b!1479724 (=> (not res!1005610) (not e!829988))))

(declare-fun e!829989 () Bool)

(assert (=> b!1479724 (= res!1005610 e!829989)))

(declare-fun c!136581 () Bool)

(assert (=> b!1479724 (= c!136581 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1479725 () Bool)

(declare-fun res!1005612 () Bool)

(assert (=> b!1479725 (=> (not res!1005612) (not e!829996))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1479725 (= res!1005612 (validKeyInArray!0 (select (arr!47956 a!2862) j!93)))))

(declare-fun b!1479726 () Bool)

(declare-fun e!829995 () Bool)

(assert (=> b!1479726 (= e!829995 true)))

(declare-fun lt!646138 () SeekEntryResult!12196)

(assert (=> b!1479726 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646136 lt!646139 mask!2687) lt!646138)))

(declare-datatypes ((Unit!49732 0))(
  ( (Unit!49733) )
))
(declare-fun lt!646140 () Unit!49732)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!99354 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49732)

(assert (=> b!1479726 (= lt!646140 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2862 i!1006 j!93 x!665 index!646 intermediateBeforeIndex!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1479727 () Bool)

(declare-fun e!829992 () Bool)

(assert (=> b!1479727 (= e!829992 e!829994)))

(declare-fun res!1005611 () Bool)

(assert (=> b!1479727 (=> res!1005611 e!829994)))

(assert (=> b!1479727 (= res!1005611 (or (and (= (select (arr!47956 a!2862) index!646) (select (store (arr!47956 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47956 a!2862) index!646) (select (arr!47956 a!2862) j!93))) (not (= (select (arr!47956 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1479728 () Bool)

(assert (=> b!1479728 (= e!829989 (= lt!646143 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!646136 lt!646139 mask!2687)))))

(declare-fun b!1479729 () Bool)

(declare-fun res!1005601 () Bool)

(assert (=> b!1479729 (=> (not res!1005601) (not e!829996))))

(assert (=> b!1479729 (= res!1005601 (validKeyInArray!0 (select (arr!47956 a!2862) i!1006)))))

(declare-fun res!1005604 () Bool)

(assert (=> start!126248 (=> (not res!1005604) (not e!829996))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126248 (= res!1005604 (validMask!0 mask!2687))))

(assert (=> start!126248 e!829996))

(assert (=> start!126248 true))

(declare-fun array_inv!36984 (array!99354) Bool)

(assert (=> start!126248 (array_inv!36984 a!2862)))

(declare-fun b!1479730 () Bool)

(declare-fun res!1005608 () Bool)

(assert (=> b!1479730 (=> (not res!1005608) (not e!829996))))

(assert (=> b!1479730 (= res!1005608 (and (= (size!48506 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48506 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48506 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1479731 () Bool)

(declare-fun res!1005602 () Bool)

(assert (=> b!1479731 (=> (not res!1005602) (not e!829996))))

(assert (=> b!1479731 (= res!1005602 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48506 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48506 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48506 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1479732 () Bool)

(assert (=> b!1479732 (= e!829996 e!829991)))

(declare-fun res!1005605 () Bool)

(assert (=> b!1479732 (=> (not res!1005605) (not e!829991))))

(assert (=> b!1479732 (= res!1005605 (= (select (store (arr!47956 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1479732 (= lt!646139 (array!99355 (store (arr!47956 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48506 a!2862)))))

(declare-fun b!1479733 () Bool)

(declare-fun res!1005613 () Bool)

(assert (=> b!1479733 (=> res!1005613 e!829995)))

(assert (=> b!1479733 (= res!1005613 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47956 a!2862) j!93) a!2862 mask!2687) lt!646138)))))

(declare-fun b!1479734 () Bool)

(assert (=> b!1479734 (= e!829988 (not e!829995))))

(declare-fun res!1005603 () Bool)

(assert (=> b!1479734 (=> res!1005603 e!829995)))

(assert (=> b!1479734 (= res!1005603 (or (and (= (select (arr!47956 a!2862) index!646) (select (store (arr!47956 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47956 a!2862) index!646) (select (arr!47956 a!2862) j!93))) (not (= (select (arr!47956 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47956 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1479734 e!829992))

(declare-fun res!1005596 () Bool)

(assert (=> b!1479734 (=> (not res!1005596) (not e!829992))))

(assert (=> b!1479734 (= res!1005596 (and (= lt!646142 lt!646138) (or (= (select (arr!47956 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47956 a!2862) intermediateBeforeIndex!19) (select (arr!47956 a!2862) j!93)))))))

(assert (=> b!1479734 (= lt!646138 (Found!12196 j!93))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99354 (_ BitVec 32)) SeekEntryResult!12196)

(assert (=> b!1479734 (= lt!646142 (seekEntryOrOpen!0 (select (arr!47956 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1479734 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!646137 () Unit!49732)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99354 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49732)

(assert (=> b!1479734 (= lt!646137 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1479735 () Bool)

(assert (=> b!1479735 (= e!829989 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646136 lt!646139 mask!2687) (seekEntryOrOpen!0 lt!646136 lt!646139 mask!2687)))))

(declare-fun b!1479736 () Bool)

(declare-fun res!1005606 () Bool)

(assert (=> b!1479736 (=> (not res!1005606) (not e!829993))))

(assert (=> b!1479736 (= res!1005606 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47956 a!2862) j!93) a!2862 mask!2687) lt!646141))))

(declare-fun b!1479737 () Bool)

(assert (=> b!1479737 (= e!829997 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1479738 () Bool)

(declare-fun res!1005599 () Bool)

(assert (=> b!1479738 (=> (not res!1005599) (not e!829988))))

(assert (=> b!1479738 (= res!1005599 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(assert (= (and start!126248 res!1005604) b!1479730))

(assert (= (and b!1479730 res!1005608) b!1479729))

(assert (= (and b!1479729 res!1005601) b!1479725))

(assert (= (and b!1479725 res!1005612) b!1479721))

(assert (= (and b!1479721 res!1005609) b!1479720))

(assert (= (and b!1479720 res!1005600) b!1479731))

(assert (= (and b!1479731 res!1005602) b!1479732))

(assert (= (and b!1479732 res!1005605) b!1479719))

(assert (= (and b!1479719 res!1005607) b!1479736))

(assert (= (and b!1479736 res!1005606) b!1479722))

(assert (= (and b!1479722 res!1005598) b!1479724))

(assert (= (and b!1479724 c!136581) b!1479728))

(assert (= (and b!1479724 (not c!136581)) b!1479735))

(assert (= (and b!1479724 res!1005610) b!1479738))

(assert (= (and b!1479738 res!1005599) b!1479734))

(assert (= (and b!1479734 res!1005596) b!1479727))

(assert (= (and b!1479727 (not res!1005611)) b!1479723))

(assert (= (and b!1479723 res!1005597) b!1479737))

(assert (= (and b!1479734 (not res!1005603)) b!1479733))

(assert (= (and b!1479733 (not res!1005613)) b!1479726))

(declare-fun m!1365569 () Bool)

(assert (=> b!1479719 m!1365569))

(assert (=> b!1479719 m!1365569))

(declare-fun m!1365571 () Bool)

(assert (=> b!1479719 m!1365571))

(assert (=> b!1479719 m!1365571))

(assert (=> b!1479719 m!1365569))

(declare-fun m!1365573 () Bool)

(assert (=> b!1479719 m!1365573))

(assert (=> b!1479736 m!1365569))

(assert (=> b!1479736 m!1365569))

(declare-fun m!1365575 () Bool)

(assert (=> b!1479736 m!1365575))

(declare-fun m!1365577 () Bool)

(assert (=> b!1479722 m!1365577))

(assert (=> b!1479722 m!1365577))

(declare-fun m!1365579 () Bool)

(assert (=> b!1479722 m!1365579))

(declare-fun m!1365581 () Bool)

(assert (=> b!1479722 m!1365581))

(declare-fun m!1365583 () Bool)

(assert (=> b!1479722 m!1365583))

(declare-fun m!1365585 () Bool)

(assert (=> b!1479735 m!1365585))

(declare-fun m!1365587 () Bool)

(assert (=> b!1479735 m!1365587))

(declare-fun m!1365589 () Bool)

(assert (=> b!1479734 m!1365589))

(assert (=> b!1479734 m!1365581))

(declare-fun m!1365591 () Bool)

(assert (=> b!1479734 m!1365591))

(declare-fun m!1365593 () Bool)

(assert (=> b!1479734 m!1365593))

(declare-fun m!1365595 () Bool)

(assert (=> b!1479734 m!1365595))

(assert (=> b!1479734 m!1365569))

(declare-fun m!1365597 () Bool)

(assert (=> b!1479734 m!1365597))

(declare-fun m!1365599 () Bool)

(assert (=> b!1479734 m!1365599))

(assert (=> b!1479734 m!1365569))

(assert (=> b!1479727 m!1365595))

(assert (=> b!1479727 m!1365581))

(assert (=> b!1479727 m!1365593))

(assert (=> b!1479727 m!1365569))

(assert (=> b!1479726 m!1365585))

(declare-fun m!1365601 () Bool)

(assert (=> b!1479726 m!1365601))

(assert (=> b!1479723 m!1365569))

(assert (=> b!1479723 m!1365569))

(declare-fun m!1365603 () Bool)

(assert (=> b!1479723 m!1365603))

(declare-fun m!1365605 () Bool)

(assert (=> b!1479720 m!1365605))

(assert (=> b!1479733 m!1365569))

(assert (=> b!1479733 m!1365569))

(declare-fun m!1365607 () Bool)

(assert (=> b!1479733 m!1365607))

(assert (=> b!1479725 m!1365569))

(assert (=> b!1479725 m!1365569))

(declare-fun m!1365609 () Bool)

(assert (=> b!1479725 m!1365609))

(declare-fun m!1365611 () Bool)

(assert (=> b!1479728 m!1365611))

(declare-fun m!1365613 () Bool)

(assert (=> b!1479729 m!1365613))

(assert (=> b!1479729 m!1365613))

(declare-fun m!1365615 () Bool)

(assert (=> b!1479729 m!1365615))

(assert (=> b!1479732 m!1365581))

(declare-fun m!1365617 () Bool)

(assert (=> b!1479732 m!1365617))

(declare-fun m!1365619 () Bool)

(assert (=> b!1479721 m!1365619))

(declare-fun m!1365621 () Bool)

(assert (=> start!126248 m!1365621))

(declare-fun m!1365623 () Bool)

(assert (=> start!126248 m!1365623))

(push 1)

