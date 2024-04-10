; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124428 () Bool)

(assert start!124428)

(declare-fun b!1439572 () Bool)

(declare-fun res!972001 () Bool)

(declare-fun e!811914 () Bool)

(assert (=> b!1439572 (=> (not res!972001) (not e!811914))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11478 0))(
  ( (MissingZero!11478 (index!48304 (_ BitVec 32))) (Found!11478 (index!48305 (_ BitVec 32))) (Intermediate!11478 (undefined!12290 Bool) (index!48306 (_ BitVec 32)) (x!130039 (_ BitVec 32))) (Undefined!11478) (MissingVacant!11478 (index!48307 (_ BitVec 32))) )
))
(declare-fun lt!632834 () SeekEntryResult!11478)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!97876 0))(
  ( (array!97877 (arr!47226 (Array (_ BitVec 32) (_ BitVec 64))) (size!47776 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97876)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97876 (_ BitVec 32)) SeekEntryResult!11478)

(assert (=> b!1439572 (= res!972001 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47226 a!2862) j!93) a!2862 mask!2687) lt!632834))))

(declare-fun res!972003 () Bool)

(declare-fun e!811916 () Bool)

(assert (=> start!124428 (=> (not res!972003) (not e!811916))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124428 (= res!972003 (validMask!0 mask!2687))))

(assert (=> start!124428 e!811916))

(assert (=> start!124428 true))

(declare-fun array_inv!36254 (array!97876) Bool)

(assert (=> start!124428 (array_inv!36254 a!2862)))

(declare-fun b!1439573 () Bool)

(declare-fun res!972007 () Bool)

(assert (=> b!1439573 (=> (not res!972007) (not e!811916))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1439573 (= res!972007 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47776 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47776 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47776 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47226 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1439574 () Bool)

(declare-fun res!971999 () Bool)

(assert (=> b!1439574 (=> (not res!971999) (not e!811916))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97876 (_ BitVec 32)) Bool)

(assert (=> b!1439574 (= res!971999 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1439575 () Bool)

(declare-fun res!972000 () Bool)

(assert (=> b!1439575 (=> (not res!972000) (not e!811916))))

(declare-datatypes ((List!33727 0))(
  ( (Nil!33724) (Cons!33723 (h!35073 (_ BitVec 64)) (t!48421 List!33727)) )
))
(declare-fun arrayNoDuplicates!0 (array!97876 (_ BitVec 32) List!33727) Bool)

(assert (=> b!1439575 (= res!972000 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33724))))

(declare-fun b!1439576 () Bool)

(assert (=> b!1439576 (= e!811914 false)))

(declare-fun lt!632835 () SeekEntryResult!11478)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1439576 (= lt!632835 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47226 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47226 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97877 (store (arr!47226 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47776 a!2862)) mask!2687))))

(declare-fun b!1439577 () Bool)

(declare-fun res!972002 () Bool)

(assert (=> b!1439577 (=> (not res!972002) (not e!811916))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1439577 (= res!972002 (validKeyInArray!0 (select (arr!47226 a!2862) i!1006)))))

(declare-fun b!1439578 () Bool)

(declare-fun res!972005 () Bool)

(assert (=> b!1439578 (=> (not res!972005) (not e!811916))))

(assert (=> b!1439578 (= res!972005 (and (= (size!47776 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47776 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47776 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1439579 () Bool)

(declare-fun res!972004 () Bool)

(assert (=> b!1439579 (=> (not res!972004) (not e!811916))))

(assert (=> b!1439579 (= res!972004 (validKeyInArray!0 (select (arr!47226 a!2862) j!93)))))

(declare-fun b!1439580 () Bool)

(assert (=> b!1439580 (= e!811916 e!811914)))

(declare-fun res!972006 () Bool)

(assert (=> b!1439580 (=> (not res!972006) (not e!811914))))

(assert (=> b!1439580 (= res!972006 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47226 a!2862) j!93) mask!2687) (select (arr!47226 a!2862) j!93) a!2862 mask!2687) lt!632834))))

(assert (=> b!1439580 (= lt!632834 (Intermediate!11478 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(assert (= (and start!124428 res!972003) b!1439578))

(assert (= (and b!1439578 res!972005) b!1439577))

(assert (= (and b!1439577 res!972002) b!1439579))

(assert (= (and b!1439579 res!972004) b!1439574))

(assert (= (and b!1439574 res!971999) b!1439575))

(assert (= (and b!1439575 res!972000) b!1439573))

(assert (= (and b!1439573 res!972007) b!1439580))

(assert (= (and b!1439580 res!972006) b!1439572))

(assert (= (and b!1439572 res!972001) b!1439576))

(declare-fun m!1328661 () Bool)

(assert (=> b!1439574 m!1328661))

(declare-fun m!1328663 () Bool)

(assert (=> start!124428 m!1328663))

(declare-fun m!1328665 () Bool)

(assert (=> start!124428 m!1328665))

(declare-fun m!1328667 () Bool)

(assert (=> b!1439580 m!1328667))

(assert (=> b!1439580 m!1328667))

(declare-fun m!1328669 () Bool)

(assert (=> b!1439580 m!1328669))

(assert (=> b!1439580 m!1328669))

(assert (=> b!1439580 m!1328667))

(declare-fun m!1328671 () Bool)

(assert (=> b!1439580 m!1328671))

(assert (=> b!1439572 m!1328667))

(assert (=> b!1439572 m!1328667))

(declare-fun m!1328673 () Bool)

(assert (=> b!1439572 m!1328673))

(declare-fun m!1328675 () Bool)

(assert (=> b!1439575 m!1328675))

(declare-fun m!1328677 () Bool)

(assert (=> b!1439577 m!1328677))

(assert (=> b!1439577 m!1328677))

(declare-fun m!1328679 () Bool)

(assert (=> b!1439577 m!1328679))

(declare-fun m!1328681 () Bool)

(assert (=> b!1439576 m!1328681))

(declare-fun m!1328683 () Bool)

(assert (=> b!1439576 m!1328683))

(assert (=> b!1439576 m!1328683))

(declare-fun m!1328685 () Bool)

(assert (=> b!1439576 m!1328685))

(assert (=> b!1439576 m!1328685))

(assert (=> b!1439576 m!1328683))

(declare-fun m!1328687 () Bool)

(assert (=> b!1439576 m!1328687))

(assert (=> b!1439573 m!1328681))

(declare-fun m!1328689 () Bool)

(assert (=> b!1439573 m!1328689))

(assert (=> b!1439579 m!1328667))

(assert (=> b!1439579 m!1328667))

(declare-fun m!1328691 () Bool)

(assert (=> b!1439579 m!1328691))

(check-sat (not b!1439580) (not b!1439579) (not b!1439572) (not b!1439577) (not b!1439575) (not b!1439576) (not start!124428) (not b!1439574))
(check-sat)
