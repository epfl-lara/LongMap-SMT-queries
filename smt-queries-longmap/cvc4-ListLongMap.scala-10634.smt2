; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124946 () Bool)

(assert start!124946)

(declare-fun b!1452155 () Bool)

(declare-fun res!983311 () Bool)

(declare-fun e!817523 () Bool)

(assert (=> b!1452155 (=> (not res!983311) (not e!817523))))

(declare-datatypes ((array!98394 0))(
  ( (array!98395 (arr!47485 (Array (_ BitVec 32) (_ BitVec 64))) (size!48035 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98394)

(declare-datatypes ((List!33986 0))(
  ( (Nil!33983) (Cons!33982 (h!35332 (_ BitVec 64)) (t!48680 List!33986)) )
))
(declare-fun arrayNoDuplicates!0 (array!98394 (_ BitVec 32) List!33986) Bool)

(assert (=> b!1452155 (= res!983311 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33983))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1452156 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun e!817520 () Bool)

(assert (=> b!1452156 (= e!817520 (and (or (= (select (arr!47485 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47485 a!2862) intermediateBeforeIndex!19) (select (arr!47485 a!2862) j!93))) (or (and (= (select (arr!47485 a!2862) index!646) (select (store (arr!47485 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47485 a!2862) index!646) (select (arr!47485 a!2862) j!93))) (= (select (arr!47485 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47485 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!817519 () Bool)

(declare-fun lt!636864 () array!98394)

(declare-fun b!1452157 () Bool)

(declare-datatypes ((SeekEntryResult!11737 0))(
  ( (MissingZero!11737 (index!49340 (_ BitVec 32))) (Found!11737 (index!49341 (_ BitVec 32))) (Intermediate!11737 (undefined!12549 Bool) (index!49342 (_ BitVec 32)) (x!130986 (_ BitVec 32))) (Undefined!11737) (MissingVacant!11737 (index!49343 (_ BitVec 32))) )
))
(declare-fun lt!636860 () SeekEntryResult!11737)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!636861 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98394 (_ BitVec 32)) SeekEntryResult!11737)

(assert (=> b!1452157 (= e!817519 (= lt!636860 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636861 lt!636864 mask!2687)))))

(declare-fun b!1452158 () Bool)

(declare-fun res!983310 () Bool)

(assert (=> b!1452158 (=> (not res!983310) (not e!817523))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1452158 (= res!983310 (validKeyInArray!0 (select (arr!47485 a!2862) i!1006)))))

(declare-fun b!1452160 () Bool)

(declare-fun res!983307 () Bool)

(declare-fun e!817518 () Bool)

(assert (=> b!1452160 (=> (not res!983307) (not e!817518))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1452160 (= res!983307 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1452161 () Bool)

(declare-fun res!983318 () Bool)

(assert (=> b!1452161 (=> (not res!983318) (not e!817523))))

(assert (=> b!1452161 (= res!983318 (and (= (size!48035 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48035 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48035 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1452162 () Bool)

(declare-fun e!817517 () Bool)

(assert (=> b!1452162 (= e!817523 e!817517)))

(declare-fun res!983320 () Bool)

(assert (=> b!1452162 (=> (not res!983320) (not e!817517))))

(assert (=> b!1452162 (= res!983320 (= (select (store (arr!47485 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1452162 (= lt!636864 (array!98395 (store (arr!47485 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48035 a!2862)))))

(declare-fun b!1452163 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98394 (_ BitVec 32)) SeekEntryResult!11737)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98394 (_ BitVec 32)) SeekEntryResult!11737)

(assert (=> b!1452163 (= e!817519 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636861 lt!636864 mask!2687) (seekEntryOrOpen!0 lt!636861 lt!636864 mask!2687)))))

(declare-fun b!1452164 () Bool)

(declare-fun res!983309 () Bool)

(assert (=> b!1452164 (=> (not res!983309) (not e!817523))))

(assert (=> b!1452164 (= res!983309 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48035 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48035 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48035 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1452165 () Bool)

(declare-fun res!983317 () Bool)

(assert (=> b!1452165 (=> (not res!983317) (not e!817518))))

(assert (=> b!1452165 (= res!983317 e!817519)))

(declare-fun c!133935 () Bool)

(assert (=> b!1452165 (= c!133935 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1452166 () Bool)

(declare-fun e!817521 () Bool)

(assert (=> b!1452166 (= e!817517 e!817521)))

(declare-fun res!983315 () Bool)

(assert (=> b!1452166 (=> (not res!983315) (not e!817521))))

(declare-fun lt!636862 () SeekEntryResult!11737)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1452166 (= res!983315 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47485 a!2862) j!93) mask!2687) (select (arr!47485 a!2862) j!93) a!2862 mask!2687) lt!636862))))

(assert (=> b!1452166 (= lt!636862 (Intermediate!11737 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1452167 () Bool)

(declare-fun res!983308 () Bool)

(assert (=> b!1452167 (=> (not res!983308) (not e!817520))))

(assert (=> b!1452167 (= res!983308 (= (seekEntryOrOpen!0 (select (arr!47485 a!2862) j!93) a!2862 mask!2687) (Found!11737 j!93)))))

(declare-fun res!983316 () Bool)

(assert (=> start!124946 (=> (not res!983316) (not e!817523))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124946 (= res!983316 (validMask!0 mask!2687))))

(assert (=> start!124946 e!817523))

(assert (=> start!124946 true))

(declare-fun array_inv!36513 (array!98394) Bool)

(assert (=> start!124946 (array_inv!36513 a!2862)))

(declare-fun b!1452159 () Bool)

(declare-fun res!983319 () Bool)

(assert (=> b!1452159 (=> (not res!983319) (not e!817521))))

(assert (=> b!1452159 (= res!983319 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47485 a!2862) j!93) a!2862 mask!2687) lt!636862))))

(declare-fun b!1452168 () Bool)

(declare-fun res!983313 () Bool)

(assert (=> b!1452168 (=> (not res!983313) (not e!817523))))

(assert (=> b!1452168 (= res!983313 (validKeyInArray!0 (select (arr!47485 a!2862) j!93)))))

(declare-fun b!1452169 () Bool)

(assert (=> b!1452169 (= e!817518 (not true))))

(assert (=> b!1452169 e!817520))

(declare-fun res!983312 () Bool)

(assert (=> b!1452169 (=> (not res!983312) (not e!817520))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98394 (_ BitVec 32)) Bool)

(assert (=> b!1452169 (= res!983312 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48970 0))(
  ( (Unit!48971) )
))
(declare-fun lt!636863 () Unit!48970)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98394 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48970)

(assert (=> b!1452169 (= lt!636863 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1452170 () Bool)

(declare-fun res!983306 () Bool)

(assert (=> b!1452170 (=> (not res!983306) (not e!817523))))

(assert (=> b!1452170 (= res!983306 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1452171 () Bool)

(assert (=> b!1452171 (= e!817521 e!817518)))

(declare-fun res!983314 () Bool)

(assert (=> b!1452171 (=> (not res!983314) (not e!817518))))

(assert (=> b!1452171 (= res!983314 (= lt!636860 (Intermediate!11737 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1452171 (= lt!636860 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636861 mask!2687) lt!636861 lt!636864 mask!2687))))

(assert (=> b!1452171 (= lt!636861 (select (store (arr!47485 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(assert (= (and start!124946 res!983316) b!1452161))

(assert (= (and b!1452161 res!983318) b!1452158))

(assert (= (and b!1452158 res!983310) b!1452168))

(assert (= (and b!1452168 res!983313) b!1452170))

(assert (= (and b!1452170 res!983306) b!1452155))

(assert (= (and b!1452155 res!983311) b!1452164))

(assert (= (and b!1452164 res!983309) b!1452162))

(assert (= (and b!1452162 res!983320) b!1452166))

(assert (= (and b!1452166 res!983315) b!1452159))

(assert (= (and b!1452159 res!983319) b!1452171))

(assert (= (and b!1452171 res!983314) b!1452165))

(assert (= (and b!1452165 c!133935) b!1452157))

(assert (= (and b!1452165 (not c!133935)) b!1452163))

(assert (= (and b!1452165 res!983317) b!1452160))

(assert (= (and b!1452160 res!983307) b!1452169))

(assert (= (and b!1452169 res!983312) b!1452167))

(assert (= (and b!1452167 res!983308) b!1452156))

(declare-fun m!1340735 () Bool)

(assert (=> start!124946 m!1340735))

(declare-fun m!1340737 () Bool)

(assert (=> start!124946 m!1340737))

(declare-fun m!1340739 () Bool)

(assert (=> b!1452170 m!1340739))

(declare-fun m!1340741 () Bool)

(assert (=> b!1452156 m!1340741))

(declare-fun m!1340743 () Bool)

(assert (=> b!1452156 m!1340743))

(declare-fun m!1340745 () Bool)

(assert (=> b!1452156 m!1340745))

(declare-fun m!1340747 () Bool)

(assert (=> b!1452156 m!1340747))

(declare-fun m!1340749 () Bool)

(assert (=> b!1452156 m!1340749))

(assert (=> b!1452167 m!1340749))

(assert (=> b!1452167 m!1340749))

(declare-fun m!1340751 () Bool)

(assert (=> b!1452167 m!1340751))

(assert (=> b!1452166 m!1340749))

(assert (=> b!1452166 m!1340749))

(declare-fun m!1340753 () Bool)

(assert (=> b!1452166 m!1340753))

(assert (=> b!1452166 m!1340753))

(assert (=> b!1452166 m!1340749))

(declare-fun m!1340755 () Bool)

(assert (=> b!1452166 m!1340755))

(assert (=> b!1452168 m!1340749))

(assert (=> b!1452168 m!1340749))

(declare-fun m!1340757 () Bool)

(assert (=> b!1452168 m!1340757))

(declare-fun m!1340759 () Bool)

(assert (=> b!1452157 m!1340759))

(assert (=> b!1452162 m!1340741))

(declare-fun m!1340761 () Bool)

(assert (=> b!1452162 m!1340761))

(declare-fun m!1340763 () Bool)

(assert (=> b!1452158 m!1340763))

(assert (=> b!1452158 m!1340763))

(declare-fun m!1340765 () Bool)

(assert (=> b!1452158 m!1340765))

(declare-fun m!1340767 () Bool)

(assert (=> b!1452171 m!1340767))

(assert (=> b!1452171 m!1340767))

(declare-fun m!1340769 () Bool)

(assert (=> b!1452171 m!1340769))

(assert (=> b!1452171 m!1340741))

(declare-fun m!1340771 () Bool)

(assert (=> b!1452171 m!1340771))

(declare-fun m!1340773 () Bool)

(assert (=> b!1452155 m!1340773))

(declare-fun m!1340775 () Bool)

(assert (=> b!1452169 m!1340775))

(declare-fun m!1340777 () Bool)

(assert (=> b!1452169 m!1340777))

(declare-fun m!1340779 () Bool)

(assert (=> b!1452163 m!1340779))

(declare-fun m!1340781 () Bool)

(assert (=> b!1452163 m!1340781))

(assert (=> b!1452159 m!1340749))

(assert (=> b!1452159 m!1340749))

(declare-fun m!1340783 () Bool)

(assert (=> b!1452159 m!1340783))

(push 1)

