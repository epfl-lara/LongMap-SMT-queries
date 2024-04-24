; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123410 () Bool)

(assert start!123410)

(declare-fun b!1429731 () Bool)

(declare-fun res!963680 () Bool)

(declare-fun e!807551 () Bool)

(assert (=> b!1429731 (=> (not res!963680) (not e!807551))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97493 0))(
  ( (array!97494 (arr!47056 (Array (_ BitVec 32) (_ BitVec 64))) (size!47607 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97493)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1429731 (= res!963680 (and (= (size!47607 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47607 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47607 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1429732 () Bool)

(declare-fun res!963686 () Bool)

(assert (=> b!1429732 (=> (not res!963686) (not e!807551))))

(declare-datatypes ((List!33553 0))(
  ( (Nil!33550) (Cons!33549 (h!34871 (_ BitVec 64)) (t!48239 List!33553)) )
))
(declare-fun arrayNoDuplicates!0 (array!97493 (_ BitVec 32) List!33553) Bool)

(assert (=> b!1429732 (= res!963686 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33550))))

(declare-fun b!1429733 () Bool)

(declare-fun e!807550 () Bool)

(declare-fun e!807552 () Bool)

(assert (=> b!1429733 (= e!807550 e!807552)))

(declare-fun res!963679 () Bool)

(assert (=> b!1429733 (=> (not res!963679) (not e!807552))))

(declare-fun lt!629439 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11237 0))(
  ( (MissingZero!11237 (index!47340 (_ BitVec 32))) (Found!11237 (index!47341 (_ BitVec 32))) (Intermediate!11237 (undefined!12049 Bool) (index!47342 (_ BitVec 32)) (x!129138 (_ BitVec 32))) (Undefined!11237) (MissingVacant!11237 (index!47343 (_ BitVec 32))) )
))
(declare-fun lt!629440 () SeekEntryResult!11237)

(declare-fun lt!629437 () array!97493)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97493 (_ BitVec 32)) SeekEntryResult!11237)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1429733 (= res!963679 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!629439 mask!2608) lt!629439 lt!629437 mask!2608) lt!629440))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1429733 (= lt!629440 (Intermediate!11237 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1429733 (= lt!629439 (select (store (arr!47056 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1429733 (= lt!629437 (array!97494 (store (arr!47056 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47607 a!2831)))))

(declare-fun b!1429734 () Bool)

(declare-fun res!963688 () Bool)

(assert (=> b!1429734 (=> (not res!963688) (not e!807552))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1429734 (= res!963688 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!629439 lt!629437 mask!2608) lt!629440))))

(declare-fun b!1429735 () Bool)

(declare-fun res!963685 () Bool)

(assert (=> b!1429735 (=> (not res!963685) (not e!807552))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1429735 (= res!963685 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1429736 () Bool)

(declare-fun res!963681 () Bool)

(assert (=> b!1429736 (=> (not res!963681) (not e!807551))))

(assert (=> b!1429736 (= res!963681 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47607 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47607 a!2831))))))

(declare-fun b!1429737 () Bool)

(declare-fun res!963678 () Bool)

(assert (=> b!1429737 (=> (not res!963678) (not e!807552))))

(declare-fun lt!629441 () SeekEntryResult!11237)

(assert (=> b!1429737 (= res!963678 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47056 a!2831) j!81) a!2831 mask!2608) lt!629441))))

(declare-fun res!963684 () Bool)

(assert (=> start!123410 (=> (not res!963684) (not e!807551))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123410 (= res!963684 (validMask!0 mask!2608))))

(assert (=> start!123410 e!807551))

(assert (=> start!123410 true))

(declare-fun array_inv!36337 (array!97493) Bool)

(assert (=> start!123410 (array_inv!36337 a!2831)))

(declare-fun e!807554 () Bool)

(declare-fun b!1429738 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97493 (_ BitVec 32)) SeekEntryResult!11237)

(assert (=> b!1429738 (= e!807554 (= (seekEntryOrOpen!0 (select (arr!47056 a!2831) j!81) a!2831 mask!2608) (Found!11237 j!81)))))

(declare-fun b!1429739 () Bool)

(declare-fun res!963676 () Bool)

(assert (=> b!1429739 (=> (not res!963676) (not e!807551))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1429739 (= res!963676 (validKeyInArray!0 (select (arr!47056 a!2831) i!982)))))

(declare-fun b!1429740 () Bool)

(declare-fun res!963682 () Bool)

(assert (=> b!1429740 (=> (not res!963682) (not e!807551))))

(assert (=> b!1429740 (= res!963682 (validKeyInArray!0 (select (arr!47056 a!2831) j!81)))))

(declare-fun b!1429741 () Bool)

(assert (=> b!1429741 (= e!807551 e!807550)))

(declare-fun res!963683 () Bool)

(assert (=> b!1429741 (=> (not res!963683) (not e!807550))))

(assert (=> b!1429741 (= res!963683 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47056 a!2831) j!81) mask!2608) (select (arr!47056 a!2831) j!81) a!2831 mask!2608) lt!629441))))

(assert (=> b!1429741 (= lt!629441 (Intermediate!11237 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1429742 () Bool)

(assert (=> b!1429742 (= e!807552 (not (or (= (select (arr!47056 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47056 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (select (arr!47056 a!2831) index!585) (select (arr!47056 a!2831) j!81))))))))

(assert (=> b!1429742 e!807554))

(declare-fun res!963687 () Bool)

(assert (=> b!1429742 (=> (not res!963687) (not e!807554))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97493 (_ BitVec 32)) Bool)

(assert (=> b!1429742 (= res!963687 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48251 0))(
  ( (Unit!48252) )
))
(declare-fun lt!629438 () Unit!48251)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97493 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48251)

(assert (=> b!1429742 (= lt!629438 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1429743 () Bool)

(declare-fun res!963677 () Bool)

(assert (=> b!1429743 (=> (not res!963677) (not e!807551))))

(assert (=> b!1429743 (= res!963677 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(assert (= (and start!123410 res!963684) b!1429731))

(assert (= (and b!1429731 res!963680) b!1429739))

(assert (= (and b!1429739 res!963676) b!1429740))

(assert (= (and b!1429740 res!963682) b!1429743))

(assert (= (and b!1429743 res!963677) b!1429732))

(assert (= (and b!1429732 res!963686) b!1429736))

(assert (= (and b!1429736 res!963681) b!1429741))

(assert (= (and b!1429741 res!963683) b!1429733))

(assert (= (and b!1429733 res!963679) b!1429737))

(assert (= (and b!1429737 res!963678) b!1429734))

(assert (= (and b!1429734 res!963688) b!1429735))

(assert (= (and b!1429735 res!963685) b!1429742))

(assert (= (and b!1429742 res!963687) b!1429738))

(declare-fun m!1320087 () Bool)

(assert (=> start!123410 m!1320087))

(declare-fun m!1320089 () Bool)

(assert (=> start!123410 m!1320089))

(declare-fun m!1320091 () Bool)

(assert (=> b!1429732 m!1320091))

(declare-fun m!1320093 () Bool)

(assert (=> b!1429741 m!1320093))

(assert (=> b!1429741 m!1320093))

(declare-fun m!1320095 () Bool)

(assert (=> b!1429741 m!1320095))

(assert (=> b!1429741 m!1320095))

(assert (=> b!1429741 m!1320093))

(declare-fun m!1320097 () Bool)

(assert (=> b!1429741 m!1320097))

(assert (=> b!1429738 m!1320093))

(assert (=> b!1429738 m!1320093))

(declare-fun m!1320099 () Bool)

(assert (=> b!1429738 m!1320099))

(assert (=> b!1429740 m!1320093))

(assert (=> b!1429740 m!1320093))

(declare-fun m!1320101 () Bool)

(assert (=> b!1429740 m!1320101))

(assert (=> b!1429737 m!1320093))

(assert (=> b!1429737 m!1320093))

(declare-fun m!1320103 () Bool)

(assert (=> b!1429737 m!1320103))

(declare-fun m!1320105 () Bool)

(assert (=> b!1429734 m!1320105))

(declare-fun m!1320107 () Bool)

(assert (=> b!1429733 m!1320107))

(assert (=> b!1429733 m!1320107))

(declare-fun m!1320109 () Bool)

(assert (=> b!1429733 m!1320109))

(declare-fun m!1320111 () Bool)

(assert (=> b!1429733 m!1320111))

(declare-fun m!1320113 () Bool)

(assert (=> b!1429733 m!1320113))

(declare-fun m!1320115 () Bool)

(assert (=> b!1429743 m!1320115))

(declare-fun m!1320117 () Bool)

(assert (=> b!1429742 m!1320117))

(assert (=> b!1429742 m!1320093))

(declare-fun m!1320119 () Bool)

(assert (=> b!1429742 m!1320119))

(declare-fun m!1320121 () Bool)

(assert (=> b!1429742 m!1320121))

(declare-fun m!1320123 () Bool)

(assert (=> b!1429739 m!1320123))

(assert (=> b!1429739 m!1320123))

(declare-fun m!1320125 () Bool)

(assert (=> b!1429739 m!1320125))

(check-sat (not b!1429733) (not b!1429734) (not b!1429737) (not b!1429743) (not b!1429739) (not b!1429742) (not b!1429741) (not b!1429738) (not b!1429740) (not start!123410) (not b!1429732))
(check-sat)
(get-model)

(declare-fun b!1429834 () Bool)

(declare-fun e!807593 () SeekEntryResult!11237)

(assert (=> b!1429834 (= e!807593 Undefined!11237)))

(declare-fun b!1429835 () Bool)

(declare-fun e!807592 () SeekEntryResult!11237)

(declare-fun lt!629480 () SeekEntryResult!11237)

(assert (=> b!1429835 (= e!807592 (MissingZero!11237 (index!47342 lt!629480)))))

(declare-fun b!1429836 () Bool)

(declare-fun e!807591 () SeekEntryResult!11237)

(assert (=> b!1429836 (= e!807593 e!807591)))

(declare-fun lt!629479 () (_ BitVec 64))

(assert (=> b!1429836 (= lt!629479 (select (arr!47056 a!2831) (index!47342 lt!629480)))))

(declare-fun c!132534 () Bool)

(assert (=> b!1429836 (= c!132534 (= lt!629479 (select (arr!47056 a!2831) j!81)))))

(declare-fun d!153893 () Bool)

(declare-fun lt!629478 () SeekEntryResult!11237)

(get-info :version)

(assert (=> d!153893 (and (or ((_ is Undefined!11237) lt!629478) (not ((_ is Found!11237) lt!629478)) (and (bvsge (index!47341 lt!629478) #b00000000000000000000000000000000) (bvslt (index!47341 lt!629478) (size!47607 a!2831)))) (or ((_ is Undefined!11237) lt!629478) ((_ is Found!11237) lt!629478) (not ((_ is MissingZero!11237) lt!629478)) (and (bvsge (index!47340 lt!629478) #b00000000000000000000000000000000) (bvslt (index!47340 lt!629478) (size!47607 a!2831)))) (or ((_ is Undefined!11237) lt!629478) ((_ is Found!11237) lt!629478) ((_ is MissingZero!11237) lt!629478) (not ((_ is MissingVacant!11237) lt!629478)) (and (bvsge (index!47343 lt!629478) #b00000000000000000000000000000000) (bvslt (index!47343 lt!629478) (size!47607 a!2831)))) (or ((_ is Undefined!11237) lt!629478) (ite ((_ is Found!11237) lt!629478) (= (select (arr!47056 a!2831) (index!47341 lt!629478)) (select (arr!47056 a!2831) j!81)) (ite ((_ is MissingZero!11237) lt!629478) (= (select (arr!47056 a!2831) (index!47340 lt!629478)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!11237) lt!629478) (= (select (arr!47056 a!2831) (index!47343 lt!629478)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!153893 (= lt!629478 e!807593)))

(declare-fun c!132535 () Bool)

(assert (=> d!153893 (= c!132535 (and ((_ is Intermediate!11237) lt!629480) (undefined!12049 lt!629480)))))

(assert (=> d!153893 (= lt!629480 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47056 a!2831) j!81) mask!2608) (select (arr!47056 a!2831) j!81) a!2831 mask!2608))))

(assert (=> d!153893 (validMask!0 mask!2608)))

(assert (=> d!153893 (= (seekEntryOrOpen!0 (select (arr!47056 a!2831) j!81) a!2831 mask!2608) lt!629478)))

(declare-fun b!1429837 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97493 (_ BitVec 32)) SeekEntryResult!11237)

(assert (=> b!1429837 (= e!807592 (seekKeyOrZeroReturnVacant!0 (x!129138 lt!629480) (index!47342 lt!629480) (index!47342 lt!629480) (select (arr!47056 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1429838 () Bool)

(assert (=> b!1429838 (= e!807591 (Found!11237 (index!47342 lt!629480)))))

(declare-fun b!1429839 () Bool)

(declare-fun c!132533 () Bool)

(assert (=> b!1429839 (= c!132533 (= lt!629479 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1429839 (= e!807591 e!807592)))

(assert (= (and d!153893 c!132535) b!1429834))

(assert (= (and d!153893 (not c!132535)) b!1429836))

(assert (= (and b!1429836 c!132534) b!1429838))

(assert (= (and b!1429836 (not c!132534)) b!1429839))

(assert (= (and b!1429839 c!132533) b!1429835))

(assert (= (and b!1429839 (not c!132533)) b!1429837))

(declare-fun m!1320207 () Bool)

(assert (=> b!1429836 m!1320207))

(assert (=> d!153893 m!1320093))

(assert (=> d!153893 m!1320095))

(declare-fun m!1320209 () Bool)

(assert (=> d!153893 m!1320209))

(declare-fun m!1320211 () Bool)

(assert (=> d!153893 m!1320211))

(assert (=> d!153893 m!1320095))

(assert (=> d!153893 m!1320093))

(assert (=> d!153893 m!1320097))

(assert (=> d!153893 m!1320087))

(declare-fun m!1320213 () Bool)

(assert (=> d!153893 m!1320213))

(assert (=> b!1429837 m!1320093))

(declare-fun m!1320215 () Bool)

(assert (=> b!1429837 m!1320215))

(assert (=> b!1429738 d!153893))

(declare-fun b!1429882 () Bool)

(declare-fun lt!629504 () SeekEntryResult!11237)

(assert (=> b!1429882 (and (bvsge (index!47342 lt!629504) #b00000000000000000000000000000000) (bvslt (index!47342 lt!629504) (size!47607 lt!629437)))))

(declare-fun e!807624 () Bool)

(assert (=> b!1429882 (= e!807624 (= (select (arr!47056 lt!629437) (index!47342 lt!629504)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1429883 () Bool)

(assert (=> b!1429883 (and (bvsge (index!47342 lt!629504) #b00000000000000000000000000000000) (bvslt (index!47342 lt!629504) (size!47607 lt!629437)))))

(declare-fun res!963785 () Bool)

(assert (=> b!1429883 (= res!963785 (= (select (arr!47056 lt!629437) (index!47342 lt!629504)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1429883 (=> res!963785 e!807624)))

(declare-fun b!1429884 () Bool)

(declare-fun e!807625 () SeekEntryResult!11237)

(declare-fun e!807622 () SeekEntryResult!11237)

(assert (=> b!1429884 (= e!807625 e!807622)))

(declare-fun c!132548 () Bool)

(declare-fun lt!629503 () (_ BitVec 64))

(assert (=> b!1429884 (= c!132548 (or (= lt!629503 lt!629439) (= (bvadd lt!629503 lt!629503) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1429885 () Bool)

(assert (=> b!1429885 (= e!807622 (Intermediate!11237 false (toIndex!0 lt!629439 mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1429886 () Bool)

(declare-fun e!807626 () Bool)

(declare-fun e!807623 () Bool)

(assert (=> b!1429886 (= e!807626 e!807623)))

(declare-fun res!963786 () Bool)

(assert (=> b!1429886 (= res!963786 (and ((_ is Intermediate!11237) lt!629504) (not (undefined!12049 lt!629504)) (bvslt (x!129138 lt!629504) #b01111111111111111111111111111110) (bvsge (x!129138 lt!629504) #b00000000000000000000000000000000) (bvsge (x!129138 lt!629504) #b00000000000000000000000000000000)))))

(assert (=> b!1429886 (=> (not res!963786) (not e!807623))))

(declare-fun b!1429887 () Bool)

(assert (=> b!1429887 (= e!807626 (bvsge (x!129138 lt!629504) #b01111111111111111111111111111110))))

(declare-fun d!153895 () Bool)

(assert (=> d!153895 e!807626))

(declare-fun c!132549 () Bool)

(assert (=> d!153895 (= c!132549 (and ((_ is Intermediate!11237) lt!629504) (undefined!12049 lt!629504)))))

(assert (=> d!153895 (= lt!629504 e!807625)))

(declare-fun c!132550 () Bool)

(assert (=> d!153895 (= c!132550 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!153895 (= lt!629503 (select (arr!47056 lt!629437) (toIndex!0 lt!629439 mask!2608)))))

(assert (=> d!153895 (validMask!0 mask!2608)))

(assert (=> d!153895 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!629439 mask!2608) lt!629439 lt!629437 mask!2608) lt!629504)))

(declare-fun b!1429888 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1429888 (= e!807622 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!629439 mask!2608) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2608) lt!629439 lt!629437 mask!2608))))

(declare-fun b!1429889 () Bool)

(assert (=> b!1429889 (and (bvsge (index!47342 lt!629504) #b00000000000000000000000000000000) (bvslt (index!47342 lt!629504) (size!47607 lt!629437)))))

(declare-fun res!963787 () Bool)

(assert (=> b!1429889 (= res!963787 (= (select (arr!47056 lt!629437) (index!47342 lt!629504)) lt!629439))))

(assert (=> b!1429889 (=> res!963787 e!807624)))

(assert (=> b!1429889 (= e!807623 e!807624)))

(declare-fun b!1429890 () Bool)

(assert (=> b!1429890 (= e!807625 (Intermediate!11237 true (toIndex!0 lt!629439 mask!2608) #b00000000000000000000000000000000))))

(assert (= (and d!153895 c!132550) b!1429890))

(assert (= (and d!153895 (not c!132550)) b!1429884))

(assert (= (and b!1429884 c!132548) b!1429885))

(assert (= (and b!1429884 (not c!132548)) b!1429888))

(assert (= (and d!153895 c!132549) b!1429887))

(assert (= (and d!153895 (not c!132549)) b!1429886))

(assert (= (and b!1429886 res!963786) b!1429889))

(assert (= (and b!1429889 (not res!963787)) b!1429883))

(assert (= (and b!1429883 (not res!963785)) b!1429882))

(declare-fun m!1320235 () Bool)

(assert (=> b!1429882 m!1320235))

(assert (=> d!153895 m!1320107))

(declare-fun m!1320237 () Bool)

(assert (=> d!153895 m!1320237))

(assert (=> d!153895 m!1320087))

(assert (=> b!1429888 m!1320107))

(declare-fun m!1320239 () Bool)

(assert (=> b!1429888 m!1320239))

(assert (=> b!1429888 m!1320239))

(declare-fun m!1320241 () Bool)

(assert (=> b!1429888 m!1320241))

(assert (=> b!1429883 m!1320235))

(assert (=> b!1429889 m!1320235))

(assert (=> b!1429733 d!153895))

(declare-fun d!153907 () Bool)

(declare-fun lt!629513 () (_ BitVec 32))

(declare-fun lt!629512 () (_ BitVec 32))

(assert (=> d!153907 (= lt!629513 (bvmul (bvxor lt!629512 (bvlshr lt!629512 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!153907 (= lt!629512 ((_ extract 31 0) (bvand (bvxor lt!629439 (bvlshr lt!629439 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!153907 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!963788 (let ((h!34874 ((_ extract 31 0) (bvand (bvxor lt!629439 (bvlshr lt!629439 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129142 (bvmul (bvxor h!34874 (bvlshr h!34874 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129142 (bvlshr x!129142 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!963788 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!963788 #b00000000000000000000000000000000))))))

(assert (=> d!153907 (= (toIndex!0 lt!629439 mask!2608) (bvand (bvxor lt!629513 (bvlshr lt!629513 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1429733 d!153907))

(declare-fun b!1429901 () Bool)

(declare-fun e!807636 () Bool)

(declare-fun contains!9901 (List!33553 (_ BitVec 64)) Bool)

(assert (=> b!1429901 (= e!807636 (contains!9901 Nil!33550 (select (arr!47056 a!2831) #b00000000000000000000000000000000)))))

(declare-fun bm!67470 () Bool)

(declare-fun call!67473 () Bool)

(declare-fun c!132553 () Bool)

(assert (=> bm!67470 (= call!67473 (arrayNoDuplicates!0 a!2831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!132553 (Cons!33549 (select (arr!47056 a!2831) #b00000000000000000000000000000000) Nil!33550) Nil!33550)))))

(declare-fun b!1429902 () Bool)

(declare-fun e!807635 () Bool)

(declare-fun e!807637 () Bool)

(assert (=> b!1429902 (= e!807635 e!807637)))

(declare-fun res!963796 () Bool)

(assert (=> b!1429902 (=> (not res!963796) (not e!807637))))

(assert (=> b!1429902 (= res!963796 (not e!807636))))

(declare-fun res!963795 () Bool)

(assert (=> b!1429902 (=> (not res!963795) (not e!807636))))

(assert (=> b!1429902 (= res!963795 (validKeyInArray!0 (select (arr!47056 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1429903 () Bool)

(declare-fun e!807638 () Bool)

(assert (=> b!1429903 (= e!807638 call!67473)))

(declare-fun b!1429904 () Bool)

(assert (=> b!1429904 (= e!807638 call!67473)))

(declare-fun b!1429905 () Bool)

(assert (=> b!1429905 (= e!807637 e!807638)))

(assert (=> b!1429905 (= c!132553 (validKeyInArray!0 (select (arr!47056 a!2831) #b00000000000000000000000000000000)))))

(declare-fun d!153911 () Bool)

(declare-fun res!963797 () Bool)

(assert (=> d!153911 (=> res!963797 e!807635)))

(assert (=> d!153911 (= res!963797 (bvsge #b00000000000000000000000000000000 (size!47607 a!2831)))))

(assert (=> d!153911 (= (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33550) e!807635)))

(assert (= (and d!153911 (not res!963797)) b!1429902))

(assert (= (and b!1429902 res!963795) b!1429901))

(assert (= (and b!1429902 res!963796) b!1429905))

(assert (= (and b!1429905 c!132553) b!1429904))

(assert (= (and b!1429905 (not c!132553)) b!1429903))

(assert (= (or b!1429904 b!1429903) bm!67470))

(declare-fun m!1320245 () Bool)

(assert (=> b!1429901 m!1320245))

(assert (=> b!1429901 m!1320245))

(declare-fun m!1320247 () Bool)

(assert (=> b!1429901 m!1320247))

(assert (=> bm!67470 m!1320245))

(declare-fun m!1320249 () Bool)

(assert (=> bm!67470 m!1320249))

(assert (=> b!1429902 m!1320245))

(assert (=> b!1429902 m!1320245))

(declare-fun m!1320251 () Bool)

(assert (=> b!1429902 m!1320251))

(assert (=> b!1429905 m!1320245))

(assert (=> b!1429905 m!1320245))

(assert (=> b!1429905 m!1320251))

(assert (=> b!1429732 d!153911))

(declare-fun b!1429959 () Bool)

(declare-fun e!807671 () Bool)

(declare-fun e!807672 () Bool)

(assert (=> b!1429959 (= e!807671 e!807672)))

(declare-fun c!132571 () Bool)

(assert (=> b!1429959 (= c!132571 (validKeyInArray!0 (select (arr!47056 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1429960 () Bool)

(declare-fun e!807670 () Bool)

(declare-fun call!67476 () Bool)

(assert (=> b!1429960 (= e!807670 call!67476)))

(declare-fun d!153913 () Bool)

(declare-fun res!963818 () Bool)

(assert (=> d!153913 (=> res!963818 e!807671)))

(assert (=> d!153913 (= res!963818 (bvsge #b00000000000000000000000000000000 (size!47607 a!2831)))))

(assert (=> d!153913 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!807671)))

(declare-fun b!1429961 () Bool)

(assert (=> b!1429961 (= e!807672 call!67476)))

(declare-fun bm!67473 () Bool)

(assert (=> bm!67473 (= call!67476 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1429962 () Bool)

(assert (=> b!1429962 (= e!807672 e!807670)))

(declare-fun lt!629530 () (_ BitVec 64))

(assert (=> b!1429962 (= lt!629530 (select (arr!47056 a!2831) #b00000000000000000000000000000000))))

(declare-fun lt!629532 () Unit!48251)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97493 (_ BitVec 64) (_ BitVec 32)) Unit!48251)

(assert (=> b!1429962 (= lt!629532 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!629530 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!97493 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1429962 (arrayContainsKey!0 a!2831 lt!629530 #b00000000000000000000000000000000)))

(declare-fun lt!629531 () Unit!48251)

(assert (=> b!1429962 (= lt!629531 lt!629532)))

(declare-fun res!963817 () Bool)

(assert (=> b!1429962 (= res!963817 (= (seekEntryOrOpen!0 (select (arr!47056 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!11237 #b00000000000000000000000000000000)))))

(assert (=> b!1429962 (=> (not res!963817) (not e!807670))))

(assert (= (and d!153913 (not res!963818)) b!1429959))

(assert (= (and b!1429959 c!132571) b!1429962))

(assert (= (and b!1429959 (not c!132571)) b!1429961))

(assert (= (and b!1429962 res!963817) b!1429960))

(assert (= (or b!1429960 b!1429961) bm!67473))

(assert (=> b!1429959 m!1320245))

(assert (=> b!1429959 m!1320245))

(assert (=> b!1429959 m!1320251))

(declare-fun m!1320259 () Bool)

(assert (=> bm!67473 m!1320259))

(assert (=> b!1429962 m!1320245))

(declare-fun m!1320261 () Bool)

(assert (=> b!1429962 m!1320261))

(declare-fun m!1320263 () Bool)

(assert (=> b!1429962 m!1320263))

(assert (=> b!1429962 m!1320245))

(declare-fun m!1320265 () Bool)

(assert (=> b!1429962 m!1320265))

(assert (=> b!1429743 d!153913))

(declare-fun b!1429963 () Bool)

(declare-fun e!807674 () Bool)

(declare-fun e!807675 () Bool)

(assert (=> b!1429963 (= e!807674 e!807675)))

(declare-fun c!132572 () Bool)

(assert (=> b!1429963 (= c!132572 (validKeyInArray!0 (select (arr!47056 a!2831) j!81)))))

(declare-fun b!1429964 () Bool)

(declare-fun e!807673 () Bool)

(declare-fun call!67477 () Bool)

(assert (=> b!1429964 (= e!807673 call!67477)))

(declare-fun d!153917 () Bool)

(declare-fun res!963820 () Bool)

(assert (=> d!153917 (=> res!963820 e!807674)))

(assert (=> d!153917 (= res!963820 (bvsge j!81 (size!47607 a!2831)))))

(assert (=> d!153917 (= (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608) e!807674)))

(declare-fun b!1429965 () Bool)

(assert (=> b!1429965 (= e!807675 call!67477)))

(declare-fun bm!67474 () Bool)

(assert (=> bm!67474 (= call!67477 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!81 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1429966 () Bool)

(assert (=> b!1429966 (= e!807675 e!807673)))

(declare-fun lt!629533 () (_ BitVec 64))

(assert (=> b!1429966 (= lt!629533 (select (arr!47056 a!2831) j!81))))

(declare-fun lt!629535 () Unit!48251)

(assert (=> b!1429966 (= lt!629535 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!629533 j!81))))

(assert (=> b!1429966 (arrayContainsKey!0 a!2831 lt!629533 #b00000000000000000000000000000000)))

(declare-fun lt!629534 () Unit!48251)

(assert (=> b!1429966 (= lt!629534 lt!629535)))

(declare-fun res!963819 () Bool)

(assert (=> b!1429966 (= res!963819 (= (seekEntryOrOpen!0 (select (arr!47056 a!2831) j!81) a!2831 mask!2608) (Found!11237 j!81)))))

(assert (=> b!1429966 (=> (not res!963819) (not e!807673))))

(assert (= (and d!153917 (not res!963820)) b!1429963))

(assert (= (and b!1429963 c!132572) b!1429966))

(assert (= (and b!1429963 (not c!132572)) b!1429965))

(assert (= (and b!1429966 res!963819) b!1429964))

(assert (= (or b!1429964 b!1429965) bm!67474))

(assert (=> b!1429963 m!1320093))

(assert (=> b!1429963 m!1320093))

(assert (=> b!1429963 m!1320101))

(declare-fun m!1320267 () Bool)

(assert (=> bm!67474 m!1320267))

(assert (=> b!1429966 m!1320093))

(declare-fun m!1320269 () Bool)

(assert (=> b!1429966 m!1320269))

(declare-fun m!1320271 () Bool)

(assert (=> b!1429966 m!1320271))

(assert (=> b!1429966 m!1320093))

(assert (=> b!1429966 m!1320099))

(assert (=> b!1429742 d!153917))

(declare-fun d!153919 () Bool)

(assert (=> d!153919 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(declare-fun lt!629542 () Unit!48251)

(declare-fun choose!38 (array!97493 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48251)

(assert (=> d!153919 (= lt!629542 (choose!38 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(assert (=> d!153919 (validMask!0 mask!2608)))

(assert (=> d!153919 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81) lt!629542)))

(declare-fun bs!41633 () Bool)

(assert (= bs!41633 d!153919))

(assert (=> bs!41633 m!1320119))

(declare-fun m!1320287 () Bool)

(assert (=> bs!41633 m!1320287))

(assert (=> bs!41633 m!1320087))

(assert (=> b!1429742 d!153919))

(declare-fun b!1429985 () Bool)

(declare-fun lt!629544 () SeekEntryResult!11237)

(assert (=> b!1429985 (and (bvsge (index!47342 lt!629544) #b00000000000000000000000000000000) (bvslt (index!47342 lt!629544) (size!47607 a!2831)))))

(declare-fun e!807688 () Bool)

(assert (=> b!1429985 (= e!807688 (= (select (arr!47056 a!2831) (index!47342 lt!629544)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1429986 () Bool)

(assert (=> b!1429986 (and (bvsge (index!47342 lt!629544) #b00000000000000000000000000000000) (bvslt (index!47342 lt!629544) (size!47607 a!2831)))))

(declare-fun res!963828 () Bool)

(assert (=> b!1429986 (= res!963828 (= (select (arr!47056 a!2831) (index!47342 lt!629544)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1429986 (=> res!963828 e!807688)))

(declare-fun b!1429987 () Bool)

(declare-fun e!807689 () SeekEntryResult!11237)

(declare-fun e!807686 () SeekEntryResult!11237)

(assert (=> b!1429987 (= e!807689 e!807686)))

(declare-fun c!132579 () Bool)

(declare-fun lt!629543 () (_ BitVec 64))

(assert (=> b!1429987 (= c!132579 (or (= lt!629543 (select (arr!47056 a!2831) j!81)) (= (bvadd lt!629543 lt!629543) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1429988 () Bool)

(assert (=> b!1429988 (= e!807686 (Intermediate!11237 false index!585 x!605))))

(declare-fun b!1429989 () Bool)

(declare-fun e!807690 () Bool)

(declare-fun e!807687 () Bool)

(assert (=> b!1429989 (= e!807690 e!807687)))

(declare-fun res!963829 () Bool)

(assert (=> b!1429989 (= res!963829 (and ((_ is Intermediate!11237) lt!629544) (not (undefined!12049 lt!629544)) (bvslt (x!129138 lt!629544) #b01111111111111111111111111111110) (bvsge (x!129138 lt!629544) #b00000000000000000000000000000000) (bvsge (x!129138 lt!629544) x!605)))))

(assert (=> b!1429989 (=> (not res!963829) (not e!807687))))

(declare-fun b!1429990 () Bool)

(assert (=> b!1429990 (= e!807690 (bvsge (x!129138 lt!629544) #b01111111111111111111111111111110))))

(declare-fun d!153925 () Bool)

(assert (=> d!153925 e!807690))

(declare-fun c!132580 () Bool)

(assert (=> d!153925 (= c!132580 (and ((_ is Intermediate!11237) lt!629544) (undefined!12049 lt!629544)))))

(assert (=> d!153925 (= lt!629544 e!807689)))

(declare-fun c!132581 () Bool)

(assert (=> d!153925 (= c!132581 (bvsge x!605 #b01111111111111111111111111111110))))

(assert (=> d!153925 (= lt!629543 (select (arr!47056 a!2831) index!585))))

(assert (=> d!153925 (validMask!0 mask!2608)))

(assert (=> d!153925 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47056 a!2831) j!81) a!2831 mask!2608) lt!629544)))

(declare-fun b!1429991 () Bool)

(assert (=> b!1429991 (= e!807686 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 (bvadd x!605 #b00000000000000000000000000000001) mask!2608) (select (arr!47056 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1429992 () Bool)

(assert (=> b!1429992 (and (bvsge (index!47342 lt!629544) #b00000000000000000000000000000000) (bvslt (index!47342 lt!629544) (size!47607 a!2831)))))

(declare-fun res!963830 () Bool)

(assert (=> b!1429992 (= res!963830 (= (select (arr!47056 a!2831) (index!47342 lt!629544)) (select (arr!47056 a!2831) j!81)))))

(assert (=> b!1429992 (=> res!963830 e!807688)))

(assert (=> b!1429992 (= e!807687 e!807688)))

(declare-fun b!1429993 () Bool)

(assert (=> b!1429993 (= e!807689 (Intermediate!11237 true index!585 x!605))))

(assert (= (and d!153925 c!132581) b!1429993))

(assert (= (and d!153925 (not c!132581)) b!1429987))

(assert (= (and b!1429987 c!132579) b!1429988))

(assert (= (and b!1429987 (not c!132579)) b!1429991))

(assert (= (and d!153925 c!132580) b!1429990))

(assert (= (and d!153925 (not c!132580)) b!1429989))

(assert (= (and b!1429989 res!963829) b!1429992))

(assert (= (and b!1429992 (not res!963830)) b!1429986))

(assert (= (and b!1429986 (not res!963828)) b!1429985))

(declare-fun m!1320289 () Bool)

(assert (=> b!1429985 m!1320289))

(assert (=> d!153925 m!1320117))

(assert (=> d!153925 m!1320087))

(declare-fun m!1320291 () Bool)

(assert (=> b!1429991 m!1320291))

(assert (=> b!1429991 m!1320291))

(assert (=> b!1429991 m!1320093))

(declare-fun m!1320293 () Bool)

(assert (=> b!1429991 m!1320293))

(assert (=> b!1429986 m!1320289))

(assert (=> b!1429992 m!1320289))

(assert (=> b!1429737 d!153925))

(declare-fun d!153927 () Bool)

(assert (=> d!153927 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!123410 d!153927))

(declare-fun d!153935 () Bool)

(assert (=> d!153935 (= (array_inv!36337 a!2831) (bvsge (size!47607 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!123410 d!153935))

(declare-fun b!1429994 () Bool)

(declare-fun lt!629552 () SeekEntryResult!11237)

(assert (=> b!1429994 (and (bvsge (index!47342 lt!629552) #b00000000000000000000000000000000) (bvslt (index!47342 lt!629552) (size!47607 a!2831)))))

(declare-fun e!807693 () Bool)

(assert (=> b!1429994 (= e!807693 (= (select (arr!47056 a!2831) (index!47342 lt!629552)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1429995 () Bool)

(assert (=> b!1429995 (and (bvsge (index!47342 lt!629552) #b00000000000000000000000000000000) (bvslt (index!47342 lt!629552) (size!47607 a!2831)))))

(declare-fun res!963831 () Bool)

(assert (=> b!1429995 (= res!963831 (= (select (arr!47056 a!2831) (index!47342 lt!629552)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1429995 (=> res!963831 e!807693)))

(declare-fun b!1429996 () Bool)

(declare-fun e!807694 () SeekEntryResult!11237)

(declare-fun e!807691 () SeekEntryResult!11237)

(assert (=> b!1429996 (= e!807694 e!807691)))

(declare-fun lt!629551 () (_ BitVec 64))

(declare-fun c!132582 () Bool)

(assert (=> b!1429996 (= c!132582 (or (= lt!629551 (select (arr!47056 a!2831) j!81)) (= (bvadd lt!629551 lt!629551) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1429997 () Bool)

(assert (=> b!1429997 (= e!807691 (Intermediate!11237 false (toIndex!0 (select (arr!47056 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1429998 () Bool)

(declare-fun e!807695 () Bool)

(declare-fun e!807692 () Bool)

(assert (=> b!1429998 (= e!807695 e!807692)))

(declare-fun res!963832 () Bool)

(assert (=> b!1429998 (= res!963832 (and ((_ is Intermediate!11237) lt!629552) (not (undefined!12049 lt!629552)) (bvslt (x!129138 lt!629552) #b01111111111111111111111111111110) (bvsge (x!129138 lt!629552) #b00000000000000000000000000000000) (bvsge (x!129138 lt!629552) #b00000000000000000000000000000000)))))

(assert (=> b!1429998 (=> (not res!963832) (not e!807692))))

(declare-fun b!1429999 () Bool)

(assert (=> b!1429999 (= e!807695 (bvsge (x!129138 lt!629552) #b01111111111111111111111111111110))))

(declare-fun d!153937 () Bool)

(assert (=> d!153937 e!807695))

(declare-fun c!132583 () Bool)

(assert (=> d!153937 (= c!132583 (and ((_ is Intermediate!11237) lt!629552) (undefined!12049 lt!629552)))))

(assert (=> d!153937 (= lt!629552 e!807694)))

(declare-fun c!132584 () Bool)

(assert (=> d!153937 (= c!132584 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!153937 (= lt!629551 (select (arr!47056 a!2831) (toIndex!0 (select (arr!47056 a!2831) j!81) mask!2608)))))

(assert (=> d!153937 (validMask!0 mask!2608)))

(assert (=> d!153937 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47056 a!2831) j!81) mask!2608) (select (arr!47056 a!2831) j!81) a!2831 mask!2608) lt!629552)))

(declare-fun b!1430000 () Bool)

(assert (=> b!1430000 (= e!807691 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47056 a!2831) j!81) mask!2608) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2608) (select (arr!47056 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1430001 () Bool)

(assert (=> b!1430001 (and (bvsge (index!47342 lt!629552) #b00000000000000000000000000000000) (bvslt (index!47342 lt!629552) (size!47607 a!2831)))))

(declare-fun res!963833 () Bool)

(assert (=> b!1430001 (= res!963833 (= (select (arr!47056 a!2831) (index!47342 lt!629552)) (select (arr!47056 a!2831) j!81)))))

(assert (=> b!1430001 (=> res!963833 e!807693)))

(assert (=> b!1430001 (= e!807692 e!807693)))

(declare-fun b!1430002 () Bool)

(assert (=> b!1430002 (= e!807694 (Intermediate!11237 true (toIndex!0 (select (arr!47056 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(assert (= (and d!153937 c!132584) b!1430002))

(assert (= (and d!153937 (not c!132584)) b!1429996))

(assert (= (and b!1429996 c!132582) b!1429997))

(assert (= (and b!1429996 (not c!132582)) b!1430000))

(assert (= (and d!153937 c!132583) b!1429999))

(assert (= (and d!153937 (not c!132583)) b!1429998))

(assert (= (and b!1429998 res!963832) b!1430001))

(assert (= (and b!1430001 (not res!963833)) b!1429995))

(assert (= (and b!1429995 (not res!963831)) b!1429994))

(declare-fun m!1320295 () Bool)

(assert (=> b!1429994 m!1320295))

(assert (=> d!153937 m!1320095))

(declare-fun m!1320297 () Bool)

(assert (=> d!153937 m!1320297))

(assert (=> d!153937 m!1320087))

(assert (=> b!1430000 m!1320095))

(declare-fun m!1320299 () Bool)

(assert (=> b!1430000 m!1320299))

(assert (=> b!1430000 m!1320299))

(assert (=> b!1430000 m!1320093))

(declare-fun m!1320301 () Bool)

(assert (=> b!1430000 m!1320301))

(assert (=> b!1429995 m!1320295))

(assert (=> b!1430001 m!1320295))

(assert (=> b!1429741 d!153937))

(declare-fun d!153939 () Bool)

(declare-fun lt!629554 () (_ BitVec 32))

(declare-fun lt!629553 () (_ BitVec 32))

(assert (=> d!153939 (= lt!629554 (bvmul (bvxor lt!629553 (bvlshr lt!629553 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!153939 (= lt!629553 ((_ extract 31 0) (bvand (bvxor (select (arr!47056 a!2831) j!81) (bvlshr (select (arr!47056 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!153939 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!963788 (let ((h!34874 ((_ extract 31 0) (bvand (bvxor (select (arr!47056 a!2831) j!81) (bvlshr (select (arr!47056 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129142 (bvmul (bvxor h!34874 (bvlshr h!34874 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129142 (bvlshr x!129142 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!963788 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!963788 #b00000000000000000000000000000000))))))

(assert (=> d!153939 (= (toIndex!0 (select (arr!47056 a!2831) j!81) mask!2608) (bvand (bvxor lt!629554 (bvlshr lt!629554 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1429741 d!153939))

(declare-fun d!153941 () Bool)

(assert (=> d!153941 (= (validKeyInArray!0 (select (arr!47056 a!2831) j!81)) (and (not (= (select (arr!47056 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47056 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1429740 d!153941))

(declare-fun b!1430003 () Bool)

(declare-fun lt!629556 () SeekEntryResult!11237)

(assert (=> b!1430003 (and (bvsge (index!47342 lt!629556) #b00000000000000000000000000000000) (bvslt (index!47342 lt!629556) (size!47607 lt!629437)))))

(declare-fun e!807698 () Bool)

(assert (=> b!1430003 (= e!807698 (= (select (arr!47056 lt!629437) (index!47342 lt!629556)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1430004 () Bool)

(assert (=> b!1430004 (and (bvsge (index!47342 lt!629556) #b00000000000000000000000000000000) (bvslt (index!47342 lt!629556) (size!47607 lt!629437)))))

(declare-fun res!963834 () Bool)

(assert (=> b!1430004 (= res!963834 (= (select (arr!47056 lt!629437) (index!47342 lt!629556)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1430004 (=> res!963834 e!807698)))

(declare-fun b!1430005 () Bool)

(declare-fun e!807699 () SeekEntryResult!11237)

(declare-fun e!807696 () SeekEntryResult!11237)

(assert (=> b!1430005 (= e!807699 e!807696)))

(declare-fun c!132585 () Bool)

(declare-fun lt!629555 () (_ BitVec 64))

(assert (=> b!1430005 (= c!132585 (or (= lt!629555 lt!629439) (= (bvadd lt!629555 lt!629555) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1430006 () Bool)

(assert (=> b!1430006 (= e!807696 (Intermediate!11237 false index!585 x!605))))

(declare-fun b!1430007 () Bool)

(declare-fun e!807700 () Bool)

(declare-fun e!807697 () Bool)

(assert (=> b!1430007 (= e!807700 e!807697)))

(declare-fun res!963835 () Bool)

(assert (=> b!1430007 (= res!963835 (and ((_ is Intermediate!11237) lt!629556) (not (undefined!12049 lt!629556)) (bvslt (x!129138 lt!629556) #b01111111111111111111111111111110) (bvsge (x!129138 lt!629556) #b00000000000000000000000000000000) (bvsge (x!129138 lt!629556) x!605)))))

(assert (=> b!1430007 (=> (not res!963835) (not e!807697))))

(declare-fun b!1430008 () Bool)

(assert (=> b!1430008 (= e!807700 (bvsge (x!129138 lt!629556) #b01111111111111111111111111111110))))

(declare-fun d!153943 () Bool)

(assert (=> d!153943 e!807700))

(declare-fun c!132586 () Bool)

(assert (=> d!153943 (= c!132586 (and ((_ is Intermediate!11237) lt!629556) (undefined!12049 lt!629556)))))

(assert (=> d!153943 (= lt!629556 e!807699)))

(declare-fun c!132587 () Bool)

(assert (=> d!153943 (= c!132587 (bvsge x!605 #b01111111111111111111111111111110))))

(assert (=> d!153943 (= lt!629555 (select (arr!47056 lt!629437) index!585))))

(assert (=> d!153943 (validMask!0 mask!2608)))

(assert (=> d!153943 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!629439 lt!629437 mask!2608) lt!629556)))

(declare-fun b!1430009 () Bool)

(assert (=> b!1430009 (= e!807696 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 (bvadd x!605 #b00000000000000000000000000000001) mask!2608) lt!629439 lt!629437 mask!2608))))

(declare-fun b!1430010 () Bool)

(assert (=> b!1430010 (and (bvsge (index!47342 lt!629556) #b00000000000000000000000000000000) (bvslt (index!47342 lt!629556) (size!47607 lt!629437)))))

(declare-fun res!963836 () Bool)

(assert (=> b!1430010 (= res!963836 (= (select (arr!47056 lt!629437) (index!47342 lt!629556)) lt!629439))))

(assert (=> b!1430010 (=> res!963836 e!807698)))

(assert (=> b!1430010 (= e!807697 e!807698)))

(declare-fun b!1430011 () Bool)

(assert (=> b!1430011 (= e!807699 (Intermediate!11237 true index!585 x!605))))

(assert (= (and d!153943 c!132587) b!1430011))

(assert (= (and d!153943 (not c!132587)) b!1430005))

(assert (= (and b!1430005 c!132585) b!1430006))

(assert (= (and b!1430005 (not c!132585)) b!1430009))

(assert (= (and d!153943 c!132586) b!1430008))

(assert (= (and d!153943 (not c!132586)) b!1430007))

(assert (= (and b!1430007 res!963835) b!1430010))

(assert (= (and b!1430010 (not res!963836)) b!1430004))

(assert (= (and b!1430004 (not res!963834)) b!1430003))

(declare-fun m!1320303 () Bool)

(assert (=> b!1430003 m!1320303))

(declare-fun m!1320305 () Bool)

(assert (=> d!153943 m!1320305))

(assert (=> d!153943 m!1320087))

(assert (=> b!1430009 m!1320291))

(assert (=> b!1430009 m!1320291))

(declare-fun m!1320307 () Bool)

(assert (=> b!1430009 m!1320307))

(assert (=> b!1430004 m!1320303))

(assert (=> b!1430010 m!1320303))

(assert (=> b!1429734 d!153943))

(declare-fun d!153945 () Bool)

(assert (=> d!153945 (= (validKeyInArray!0 (select (arr!47056 a!2831) i!982)) (and (not (= (select (arr!47056 a!2831) i!982) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47056 a!2831) i!982) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1429739 d!153945))

(check-sat (not bm!67474) (not d!153937) (not b!1429963) (not b!1429991) (not b!1429837) (not b!1429902) (not b!1429966) (not b!1429959) (not b!1429888) (not bm!67470) (not d!153925) (not d!153919) (not b!1429962) (not b!1430000) (not d!153893) (not bm!67473) (not b!1429905) (not b!1430009) (not d!153895) (not b!1429901) (not d!153943))
(check-sat)
