; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122690 () Bool)

(assert start!122690)

(declare-fun b!1421359 () Bool)

(declare-fun res!956803 () Bool)

(declare-fun e!803709 () Bool)

(assert (=> b!1421359 (=> (not res!956803) (not e!803709))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97055 0))(
  ( (array!97056 (arr!46845 (Array (_ BitVec 32) (_ BitVec 64))) (size!47395 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97055)

(declare-fun index!585 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11130 0))(
  ( (MissingZero!11130 (index!46912 (_ BitVec 32))) (Found!11130 (index!46913 (_ BitVec 32))) (Intermediate!11130 (undefined!11942 Bool) (index!46914 (_ BitVec 32)) (x!128564 (_ BitVec 32))) (Undefined!11130) (MissingVacant!11130 (index!46915 (_ BitVec 32))) )
))
(declare-fun lt!626235 () SeekEntryResult!11130)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97055 (_ BitVec 32)) SeekEntryResult!11130)

(assert (=> b!1421359 (= res!956803 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46845 a!2831) j!81) a!2831 mask!2608) lt!626235))))

(declare-fun b!1421360 () Bool)

(declare-fun res!956792 () Bool)

(declare-fun e!803711 () Bool)

(assert (=> b!1421360 (=> (not res!956792) (not e!803711))))

(declare-datatypes ((List!33355 0))(
  ( (Nil!33352) (Cons!33351 (h!34653 (_ BitVec 64)) (t!48049 List!33355)) )
))
(declare-fun arrayNoDuplicates!0 (array!97055 (_ BitVec 32) List!33355) Bool)

(assert (=> b!1421360 (= res!956792 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33352))))

(declare-fun b!1421361 () Bool)

(declare-fun res!956794 () Bool)

(assert (=> b!1421361 (=> (not res!956794) (not e!803709))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1421361 (= res!956794 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1421362 () Bool)

(declare-fun res!956798 () Bool)

(assert (=> b!1421362 (=> (not res!956798) (not e!803711))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1421362 (= res!956798 (validKeyInArray!0 (select (arr!46845 a!2831) j!81)))))

(declare-fun b!1421363 () Bool)

(declare-fun res!956800 () Bool)

(assert (=> b!1421363 (=> (not res!956800) (not e!803711))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1421363 (= res!956800 (validKeyInArray!0 (select (arr!46845 a!2831) i!982)))))

(declare-fun b!1421364 () Bool)

(assert (=> b!1421364 (= e!803709 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97055 (_ BitVec 32)) Bool)

(assert (=> b!1421364 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(declare-datatypes ((Unit!48096 0))(
  ( (Unit!48097) )
))
(declare-fun lt!626232 () Unit!48096)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97055 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48096)

(assert (=> b!1421364 (= lt!626232 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun res!956795 () Bool)

(assert (=> start!122690 (=> (not res!956795) (not e!803711))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122690 (= res!956795 (validMask!0 mask!2608))))

(assert (=> start!122690 e!803711))

(assert (=> start!122690 true))

(declare-fun array_inv!35873 (array!97055) Bool)

(assert (=> start!122690 (array_inv!35873 a!2831)))

(declare-fun b!1421365 () Bool)

(declare-fun res!956801 () Bool)

(assert (=> b!1421365 (=> (not res!956801) (not e!803711))))

(assert (=> b!1421365 (= res!956801 (and (= (size!47395 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47395 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47395 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1421366 () Bool)

(declare-fun e!803710 () Bool)

(assert (=> b!1421366 (= e!803710 e!803709)))

(declare-fun res!956796 () Bool)

(assert (=> b!1421366 (=> (not res!956796) (not e!803709))))

(declare-fun lt!626233 () SeekEntryResult!11130)

(declare-fun lt!626231 () (_ BitVec 64))

(declare-fun lt!626234 () array!97055)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1421366 (= res!956796 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626231 mask!2608) lt!626231 lt!626234 mask!2608) lt!626233))))

(assert (=> b!1421366 (= lt!626233 (Intermediate!11130 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1421366 (= lt!626231 (select (store (arr!46845 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1421366 (= lt!626234 (array!97056 (store (arr!46845 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47395 a!2831)))))

(declare-fun b!1421367 () Bool)

(declare-fun res!956802 () Bool)

(assert (=> b!1421367 (=> (not res!956802) (not e!803711))))

(assert (=> b!1421367 (= res!956802 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1421368 () Bool)

(declare-fun res!956799 () Bool)

(assert (=> b!1421368 (=> (not res!956799) (not e!803711))))

(assert (=> b!1421368 (= res!956799 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47395 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47395 a!2831))))))

(declare-fun b!1421369 () Bool)

(declare-fun res!956793 () Bool)

(assert (=> b!1421369 (=> (not res!956793) (not e!803709))))

(assert (=> b!1421369 (= res!956793 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626231 lt!626234 mask!2608) lt!626233))))

(declare-fun b!1421370 () Bool)

(assert (=> b!1421370 (= e!803711 e!803710)))

(declare-fun res!956797 () Bool)

(assert (=> b!1421370 (=> (not res!956797) (not e!803710))))

(assert (=> b!1421370 (= res!956797 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46845 a!2831) j!81) mask!2608) (select (arr!46845 a!2831) j!81) a!2831 mask!2608) lt!626235))))

(assert (=> b!1421370 (= lt!626235 (Intermediate!11130 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(assert (= (and start!122690 res!956795) b!1421365))

(assert (= (and b!1421365 res!956801) b!1421363))

(assert (= (and b!1421363 res!956800) b!1421362))

(assert (= (and b!1421362 res!956798) b!1421367))

(assert (= (and b!1421367 res!956802) b!1421360))

(assert (= (and b!1421360 res!956792) b!1421368))

(assert (= (and b!1421368 res!956799) b!1421370))

(assert (= (and b!1421370 res!956797) b!1421366))

(assert (= (and b!1421366 res!956796) b!1421359))

(assert (= (and b!1421359 res!956803) b!1421369))

(assert (= (and b!1421369 res!956793) b!1421361))

(assert (= (and b!1421361 res!956794) b!1421364))

(declare-fun m!1311903 () Bool)

(assert (=> b!1421367 m!1311903))

(declare-fun m!1311905 () Bool)

(assert (=> start!122690 m!1311905))

(declare-fun m!1311907 () Bool)

(assert (=> start!122690 m!1311907))

(declare-fun m!1311909 () Bool)

(assert (=> b!1421359 m!1311909))

(assert (=> b!1421359 m!1311909))

(declare-fun m!1311911 () Bool)

(assert (=> b!1421359 m!1311911))

(declare-fun m!1311913 () Bool)

(assert (=> b!1421369 m!1311913))

(declare-fun m!1311915 () Bool)

(assert (=> b!1421366 m!1311915))

(assert (=> b!1421366 m!1311915))

(declare-fun m!1311917 () Bool)

(assert (=> b!1421366 m!1311917))

(declare-fun m!1311919 () Bool)

(assert (=> b!1421366 m!1311919))

(declare-fun m!1311921 () Bool)

(assert (=> b!1421366 m!1311921))

(assert (=> b!1421370 m!1311909))

(assert (=> b!1421370 m!1311909))

(declare-fun m!1311923 () Bool)

(assert (=> b!1421370 m!1311923))

(assert (=> b!1421370 m!1311923))

(assert (=> b!1421370 m!1311909))

(declare-fun m!1311925 () Bool)

(assert (=> b!1421370 m!1311925))

(declare-fun m!1311927 () Bool)

(assert (=> b!1421360 m!1311927))

(assert (=> b!1421362 m!1311909))

(assert (=> b!1421362 m!1311909))

(declare-fun m!1311929 () Bool)

(assert (=> b!1421362 m!1311929))

(declare-fun m!1311931 () Bool)

(assert (=> b!1421363 m!1311931))

(assert (=> b!1421363 m!1311931))

(declare-fun m!1311933 () Bool)

(assert (=> b!1421363 m!1311933))

(declare-fun m!1311935 () Bool)

(assert (=> b!1421364 m!1311935))

(declare-fun m!1311937 () Bool)

(assert (=> b!1421364 m!1311937))

(check-sat (not b!1421370) (not start!122690) (not b!1421359) (not b!1421367) (not b!1421369) (not b!1421360) (not b!1421364) (not b!1421366) (not b!1421362) (not b!1421363))
(check-sat)
