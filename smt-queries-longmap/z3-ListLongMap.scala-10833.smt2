; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126846 () Bool)

(assert start!126846)

(declare-fun b!1489530 () Bool)

(declare-fun e!834809 () Bool)

(declare-fun e!834806 () Bool)

(assert (=> b!1489530 (= e!834809 e!834806)))

(declare-fun res!1012966 () Bool)

(assert (=> b!1489530 (=> res!1012966 e!834806)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!649592 () (_ BitVec 32))

(declare-datatypes ((array!99619 0))(
  ( (array!99620 (arr!48081 (Array (_ BitVec 32) (_ BitVec 64))) (size!48631 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99619)

(assert (=> b!1489530 (= res!1012966 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!649592 #b00000000000000000000000000000000) (bvsge lt!649592 (size!48631 a!2862))))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1489530 (= lt!649592 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-datatypes ((SeekEntryResult!12321 0))(
  ( (MissingZero!12321 (index!51676 (_ BitVec 32))) (Found!12321 (index!51677 (_ BitVec 32))) (Intermediate!12321 (undefined!13133 Bool) (index!51678 (_ BitVec 32)) (x!133273 (_ BitVec 32))) (Undefined!12321) (MissingVacant!12321 (index!51679 (_ BitVec 32))) )
))
(declare-fun lt!649589 () SeekEntryResult!12321)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun lt!649588 () array!99619)

(declare-fun lt!649596 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99619 (_ BitVec 32)) SeekEntryResult!12321)

(assert (=> b!1489530 (= lt!649589 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649596 lt!649588 mask!2687))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99619 (_ BitVec 32)) SeekEntryResult!12321)

(assert (=> b!1489530 (= lt!649589 (seekEntryOrOpen!0 lt!649596 lt!649588 mask!2687))))

(declare-fun b!1489531 () Bool)

(declare-fun res!1012969 () Bool)

(declare-fun e!834807 () Bool)

(assert (=> b!1489531 (=> (not res!1012969) (not e!834807))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1489531 (= res!1012969 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1489532 () Bool)

(assert (=> b!1489532 (= e!834806 true)))

(declare-fun lt!649594 () SeekEntryResult!12321)

(assert (=> b!1489532 (= lt!649594 lt!649589)))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((Unit!49982 0))(
  ( (Unit!49983) )
))
(declare-fun lt!649591 () Unit!49982)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!99619 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49982)

(assert (=> b!1489532 (= lt!649591 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!649592 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1489533 () Bool)

(declare-fun res!1012960 () Bool)

(assert (=> b!1489533 (=> (not res!1012960) (not e!834807))))

(declare-fun e!834801 () Bool)

(assert (=> b!1489533 (= res!1012960 e!834801)))

(declare-fun c!137814 () Bool)

(assert (=> b!1489533 (= c!137814 (bvsle x!665 intermediateAfterX!19))))

(declare-fun lt!649593 () SeekEntryResult!12321)

(declare-fun b!1489534 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99619 (_ BitVec 32)) SeekEntryResult!12321)

(assert (=> b!1489534 (= e!834801 (= lt!649593 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!649596 lt!649588 mask!2687)))))

(declare-fun b!1489535 () Bool)

(declare-fun e!834804 () Bool)

(declare-fun e!834802 () Bool)

(assert (=> b!1489535 (= e!834804 e!834802)))

(declare-fun res!1012967 () Bool)

(assert (=> b!1489535 (=> (not res!1012967) (not e!834802))))

(assert (=> b!1489535 (= res!1012967 (= (select (store (arr!48081 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1489535 (= lt!649588 (array!99620 (store (arr!48081 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48631 a!2862)))))

(declare-fun b!1489536 () Bool)

(declare-fun res!1012973 () Bool)

(assert (=> b!1489536 (=> res!1012973 e!834806)))

(declare-fun e!834803 () Bool)

(assert (=> b!1489536 (= res!1012973 e!834803)))

(declare-fun c!137813 () Bool)

(assert (=> b!1489536 (= c!137813 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1489537 () Bool)

(declare-fun res!1012965 () Bool)

(assert (=> b!1489537 (=> (not res!1012965) (not e!834804))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1489537 (= res!1012965 (validKeyInArray!0 (select (arr!48081 a!2862) i!1006)))))

(declare-fun b!1489538 () Bool)

(declare-fun res!1012961 () Bool)

(assert (=> b!1489538 (=> res!1012961 e!834806)))

(declare-fun lt!649595 () SeekEntryResult!12321)

(assert (=> b!1489538 (= res!1012961 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649592 (select (arr!48081 a!2862) j!93) a!2862 mask!2687) lt!649595)))))

(declare-fun b!1489539 () Bool)

(declare-fun res!1012975 () Bool)

(assert (=> b!1489539 (=> (not res!1012975) (not e!834804))))

(assert (=> b!1489539 (= res!1012975 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48631 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48631 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48631 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1489540 () Bool)

(declare-fun res!1012970 () Bool)

(assert (=> b!1489540 (=> (not res!1012970) (not e!834804))))

(declare-datatypes ((List!34582 0))(
  ( (Nil!34579) (Cons!34578 (h!35961 (_ BitVec 64)) (t!49276 List!34582)) )
))
(declare-fun arrayNoDuplicates!0 (array!99619 (_ BitVec 32) List!34582) Bool)

(assert (=> b!1489540 (= res!1012970 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34579))))

(declare-fun b!1489542 () Bool)

(declare-fun res!1012963 () Bool)

(assert (=> b!1489542 (=> (not res!1012963) (not e!834804))))

(assert (=> b!1489542 (= res!1012963 (and (= (size!48631 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48631 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48631 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1489543 () Bool)

(declare-fun res!1012968 () Bool)

(declare-fun e!834808 () Bool)

(assert (=> b!1489543 (=> (not res!1012968) (not e!834808))))

(assert (=> b!1489543 (= res!1012968 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48081 a!2862) j!93) a!2862 mask!2687) lt!649595))))

(declare-fun b!1489544 () Bool)

(declare-fun res!1012971 () Bool)

(assert (=> b!1489544 (=> res!1012971 e!834806)))

(assert (=> b!1489544 (= res!1012971 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1489545 () Bool)

(assert (=> b!1489545 (= e!834808 e!834807)))

(declare-fun res!1012962 () Bool)

(assert (=> b!1489545 (=> (not res!1012962) (not e!834807))))

(assert (=> b!1489545 (= res!1012962 (= lt!649593 (Intermediate!12321 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1489545 (= lt!649593 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!649596 mask!2687) lt!649596 lt!649588 mask!2687))))

(assert (=> b!1489545 (= lt!649596 (select (store (arr!48081 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1489546 () Bool)

(assert (=> b!1489546 (= e!834803 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649592 intermediateAfterIndex!19 lt!649596 lt!649588 mask!2687) lt!649589)))))

(declare-fun b!1489547 () Bool)

(assert (=> b!1489547 (= e!834807 (not e!834809))))

(declare-fun res!1012974 () Bool)

(assert (=> b!1489547 (=> res!1012974 e!834809)))

(assert (=> b!1489547 (= res!1012974 (or (and (= (select (arr!48081 a!2862) index!646) (select (store (arr!48081 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48081 a!2862) index!646) (select (arr!48081 a!2862) j!93))) (= (select (arr!48081 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1489547 (and (= lt!649594 (Found!12321 j!93)) (or (= (select (arr!48081 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48081 a!2862) intermediateBeforeIndex!19) (select (arr!48081 a!2862) j!93))) (let ((bdg!54724 (select (store (arr!48081 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!48081 a!2862) index!646) bdg!54724) (= (select (arr!48081 a!2862) index!646) (select (arr!48081 a!2862) j!93))) (= (select (arr!48081 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!54724 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!1489547 (= lt!649594 (seekEntryOrOpen!0 (select (arr!48081 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99619 (_ BitVec 32)) Bool)

(assert (=> b!1489547 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!649590 () Unit!49982)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99619 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49982)

(assert (=> b!1489547 (= lt!649590 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1489548 () Bool)

(declare-fun res!1012964 () Bool)

(assert (=> b!1489548 (=> (not res!1012964) (not e!834804))))

(assert (=> b!1489548 (= res!1012964 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1489549 () Bool)

(assert (=> b!1489549 (= e!834801 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649596 lt!649588 mask!2687) (seekEntryOrOpen!0 lt!649596 lt!649588 mask!2687)))))

(declare-fun b!1489550 () Bool)

(declare-fun res!1012958 () Bool)

(assert (=> b!1489550 (=> (not res!1012958) (not e!834804))))

(assert (=> b!1489550 (= res!1012958 (validKeyInArray!0 (select (arr!48081 a!2862) j!93)))))

(declare-fun b!1489551 () Bool)

(assert (=> b!1489551 (= e!834803 (not (= lt!649593 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649592 lt!649596 lt!649588 mask!2687))))))

(declare-fun b!1489541 () Bool)

(assert (=> b!1489541 (= e!834802 e!834808)))

(declare-fun res!1012959 () Bool)

(assert (=> b!1489541 (=> (not res!1012959) (not e!834808))))

(assert (=> b!1489541 (= res!1012959 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48081 a!2862) j!93) mask!2687) (select (arr!48081 a!2862) j!93) a!2862 mask!2687) lt!649595))))

(assert (=> b!1489541 (= lt!649595 (Intermediate!12321 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!1012972 () Bool)

(assert (=> start!126846 (=> (not res!1012972) (not e!834804))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126846 (= res!1012972 (validMask!0 mask!2687))))

(assert (=> start!126846 e!834804))

(assert (=> start!126846 true))

(declare-fun array_inv!37109 (array!99619) Bool)

(assert (=> start!126846 (array_inv!37109 a!2862)))

(assert (= (and start!126846 res!1012972) b!1489542))

(assert (= (and b!1489542 res!1012963) b!1489537))

(assert (= (and b!1489537 res!1012965) b!1489550))

(assert (= (and b!1489550 res!1012958) b!1489548))

(assert (= (and b!1489548 res!1012964) b!1489540))

(assert (= (and b!1489540 res!1012970) b!1489539))

(assert (= (and b!1489539 res!1012975) b!1489535))

(assert (= (and b!1489535 res!1012967) b!1489541))

(assert (= (and b!1489541 res!1012959) b!1489543))

(assert (= (and b!1489543 res!1012968) b!1489545))

(assert (= (and b!1489545 res!1012962) b!1489533))

(assert (= (and b!1489533 c!137814) b!1489534))

(assert (= (and b!1489533 (not c!137814)) b!1489549))

(assert (= (and b!1489533 res!1012960) b!1489531))

(assert (= (and b!1489531 res!1012969) b!1489547))

(assert (= (and b!1489547 (not res!1012974)) b!1489530))

(assert (= (and b!1489530 (not res!1012966)) b!1489538))

(assert (= (and b!1489538 (not res!1012961)) b!1489536))

(assert (= (and b!1489536 c!137813) b!1489551))

(assert (= (and b!1489536 (not c!137813)) b!1489546))

(assert (= (and b!1489536 (not res!1012973)) b!1489544))

(assert (= (and b!1489544 (not res!1012971)) b!1489532))

(declare-fun m!1373755 () Bool)

(assert (=> b!1489541 m!1373755))

(assert (=> b!1489541 m!1373755))

(declare-fun m!1373757 () Bool)

(assert (=> b!1489541 m!1373757))

(assert (=> b!1489541 m!1373757))

(assert (=> b!1489541 m!1373755))

(declare-fun m!1373759 () Bool)

(assert (=> b!1489541 m!1373759))

(declare-fun m!1373761 () Bool)

(assert (=> b!1489545 m!1373761))

(assert (=> b!1489545 m!1373761))

(declare-fun m!1373763 () Bool)

(assert (=> b!1489545 m!1373763))

(declare-fun m!1373765 () Bool)

(assert (=> b!1489545 m!1373765))

(declare-fun m!1373767 () Bool)

(assert (=> b!1489545 m!1373767))

(declare-fun m!1373769 () Bool)

(assert (=> b!1489534 m!1373769))

(assert (=> b!1489535 m!1373765))

(declare-fun m!1373771 () Bool)

(assert (=> b!1489535 m!1373771))

(assert (=> b!1489538 m!1373755))

(assert (=> b!1489538 m!1373755))

(declare-fun m!1373773 () Bool)

(assert (=> b!1489538 m!1373773))

(declare-fun m!1373775 () Bool)

(assert (=> b!1489537 m!1373775))

(assert (=> b!1489537 m!1373775))

(declare-fun m!1373777 () Bool)

(assert (=> b!1489537 m!1373777))

(declare-fun m!1373779 () Bool)

(assert (=> start!126846 m!1373779))

(declare-fun m!1373781 () Bool)

(assert (=> start!126846 m!1373781))

(declare-fun m!1373783 () Bool)

(assert (=> b!1489532 m!1373783))

(declare-fun m!1373785 () Bool)

(assert (=> b!1489548 m!1373785))

(declare-fun m!1373787 () Bool)

(assert (=> b!1489551 m!1373787))

(declare-fun m!1373789 () Bool)

(assert (=> b!1489530 m!1373789))

(declare-fun m!1373791 () Bool)

(assert (=> b!1489530 m!1373791))

(declare-fun m!1373793 () Bool)

(assert (=> b!1489530 m!1373793))

(assert (=> b!1489543 m!1373755))

(assert (=> b!1489543 m!1373755))

(declare-fun m!1373795 () Bool)

(assert (=> b!1489543 m!1373795))

(assert (=> b!1489550 m!1373755))

(assert (=> b!1489550 m!1373755))

(declare-fun m!1373797 () Bool)

(assert (=> b!1489550 m!1373797))

(declare-fun m!1373799 () Bool)

(assert (=> b!1489547 m!1373799))

(assert (=> b!1489547 m!1373765))

(declare-fun m!1373801 () Bool)

(assert (=> b!1489547 m!1373801))

(declare-fun m!1373803 () Bool)

(assert (=> b!1489547 m!1373803))

(declare-fun m!1373805 () Bool)

(assert (=> b!1489547 m!1373805))

(assert (=> b!1489547 m!1373755))

(declare-fun m!1373807 () Bool)

(assert (=> b!1489547 m!1373807))

(declare-fun m!1373809 () Bool)

(assert (=> b!1489547 m!1373809))

(assert (=> b!1489547 m!1373755))

(assert (=> b!1489549 m!1373791))

(assert (=> b!1489549 m!1373793))

(declare-fun m!1373811 () Bool)

(assert (=> b!1489546 m!1373811))

(declare-fun m!1373813 () Bool)

(assert (=> b!1489540 m!1373813))

(check-sat (not b!1489538) (not b!1489530) (not b!1489547) (not b!1489534) (not b!1489546) (not b!1489532) (not b!1489540) (not b!1489545) (not b!1489549) (not start!126846) (not b!1489550) (not b!1489551) (not b!1489537) (not b!1489541) (not b!1489543) (not b!1489548))
(check-sat)
