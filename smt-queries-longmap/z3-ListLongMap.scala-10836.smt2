; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126812 () Bool)

(assert start!126812)

(declare-fun lt!649508 () (_ BitVec 64))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!834789 () Bool)

(declare-datatypes ((array!99583 0))(
  ( (array!99584 (arr!48064 (Array (_ BitVec 32) (_ BitVec 64))) (size!48616 (_ BitVec 32))) )
))
(declare-fun lt!649500 () array!99583)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1489689 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12329 0))(
  ( (MissingZero!12329 (index!51708 (_ BitVec 32))) (Found!12329 (index!51709 (_ BitVec 32))) (Intermediate!12329 (undefined!13141 Bool) (index!51710 (_ BitVec 32)) (x!133298 (_ BitVec 32))) (Undefined!12329) (MissingVacant!12329 (index!51711 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99583 (_ BitVec 32)) SeekEntryResult!12329)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99583 (_ BitVec 32)) SeekEntryResult!12329)

(assert (=> b!1489689 (= e!834789 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649508 lt!649500 mask!2687) (seekEntryOrOpen!0 lt!649508 lt!649500 mask!2687)))))

(declare-fun b!1489690 () Bool)

(declare-fun res!1013261 () Bool)

(declare-fun e!834791 () Bool)

(assert (=> b!1489690 (=> (not res!1013261) (not e!834791))))

(declare-fun a!2862 () array!99583)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1489690 (= res!1013261 (validKeyInArray!0 (select (arr!48064 a!2862) j!93)))))

(declare-fun b!1489691 () Bool)

(declare-fun res!1013259 () Bool)

(assert (=> b!1489691 (=> (not res!1013259) (not e!834791))))

(declare-datatypes ((List!34643 0))(
  ( (Nil!34640) (Cons!34639 (h!36022 (_ BitVec 64)) (t!49329 List!34643)) )
))
(declare-fun arrayNoDuplicates!0 (array!99583 (_ BitVec 32) List!34643) Bool)

(assert (=> b!1489691 (= res!1013259 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34640))))

(declare-fun b!1489692 () Bool)

(declare-fun res!1013248 () Bool)

(assert (=> b!1489692 (=> (not res!1013248) (not e!834791))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99583 (_ BitVec 32)) Bool)

(assert (=> b!1489692 (= res!1013248 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1489693 () Bool)

(declare-fun lt!649505 () SeekEntryResult!12329)

(declare-fun lt!649502 () (_ BitVec 32))

(declare-fun e!834790 () Bool)

(assert (=> b!1489693 (= e!834790 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649502 intermediateAfterIndex!19 lt!649508 lt!649500 mask!2687) lt!649505)))))

(declare-fun b!1489694 () Bool)

(declare-fun res!1013246 () Bool)

(assert (=> b!1489694 (=> (not res!1013246) (not e!834791))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1489694 (= res!1013246 (and (= (size!48616 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48616 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48616 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1489695 () Bool)

(declare-fun lt!649501 () SeekEntryResult!12329)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99583 (_ BitVec 32)) SeekEntryResult!12329)

(assert (=> b!1489695 (= e!834790 (not (= lt!649501 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649502 lt!649508 lt!649500 mask!2687))))))

(declare-fun b!1489697 () Bool)

(declare-fun res!1013258 () Bool)

(declare-fun e!834794 () Bool)

(assert (=> b!1489697 (=> res!1013258 e!834794)))

(declare-fun lt!649507 () SeekEntryResult!12329)

(assert (=> b!1489697 (= res!1013258 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649502 (select (arr!48064 a!2862) j!93) a!2862 mask!2687) lt!649507)))))

(declare-fun b!1489698 () Bool)

(assert (=> b!1489698 (= e!834794 true)))

(declare-fun lt!649503 () SeekEntryResult!12329)

(assert (=> b!1489698 (= lt!649503 lt!649505)))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-datatypes ((Unit!49839 0))(
  ( (Unit!49840) )
))
(declare-fun lt!649506 () Unit!49839)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!99583 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49839)

(assert (=> b!1489698 (= lt!649506 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!649502 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1489699 () Bool)

(declare-fun e!834797 () Bool)

(declare-fun e!834792 () Bool)

(assert (=> b!1489699 (= e!834797 e!834792)))

(declare-fun res!1013247 () Bool)

(assert (=> b!1489699 (=> (not res!1013247) (not e!834792))))

(assert (=> b!1489699 (= res!1013247 (= lt!649501 (Intermediate!12329 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1489699 (= lt!649501 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!649508 mask!2687) lt!649508 lt!649500 mask!2687))))

(assert (=> b!1489699 (= lt!649508 (select (store (arr!48064 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1489700 () Bool)

(declare-fun res!1013260 () Bool)

(assert (=> b!1489700 (=> (not res!1013260) (not e!834791))))

(assert (=> b!1489700 (= res!1013260 (validKeyInArray!0 (select (arr!48064 a!2862) i!1006)))))

(declare-fun b!1489701 () Bool)

(declare-fun res!1013252 () Bool)

(assert (=> b!1489701 (=> res!1013252 e!834794)))

(assert (=> b!1489701 (= res!1013252 e!834790)))

(declare-fun c!137751 () Bool)

(assert (=> b!1489701 (= c!137751 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1489702 () Bool)

(declare-fun e!834796 () Bool)

(assert (=> b!1489702 (= e!834796 e!834797)))

(declare-fun res!1013255 () Bool)

(assert (=> b!1489702 (=> (not res!1013255) (not e!834797))))

(assert (=> b!1489702 (= res!1013255 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48064 a!2862) j!93) mask!2687) (select (arr!48064 a!2862) j!93) a!2862 mask!2687) lt!649507))))

(assert (=> b!1489702 (= lt!649507 (Intermediate!12329 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1489703 () Bool)

(declare-fun e!834793 () Bool)

(assert (=> b!1489703 (= e!834792 (not e!834793))))

(declare-fun res!1013263 () Bool)

(assert (=> b!1489703 (=> res!1013263 e!834793)))

(assert (=> b!1489703 (= res!1013263 (or (and (= (select (arr!48064 a!2862) index!646) (select (store (arr!48064 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48064 a!2862) index!646) (select (arr!48064 a!2862) j!93))) (= (select (arr!48064 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1489703 (and (= lt!649503 (Found!12329 j!93)) (or (= (select (arr!48064 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48064 a!2862) intermediateBeforeIndex!19) (select (arr!48064 a!2862) j!93))) (let ((bdg!54770 (select (store (arr!48064 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!48064 a!2862) index!646) bdg!54770) (= (select (arr!48064 a!2862) index!646) (select (arr!48064 a!2862) j!93))) (= (select (arr!48064 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!54770 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!1489703 (= lt!649503 (seekEntryOrOpen!0 (select (arr!48064 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1489703 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!649504 () Unit!49839)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99583 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49839)

(assert (=> b!1489703 (= lt!649504 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1489704 () Bool)

(declare-fun res!1013262 () Bool)

(assert (=> b!1489704 (=> (not res!1013262) (not e!834797))))

(assert (=> b!1489704 (= res!1013262 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48064 a!2862) j!93) a!2862 mask!2687) lt!649507))))

(declare-fun b!1489705 () Bool)

(declare-fun res!1013257 () Bool)

(assert (=> b!1489705 (=> (not res!1013257) (not e!834791))))

(assert (=> b!1489705 (= res!1013257 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48616 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48616 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48616 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1489706 () Bool)

(assert (=> b!1489706 (= e!834789 (= lt!649501 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!649508 lt!649500 mask!2687)))))

(declare-fun b!1489707 () Bool)

(declare-fun res!1013251 () Bool)

(assert (=> b!1489707 (=> res!1013251 e!834794)))

(assert (=> b!1489707 (= res!1013251 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1489708 () Bool)

(assert (=> b!1489708 (= e!834791 e!834796)))

(declare-fun res!1013254 () Bool)

(assert (=> b!1489708 (=> (not res!1013254) (not e!834796))))

(assert (=> b!1489708 (= res!1013254 (= (select (store (arr!48064 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1489708 (= lt!649500 (array!99584 (store (arr!48064 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48616 a!2862)))))

(declare-fun b!1489709 () Bool)

(assert (=> b!1489709 (= e!834793 e!834794)))

(declare-fun res!1013253 () Bool)

(assert (=> b!1489709 (=> res!1013253 e!834794)))

(assert (=> b!1489709 (= res!1013253 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!649502 #b00000000000000000000000000000000) (bvsge lt!649502 (size!48616 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1489709 (= lt!649502 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1489709 (= lt!649505 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649508 lt!649500 mask!2687))))

(assert (=> b!1489709 (= lt!649505 (seekEntryOrOpen!0 lt!649508 lt!649500 mask!2687))))

(declare-fun b!1489710 () Bool)

(declare-fun res!1013249 () Bool)

(assert (=> b!1489710 (=> (not res!1013249) (not e!834792))))

(assert (=> b!1489710 (= res!1013249 e!834789)))

(declare-fun c!137752 () Bool)

(assert (=> b!1489710 (= c!137752 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1489696 () Bool)

(declare-fun res!1013256 () Bool)

(assert (=> b!1489696 (=> (not res!1013256) (not e!834792))))

(assert (=> b!1489696 (= res!1013256 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun res!1013250 () Bool)

(assert (=> start!126812 (=> (not res!1013250) (not e!834791))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126812 (= res!1013250 (validMask!0 mask!2687))))

(assert (=> start!126812 e!834791))

(assert (=> start!126812 true))

(declare-fun array_inv!37297 (array!99583) Bool)

(assert (=> start!126812 (array_inv!37297 a!2862)))

(assert (= (and start!126812 res!1013250) b!1489694))

(assert (= (and b!1489694 res!1013246) b!1489700))

(assert (= (and b!1489700 res!1013260) b!1489690))

(assert (= (and b!1489690 res!1013261) b!1489692))

(assert (= (and b!1489692 res!1013248) b!1489691))

(assert (= (and b!1489691 res!1013259) b!1489705))

(assert (= (and b!1489705 res!1013257) b!1489708))

(assert (= (and b!1489708 res!1013254) b!1489702))

(assert (= (and b!1489702 res!1013255) b!1489704))

(assert (= (and b!1489704 res!1013262) b!1489699))

(assert (= (and b!1489699 res!1013247) b!1489710))

(assert (= (and b!1489710 c!137752) b!1489706))

(assert (= (and b!1489710 (not c!137752)) b!1489689))

(assert (= (and b!1489710 res!1013249) b!1489696))

(assert (= (and b!1489696 res!1013256) b!1489703))

(assert (= (and b!1489703 (not res!1013263)) b!1489709))

(assert (= (and b!1489709 (not res!1013253)) b!1489697))

(assert (= (and b!1489697 (not res!1013258)) b!1489701))

(assert (= (and b!1489701 c!137751) b!1489695))

(assert (= (and b!1489701 (not c!137751)) b!1489693))

(assert (= (and b!1489701 (not res!1013252)) b!1489707))

(assert (= (and b!1489707 (not res!1013251)) b!1489698))

(declare-fun m!1373331 () Bool)

(assert (=> b!1489695 m!1373331))

(declare-fun m!1373333 () Bool)

(assert (=> b!1489703 m!1373333))

(declare-fun m!1373335 () Bool)

(assert (=> b!1489703 m!1373335))

(declare-fun m!1373337 () Bool)

(assert (=> b!1489703 m!1373337))

(declare-fun m!1373339 () Bool)

(assert (=> b!1489703 m!1373339))

(declare-fun m!1373341 () Bool)

(assert (=> b!1489703 m!1373341))

(declare-fun m!1373343 () Bool)

(assert (=> b!1489703 m!1373343))

(declare-fun m!1373345 () Bool)

(assert (=> b!1489703 m!1373345))

(declare-fun m!1373347 () Bool)

(assert (=> b!1489703 m!1373347))

(assert (=> b!1489703 m!1373343))

(assert (=> b!1489704 m!1373343))

(assert (=> b!1489704 m!1373343))

(declare-fun m!1373349 () Bool)

(assert (=> b!1489704 m!1373349))

(declare-fun m!1373351 () Bool)

(assert (=> b!1489698 m!1373351))

(declare-fun m!1373353 () Bool)

(assert (=> b!1489692 m!1373353))

(declare-fun m!1373355 () Bool)

(assert (=> b!1489709 m!1373355))

(declare-fun m!1373357 () Bool)

(assert (=> b!1489709 m!1373357))

(declare-fun m!1373359 () Bool)

(assert (=> b!1489709 m!1373359))

(declare-fun m!1373361 () Bool)

(assert (=> b!1489691 m!1373361))

(assert (=> b!1489690 m!1373343))

(assert (=> b!1489690 m!1373343))

(declare-fun m!1373363 () Bool)

(assert (=> b!1489690 m!1373363))

(declare-fun m!1373365 () Bool)

(assert (=> b!1489700 m!1373365))

(assert (=> b!1489700 m!1373365))

(declare-fun m!1373367 () Bool)

(assert (=> b!1489700 m!1373367))

(declare-fun m!1373369 () Bool)

(assert (=> b!1489706 m!1373369))

(assert (=> b!1489689 m!1373357))

(assert (=> b!1489689 m!1373359))

(assert (=> b!1489697 m!1373343))

(assert (=> b!1489697 m!1373343))

(declare-fun m!1373371 () Bool)

(assert (=> b!1489697 m!1373371))

(declare-fun m!1373373 () Bool)

(assert (=> b!1489699 m!1373373))

(assert (=> b!1489699 m!1373373))

(declare-fun m!1373375 () Bool)

(assert (=> b!1489699 m!1373375))

(assert (=> b!1489699 m!1373335))

(declare-fun m!1373377 () Bool)

(assert (=> b!1489699 m!1373377))

(assert (=> b!1489702 m!1373343))

(assert (=> b!1489702 m!1373343))

(declare-fun m!1373379 () Bool)

(assert (=> b!1489702 m!1373379))

(assert (=> b!1489702 m!1373379))

(assert (=> b!1489702 m!1373343))

(declare-fun m!1373381 () Bool)

(assert (=> b!1489702 m!1373381))

(declare-fun m!1373383 () Bool)

(assert (=> b!1489693 m!1373383))

(assert (=> b!1489708 m!1373335))

(declare-fun m!1373385 () Bool)

(assert (=> b!1489708 m!1373385))

(declare-fun m!1373387 () Bool)

(assert (=> start!126812 m!1373387))

(declare-fun m!1373389 () Bool)

(assert (=> start!126812 m!1373389))

(check-sat (not b!1489709) (not b!1489692) (not b!1489695) (not b!1489690) (not b!1489704) (not b!1489702) (not b!1489693) (not b!1489691) (not b!1489689) (not b!1489706) (not b!1489699) (not b!1489697) (not b!1489700) (not b!1489703) (not b!1489698) (not start!126812))
(check-sat)
