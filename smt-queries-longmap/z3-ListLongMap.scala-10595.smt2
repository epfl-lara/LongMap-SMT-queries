; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124710 () Bool)

(assert start!124710)

(declare-fun b!1445561 () Bool)

(declare-fun res!977424 () Bool)

(declare-fun e!814297 () Bool)

(assert (=> b!1445561 (=> (not res!977424) (not e!814297))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11619 0))(
  ( (MissingZero!11619 (index!48868 (_ BitVec 32))) (Found!11619 (index!48869 (_ BitVec 32))) (Intermediate!11619 (undefined!12431 Bool) (index!48870 (_ BitVec 32)) (x!130556 (_ BitVec 32))) (Undefined!11619) (MissingVacant!11619 (index!48871 (_ BitVec 32))) )
))
(declare-fun lt!634535 () SeekEntryResult!11619)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98158 0))(
  ( (array!98159 (arr!47367 (Array (_ BitVec 32) (_ BitVec 64))) (size!47917 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98158)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98158 (_ BitVec 32)) SeekEntryResult!11619)

(assert (=> b!1445561 (= res!977424 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47367 a!2862) j!93) a!2862 mask!2687) lt!634535))))

(declare-fun b!1445562 () Bool)

(declare-fun res!977428 () Bool)

(declare-fun e!814292 () Bool)

(assert (=> b!1445562 (=> (not res!977428) (not e!814292))))

(declare-datatypes ((List!33868 0))(
  ( (Nil!33865) (Cons!33864 (h!35214 (_ BitVec 64)) (t!48562 List!33868)) )
))
(declare-fun arrayNoDuplicates!0 (array!98158 (_ BitVec 32) List!33868) Bool)

(assert (=> b!1445562 (= res!977428 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33865))))

(declare-fun b!1445563 () Bool)

(declare-fun res!977429 () Bool)

(declare-fun e!814293 () Bool)

(assert (=> b!1445563 (=> (not res!977429) (not e!814293))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98158 (_ BitVec 32)) SeekEntryResult!11619)

(assert (=> b!1445563 (= res!977429 (= (seekEntryOrOpen!0 (select (arr!47367 a!2862) j!93) a!2862 mask!2687) (Found!11619 j!93)))))

(declare-fun lt!634533 () (_ BitVec 64))

(declare-fun e!814298 () Bool)

(declare-fun b!1445564 () Bool)

(declare-fun lt!634532 () SeekEntryResult!11619)

(declare-fun lt!634536 () array!98158)

(assert (=> b!1445564 (= e!814298 (= lt!634532 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634533 lt!634536 mask!2687)))))

(declare-fun res!977425 () Bool)

(assert (=> start!124710 (=> (not res!977425) (not e!814292))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124710 (= res!977425 (validMask!0 mask!2687))))

(assert (=> start!124710 e!814292))

(assert (=> start!124710 true))

(declare-fun array_inv!36395 (array!98158) Bool)

(assert (=> start!124710 (array_inv!36395 a!2862)))

(declare-fun b!1445565 () Bool)

(declare-fun res!977433 () Bool)

(assert (=> b!1445565 (=> (not res!977433) (not e!814292))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1445565 (= res!977433 (validKeyInArray!0 (select (arr!47367 a!2862) j!93)))))

(declare-fun b!1445566 () Bool)

(declare-fun res!977421 () Bool)

(assert (=> b!1445566 (=> (not res!977421) (not e!814292))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1445566 (= res!977421 (validKeyInArray!0 (select (arr!47367 a!2862) i!1006)))))

(declare-fun b!1445567 () Bool)

(declare-fun e!814294 () Bool)

(assert (=> b!1445567 (= e!814294 (not true))))

(assert (=> b!1445567 e!814293))

(declare-fun res!977422 () Bool)

(assert (=> b!1445567 (=> (not res!977422) (not e!814293))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98158 (_ BitVec 32)) Bool)

(assert (=> b!1445567 (= res!977422 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48734 0))(
  ( (Unit!48735) )
))
(declare-fun lt!634534 () Unit!48734)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98158 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48734)

(assert (=> b!1445567 (= lt!634534 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1445568 () Bool)

(declare-fun e!814295 () Bool)

(assert (=> b!1445568 (= e!814292 e!814295)))

(declare-fun res!977434 () Bool)

(assert (=> b!1445568 (=> (not res!977434) (not e!814295))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1445568 (= res!977434 (= (select (store (arr!47367 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1445568 (= lt!634536 (array!98159 (store (arr!47367 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47917 a!2862)))))

(declare-fun b!1445569 () Bool)

(declare-fun res!977420 () Bool)

(assert (=> b!1445569 (=> (not res!977420) (not e!814292))))

(assert (=> b!1445569 (= res!977420 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1445570 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98158 (_ BitVec 32)) SeekEntryResult!11619)

(assert (=> b!1445570 (= e!814298 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634533 lt!634536 mask!2687) (seekEntryOrOpen!0 lt!634533 lt!634536 mask!2687)))))

(declare-fun b!1445571 () Bool)

(assert (=> b!1445571 (= e!814295 e!814297)))

(declare-fun res!977431 () Bool)

(assert (=> b!1445571 (=> (not res!977431) (not e!814297))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1445571 (= res!977431 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47367 a!2862) j!93) mask!2687) (select (arr!47367 a!2862) j!93) a!2862 mask!2687) lt!634535))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1445571 (= lt!634535 (Intermediate!11619 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1445572 () Bool)

(declare-fun res!977427 () Bool)

(assert (=> b!1445572 (=> (not res!977427) (not e!814294))))

(assert (=> b!1445572 (= res!977427 e!814298)))

(declare-fun c!133581 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1445572 (= c!133581 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1445573 () Bool)

(assert (=> b!1445573 (= e!814293 (or (= (select (arr!47367 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47367 a!2862) intermediateBeforeIndex!19) (select (arr!47367 a!2862) j!93))))))

(declare-fun b!1445574 () Bool)

(assert (=> b!1445574 (= e!814297 e!814294)))

(declare-fun res!977426 () Bool)

(assert (=> b!1445574 (=> (not res!977426) (not e!814294))))

(assert (=> b!1445574 (= res!977426 (= lt!634532 (Intermediate!11619 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1445574 (= lt!634532 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634533 mask!2687) lt!634533 lt!634536 mask!2687))))

(assert (=> b!1445574 (= lt!634533 (select (store (arr!47367 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1445575 () Bool)

(declare-fun res!977430 () Bool)

(assert (=> b!1445575 (=> (not res!977430) (not e!814292))))

(assert (=> b!1445575 (= res!977430 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47917 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47917 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47917 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1445576 () Bool)

(declare-fun res!977432 () Bool)

(assert (=> b!1445576 (=> (not res!977432) (not e!814292))))

(assert (=> b!1445576 (= res!977432 (and (= (size!47917 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47917 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47917 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1445577 () Bool)

(declare-fun res!977423 () Bool)

(assert (=> b!1445577 (=> (not res!977423) (not e!814294))))

(assert (=> b!1445577 (= res!977423 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(assert (= (and start!124710 res!977425) b!1445576))

(assert (= (and b!1445576 res!977432) b!1445566))

(assert (= (and b!1445566 res!977421) b!1445565))

(assert (= (and b!1445565 res!977433) b!1445569))

(assert (= (and b!1445569 res!977420) b!1445562))

(assert (= (and b!1445562 res!977428) b!1445575))

(assert (= (and b!1445575 res!977430) b!1445568))

(assert (= (and b!1445568 res!977434) b!1445571))

(assert (= (and b!1445571 res!977431) b!1445561))

(assert (= (and b!1445561 res!977424) b!1445574))

(assert (= (and b!1445574 res!977426) b!1445572))

(assert (= (and b!1445572 c!133581) b!1445564))

(assert (= (and b!1445572 (not c!133581)) b!1445570))

(assert (= (and b!1445572 res!977427) b!1445577))

(assert (= (and b!1445577 res!977423) b!1445567))

(assert (= (and b!1445567 res!977422) b!1445563))

(assert (= (and b!1445563 res!977429) b!1445573))

(declare-fun m!1334507 () Bool)

(assert (=> b!1445569 m!1334507))

(declare-fun m!1334509 () Bool)

(assert (=> b!1445561 m!1334509))

(assert (=> b!1445561 m!1334509))

(declare-fun m!1334511 () Bool)

(assert (=> b!1445561 m!1334511))

(declare-fun m!1334513 () Bool)

(assert (=> start!124710 m!1334513))

(declare-fun m!1334515 () Bool)

(assert (=> start!124710 m!1334515))

(declare-fun m!1334517 () Bool)

(assert (=> b!1445568 m!1334517))

(declare-fun m!1334519 () Bool)

(assert (=> b!1445568 m!1334519))

(declare-fun m!1334521 () Bool)

(assert (=> b!1445564 m!1334521))

(declare-fun m!1334523 () Bool)

(assert (=> b!1445570 m!1334523))

(declare-fun m!1334525 () Bool)

(assert (=> b!1445570 m!1334525))

(assert (=> b!1445563 m!1334509))

(assert (=> b!1445563 m!1334509))

(declare-fun m!1334527 () Bool)

(assert (=> b!1445563 m!1334527))

(declare-fun m!1334529 () Bool)

(assert (=> b!1445566 m!1334529))

(assert (=> b!1445566 m!1334529))

(declare-fun m!1334531 () Bool)

(assert (=> b!1445566 m!1334531))

(declare-fun m!1334533 () Bool)

(assert (=> b!1445567 m!1334533))

(declare-fun m!1334535 () Bool)

(assert (=> b!1445567 m!1334535))

(declare-fun m!1334537 () Bool)

(assert (=> b!1445573 m!1334537))

(assert (=> b!1445573 m!1334509))

(declare-fun m!1334539 () Bool)

(assert (=> b!1445562 m!1334539))

(declare-fun m!1334541 () Bool)

(assert (=> b!1445574 m!1334541))

(assert (=> b!1445574 m!1334541))

(declare-fun m!1334543 () Bool)

(assert (=> b!1445574 m!1334543))

(assert (=> b!1445574 m!1334517))

(declare-fun m!1334545 () Bool)

(assert (=> b!1445574 m!1334545))

(assert (=> b!1445565 m!1334509))

(assert (=> b!1445565 m!1334509))

(declare-fun m!1334547 () Bool)

(assert (=> b!1445565 m!1334547))

(assert (=> b!1445571 m!1334509))

(assert (=> b!1445571 m!1334509))

(declare-fun m!1334549 () Bool)

(assert (=> b!1445571 m!1334549))

(assert (=> b!1445571 m!1334549))

(assert (=> b!1445571 m!1334509))

(declare-fun m!1334551 () Bool)

(assert (=> b!1445571 m!1334551))

(check-sat (not b!1445565) (not start!124710) (not b!1445574) (not b!1445561) (not b!1445562) (not b!1445566) (not b!1445571) (not b!1445567) (not b!1445569) (not b!1445570) (not b!1445564) (not b!1445563))
(check-sat)
