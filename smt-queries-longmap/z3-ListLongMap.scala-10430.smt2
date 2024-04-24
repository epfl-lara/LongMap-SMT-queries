; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122984 () Bool)

(assert start!122984)

(declare-fun b!1423896 () Bool)

(declare-fun res!958450 () Bool)

(declare-fun e!805072 () Bool)

(assert (=> b!1423896 (=> (not res!958450) (not e!805072))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97220 0))(
  ( (array!97221 (arr!46924 (Array (_ BitVec 32) (_ BitVec 64))) (size!47475 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97220)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1423896 (= res!958450 (and (= (size!47475 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47475 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47475 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1423897 () Bool)

(declare-fun res!958448 () Bool)

(declare-fun e!805076 () Bool)

(assert (=> b!1423897 (=> (not res!958448) (not e!805076))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1423897 (= res!958448 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1423898 () Bool)

(declare-fun res!958449 () Bool)

(assert (=> b!1423898 (=> (not res!958449) (not e!805072))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97220 (_ BitVec 32)) Bool)

(assert (=> b!1423898 (= res!958449 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1423899 () Bool)

(declare-fun e!805073 () Bool)

(assert (=> b!1423899 (= e!805073 e!805076)))

(declare-fun res!958452 () Bool)

(assert (=> b!1423899 (=> (not res!958452) (not e!805076))))

(declare-datatypes ((SeekEntryResult!11111 0))(
  ( (MissingZero!11111 (index!46836 (_ BitVec 32))) (Found!11111 (index!46837 (_ BitVec 32))) (Intermediate!11111 (undefined!11923 Bool) (index!46838 (_ BitVec 32)) (x!128642 (_ BitVec 32))) (Undefined!11111) (MissingVacant!11111 (index!46839 (_ BitVec 32))) )
))
(declare-fun lt!627209 () SeekEntryResult!11111)

(declare-fun lt!627210 () array!97220)

(declare-fun lt!627213 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97220 (_ BitVec 32)) SeekEntryResult!11111)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1423899 (= res!958452 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!627213 mask!2608) lt!627213 lt!627210 mask!2608) lt!627209))))

(assert (=> b!1423899 (= lt!627209 (Intermediate!11111 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1423899 (= lt!627213 (select (store (arr!46924 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1423899 (= lt!627210 (array!97221 (store (arr!46924 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47475 a!2831)))))

(declare-fun b!1423900 () Bool)

(declare-fun e!805071 () Bool)

(assert (=> b!1423900 (= e!805076 (not e!805071))))

(declare-fun res!958456 () Bool)

(assert (=> b!1423900 (=> res!958456 e!805071)))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1423900 (= res!958456 (or (= (select (arr!46924 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46924 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46924 a!2831) index!585) (select (arr!46924 a!2831) j!81)) (= (select (store (arr!46924 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!805075 () Bool)

(assert (=> b!1423900 e!805075))

(declare-fun res!958457 () Bool)

(assert (=> b!1423900 (=> (not res!958457) (not e!805075))))

(assert (=> b!1423900 (= res!958457 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48089 0))(
  ( (Unit!48090) )
))
(declare-fun lt!627215 () Unit!48089)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97220 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48089)

(assert (=> b!1423900 (= lt!627215 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1423901 () Bool)

(assert (=> b!1423901 (= e!805072 e!805073)))

(declare-fun res!958447 () Bool)

(assert (=> b!1423901 (=> (not res!958447) (not e!805073))))

(declare-fun lt!627211 () SeekEntryResult!11111)

(assert (=> b!1423901 (= res!958447 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46924 a!2831) j!81) mask!2608) (select (arr!46924 a!2831) j!81) a!2831 mask!2608) lt!627211))))

(assert (=> b!1423901 (= lt!627211 (Intermediate!11111 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1423902 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97220 (_ BitVec 32)) SeekEntryResult!11111)

(assert (=> b!1423902 (= e!805075 (= (seekEntryOrOpen!0 (select (arr!46924 a!2831) j!81) a!2831 mask!2608) (Found!11111 j!81)))))

(declare-fun b!1423903 () Bool)

(declare-fun res!958453 () Bool)

(assert (=> b!1423903 (=> (not res!958453) (not e!805072))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1423903 (= res!958453 (validKeyInArray!0 (select (arr!46924 a!2831) j!81)))))

(declare-fun b!1423904 () Bool)

(declare-fun res!958444 () Bool)

(assert (=> b!1423904 (=> (not res!958444) (not e!805072))))

(assert (=> b!1423904 (= res!958444 (validKeyInArray!0 (select (arr!46924 a!2831) i!982)))))

(declare-fun b!1423905 () Bool)

(declare-fun res!958454 () Bool)

(declare-fun e!805074 () Bool)

(assert (=> b!1423905 (=> res!958454 e!805074)))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun lt!627212 () (_ BitVec 32))

(assert (=> b!1423905 (= res!958454 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627212 (select (arr!46924 a!2831) j!81) a!2831 mask!2608) lt!627211)))))

(declare-fun res!958459 () Bool)

(assert (=> start!122984 (=> (not res!958459) (not e!805072))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122984 (= res!958459 (validMask!0 mask!2608))))

(assert (=> start!122984 e!805072))

(assert (=> start!122984 true))

(declare-fun array_inv!36205 (array!97220) Bool)

(assert (=> start!122984 (array_inv!36205 a!2831)))

(declare-fun b!1423906 () Bool)

(declare-fun res!958455 () Bool)

(assert (=> b!1423906 (=> (not res!958455) (not e!805076))))

(assert (=> b!1423906 (= res!958455 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!627213 lt!627210 mask!2608) lt!627209))))

(declare-fun b!1423907 () Bool)

(declare-fun res!958446 () Bool)

(assert (=> b!1423907 (=> (not res!958446) (not e!805072))))

(assert (=> b!1423907 (= res!958446 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47475 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47475 a!2831))))))

(declare-fun b!1423908 () Bool)

(declare-fun res!958451 () Bool)

(assert (=> b!1423908 (=> (not res!958451) (not e!805076))))

(assert (=> b!1423908 (= res!958451 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46924 a!2831) j!81) a!2831 mask!2608) lt!627211))))

(declare-fun b!1423909 () Bool)

(assert (=> b!1423909 (= e!805074 true)))

(declare-fun lt!627214 () SeekEntryResult!11111)

(assert (=> b!1423909 (= lt!627214 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627212 lt!627213 lt!627210 mask!2608))))

(declare-fun b!1423910 () Bool)

(assert (=> b!1423910 (= e!805071 e!805074)))

(declare-fun res!958458 () Bool)

(assert (=> b!1423910 (=> res!958458 e!805074)))

(assert (=> b!1423910 (= res!958458 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!627212 #b00000000000000000000000000000000) (bvsge lt!627212 (size!47475 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1423910 (= lt!627212 (nextIndex!0 index!585 (bvadd #b00000000000000000000000000000001 x!605) mask!2608))))

(declare-fun b!1423911 () Bool)

(declare-fun res!958445 () Bool)

(assert (=> b!1423911 (=> (not res!958445) (not e!805072))))

(declare-datatypes ((List!33421 0))(
  ( (Nil!33418) (Cons!33417 (h!34730 (_ BitVec 64)) (t!48107 List!33421)) )
))
(declare-fun arrayNoDuplicates!0 (array!97220 (_ BitVec 32) List!33421) Bool)

(assert (=> b!1423911 (= res!958445 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33418))))

(assert (= (and start!122984 res!958459) b!1423896))

(assert (= (and b!1423896 res!958450) b!1423904))

(assert (= (and b!1423904 res!958444) b!1423903))

(assert (= (and b!1423903 res!958453) b!1423898))

(assert (= (and b!1423898 res!958449) b!1423911))

(assert (= (and b!1423911 res!958445) b!1423907))

(assert (= (and b!1423907 res!958446) b!1423901))

(assert (= (and b!1423901 res!958447) b!1423899))

(assert (= (and b!1423899 res!958452) b!1423908))

(assert (= (and b!1423908 res!958451) b!1423906))

(assert (= (and b!1423906 res!958455) b!1423897))

(assert (= (and b!1423897 res!958448) b!1423900))

(assert (= (and b!1423900 res!958457) b!1423902))

(assert (= (and b!1423900 (not res!958456)) b!1423910))

(assert (= (and b!1423910 (not res!958458)) b!1423905))

(assert (= (and b!1423905 (not res!958454)) b!1423909))

(declare-fun m!1314561 () Bool)

(assert (=> b!1423908 m!1314561))

(assert (=> b!1423908 m!1314561))

(declare-fun m!1314563 () Bool)

(assert (=> b!1423908 m!1314563))

(assert (=> b!1423903 m!1314561))

(assert (=> b!1423903 m!1314561))

(declare-fun m!1314565 () Bool)

(assert (=> b!1423903 m!1314565))

(declare-fun m!1314567 () Bool)

(assert (=> b!1423899 m!1314567))

(assert (=> b!1423899 m!1314567))

(declare-fun m!1314569 () Bool)

(assert (=> b!1423899 m!1314569))

(declare-fun m!1314571 () Bool)

(assert (=> b!1423899 m!1314571))

(declare-fun m!1314573 () Bool)

(assert (=> b!1423899 m!1314573))

(assert (=> b!1423901 m!1314561))

(assert (=> b!1423901 m!1314561))

(declare-fun m!1314575 () Bool)

(assert (=> b!1423901 m!1314575))

(assert (=> b!1423901 m!1314575))

(assert (=> b!1423901 m!1314561))

(declare-fun m!1314577 () Bool)

(assert (=> b!1423901 m!1314577))

(declare-fun m!1314579 () Bool)

(assert (=> b!1423906 m!1314579))

(assert (=> b!1423905 m!1314561))

(assert (=> b!1423905 m!1314561))

(declare-fun m!1314581 () Bool)

(assert (=> b!1423905 m!1314581))

(assert (=> b!1423902 m!1314561))

(assert (=> b!1423902 m!1314561))

(declare-fun m!1314583 () Bool)

(assert (=> b!1423902 m!1314583))

(declare-fun m!1314585 () Bool)

(assert (=> b!1423904 m!1314585))

(assert (=> b!1423904 m!1314585))

(declare-fun m!1314587 () Bool)

(assert (=> b!1423904 m!1314587))

(declare-fun m!1314589 () Bool)

(assert (=> b!1423909 m!1314589))

(declare-fun m!1314591 () Bool)

(assert (=> b!1423910 m!1314591))

(declare-fun m!1314593 () Bool)

(assert (=> b!1423898 m!1314593))

(assert (=> b!1423900 m!1314571))

(declare-fun m!1314595 () Bool)

(assert (=> b!1423900 m!1314595))

(declare-fun m!1314597 () Bool)

(assert (=> b!1423900 m!1314597))

(declare-fun m!1314599 () Bool)

(assert (=> b!1423900 m!1314599))

(assert (=> b!1423900 m!1314561))

(declare-fun m!1314601 () Bool)

(assert (=> b!1423900 m!1314601))

(declare-fun m!1314603 () Bool)

(assert (=> b!1423911 m!1314603))

(declare-fun m!1314605 () Bool)

(assert (=> start!122984 m!1314605))

(declare-fun m!1314607 () Bool)

(assert (=> start!122984 m!1314607))

(check-sat (not b!1423904) (not start!122984) (not b!1423899) (not b!1423905) (not b!1423900) (not b!1423902) (not b!1423911) (not b!1423909) (not b!1423898) (not b!1423908) (not b!1423901) (not b!1423903) (not b!1423910) (not b!1423906))
(check-sat)
