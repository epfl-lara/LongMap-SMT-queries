; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122436 () Bool)

(assert start!122436)

(declare-fun res!954314 () Bool)

(declare-fun e!802810 () Bool)

(assert (=> start!122436 (=> (not res!954314) (not e!802810))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122436 (= res!954314 (validMask!0 mask!2608))))

(assert (=> start!122436 e!802810))

(assert (=> start!122436 true))

(declare-datatypes ((array!96879 0))(
  ( (array!96880 (arr!46760 (Array (_ BitVec 32) (_ BitVec 64))) (size!47310 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96879)

(declare-fun array_inv!35788 (array!96879) Bool)

(assert (=> start!122436 (array_inv!35788 a!2831)))

(declare-fun b!1418703 () Bool)

(declare-fun res!954310 () Bool)

(assert (=> b!1418703 (=> (not res!954310) (not e!802810))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1418703 (= res!954310 (validKeyInArray!0 (select (arr!46760 a!2831) j!81)))))

(declare-fun b!1418704 () Bool)

(declare-fun res!954313 () Bool)

(assert (=> b!1418704 (=> (not res!954313) (not e!802810))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96879 (_ BitVec 32)) Bool)

(assert (=> b!1418704 (= res!954313 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1418705 () Bool)

(declare-fun res!954316 () Bool)

(assert (=> b!1418705 (=> (not res!954316) (not e!802810))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1418705 (= res!954316 (and (= (size!47310 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47310 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47310 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1418706 () Bool)

(declare-fun res!954315 () Bool)

(assert (=> b!1418706 (=> (not res!954315) (not e!802810))))

(declare-datatypes ((List!33270 0))(
  ( (Nil!33267) (Cons!33266 (h!34562 (_ BitVec 64)) (t!47964 List!33270)) )
))
(declare-fun arrayNoDuplicates!0 (array!96879 (_ BitVec 32) List!33270) Bool)

(assert (=> b!1418706 (= res!954315 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33267))))

(declare-fun b!1418707 () Bool)

(declare-fun res!954311 () Bool)

(assert (=> b!1418707 (=> (not res!954311) (not e!802810))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1418707 (= res!954311 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47310 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47310 a!2831))))))

(declare-fun b!1418708 () Bool)

(assert (=> b!1418708 (= e!802810 false)))

(declare-fun lt!625653 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1418708 (= lt!625653 (toIndex!0 (select (arr!46760 a!2831) j!81) mask!2608))))

(declare-fun b!1418709 () Bool)

(declare-fun res!954312 () Bool)

(assert (=> b!1418709 (=> (not res!954312) (not e!802810))))

(assert (=> b!1418709 (= res!954312 (validKeyInArray!0 (select (arr!46760 a!2831) i!982)))))

(assert (= (and start!122436 res!954314) b!1418705))

(assert (= (and b!1418705 res!954316) b!1418709))

(assert (= (and b!1418709 res!954312) b!1418703))

(assert (= (and b!1418703 res!954310) b!1418704))

(assert (= (and b!1418704 res!954313) b!1418706))

(assert (= (and b!1418706 res!954315) b!1418707))

(assert (= (and b!1418707 res!954311) b!1418708))

(declare-fun m!1309329 () Bool)

(assert (=> b!1418708 m!1309329))

(assert (=> b!1418708 m!1309329))

(declare-fun m!1309331 () Bool)

(assert (=> b!1418708 m!1309331))

(declare-fun m!1309333 () Bool)

(assert (=> b!1418709 m!1309333))

(assert (=> b!1418709 m!1309333))

(declare-fun m!1309335 () Bool)

(assert (=> b!1418709 m!1309335))

(declare-fun m!1309337 () Bool)

(assert (=> b!1418704 m!1309337))

(assert (=> b!1418703 m!1309329))

(assert (=> b!1418703 m!1309329))

(declare-fun m!1309339 () Bool)

(assert (=> b!1418703 m!1309339))

(declare-fun m!1309341 () Bool)

(assert (=> b!1418706 m!1309341))

(declare-fun m!1309343 () Bool)

(assert (=> start!122436 m!1309343))

(declare-fun m!1309345 () Bool)

(assert (=> start!122436 m!1309345))

(push 1)

(assert (not b!1418703))

(assert (not b!1418706))

(assert (not b!1418704))

(assert (not b!1418709))

(assert (not b!1418708))

(assert (not start!122436))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

