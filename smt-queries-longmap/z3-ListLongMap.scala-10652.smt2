; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125052 () Bool)

(assert start!125052)

(declare-fun b!1455360 () Bool)

(declare-fun e!818943 () Bool)

(declare-fun e!818944 () Bool)

(assert (=> b!1455360 (= e!818943 e!818944)))

(declare-fun res!986051 () Bool)

(assert (=> b!1455360 (=> (not res!986051) (not e!818944))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98500 0))(
  ( (array!98501 (arr!47538 (Array (_ BitVec 32) (_ BitVec 64))) (size!48088 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98500)

(assert (=> b!1455360 (= res!986051 (= (select (store (arr!47538 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!637922 () array!98500)

(assert (=> b!1455360 (= lt!637922 (array!98501 (store (arr!47538 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48088 a!2862)))))

(declare-fun b!1455361 () Bool)

(declare-fun e!818947 () Bool)

(declare-fun e!818948 () Bool)

(assert (=> b!1455361 (= e!818947 e!818948)))

(declare-fun res!986052 () Bool)

(assert (=> b!1455361 (=> res!986052 e!818948)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!637927 () (_ BitVec 32))

(assert (=> b!1455361 (= res!986052 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!637927 #b00000000000000000000000000000000) (bvsge lt!637927 (size!48088 a!2862))))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1455361 (= lt!637927 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-datatypes ((SeekEntryResult!11790 0))(
  ( (MissingZero!11790 (index!49552 (_ BitVec 32))) (Found!11790 (index!49553 (_ BitVec 32))) (Intermediate!11790 (undefined!12602 Bool) (index!49554 (_ BitVec 32)) (x!131183 (_ BitVec 32))) (Undefined!11790) (MissingVacant!11790 (index!49555 (_ BitVec 32))) )
))
(declare-fun lt!637923 () SeekEntryResult!11790)

(declare-fun lt!637925 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98500 (_ BitVec 32)) SeekEntryResult!11790)

(assert (=> b!1455361 (= lt!637923 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637925 lt!637922 mask!2687))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98500 (_ BitVec 32)) SeekEntryResult!11790)

(assert (=> b!1455361 (= lt!637923 (seekEntryOrOpen!0 lt!637925 lt!637922 mask!2687))))

(declare-fun b!1455362 () Bool)

(declare-fun res!986053 () Bool)

(declare-fun e!818946 () Bool)

(assert (=> b!1455362 (=> (not res!986053) (not e!818946))))

(declare-fun e!818942 () Bool)

(assert (=> b!1455362 (= res!986053 e!818942)))

(declare-fun c!134171 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1455362 (= c!134171 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1455363 () Bool)

(assert (=> b!1455363 (= e!818946 (not e!818947))))

(declare-fun res!986043 () Bool)

(assert (=> b!1455363 (=> res!986043 e!818947)))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1455363 (= res!986043 (or (and (= (select (arr!47538 a!2862) index!646) (select (store (arr!47538 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47538 a!2862) index!646) (select (arr!47538 a!2862) j!93))) (= (select (arr!47538 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun e!818951 () Bool)

(assert (=> b!1455363 e!818951))

(declare-fun res!986045 () Bool)

(assert (=> b!1455363 (=> (not res!986045) (not e!818951))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98500 (_ BitVec 32)) Bool)

(assert (=> b!1455363 (= res!986045 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49076 0))(
  ( (Unit!49077) )
))
(declare-fun lt!637924 () Unit!49076)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98500 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49076)

(assert (=> b!1455363 (= lt!637924 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1455364 () Bool)

(declare-fun res!986055 () Bool)

(assert (=> b!1455364 (=> (not res!986055) (not e!818943))))

(assert (=> b!1455364 (= res!986055 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1455365 () Bool)

(declare-fun res!986041 () Bool)

(assert (=> b!1455365 (=> res!986041 e!818948)))

(declare-fun lt!637929 () SeekEntryResult!11790)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98500 (_ BitVec 32)) SeekEntryResult!11790)

(assert (=> b!1455365 (= res!986041 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637927 (select (arr!47538 a!2862) j!93) a!2862 mask!2687) lt!637929)))))

(declare-fun b!1455366 () Bool)

(declare-fun res!986039 () Bool)

(assert (=> b!1455366 (=> (not res!986039) (not e!818943))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1455366 (= res!986039 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48088 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48088 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48088 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1455367 () Bool)

(declare-fun res!986046 () Bool)

(assert (=> b!1455367 (=> (not res!986046) (not e!818943))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1455367 (= res!986046 (validKeyInArray!0 (select (arr!47538 a!2862) i!1006)))))

(declare-fun b!1455368 () Bool)

(declare-fun e!818945 () Bool)

(assert (=> b!1455368 (= e!818945 e!818946)))

(declare-fun res!986040 () Bool)

(assert (=> b!1455368 (=> (not res!986040) (not e!818946))))

(declare-fun lt!637926 () SeekEntryResult!11790)

(assert (=> b!1455368 (= res!986040 (= lt!637926 (Intermediate!11790 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1455368 (= lt!637926 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!637925 mask!2687) lt!637925 lt!637922 mask!2687))))

(assert (=> b!1455368 (= lt!637925 (select (store (arr!47538 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1455369 () Bool)

(declare-fun e!818949 () Bool)

(assert (=> b!1455369 (= e!818949 (not (= lt!637926 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637927 lt!637925 lt!637922 mask!2687))))))

(declare-fun b!1455370 () Bool)

(assert (=> b!1455370 (= e!818944 e!818945)))

(declare-fun res!986044 () Bool)

(assert (=> b!1455370 (=> (not res!986044) (not e!818945))))

(assert (=> b!1455370 (= res!986044 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47538 a!2862) j!93) mask!2687) (select (arr!47538 a!2862) j!93) a!2862 mask!2687) lt!637929))))

(assert (=> b!1455370 (= lt!637929 (Intermediate!11790 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1455371 () Bool)

(assert (=> b!1455371 (= e!818942 (= lt!637926 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!637925 lt!637922 mask!2687)))))

(declare-fun b!1455372 () Bool)

(declare-fun res!986049 () Bool)

(assert (=> b!1455372 (=> (not res!986049) (not e!818943))))

(assert (=> b!1455372 (= res!986049 (and (= (size!48088 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48088 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48088 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1455373 () Bool)

(declare-fun res!986056 () Bool)

(assert (=> b!1455373 (=> (not res!986056) (not e!818943))))

(declare-datatypes ((List!34039 0))(
  ( (Nil!34036) (Cons!34035 (h!35385 (_ BitVec 64)) (t!48733 List!34039)) )
))
(declare-fun arrayNoDuplicates!0 (array!98500 (_ BitVec 32) List!34039) Bool)

(assert (=> b!1455373 (= res!986056 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34036))))

(declare-fun res!986042 () Bool)

(assert (=> start!125052 (=> (not res!986042) (not e!818943))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125052 (= res!986042 (validMask!0 mask!2687))))

(assert (=> start!125052 e!818943))

(assert (=> start!125052 true))

(declare-fun array_inv!36566 (array!98500) Bool)

(assert (=> start!125052 (array_inv!36566 a!2862)))

(declare-fun b!1455374 () Bool)

(assert (=> b!1455374 (= e!818948 true)))

(declare-fun lt!637928 () Bool)

(assert (=> b!1455374 (= lt!637928 e!818949)))

(declare-fun c!134172 () Bool)

(assert (=> b!1455374 (= c!134172 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1455375 () Bool)

(declare-fun res!986050 () Bool)

(assert (=> b!1455375 (=> (not res!986050) (not e!818946))))

(assert (=> b!1455375 (= res!986050 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1455376 () Bool)

(declare-fun res!986047 () Bool)

(assert (=> b!1455376 (=> (not res!986047) (not e!818951))))

(assert (=> b!1455376 (= res!986047 (= (seekEntryOrOpen!0 (select (arr!47538 a!2862) j!93) a!2862 mask!2687) (Found!11790 j!93)))))

(declare-fun b!1455377 () Bool)

(declare-fun res!986048 () Bool)

(assert (=> b!1455377 (=> (not res!986048) (not e!818945))))

(assert (=> b!1455377 (= res!986048 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47538 a!2862) j!93) a!2862 mask!2687) lt!637929))))

(declare-fun b!1455378 () Bool)

(assert (=> b!1455378 (= e!818942 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637925 lt!637922 mask!2687) (seekEntryOrOpen!0 lt!637925 lt!637922 mask!2687)))))

(declare-fun b!1455379 () Bool)

(assert (=> b!1455379 (= e!818949 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637927 intermediateAfterIndex!19 lt!637925 lt!637922 mask!2687) lt!637923)))))

(declare-fun b!1455380 () Bool)

(declare-fun res!986054 () Bool)

(assert (=> b!1455380 (=> (not res!986054) (not e!818943))))

(assert (=> b!1455380 (= res!986054 (validKeyInArray!0 (select (arr!47538 a!2862) j!93)))))

(declare-fun b!1455381 () Bool)

(assert (=> b!1455381 (= e!818951 (and (or (= (select (arr!47538 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47538 a!2862) intermediateBeforeIndex!19) (select (arr!47538 a!2862) j!93))) (let ((bdg!53146 (select (store (arr!47538 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47538 a!2862) index!646) bdg!53146) (= (select (arr!47538 a!2862) index!646) (select (arr!47538 a!2862) j!93))) (= (select (arr!47538 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53146 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and start!125052 res!986042) b!1455372))

(assert (= (and b!1455372 res!986049) b!1455367))

(assert (= (and b!1455367 res!986046) b!1455380))

(assert (= (and b!1455380 res!986054) b!1455364))

(assert (= (and b!1455364 res!986055) b!1455373))

(assert (= (and b!1455373 res!986056) b!1455366))

(assert (= (and b!1455366 res!986039) b!1455360))

(assert (= (and b!1455360 res!986051) b!1455370))

(assert (= (and b!1455370 res!986044) b!1455377))

(assert (= (and b!1455377 res!986048) b!1455368))

(assert (= (and b!1455368 res!986040) b!1455362))

(assert (= (and b!1455362 c!134171) b!1455371))

(assert (= (and b!1455362 (not c!134171)) b!1455378))

(assert (= (and b!1455362 res!986053) b!1455375))

(assert (= (and b!1455375 res!986050) b!1455363))

(assert (= (and b!1455363 res!986045) b!1455376))

(assert (= (and b!1455376 res!986047) b!1455381))

(assert (= (and b!1455363 (not res!986043)) b!1455361))

(assert (= (and b!1455361 (not res!986052)) b!1455365))

(assert (= (and b!1455365 (not res!986041)) b!1455374))

(assert (= (and b!1455374 c!134172) b!1455369))

(assert (= (and b!1455374 (not c!134172)) b!1455379))

(declare-fun m!1343591 () Bool)

(assert (=> b!1455361 m!1343591))

(declare-fun m!1343593 () Bool)

(assert (=> b!1455361 m!1343593))

(declare-fun m!1343595 () Bool)

(assert (=> b!1455361 m!1343595))

(declare-fun m!1343597 () Bool)

(assert (=> b!1455364 m!1343597))

(declare-fun m!1343599 () Bool)

(assert (=> b!1455368 m!1343599))

(assert (=> b!1455368 m!1343599))

(declare-fun m!1343601 () Bool)

(assert (=> b!1455368 m!1343601))

(declare-fun m!1343603 () Bool)

(assert (=> b!1455368 m!1343603))

(declare-fun m!1343605 () Bool)

(assert (=> b!1455368 m!1343605))

(declare-fun m!1343607 () Bool)

(assert (=> b!1455365 m!1343607))

(assert (=> b!1455365 m!1343607))

(declare-fun m!1343609 () Bool)

(assert (=> b!1455365 m!1343609))

(assert (=> b!1455376 m!1343607))

(assert (=> b!1455376 m!1343607))

(declare-fun m!1343611 () Bool)

(assert (=> b!1455376 m!1343611))

(declare-fun m!1343613 () Bool)

(assert (=> b!1455379 m!1343613))

(declare-fun m!1343615 () Bool)

(assert (=> b!1455369 m!1343615))

(declare-fun m!1343617 () Bool)

(assert (=> start!125052 m!1343617))

(declare-fun m!1343619 () Bool)

(assert (=> start!125052 m!1343619))

(assert (=> b!1455370 m!1343607))

(assert (=> b!1455370 m!1343607))

(declare-fun m!1343621 () Bool)

(assert (=> b!1455370 m!1343621))

(assert (=> b!1455370 m!1343621))

(assert (=> b!1455370 m!1343607))

(declare-fun m!1343623 () Bool)

(assert (=> b!1455370 m!1343623))

(declare-fun m!1343625 () Bool)

(assert (=> b!1455373 m!1343625))

(assert (=> b!1455360 m!1343603))

(declare-fun m!1343627 () Bool)

(assert (=> b!1455360 m!1343627))

(declare-fun m!1343629 () Bool)

(assert (=> b!1455367 m!1343629))

(assert (=> b!1455367 m!1343629))

(declare-fun m!1343631 () Bool)

(assert (=> b!1455367 m!1343631))

(declare-fun m!1343633 () Bool)

(assert (=> b!1455371 m!1343633))

(assert (=> b!1455380 m!1343607))

(assert (=> b!1455380 m!1343607))

(declare-fun m!1343635 () Bool)

(assert (=> b!1455380 m!1343635))

(assert (=> b!1455381 m!1343603))

(declare-fun m!1343637 () Bool)

(assert (=> b!1455381 m!1343637))

(declare-fun m!1343639 () Bool)

(assert (=> b!1455381 m!1343639))

(declare-fun m!1343641 () Bool)

(assert (=> b!1455381 m!1343641))

(assert (=> b!1455381 m!1343607))

(assert (=> b!1455378 m!1343593))

(assert (=> b!1455378 m!1343595))

(assert (=> b!1455377 m!1343607))

(assert (=> b!1455377 m!1343607))

(declare-fun m!1343643 () Bool)

(assert (=> b!1455377 m!1343643))

(declare-fun m!1343645 () Bool)

(assert (=> b!1455363 m!1343645))

(assert (=> b!1455363 m!1343603))

(assert (=> b!1455363 m!1343639))

(assert (=> b!1455363 m!1343641))

(declare-fun m!1343647 () Bool)

(assert (=> b!1455363 m!1343647))

(assert (=> b!1455363 m!1343607))

(check-sat (not b!1455380) (not b!1455376) (not b!1455370) (not b!1455364) (not b!1455368) (not b!1455363) (not b!1455371) (not b!1455377) (not b!1455369) (not start!125052) (not b!1455379) (not b!1455365) (not b!1455373) (not b!1455378) (not b!1455367) (not b!1455361))
(check-sat)
