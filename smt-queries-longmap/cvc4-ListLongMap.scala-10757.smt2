; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125772 () Bool)

(assert start!125772)

(declare-fun res!1000186 () Bool)

(declare-fun e!826308 () Bool)

(assert (=> start!125772 (=> (not res!1000186) (not e!826308))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125772 (= res!1000186 (validMask!0 mask!2687))))

(assert (=> start!125772 e!826308))

(assert (=> start!125772 true))

(declare-datatypes ((array!99084 0))(
  ( (array!99085 (arr!47828 (Array (_ BitVec 32) (_ BitVec 64))) (size!48380 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99084)

(declare-fun array_inv!37061 (array!99084) Bool)

(assert (=> start!125772 (array_inv!37061 a!2862)))

(declare-fun b!1472426 () Bool)

(declare-fun res!1000198 () Bool)

(assert (=> b!1472426 (=> (not res!1000198) (not e!826308))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1472426 (= res!1000198 (validKeyInArray!0 (select (arr!47828 a!2862) i!1006)))))

(declare-fun b!1472427 () Bool)

(declare-fun res!1000196 () Bool)

(declare-fun e!826314 () Bool)

(assert (=> b!1472427 (=> (not res!1000196) (not e!826314))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1472427 (= res!1000196 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1472428 () Bool)

(declare-fun res!1000195 () Bool)

(assert (=> b!1472428 (=> (not res!1000195) (not e!826308))))

(declare-datatypes ((List!34407 0))(
  ( (Nil!34404) (Cons!34403 (h!35759 (_ BitVec 64)) (t!49093 List!34407)) )
))
(declare-fun arrayNoDuplicates!0 (array!99084 (_ BitVec 32) List!34407) Bool)

(assert (=> b!1472428 (= res!1000195 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34404))))

(declare-fun b!1472429 () Bool)

(declare-fun e!826309 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!643392 () array!99084)

(declare-fun lt!643393 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!12093 0))(
  ( (MissingZero!12093 (index!50764 (_ BitVec 32))) (Found!12093 (index!50765 (_ BitVec 32))) (Intermediate!12093 (undefined!12905 Bool) (index!50766 (_ BitVec 32)) (x!132339 (_ BitVec 32))) (Undefined!12093) (MissingVacant!12093 (index!50767 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99084 (_ BitVec 32)) SeekEntryResult!12093)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99084 (_ BitVec 32)) SeekEntryResult!12093)

(assert (=> b!1472429 (= e!826309 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!643393 lt!643392 mask!2687) (seekEntryOrOpen!0 lt!643393 lt!643392 mask!2687)))))

(declare-fun b!1472430 () Bool)

(declare-fun res!1000193 () Bool)

(declare-fun e!826310 () Bool)

(assert (=> b!1472430 (=> (not res!1000193) (not e!826310))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun lt!643394 () SeekEntryResult!12093)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99084 (_ BitVec 32)) SeekEntryResult!12093)

(assert (=> b!1472430 (= res!1000193 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47828 a!2862) j!93) a!2862 mask!2687) lt!643394))))

(declare-fun b!1472431 () Bool)

(assert (=> b!1472431 (= e!826310 e!826314)))

(declare-fun res!1000197 () Bool)

(assert (=> b!1472431 (=> (not res!1000197) (not e!826314))))

(declare-fun lt!643391 () SeekEntryResult!12093)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1472431 (= res!1000197 (= lt!643391 (Intermediate!12093 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1472431 (= lt!643391 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643393 mask!2687) lt!643393 lt!643392 mask!2687))))

(assert (=> b!1472431 (= lt!643393 (select (store (arr!47828 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1472432 () Bool)

(declare-fun res!1000188 () Bool)

(assert (=> b!1472432 (=> (not res!1000188) (not e!826308))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99084 (_ BitVec 32)) Bool)

(assert (=> b!1472432 (= res!1000188 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1472433 () Bool)

(declare-fun res!1000189 () Bool)

(assert (=> b!1472433 (=> (not res!1000189) (not e!826308))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1472433 (= res!1000189 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48380 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48380 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48380 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1472434 () Bool)

(declare-fun e!826313 () Bool)

(assert (=> b!1472434 (= e!826313 e!826310)))

(declare-fun res!1000194 () Bool)

(assert (=> b!1472434 (=> (not res!1000194) (not e!826310))))

(assert (=> b!1472434 (= res!1000194 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47828 a!2862) j!93) mask!2687) (select (arr!47828 a!2862) j!93) a!2862 mask!2687) lt!643394))))

(assert (=> b!1472434 (= lt!643394 (Intermediate!12093 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1472435 () Bool)

(declare-fun res!1000191 () Bool)

(assert (=> b!1472435 (=> (not res!1000191) (not e!826314))))

(assert (=> b!1472435 (= res!1000191 e!826309)))

(declare-fun c!135637 () Bool)

(assert (=> b!1472435 (= c!135637 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1472436 () Bool)

(declare-fun e!826311 () Bool)

(assert (=> b!1472436 (= e!826311 (or (= (select (arr!47828 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47828 a!2862) intermediateBeforeIndex!19) (select (arr!47828 a!2862) j!93))))))

(declare-fun b!1472437 () Bool)

(assert (=> b!1472437 (= e!826309 (= lt!643391 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!643393 lt!643392 mask!2687)))))

(declare-fun b!1472438 () Bool)

(assert (=> b!1472438 (= e!826314 (not true))))

(assert (=> b!1472438 e!826311))

(declare-fun res!1000184 () Bool)

(assert (=> b!1472438 (=> (not res!1000184) (not e!826311))))

(assert (=> b!1472438 (= res!1000184 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49367 0))(
  ( (Unit!49368) )
))
(declare-fun lt!643395 () Unit!49367)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99084 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49367)

(assert (=> b!1472438 (= lt!643395 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1472439 () Bool)

(declare-fun res!1000185 () Bool)

(assert (=> b!1472439 (=> (not res!1000185) (not e!826308))))

(assert (=> b!1472439 (= res!1000185 (validKeyInArray!0 (select (arr!47828 a!2862) j!93)))))

(declare-fun b!1472440 () Bool)

(assert (=> b!1472440 (= e!826308 e!826313)))

(declare-fun res!1000192 () Bool)

(assert (=> b!1472440 (=> (not res!1000192) (not e!826313))))

(assert (=> b!1472440 (= res!1000192 (= (select (store (arr!47828 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1472440 (= lt!643392 (array!99085 (store (arr!47828 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48380 a!2862)))))

(declare-fun b!1472441 () Bool)

(declare-fun res!1000190 () Bool)

(assert (=> b!1472441 (=> (not res!1000190) (not e!826311))))

(assert (=> b!1472441 (= res!1000190 (= (seekEntryOrOpen!0 (select (arr!47828 a!2862) j!93) a!2862 mask!2687) (Found!12093 j!93)))))

(declare-fun b!1472442 () Bool)

(declare-fun res!1000187 () Bool)

(assert (=> b!1472442 (=> (not res!1000187) (not e!826308))))

(assert (=> b!1472442 (= res!1000187 (and (= (size!48380 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48380 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48380 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!125772 res!1000186) b!1472442))

(assert (= (and b!1472442 res!1000187) b!1472426))

(assert (= (and b!1472426 res!1000198) b!1472439))

(assert (= (and b!1472439 res!1000185) b!1472432))

(assert (= (and b!1472432 res!1000188) b!1472428))

(assert (= (and b!1472428 res!1000195) b!1472433))

(assert (= (and b!1472433 res!1000189) b!1472440))

(assert (= (and b!1472440 res!1000192) b!1472434))

(assert (= (and b!1472434 res!1000194) b!1472430))

(assert (= (and b!1472430 res!1000193) b!1472431))

(assert (= (and b!1472431 res!1000197) b!1472435))

(assert (= (and b!1472435 c!135637) b!1472437))

(assert (= (and b!1472435 (not c!135637)) b!1472429))

(assert (= (and b!1472435 res!1000191) b!1472427))

(assert (= (and b!1472427 res!1000196) b!1472438))

(assert (= (and b!1472438 res!1000184) b!1472441))

(assert (= (and b!1472441 res!1000190) b!1472436))

(declare-fun m!1358641 () Bool)

(assert (=> b!1472439 m!1358641))

(assert (=> b!1472439 m!1358641))

(declare-fun m!1358643 () Bool)

(assert (=> b!1472439 m!1358643))

(declare-fun m!1358645 () Bool)

(assert (=> b!1472428 m!1358645))

(declare-fun m!1358647 () Bool)

(assert (=> b!1472437 m!1358647))

(declare-fun m!1358649 () Bool)

(assert (=> b!1472429 m!1358649))

(declare-fun m!1358651 () Bool)

(assert (=> b!1472429 m!1358651))

(declare-fun m!1358653 () Bool)

(assert (=> b!1472438 m!1358653))

(declare-fun m!1358655 () Bool)

(assert (=> b!1472438 m!1358655))

(declare-fun m!1358657 () Bool)

(assert (=> b!1472440 m!1358657))

(declare-fun m!1358659 () Bool)

(assert (=> b!1472440 m!1358659))

(declare-fun m!1358661 () Bool)

(assert (=> b!1472431 m!1358661))

(assert (=> b!1472431 m!1358661))

(declare-fun m!1358663 () Bool)

(assert (=> b!1472431 m!1358663))

(assert (=> b!1472431 m!1358657))

(declare-fun m!1358665 () Bool)

(assert (=> b!1472431 m!1358665))

(declare-fun m!1358667 () Bool)

(assert (=> start!125772 m!1358667))

(declare-fun m!1358669 () Bool)

(assert (=> start!125772 m!1358669))

(declare-fun m!1358671 () Bool)

(assert (=> b!1472436 m!1358671))

(assert (=> b!1472436 m!1358641))

(assert (=> b!1472434 m!1358641))

(assert (=> b!1472434 m!1358641))

(declare-fun m!1358673 () Bool)

(assert (=> b!1472434 m!1358673))

(assert (=> b!1472434 m!1358673))

(assert (=> b!1472434 m!1358641))

(declare-fun m!1358675 () Bool)

(assert (=> b!1472434 m!1358675))

(assert (=> b!1472430 m!1358641))

(assert (=> b!1472430 m!1358641))

(declare-fun m!1358677 () Bool)

(assert (=> b!1472430 m!1358677))

(declare-fun m!1358679 () Bool)

(assert (=> b!1472426 m!1358679))

(assert (=> b!1472426 m!1358679))

(declare-fun m!1358681 () Bool)

(assert (=> b!1472426 m!1358681))

(assert (=> b!1472441 m!1358641))

(assert (=> b!1472441 m!1358641))

(declare-fun m!1358683 () Bool)

(assert (=> b!1472441 m!1358683))

(declare-fun m!1358685 () Bool)

(assert (=> b!1472432 m!1358685))

(push 1)

(assert (not b!1472438))

(assert (not b!1472437))

(assert (not b!1472431))

(assert (not start!125772))

(assert (not b!1472439))

(assert (not b!1472432))

(assert (not b!1472428))

(assert (not b!1472426))

(assert (not b!1472429))

(assert (not b!1472441))

(assert (not b!1472430))

(assert (not b!1472434))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

