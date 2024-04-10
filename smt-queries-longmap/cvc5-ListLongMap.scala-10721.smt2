; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125464 () Bool)

(assert start!125464)

(declare-fun b!1467785 () Bool)

(declare-fun res!996326 () Bool)

(declare-fun e!824369 () Bool)

(assert (=> b!1467785 (=> (not res!996326) (not e!824369))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-datatypes ((array!98912 0))(
  ( (array!98913 (arr!47744 (Array (_ BitVec 32) (_ BitVec 64))) (size!48294 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98912)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11984 0))(
  ( (MissingZero!11984 (index!50328 (_ BitVec 32))) (Found!11984 (index!50329 (_ BitVec 32))) (Intermediate!11984 (undefined!12796 Bool) (index!50330 (_ BitVec 32)) (x!131929 (_ BitVec 32))) (Undefined!11984) (MissingVacant!11984 (index!50331 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98912 (_ BitVec 32)) SeekEntryResult!11984)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1467785 (= res!996326 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47744 a!2862) j!93) mask!2687) (select (arr!47744 a!2862) j!93) a!2862 mask!2687) (Intermediate!11984 false intermediateBeforeIndex!19 intermediateBeforeX!19)))))

(declare-fun b!1467786 () Bool)

(declare-fun res!996329 () Bool)

(assert (=> b!1467786 (=> (not res!996329) (not e!824369))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1467786 (= res!996329 (and (= (size!48294 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48294 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48294 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1467788 () Bool)

(declare-fun res!996324 () Bool)

(assert (=> b!1467788 (=> (not res!996324) (not e!824369))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1467788 (= res!996324 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48294 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48294 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48294 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47744 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1467789 () Bool)

(assert (=> b!1467789 (= e!824369 false)))

(declare-fun lt!642150 () SeekEntryResult!11984)

(assert (=> b!1467789 (= lt!642150 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47744 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1467790 () Bool)

(declare-fun res!996331 () Bool)

(assert (=> b!1467790 (=> (not res!996331) (not e!824369))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98912 (_ BitVec 32)) Bool)

(assert (=> b!1467790 (= res!996331 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1467791 () Bool)

(declare-fun res!996328 () Bool)

(assert (=> b!1467791 (=> (not res!996328) (not e!824369))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1467791 (= res!996328 (validKeyInArray!0 (select (arr!47744 a!2862) i!1006)))))

(declare-fun b!1467792 () Bool)

(declare-fun res!996330 () Bool)

(assert (=> b!1467792 (=> (not res!996330) (not e!824369))))

(declare-datatypes ((List!34245 0))(
  ( (Nil!34242) (Cons!34241 (h!35591 (_ BitVec 64)) (t!48939 List!34245)) )
))
(declare-fun arrayNoDuplicates!0 (array!98912 (_ BitVec 32) List!34245) Bool)

(assert (=> b!1467792 (= res!996330 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34242))))

(declare-fun res!996327 () Bool)

(assert (=> start!125464 (=> (not res!996327) (not e!824369))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125464 (= res!996327 (validMask!0 mask!2687))))

(assert (=> start!125464 e!824369))

(assert (=> start!125464 true))

(declare-fun array_inv!36772 (array!98912) Bool)

(assert (=> start!125464 (array_inv!36772 a!2862)))

(declare-fun b!1467787 () Bool)

(declare-fun res!996325 () Bool)

(assert (=> b!1467787 (=> (not res!996325) (not e!824369))))

(assert (=> b!1467787 (= res!996325 (validKeyInArray!0 (select (arr!47744 a!2862) j!93)))))

(assert (= (and start!125464 res!996327) b!1467786))

(assert (= (and b!1467786 res!996329) b!1467791))

(assert (= (and b!1467791 res!996328) b!1467787))

(assert (= (and b!1467787 res!996325) b!1467790))

(assert (= (and b!1467790 res!996331) b!1467792))

(assert (= (and b!1467792 res!996330) b!1467788))

(assert (= (and b!1467788 res!996324) b!1467785))

(assert (= (and b!1467785 res!996326) b!1467789))

(declare-fun m!1354747 () Bool)

(assert (=> b!1467787 m!1354747))

(assert (=> b!1467787 m!1354747))

(declare-fun m!1354749 () Bool)

(assert (=> b!1467787 m!1354749))

(declare-fun m!1354751 () Bool)

(assert (=> b!1467791 m!1354751))

(assert (=> b!1467791 m!1354751))

(declare-fun m!1354753 () Bool)

(assert (=> b!1467791 m!1354753))

(declare-fun m!1354755 () Bool)

(assert (=> b!1467792 m!1354755))

(assert (=> b!1467785 m!1354747))

(assert (=> b!1467785 m!1354747))

(declare-fun m!1354757 () Bool)

(assert (=> b!1467785 m!1354757))

(assert (=> b!1467785 m!1354757))

(assert (=> b!1467785 m!1354747))

(declare-fun m!1354759 () Bool)

(assert (=> b!1467785 m!1354759))

(declare-fun m!1354761 () Bool)

(assert (=> b!1467788 m!1354761))

(declare-fun m!1354763 () Bool)

(assert (=> b!1467788 m!1354763))

(declare-fun m!1354765 () Bool)

(assert (=> start!125464 m!1354765))

(declare-fun m!1354767 () Bool)

(assert (=> start!125464 m!1354767))

(assert (=> b!1467789 m!1354747))

(assert (=> b!1467789 m!1354747))

(declare-fun m!1354769 () Bool)

(assert (=> b!1467789 m!1354769))

(declare-fun m!1354771 () Bool)

(assert (=> b!1467790 m!1354771))

(push 1)

(assert (not b!1467792))

(assert (not b!1467787))

(assert (not b!1467789))

(assert (not start!125464))

(assert (not b!1467791))

(assert (not b!1467790))

(assert (not b!1467785))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

