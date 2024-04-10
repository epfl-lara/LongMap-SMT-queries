; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122920 () Bool)

(assert start!122920)

(declare-fun b!1425789 () Bool)

(declare-fun res!961222 () Bool)

(declare-fun e!805468 () Bool)

(assert (=> b!1425789 (=> (not res!961222) (not e!805468))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-datatypes ((array!97285 0))(
  ( (array!97286 (arr!46960 (Array (_ BitVec 32) (_ BitVec 64))) (size!47510 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97285)

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1425789 (= res!961222 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47510 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47510 a!2831))))))

(declare-fun b!1425790 () Bool)

(declare-fun e!805466 () Bool)

(assert (=> b!1425790 (= e!805466 false)))

(declare-datatypes ((SeekEntryResult!11239 0))(
  ( (MissingZero!11239 (index!47348 (_ BitVec 32))) (Found!11239 (index!47349 (_ BitVec 32))) (Intermediate!11239 (undefined!12051 Bool) (index!47350 (_ BitVec 32)) (x!128977 (_ BitVec 32))) (Undefined!11239) (MissingVacant!11239 (index!47351 (_ BitVec 32))) )
))
(declare-fun lt!627903 () SeekEntryResult!11239)

(declare-fun lt!627904 () array!97285)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun lt!627906 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97285 (_ BitVec 32)) SeekEntryResult!11239)

(assert (=> b!1425790 (= lt!627903 (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!627906 lt!627904 mask!2608))))

(declare-fun b!1425791 () Bool)

(declare-fun res!961223 () Bool)

(assert (=> b!1425791 (=> (not res!961223) (not e!805468))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97285 (_ BitVec 32)) Bool)

(assert (=> b!1425791 (= res!961223 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1425792 () Bool)

(declare-fun res!961231 () Bool)

(assert (=> b!1425792 (=> (not res!961231) (not e!805468))))

(declare-datatypes ((List!33470 0))(
  ( (Nil!33467) (Cons!33466 (h!34768 (_ BitVec 64)) (t!48164 List!33470)) )
))
(declare-fun arrayNoDuplicates!0 (array!97285 (_ BitVec 32) List!33470) Bool)

(assert (=> b!1425792 (= res!961231 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33467))))

(declare-fun b!1425793 () Bool)

(declare-fun res!961229 () Bool)

(assert (=> b!1425793 (=> (not res!961229) (not e!805468))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1425793 (= res!961229 (validKeyInArray!0 (select (arr!46960 a!2831) i!982)))))

(declare-fun b!1425794 () Bool)

(declare-fun res!961228 () Bool)

(assert (=> b!1425794 (=> (not res!961228) (not e!805468))))

(declare-fun j!81 () (_ BitVec 32))

(assert (=> b!1425794 (= res!961228 (validKeyInArray!0 (select (arr!46960 a!2831) j!81)))))

(declare-fun res!961227 () Bool)

(assert (=> start!122920 (=> (not res!961227) (not e!805468))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122920 (= res!961227 (validMask!0 mask!2608))))

(assert (=> start!122920 e!805468))

(assert (=> start!122920 true))

(declare-fun array_inv!35988 (array!97285) Bool)

(assert (=> start!122920 (array_inv!35988 a!2831)))

(declare-fun b!1425795 () Bool)

(declare-fun e!805469 () Bool)

(assert (=> b!1425795 (= e!805469 e!805466)))

(declare-fun res!961225 () Bool)

(assert (=> b!1425795 (=> (not res!961225) (not e!805466))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1425795 (= res!961225 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!627906 mask!2608) lt!627906 lt!627904 mask!2608) (Intermediate!11239 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(assert (=> b!1425795 (= lt!627906 (select (store (arr!46960 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1425795 (= lt!627904 (array!97286 (store (arr!46960 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47510 a!2831)))))

(declare-fun b!1425796 () Bool)

(declare-fun res!961230 () Bool)

(assert (=> b!1425796 (=> (not res!961230) (not e!805468))))

(assert (=> b!1425796 (= res!961230 (and (= (size!47510 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47510 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47510 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1425797 () Bool)

(declare-fun res!961226 () Bool)

(assert (=> b!1425797 (=> (not res!961226) (not e!805466))))

(declare-fun lt!627905 () SeekEntryResult!11239)

(assert (=> b!1425797 (= res!961226 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46960 a!2831) j!81) a!2831 mask!2608) lt!627905))))

(declare-fun b!1425798 () Bool)

(assert (=> b!1425798 (= e!805468 e!805469)))

(declare-fun res!961224 () Bool)

(assert (=> b!1425798 (=> (not res!961224) (not e!805469))))

(assert (=> b!1425798 (= res!961224 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46960 a!2831) j!81) mask!2608) (select (arr!46960 a!2831) j!81) a!2831 mask!2608) lt!627905))))

(assert (=> b!1425798 (= lt!627905 (Intermediate!11239 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(assert (= (and start!122920 res!961227) b!1425796))

(assert (= (and b!1425796 res!961230) b!1425793))

(assert (= (and b!1425793 res!961229) b!1425794))

(assert (= (and b!1425794 res!961228) b!1425791))

(assert (= (and b!1425791 res!961223) b!1425792))

(assert (= (and b!1425792 res!961231) b!1425789))

(assert (= (and b!1425789 res!961222) b!1425798))

(assert (= (and b!1425798 res!961224) b!1425795))

(assert (= (and b!1425795 res!961225) b!1425797))

(assert (= (and b!1425797 res!961226) b!1425790))

(declare-fun m!1316395 () Bool)

(assert (=> b!1425790 m!1316395))

(declare-fun m!1316397 () Bool)

(assert (=> b!1425795 m!1316397))

(assert (=> b!1425795 m!1316397))

(declare-fun m!1316399 () Bool)

(assert (=> b!1425795 m!1316399))

(declare-fun m!1316401 () Bool)

(assert (=> b!1425795 m!1316401))

(declare-fun m!1316403 () Bool)

(assert (=> b!1425795 m!1316403))

(declare-fun m!1316405 () Bool)

(assert (=> b!1425792 m!1316405))

(declare-fun m!1316407 () Bool)

(assert (=> b!1425793 m!1316407))

(assert (=> b!1425793 m!1316407))

(declare-fun m!1316409 () Bool)

(assert (=> b!1425793 m!1316409))

(declare-fun m!1316411 () Bool)

(assert (=> b!1425794 m!1316411))

(assert (=> b!1425794 m!1316411))

(declare-fun m!1316413 () Bool)

(assert (=> b!1425794 m!1316413))

(assert (=> b!1425797 m!1316411))

(assert (=> b!1425797 m!1316411))

(declare-fun m!1316415 () Bool)

(assert (=> b!1425797 m!1316415))

(declare-fun m!1316417 () Bool)

(assert (=> b!1425791 m!1316417))

(declare-fun m!1316419 () Bool)

(assert (=> start!122920 m!1316419))

(declare-fun m!1316421 () Bool)

(assert (=> start!122920 m!1316421))

(assert (=> b!1425798 m!1316411))

(assert (=> b!1425798 m!1316411))

(declare-fun m!1316423 () Bool)

(assert (=> b!1425798 m!1316423))

(assert (=> b!1425798 m!1316423))

(assert (=> b!1425798 m!1316411))

(declare-fun m!1316425 () Bool)

(assert (=> b!1425798 m!1316425))

(push 1)

(assert (not b!1425795))

(assert (not b!1425793))

