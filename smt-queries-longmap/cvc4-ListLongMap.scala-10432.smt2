; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122758 () Bool)

(assert start!122758)

(declare-fun b!1422831 () Bool)

(declare-fun res!958264 () Bool)

(declare-fun e!804315 () Bool)

(assert (=> b!1422831 (=> (not res!958264) (not e!804315))))

(declare-datatypes ((array!97123 0))(
  ( (array!97124 (arr!46879 (Array (_ BitVec 32) (_ BitVec 64))) (size!47429 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97123)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1422831 (= res!958264 (validKeyInArray!0 (select (arr!46879 a!2831) j!81)))))

(declare-fun b!1422832 () Bool)

(declare-fun res!958273 () Bool)

(assert (=> b!1422832 (=> (not res!958273) (not e!804315))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1422832 (= res!958273 (and (= (size!47429 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47429 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47429 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1422833 () Bool)

(declare-fun e!804316 () Bool)

(declare-fun e!804314 () Bool)

(assert (=> b!1422833 (= e!804316 (not e!804314))))

(declare-fun res!958279 () Bool)

(assert (=> b!1422833 (=> res!958279 e!804314)))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1422833 (= res!958279 (or (= (select (arr!46879 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46879 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46879 a!2831) index!585) (select (arr!46879 a!2831) j!81)) (= (select (store (arr!46879 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!804312 () Bool)

(assert (=> b!1422833 e!804312))

(declare-fun res!958276 () Bool)

(assert (=> b!1422833 (=> (not res!958276) (not e!804312))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97123 (_ BitVec 32)) Bool)

(assert (=> b!1422833 (= res!958276 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48164 0))(
  ( (Unit!48165) )
))
(declare-fun lt!626852 () Unit!48164)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97123 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48164)

(assert (=> b!1422833 (= lt!626852 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1422835 () Bool)

(declare-fun e!804311 () Bool)

(assert (=> b!1422835 (= e!804311 e!804316)))

(declare-fun res!958268 () Bool)

(assert (=> b!1422835 (=> (not res!958268) (not e!804316))))

(declare-datatypes ((SeekEntryResult!11164 0))(
  ( (MissingZero!11164 (index!47048 (_ BitVec 32))) (Found!11164 (index!47049 (_ BitVec 32))) (Intermediate!11164 (undefined!11976 Bool) (index!47050 (_ BitVec 32)) (x!128686 (_ BitVec 32))) (Undefined!11164) (MissingVacant!11164 (index!47051 (_ BitVec 32))) )
))
(declare-fun lt!626848 () SeekEntryResult!11164)

(declare-fun lt!626849 () (_ BitVec 64))

(declare-fun lt!626847 () array!97123)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97123 (_ BitVec 32)) SeekEntryResult!11164)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1422835 (= res!958268 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626849 mask!2608) lt!626849 lt!626847 mask!2608) lt!626848))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1422835 (= lt!626848 (Intermediate!11164 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1422835 (= lt!626849 (select (store (arr!46879 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1422835 (= lt!626847 (array!97124 (store (arr!46879 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47429 a!2831)))))

(declare-fun b!1422836 () Bool)

(declare-fun res!958277 () Bool)

(assert (=> b!1422836 (=> (not res!958277) (not e!804315))))

(declare-datatypes ((List!33389 0))(
  ( (Nil!33386) (Cons!33385 (h!34687 (_ BitVec 64)) (t!48083 List!33389)) )
))
(declare-fun arrayNoDuplicates!0 (array!97123 (_ BitVec 32) List!33389) Bool)

(assert (=> b!1422836 (= res!958277 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33386))))

(declare-fun b!1422837 () Bool)

(declare-fun res!958271 () Bool)

(assert (=> b!1422837 (=> (not res!958271) (not e!804316))))

(declare-fun x!605 () (_ BitVec 32))

(assert (=> b!1422837 (= res!958271 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626849 lt!626847 mask!2608) lt!626848))))

(declare-fun b!1422838 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97123 (_ BitVec 32)) SeekEntryResult!11164)

(assert (=> b!1422838 (= e!804312 (= (seekEntryOrOpen!0 (select (arr!46879 a!2831) j!81) a!2831 mask!2608) (Found!11164 j!81)))))

(declare-fun b!1422839 () Bool)

(declare-fun res!958275 () Bool)

(assert (=> b!1422839 (=> (not res!958275) (not e!804315))))

(assert (=> b!1422839 (= res!958275 (validKeyInArray!0 (select (arr!46879 a!2831) i!982)))))

(declare-fun b!1422840 () Bool)

(declare-fun e!804313 () Bool)

(assert (=> b!1422840 (= e!804314 e!804313)))

(declare-fun res!958274 () Bool)

(assert (=> b!1422840 (=> res!958274 e!804313)))

(declare-fun lt!626853 () (_ BitVec 32))

(assert (=> b!1422840 (= res!958274 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!626853 #b00000000000000000000000000000000) (bvsge lt!626853 (size!47429 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1422840 (= lt!626853 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1422841 () Bool)

(declare-fun res!958265 () Bool)

(assert (=> b!1422841 (=> (not res!958265) (not e!804315))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1422841 (= res!958265 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47429 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47429 a!2831))))))

(declare-fun b!1422842 () Bool)

(assert (=> b!1422842 (= e!804313 true)))

(declare-fun lt!626850 () SeekEntryResult!11164)

(assert (=> b!1422842 (= lt!626850 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!626853 lt!626849 lt!626847 mask!2608))))

(declare-fun b!1422843 () Bool)

(declare-fun res!958272 () Bool)

(assert (=> b!1422843 (=> res!958272 e!804313)))

(declare-fun lt!626851 () SeekEntryResult!11164)

(assert (=> b!1422843 (= res!958272 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!626853 (select (arr!46879 a!2831) j!81) a!2831 mask!2608) lt!626851)))))

(declare-fun b!1422844 () Bool)

(declare-fun res!958278 () Bool)

(assert (=> b!1422844 (=> (not res!958278) (not e!804316))))

(assert (=> b!1422844 (= res!958278 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1422834 () Bool)

(declare-fun res!958267 () Bool)

(assert (=> b!1422834 (=> (not res!958267) (not e!804316))))

(assert (=> b!1422834 (= res!958267 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46879 a!2831) j!81) a!2831 mask!2608) lt!626851))))

(declare-fun res!958270 () Bool)

(assert (=> start!122758 (=> (not res!958270) (not e!804315))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122758 (= res!958270 (validMask!0 mask!2608))))

(assert (=> start!122758 e!804315))

(assert (=> start!122758 true))

(declare-fun array_inv!35907 (array!97123) Bool)

(assert (=> start!122758 (array_inv!35907 a!2831)))

(declare-fun b!1422845 () Bool)

(declare-fun res!958266 () Bool)

(assert (=> b!1422845 (=> (not res!958266) (not e!804315))))

(assert (=> b!1422845 (= res!958266 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1422846 () Bool)

(assert (=> b!1422846 (= e!804315 e!804311)))

(declare-fun res!958269 () Bool)

(assert (=> b!1422846 (=> (not res!958269) (not e!804311))))

(assert (=> b!1422846 (= res!958269 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46879 a!2831) j!81) mask!2608) (select (arr!46879 a!2831) j!81) a!2831 mask!2608) lt!626851))))

(assert (=> b!1422846 (= lt!626851 (Intermediate!11164 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(assert (= (and start!122758 res!958270) b!1422832))

(assert (= (and b!1422832 res!958273) b!1422839))

(assert (= (and b!1422839 res!958275) b!1422831))

(assert (= (and b!1422831 res!958264) b!1422845))

(assert (= (and b!1422845 res!958266) b!1422836))

(assert (= (and b!1422836 res!958277) b!1422841))

(assert (= (and b!1422841 res!958265) b!1422846))

(assert (= (and b!1422846 res!958269) b!1422835))

(assert (= (and b!1422835 res!958268) b!1422834))

(assert (= (and b!1422834 res!958267) b!1422837))

(assert (= (and b!1422837 res!958271) b!1422844))

(assert (= (and b!1422844 res!958278) b!1422833))

(assert (= (and b!1422833 res!958276) b!1422838))

(assert (= (and b!1422833 (not res!958279)) b!1422840))

(assert (= (and b!1422840 (not res!958274)) b!1422843))

(assert (= (and b!1422843 (not res!958272)) b!1422842))

(declare-fun m!1313379 () Bool)

(assert (=> b!1422839 m!1313379))

(assert (=> b!1422839 m!1313379))

(declare-fun m!1313381 () Bool)

(assert (=> b!1422839 m!1313381))

(declare-fun m!1313383 () Bool)

(assert (=> start!122758 m!1313383))

(declare-fun m!1313385 () Bool)

(assert (=> start!122758 m!1313385))

(declare-fun m!1313387 () Bool)

(assert (=> b!1422837 m!1313387))

(declare-fun m!1313389 () Bool)

(assert (=> b!1422835 m!1313389))

(assert (=> b!1422835 m!1313389))

(declare-fun m!1313391 () Bool)

(assert (=> b!1422835 m!1313391))

(declare-fun m!1313393 () Bool)

(assert (=> b!1422835 m!1313393))

(declare-fun m!1313395 () Bool)

(assert (=> b!1422835 m!1313395))

(declare-fun m!1313397 () Bool)

(assert (=> b!1422845 m!1313397))

(declare-fun m!1313399 () Bool)

(assert (=> b!1422846 m!1313399))

(assert (=> b!1422846 m!1313399))

(declare-fun m!1313401 () Bool)

(assert (=> b!1422846 m!1313401))

(assert (=> b!1422846 m!1313401))

(assert (=> b!1422846 m!1313399))

(declare-fun m!1313403 () Bool)

(assert (=> b!1422846 m!1313403))

(declare-fun m!1313405 () Bool)

(assert (=> b!1422840 m!1313405))

(assert (=> b!1422833 m!1313393))

(declare-fun m!1313407 () Bool)

(assert (=> b!1422833 m!1313407))

(declare-fun m!1313409 () Bool)

(assert (=> b!1422833 m!1313409))

(declare-fun m!1313411 () Bool)

(assert (=> b!1422833 m!1313411))

(assert (=> b!1422833 m!1313399))

(declare-fun m!1313413 () Bool)

(assert (=> b!1422833 m!1313413))

(declare-fun m!1313415 () Bool)

(assert (=> b!1422836 m!1313415))

(assert (=> b!1422838 m!1313399))

(assert (=> b!1422838 m!1313399))

(declare-fun m!1313417 () Bool)

(assert (=> b!1422838 m!1313417))

(assert (=> b!1422831 m!1313399))

(assert (=> b!1422831 m!1313399))

(declare-fun m!1313419 () Bool)

(assert (=> b!1422831 m!1313419))

(assert (=> b!1422843 m!1313399))

(assert (=> b!1422843 m!1313399))

(declare-fun m!1313421 () Bool)

(assert (=> b!1422843 m!1313421))

(declare-fun m!1313423 () Bool)

(assert (=> b!1422842 m!1313423))

(assert (=> b!1422834 m!1313399))

(assert (=> b!1422834 m!1313399))

(declare-fun m!1313425 () Bool)

(assert (=> b!1422834 m!1313425))

(push 1)

