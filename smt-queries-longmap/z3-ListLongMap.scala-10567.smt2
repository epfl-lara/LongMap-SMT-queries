; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124510 () Bool)

(assert start!124510)

(declare-fun b!1441104 () Bool)

(declare-fun res!973596 () Bool)

(declare-fun e!812389 () Bool)

(assert (=> b!1441104 (=> (not res!973596) (not e!812389))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11534 0))(
  ( (MissingZero!11534 (index!48528 (_ BitVec 32))) (Found!11534 (index!48529 (_ BitVec 32))) (Intermediate!11534 (undefined!12346 Bool) (index!48530 (_ BitVec 32)) (x!130242 (_ BitVec 32))) (Undefined!11534) (MissingVacant!11534 (index!48531 (_ BitVec 32))) )
))
(declare-fun lt!632955 () SeekEntryResult!11534)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!97936 0))(
  ( (array!97937 (arr!47257 (Array (_ BitVec 32) (_ BitVec 64))) (size!47809 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97936)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97936 (_ BitVec 32)) SeekEntryResult!11534)

(assert (=> b!1441104 (= res!973596 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47257 a!2862) j!93) a!2862 mask!2687) lt!632955))))

(declare-fun b!1441105 () Bool)

(declare-fun res!973594 () Bool)

(declare-fun e!812391 () Bool)

(assert (=> b!1441105 (=> (not res!973594) (not e!812391))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1441105 (= res!973594 (and (= (size!47809 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47809 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47809 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1441106 () Bool)

(declare-fun res!973593 () Bool)

(assert (=> b!1441106 (=> (not res!973593) (not e!812391))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1441106 (= res!973593 (validKeyInArray!0 (select (arr!47257 a!2862) i!1006)))))

(declare-fun b!1441107 () Bool)

(declare-fun e!812393 () Bool)

(assert (=> b!1441107 (= e!812393 e!812389)))

(declare-fun res!973600 () Bool)

(assert (=> b!1441107 (=> (not res!973600) (not e!812389))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1441107 (= res!973600 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47257 a!2862) j!93) mask!2687) (select (arr!47257 a!2862) j!93) a!2862 mask!2687) lt!632955))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1441107 (= lt!632955 (Intermediate!11534 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun e!812390 () Bool)

(declare-fun lt!632951 () SeekEntryResult!11534)

(declare-fun lt!632953 () array!97936)

(declare-fun b!1441108 () Bool)

(declare-fun lt!632952 () (_ BitVec 64))

(assert (=> b!1441108 (= e!812390 (not (= lt!632951 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!632952 lt!632953 mask!2687))))))

(declare-fun res!973591 () Bool)

(assert (=> start!124510 (=> (not res!973591) (not e!812391))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124510 (= res!973591 (validMask!0 mask!2687))))

(assert (=> start!124510 e!812391))

(assert (=> start!124510 true))

(declare-fun array_inv!36490 (array!97936) Bool)

(assert (=> start!124510 (array_inv!36490 a!2862)))

(declare-fun b!1441109 () Bool)

(declare-fun e!812392 () Bool)

(assert (=> b!1441109 (= e!812392 false)))

(declare-fun lt!632954 () Bool)

(assert (=> b!1441109 (= lt!632954 e!812390)))

(declare-fun c!133270 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1441109 (= c!133270 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1441110 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97936 (_ BitVec 32)) SeekEntryResult!11534)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97936 (_ BitVec 32)) SeekEntryResult!11534)

(assert (=> b!1441110 (= e!812390 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!632952 lt!632953 mask!2687) (seekEntryOrOpen!0 lt!632952 lt!632953 mask!2687))))))

(declare-fun b!1441111 () Bool)

(assert (=> b!1441111 (= e!812391 e!812393)))

(declare-fun res!973595 () Bool)

(assert (=> b!1441111 (=> (not res!973595) (not e!812393))))

(assert (=> b!1441111 (= res!973595 (= (select (store (arr!47257 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1441111 (= lt!632953 (array!97937 (store (arr!47257 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47809 a!2862)))))

(declare-fun b!1441112 () Bool)

(declare-fun res!973590 () Bool)

(assert (=> b!1441112 (=> (not res!973590) (not e!812391))))

(assert (=> b!1441112 (= res!973590 (validKeyInArray!0 (select (arr!47257 a!2862) j!93)))))

(declare-fun b!1441113 () Bool)

(assert (=> b!1441113 (= e!812389 e!812392)))

(declare-fun res!973592 () Bool)

(assert (=> b!1441113 (=> (not res!973592) (not e!812392))))

(assert (=> b!1441113 (= res!973592 (= lt!632951 (Intermediate!11534 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1441113 (= lt!632951 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!632952 mask!2687) lt!632952 lt!632953 mask!2687))))

(assert (=> b!1441113 (= lt!632952 (select (store (arr!47257 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1441114 () Bool)

(declare-fun res!973599 () Bool)

(assert (=> b!1441114 (=> (not res!973599) (not e!812391))))

(assert (=> b!1441114 (= res!973599 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47809 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47809 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47809 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1441115 () Bool)

(declare-fun res!973597 () Bool)

(assert (=> b!1441115 (=> (not res!973597) (not e!812391))))

(declare-datatypes ((List!33836 0))(
  ( (Nil!33833) (Cons!33832 (h!35182 (_ BitVec 64)) (t!48522 List!33836)) )
))
(declare-fun arrayNoDuplicates!0 (array!97936 (_ BitVec 32) List!33836) Bool)

(assert (=> b!1441115 (= res!973597 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33833))))

(declare-fun b!1441116 () Bool)

(declare-fun res!973598 () Bool)

(assert (=> b!1441116 (=> (not res!973598) (not e!812391))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97936 (_ BitVec 32)) Bool)

(assert (=> b!1441116 (= res!973598 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!124510 res!973591) b!1441105))

(assert (= (and b!1441105 res!973594) b!1441106))

(assert (= (and b!1441106 res!973593) b!1441112))

(assert (= (and b!1441112 res!973590) b!1441116))

(assert (= (and b!1441116 res!973598) b!1441115))

(assert (= (and b!1441115 res!973597) b!1441114))

(assert (= (and b!1441114 res!973599) b!1441111))

(assert (= (and b!1441111 res!973595) b!1441107))

(assert (= (and b!1441107 res!973600) b!1441104))

(assert (= (and b!1441104 res!973596) b!1441113))

(assert (= (and b!1441113 res!973592) b!1441109))

(assert (= (and b!1441109 c!133270) b!1441108))

(assert (= (and b!1441109 (not c!133270)) b!1441110))

(declare-fun m!1329849 () Bool)

(assert (=> b!1441115 m!1329849))

(declare-fun m!1329851 () Bool)

(assert (=> b!1441106 m!1329851))

(assert (=> b!1441106 m!1329851))

(declare-fun m!1329853 () Bool)

(assert (=> b!1441106 m!1329853))

(declare-fun m!1329855 () Bool)

(assert (=> b!1441104 m!1329855))

(assert (=> b!1441104 m!1329855))

(declare-fun m!1329857 () Bool)

(assert (=> b!1441104 m!1329857))

(declare-fun m!1329859 () Bool)

(assert (=> b!1441108 m!1329859))

(declare-fun m!1329861 () Bool)

(assert (=> b!1441110 m!1329861))

(declare-fun m!1329863 () Bool)

(assert (=> b!1441110 m!1329863))

(declare-fun m!1329865 () Bool)

(assert (=> b!1441113 m!1329865))

(assert (=> b!1441113 m!1329865))

(declare-fun m!1329867 () Bool)

(assert (=> b!1441113 m!1329867))

(declare-fun m!1329869 () Bool)

(assert (=> b!1441113 m!1329869))

(declare-fun m!1329871 () Bool)

(assert (=> b!1441113 m!1329871))

(declare-fun m!1329873 () Bool)

(assert (=> b!1441116 m!1329873))

(assert (=> b!1441112 m!1329855))

(assert (=> b!1441112 m!1329855))

(declare-fun m!1329875 () Bool)

(assert (=> b!1441112 m!1329875))

(assert (=> b!1441107 m!1329855))

(assert (=> b!1441107 m!1329855))

(declare-fun m!1329877 () Bool)

(assert (=> b!1441107 m!1329877))

(assert (=> b!1441107 m!1329877))

(assert (=> b!1441107 m!1329855))

(declare-fun m!1329879 () Bool)

(assert (=> b!1441107 m!1329879))

(declare-fun m!1329881 () Bool)

(assert (=> start!124510 m!1329881))

(declare-fun m!1329883 () Bool)

(assert (=> start!124510 m!1329883))

(assert (=> b!1441111 m!1329869))

(declare-fun m!1329885 () Bool)

(assert (=> b!1441111 m!1329885))

(check-sat (not b!1441104) (not b!1441108) (not b!1441106) (not b!1441113) (not b!1441107) (not b!1441112) (not start!124510) (not b!1441116) (not b!1441110) (not b!1441115))
(check-sat)
