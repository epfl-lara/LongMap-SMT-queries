; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123240 () Bool)

(assert start!123240)

(declare-fun b!1428942 () Bool)

(declare-fun res!963573 () Bool)

(declare-fun e!806949 () Bool)

(assert (=> b!1428942 (=> (not res!963573) (not e!806949))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97401 0))(
  ( (array!97402 (arr!47012 (Array (_ BitVec 32) (_ BitVec 64))) (size!47562 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97401)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11291 0))(
  ( (MissingZero!11291 (index!47556 (_ BitVec 32))) (Found!11291 (index!47557 (_ BitVec 32))) (Intermediate!11291 (undefined!12103 Bool) (index!47558 (_ BitVec 32)) (x!129197 (_ BitVec 32))) (Undefined!11291) (MissingVacant!11291 (index!47559 (_ BitVec 32))) )
))
(declare-fun lt!629175 () SeekEntryResult!11291)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97401 (_ BitVec 32)) SeekEntryResult!11291)

(assert (=> b!1428942 (= res!963573 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47012 a!2831) j!81) a!2831 mask!2608) lt!629175))))

(declare-fun b!1428943 () Bool)

(declare-fun res!963575 () Bool)

(assert (=> b!1428943 (=> (not res!963575) (not e!806949))))

(declare-fun lt!629176 () array!97401)

(declare-fun lt!629178 () (_ BitVec 64))

(declare-fun lt!629177 () SeekEntryResult!11291)

(assert (=> b!1428943 (= res!963575 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!629178 lt!629176 mask!2608) lt!629177))))

(declare-fun b!1428944 () Bool)

(declare-fun res!963583 () Bool)

(declare-fun e!806947 () Bool)

(assert (=> b!1428944 (=> (not res!963583) (not e!806947))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1428944 (= res!963583 (validKeyInArray!0 (select (arr!47012 a!2831) i!982)))))

(declare-fun res!963572 () Bool)

(assert (=> start!123240 (=> (not res!963572) (not e!806947))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123240 (= res!963572 (validMask!0 mask!2608))))

(assert (=> start!123240 e!806947))

(assert (=> start!123240 true))

(declare-fun array_inv!36040 (array!97401) Bool)

(assert (=> start!123240 (array_inv!36040 a!2831)))

(declare-fun b!1428945 () Bool)

(declare-fun res!963574 () Bool)

(assert (=> b!1428945 (=> (not res!963574) (not e!806947))))

(assert (=> b!1428945 (= res!963574 (and (= (size!47562 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47562 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47562 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1428946 () Bool)

(declare-fun res!963580 () Bool)

(assert (=> b!1428946 (=> (not res!963580) (not e!806947))))

(assert (=> b!1428946 (= res!963580 (validKeyInArray!0 (select (arr!47012 a!2831) j!81)))))

(declare-fun b!1428947 () Bool)

(declare-fun res!963576 () Bool)

(assert (=> b!1428947 (=> (not res!963576) (not e!806947))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97401 (_ BitVec 32)) Bool)

(assert (=> b!1428947 (= res!963576 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1428948 () Bool)

(declare-fun e!806948 () Bool)

(assert (=> b!1428948 (= e!806947 e!806948)))

(declare-fun res!963577 () Bool)

(assert (=> b!1428948 (=> (not res!963577) (not e!806948))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1428948 (= res!963577 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47012 a!2831) j!81) mask!2608) (select (arr!47012 a!2831) j!81) a!2831 mask!2608) lt!629175))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1428948 (= lt!629175 (Intermediate!11291 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1428949 () Bool)

(declare-fun res!963571 () Bool)

(assert (=> b!1428949 (=> (not res!963571) (not e!806949))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1428949 (= res!963571 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1428950 () Bool)

(assert (=> b!1428950 (= e!806949 (not true))))

(declare-fun e!806950 () Bool)

(assert (=> b!1428950 e!806950))

(declare-fun res!963582 () Bool)

(assert (=> b!1428950 (=> (not res!963582) (not e!806950))))

(assert (=> b!1428950 (= res!963582 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48328 0))(
  ( (Unit!48329) )
))
(declare-fun lt!629174 () Unit!48328)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97401 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48328)

(assert (=> b!1428950 (= lt!629174 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1428951 () Bool)

(assert (=> b!1428951 (= e!806948 e!806949)))

(declare-fun res!963581 () Bool)

(assert (=> b!1428951 (=> (not res!963581) (not e!806949))))

(assert (=> b!1428951 (= res!963581 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!629178 mask!2608) lt!629178 lt!629176 mask!2608) lt!629177))))

(assert (=> b!1428951 (= lt!629177 (Intermediate!11291 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1428951 (= lt!629178 (select (store (arr!47012 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1428951 (= lt!629176 (array!97402 (store (arr!47012 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47562 a!2831)))))

(declare-fun b!1428952 () Bool)

(declare-fun res!963579 () Bool)

(assert (=> b!1428952 (=> (not res!963579) (not e!806947))))

(assert (=> b!1428952 (= res!963579 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47562 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47562 a!2831))))))

(declare-fun b!1428953 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97401 (_ BitVec 32)) SeekEntryResult!11291)

(assert (=> b!1428953 (= e!806950 (= (seekEntryOrOpen!0 (select (arr!47012 a!2831) j!81) a!2831 mask!2608) (Found!11291 j!81)))))

(declare-fun b!1428954 () Bool)

(declare-fun res!963578 () Bool)

(assert (=> b!1428954 (=> (not res!963578) (not e!806947))))

(declare-datatypes ((List!33522 0))(
  ( (Nil!33519) (Cons!33518 (h!34832 (_ BitVec 64)) (t!48216 List!33522)) )
))
(declare-fun arrayNoDuplicates!0 (array!97401 (_ BitVec 32) List!33522) Bool)

(assert (=> b!1428954 (= res!963578 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33519))))

(assert (= (and start!123240 res!963572) b!1428945))

(assert (= (and b!1428945 res!963574) b!1428944))

(assert (= (and b!1428944 res!963583) b!1428946))

(assert (= (and b!1428946 res!963580) b!1428947))

(assert (= (and b!1428947 res!963576) b!1428954))

(assert (= (and b!1428954 res!963578) b!1428952))

(assert (= (and b!1428952 res!963579) b!1428948))

(assert (= (and b!1428948 res!963577) b!1428951))

(assert (= (and b!1428951 res!963581) b!1428942))

(assert (= (and b!1428942 res!963573) b!1428943))

(assert (= (and b!1428943 res!963575) b!1428949))

(assert (= (and b!1428949 res!963571) b!1428950))

(assert (= (and b!1428950 res!963582) b!1428953))

(declare-fun m!1319055 () Bool)

(assert (=> b!1428946 m!1319055))

(assert (=> b!1428946 m!1319055))

(declare-fun m!1319057 () Bool)

(assert (=> b!1428946 m!1319057))

(assert (=> b!1428953 m!1319055))

(assert (=> b!1428953 m!1319055))

(declare-fun m!1319059 () Bool)

(assert (=> b!1428953 m!1319059))

(declare-fun m!1319061 () Bool)

(assert (=> b!1428951 m!1319061))

(assert (=> b!1428951 m!1319061))

(declare-fun m!1319063 () Bool)

(assert (=> b!1428951 m!1319063))

(declare-fun m!1319065 () Bool)

(assert (=> b!1428951 m!1319065))

(declare-fun m!1319067 () Bool)

(assert (=> b!1428951 m!1319067))

(assert (=> b!1428942 m!1319055))

(assert (=> b!1428942 m!1319055))

(declare-fun m!1319069 () Bool)

(assert (=> b!1428942 m!1319069))

(declare-fun m!1319071 () Bool)

(assert (=> b!1428950 m!1319071))

(declare-fun m!1319073 () Bool)

(assert (=> b!1428950 m!1319073))

(declare-fun m!1319075 () Bool)

(assert (=> b!1428947 m!1319075))

(assert (=> b!1428948 m!1319055))

(assert (=> b!1428948 m!1319055))

(declare-fun m!1319077 () Bool)

(assert (=> b!1428948 m!1319077))

(assert (=> b!1428948 m!1319077))

(assert (=> b!1428948 m!1319055))

(declare-fun m!1319079 () Bool)

(assert (=> b!1428948 m!1319079))

(declare-fun m!1319081 () Bool)

(assert (=> b!1428943 m!1319081))

(declare-fun m!1319083 () Bool)

(assert (=> start!123240 m!1319083))

(declare-fun m!1319085 () Bool)

(assert (=> start!123240 m!1319085))

(declare-fun m!1319087 () Bool)

(assert (=> b!1428944 m!1319087))

(assert (=> b!1428944 m!1319087))

(declare-fun m!1319089 () Bool)

(assert (=> b!1428944 m!1319089))

(declare-fun m!1319091 () Bool)

(assert (=> b!1428954 m!1319091))

(push 1)

