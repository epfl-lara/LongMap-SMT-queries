; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125546 () Bool)

(assert start!125546)

(declare-fun b!1468885 () Bool)

(declare-fun res!997429 () Bool)

(declare-fun e!824732 () Bool)

(assert (=> b!1468885 (=> (not res!997429) (not e!824732))))

(declare-datatypes ((array!98994 0))(
  ( (array!98995 (arr!47785 (Array (_ BitVec 32) (_ BitVec 64))) (size!48335 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98994)

(declare-datatypes ((List!34286 0))(
  ( (Nil!34283) (Cons!34282 (h!35632 (_ BitVec 64)) (t!48980 List!34286)) )
))
(declare-fun arrayNoDuplicates!0 (array!98994 (_ BitVec 32) List!34286) Bool)

(assert (=> b!1468885 (= res!997429 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34283))))

(declare-fun b!1468886 () Bool)

(declare-fun e!824730 () Bool)

(assert (=> b!1468886 (= e!824732 e!824730)))

(declare-fun res!997424 () Bool)

(assert (=> b!1468886 (=> (not res!997424) (not e!824730))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12025 0))(
  ( (MissingZero!12025 (index!50492 (_ BitVec 32))) (Found!12025 (index!50493 (_ BitVec 32))) (Intermediate!12025 (undefined!12837 Bool) (index!50494 (_ BitVec 32)) (x!132074 (_ BitVec 32))) (Undefined!12025) (MissingVacant!12025 (index!50495 (_ BitVec 32))) )
))
(declare-fun lt!642389 () SeekEntryResult!12025)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98994 (_ BitVec 32)) SeekEntryResult!12025)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1468886 (= res!997424 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47785 a!2862) j!93) mask!2687) (select (arr!47785 a!2862) j!93) a!2862 mask!2687) lt!642389))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1468886 (= lt!642389 (Intermediate!12025 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1468887 () Bool)

(declare-fun res!997426 () Bool)

(assert (=> b!1468887 (=> (not res!997426) (not e!824730))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1468887 (= res!997426 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47785 a!2862) j!93) a!2862 mask!2687) lt!642389))))

(declare-fun b!1468888 () Bool)

(declare-fun res!997432 () Bool)

(assert (=> b!1468888 (=> (not res!997432) (not e!824732))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1468888 (= res!997432 (and (= (size!48335 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48335 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48335 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!997425 () Bool)

(assert (=> start!125546 (=> (not res!997425) (not e!824732))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125546 (= res!997425 (validMask!0 mask!2687))))

(assert (=> start!125546 e!824732))

(assert (=> start!125546 true))

(declare-fun array_inv!36813 (array!98994) Bool)

(assert (=> start!125546 (array_inv!36813 a!2862)))

(declare-fun b!1468889 () Bool)

(declare-fun res!997427 () Bool)

(assert (=> b!1468889 (=> (not res!997427) (not e!824732))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1468889 (= res!997427 (validKeyInArray!0 (select (arr!47785 a!2862) j!93)))))

(declare-fun b!1468890 () Bool)

(assert (=> b!1468890 (= e!824730 false)))

(declare-fun lt!642390 () SeekEntryResult!12025)

(assert (=> b!1468890 (= lt!642390 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47785 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47785 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!98995 (store (arr!47785 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48335 a!2862)) mask!2687))))

(declare-fun b!1468891 () Bool)

(declare-fun res!997428 () Bool)

(assert (=> b!1468891 (=> (not res!997428) (not e!824732))))

(assert (=> b!1468891 (= res!997428 (validKeyInArray!0 (select (arr!47785 a!2862) i!1006)))))

(declare-fun b!1468892 () Bool)

(declare-fun res!997431 () Bool)

(assert (=> b!1468892 (=> (not res!997431) (not e!824732))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98994 (_ BitVec 32)) Bool)

(assert (=> b!1468892 (= res!997431 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1468893 () Bool)

(declare-fun res!997430 () Bool)

(assert (=> b!1468893 (=> (not res!997430) (not e!824732))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1468893 (= res!997430 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48335 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48335 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48335 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47785 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!125546 res!997425) b!1468888))

(assert (= (and b!1468888 res!997432) b!1468891))

(assert (= (and b!1468891 res!997428) b!1468889))

(assert (= (and b!1468889 res!997427) b!1468892))

(assert (= (and b!1468892 res!997431) b!1468885))

(assert (= (and b!1468885 res!997429) b!1468893))

(assert (= (and b!1468893 res!997430) b!1468886))

(assert (= (and b!1468886 res!997424) b!1468887))

(assert (= (and b!1468887 res!997426) b!1468890))

(declare-fun m!1356029 () Bool)

(assert (=> b!1468889 m!1356029))

(assert (=> b!1468889 m!1356029))

(declare-fun m!1356031 () Bool)

(assert (=> b!1468889 m!1356031))

(declare-fun m!1356033 () Bool)

(assert (=> b!1468885 m!1356033))

(declare-fun m!1356035 () Bool)

(assert (=> start!125546 m!1356035))

(declare-fun m!1356037 () Bool)

(assert (=> start!125546 m!1356037))

(declare-fun m!1356039 () Bool)

(assert (=> b!1468890 m!1356039))

(declare-fun m!1356041 () Bool)

(assert (=> b!1468890 m!1356041))

(assert (=> b!1468890 m!1356041))

(declare-fun m!1356043 () Bool)

(assert (=> b!1468890 m!1356043))

(assert (=> b!1468890 m!1356043))

(assert (=> b!1468890 m!1356041))

(declare-fun m!1356045 () Bool)

(assert (=> b!1468890 m!1356045))

(assert (=> b!1468893 m!1356039))

(declare-fun m!1356047 () Bool)

(assert (=> b!1468893 m!1356047))

(declare-fun m!1356049 () Bool)

(assert (=> b!1468891 m!1356049))

(assert (=> b!1468891 m!1356049))

(declare-fun m!1356051 () Bool)

(assert (=> b!1468891 m!1356051))

(assert (=> b!1468886 m!1356029))

(assert (=> b!1468886 m!1356029))

(declare-fun m!1356053 () Bool)

(assert (=> b!1468886 m!1356053))

(assert (=> b!1468886 m!1356053))

(assert (=> b!1468886 m!1356029))

(declare-fun m!1356055 () Bool)

(assert (=> b!1468886 m!1356055))

(assert (=> b!1468887 m!1356029))

(assert (=> b!1468887 m!1356029))

(declare-fun m!1356057 () Bool)

(assert (=> b!1468887 m!1356057))

(declare-fun m!1356059 () Bool)

(assert (=> b!1468892 m!1356059))

(push 1)

(assert (not b!1468889))

(assert (not b!1468886))

(assert (not b!1468891))

(assert (not start!125546))

(assert (not b!1468887))

(assert (not b!1468892))

(assert (not b!1468885))

(assert (not b!1468890))

