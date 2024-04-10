; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122198 () Bool)

(assert start!122198)

(declare-fun b!1417593 () Bool)

(declare-fun res!953327 () Bool)

(declare-fun e!802276 () Bool)

(assert (=> b!1417593 (=> (not res!953327) (not e!802276))))

(declare-datatypes ((array!96782 0))(
  ( (array!96783 (arr!46719 (Array (_ BitVec 32) (_ BitVec 64))) (size!47269 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96782)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1417593 (= res!953327 (validKeyInArray!0 (select (arr!46719 a!2901) i!1037)))))

(declare-fun b!1417594 () Bool)

(declare-fun res!953326 () Bool)

(assert (=> b!1417594 (=> (not res!953326) (not e!802276))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1417594 (= res!953326 (validKeyInArray!0 (select (arr!46719 a!2901) j!112)))))

(declare-fun b!1417595 () Bool)

(declare-fun res!953329 () Bool)

(assert (=> b!1417595 (=> (not res!953329) (not e!802276))))

(declare-datatypes ((List!33238 0))(
  ( (Nil!33235) (Cons!33234 (h!34527 (_ BitVec 64)) (t!47932 List!33238)) )
))
(declare-fun arrayNoDuplicates!0 (array!96782 (_ BitVec 32) List!33238) Bool)

(assert (=> b!1417595 (= res!953329 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33235))))

(declare-fun b!1417596 () Bool)

(assert (=> b!1417596 (= e!802276 (not true))))

(declare-fun e!802277 () Bool)

(assert (=> b!1417596 e!802277))

(declare-fun res!953328 () Bool)

(assert (=> b!1417596 (=> (not res!953328) (not e!802277))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96782 (_ BitVec 32)) Bool)

(assert (=> b!1417596 (= res!953328 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!48034 0))(
  ( (Unit!48035) )
))
(declare-fun lt!625415 () Unit!48034)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96782 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48034)

(assert (=> b!1417596 (= lt!625415 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!11030 0))(
  ( (MissingZero!11030 (index!46512 (_ BitVec 32))) (Found!11030 (index!46513 (_ BitVec 32))) (Intermediate!11030 (undefined!11842 Bool) (index!46514 (_ BitVec 32)) (x!128113 (_ BitVec 32))) (Undefined!11030) (MissingVacant!11030 (index!46515 (_ BitVec 32))) )
))
(declare-fun lt!625416 () SeekEntryResult!11030)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96782 (_ BitVec 32)) SeekEntryResult!11030)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1417596 (= lt!625416 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46719 a!2901) j!112) mask!2840) (select (arr!46719 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1417597 () Bool)

(declare-fun res!953325 () Bool)

(assert (=> b!1417597 (=> (not res!953325) (not e!802276))))

(assert (=> b!1417597 (= res!953325 (and (= (size!47269 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47269 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47269 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1417598 () Bool)

(declare-fun res!953324 () Bool)

(assert (=> b!1417598 (=> (not res!953324) (not e!802276))))

(assert (=> b!1417598 (= res!953324 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!953323 () Bool)

(assert (=> start!122198 (=> (not res!953323) (not e!802276))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122198 (= res!953323 (validMask!0 mask!2840))))

(assert (=> start!122198 e!802276))

(assert (=> start!122198 true))

(declare-fun array_inv!35747 (array!96782) Bool)

(assert (=> start!122198 (array_inv!35747 a!2901)))

(declare-fun b!1417599 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96782 (_ BitVec 32)) SeekEntryResult!11030)

(assert (=> b!1417599 (= e!802277 (= (seekEntryOrOpen!0 (select (arr!46719 a!2901) j!112) a!2901 mask!2840) (Found!11030 j!112)))))

(assert (= (and start!122198 res!953323) b!1417597))

(assert (= (and b!1417597 res!953325) b!1417593))

(assert (= (and b!1417593 res!953327) b!1417594))

(assert (= (and b!1417594 res!953326) b!1417598))

(assert (= (and b!1417598 res!953324) b!1417595))

(assert (= (and b!1417595 res!953329) b!1417596))

(assert (= (and b!1417596 res!953328) b!1417599))

(declare-fun m!1308347 () Bool)

(assert (=> b!1417596 m!1308347))

(declare-fun m!1308349 () Bool)

(assert (=> b!1417596 m!1308349))

(assert (=> b!1417596 m!1308347))

(declare-fun m!1308351 () Bool)

(assert (=> b!1417596 m!1308351))

(assert (=> b!1417596 m!1308349))

(assert (=> b!1417596 m!1308347))

(declare-fun m!1308353 () Bool)

(assert (=> b!1417596 m!1308353))

(declare-fun m!1308355 () Bool)

(assert (=> b!1417596 m!1308355))

(assert (=> b!1417599 m!1308347))

(assert (=> b!1417599 m!1308347))

(declare-fun m!1308357 () Bool)

(assert (=> b!1417599 m!1308357))

(declare-fun m!1308359 () Bool)

(assert (=> start!122198 m!1308359))

(declare-fun m!1308361 () Bool)

(assert (=> start!122198 m!1308361))

(declare-fun m!1308363 () Bool)

(assert (=> b!1417598 m!1308363))

(declare-fun m!1308365 () Bool)

(assert (=> b!1417595 m!1308365))

(declare-fun m!1308367 () Bool)

(assert (=> b!1417593 m!1308367))

(assert (=> b!1417593 m!1308367))

(declare-fun m!1308369 () Bool)

(assert (=> b!1417593 m!1308369))

(assert (=> b!1417594 m!1308347))

(assert (=> b!1417594 m!1308347))

(declare-fun m!1308371 () Bool)

(assert (=> b!1417594 m!1308371))

(check-sat (not b!1417596) (not b!1417599) (not b!1417595) (not start!122198) (not b!1417598) (not b!1417594) (not b!1417593))
