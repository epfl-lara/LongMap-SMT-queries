; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124924 () Bool)

(assert start!124924)

(declare-fun res!982813 () Bool)

(declare-fun e!817284 () Bool)

(assert (=> start!124924 (=> (not res!982813) (not e!817284))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124924 (= res!982813 (validMask!0 mask!2687))))

(assert (=> start!124924 e!817284))

(assert (=> start!124924 true))

(declare-datatypes ((array!98372 0))(
  ( (array!98373 (arr!47474 (Array (_ BitVec 32) (_ BitVec 64))) (size!48024 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98372)

(declare-fun array_inv!36502 (array!98372) Bool)

(assert (=> start!124924 (array_inv!36502 a!2862)))

(declare-fun b!1451587 () Bool)

(declare-fun e!817281 () Bool)

(declare-fun lt!636697 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1451587 (= e!817281 (validKeyInArray!0 lt!636697))))

(declare-fun b!1451588 () Bool)

(declare-fun e!817282 () Bool)

(assert (=> b!1451588 (= e!817284 e!817282)))

(declare-fun res!982804 () Bool)

(assert (=> b!1451588 (=> (not res!982804) (not e!817282))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1451588 (= res!982804 (= (select (store (arr!47474 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!636695 () array!98372)

(assert (=> b!1451588 (= lt!636695 (array!98373 (store (arr!47474 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48024 a!2862)))))

(declare-fun b!1451589 () Bool)

(declare-fun e!817286 () Bool)

(declare-fun e!817279 () Bool)

(assert (=> b!1451589 (= e!817286 e!817279)))

(declare-fun res!982808 () Bool)

(assert (=> b!1451589 (=> (not res!982808) (not e!817279))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11726 0))(
  ( (MissingZero!11726 (index!49296 (_ BitVec 32))) (Found!11726 (index!49297 (_ BitVec 32))) (Intermediate!11726 (undefined!12538 Bool) (index!49298 (_ BitVec 32)) (x!130951 (_ BitVec 32))) (Undefined!11726) (MissingVacant!11726 (index!49299 (_ BitVec 32))) )
))
(declare-fun lt!636699 () SeekEntryResult!11726)

(assert (=> b!1451589 (= res!982808 (= lt!636699 (Intermediate!11726 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98372 (_ BitVec 32)) SeekEntryResult!11726)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1451589 (= lt!636699 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636697 mask!2687) lt!636697 lt!636695 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1451589 (= lt!636697 (select (store (arr!47474 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1451590 () Bool)

(declare-fun res!982811 () Bool)

(declare-fun e!817285 () Bool)

(assert (=> b!1451590 (=> (not res!982811) (not e!817285))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98372 (_ BitVec 32)) SeekEntryResult!11726)

(assert (=> b!1451590 (= res!982811 (= (seekEntryOrOpen!0 (select (arr!47474 a!2862) j!93) a!2862 mask!2687) (Found!11726 j!93)))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1451591 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1451591 (= e!817285 (and (or (= (select (arr!47474 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47474 a!2862) intermediateBeforeIndex!19) (select (arr!47474 a!2862) j!93))) (or (and (= (select (arr!47474 a!2862) index!646) (select (store (arr!47474 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47474 a!2862) index!646) (select (arr!47474 a!2862) j!93))) (= (select (arr!47474 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47474 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1451592 () Bool)

(declare-fun res!982807 () Bool)

(assert (=> b!1451592 (=> (not res!982807) (not e!817284))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1451592 (= res!982807 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48024 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48024 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48024 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1451593 () Bool)

(assert (=> b!1451593 (= e!817282 e!817286)))

(declare-fun res!982805 () Bool)

(assert (=> b!1451593 (=> (not res!982805) (not e!817286))))

(declare-fun lt!636698 () SeekEntryResult!11726)

(assert (=> b!1451593 (= res!982805 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47474 a!2862) j!93) mask!2687) (select (arr!47474 a!2862) j!93) a!2862 mask!2687) lt!636698))))

(assert (=> b!1451593 (= lt!636698 (Intermediate!11726 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun e!817283 () Bool)

(declare-fun b!1451594 () Bool)

(assert (=> b!1451594 (= e!817283 (= lt!636699 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636697 lt!636695 mask!2687)))))

(declare-fun b!1451595 () Bool)

(declare-fun res!982816 () Bool)

(assert (=> b!1451595 (=> (not res!982816) (not e!817284))))

(assert (=> b!1451595 (= res!982816 (and (= (size!48024 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48024 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48024 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1451596 () Bool)

(declare-fun res!982819 () Bool)

(assert (=> b!1451596 (=> (not res!982819) (not e!817279))))

(assert (=> b!1451596 (= res!982819 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1451597 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98372 (_ BitVec 32)) SeekEntryResult!11726)

(assert (=> b!1451597 (= e!817283 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636697 lt!636695 mask!2687) (seekEntryOrOpen!0 lt!636697 lt!636695 mask!2687)))))

(declare-fun b!1451598 () Bool)

(declare-fun res!982809 () Bool)

(assert (=> b!1451598 (=> (not res!982809) (not e!817284))))

(assert (=> b!1451598 (= res!982809 (validKeyInArray!0 (select (arr!47474 a!2862) j!93)))))

(declare-fun b!1451599 () Bool)

(declare-fun res!982818 () Bool)

(assert (=> b!1451599 (=> (not res!982818) (not e!817284))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98372 (_ BitVec 32)) Bool)

(assert (=> b!1451599 (= res!982818 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1451600 () Bool)

(assert (=> b!1451600 (= e!817279 (not e!817281))))

(declare-fun res!982817 () Bool)

(assert (=> b!1451600 (=> res!982817 e!817281)))

(assert (=> b!1451600 (= res!982817 (or (and (= (select (arr!47474 a!2862) index!646) (select (store (arr!47474 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47474 a!2862) index!646) (select (arr!47474 a!2862) j!93))) (= (select (arr!47474 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (bvslt mask!2687 #b00000000000000000000000000000000)))))

(assert (=> b!1451600 e!817285))

(declare-fun res!982806 () Bool)

(assert (=> b!1451600 (=> (not res!982806) (not e!817285))))

(assert (=> b!1451600 (= res!982806 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48948 0))(
  ( (Unit!48949) )
))
(declare-fun lt!636696 () Unit!48948)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98372 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48948)

(assert (=> b!1451600 (= lt!636696 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1451601 () Bool)

(declare-fun res!982814 () Bool)

(assert (=> b!1451601 (=> (not res!982814) (not e!817284))))

(declare-datatypes ((List!33975 0))(
  ( (Nil!33972) (Cons!33971 (h!35321 (_ BitVec 64)) (t!48669 List!33975)) )
))
(declare-fun arrayNoDuplicates!0 (array!98372 (_ BitVec 32) List!33975) Bool)

(assert (=> b!1451601 (= res!982814 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33972))))

(declare-fun b!1451602 () Bool)

(declare-fun res!982815 () Bool)

(assert (=> b!1451602 (=> (not res!982815) (not e!817279))))

(assert (=> b!1451602 (= res!982815 e!817283)))

(declare-fun c!133902 () Bool)

(assert (=> b!1451602 (= c!133902 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1451603 () Bool)

(declare-fun res!982810 () Bool)

(assert (=> b!1451603 (=> (not res!982810) (not e!817286))))

(assert (=> b!1451603 (= res!982810 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47474 a!2862) j!93) a!2862 mask!2687) lt!636698))))

(declare-fun b!1451604 () Bool)

(declare-fun res!982812 () Bool)

(assert (=> b!1451604 (=> (not res!982812) (not e!817284))))

(assert (=> b!1451604 (= res!982812 (validKeyInArray!0 (select (arr!47474 a!2862) i!1006)))))

(assert (= (and start!124924 res!982813) b!1451595))

(assert (= (and b!1451595 res!982816) b!1451604))

(assert (= (and b!1451604 res!982812) b!1451598))

(assert (= (and b!1451598 res!982809) b!1451599))

(assert (= (and b!1451599 res!982818) b!1451601))

(assert (= (and b!1451601 res!982814) b!1451592))

(assert (= (and b!1451592 res!982807) b!1451588))

(assert (= (and b!1451588 res!982804) b!1451593))

(assert (= (and b!1451593 res!982805) b!1451603))

(assert (= (and b!1451603 res!982810) b!1451589))

(assert (= (and b!1451589 res!982808) b!1451602))

(assert (= (and b!1451602 c!133902) b!1451594))

(assert (= (and b!1451602 (not c!133902)) b!1451597))

(assert (= (and b!1451602 res!982815) b!1451596))

(assert (= (and b!1451596 res!982819) b!1451600))

(assert (= (and b!1451600 res!982806) b!1451590))

(assert (= (and b!1451590 res!982811) b!1451591))

(assert (= (and b!1451600 (not res!982817)) b!1451587))

(declare-fun m!1340179 () Bool)

(assert (=> b!1451604 m!1340179))

(assert (=> b!1451604 m!1340179))

(declare-fun m!1340181 () Bool)

(assert (=> b!1451604 m!1340181))

(declare-fun m!1340183 () Bool)

(assert (=> b!1451589 m!1340183))

(assert (=> b!1451589 m!1340183))

(declare-fun m!1340185 () Bool)

(assert (=> b!1451589 m!1340185))

(declare-fun m!1340187 () Bool)

(assert (=> b!1451589 m!1340187))

(declare-fun m!1340189 () Bool)

(assert (=> b!1451589 m!1340189))

(declare-fun m!1340191 () Bool)

(assert (=> b!1451598 m!1340191))

(assert (=> b!1451598 m!1340191))

(declare-fun m!1340193 () Bool)

(assert (=> b!1451598 m!1340193))

(declare-fun m!1340195 () Bool)

(assert (=> start!124924 m!1340195))

(declare-fun m!1340197 () Bool)

(assert (=> start!124924 m!1340197))

(assert (=> b!1451591 m!1340187))

(declare-fun m!1340199 () Bool)

(assert (=> b!1451591 m!1340199))

(declare-fun m!1340201 () Bool)

(assert (=> b!1451591 m!1340201))

(declare-fun m!1340203 () Bool)

(assert (=> b!1451591 m!1340203))

(assert (=> b!1451591 m!1340191))

(declare-fun m!1340205 () Bool)

(assert (=> b!1451601 m!1340205))

(declare-fun m!1340207 () Bool)

(assert (=> b!1451594 m!1340207))

(declare-fun m!1340209 () Bool)

(assert (=> b!1451597 m!1340209))

(declare-fun m!1340211 () Bool)

(assert (=> b!1451597 m!1340211))

(assert (=> b!1451588 m!1340187))

(declare-fun m!1340213 () Bool)

(assert (=> b!1451588 m!1340213))

(assert (=> b!1451593 m!1340191))

(assert (=> b!1451593 m!1340191))

(declare-fun m!1340215 () Bool)

(assert (=> b!1451593 m!1340215))

(assert (=> b!1451593 m!1340215))

(assert (=> b!1451593 m!1340191))

(declare-fun m!1340217 () Bool)

(assert (=> b!1451593 m!1340217))

(assert (=> b!1451603 m!1340191))

(assert (=> b!1451603 m!1340191))

(declare-fun m!1340219 () Bool)

(assert (=> b!1451603 m!1340219))

(declare-fun m!1340221 () Bool)

(assert (=> b!1451587 m!1340221))

(declare-fun m!1340223 () Bool)

(assert (=> b!1451599 m!1340223))

(declare-fun m!1340225 () Bool)

(assert (=> b!1451600 m!1340225))

(assert (=> b!1451600 m!1340187))

(assert (=> b!1451600 m!1340201))

(assert (=> b!1451600 m!1340203))

(declare-fun m!1340227 () Bool)

(assert (=> b!1451600 m!1340227))

(assert (=> b!1451600 m!1340191))

(assert (=> b!1451590 m!1340191))

(assert (=> b!1451590 m!1340191))

(declare-fun m!1340229 () Bool)

(assert (=> b!1451590 m!1340229))

(push 1)

