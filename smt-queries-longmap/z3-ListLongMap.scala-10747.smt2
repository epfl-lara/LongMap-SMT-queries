; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125958 () Bool)

(assert start!125958)

(declare-fun b!1472392 () Bool)

(declare-fun e!826616 () Bool)

(declare-fun e!826613 () Bool)

(assert (=> b!1472392 (= e!826616 e!826613)))

(declare-fun res!999398 () Bool)

(assert (=> b!1472392 (=> (not res!999398) (not e!826613))))

(declare-datatypes ((SeekEntryResult!12012 0))(
  ( (MissingZero!12012 (index!50440 (_ BitVec 32))) (Found!12012 (index!50441 (_ BitVec 32))) (Intermediate!12012 (undefined!12824 Bool) (index!50442 (_ BitVec 32)) (x!132207 (_ BitVec 32))) (Undefined!12012) (MissingVacant!12012 (index!50443 (_ BitVec 32))) )
))
(declare-fun lt!643642 () SeekEntryResult!12012)

(declare-datatypes ((array!99187 0))(
  ( (array!99188 (arr!47875 (Array (_ BitVec 32) (_ BitVec 64))) (size!48426 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99187)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99187 (_ BitVec 32)) SeekEntryResult!12012)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1472392 (= res!999398 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47875 a!2862) j!93) mask!2687) (select (arr!47875 a!2862) j!93) a!2862 mask!2687) lt!643642))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1472392 (= lt!643642 (Intermediate!12012 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1472393 () Bool)

(declare-fun res!999405 () Bool)

(assert (=> b!1472393 (=> (not res!999405) (not e!826613))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1472393 (= res!999405 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47875 a!2862) j!93) a!2862 mask!2687) lt!643642))))

(declare-fun lt!643640 () array!99187)

(declare-fun e!826614 () Bool)

(declare-fun lt!643639 () SeekEntryResult!12012)

(declare-fun lt!643638 () (_ BitVec 64))

(declare-fun b!1472394 () Bool)

(assert (=> b!1472394 (= e!826614 (= lt!643639 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!643638 lt!643640 mask!2687)))))

(declare-fun b!1472395 () Bool)

(declare-fun e!826615 () Bool)

(assert (=> b!1472395 (= e!826613 e!826615)))

(declare-fun res!999395 () Bool)

(assert (=> b!1472395 (=> (not res!999395) (not e!826615))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1472395 (= res!999395 (= lt!643639 (Intermediate!12012 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1472395 (= lt!643639 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643638 mask!2687) lt!643638 lt!643640 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1472395 (= lt!643638 (select (store (arr!47875 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1472396 () Bool)

(declare-fun res!999397 () Bool)

(declare-fun e!826612 () Bool)

(assert (=> b!1472396 (=> (not res!999397) (not e!826612))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1472396 (= res!999397 (validKeyInArray!0 (select (arr!47875 a!2862) j!93)))))

(declare-fun b!1472397 () Bool)

(assert (=> b!1472397 (= e!826615 (not true))))

(declare-fun e!826617 () Bool)

(assert (=> b!1472397 e!826617))

(declare-fun res!999407 () Bool)

(assert (=> b!1472397 (=> (not res!999407) (not e!826617))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99187 (_ BitVec 32)) Bool)

(assert (=> b!1472397 (= res!999407 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49397 0))(
  ( (Unit!49398) )
))
(declare-fun lt!643641 () Unit!49397)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99187 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49397)

(assert (=> b!1472397 (= lt!643641 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1472398 () Bool)

(declare-fun res!999406 () Bool)

(assert (=> b!1472398 (=> (not res!999406) (not e!826612))))

(declare-datatypes ((List!34363 0))(
  ( (Nil!34360) (Cons!34359 (h!35726 (_ BitVec 64)) (t!49049 List!34363)) )
))
(declare-fun arrayNoDuplicates!0 (array!99187 (_ BitVec 32) List!34363) Bool)

(assert (=> b!1472398 (= res!999406 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34360))))

(declare-fun b!1472400 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99187 (_ BitVec 32)) SeekEntryResult!12012)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99187 (_ BitVec 32)) SeekEntryResult!12012)

(assert (=> b!1472400 (= e!826614 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!643638 lt!643640 mask!2687) (seekEntryOrOpen!0 lt!643638 lt!643640 mask!2687)))))

(declare-fun b!1472401 () Bool)

(assert (=> b!1472401 (= e!826617 (= (seekEntryOrOpen!0 (select (arr!47875 a!2862) j!93) a!2862 mask!2687) (Found!12012 j!93)))))

(declare-fun b!1472402 () Bool)

(declare-fun res!999404 () Bool)

(assert (=> b!1472402 (=> (not res!999404) (not e!826612))))

(assert (=> b!1472402 (= res!999404 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48426 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48426 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48426 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1472403 () Bool)

(declare-fun res!999403 () Bool)

(assert (=> b!1472403 (=> (not res!999403) (not e!826615))))

(assert (=> b!1472403 (= res!999403 e!826614)))

(declare-fun c!136021 () Bool)

(assert (=> b!1472403 (= c!136021 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1472404 () Bool)

(declare-fun res!999400 () Bool)

(assert (=> b!1472404 (=> (not res!999400) (not e!826615))))

(assert (=> b!1472404 (= res!999400 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1472405 () Bool)

(assert (=> b!1472405 (= e!826612 e!826616)))

(declare-fun res!999402 () Bool)

(assert (=> b!1472405 (=> (not res!999402) (not e!826616))))

(assert (=> b!1472405 (= res!999402 (= (select (store (arr!47875 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1472405 (= lt!643640 (array!99188 (store (arr!47875 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48426 a!2862)))))

(declare-fun res!999401 () Bool)

(assert (=> start!125958 (=> (not res!999401) (not e!826612))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125958 (= res!999401 (validMask!0 mask!2687))))

(assert (=> start!125958 e!826612))

(assert (=> start!125958 true))

(declare-fun array_inv!37156 (array!99187) Bool)

(assert (=> start!125958 (array_inv!37156 a!2862)))

(declare-fun b!1472399 () Bool)

(declare-fun res!999394 () Bool)

(assert (=> b!1472399 (=> (not res!999394) (not e!826612))))

(assert (=> b!1472399 (= res!999394 (validKeyInArray!0 (select (arr!47875 a!2862) i!1006)))))

(declare-fun b!1472406 () Bool)

(declare-fun res!999396 () Bool)

(assert (=> b!1472406 (=> (not res!999396) (not e!826612))))

(assert (=> b!1472406 (= res!999396 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1472407 () Bool)

(declare-fun res!999399 () Bool)

(assert (=> b!1472407 (=> (not res!999399) (not e!826612))))

(assert (=> b!1472407 (= res!999399 (and (= (size!48426 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48426 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48426 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!125958 res!999401) b!1472407))

(assert (= (and b!1472407 res!999399) b!1472399))

(assert (= (and b!1472399 res!999394) b!1472396))

(assert (= (and b!1472396 res!999397) b!1472406))

(assert (= (and b!1472406 res!999396) b!1472398))

(assert (= (and b!1472398 res!999406) b!1472402))

(assert (= (and b!1472402 res!999404) b!1472405))

(assert (= (and b!1472405 res!999402) b!1472392))

(assert (= (and b!1472392 res!999398) b!1472393))

(assert (= (and b!1472393 res!999405) b!1472395))

(assert (= (and b!1472395 res!999395) b!1472403))

(assert (= (and b!1472403 c!136021) b!1472394))

(assert (= (and b!1472403 (not c!136021)) b!1472400))

(assert (= (and b!1472403 res!999403) b!1472404))

(assert (= (and b!1472404 res!999400) b!1472397))

(assert (= (and b!1472397 res!999407) b!1472401))

(declare-fun m!1359349 () Bool)

(assert (=> b!1472394 m!1359349))

(declare-fun m!1359351 () Bool)

(assert (=> b!1472397 m!1359351))

(declare-fun m!1359353 () Bool)

(assert (=> b!1472397 m!1359353))

(declare-fun m!1359355 () Bool)

(assert (=> b!1472395 m!1359355))

(assert (=> b!1472395 m!1359355))

(declare-fun m!1359357 () Bool)

(assert (=> b!1472395 m!1359357))

(declare-fun m!1359359 () Bool)

(assert (=> b!1472395 m!1359359))

(declare-fun m!1359361 () Bool)

(assert (=> b!1472395 m!1359361))

(declare-fun m!1359363 () Bool)

(assert (=> b!1472401 m!1359363))

(assert (=> b!1472401 m!1359363))

(declare-fun m!1359365 () Bool)

(assert (=> b!1472401 m!1359365))

(declare-fun m!1359367 () Bool)

(assert (=> b!1472399 m!1359367))

(assert (=> b!1472399 m!1359367))

(declare-fun m!1359369 () Bool)

(assert (=> b!1472399 m!1359369))

(declare-fun m!1359371 () Bool)

(assert (=> b!1472400 m!1359371))

(declare-fun m!1359373 () Bool)

(assert (=> b!1472400 m!1359373))

(declare-fun m!1359375 () Bool)

(assert (=> start!125958 m!1359375))

(declare-fun m!1359377 () Bool)

(assert (=> start!125958 m!1359377))

(assert (=> b!1472392 m!1359363))

(assert (=> b!1472392 m!1359363))

(declare-fun m!1359379 () Bool)

(assert (=> b!1472392 m!1359379))

(assert (=> b!1472392 m!1359379))

(assert (=> b!1472392 m!1359363))

(declare-fun m!1359381 () Bool)

(assert (=> b!1472392 m!1359381))

(declare-fun m!1359383 () Bool)

(assert (=> b!1472398 m!1359383))

(assert (=> b!1472396 m!1359363))

(assert (=> b!1472396 m!1359363))

(declare-fun m!1359385 () Bool)

(assert (=> b!1472396 m!1359385))

(assert (=> b!1472393 m!1359363))

(assert (=> b!1472393 m!1359363))

(declare-fun m!1359387 () Bool)

(assert (=> b!1472393 m!1359387))

(declare-fun m!1359389 () Bool)

(assert (=> b!1472406 m!1359389))

(assert (=> b!1472405 m!1359359))

(declare-fun m!1359391 () Bool)

(assert (=> b!1472405 m!1359391))

(check-sat (not b!1472393) (not b!1472399) (not b!1472398) (not b!1472401) (not b!1472394) (not start!125958) (not b!1472392) (not b!1472397) (not b!1472406) (not b!1472395) (not b!1472396) (not b!1472400))
(check-sat)
