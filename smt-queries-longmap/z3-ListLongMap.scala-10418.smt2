; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122858 () Bool)

(assert start!122858)

(declare-fun b!1422153 () Bool)

(declare-fun res!956909 () Bool)

(declare-fun e!804329 () Bool)

(assert (=> b!1422153 (=> (not res!956909) (not e!804329))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-datatypes ((array!97145 0))(
  ( (array!97146 (arr!46888 (Array (_ BitVec 32) (_ BitVec 64))) (size!47439 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97145)

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1422153 (= res!956909 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47439 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47439 a!2831))))))

(declare-fun b!1422154 () Bool)

(declare-fun res!956908 () Bool)

(declare-fun e!804327 () Bool)

(assert (=> b!1422154 (=> (not res!956908) (not e!804327))))

(declare-datatypes ((SeekEntryResult!11075 0))(
  ( (MissingZero!11075 (index!46692 (_ BitVec 32))) (Found!11075 (index!46693 (_ BitVec 32))) (Intermediate!11075 (undefined!11887 Bool) (index!46694 (_ BitVec 32)) (x!128504 (_ BitVec 32))) (Undefined!11075) (MissingVacant!11075 (index!46695 (_ BitVec 32))) )
))
(declare-fun lt!626486 () SeekEntryResult!11075)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97145 (_ BitVec 32)) SeekEntryResult!11075)

(assert (=> b!1422154 (= res!956908 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46888 a!2831) j!81) a!2831 mask!2608) lt!626486))))

(declare-fun b!1422155 () Bool)

(assert (=> b!1422155 (= e!804327 false)))

(declare-fun lt!626488 () (_ BitVec 64))

(declare-fun lt!626487 () array!97145)

(declare-fun lt!626489 () SeekEntryResult!11075)

(assert (=> b!1422155 (= lt!626489 (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626488 lt!626487 mask!2608))))

(declare-fun b!1422156 () Bool)

(declare-fun res!956904 () Bool)

(assert (=> b!1422156 (=> (not res!956904) (not e!804329))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1422156 (= res!956904 (validKeyInArray!0 (select (arr!46888 a!2831) j!81)))))

(declare-fun b!1422157 () Bool)

(declare-fun e!804326 () Bool)

(assert (=> b!1422157 (= e!804329 e!804326)))

(declare-fun res!956905 () Bool)

(assert (=> b!1422157 (=> (not res!956905) (not e!804326))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1422157 (= res!956905 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46888 a!2831) j!81) mask!2608) (select (arr!46888 a!2831) j!81) a!2831 mask!2608) lt!626486))))

(assert (=> b!1422157 (= lt!626486 (Intermediate!11075 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1422158 () Bool)

(declare-fun res!956907 () Bool)

(assert (=> b!1422158 (=> (not res!956907) (not e!804329))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97145 (_ BitVec 32)) Bool)

(assert (=> b!1422158 (= res!956907 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1422159 () Bool)

(declare-fun res!956902 () Bool)

(assert (=> b!1422159 (=> (not res!956902) (not e!804329))))

(declare-datatypes ((List!33385 0))(
  ( (Nil!33382) (Cons!33381 (h!34691 (_ BitVec 64)) (t!48071 List!33385)) )
))
(declare-fun arrayNoDuplicates!0 (array!97145 (_ BitVec 32) List!33385) Bool)

(assert (=> b!1422159 (= res!956902 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33382))))

(declare-fun b!1422160 () Bool)

(declare-fun res!956911 () Bool)

(assert (=> b!1422160 (=> (not res!956911) (not e!804329))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1422160 (= res!956911 (validKeyInArray!0 (select (arr!46888 a!2831) i!982)))))

(declare-fun res!956906 () Bool)

(assert (=> start!122858 (=> (not res!956906) (not e!804329))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122858 (= res!956906 (validMask!0 mask!2608))))

(assert (=> start!122858 e!804329))

(assert (=> start!122858 true))

(declare-fun array_inv!36169 (array!97145) Bool)

(assert (=> start!122858 (array_inv!36169 a!2831)))

(declare-fun b!1422161 () Bool)

(declare-fun res!956910 () Bool)

(assert (=> b!1422161 (=> (not res!956910) (not e!804329))))

(assert (=> b!1422161 (= res!956910 (and (= (size!47439 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47439 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47439 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1422162 () Bool)

(assert (=> b!1422162 (= e!804326 e!804327)))

(declare-fun res!956903 () Bool)

(assert (=> b!1422162 (=> (not res!956903) (not e!804327))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(assert (=> b!1422162 (= res!956903 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626488 mask!2608) lt!626488 lt!626487 mask!2608) (Intermediate!11075 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(assert (=> b!1422162 (= lt!626488 (select (store (arr!46888 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1422162 (= lt!626487 (array!97146 (store (arr!46888 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47439 a!2831)))))

(assert (= (and start!122858 res!956906) b!1422161))

(assert (= (and b!1422161 res!956910) b!1422160))

(assert (= (and b!1422160 res!956911) b!1422156))

(assert (= (and b!1422156 res!956904) b!1422158))

(assert (= (and b!1422158 res!956907) b!1422159))

(assert (= (and b!1422159 res!956902) b!1422153))

(assert (= (and b!1422153 res!956909) b!1422157))

(assert (= (and b!1422157 res!956905) b!1422162))

(assert (= (and b!1422162 res!956903) b!1422154))

(assert (= (and b!1422154 res!956908) b!1422155))

(declare-fun m!1312923 () Bool)

(assert (=> b!1422154 m!1312923))

(assert (=> b!1422154 m!1312923))

(declare-fun m!1312925 () Bool)

(assert (=> b!1422154 m!1312925))

(declare-fun m!1312927 () Bool)

(assert (=> start!122858 m!1312927))

(declare-fun m!1312929 () Bool)

(assert (=> start!122858 m!1312929))

(declare-fun m!1312931 () Bool)

(assert (=> b!1422159 m!1312931))

(assert (=> b!1422156 m!1312923))

(assert (=> b!1422156 m!1312923))

(declare-fun m!1312933 () Bool)

(assert (=> b!1422156 m!1312933))

(declare-fun m!1312935 () Bool)

(assert (=> b!1422160 m!1312935))

(assert (=> b!1422160 m!1312935))

(declare-fun m!1312937 () Bool)

(assert (=> b!1422160 m!1312937))

(assert (=> b!1422157 m!1312923))

(assert (=> b!1422157 m!1312923))

(declare-fun m!1312939 () Bool)

(assert (=> b!1422157 m!1312939))

(assert (=> b!1422157 m!1312939))

(assert (=> b!1422157 m!1312923))

(declare-fun m!1312941 () Bool)

(assert (=> b!1422157 m!1312941))

(declare-fun m!1312943 () Bool)

(assert (=> b!1422155 m!1312943))

(declare-fun m!1312945 () Bool)

(assert (=> b!1422158 m!1312945))

(declare-fun m!1312947 () Bool)

(assert (=> b!1422162 m!1312947))

(assert (=> b!1422162 m!1312947))

(declare-fun m!1312949 () Bool)

(assert (=> b!1422162 m!1312949))

(declare-fun m!1312951 () Bool)

(assert (=> b!1422162 m!1312951))

(declare-fun m!1312953 () Bool)

(assert (=> b!1422162 m!1312953))

(check-sat (not b!1422154) (not start!122858) (not b!1422158) (not b!1422155) (not b!1422160) (not b!1422162) (not b!1422159) (not b!1422156) (not b!1422157))
(check-sat)
