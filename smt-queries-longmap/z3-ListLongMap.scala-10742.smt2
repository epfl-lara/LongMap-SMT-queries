; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125868 () Bool)

(assert start!125868)

(declare-fun b!1471350 () Bool)

(declare-fun res!998719 () Bool)

(declare-fun e!826107 () Bool)

(assert (=> b!1471350 (=> (not res!998719) (not e!826107))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11997 0))(
  ( (MissingZero!11997 (index!50380 (_ BitVec 32))) (Found!11997 (index!50381 (_ BitVec 32))) (Intermediate!11997 (undefined!12809 Bool) (index!50382 (_ BitVec 32)) (x!132143 (_ BitVec 32))) (Undefined!11997) (MissingVacant!11997 (index!50383 (_ BitVec 32))) )
))
(declare-fun lt!643263 () SeekEntryResult!11997)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!99154 0))(
  ( (array!99155 (arr!47860 (Array (_ BitVec 32) (_ BitVec 64))) (size!48411 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99154)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99154 (_ BitVec 32)) SeekEntryResult!11997)

(assert (=> b!1471350 (= res!998719 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47860 a!2862) j!93) a!2862 mask!2687) lt!643263))))

(declare-fun b!1471351 () Bool)

(declare-fun res!998717 () Bool)

(declare-fun e!826105 () Bool)

(assert (=> b!1471351 (=> (not res!998717) (not e!826105))))

(declare-datatypes ((List!34348 0))(
  ( (Nil!34345) (Cons!34344 (h!35708 (_ BitVec 64)) (t!49034 List!34348)) )
))
(declare-fun arrayNoDuplicates!0 (array!99154 (_ BitVec 32) List!34348) Bool)

(assert (=> b!1471351 (= res!998717 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34345))))

(declare-fun b!1471352 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun lt!643261 () array!99154)

(declare-fun e!826110 () Bool)

(declare-fun lt!643262 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99154 (_ BitVec 32)) SeekEntryResult!11997)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99154 (_ BitVec 32)) SeekEntryResult!11997)

(assert (=> b!1471352 (= e!826110 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!643262 lt!643261 mask!2687) (seekEntryOrOpen!0 lt!643262 lt!643261 mask!2687)))))

(declare-fun b!1471353 () Bool)

(declare-fun e!826106 () Bool)

(assert (=> b!1471353 (= e!826107 e!826106)))

(declare-fun res!998725 () Bool)

(assert (=> b!1471353 (=> (not res!998725) (not e!826106))))

(declare-fun lt!643264 () SeekEntryResult!11997)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1471353 (= res!998725 (= lt!643264 (Intermediate!11997 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1471353 (= lt!643264 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643262 mask!2687) lt!643262 lt!643261 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1471353 (= lt!643262 (select (store (arr!47860 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1471354 () Bool)

(assert (=> b!1471354 (= e!826110 (= lt!643264 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!643262 lt!643261 mask!2687)))))

(declare-fun b!1471355 () Bool)

(declare-fun res!998715 () Bool)

(assert (=> b!1471355 (=> (not res!998715) (not e!826105))))

(assert (=> b!1471355 (= res!998715 (and (= (size!48411 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48411 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48411 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1471356 () Bool)

(declare-fun res!998720 () Bool)

(assert (=> b!1471356 (=> (not res!998720) (not e!826106))))

(assert (=> b!1471356 (= res!998720 e!826110)))

(declare-fun c!135838 () Bool)

(assert (=> b!1471356 (= c!135838 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1471357 () Bool)

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1471357 (= e!826106 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006) (bvsle #b00000000000000000000000000000000 (size!48411 a!2862)) (bvsgt j!93 (size!48411 a!2862))))))

(declare-fun b!1471358 () Bool)

(declare-fun e!826108 () Bool)

(assert (=> b!1471358 (= e!826105 e!826108)))

(declare-fun res!998723 () Bool)

(assert (=> b!1471358 (=> (not res!998723) (not e!826108))))

(assert (=> b!1471358 (= res!998723 (= (select (store (arr!47860 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1471358 (= lt!643261 (array!99155 (store (arr!47860 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48411 a!2862)))))

(declare-fun b!1471359 () Bool)

(declare-fun res!998718 () Bool)

(assert (=> b!1471359 (=> (not res!998718) (not e!826105))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99154 (_ BitVec 32)) Bool)

(assert (=> b!1471359 (= res!998718 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!998724 () Bool)

(assert (=> start!125868 (=> (not res!998724) (not e!826105))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125868 (= res!998724 (validMask!0 mask!2687))))

(assert (=> start!125868 e!826105))

(assert (=> start!125868 true))

(declare-fun array_inv!37141 (array!99154) Bool)

(assert (=> start!125868 (array_inv!37141 a!2862)))

(declare-fun b!1471360 () Bool)

(declare-fun res!998721 () Bool)

(assert (=> b!1471360 (=> (not res!998721) (not e!826105))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1471360 (= res!998721 (validKeyInArray!0 (select (arr!47860 a!2862) i!1006)))))

(declare-fun b!1471361 () Bool)

(declare-fun res!998716 () Bool)

(assert (=> b!1471361 (=> (not res!998716) (not e!826105))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1471361 (= res!998716 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48411 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48411 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48411 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1471362 () Bool)

(declare-fun res!998726 () Bool)

(assert (=> b!1471362 (=> (not res!998726) (not e!826105))))

(assert (=> b!1471362 (= res!998726 (validKeyInArray!0 (select (arr!47860 a!2862) j!93)))))

(declare-fun b!1471363 () Bool)

(assert (=> b!1471363 (= e!826108 e!826107)))

(declare-fun res!998722 () Bool)

(assert (=> b!1471363 (=> (not res!998722) (not e!826107))))

(assert (=> b!1471363 (= res!998722 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47860 a!2862) j!93) mask!2687) (select (arr!47860 a!2862) j!93) a!2862 mask!2687) lt!643263))))

(assert (=> b!1471363 (= lt!643263 (Intermediate!11997 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(assert (= (and start!125868 res!998724) b!1471355))

(assert (= (and b!1471355 res!998715) b!1471360))

(assert (= (and b!1471360 res!998721) b!1471362))

(assert (= (and b!1471362 res!998726) b!1471359))

(assert (= (and b!1471359 res!998718) b!1471351))

(assert (= (and b!1471351 res!998717) b!1471361))

(assert (= (and b!1471361 res!998716) b!1471358))

(assert (= (and b!1471358 res!998723) b!1471363))

(assert (= (and b!1471363 res!998722) b!1471350))

(assert (= (and b!1471350 res!998719) b!1471353))

(assert (= (and b!1471353 res!998725) b!1471356))

(assert (= (and b!1471356 c!135838) b!1471354))

(assert (= (and b!1471356 (not c!135838)) b!1471352))

(assert (= (and b!1471356 res!998720) b!1471357))

(declare-fun m!1358491 () Bool)

(assert (=> b!1471362 m!1358491))

(assert (=> b!1471362 m!1358491))

(declare-fun m!1358493 () Bool)

(assert (=> b!1471362 m!1358493))

(declare-fun m!1358495 () Bool)

(assert (=> b!1471351 m!1358495))

(declare-fun m!1358497 () Bool)

(assert (=> b!1471358 m!1358497))

(declare-fun m!1358499 () Bool)

(assert (=> b!1471358 m!1358499))

(assert (=> b!1471350 m!1358491))

(assert (=> b!1471350 m!1358491))

(declare-fun m!1358501 () Bool)

(assert (=> b!1471350 m!1358501))

(assert (=> b!1471363 m!1358491))

(assert (=> b!1471363 m!1358491))

(declare-fun m!1358503 () Bool)

(assert (=> b!1471363 m!1358503))

(assert (=> b!1471363 m!1358503))

(assert (=> b!1471363 m!1358491))

(declare-fun m!1358505 () Bool)

(assert (=> b!1471363 m!1358505))

(declare-fun m!1358507 () Bool)

(assert (=> b!1471359 m!1358507))

(declare-fun m!1358509 () Bool)

(assert (=> b!1471360 m!1358509))

(assert (=> b!1471360 m!1358509))

(declare-fun m!1358511 () Bool)

(assert (=> b!1471360 m!1358511))

(declare-fun m!1358513 () Bool)

(assert (=> start!125868 m!1358513))

(declare-fun m!1358515 () Bool)

(assert (=> start!125868 m!1358515))

(declare-fun m!1358517 () Bool)

(assert (=> b!1471354 m!1358517))

(declare-fun m!1358519 () Bool)

(assert (=> b!1471353 m!1358519))

(assert (=> b!1471353 m!1358519))

(declare-fun m!1358521 () Bool)

(assert (=> b!1471353 m!1358521))

(assert (=> b!1471353 m!1358497))

(declare-fun m!1358523 () Bool)

(assert (=> b!1471353 m!1358523))

(declare-fun m!1358525 () Bool)

(assert (=> b!1471352 m!1358525))

(declare-fun m!1358527 () Bool)

(assert (=> b!1471352 m!1358527))

(check-sat (not b!1471359) (not b!1471360) (not b!1471353) (not b!1471351) (not b!1471363) (not b!1471350) (not b!1471352) (not start!125868) (not b!1471362) (not b!1471354))
(check-sat)
