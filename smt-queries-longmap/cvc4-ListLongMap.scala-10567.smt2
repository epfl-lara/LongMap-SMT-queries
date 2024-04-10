; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124544 () Bool)

(assert start!124544)

(declare-fun b!1441377 () Bool)

(declare-fun res!973742 () Bool)

(declare-fun e!812546 () Bool)

(assert (=> b!1441377 (=> (not res!973742) (not e!812546))))

(declare-datatypes ((array!97992 0))(
  ( (array!97993 (arr!47284 (Array (_ BitVec 32) (_ BitVec 64))) (size!47834 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97992)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1441377 (= res!973742 (validKeyInArray!0 (select (arr!47284 a!2862) j!93)))))

(declare-fun b!1441378 () Bool)

(declare-fun e!812545 () Bool)

(assert (=> b!1441378 (= e!812545 false)))

(declare-fun lt!633217 () Bool)

(declare-fun e!812542 () Bool)

(assert (=> b!1441378 (= lt!633217 e!812542)))

(declare-fun c!133332 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1441378 (= c!133332 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!973734 () Bool)

(assert (=> start!124544 (=> (not res!973734) (not e!812546))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124544 (= res!973734 (validMask!0 mask!2687))))

(assert (=> start!124544 e!812546))

(assert (=> start!124544 true))

(declare-fun array_inv!36312 (array!97992) Bool)

(assert (=> start!124544 (array_inv!36312 a!2862)))

(declare-fun b!1441379 () Bool)

(declare-fun res!973741 () Bool)

(assert (=> b!1441379 (=> (not res!973741) (not e!812546))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97992 (_ BitVec 32)) Bool)

(assert (=> b!1441379 (= res!973741 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1441380 () Bool)

(declare-fun res!973738 () Bool)

(assert (=> b!1441380 (=> (not res!973738) (not e!812546))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1441380 (= res!973738 (validKeyInArray!0 (select (arr!47284 a!2862) i!1006)))))

(declare-fun b!1441381 () Bool)

(declare-fun lt!633216 () (_ BitVec 64))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun lt!633215 () array!97992)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11536 0))(
  ( (MissingZero!11536 (index!48536 (_ BitVec 32))) (Found!11536 (index!48537 (_ BitVec 32))) (Intermediate!11536 (undefined!12348 Bool) (index!48538 (_ BitVec 32)) (x!130249 (_ BitVec 32))) (Undefined!11536) (MissingVacant!11536 (index!48539 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97992 (_ BitVec 32)) SeekEntryResult!11536)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97992 (_ BitVec 32)) SeekEntryResult!11536)

(assert (=> b!1441381 (= e!812542 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633216 lt!633215 mask!2687) (seekEntryOrOpen!0 lt!633216 lt!633215 mask!2687))))))

(declare-fun b!1441382 () Bool)

(declare-fun e!812543 () Bool)

(declare-fun e!812541 () Bool)

(assert (=> b!1441382 (= e!812543 e!812541)))

(declare-fun res!973739 () Bool)

(assert (=> b!1441382 (=> (not res!973739) (not e!812541))))

(declare-fun lt!633219 () SeekEntryResult!11536)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97992 (_ BitVec 32)) SeekEntryResult!11536)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1441382 (= res!973739 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47284 a!2862) j!93) mask!2687) (select (arr!47284 a!2862) j!93) a!2862 mask!2687) lt!633219))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1441382 (= lt!633219 (Intermediate!11536 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1441383 () Bool)

(declare-fun res!973735 () Bool)

(assert (=> b!1441383 (=> (not res!973735) (not e!812541))))

(assert (=> b!1441383 (= res!973735 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47284 a!2862) j!93) a!2862 mask!2687) lt!633219))))

(declare-fun b!1441384 () Bool)

(assert (=> b!1441384 (= e!812546 e!812543)))

(declare-fun res!973740 () Bool)

(assert (=> b!1441384 (=> (not res!973740) (not e!812543))))

(assert (=> b!1441384 (= res!973740 (= (select (store (arr!47284 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1441384 (= lt!633215 (array!97993 (store (arr!47284 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47834 a!2862)))))

(declare-fun b!1441385 () Bool)

(declare-fun res!973736 () Bool)

(assert (=> b!1441385 (=> (not res!973736) (not e!812546))))

(assert (=> b!1441385 (= res!973736 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47834 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47834 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47834 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1441386 () Bool)

(declare-fun res!973743 () Bool)

(assert (=> b!1441386 (=> (not res!973743) (not e!812546))))

(assert (=> b!1441386 (= res!973743 (and (= (size!47834 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47834 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47834 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1441387 () Bool)

(declare-fun res!973737 () Bool)

(assert (=> b!1441387 (=> (not res!973737) (not e!812546))))

(declare-datatypes ((List!33785 0))(
  ( (Nil!33782) (Cons!33781 (h!35131 (_ BitVec 64)) (t!48479 List!33785)) )
))
(declare-fun arrayNoDuplicates!0 (array!97992 (_ BitVec 32) List!33785) Bool)

(assert (=> b!1441387 (= res!973737 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33782))))

(declare-fun b!1441388 () Bool)

(declare-fun lt!633218 () SeekEntryResult!11536)

(assert (=> b!1441388 (= e!812542 (not (= lt!633218 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633216 lt!633215 mask!2687))))))

(declare-fun b!1441389 () Bool)

(assert (=> b!1441389 (= e!812541 e!812545)))

(declare-fun res!973744 () Bool)

(assert (=> b!1441389 (=> (not res!973744) (not e!812545))))

(assert (=> b!1441389 (= res!973744 (= lt!633218 (Intermediate!11536 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1441389 (= lt!633218 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633216 mask!2687) lt!633216 lt!633215 mask!2687))))

(assert (=> b!1441389 (= lt!633216 (select (store (arr!47284 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(assert (= (and start!124544 res!973734) b!1441386))

(assert (= (and b!1441386 res!973743) b!1441380))

(assert (= (and b!1441380 res!973738) b!1441377))

(assert (= (and b!1441377 res!973742) b!1441379))

(assert (= (and b!1441379 res!973741) b!1441387))

(assert (= (and b!1441387 res!973737) b!1441385))

(assert (= (and b!1441385 res!973736) b!1441384))

(assert (= (and b!1441384 res!973740) b!1441382))

(assert (= (and b!1441382 res!973739) b!1441383))

(assert (= (and b!1441383 res!973735) b!1441389))

(assert (= (and b!1441389 res!973744) b!1441378))

(assert (= (and b!1441378 c!133332) b!1441388))

(assert (= (and b!1441378 (not c!133332)) b!1441381))

(declare-fun m!1330601 () Bool)

(assert (=> b!1441380 m!1330601))

(assert (=> b!1441380 m!1330601))

(declare-fun m!1330603 () Bool)

(assert (=> b!1441380 m!1330603))

(declare-fun m!1330605 () Bool)

(assert (=> start!124544 m!1330605))

(declare-fun m!1330607 () Bool)

(assert (=> start!124544 m!1330607))

(declare-fun m!1330609 () Bool)

(assert (=> b!1441388 m!1330609))

(declare-fun m!1330611 () Bool)

(assert (=> b!1441387 m!1330611))

(declare-fun m!1330613 () Bool)

(assert (=> b!1441389 m!1330613))

(assert (=> b!1441389 m!1330613))

(declare-fun m!1330615 () Bool)

(assert (=> b!1441389 m!1330615))

(declare-fun m!1330617 () Bool)

(assert (=> b!1441389 m!1330617))

(declare-fun m!1330619 () Bool)

(assert (=> b!1441389 m!1330619))

(declare-fun m!1330621 () Bool)

(assert (=> b!1441377 m!1330621))

(assert (=> b!1441377 m!1330621))

(declare-fun m!1330623 () Bool)

(assert (=> b!1441377 m!1330623))

(assert (=> b!1441383 m!1330621))

(assert (=> b!1441383 m!1330621))

(declare-fun m!1330625 () Bool)

(assert (=> b!1441383 m!1330625))

(declare-fun m!1330627 () Bool)

(assert (=> b!1441379 m!1330627))

(assert (=> b!1441384 m!1330617))

(declare-fun m!1330629 () Bool)

(assert (=> b!1441384 m!1330629))

(assert (=> b!1441382 m!1330621))

(assert (=> b!1441382 m!1330621))

(declare-fun m!1330631 () Bool)

(assert (=> b!1441382 m!1330631))

(assert (=> b!1441382 m!1330631))

(assert (=> b!1441382 m!1330621))

(declare-fun m!1330633 () Bool)

(assert (=> b!1441382 m!1330633))

(declare-fun m!1330635 () Bool)

(assert (=> b!1441381 m!1330635))

(declare-fun m!1330637 () Bool)

(assert (=> b!1441381 m!1330637))

(push 1)

(assert (not b!1441379))

(assert (not b!1441381))

(assert (not b!1441388))

(assert (not b!1441380))

