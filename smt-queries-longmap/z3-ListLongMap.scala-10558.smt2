; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124456 () Bool)

(assert start!124456)

(declare-fun b!1440214 () Bool)

(declare-fun res!972766 () Bool)

(declare-fun e!812060 () Bool)

(assert (=> b!1440214 (=> (not res!972766) (not e!812060))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11507 0))(
  ( (MissingZero!11507 (index!48420 (_ BitVec 32))) (Found!11507 (index!48421 (_ BitVec 32))) (Intermediate!11507 (undefined!12319 Bool) (index!48422 (_ BitVec 32)) (x!130143 (_ BitVec 32))) (Undefined!11507) (MissingVacant!11507 (index!48423 (_ BitVec 32))) )
))
(declare-fun lt!632729 () SeekEntryResult!11507)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!97882 0))(
  ( (array!97883 (arr!47230 (Array (_ BitVec 32) (_ BitVec 64))) (size!47782 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97882)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97882 (_ BitVec 32)) SeekEntryResult!11507)

(assert (=> b!1440214 (= res!972766 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47230 a!2862) j!93) a!2862 mask!2687) lt!632729))))

(declare-fun b!1440215 () Bool)

(declare-fun res!972763 () Bool)

(declare-fun e!812061 () Bool)

(assert (=> b!1440215 (=> (not res!972763) (not e!812061))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1440215 (= res!972763 (validKeyInArray!0 (select (arr!47230 a!2862) i!1006)))))

(declare-fun b!1440216 () Bool)

(declare-fun res!972764 () Bool)

(assert (=> b!1440216 (=> (not res!972764) (not e!812061))))

(assert (=> b!1440216 (= res!972764 (validKeyInArray!0 (select (arr!47230 a!2862) j!93)))))

(declare-fun res!972762 () Bool)

(assert (=> start!124456 (=> (not res!972762) (not e!812061))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124456 (= res!972762 (validMask!0 mask!2687))))

(assert (=> start!124456 e!812061))

(assert (=> start!124456 true))

(declare-fun array_inv!36463 (array!97882) Bool)

(assert (=> start!124456 (array_inv!36463 a!2862)))

(declare-fun b!1440217 () Bool)

(declare-fun res!972758 () Bool)

(assert (=> b!1440217 (=> (not res!972758) (not e!812061))))

(declare-datatypes ((List!33809 0))(
  ( (Nil!33806) (Cons!33805 (h!35155 (_ BitVec 64)) (t!48495 List!33809)) )
))
(declare-fun arrayNoDuplicates!0 (array!97882 (_ BitVec 32) List!33809) Bool)

(assert (=> b!1440217 (= res!972758 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33806))))

(declare-fun b!1440218 () Bool)

(declare-fun res!972759 () Bool)

(assert (=> b!1440218 (=> (not res!972759) (not e!812061))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1440218 (= res!972759 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47782 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47782 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47782 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47230 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1440219 () Bool)

(assert (=> b!1440219 (= e!812060 false)))

(declare-fun lt!632730 () SeekEntryResult!11507)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1440219 (= lt!632730 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47230 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47230 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97883 (store (arr!47230 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47782 a!2862)) mask!2687))))

(declare-fun b!1440220 () Bool)

(assert (=> b!1440220 (= e!812061 e!812060)))

(declare-fun res!972765 () Bool)

(assert (=> b!1440220 (=> (not res!972765) (not e!812060))))

(assert (=> b!1440220 (= res!972765 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47230 a!2862) j!93) mask!2687) (select (arr!47230 a!2862) j!93) a!2862 mask!2687) lt!632729))))

(assert (=> b!1440220 (= lt!632729 (Intermediate!11507 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1440221 () Bool)

(declare-fun res!972761 () Bool)

(assert (=> b!1440221 (=> (not res!972761) (not e!812061))))

(assert (=> b!1440221 (= res!972761 (and (= (size!47782 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47782 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47782 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1440222 () Bool)

(declare-fun res!972760 () Bool)

(assert (=> b!1440222 (=> (not res!972760) (not e!812061))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97882 (_ BitVec 32)) Bool)

(assert (=> b!1440222 (= res!972760 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!124456 res!972762) b!1440221))

(assert (= (and b!1440221 res!972761) b!1440215))

(assert (= (and b!1440215 res!972763) b!1440216))

(assert (= (and b!1440216 res!972764) b!1440222))

(assert (= (and b!1440222 res!972760) b!1440217))

(assert (= (and b!1440217 res!972758) b!1440218))

(assert (= (and b!1440218 res!972759) b!1440220))

(assert (= (and b!1440220 res!972765) b!1440214))

(assert (= (and b!1440214 res!972766) b!1440219))

(declare-fun m!1328919 () Bool)

(assert (=> b!1440215 m!1328919))

(assert (=> b!1440215 m!1328919))

(declare-fun m!1328921 () Bool)

(assert (=> b!1440215 m!1328921))

(declare-fun m!1328923 () Bool)

(assert (=> b!1440217 m!1328923))

(declare-fun m!1328925 () Bool)

(assert (=> b!1440218 m!1328925))

(declare-fun m!1328927 () Bool)

(assert (=> b!1440218 m!1328927))

(declare-fun m!1328929 () Bool)

(assert (=> start!124456 m!1328929))

(declare-fun m!1328931 () Bool)

(assert (=> start!124456 m!1328931))

(declare-fun m!1328933 () Bool)

(assert (=> b!1440222 m!1328933))

(declare-fun m!1328935 () Bool)

(assert (=> b!1440220 m!1328935))

(assert (=> b!1440220 m!1328935))

(declare-fun m!1328937 () Bool)

(assert (=> b!1440220 m!1328937))

(assert (=> b!1440220 m!1328937))

(assert (=> b!1440220 m!1328935))

(declare-fun m!1328939 () Bool)

(assert (=> b!1440220 m!1328939))

(assert (=> b!1440216 m!1328935))

(assert (=> b!1440216 m!1328935))

(declare-fun m!1328941 () Bool)

(assert (=> b!1440216 m!1328941))

(assert (=> b!1440219 m!1328925))

(declare-fun m!1328943 () Bool)

(assert (=> b!1440219 m!1328943))

(assert (=> b!1440219 m!1328943))

(declare-fun m!1328945 () Bool)

(assert (=> b!1440219 m!1328945))

(assert (=> b!1440219 m!1328945))

(assert (=> b!1440219 m!1328943))

(declare-fun m!1328947 () Bool)

(assert (=> b!1440219 m!1328947))

(assert (=> b!1440214 m!1328935))

(assert (=> b!1440214 m!1328935))

(declare-fun m!1328949 () Bool)

(assert (=> b!1440214 m!1328949))

(check-sat (not b!1440214) (not b!1440215) (not b!1440217) (not b!1440222) (not start!124456) (not b!1440216) (not b!1440219) (not b!1440220))
(check-sat)
