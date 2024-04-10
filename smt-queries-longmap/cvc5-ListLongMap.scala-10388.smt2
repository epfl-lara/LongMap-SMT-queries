; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122370 () Bool)

(assert start!122370)

(declare-fun b!1418307 () Bool)

(declare-fun res!953947 () Bool)

(declare-fun e!802658 () Bool)

(assert (=> b!1418307 (=> (not res!953947) (not e!802658))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-datatypes ((array!96846 0))(
  ( (array!96847 (arr!46745 (Array (_ BitVec 32) (_ BitVec 64))) (size!47295 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96846)

(declare-fun index!585 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(assert (=> b!1418307 (= res!953947 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47295 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47295 a!2831))))))

(declare-fun res!953948 () Bool)

(assert (=> start!122370 (=> (not res!953948) (not e!802658))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122370 (= res!953948 (validMask!0 mask!2608))))

(assert (=> start!122370 e!802658))

(assert (=> start!122370 true))

(declare-fun array_inv!35773 (array!96846) Bool)

(assert (=> start!122370 (array_inv!35773 a!2831)))

(declare-fun b!1418308 () Bool)

(declare-fun res!953952 () Bool)

(assert (=> b!1418308 (=> (not res!953952) (not e!802658))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1418308 (= res!953952 (validKeyInArray!0 (select (arr!46745 a!2831) j!81)))))

(declare-fun b!1418309 () Bool)

(declare-fun res!953953 () Bool)

(assert (=> b!1418309 (=> (not res!953953) (not e!802658))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1418309 (= res!953953 (validKeyInArray!0 (select (arr!46745 a!2831) i!982)))))

(declare-fun b!1418310 () Bool)

(declare-fun res!953949 () Bool)

(assert (=> b!1418310 (=> (not res!953949) (not e!802658))))

(assert (=> b!1418310 (= res!953949 (and (= (size!47295 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47295 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47295 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1418311 () Bool)

(declare-fun res!953950 () Bool)

(assert (=> b!1418311 (=> (not res!953950) (not e!802658))))

(declare-datatypes ((List!33255 0))(
  ( (Nil!33252) (Cons!33251 (h!34544 (_ BitVec 64)) (t!47949 List!33255)) )
))
(declare-fun arrayNoDuplicates!0 (array!96846 (_ BitVec 32) List!33255) Bool)

(assert (=> b!1418311 (= res!953950 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33252))))

(declare-fun b!1418312 () Bool)

(assert (=> b!1418312 (= e!802658 false)))

(declare-fun lt!625563 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1418312 (= lt!625563 (toIndex!0 (select (arr!46745 a!2831) j!81) mask!2608))))

(declare-fun b!1418313 () Bool)

(declare-fun res!953951 () Bool)

(assert (=> b!1418313 (=> (not res!953951) (not e!802658))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96846 (_ BitVec 32)) Bool)

(assert (=> b!1418313 (= res!953951 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(assert (= (and start!122370 res!953948) b!1418310))

(assert (= (and b!1418310 res!953949) b!1418309))

(assert (= (and b!1418309 res!953953) b!1418308))

(assert (= (and b!1418308 res!953952) b!1418313))

(assert (= (and b!1418313 res!953951) b!1418311))

(assert (= (and b!1418311 res!953950) b!1418307))

(assert (= (and b!1418307 res!953947) b!1418312))

(declare-fun m!1309011 () Bool)

(assert (=> start!122370 m!1309011))

(declare-fun m!1309013 () Bool)

(assert (=> start!122370 m!1309013))

(declare-fun m!1309015 () Bool)

(assert (=> b!1418311 m!1309015))

(declare-fun m!1309017 () Bool)

(assert (=> b!1418309 m!1309017))

(assert (=> b!1418309 m!1309017))

(declare-fun m!1309019 () Bool)

(assert (=> b!1418309 m!1309019))

(declare-fun m!1309021 () Bool)

(assert (=> b!1418312 m!1309021))

(assert (=> b!1418312 m!1309021))

(declare-fun m!1309023 () Bool)

(assert (=> b!1418312 m!1309023))

(declare-fun m!1309025 () Bool)

(assert (=> b!1418313 m!1309025))

(assert (=> b!1418308 m!1309021))

(assert (=> b!1418308 m!1309021))

(declare-fun m!1309027 () Bool)

(assert (=> b!1418308 m!1309027))

(push 1)

(assert (not b!1418309))

(assert (not b!1418313))

(assert (not b!1418308))

(assert (not start!122370))

(assert (not b!1418311))

(assert (not b!1418312))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

