; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122684 () Bool)

(assert start!122684)

(declare-fun b!1421251 () Bool)

(declare-fun e!803673 () Bool)

(declare-fun e!803675 () Bool)

(assert (=> b!1421251 (= e!803673 e!803675)))

(declare-fun res!956693 () Bool)

(assert (=> b!1421251 (=> (not res!956693) (not e!803675))))

(declare-datatypes ((array!97049 0))(
  ( (array!97050 (arr!46842 (Array (_ BitVec 32) (_ BitVec 64))) (size!47392 (_ BitVec 32))) )
))
(declare-fun lt!626187 () array!97049)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun lt!626188 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11127 0))(
  ( (MissingZero!11127 (index!46900 (_ BitVec 32))) (Found!11127 (index!46901 (_ BitVec 32))) (Intermediate!11127 (undefined!11939 Bool) (index!46902 (_ BitVec 32)) (x!128553 (_ BitVec 32))) (Undefined!11127) (MissingVacant!11127 (index!46903 (_ BitVec 32))) )
))
(declare-fun lt!626186 () SeekEntryResult!11127)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97049 (_ BitVec 32)) SeekEntryResult!11127)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1421251 (= res!956693 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626188 mask!2608) lt!626188 lt!626187 mask!2608) lt!626186))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(assert (=> b!1421251 (= lt!626186 (Intermediate!11127 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun a!2831 () array!97049)

(assert (=> b!1421251 (= lt!626188 (select (store (arr!46842 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1421251 (= lt!626187 (array!97050 (store (arr!46842 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47392 a!2831)))))

(declare-fun b!1421252 () Bool)

(declare-fun res!956690 () Bool)

(declare-fun e!803674 () Bool)

(assert (=> b!1421252 (=> (not res!956690) (not e!803674))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1421252 (= res!956690 (validKeyInArray!0 (select (arr!46842 a!2831) j!81)))))

(declare-fun b!1421253 () Bool)

(declare-fun res!956688 () Bool)

(assert (=> b!1421253 (=> (not res!956688) (not e!803675))))

(declare-fun lt!626189 () SeekEntryResult!11127)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1421253 (= res!956688 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46842 a!2831) j!81) a!2831 mask!2608) lt!626189))))

(declare-fun b!1421254 () Bool)

(declare-fun res!956694 () Bool)

(assert (=> b!1421254 (=> (not res!956694) (not e!803674))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97049 (_ BitVec 32)) Bool)

(assert (=> b!1421254 (= res!956694 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1421255 () Bool)

(declare-fun res!956695 () Bool)

(assert (=> b!1421255 (=> (not res!956695) (not e!803674))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1421255 (= res!956695 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47392 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47392 a!2831))))))

(declare-fun b!1421256 () Bool)

(assert (=> b!1421256 (= e!803674 e!803673)))

(declare-fun res!956689 () Bool)

(assert (=> b!1421256 (=> (not res!956689) (not e!803673))))

(assert (=> b!1421256 (= res!956689 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46842 a!2831) j!81) mask!2608) (select (arr!46842 a!2831) j!81) a!2831 mask!2608) lt!626189))))

(assert (=> b!1421256 (= lt!626189 (Intermediate!11127 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1421258 () Bool)

(assert (=> b!1421258 (= e!803675 (not (bvsge mask!2608 #b00000000000000000000000000000000)))))

(assert (=> b!1421258 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(declare-datatypes ((Unit!48090 0))(
  ( (Unit!48091) )
))
(declare-fun lt!626190 () Unit!48090)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97049 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48090)

(assert (=> b!1421258 (= lt!626190 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1421259 () Bool)

(declare-fun res!956692 () Bool)

(assert (=> b!1421259 (=> (not res!956692) (not e!803674))))

(assert (=> b!1421259 (= res!956692 (validKeyInArray!0 (select (arr!46842 a!2831) i!982)))))

(declare-fun b!1421260 () Bool)

(declare-fun res!956691 () Bool)

(assert (=> b!1421260 (=> (not res!956691) (not e!803674))))

(assert (=> b!1421260 (= res!956691 (and (= (size!47392 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47392 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47392 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1421261 () Bool)

(declare-fun res!956687 () Bool)

(assert (=> b!1421261 (=> (not res!956687) (not e!803675))))

(assert (=> b!1421261 (= res!956687 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626188 lt!626187 mask!2608) lt!626186))))

(declare-fun b!1421262 () Bool)

(declare-fun res!956684 () Bool)

(assert (=> b!1421262 (=> (not res!956684) (not e!803674))))

(declare-datatypes ((List!33352 0))(
  ( (Nil!33349) (Cons!33348 (h!34650 (_ BitVec 64)) (t!48046 List!33352)) )
))
(declare-fun arrayNoDuplicates!0 (array!97049 (_ BitVec 32) List!33352) Bool)

(assert (=> b!1421262 (= res!956684 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33349))))

(declare-fun res!956685 () Bool)

(assert (=> start!122684 (=> (not res!956685) (not e!803674))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122684 (= res!956685 (validMask!0 mask!2608))))

(assert (=> start!122684 e!803674))

(assert (=> start!122684 true))

(declare-fun array_inv!35870 (array!97049) Bool)

(assert (=> start!122684 (array_inv!35870 a!2831)))

(declare-fun b!1421257 () Bool)

(declare-fun res!956686 () Bool)

(assert (=> b!1421257 (=> (not res!956686) (not e!803675))))

(assert (=> b!1421257 (= res!956686 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(assert (= (and start!122684 res!956685) b!1421260))

(assert (= (and b!1421260 res!956691) b!1421259))

(assert (= (and b!1421259 res!956692) b!1421252))

(assert (= (and b!1421252 res!956690) b!1421254))

(assert (= (and b!1421254 res!956694) b!1421262))

(assert (= (and b!1421262 res!956684) b!1421255))

(assert (= (and b!1421255 res!956695) b!1421256))

(assert (= (and b!1421256 res!956689) b!1421251))

(assert (= (and b!1421251 res!956693) b!1421253))

(assert (= (and b!1421253 res!956688) b!1421261))

(assert (= (and b!1421261 res!956687) b!1421257))

(assert (= (and b!1421257 res!956686) b!1421258))

(declare-fun m!1311795 () Bool)

(assert (=> b!1421251 m!1311795))

(assert (=> b!1421251 m!1311795))

(declare-fun m!1311797 () Bool)

(assert (=> b!1421251 m!1311797))

(declare-fun m!1311799 () Bool)

(assert (=> b!1421251 m!1311799))

(declare-fun m!1311801 () Bool)

(assert (=> b!1421251 m!1311801))

(declare-fun m!1311803 () Bool)

(assert (=> b!1421252 m!1311803))

(assert (=> b!1421252 m!1311803))

(declare-fun m!1311805 () Bool)

(assert (=> b!1421252 m!1311805))

(declare-fun m!1311807 () Bool)

(assert (=> b!1421258 m!1311807))

(declare-fun m!1311809 () Bool)

(assert (=> b!1421258 m!1311809))

(declare-fun m!1311811 () Bool)

(assert (=> b!1421261 m!1311811))

(assert (=> b!1421256 m!1311803))

(assert (=> b!1421256 m!1311803))

(declare-fun m!1311813 () Bool)

(assert (=> b!1421256 m!1311813))

(assert (=> b!1421256 m!1311813))

(assert (=> b!1421256 m!1311803))

(declare-fun m!1311815 () Bool)

(assert (=> b!1421256 m!1311815))

(declare-fun m!1311817 () Bool)

(assert (=> start!122684 m!1311817))

(declare-fun m!1311819 () Bool)

(assert (=> start!122684 m!1311819))

(declare-fun m!1311821 () Bool)

(assert (=> b!1421262 m!1311821))

(declare-fun m!1311823 () Bool)

(assert (=> b!1421254 m!1311823))

(declare-fun m!1311825 () Bool)

(assert (=> b!1421259 m!1311825))

(assert (=> b!1421259 m!1311825))

(declare-fun m!1311827 () Bool)

(assert (=> b!1421259 m!1311827))

(assert (=> b!1421253 m!1311803))

(assert (=> b!1421253 m!1311803))

(declare-fun m!1311829 () Bool)

(assert (=> b!1421253 m!1311829))

(check-sat (not b!1421254) (not b!1421251) (not b!1421261) (not b!1421256) (not b!1421258) (not b!1421252) (not start!122684) (not b!1421262) (not b!1421259) (not b!1421253))
(check-sat)
