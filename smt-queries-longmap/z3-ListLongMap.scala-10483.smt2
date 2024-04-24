; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123518 () Bool)

(assert start!123518)

(declare-fun b!1431093 () Bool)

(declare-fun e!808145 () Bool)

(assert (=> b!1431093 (= e!808145 (not true))))

(declare-fun e!808148 () Bool)

(assert (=> b!1431093 e!808148))

(declare-fun res!964846 () Bool)

(assert (=> b!1431093 (=> (not res!964846) (not e!808148))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97550 0))(
  ( (array!97551 (arr!47083 (Array (_ BitVec 32) (_ BitVec 64))) (size!47634 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97550)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97550 (_ BitVec 32)) Bool)

(assert (=> b!1431093 (= res!964846 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48305 0))(
  ( (Unit!48306) )
))
(declare-fun lt!629977 () Unit!48305)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97550 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48305)

(assert (=> b!1431093 (= lt!629977 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1431094 () Bool)

(declare-fun res!964841 () Bool)

(declare-fun e!808144 () Bool)

(assert (=> b!1431094 (=> (not res!964841) (not e!808144))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1431094 (= res!964841 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47634 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47634 a!2831))))))

(declare-fun b!1431095 () Bool)

(declare-fun res!964838 () Bool)

(assert (=> b!1431095 (=> (not res!964838) (not e!808145))))

(declare-datatypes ((SeekEntryResult!11264 0))(
  ( (MissingZero!11264 (index!47448 (_ BitVec 32))) (Found!11264 (index!47449 (_ BitVec 32))) (Intermediate!11264 (undefined!12076 Bool) (index!47450 (_ BitVec 32)) (x!129243 (_ BitVec 32))) (Undefined!11264) (MissingVacant!11264 (index!47451 (_ BitVec 32))) )
))
(declare-fun lt!629974 () SeekEntryResult!11264)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97550 (_ BitVec 32)) SeekEntryResult!11264)

(assert (=> b!1431095 (= res!964838 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47083 a!2831) j!81) a!2831 mask!2608) lt!629974))))

(declare-fun b!1431096 () Bool)

(declare-fun res!964842 () Bool)

(assert (=> b!1431096 (=> (not res!964842) (not e!808145))))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(assert (=> b!1431096 (= res!964842 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1431097 () Bool)

(declare-fun res!964848 () Bool)

(assert (=> b!1431097 (=> (not res!964848) (not e!808144))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1431097 (= res!964848 (validKeyInArray!0 (select (arr!47083 a!2831) i!982)))))

(declare-fun res!964845 () Bool)

(assert (=> start!123518 (=> (not res!964845) (not e!808144))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123518 (= res!964845 (validMask!0 mask!2608))))

(assert (=> start!123518 e!808144))

(assert (=> start!123518 true))

(declare-fun array_inv!36364 (array!97550) Bool)

(assert (=> start!123518 (array_inv!36364 a!2831)))

(declare-fun b!1431098 () Bool)

(declare-fun res!964840 () Bool)

(assert (=> b!1431098 (=> (not res!964840) (not e!808144))))

(assert (=> b!1431098 (= res!964840 (validKeyInArray!0 (select (arr!47083 a!2831) j!81)))))

(declare-fun b!1431099 () Bool)

(declare-fun e!808147 () Bool)

(assert (=> b!1431099 (= e!808147 e!808145)))

(declare-fun res!964847 () Bool)

(assert (=> b!1431099 (=> (not res!964847) (not e!808145))))

(declare-fun lt!629975 () array!97550)

(declare-fun lt!629976 () SeekEntryResult!11264)

(declare-fun lt!629978 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1431099 (= res!964847 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!629978 mask!2608) lt!629978 lt!629975 mask!2608) lt!629976))))

(assert (=> b!1431099 (= lt!629976 (Intermediate!11264 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1431099 (= lt!629978 (select (store (arr!47083 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1431099 (= lt!629975 (array!97551 (store (arr!47083 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47634 a!2831)))))

(declare-fun b!1431100 () Bool)

(declare-fun res!964837 () Bool)

(assert (=> b!1431100 (=> (not res!964837) (not e!808144))))

(assert (=> b!1431100 (= res!964837 (and (= (size!47634 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47634 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47634 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1431101 () Bool)

(declare-fun res!964844 () Bool)

(assert (=> b!1431101 (=> (not res!964844) (not e!808145))))

(assert (=> b!1431101 (= res!964844 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!629978 lt!629975 mask!2608) lt!629976))))

(declare-fun b!1431102 () Bool)

(declare-fun res!964849 () Bool)

(assert (=> b!1431102 (=> (not res!964849) (not e!808144))))

(declare-datatypes ((List!33580 0))(
  ( (Nil!33577) (Cons!33576 (h!34901 (_ BitVec 64)) (t!48266 List!33580)) )
))
(declare-fun arrayNoDuplicates!0 (array!97550 (_ BitVec 32) List!33580) Bool)

(assert (=> b!1431102 (= res!964849 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33577))))

(declare-fun b!1431103 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97550 (_ BitVec 32)) SeekEntryResult!11264)

(assert (=> b!1431103 (= e!808148 (= (seekEntryOrOpen!0 (select (arr!47083 a!2831) j!81) a!2831 mask!2608) (Found!11264 j!81)))))

(declare-fun b!1431104 () Bool)

(assert (=> b!1431104 (= e!808144 e!808147)))

(declare-fun res!964843 () Bool)

(assert (=> b!1431104 (=> (not res!964843) (not e!808147))))

(assert (=> b!1431104 (= res!964843 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47083 a!2831) j!81) mask!2608) (select (arr!47083 a!2831) j!81) a!2831 mask!2608) lt!629974))))

(assert (=> b!1431104 (= lt!629974 (Intermediate!11264 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1431105 () Bool)

(declare-fun res!964839 () Bool)

(assert (=> b!1431105 (=> (not res!964839) (not e!808144))))

(assert (=> b!1431105 (= res!964839 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(assert (= (and start!123518 res!964845) b!1431100))

(assert (= (and b!1431100 res!964837) b!1431097))

(assert (= (and b!1431097 res!964848) b!1431098))

(assert (= (and b!1431098 res!964840) b!1431105))

(assert (= (and b!1431105 res!964839) b!1431102))

(assert (= (and b!1431102 res!964849) b!1431094))

(assert (= (and b!1431094 res!964841) b!1431104))

(assert (= (and b!1431104 res!964843) b!1431099))

(assert (= (and b!1431099 res!964847) b!1431095))

(assert (= (and b!1431095 res!964838) b!1431101))

(assert (= (and b!1431101 res!964844) b!1431096))

(assert (= (and b!1431096 res!964842) b!1431093))

(assert (= (and b!1431093 res!964846) b!1431103))

(declare-fun m!1321305 () Bool)

(assert (=> b!1431093 m!1321305))

(declare-fun m!1321307 () Bool)

(assert (=> b!1431093 m!1321307))

(declare-fun m!1321309 () Bool)

(assert (=> start!123518 m!1321309))

(declare-fun m!1321311 () Bool)

(assert (=> start!123518 m!1321311))

(declare-fun m!1321313 () Bool)

(assert (=> b!1431095 m!1321313))

(assert (=> b!1431095 m!1321313))

(declare-fun m!1321315 () Bool)

(assert (=> b!1431095 m!1321315))

(declare-fun m!1321317 () Bool)

(assert (=> b!1431102 m!1321317))

(assert (=> b!1431104 m!1321313))

(assert (=> b!1431104 m!1321313))

(declare-fun m!1321319 () Bool)

(assert (=> b!1431104 m!1321319))

(assert (=> b!1431104 m!1321319))

(assert (=> b!1431104 m!1321313))

(declare-fun m!1321321 () Bool)

(assert (=> b!1431104 m!1321321))

(assert (=> b!1431103 m!1321313))

(assert (=> b!1431103 m!1321313))

(declare-fun m!1321323 () Bool)

(assert (=> b!1431103 m!1321323))

(declare-fun m!1321325 () Bool)

(assert (=> b!1431097 m!1321325))

(assert (=> b!1431097 m!1321325))

(declare-fun m!1321327 () Bool)

(assert (=> b!1431097 m!1321327))

(assert (=> b!1431098 m!1321313))

(assert (=> b!1431098 m!1321313))

(declare-fun m!1321329 () Bool)

(assert (=> b!1431098 m!1321329))

(declare-fun m!1321331 () Bool)

(assert (=> b!1431099 m!1321331))

(assert (=> b!1431099 m!1321331))

(declare-fun m!1321333 () Bool)

(assert (=> b!1431099 m!1321333))

(declare-fun m!1321335 () Bool)

(assert (=> b!1431099 m!1321335))

(declare-fun m!1321337 () Bool)

(assert (=> b!1431099 m!1321337))

(declare-fun m!1321339 () Bool)

(assert (=> b!1431105 m!1321339))

(declare-fun m!1321341 () Bool)

(assert (=> b!1431101 m!1321341))

(check-sat (not b!1431103) (not b!1431104) (not start!123518) (not b!1431093) (not b!1431105) (not b!1431099) (not b!1431097) (not b!1431098) (not b!1431095) (not b!1431102) (not b!1431101))
(check-sat)
