; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123150 () Bool)

(assert start!123150)

(declare-fun b!1427931 () Bool)

(declare-fun res!962761 () Bool)

(declare-fun e!806490 () Bool)

(assert (=> b!1427931 (=> (not res!962761) (not e!806490))))

(declare-datatypes ((array!97362 0))(
  ( (array!97363 (arr!46994 (Array (_ BitVec 32) (_ BitVec 64))) (size!47544 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97362)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1427931 (= res!962761 (validKeyInArray!0 (select (arr!46994 a!2831) j!81)))))

(declare-fun b!1427932 () Bool)

(declare-fun res!962769 () Bool)

(declare-fun e!806488 () Bool)

(assert (=> b!1427932 (=> (not res!962769) (not e!806488))))

(declare-fun lt!628775 () array!97362)

(declare-datatypes ((SeekEntryResult!11273 0))(
  ( (MissingZero!11273 (index!47484 (_ BitVec 32))) (Found!11273 (index!47485 (_ BitVec 32))) (Intermediate!11273 (undefined!12085 Bool) (index!47486 (_ BitVec 32)) (x!129125 (_ BitVec 32))) (Undefined!11273) (MissingVacant!11273 (index!47487 (_ BitVec 32))) )
))
(declare-fun lt!628772 () SeekEntryResult!11273)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun lt!628776 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97362 (_ BitVec 32)) SeekEntryResult!11273)

(assert (=> b!1427932 (= res!962769 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!628776 lt!628775 mask!2608) lt!628772))))

(declare-fun b!1427933 () Bool)

(declare-fun e!806492 () Bool)

(assert (=> b!1427933 (= e!806490 e!806492)))

(declare-fun res!962765 () Bool)

(assert (=> b!1427933 (=> (not res!962765) (not e!806492))))

(declare-fun lt!628773 () SeekEntryResult!11273)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1427933 (= res!962765 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46994 a!2831) j!81) mask!2608) (select (arr!46994 a!2831) j!81) a!2831 mask!2608) lt!628773))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1427933 (= lt!628773 (Intermediate!11273 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1427934 () Bool)

(declare-fun res!962762 () Bool)

(assert (=> b!1427934 (=> (not res!962762) (not e!806490))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1427934 (= res!962762 (validKeyInArray!0 (select (arr!46994 a!2831) i!982)))))

(declare-fun res!962770 () Bool)

(assert (=> start!123150 (=> (not res!962770) (not e!806490))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123150 (= res!962770 (validMask!0 mask!2608))))

(assert (=> start!123150 e!806490))

(assert (=> start!123150 true))

(declare-fun array_inv!36022 (array!97362) Bool)

(assert (=> start!123150 (array_inv!36022 a!2831)))

(declare-fun b!1427935 () Bool)

(assert (=> b!1427935 (= e!806488 (not true))))

(declare-fun e!806489 () Bool)

(assert (=> b!1427935 e!806489))

(declare-fun res!962767 () Bool)

(assert (=> b!1427935 (=> (not res!962767) (not e!806489))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97362 (_ BitVec 32)) Bool)

(assert (=> b!1427935 (= res!962767 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48292 0))(
  ( (Unit!48293) )
))
(declare-fun lt!628774 () Unit!48292)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97362 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48292)

(assert (=> b!1427935 (= lt!628774 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1427936 () Bool)

(declare-fun res!962768 () Bool)

(assert (=> b!1427936 (=> (not res!962768) (not e!806490))))

(declare-datatypes ((List!33504 0))(
  ( (Nil!33501) (Cons!33500 (h!34811 (_ BitVec 64)) (t!48198 List!33504)) )
))
(declare-fun arrayNoDuplicates!0 (array!97362 (_ BitVec 32) List!33504) Bool)

(assert (=> b!1427936 (= res!962768 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33501))))

(declare-fun b!1427937 () Bool)

(declare-fun res!962773 () Bool)

(assert (=> b!1427937 (=> (not res!962773) (not e!806490))))

(assert (=> b!1427937 (= res!962773 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47544 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47544 a!2831))))))

(declare-fun b!1427938 () Bool)

(declare-fun res!962771 () Bool)

(assert (=> b!1427938 (=> (not res!962771) (not e!806488))))

(assert (=> b!1427938 (= res!962771 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46994 a!2831) j!81) a!2831 mask!2608) lt!628773))))

(declare-fun b!1427939 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97362 (_ BitVec 32)) SeekEntryResult!11273)

(assert (=> b!1427939 (= e!806489 (= (seekEntryOrOpen!0 (select (arr!46994 a!2831) j!81) a!2831 mask!2608) (Found!11273 j!81)))))

(declare-fun b!1427940 () Bool)

(assert (=> b!1427940 (= e!806492 e!806488)))

(declare-fun res!962763 () Bool)

(assert (=> b!1427940 (=> (not res!962763) (not e!806488))))

(assert (=> b!1427940 (= res!962763 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!628776 mask!2608) lt!628776 lt!628775 mask!2608) lt!628772))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1427940 (= lt!628772 (Intermediate!11273 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1427940 (= lt!628776 (select (store (arr!46994 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1427940 (= lt!628775 (array!97363 (store (arr!46994 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47544 a!2831)))))

(declare-fun b!1427941 () Bool)

(declare-fun res!962766 () Bool)

(assert (=> b!1427941 (=> (not res!962766) (not e!806488))))

(assert (=> b!1427941 (= res!962766 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1427942 () Bool)

(declare-fun res!962772 () Bool)

(assert (=> b!1427942 (=> (not res!962772) (not e!806490))))

(assert (=> b!1427942 (= res!962772 (and (= (size!47544 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47544 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47544 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1427943 () Bool)

(declare-fun res!962764 () Bool)

(assert (=> b!1427943 (=> (not res!962764) (not e!806490))))

(assert (=> b!1427943 (= res!962764 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(assert (= (and start!123150 res!962770) b!1427942))

(assert (= (and b!1427942 res!962772) b!1427934))

(assert (= (and b!1427934 res!962762) b!1427931))

(assert (= (and b!1427931 res!962761) b!1427943))

(assert (= (and b!1427943 res!962764) b!1427936))

(assert (= (and b!1427936 res!962768) b!1427937))

(assert (= (and b!1427937 res!962773) b!1427933))

(assert (= (and b!1427933 res!962765) b!1427940))

(assert (= (and b!1427940 res!962763) b!1427938))

(assert (= (and b!1427938 res!962771) b!1427932))

(assert (= (and b!1427932 res!962769) b!1427941))

(assert (= (and b!1427941 res!962766) b!1427935))

(assert (= (and b!1427935 res!962767) b!1427939))

(declare-fun m!1318179 () Bool)

(assert (=> b!1427933 m!1318179))

(assert (=> b!1427933 m!1318179))

(declare-fun m!1318181 () Bool)

(assert (=> b!1427933 m!1318181))

(assert (=> b!1427933 m!1318181))

(assert (=> b!1427933 m!1318179))

(declare-fun m!1318183 () Bool)

(assert (=> b!1427933 m!1318183))

(declare-fun m!1318185 () Bool)

(assert (=> b!1427943 m!1318185))

(declare-fun m!1318187 () Bool)

(assert (=> b!1427935 m!1318187))

(declare-fun m!1318189 () Bool)

(assert (=> b!1427935 m!1318189))

(assert (=> b!1427931 m!1318179))

(assert (=> b!1427931 m!1318179))

(declare-fun m!1318191 () Bool)

(assert (=> b!1427931 m!1318191))

(assert (=> b!1427938 m!1318179))

(assert (=> b!1427938 m!1318179))

(declare-fun m!1318193 () Bool)

(assert (=> b!1427938 m!1318193))

(declare-fun m!1318195 () Bool)

(assert (=> b!1427932 m!1318195))

(assert (=> b!1427939 m!1318179))

(assert (=> b!1427939 m!1318179))

(declare-fun m!1318197 () Bool)

(assert (=> b!1427939 m!1318197))

(declare-fun m!1318199 () Bool)

(assert (=> start!123150 m!1318199))

(declare-fun m!1318201 () Bool)

(assert (=> start!123150 m!1318201))

(declare-fun m!1318203 () Bool)

(assert (=> b!1427940 m!1318203))

(assert (=> b!1427940 m!1318203))

(declare-fun m!1318205 () Bool)

(assert (=> b!1427940 m!1318205))

(declare-fun m!1318207 () Bool)

(assert (=> b!1427940 m!1318207))

(declare-fun m!1318209 () Bool)

(assert (=> b!1427940 m!1318209))

(declare-fun m!1318211 () Bool)

(assert (=> b!1427936 m!1318211))

(declare-fun m!1318213 () Bool)

(assert (=> b!1427934 m!1318213))

(assert (=> b!1427934 m!1318213))

(declare-fun m!1318215 () Bool)

(assert (=> b!1427934 m!1318215))

(push 1)

