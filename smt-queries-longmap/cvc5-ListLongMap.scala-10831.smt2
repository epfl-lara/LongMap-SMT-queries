; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126832 () Bool)

(assert start!126832)

(declare-fun b!1489061 () Bool)

(declare-fun res!1012584 () Bool)

(declare-fun e!834609 () Bool)

(assert (=> b!1489061 (=> (not res!1012584) (not e!834609))))

(declare-datatypes ((array!99605 0))(
  ( (array!99606 (arr!48074 (Array (_ BitVec 32) (_ BitVec 64))) (size!48624 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99605)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12314 0))(
  ( (MissingZero!12314 (index!51648 (_ BitVec 32))) (Found!12314 (index!51649 (_ BitVec 32))) (Intermediate!12314 (undefined!13126 Bool) (index!51650 (_ BitVec 32)) (x!133250 (_ BitVec 32))) (Undefined!12314) (MissingVacant!12314 (index!51651 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99605 (_ BitVec 32)) SeekEntryResult!12314)

(assert (=> b!1489061 (= res!1012584 (= (seekEntryOrOpen!0 (select (arr!48074 a!2862) j!93) a!2862 mask!2687) (Found!12314 j!93)))))

(declare-fun lt!649415 () array!99605)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!834614 () Bool)

(declare-fun b!1489062 () Bool)

(declare-fun lt!649418 () (_ BitVec 32))

(declare-fun lt!649416 () (_ BitVec 64))

(declare-fun lt!649419 () SeekEntryResult!12314)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99605 (_ BitVec 32)) SeekEntryResult!12314)

(assert (=> b!1489062 (= e!834614 (not (= lt!649419 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649418 lt!649416 lt!649415 mask!2687))))))

(declare-fun b!1489063 () Bool)

(declare-fun res!1012588 () Bool)

(declare-fun e!834607 () Bool)

(assert (=> b!1489063 (=> (not res!1012588) (not e!834607))))

(declare-datatypes ((List!34575 0))(
  ( (Nil!34572) (Cons!34571 (h!35954 (_ BitVec 64)) (t!49269 List!34575)) )
))
(declare-fun arrayNoDuplicates!0 (array!99605 (_ BitVec 32) List!34575) Bool)

(assert (=> b!1489063 (= res!1012588 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34572))))

(declare-fun b!1489065 () Bool)

(declare-fun res!1012579 () Bool)

(assert (=> b!1489065 (=> (not res!1012579) (not e!834607))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1489065 (= res!1012579 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48624 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48624 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48624 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1489066 () Bool)

(declare-fun e!834610 () Bool)

(declare-fun e!834611 () Bool)

(assert (=> b!1489066 (= e!834610 e!834611)))

(declare-fun res!1012589 () Bool)

(assert (=> b!1489066 (=> res!1012589 e!834611)))

(assert (=> b!1489066 (= res!1012589 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!649418 #b00000000000000000000000000000000) (bvsge lt!649418 (size!48624 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1489066 (= lt!649418 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun lt!649413 () SeekEntryResult!12314)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99605 (_ BitVec 32)) SeekEntryResult!12314)

(assert (=> b!1489066 (= lt!649413 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649416 lt!649415 mask!2687))))

(assert (=> b!1489066 (= lt!649413 (seekEntryOrOpen!0 lt!649416 lt!649415 mask!2687))))

(declare-fun b!1489067 () Bool)

(declare-fun res!1012586 () Bool)

(assert (=> b!1489067 (=> res!1012586 e!834611)))

(assert (=> b!1489067 (= res!1012586 e!834614)))

(declare-fun c!137772 () Bool)

(assert (=> b!1489067 (= c!137772 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1489068 () Bool)

(assert (=> b!1489068 (= e!834611 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19) (bvslt (bvsub #b01111111111111111111111111111110 (bvadd #b00000000000000000000000000000001 x!665)) (bvsub #b01111111111111111111111111111110 x!665))))))

(declare-fun b!1489069 () Bool)

(declare-fun res!1012575 () Bool)

(assert (=> b!1489069 (=> (not res!1012575) (not e!834607))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1489069 (= res!1012575 (validKeyInArray!0 (select (arr!48074 a!2862) i!1006)))))

(declare-fun e!834605 () Bool)

(declare-fun b!1489070 () Bool)

(assert (=> b!1489070 (= e!834605 (= lt!649419 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!649416 lt!649415 mask!2687)))))

(declare-fun b!1489071 () Bool)

(declare-fun e!834606 () Bool)

(declare-fun e!834613 () Bool)

(assert (=> b!1489071 (= e!834606 e!834613)))

(declare-fun res!1012583 () Bool)

(assert (=> b!1489071 (=> (not res!1012583) (not e!834613))))

(assert (=> b!1489071 (= res!1012583 (= lt!649419 (Intermediate!12314 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1489071 (= lt!649419 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!649416 mask!2687) lt!649416 lt!649415 mask!2687))))

(assert (=> b!1489071 (= lt!649416 (select (store (arr!48074 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1489072 () Bool)

(assert (=> b!1489072 (= e!834614 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649418 intermediateAfterIndex!19 lt!649416 lt!649415 mask!2687) lt!649413)))))

(declare-fun b!1489073 () Bool)

(declare-fun e!834608 () Bool)

(assert (=> b!1489073 (= e!834607 e!834608)))

(declare-fun res!1012573 () Bool)

(assert (=> b!1489073 (=> (not res!1012573) (not e!834608))))

(assert (=> b!1489073 (= res!1012573 (= (select (store (arr!48074 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1489073 (= lt!649415 (array!99606 (store (arr!48074 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48624 a!2862)))))

(declare-fun res!1012581 () Bool)

(assert (=> start!126832 (=> (not res!1012581) (not e!834607))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126832 (= res!1012581 (validMask!0 mask!2687))))

(assert (=> start!126832 e!834607))

(assert (=> start!126832 true))

(declare-fun array_inv!37102 (array!99605) Bool)

(assert (=> start!126832 (array_inv!37102 a!2862)))

(declare-fun b!1489064 () Bool)

(declare-fun res!1012577 () Bool)

(assert (=> b!1489064 (=> res!1012577 e!834611)))

(declare-fun lt!649414 () SeekEntryResult!12314)

(assert (=> b!1489064 (= res!1012577 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649418 (select (arr!48074 a!2862) j!93) a!2862 mask!2687) lt!649414)))))

(declare-fun b!1489074 () Bool)

(assert (=> b!1489074 (= e!834609 (and (or (= (select (arr!48074 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48074 a!2862) intermediateBeforeIndex!19) (select (arr!48074 a!2862) j!93))) (let ((bdg!54688 (select (store (arr!48074 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!48074 a!2862) index!646) bdg!54688) (= (select (arr!48074 a!2862) index!646) (select (arr!48074 a!2862) j!93))) (= (select (arr!48074 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!54688 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1489075 () Bool)

(assert (=> b!1489075 (= e!834608 e!834606)))

(declare-fun res!1012578 () Bool)

(assert (=> b!1489075 (=> (not res!1012578) (not e!834606))))

(assert (=> b!1489075 (= res!1012578 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48074 a!2862) j!93) mask!2687) (select (arr!48074 a!2862) j!93) a!2862 mask!2687) lt!649414))))

(assert (=> b!1489075 (= lt!649414 (Intermediate!12314 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1489076 () Bool)

(declare-fun res!1012587 () Bool)

(assert (=> b!1489076 (=> (not res!1012587) (not e!834613))))

(assert (=> b!1489076 (= res!1012587 e!834605)))

(declare-fun c!137771 () Bool)

(assert (=> b!1489076 (= c!137771 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1489077 () Bool)

(assert (=> b!1489077 (= e!834605 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649416 lt!649415 mask!2687) (seekEntryOrOpen!0 lt!649416 lt!649415 mask!2687)))))

(declare-fun b!1489078 () Bool)

(declare-fun res!1012591 () Bool)

(assert (=> b!1489078 (=> (not res!1012591) (not e!834607))))

(assert (=> b!1489078 (= res!1012591 (and (= (size!48624 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48624 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48624 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1489079 () Bool)

(assert (=> b!1489079 (= e!834613 (not e!834610))))

(declare-fun res!1012590 () Bool)

(assert (=> b!1489079 (=> res!1012590 e!834610)))

(assert (=> b!1489079 (= res!1012590 (or (and (= (select (arr!48074 a!2862) index!646) (select (store (arr!48074 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48074 a!2862) index!646) (select (arr!48074 a!2862) j!93))) (= (select (arr!48074 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1489079 e!834609))

(declare-fun res!1012585 () Bool)

(assert (=> b!1489079 (=> (not res!1012585) (not e!834609))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99605 (_ BitVec 32)) Bool)

(assert (=> b!1489079 (= res!1012585 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49968 0))(
  ( (Unit!49969) )
))
(declare-fun lt!649417 () Unit!49968)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99605 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49968)

(assert (=> b!1489079 (= lt!649417 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1489080 () Bool)

(declare-fun res!1012576 () Bool)

(assert (=> b!1489080 (=> (not res!1012576) (not e!834607))))

(assert (=> b!1489080 (= res!1012576 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1489081 () Bool)

(declare-fun res!1012582 () Bool)

(assert (=> b!1489081 (=> (not res!1012582) (not e!834607))))

(assert (=> b!1489081 (= res!1012582 (validKeyInArray!0 (select (arr!48074 a!2862) j!93)))))

(declare-fun b!1489082 () Bool)

(declare-fun res!1012580 () Bool)

(assert (=> b!1489082 (=> (not res!1012580) (not e!834606))))

(assert (=> b!1489082 (= res!1012580 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48074 a!2862) j!93) a!2862 mask!2687) lt!649414))))

(declare-fun b!1489083 () Bool)

(declare-fun res!1012574 () Bool)

(assert (=> b!1489083 (=> (not res!1012574) (not e!834613))))

(assert (=> b!1489083 (= res!1012574 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(assert (= (and start!126832 res!1012581) b!1489078))

(assert (= (and b!1489078 res!1012591) b!1489069))

(assert (= (and b!1489069 res!1012575) b!1489081))

(assert (= (and b!1489081 res!1012582) b!1489080))

(assert (= (and b!1489080 res!1012576) b!1489063))

(assert (= (and b!1489063 res!1012588) b!1489065))

(assert (= (and b!1489065 res!1012579) b!1489073))

(assert (= (and b!1489073 res!1012573) b!1489075))

(assert (= (and b!1489075 res!1012578) b!1489082))

(assert (= (and b!1489082 res!1012580) b!1489071))

(assert (= (and b!1489071 res!1012583) b!1489076))

(assert (= (and b!1489076 c!137771) b!1489070))

(assert (= (and b!1489076 (not c!137771)) b!1489077))

(assert (= (and b!1489076 res!1012587) b!1489083))

(assert (= (and b!1489083 res!1012574) b!1489079))

(assert (= (and b!1489079 res!1012585) b!1489061))

(assert (= (and b!1489061 res!1012584) b!1489074))

(assert (= (and b!1489079 (not res!1012590)) b!1489066))

(assert (= (and b!1489066 (not res!1012589)) b!1489064))

(assert (= (and b!1489064 (not res!1012577)) b!1489067))

(assert (= (and b!1489067 c!137772) b!1489062))

(assert (= (and b!1489067 (not c!137772)) b!1489072))

(assert (= (and b!1489067 (not res!1012586)) b!1489068))

(declare-fun m!1373341 () Bool)

(assert (=> b!1489077 m!1373341))

(declare-fun m!1373343 () Bool)

(assert (=> b!1489077 m!1373343))

(declare-fun m!1373345 () Bool)

(assert (=> b!1489082 m!1373345))

(assert (=> b!1489082 m!1373345))

(declare-fun m!1373347 () Bool)

(assert (=> b!1489082 m!1373347))

(declare-fun m!1373349 () Bool)

(assert (=> b!1489079 m!1373349))

(declare-fun m!1373351 () Bool)

(assert (=> b!1489079 m!1373351))

(declare-fun m!1373353 () Bool)

(assert (=> b!1489079 m!1373353))

(declare-fun m!1373355 () Bool)

(assert (=> b!1489079 m!1373355))

(declare-fun m!1373357 () Bool)

(assert (=> b!1489079 m!1373357))

(assert (=> b!1489079 m!1373345))

(declare-fun m!1373359 () Bool)

(assert (=> b!1489080 m!1373359))

(assert (=> b!1489074 m!1373351))

(declare-fun m!1373361 () Bool)

(assert (=> b!1489074 m!1373361))

(assert (=> b!1489074 m!1373353))

(assert (=> b!1489074 m!1373355))

(assert (=> b!1489074 m!1373345))

(assert (=> b!1489061 m!1373345))

(assert (=> b!1489061 m!1373345))

(declare-fun m!1373363 () Bool)

(assert (=> b!1489061 m!1373363))

(declare-fun m!1373365 () Bool)

(assert (=> b!1489069 m!1373365))

(assert (=> b!1489069 m!1373365))

(declare-fun m!1373367 () Bool)

(assert (=> b!1489069 m!1373367))

(assert (=> b!1489064 m!1373345))

(assert (=> b!1489064 m!1373345))

(declare-fun m!1373369 () Bool)

(assert (=> b!1489064 m!1373369))

(declare-fun m!1373371 () Bool)

(assert (=> start!126832 m!1373371))

(declare-fun m!1373373 () Bool)

(assert (=> start!126832 m!1373373))

(declare-fun m!1373375 () Bool)

(assert (=> b!1489071 m!1373375))

(assert (=> b!1489071 m!1373375))

(declare-fun m!1373377 () Bool)

(assert (=> b!1489071 m!1373377))

(assert (=> b!1489071 m!1373351))

(declare-fun m!1373379 () Bool)

(assert (=> b!1489071 m!1373379))

(declare-fun m!1373381 () Bool)

(assert (=> b!1489072 m!1373381))

(declare-fun m!1373383 () Bool)

(assert (=> b!1489070 m!1373383))

(declare-fun m!1373385 () Bool)

(assert (=> b!1489066 m!1373385))

(assert (=> b!1489066 m!1373341))

(assert (=> b!1489066 m!1373343))

(declare-fun m!1373387 () Bool)

(assert (=> b!1489062 m!1373387))

(assert (=> b!1489073 m!1373351))

(declare-fun m!1373389 () Bool)

(assert (=> b!1489073 m!1373389))

(declare-fun m!1373391 () Bool)

(assert (=> b!1489063 m!1373391))

(assert (=> b!1489075 m!1373345))

(assert (=> b!1489075 m!1373345))

(declare-fun m!1373393 () Bool)

(assert (=> b!1489075 m!1373393))

(assert (=> b!1489075 m!1373393))

(assert (=> b!1489075 m!1373345))

(declare-fun m!1373395 () Bool)

(assert (=> b!1489075 m!1373395))

(assert (=> b!1489081 m!1373345))

(assert (=> b!1489081 m!1373345))

(declare-fun m!1373397 () Bool)

(assert (=> b!1489081 m!1373397))

(push 1)

(assert (not start!126832))

(assert (not b!1489063))

(assert (not b!1489081))

(assert (not b!1489066))

(assert (not b!1489062))

(assert (not b!1489061))

(assert (not b!1489072))

(assert (not b!1489064))

(assert (not b!1489079))

(assert (not b!1489080))

(assert (not b!1489075))

(assert (not b!1489070))

(assert (not b!1489071))

(assert (not b!1489077))

(assert (not b!1489069))

(assert (not b!1489082))

(check-sat)

(pop 1)

(push 1)

(check-sat)

