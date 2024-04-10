; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123874 () Bool)

(assert start!123874)

(declare-fun res!968563 () Bool)

(declare-fun e!810180 () Bool)

(assert (=> start!123874 (=> (not res!968563) (not e!810180))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123874 (= res!968563 (validMask!0 mask!2608))))

(assert (=> start!123874 e!810180))

(assert (=> start!123874 true))

(declare-datatypes ((array!97618 0))(
  ( (array!97619 (arr!47110 (Array (_ BitVec 32) (_ BitVec 64))) (size!47660 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97618)

(declare-fun array_inv!36138 (array!97618) Bool)

(assert (=> start!123874 (array_inv!36138 a!2831)))

(declare-fun b!1435553 () Bool)

(declare-fun e!810181 () Bool)

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11389 0))(
  ( (MissingZero!11389 (index!47948 (_ BitVec 32))) (Found!11389 (index!47949 (_ BitVec 32))) (Intermediate!11389 (undefined!12201 Bool) (index!47950 (_ BitVec 32)) (x!129611 (_ BitVec 32))) (Undefined!11389) (MissingVacant!11389 (index!47951 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97618 (_ BitVec 32)) SeekEntryResult!11389)

(assert (=> b!1435553 (= e!810181 (= (seekEntryOrOpen!0 (select (arr!47110 a!2831) j!81) a!2831 mask!2608) (Found!11389 j!81)))))

(declare-fun b!1435554 () Bool)

(declare-fun res!968574 () Bool)

(assert (=> b!1435554 (=> (not res!968574) (not e!810180))))

(declare-datatypes ((List!33620 0))(
  ( (Nil!33617) (Cons!33616 (h!34951 (_ BitVec 64)) (t!48314 List!33620)) )
))
(declare-fun arrayNoDuplicates!0 (array!97618 (_ BitVec 32) List!33620) Bool)

(assert (=> b!1435554 (= res!968574 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33617))))

(declare-fun b!1435555 () Bool)

(declare-fun res!968571 () Bool)

(declare-fun e!810178 () Bool)

(assert (=> b!1435555 (=> (not res!968571) (not e!810178))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(assert (=> b!1435555 (= res!968571 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1435556 () Bool)

(declare-fun res!968562 () Bool)

(assert (=> b!1435556 (=> (not res!968562) (not e!810180))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1435556 (= res!968562 (validKeyInArray!0 (select (arr!47110 a!2831) i!982)))))

(declare-fun b!1435557 () Bool)

(declare-fun e!810176 () Bool)

(assert (=> b!1435557 (= e!810178 (not e!810176))))

(declare-fun res!968561 () Bool)

(assert (=> b!1435557 (=> res!968561 e!810176)))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1435557 (= res!968561 (or (= (select (arr!47110 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47110 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47110 a!2831) index!585) (select (arr!47110 a!2831) j!81)) (= (select (store (arr!47110 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1435557 e!810181))

(declare-fun res!968568 () Bool)

(assert (=> b!1435557 (=> (not res!968568) (not e!810181))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97618 (_ BitVec 32)) Bool)

(assert (=> b!1435557 (= res!968568 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48524 0))(
  ( (Unit!48525) )
))
(declare-fun lt!631926 () Unit!48524)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97618 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48524)

(assert (=> b!1435557 (= lt!631926 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1435558 () Bool)

(declare-fun res!968566 () Bool)

(assert (=> b!1435558 (=> (not res!968566) (not e!810180))))

(assert (=> b!1435558 (= res!968566 (validKeyInArray!0 (select (arr!47110 a!2831) j!81)))))

(declare-fun b!1435559 () Bool)

(declare-fun e!810182 () Bool)

(assert (=> b!1435559 (= e!810182 e!810178)))

(declare-fun res!968567 () Bool)

(assert (=> b!1435559 (=> (not res!968567) (not e!810178))))

(declare-fun lt!631928 () (_ BitVec 64))

(declare-fun lt!631924 () array!97618)

(declare-fun lt!631925 () SeekEntryResult!11389)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97618 (_ BitVec 32)) SeekEntryResult!11389)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1435559 (= res!968567 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!631928 mask!2608) lt!631928 lt!631924 mask!2608) lt!631925))))

(assert (=> b!1435559 (= lt!631925 (Intermediate!11389 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1435559 (= lt!631928 (select (store (arr!47110 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1435559 (= lt!631924 (array!97619 (store (arr!47110 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47660 a!2831)))))

(declare-fun b!1435560 () Bool)

(assert (=> b!1435560 (= e!810180 e!810182)))

(declare-fun res!968564 () Bool)

(assert (=> b!1435560 (=> (not res!968564) (not e!810182))))

(declare-fun lt!631929 () SeekEntryResult!11389)

(assert (=> b!1435560 (= res!968564 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47110 a!2831) j!81) mask!2608) (select (arr!47110 a!2831) j!81) a!2831 mask!2608) lt!631929))))

(assert (=> b!1435560 (= lt!631929 (Intermediate!11389 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1435561 () Bool)

(declare-fun res!968569 () Bool)

(assert (=> b!1435561 (=> (not res!968569) (not e!810178))))

(declare-fun x!605 () (_ BitVec 32))

(assert (=> b!1435561 (= res!968569 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!631928 lt!631924 mask!2608) lt!631925))))

(declare-fun b!1435562 () Bool)

(declare-fun res!968573 () Bool)

(declare-fun e!810179 () Bool)

(assert (=> b!1435562 (=> res!968573 e!810179)))

(declare-fun lt!631927 () (_ BitVec 32))

(assert (=> b!1435562 (= res!968573 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!631927 (select (arr!47110 a!2831) j!81) a!2831 mask!2608) lt!631929)))))

(declare-fun b!1435563 () Bool)

(assert (=> b!1435563 (= e!810179 (bvslt (bvsub #b01111111111111111111111111111110 (bvadd #b00000000000000000000000000000001 x!605)) (bvsub #b01111111111111111111111111111110 x!605)))))

(declare-fun b!1435564 () Bool)

(declare-fun res!968575 () Bool)

(assert (=> b!1435564 (=> (not res!968575) (not e!810180))))

(assert (=> b!1435564 (= res!968575 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1435565 () Bool)

(declare-fun res!968572 () Bool)

(assert (=> b!1435565 (=> (not res!968572) (not e!810180))))

(assert (=> b!1435565 (= res!968572 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47660 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47660 a!2831))))))

(declare-fun b!1435566 () Bool)

(declare-fun res!968559 () Bool)

(assert (=> b!1435566 (=> (not res!968559) (not e!810180))))

(assert (=> b!1435566 (= res!968559 (and (= (size!47660 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47660 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47660 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1435567 () Bool)

(declare-fun res!968560 () Bool)

(assert (=> b!1435567 (=> (not res!968560) (not e!810178))))

(assert (=> b!1435567 (= res!968560 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47110 a!2831) j!81) a!2831 mask!2608) lt!631929))))

(declare-fun b!1435568 () Bool)

(declare-fun res!968565 () Bool)

(assert (=> b!1435568 (=> res!968565 e!810179)))

(assert (=> b!1435568 (= res!968565 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!631927 lt!631928 lt!631924 mask!2608) lt!631925)))))

(declare-fun b!1435569 () Bool)

(assert (=> b!1435569 (= e!810176 e!810179)))

(declare-fun res!968570 () Bool)

(assert (=> b!1435569 (=> res!968570 e!810179)))

(assert (=> b!1435569 (= res!968570 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!631927 #b00000000000000000000000000000000) (bvsge lt!631927 (size!47660 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1435569 (= lt!631927 (nextIndex!0 index!585 x!605 mask!2608))))

(assert (= (and start!123874 res!968563) b!1435566))

(assert (= (and b!1435566 res!968559) b!1435556))

(assert (= (and b!1435556 res!968562) b!1435558))

(assert (= (and b!1435558 res!968566) b!1435564))

(assert (= (and b!1435564 res!968575) b!1435554))

(assert (= (and b!1435554 res!968574) b!1435565))

(assert (= (and b!1435565 res!968572) b!1435560))

(assert (= (and b!1435560 res!968564) b!1435559))

(assert (= (and b!1435559 res!968567) b!1435567))

(assert (= (and b!1435567 res!968560) b!1435561))

(assert (= (and b!1435561 res!968569) b!1435555))

(assert (= (and b!1435555 res!968571) b!1435557))

(assert (= (and b!1435557 res!968568) b!1435553))

(assert (= (and b!1435557 (not res!968561)) b!1435569))

(assert (= (and b!1435569 (not res!968570)) b!1435562))

(assert (= (and b!1435562 (not res!968573)) b!1435568))

(assert (= (and b!1435568 (not res!968565)) b!1435563))

(declare-fun m!1324905 () Bool)

(assert (=> b!1435554 m!1324905))

(declare-fun m!1324907 () Bool)

(assert (=> b!1435560 m!1324907))

(assert (=> b!1435560 m!1324907))

(declare-fun m!1324909 () Bool)

(assert (=> b!1435560 m!1324909))

(assert (=> b!1435560 m!1324909))

(assert (=> b!1435560 m!1324907))

(declare-fun m!1324911 () Bool)

(assert (=> b!1435560 m!1324911))

(declare-fun m!1324913 () Bool)

(assert (=> b!1435561 m!1324913))

(declare-fun m!1324915 () Bool)

(assert (=> b!1435568 m!1324915))

(declare-fun m!1324917 () Bool)

(assert (=> b!1435556 m!1324917))

(assert (=> b!1435556 m!1324917))

(declare-fun m!1324919 () Bool)

(assert (=> b!1435556 m!1324919))

(declare-fun m!1324921 () Bool)

(assert (=> start!123874 m!1324921))

(declare-fun m!1324923 () Bool)

(assert (=> start!123874 m!1324923))

(declare-fun m!1324925 () Bool)

(assert (=> b!1435569 m!1324925))

(assert (=> b!1435562 m!1324907))

(assert (=> b!1435562 m!1324907))

(declare-fun m!1324927 () Bool)

(assert (=> b!1435562 m!1324927))

(declare-fun m!1324929 () Bool)

(assert (=> b!1435557 m!1324929))

(declare-fun m!1324931 () Bool)

(assert (=> b!1435557 m!1324931))

(declare-fun m!1324933 () Bool)

(assert (=> b!1435557 m!1324933))

(declare-fun m!1324935 () Bool)

(assert (=> b!1435557 m!1324935))

(assert (=> b!1435557 m!1324907))

(declare-fun m!1324937 () Bool)

(assert (=> b!1435557 m!1324937))

(declare-fun m!1324939 () Bool)

(assert (=> b!1435564 m!1324939))

(assert (=> b!1435553 m!1324907))

(assert (=> b!1435553 m!1324907))

(declare-fun m!1324941 () Bool)

(assert (=> b!1435553 m!1324941))

(declare-fun m!1324943 () Bool)

(assert (=> b!1435559 m!1324943))

(assert (=> b!1435559 m!1324943))

(declare-fun m!1324945 () Bool)

(assert (=> b!1435559 m!1324945))

(assert (=> b!1435559 m!1324929))

(declare-fun m!1324947 () Bool)

(assert (=> b!1435559 m!1324947))

(assert (=> b!1435567 m!1324907))

(assert (=> b!1435567 m!1324907))

(declare-fun m!1324949 () Bool)

(assert (=> b!1435567 m!1324949))

(assert (=> b!1435558 m!1324907))

(assert (=> b!1435558 m!1324907))

(declare-fun m!1324951 () Bool)

(assert (=> b!1435558 m!1324951))

(push 1)

(assert (not b!1435557))

(assert (not b!1435560))

(assert (not b!1435556))

(assert (not b!1435562))

(assert (not b!1435558))

(assert (not b!1435554))

(assert (not b!1435564))

(assert (not b!1435561))

(assert (not start!123874))

(assert (not b!1435567))

(assert (not b!1435559))

(assert (not b!1435553))

(assert (not b!1435568))

(assert (not b!1435569))

(check-sat)

(pop 1)

(push 1)

(check-sat)

