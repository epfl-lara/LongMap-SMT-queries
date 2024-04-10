; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124496 () Bool)

(assert start!124496)

(declare-fun b!1440560 () Bool)

(declare-fun res!972995 () Bool)

(declare-fun e!812221 () Bool)

(assert (=> b!1440560 (=> (not res!972995) (not e!812221))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!97944 0))(
  ( (array!97945 (arr!47260 (Array (_ BitVec 32) (_ BitVec 64))) (size!47810 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97944)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1440560 (= res!972995 (and (= (size!47810 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47810 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47810 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1440561 () Bool)

(declare-fun res!972994 () Bool)

(assert (=> b!1440561 (=> (not res!972994) (not e!812221))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1440561 (= res!972994 (validKeyInArray!0 (select (arr!47260 a!2862) i!1006)))))

(declare-fun b!1440562 () Bool)

(declare-fun res!972997 () Bool)

(assert (=> b!1440562 (=> (not res!972997) (not e!812221))))

(declare-datatypes ((List!33761 0))(
  ( (Nil!33758) (Cons!33757 (h!35107 (_ BitVec 64)) (t!48455 List!33761)) )
))
(declare-fun arrayNoDuplicates!0 (array!97944 (_ BitVec 32) List!33761) Bool)

(assert (=> b!1440562 (= res!972997 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33758))))

(declare-fun b!1440563 () Bool)

(declare-fun res!972988 () Bool)

(assert (=> b!1440563 (=> (not res!972988) (not e!812221))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1440563 (= res!972988 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47810 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47810 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47810 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47260 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1440564 () Bool)

(declare-fun res!972991 () Bool)

(assert (=> b!1440564 (=> (not res!972991) (not e!812221))))

(assert (=> b!1440564 (= res!972991 (validKeyInArray!0 (select (arr!47260 a!2862) j!93)))))

(declare-fun res!972989 () Bool)

(assert (=> start!124496 (=> (not res!972989) (not e!812221))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124496 (= res!972989 (validMask!0 mask!2687))))

(assert (=> start!124496 e!812221))

(assert (=> start!124496 true))

(declare-fun array_inv!36288 (array!97944) Bool)

(assert (=> start!124496 (array_inv!36288 a!2862)))

(declare-fun b!1440565 () Bool)

(declare-fun res!972992 () Bool)

(declare-fun e!812220 () Bool)

(assert (=> b!1440565 (=> (not res!972992) (not e!812220))))

(declare-datatypes ((SeekEntryResult!11512 0))(
  ( (MissingZero!11512 (index!48440 (_ BitVec 32))) (Found!11512 (index!48441 (_ BitVec 32))) (Intermediate!11512 (undefined!12324 Bool) (index!48442 (_ BitVec 32)) (x!130161 (_ BitVec 32))) (Undefined!11512) (MissingVacant!11512 (index!48443 (_ BitVec 32))) )
))
(declare-fun lt!632985 () SeekEntryResult!11512)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97944 (_ BitVec 32)) SeekEntryResult!11512)

(assert (=> b!1440565 (= res!972992 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47260 a!2862) j!93) a!2862 mask!2687) lt!632985))))

(declare-fun b!1440566 () Bool)

(declare-fun res!972996 () Bool)

(assert (=> b!1440566 (=> (not res!972996) (not e!812220))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1440566 (= res!972996 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47260 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47260 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97945 (store (arr!47260 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47810 a!2862)) mask!2687) (Intermediate!11512 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun b!1440567 () Bool)

(assert (=> b!1440567 (= e!812221 e!812220)))

(declare-fun res!972990 () Bool)

(assert (=> b!1440567 (=> (not res!972990) (not e!812220))))

(assert (=> b!1440567 (= res!972990 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47260 a!2862) j!93) mask!2687) (select (arr!47260 a!2862) j!93) a!2862 mask!2687) lt!632985))))

(assert (=> b!1440567 (= lt!632985 (Intermediate!11512 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1440568 () Bool)

(declare-fun res!972987 () Bool)

(assert (=> b!1440568 (=> (not res!972987) (not e!812220))))

(assert (=> b!1440568 (= res!972987 (and (bvsgt x!665 intermediateAfterX!19) (bvsge mask!2687 #b00000000000000000000000000000000) (bvslt index!646 (bvadd #b00000000000000000000000000000001 mask!2687)) (bvslt intermediateAfterIndex!19 (bvadd #b00000000000000000000000000000001 mask!2687))))))

(declare-fun b!1440569 () Bool)

(assert (=> b!1440569 (= e!812220 (not (validKeyInArray!0 (select (store (arr!47260 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))))

(declare-fun b!1440570 () Bool)

(declare-fun res!972993 () Bool)

(assert (=> b!1440570 (=> (not res!972993) (not e!812221))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97944 (_ BitVec 32)) Bool)

(assert (=> b!1440570 (= res!972993 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!124496 res!972989) b!1440560))

(assert (= (and b!1440560 res!972995) b!1440561))

(assert (= (and b!1440561 res!972994) b!1440564))

(assert (= (and b!1440564 res!972991) b!1440570))

(assert (= (and b!1440570 res!972993) b!1440562))

(assert (= (and b!1440562 res!972997) b!1440563))

(assert (= (and b!1440563 res!972988) b!1440567))

(assert (= (and b!1440567 res!972990) b!1440565))

(assert (= (and b!1440565 res!972992) b!1440566))

(assert (= (and b!1440566 res!972996) b!1440568))

(assert (= (and b!1440568 res!972987) b!1440569))

(declare-fun m!1329759 () Bool)

(assert (=> b!1440569 m!1329759))

(declare-fun m!1329761 () Bool)

(assert (=> b!1440569 m!1329761))

(assert (=> b!1440569 m!1329761))

(declare-fun m!1329763 () Bool)

(assert (=> b!1440569 m!1329763))

(declare-fun m!1329765 () Bool)

(assert (=> b!1440565 m!1329765))

(assert (=> b!1440565 m!1329765))

(declare-fun m!1329767 () Bool)

(assert (=> b!1440565 m!1329767))

(assert (=> b!1440566 m!1329759))

(assert (=> b!1440566 m!1329761))

(assert (=> b!1440566 m!1329761))

(declare-fun m!1329769 () Bool)

(assert (=> b!1440566 m!1329769))

(assert (=> b!1440566 m!1329769))

(assert (=> b!1440566 m!1329761))

(declare-fun m!1329771 () Bool)

(assert (=> b!1440566 m!1329771))

(assert (=> b!1440564 m!1329765))

(assert (=> b!1440564 m!1329765))

(declare-fun m!1329773 () Bool)

(assert (=> b!1440564 m!1329773))

(declare-fun m!1329775 () Bool)

(assert (=> start!124496 m!1329775))

(declare-fun m!1329777 () Bool)

(assert (=> start!124496 m!1329777))

(assert (=> b!1440567 m!1329765))

(assert (=> b!1440567 m!1329765))

(declare-fun m!1329779 () Bool)

(assert (=> b!1440567 m!1329779))

(assert (=> b!1440567 m!1329779))

(assert (=> b!1440567 m!1329765))

(declare-fun m!1329781 () Bool)

(assert (=> b!1440567 m!1329781))

(declare-fun m!1329783 () Bool)

(assert (=> b!1440570 m!1329783))

(assert (=> b!1440563 m!1329759))

(declare-fun m!1329785 () Bool)

(assert (=> b!1440563 m!1329785))

(declare-fun m!1329787 () Bool)

(assert (=> b!1440561 m!1329787))

(assert (=> b!1440561 m!1329787))

(declare-fun m!1329789 () Bool)

(assert (=> b!1440561 m!1329789))

(declare-fun m!1329791 () Bool)

(assert (=> b!1440562 m!1329791))

(push 1)

(assert (not b!1440561))

(assert (not b!1440566))

(assert (not b!1440569))

(assert (not b!1440562))

(assert (not start!124496))

(assert (not b!1440564))

(assert (not b!1440570))

(assert (not b!1440565))

(assert (not b!1440567))

(check-sat)

