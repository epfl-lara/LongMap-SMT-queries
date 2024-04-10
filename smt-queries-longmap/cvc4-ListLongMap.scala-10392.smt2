; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122434 () Bool)

(assert start!122434)

(declare-fun b!1418682 () Bool)

(declare-fun res!954295 () Bool)

(declare-fun e!802804 () Bool)

(assert (=> b!1418682 (=> (not res!954295) (not e!802804))))

(declare-datatypes ((array!96877 0))(
  ( (array!96878 (arr!46759 (Array (_ BitVec 32) (_ BitVec 64))) (size!47309 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96877)

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1418682 (= res!954295 (validKeyInArray!0 (select (arr!46759 a!2831) i!982)))))

(declare-fun res!954291 () Bool)

(assert (=> start!122434 (=> (not res!954291) (not e!802804))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122434 (= res!954291 (validMask!0 mask!2608))))

(assert (=> start!122434 e!802804))

(assert (=> start!122434 true))

(declare-fun array_inv!35787 (array!96877) Bool)

(assert (=> start!122434 (array_inv!35787 a!2831)))

(declare-fun b!1418683 () Bool)

(declare-fun res!954289 () Bool)

(assert (=> b!1418683 (=> (not res!954289) (not e!802804))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1418683 (= res!954289 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47309 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47309 a!2831))))))

(declare-fun b!1418684 () Bool)

(declare-fun res!954292 () Bool)

(assert (=> b!1418684 (=> (not res!954292) (not e!802804))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96877 (_ BitVec 32)) Bool)

(assert (=> b!1418684 (= res!954292 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1418685 () Bool)

(declare-fun res!954290 () Bool)

(assert (=> b!1418685 (=> (not res!954290) (not e!802804))))

(declare-fun j!81 () (_ BitVec 32))

(assert (=> b!1418685 (= res!954290 (validKeyInArray!0 (select (arr!46759 a!2831) j!81)))))

(declare-fun b!1418686 () Bool)

(declare-fun res!954293 () Bool)

(assert (=> b!1418686 (=> (not res!954293) (not e!802804))))

(assert (=> b!1418686 (= res!954293 (and (= (size!47309 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47309 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47309 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1418687 () Bool)

(declare-fun res!954294 () Bool)

(assert (=> b!1418687 (=> (not res!954294) (not e!802804))))

(declare-datatypes ((List!33269 0))(
  ( (Nil!33266) (Cons!33265 (h!34561 (_ BitVec 64)) (t!47963 List!33269)) )
))
(declare-fun arrayNoDuplicates!0 (array!96877 (_ BitVec 32) List!33269) Bool)

(assert (=> b!1418687 (= res!954294 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33266))))

(declare-fun b!1418688 () Bool)

(assert (=> b!1418688 (= e!802804 false)))

(declare-fun lt!625650 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1418688 (= lt!625650 (toIndex!0 (select (arr!46759 a!2831) j!81) mask!2608))))

(assert (= (and start!122434 res!954291) b!1418686))

(assert (= (and b!1418686 res!954293) b!1418682))

(assert (= (and b!1418682 res!954295) b!1418685))

(assert (= (and b!1418685 res!954290) b!1418684))

(assert (= (and b!1418684 res!954292) b!1418687))

(assert (= (and b!1418687 res!954294) b!1418683))

(assert (= (and b!1418683 res!954289) b!1418688))

(declare-fun m!1309311 () Bool)

(assert (=> start!122434 m!1309311))

(declare-fun m!1309313 () Bool)

(assert (=> start!122434 m!1309313))

(declare-fun m!1309315 () Bool)

(assert (=> b!1418687 m!1309315))

(declare-fun m!1309317 () Bool)

(assert (=> b!1418688 m!1309317))

(assert (=> b!1418688 m!1309317))

(declare-fun m!1309319 () Bool)

(assert (=> b!1418688 m!1309319))

(declare-fun m!1309321 () Bool)

(assert (=> b!1418684 m!1309321))

(declare-fun m!1309323 () Bool)

(assert (=> b!1418682 m!1309323))

(assert (=> b!1418682 m!1309323))

(declare-fun m!1309325 () Bool)

(assert (=> b!1418682 m!1309325))

(assert (=> b!1418685 m!1309317))

(assert (=> b!1418685 m!1309317))

(declare-fun m!1309327 () Bool)

(assert (=> b!1418685 m!1309327))

(push 1)

(assert (not b!1418684))

(assert (not b!1418682))

(assert (not start!122434))

(assert (not b!1418685))

(assert (not b!1418688))

(assert (not b!1418687))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

