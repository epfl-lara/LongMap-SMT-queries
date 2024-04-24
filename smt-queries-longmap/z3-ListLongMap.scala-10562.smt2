; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124728 () Bool)

(assert start!124728)

(declare-fun b!1442087 () Bool)

(declare-fun res!973694 () Bool)

(declare-fun e!813121 () Bool)

(assert (=> b!1442087 (=> (not res!973694) (not e!813121))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98071 0))(
  ( (array!98072 (arr!47320 (Array (_ BitVec 32) (_ BitVec 64))) (size!47871 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98071)

(assert (=> b!1442087 (= res!973694 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47871 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47871 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47871 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47320 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1442088 () Bool)

(declare-fun res!973697 () Bool)

(assert (=> b!1442088 (=> (not res!973697) (not e!813121))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1442088 (= res!973697 (validKeyInArray!0 (select (arr!47320 a!2862) i!1006)))))

(declare-fun b!1442089 () Bool)

(declare-fun res!973691 () Bool)

(assert (=> b!1442089 (=> (not res!973691) (not e!813121))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98071 (_ BitVec 32)) Bool)

(assert (=> b!1442089 (= res!973691 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1442090 () Bool)

(declare-fun res!973693 () Bool)

(assert (=> b!1442090 (=> (not res!973693) (not e!813121))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1442090 (= res!973693 (validKeyInArray!0 (select (arr!47320 a!2862) j!93)))))

(declare-fun b!1442091 () Bool)

(declare-fun res!973696 () Bool)

(assert (=> b!1442091 (=> (not res!973696) (not e!813121))))

(declare-datatypes ((List!33808 0))(
  ( (Nil!33805) (Cons!33804 (h!35165 (_ BitVec 64)) (t!48494 List!33808)) )
))
(declare-fun arrayNoDuplicates!0 (array!98071 (_ BitVec 32) List!33808) Bool)

(assert (=> b!1442091 (= res!973696 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33805))))

(declare-fun b!1442092 () Bool)

(declare-fun e!813123 () Bool)

(assert (=> b!1442092 (= e!813123 false)))

(declare-datatypes ((SeekEntryResult!11469 0))(
  ( (MissingZero!11469 (index!48268 (_ BitVec 32))) (Found!11469 (index!48269 (_ BitVec 32))) (Intermediate!11469 (undefined!12281 Bool) (index!48270 (_ BitVec 32)) (x!130166 (_ BitVec 32))) (Undefined!11469) (MissingVacant!11469 (index!48271 (_ BitVec 32))) )
))
(declare-fun lt!633495 () SeekEntryResult!11469)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98071 (_ BitVec 32)) SeekEntryResult!11469)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1442092 (= lt!633495 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47320 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47320 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!98072 (store (arr!47320 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47871 a!2862)) mask!2687))))

(declare-fun b!1442093 () Bool)

(assert (=> b!1442093 (= e!813121 e!813123)))

(declare-fun res!973689 () Bool)

(assert (=> b!1442093 (=> (not res!973689) (not e!813123))))

(declare-fun lt!633496 () SeekEntryResult!11469)

(assert (=> b!1442093 (= res!973689 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47320 a!2862) j!93) mask!2687) (select (arr!47320 a!2862) j!93) a!2862 mask!2687) lt!633496))))

(assert (=> b!1442093 (= lt!633496 (Intermediate!11469 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1442094 () Bool)

(declare-fun res!973695 () Bool)

(assert (=> b!1442094 (=> (not res!973695) (not e!813123))))

(assert (=> b!1442094 (= res!973695 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47320 a!2862) j!93) a!2862 mask!2687) lt!633496))))

(declare-fun b!1442095 () Bool)

(declare-fun res!973692 () Bool)

(assert (=> b!1442095 (=> (not res!973692) (not e!813121))))

(assert (=> b!1442095 (= res!973692 (and (= (size!47871 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47871 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47871 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!973690 () Bool)

(assert (=> start!124728 (=> (not res!973690) (not e!813121))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124728 (= res!973690 (validMask!0 mask!2687))))

(assert (=> start!124728 e!813121))

(assert (=> start!124728 true))

(declare-fun array_inv!36601 (array!98071) Bool)

(assert (=> start!124728 (array_inv!36601 a!2862)))

(assert (= (and start!124728 res!973690) b!1442095))

(assert (= (and b!1442095 res!973692) b!1442088))

(assert (= (and b!1442088 res!973697) b!1442090))

(assert (= (and b!1442090 res!973693) b!1442089))

(assert (= (and b!1442089 res!973691) b!1442091))

(assert (= (and b!1442091 res!973696) b!1442087))

(assert (= (and b!1442087 res!973694) b!1442093))

(assert (= (and b!1442093 res!973689) b!1442094))

(assert (= (and b!1442094 res!973695) b!1442092))

(declare-fun m!1331425 () Bool)

(assert (=> b!1442092 m!1331425))

(declare-fun m!1331427 () Bool)

(assert (=> b!1442092 m!1331427))

(assert (=> b!1442092 m!1331427))

(declare-fun m!1331429 () Bool)

(assert (=> b!1442092 m!1331429))

(assert (=> b!1442092 m!1331429))

(assert (=> b!1442092 m!1331427))

(declare-fun m!1331431 () Bool)

(assert (=> b!1442092 m!1331431))

(declare-fun m!1331433 () Bool)

(assert (=> b!1442088 m!1331433))

(assert (=> b!1442088 m!1331433))

(declare-fun m!1331435 () Bool)

(assert (=> b!1442088 m!1331435))

(declare-fun m!1331437 () Bool)

(assert (=> b!1442089 m!1331437))

(declare-fun m!1331439 () Bool)

(assert (=> b!1442094 m!1331439))

(assert (=> b!1442094 m!1331439))

(declare-fun m!1331441 () Bool)

(assert (=> b!1442094 m!1331441))

(declare-fun m!1331443 () Bool)

(assert (=> start!124728 m!1331443))

(declare-fun m!1331445 () Bool)

(assert (=> start!124728 m!1331445))

(declare-fun m!1331447 () Bool)

(assert (=> b!1442091 m!1331447))

(assert (=> b!1442093 m!1331439))

(assert (=> b!1442093 m!1331439))

(declare-fun m!1331449 () Bool)

(assert (=> b!1442093 m!1331449))

(assert (=> b!1442093 m!1331449))

(assert (=> b!1442093 m!1331439))

(declare-fun m!1331451 () Bool)

(assert (=> b!1442093 m!1331451))

(assert (=> b!1442090 m!1331439))

(assert (=> b!1442090 m!1331439))

(declare-fun m!1331453 () Bool)

(assert (=> b!1442090 m!1331453))

(assert (=> b!1442087 m!1331425))

(declare-fun m!1331455 () Bool)

(assert (=> b!1442087 m!1331455))

(check-sat (not b!1442089) (not b!1442091) (not b!1442093) (not b!1442094) (not b!1442090) (not b!1442092) (not b!1442088) (not start!124728))
(check-sat)
