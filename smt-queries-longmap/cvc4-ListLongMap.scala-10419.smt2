; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122680 () Bool)

(assert start!122680)

(declare-fun b!1421179 () Bool)

(declare-fun e!803651 () Bool)

(declare-fun e!803650 () Bool)

(assert (=> b!1421179 (= e!803651 e!803650)))

(declare-fun res!956619 () Bool)

(assert (=> b!1421179 (=> (not res!956619) (not e!803650))))

(declare-fun lt!626157 () (_ BitVec 64))

(declare-datatypes ((array!97045 0))(
  ( (array!97046 (arr!46840 (Array (_ BitVec 32) (_ BitVec 64))) (size!47390 (_ BitVec 32))) )
))
(declare-fun lt!626159 () array!97045)

(declare-datatypes ((SeekEntryResult!11125 0))(
  ( (MissingZero!11125 (index!46892 (_ BitVec 32))) (Found!11125 (index!46893 (_ BitVec 32))) (Intermediate!11125 (undefined!11937 Bool) (index!46894 (_ BitVec 32)) (x!128543 (_ BitVec 32))) (Undefined!11125) (MissingVacant!11125 (index!46895 (_ BitVec 32))) )
))
(declare-fun lt!626160 () SeekEntryResult!11125)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97045 (_ BitVec 32)) SeekEntryResult!11125)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1421179 (= res!956619 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626157 mask!2608) lt!626157 lt!626159 mask!2608) lt!626160))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1421179 (= lt!626160 (Intermediate!11125 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun a!2831 () array!97045)

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1421179 (= lt!626157 (select (store (arr!46840 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1421179 (= lt!626159 (array!97046 (store (arr!46840 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47390 a!2831)))))

(declare-fun b!1421180 () Bool)

(declare-fun res!956617 () Bool)

(declare-fun e!803649 () Bool)

(assert (=> b!1421180 (=> (not res!956617) (not e!803649))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1421180 (= res!956617 (validKeyInArray!0 (select (arr!46840 a!2831) i!982)))))

(declare-fun b!1421181 () Bool)

(declare-fun res!956621 () Bool)

(assert (=> b!1421181 (=> (not res!956621) (not e!803650))))

(declare-fun lt!626158 () SeekEntryResult!11125)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1421181 (= res!956621 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46840 a!2831) j!81) a!2831 mask!2608) lt!626158))))

(declare-fun b!1421182 () Bool)

(declare-fun res!956623 () Bool)

(assert (=> b!1421182 (=> (not res!956623) (not e!803650))))

(assert (=> b!1421182 (= res!956623 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626157 lt!626159 mask!2608) lt!626160))))

(declare-fun b!1421183 () Bool)

(declare-fun res!956615 () Bool)

(assert (=> b!1421183 (=> (not res!956615) (not e!803649))))

(assert (=> b!1421183 (= res!956615 (and (= (size!47390 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47390 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47390 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1421184 () Bool)

(declare-fun res!956616 () Bool)

(assert (=> b!1421184 (=> (not res!956616) (not e!803650))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1421184 (= res!956616 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1421185 () Bool)

(declare-fun res!956613 () Bool)

(assert (=> b!1421185 (=> (not res!956613) (not e!803649))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97045 (_ BitVec 32)) Bool)

(assert (=> b!1421185 (= res!956613 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1421186 () Bool)

(assert (=> b!1421186 (= e!803650 (not true))))

(assert (=> b!1421186 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(declare-datatypes ((Unit!48086 0))(
  ( (Unit!48087) )
))
(declare-fun lt!626156 () Unit!48086)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97045 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48086)

(assert (=> b!1421186 (= lt!626156 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1421187 () Bool)

(declare-fun res!956618 () Bool)

(assert (=> b!1421187 (=> (not res!956618) (not e!803649))))

(assert (=> b!1421187 (= res!956618 (validKeyInArray!0 (select (arr!46840 a!2831) j!81)))))

(declare-fun res!956620 () Bool)

(assert (=> start!122680 (=> (not res!956620) (not e!803649))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122680 (= res!956620 (validMask!0 mask!2608))))

(assert (=> start!122680 e!803649))

(assert (=> start!122680 true))

(declare-fun array_inv!35868 (array!97045) Bool)

(assert (=> start!122680 (array_inv!35868 a!2831)))

(declare-fun b!1421188 () Bool)

(declare-fun res!956614 () Bool)

(assert (=> b!1421188 (=> (not res!956614) (not e!803649))))

(assert (=> b!1421188 (= res!956614 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47390 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47390 a!2831))))))

(declare-fun b!1421189 () Bool)

(assert (=> b!1421189 (= e!803649 e!803651)))

(declare-fun res!956612 () Bool)

(assert (=> b!1421189 (=> (not res!956612) (not e!803651))))

(assert (=> b!1421189 (= res!956612 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46840 a!2831) j!81) mask!2608) (select (arr!46840 a!2831) j!81) a!2831 mask!2608) lt!626158))))

(assert (=> b!1421189 (= lt!626158 (Intermediate!11125 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1421190 () Bool)

(declare-fun res!956622 () Bool)

(assert (=> b!1421190 (=> (not res!956622) (not e!803649))))

(declare-datatypes ((List!33350 0))(
  ( (Nil!33347) (Cons!33346 (h!34648 (_ BitVec 64)) (t!48044 List!33350)) )
))
(declare-fun arrayNoDuplicates!0 (array!97045 (_ BitVec 32) List!33350) Bool)

(assert (=> b!1421190 (= res!956622 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33347))))

(assert (= (and start!122680 res!956620) b!1421183))

(assert (= (and b!1421183 res!956615) b!1421180))

(assert (= (and b!1421180 res!956617) b!1421187))

(assert (= (and b!1421187 res!956618) b!1421185))

(assert (= (and b!1421185 res!956613) b!1421190))

(assert (= (and b!1421190 res!956622) b!1421188))

(assert (= (and b!1421188 res!956614) b!1421189))

(assert (= (and b!1421189 res!956612) b!1421179))

(assert (= (and b!1421179 res!956619) b!1421181))

(assert (= (and b!1421181 res!956621) b!1421182))

(assert (= (and b!1421182 res!956623) b!1421184))

(assert (= (and b!1421184 res!956616) b!1421186))

(declare-fun m!1311723 () Bool)

(assert (=> b!1421181 m!1311723))

(assert (=> b!1421181 m!1311723))

(declare-fun m!1311725 () Bool)

(assert (=> b!1421181 m!1311725))

(declare-fun m!1311727 () Bool)

(assert (=> start!122680 m!1311727))

(declare-fun m!1311729 () Bool)

(assert (=> start!122680 m!1311729))

(declare-fun m!1311731 () Bool)

(assert (=> b!1421180 m!1311731))

(assert (=> b!1421180 m!1311731))

(declare-fun m!1311733 () Bool)

(assert (=> b!1421180 m!1311733))

(declare-fun m!1311735 () Bool)

(assert (=> b!1421182 m!1311735))

(assert (=> b!1421189 m!1311723))

(assert (=> b!1421189 m!1311723))

(declare-fun m!1311737 () Bool)

(assert (=> b!1421189 m!1311737))

(assert (=> b!1421189 m!1311737))

(assert (=> b!1421189 m!1311723))

(declare-fun m!1311739 () Bool)

(assert (=> b!1421189 m!1311739))

(declare-fun m!1311741 () Bool)

(assert (=> b!1421186 m!1311741))

(declare-fun m!1311743 () Bool)

(assert (=> b!1421186 m!1311743))

(declare-fun m!1311745 () Bool)

(assert (=> b!1421185 m!1311745))

(declare-fun m!1311747 () Bool)

(assert (=> b!1421190 m!1311747))

(assert (=> b!1421187 m!1311723))

(assert (=> b!1421187 m!1311723))

(declare-fun m!1311749 () Bool)

(assert (=> b!1421187 m!1311749))

(declare-fun m!1311751 () Bool)

(assert (=> b!1421179 m!1311751))

(assert (=> b!1421179 m!1311751))

(declare-fun m!1311753 () Bool)

(assert (=> b!1421179 m!1311753))

(declare-fun m!1311755 () Bool)

(assert (=> b!1421179 m!1311755))

(declare-fun m!1311757 () Bool)

(assert (=> b!1421179 m!1311757))

(push 1)

(assert (not b!1421185))

(assert (not start!122680))

(assert (not b!1421181))

(assert (not b!1421180))

(assert (not b!1421186))

(assert (not b!1421189))

(assert (not b!1421187))

(assert (not b!1421190))

(assert (not b!1421182))

(assert (not b!1421179))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

