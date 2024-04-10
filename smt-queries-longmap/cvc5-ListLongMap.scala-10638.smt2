; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124966 () Bool)

(assert start!124966)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1452665 () Bool)

(declare-datatypes ((array!98414 0))(
  ( (array!98415 (arr!47495 (Array (_ BitVec 32) (_ BitVec 64))) (size!48045 (_ BitVec 32))) )
))
(declare-fun lt!637011 () array!98414)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11747 0))(
  ( (MissingZero!11747 (index!49380 (_ BitVec 32))) (Found!11747 (index!49381 (_ BitVec 32))) (Intermediate!11747 (undefined!12559 Bool) (index!49382 (_ BitVec 32)) (x!131028 (_ BitVec 32))) (Undefined!11747) (MissingVacant!11747 (index!49383 (_ BitVec 32))) )
))
(declare-fun lt!637010 () SeekEntryResult!11747)

(declare-fun e!817730 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!637012 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98414 (_ BitVec 32)) SeekEntryResult!11747)

(assert (=> b!1452665 (= e!817730 (= lt!637010 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!637012 lt!637011 mask!2687)))))

(declare-fun b!1452666 () Bool)

(declare-fun res!983758 () Bool)

(declare-fun e!817729 () Bool)

(assert (=> b!1452666 (=> (not res!983758) (not e!817729))))

(declare-fun a!2862 () array!98414)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98414 (_ BitVec 32)) SeekEntryResult!11747)

(assert (=> b!1452666 (= res!983758 (= (seekEntryOrOpen!0 (select (arr!47495 a!2862) j!93) a!2862 mask!2687) (Found!11747 j!93)))))

(declare-fun b!1452667 () Bool)

(declare-fun res!983762 () Bool)

(declare-fun e!817727 () Bool)

(assert (=> b!1452667 (=> (not res!983762) (not e!817727))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1452667 (= res!983762 (validKeyInArray!0 (select (arr!47495 a!2862) i!1006)))))

(declare-fun b!1452668 () Bool)

(declare-fun e!817733 () Bool)

(declare-fun e!817731 () Bool)

(assert (=> b!1452668 (= e!817733 e!817731)))

(declare-fun res!983765 () Bool)

(assert (=> b!1452668 (=> (not res!983765) (not e!817731))))

(declare-fun lt!637013 () SeekEntryResult!11747)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1452668 (= res!983765 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47495 a!2862) j!93) mask!2687) (select (arr!47495 a!2862) j!93) a!2862 mask!2687) lt!637013))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1452668 (= lt!637013 (Intermediate!11747 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1452669 () Bool)

(declare-fun res!983763 () Bool)

(assert (=> b!1452669 (=> (not res!983763) (not e!817727))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1452669 (= res!983763 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48045 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48045 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48045 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1452670 () Bool)

(assert (=> b!1452670 (= e!817729 (and (or (= (select (arr!47495 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47495 a!2862) intermediateBeforeIndex!19) (select (arr!47495 a!2862) j!93))) (or (and (= (select (arr!47495 a!2862) index!646) (select (store (arr!47495 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47495 a!2862) index!646) (select (arr!47495 a!2862) j!93))) (= (select (arr!47495 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47495 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1452671 () Bool)

(declare-fun res!983759 () Bool)

(assert (=> b!1452671 (=> (not res!983759) (not e!817731))))

(assert (=> b!1452671 (= res!983759 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47495 a!2862) j!93) a!2862 mask!2687) lt!637013))))

(declare-fun b!1452672 () Bool)

(assert (=> b!1452672 (= e!817727 e!817733)))

(declare-fun res!983761 () Bool)

(assert (=> b!1452672 (=> (not res!983761) (not e!817733))))

(assert (=> b!1452672 (= res!983761 (= (select (store (arr!47495 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1452672 (= lt!637011 (array!98415 (store (arr!47495 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48045 a!2862)))))

(declare-fun b!1452674 () Bool)

(declare-fun e!817732 () Bool)

(assert (=> b!1452674 (= e!817732 (not true))))

(assert (=> b!1452674 e!817729))

(declare-fun res!983766 () Bool)

(assert (=> b!1452674 (=> (not res!983766) (not e!817729))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98414 (_ BitVec 32)) Bool)

(assert (=> b!1452674 (= res!983766 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48990 0))(
  ( (Unit!48991) )
))
(declare-fun lt!637014 () Unit!48990)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98414 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48990)

(assert (=> b!1452674 (= lt!637014 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1452675 () Bool)

(declare-fun res!983768 () Bool)

(assert (=> b!1452675 (=> (not res!983768) (not e!817727))))

(declare-datatypes ((List!33996 0))(
  ( (Nil!33993) (Cons!33992 (h!35342 (_ BitVec 64)) (t!48690 List!33996)) )
))
(declare-fun arrayNoDuplicates!0 (array!98414 (_ BitVec 32) List!33996) Bool)

(assert (=> b!1452675 (= res!983768 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33993))))

(declare-fun b!1452676 () Bool)

(declare-fun res!983764 () Bool)

(assert (=> b!1452676 (=> (not res!983764) (not e!817732))))

(assert (=> b!1452676 (= res!983764 e!817730)))

(declare-fun c!133965 () Bool)

(assert (=> b!1452676 (= c!133965 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1452677 () Bool)

(declare-fun res!983769 () Bool)

(assert (=> b!1452677 (=> (not res!983769) (not e!817727))))

(assert (=> b!1452677 (= res!983769 (and (= (size!48045 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48045 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48045 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1452678 () Bool)

(assert (=> b!1452678 (= e!817731 e!817732)))

(declare-fun res!983756 () Bool)

(assert (=> b!1452678 (=> (not res!983756) (not e!817732))))

(assert (=> b!1452678 (= res!983756 (= lt!637010 (Intermediate!11747 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1452678 (= lt!637010 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!637012 mask!2687) lt!637012 lt!637011 mask!2687))))

(assert (=> b!1452678 (= lt!637012 (select (store (arr!47495 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1452679 () Bool)

(declare-fun res!983760 () Bool)

(assert (=> b!1452679 (=> (not res!983760) (not e!817727))))

(assert (=> b!1452679 (= res!983760 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1452680 () Bool)

(declare-fun res!983757 () Bool)

(assert (=> b!1452680 (=> (not res!983757) (not e!817727))))

(assert (=> b!1452680 (= res!983757 (validKeyInArray!0 (select (arr!47495 a!2862) j!93)))))

(declare-fun b!1452681 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98414 (_ BitVec 32)) SeekEntryResult!11747)

(assert (=> b!1452681 (= e!817730 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637012 lt!637011 mask!2687) (seekEntryOrOpen!0 lt!637012 lt!637011 mask!2687)))))

(declare-fun b!1452673 () Bool)

(declare-fun res!983767 () Bool)

(assert (=> b!1452673 (=> (not res!983767) (not e!817732))))

(assert (=> b!1452673 (= res!983767 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun res!983770 () Bool)

(assert (=> start!124966 (=> (not res!983770) (not e!817727))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124966 (= res!983770 (validMask!0 mask!2687))))

(assert (=> start!124966 e!817727))

(assert (=> start!124966 true))

(declare-fun array_inv!36523 (array!98414) Bool)

(assert (=> start!124966 (array_inv!36523 a!2862)))

(assert (= (and start!124966 res!983770) b!1452677))

(assert (= (and b!1452677 res!983769) b!1452667))

(assert (= (and b!1452667 res!983762) b!1452680))

(assert (= (and b!1452680 res!983757) b!1452679))

(assert (= (and b!1452679 res!983760) b!1452675))

(assert (= (and b!1452675 res!983768) b!1452669))

(assert (= (and b!1452669 res!983763) b!1452672))

(assert (= (and b!1452672 res!983761) b!1452668))

(assert (= (and b!1452668 res!983765) b!1452671))

(assert (= (and b!1452671 res!983759) b!1452678))

(assert (= (and b!1452678 res!983756) b!1452676))

(assert (= (and b!1452676 c!133965) b!1452665))

(assert (= (and b!1452676 (not c!133965)) b!1452681))

(assert (= (and b!1452676 res!983764) b!1452673))

(assert (= (and b!1452673 res!983767) b!1452674))

(assert (= (and b!1452674 res!983766) b!1452666))

(assert (= (and b!1452666 res!983758) b!1452670))

(declare-fun m!1341235 () Bool)

(assert (=> b!1452678 m!1341235))

(assert (=> b!1452678 m!1341235))

(declare-fun m!1341237 () Bool)

(assert (=> b!1452678 m!1341237))

(declare-fun m!1341239 () Bool)

(assert (=> b!1452678 m!1341239))

(declare-fun m!1341241 () Bool)

(assert (=> b!1452678 m!1341241))

(declare-fun m!1341243 () Bool)

(assert (=> b!1452666 m!1341243))

(assert (=> b!1452666 m!1341243))

(declare-fun m!1341245 () Bool)

(assert (=> b!1452666 m!1341245))

(declare-fun m!1341247 () Bool)

(assert (=> start!124966 m!1341247))

(declare-fun m!1341249 () Bool)

(assert (=> start!124966 m!1341249))

(declare-fun m!1341251 () Bool)

(assert (=> b!1452679 m!1341251))

(assert (=> b!1452670 m!1341239))

(declare-fun m!1341253 () Bool)

(assert (=> b!1452670 m!1341253))

(declare-fun m!1341255 () Bool)

(assert (=> b!1452670 m!1341255))

(declare-fun m!1341257 () Bool)

(assert (=> b!1452670 m!1341257))

(assert (=> b!1452670 m!1341243))

(assert (=> b!1452672 m!1341239))

(declare-fun m!1341259 () Bool)

(assert (=> b!1452672 m!1341259))

(declare-fun m!1341261 () Bool)

(assert (=> b!1452665 m!1341261))

(assert (=> b!1452668 m!1341243))

(assert (=> b!1452668 m!1341243))

(declare-fun m!1341263 () Bool)

(assert (=> b!1452668 m!1341263))

(assert (=> b!1452668 m!1341263))

(assert (=> b!1452668 m!1341243))

(declare-fun m!1341265 () Bool)

(assert (=> b!1452668 m!1341265))

(declare-fun m!1341267 () Bool)

(assert (=> b!1452674 m!1341267))

(declare-fun m!1341269 () Bool)

(assert (=> b!1452674 m!1341269))

(declare-fun m!1341271 () Bool)

(assert (=> b!1452667 m!1341271))

(assert (=> b!1452667 m!1341271))

(declare-fun m!1341273 () Bool)

(assert (=> b!1452667 m!1341273))

(assert (=> b!1452671 m!1341243))

(assert (=> b!1452671 m!1341243))

(declare-fun m!1341275 () Bool)

(assert (=> b!1452671 m!1341275))

(declare-fun m!1341277 () Bool)

(assert (=> b!1452681 m!1341277))

(declare-fun m!1341279 () Bool)

(assert (=> b!1452681 m!1341279))

(assert (=> b!1452680 m!1341243))

(assert (=> b!1452680 m!1341243))

(declare-fun m!1341281 () Bool)

(assert (=> b!1452680 m!1341281))

(declare-fun m!1341283 () Bool)

(assert (=> b!1452675 m!1341283))

(push 1)

