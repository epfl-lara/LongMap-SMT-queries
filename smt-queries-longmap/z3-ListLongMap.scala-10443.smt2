; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123062 () Bool)

(assert start!123062)

(declare-fun b!1425768 () Bool)

(declare-fun res!960320 () Bool)

(declare-fun e!805889 () Bool)

(assert (=> b!1425768 (=> res!960320 e!805889)))

(declare-fun lt!628028 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11150 0))(
  ( (MissingZero!11150 (index!46992 (_ BitVec 32))) (Found!11150 (index!46993 (_ BitVec 32))) (Intermediate!11150 (undefined!11962 Bool) (index!46994 (_ BitVec 32)) (x!128785 (_ BitVec 32))) (Undefined!11150) (MissingVacant!11150 (index!46995 (_ BitVec 32))) )
))
(declare-fun lt!628030 () SeekEntryResult!11150)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97298 0))(
  ( (array!97299 (arr!46963 (Array (_ BitVec 32) (_ BitVec 64))) (size!47514 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97298)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97298 (_ BitVec 32)) SeekEntryResult!11150)

(assert (=> b!1425768 (= res!960320 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!628028 (select (arr!46963 a!2831) j!81) a!2831 mask!2608) lt!628030)))))

(declare-fun b!1425769 () Bool)

(declare-fun res!960321 () Bool)

(declare-fun e!805895 () Bool)

(assert (=> b!1425769 (=> (not res!960321) (not e!805895))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97298 (_ BitVec 32)) Bool)

(assert (=> b!1425769 (= res!960321 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1425770 () Bool)

(declare-fun e!805891 () Bool)

(declare-fun e!805892 () Bool)

(assert (=> b!1425770 (= e!805891 (not e!805892))))

(declare-fun res!960323 () Bool)

(assert (=> b!1425770 (=> res!960323 e!805892)))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1425770 (= res!960323 (or (= (select (arr!46963 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46963 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46963 a!2831) index!585) (select (arr!46963 a!2831) j!81)) (= (select (store (arr!46963 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!805893 () Bool)

(assert (=> b!1425770 e!805893))

(declare-fun res!960327 () Bool)

(assert (=> b!1425770 (=> (not res!960327) (not e!805893))))

(assert (=> b!1425770 (= res!960327 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48167 0))(
  ( (Unit!48168) )
))
(declare-fun lt!628034 () Unit!48167)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97298 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48167)

(assert (=> b!1425770 (= lt!628034 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1425771 () Bool)

(declare-fun res!960328 () Bool)

(assert (=> b!1425771 (=> (not res!960328) (not e!805891))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1425771 (= res!960328 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1425772 () Bool)

(assert (=> b!1425772 (= e!805892 e!805889)))

(declare-fun res!960318 () Bool)

(assert (=> b!1425772 (=> res!960318 e!805889)))

(assert (=> b!1425772 (= res!960318 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!628028 #b00000000000000000000000000000000) (bvsge lt!628028 (size!47514 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1425772 (= lt!628028 (nextIndex!0 index!585 (bvadd #b00000000000000000000000000000001 x!605) mask!2608))))

(declare-fun b!1425773 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97298 (_ BitVec 32)) SeekEntryResult!11150)

(assert (=> b!1425773 (= e!805893 (= (seekEntryOrOpen!0 (select (arr!46963 a!2831) j!81) a!2831 mask!2608) (Found!11150 j!81)))))

(declare-fun b!1425774 () Bool)

(declare-fun e!805890 () Bool)

(assert (=> b!1425774 (= e!805895 e!805890)))

(declare-fun res!960317 () Bool)

(assert (=> b!1425774 (=> (not res!960317) (not e!805890))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1425774 (= res!960317 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46963 a!2831) j!81) mask!2608) (select (arr!46963 a!2831) j!81) a!2831 mask!2608) lt!628030))))

(assert (=> b!1425774 (= lt!628030 (Intermediate!11150 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1425775 () Bool)

(declare-fun res!960326 () Bool)

(assert (=> b!1425775 (=> (not res!960326) (not e!805895))))

(assert (=> b!1425775 (= res!960326 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47514 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47514 a!2831))))))

(declare-fun b!1425776 () Bool)

(assert (=> b!1425776 (= e!805889 true)))

(declare-fun lt!628031 () (_ BitVec 64))

(declare-fun lt!628032 () SeekEntryResult!11150)

(declare-fun lt!628033 () array!97298)

(assert (=> b!1425776 (= lt!628032 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!628028 lt!628031 lt!628033 mask!2608))))

(declare-fun b!1425777 () Bool)

(declare-fun res!960325 () Bool)

(assert (=> b!1425777 (=> (not res!960325) (not e!805891))))

(assert (=> b!1425777 (= res!960325 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46963 a!2831) j!81) a!2831 mask!2608) lt!628030))))

(declare-fun b!1425778 () Bool)

(declare-fun res!960329 () Bool)

(assert (=> b!1425778 (=> (not res!960329) (not e!805891))))

(declare-fun lt!628029 () SeekEntryResult!11150)

(assert (=> b!1425778 (= res!960329 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!628031 lt!628033 mask!2608) lt!628029))))

(declare-fun b!1425779 () Bool)

(declare-fun res!960316 () Bool)

(assert (=> b!1425779 (=> (not res!960316) (not e!805895))))

(declare-datatypes ((List!33460 0))(
  ( (Nil!33457) (Cons!33456 (h!34769 (_ BitVec 64)) (t!48146 List!33460)) )
))
(declare-fun arrayNoDuplicates!0 (array!97298 (_ BitVec 32) List!33460) Bool)

(assert (=> b!1425779 (= res!960316 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33457))))

(declare-fun b!1425780 () Bool)

(declare-fun res!960330 () Bool)

(assert (=> b!1425780 (=> (not res!960330) (not e!805895))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1425780 (= res!960330 (validKeyInArray!0 (select (arr!46963 a!2831) i!982)))))

(declare-fun b!1425781 () Bool)

(declare-fun res!960324 () Bool)

(assert (=> b!1425781 (=> (not res!960324) (not e!805895))))

(assert (=> b!1425781 (= res!960324 (and (= (size!47514 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47514 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47514 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1425782 () Bool)

(assert (=> b!1425782 (= e!805890 e!805891)))

(declare-fun res!960331 () Bool)

(assert (=> b!1425782 (=> (not res!960331) (not e!805891))))

(assert (=> b!1425782 (= res!960331 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!628031 mask!2608) lt!628031 lt!628033 mask!2608) lt!628029))))

(assert (=> b!1425782 (= lt!628029 (Intermediate!11150 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1425782 (= lt!628031 (select (store (arr!46963 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1425782 (= lt!628033 (array!97299 (store (arr!46963 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47514 a!2831)))))

(declare-fun res!960319 () Bool)

(assert (=> start!123062 (=> (not res!960319) (not e!805895))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123062 (= res!960319 (validMask!0 mask!2608))))

(assert (=> start!123062 e!805895))

(assert (=> start!123062 true))

(declare-fun array_inv!36244 (array!97298) Bool)

(assert (=> start!123062 (array_inv!36244 a!2831)))

(declare-fun b!1425783 () Bool)

(declare-fun res!960322 () Bool)

(assert (=> b!1425783 (=> (not res!960322) (not e!805895))))

(assert (=> b!1425783 (= res!960322 (validKeyInArray!0 (select (arr!46963 a!2831) j!81)))))

(assert (= (and start!123062 res!960319) b!1425781))

(assert (= (and b!1425781 res!960324) b!1425780))

(assert (= (and b!1425780 res!960330) b!1425783))

(assert (= (and b!1425783 res!960322) b!1425769))

(assert (= (and b!1425769 res!960321) b!1425779))

(assert (= (and b!1425779 res!960316) b!1425775))

(assert (= (and b!1425775 res!960326) b!1425774))

(assert (= (and b!1425774 res!960317) b!1425782))

(assert (= (and b!1425782 res!960331) b!1425777))

(assert (= (and b!1425777 res!960325) b!1425778))

(assert (= (and b!1425778 res!960329) b!1425771))

(assert (= (and b!1425771 res!960328) b!1425770))

(assert (= (and b!1425770 res!960327) b!1425773))

(assert (= (and b!1425770 (not res!960323)) b!1425772))

(assert (= (and b!1425772 (not res!960318)) b!1425768))

(assert (= (and b!1425768 (not res!960320)) b!1425776))

(declare-fun m!1316433 () Bool)

(assert (=> b!1425772 m!1316433))

(declare-fun m!1316435 () Bool)

(assert (=> b!1425778 m!1316435))

(declare-fun m!1316437 () Bool)

(assert (=> b!1425773 m!1316437))

(assert (=> b!1425773 m!1316437))

(declare-fun m!1316439 () Bool)

(assert (=> b!1425773 m!1316439))

(declare-fun m!1316441 () Bool)

(assert (=> b!1425770 m!1316441))

(declare-fun m!1316443 () Bool)

(assert (=> b!1425770 m!1316443))

(declare-fun m!1316445 () Bool)

(assert (=> b!1425770 m!1316445))

(declare-fun m!1316447 () Bool)

(assert (=> b!1425770 m!1316447))

(assert (=> b!1425770 m!1316437))

(declare-fun m!1316449 () Bool)

(assert (=> b!1425770 m!1316449))

(declare-fun m!1316451 () Bool)

(assert (=> b!1425776 m!1316451))

(declare-fun m!1316453 () Bool)

(assert (=> b!1425769 m!1316453))

(declare-fun m!1316455 () Bool)

(assert (=> b!1425779 m!1316455))

(declare-fun m!1316457 () Bool)

(assert (=> b!1425782 m!1316457))

(assert (=> b!1425782 m!1316457))

(declare-fun m!1316459 () Bool)

(assert (=> b!1425782 m!1316459))

(assert (=> b!1425782 m!1316441))

(declare-fun m!1316461 () Bool)

(assert (=> b!1425782 m!1316461))

(assert (=> b!1425777 m!1316437))

(assert (=> b!1425777 m!1316437))

(declare-fun m!1316463 () Bool)

(assert (=> b!1425777 m!1316463))

(assert (=> b!1425783 m!1316437))

(assert (=> b!1425783 m!1316437))

(declare-fun m!1316465 () Bool)

(assert (=> b!1425783 m!1316465))

(declare-fun m!1316467 () Bool)

(assert (=> b!1425780 m!1316467))

(assert (=> b!1425780 m!1316467))

(declare-fun m!1316469 () Bool)

(assert (=> b!1425780 m!1316469))

(assert (=> b!1425774 m!1316437))

(assert (=> b!1425774 m!1316437))

(declare-fun m!1316471 () Bool)

(assert (=> b!1425774 m!1316471))

(assert (=> b!1425774 m!1316471))

(assert (=> b!1425774 m!1316437))

(declare-fun m!1316473 () Bool)

(assert (=> b!1425774 m!1316473))

(declare-fun m!1316475 () Bool)

(assert (=> start!123062 m!1316475))

(declare-fun m!1316477 () Bool)

(assert (=> start!123062 m!1316477))

(assert (=> b!1425768 m!1316437))

(assert (=> b!1425768 m!1316437))

(declare-fun m!1316479 () Bool)

(assert (=> b!1425768 m!1316479))

(check-sat (not b!1425768) (not b!1425769) (not b!1425774) (not b!1425773) (not b!1425778) (not b!1425776) (not start!123062) (not b!1425782) (not b!1425777) (not b!1425780) (not b!1425779) (not b!1425772) (not b!1425770) (not b!1425783))
(check-sat)
