; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122816 () Bool)

(assert start!122816)

(declare-fun b!1421523 () Bool)

(declare-fun res!956275 () Bool)

(declare-fun e!804109 () Bool)

(assert (=> b!1421523 (=> (not res!956275) (not e!804109))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97103 0))(
  ( (array!97104 (arr!46867 (Array (_ BitVec 32) (_ BitVec 64))) (size!47418 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97103)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1421523 (= res!956275 (and (= (size!47418 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47418 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47418 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1421524 () Bool)

(declare-fun res!956276 () Bool)

(assert (=> b!1421524 (=> (not res!956276) (not e!804109))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97103 (_ BitVec 32)) Bool)

(assert (=> b!1421524 (= res!956276 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1421525 () Bool)

(declare-fun res!956281 () Bool)

(declare-fun e!804108 () Bool)

(assert (=> b!1421525 (=> (not res!956281) (not e!804108))))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11054 0))(
  ( (MissingZero!11054 (index!46608 (_ BitVec 32))) (Found!11054 (index!46609 (_ BitVec 32))) (Intermediate!11054 (undefined!11866 Bool) (index!46610 (_ BitVec 32)) (x!128427 (_ BitVec 32))) (Undefined!11054) (MissingVacant!11054 (index!46611 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97103 (_ BitVec 32)) SeekEntryResult!11054)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1421525 (= res!956281 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46867 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (select (store (arr!46867 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (array!97104 (store (arr!46867 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47418 a!2831)) mask!2608) (Intermediate!11054 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(declare-fun b!1421526 () Bool)

(declare-fun res!956278 () Bool)

(assert (=> b!1421526 (=> (not res!956278) (not e!804109))))

(declare-datatypes ((List!33364 0))(
  ( (Nil!33361) (Cons!33360 (h!34670 (_ BitVec 64)) (t!48050 List!33364)) )
))
(declare-fun arrayNoDuplicates!0 (array!97103 (_ BitVec 32) List!33364) Bool)

(assert (=> b!1421526 (= res!956278 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33361))))

(declare-fun b!1421527 () Bool)

(declare-fun res!956279 () Bool)

(assert (=> b!1421527 (=> (not res!956279) (not e!804109))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1421527 (= res!956279 (validKeyInArray!0 (select (arr!46867 a!2831) i!982)))))

(declare-fun b!1421528 () Bool)

(declare-fun res!956280 () Bool)

(assert (=> b!1421528 (=> (not res!956280) (not e!804109))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1421528 (= res!956280 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47418 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47418 a!2831))))))

(declare-fun b!1421529 () Bool)

(assert (=> b!1421529 (= e!804108 (and (bvsge mask!2608 #b00000000000000000000000000000000) (bvsge index!585 (bvadd #b00000000000000000000000000000001 mask!2608))))))

(declare-fun b!1421530 () Bool)

(declare-fun res!956274 () Bool)

(assert (=> b!1421530 (=> (not res!956274) (not e!804108))))

(declare-fun lt!626309 () SeekEntryResult!11054)

(assert (=> b!1421530 (= res!956274 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46867 a!2831) j!81) a!2831 mask!2608) lt!626309))))

(declare-fun b!1421532 () Bool)

(declare-fun res!956273 () Bool)

(assert (=> b!1421532 (=> (not res!956273) (not e!804109))))

(assert (=> b!1421532 (= res!956273 (validKeyInArray!0 (select (arr!46867 a!2831) j!81)))))

(declare-fun res!956272 () Bool)

(assert (=> start!122816 (=> (not res!956272) (not e!804109))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122816 (= res!956272 (validMask!0 mask!2608))))

(assert (=> start!122816 e!804109))

(assert (=> start!122816 true))

(declare-fun array_inv!36148 (array!97103) Bool)

(assert (=> start!122816 (array_inv!36148 a!2831)))

(declare-fun b!1421531 () Bool)

(assert (=> b!1421531 (= e!804109 e!804108)))

(declare-fun res!956277 () Bool)

(assert (=> b!1421531 (=> (not res!956277) (not e!804108))))

(assert (=> b!1421531 (= res!956277 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46867 a!2831) j!81) mask!2608) (select (arr!46867 a!2831) j!81) a!2831 mask!2608) lt!626309))))

(assert (=> b!1421531 (= lt!626309 (Intermediate!11054 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(assert (= (and start!122816 res!956272) b!1421523))

(assert (= (and b!1421523 res!956275) b!1421527))

(assert (= (and b!1421527 res!956279) b!1421532))

(assert (= (and b!1421532 res!956273) b!1421524))

(assert (= (and b!1421524 res!956276) b!1421526))

(assert (= (and b!1421526 res!956278) b!1421528))

(assert (= (and b!1421528 res!956280) b!1421531))

(assert (= (and b!1421531 res!956277) b!1421525))

(assert (= (and b!1421525 res!956281) b!1421530))

(assert (= (and b!1421530 res!956274) b!1421529))

(declare-fun m!1312263 () Bool)

(assert (=> start!122816 m!1312263))

(declare-fun m!1312265 () Bool)

(assert (=> start!122816 m!1312265))

(declare-fun m!1312267 () Bool)

(assert (=> b!1421530 m!1312267))

(assert (=> b!1421530 m!1312267))

(declare-fun m!1312269 () Bool)

(assert (=> b!1421530 m!1312269))

(assert (=> b!1421531 m!1312267))

(assert (=> b!1421531 m!1312267))

(declare-fun m!1312271 () Bool)

(assert (=> b!1421531 m!1312271))

(assert (=> b!1421531 m!1312271))

(assert (=> b!1421531 m!1312267))

(declare-fun m!1312273 () Bool)

(assert (=> b!1421531 m!1312273))

(declare-fun m!1312275 () Bool)

(assert (=> b!1421525 m!1312275))

(declare-fun m!1312277 () Bool)

(assert (=> b!1421525 m!1312277))

(assert (=> b!1421525 m!1312277))

(declare-fun m!1312279 () Bool)

(assert (=> b!1421525 m!1312279))

(assert (=> b!1421525 m!1312279))

(assert (=> b!1421525 m!1312277))

(declare-fun m!1312281 () Bool)

(assert (=> b!1421525 m!1312281))

(declare-fun m!1312283 () Bool)

(assert (=> b!1421527 m!1312283))

(assert (=> b!1421527 m!1312283))

(declare-fun m!1312285 () Bool)

(assert (=> b!1421527 m!1312285))

(declare-fun m!1312287 () Bool)

(assert (=> b!1421526 m!1312287))

(declare-fun m!1312289 () Bool)

(assert (=> b!1421524 m!1312289))

(assert (=> b!1421532 m!1312267))

(assert (=> b!1421532 m!1312267))

(declare-fun m!1312291 () Bool)

(assert (=> b!1421532 m!1312291))

(check-sat (not b!1421531) (not start!122816) (not b!1421527) (not b!1421532) (not b!1421525) (not b!1421526) (not b!1421530) (not b!1421524))
(check-sat)
