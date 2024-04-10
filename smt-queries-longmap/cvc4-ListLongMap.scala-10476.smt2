; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123238 () Bool)

(assert start!123238)

(declare-fun b!1428903 () Bool)

(declare-fun res!963537 () Bool)

(declare-fun e!806935 () Bool)

(assert (=> b!1428903 (=> (not res!963537) (not e!806935))))

(declare-datatypes ((array!97399 0))(
  ( (array!97400 (arr!47011 (Array (_ BitVec 32) (_ BitVec 64))) (size!47561 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97399)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1428903 (= res!963537 (validKeyInArray!0 (select (arr!47011 a!2831) j!81)))))

(declare-fun b!1428904 () Bool)

(declare-fun res!963540 () Bool)

(declare-fun e!806932 () Bool)

(assert (=> b!1428904 (=> (not res!963540) (not e!806932))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1428904 (= res!963540 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1428905 () Bool)

(declare-fun e!806936 () Bool)

(assert (=> b!1428905 (= e!806935 e!806936)))

(declare-fun res!963541 () Bool)

(assert (=> b!1428905 (=> (not res!963541) (not e!806936))))

(declare-datatypes ((SeekEntryResult!11290 0))(
  ( (MissingZero!11290 (index!47552 (_ BitVec 32))) (Found!11290 (index!47553 (_ BitVec 32))) (Intermediate!11290 (undefined!12102 Bool) (index!47554 (_ BitVec 32)) (x!129188 (_ BitVec 32))) (Undefined!11290) (MissingVacant!11290 (index!47555 (_ BitVec 32))) )
))
(declare-fun lt!629159 () SeekEntryResult!11290)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97399 (_ BitVec 32)) SeekEntryResult!11290)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1428905 (= res!963541 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47011 a!2831) j!81) mask!2608) (select (arr!47011 a!2831) j!81) a!2831 mask!2608) lt!629159))))

(assert (=> b!1428905 (= lt!629159 (Intermediate!11290 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1428906 () Bool)

(declare-fun res!963535 () Bool)

(assert (=> b!1428906 (=> (not res!963535) (not e!806935))))

(declare-datatypes ((List!33521 0))(
  ( (Nil!33518) (Cons!33517 (h!34831 (_ BitVec 64)) (t!48215 List!33521)) )
))
(declare-fun arrayNoDuplicates!0 (array!97399 (_ BitVec 32) List!33521) Bool)

(assert (=> b!1428906 (= res!963535 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33518))))

(declare-fun b!1428907 () Bool)

(declare-fun e!806934 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97399 (_ BitVec 32)) SeekEntryResult!11290)

(assert (=> b!1428907 (= e!806934 (= (seekEntryOrOpen!0 (select (arr!47011 a!2831) j!81) a!2831 mask!2608) (Found!11290 j!81)))))

(declare-fun b!1428908 () Bool)

(declare-fun res!963532 () Bool)

(assert (=> b!1428908 (=> (not res!963532) (not e!806932))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1428908 (= res!963532 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47011 a!2831) j!81) a!2831 mask!2608) lt!629159))))

(declare-fun res!963542 () Bool)

(assert (=> start!123238 (=> (not res!963542) (not e!806935))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123238 (= res!963542 (validMask!0 mask!2608))))

(assert (=> start!123238 e!806935))

(assert (=> start!123238 true))

(declare-fun array_inv!36039 (array!97399) Bool)

(assert (=> start!123238 (array_inv!36039 a!2831)))

(declare-fun b!1428909 () Bool)

(assert (=> b!1428909 (= e!806932 (not true))))

(assert (=> b!1428909 e!806934))

(declare-fun res!963533 () Bool)

(assert (=> b!1428909 (=> (not res!963533) (not e!806934))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97399 (_ BitVec 32)) Bool)

(assert (=> b!1428909 (= res!963533 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48326 0))(
  ( (Unit!48327) )
))
(declare-fun lt!629162 () Unit!48326)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97399 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48326)

(assert (=> b!1428909 (= lt!629162 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1428910 () Bool)

(declare-fun res!963539 () Bool)

(assert (=> b!1428910 (=> (not res!963539) (not e!806935))))

(assert (=> b!1428910 (= res!963539 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1428911 () Bool)

(declare-fun res!963534 () Bool)

(assert (=> b!1428911 (=> (not res!963534) (not e!806935))))

(assert (=> b!1428911 (= res!963534 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47561 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47561 a!2831))))))

(declare-fun b!1428912 () Bool)

(assert (=> b!1428912 (= e!806936 e!806932)))

(declare-fun res!963538 () Bool)

(assert (=> b!1428912 (=> (not res!963538) (not e!806932))))

(declare-fun lt!629160 () array!97399)

(declare-fun lt!629161 () SeekEntryResult!11290)

(declare-fun lt!629163 () (_ BitVec 64))

(assert (=> b!1428912 (= res!963538 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!629163 mask!2608) lt!629163 lt!629160 mask!2608) lt!629161))))

(assert (=> b!1428912 (= lt!629161 (Intermediate!11290 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1428912 (= lt!629163 (select (store (arr!47011 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1428912 (= lt!629160 (array!97400 (store (arr!47011 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47561 a!2831)))))

(declare-fun b!1428913 () Bool)

(declare-fun res!963536 () Bool)

(assert (=> b!1428913 (=> (not res!963536) (not e!806935))))

(assert (=> b!1428913 (= res!963536 (validKeyInArray!0 (select (arr!47011 a!2831) i!982)))))

(declare-fun b!1428914 () Bool)

(declare-fun res!963543 () Bool)

(assert (=> b!1428914 (=> (not res!963543) (not e!806932))))

(assert (=> b!1428914 (= res!963543 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!629163 lt!629160 mask!2608) lt!629161))))

(declare-fun b!1428915 () Bool)

(declare-fun res!963544 () Bool)

(assert (=> b!1428915 (=> (not res!963544) (not e!806935))))

(assert (=> b!1428915 (= res!963544 (and (= (size!47561 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47561 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47561 a!2831)) (not (= i!982 j!81))))))

(assert (= (and start!123238 res!963542) b!1428915))

(assert (= (and b!1428915 res!963544) b!1428913))

(assert (= (and b!1428913 res!963536) b!1428903))

(assert (= (and b!1428903 res!963537) b!1428910))

(assert (= (and b!1428910 res!963539) b!1428906))

(assert (= (and b!1428906 res!963535) b!1428911))

(assert (= (and b!1428911 res!963534) b!1428905))

(assert (= (and b!1428905 res!963541) b!1428912))

(assert (= (and b!1428912 res!963538) b!1428908))

(assert (= (and b!1428908 res!963532) b!1428914))

(assert (= (and b!1428914 res!963543) b!1428904))

(assert (= (and b!1428904 res!963540) b!1428909))

(assert (= (and b!1428909 res!963533) b!1428907))

(declare-fun m!1319017 () Bool)

(assert (=> b!1428903 m!1319017))

(assert (=> b!1428903 m!1319017))

(declare-fun m!1319019 () Bool)

(assert (=> b!1428903 m!1319019))

(declare-fun m!1319021 () Bool)

(assert (=> b!1428909 m!1319021))

(declare-fun m!1319023 () Bool)

(assert (=> b!1428909 m!1319023))

(declare-fun m!1319025 () Bool)

(assert (=> b!1428913 m!1319025))

(assert (=> b!1428913 m!1319025))

(declare-fun m!1319027 () Bool)

(assert (=> b!1428913 m!1319027))

(assert (=> b!1428908 m!1319017))

(assert (=> b!1428908 m!1319017))

(declare-fun m!1319029 () Bool)

(assert (=> b!1428908 m!1319029))

(declare-fun m!1319031 () Bool)

(assert (=> b!1428912 m!1319031))

(assert (=> b!1428912 m!1319031))

(declare-fun m!1319033 () Bool)

(assert (=> b!1428912 m!1319033))

(declare-fun m!1319035 () Bool)

(assert (=> b!1428912 m!1319035))

(declare-fun m!1319037 () Bool)

(assert (=> b!1428912 m!1319037))

(assert (=> b!1428907 m!1319017))

(assert (=> b!1428907 m!1319017))

(declare-fun m!1319039 () Bool)

(assert (=> b!1428907 m!1319039))

(declare-fun m!1319041 () Bool)

(assert (=> b!1428910 m!1319041))

(declare-fun m!1319043 () Bool)

(assert (=> b!1428906 m!1319043))

(assert (=> b!1428905 m!1319017))

(assert (=> b!1428905 m!1319017))

(declare-fun m!1319045 () Bool)

(assert (=> b!1428905 m!1319045))

(assert (=> b!1428905 m!1319045))

(assert (=> b!1428905 m!1319017))

(declare-fun m!1319047 () Bool)

(assert (=> b!1428905 m!1319047))

(declare-fun m!1319049 () Bool)

(assert (=> start!123238 m!1319049))

(declare-fun m!1319051 () Bool)

(assert (=> start!123238 m!1319051))

(declare-fun m!1319053 () Bool)

(assert (=> b!1428914 m!1319053))

(push 1)

