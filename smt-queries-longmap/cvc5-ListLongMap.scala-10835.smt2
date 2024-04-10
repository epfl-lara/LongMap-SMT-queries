; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126856 () Bool)

(assert start!126856)

(declare-fun e!834936 () Bool)

(declare-fun b!1489860 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun lt!649727 () (_ BitVec 64))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((array!99629 0))(
  ( (array!99630 (arr!48086 (Array (_ BitVec 32) (_ BitVec 64))) (size!48636 (_ BitVec 32))) )
))
(declare-fun lt!649724 () array!99629)

(declare-datatypes ((SeekEntryResult!12326 0))(
  ( (MissingZero!12326 (index!51696 (_ BitVec 32))) (Found!12326 (index!51697 (_ BitVec 32))) (Intermediate!12326 (undefined!13138 Bool) (index!51698 (_ BitVec 32)) (x!133294 (_ BitVec 32))) (Undefined!12326) (MissingVacant!12326 (index!51699 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99629 (_ BitVec 32)) SeekEntryResult!12326)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99629 (_ BitVec 32)) SeekEntryResult!12326)

(assert (=> b!1489860 (= e!834936 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649727 lt!649724 mask!2687) (seekEntryOrOpen!0 lt!649727 lt!649724 mask!2687)))))

(declare-fun b!1489861 () Bool)

(declare-fun res!1013232 () Bool)

(declare-fun e!834939 () Bool)

(assert (=> b!1489861 (=> (not res!1013232) (not e!834939))))

(assert (=> b!1489861 (= res!1013232 e!834936)))

(declare-fun c!137844 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1489861 (= c!137844 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1489862 () Bool)

(declare-fun e!834940 () Bool)

(assert (=> b!1489862 (= e!834940 e!834939)))

(declare-fun res!1013241 () Bool)

(assert (=> b!1489862 (=> (not res!1013241) (not e!834939))))

(declare-fun lt!649730 () SeekEntryResult!12326)

(assert (=> b!1489862 (= res!1013241 (= lt!649730 (Intermediate!12326 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99629 (_ BitVec 32)) SeekEntryResult!12326)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1489862 (= lt!649730 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!649727 mask!2687) lt!649727 lt!649724 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!99629)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1489862 (= lt!649727 (select (store (arr!48086 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1489863 () Bool)

(declare-fun res!1013238 () Bool)

(declare-fun e!834937 () Bool)

(assert (=> b!1489863 (=> (not res!1013238) (not e!834937))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99629 (_ BitVec 32)) Bool)

(assert (=> b!1489863 (= res!1013238 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1489865 () Bool)

(declare-fun res!1013235 () Bool)

(declare-fun e!834941 () Bool)

(assert (=> b!1489865 (=> res!1013235 e!834941)))

(declare-fun e!834943 () Bool)

(assert (=> b!1489865 (= res!1013235 e!834943)))

(declare-fun c!137843 () Bool)

(assert (=> b!1489865 (= c!137843 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1489866 () Bool)

(declare-fun res!1013240 () Bool)

(assert (=> b!1489866 (=> res!1013240 e!834941)))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1489866 (= res!1013240 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1489867 () Bool)

(declare-fun res!1013243 () Bool)

(assert (=> b!1489867 (=> (not res!1013243) (not e!834937))))

(declare-datatypes ((List!34587 0))(
  ( (Nil!34584) (Cons!34583 (h!35966 (_ BitVec 64)) (t!49281 List!34587)) )
))
(declare-fun arrayNoDuplicates!0 (array!99629 (_ BitVec 32) List!34587) Bool)

(assert (=> b!1489867 (= res!1013243 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34584))))

(declare-fun b!1489868 () Bool)

(declare-fun res!1013236 () Bool)

(assert (=> b!1489868 (=> res!1013236 e!834941)))

(declare-fun lt!649728 () SeekEntryResult!12326)

(declare-fun lt!649725 () (_ BitVec 32))

(assert (=> b!1489868 (= res!1013236 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649725 (select (arr!48086 a!2862) j!93) a!2862 mask!2687) lt!649728)))))

(declare-fun b!1489869 () Bool)

(assert (=> b!1489869 (= e!834943 (not (= lt!649730 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649725 lt!649727 lt!649724 mask!2687))))))

(declare-fun b!1489870 () Bool)

(declare-fun res!1013228 () Bool)

(assert (=> b!1489870 (=> (not res!1013228) (not e!834939))))

(assert (=> b!1489870 (= res!1013228 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1489871 () Bool)

(declare-fun res!1013234 () Bool)

(assert (=> b!1489871 (=> (not res!1013234) (not e!834940))))

(assert (=> b!1489871 (= res!1013234 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48086 a!2862) j!93) a!2862 mask!2687) lt!649728))))

(declare-fun b!1489872 () Bool)

(declare-fun res!1013233 () Bool)

(assert (=> b!1489872 (=> (not res!1013233) (not e!834937))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1489872 (= res!1013233 (validKeyInArray!0 (select (arr!48086 a!2862) i!1006)))))

(declare-fun b!1489873 () Bool)

(declare-fun e!834938 () Bool)

(assert (=> b!1489873 (= e!834938 e!834941)))

(declare-fun res!1013237 () Bool)

(assert (=> b!1489873 (=> res!1013237 e!834941)))

(assert (=> b!1489873 (= res!1013237 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!649725 #b00000000000000000000000000000000) (bvsge lt!649725 (size!48636 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1489873 (= lt!649725 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun lt!649723 () SeekEntryResult!12326)

(assert (=> b!1489873 (= lt!649723 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649727 lt!649724 mask!2687))))

(assert (=> b!1489873 (= lt!649723 (seekEntryOrOpen!0 lt!649727 lt!649724 mask!2687))))

(declare-fun b!1489874 () Bool)

(assert (=> b!1489874 (= e!834936 (= lt!649730 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!649727 lt!649724 mask!2687)))))

(declare-fun b!1489875 () Bool)

(assert (=> b!1489875 (= e!834941 true)))

(declare-fun lt!649729 () SeekEntryResult!12326)

(assert (=> b!1489875 (= lt!649729 lt!649723)))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-datatypes ((Unit!49992 0))(
  ( (Unit!49993) )
))
(declare-fun lt!649726 () Unit!49992)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!99629 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49992)

(assert (=> b!1489875 (= lt!649726 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!649725 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1489864 () Bool)

(declare-fun e!834944 () Bool)

(assert (=> b!1489864 (= e!834937 e!834944)))

(declare-fun res!1013242 () Bool)

(assert (=> b!1489864 (=> (not res!1013242) (not e!834944))))

(assert (=> b!1489864 (= res!1013242 (= (select (store (arr!48086 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1489864 (= lt!649724 (array!99630 (store (arr!48086 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48636 a!2862)))))

(declare-fun res!1013229 () Bool)

(assert (=> start!126856 (=> (not res!1013229) (not e!834937))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126856 (= res!1013229 (validMask!0 mask!2687))))

(assert (=> start!126856 e!834937))

(assert (=> start!126856 true))

(declare-fun array_inv!37114 (array!99629) Bool)

(assert (=> start!126856 (array_inv!37114 a!2862)))

(declare-fun b!1489876 () Bool)

(declare-fun res!1013245 () Bool)

(assert (=> b!1489876 (=> (not res!1013245) (not e!834937))))

(assert (=> b!1489876 (= res!1013245 (validKeyInArray!0 (select (arr!48086 a!2862) j!93)))))

(declare-fun b!1489877 () Bool)

(declare-fun res!1013239 () Bool)

(assert (=> b!1489877 (=> (not res!1013239) (not e!834937))))

(assert (=> b!1489877 (= res!1013239 (and (= (size!48636 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48636 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48636 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1489878 () Bool)

(declare-fun res!1013231 () Bool)

(assert (=> b!1489878 (=> (not res!1013231) (not e!834937))))

(assert (=> b!1489878 (= res!1013231 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48636 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48636 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48636 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1489879 () Bool)

(assert (=> b!1489879 (= e!834939 (not e!834938))))

(declare-fun res!1013230 () Bool)

(assert (=> b!1489879 (=> res!1013230 e!834938)))

(assert (=> b!1489879 (= res!1013230 (or (and (= (select (arr!48086 a!2862) index!646) (select (store (arr!48086 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48086 a!2862) index!646) (select (arr!48086 a!2862) j!93))) (= (select (arr!48086 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1489879 (and (= lt!649729 (Found!12326 j!93)) (or (= (select (arr!48086 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48086 a!2862) intermediateBeforeIndex!19) (select (arr!48086 a!2862) j!93))) (let ((bdg!54754 (select (store (arr!48086 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!48086 a!2862) index!646) bdg!54754) (= (select (arr!48086 a!2862) index!646) (select (arr!48086 a!2862) j!93))) (= (select (arr!48086 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!54754 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!1489879 (= lt!649729 (seekEntryOrOpen!0 (select (arr!48086 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1489879 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!649731 () Unit!49992)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99629 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49992)

(assert (=> b!1489879 (= lt!649731 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1489880 () Bool)

(assert (=> b!1489880 (= e!834944 e!834940)))

(declare-fun res!1013244 () Bool)

(assert (=> b!1489880 (=> (not res!1013244) (not e!834940))))

(assert (=> b!1489880 (= res!1013244 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48086 a!2862) j!93) mask!2687) (select (arr!48086 a!2862) j!93) a!2862 mask!2687) lt!649728))))

(assert (=> b!1489880 (= lt!649728 (Intermediate!12326 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1489881 () Bool)

(assert (=> b!1489881 (= e!834943 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649725 intermediateAfterIndex!19 lt!649727 lt!649724 mask!2687) lt!649723)))))

(assert (= (and start!126856 res!1013229) b!1489877))

(assert (= (and b!1489877 res!1013239) b!1489872))

(assert (= (and b!1489872 res!1013233) b!1489876))

(assert (= (and b!1489876 res!1013245) b!1489863))

(assert (= (and b!1489863 res!1013238) b!1489867))

(assert (= (and b!1489867 res!1013243) b!1489878))

(assert (= (and b!1489878 res!1013231) b!1489864))

(assert (= (and b!1489864 res!1013242) b!1489880))

(assert (= (and b!1489880 res!1013244) b!1489871))

(assert (= (and b!1489871 res!1013234) b!1489862))

(assert (= (and b!1489862 res!1013241) b!1489861))

(assert (= (and b!1489861 c!137844) b!1489874))

(assert (= (and b!1489861 (not c!137844)) b!1489860))

(assert (= (and b!1489861 res!1013232) b!1489870))

(assert (= (and b!1489870 res!1013228) b!1489879))

(assert (= (and b!1489879 (not res!1013230)) b!1489873))

(assert (= (and b!1489873 (not res!1013237)) b!1489868))

(assert (= (and b!1489868 (not res!1013236)) b!1489865))

(assert (= (and b!1489865 c!137843) b!1489869))

(assert (= (and b!1489865 (not c!137843)) b!1489881))

(assert (= (and b!1489865 (not res!1013235)) b!1489866))

(assert (= (and b!1489866 (not res!1013240)) b!1489875))

(declare-fun m!1374055 () Bool)

(assert (=> b!1489880 m!1374055))

(assert (=> b!1489880 m!1374055))

(declare-fun m!1374057 () Bool)

(assert (=> b!1489880 m!1374057))

(assert (=> b!1489880 m!1374057))

(assert (=> b!1489880 m!1374055))

(declare-fun m!1374059 () Bool)

(assert (=> b!1489880 m!1374059))

(declare-fun m!1374061 () Bool)

(assert (=> b!1489874 m!1374061))

(declare-fun m!1374063 () Bool)

(assert (=> b!1489860 m!1374063))

(declare-fun m!1374065 () Bool)

(assert (=> b!1489860 m!1374065))

(declare-fun m!1374067 () Bool)

(assert (=> b!1489864 m!1374067))

(declare-fun m!1374069 () Bool)

(assert (=> b!1489864 m!1374069))

(declare-fun m!1374071 () Bool)

(assert (=> b!1489863 m!1374071))

(declare-fun m!1374073 () Bool)

(assert (=> start!126856 m!1374073))

(declare-fun m!1374075 () Bool)

(assert (=> start!126856 m!1374075))

(assert (=> b!1489868 m!1374055))

(assert (=> b!1489868 m!1374055))

(declare-fun m!1374077 () Bool)

(assert (=> b!1489868 m!1374077))

(declare-fun m!1374079 () Bool)

(assert (=> b!1489862 m!1374079))

(assert (=> b!1489862 m!1374079))

(declare-fun m!1374081 () Bool)

(assert (=> b!1489862 m!1374081))

(assert (=> b!1489862 m!1374067))

(declare-fun m!1374083 () Bool)

(assert (=> b!1489862 m!1374083))

(declare-fun m!1374085 () Bool)

(assert (=> b!1489875 m!1374085))

(assert (=> b!1489871 m!1374055))

(assert (=> b!1489871 m!1374055))

(declare-fun m!1374087 () Bool)

(assert (=> b!1489871 m!1374087))

(declare-fun m!1374089 () Bool)

(assert (=> b!1489879 m!1374089))

(assert (=> b!1489879 m!1374067))

(declare-fun m!1374091 () Bool)

(assert (=> b!1489879 m!1374091))

(declare-fun m!1374093 () Bool)

(assert (=> b!1489879 m!1374093))

(declare-fun m!1374095 () Bool)

(assert (=> b!1489879 m!1374095))

(assert (=> b!1489879 m!1374055))

(declare-fun m!1374097 () Bool)

(assert (=> b!1489879 m!1374097))

(declare-fun m!1374099 () Bool)

(assert (=> b!1489879 m!1374099))

(assert (=> b!1489879 m!1374055))

(assert (=> b!1489876 m!1374055))

(assert (=> b!1489876 m!1374055))

(declare-fun m!1374101 () Bool)

(assert (=> b!1489876 m!1374101))

(declare-fun m!1374103 () Bool)

(assert (=> b!1489869 m!1374103))

(declare-fun m!1374105 () Bool)

(assert (=> b!1489881 m!1374105))

(declare-fun m!1374107 () Bool)

(assert (=> b!1489867 m!1374107))

(declare-fun m!1374109 () Bool)

(assert (=> b!1489873 m!1374109))

(assert (=> b!1489873 m!1374063))

(assert (=> b!1489873 m!1374065))

(declare-fun m!1374111 () Bool)

(assert (=> b!1489872 m!1374111))

(assert (=> b!1489872 m!1374111))

(declare-fun m!1374113 () Bool)

(assert (=> b!1489872 m!1374113))

(push 1)

