; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122576 () Bool)

(assert start!122576)

(declare-fun b!1419702 () Bool)

(declare-fun res!955137 () Bool)

(declare-fun e!803204 () Bool)

(assert (=> b!1419702 (=> (not res!955137) (not e!803204))))

(declare-datatypes ((array!96941 0))(
  ( (array!96942 (arr!46788 (Array (_ BitVec 32) (_ BitVec 64))) (size!47338 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96941)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1419702 (= res!955137 (validKeyInArray!0 (select (arr!46788 a!2831) j!81)))))

(declare-fun b!1419703 () Bool)

(declare-fun res!955141 () Bool)

(assert (=> b!1419703 (=> (not res!955141) (not e!803204))))

(declare-datatypes ((List!33298 0))(
  ( (Nil!33295) (Cons!33294 (h!34596 (_ BitVec 64)) (t!47992 List!33298)) )
))
(declare-fun arrayNoDuplicates!0 (array!96941 (_ BitVec 32) List!33298) Bool)

(assert (=> b!1419703 (= res!955141 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33295))))

(declare-fun b!1419704 () Bool)

(declare-fun res!955135 () Bool)

(assert (=> b!1419704 (=> (not res!955135) (not e!803204))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1419704 (= res!955135 (and (= (size!47338 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47338 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47338 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1419705 () Bool)

(declare-fun res!955138 () Bool)

(assert (=> b!1419705 (=> (not res!955138) (not e!803204))))

(assert (=> b!1419705 (= res!955138 (validKeyInArray!0 (select (arr!46788 a!2831) i!982)))))

(declare-fun b!1419706 () Bool)

(assert (=> b!1419706 (= e!803204 false)))

(declare-datatypes ((SeekEntryResult!11073 0))(
  ( (MissingZero!11073 (index!46684 (_ BitVec 32))) (Found!11073 (index!46685 (_ BitVec 32))) (Intermediate!11073 (undefined!11885 Bool) (index!46686 (_ BitVec 32)) (x!128355 (_ BitVec 32))) (Undefined!11073) (MissingVacant!11073 (index!46687 (_ BitVec 32))) )
))
(declare-fun lt!625851 () SeekEntryResult!11073)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96941 (_ BitVec 32)) SeekEntryResult!11073)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1419706 (= lt!625851 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46788 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (select (store (arr!46788 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (array!96942 (store (arr!46788 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47338 a!2831)) mask!2608))))

(declare-fun b!1419707 () Bool)

(declare-fun res!955139 () Bool)

(assert (=> b!1419707 (=> (not res!955139) (not e!803204))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1419707 (= res!955139 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47338 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47338 a!2831))))))

(declare-fun b!1419708 () Bool)

(declare-fun res!955140 () Bool)

(assert (=> b!1419708 (=> (not res!955140) (not e!803204))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96941 (_ BitVec 32)) Bool)

(assert (=> b!1419708 (= res!955140 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1419701 () Bool)

(declare-fun res!955136 () Bool)

(assert (=> b!1419701 (=> (not res!955136) (not e!803204))))

(assert (=> b!1419701 (= res!955136 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46788 a!2831) j!81) mask!2608) (select (arr!46788 a!2831) j!81) a!2831 mask!2608) (Intermediate!11073 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun res!955134 () Bool)

(assert (=> start!122576 (=> (not res!955134) (not e!803204))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122576 (= res!955134 (validMask!0 mask!2608))))

(assert (=> start!122576 e!803204))

(assert (=> start!122576 true))

(declare-fun array_inv!35816 (array!96941) Bool)

(assert (=> start!122576 (array_inv!35816 a!2831)))

(assert (= (and start!122576 res!955134) b!1419704))

(assert (= (and b!1419704 res!955135) b!1419705))

(assert (= (and b!1419705 res!955138) b!1419702))

(assert (= (and b!1419702 res!955137) b!1419708))

(assert (= (and b!1419708 res!955140) b!1419703))

(assert (= (and b!1419703 res!955141) b!1419707))

(assert (= (and b!1419707 res!955139) b!1419701))

(assert (= (and b!1419701 res!955136) b!1419706))

(declare-fun m!1310149 () Bool)

(assert (=> b!1419706 m!1310149))

(declare-fun m!1310151 () Bool)

(assert (=> b!1419706 m!1310151))

(assert (=> b!1419706 m!1310151))

(declare-fun m!1310153 () Bool)

(assert (=> b!1419706 m!1310153))

(assert (=> b!1419706 m!1310153))

(assert (=> b!1419706 m!1310151))

(declare-fun m!1310155 () Bool)

(assert (=> b!1419706 m!1310155))

(declare-fun m!1310157 () Bool)

(assert (=> b!1419702 m!1310157))

(assert (=> b!1419702 m!1310157))

(declare-fun m!1310159 () Bool)

(assert (=> b!1419702 m!1310159))

(declare-fun m!1310161 () Bool)

(assert (=> b!1419708 m!1310161))

(declare-fun m!1310163 () Bool)

(assert (=> start!122576 m!1310163))

(declare-fun m!1310165 () Bool)

(assert (=> start!122576 m!1310165))

(declare-fun m!1310167 () Bool)

(assert (=> b!1419703 m!1310167))

(assert (=> b!1419701 m!1310157))

(assert (=> b!1419701 m!1310157))

(declare-fun m!1310169 () Bool)

(assert (=> b!1419701 m!1310169))

(assert (=> b!1419701 m!1310169))

(assert (=> b!1419701 m!1310157))

(declare-fun m!1310171 () Bool)

(assert (=> b!1419701 m!1310171))

(declare-fun m!1310173 () Bool)

(assert (=> b!1419705 m!1310173))

(assert (=> b!1419705 m!1310173))

(declare-fun m!1310175 () Bool)

(assert (=> b!1419705 m!1310175))

(check-sat (not b!1419701) (not b!1419705) (not b!1419702) (not start!122576) (not b!1419708) (not b!1419703) (not b!1419706))
