; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123244 () Bool)

(assert start!123244)

(declare-fun b!1429020 () Bool)

(declare-fun res!963652 () Bool)

(declare-fun e!806979 () Bool)

(assert (=> b!1429020 (=> (not res!963652) (not e!806979))))

(declare-datatypes ((array!97405 0))(
  ( (array!97406 (arr!47014 (Array (_ BitVec 32) (_ BitVec 64))) (size!47564 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97405)

(declare-datatypes ((List!33524 0))(
  ( (Nil!33521) (Cons!33520 (h!34834 (_ BitVec 64)) (t!48218 List!33524)) )
))
(declare-fun arrayNoDuplicates!0 (array!97405 (_ BitVec 32) List!33524) Bool)

(assert (=> b!1429020 (= res!963652 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33521))))

(declare-fun b!1429021 () Bool)

(declare-fun res!963649 () Bool)

(assert (=> b!1429021 (=> (not res!963649) (not e!806979))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1429021 (= res!963649 (validKeyInArray!0 (select (arr!47014 a!2831) j!81)))))

(declare-fun b!1429022 () Bool)

(declare-fun res!963650 () Bool)

(assert (=> b!1429022 (=> (not res!963650) (not e!806979))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1429022 (= res!963650 (validKeyInArray!0 (select (arr!47014 a!2831) i!982)))))

(declare-fun b!1429023 () Bool)

(declare-fun e!806980 () Bool)

(assert (=> b!1429023 (= e!806979 e!806980)))

(declare-fun res!963661 () Bool)

(assert (=> b!1429023 (=> (not res!963661) (not e!806980))))

(declare-datatypes ((SeekEntryResult!11293 0))(
  ( (MissingZero!11293 (index!47564 (_ BitVec 32))) (Found!11293 (index!47565 (_ BitVec 32))) (Intermediate!11293 (undefined!12105 Bool) (index!47566 (_ BitVec 32)) (x!129199 (_ BitVec 32))) (Undefined!11293) (MissingVacant!11293 (index!47567 (_ BitVec 32))) )
))
(declare-fun lt!629206 () SeekEntryResult!11293)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97405 (_ BitVec 32)) SeekEntryResult!11293)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1429023 (= res!963661 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47014 a!2831) j!81) mask!2608) (select (arr!47014 a!2831) j!81) a!2831 mask!2608) lt!629206))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1429023 (= lt!629206 (Intermediate!11293 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1429024 () Bool)

(declare-fun res!963660 () Bool)

(assert (=> b!1429024 (=> (not res!963660) (not e!806979))))

(assert (=> b!1429024 (= res!963660 (and (= (size!47564 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47564 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47564 a!2831)) (not (= i!982 j!81))))))

(declare-fun e!806981 () Bool)

(declare-fun b!1429025 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97405 (_ BitVec 32)) SeekEntryResult!11293)

(assert (=> b!1429025 (= e!806981 (= (seekEntryOrOpen!0 (select (arr!47014 a!2831) j!81) a!2831 mask!2608) (Found!11293 j!81)))))

(declare-fun b!1429026 () Bool)

(declare-fun res!963653 () Bool)

(declare-fun e!806978 () Bool)

(assert (=> b!1429026 (=> (not res!963653) (not e!806978))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1429026 (= res!963653 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1429027 () Bool)

(declare-fun res!963657 () Bool)

(assert (=> b!1429027 (=> (not res!963657) (not e!806979))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1429027 (= res!963657 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47564 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47564 a!2831))))))

(declare-fun res!963651 () Bool)

(assert (=> start!123244 (=> (not res!963651) (not e!806979))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123244 (= res!963651 (validMask!0 mask!2608))))

(assert (=> start!123244 e!806979))

(assert (=> start!123244 true))

(declare-fun array_inv!36042 (array!97405) Bool)

(assert (=> start!123244 (array_inv!36042 a!2831)))

(declare-fun b!1429028 () Bool)

(declare-fun res!963658 () Bool)

(assert (=> b!1429028 (=> (not res!963658) (not e!806978))))

(assert (=> b!1429028 (= res!963658 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47014 a!2831) j!81) a!2831 mask!2608) lt!629206))))

(declare-fun b!1429029 () Bool)

(declare-fun res!963659 () Bool)

(assert (=> b!1429029 (=> (not res!963659) (not e!806978))))

(declare-fun lt!629204 () (_ BitVec 64))

(declare-fun lt!629208 () array!97405)

(declare-fun lt!629205 () SeekEntryResult!11293)

(assert (=> b!1429029 (= res!963659 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!629204 lt!629208 mask!2608) lt!629205))))

(declare-fun b!1429030 () Bool)

(declare-fun res!963655 () Bool)

(assert (=> b!1429030 (=> (not res!963655) (not e!806979))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97405 (_ BitVec 32)) Bool)

(assert (=> b!1429030 (= res!963655 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1429031 () Bool)

(assert (=> b!1429031 (= e!806980 e!806978)))

(declare-fun res!963656 () Bool)

(assert (=> b!1429031 (=> (not res!963656) (not e!806978))))

(assert (=> b!1429031 (= res!963656 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!629204 mask!2608) lt!629204 lt!629208 mask!2608) lt!629205))))

(assert (=> b!1429031 (= lt!629205 (Intermediate!11293 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1429031 (= lt!629204 (select (store (arr!47014 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1429031 (= lt!629208 (array!97406 (store (arr!47014 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47564 a!2831)))))

(declare-fun b!1429032 () Bool)

(assert (=> b!1429032 (= e!806978 (not true))))

(assert (=> b!1429032 e!806981))

(declare-fun res!963654 () Bool)

(assert (=> b!1429032 (=> (not res!963654) (not e!806981))))

(assert (=> b!1429032 (= res!963654 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48332 0))(
  ( (Unit!48333) )
))
(declare-fun lt!629207 () Unit!48332)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97405 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48332)

(assert (=> b!1429032 (= lt!629207 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(assert (= (and start!123244 res!963651) b!1429024))

(assert (= (and b!1429024 res!963660) b!1429022))

(assert (= (and b!1429022 res!963650) b!1429021))

(assert (= (and b!1429021 res!963649) b!1429030))

(assert (= (and b!1429030 res!963655) b!1429020))

(assert (= (and b!1429020 res!963652) b!1429027))

(assert (= (and b!1429027 res!963657) b!1429023))

(assert (= (and b!1429023 res!963661) b!1429031))

(assert (= (and b!1429031 res!963656) b!1429028))

(assert (= (and b!1429028 res!963658) b!1429029))

(assert (= (and b!1429029 res!963659) b!1429026))

(assert (= (and b!1429026 res!963653) b!1429032))

(assert (= (and b!1429032 res!963654) b!1429025))

(declare-fun m!1319131 () Bool)

(assert (=> b!1429031 m!1319131))

(assert (=> b!1429031 m!1319131))

(declare-fun m!1319133 () Bool)

(assert (=> b!1429031 m!1319133))

(declare-fun m!1319135 () Bool)

(assert (=> b!1429031 m!1319135))

(declare-fun m!1319137 () Bool)

(assert (=> b!1429031 m!1319137))

(declare-fun m!1319139 () Bool)

(assert (=> b!1429025 m!1319139))

(assert (=> b!1429025 m!1319139))

(declare-fun m!1319141 () Bool)

(assert (=> b!1429025 m!1319141))

(declare-fun m!1319143 () Bool)

(assert (=> b!1429030 m!1319143))

(assert (=> b!1429028 m!1319139))

(assert (=> b!1429028 m!1319139))

(declare-fun m!1319145 () Bool)

(assert (=> b!1429028 m!1319145))

(declare-fun m!1319147 () Bool)

(assert (=> b!1429032 m!1319147))

(declare-fun m!1319149 () Bool)

(assert (=> b!1429032 m!1319149))

(declare-fun m!1319151 () Bool)

(assert (=> start!123244 m!1319151))

(declare-fun m!1319153 () Bool)

(assert (=> start!123244 m!1319153))

(assert (=> b!1429023 m!1319139))

(assert (=> b!1429023 m!1319139))

(declare-fun m!1319155 () Bool)

(assert (=> b!1429023 m!1319155))

(assert (=> b!1429023 m!1319155))

(assert (=> b!1429023 m!1319139))

(declare-fun m!1319157 () Bool)

(assert (=> b!1429023 m!1319157))

(declare-fun m!1319159 () Bool)

(assert (=> b!1429020 m!1319159))

(declare-fun m!1319161 () Bool)

(assert (=> b!1429022 m!1319161))

(assert (=> b!1429022 m!1319161))

(declare-fun m!1319163 () Bool)

(assert (=> b!1429022 m!1319163))

(declare-fun m!1319165 () Bool)

(assert (=> b!1429029 m!1319165))

(assert (=> b!1429021 m!1319139))

(assert (=> b!1429021 m!1319139))

(declare-fun m!1319167 () Bool)

(assert (=> b!1429021 m!1319167))

(push 1)

(assert (not b!1429025))

