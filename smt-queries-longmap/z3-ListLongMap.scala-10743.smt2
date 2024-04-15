; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125566 () Bool)

(assert start!125566)

(declare-fun b!1469571 () Bool)

(declare-fun res!998136 () Bool)

(declare-fun e!824981 () Bool)

(assert (=> b!1469571 (=> (not res!998136) (not e!824981))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98992 0))(
  ( (array!98993 (arr!47785 (Array (_ BitVec 32) (_ BitVec 64))) (size!48337 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98992)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1469571 (= res!998136 (and (= (size!48337 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48337 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48337 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1469572 () Bool)

(declare-fun e!824984 () Bool)

(declare-fun e!824982 () Bool)

(assert (=> b!1469572 (= e!824984 e!824982)))

(declare-fun res!998133 () Bool)

(assert (=> b!1469572 (=> (not res!998133) (not e!824982))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12050 0))(
  ( (MissingZero!12050 (index!50592 (_ BitVec 32))) (Found!12050 (index!50593 (_ BitVec 32))) (Intermediate!12050 (undefined!12862 Bool) (index!50594 (_ BitVec 32)) (x!132166 (_ BitVec 32))) (Undefined!12050) (MissingVacant!12050 (index!50595 (_ BitVec 32))) )
))
(declare-fun lt!642430 () SeekEntryResult!12050)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1469572 (= res!998133 (= lt!642430 (Intermediate!12050 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!642432 () (_ BitVec 64))

(declare-fun lt!642431 () array!98992)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98992 (_ BitVec 32)) SeekEntryResult!12050)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1469572 (= lt!642430 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!642432 mask!2687) lt!642432 lt!642431 mask!2687))))

(assert (=> b!1469572 (= lt!642432 (select (store (arr!47785 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1469573 () Bool)

(declare-fun res!998141 () Bool)

(assert (=> b!1469573 (=> (not res!998141) (not e!824981))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1469573 (= res!998141 (validKeyInArray!0 (select (arr!47785 a!2862) j!93)))))

(declare-fun b!1469574 () Bool)

(assert (=> b!1469574 (= e!824982 false)))

(declare-fun lt!642429 () Bool)

(declare-fun e!824983 () Bool)

(assert (=> b!1469574 (= lt!642429 e!824983)))

(declare-fun c!135232 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(assert (=> b!1469574 (= c!135232 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1469575 () Bool)

(declare-fun res!998134 () Bool)

(assert (=> b!1469575 (=> (not res!998134) (not e!824981))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1469575 (= res!998134 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48337 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48337 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48337 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1469576 () Bool)

(declare-fun res!998142 () Bool)

(assert (=> b!1469576 (=> (not res!998142) (not e!824984))))

(declare-fun lt!642428 () SeekEntryResult!12050)

(assert (=> b!1469576 (= res!998142 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47785 a!2862) j!93) a!2862 mask!2687) lt!642428))))

(declare-fun b!1469577 () Bool)

(declare-fun e!824980 () Bool)

(assert (=> b!1469577 (= e!824981 e!824980)))

(declare-fun res!998137 () Bool)

(assert (=> b!1469577 (=> (not res!998137) (not e!824980))))

(assert (=> b!1469577 (= res!998137 (= (select (store (arr!47785 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1469577 (= lt!642431 (array!98993 (store (arr!47785 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48337 a!2862)))))

(declare-fun b!1469578 () Bool)

(assert (=> b!1469578 (= e!824983 (not (= lt!642430 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!642432 lt!642431 mask!2687))))))

(declare-fun res!998143 () Bool)

(assert (=> start!125566 (=> (not res!998143) (not e!824981))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125566 (= res!998143 (validMask!0 mask!2687))))

(assert (=> start!125566 e!824981))

(assert (=> start!125566 true))

(declare-fun array_inv!37018 (array!98992) Bool)

(assert (=> start!125566 (array_inv!37018 a!2862)))

(declare-fun b!1469579 () Bool)

(declare-fun res!998135 () Bool)

(assert (=> b!1469579 (=> (not res!998135) (not e!824981))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98992 (_ BitVec 32)) Bool)

(assert (=> b!1469579 (= res!998135 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1469580 () Bool)

(assert (=> b!1469580 (= e!824980 e!824984)))

(declare-fun res!998140 () Bool)

(assert (=> b!1469580 (=> (not res!998140) (not e!824984))))

(assert (=> b!1469580 (= res!998140 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47785 a!2862) j!93) mask!2687) (select (arr!47785 a!2862) j!93) a!2862 mask!2687) lt!642428))))

(assert (=> b!1469580 (= lt!642428 (Intermediate!12050 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1469581 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98992 (_ BitVec 32)) SeekEntryResult!12050)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98992 (_ BitVec 32)) SeekEntryResult!12050)

(assert (=> b!1469581 (= e!824983 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!642432 lt!642431 mask!2687) (seekEntryOrOpen!0 lt!642432 lt!642431 mask!2687))))))

(declare-fun b!1469582 () Bool)

(declare-fun res!998139 () Bool)

(assert (=> b!1469582 (=> (not res!998139) (not e!824981))))

(declare-datatypes ((List!34364 0))(
  ( (Nil!34361) (Cons!34360 (h!35710 (_ BitVec 64)) (t!49050 List!34364)) )
))
(declare-fun arrayNoDuplicates!0 (array!98992 (_ BitVec 32) List!34364) Bool)

(assert (=> b!1469582 (= res!998139 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34361))))

(declare-fun b!1469583 () Bool)

(declare-fun res!998138 () Bool)

(assert (=> b!1469583 (=> (not res!998138) (not e!824981))))

(assert (=> b!1469583 (= res!998138 (validKeyInArray!0 (select (arr!47785 a!2862) i!1006)))))

(assert (= (and start!125566 res!998143) b!1469571))

(assert (= (and b!1469571 res!998136) b!1469583))

(assert (= (and b!1469583 res!998138) b!1469573))

(assert (= (and b!1469573 res!998141) b!1469579))

(assert (= (and b!1469579 res!998135) b!1469582))

(assert (= (and b!1469582 res!998139) b!1469575))

(assert (= (and b!1469575 res!998134) b!1469577))

(assert (= (and b!1469577 res!998137) b!1469580))

(assert (= (and b!1469580 res!998140) b!1469576))

(assert (= (and b!1469576 res!998142) b!1469572))

(assert (= (and b!1469572 res!998133) b!1469574))

(assert (= (and b!1469574 c!135232) b!1469578))

(assert (= (and b!1469574 (not c!135232)) b!1469581))

(declare-fun m!1356243 () Bool)

(assert (=> b!1469572 m!1356243))

(assert (=> b!1469572 m!1356243))

(declare-fun m!1356245 () Bool)

(assert (=> b!1469572 m!1356245))

(declare-fun m!1356247 () Bool)

(assert (=> b!1469572 m!1356247))

(declare-fun m!1356249 () Bool)

(assert (=> b!1469572 m!1356249))

(declare-fun m!1356251 () Bool)

(assert (=> b!1469582 m!1356251))

(declare-fun m!1356253 () Bool)

(assert (=> b!1469576 m!1356253))

(assert (=> b!1469576 m!1356253))

(declare-fun m!1356255 () Bool)

(assert (=> b!1469576 m!1356255))

(declare-fun m!1356257 () Bool)

(assert (=> b!1469583 m!1356257))

(assert (=> b!1469583 m!1356257))

(declare-fun m!1356259 () Bool)

(assert (=> b!1469583 m!1356259))

(declare-fun m!1356261 () Bool)

(assert (=> b!1469578 m!1356261))

(assert (=> b!1469580 m!1356253))

(assert (=> b!1469580 m!1356253))

(declare-fun m!1356263 () Bool)

(assert (=> b!1469580 m!1356263))

(assert (=> b!1469580 m!1356263))

(assert (=> b!1469580 m!1356253))

(declare-fun m!1356265 () Bool)

(assert (=> b!1469580 m!1356265))

(declare-fun m!1356267 () Bool)

(assert (=> b!1469579 m!1356267))

(assert (=> b!1469577 m!1356247))

(declare-fun m!1356269 () Bool)

(assert (=> b!1469577 m!1356269))

(declare-fun m!1356271 () Bool)

(assert (=> b!1469581 m!1356271))

(declare-fun m!1356273 () Bool)

(assert (=> b!1469581 m!1356273))

(declare-fun m!1356275 () Bool)

(assert (=> start!125566 m!1356275))

(declare-fun m!1356277 () Bool)

(assert (=> start!125566 m!1356277))

(assert (=> b!1469573 m!1356253))

(assert (=> b!1469573 m!1356253))

(declare-fun m!1356279 () Bool)

(assert (=> b!1469573 m!1356279))

(check-sat (not b!1469576) (not b!1469573) (not b!1469583) (not b!1469581) (not start!125566) (not b!1469580) (not b!1469579) (not b!1469578) (not b!1469572) (not b!1469582))
(check-sat)
