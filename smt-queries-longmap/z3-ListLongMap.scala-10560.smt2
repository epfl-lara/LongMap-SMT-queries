; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124468 () Bool)

(assert start!124468)

(declare-fun b!1440394 () Bool)

(declare-fun e!812115 () Bool)

(assert (=> b!1440394 (= e!812115 false)))

(declare-datatypes ((SeekEntryResult!11513 0))(
  ( (MissingZero!11513 (index!48444 (_ BitVec 32))) (Found!11513 (index!48445 (_ BitVec 32))) (Intermediate!11513 (undefined!12325 Bool) (index!48446 (_ BitVec 32)) (x!130165 (_ BitVec 32))) (Undefined!11513) (MissingVacant!11513 (index!48447 (_ BitVec 32))) )
))
(declare-fun lt!632756 () SeekEntryResult!11513)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!97894 0))(
  ( (array!97895 (arr!47236 (Array (_ BitVec 32) (_ BitVec 64))) (size!47788 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97894)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97894 (_ BitVec 32)) SeekEntryResult!11513)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1440394 (= lt!632756 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47236 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47236 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97895 (store (arr!47236 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47788 a!2862)) mask!2687))))

(declare-fun b!1440395 () Bool)

(declare-fun res!972946 () Bool)

(declare-fun e!812114 () Bool)

(assert (=> b!1440395 (=> (not res!972946) (not e!812114))))

(declare-datatypes ((List!33815 0))(
  ( (Nil!33812) (Cons!33811 (h!35161 (_ BitVec 64)) (t!48501 List!33815)) )
))
(declare-fun arrayNoDuplicates!0 (array!97894 (_ BitVec 32) List!33815) Bool)

(assert (=> b!1440395 (= res!972946 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33812))))

(declare-fun b!1440396 () Bool)

(declare-fun res!972940 () Bool)

(assert (=> b!1440396 (=> (not res!972940) (not e!812114))))

(assert (=> b!1440396 (= res!972940 (and (= (size!47788 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47788 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47788 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1440397 () Bool)

(declare-fun res!972939 () Bool)

(assert (=> b!1440397 (=> (not res!972939) (not e!812114))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1440397 (= res!972939 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47788 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47788 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47788 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47236 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!972941 () Bool)

(assert (=> start!124468 (=> (not res!972941) (not e!812114))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124468 (= res!972941 (validMask!0 mask!2687))))

(assert (=> start!124468 e!812114))

(assert (=> start!124468 true))

(declare-fun array_inv!36469 (array!97894) Bool)

(assert (=> start!124468 (array_inv!36469 a!2862)))

(declare-fun b!1440398 () Bool)

(assert (=> b!1440398 (= e!812114 e!812115)))

(declare-fun res!972943 () Bool)

(assert (=> b!1440398 (=> (not res!972943) (not e!812115))))

(declare-fun lt!632757 () SeekEntryResult!11513)

(assert (=> b!1440398 (= res!972943 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47236 a!2862) j!93) mask!2687) (select (arr!47236 a!2862) j!93) a!2862 mask!2687) lt!632757))))

(assert (=> b!1440398 (= lt!632757 (Intermediate!11513 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1440399 () Bool)

(declare-fun res!972938 () Bool)

(assert (=> b!1440399 (=> (not res!972938) (not e!812114))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1440399 (= res!972938 (validKeyInArray!0 (select (arr!47236 a!2862) i!1006)))))

(declare-fun b!1440400 () Bool)

(declare-fun res!972945 () Bool)

(assert (=> b!1440400 (=> (not res!972945) (not e!812114))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97894 (_ BitVec 32)) Bool)

(assert (=> b!1440400 (= res!972945 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1440401 () Bool)

(declare-fun res!972944 () Bool)

(assert (=> b!1440401 (=> (not res!972944) (not e!812114))))

(assert (=> b!1440401 (= res!972944 (validKeyInArray!0 (select (arr!47236 a!2862) j!93)))))

(declare-fun b!1440402 () Bool)

(declare-fun res!972942 () Bool)

(assert (=> b!1440402 (=> (not res!972942) (not e!812115))))

(assert (=> b!1440402 (= res!972942 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47236 a!2862) j!93) a!2862 mask!2687) lt!632757))))

(assert (= (and start!124468 res!972941) b!1440396))

(assert (= (and b!1440396 res!972940) b!1440399))

(assert (= (and b!1440399 res!972938) b!1440401))

(assert (= (and b!1440401 res!972944) b!1440400))

(assert (= (and b!1440400 res!972945) b!1440395))

(assert (= (and b!1440395 res!972946) b!1440397))

(assert (= (and b!1440397 res!972939) b!1440398))

(assert (= (and b!1440398 res!972943) b!1440402))

(assert (= (and b!1440402 res!972942) b!1440394))

(declare-fun m!1329117 () Bool)

(assert (=> b!1440395 m!1329117))

(declare-fun m!1329119 () Bool)

(assert (=> b!1440394 m!1329119))

(declare-fun m!1329121 () Bool)

(assert (=> b!1440394 m!1329121))

(assert (=> b!1440394 m!1329121))

(declare-fun m!1329123 () Bool)

(assert (=> b!1440394 m!1329123))

(assert (=> b!1440394 m!1329123))

(assert (=> b!1440394 m!1329121))

(declare-fun m!1329125 () Bool)

(assert (=> b!1440394 m!1329125))

(declare-fun m!1329127 () Bool)

(assert (=> b!1440401 m!1329127))

(assert (=> b!1440401 m!1329127))

(declare-fun m!1329129 () Bool)

(assert (=> b!1440401 m!1329129))

(declare-fun m!1329131 () Bool)

(assert (=> b!1440399 m!1329131))

(assert (=> b!1440399 m!1329131))

(declare-fun m!1329133 () Bool)

(assert (=> b!1440399 m!1329133))

(declare-fun m!1329135 () Bool)

(assert (=> start!124468 m!1329135))

(declare-fun m!1329137 () Bool)

(assert (=> start!124468 m!1329137))

(assert (=> b!1440397 m!1329119))

(declare-fun m!1329139 () Bool)

(assert (=> b!1440397 m!1329139))

(assert (=> b!1440398 m!1329127))

(assert (=> b!1440398 m!1329127))

(declare-fun m!1329141 () Bool)

(assert (=> b!1440398 m!1329141))

(assert (=> b!1440398 m!1329141))

(assert (=> b!1440398 m!1329127))

(declare-fun m!1329143 () Bool)

(assert (=> b!1440398 m!1329143))

(assert (=> b!1440402 m!1329127))

(assert (=> b!1440402 m!1329127))

(declare-fun m!1329145 () Bool)

(assert (=> b!1440402 m!1329145))

(declare-fun m!1329147 () Bool)

(assert (=> b!1440400 m!1329147))

(check-sat (not b!1440399) (not b!1440400) (not b!1440402) (not b!1440395) (not b!1440401) (not start!124468) (not b!1440398) (not b!1440394))
(check-sat)
