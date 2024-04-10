; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125462 () Bool)

(assert start!125462)

(declare-fun b!1467761 () Bool)

(declare-fun res!996300 () Bool)

(declare-fun e!824362 () Bool)

(assert (=> b!1467761 (=> (not res!996300) (not e!824362))))

(declare-datatypes ((array!98910 0))(
  ( (array!98911 (arr!47743 (Array (_ BitVec 32) (_ BitVec 64))) (size!48293 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98910)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1467761 (= res!996300 (validKeyInArray!0 (select (arr!47743 a!2862) j!93)))))

(declare-fun b!1467762 () Bool)

(assert (=> b!1467762 (= e!824362 false)))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11983 0))(
  ( (MissingZero!11983 (index!50324 (_ BitVec 32))) (Found!11983 (index!50325 (_ BitVec 32))) (Intermediate!11983 (undefined!12795 Bool) (index!50326 (_ BitVec 32)) (x!131920 (_ BitVec 32))) (Undefined!11983) (MissingVacant!11983 (index!50327 (_ BitVec 32))) )
))
(declare-fun lt!642147 () SeekEntryResult!11983)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98910 (_ BitVec 32)) SeekEntryResult!11983)

(assert (=> b!1467762 (= lt!642147 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47743 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1467764 () Bool)

(declare-fun res!996301 () Bool)

(assert (=> b!1467764 (=> (not res!996301) (not e!824362))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1467764 (= res!996301 (and (= (size!48293 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48293 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48293 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1467765 () Bool)

(declare-fun res!996302 () Bool)

(assert (=> b!1467765 (=> (not res!996302) (not e!824362))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1467765 (= res!996302 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48293 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48293 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48293 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47743 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1467766 () Bool)

(declare-fun res!996304 () Bool)

(assert (=> b!1467766 (=> (not res!996304) (not e!824362))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1467766 (= res!996304 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47743 a!2862) j!93) mask!2687) (select (arr!47743 a!2862) j!93) a!2862 mask!2687) (Intermediate!11983 false intermediateBeforeIndex!19 intermediateBeforeX!19)))))

(declare-fun b!1467767 () Bool)

(declare-fun res!996306 () Bool)

(assert (=> b!1467767 (=> (not res!996306) (not e!824362))))

(assert (=> b!1467767 (= res!996306 (validKeyInArray!0 (select (arr!47743 a!2862) i!1006)))))

(declare-fun b!1467768 () Bool)

(declare-fun res!996303 () Bool)

(assert (=> b!1467768 (=> (not res!996303) (not e!824362))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98910 (_ BitVec 32)) Bool)

(assert (=> b!1467768 (= res!996303 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!996305 () Bool)

(assert (=> start!125462 (=> (not res!996305) (not e!824362))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125462 (= res!996305 (validMask!0 mask!2687))))

(assert (=> start!125462 e!824362))

(assert (=> start!125462 true))

(declare-fun array_inv!36771 (array!98910) Bool)

(assert (=> start!125462 (array_inv!36771 a!2862)))

(declare-fun b!1467763 () Bool)

(declare-fun res!996307 () Bool)

(assert (=> b!1467763 (=> (not res!996307) (not e!824362))))

(declare-datatypes ((List!34244 0))(
  ( (Nil!34241) (Cons!34240 (h!35590 (_ BitVec 64)) (t!48938 List!34244)) )
))
(declare-fun arrayNoDuplicates!0 (array!98910 (_ BitVec 32) List!34244) Bool)

(assert (=> b!1467763 (= res!996307 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34241))))

(assert (= (and start!125462 res!996305) b!1467764))

(assert (= (and b!1467764 res!996301) b!1467767))

(assert (= (and b!1467767 res!996306) b!1467761))

(assert (= (and b!1467761 res!996300) b!1467768))

(assert (= (and b!1467768 res!996303) b!1467763))

(assert (= (and b!1467763 res!996307) b!1467765))

(assert (= (and b!1467765 res!996302) b!1467766))

(assert (= (and b!1467766 res!996304) b!1467762))

(declare-fun m!1354721 () Bool)

(assert (=> b!1467761 m!1354721))

(assert (=> b!1467761 m!1354721))

(declare-fun m!1354723 () Bool)

(assert (=> b!1467761 m!1354723))

(declare-fun m!1354725 () Bool)

(assert (=> b!1467768 m!1354725))

(declare-fun m!1354727 () Bool)

(assert (=> start!125462 m!1354727))

(declare-fun m!1354729 () Bool)

(assert (=> start!125462 m!1354729))

(assert (=> b!1467766 m!1354721))

(assert (=> b!1467766 m!1354721))

(declare-fun m!1354731 () Bool)

(assert (=> b!1467766 m!1354731))

(assert (=> b!1467766 m!1354731))

(assert (=> b!1467766 m!1354721))

(declare-fun m!1354733 () Bool)

(assert (=> b!1467766 m!1354733))

(declare-fun m!1354735 () Bool)

(assert (=> b!1467767 m!1354735))

(assert (=> b!1467767 m!1354735))

(declare-fun m!1354737 () Bool)

(assert (=> b!1467767 m!1354737))

(declare-fun m!1354739 () Bool)

(assert (=> b!1467765 m!1354739))

(declare-fun m!1354741 () Bool)

(assert (=> b!1467765 m!1354741))

(declare-fun m!1354743 () Bool)

(assert (=> b!1467763 m!1354743))

(assert (=> b!1467762 m!1354721))

(assert (=> b!1467762 m!1354721))

(declare-fun m!1354745 () Bool)

(assert (=> b!1467762 m!1354745))

(push 1)

(assert (not b!1467761))

(assert (not b!1467762))

(assert (not b!1467767))

(assert (not b!1467768))

(assert (not b!1467763))

(assert (not b!1467766))

(assert (not start!125462))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

