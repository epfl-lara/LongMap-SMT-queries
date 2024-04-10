; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125028 () Bool)

(assert start!125028)

(declare-fun b!1454568 () Bool)

(declare-fun res!985408 () Bool)

(declare-fun e!818588 () Bool)

(assert (=> b!1454568 (=> (not res!985408) (not e!818588))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98476 0))(
  ( (array!98477 (arr!47526 (Array (_ BitVec 32) (_ BitVec 64))) (size!48076 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98476)

(assert (=> b!1454568 (= res!985408 (and (= (size!48076 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48076 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48076 a!2862)) (not (= i!1006 j!93))))))

(declare-fun e!818586 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1454569 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1454569 (= e!818586 (and (or (= (select (arr!47526 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47526 a!2862) intermediateBeforeIndex!19) (select (arr!47526 a!2862) j!93))) (let ((bdg!53074 (select (store (arr!47526 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47526 a!2862) index!646) bdg!53074) (= (select (arr!47526 a!2862) index!646) (select (arr!47526 a!2862) j!93))) (= (select (arr!47526 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53074 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1454570 () Bool)

(declare-fun e!818589 () Bool)

(declare-fun e!818587 () Bool)

(assert (=> b!1454570 (= e!818589 e!818587)))

(declare-fun res!985406 () Bool)

(assert (=> b!1454570 (=> (not res!985406) (not e!818587))))

(declare-datatypes ((SeekEntryResult!11778 0))(
  ( (MissingZero!11778 (index!49504 (_ BitVec 32))) (Found!11778 (index!49505 (_ BitVec 32))) (Intermediate!11778 (undefined!12590 Bool) (index!49506 (_ BitVec 32)) (x!131139 (_ BitVec 32))) (Undefined!11778) (MissingVacant!11778 (index!49507 (_ BitVec 32))) )
))
(declare-fun lt!637635 () SeekEntryResult!11778)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98476 (_ BitVec 32)) SeekEntryResult!11778)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1454570 (= res!985406 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47526 a!2862) j!93) mask!2687) (select (arr!47526 a!2862) j!93) a!2862 mask!2687) lt!637635))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1454570 (= lt!637635 (Intermediate!11778 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1454571 () Bool)

(declare-fun e!818584 () Bool)

(declare-fun e!818585 () Bool)

(assert (=> b!1454571 (= e!818584 e!818585)))

(declare-fun res!985398 () Bool)

(assert (=> b!1454571 (=> res!985398 e!818585)))

(declare-fun lt!637638 () (_ BitVec 32))

(assert (=> b!1454571 (= res!985398 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!637638 #b00000000000000000000000000000000) (bvsge lt!637638 (size!48076 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1454571 (= lt!637638 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun lt!637636 () (_ BitVec 64))

(declare-fun lt!637637 () array!98476)

(declare-fun lt!637639 () SeekEntryResult!11778)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98476 (_ BitVec 32)) SeekEntryResult!11778)

(assert (=> b!1454571 (= lt!637639 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637636 lt!637637 mask!2687))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98476 (_ BitVec 32)) SeekEntryResult!11778)

(assert (=> b!1454571 (= lt!637639 (seekEntryOrOpen!0 lt!637636 lt!637637 mask!2687))))

(declare-fun e!818583 () Bool)

(declare-fun b!1454572 () Bool)

(assert (=> b!1454572 (= e!818583 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637636 lt!637637 mask!2687) (seekEntryOrOpen!0 lt!637636 lt!637637 mask!2687)))))

(declare-fun b!1454573 () Bool)

(assert (=> b!1454573 (= e!818585 true)))

(declare-fun lt!637641 () Bool)

(declare-fun e!818582 () Bool)

(assert (=> b!1454573 (= lt!637641 e!818582)))

(declare-fun c!134100 () Bool)

(assert (=> b!1454573 (= c!134100 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1454574 () Bool)

(declare-fun res!985400 () Bool)

(assert (=> b!1454574 (=> (not res!985400) (not e!818588))))

(assert (=> b!1454574 (= res!985400 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48076 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48076 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48076 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1454575 () Bool)

(declare-fun e!818591 () Bool)

(assert (=> b!1454575 (= e!818591 (not e!818584))))

(declare-fun res!985403 () Bool)

(assert (=> b!1454575 (=> res!985403 e!818584)))

(assert (=> b!1454575 (= res!985403 (or (and (= (select (arr!47526 a!2862) index!646) (select (store (arr!47526 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47526 a!2862) index!646) (select (arr!47526 a!2862) j!93))) (= (select (arr!47526 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1454575 e!818586))

(declare-fun res!985405 () Bool)

(assert (=> b!1454575 (=> (not res!985405) (not e!818586))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98476 (_ BitVec 32)) Bool)

(assert (=> b!1454575 (= res!985405 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49052 0))(
  ( (Unit!49053) )
))
(declare-fun lt!637640 () Unit!49052)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98476 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49052)

(assert (=> b!1454575 (= lt!637640 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1454577 () Bool)

(declare-fun res!985393 () Bool)

(assert (=> b!1454577 (=> res!985393 e!818585)))

(assert (=> b!1454577 (= res!985393 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637638 (select (arr!47526 a!2862) j!93) a!2862 mask!2687) lt!637635)))))

(declare-fun b!1454578 () Bool)

(declare-fun res!985391 () Bool)

(assert (=> b!1454578 (=> (not res!985391) (not e!818588))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1454578 (= res!985391 (validKeyInArray!0 (select (arr!47526 a!2862) i!1006)))))

(declare-fun b!1454579 () Bool)

(declare-fun res!985397 () Bool)

(assert (=> b!1454579 (=> (not res!985397) (not e!818587))))

(assert (=> b!1454579 (= res!985397 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47526 a!2862) j!93) a!2862 mask!2687) lt!637635))))

(declare-fun b!1454580 () Bool)

(declare-fun res!985392 () Bool)

(assert (=> b!1454580 (=> (not res!985392) (not e!818588))))

(assert (=> b!1454580 (= res!985392 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1454581 () Bool)

(assert (=> b!1454581 (= e!818582 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637638 intermediateAfterIndex!19 lt!637636 lt!637637 mask!2687) lt!637639)))))

(declare-fun b!1454582 () Bool)

(assert (=> b!1454582 (= e!818588 e!818589)))

(declare-fun res!985404 () Bool)

(assert (=> b!1454582 (=> (not res!985404) (not e!818589))))

(assert (=> b!1454582 (= res!985404 (= (select (store (arr!47526 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1454582 (= lt!637637 (array!98477 (store (arr!47526 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48076 a!2862)))))

(declare-fun lt!637634 () SeekEntryResult!11778)

(declare-fun b!1454583 () Bool)

(assert (=> b!1454583 (= e!818583 (= lt!637634 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!637636 lt!637637 mask!2687)))))

(declare-fun b!1454584 () Bool)

(declare-fun res!985401 () Bool)

(assert (=> b!1454584 (=> (not res!985401) (not e!818591))))

(assert (=> b!1454584 (= res!985401 e!818583)))

(declare-fun c!134099 () Bool)

(assert (=> b!1454584 (= c!134099 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1454585 () Bool)

(declare-fun res!985395 () Bool)

(assert (=> b!1454585 (=> (not res!985395) (not e!818588))))

(assert (=> b!1454585 (= res!985395 (validKeyInArray!0 (select (arr!47526 a!2862) j!93)))))

(declare-fun b!1454586 () Bool)

(assert (=> b!1454586 (= e!818587 e!818591)))

(declare-fun res!985402 () Bool)

(assert (=> b!1454586 (=> (not res!985402) (not e!818591))))

(assert (=> b!1454586 (= res!985402 (= lt!637634 (Intermediate!11778 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1454586 (= lt!637634 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!637636 mask!2687) lt!637636 lt!637637 mask!2687))))

(assert (=> b!1454586 (= lt!637636 (select (store (arr!47526 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1454576 () Bool)

(declare-fun res!985396 () Bool)

(assert (=> b!1454576 (=> (not res!985396) (not e!818586))))

(assert (=> b!1454576 (= res!985396 (= (seekEntryOrOpen!0 (select (arr!47526 a!2862) j!93) a!2862 mask!2687) (Found!11778 j!93)))))

(declare-fun res!985407 () Bool)

(assert (=> start!125028 (=> (not res!985407) (not e!818588))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125028 (= res!985407 (validMask!0 mask!2687))))

(assert (=> start!125028 e!818588))

(assert (=> start!125028 true))

(declare-fun array_inv!36554 (array!98476) Bool)

(assert (=> start!125028 (array_inv!36554 a!2862)))

(declare-fun b!1454587 () Bool)

(declare-fun res!985399 () Bool)

(assert (=> b!1454587 (=> (not res!985399) (not e!818588))))

(declare-datatypes ((List!34027 0))(
  ( (Nil!34024) (Cons!34023 (h!35373 (_ BitVec 64)) (t!48721 List!34027)) )
))
(declare-fun arrayNoDuplicates!0 (array!98476 (_ BitVec 32) List!34027) Bool)

(assert (=> b!1454587 (= res!985399 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34024))))

(declare-fun b!1454588 () Bool)

(declare-fun res!985394 () Bool)

(assert (=> b!1454588 (=> (not res!985394) (not e!818591))))

(assert (=> b!1454588 (= res!985394 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1454589 () Bool)

(assert (=> b!1454589 (= e!818582 (not (= lt!637634 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637638 lt!637636 lt!637637 mask!2687))))))

(assert (= (and start!125028 res!985407) b!1454568))

(assert (= (and b!1454568 res!985408) b!1454578))

(assert (= (and b!1454578 res!985391) b!1454585))

(assert (= (and b!1454585 res!985395) b!1454580))

(assert (= (and b!1454580 res!985392) b!1454587))

(assert (= (and b!1454587 res!985399) b!1454574))

(assert (= (and b!1454574 res!985400) b!1454582))

(assert (= (and b!1454582 res!985404) b!1454570))

(assert (= (and b!1454570 res!985406) b!1454579))

(assert (= (and b!1454579 res!985397) b!1454586))

(assert (= (and b!1454586 res!985402) b!1454584))

(assert (= (and b!1454584 c!134099) b!1454583))

(assert (= (and b!1454584 (not c!134099)) b!1454572))

(assert (= (and b!1454584 res!985401) b!1454588))

(assert (= (and b!1454588 res!985394) b!1454575))

(assert (= (and b!1454575 res!985405) b!1454576))

(assert (= (and b!1454576 res!985396) b!1454569))

(assert (= (and b!1454575 (not res!985403)) b!1454571))

(assert (= (and b!1454571 (not res!985398)) b!1454577))

(assert (= (and b!1454577 (not res!985393)) b!1454573))

(assert (= (and b!1454573 c!134100) b!1454589))

(assert (= (and b!1454573 (not c!134100)) b!1454581))

(declare-fun m!1342895 () Bool)

(assert (=> b!1454575 m!1342895))

(declare-fun m!1342897 () Bool)

(assert (=> b!1454575 m!1342897))

(declare-fun m!1342899 () Bool)

(assert (=> b!1454575 m!1342899))

(declare-fun m!1342901 () Bool)

(assert (=> b!1454575 m!1342901))

(declare-fun m!1342903 () Bool)

(assert (=> b!1454575 m!1342903))

(declare-fun m!1342905 () Bool)

(assert (=> b!1454575 m!1342905))

(assert (=> b!1454582 m!1342897))

(declare-fun m!1342907 () Bool)

(assert (=> b!1454582 m!1342907))

(declare-fun m!1342909 () Bool)

(assert (=> b!1454571 m!1342909))

(declare-fun m!1342911 () Bool)

(assert (=> b!1454571 m!1342911))

(declare-fun m!1342913 () Bool)

(assert (=> b!1454571 m!1342913))

(assert (=> b!1454570 m!1342905))

(assert (=> b!1454570 m!1342905))

(declare-fun m!1342915 () Bool)

(assert (=> b!1454570 m!1342915))

(assert (=> b!1454570 m!1342915))

(assert (=> b!1454570 m!1342905))

(declare-fun m!1342917 () Bool)

(assert (=> b!1454570 m!1342917))

(assert (=> b!1454572 m!1342911))

(assert (=> b!1454572 m!1342913))

(declare-fun m!1342919 () Bool)

(assert (=> b!1454587 m!1342919))

(declare-fun m!1342921 () Bool)

(assert (=> start!125028 m!1342921))

(declare-fun m!1342923 () Bool)

(assert (=> start!125028 m!1342923))

(declare-fun m!1342925 () Bool)

(assert (=> b!1454578 m!1342925))

(assert (=> b!1454578 m!1342925))

(declare-fun m!1342927 () Bool)

(assert (=> b!1454578 m!1342927))

(declare-fun m!1342929 () Bool)

(assert (=> b!1454583 m!1342929))

(assert (=> b!1454569 m!1342897))

(declare-fun m!1342931 () Bool)

(assert (=> b!1454569 m!1342931))

(assert (=> b!1454569 m!1342899))

(assert (=> b!1454569 m!1342901))

(assert (=> b!1454569 m!1342905))

(declare-fun m!1342933 () Bool)

(assert (=> b!1454586 m!1342933))

(assert (=> b!1454586 m!1342933))

(declare-fun m!1342935 () Bool)

(assert (=> b!1454586 m!1342935))

(assert (=> b!1454586 m!1342897))

(declare-fun m!1342937 () Bool)

(assert (=> b!1454586 m!1342937))

(assert (=> b!1454579 m!1342905))

(assert (=> b!1454579 m!1342905))

(declare-fun m!1342939 () Bool)

(assert (=> b!1454579 m!1342939))

(assert (=> b!1454576 m!1342905))

(assert (=> b!1454576 m!1342905))

(declare-fun m!1342941 () Bool)

(assert (=> b!1454576 m!1342941))

(declare-fun m!1342943 () Bool)

(assert (=> b!1454589 m!1342943))

(declare-fun m!1342945 () Bool)

(assert (=> b!1454580 m!1342945))

(assert (=> b!1454577 m!1342905))

(assert (=> b!1454577 m!1342905))

(declare-fun m!1342947 () Bool)

(assert (=> b!1454577 m!1342947))

(assert (=> b!1454585 m!1342905))

(assert (=> b!1454585 m!1342905))

(declare-fun m!1342949 () Bool)

(assert (=> b!1454585 m!1342949))

(declare-fun m!1342951 () Bool)

(assert (=> b!1454581 m!1342951))

(check-sat (not b!1454577) (not b!1454571) (not b!1454580) (not b!1454578) (not b!1454586) (not b!1454581) (not b!1454575) (not b!1454572) (not b!1454583) (not b!1454589) (not b!1454587) (not start!125028) (not b!1454576) (not b!1454579) (not b!1454570) (not b!1454585))
(check-sat)
