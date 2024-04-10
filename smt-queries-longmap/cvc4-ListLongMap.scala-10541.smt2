; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124346 () Bool)

(assert start!124346)

(declare-fun b!1438779 () Bool)

(declare-fun res!971331 () Bool)

(declare-fun e!811580 () Bool)

(assert (=> b!1438779 (=> (not res!971331) (not e!811580))))

(declare-datatypes ((array!97833 0))(
  ( (array!97834 (arr!47206 (Array (_ BitVec 32) (_ BitVec 64))) (size!47756 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97833)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1438779 (= res!971331 (validKeyInArray!0 (select (arr!47206 a!2862) j!93)))))

(declare-fun b!1438780 () Bool)

(declare-fun res!971335 () Bool)

(assert (=> b!1438780 (=> (not res!971335) (not e!811580))))

(declare-datatypes ((List!33707 0))(
  ( (Nil!33704) (Cons!33703 (h!35050 (_ BitVec 64)) (t!48401 List!33707)) )
))
(declare-fun arrayNoDuplicates!0 (array!97833 (_ BitVec 32) List!33707) Bool)

(assert (=> b!1438780 (= res!971335 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33704))))

(declare-fun b!1438781 () Bool)

(declare-fun res!971334 () Bool)

(declare-fun e!811578 () Bool)

(assert (=> b!1438781 (=> (not res!971334) (not e!811578))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11458 0))(
  ( (MissingZero!11458 (index!48224 (_ BitVec 32))) (Found!11458 (index!48225 (_ BitVec 32))) (Intermediate!11458 (undefined!12270 Bool) (index!48226 (_ BitVec 32)) (x!129957 (_ BitVec 32))) (Undefined!11458) (MissingVacant!11458 (index!48227 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97833 (_ BitVec 32)) SeekEntryResult!11458)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1438781 (= res!971334 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47206 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47206 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97834 (store (arr!47206 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47756 a!2862)) mask!2687) (Intermediate!11458 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun b!1438782 () Bool)

(declare-fun res!971329 () Bool)

(assert (=> b!1438782 (=> (not res!971329) (not e!811580))))

(assert (=> b!1438782 (= res!971329 (and (= (size!47756 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47756 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47756 a!2862)) (not (= i!1006 j!93))))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1438783 () Bool)

(assert (=> b!1438783 (= e!811578 (and (bvsle x!665 intermediateAfterX!19) (bvslt mask!2687 #b00000000000000000000000000000000)))))

(declare-fun b!1438784 () Bool)

(declare-fun res!971333 () Bool)

(assert (=> b!1438784 (=> (not res!971333) (not e!811580))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97833 (_ BitVec 32)) Bool)

(assert (=> b!1438784 (= res!971333 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1438785 () Bool)

(assert (=> b!1438785 (= e!811580 e!811578)))

(declare-fun res!971337 () Bool)

(assert (=> b!1438785 (=> (not res!971337) (not e!811578))))

(declare-fun lt!632643 () SeekEntryResult!11458)

(assert (=> b!1438785 (= res!971337 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47206 a!2862) j!93) mask!2687) (select (arr!47206 a!2862) j!93) a!2862 mask!2687) lt!632643))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1438785 (= lt!632643 (Intermediate!11458 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1438786 () Bool)

(declare-fun res!971330 () Bool)

(assert (=> b!1438786 (=> (not res!971330) (not e!811580))))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1438786 (= res!971330 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47756 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47756 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47756 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47206 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!971338 () Bool)

(assert (=> start!124346 (=> (not res!971338) (not e!811580))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124346 (= res!971338 (validMask!0 mask!2687))))

(assert (=> start!124346 e!811580))

(assert (=> start!124346 true))

(declare-fun array_inv!36234 (array!97833) Bool)

(assert (=> start!124346 (array_inv!36234 a!2862)))

(declare-fun b!1438787 () Bool)

(declare-fun res!971332 () Bool)

(assert (=> b!1438787 (=> (not res!971332) (not e!811580))))

(assert (=> b!1438787 (= res!971332 (validKeyInArray!0 (select (arr!47206 a!2862) i!1006)))))

(declare-fun b!1438788 () Bool)

(declare-fun res!971336 () Bool)

(assert (=> b!1438788 (=> (not res!971336) (not e!811578))))

(assert (=> b!1438788 (= res!971336 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47206 a!2862) j!93) a!2862 mask!2687) lt!632643))))

(assert (= (and start!124346 res!971338) b!1438782))

(assert (= (and b!1438782 res!971329) b!1438787))

(assert (= (and b!1438787 res!971332) b!1438779))

(assert (= (and b!1438779 res!971331) b!1438784))

(assert (= (and b!1438784 res!971333) b!1438780))

(assert (= (and b!1438780 res!971335) b!1438786))

(assert (= (and b!1438786 res!971330) b!1438785))

(assert (= (and b!1438785 res!971337) b!1438788))

(assert (= (and b!1438788 res!971336) b!1438781))

(assert (= (and b!1438781 res!971334) b!1438783))

(declare-fun m!1327895 () Bool)

(assert (=> b!1438787 m!1327895))

(assert (=> b!1438787 m!1327895))

(declare-fun m!1327897 () Bool)

(assert (=> b!1438787 m!1327897))

(declare-fun m!1327899 () Bool)

(assert (=> b!1438781 m!1327899))

(declare-fun m!1327901 () Bool)

(assert (=> b!1438781 m!1327901))

(assert (=> b!1438781 m!1327901))

(declare-fun m!1327903 () Bool)

(assert (=> b!1438781 m!1327903))

(assert (=> b!1438781 m!1327903))

(assert (=> b!1438781 m!1327901))

(declare-fun m!1327905 () Bool)

(assert (=> b!1438781 m!1327905))

(declare-fun m!1327907 () Bool)

(assert (=> b!1438779 m!1327907))

(assert (=> b!1438779 m!1327907))

(declare-fun m!1327909 () Bool)

(assert (=> b!1438779 m!1327909))

(declare-fun m!1327911 () Bool)

(assert (=> b!1438780 m!1327911))

(declare-fun m!1327913 () Bool)

(assert (=> b!1438784 m!1327913))

(assert (=> b!1438788 m!1327907))

(assert (=> b!1438788 m!1327907))

(declare-fun m!1327915 () Bool)

(assert (=> b!1438788 m!1327915))

(assert (=> b!1438785 m!1327907))

(assert (=> b!1438785 m!1327907))

(declare-fun m!1327917 () Bool)

(assert (=> b!1438785 m!1327917))

(assert (=> b!1438785 m!1327917))

(assert (=> b!1438785 m!1327907))

(declare-fun m!1327919 () Bool)

(assert (=> b!1438785 m!1327919))

(assert (=> b!1438786 m!1327899))

(declare-fun m!1327921 () Bool)

(assert (=> b!1438786 m!1327921))

(declare-fun m!1327923 () Bool)

(assert (=> start!124346 m!1327923))

(declare-fun m!1327925 () Bool)

(assert (=> start!124346 m!1327925))

(push 1)

(assert (not b!1438788))

(assert (not b!1438787))

(assert (not b!1438781))

(assert (not b!1438785))

(assert (not b!1438784))

(assert (not b!1438780))

(assert (not start!124346))

(assert (not b!1438779))

(check-sat)

(pop 1)

(push 1)

(check-sat)

