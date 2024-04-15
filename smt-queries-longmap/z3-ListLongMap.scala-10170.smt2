; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119888 () Bool)

(assert start!119888)

(declare-fun b!1395911 () Bool)

(declare-fun res!935044 () Bool)

(declare-fun e!790280 () Bool)

(assert (=> b!1395911 (=> (not res!935044) (not e!790280))))

(declare-datatypes ((array!95421 0))(
  ( (array!95422 (arr!46066 (Array (_ BitVec 32) (_ BitVec 64))) (size!46618 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95421)

(declare-datatypes ((List!32663 0))(
  ( (Nil!32660) (Cons!32659 (h!33898 (_ BitVec 64)) (t!47349 List!32663)) )
))
(declare-fun arrayNoDuplicates!0 (array!95421 (_ BitVec 32) List!32663) Bool)

(assert (=> b!1395911 (= res!935044 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32660))))

(declare-fun res!935045 () Bool)

(assert (=> start!119888 (=> (not res!935045) (not e!790280))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119888 (= res!935045 (validMask!0 mask!2840))))

(assert (=> start!119888 e!790280))

(assert (=> start!119888 true))

(declare-fun array_inv!35299 (array!95421) Bool)

(assert (=> start!119888 (array_inv!35299 a!2901)))

(declare-fun b!1395912 () Bool)

(declare-fun res!935047 () Bool)

(assert (=> b!1395912 (=> (not res!935047) (not e!790280))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95421 (_ BitVec 32)) Bool)

(assert (=> b!1395912 (= res!935047 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1395913 () Bool)

(declare-fun res!935046 () Bool)

(assert (=> b!1395913 (=> (not res!935046) (not e!790280))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1395913 (= res!935046 (validKeyInArray!0 (select (arr!46066 a!2901) i!1037)))))

(declare-fun b!1395914 () Bool)

(declare-fun res!935041 () Bool)

(assert (=> b!1395914 (=> (not res!935041) (not e!790280))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1395914 (= res!935041 (and (= (size!46618 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46618 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46618 a!2901)) (not (= i!1037 j!112))))))

(declare-fun e!790277 () Bool)

(declare-fun b!1395915 () Bool)

(declare-datatypes ((SeekEntryResult!10409 0))(
  ( (MissingZero!10409 (index!44007 (_ BitVec 32))) (Found!10409 (index!44008 (_ BitVec 32))) (Intermediate!10409 (undefined!11221 Bool) (index!44009 (_ BitVec 32)) (x!125670 (_ BitVec 32))) (Undefined!10409) (MissingVacant!10409 (index!44010 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95421 (_ BitVec 32)) SeekEntryResult!10409)

(assert (=> b!1395915 (= e!790277 (= (seekEntryOrOpen!0 (select (arr!46066 a!2901) j!112) a!2901 mask!2840) (Found!10409 j!112)))))

(declare-fun lt!613019 () SeekEntryResult!10409)

(declare-fun e!790279 () Bool)

(declare-fun lt!613017 () SeekEntryResult!10409)

(declare-fun b!1395916 () Bool)

(get-info :version)

(assert (=> b!1395916 (= e!790279 (or (= lt!613017 lt!613019) (not ((_ is Intermediate!10409) lt!613019)) (bvsge mask!2840 #b00000000000000000000000000000000)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95421 (_ BitVec 32)) SeekEntryResult!10409)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1395916 (= lt!613019 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46066 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46066 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95422 (store (arr!46066 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46618 a!2901)) mask!2840))))

(declare-fun b!1395917 () Bool)

(declare-fun res!935042 () Bool)

(assert (=> b!1395917 (=> (not res!935042) (not e!790280))))

(assert (=> b!1395917 (= res!935042 (validKeyInArray!0 (select (arr!46066 a!2901) j!112)))))

(declare-fun b!1395918 () Bool)

(assert (=> b!1395918 (= e!790280 (not e!790279))))

(declare-fun res!935040 () Bool)

(assert (=> b!1395918 (=> res!935040 e!790279)))

(assert (=> b!1395918 (= res!935040 (or (not ((_ is Intermediate!10409) lt!613017)) (undefined!11221 lt!613017)))))

(assert (=> b!1395918 e!790277))

(declare-fun res!935043 () Bool)

(assert (=> b!1395918 (=> (not res!935043) (not e!790277))))

(assert (=> b!1395918 (= res!935043 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46665 0))(
  ( (Unit!46666) )
))
(declare-fun lt!613018 () Unit!46665)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95421 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46665)

(assert (=> b!1395918 (= lt!613018 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1395918 (= lt!613017 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46066 a!2901) j!112) mask!2840) (select (arr!46066 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!119888 res!935045) b!1395914))

(assert (= (and b!1395914 res!935041) b!1395913))

(assert (= (and b!1395913 res!935046) b!1395917))

(assert (= (and b!1395917 res!935042) b!1395912))

(assert (= (and b!1395912 res!935047) b!1395911))

(assert (= (and b!1395911 res!935044) b!1395918))

(assert (= (and b!1395918 res!935043) b!1395915))

(assert (= (and b!1395918 (not res!935040)) b!1395916))

(declare-fun m!1281925 () Bool)

(assert (=> b!1395916 m!1281925))

(declare-fun m!1281927 () Bool)

(assert (=> b!1395916 m!1281927))

(assert (=> b!1395916 m!1281927))

(declare-fun m!1281929 () Bool)

(assert (=> b!1395916 m!1281929))

(assert (=> b!1395916 m!1281929))

(assert (=> b!1395916 m!1281927))

(declare-fun m!1281931 () Bool)

(assert (=> b!1395916 m!1281931))

(declare-fun m!1281933 () Bool)

(assert (=> b!1395911 m!1281933))

(declare-fun m!1281935 () Bool)

(assert (=> b!1395918 m!1281935))

(declare-fun m!1281937 () Bool)

(assert (=> b!1395918 m!1281937))

(assert (=> b!1395918 m!1281935))

(declare-fun m!1281939 () Bool)

(assert (=> b!1395918 m!1281939))

(assert (=> b!1395918 m!1281937))

(assert (=> b!1395918 m!1281935))

(declare-fun m!1281941 () Bool)

(assert (=> b!1395918 m!1281941))

(declare-fun m!1281943 () Bool)

(assert (=> b!1395918 m!1281943))

(declare-fun m!1281945 () Bool)

(assert (=> b!1395913 m!1281945))

(assert (=> b!1395913 m!1281945))

(declare-fun m!1281947 () Bool)

(assert (=> b!1395913 m!1281947))

(declare-fun m!1281949 () Bool)

(assert (=> start!119888 m!1281949))

(declare-fun m!1281951 () Bool)

(assert (=> start!119888 m!1281951))

(assert (=> b!1395915 m!1281935))

(assert (=> b!1395915 m!1281935))

(declare-fun m!1281953 () Bool)

(assert (=> b!1395915 m!1281953))

(declare-fun m!1281955 () Bool)

(assert (=> b!1395912 m!1281955))

(assert (=> b!1395917 m!1281935))

(assert (=> b!1395917 m!1281935))

(declare-fun m!1281957 () Bool)

(assert (=> b!1395917 m!1281957))

(check-sat (not b!1395918) (not b!1395912) (not b!1395913) (not b!1395915) (not b!1395917) (not b!1395916) (not b!1395911) (not start!119888))
(check-sat)
