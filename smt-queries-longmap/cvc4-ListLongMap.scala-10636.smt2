; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124958 () Bool)

(assert start!124958)

(declare-fun b!1452461 () Bool)

(declare-fun res!983586 () Bool)

(declare-fun e!817648 () Bool)

(assert (=> b!1452461 (=> (not res!983586) (not e!817648))))

(declare-datatypes ((array!98406 0))(
  ( (array!98407 (arr!47491 (Array (_ BitVec 32) (_ BitVec 64))) (size!48041 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98406)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98406 (_ BitVec 32)) Bool)

(assert (=> b!1452461 (= res!983586 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1452462 () Bool)

(declare-fun res!983588 () Bool)

(declare-fun e!817643 () Bool)

(assert (=> b!1452462 (=> (not res!983588) (not e!817643))))

(declare-fun e!817646 () Bool)

(assert (=> b!1452462 (= res!983588 e!817646)))

(declare-fun c!133953 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1452462 (= c!133953 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!983584 () Bool)

(assert (=> start!124958 (=> (not res!983584) (not e!817648))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124958 (= res!983584 (validMask!0 mask!2687))))

(assert (=> start!124958 e!817648))

(assert (=> start!124958 true))

(declare-fun array_inv!36519 (array!98406) Bool)

(assert (=> start!124958 (array_inv!36519 a!2862)))

(declare-fun b!1452463 () Bool)

(declare-fun res!983587 () Bool)

(assert (=> b!1452463 (=> (not res!983587) (not e!817648))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1452463 (= res!983587 (validKeyInArray!0 (select (arr!47491 a!2862) j!93)))))

(declare-fun b!1452464 () Bool)

(declare-fun e!817645 () Bool)

(assert (=> b!1452464 (= e!817645 e!817643)))

(declare-fun res!983590 () Bool)

(assert (=> b!1452464 (=> (not res!983590) (not e!817643))))

(declare-datatypes ((SeekEntryResult!11743 0))(
  ( (MissingZero!11743 (index!49364 (_ BitVec 32))) (Found!11743 (index!49365 (_ BitVec 32))) (Intermediate!11743 (undefined!12555 Bool) (index!49366 (_ BitVec 32)) (x!131008 (_ BitVec 32))) (Undefined!11743) (MissingVacant!11743 (index!49367 (_ BitVec 32))) )
))
(declare-fun lt!636951 () SeekEntryResult!11743)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1452464 (= res!983590 (= lt!636951 (Intermediate!11743 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!636952 () (_ BitVec 64))

(declare-fun lt!636953 () array!98406)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98406 (_ BitVec 32)) SeekEntryResult!11743)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1452464 (= lt!636951 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636952 mask!2687) lt!636952 lt!636953 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1452464 (= lt!636952 (select (store (arr!47491 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1452465 () Bool)

(declare-fun e!817649 () Bool)

(assert (=> b!1452465 (= e!817648 e!817649)))

(declare-fun res!983589 () Bool)

(assert (=> b!1452465 (=> (not res!983589) (not e!817649))))

(assert (=> b!1452465 (= res!983589 (= (select (store (arr!47491 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1452465 (= lt!636953 (array!98407 (store (arr!47491 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48041 a!2862)))))

(declare-fun b!1452466 () Bool)

(declare-fun res!983583 () Bool)

(assert (=> b!1452466 (=> (not res!983583) (not e!817648))))

(assert (=> b!1452466 (= res!983583 (validKeyInArray!0 (select (arr!47491 a!2862) i!1006)))))

(declare-fun b!1452467 () Bool)

(assert (=> b!1452467 (= e!817649 e!817645)))

(declare-fun res!983576 () Bool)

(assert (=> b!1452467 (=> (not res!983576) (not e!817645))))

(declare-fun lt!636954 () SeekEntryResult!11743)

(assert (=> b!1452467 (= res!983576 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47491 a!2862) j!93) mask!2687) (select (arr!47491 a!2862) j!93) a!2862 mask!2687) lt!636954))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1452467 (= lt!636954 (Intermediate!11743 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1452468 () Bool)

(declare-fun res!983580 () Bool)

(assert (=> b!1452468 (=> (not res!983580) (not e!817648))))

(assert (=> b!1452468 (= res!983580 (and (= (size!48041 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48041 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48041 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1452469 () Bool)

(declare-fun res!983577 () Bool)

(declare-fun e!817644 () Bool)

(assert (=> b!1452469 (=> (not res!983577) (not e!817644))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98406 (_ BitVec 32)) SeekEntryResult!11743)

(assert (=> b!1452469 (= res!983577 (= (seekEntryOrOpen!0 (select (arr!47491 a!2862) j!93) a!2862 mask!2687) (Found!11743 j!93)))))

(declare-fun b!1452470 () Bool)

(assert (=> b!1452470 (= e!817643 (not true))))

(assert (=> b!1452470 e!817644))

(declare-fun res!983585 () Bool)

(assert (=> b!1452470 (=> (not res!983585) (not e!817644))))

(assert (=> b!1452470 (= res!983585 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48982 0))(
  ( (Unit!48983) )
))
(declare-fun lt!636950 () Unit!48982)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98406 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48982)

(assert (=> b!1452470 (= lt!636950 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1452471 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1452471 (= e!817646 (= lt!636951 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636952 lt!636953 mask!2687)))))

(declare-fun b!1452472 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98406 (_ BitVec 32)) SeekEntryResult!11743)

(assert (=> b!1452472 (= e!817646 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636952 lt!636953 mask!2687) (seekEntryOrOpen!0 lt!636952 lt!636953 mask!2687)))))

(declare-fun b!1452473 () Bool)

(declare-fun res!983578 () Bool)

(assert (=> b!1452473 (=> (not res!983578) (not e!817643))))

(assert (=> b!1452473 (= res!983578 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1452474 () Bool)

(declare-fun res!983579 () Bool)

(assert (=> b!1452474 (=> (not res!983579) (not e!817645))))

(assert (=> b!1452474 (= res!983579 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47491 a!2862) j!93) a!2862 mask!2687) lt!636954))))

(declare-fun b!1452475 () Bool)

(declare-fun res!983581 () Bool)

(assert (=> b!1452475 (=> (not res!983581) (not e!817648))))

(assert (=> b!1452475 (= res!983581 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48041 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48041 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48041 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1452476 () Bool)

(assert (=> b!1452476 (= e!817644 (and (or (= (select (arr!47491 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47491 a!2862) intermediateBeforeIndex!19) (select (arr!47491 a!2862) j!93))) (or (and (= (select (arr!47491 a!2862) index!646) (select (store (arr!47491 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47491 a!2862) index!646) (select (arr!47491 a!2862) j!93))) (= (select (arr!47491 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47491 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1452477 () Bool)

(declare-fun res!983582 () Bool)

(assert (=> b!1452477 (=> (not res!983582) (not e!817648))))

(declare-datatypes ((List!33992 0))(
  ( (Nil!33989) (Cons!33988 (h!35338 (_ BitVec 64)) (t!48686 List!33992)) )
))
(declare-fun arrayNoDuplicates!0 (array!98406 (_ BitVec 32) List!33992) Bool)

(assert (=> b!1452477 (= res!983582 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33989))))

(assert (= (and start!124958 res!983584) b!1452468))

(assert (= (and b!1452468 res!983580) b!1452466))

(assert (= (and b!1452466 res!983583) b!1452463))

(assert (= (and b!1452463 res!983587) b!1452461))

(assert (= (and b!1452461 res!983586) b!1452477))

(assert (= (and b!1452477 res!983582) b!1452475))

(assert (= (and b!1452475 res!983581) b!1452465))

(assert (= (and b!1452465 res!983589) b!1452467))

(assert (= (and b!1452467 res!983576) b!1452474))

(assert (= (and b!1452474 res!983579) b!1452464))

(assert (= (and b!1452464 res!983590) b!1452462))

(assert (= (and b!1452462 c!133953) b!1452471))

(assert (= (and b!1452462 (not c!133953)) b!1452472))

(assert (= (and b!1452462 res!983588) b!1452473))

(assert (= (and b!1452473 res!983578) b!1452470))

(assert (= (and b!1452470 res!983585) b!1452469))

(assert (= (and b!1452469 res!983577) b!1452476))

(declare-fun m!1341035 () Bool)

(assert (=> b!1452476 m!1341035))

(declare-fun m!1341037 () Bool)

(assert (=> b!1452476 m!1341037))

(declare-fun m!1341039 () Bool)

(assert (=> b!1452476 m!1341039))

(declare-fun m!1341041 () Bool)

(assert (=> b!1452476 m!1341041))

(declare-fun m!1341043 () Bool)

(assert (=> b!1452476 m!1341043))

(declare-fun m!1341045 () Bool)

(assert (=> b!1452461 m!1341045))

(assert (=> b!1452474 m!1341043))

(assert (=> b!1452474 m!1341043))

(declare-fun m!1341047 () Bool)

(assert (=> b!1452474 m!1341047))

(assert (=> b!1452463 m!1341043))

(assert (=> b!1452463 m!1341043))

(declare-fun m!1341049 () Bool)

(assert (=> b!1452463 m!1341049))

(declare-fun m!1341051 () Bool)

(assert (=> b!1452472 m!1341051))

(declare-fun m!1341053 () Bool)

(assert (=> b!1452472 m!1341053))

(declare-fun m!1341055 () Bool)

(assert (=> start!124958 m!1341055))

(declare-fun m!1341057 () Bool)

(assert (=> start!124958 m!1341057))

(declare-fun m!1341059 () Bool)

(assert (=> b!1452471 m!1341059))

(declare-fun m!1341061 () Bool)

(assert (=> b!1452464 m!1341061))

(assert (=> b!1452464 m!1341061))

(declare-fun m!1341063 () Bool)

(assert (=> b!1452464 m!1341063))

(assert (=> b!1452464 m!1341035))

(declare-fun m!1341065 () Bool)

(assert (=> b!1452464 m!1341065))

(assert (=> b!1452467 m!1341043))

(assert (=> b!1452467 m!1341043))

(declare-fun m!1341067 () Bool)

(assert (=> b!1452467 m!1341067))

(assert (=> b!1452467 m!1341067))

(assert (=> b!1452467 m!1341043))

(declare-fun m!1341069 () Bool)

(assert (=> b!1452467 m!1341069))

(declare-fun m!1341071 () Bool)

(assert (=> b!1452470 m!1341071))

(declare-fun m!1341073 () Bool)

(assert (=> b!1452470 m!1341073))

(declare-fun m!1341075 () Bool)

(assert (=> b!1452477 m!1341075))

(assert (=> b!1452465 m!1341035))

(declare-fun m!1341077 () Bool)

(assert (=> b!1452465 m!1341077))

(assert (=> b!1452469 m!1341043))

(assert (=> b!1452469 m!1341043))

(declare-fun m!1341079 () Bool)

(assert (=> b!1452469 m!1341079))

(declare-fun m!1341081 () Bool)

(assert (=> b!1452466 m!1341081))

(assert (=> b!1452466 m!1341081))

(declare-fun m!1341083 () Bool)

(assert (=> b!1452466 m!1341083))

(push 1)

