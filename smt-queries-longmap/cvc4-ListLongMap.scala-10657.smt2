; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125084 () Bool)

(assert start!125084)

(declare-fun b!1456416 () Bool)

(declare-fun res!986920 () Bool)

(declare-fun e!819423 () Bool)

(assert (=> b!1456416 (=> (not res!986920) (not e!819423))))

(declare-datatypes ((array!98532 0))(
  ( (array!98533 (arr!47554 (Array (_ BitVec 32) (_ BitVec 64))) (size!48104 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98532)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11806 0))(
  ( (MissingZero!11806 (index!49616 (_ BitVec 32))) (Found!11806 (index!49617 (_ BitVec 32))) (Intermediate!11806 (undefined!12618 Bool) (index!49618 (_ BitVec 32)) (x!131239 (_ BitVec 32))) (Undefined!11806) (MissingVacant!11806 (index!49619 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98532 (_ BitVec 32)) SeekEntryResult!11806)

(assert (=> b!1456416 (= res!986920 (= (seekEntryOrOpen!0 (select (arr!47554 a!2862) j!93) a!2862 mask!2687) (Found!11806 j!93)))))

(declare-fun b!1456417 () Bool)

(declare-fun e!819426 () Bool)

(declare-fun e!819428 () Bool)

(assert (=> b!1456417 (= e!819426 e!819428)))

(declare-fun res!986917 () Bool)

(assert (=> b!1456417 (=> (not res!986917) (not e!819428))))

(declare-fun lt!638308 () SeekEntryResult!11806)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98532 (_ BitVec 32)) SeekEntryResult!11806)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1456417 (= res!986917 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47554 a!2862) j!93) mask!2687) (select (arr!47554 a!2862) j!93) a!2862 mask!2687) lt!638308))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1456417 (= lt!638308 (Intermediate!11806 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1456418 () Bool)

(declare-fun res!986903 () Bool)

(declare-fun e!819425 () Bool)

(assert (=> b!1456418 (=> (not res!986903) (not e!819425))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98532 (_ BitVec 32)) Bool)

(assert (=> b!1456418 (= res!986903 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1456419 () Bool)

(declare-fun res!986906 () Bool)

(assert (=> b!1456419 (=> (not res!986906) (not e!819425))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1456419 (= res!986906 (and (= (size!48104 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48104 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48104 a!2862)) (not (= i!1006 j!93))))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1456420 () Bool)

(declare-fun lt!638307 () (_ BitVec 32))

(declare-fun lt!638313 () array!98532)

(declare-fun lt!638310 () SeekEntryResult!11806)

(declare-fun lt!638309 () (_ BitVec 64))

(declare-fun e!819429 () Bool)

(assert (=> b!1456420 (= e!819429 (not (= lt!638310 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638307 lt!638309 lt!638313 mask!2687))))))

(declare-fun b!1456421 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun e!819424 () Bool)

(assert (=> b!1456421 (= e!819424 (= lt!638310 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!638309 lt!638313 mask!2687)))))

(declare-fun b!1456423 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98532 (_ BitVec 32)) SeekEntryResult!11806)

(assert (=> b!1456423 (= e!819424 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638309 lt!638313 mask!2687) (seekEntryOrOpen!0 lt!638309 lt!638313 mask!2687)))))

(declare-fun b!1456424 () Bool)

(declare-fun res!986908 () Bool)

(declare-fun e!819422 () Bool)

(assert (=> b!1456424 (=> (not res!986908) (not e!819422))))

(assert (=> b!1456424 (= res!986908 e!819424)))

(declare-fun c!134267 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1456424 (= c!134267 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1456425 () Bool)

(declare-fun res!986912 () Bool)

(assert (=> b!1456425 (=> (not res!986912) (not e!819425))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1456425 (= res!986912 (validKeyInArray!0 (select (arr!47554 a!2862) j!93)))))

(declare-fun b!1456426 () Bool)

(assert (=> b!1456426 (= e!819423 (and (or (= (select (arr!47554 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47554 a!2862) intermediateBeforeIndex!19) (select (arr!47554 a!2862) j!93))) (let ((bdg!53239 (select (store (arr!47554 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47554 a!2862) index!646) bdg!53239) (= (select (arr!47554 a!2862) index!646) (select (arr!47554 a!2862) j!93))) (= (select (arr!47554 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53239 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1456427 () Bool)

(assert (=> b!1456427 (= e!819428 e!819422)))

(declare-fun res!986918 () Bool)

(assert (=> b!1456427 (=> (not res!986918) (not e!819422))))

(assert (=> b!1456427 (= res!986918 (= lt!638310 (Intermediate!11806 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1456427 (= lt!638310 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!638309 mask!2687) lt!638309 lt!638313 mask!2687))))

(assert (=> b!1456427 (= lt!638309 (select (store (arr!47554 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1456428 () Bool)

(declare-fun e!819431 () Bool)

(declare-fun e!819430 () Bool)

(assert (=> b!1456428 (= e!819431 e!819430)))

(declare-fun res!986913 () Bool)

(assert (=> b!1456428 (=> res!986913 e!819430)))

(assert (=> b!1456428 (= res!986913 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!638307 #b00000000000000000000000000000000) (bvsge lt!638307 (size!48104 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1456428 (= lt!638307 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun lt!638311 () SeekEntryResult!11806)

(assert (=> b!1456428 (= lt!638311 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638309 lt!638313 mask!2687))))

(assert (=> b!1456428 (= lt!638311 (seekEntryOrOpen!0 lt!638309 lt!638313 mask!2687))))

(declare-fun b!1456429 () Bool)

(declare-fun res!986916 () Bool)

(assert (=> b!1456429 (=> (not res!986916) (not e!819425))))

(assert (=> b!1456429 (= res!986916 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48104 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48104 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48104 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1456422 () Bool)

(assert (=> b!1456422 (= e!819430 true)))

(declare-fun lt!638306 () Bool)

(assert (=> b!1456422 (= lt!638306 e!819429)))

(declare-fun c!134268 () Bool)

(assert (=> b!1456422 (= c!134268 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun res!986911 () Bool)

(assert (=> start!125084 (=> (not res!986911) (not e!819425))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125084 (= res!986911 (validMask!0 mask!2687))))

(assert (=> start!125084 e!819425))

(assert (=> start!125084 true))

(declare-fun array_inv!36582 (array!98532) Bool)

(assert (=> start!125084 (array_inv!36582 a!2862)))

(declare-fun b!1456430 () Bool)

(declare-fun res!986909 () Bool)

(assert (=> b!1456430 (=> res!986909 e!819430)))

(assert (=> b!1456430 (= res!986909 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638307 (select (arr!47554 a!2862) j!93) a!2862 mask!2687) lt!638308)))))

(declare-fun b!1456431 () Bool)

(assert (=> b!1456431 (= e!819425 e!819426)))

(declare-fun res!986905 () Bool)

(assert (=> b!1456431 (=> (not res!986905) (not e!819426))))

(assert (=> b!1456431 (= res!986905 (= (select (store (arr!47554 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1456431 (= lt!638313 (array!98533 (store (arr!47554 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48104 a!2862)))))

(declare-fun b!1456432 () Bool)

(declare-fun res!986904 () Bool)

(assert (=> b!1456432 (=> (not res!986904) (not e!819425))))

(declare-datatypes ((List!34055 0))(
  ( (Nil!34052) (Cons!34051 (h!35401 (_ BitVec 64)) (t!48749 List!34055)) )
))
(declare-fun arrayNoDuplicates!0 (array!98532 (_ BitVec 32) List!34055) Bool)

(assert (=> b!1456432 (= res!986904 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34052))))

(declare-fun b!1456433 () Bool)

(assert (=> b!1456433 (= e!819422 (not e!819431))))

(declare-fun res!986910 () Bool)

(assert (=> b!1456433 (=> res!986910 e!819431)))

(assert (=> b!1456433 (= res!986910 (or (and (= (select (arr!47554 a!2862) index!646) (select (store (arr!47554 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47554 a!2862) index!646) (select (arr!47554 a!2862) j!93))) (= (select (arr!47554 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1456433 e!819423))

(declare-fun res!986907 () Bool)

(assert (=> b!1456433 (=> (not res!986907) (not e!819423))))

(assert (=> b!1456433 (= res!986907 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49108 0))(
  ( (Unit!49109) )
))
(declare-fun lt!638312 () Unit!49108)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98532 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49108)

(assert (=> b!1456433 (= lt!638312 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1456434 () Bool)

(declare-fun res!986914 () Bool)

(assert (=> b!1456434 (=> (not res!986914) (not e!819422))))

(assert (=> b!1456434 (= res!986914 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1456435 () Bool)

(declare-fun res!986919 () Bool)

(assert (=> b!1456435 (=> (not res!986919) (not e!819428))))

(assert (=> b!1456435 (= res!986919 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47554 a!2862) j!93) a!2862 mask!2687) lt!638308))))

(declare-fun b!1456436 () Bool)

(assert (=> b!1456436 (= e!819429 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638307 intermediateAfterIndex!19 lt!638309 lt!638313 mask!2687) lt!638311)))))

(declare-fun b!1456437 () Bool)

(declare-fun res!986915 () Bool)

(assert (=> b!1456437 (=> (not res!986915) (not e!819425))))

(assert (=> b!1456437 (= res!986915 (validKeyInArray!0 (select (arr!47554 a!2862) i!1006)))))

(assert (= (and start!125084 res!986911) b!1456419))

(assert (= (and b!1456419 res!986906) b!1456437))

(assert (= (and b!1456437 res!986915) b!1456425))

(assert (= (and b!1456425 res!986912) b!1456418))

(assert (= (and b!1456418 res!986903) b!1456432))

(assert (= (and b!1456432 res!986904) b!1456429))

(assert (= (and b!1456429 res!986916) b!1456431))

(assert (= (and b!1456431 res!986905) b!1456417))

(assert (= (and b!1456417 res!986917) b!1456435))

(assert (= (and b!1456435 res!986919) b!1456427))

(assert (= (and b!1456427 res!986918) b!1456424))

(assert (= (and b!1456424 c!134267) b!1456421))

(assert (= (and b!1456424 (not c!134267)) b!1456423))

(assert (= (and b!1456424 res!986908) b!1456434))

(assert (= (and b!1456434 res!986914) b!1456433))

(assert (= (and b!1456433 res!986907) b!1456416))

(assert (= (and b!1456416 res!986920) b!1456426))

(assert (= (and b!1456433 (not res!986910)) b!1456428))

(assert (= (and b!1456428 (not res!986913)) b!1456430))

(assert (= (and b!1456430 (not res!986909)) b!1456422))

(assert (= (and b!1456422 c!134268) b!1456420))

(assert (= (and b!1456422 (not c!134268)) b!1456436))

(declare-fun m!1344519 () Bool)

(assert (=> b!1456421 m!1344519))

(declare-fun m!1344521 () Bool)

(assert (=> b!1456427 m!1344521))

(assert (=> b!1456427 m!1344521))

(declare-fun m!1344523 () Bool)

(assert (=> b!1456427 m!1344523))

(declare-fun m!1344525 () Bool)

(assert (=> b!1456427 m!1344525))

(declare-fun m!1344527 () Bool)

(assert (=> b!1456427 m!1344527))

(assert (=> b!1456431 m!1344525))

(declare-fun m!1344529 () Bool)

(assert (=> b!1456431 m!1344529))

(assert (=> b!1456426 m!1344525))

(declare-fun m!1344531 () Bool)

(assert (=> b!1456426 m!1344531))

(declare-fun m!1344533 () Bool)

(assert (=> b!1456426 m!1344533))

(declare-fun m!1344535 () Bool)

(assert (=> b!1456426 m!1344535))

(declare-fun m!1344537 () Bool)

(assert (=> b!1456426 m!1344537))

(declare-fun m!1344539 () Bool)

(assert (=> b!1456420 m!1344539))

(declare-fun m!1344541 () Bool)

(assert (=> b!1456428 m!1344541))

(declare-fun m!1344543 () Bool)

(assert (=> b!1456428 m!1344543))

(declare-fun m!1344545 () Bool)

(assert (=> b!1456428 m!1344545))

(declare-fun m!1344547 () Bool)

(assert (=> b!1456433 m!1344547))

(assert (=> b!1456433 m!1344525))

(assert (=> b!1456433 m!1344533))

(assert (=> b!1456433 m!1344535))

(declare-fun m!1344549 () Bool)

(assert (=> b!1456433 m!1344549))

(assert (=> b!1456433 m!1344537))

(declare-fun m!1344551 () Bool)

(assert (=> b!1456436 m!1344551))

(declare-fun m!1344553 () Bool)

(assert (=> start!125084 m!1344553))

(declare-fun m!1344555 () Bool)

(assert (=> start!125084 m!1344555))

(declare-fun m!1344557 () Bool)

(assert (=> b!1456418 m!1344557))

(assert (=> b!1456423 m!1344543))

(assert (=> b!1456423 m!1344545))

(assert (=> b!1456430 m!1344537))

(assert (=> b!1456430 m!1344537))

(declare-fun m!1344559 () Bool)

(assert (=> b!1456430 m!1344559))

(assert (=> b!1456416 m!1344537))

(assert (=> b!1456416 m!1344537))

(declare-fun m!1344561 () Bool)

(assert (=> b!1456416 m!1344561))

(declare-fun m!1344563 () Bool)

(assert (=> b!1456432 m!1344563))

(assert (=> b!1456435 m!1344537))

(assert (=> b!1456435 m!1344537))

(declare-fun m!1344565 () Bool)

(assert (=> b!1456435 m!1344565))

(declare-fun m!1344567 () Bool)

(assert (=> b!1456437 m!1344567))

(assert (=> b!1456437 m!1344567))

(declare-fun m!1344569 () Bool)

(assert (=> b!1456437 m!1344569))

(assert (=> b!1456417 m!1344537))

(assert (=> b!1456417 m!1344537))

(declare-fun m!1344571 () Bool)

(assert (=> b!1456417 m!1344571))

(assert (=> b!1456417 m!1344571))

(assert (=> b!1456417 m!1344537))

(declare-fun m!1344573 () Bool)

(assert (=> b!1456417 m!1344573))

(assert (=> b!1456425 m!1344537))

(assert (=> b!1456425 m!1344537))

(declare-fun m!1344575 () Bool)

(assert (=> b!1456425 m!1344575))

(push 1)

