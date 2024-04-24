; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123320 () Bool)

(assert start!123320)

(declare-fun b!1428720 () Bool)

(declare-fun e!807091 () Bool)

(declare-fun e!807092 () Bool)

(assert (=> b!1428720 (= e!807091 e!807092)))

(declare-fun res!962867 () Bool)

(assert (=> b!1428720 (=> (not res!962867) (not e!807092))))

(declare-datatypes ((SeekEntryResult!11219 0))(
  ( (MissingZero!11219 (index!47268 (_ BitVec 32))) (Found!11219 (index!47269 (_ BitVec 32))) (Intermediate!11219 (undefined!12031 Bool) (index!47270 (_ BitVec 32)) (x!129066 (_ BitVec 32))) (Undefined!11219) (MissingVacant!11219 (index!47271 (_ BitVec 32))) )
))
(declare-fun lt!629035 () SeekEntryResult!11219)

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97454 0))(
  ( (array!97455 (arr!47038 (Array (_ BitVec 32) (_ BitVec 64))) (size!47589 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97454)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97454 (_ BitVec 32)) SeekEntryResult!11219)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1428720 (= res!962867 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47038 a!2831) j!81) mask!2608) (select (arr!47038 a!2831) j!81) a!2831 mask!2608) lt!629035))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1428720 (= lt!629035 (Intermediate!11219 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1428721 () Bool)

(declare-fun res!962878 () Bool)

(assert (=> b!1428721 (=> (not res!962878) (not e!807091))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1428721 (= res!962878 (validKeyInArray!0 (select (arr!47038 a!2831) i!982)))))

(declare-fun b!1428722 () Bool)

(declare-fun e!807093 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97454 (_ BitVec 32)) SeekEntryResult!11219)

(assert (=> b!1428722 (= e!807093 (= (seekEntryOrOpen!0 (select (arr!47038 a!2831) j!81) a!2831 mask!2608) (Found!11219 j!81)))))

(declare-fun b!1428723 () Bool)

(declare-fun res!962873 () Bool)

(assert (=> b!1428723 (=> (not res!962873) (not e!807091))))

(assert (=> b!1428723 (= res!962873 (validKeyInArray!0 (select (arr!47038 a!2831) j!81)))))

(declare-fun b!1428724 () Bool)

(declare-fun res!962869 () Bool)

(assert (=> b!1428724 (=> (not res!962869) (not e!807091))))

(declare-datatypes ((List!33535 0))(
  ( (Nil!33532) (Cons!33531 (h!34850 (_ BitVec 64)) (t!48221 List!33535)) )
))
(declare-fun arrayNoDuplicates!0 (array!97454 (_ BitVec 32) List!33535) Bool)

(assert (=> b!1428724 (= res!962869 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33532))))

(declare-fun b!1428725 () Bool)

(declare-fun res!962874 () Bool)

(assert (=> b!1428725 (=> (not res!962874) (not e!807091))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97454 (_ BitVec 32)) Bool)

(assert (=> b!1428725 (= res!962874 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1428726 () Bool)

(declare-fun res!962868 () Bool)

(assert (=> b!1428726 (=> (not res!962868) (not e!807091))))

(assert (=> b!1428726 (= res!962868 (and (= (size!47589 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47589 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47589 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1428727 () Bool)

(declare-fun e!807094 () Bool)

(assert (=> b!1428727 (= e!807092 e!807094)))

(declare-fun res!962876 () Bool)

(assert (=> b!1428727 (=> (not res!962876) (not e!807094))))

(declare-fun lt!629036 () (_ BitVec 64))

(declare-fun lt!629039 () SeekEntryResult!11219)

(declare-fun lt!629037 () array!97454)

(assert (=> b!1428727 (= res!962876 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!629036 mask!2608) lt!629036 lt!629037 mask!2608) lt!629039))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1428727 (= lt!629039 (Intermediate!11219 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1428727 (= lt!629036 (select (store (arr!47038 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1428727 (= lt!629037 (array!97455 (store (arr!47038 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47589 a!2831)))))

(declare-fun b!1428728 () Bool)

(declare-fun res!962871 () Bool)

(assert (=> b!1428728 (=> (not res!962871) (not e!807094))))

(assert (=> b!1428728 (= res!962871 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1428729 () Bool)

(declare-fun res!962866 () Bool)

(assert (=> b!1428729 (=> (not res!962866) (not e!807091))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1428729 (= res!962866 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47589 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47589 a!2831))))))

(declare-fun res!962870 () Bool)

(assert (=> start!123320 (=> (not res!962870) (not e!807091))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123320 (= res!962870 (validMask!0 mask!2608))))

(assert (=> start!123320 e!807091))

(assert (=> start!123320 true))

(declare-fun array_inv!36319 (array!97454) Bool)

(assert (=> start!123320 (array_inv!36319 a!2831)))

(declare-fun b!1428730 () Bool)

(declare-fun res!962875 () Bool)

(assert (=> b!1428730 (=> (not res!962875) (not e!807094))))

(assert (=> b!1428730 (= res!962875 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!629036 lt!629037 mask!2608) lt!629039))))

(declare-fun b!1428731 () Bool)

(assert (=> b!1428731 (= e!807094 (not true))))

(assert (=> b!1428731 e!807093))

(declare-fun res!962872 () Bool)

(assert (=> b!1428731 (=> (not res!962872) (not e!807093))))

(assert (=> b!1428731 (= res!962872 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48215 0))(
  ( (Unit!48216) )
))
(declare-fun lt!629038 () Unit!48215)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97454 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48215)

(assert (=> b!1428731 (= lt!629038 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1428732 () Bool)

(declare-fun res!962877 () Bool)

(assert (=> b!1428732 (=> (not res!962877) (not e!807094))))

(assert (=> b!1428732 (= res!962877 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47038 a!2831) j!81) a!2831 mask!2608) lt!629035))))

(assert (= (and start!123320 res!962870) b!1428726))

(assert (= (and b!1428726 res!962868) b!1428721))

(assert (= (and b!1428721 res!962878) b!1428723))

(assert (= (and b!1428723 res!962873) b!1428725))

(assert (= (and b!1428725 res!962874) b!1428724))

(assert (= (and b!1428724 res!962869) b!1428729))

(assert (= (and b!1428729 res!962866) b!1428720))

(assert (= (and b!1428720 res!962867) b!1428727))

(assert (= (and b!1428727 res!962876) b!1428732))

(assert (= (and b!1428732 res!962877) b!1428730))

(assert (= (and b!1428730 res!962875) b!1428728))

(assert (= (and b!1428728 res!962871) b!1428731))

(assert (= (and b!1428731 res!962872) b!1428722))

(declare-fun m!1319211 () Bool)

(assert (=> b!1428720 m!1319211))

(assert (=> b!1428720 m!1319211))

(declare-fun m!1319213 () Bool)

(assert (=> b!1428720 m!1319213))

(assert (=> b!1428720 m!1319213))

(assert (=> b!1428720 m!1319211))

(declare-fun m!1319215 () Bool)

(assert (=> b!1428720 m!1319215))

(assert (=> b!1428722 m!1319211))

(assert (=> b!1428722 m!1319211))

(declare-fun m!1319217 () Bool)

(assert (=> b!1428722 m!1319217))

(declare-fun m!1319219 () Bool)

(assert (=> start!123320 m!1319219))

(declare-fun m!1319221 () Bool)

(assert (=> start!123320 m!1319221))

(declare-fun m!1319223 () Bool)

(assert (=> b!1428725 m!1319223))

(assert (=> b!1428723 m!1319211))

(assert (=> b!1428723 m!1319211))

(declare-fun m!1319225 () Bool)

(assert (=> b!1428723 m!1319225))

(declare-fun m!1319227 () Bool)

(assert (=> b!1428721 m!1319227))

(assert (=> b!1428721 m!1319227))

(declare-fun m!1319229 () Bool)

(assert (=> b!1428721 m!1319229))

(assert (=> b!1428732 m!1319211))

(assert (=> b!1428732 m!1319211))

(declare-fun m!1319231 () Bool)

(assert (=> b!1428732 m!1319231))

(declare-fun m!1319233 () Bool)

(assert (=> b!1428724 m!1319233))

(declare-fun m!1319235 () Bool)

(assert (=> b!1428727 m!1319235))

(assert (=> b!1428727 m!1319235))

(declare-fun m!1319237 () Bool)

(assert (=> b!1428727 m!1319237))

(declare-fun m!1319239 () Bool)

(assert (=> b!1428727 m!1319239))

(declare-fun m!1319241 () Bool)

(assert (=> b!1428727 m!1319241))

(declare-fun m!1319243 () Bool)

(assert (=> b!1428730 m!1319243))

(declare-fun m!1319245 () Bool)

(assert (=> b!1428731 m!1319245))

(declare-fun m!1319247 () Bool)

(assert (=> b!1428731 m!1319247))

(check-sat (not b!1428732) (not b!1428722) (not b!1428731) (not b!1428725) (not b!1428727) (not b!1428730) (not b!1428720) (not start!123320) (not b!1428724) (not b!1428721) (not b!1428723))
(check-sat)
