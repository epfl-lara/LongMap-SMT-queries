; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122324 () Bool)

(assert start!122324)

(declare-fun b!1418035 () Bool)

(declare-fun res!953765 () Bool)

(declare-fun e!802520 () Bool)

(assert (=> b!1418035 (=> (not res!953765) (not e!802520))))

(declare-datatypes ((array!96780 0))(
  ( (array!96781 (arr!46714 (Array (_ BitVec 32) (_ BitVec 64))) (size!47266 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96780)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1418035 (= res!953765 (validKeyInArray!0 (select (arr!46714 a!2831) j!81)))))

(declare-fun b!1418036 () Bool)

(declare-fun res!953764 () Bool)

(assert (=> b!1418036 (=> (not res!953764) (not e!802520))))

(declare-datatypes ((List!33302 0))(
  ( (Nil!33299) (Cons!33298 (h!34591 (_ BitVec 64)) (t!47988 List!33302)) )
))
(declare-fun arrayNoDuplicates!0 (array!96780 (_ BitVec 32) List!33302) Bool)

(assert (=> b!1418036 (= res!953764 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33299))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun b!1418037 () Bool)

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(assert (=> b!1418037 (= e!802520 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47266 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47266 a!2831)) (bvslt mask!2608 #b00000000000000000000000000000000)))))

(declare-fun res!953763 () Bool)

(assert (=> start!122324 (=> (not res!953763) (not e!802520))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122324 (= res!953763 (validMask!0 mask!2608))))

(assert (=> start!122324 e!802520))

(assert (=> start!122324 true))

(declare-fun array_inv!35947 (array!96780) Bool)

(assert (=> start!122324 (array_inv!35947 a!2831)))

(declare-fun b!1418038 () Bool)

(declare-fun res!953767 () Bool)

(assert (=> b!1418038 (=> (not res!953767) (not e!802520))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1418038 (= res!953767 (and (= (size!47266 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47266 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47266 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1418039 () Bool)

(declare-fun res!953766 () Bool)

(assert (=> b!1418039 (=> (not res!953766) (not e!802520))))

(assert (=> b!1418039 (= res!953766 (validKeyInArray!0 (select (arr!46714 a!2831) i!982)))))

(declare-fun b!1418040 () Bool)

(declare-fun res!953762 () Bool)

(assert (=> b!1418040 (=> (not res!953762) (not e!802520))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96780 (_ BitVec 32)) Bool)

(assert (=> b!1418040 (= res!953762 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(assert (= (and start!122324 res!953763) b!1418038))

(assert (= (and b!1418038 res!953767) b!1418039))

(assert (= (and b!1418039 res!953766) b!1418035))

(assert (= (and b!1418035 res!953765) b!1418040))

(assert (= (and b!1418040 res!953762) b!1418036))

(assert (= (and b!1418036 res!953764) b!1418037))

(declare-fun m!1308331 () Bool)

(assert (=> b!1418035 m!1308331))

(assert (=> b!1418035 m!1308331))

(declare-fun m!1308333 () Bool)

(assert (=> b!1418035 m!1308333))

(declare-fun m!1308335 () Bool)

(assert (=> start!122324 m!1308335))

(declare-fun m!1308337 () Bool)

(assert (=> start!122324 m!1308337))

(declare-fun m!1308339 () Bool)

(assert (=> b!1418036 m!1308339))

(declare-fun m!1308341 () Bool)

(assert (=> b!1418039 m!1308341))

(assert (=> b!1418039 m!1308341))

(declare-fun m!1308343 () Bool)

(assert (=> b!1418039 m!1308343))

(declare-fun m!1308345 () Bool)

(assert (=> b!1418040 m!1308345))

(check-sat (not start!122324) (not b!1418035) (not b!1418036) (not b!1418040) (not b!1418039))
(check-sat)
