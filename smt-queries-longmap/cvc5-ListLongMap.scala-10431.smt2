; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122748 () Bool)

(assert start!122748)

(declare-fun b!1422591 () Bool)

(declare-fun res!958024 () Bool)

(declare-fun e!804206 () Bool)

(assert (=> b!1422591 (=> (not res!958024) (not e!804206))))

(declare-datatypes ((array!97113 0))(
  ( (array!97114 (arr!46874 (Array (_ BitVec 32) (_ BitVec 64))) (size!47424 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97113)

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1422591 (= res!958024 (validKeyInArray!0 (select (arr!46874 a!2831) i!982)))))

(declare-fun b!1422592 () Bool)

(declare-fun e!804212 () Bool)

(declare-fun e!804210 () Bool)

(assert (=> b!1422592 (= e!804212 e!804210)))

(declare-fun res!958026 () Bool)

(assert (=> b!1422592 (=> (not res!958026) (not e!804210))))

(declare-fun lt!626745 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11159 0))(
  ( (MissingZero!11159 (index!47028 (_ BitVec 32))) (Found!11159 (index!47029 (_ BitVec 32))) (Intermediate!11159 (undefined!11971 Bool) (index!47030 (_ BitVec 32)) (x!128673 (_ BitVec 32))) (Undefined!11159) (MissingVacant!11159 (index!47031 (_ BitVec 32))) )
))
(declare-fun lt!626744 () SeekEntryResult!11159)

(declare-fun lt!626743 () array!97113)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97113 (_ BitVec 32)) SeekEntryResult!11159)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1422592 (= res!958026 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626745 mask!2608) lt!626745 lt!626743 mask!2608) lt!626744))))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(assert (=> b!1422592 (= lt!626744 (Intermediate!11159 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun j!81 () (_ BitVec 32))

(assert (=> b!1422592 (= lt!626745 (select (store (arr!46874 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1422592 (= lt!626743 (array!97114 (store (arr!46874 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47424 a!2831)))))

(declare-fun b!1422593 () Bool)

(declare-fun e!804208 () Bool)

(assert (=> b!1422593 (= e!804208 true)))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun lt!626746 () SeekEntryResult!11159)

(declare-fun lt!626742 () (_ BitVec 32))

(assert (=> b!1422593 (= lt!626746 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!626742 lt!626745 lt!626743 mask!2608))))

(declare-fun b!1422594 () Bool)

(declare-fun res!958037 () Bool)

(assert (=> b!1422594 (=> (not res!958037) (not e!804206))))

(declare-datatypes ((List!33384 0))(
  ( (Nil!33381) (Cons!33380 (h!34682 (_ BitVec 64)) (t!48078 List!33384)) )
))
(declare-fun arrayNoDuplicates!0 (array!97113 (_ BitVec 32) List!33384) Bool)

(assert (=> b!1422594 (= res!958037 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33381))))

(declare-fun b!1422595 () Bool)

(declare-fun res!958035 () Bool)

(assert (=> b!1422595 (=> (not res!958035) (not e!804206))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97113 (_ BitVec 32)) Bool)

(assert (=> b!1422595 (= res!958035 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1422596 () Bool)

(declare-fun e!804211 () Bool)

(assert (=> b!1422596 (= e!804210 (not e!804211))))

(declare-fun res!958031 () Bool)

(assert (=> b!1422596 (=> res!958031 e!804211)))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1422596 (= res!958031 (or (= (select (arr!46874 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46874 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46874 a!2831) index!585) (select (arr!46874 a!2831) j!81)) (= (select (store (arr!46874 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!804207 () Bool)

(assert (=> b!1422596 e!804207))

(declare-fun res!958038 () Bool)

(assert (=> b!1422596 (=> (not res!958038) (not e!804207))))

(assert (=> b!1422596 (= res!958038 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48154 0))(
  ( (Unit!48155) )
))
(declare-fun lt!626747 () Unit!48154)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97113 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48154)

(assert (=> b!1422596 (= lt!626747 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1422597 () Bool)

(declare-fun res!958027 () Bool)

(assert (=> b!1422597 (=> res!958027 e!804208)))

(declare-fun lt!626748 () SeekEntryResult!11159)

(assert (=> b!1422597 (= res!958027 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!626742 (select (arr!46874 a!2831) j!81) a!2831 mask!2608) lt!626748)))))

(declare-fun b!1422598 () Bool)

(assert (=> b!1422598 (= e!804206 e!804212)))

(declare-fun res!958039 () Bool)

(assert (=> b!1422598 (=> (not res!958039) (not e!804212))))

(assert (=> b!1422598 (= res!958039 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46874 a!2831) j!81) mask!2608) (select (arr!46874 a!2831) j!81) a!2831 mask!2608) lt!626748))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1422598 (= lt!626748 (Intermediate!11159 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun res!958033 () Bool)

(assert (=> start!122748 (=> (not res!958033) (not e!804206))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122748 (= res!958033 (validMask!0 mask!2608))))

(assert (=> start!122748 e!804206))

(assert (=> start!122748 true))

(declare-fun array_inv!35902 (array!97113) Bool)

(assert (=> start!122748 (array_inv!35902 a!2831)))

(declare-fun b!1422599 () Bool)

(declare-fun res!958032 () Bool)

(assert (=> b!1422599 (=> (not res!958032) (not e!804210))))

(assert (=> b!1422599 (= res!958032 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1422600 () Bool)

(declare-fun res!958029 () Bool)

(assert (=> b!1422600 (=> (not res!958029) (not e!804210))))

(assert (=> b!1422600 (= res!958029 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46874 a!2831) j!81) a!2831 mask!2608) lt!626748))))

(declare-fun b!1422601 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97113 (_ BitVec 32)) SeekEntryResult!11159)

(assert (=> b!1422601 (= e!804207 (= (seekEntryOrOpen!0 (select (arr!46874 a!2831) j!81) a!2831 mask!2608) (Found!11159 j!81)))))

(declare-fun b!1422602 () Bool)

(declare-fun res!958028 () Bool)

(assert (=> b!1422602 (=> (not res!958028) (not e!804206))))

(assert (=> b!1422602 (= res!958028 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47424 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47424 a!2831))))))

(declare-fun b!1422603 () Bool)

(declare-fun res!958025 () Bool)

(assert (=> b!1422603 (=> (not res!958025) (not e!804210))))

(assert (=> b!1422603 (= res!958025 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626745 lt!626743 mask!2608) lt!626744))))

(declare-fun b!1422604 () Bool)

(declare-fun res!958034 () Bool)

(assert (=> b!1422604 (=> (not res!958034) (not e!804206))))

(assert (=> b!1422604 (= res!958034 (validKeyInArray!0 (select (arr!46874 a!2831) j!81)))))

(declare-fun b!1422605 () Bool)

(declare-fun res!958036 () Bool)

(assert (=> b!1422605 (=> (not res!958036) (not e!804206))))

(assert (=> b!1422605 (= res!958036 (and (= (size!47424 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47424 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47424 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1422606 () Bool)

(assert (=> b!1422606 (= e!804211 e!804208)))

(declare-fun res!958030 () Bool)

(assert (=> b!1422606 (=> res!958030 e!804208)))

(assert (=> b!1422606 (= res!958030 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!626742 #b00000000000000000000000000000000) (bvsge lt!626742 (size!47424 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1422606 (= lt!626742 (nextIndex!0 index!585 x!605 mask!2608))))

(assert (= (and start!122748 res!958033) b!1422605))

(assert (= (and b!1422605 res!958036) b!1422591))

(assert (= (and b!1422591 res!958024) b!1422604))

(assert (= (and b!1422604 res!958034) b!1422595))

(assert (= (and b!1422595 res!958035) b!1422594))

(assert (= (and b!1422594 res!958037) b!1422602))

(assert (= (and b!1422602 res!958028) b!1422598))

(assert (= (and b!1422598 res!958039) b!1422592))

(assert (= (and b!1422592 res!958026) b!1422600))

(assert (= (and b!1422600 res!958029) b!1422603))

(assert (= (and b!1422603 res!958025) b!1422599))

(assert (= (and b!1422599 res!958032) b!1422596))

(assert (= (and b!1422596 res!958038) b!1422601))

(assert (= (and b!1422596 (not res!958031)) b!1422606))

(assert (= (and b!1422606 (not res!958030)) b!1422597))

(assert (= (and b!1422597 (not res!958027)) b!1422593))

(declare-fun m!1313139 () Bool)

(assert (=> b!1422596 m!1313139))

(declare-fun m!1313141 () Bool)

(assert (=> b!1422596 m!1313141))

(declare-fun m!1313143 () Bool)

(assert (=> b!1422596 m!1313143))

(declare-fun m!1313145 () Bool)

(assert (=> b!1422596 m!1313145))

(declare-fun m!1313147 () Bool)

(assert (=> b!1422596 m!1313147))

(declare-fun m!1313149 () Bool)

(assert (=> b!1422596 m!1313149))

(declare-fun m!1313151 () Bool)

(assert (=> start!122748 m!1313151))

(declare-fun m!1313153 () Bool)

(assert (=> start!122748 m!1313153))

(declare-fun m!1313155 () Bool)

(assert (=> b!1422606 m!1313155))

(assert (=> b!1422601 m!1313147))

(assert (=> b!1422601 m!1313147))

(declare-fun m!1313157 () Bool)

(assert (=> b!1422601 m!1313157))

(assert (=> b!1422598 m!1313147))

(assert (=> b!1422598 m!1313147))

(declare-fun m!1313159 () Bool)

(assert (=> b!1422598 m!1313159))

(assert (=> b!1422598 m!1313159))

(assert (=> b!1422598 m!1313147))

(declare-fun m!1313161 () Bool)

(assert (=> b!1422598 m!1313161))

(declare-fun m!1313163 () Bool)

(assert (=> b!1422593 m!1313163))

(declare-fun m!1313165 () Bool)

(assert (=> b!1422592 m!1313165))

(assert (=> b!1422592 m!1313165))

(declare-fun m!1313167 () Bool)

(assert (=> b!1422592 m!1313167))

(assert (=> b!1422592 m!1313139))

(declare-fun m!1313169 () Bool)

(assert (=> b!1422592 m!1313169))

(declare-fun m!1313171 () Bool)

(assert (=> b!1422595 m!1313171))

(assert (=> b!1422604 m!1313147))

(assert (=> b!1422604 m!1313147))

(declare-fun m!1313173 () Bool)

(assert (=> b!1422604 m!1313173))

(declare-fun m!1313175 () Bool)

(assert (=> b!1422594 m!1313175))

(declare-fun m!1313177 () Bool)

(assert (=> b!1422591 m!1313177))

(assert (=> b!1422591 m!1313177))

(declare-fun m!1313179 () Bool)

(assert (=> b!1422591 m!1313179))

(assert (=> b!1422597 m!1313147))

(assert (=> b!1422597 m!1313147))

(declare-fun m!1313181 () Bool)

(assert (=> b!1422597 m!1313181))

(declare-fun m!1313183 () Bool)

(assert (=> b!1422603 m!1313183))

(assert (=> b!1422600 m!1313147))

(assert (=> b!1422600 m!1313147))

(declare-fun m!1313185 () Bool)

(assert (=> b!1422600 m!1313185))

(push 1)

