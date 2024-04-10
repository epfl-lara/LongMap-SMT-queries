; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124472 () Bool)

(assert start!124472)

(declare-fun b!1440210 () Bool)

(declare-fun res!972642 () Bool)

(declare-fun e!812112 () Bool)

(assert (=> b!1440210 (=> (not res!972642) (not e!812112))))

(declare-datatypes ((array!97920 0))(
  ( (array!97921 (arr!47248 (Array (_ BitVec 32) (_ BitVec 64))) (size!47798 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97920)

(declare-datatypes ((List!33749 0))(
  ( (Nil!33746) (Cons!33745 (h!35095 (_ BitVec 64)) (t!48443 List!33749)) )
))
(declare-fun arrayNoDuplicates!0 (array!97920 (_ BitVec 32) List!33749) Bool)

(assert (=> b!1440210 (= res!972642 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33746))))

(declare-fun b!1440211 () Bool)

(declare-fun res!972640 () Bool)

(assert (=> b!1440211 (=> (not res!972640) (not e!812112))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1440211 (= res!972640 (validKeyInArray!0 (select (arr!47248 a!2862) j!93)))))

(declare-fun b!1440212 () Bool)

(declare-fun res!972638 () Bool)

(assert (=> b!1440212 (=> (not res!972638) (not e!812112))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1440212 (= res!972638 (and (= (size!47798 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47798 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47798 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1440213 () Bool)

(declare-fun res!972643 () Bool)

(assert (=> b!1440213 (=> (not res!972643) (not e!812112))))

(assert (=> b!1440213 (= res!972643 (validKeyInArray!0 (select (arr!47248 a!2862) i!1006)))))

(declare-fun b!1440214 () Bool)

(declare-fun e!812113 () Bool)

(assert (=> b!1440214 (= e!812112 e!812113)))

(declare-fun res!972646 () Bool)

(assert (=> b!1440214 (=> (not res!972646) (not e!812113))))

(declare-datatypes ((SeekEntryResult!11500 0))(
  ( (MissingZero!11500 (index!48392 (_ BitVec 32))) (Found!11500 (index!48393 (_ BitVec 32))) (Intermediate!11500 (undefined!12312 Bool) (index!48394 (_ BitVec 32)) (x!130117 (_ BitVec 32))) (Undefined!11500) (MissingVacant!11500 (index!48395 (_ BitVec 32))) )
))
(declare-fun lt!632931 () SeekEntryResult!11500)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97920 (_ BitVec 32)) SeekEntryResult!11500)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1440214 (= res!972646 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47248 a!2862) j!93) mask!2687) (select (arr!47248 a!2862) j!93) a!2862 mask!2687) lt!632931))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1440214 (= lt!632931 (Intermediate!11500 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1440215 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1440215 (= e!812113 (and (bvsgt x!665 intermediateAfterX!19) (bvsge mask!2687 #b00000000000000000000000000000000) (bvsge index!646 (bvadd #b00000000000000000000000000000001 mask!2687))))))

(declare-fun b!1440216 () Bool)

(declare-fun res!972639 () Bool)

(assert (=> b!1440216 (=> (not res!972639) (not e!812113))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1440216 (= res!972639 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47248 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47248 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97921 (store (arr!47248 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47798 a!2862)) mask!2687) (Intermediate!11500 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun b!1440217 () Bool)

(declare-fun res!972637 () Bool)

(assert (=> b!1440217 (=> (not res!972637) (not e!812113))))

(assert (=> b!1440217 (= res!972637 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47248 a!2862) j!93) a!2862 mask!2687) lt!632931))))

(declare-fun b!1440218 () Bool)

(declare-fun res!972644 () Bool)

(assert (=> b!1440218 (=> (not res!972644) (not e!812112))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97920 (_ BitVec 32)) Bool)

(assert (=> b!1440218 (= res!972644 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!972641 () Bool)

(assert (=> start!124472 (=> (not res!972641) (not e!812112))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124472 (= res!972641 (validMask!0 mask!2687))))

(assert (=> start!124472 e!812112))

(assert (=> start!124472 true))

(declare-fun array_inv!36276 (array!97920) Bool)

(assert (=> start!124472 (array_inv!36276 a!2862)))

(declare-fun b!1440219 () Bool)

(declare-fun res!972645 () Bool)

(assert (=> b!1440219 (=> (not res!972645) (not e!812112))))

(assert (=> b!1440219 (= res!972645 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47798 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47798 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47798 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47248 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!124472 res!972641) b!1440212))

(assert (= (and b!1440212 res!972638) b!1440213))

(assert (= (and b!1440213 res!972643) b!1440211))

(assert (= (and b!1440211 res!972640) b!1440218))

(assert (= (and b!1440218 res!972644) b!1440210))

(assert (= (and b!1440210 res!972642) b!1440219))

(assert (= (and b!1440219 res!972645) b!1440214))

(assert (= (and b!1440214 res!972646) b!1440217))

(assert (= (and b!1440217 res!972637) b!1440216))

(assert (= (and b!1440216 res!972639) b!1440215))

(declare-fun m!1329371 () Bool)

(assert (=> b!1440217 m!1329371))

(assert (=> b!1440217 m!1329371))

(declare-fun m!1329373 () Bool)

(assert (=> b!1440217 m!1329373))

(assert (=> b!1440211 m!1329371))

(assert (=> b!1440211 m!1329371))

(declare-fun m!1329375 () Bool)

(assert (=> b!1440211 m!1329375))

(declare-fun m!1329377 () Bool)

(assert (=> b!1440218 m!1329377))

(declare-fun m!1329379 () Bool)

(assert (=> b!1440213 m!1329379))

(assert (=> b!1440213 m!1329379))

(declare-fun m!1329381 () Bool)

(assert (=> b!1440213 m!1329381))

(declare-fun m!1329383 () Bool)

(assert (=> b!1440216 m!1329383))

(declare-fun m!1329385 () Bool)

(assert (=> b!1440216 m!1329385))

(assert (=> b!1440216 m!1329385))

(declare-fun m!1329387 () Bool)

(assert (=> b!1440216 m!1329387))

(assert (=> b!1440216 m!1329387))

(assert (=> b!1440216 m!1329385))

(declare-fun m!1329389 () Bool)

(assert (=> b!1440216 m!1329389))

(assert (=> b!1440219 m!1329383))

(declare-fun m!1329391 () Bool)

(assert (=> b!1440219 m!1329391))

(declare-fun m!1329393 () Bool)

(assert (=> start!124472 m!1329393))

(declare-fun m!1329395 () Bool)

(assert (=> start!124472 m!1329395))

(assert (=> b!1440214 m!1329371))

(assert (=> b!1440214 m!1329371))

(declare-fun m!1329397 () Bool)

(assert (=> b!1440214 m!1329397))

(assert (=> b!1440214 m!1329397))

(assert (=> b!1440214 m!1329371))

(declare-fun m!1329399 () Bool)

(assert (=> b!1440214 m!1329399))

(declare-fun m!1329401 () Bool)

(assert (=> b!1440210 m!1329401))

(push 1)

(assert (not b!1440211))

(assert (not b!1440218))

(assert (not b!1440213))

(assert (not b!1440217))

(assert (not b!1440214))

(assert (not start!124472))

(assert (not b!1440216))

(assert (not b!1440210))

(check-sat)

(pop 1)

(push 1)

(check-sat)

