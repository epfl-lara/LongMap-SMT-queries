; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123102 () Bool)

(assert start!123102)

(declare-fun b!1426477 () Bool)

(declare-fun e!806179 () Bool)

(assert (=> b!1426477 (= e!806179 false)))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97338 0))(
  ( (array!97339 (arr!46983 (Array (_ BitVec 32) (_ BitVec 64))) (size!47534 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97338)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11164 0))(
  ( (MissingZero!11164 (index!47048 (_ BitVec 32))) (Found!11164 (index!47049 (_ BitVec 32))) (Intermediate!11164 (undefined!11976 Bool) (index!47050 (_ BitVec 32)) (x!128847 (_ BitVec 32))) (Undefined!11164) (MissingVacant!11164 (index!47051 (_ BitVec 32))) )
))
(declare-fun lt!628292 () SeekEntryResult!11164)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97338 (_ BitVec 32)) SeekEntryResult!11164)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1426477 (= lt!628292 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46983 a!2831) j!81) mask!2608) (select (arr!46983 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1426478 () Bool)

(declare-fun res!961025 () Bool)

(assert (=> b!1426478 (=> (not res!961025) (not e!806179))))

(declare-datatypes ((List!33480 0))(
  ( (Nil!33477) (Cons!33476 (h!34789 (_ BitVec 64)) (t!48166 List!33480)) )
))
(declare-fun arrayNoDuplicates!0 (array!97338 (_ BitVec 32) List!33480) Bool)

(assert (=> b!1426478 (= res!961025 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33477))))

(declare-fun b!1426479 () Bool)

(declare-fun res!961030 () Bool)

(assert (=> b!1426479 (=> (not res!961030) (not e!806179))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1426479 (= res!961030 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47534 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47534 a!2831))))))

(declare-fun b!1426480 () Bool)

(declare-fun res!961028 () Bool)

(assert (=> b!1426480 (=> (not res!961028) (not e!806179))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1426480 (= res!961028 (and (= (size!47534 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47534 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47534 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1426481 () Bool)

(declare-fun res!961024 () Bool)

(assert (=> b!1426481 (=> (not res!961024) (not e!806179))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1426481 (= res!961024 (validKeyInArray!0 (select (arr!46983 a!2831) i!982)))))

(declare-fun b!1426482 () Bool)

(declare-fun res!961029 () Bool)

(assert (=> b!1426482 (=> (not res!961029) (not e!806179))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97338 (_ BitVec 32)) Bool)

(assert (=> b!1426482 (= res!961029 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1426476 () Bool)

(declare-fun res!961026 () Bool)

(assert (=> b!1426476 (=> (not res!961026) (not e!806179))))

(assert (=> b!1426476 (= res!961026 (validKeyInArray!0 (select (arr!46983 a!2831) j!81)))))

(declare-fun res!961027 () Bool)

(assert (=> start!123102 (=> (not res!961027) (not e!806179))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123102 (= res!961027 (validMask!0 mask!2608))))

(assert (=> start!123102 e!806179))

(assert (=> start!123102 true))

(declare-fun array_inv!36264 (array!97338) Bool)

(assert (=> start!123102 (array_inv!36264 a!2831)))

(assert (= (and start!123102 res!961027) b!1426480))

(assert (= (and b!1426480 res!961028) b!1426481))

(assert (= (and b!1426481 res!961024) b!1426476))

(assert (= (and b!1426476 res!961026) b!1426482))

(assert (= (and b!1426482 res!961029) b!1426478))

(assert (= (and b!1426478 res!961025) b!1426479))

(assert (= (and b!1426479 res!961030) b!1426477))

(declare-fun m!1317151 () Bool)

(assert (=> b!1426478 m!1317151))

(declare-fun m!1317153 () Bool)

(assert (=> b!1426477 m!1317153))

(assert (=> b!1426477 m!1317153))

(declare-fun m!1317155 () Bool)

(assert (=> b!1426477 m!1317155))

(assert (=> b!1426477 m!1317155))

(assert (=> b!1426477 m!1317153))

(declare-fun m!1317157 () Bool)

(assert (=> b!1426477 m!1317157))

(assert (=> b!1426476 m!1317153))

(assert (=> b!1426476 m!1317153))

(declare-fun m!1317159 () Bool)

(assert (=> b!1426476 m!1317159))

(declare-fun m!1317161 () Bool)

(assert (=> b!1426482 m!1317161))

(declare-fun m!1317163 () Bool)

(assert (=> b!1426481 m!1317163))

(assert (=> b!1426481 m!1317163))

(declare-fun m!1317165 () Bool)

(assert (=> b!1426481 m!1317165))

(declare-fun m!1317167 () Bool)

(assert (=> start!123102 m!1317167))

(declare-fun m!1317169 () Bool)

(assert (=> start!123102 m!1317169))

(push 1)

(assert (not b!1426482))

(assert (not b!1426481))

(assert (not b!1426478))

(assert (not b!1426477))

(assert (not start!123102))

(assert (not b!1426476))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

