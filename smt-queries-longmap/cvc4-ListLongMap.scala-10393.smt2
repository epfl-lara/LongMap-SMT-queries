; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122440 () Bool)

(assert start!122440)

(declare-fun b!1418745 () Bool)

(declare-fun res!954356 () Bool)

(declare-fun e!802822 () Bool)

(assert (=> b!1418745 (=> (not res!954356) (not e!802822))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!96883 0))(
  ( (array!96884 (arr!46762 (Array (_ BitVec 32) (_ BitVec 64))) (size!47312 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96883)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1418745 (= res!954356 (and (= (size!47312 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47312 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47312 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1418746 () Bool)

(declare-fun res!954354 () Bool)

(assert (=> b!1418746 (=> (not res!954354) (not e!802822))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96883 (_ BitVec 32)) Bool)

(assert (=> b!1418746 (= res!954354 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1418747 () Bool)

(assert (=> b!1418747 (= e!802822 false)))

(declare-fun lt!625659 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1418747 (= lt!625659 (toIndex!0 (select (arr!46762 a!2831) j!81) mask!2608))))

(declare-fun res!954352 () Bool)

(assert (=> start!122440 (=> (not res!954352) (not e!802822))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122440 (= res!954352 (validMask!0 mask!2608))))

(assert (=> start!122440 e!802822))

(assert (=> start!122440 true))

(declare-fun array_inv!35790 (array!96883) Bool)

(assert (=> start!122440 (array_inv!35790 a!2831)))

(declare-fun b!1418748 () Bool)

(declare-fun res!954357 () Bool)

(assert (=> b!1418748 (=> (not res!954357) (not e!802822))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1418748 (= res!954357 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47312 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47312 a!2831))))))

(declare-fun b!1418749 () Bool)

(declare-fun res!954355 () Bool)

(assert (=> b!1418749 (=> (not res!954355) (not e!802822))))

(declare-datatypes ((List!33272 0))(
  ( (Nil!33269) (Cons!33268 (h!34564 (_ BitVec 64)) (t!47966 List!33272)) )
))
(declare-fun arrayNoDuplicates!0 (array!96883 (_ BitVec 32) List!33272) Bool)

(assert (=> b!1418749 (= res!954355 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33269))))

(declare-fun b!1418750 () Bool)

(declare-fun res!954358 () Bool)

(assert (=> b!1418750 (=> (not res!954358) (not e!802822))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1418750 (= res!954358 (validKeyInArray!0 (select (arr!46762 a!2831) j!81)))))

(declare-fun b!1418751 () Bool)

(declare-fun res!954353 () Bool)

(assert (=> b!1418751 (=> (not res!954353) (not e!802822))))

(assert (=> b!1418751 (= res!954353 (validKeyInArray!0 (select (arr!46762 a!2831) i!982)))))

(assert (= (and start!122440 res!954352) b!1418745))

(assert (= (and b!1418745 res!954356) b!1418751))

(assert (= (and b!1418751 res!954353) b!1418750))

(assert (= (and b!1418750 res!954358) b!1418746))

(assert (= (and b!1418746 res!954354) b!1418749))

(assert (= (and b!1418749 res!954355) b!1418748))

(assert (= (and b!1418748 res!954357) b!1418747))

(declare-fun m!1309365 () Bool)

(assert (=> start!122440 m!1309365))

(declare-fun m!1309367 () Bool)

(assert (=> start!122440 m!1309367))

(declare-fun m!1309369 () Bool)

(assert (=> b!1418751 m!1309369))

(assert (=> b!1418751 m!1309369))

(declare-fun m!1309371 () Bool)

(assert (=> b!1418751 m!1309371))

(declare-fun m!1309373 () Bool)

(assert (=> b!1418749 m!1309373))

(declare-fun m!1309375 () Bool)

(assert (=> b!1418746 m!1309375))

(declare-fun m!1309377 () Bool)

(assert (=> b!1418747 m!1309377))

(assert (=> b!1418747 m!1309377))

(declare-fun m!1309379 () Bool)

(assert (=> b!1418747 m!1309379))

(assert (=> b!1418750 m!1309377))

(assert (=> b!1418750 m!1309377))

(declare-fun m!1309381 () Bool)

(assert (=> b!1418750 m!1309381))

(push 1)

(assert (not b!1418751))

(assert (not b!1418746))

(assert (not start!122440))

(assert (not b!1418747))

(assert (not b!1418749))

(assert (not b!1418750))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

