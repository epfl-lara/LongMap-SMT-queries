; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122430 () Bool)

(assert start!122430)

(declare-fun b!1418640 () Bool)

(declare-fun res!954248 () Bool)

(declare-fun e!802792 () Bool)

(assert (=> b!1418640 (=> (not res!954248) (not e!802792))))

(declare-datatypes ((array!96873 0))(
  ( (array!96874 (arr!46757 (Array (_ BitVec 32) (_ BitVec 64))) (size!47307 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96873)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1418640 (= res!954248 (validKeyInArray!0 (select (arr!46757 a!2831) j!81)))))

(declare-fun b!1418641 () Bool)

(assert (=> b!1418641 (= e!802792 false)))

(declare-fun lt!625644 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1418641 (= lt!625644 (toIndex!0 (select (arr!46757 a!2831) j!81) mask!2608))))

(declare-fun b!1418642 () Bool)

(declare-fun res!954249 () Bool)

(assert (=> b!1418642 (=> (not res!954249) (not e!802792))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96873 (_ BitVec 32)) Bool)

(assert (=> b!1418642 (= res!954249 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun res!954253 () Bool)

(assert (=> start!122430 (=> (not res!954253) (not e!802792))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122430 (= res!954253 (validMask!0 mask!2608))))

(assert (=> start!122430 e!802792))

(assert (=> start!122430 true))

(declare-fun array_inv!35785 (array!96873) Bool)

(assert (=> start!122430 (array_inv!35785 a!2831)))

(declare-fun b!1418643 () Bool)

(declare-fun res!954251 () Bool)

(assert (=> b!1418643 (=> (not res!954251) (not e!802792))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1418643 (= res!954251 (and (= (size!47307 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47307 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47307 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1418644 () Bool)

(declare-fun res!954252 () Bool)

(assert (=> b!1418644 (=> (not res!954252) (not e!802792))))

(declare-datatypes ((List!33267 0))(
  ( (Nil!33264) (Cons!33263 (h!34559 (_ BitVec 64)) (t!47961 List!33267)) )
))
(declare-fun arrayNoDuplicates!0 (array!96873 (_ BitVec 32) List!33267) Bool)

(assert (=> b!1418644 (= res!954252 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33264))))

(declare-fun b!1418645 () Bool)

(declare-fun res!954250 () Bool)

(assert (=> b!1418645 (=> (not res!954250) (not e!802792))))

(assert (=> b!1418645 (= res!954250 (validKeyInArray!0 (select (arr!46757 a!2831) i!982)))))

(declare-fun b!1418646 () Bool)

(declare-fun res!954247 () Bool)

(assert (=> b!1418646 (=> (not res!954247) (not e!802792))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1418646 (= res!954247 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47307 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47307 a!2831))))))

(assert (= (and start!122430 res!954253) b!1418643))

(assert (= (and b!1418643 res!954251) b!1418645))

(assert (= (and b!1418645 res!954250) b!1418640))

(assert (= (and b!1418640 res!954248) b!1418642))

(assert (= (and b!1418642 res!954249) b!1418644))

(assert (= (and b!1418644 res!954252) b!1418646))

(assert (= (and b!1418646 res!954247) b!1418641))

(declare-fun m!1309275 () Bool)

(assert (=> b!1418640 m!1309275))

(assert (=> b!1418640 m!1309275))

(declare-fun m!1309277 () Bool)

(assert (=> b!1418640 m!1309277))

(declare-fun m!1309279 () Bool)

(assert (=> b!1418645 m!1309279))

(assert (=> b!1418645 m!1309279))

(declare-fun m!1309281 () Bool)

(assert (=> b!1418645 m!1309281))

(assert (=> b!1418641 m!1309275))

(assert (=> b!1418641 m!1309275))

(declare-fun m!1309283 () Bool)

(assert (=> b!1418641 m!1309283))

(declare-fun m!1309285 () Bool)

(assert (=> b!1418644 m!1309285))

(declare-fun m!1309287 () Bool)

(assert (=> b!1418642 m!1309287))

(declare-fun m!1309289 () Bool)

(assert (=> start!122430 m!1309289))

(declare-fun m!1309291 () Bool)

(assert (=> start!122430 m!1309291))

(push 1)

(assert (not b!1418644))

(assert (not b!1418645))

(assert (not b!1418641))

(assert (not b!1418640))

(assert (not b!1418642))

(assert (not start!122430))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

