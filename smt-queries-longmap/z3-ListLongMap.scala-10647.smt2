; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125022 () Bool)

(assert start!125022)

(declare-fun b!1454370 () Bool)

(declare-fun e!818496 () Bool)

(assert (=> b!1454370 (= e!818496 true)))

(declare-fun lt!637565 () Bool)

(declare-fun e!818493 () Bool)

(assert (=> b!1454370 (= lt!637565 e!818493)))

(declare-fun c!134082 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1454370 (= c!134082 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1454371 () Bool)

(declare-fun e!818497 () Bool)

(declare-fun e!818494 () Bool)

(assert (=> b!1454371 (= e!818497 e!818494)))

(declare-fun res!985237 () Bool)

(assert (=> b!1454371 (=> (not res!985237) (not e!818494))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98470 0))(
  ( (array!98471 (arr!47523 (Array (_ BitVec 32) (_ BitVec 64))) (size!48073 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98470)

(assert (=> b!1454371 (= res!985237 (= (select (store (arr!47523 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!637567 () array!98470)

(assert (=> b!1454371 (= lt!637567 (array!98471 (store (arr!47523 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48073 a!2862)))))

(declare-fun b!1454372 () Bool)

(declare-fun res!985235 () Bool)

(assert (=> b!1454372 (=> (not res!985235) (not e!818497))))

(declare-datatypes ((List!34024 0))(
  ( (Nil!34021) (Cons!34020 (h!35370 (_ BitVec 64)) (t!48718 List!34024)) )
))
(declare-fun arrayNoDuplicates!0 (array!98470 (_ BitVec 32) List!34024) Bool)

(assert (=> b!1454372 (= res!985235 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34021))))

(declare-fun b!1454373 () Bool)

(declare-fun res!985238 () Bool)

(assert (=> b!1454373 (=> (not res!985238) (not e!818497))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1454373 (= res!985238 (and (= (size!48073 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48073 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48073 a!2862)) (not (= i!1006 j!93))))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun e!818499 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1454374 () Bool)

(assert (=> b!1454374 (= e!818499 (and (or (= (select (arr!47523 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47523 a!2862) intermediateBeforeIndex!19) (select (arr!47523 a!2862) j!93))) (let ((bdg!53056 (select (store (arr!47523 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47523 a!2862) index!646) bdg!53056) (= (select (arr!47523 a!2862) index!646) (select (arr!47523 a!2862) j!93))) (= (select (arr!47523 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53056 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!637562 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11775 0))(
  ( (MissingZero!11775 (index!49492 (_ BitVec 32))) (Found!11775 (index!49493 (_ BitVec 32))) (Intermediate!11775 (undefined!12587 Bool) (index!49494 (_ BitVec 32)) (x!131128 (_ BitVec 32))) (Undefined!11775) (MissingVacant!11775 (index!49495 (_ BitVec 32))) )
))
(declare-fun lt!637568 () SeekEntryResult!11775)

(declare-fun lt!637564 () (_ BitVec 32))

(declare-fun b!1454375 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98470 (_ BitVec 32)) SeekEntryResult!11775)

(assert (=> b!1454375 (= e!818493 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637564 intermediateAfterIndex!19 lt!637562 lt!637567 mask!2687) lt!637568)))))

(declare-fun b!1454376 () Bool)

(declare-fun res!985241 () Bool)

(declare-fun e!818500 () Bool)

(assert (=> b!1454376 (=> (not res!985241) (not e!818500))))

(declare-fun lt!637566 () SeekEntryResult!11775)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98470 (_ BitVec 32)) SeekEntryResult!11775)

(assert (=> b!1454376 (= res!985241 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47523 a!2862) j!93) a!2862 mask!2687) lt!637566))))

(declare-fun res!985240 () Bool)

(assert (=> start!125022 (=> (not res!985240) (not e!818497))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125022 (= res!985240 (validMask!0 mask!2687))))

(assert (=> start!125022 e!818497))

(assert (=> start!125022 true))

(declare-fun array_inv!36551 (array!98470) Bool)

(assert (=> start!125022 (array_inv!36551 a!2862)))

(declare-fun b!1454377 () Bool)

(declare-fun res!985243 () Bool)

(assert (=> b!1454377 (=> (not res!985243) (not e!818497))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98470 (_ BitVec 32)) Bool)

(assert (=> b!1454377 (= res!985243 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1454378 () Bool)

(declare-fun res!985231 () Bool)

(assert (=> b!1454378 (=> (not res!985231) (not e!818497))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1454378 (= res!985231 (validKeyInArray!0 (select (arr!47523 a!2862) j!93)))))

(declare-fun b!1454379 () Bool)

(declare-fun res!985244 () Bool)

(assert (=> b!1454379 (=> (not res!985244) (not e!818497))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1454379 (= res!985244 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48073 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48073 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48073 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1454380 () Bool)

(declare-fun res!985246 () Bool)

(assert (=> b!1454380 (=> (not res!985246) (not e!818499))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98470 (_ BitVec 32)) SeekEntryResult!11775)

(assert (=> b!1454380 (= res!985246 (= (seekEntryOrOpen!0 (select (arr!47523 a!2862) j!93) a!2862 mask!2687) (Found!11775 j!93)))))

(declare-fun b!1454381 () Bool)

(declare-fun e!818495 () Bool)

(declare-fun e!818498 () Bool)

(assert (=> b!1454381 (= e!818495 (not e!818498))))

(declare-fun res!985230 () Bool)

(assert (=> b!1454381 (=> res!985230 e!818498)))

(assert (=> b!1454381 (= res!985230 (or (and (= (select (arr!47523 a!2862) index!646) (select (store (arr!47523 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47523 a!2862) index!646) (select (arr!47523 a!2862) j!93))) (= (select (arr!47523 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1454381 e!818499))

(declare-fun res!985232 () Bool)

(assert (=> b!1454381 (=> (not res!985232) (not e!818499))))

(assert (=> b!1454381 (= res!985232 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49046 0))(
  ( (Unit!49047) )
))
(declare-fun lt!637563 () Unit!49046)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98470 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49046)

(assert (=> b!1454381 (= lt!637563 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1454382 () Bool)

(declare-fun lt!637569 () SeekEntryResult!11775)

(assert (=> b!1454382 (= e!818493 (not (= lt!637569 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637564 lt!637562 lt!637567 mask!2687))))))

(declare-fun e!818492 () Bool)

(declare-fun b!1454383 () Bool)

(assert (=> b!1454383 (= e!818492 (= lt!637569 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!637562 lt!637567 mask!2687)))))

(declare-fun b!1454384 () Bool)

(assert (=> b!1454384 (= e!818498 e!818496)))

(declare-fun res!985229 () Bool)

(assert (=> b!1454384 (=> res!985229 e!818496)))

(assert (=> b!1454384 (= res!985229 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!637564 #b00000000000000000000000000000000) (bvsge lt!637564 (size!48073 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1454384 (= lt!637564 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1454384 (= lt!637568 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637562 lt!637567 mask!2687))))

(assert (=> b!1454384 (= lt!637568 (seekEntryOrOpen!0 lt!637562 lt!637567 mask!2687))))

(declare-fun b!1454385 () Bool)

(assert (=> b!1454385 (= e!818494 e!818500)))

(declare-fun res!985236 () Bool)

(assert (=> b!1454385 (=> (not res!985236) (not e!818500))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1454385 (= res!985236 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47523 a!2862) j!93) mask!2687) (select (arr!47523 a!2862) j!93) a!2862 mask!2687) lt!637566))))

(assert (=> b!1454385 (= lt!637566 (Intermediate!11775 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1454386 () Bool)

(declare-fun res!985234 () Bool)

(assert (=> b!1454386 (=> res!985234 e!818496)))

(assert (=> b!1454386 (= res!985234 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637564 (select (arr!47523 a!2862) j!93) a!2862 mask!2687) lt!637566)))))

(declare-fun b!1454387 () Bool)

(declare-fun res!985233 () Bool)

(assert (=> b!1454387 (=> (not res!985233) (not e!818495))))

(assert (=> b!1454387 (= res!985233 e!818492)))

(declare-fun c!134081 () Bool)

(assert (=> b!1454387 (= c!134081 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1454388 () Bool)

(assert (=> b!1454388 (= e!818492 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637562 lt!637567 mask!2687) (seekEntryOrOpen!0 lt!637562 lt!637567 mask!2687)))))

(declare-fun b!1454389 () Bool)

(assert (=> b!1454389 (= e!818500 e!818495)))

(declare-fun res!985245 () Bool)

(assert (=> b!1454389 (=> (not res!985245) (not e!818495))))

(assert (=> b!1454389 (= res!985245 (= lt!637569 (Intermediate!11775 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1454389 (= lt!637569 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!637562 mask!2687) lt!637562 lt!637567 mask!2687))))

(assert (=> b!1454389 (= lt!637562 (select (store (arr!47523 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1454390 () Bool)

(declare-fun res!985242 () Bool)

(assert (=> b!1454390 (=> (not res!985242) (not e!818495))))

(assert (=> b!1454390 (= res!985242 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1454391 () Bool)

(declare-fun res!985239 () Bool)

(assert (=> b!1454391 (=> (not res!985239) (not e!818497))))

(assert (=> b!1454391 (= res!985239 (validKeyInArray!0 (select (arr!47523 a!2862) i!1006)))))

(assert (= (and start!125022 res!985240) b!1454373))

(assert (= (and b!1454373 res!985238) b!1454391))

(assert (= (and b!1454391 res!985239) b!1454378))

(assert (= (and b!1454378 res!985231) b!1454377))

(assert (= (and b!1454377 res!985243) b!1454372))

(assert (= (and b!1454372 res!985235) b!1454379))

(assert (= (and b!1454379 res!985244) b!1454371))

(assert (= (and b!1454371 res!985237) b!1454385))

(assert (= (and b!1454385 res!985236) b!1454376))

(assert (= (and b!1454376 res!985241) b!1454389))

(assert (= (and b!1454389 res!985245) b!1454387))

(assert (= (and b!1454387 c!134081) b!1454383))

(assert (= (and b!1454387 (not c!134081)) b!1454388))

(assert (= (and b!1454387 res!985233) b!1454390))

(assert (= (and b!1454390 res!985242) b!1454381))

(assert (= (and b!1454381 res!985232) b!1454380))

(assert (= (and b!1454380 res!985246) b!1454374))

(assert (= (and b!1454381 (not res!985230)) b!1454384))

(assert (= (and b!1454384 (not res!985229)) b!1454386))

(assert (= (and b!1454386 (not res!985234)) b!1454370))

(assert (= (and b!1454370 c!134082) b!1454382))

(assert (= (and b!1454370 (not c!134082)) b!1454375))

(declare-fun m!1342721 () Bool)

(assert (=> b!1454372 m!1342721))

(declare-fun m!1342723 () Bool)

(assert (=> b!1454377 m!1342723))

(declare-fun m!1342725 () Bool)

(assert (=> start!125022 m!1342725))

(declare-fun m!1342727 () Bool)

(assert (=> start!125022 m!1342727))

(declare-fun m!1342729 () Bool)

(assert (=> b!1454391 m!1342729))

(assert (=> b!1454391 m!1342729))

(declare-fun m!1342731 () Bool)

(assert (=> b!1454391 m!1342731))

(declare-fun m!1342733 () Bool)

(assert (=> b!1454376 m!1342733))

(assert (=> b!1454376 m!1342733))

(declare-fun m!1342735 () Bool)

(assert (=> b!1454376 m!1342735))

(declare-fun m!1342737 () Bool)

(assert (=> b!1454381 m!1342737))

(declare-fun m!1342739 () Bool)

(assert (=> b!1454381 m!1342739))

(declare-fun m!1342741 () Bool)

(assert (=> b!1454381 m!1342741))

(declare-fun m!1342743 () Bool)

(assert (=> b!1454381 m!1342743))

(declare-fun m!1342745 () Bool)

(assert (=> b!1454381 m!1342745))

(assert (=> b!1454381 m!1342733))

(assert (=> b!1454378 m!1342733))

(assert (=> b!1454378 m!1342733))

(declare-fun m!1342747 () Bool)

(assert (=> b!1454378 m!1342747))

(assert (=> b!1454371 m!1342739))

(declare-fun m!1342749 () Bool)

(assert (=> b!1454371 m!1342749))

(assert (=> b!1454386 m!1342733))

(assert (=> b!1454386 m!1342733))

(declare-fun m!1342751 () Bool)

(assert (=> b!1454386 m!1342751))

(declare-fun m!1342753 () Bool)

(assert (=> b!1454375 m!1342753))

(declare-fun m!1342755 () Bool)

(assert (=> b!1454388 m!1342755))

(declare-fun m!1342757 () Bool)

(assert (=> b!1454388 m!1342757))

(declare-fun m!1342759 () Bool)

(assert (=> b!1454384 m!1342759))

(assert (=> b!1454384 m!1342755))

(assert (=> b!1454384 m!1342757))

(assert (=> b!1454380 m!1342733))

(assert (=> b!1454380 m!1342733))

(declare-fun m!1342761 () Bool)

(assert (=> b!1454380 m!1342761))

(declare-fun m!1342763 () Bool)

(assert (=> b!1454383 m!1342763))

(declare-fun m!1342765 () Bool)

(assert (=> b!1454382 m!1342765))

(assert (=> b!1454374 m!1342739))

(declare-fun m!1342767 () Bool)

(assert (=> b!1454374 m!1342767))

(assert (=> b!1454374 m!1342741))

(assert (=> b!1454374 m!1342743))

(assert (=> b!1454374 m!1342733))

(declare-fun m!1342769 () Bool)

(assert (=> b!1454389 m!1342769))

(assert (=> b!1454389 m!1342769))

(declare-fun m!1342771 () Bool)

(assert (=> b!1454389 m!1342771))

(assert (=> b!1454389 m!1342739))

(declare-fun m!1342773 () Bool)

(assert (=> b!1454389 m!1342773))

(assert (=> b!1454385 m!1342733))

(assert (=> b!1454385 m!1342733))

(declare-fun m!1342775 () Bool)

(assert (=> b!1454385 m!1342775))

(assert (=> b!1454385 m!1342775))

(assert (=> b!1454385 m!1342733))

(declare-fun m!1342777 () Bool)

(assert (=> b!1454385 m!1342777))

(check-sat (not b!1454375) (not b!1454385) (not b!1454383) (not b!1454386) (not b!1454384) (not b!1454377) (not b!1454378) (not b!1454376) (not b!1454391) (not b!1454380) (not b!1454372) (not start!125022) (not b!1454389) (not b!1454381) (not b!1454382) (not b!1454388))
(check-sat)
