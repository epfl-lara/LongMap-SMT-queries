; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122578 () Bool)

(assert start!122578)

(declare-fun res!955161 () Bool)

(declare-fun e!803210 () Bool)

(assert (=> start!122578 (=> (not res!955161) (not e!803210))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122578 (= res!955161 (validMask!0 mask!2608))))

(assert (=> start!122578 e!803210))

(assert (=> start!122578 true))

(declare-datatypes ((array!96943 0))(
  ( (array!96944 (arr!46789 (Array (_ BitVec 32) (_ BitVec 64))) (size!47339 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96943)

(declare-fun array_inv!35817 (array!96943) Bool)

(assert (=> start!122578 (array_inv!35817 a!2831)))

(declare-fun b!1419725 () Bool)

(assert (=> b!1419725 (= e!803210 false)))

(declare-datatypes ((SeekEntryResult!11074 0))(
  ( (MissingZero!11074 (index!46688 (_ BitVec 32))) (Found!11074 (index!46689 (_ BitVec 32))) (Intermediate!11074 (undefined!11886 Bool) (index!46690 (_ BitVec 32)) (x!128356 (_ BitVec 32))) (Undefined!11074) (MissingVacant!11074 (index!46691 (_ BitVec 32))) )
))
(declare-fun lt!625854 () SeekEntryResult!11074)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96943 (_ BitVec 32)) SeekEntryResult!11074)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1419725 (= lt!625854 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46789 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (select (store (arr!46789 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (array!96944 (store (arr!46789 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47339 a!2831)) mask!2608))))

(declare-fun b!1419726 () Bool)

(declare-fun res!955162 () Bool)

(assert (=> b!1419726 (=> (not res!955162) (not e!803210))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1419726 (= res!955162 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47339 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47339 a!2831))))))

(declare-fun b!1419727 () Bool)

(declare-fun res!955165 () Bool)

(assert (=> b!1419727 (=> (not res!955165) (not e!803210))))

(declare-datatypes ((List!33299 0))(
  ( (Nil!33296) (Cons!33295 (h!34597 (_ BitVec 64)) (t!47993 List!33299)) )
))
(declare-fun arrayNoDuplicates!0 (array!96943 (_ BitVec 32) List!33299) Bool)

(assert (=> b!1419727 (= res!955165 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33296))))

(declare-fun b!1419728 () Bool)

(declare-fun res!955160 () Bool)

(assert (=> b!1419728 (=> (not res!955160) (not e!803210))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1419728 (= res!955160 (validKeyInArray!0 (select (arr!46789 a!2831) i!982)))))

(declare-fun b!1419729 () Bool)

(declare-fun res!955159 () Bool)

(assert (=> b!1419729 (=> (not res!955159) (not e!803210))))

(assert (=> b!1419729 (= res!955159 (and (= (size!47339 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47339 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47339 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1419730 () Bool)

(declare-fun res!955158 () Bool)

(assert (=> b!1419730 (=> (not res!955158) (not e!803210))))

(assert (=> b!1419730 (= res!955158 (validKeyInArray!0 (select (arr!46789 a!2831) j!81)))))

(declare-fun b!1419731 () Bool)

(declare-fun res!955163 () Bool)

(assert (=> b!1419731 (=> (not res!955163) (not e!803210))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96943 (_ BitVec 32)) Bool)

(assert (=> b!1419731 (= res!955163 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1419732 () Bool)

(declare-fun res!955164 () Bool)

(assert (=> b!1419732 (=> (not res!955164) (not e!803210))))

(assert (=> b!1419732 (= res!955164 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46789 a!2831) j!81) mask!2608) (select (arr!46789 a!2831) j!81) a!2831 mask!2608) (Intermediate!11074 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(assert (= (and start!122578 res!955161) b!1419729))

(assert (= (and b!1419729 res!955159) b!1419728))

(assert (= (and b!1419728 res!955160) b!1419730))

(assert (= (and b!1419730 res!955158) b!1419731))

(assert (= (and b!1419731 res!955163) b!1419727))

(assert (= (and b!1419727 res!955165) b!1419726))

(assert (= (and b!1419726 res!955162) b!1419732))

(assert (= (and b!1419732 res!955164) b!1419725))

(declare-fun m!1310177 () Bool)

(assert (=> start!122578 m!1310177))

(declare-fun m!1310179 () Bool)

(assert (=> start!122578 m!1310179))

(declare-fun m!1310181 () Bool)

(assert (=> b!1419732 m!1310181))

(assert (=> b!1419732 m!1310181))

(declare-fun m!1310183 () Bool)

(assert (=> b!1419732 m!1310183))

(assert (=> b!1419732 m!1310183))

(assert (=> b!1419732 m!1310181))

(declare-fun m!1310185 () Bool)

(assert (=> b!1419732 m!1310185))

(declare-fun m!1310187 () Bool)

(assert (=> b!1419728 m!1310187))

(assert (=> b!1419728 m!1310187))

(declare-fun m!1310189 () Bool)

(assert (=> b!1419728 m!1310189))

(assert (=> b!1419730 m!1310181))

(assert (=> b!1419730 m!1310181))

(declare-fun m!1310191 () Bool)

(assert (=> b!1419730 m!1310191))

(declare-fun m!1310193 () Bool)

(assert (=> b!1419725 m!1310193))

(declare-fun m!1310195 () Bool)

(assert (=> b!1419725 m!1310195))

(assert (=> b!1419725 m!1310195))

(declare-fun m!1310197 () Bool)

(assert (=> b!1419725 m!1310197))

(assert (=> b!1419725 m!1310197))

(assert (=> b!1419725 m!1310195))

(declare-fun m!1310199 () Bool)

(assert (=> b!1419725 m!1310199))

(declare-fun m!1310201 () Bool)

(assert (=> b!1419727 m!1310201))

(declare-fun m!1310203 () Bool)

(assert (=> b!1419731 m!1310203))

(push 1)

(assert (not b!1419732))

(assert (not b!1419730))

(assert (not start!122578))

(assert (not b!1419725))

(assert (not b!1419727))

(assert (not b!1419731))

(assert (not b!1419728))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

