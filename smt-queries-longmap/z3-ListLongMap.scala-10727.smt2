; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125470 () Bool)

(assert start!125470)

(declare-fun b!1468069 () Bool)

(declare-fun res!996726 () Bool)

(declare-fun e!824407 () Bool)

(assert (=> b!1468069 (=> (not res!996726) (not e!824407))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98896 0))(
  ( (array!98897 (arr!47737 (Array (_ BitVec 32) (_ BitVec 64))) (size!48289 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98896)

(assert (=> b!1468069 (= res!996726 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48289 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48289 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48289 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47737 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!996732 () Bool)

(assert (=> start!125470 (=> (not res!996732) (not e!824407))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125470 (= res!996732 (validMask!0 mask!2687))))

(assert (=> start!125470 e!824407))

(assert (=> start!125470 true))

(declare-fun array_inv!36970 (array!98896) Bool)

(assert (=> start!125470 (array_inv!36970 a!2862)))

(declare-fun b!1468070 () Bool)

(declare-fun e!824408 () Bool)

(assert (=> b!1468070 (= e!824408 false)))

(declare-datatypes ((SeekEntryResult!12002 0))(
  ( (MissingZero!12002 (index!50400 (_ BitVec 32))) (Found!12002 (index!50401 (_ BitVec 32))) (Intermediate!12002 (undefined!12814 Bool) (index!50402 (_ BitVec 32)) (x!131990 (_ BitVec 32))) (Undefined!12002) (MissingVacant!12002 (index!50403 (_ BitVec 32))) )
))
(declare-fun lt!642017 () SeekEntryResult!12002)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98896 (_ BitVec 32)) SeekEntryResult!12002)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1468070 (= lt!642017 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47737 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47737 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!98897 (store (arr!47737 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48289 a!2862)) mask!2687))))

(declare-fun b!1468071 () Bool)

(declare-fun res!996733 () Bool)

(assert (=> b!1468071 (=> (not res!996733) (not e!824408))))

(declare-fun lt!642018 () SeekEntryResult!12002)

(assert (=> b!1468071 (= res!996733 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47737 a!2862) j!93) a!2862 mask!2687) lt!642018))))

(declare-fun b!1468072 () Bool)

(assert (=> b!1468072 (= e!824407 e!824408)))

(declare-fun res!996727 () Bool)

(assert (=> b!1468072 (=> (not res!996727) (not e!824408))))

(assert (=> b!1468072 (= res!996727 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47737 a!2862) j!93) mask!2687) (select (arr!47737 a!2862) j!93) a!2862 mask!2687) lt!642018))))

(assert (=> b!1468072 (= lt!642018 (Intermediate!12002 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1468073 () Bool)

(declare-fun res!996730 () Bool)

(assert (=> b!1468073 (=> (not res!996730) (not e!824407))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1468073 (= res!996730 (validKeyInArray!0 (select (arr!47737 a!2862) i!1006)))))

(declare-fun b!1468074 () Bool)

(declare-fun res!996725 () Bool)

(assert (=> b!1468074 (=> (not res!996725) (not e!824407))))

(assert (=> b!1468074 (= res!996725 (validKeyInArray!0 (select (arr!47737 a!2862) j!93)))))

(declare-fun b!1468075 () Bool)

(declare-fun res!996728 () Bool)

(assert (=> b!1468075 (=> (not res!996728) (not e!824407))))

(assert (=> b!1468075 (= res!996728 (and (= (size!48289 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48289 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48289 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1468076 () Bool)

(declare-fun res!996729 () Bool)

(assert (=> b!1468076 (=> (not res!996729) (not e!824407))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98896 (_ BitVec 32)) Bool)

(assert (=> b!1468076 (= res!996729 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1468077 () Bool)

(declare-fun res!996731 () Bool)

(assert (=> b!1468077 (=> (not res!996731) (not e!824407))))

(declare-datatypes ((List!34316 0))(
  ( (Nil!34313) (Cons!34312 (h!35662 (_ BitVec 64)) (t!49002 List!34316)) )
))
(declare-fun arrayNoDuplicates!0 (array!98896 (_ BitVec 32) List!34316) Bool)

(assert (=> b!1468077 (= res!996731 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34313))))

(assert (= (and start!125470 res!996732) b!1468075))

(assert (= (and b!1468075 res!996728) b!1468073))

(assert (= (and b!1468073 res!996730) b!1468074))

(assert (= (and b!1468074 res!996725) b!1468076))

(assert (= (and b!1468076 res!996729) b!1468077))

(assert (= (and b!1468077 res!996731) b!1468069))

(assert (= (and b!1468069 res!996726) b!1468072))

(assert (= (and b!1468072 res!996727) b!1468071))

(assert (= (and b!1468071 res!996733) b!1468070))

(declare-fun m!1354617 () Bool)

(assert (=> b!1468072 m!1354617))

(assert (=> b!1468072 m!1354617))

(declare-fun m!1354619 () Bool)

(assert (=> b!1468072 m!1354619))

(assert (=> b!1468072 m!1354619))

(assert (=> b!1468072 m!1354617))

(declare-fun m!1354621 () Bool)

(assert (=> b!1468072 m!1354621))

(assert (=> b!1468074 m!1354617))

(assert (=> b!1468074 m!1354617))

(declare-fun m!1354623 () Bool)

(assert (=> b!1468074 m!1354623))

(assert (=> b!1468071 m!1354617))

(assert (=> b!1468071 m!1354617))

(declare-fun m!1354625 () Bool)

(assert (=> b!1468071 m!1354625))

(declare-fun m!1354627 () Bool)

(assert (=> b!1468069 m!1354627))

(declare-fun m!1354629 () Bool)

(assert (=> b!1468069 m!1354629))

(declare-fun m!1354631 () Bool)

(assert (=> b!1468077 m!1354631))

(declare-fun m!1354633 () Bool)

(assert (=> b!1468073 m!1354633))

(assert (=> b!1468073 m!1354633))

(declare-fun m!1354635 () Bool)

(assert (=> b!1468073 m!1354635))

(declare-fun m!1354637 () Bool)

(assert (=> start!125470 m!1354637))

(declare-fun m!1354639 () Bool)

(assert (=> start!125470 m!1354639))

(declare-fun m!1354641 () Bool)

(assert (=> b!1468076 m!1354641))

(assert (=> b!1468070 m!1354627))

(declare-fun m!1354643 () Bool)

(assert (=> b!1468070 m!1354643))

(assert (=> b!1468070 m!1354643))

(declare-fun m!1354645 () Bool)

(assert (=> b!1468070 m!1354645))

(assert (=> b!1468070 m!1354645))

(assert (=> b!1468070 m!1354643))

(declare-fun m!1354647 () Bool)

(assert (=> b!1468070 m!1354647))

(check-sat (not b!1468072) (not b!1468070) (not b!1468073) (not b!1468074) (not start!125470) (not b!1468076) (not b!1468071) (not b!1468077))
(check-sat)
