; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123142 () Bool)

(assert start!123142)

(declare-fun b!1426951 () Bool)

(declare-fun res!961500 () Bool)

(declare-fun e!806300 () Bool)

(assert (=> b!1426951 (=> (not res!961500) (not e!806300))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97378 0))(
  ( (array!97379 (arr!47003 (Array (_ BitVec 32) (_ BitVec 64))) (size!47554 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97378)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1426951 (= res!961500 (and (= (size!47554 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47554 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47554 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1426952 () Bool)

(declare-fun res!961507 () Bool)

(assert (=> b!1426952 (=> (not res!961507) (not e!806300))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11184 0))(
  ( (MissingZero!11184 (index!47128 (_ BitVec 32))) (Found!11184 (index!47129 (_ BitVec 32))) (Intermediate!11184 (undefined!11996 Bool) (index!47130 (_ BitVec 32)) (x!128923 (_ BitVec 32))) (Undefined!11184) (MissingVacant!11184 (index!47131 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97378 (_ BitVec 32)) SeekEntryResult!11184)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1426952 (= res!961507 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47003 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (select (store (arr!47003 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (array!97379 (store (arr!47003 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47554 a!2831)) mask!2608) (Intermediate!11184 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(declare-fun b!1426953 () Bool)

(declare-fun res!961502 () Bool)

(assert (=> b!1426953 (=> (not res!961502) (not e!806300))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1426953 (= res!961502 (validKeyInArray!0 (select (arr!47003 a!2831) i!982)))))

(declare-fun b!1426954 () Bool)

(declare-fun res!961505 () Bool)

(assert (=> b!1426954 (=> (not res!961505) (not e!806300))))

(declare-datatypes ((List!33500 0))(
  ( (Nil!33497) (Cons!33496 (h!34809 (_ BitVec 64)) (t!48186 List!33500)) )
))
(declare-fun arrayNoDuplicates!0 (array!97378 (_ BitVec 32) List!33500) Bool)

(assert (=> b!1426954 (= res!961505 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33497))))

(declare-fun res!961501 () Bool)

(assert (=> start!123142 (=> (not res!961501) (not e!806300))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123142 (= res!961501 (validMask!0 mask!2608))))

(assert (=> start!123142 e!806300))

(assert (=> start!123142 true))

(declare-fun array_inv!36284 (array!97378) Bool)

(assert (=> start!123142 (array_inv!36284 a!2831)))

(declare-fun b!1426955 () Bool)

(assert (=> b!1426955 (= e!806300 false)))

(declare-fun lt!628352 () SeekEntryResult!11184)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1426955 (= lt!628352 (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47003 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1426956 () Bool)

(declare-fun res!961506 () Bool)

(assert (=> b!1426956 (=> (not res!961506) (not e!806300))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1426956 (= res!961506 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47554 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47554 a!2831))))))

(declare-fun b!1426957 () Bool)

(declare-fun res!961504 () Bool)

(assert (=> b!1426957 (=> (not res!961504) (not e!806300))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97378 (_ BitVec 32)) Bool)

(assert (=> b!1426957 (= res!961504 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1426958 () Bool)

(declare-fun res!961503 () Bool)

(assert (=> b!1426958 (=> (not res!961503) (not e!806300))))

(assert (=> b!1426958 (= res!961503 (validKeyInArray!0 (select (arr!47003 a!2831) j!81)))))

(declare-fun b!1426959 () Bool)

(declare-fun res!961499 () Bool)

(assert (=> b!1426959 (=> (not res!961499) (not e!806300))))

(assert (=> b!1426959 (= res!961499 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47003 a!2831) j!81) mask!2608) (select (arr!47003 a!2831) j!81) a!2831 mask!2608) (Intermediate!11184 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(assert (= (and start!123142 res!961501) b!1426951))

(assert (= (and b!1426951 res!961500) b!1426953))

(assert (= (and b!1426953 res!961502) b!1426958))

(assert (= (and b!1426958 res!961503) b!1426957))

(assert (= (and b!1426957 res!961504) b!1426954))

(assert (= (and b!1426954 res!961505) b!1426956))

(assert (= (and b!1426956 res!961506) b!1426959))

(assert (= (and b!1426959 res!961499) b!1426952))

(assert (= (and b!1426952 res!961507) b!1426955))

(declare-fun m!1317651 () Bool)

(assert (=> b!1426954 m!1317651))

(declare-fun m!1317653 () Bool)

(assert (=> b!1426953 m!1317653))

(assert (=> b!1426953 m!1317653))

(declare-fun m!1317655 () Bool)

(assert (=> b!1426953 m!1317655))

(declare-fun m!1317657 () Bool)

(assert (=> b!1426952 m!1317657))

(declare-fun m!1317659 () Bool)

(assert (=> b!1426952 m!1317659))

(assert (=> b!1426952 m!1317659))

(declare-fun m!1317661 () Bool)

(assert (=> b!1426952 m!1317661))

(assert (=> b!1426952 m!1317661))

(assert (=> b!1426952 m!1317659))

(declare-fun m!1317663 () Bool)

(assert (=> b!1426952 m!1317663))

(declare-fun m!1317665 () Bool)

(assert (=> b!1426955 m!1317665))

(assert (=> b!1426955 m!1317665))

(declare-fun m!1317667 () Bool)

(assert (=> b!1426955 m!1317667))

(assert (=> b!1426958 m!1317665))

(assert (=> b!1426958 m!1317665))

(declare-fun m!1317669 () Bool)

(assert (=> b!1426958 m!1317669))

(assert (=> b!1426959 m!1317665))

(assert (=> b!1426959 m!1317665))

(declare-fun m!1317671 () Bool)

(assert (=> b!1426959 m!1317671))

(assert (=> b!1426959 m!1317671))

(assert (=> b!1426959 m!1317665))

(declare-fun m!1317673 () Bool)

(assert (=> b!1426959 m!1317673))

(declare-fun m!1317675 () Bool)

(assert (=> b!1426957 m!1317675))

(declare-fun m!1317677 () Bool)

(assert (=> start!123142 m!1317677))

(declare-fun m!1317679 () Bool)

(assert (=> start!123142 m!1317679))

(push 1)

(assert (not b!1426955))

(assert (not b!1426954))

(assert (not b!1426952))

(assert (not b!1426953))

(assert (not b!1426959))

(assert (not start!123142))

(assert (not b!1426958))

(assert (not b!1426957))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

