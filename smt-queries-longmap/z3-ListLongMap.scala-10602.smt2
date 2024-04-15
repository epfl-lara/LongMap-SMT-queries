; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124720 () Bool)

(assert start!124720)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1446409 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun e!814638 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((array!98146 0))(
  ( (array!98147 (arr!47362 (Array (_ BitVec 32) (_ BitVec 64))) (size!47914 (_ BitVec 32))) )
))
(declare-fun lt!634620 () array!98146)

(declare-fun lt!634625 () (_ BitVec 64))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11639 0))(
  ( (MissingZero!11639 (index!48948 (_ BitVec 32))) (Found!11639 (index!48949 (_ BitVec 32))) (Intermediate!11639 (undefined!12451 Bool) (index!48950 (_ BitVec 32)) (x!130627 (_ BitVec 32))) (Undefined!11639) (MissingVacant!11639 (index!48951 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98146 (_ BitVec 32)) SeekEntryResult!11639)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98146 (_ BitVec 32)) SeekEntryResult!11639)

(assert (=> b!1446409 (= e!814638 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634625 lt!634620 mask!2687) (seekEntryOrOpen!0 lt!634625 lt!634620 mask!2687)))))

(declare-fun b!1446410 () Bool)

(declare-fun res!978267 () Bool)

(declare-fun e!814637 () Bool)

(assert (=> b!1446410 (=> (not res!978267) (not e!814637))))

(assert (=> b!1446410 (= res!978267 e!814638)))

(declare-fun c!133585 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1446410 (= c!133585 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1446411 () Bool)

(declare-fun res!978265 () Bool)

(declare-fun e!814633 () Bool)

(assert (=> b!1446411 (=> (not res!978265) (not e!814633))))

(declare-fun a!2862 () array!98146)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1446411 (= res!978265 (validKeyInArray!0 (select (arr!47362 a!2862) j!93)))))

(declare-fun b!1446412 () Bool)

(declare-fun e!814634 () Bool)

(assert (=> b!1446412 (= e!814633 e!814634)))

(declare-fun res!978280 () Bool)

(assert (=> b!1446412 (=> (not res!978280) (not e!814634))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1446412 (= res!978280 (= (select (store (arr!47362 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1446412 (= lt!634620 (array!98147 (store (arr!47362 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47914 a!2862)))))

(declare-fun b!1446413 () Bool)

(declare-fun e!814632 () Bool)

(assert (=> b!1446413 (= e!814632 true)))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun lt!634626 () SeekEntryResult!11639)

(assert (=> b!1446413 (= lt!634626 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47362 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1446414 () Bool)

(declare-fun res!978279 () Bool)

(assert (=> b!1446414 (=> (not res!978279) (not e!814633))))

(assert (=> b!1446414 (= res!978279 (validKeyInArray!0 (select (arr!47362 a!2862) i!1006)))))

(declare-fun b!1446415 () Bool)

(declare-fun res!978273 () Bool)

(assert (=> b!1446415 (=> (not res!978273) (not e!814637))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1446415 (= res!978273 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1446416 () Bool)

(assert (=> b!1446416 (= e!814637 (not e!814632))))

(declare-fun res!978270 () Bool)

(assert (=> b!1446416 (=> res!978270 e!814632)))

(assert (=> b!1446416 (= res!978270 (or (and (= (select (arr!47362 a!2862) index!646) (select (store (arr!47362 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47362 a!2862) index!646) (select (arr!47362 a!2862) j!93))) (not (= (select (arr!47362 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47362 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!814630 () Bool)

(assert (=> b!1446416 e!814630))

(declare-fun res!978269 () Bool)

(assert (=> b!1446416 (=> (not res!978269) (not e!814630))))

(declare-fun lt!634624 () SeekEntryResult!11639)

(assert (=> b!1446416 (= res!978269 (and (= lt!634624 (Found!11639 j!93)) (or (= (select (arr!47362 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47362 a!2862) intermediateBeforeIndex!19) (select (arr!47362 a!2862) j!93)))))))

(assert (=> b!1446416 (= lt!634624 (seekEntryOrOpen!0 (select (arr!47362 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98146 (_ BitVec 32)) Bool)

(assert (=> b!1446416 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48615 0))(
  ( (Unit!48616) )
))
(declare-fun lt!634622 () Unit!48615)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98146 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48615)

(assert (=> b!1446416 (= lt!634622 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1446417 () Bool)

(declare-fun res!978268 () Bool)

(assert (=> b!1446417 (=> (not res!978268) (not e!814633))))

(assert (=> b!1446417 (= res!978268 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1446418 () Bool)

(declare-fun e!814631 () Bool)

(assert (=> b!1446418 (= e!814631 e!814637)))

(declare-fun res!978277 () Bool)

(assert (=> b!1446418 (=> (not res!978277) (not e!814637))))

(declare-fun lt!634623 () SeekEntryResult!11639)

(assert (=> b!1446418 (= res!978277 (= lt!634623 (Intermediate!11639 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98146 (_ BitVec 32)) SeekEntryResult!11639)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1446418 (= lt!634623 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634625 mask!2687) lt!634625 lt!634620 mask!2687))))

(assert (=> b!1446418 (= lt!634625 (select (store (arr!47362 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1446419 () Bool)

(declare-fun res!978275 () Bool)

(assert (=> b!1446419 (=> (not res!978275) (not e!814633))))

(declare-datatypes ((List!33941 0))(
  ( (Nil!33938) (Cons!33937 (h!35287 (_ BitVec 64)) (t!48627 List!33941)) )
))
(declare-fun arrayNoDuplicates!0 (array!98146 (_ BitVec 32) List!33941) Bool)

(assert (=> b!1446419 (= res!978275 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33938))))

(declare-fun b!1446420 () Bool)

(declare-fun res!978271 () Bool)

(assert (=> b!1446420 (=> (not res!978271) (not e!814633))))

(assert (=> b!1446420 (= res!978271 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47914 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47914 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47914 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!978266 () Bool)

(assert (=> start!124720 (=> (not res!978266) (not e!814633))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124720 (= res!978266 (validMask!0 mask!2687))))

(assert (=> start!124720 e!814633))

(assert (=> start!124720 true))

(declare-fun array_inv!36595 (array!98146) Bool)

(assert (=> start!124720 (array_inv!36595 a!2862)))

(declare-fun b!1446408 () Bool)

(declare-fun e!814629 () Bool)

(assert (=> b!1446408 (= e!814630 e!814629)))

(declare-fun res!978276 () Bool)

(assert (=> b!1446408 (=> res!978276 e!814629)))

(assert (=> b!1446408 (= res!978276 (or (and (= (select (arr!47362 a!2862) index!646) (select (store (arr!47362 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47362 a!2862) index!646) (select (arr!47362 a!2862) j!93))) (not (= (select (arr!47362 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1446421 () Bool)

(declare-fun res!978272 () Bool)

(assert (=> b!1446421 (=> (not res!978272) (not e!814631))))

(declare-fun lt!634621 () SeekEntryResult!11639)

(assert (=> b!1446421 (= res!978272 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47362 a!2862) j!93) a!2862 mask!2687) lt!634621))))

(declare-fun b!1446422 () Bool)

(declare-fun e!814635 () Bool)

(assert (=> b!1446422 (= e!814629 e!814635)))

(declare-fun res!978264 () Bool)

(assert (=> b!1446422 (=> (not res!978264) (not e!814635))))

(assert (=> b!1446422 (= res!978264 (= lt!634624 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47362 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1446423 () Bool)

(assert (=> b!1446423 (= e!814634 e!814631)))

(declare-fun res!978278 () Bool)

(assert (=> b!1446423 (=> (not res!978278) (not e!814631))))

(assert (=> b!1446423 (= res!978278 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47362 a!2862) j!93) mask!2687) (select (arr!47362 a!2862) j!93) a!2862 mask!2687) lt!634621))))

(assert (=> b!1446423 (= lt!634621 (Intermediate!11639 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1446424 () Bool)

(assert (=> b!1446424 (= e!814638 (= lt!634623 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634625 lt!634620 mask!2687)))))

(declare-fun b!1446425 () Bool)

(assert (=> b!1446425 (= e!814635 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1446426 () Bool)

(declare-fun res!978274 () Bool)

(assert (=> b!1446426 (=> (not res!978274) (not e!814633))))

(assert (=> b!1446426 (= res!978274 (and (= (size!47914 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47914 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47914 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!124720 res!978266) b!1446426))

(assert (= (and b!1446426 res!978274) b!1446414))

(assert (= (and b!1446414 res!978279) b!1446411))

(assert (= (and b!1446411 res!978265) b!1446417))

(assert (= (and b!1446417 res!978268) b!1446419))

(assert (= (and b!1446419 res!978275) b!1446420))

(assert (= (and b!1446420 res!978271) b!1446412))

(assert (= (and b!1446412 res!978280) b!1446423))

(assert (= (and b!1446423 res!978278) b!1446421))

(assert (= (and b!1446421 res!978272) b!1446418))

(assert (= (and b!1446418 res!978277) b!1446410))

(assert (= (and b!1446410 c!133585) b!1446424))

(assert (= (and b!1446410 (not c!133585)) b!1446409))

(assert (= (and b!1446410 res!978267) b!1446415))

(assert (= (and b!1446415 res!978273) b!1446416))

(assert (= (and b!1446416 res!978269) b!1446408))

(assert (= (and b!1446408 (not res!978276)) b!1446422))

(assert (= (and b!1446422 res!978264) b!1446425))

(assert (= (and b!1446416 (not res!978270)) b!1446413))

(declare-fun m!1334787 () Bool)

(assert (=> b!1446409 m!1334787))

(declare-fun m!1334789 () Bool)

(assert (=> b!1446409 m!1334789))

(declare-fun m!1334791 () Bool)

(assert (=> b!1446413 m!1334791))

(assert (=> b!1446413 m!1334791))

(declare-fun m!1334793 () Bool)

(assert (=> b!1446413 m!1334793))

(declare-fun m!1334795 () Bool)

(assert (=> b!1446412 m!1334795))

(declare-fun m!1334797 () Bool)

(assert (=> b!1446412 m!1334797))

(declare-fun m!1334799 () Bool)

(assert (=> b!1446408 m!1334799))

(assert (=> b!1446408 m!1334795))

(declare-fun m!1334801 () Bool)

(assert (=> b!1446408 m!1334801))

(assert (=> b!1446408 m!1334791))

(declare-fun m!1334803 () Bool)

(assert (=> b!1446424 m!1334803))

(assert (=> b!1446422 m!1334791))

(assert (=> b!1446422 m!1334791))

(declare-fun m!1334805 () Bool)

(assert (=> b!1446422 m!1334805))

(declare-fun m!1334807 () Bool)

(assert (=> b!1446414 m!1334807))

(assert (=> b!1446414 m!1334807))

(declare-fun m!1334809 () Bool)

(assert (=> b!1446414 m!1334809))

(assert (=> b!1446423 m!1334791))

(assert (=> b!1446423 m!1334791))

(declare-fun m!1334811 () Bool)

(assert (=> b!1446423 m!1334811))

(assert (=> b!1446423 m!1334811))

(assert (=> b!1446423 m!1334791))

(declare-fun m!1334813 () Bool)

(assert (=> b!1446423 m!1334813))

(declare-fun m!1334815 () Bool)

(assert (=> b!1446419 m!1334815))

(assert (=> b!1446411 m!1334791))

(assert (=> b!1446411 m!1334791))

(declare-fun m!1334817 () Bool)

(assert (=> b!1446411 m!1334817))

(declare-fun m!1334819 () Bool)

(assert (=> start!124720 m!1334819))

(declare-fun m!1334821 () Bool)

(assert (=> start!124720 m!1334821))

(declare-fun m!1334823 () Bool)

(assert (=> b!1446418 m!1334823))

(assert (=> b!1446418 m!1334823))

(declare-fun m!1334825 () Bool)

(assert (=> b!1446418 m!1334825))

(assert (=> b!1446418 m!1334795))

(declare-fun m!1334827 () Bool)

(assert (=> b!1446418 m!1334827))

(declare-fun m!1334829 () Bool)

(assert (=> b!1446417 m!1334829))

(assert (=> b!1446421 m!1334791))

(assert (=> b!1446421 m!1334791))

(declare-fun m!1334831 () Bool)

(assert (=> b!1446421 m!1334831))

(declare-fun m!1334833 () Bool)

(assert (=> b!1446416 m!1334833))

(assert (=> b!1446416 m!1334795))

(declare-fun m!1334835 () Bool)

(assert (=> b!1446416 m!1334835))

(assert (=> b!1446416 m!1334801))

(assert (=> b!1446416 m!1334799))

(assert (=> b!1446416 m!1334791))

(declare-fun m!1334837 () Bool)

(assert (=> b!1446416 m!1334837))

(declare-fun m!1334839 () Bool)

(assert (=> b!1446416 m!1334839))

(assert (=> b!1446416 m!1334791))

(check-sat (not b!1446409) (not b!1446422) (not start!124720) (not b!1446411) (not b!1446417) (not b!1446423) (not b!1446421) (not b!1446418) (not b!1446416) (not b!1446413) (not b!1446424) (not b!1446414) (not b!1446419))
(check-sat)
