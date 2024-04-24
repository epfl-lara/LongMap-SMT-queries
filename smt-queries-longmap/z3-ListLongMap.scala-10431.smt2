; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122990 () Bool)

(assert start!122990)

(declare-fun b!1424040 () Bool)

(declare-fun e!805138 () Bool)

(assert (=> b!1424040 (= e!805138 true)))

(declare-fun x!605 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11114 0))(
  ( (MissingZero!11114 (index!46848 (_ BitVec 32))) (Found!11114 (index!46849 (_ BitVec 32))) (Intermediate!11114 (undefined!11926 Bool) (index!46850 (_ BitVec 32)) (x!128653 (_ BitVec 32))) (Undefined!11114) (MissingVacant!11114 (index!46851 (_ BitVec 32))) )
))
(declare-fun lt!627276 () SeekEntryResult!11114)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((array!97226 0))(
  ( (array!97227 (arr!46927 (Array (_ BitVec 32) (_ BitVec 64))) (size!47478 (_ BitVec 32))) )
))
(declare-fun lt!627274 () array!97226)

(declare-fun lt!627278 () (_ BitVec 32))

(declare-fun lt!627277 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97226 (_ BitVec 32)) SeekEntryResult!11114)

(assert (=> b!1424040 (= lt!627276 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627278 lt!627277 lt!627274 mask!2608))))

(declare-fun b!1424041 () Bool)

(declare-fun res!958593 () Bool)

(declare-fun e!805139 () Bool)

(assert (=> b!1424041 (=> (not res!958593) (not e!805139))))

(declare-fun lt!627275 () SeekEntryResult!11114)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun a!2831 () array!97226)

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1424041 (= res!958593 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46927 a!2831) j!81) a!2831 mask!2608) lt!627275))))

(declare-fun b!1424042 () Bool)

(declare-fun res!958598 () Bool)

(declare-fun e!805133 () Bool)

(assert (=> b!1424042 (=> (not res!958598) (not e!805133))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1424042 (= res!958598 (validKeyInArray!0 (select (arr!46927 a!2831) j!81)))))

(declare-fun b!1424043 () Bool)

(declare-fun res!958594 () Bool)

(assert (=> b!1424043 (=> (not res!958594) (not e!805133))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97226 (_ BitVec 32)) Bool)

(assert (=> b!1424043 (= res!958594 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1424044 () Bool)

(declare-fun e!805137 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97226 (_ BitVec 32)) SeekEntryResult!11114)

(assert (=> b!1424044 (= e!805137 (= (seekEntryOrOpen!0 (select (arr!46927 a!2831) j!81) a!2831 mask!2608) (Found!11114 j!81)))))

(declare-fun b!1424045 () Bool)

(declare-fun res!958603 () Bool)

(assert (=> b!1424045 (=> (not res!958603) (not e!805133))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1424045 (= res!958603 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47478 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47478 a!2831))))))

(declare-fun b!1424046 () Bool)

(declare-fun res!958590 () Bool)

(assert (=> b!1424046 (=> (not res!958590) (not e!805139))))

(declare-fun lt!627272 () SeekEntryResult!11114)

(assert (=> b!1424046 (= res!958590 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!627277 lt!627274 mask!2608) lt!627272))))

(declare-fun b!1424047 () Bool)

(declare-fun e!805136 () Bool)

(assert (=> b!1424047 (= e!805136 e!805139)))

(declare-fun res!958601 () Bool)

(assert (=> b!1424047 (=> (not res!958601) (not e!805139))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1424047 (= res!958601 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!627277 mask!2608) lt!627277 lt!627274 mask!2608) lt!627272))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1424047 (= lt!627272 (Intermediate!11114 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1424047 (= lt!627277 (select (store (arr!46927 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1424047 (= lt!627274 (array!97227 (store (arr!46927 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47478 a!2831)))))

(declare-fun b!1424048 () Bool)

(declare-fun res!958588 () Bool)

(assert (=> b!1424048 (=> (not res!958588) (not e!805139))))

(assert (=> b!1424048 (= res!958588 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1424049 () Bool)

(assert (=> b!1424049 (= e!805133 e!805136)))

(declare-fun res!958595 () Bool)

(assert (=> b!1424049 (=> (not res!958595) (not e!805136))))

(assert (=> b!1424049 (= res!958595 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46927 a!2831) j!81) mask!2608) (select (arr!46927 a!2831) j!81) a!2831 mask!2608) lt!627275))))

(assert (=> b!1424049 (= lt!627275 (Intermediate!11114 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun res!958599 () Bool)

(assert (=> start!122990 (=> (not res!958599) (not e!805133))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122990 (= res!958599 (validMask!0 mask!2608))))

(assert (=> start!122990 e!805133))

(assert (=> start!122990 true))

(declare-fun array_inv!36208 (array!97226) Bool)

(assert (=> start!122990 (array_inv!36208 a!2831)))

(declare-fun b!1424050 () Bool)

(declare-fun e!805134 () Bool)

(assert (=> b!1424050 (= e!805139 (not e!805134))))

(declare-fun res!958602 () Bool)

(assert (=> b!1424050 (=> res!958602 e!805134)))

(assert (=> b!1424050 (= res!958602 (or (= (select (arr!46927 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46927 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46927 a!2831) index!585) (select (arr!46927 a!2831) j!81)) (= (select (store (arr!46927 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1424050 e!805137))

(declare-fun res!958589 () Bool)

(assert (=> b!1424050 (=> (not res!958589) (not e!805137))))

(assert (=> b!1424050 (= res!958589 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48095 0))(
  ( (Unit!48096) )
))
(declare-fun lt!627273 () Unit!48095)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97226 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48095)

(assert (=> b!1424050 (= lt!627273 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1424051 () Bool)

(declare-fun res!958591 () Bool)

(assert (=> b!1424051 (=> (not res!958591) (not e!805133))))

(assert (=> b!1424051 (= res!958591 (validKeyInArray!0 (select (arr!46927 a!2831) i!982)))))

(declare-fun b!1424052 () Bool)

(assert (=> b!1424052 (= e!805134 e!805138)))

(declare-fun res!958596 () Bool)

(assert (=> b!1424052 (=> res!958596 e!805138)))

(assert (=> b!1424052 (= res!958596 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!627278 #b00000000000000000000000000000000) (bvsge lt!627278 (size!47478 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1424052 (= lt!627278 (nextIndex!0 index!585 (bvadd #b00000000000000000000000000000001 x!605) mask!2608))))

(declare-fun b!1424053 () Bool)

(declare-fun res!958592 () Bool)

(assert (=> b!1424053 (=> (not res!958592) (not e!805133))))

(declare-datatypes ((List!33424 0))(
  ( (Nil!33421) (Cons!33420 (h!34733 (_ BitVec 64)) (t!48110 List!33424)) )
))
(declare-fun arrayNoDuplicates!0 (array!97226 (_ BitVec 32) List!33424) Bool)

(assert (=> b!1424053 (= res!958592 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33421))))

(declare-fun b!1424054 () Bool)

(declare-fun res!958600 () Bool)

(assert (=> b!1424054 (=> (not res!958600) (not e!805133))))

(assert (=> b!1424054 (= res!958600 (and (= (size!47478 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47478 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47478 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1424055 () Bool)

(declare-fun res!958597 () Bool)

(assert (=> b!1424055 (=> res!958597 e!805138)))

(assert (=> b!1424055 (= res!958597 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627278 (select (arr!46927 a!2831) j!81) a!2831 mask!2608) lt!627275)))))

(assert (= (and start!122990 res!958599) b!1424054))

(assert (= (and b!1424054 res!958600) b!1424051))

(assert (= (and b!1424051 res!958591) b!1424042))

(assert (= (and b!1424042 res!958598) b!1424043))

(assert (= (and b!1424043 res!958594) b!1424053))

(assert (= (and b!1424053 res!958592) b!1424045))

(assert (= (and b!1424045 res!958603) b!1424049))

(assert (= (and b!1424049 res!958595) b!1424047))

(assert (= (and b!1424047 res!958601) b!1424041))

(assert (= (and b!1424041 res!958593) b!1424046))

(assert (= (and b!1424046 res!958590) b!1424048))

(assert (= (and b!1424048 res!958588) b!1424050))

(assert (= (and b!1424050 res!958589) b!1424044))

(assert (= (and b!1424050 (not res!958602)) b!1424052))

(assert (= (and b!1424052 (not res!958596)) b!1424055))

(assert (= (and b!1424055 (not res!958597)) b!1424040))

(declare-fun m!1314705 () Bool)

(assert (=> b!1424049 m!1314705))

(assert (=> b!1424049 m!1314705))

(declare-fun m!1314707 () Bool)

(assert (=> b!1424049 m!1314707))

(assert (=> b!1424049 m!1314707))

(assert (=> b!1424049 m!1314705))

(declare-fun m!1314709 () Bool)

(assert (=> b!1424049 m!1314709))

(declare-fun m!1314711 () Bool)

(assert (=> b!1424043 m!1314711))

(declare-fun m!1314713 () Bool)

(assert (=> b!1424053 m!1314713))

(assert (=> b!1424042 m!1314705))

(assert (=> b!1424042 m!1314705))

(declare-fun m!1314715 () Bool)

(assert (=> b!1424042 m!1314715))

(assert (=> b!1424044 m!1314705))

(assert (=> b!1424044 m!1314705))

(declare-fun m!1314717 () Bool)

(assert (=> b!1424044 m!1314717))

(declare-fun m!1314719 () Bool)

(assert (=> b!1424051 m!1314719))

(assert (=> b!1424051 m!1314719))

(declare-fun m!1314721 () Bool)

(assert (=> b!1424051 m!1314721))

(declare-fun m!1314723 () Bool)

(assert (=> b!1424050 m!1314723))

(declare-fun m!1314725 () Bool)

(assert (=> b!1424050 m!1314725))

(declare-fun m!1314727 () Bool)

(assert (=> b!1424050 m!1314727))

(declare-fun m!1314729 () Bool)

(assert (=> b!1424050 m!1314729))

(assert (=> b!1424050 m!1314705))

(declare-fun m!1314731 () Bool)

(assert (=> b!1424050 m!1314731))

(assert (=> b!1424055 m!1314705))

(assert (=> b!1424055 m!1314705))

(declare-fun m!1314733 () Bool)

(assert (=> b!1424055 m!1314733))

(declare-fun m!1314735 () Bool)

(assert (=> b!1424040 m!1314735))

(declare-fun m!1314737 () Bool)

(assert (=> b!1424052 m!1314737))

(declare-fun m!1314739 () Bool)

(assert (=> start!122990 m!1314739))

(declare-fun m!1314741 () Bool)

(assert (=> start!122990 m!1314741))

(declare-fun m!1314743 () Bool)

(assert (=> b!1424046 m!1314743))

(declare-fun m!1314745 () Bool)

(assert (=> b!1424047 m!1314745))

(assert (=> b!1424047 m!1314745))

(declare-fun m!1314747 () Bool)

(assert (=> b!1424047 m!1314747))

(assert (=> b!1424047 m!1314723))

(declare-fun m!1314749 () Bool)

(assert (=> b!1424047 m!1314749))

(assert (=> b!1424041 m!1314705))

(assert (=> b!1424041 m!1314705))

(declare-fun m!1314751 () Bool)

(assert (=> b!1424041 m!1314751))

(check-sat (not b!1424052) (not b!1424043) (not b!1424041) (not b!1424042) (not b!1424051) (not b!1424044) (not b!1424040) (not start!122990) (not b!1424050) (not b!1424055) (not b!1424046) (not b!1424047) (not b!1424053) (not b!1424049))
(check-sat)
