; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125294 () Bool)

(assert start!125294)

(declare-fun b!1463175 () Bool)

(declare-fun res!992479 () Bool)

(declare-fun e!822409 () Bool)

(assert (=> b!1463175 (=> (not res!992479) (not e!822409))))

(declare-fun e!822403 () Bool)

(assert (=> b!1463175 (= res!992479 e!822403)))

(declare-fun c!134862 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1463175 (= c!134862 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1463176 () Bool)

(declare-fun e!822410 () Bool)

(declare-fun e!822401 () Bool)

(assert (=> b!1463176 (= e!822410 e!822401)))

(declare-fun res!992482 () Bool)

(assert (=> b!1463176 (=> (not res!992482) (not e!822401))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98742 0))(
  ( (array!98743 (arr!47659 (Array (_ BitVec 32) (_ BitVec 64))) (size!48209 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98742)

(assert (=> b!1463176 (= res!992482 (= (select (store (arr!47659 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!640687 () array!98742)

(assert (=> b!1463176 (= lt!640687 (array!98743 (store (arr!47659 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48209 a!2862)))))

(declare-fun b!1463177 () Bool)

(declare-fun res!992480 () Bool)

(assert (=> b!1463177 (=> (not res!992480) (not e!822410))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1463177 (= res!992480 (validKeyInArray!0 (select (arr!47659 a!2862) i!1006)))))

(declare-fun b!1463178 () Bool)

(declare-fun res!992483 () Bool)

(assert (=> b!1463178 (=> (not res!992483) (not e!822410))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98742 (_ BitVec 32)) Bool)

(assert (=> b!1463178 (= res!992483 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1463179 () Bool)

(declare-fun res!992487 () Bool)

(assert (=> b!1463179 (=> (not res!992487) (not e!822410))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1463179 (= res!992487 (and (= (size!48209 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48209 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48209 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1463180 () Bool)

(declare-fun res!992476 () Bool)

(assert (=> b!1463180 (=> (not res!992476) (not e!822409))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1463180 (= res!992476 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1463182 () Bool)

(declare-fun res!992486 () Bool)

(assert (=> b!1463182 (=> (not res!992486) (not e!822410))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1463182 (= res!992486 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48209 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48209 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48209 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1463183 () Bool)

(declare-fun e!822408 () Bool)

(declare-fun lt!640688 () (_ BitVec 32))

(declare-fun lt!640686 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11911 0))(
  ( (MissingZero!11911 (index!50036 (_ BitVec 32))) (Found!11911 (index!50037 (_ BitVec 32))) (Intermediate!11911 (undefined!12723 Bool) (index!50038 (_ BitVec 32)) (x!131624 (_ BitVec 32))) (Undefined!11911) (MissingVacant!11911 (index!50039 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98742 (_ BitVec 32)) SeekEntryResult!11911)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98742 (_ BitVec 32)) SeekEntryResult!11911)

(assert (=> b!1463183 (= e!822408 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640688 intermediateAfterIndex!19 lt!640686 lt!640687 mask!2687) (seekEntryOrOpen!0 lt!640686 lt!640687 mask!2687))))))

(declare-fun b!1463184 () Bool)

(declare-fun e!822407 () Bool)

(assert (=> b!1463184 (= e!822407 e!822409)))

(declare-fun res!992489 () Bool)

(assert (=> b!1463184 (=> (not res!992489) (not e!822409))))

(declare-fun lt!640689 () SeekEntryResult!11911)

(assert (=> b!1463184 (= res!992489 (= lt!640689 (Intermediate!11911 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98742 (_ BitVec 32)) SeekEntryResult!11911)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1463184 (= lt!640689 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!640686 mask!2687) lt!640686 lt!640687 mask!2687))))

(assert (=> b!1463184 (= lt!640686 (select (store (arr!47659 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1463185 () Bool)

(assert (=> b!1463185 (= e!822408 (not (= lt!640689 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640688 lt!640686 lt!640687 mask!2687))))))

(declare-fun b!1463186 () Bool)

(declare-fun e!822404 () Bool)

(assert (=> b!1463186 (= e!822404 true)))

(declare-fun lt!640684 () Bool)

(assert (=> b!1463186 (= lt!640684 e!822408)))

(declare-fun c!134861 () Bool)

(assert (=> b!1463186 (= c!134861 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1463187 () Bool)

(declare-fun res!992478 () Bool)

(assert (=> b!1463187 (=> res!992478 e!822404)))

(declare-fun lt!640683 () SeekEntryResult!11911)

(assert (=> b!1463187 (= res!992478 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640688 (select (arr!47659 a!2862) j!93) a!2862 mask!2687) lt!640683)))))

(declare-fun b!1463188 () Bool)

(assert (=> b!1463188 (= e!822403 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!640686 lt!640687 mask!2687) (seekEntryOrOpen!0 lt!640686 lt!640687 mask!2687)))))

(declare-fun b!1463189 () Bool)

(declare-fun e!822402 () Bool)

(assert (=> b!1463189 (= e!822402 e!822404)))

(declare-fun res!992491 () Bool)

(assert (=> b!1463189 (=> res!992491 e!822404)))

(assert (=> b!1463189 (= res!992491 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!640688 #b00000000000000000000000000000000) (bvsge lt!640688 (size!48209 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1463189 (= lt!640688 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1463190 () Bool)

(assert (=> b!1463190 (= e!822403 (= lt!640689 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!640686 lt!640687 mask!2687)))))

(declare-fun b!1463191 () Bool)

(declare-fun e!822405 () Bool)

(assert (=> b!1463191 (= e!822405 (or (= (select (arr!47659 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47659 a!2862) intermediateBeforeIndex!19) (select (arr!47659 a!2862) j!93))))))

(declare-fun b!1463192 () Bool)

(assert (=> b!1463192 (= e!822409 (not e!822402))))

(declare-fun res!992477 () Bool)

(assert (=> b!1463192 (=> res!992477 e!822402)))

(assert (=> b!1463192 (= res!992477 (or (and (= (select (arr!47659 a!2862) index!646) (select (store (arr!47659 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47659 a!2862) index!646) (select (arr!47659 a!2862) j!93))) (= (select (arr!47659 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1463192 e!822405))

(declare-fun res!992488 () Bool)

(assert (=> b!1463192 (=> (not res!992488) (not e!822405))))

(assert (=> b!1463192 (= res!992488 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49318 0))(
  ( (Unit!49319) )
))
(declare-fun lt!640685 () Unit!49318)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98742 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49318)

(assert (=> b!1463192 (= lt!640685 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1463193 () Bool)

(declare-fun res!992484 () Bool)

(assert (=> b!1463193 (=> (not res!992484) (not e!822410))))

(assert (=> b!1463193 (= res!992484 (validKeyInArray!0 (select (arr!47659 a!2862) j!93)))))

(declare-fun res!992474 () Bool)

(assert (=> start!125294 (=> (not res!992474) (not e!822410))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125294 (= res!992474 (validMask!0 mask!2687))))

(assert (=> start!125294 e!822410))

(assert (=> start!125294 true))

(declare-fun array_inv!36687 (array!98742) Bool)

(assert (=> start!125294 (array_inv!36687 a!2862)))

(declare-fun b!1463181 () Bool)

(declare-fun res!992485 () Bool)

(assert (=> b!1463181 (=> (not res!992485) (not e!822405))))

(assert (=> b!1463181 (= res!992485 (= (seekEntryOrOpen!0 (select (arr!47659 a!2862) j!93) a!2862 mask!2687) (Found!11911 j!93)))))

(declare-fun b!1463194 () Bool)

(declare-fun res!992481 () Bool)

(assert (=> b!1463194 (=> (not res!992481) (not e!822407))))

(assert (=> b!1463194 (= res!992481 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47659 a!2862) j!93) a!2862 mask!2687) lt!640683))))

(declare-fun b!1463195 () Bool)

(assert (=> b!1463195 (= e!822401 e!822407)))

(declare-fun res!992475 () Bool)

(assert (=> b!1463195 (=> (not res!992475) (not e!822407))))

(assert (=> b!1463195 (= res!992475 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47659 a!2862) j!93) mask!2687) (select (arr!47659 a!2862) j!93) a!2862 mask!2687) lt!640683))))

(assert (=> b!1463195 (= lt!640683 (Intermediate!11911 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1463196 () Bool)

(declare-fun res!992490 () Bool)

(assert (=> b!1463196 (=> (not res!992490) (not e!822410))))

(declare-datatypes ((List!34160 0))(
  ( (Nil!34157) (Cons!34156 (h!35506 (_ BitVec 64)) (t!48854 List!34160)) )
))
(declare-fun arrayNoDuplicates!0 (array!98742 (_ BitVec 32) List!34160) Bool)

(assert (=> b!1463196 (= res!992490 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34157))))

(assert (= (and start!125294 res!992474) b!1463179))

(assert (= (and b!1463179 res!992487) b!1463177))

(assert (= (and b!1463177 res!992480) b!1463193))

(assert (= (and b!1463193 res!992484) b!1463178))

(assert (= (and b!1463178 res!992483) b!1463196))

(assert (= (and b!1463196 res!992490) b!1463182))

(assert (= (and b!1463182 res!992486) b!1463176))

(assert (= (and b!1463176 res!992482) b!1463195))

(assert (= (and b!1463195 res!992475) b!1463194))

(assert (= (and b!1463194 res!992481) b!1463184))

(assert (= (and b!1463184 res!992489) b!1463175))

(assert (= (and b!1463175 c!134862) b!1463190))

(assert (= (and b!1463175 (not c!134862)) b!1463188))

(assert (= (and b!1463175 res!992479) b!1463180))

(assert (= (and b!1463180 res!992476) b!1463192))

(assert (= (and b!1463192 res!992488) b!1463181))

(assert (= (and b!1463181 res!992485) b!1463191))

(assert (= (and b!1463192 (not res!992477)) b!1463189))

(assert (= (and b!1463189 (not res!992491)) b!1463187))

(assert (= (and b!1463187 (not res!992478)) b!1463186))

(assert (= (and b!1463186 c!134861) b!1463185))

(assert (= (and b!1463186 (not c!134861)) b!1463183))

(declare-fun m!1350543 () Bool)

(assert (=> b!1463176 m!1350543))

(declare-fun m!1350545 () Bool)

(assert (=> b!1463176 m!1350545))

(declare-fun m!1350547 () Bool)

(assert (=> b!1463187 m!1350547))

(assert (=> b!1463187 m!1350547))

(declare-fun m!1350549 () Bool)

(assert (=> b!1463187 m!1350549))

(declare-fun m!1350551 () Bool)

(assert (=> b!1463189 m!1350551))

(assert (=> b!1463193 m!1350547))

(assert (=> b!1463193 m!1350547))

(declare-fun m!1350553 () Bool)

(assert (=> b!1463193 m!1350553))

(assert (=> b!1463181 m!1350547))

(assert (=> b!1463181 m!1350547))

(declare-fun m!1350555 () Bool)

(assert (=> b!1463181 m!1350555))

(declare-fun m!1350557 () Bool)

(assert (=> b!1463188 m!1350557))

(declare-fun m!1350559 () Bool)

(assert (=> b!1463188 m!1350559))

(assert (=> b!1463194 m!1350547))

(assert (=> b!1463194 m!1350547))

(declare-fun m!1350561 () Bool)

(assert (=> b!1463194 m!1350561))

(declare-fun m!1350563 () Bool)

(assert (=> b!1463177 m!1350563))

(assert (=> b!1463177 m!1350563))

(declare-fun m!1350565 () Bool)

(assert (=> b!1463177 m!1350565))

(declare-fun m!1350567 () Bool)

(assert (=> b!1463196 m!1350567))

(declare-fun m!1350569 () Bool)

(assert (=> b!1463191 m!1350569))

(assert (=> b!1463191 m!1350547))

(declare-fun m!1350571 () Bool)

(assert (=> b!1463178 m!1350571))

(declare-fun m!1350573 () Bool)

(assert (=> b!1463190 m!1350573))

(declare-fun m!1350575 () Bool)

(assert (=> b!1463183 m!1350575))

(assert (=> b!1463183 m!1350559))

(assert (=> b!1463195 m!1350547))

(assert (=> b!1463195 m!1350547))

(declare-fun m!1350577 () Bool)

(assert (=> b!1463195 m!1350577))

(assert (=> b!1463195 m!1350577))

(assert (=> b!1463195 m!1350547))

(declare-fun m!1350579 () Bool)

(assert (=> b!1463195 m!1350579))

(declare-fun m!1350581 () Bool)

(assert (=> b!1463192 m!1350581))

(assert (=> b!1463192 m!1350543))

(declare-fun m!1350583 () Bool)

(assert (=> b!1463192 m!1350583))

(declare-fun m!1350585 () Bool)

(assert (=> b!1463192 m!1350585))

(declare-fun m!1350587 () Bool)

(assert (=> b!1463192 m!1350587))

(assert (=> b!1463192 m!1350547))

(declare-fun m!1350589 () Bool)

(assert (=> start!125294 m!1350589))

(declare-fun m!1350591 () Bool)

(assert (=> start!125294 m!1350591))

(declare-fun m!1350593 () Bool)

(assert (=> b!1463185 m!1350593))

(declare-fun m!1350595 () Bool)

(assert (=> b!1463184 m!1350595))

(assert (=> b!1463184 m!1350595))

(declare-fun m!1350597 () Bool)

(assert (=> b!1463184 m!1350597))

(assert (=> b!1463184 m!1350543))

(declare-fun m!1350599 () Bool)

(assert (=> b!1463184 m!1350599))

(push 1)

