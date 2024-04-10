; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124908 () Bool)

(assert start!124908)

(declare-fun b!1451177 () Bool)

(declare-fun res!982443 () Bool)

(declare-fun e!817115 () Bool)

(assert (=> b!1451177 (=> (not res!982443) (not e!817115))))

(declare-datatypes ((array!98356 0))(
  ( (array!98357 (arr!47466 (Array (_ BitVec 32) (_ BitVec 64))) (size!48016 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98356)

(declare-datatypes ((List!33967 0))(
  ( (Nil!33964) (Cons!33963 (h!35313 (_ BitVec 64)) (t!48661 List!33967)) )
))
(declare-fun arrayNoDuplicates!0 (array!98356 (_ BitVec 32) List!33967) Bool)

(assert (=> b!1451177 (= res!982443 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33964))))

(declare-fun b!1451178 () Bool)

(declare-fun res!982452 () Bool)

(assert (=> b!1451178 (=> (not res!982452) (not e!817115))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98356 (_ BitVec 32)) Bool)

(assert (=> b!1451178 (= res!982452 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1451179 () Bool)

(declare-fun res!982442 () Bool)

(declare-fun e!817110 () Bool)

(assert (=> b!1451179 (=> (not res!982442) (not e!817110))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11718 0))(
  ( (MissingZero!11718 (index!49264 (_ BitVec 32))) (Found!11718 (index!49265 (_ BitVec 32))) (Intermediate!11718 (undefined!12530 Bool) (index!49266 (_ BitVec 32)) (x!130919 (_ BitVec 32))) (Undefined!11718) (MissingVacant!11718 (index!49267 (_ BitVec 32))) )
))
(declare-fun lt!636579 () SeekEntryResult!11718)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98356 (_ BitVec 32)) SeekEntryResult!11718)

(assert (=> b!1451179 (= res!982442 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47466 a!2862) j!93) a!2862 mask!2687) lt!636579))))

(declare-fun b!1451181 () Bool)

(declare-fun e!817113 () Bool)

(assert (=> b!1451181 (= e!817113 e!817110)))

(declare-fun res!982447 () Bool)

(assert (=> b!1451181 (=> (not res!982447) (not e!817110))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1451181 (= res!982447 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47466 a!2862) j!93) mask!2687) (select (arr!47466 a!2862) j!93) a!2862 mask!2687) lt!636579))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1451181 (= lt!636579 (Intermediate!11718 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1451182 () Bool)

(declare-fun res!982451 () Bool)

(declare-fun e!817111 () Bool)

(assert (=> b!1451182 (=> (not res!982451) (not e!817111))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1451182 (= res!982451 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1451183 () Bool)

(declare-fun res!982446 () Bool)

(assert (=> b!1451183 (=> (not res!982446) (not e!817111))))

(declare-fun e!817112 () Bool)

(assert (=> b!1451183 (= res!982446 e!817112)))

(declare-fun c!133878 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1451183 (= c!133878 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1451184 () Bool)

(declare-fun res!982449 () Bool)

(assert (=> b!1451184 (=> (not res!982449) (not e!817115))))

(assert (=> b!1451184 (= res!982449 (and (= (size!48016 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48016 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48016 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1451185 () Bool)

(declare-fun e!817114 () Bool)

(assert (=> b!1451185 (= e!817114 (and (or (= (select (arr!47466 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47466 a!2862) intermediateBeforeIndex!19) (select (arr!47466 a!2862) j!93))) (or (and (= (select (arr!47466 a!2862) index!646) (select (store (arr!47466 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47466 a!2862) index!646) (select (arr!47466 a!2862) j!93))) (= (select (arr!47466 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47466 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun lt!636575 () (_ BitVec 64))

(declare-fun b!1451186 () Bool)

(declare-fun lt!636577 () array!98356)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98356 (_ BitVec 32)) SeekEntryResult!11718)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98356 (_ BitVec 32)) SeekEntryResult!11718)

(assert (=> b!1451186 (= e!817112 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636575 lt!636577 mask!2687) (seekEntryOrOpen!0 lt!636575 lt!636577 mask!2687)))))

(declare-fun b!1451187 () Bool)

(assert (=> b!1451187 (= e!817110 e!817111)))

(declare-fun res!982456 () Bool)

(assert (=> b!1451187 (=> (not res!982456) (not e!817111))))

(declare-fun lt!636578 () SeekEntryResult!11718)

(assert (=> b!1451187 (= res!982456 (= lt!636578 (Intermediate!11718 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1451187 (= lt!636578 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636575 mask!2687) lt!636575 lt!636577 mask!2687))))

(assert (=> b!1451187 (= lt!636575 (select (store (arr!47466 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1451188 () Bool)

(declare-fun res!982448 () Bool)

(assert (=> b!1451188 (=> (not res!982448) (not e!817115))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1451188 (= res!982448 (validKeyInArray!0 (select (arr!47466 a!2862) i!1006)))))

(declare-fun b!1451189 () Bool)

(declare-fun res!982445 () Bool)

(assert (=> b!1451189 (=> (not res!982445) (not e!817115))))

(assert (=> b!1451189 (= res!982445 (validKeyInArray!0 (select (arr!47466 a!2862) j!93)))))

(declare-fun b!1451180 () Bool)

(assert (=> b!1451180 (= e!817111 (not true))))

(assert (=> b!1451180 e!817114))

(declare-fun res!982455 () Bool)

(assert (=> b!1451180 (=> (not res!982455) (not e!817114))))

(assert (=> b!1451180 (= res!982455 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48932 0))(
  ( (Unit!48933) )
))
(declare-fun lt!636576 () Unit!48932)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98356 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48932)

(assert (=> b!1451180 (= lt!636576 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun res!982450 () Bool)

(assert (=> start!124908 (=> (not res!982450) (not e!817115))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124908 (= res!982450 (validMask!0 mask!2687))))

(assert (=> start!124908 e!817115))

(assert (=> start!124908 true))

(declare-fun array_inv!36494 (array!98356) Bool)

(assert (=> start!124908 (array_inv!36494 a!2862)))

(declare-fun b!1451190 () Bool)

(assert (=> b!1451190 (= e!817115 e!817113)))

(declare-fun res!982453 () Bool)

(assert (=> b!1451190 (=> (not res!982453) (not e!817113))))

(assert (=> b!1451190 (= res!982453 (= (select (store (arr!47466 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1451190 (= lt!636577 (array!98357 (store (arr!47466 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48016 a!2862)))))

(declare-fun b!1451191 () Bool)

(declare-fun res!982454 () Bool)

(assert (=> b!1451191 (=> (not res!982454) (not e!817114))))

(assert (=> b!1451191 (= res!982454 (= (seekEntryOrOpen!0 (select (arr!47466 a!2862) j!93) a!2862 mask!2687) (Found!11718 j!93)))))

(declare-fun b!1451192 () Bool)

(assert (=> b!1451192 (= e!817112 (= lt!636578 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636575 lt!636577 mask!2687)))))

(declare-fun b!1451193 () Bool)

(declare-fun res!982444 () Bool)

(assert (=> b!1451193 (=> (not res!982444) (not e!817115))))

(assert (=> b!1451193 (= res!982444 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48016 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48016 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48016 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(assert (= (and start!124908 res!982450) b!1451184))

(assert (= (and b!1451184 res!982449) b!1451188))

(assert (= (and b!1451188 res!982448) b!1451189))

(assert (= (and b!1451189 res!982445) b!1451178))

(assert (= (and b!1451178 res!982452) b!1451177))

(assert (= (and b!1451177 res!982443) b!1451193))

(assert (= (and b!1451193 res!982444) b!1451190))

(assert (= (and b!1451190 res!982453) b!1451181))

(assert (= (and b!1451181 res!982447) b!1451179))

(assert (= (and b!1451179 res!982442) b!1451187))

(assert (= (and b!1451187 res!982456) b!1451183))

(assert (= (and b!1451183 c!133878) b!1451192))

(assert (= (and b!1451183 (not c!133878)) b!1451186))

(assert (= (and b!1451183 res!982446) b!1451182))

(assert (= (and b!1451182 res!982451) b!1451180))

(assert (= (and b!1451180 res!982455) b!1451191))

(assert (= (and b!1451191 res!982454) b!1451185))

(declare-fun m!1339779 () Bool)

(assert (=> b!1451179 m!1339779))

(assert (=> b!1451179 m!1339779))

(declare-fun m!1339781 () Bool)

(assert (=> b!1451179 m!1339781))

(declare-fun m!1339783 () Bool)

(assert (=> b!1451188 m!1339783))

(assert (=> b!1451188 m!1339783))

(declare-fun m!1339785 () Bool)

(assert (=> b!1451188 m!1339785))

(declare-fun m!1339787 () Bool)

(assert (=> b!1451186 m!1339787))

(declare-fun m!1339789 () Bool)

(assert (=> b!1451186 m!1339789))

(declare-fun m!1339791 () Bool)

(assert (=> b!1451185 m!1339791))

(declare-fun m!1339793 () Bool)

(assert (=> b!1451185 m!1339793))

(declare-fun m!1339795 () Bool)

(assert (=> b!1451185 m!1339795))

(declare-fun m!1339797 () Bool)

(assert (=> b!1451185 m!1339797))

(assert (=> b!1451185 m!1339779))

(assert (=> b!1451189 m!1339779))

(assert (=> b!1451189 m!1339779))

(declare-fun m!1339799 () Bool)

(assert (=> b!1451189 m!1339799))

(declare-fun m!1339801 () Bool)

(assert (=> b!1451180 m!1339801))

(declare-fun m!1339803 () Bool)

(assert (=> b!1451180 m!1339803))

(assert (=> b!1451181 m!1339779))

(assert (=> b!1451181 m!1339779))

(declare-fun m!1339805 () Bool)

(assert (=> b!1451181 m!1339805))

(assert (=> b!1451181 m!1339805))

(assert (=> b!1451181 m!1339779))

(declare-fun m!1339807 () Bool)

(assert (=> b!1451181 m!1339807))

(declare-fun m!1339809 () Bool)

(assert (=> start!124908 m!1339809))

(declare-fun m!1339811 () Bool)

(assert (=> start!124908 m!1339811))

(assert (=> b!1451191 m!1339779))

(assert (=> b!1451191 m!1339779))

(declare-fun m!1339813 () Bool)

(assert (=> b!1451191 m!1339813))

(declare-fun m!1339815 () Bool)

(assert (=> b!1451192 m!1339815))

(declare-fun m!1339817 () Bool)

(assert (=> b!1451178 m!1339817))

(declare-fun m!1339819 () Bool)

(assert (=> b!1451177 m!1339819))

(assert (=> b!1451190 m!1339791))

(declare-fun m!1339821 () Bool)

(assert (=> b!1451190 m!1339821))

(declare-fun m!1339823 () Bool)

(assert (=> b!1451187 m!1339823))

(assert (=> b!1451187 m!1339823))

(declare-fun m!1339825 () Bool)

(assert (=> b!1451187 m!1339825))

(assert (=> b!1451187 m!1339791))

(declare-fun m!1339827 () Bool)

(assert (=> b!1451187 m!1339827))

(check-sat (not b!1451178) (not b!1451181) (not b!1451179) (not b!1451191) (not b!1451186) (not b!1451180) (not b!1451177) (not b!1451189) (not b!1451192) (not b!1451188) (not start!124908) (not b!1451187))
(check-sat)
