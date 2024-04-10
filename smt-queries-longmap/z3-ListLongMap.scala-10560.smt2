; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124500 () Bool)

(assert start!124500)

(declare-fun res!973048 () Bool)

(declare-fun e!812240 () Bool)

(assert (=> start!124500 (=> (not res!973048) (not e!812240))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124500 (= res!973048 (validMask!0 mask!2687))))

(assert (=> start!124500 e!812240))

(assert (=> start!124500 true))

(declare-datatypes ((array!97948 0))(
  ( (array!97949 (arr!47262 (Array (_ BitVec 32) (_ BitVec 64))) (size!47812 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97948)

(declare-fun array_inv!36290 (array!97948) Bool)

(assert (=> start!124500 (array_inv!36290 a!2862)))

(declare-fun b!1440616 () Bool)

(declare-fun res!973043 () Bool)

(declare-fun e!812238 () Bool)

(assert (=> b!1440616 (=> (not res!973043) (not e!812238))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11514 0))(
  ( (MissingZero!11514 (index!48448 (_ BitVec 32))) (Found!11514 (index!48449 (_ BitVec 32))) (Intermediate!11514 (undefined!12326 Bool) (index!48450 (_ BitVec 32)) (x!130171 (_ BitVec 32))) (Undefined!11514) (MissingVacant!11514 (index!48451 (_ BitVec 32))) )
))
(declare-fun lt!632996 () SeekEntryResult!11514)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97948 (_ BitVec 32)) SeekEntryResult!11514)

(assert (=> b!1440616 (= res!973043 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47262 a!2862) j!93) a!2862 mask!2687) lt!632996))))

(declare-fun b!1440617 () Bool)

(declare-fun res!973044 () Bool)

(assert (=> b!1440617 (=> (not res!973044) (not e!812240))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1440617 (= res!973044 (validKeyInArray!0 (select (arr!47262 a!2862) i!1006)))))

(declare-fun b!1440618 () Bool)

(declare-fun res!973051 () Bool)

(assert (=> b!1440618 (=> (not res!973051) (not e!812240))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97948 (_ BitVec 32)) Bool)

(assert (=> b!1440618 (= res!973051 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1440619 () Bool)

(assert (=> b!1440619 (= e!812238 false)))

(declare-fun lt!632997 () SeekEntryResult!11514)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1440619 (= lt!632997 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47262 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47262 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97949 (store (arr!47262 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47812 a!2862)) mask!2687))))

(declare-fun b!1440620 () Bool)

(declare-fun res!973047 () Bool)

(assert (=> b!1440620 (=> (not res!973047) (not e!812240))))

(assert (=> b!1440620 (= res!973047 (and (= (size!47812 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47812 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47812 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1440621 () Bool)

(declare-fun res!973050 () Bool)

(assert (=> b!1440621 (=> (not res!973050) (not e!812240))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1440621 (= res!973050 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47812 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47812 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47812 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47262 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1440622 () Bool)

(declare-fun res!973049 () Bool)

(assert (=> b!1440622 (=> (not res!973049) (not e!812240))))

(declare-datatypes ((List!33763 0))(
  ( (Nil!33760) (Cons!33759 (h!35109 (_ BitVec 64)) (t!48457 List!33763)) )
))
(declare-fun arrayNoDuplicates!0 (array!97948 (_ BitVec 32) List!33763) Bool)

(assert (=> b!1440622 (= res!973049 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33760))))

(declare-fun b!1440623 () Bool)

(declare-fun res!973046 () Bool)

(assert (=> b!1440623 (=> (not res!973046) (not e!812240))))

(assert (=> b!1440623 (= res!973046 (validKeyInArray!0 (select (arr!47262 a!2862) j!93)))))

(declare-fun b!1440624 () Bool)

(assert (=> b!1440624 (= e!812240 e!812238)))

(declare-fun res!973045 () Bool)

(assert (=> b!1440624 (=> (not res!973045) (not e!812238))))

(assert (=> b!1440624 (= res!973045 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47262 a!2862) j!93) mask!2687) (select (arr!47262 a!2862) j!93) a!2862 mask!2687) lt!632996))))

(assert (=> b!1440624 (= lt!632996 (Intermediate!11514 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(assert (= (and start!124500 res!973048) b!1440620))

(assert (= (and b!1440620 res!973047) b!1440617))

(assert (= (and b!1440617 res!973044) b!1440623))

(assert (= (and b!1440623 res!973046) b!1440618))

(assert (= (and b!1440618 res!973051) b!1440622))

(assert (= (and b!1440622 res!973049) b!1440621))

(assert (= (and b!1440621 res!973050) b!1440624))

(assert (= (and b!1440624 res!973045) b!1440616))

(assert (= (and b!1440616 res!973043) b!1440619))

(declare-fun m!1329825 () Bool)

(assert (=> b!1440624 m!1329825))

(assert (=> b!1440624 m!1329825))

(declare-fun m!1329827 () Bool)

(assert (=> b!1440624 m!1329827))

(assert (=> b!1440624 m!1329827))

(assert (=> b!1440624 m!1329825))

(declare-fun m!1329829 () Bool)

(assert (=> b!1440624 m!1329829))

(declare-fun m!1329831 () Bool)

(assert (=> b!1440618 m!1329831))

(declare-fun m!1329833 () Bool)

(assert (=> b!1440617 m!1329833))

(assert (=> b!1440617 m!1329833))

(declare-fun m!1329835 () Bool)

(assert (=> b!1440617 m!1329835))

(assert (=> b!1440616 m!1329825))

(assert (=> b!1440616 m!1329825))

(declare-fun m!1329837 () Bool)

(assert (=> b!1440616 m!1329837))

(declare-fun m!1329839 () Bool)

(assert (=> b!1440619 m!1329839))

(declare-fun m!1329841 () Bool)

(assert (=> b!1440619 m!1329841))

(assert (=> b!1440619 m!1329841))

(declare-fun m!1329843 () Bool)

(assert (=> b!1440619 m!1329843))

(assert (=> b!1440619 m!1329843))

(assert (=> b!1440619 m!1329841))

(declare-fun m!1329845 () Bool)

(assert (=> b!1440619 m!1329845))

(declare-fun m!1329847 () Bool)

(assert (=> b!1440622 m!1329847))

(assert (=> b!1440623 m!1329825))

(assert (=> b!1440623 m!1329825))

(declare-fun m!1329849 () Bool)

(assert (=> b!1440623 m!1329849))

(declare-fun m!1329851 () Bool)

(assert (=> start!124500 m!1329851))

(declare-fun m!1329853 () Bool)

(assert (=> start!124500 m!1329853))

(assert (=> b!1440621 m!1329839))

(declare-fun m!1329855 () Bool)

(assert (=> b!1440621 m!1329855))

(check-sat (not b!1440619) (not b!1440624) (not start!124500) (not b!1440622) (not b!1440623) (not b!1440616) (not b!1440617) (not b!1440618))
(check-sat)
