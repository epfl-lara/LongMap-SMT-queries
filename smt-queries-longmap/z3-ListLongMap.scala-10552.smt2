; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124452 () Bool)

(assert start!124452)

(declare-fun res!972354 () Bool)

(declare-fun e!812023 () Bool)

(assert (=> start!124452 (=> (not res!972354) (not e!812023))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124452 (= res!972354 (validMask!0 mask!2687))))

(assert (=> start!124452 e!812023))

(assert (=> start!124452 true))

(declare-datatypes ((array!97900 0))(
  ( (array!97901 (arr!47238 (Array (_ BitVec 32) (_ BitVec 64))) (size!47788 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97900)

(declare-fun array_inv!36266 (array!97900) Bool)

(assert (=> start!124452 (array_inv!36266 a!2862)))

(declare-fun b!1439923 () Bool)

(declare-fun e!812024 () Bool)

(assert (=> b!1439923 (= e!812023 e!812024)))

(declare-fun res!972352 () Bool)

(assert (=> b!1439923 (=> (not res!972352) (not e!812024))))

(declare-datatypes ((SeekEntryResult!11490 0))(
  ( (MissingZero!11490 (index!48352 (_ BitVec 32))) (Found!11490 (index!48353 (_ BitVec 32))) (Intermediate!11490 (undefined!12302 Bool) (index!48354 (_ BitVec 32)) (x!130083 (_ BitVec 32))) (Undefined!11490) (MissingVacant!11490 (index!48355 (_ BitVec 32))) )
))
(declare-fun lt!632888 () SeekEntryResult!11490)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97900 (_ BitVec 32)) SeekEntryResult!11490)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1439923 (= res!972352 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47238 a!2862) j!93) mask!2687) (select (arr!47238 a!2862) j!93) a!2862 mask!2687) lt!632888))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1439923 (= lt!632888 (Intermediate!11490 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1439924 () Bool)

(declare-fun res!972357 () Bool)

(assert (=> b!1439924 (=> (not res!972357) (not e!812023))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1439924 (= res!972357 (validKeyInArray!0 (select (arr!47238 a!2862) i!1006)))))

(declare-fun b!1439925 () Bool)

(declare-fun res!972356 () Bool)

(assert (=> b!1439925 (=> (not res!972356) (not e!812023))))

(assert (=> b!1439925 (= res!972356 (validKeyInArray!0 (select (arr!47238 a!2862) j!93)))))

(declare-fun b!1439926 () Bool)

(declare-fun res!972355 () Bool)

(assert (=> b!1439926 (=> (not res!972355) (not e!812023))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(assert (=> b!1439926 (= res!972355 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47788 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47788 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47788 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47238 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1439927 () Bool)

(assert (=> b!1439927 (= e!812024 false)))

(declare-fun lt!632889 () SeekEntryResult!11490)

(assert (=> b!1439927 (= lt!632889 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47238 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47238 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97901 (store (arr!47238 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47788 a!2862)) mask!2687))))

(declare-fun b!1439928 () Bool)

(declare-fun res!972358 () Bool)

(assert (=> b!1439928 (=> (not res!972358) (not e!812023))))

(declare-datatypes ((List!33739 0))(
  ( (Nil!33736) (Cons!33735 (h!35085 (_ BitVec 64)) (t!48433 List!33739)) )
))
(declare-fun arrayNoDuplicates!0 (array!97900 (_ BitVec 32) List!33739) Bool)

(assert (=> b!1439928 (= res!972358 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33736))))

(declare-fun b!1439929 () Bool)

(declare-fun res!972350 () Bool)

(assert (=> b!1439929 (=> (not res!972350) (not e!812023))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97900 (_ BitVec 32)) Bool)

(assert (=> b!1439929 (= res!972350 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1439930 () Bool)

(declare-fun res!972353 () Bool)

(assert (=> b!1439930 (=> (not res!972353) (not e!812023))))

(assert (=> b!1439930 (= res!972353 (and (= (size!47788 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47788 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47788 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1439931 () Bool)

(declare-fun res!972351 () Bool)

(assert (=> b!1439931 (=> (not res!972351) (not e!812024))))

(assert (=> b!1439931 (= res!972351 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47238 a!2862) j!93) a!2862 mask!2687) lt!632888))))

(assert (= (and start!124452 res!972354) b!1439930))

(assert (= (and b!1439930 res!972353) b!1439924))

(assert (= (and b!1439924 res!972357) b!1439925))

(assert (= (and b!1439925 res!972356) b!1439929))

(assert (= (and b!1439929 res!972350) b!1439928))

(assert (= (and b!1439928 res!972358) b!1439926))

(assert (= (and b!1439926 res!972355) b!1439923))

(assert (= (and b!1439923 res!972352) b!1439931))

(assert (= (and b!1439931 res!972351) b!1439927))

(declare-fun m!1329051 () Bool)

(assert (=> b!1439925 m!1329051))

(assert (=> b!1439925 m!1329051))

(declare-fun m!1329053 () Bool)

(assert (=> b!1439925 m!1329053))

(declare-fun m!1329055 () Bool)

(assert (=> b!1439927 m!1329055))

(declare-fun m!1329057 () Bool)

(assert (=> b!1439927 m!1329057))

(assert (=> b!1439927 m!1329057))

(declare-fun m!1329059 () Bool)

(assert (=> b!1439927 m!1329059))

(assert (=> b!1439927 m!1329059))

(assert (=> b!1439927 m!1329057))

(declare-fun m!1329061 () Bool)

(assert (=> b!1439927 m!1329061))

(assert (=> b!1439931 m!1329051))

(assert (=> b!1439931 m!1329051))

(declare-fun m!1329063 () Bool)

(assert (=> b!1439931 m!1329063))

(assert (=> b!1439926 m!1329055))

(declare-fun m!1329065 () Bool)

(assert (=> b!1439926 m!1329065))

(declare-fun m!1329067 () Bool)

(assert (=> b!1439929 m!1329067))

(declare-fun m!1329069 () Bool)

(assert (=> start!124452 m!1329069))

(declare-fun m!1329071 () Bool)

(assert (=> start!124452 m!1329071))

(declare-fun m!1329073 () Bool)

(assert (=> b!1439924 m!1329073))

(assert (=> b!1439924 m!1329073))

(declare-fun m!1329075 () Bool)

(assert (=> b!1439924 m!1329075))

(declare-fun m!1329077 () Bool)

(assert (=> b!1439928 m!1329077))

(assert (=> b!1439923 m!1329051))

(assert (=> b!1439923 m!1329051))

(declare-fun m!1329079 () Bool)

(assert (=> b!1439923 m!1329079))

(assert (=> b!1439923 m!1329079))

(assert (=> b!1439923 m!1329051))

(declare-fun m!1329081 () Bool)

(assert (=> b!1439923 m!1329081))

(check-sat (not b!1439928) (not start!124452) (not b!1439929) (not b!1439923) (not b!1439924) (not b!1439931) (not b!1439927) (not b!1439925))
