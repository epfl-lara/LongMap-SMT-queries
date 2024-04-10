; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124426 () Bool)

(assert start!124426)

(declare-fun b!1439545 () Bool)

(declare-fun res!971975 () Bool)

(declare-fun e!811906 () Bool)

(assert (=> b!1439545 (=> (not res!971975) (not e!811906))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!97874 0))(
  ( (array!97875 (arr!47225 (Array (_ BitVec 32) (_ BitVec 64))) (size!47775 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97874)

(assert (=> b!1439545 (= res!971975 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47775 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47775 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47775 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47225 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1439546 () Bool)

(declare-fun e!811907 () Bool)

(assert (=> b!1439546 (= e!811907 false)))

(declare-datatypes ((SeekEntryResult!11477 0))(
  ( (MissingZero!11477 (index!48300 (_ BitVec 32))) (Found!11477 (index!48301 (_ BitVec 32))) (Intermediate!11477 (undefined!12289 Bool) (index!48302 (_ BitVec 32)) (x!130038 (_ BitVec 32))) (Undefined!11477) (MissingVacant!11477 (index!48303 (_ BitVec 32))) )
))
(declare-fun lt!632829 () SeekEntryResult!11477)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97874 (_ BitVec 32)) SeekEntryResult!11477)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1439546 (= lt!632829 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47225 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47225 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97875 (store (arr!47225 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47775 a!2862)) mask!2687))))

(declare-fun b!1439547 () Bool)

(assert (=> b!1439547 (= e!811906 e!811907)))

(declare-fun res!971979 () Bool)

(assert (=> b!1439547 (=> (not res!971979) (not e!811907))))

(declare-fun lt!632828 () SeekEntryResult!11477)

(assert (=> b!1439547 (= res!971979 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47225 a!2862) j!93) mask!2687) (select (arr!47225 a!2862) j!93) a!2862 mask!2687) lt!632828))))

(assert (=> b!1439547 (= lt!632828 (Intermediate!11477 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1439549 () Bool)

(declare-fun res!971976 () Bool)

(assert (=> b!1439549 (=> (not res!971976) (not e!811906))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97874 (_ BitVec 32)) Bool)

(assert (=> b!1439549 (= res!971976 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1439550 () Bool)

(declare-fun res!971974 () Bool)

(assert (=> b!1439550 (=> (not res!971974) (not e!811906))))

(assert (=> b!1439550 (= res!971974 (and (= (size!47775 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47775 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47775 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1439551 () Bool)

(declare-fun res!971972 () Bool)

(assert (=> b!1439551 (=> (not res!971972) (not e!811906))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1439551 (= res!971972 (validKeyInArray!0 (select (arr!47225 a!2862) i!1006)))))

(declare-fun b!1439552 () Bool)

(declare-fun res!971978 () Bool)

(assert (=> b!1439552 (=> (not res!971978) (not e!811906))))

(assert (=> b!1439552 (= res!971978 (validKeyInArray!0 (select (arr!47225 a!2862) j!93)))))

(declare-fun b!1439553 () Bool)

(declare-fun res!971973 () Bool)

(assert (=> b!1439553 (=> (not res!971973) (not e!811907))))

(assert (=> b!1439553 (= res!971973 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47225 a!2862) j!93) a!2862 mask!2687) lt!632828))))

(declare-fun b!1439548 () Bool)

(declare-fun res!971980 () Bool)

(assert (=> b!1439548 (=> (not res!971980) (not e!811906))))

(declare-datatypes ((List!33726 0))(
  ( (Nil!33723) (Cons!33722 (h!35072 (_ BitVec 64)) (t!48420 List!33726)) )
))
(declare-fun arrayNoDuplicates!0 (array!97874 (_ BitVec 32) List!33726) Bool)

(assert (=> b!1439548 (= res!971980 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33723))))

(declare-fun res!971977 () Bool)

(assert (=> start!124426 (=> (not res!971977) (not e!811906))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124426 (= res!971977 (validMask!0 mask!2687))))

(assert (=> start!124426 e!811906))

(assert (=> start!124426 true))

(declare-fun array_inv!36253 (array!97874) Bool)

(assert (=> start!124426 (array_inv!36253 a!2862)))

(assert (= (and start!124426 res!971977) b!1439550))

(assert (= (and b!1439550 res!971974) b!1439551))

(assert (= (and b!1439551 res!971972) b!1439552))

(assert (= (and b!1439552 res!971978) b!1439549))

(assert (= (and b!1439549 res!971976) b!1439548))

(assert (= (and b!1439548 res!971980) b!1439545))

(assert (= (and b!1439545 res!971975) b!1439547))

(assert (= (and b!1439547 res!971979) b!1439553))

(assert (= (and b!1439553 res!971973) b!1439546))

(declare-fun m!1328629 () Bool)

(assert (=> b!1439552 m!1328629))

(assert (=> b!1439552 m!1328629))

(declare-fun m!1328631 () Bool)

(assert (=> b!1439552 m!1328631))

(assert (=> b!1439547 m!1328629))

(assert (=> b!1439547 m!1328629))

(declare-fun m!1328633 () Bool)

(assert (=> b!1439547 m!1328633))

(assert (=> b!1439547 m!1328633))

(assert (=> b!1439547 m!1328629))

(declare-fun m!1328635 () Bool)

(assert (=> b!1439547 m!1328635))

(assert (=> b!1439553 m!1328629))

(assert (=> b!1439553 m!1328629))

(declare-fun m!1328637 () Bool)

(assert (=> b!1439553 m!1328637))

(declare-fun m!1328639 () Bool)

(assert (=> b!1439551 m!1328639))

(assert (=> b!1439551 m!1328639))

(declare-fun m!1328641 () Bool)

(assert (=> b!1439551 m!1328641))

(declare-fun m!1328643 () Bool)

(assert (=> b!1439545 m!1328643))

(declare-fun m!1328645 () Bool)

(assert (=> b!1439545 m!1328645))

(declare-fun m!1328647 () Bool)

(assert (=> start!124426 m!1328647))

(declare-fun m!1328649 () Bool)

(assert (=> start!124426 m!1328649))

(declare-fun m!1328651 () Bool)

(assert (=> b!1439548 m!1328651))

(assert (=> b!1439546 m!1328643))

(declare-fun m!1328653 () Bool)

(assert (=> b!1439546 m!1328653))

(assert (=> b!1439546 m!1328653))

(declare-fun m!1328655 () Bool)

(assert (=> b!1439546 m!1328655))

(assert (=> b!1439546 m!1328655))

(assert (=> b!1439546 m!1328653))

(declare-fun m!1328657 () Bool)

(assert (=> b!1439546 m!1328657))

(declare-fun m!1328659 () Bool)

(assert (=> b!1439549 m!1328659))

(push 1)

